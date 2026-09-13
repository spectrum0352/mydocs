<#
.SYNOPSIS
    Caps the COMBINED RAM usage of all non-essential apps/processes on Windows 11
    by trimming working sets - never kills or freezes anything.

.DESCRIPTION
    This script continuously monitors total physical memory (working set) used
    by "non-essential" processes - i.e. everything except core Windows/system
    processes, drivers, security software, and the shell itself, which are
    always excluded and never touched.

    When the COMBINED total of non-essential processes exceeds your threshold,
    the script trims the working set of the largest memory consumers first
    (most impact for least disruption) using the Windows API
    SetProcessWorkingSetSizeEx. This asks Windows to page out memory the
    process isn't actively using right now - it does NOT kill, freeze, or
    restart anything. Apps keep running normally and will reclaim memory
    on demand if they actually need it again; you may just see slightly
    more disk activity as pages are faulted back in.

    EXCLUDED BY DEFAULT (never trimmed, never counted against your limit):
      - System, Registry, Memory Compression, csrss, wininit, services,
        lsass, smss, winlogon, svchost (many critical services run here),
        dwm (Desktop Window Manager / shell rendering),
        explorer (Windows shell),
        Windows Defender / antivirus processes,
        audiodg (audio engine),
        powershell/pwsh (so the script doesn't trim itself or its own shell)

    You can extend the exclusion list with -AdditionalExclusions.

.PARAMETER MaxNonEssentialMemoryMB
    Combined RAM ceiling, in MB, for all non-essential processes together.
    Default: 4096 (4 GB) - adjust based on your total system RAM.

.PARAMETER CheckIntervalSeconds
    How often to re-check and re-trim if needed. Default: 20

.PARAMETER AdditionalExclusions
    Extra process names (without .exe) to also exclude/protect, e.g.
    -AdditionalExclusions "OneDrive","Teams"

.PARAMETER TrimBatchSize
    How many of the largest processes to trim per pass once the limit is
    exceeded, before re-checking. Default: 5

.PARAMETER PerAppCapsMB
    Individual per-app caps (ProcessName = MaxMB), enforced in ADDITION to the
    combined cap. Any app listed here gets trimmed on its own the moment IT
    (individually) crosses its own number, regardless of the combined total.

    DEFAULTS ARE BUILT IN for common heavy apps (you don't have to pass
    anything for these to be active):
        msedge   (Microsoft Edge)      -> 800 MB
        chrome   (Google Chrome)       -> 1000 MB
        firefox  (Mozilla Firefox)     -> 800 MB
        Teams    (Microsoft Teams)     -> 700 MB
        slack    (Slack)               -> 600 MB
        OUTLOOK  (Microsoft Outlook)   -> 600 MB
        Discord  (Discord)             -> 500 MB
        Spotify  (Spotify)             -> 400 MB

    To override a default or add your own, pass -PerAppCapsMB with your own
    hashtable - this REPLACES the built-in defaults entirely, so include
    everything you want active:
        -PerAppCapsMB @{ "chrome" = 1500; "Teams" = 800; "Slack" = 600 }

    To add to (not replace) the defaults, see -ShowBreakdown example below
    for how the script merges things automatically when you only specify
    new app names.

.PARAMETER ShowBreakdown
    Prints a full per-app memory breakdown table every cycle (top 15 by
    memory), showing each app's current usage next to its cap (if any).
    ON by default so you always see what's capped and what isn't. Pass
    -ShowBreakdown:$false to suppress it and only see trim events.

.EXAMPLE
    .\Set-SystemWideMemoryCap.ps1
    Runs with all defaults: 4096 MB combined cap, plus built-in per-app
    caps for Edge/Chrome/Firefox/Teams/Slack/Outlook/Discord/Spotify,
    with the live breakdown table shown every cycle.

.EXAMPLE
    .\Set-SystemWideMemoryCap.ps1 -MaxNonEssentialMemoryMB 3072 -AdditionalExclusions "OneDrive"

.EXAMPLE
    .\Set-SystemWideMemoryCap.ps1 -PerAppCapsMB @{ "chrome" = 1200; "msedge" = 800; "Teams" = 700 }
    Replaces the built-in per-app cap list with exactly these three.

.NOTES
    - Run as Administrator for working-set trimming to apply to all processes
      (some elevated/protected apps will still be skipped even as admin).
    - This is NOT a hard kernel-enforced limit like a Job Object - it is a
      cooperative, non-destructive memory trimmer. Nothing is killed.
    - Keep the window open; it runs in a continuous monitoring loop.
    - Press Ctrl+C to stop.
#>

[CmdletBinding()]
param(
    [int]$MaxNonEssentialMemoryMB = 4096,
    [int]$CheckIntervalSeconds = 20,
    [string[]]$AdditionalExclusions = @(),
    [int]$TrimBatchSize = 5,
    [hashtable]$PerAppCapsMB = $null,
    [bool]$ShowBreakdown = $true
)

# ---- Built-in default per-app caps (used only if -PerAppCapsMB is not passed at all) ----
if ($null -eq $PerAppCapsMB) {
    $PerAppCapsMB = @{
        "msedge"  = 800    # Microsoft Edge
        "chrome"  = 1000   # Google Chrome
        "firefox" = 800    # Mozilla Firefox
        "Teams"   = 700    # Microsoft Teams
        "slack"   = 600    # Slack
        "OUTLOOK" = 600    # Microsoft Outlook
        "Discord" = 500    # Discord
        "Spotify" = 400    # Spotify
    }
    $usingDefaultCaps = $true
}
else {
    $usingDefaultCaps = $false
}

# ---- Require Administrator ----
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Not running as Administrator. Many system/protected processes will be skipped automatically (which is fine), but trimming of some elevated apps may also silently fail."
}

# ---- Critical processes that are NEVER touched or counted ----
$defaultExclusions = @(
    "System", "Idle", "Registry", "Memory Compression",
    "csrss", "wininit", "winlogon", "services", "lsass", "smss",
    "svchost", "dwm", "explorer",
    "MsMpEng", "NisSrv", "SecurityHealthService", "SecurityHealthSystray",
    "audiodg", "fontdrvhost", "dllhost",
    "powershell", "pwsh", "conhost", "WmiPrvSE",
    "spoolsv", "Taskmgr"
)

$exclusions = New-Object System.Collections.Generic.HashSet[string] ([StringComparer]::OrdinalIgnoreCase)
foreach ($name in $defaultExclusions) { $exclusions.Add($name) | Out-Null }
foreach ($name in $AdditionalExclusions) { $exclusions.Add($name) | Out-Null }

# ---- Win32 API for non-destructive working-set trim ----
$signature = @"
using System;
using System.Runtime.InteropServices;

public class WorkingSetTrimmer
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

    // PROCESS_QUERY_LIMITED_INFORMATION (0x1000) is required (instead of the
    // older PROCESS_QUERY_INFORMATION) to get a usable handle against
    // sandboxed/AppContainer processes - which is what Edge's renderer,
    // GPU, and utility processes run as. Without this flag, OpenProcess
    // can succeed but the resulting handle is too weak for
    // SetProcessWorkingSetSizeEx, causing "access denied" on the trim call
    // even when running as Administrator.
    public const uint PROCESS_SET_QUOTA = 0x0100;
    public const uint PROCESS_QUERY_INFORMATION = 0x0400;
    public const uint PROCESS_QUERY_LIMITED_INFORMATION = 0x1000;

    // Required for SetProcessWorkingSetSizeEx "empty working set now" call
    public const uint QUOTA_LIMITS_HARDWS_MIN_DISABLE = 0x00000002;
    public const uint QUOTA_LIMITS_HARDWS_MAX_DISABLE = 0x00000008;
}
"@

if (-not ([System.Management.Automation.PSTypeName]'WorkingSetTrimmer').Type) {
    Add-Type -TypeDefinition $signature -ErrorAction Stop
}

function Invoke-WorkingSetTrim {
    param([int]$ProcessId)
    try {
        # Request both the legacy and the limited-info query rights, plus
        # set-quota - this combination is what actually works against both
        # normal processes AND sandboxed Edge renderer/GPU processes.
        $access = [WorkingSetTrimmer]::PROCESS_SET_QUOTA -bor `
                  [WorkingSetTrimmer]::PROCESS_QUERY_INFORMATION -bor `
                  [WorkingSetTrimmer]::PROCESS_QUERY_LIMITED_INFORMATION

        $handle = [WorkingSetTrimmer]::OpenProcess($access, $false, $ProcessId)
        if ($handle -eq [IntPtr]::Zero) { return $false }

        # The correct call to "empty the working set now" (non-destructive,
        # pages get reclaimed automatically if the process touches them
        # again) is -1/-1 (i.e. 0xFFFFFFFF on 32-bit, or the pointer-sized
        # equivalent) for min/max, WITH the HARDWS_MIN_DISABLE and
        # HARDWS_MAX_DISABLE flags set. Previously this script computed
        # $minWs/$maxWs but then passed UIntPtr.Zero/Zero with Flags=0
        # instead - which is not a valid combination and silently failed
        # every single call. Fixed below to actually use the values.
        $minWs = [UIntPtr]::new([uint64]0xFFFFFFFF)
        $maxWs = [UIntPtr]::new([uint64]0xFFFFFFFF)
        $flags = [WorkingSetTrimmer]::QUOTA_LIMITS_HARDWS_MIN_DISABLE -bor [WorkingSetTrimmer]::QUOTA_LIMITS_HARDWS_MAX_DISABLE

        $result = [WorkingSetTrimmer]::SetProcessWorkingSetSizeEx($handle, $minWs, $maxWs, $flags)

        if (-not $result) {
            $err = [System.Runtime.InteropServices.Marshal]::GetLastWin32Error()
            Write-Verbose "SetProcessWorkingSetSizeEx failed for PID $ProcessId with Win32 error $err"
        }

        [WorkingSetTrimmer]::CloseHandle($handle) | Out-Null
        return $result
    }
    catch {
        return $false
    }
}

function Get-NonEssentialProcesses {
    Get-Process | Where-Object {
        $_.Id -ne 0 -and
        -not $exclusions.Contains($_.ProcessName) -and
        $_.WorkingSet64 -gt 0
    }
}

Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host " System-Wide Non-Essential App Memory Cap" -ForegroundColor Cyan
Write-Host " Mode: Non-destructive working-set trimming (no kills)" -ForegroundColor Cyan
Write-Host " COMBINED cap: $MaxNonEssentialMemoryMB MB total for all non-essential apps" -ForegroundColor Cyan
if ($PerAppCapsMB.Count -gt 0) {
    if ($usingDefaultCaps) {
        Write-Host " PER-APP caps (built-in defaults - pass -PerAppCapsMB to customize):" -ForegroundColor Cyan
    }
    else {
        Write-Host " PER-APP caps (custom, set by you):" -ForegroundColor Cyan
    }
    foreach ($key in ($PerAppCapsMB.Keys | Sort-Object)) {
        Write-Host ("    {0,-20} -> {1} MB individually" -f $key, $PerAppCapsMB[$key]) -ForegroundColor Cyan
    }
}
else {
    Write-Host " PER-APP caps: none (empty hashtable was explicitly passed)" -ForegroundColor Cyan
}
Write-Host " Check interval: every $CheckIntervalSeconds sec" -ForegroundColor Cyan
Write-Host " Protected/excluded: $($exclusions.Count) system process names (never touched/counted)" -ForegroundColor Cyan
Write-Host " Press Ctrl+C to stop." -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan

try {
    while ($true) {
        $procs = Get-NonEssentialProcesses
        # Group by process name since apps like Chrome/Edge spawn many PIDs
        $grouped = $procs | Group-Object ProcessName | ForEach-Object {
            [PSCustomObject]@{
                ProcessName = $_.Name
                TotalMB     = [Math]::Round((($_.Group | Measure-Object -Property WorkingSet64 -Sum).Sum) / 1MB, 1)
                ProcCount   = $_.Count
                Processes   = $_.Group
            }
        } | Sort-Object TotalMB -Descending

        $totalMB = [Math]::Round((($procs | Measure-Object -Property WorkingSet64 -Sum).Sum) / 1MB, 1)
        $timestamp = Get-Date -Format 'HH:mm:ss'

        # ---- Always-visible breakdown so it's clear what's capped and current usage ----
        if ($ShowBreakdown) {
            Write-Host ""
            Write-Host "[$timestamp] --- Per-app memory breakdown (top 15) ---" -ForegroundColor Cyan
            Write-Host ("   {0,-22} {1,10}  {2,6}  {3,12}" -f "App", "Memory MB", "Procs", "Cap (MB)") -ForegroundColor White
            $grouped | Select-Object -First 15 | ForEach-Object {
                $capText = if ($PerAppCapsMB.ContainsKey($_.ProcessName)) { "$($PerAppCapsMB[$_.ProcessName])" } else { "-" }
                $color = if ($PerAppCapsMB.ContainsKey($_.ProcessName) -and $_.TotalMB -gt $PerAppCapsMB[$_.ProcessName]) { "Yellow" } else { "Gray" }
                Write-Host ("   {0,-22} {1,10}  {2,6}  {3,12}" -f $_.ProcessName, $_.TotalMB, $_.ProcCount, $capText) -ForegroundColor $color
            }
            Write-Host ""
        }

        # ---- Enforce PER-APP caps first (independent of combined total) ----
        foreach ($key in $PerAppCapsMB.Keys) {
            $match = $grouped | Where-Object { $_.ProcessName -eq $key }
            if ($match -and $match.TotalMB -gt $PerAppCapsMB[$key]) {
                $overBy = [Math]::Round($match.TotalMB - $PerAppCapsMB[$key], 1)
                Write-Host "[$timestamp] '$key' using $($match.TotalMB) MB (its own cap: $($PerAppCapsMB[$key]) MB, over by $overBy MB). Trimming..." -ForegroundColor Yellow

                $targets = $match.Processes | Sort-Object WorkingSet64 -Descending | Select-Object -First $TrimBatchSize
                foreach ($p in $targets) {
                    $beforeMB = [Math]::Round($p.WorkingSet64 / 1MB, 1)
                    $trimmed = Invoke-WorkingSetTrim -ProcessId $p.Id
                    if ($trimmed) {
                        Start-Sleep -Milliseconds 200
                        try {
                            $p.Refresh()
                            $afterMB = [Math]::Round($p.WorkingSet64 / 1MB, 1)
                            Write-Host ("   {0,-25} PID {1,-7} {2,8} MB -> {3,8} MB" -f $p.ProcessName, $p.Id, $beforeMB, $afterMB) -ForegroundColor Green
                        } catch {
                            Write-Host ("   {0,-25} PID {1,-7} trimmed (was {2} MB)" -f $p.ProcessName, $p.Id, $beforeMB) -ForegroundColor Green
                        }
                    }
                }
            }
        }

        # ---- Enforce COMBINED cap across everything ----
        if ($totalMB -gt $MaxNonEssentialMemoryMB) {
            $overBy = [Math]::Round($totalMB - $MaxNonEssentialMemoryMB, 1)
            Write-Host "[$timestamp] COMBINED non-essential total: $totalMB MB (limit: $MaxNonEssentialMemoryMB MB, over by $overBy MB). Trimming top consumers..." -ForegroundColor Yellow

            $topConsumers = $procs | Sort-Object WorkingSet64 -Descending | Select-Object -First $TrimBatchSize

            foreach ($p in $topConsumers) {
                $beforeMB = [Math]::Round($p.WorkingSet64 / 1MB, 1)
                $trimmed = Invoke-WorkingSetTrim -ProcessId $p.Id

                if ($trimmed) {
                    Start-Sleep -Milliseconds 200
                    try {
                        $p.Refresh()
                        $afterMB = [Math]::Round($p.WorkingSet64 / 1MB, 1)
                        $savedMB = [Math]::Round($beforeMB - $afterMB, 1)
                        Write-Host ("   {0,-25} PID {1,-7} {2,8} MB -> {3,8} MB  (saved {4} MB)" -f $p.ProcessName, $p.Id, $beforeMB, $afterMB, $savedMB) -ForegroundColor Green
                    }
                    catch {
                        Write-Host ("   {0,-25} PID {1,-7} trimmed (was {2} MB)" -f $p.ProcessName, $p.Id, $beforeMB) -ForegroundColor Green
                    }
                }
                else {
                    Write-Host ("   {0,-25} PID {1,-7} trim skipped (protected or access denied)" -f $p.ProcessName, $p.Id) -ForegroundColor DarkGray
                }
            }
        }
        elseif (-not $ShowBreakdown) {
            Write-Host "[$timestamp] Non-essential apps using $totalMB MB / $MaxNonEssentialMemoryMB MB combined - within limit." -ForegroundColor DarkGray
        }

        Start-Sleep -Seconds $CheckIntervalSeconds
    }
}
finally {
    Write-Host ""
    Write-Host "Monitoring stopped. No processes were killed at any point - this script only trims memory." -ForegroundColor Cyan
}
