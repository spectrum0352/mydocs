<#
.SYNOPSIS
    Configures Microsoft Edge (via registry policies) to use less CPU and memory.

.DESCRIPTION
    This script applies Edge enterprise policies under
    HKLM:\SOFTWARE\Policies\Microsoft\Edge so that Edge itself runs leaner:
      - Forces Efficiency Mode (Memory Saver) ON, always, not opt-out-able
      - Enables background tab freezing/discarding
      - Disables "Startup boost" (no resident background process)
      - Disables background apps/extensions running after Edge closes
      - Disables preloading Edge at Windows startup
      - Caps renderer process count (fewer processes = less RAM/CPU overhead)
      - Disables smooth scrolling / unnecessary animations (minor CPU savings)
      - Throttles background tab timers (TabFreezingEnabled)

    These are the same policy keys IT admins use to manage Edge in
    enterprise environments, applied here to your own machine.

.PARAMETER MaxRendererProcesses
    Caps the number of renderer processes Edge can spawn. Lower = less
    RAM/CPU but tabs share processes more (less crash isolation).
    Default: 8 (Edge's default is usually much higher, scaling with RAM/cores)

.PARAMETER Revert
    If specified, removes all policies this script applied, restoring
    Edge to default (unmanaged) behavior.

.EXAMPLE
    .\Configure-EdgeLowResource.ps1
    Applies all resource-saving policies with defaults.

.EXAMPLE
    .\Configure-EdgeLowResource.ps1 -MaxRendererProcesses 4

.EXAMPLE
    .\Configure-EdgeLowResource.ps1 -Revert
    Undoes the changes made by this script.

.NOTES
    - Must be run as Administrator (writes to HKLM).
    - Close and restart Edge (fully - check Task Manager for leftover
      msedge.exe processes) after running for policies to take effect.
    - Verify applied policies by visiting edge://policy in the browser.
#>

[CmdletBinding()]
param(
    [int]$MaxRendererProcesses = 8,
    [switch]$Revert
)

# ---- Require Administrator ----
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "This script must be run as Administrator (it writes to HKLM:\...). Right-click PowerShell -> Run as Administrator."
    exit 1
}

$edgePolicyPath = "HKLM:\SOFTWARE\Policies\Microsoft\Edge"

# Policy values to set: Name = Value (all REG_DWORD unless noted)
$policies = @{
    # --- Efficiency / Memory Saver ---
    "EfficiencyModeOptOutVisible" = 0   # Hide the opt-out toggle from users (0 = enforced)
    "MemorySaverModeAvailable"    = 1   # Ensure Memory Saver feature is available
    "MemorySaverModeSavings"      = 2   # Aggressiveness: 1 = Balanced, 2 = Maximum savings

    # --- Background tab freezing/throttling ---
    "TabFreezingEnabled"          = 1   # Freeze inactive background tabs
    "BatterySaverModeAvailable"   = 1   # Allow battery saver throttling too

    # --- Startup / background behavior ---
    "StartupBoostEnabled"             = 0  # Don't keep Edge resident in background for fast launch
    "BackgroundModeEnabled"           = 0  # Don't allow Edge/extensions to run after browser closes
    "PreloadHeaderRegistrationEnabled" = 0 # Reduce passive background network/preload activity

    # --- Process / renderer limits ---
    "RendererCodeIntegrityEnabled" = 1  # Keep security on (not a perf setting, but commonly paired)

    # --- Misc CPU-saving UI settings ---
    "SmoothScrollingEnabled"      = 0   # Disable smooth scroll animation (minor CPU savings)
    "HardwareAccelerationModeEnabled" = 1 # Ensure GPU offload is used instead of CPU rendering
}

function Set-EdgePolicy {
    param($Path, $Name, $Value)
    New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType DWord -Force | Out-Null
}

function Remove-EdgePolicy {
    param($Path, $Name)
    Remove-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue
}

if ($Revert) {
    Write-Host "Reverting Edge resource-saving policies..." -ForegroundColor Yellow

    if (Test-Path $edgePolicyPath) {
        foreach ($name in $policies.Keys) {
            Remove-EdgePolicy -Path $edgePolicyPath -Name $name
        }
        Remove-EdgePolicy -Path $edgePolicyPath -Name "RendererProcessLimit"
        Write-Host "All policies set by this script have been removed." -ForegroundColor Green
    }
    else {
        Write-Host "No Edge policy key found - nothing to revert." -ForegroundColor Gray
    }

    Write-Host "Restart Edge completely (check Task Manager for leftover msedge.exe) for changes to apply." -ForegroundColor Cyan
    exit 0
}

# ---- Create policy key if missing ----
if (-not (Test-Path $edgePolicyPath)) {
    New-Item -Path $edgePolicyPath -Force | Out-Null
}

Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host " Applying Edge low-resource policies" -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan

foreach ($name in $policies.Keys) {
    $value = $policies[$name]
    try {
        Set-EdgePolicy -Path $edgePolicyPath -Name $name -Value $value
        Write-Host (" {0,-35} -> {1}" -f $name, $value) -ForegroundColor Green
    }
    catch {
        Write-Host (" {0,-35} -> FAILED: {1}" -f $name, $_.Exception.Message) -ForegroundColor Red
    }
}

# ---- Renderer process cap ----
try {
    Set-EdgePolicy -Path $edgePolicyPath -Name "RendererProcessLimit" -Value $MaxRendererProcesses
    Write-Host (" {0,-35} -> {1}" -f "RendererProcessLimit", $MaxRendererProcesses) -ForegroundColor Green
}
catch {
    Write-Host " RendererProcessLimit -> FAILED: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host " Done. Fully close Edge (check Task Manager for any" -ForegroundColor Cyan
Write-Host " leftover msedge.exe processes and end them) then" -ForegroundColor Cyan
Write-Host " reopen Edge for the policies to take effect." -ForegroundColor Cyan
Write-Host "" -ForegroundColor Cyan
Write-Host " Verify in Edge by visiting: edge://policy" -ForegroundColor Cyan
Write-Host " Run this script with -Revert to undo these changes." -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan
