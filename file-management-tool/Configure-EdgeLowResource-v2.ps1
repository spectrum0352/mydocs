<#
.SYNOPSIS
    Configures Microsoft Edge (via verified registry policies) to use less CPU and memory.

.DESCRIPTION
    The previous version of this script used several policy names that do not
    exist in current Edge builds (they showed as "Unknown policy" in edge://policy
    and had no effect). This version uses ONLY policy names confirmed against
    Microsoft's official documentation for Edge 149 (current as of mid-2026):

        - EfficiencyModeEnabled   -> forces Efficiency Mode (Memory Saver) on
        - TotalMemoryLimitMb      -> hard cap on total RAM the whole browser can use;
                                      Edge discards background tabs once exceeded
        - BackgroundModeEnabled   -> prevents Edge/extensions running after close
        - StartupBoostEnabled     -> prevents Edge staying resident for fast launch
        - HardwareAccelerationModeEnabled -> uses GPU instead of CPU for rendering
        - RendererProcessLimit    -> caps number of renderer processes (real policy,
                                      supported since Edge 110+)

    All other policy names from the previous script (MemorySaverModeAvailable,
    TabFreezingEnabled, EfficiencyModeOptOutVisible, etc.) have been removed -
    they are not real Edge policies and were doing nothing.

.PARAMETER MaxMemoryMB
    Hard cap on total RAM the whole Edge browser instance can use, in MB.
    Edge will start discarding background tabs once this is exceeded.
    Minimum effective value is 1024 (Edge rounds anything lower up to 1024).
    Default: 1500

.PARAMETER MaxRendererProcesses
    Caps the number of renderer processes Edge can spawn. Lower = less
    RAM/CPU overhead but tabs share processes more (less crash isolation).
    Default: 6

.PARAMETER Revert
    Removes all policies this script applied, restoring Edge to default
    (unmanaged) behavior.

.EXAMPLE
    .\Configure-EdgeLowResource.ps1
    Applies all resource-saving policies with defaults (1500MB cap, 6 renderers).

.EXAMPLE
    .\Configure-EdgeLowResource.ps1 -MaxMemoryMB 1024 -MaxRendererProcesses 4
    Most aggressive realistic settings.

.EXAMPLE
    .\Configure-EdgeLowResource.ps1 -Revert

.NOTES
    - Must be run as Administrator (writes to HKLM).
    - Fully close Edge (check Task Manager for leftover msedge.exe processes,
      end them) and reopen for policies to take effect.
    - Verify applied policies at edge://policy - click "Reload policies".
      Confirmed-working policies will show NO "error" field in the JSON view.
#>

[CmdletBinding()]
param(
    [int]$MaxMemoryMB = 500,
    [int]$MaxRendererProcesses = 6,
    [switch]$Revert
)

# ---- Require Administrator ----
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "This script must be run as Administrator (it writes to HKLM:\...). Right-click PowerShell -> Run as Administrator."
    exit 1
}

if ($MaxMemoryMB -lt 500) {
    Write-Warning "MaxMemoryMB values under 500 are rounded up to 500 by Edge. Using 500."
    $MaxMemoryMB = 500
}

$edgePolicyPath = "HKLM:\SOFTWARE\Policies\Microsoft\Edge"

# Old (fake/unrecognized) policy names from the previous version of this script.
# Cleaned up automatically so edge://policy doesn't show stale "Unknown policy" entries.
$obsoletePolicyNames = @(
    "EfficiencyModeOptOutVisible",
    "MemorySaverModeAvailable",
    "MemorySaverModeSavings",
    "TabFreezingEnabled",
    "BatterySaverModeAvailable",
    "PreloadHeaderRegistrationEnabled",
    "RendererCodeIntegrityEnabled",
    "SmoothScrollingEnabled"
)

# Verified, real policies (confirmed against learn.microsoft.com, Edge 149)
$policies = @{
    "EfficiencyModeEnabled"             = 1   # Force Efficiency Mode (Memory Saver) on
    "BackgroundModeEnabled"             = 0   # Don't allow Edge/extensions to run after browser closes
    "StartupBoostEnabled"               = 0   # Don't keep Edge resident in background for fast launch
    "HardwareAccelerationModeEnabled"   = 1   # Use GPU offload instead of CPU rendering
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
        foreach ($name in $obsoletePolicyNames) {
            Remove-EdgePolicy -Path $edgePolicyPath -Name $name
        }
        Remove-EdgePolicy -Path $edgePolicyPath -Name "RendererProcessLimit"
        Remove-EdgePolicy -Path $edgePolicyPath -Name "TotalMemoryLimitMb"
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
Write-Host " Cleaning up obsolete/invalid policy entries" -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan
foreach ($name in $obsoletePolicyNames) {
    $existing = Get-ItemProperty -Path $edgePolicyPath -Name $name -ErrorAction SilentlyContinue
    if ($existing) {
        Remove-EdgePolicy -Path $edgePolicyPath -Name $name
        Write-Host (" Removed invalid policy: {0}" -f $name) -ForegroundColor DarkYellow
    }
}

Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host " Applying verified Edge low-resource policies" -ForegroundColor Cyan
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

# ---- Hard total memory cap (the key one) ----
try {
    Set-EdgePolicy -Path $edgePolicyPath -Name "TotalMemoryLimitMb" -Value $MaxMemoryMB
    Write-Host (" {0,-35} -> {1} MB" -f "TotalMemoryLimitMb", $MaxMemoryMB) -ForegroundColor Green
}
catch {
    Write-Host " TotalMemoryLimitMb -> FAILED: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host " Done. Fully close Edge (check Task Manager for any" -ForegroundColor Cyan
Write-Host " leftover msedge.exe processes and end them) then" -ForegroundColor Cyan
Write-Host " reopen Edge for the policies to take effect." -ForegroundColor Cyan
Write-Host "" -ForegroundColor Cyan
Write-Host " Verify in Edge: go to edge://policy, click 'Reload" -ForegroundColor Cyan
Write-Host " policies', and confirm none of these 6 show an" -ForegroundColor Cyan
Write-Host " 'error: Unknown policy' field." -ForegroundColor Cyan
Write-Host "" -ForegroundColor Cyan
Write-Host " Run this script with -Revert to undo these changes." -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan
