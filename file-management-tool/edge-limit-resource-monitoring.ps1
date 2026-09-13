<#
.SYNOPSIS
    Limits CPU and memory usage of Microsoft Edge processes.

.DESCRIPTION
    This script monitors all running msedge.exe processes and:
      1. Restricts each process to a specific set of CPU cores (via processor affinity)
      2. Sets the process priority to BelowNormal/Idle to reduce CPU contention
      3. Sets a hard working-set (RAM) cap per process using Windows API
      4. Optionally kills/restarts processes that exceed a memory threshold
    It runs in a loop, checking periodically, so it keeps newly spawned Edge
    processes (Edge spawns many child processes) in check too.

.PARAMETER MaxCpuCores
    Number of CPU cores Edge processes are allowed to use (affinity mask).
    Default: 2

.PARAMETER MaxMemoryMB
    Maximum working set (RAM) per Edge process, in MB.
    Default: 500

.PARAMETER CheckIntervalSeconds
    How often (seconds) to re-scan and re-apply limits.
    Default: 15

.PARAMETER Priority
    Process priority to apply: Idle, BelowNormal, Normal.
    Default: BelowNormal

.PARAMETER KillIfOverMemory
    If set, processes exceeding MaxMemoryMB by a large margin will be terminated
    instead of just having their working set trimmed.

.EXAMPLE
    .\Limit-EdgeResources.ps1
    Runs with defaults: 2 cores, 500MB cap per process, BelowNormal priority.

.EXAMPLE
    .\Limit-EdgeResources.ps1 -MaxCpuCores 1 -MaxMemoryMB 300 -Priority Idle

.NOTES
    - Must be run as Administrator for priority/affinity changes to reliably apply
      to all Edge processes (some are protected/elevated).
    - Press Ctrl+C to stop the monitoring loop.
    - This throttles Edge; it does not throttle other applications.
#>

[CmdletBinding()]
param(
    [int]$MaxCpuCores = 2,
    [int]$MaxMemoryMB = 500,
    [int]$CheckIntervalSeconds = 15,
    [ValidateSet('Idle','BelowNormal','Normal')]
    [string]$Priority = 'BelowNormal',
    [switch]$KillIfOverMemory
)

# ---- Require Administrator ----
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "This script should be run as Administrator for full effect (process priority/affinity/working-set limits may silently fail otherwise)."
}

# ---- Win32 API for hard working-set (memory) limits ----
$signature = @"
using System;
using System.Runtime.InteropServices;

public class ProcessLimiter
{
    [DllImport("kernel32.dll", SetLastError = true)]
    public static extern bool SetProcessWorkingSetSizeEx(
        IntPtr hProcess,
        UIntPtr dwMinimumWorkingSetSize,
        UIntPtr dwMaximumWorkingSetSize,
        uint Flags);

    [DllImport("kernel32.dll")]
    public static extern IntPtr OpenProcess(uint processAccess, bool bInheritHandle, int processId);

    [DllImport("kernel32.dll")]
    public static extern bool CloseHandle(IntPtr hObject);

    public const uint PROCESS_ALL_ACCESS = 0x001F0FFF;
    public const uint QUOTA_LIMITS_HARDWS_MIN_ENABLE = 0x00000001;
    public const uint QUOTA_LIMITS_HARDWS_MAX_ENABLE = 0x00000004;
}
"@

if (-not ([System.Management.Automation.PSTypeName]'ProcessLimiter').Type) {
    Add-Type -TypeDefinition $signature -ErrorAction SilentlyContinue
}

function Set-HardMemoryLimit {
    param(
        [Parameter(Mandatory)] [int]$ProcessId,
        [Parameter(Mandatory)] [int]$MaxMB
    )
    try {
        $handle = [ProcessLimiter]::OpenProcess([ProcessLimiter]::PROCESS_ALL_ACCESS, $false, $ProcessId)
        if ($handle -eq [IntPtr]::Zero) { return $false }

        $minWs = [UIntPtr]::new([uint64](10MB))
        $maxWs = [UIntPtr]::new([uint64]($MaxMB * 1MB))

        $flags = [ProcessLimiter]::QUOTA_LIMITS_HARDWS_MIN_ENABLE -bor [ProcessLimiter]::QUOTA_LIMITS_HARDWS_MAX_ENABLE

        $result = [ProcessLimiter]::SetProcessWorkingSetSizeEx($handle, $minWs, $maxWs, $flags)
        [ProcessLimiter]::CloseHandle($handle) | Out-Null
        return $result
    }
    catch {
        return $false
    }
}

function Get-AffinityMask {
    param([int]$CoreCount)
    $totalCores = [Environment]::ProcessorCount
    $coresToUse = [Math]::Min($CoreCount, $totalCores)
    if ($coresToUse -lt 1) { $coresToUse = 1 }

    $mask = 0
    for ($i = 0; $i -lt $coresToUse; $i++) {
        $mask = $mask -bor (1 -shl $i)
    }
    return [IntPtr]$mask
}

function Limit-EdgeProcesses {
    param(
        [IntPtr]$AffinityMask,
        [int]$MaxMemoryMB,
        [string]$Priority,
        [switch]$KillIfOverMemory
    )

    $edgeProcs = Get-Process -Name "msedge" -ErrorAction SilentlyContinue
    if (-not $edgeProcs) {
        Write-Host "[$(Get-Date -Format 'HH:mm:ss')] No msedge.exe processes found." -ForegroundColor DarkGray
        return
    }

    $count = 0
    foreach ($proc in $edgeProcs) {
        $count++
        try {
            # ---- CPU affinity (restrict number of cores) ----
            try {
                $proc.ProcessorAffinity = $AffinityMask
            } catch {
                Write-Verbose "Could not set affinity for PID $($proc.Id): $_"
            }

            # ---- Process priority ----
            try {
                $proc.PriorityClass = $Priority
            } catch {
                Write-Verbose "Could not set priority for PID $($proc.Id): $_"
            }

            # ---- Memory check / hard cap ----
            $memMB = [Math]::Round($proc.WorkingSet64 / 1MB, 1)

            if ($memMB -gt $MaxMemoryMB) {
                if ($KillIfOverMemory -and $memMB -gt ($MaxMemoryMB * 2)) {
                    Write-Host "[$(Get-Date -Format 'HH:mm:ss')] PID $($proc.Id) using $memMB MB (>2x limit). Terminating." -ForegroundColor Red
                    Stop-Process -Id $proc.Id -Force -ErrorAction SilentlyContinue
                    continue
                }
                else {
                    $applied = Set-HardMemoryLimit -ProcessId $proc.Id -MaxMB $MaxMemoryMB
                    $status = if ($applied) { "working-set capped" } else { "cap failed (try running as admin)" }
                    Write-Host "[$(Get-Date -Format 'HH:mm:ss')] PID $($proc.Id) was $memMB MB -> $status (limit $MaxMemoryMB MB)" -ForegroundColor Yellow
                }
            }
        }
        catch {
            Write-Verbose "Error processing PID $($proc.Id): $_"
        }
    }

    Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Checked $count Edge process(es). Affinity + priority ($Priority) applied." -ForegroundColor Green
}

# ---- Main loop ----
$affinityMask = Get-AffinityMask -CoreCount $MaxCpuCores

Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host " Edge Resource Limiter" -ForegroundColor Cyan
Write-Host " Max CPU cores : $MaxCpuCores of $([Environment]::ProcessorCount)" -ForegroundColor Cyan
Write-Host " Max memory    : $MaxMemoryMB MB per process" -ForegroundColor Cyan
Write-Host " Priority      : $Priority" -ForegroundColor Cyan
Write-Host " Interval      : every $CheckIntervalSeconds sec" -ForegroundColor Cyan
Write-Host " Kill if 2x over memory: $($KillIfOverMemory.IsPresent)" -ForegroundColor Cyan
Write-Host " Press Ctrl+C to stop." -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan

try {
    while ($true) {
        Limit-EdgeProcesses -AffinityMask $affinityMask -MaxMemoryMB $MaxMemoryMB -Priority $Priority -KillIfOverMemory:$KillIfOverMemory
        Start-Sleep -Seconds $CheckIntervalSeconds
    }
}
finally {
    Write-Host "`nMonitoring stopped." -ForegroundColor Cyan
}