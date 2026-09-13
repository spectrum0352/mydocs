<#
.SYNOPSIS
    Enforces a TRUE hard memory limit on Microsoft Edge using a Windows Job Object.

.DESCRIPTION
    Registry policies like TotalMemoryLimitMb are "best effort" - Edge tries to
    discard tabs but Microsoft's own documentation says there's no guarantee it
    stays under the limit. This script instead uses a Windows Job Object, an
    OS-level kernel construct that enforces a hard memory ceiling on a group of
    processes. When the combined committed memory of all Edge processes placed
    in the job exceeds the limit, Windows itself terminates processes to bring
    it back under the cap - it is not Edge's choice, it is the kernel enforcing it.

    HOW IT WORKS:
      1. Launches Edge (or attaches to it if you start it manually after the
         script is running, depending on mode).
      2. Creates a Job Object with JOB_OBJECT_LIMIT_JOB_MEMORY set to your cap.
      3. Assigns the Edge browser process (and you can extend this to children)
         into the job.
      4. If total memory across all processes in the job exceeds the cap,
         Windows kills processes in the job to enforce it.

    TRADEOFFS (you said this is acceptable):
      - When the limit is hit, Edge tabs/processes WILL be forcibly killed,
        not gracefully closed. This can crash tabs or the whole browser.
      - New tabs may fail to open once near the limit.
      - This is a blunt instrument by design, since you explicitly want a
        real hard ceiling rather than a "best effort" one.

.PARAMETER MaxMemoryMB
    Hard ceiling, in MB, for combined memory of all Edge processes in the job.
    Default: 800

.PARAMETER LaunchEdge
    If specified, this script launches Edge itself (so the new process can be
    assigned to the job from the moment it starts). If Edge is already running,
    existing processes are closed first, since processes can only be added to
    a job at certain points and a clean start is the most reliable approach.

.EXAMPLE
    .\Set-EdgeHardMemoryLimit.ps1 -MaxMemoryMB 800 -LaunchEdge
    Closes any running Edge, then relaunches it constrained to a strict 800MB
    combined hard memory ceiling enforced by Windows.

.NOTES
    - Must be run as Administrator.
    - This is process-tree-wide: it watches for new msedge.exe child processes
      (Edge spawns many) and adds them to the same job so the cap applies to
      the WHOLE browser, not just the main process.
    - Keep the PowerShell window open - it is actively monitoring and assigning
      new Edge child processes to the job. Closing it stops enforcement.
    - Press Ctrl+C to stop monitoring (Edge keeps running, but new child
      processes will no longer be added to the constrained job).
#>

[CmdletBinding()]
param(
    [int]$MaxMemoryMB = 800,
    [switch]$LaunchEdge
)

# ---- Require Administrator ----
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "This script must be run as Administrator. Right-click PowerShell -> Run as Administrator."
    exit 1
}

# ---- Win32 Job Object API ----
$signature = @"
using System;
using System.Runtime.InteropServices;

public class JobMemoryLimiter
{
    [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    public static extern IntPtr CreateJobObject(IntPtr lpJobAttributes, string lpName);

    [DllImport("kernel32.dll", SetLastError = true)]
    public static extern bool AssignProcessToJobObject(IntPtr hJob, IntPtr hProcess);

    [DllImport("kernel32.dll", SetLastError = true)]
    public static extern bool SetInformationJobObject(
        IntPtr hJob,
        int JobObjectInfoClass,
        IntPtr lpJobObjectInfo,
        uint cbJobObjectInfoLength);

    [DllImport("kernel32.dll", SetLastError = true)]
    public static extern bool TerminateJobObject(IntPtr hJob, uint uExitCode);

    [DllImport("kernel32.dll")]
    public static extern bool CloseHandle(IntPtr hObject);

    [DllImport("kernel32.dll", SetLastError = true)]
    public static extern IntPtr OpenProcess(uint processAccess, bool bInheritHandle, int processId);

    public const uint PROCESS_ALL_ACCESS = 0x001F0FFF;
    public const int JobObjectExtendedLimitInformation = 9;

    [StructLayout(LayoutKind.Sequential)]
    public struct IO_COUNTERS
    {
        public ulong ReadOperationCount;
        public ulong WriteOperationCount;
        public ulong OtherOperationCount;
        public ulong ReadTransferCount;
        public ulong WriteTransferCount;
        public ulong OtherTransferCount;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct JOBOBJECT_BASIC_LIMIT_INFORMATION
    {
        public long PerProcessUserTimeLimit;
        public long PerJobUserTimeLimit;
        public uint LimitFlags;
        public UIntPtr MinimumWorkingSetSize;
        public UIntPtr MaximumWorkingSetSize;
        public uint ActiveProcessLimit;
        public IntPtr Affinity;
        public uint PriorityClass;
        public uint SchedulingClass;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct JOBOBJECT_EXTENDED_LIMIT_INFORMATION
    {
        public JOBOBJECT_BASIC_LIMIT_INFORMATION BasicLimitInformation;
        public IO_COUNTERS IoInfo;
        public UIntPtr ProcessMemoryLimit;
        public UIntPtr JobMemoryLimit;
        public UIntPtr PeakProcessMemoryUsed;
        public UIntPtr PeakJobMemoryUsed;
    }

    public const uint JOB_OBJECT_LIMIT_JOB_MEMORY = 0x00000200;
    public const uint JOB_OBJECT_LIMIT_PROCESS_MEMORY = 0x00000100;
    public const uint JOB_OBJECT_LIMIT_KILL_ON_JOB_CLOSE = 0x00002000;

    public static IntPtr CreateMemoryLimitedJob(string name, ulong maxMemoryBytes)
    {
        IntPtr hJob = CreateJobObject(IntPtr.Zero, name);
        if (hJob == IntPtr.Zero) return IntPtr.Zero;

        var info = new JOBOBJECT_EXTENDED_LIMIT_INFORMATION();
        info.BasicLimitInformation.LimitFlags = JOB_OBJECT_LIMIT_JOB_MEMORY | JOB_OBJECT_LIMIT_KILL_ON_JOB_CLOSE;
        info.JobMemoryLimit = new UIntPtr(maxMemoryBytes);

        int length = Marshal.SizeOf(typeof(JOBOBJECT_EXTENDED_LIMIT_INFORMATION));
        IntPtr extendedInfoPtr = Marshal.AllocHGlobal(length);
        Marshal.StructureToPtr(info, extendedInfoPtr, false);

        bool result = SetInformationJobObject(hJob, JobObjectExtendedLimitInformation, extendedInfoPtr, (uint)length);
        Marshal.FreeHGlobal(extendedInfoPtr);

        if (!result) return IntPtr.Zero;
        return hJob;
    }

    public static bool AddProcessToJob(IntPtr hJob, int processId)
    {
        IntPtr hProcess = OpenProcess(PROCESS_ALL_ACCESS, false, processId);
        if (hProcess == IntPtr.Zero) return false;
        bool result = AssignProcessToJobObject(hJob, hProcess);
        CloseHandle(hProcess);
        return result;
    }
}
"@

if (-not ([System.Management.Automation.PSTypeName]'JobMemoryLimiter').Type) {
    Add-Type -TypeDefinition $signature -ErrorAction Stop
}

$jobName = "EdgeHardMemoryLimitJob"
$maxBytes = [uint64]$MaxMemoryMB * 1MB

Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host " Edge HARD Memory Limit (Windows Job Object)" -ForegroundColor Cyan
Write-Host " Limit: $MaxMemoryMB MB combined, kernel-enforced" -ForegroundColor Cyan
Write-Host " When exceeded: Windows WILL terminate Edge processes" -ForegroundColor Yellow
Write-Host "=======================================================" -ForegroundColor Cyan

# ---- Create the job object with the hard memory limit ----
$hJob = [JobMemoryLimiter]::CreateMemoryLimitedJob($jobName, $maxBytes)
if ($hJob -eq [IntPtr]::Zero) {
    Write-Error "Failed to create Job Object. Try running PowerShell as Administrator."
    exit 1
}
Write-Host "Job object created with $MaxMemoryMB MB hard ceiling." -ForegroundColor Green

# ---- Optionally relaunch Edge cleanly ----
if ($LaunchEdge) {
    $existing = Get-Process -Name "msedge" -ErrorAction SilentlyContinue
    if ($existing) {
        Write-Host "Closing existing Edge processes for a clean start..." -ForegroundColor Yellow
        Stop-Process -Name "msedge" -Force -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 2
    }

    $edgePath = "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe"
    if (-not (Test-Path $edgePath)) {
        $edgePath = "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe"
    }

    if (-not (Test-Path $edgePath)) {
        Write-Error "Could not find msedge.exe. Please launch Edge manually after this script starts monitoring."
    }
    else {
        Write-Host "Launching Edge..." -ForegroundColor Green
        $proc = Start-Process -FilePath $edgePath -PassThru
        Start-Sleep -Milliseconds 800
        $added = [JobMemoryLimiter]::AddProcessToJob($hJob, $proc.Id)
        if ($added) {
            Write-Host "Main Edge process (PID $($proc.Id)) added to hard-limited job." -ForegroundColor Green
        }
        else {
            Write-Warning "Could not add main Edge process to job (PID $($proc.Id))."
        }
    }
}

# ---- Track which PIDs are already in the job to avoid re-adding ----
$trackedPids = New-Object System.Collections.Generic.HashSet[int]

Write-Host ""
Write-Host "Monitoring for Edge child processes to enforce the hard limit across the whole browser..." -ForegroundColor Cyan
Write-Host "Keep this window open. Press Ctrl+C to stop." -ForegroundColor Cyan
Write-Host ""

try {
    while ($true) {
        $edgeProcs = Get-Process -Name "msedge" -ErrorAction SilentlyContinue
        if ($edgeProcs) {
            foreach ($proc in $edgeProcs) {
                if (-not $trackedPids.Contains($proc.Id)) {
                    $added = [JobMemoryLimiter]::AddProcessToJob($hJob, $proc.Id)
                    if ($added) {
                        $trackedPids.Add($proc.Id) | Out-Null
                        Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Added PID $($proc.Id) to hard memory job." -ForegroundColor Green
                    }
                }
            }

            # Report current combined memory of tracked processes
            $totalMB = 0
            foreach ($p in $edgeProcs) {
                try { $totalMB += [Math]::Round($p.WorkingSet64 / 1MB, 1) } catch {}
            }
            $count = $edgeProcs.Count
            Write-Host "[$(Get-Date -Format 'HH:mm:ss')] $count Edge process(es) tracked, ~$totalMB MB combined working set (hard ceiling: $MaxMemoryMB MB)." -ForegroundColor DarkGray
        }
        else {
            Write-Host "[$(Get-Date -Format 'HH:mm:ss')] No msedge.exe processes running." -ForegroundColor DarkGray
        }

        Start-Sleep -Seconds 5
    }
}
finally {
    Write-Host ""
    Write-Host "Monitoring stopped. The Job Object's memory limit remains in effect" -ForegroundColor Yellow
    Write-Host "for processes already assigned to it until they exit or the job handle is released." -ForegroundColor Yellow
}
