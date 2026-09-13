<#
.SYNOPSIS
    Disables Windows 11 services confirmed unused on this PC: Hyper-V/VM
    components and Xbox/gaming services. Does NOT touch OneDrive, Office,
    networking, security, or any core system service.

.DESCRIPTION
    Based on your confirmed usage (no Hyper-V/WSL/VMs, no Xbox/gaming
    features, active OneDrive + Office use), this script only disables
    services that are genuinely safe to turn off for your setup:

        HYPER-V / VIRTUALIZATION (you said: never use VMs/WSL):
          - Hyper-V Data Exchange Service       (vmickvpexchange)
          - Hyper-V Guest Service Interface     (vmicguestinterface)
          - Hyper-V Guest Shutdown Service      (vmicshutdown)
          - Hyper-V Heartbeat Service           (vmicheartbeat)
          - Hyper-V PowerShell Direct Service   (vmicvmsession)
          - Hyper-V Remote Desktop Virtualization Service (vmicrdv)
          - Hyper-V Time Synchronization Service (vmictimesync)
          - Hyper-V Volume Shadow Copy Requestor (vmicvss)
          - HV Host Service                     (HvHost)

        XBOX / GAMING (you said: never use Xbox features):
          - Xbox Accessory Management Service   (XboxGipSvc)
          - Xbox Live Auth Manager              (XblAuthManager)
          - Xbox Live Game Save                 (XblGameSave)
          - Xbox Live Networking Service        (XboxNetApiSvc)
          - GameInput Service                   (GameInputSvc)

    Each service is individually optional below (-SkipHyperV / -SkipXbox)
    in case you change your mind about one category later.

    NOT included (left completely alone, by design):
      - OneDrive, Office Click-to-Run, networking, security, Defender,
        printing, Bluetooth, Windows Update, and everything else flagged
        "must keep" or "leave on Manual" in the earlier recommendation -
        these are untouched regardless of any switch passed here.

.PARAMETER SkipHyperV
    If specified, Hyper-V services are left alone (only Xbox services
    are disabled).

.PARAMETER SkipXbox
    If specified, Xbox services are left alone (only Hyper-V services
    are disabled).

.PARAMETER Revert
    Re-enables (sets back to Manual start type) all services this script
    would otherwise disable. Does not forcibly start them, just restores
    their startup type so Windows can start them normally if needed again.

.EXAMPLE
    .\Disable-UnusedServices.ps1
    Disables all Hyper-V and Xbox services listed above.

.EXAMPLE
    .\Disable-UnusedServices.ps1 -SkipHyperV
    Only disables Xbox services, leaves Hyper-V alone.

.EXAMPLE
    .\Disable-UnusedServices.ps1 -Revert
    Restores all of the above services to Manual startup (Windows default
    for most of them), undoing this script's changes.

.NOTES
    - Must be run as Administrator.
    - Sets services to "Disabled" startup type and stops them if running.
    - Disabled (not just stopped) means they will NOT start automatically
      or on-demand until re-enabled - this is a deliberate, persistent
      change, not a one-time stop.
    - If a listed service doesn't exist on your system (some are
      hardware/feature dependent), it's skipped with a note, not an error.
#>

[CmdletBinding()]
param(
    [switch]$SkipHyperV,
    [switch]$SkipXbox,
    [switch]$Revert
)

# ---- Require Administrator ----
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "This script must be run as Administrator. Right-click PowerShell -> Run as Administrator."
    exit 1
}

# ---- Service name -> display name map (service names are the real Windows
#      service keys, stable across language/locale; display names are just
#      for readable output) ----
$hyperVServices = [ordered]@{
    "vmickvpexchange"   = "Hyper-V Data Exchange Service"
    "vmicguestinterface" = "Hyper-V Guest Service Interface"
    "vmicshutdown"      = "Hyper-V Guest Shutdown Service"
    "vmicheartbeat"     = "Hyper-V Heartbeat Service"
    "vmicvmsession"     = "Hyper-V PowerShell Direct Service"
    "vmicrdv"           = "Hyper-V Remote Desktop Virtualization Service"
    "vmictimesync"      = "Hyper-V Time Synchronization Service"
    "vmicvss"           = "Hyper-V Volume Shadow Copy Requestor"
    "HvHost"            = "HV Host Service"
}

$xboxServices = [ordered]@{
    "XboxGipSvc"    = "Xbox Accessory Management Service"
    "XblAuthManager" = "Xbox Live Auth Manager"
    "XblGameSave"   = "Xbox Live Game Save"
    "XboxNetApiSvc" = "Xbox Live Networking Service"
    "GameInputSvc"  = "GameInput Service"
}

$targetServices = [ordered]@{}
if (-not $SkipHyperV) { foreach ($k in $hyperVServices.Keys) { $targetServices[$k] = $hyperVServices[$k] } }
if (-not $SkipXbox)   { foreach ($k in $xboxServices.Keys)   { $targetServices[$k] = $xboxServices[$k] } }

if ($targetServices.Count -eq 0) {
    Write-Warning "Both -SkipHyperV and -SkipXbox were specified - nothing to do."
    exit 0
}

Write-Host "=======================================================" -ForegroundColor Cyan
if ($Revert) {
    Write-Host " Reverting: Hyper-V / Xbox Services to Manual" -ForegroundColor Cyan
}
else {
    Write-Host " Disabling Unused Services (Hyper-V / Xbox)" -ForegroundColor Cyan
}
Write-Host " Untouched: OneDrive, Office, networking, security, Defender," -ForegroundColor Cyan
Write-Host " printing, Bluetooth, Windows Update, and all core services." -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host ""

$processed = 0
$skippedNotFound = 0

foreach ($serviceName in $targetServices.Keys) {
    $displayName = $targetServices[$serviceName]
    $svc = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

    if (-not $svc) {
        Write-Host (" {0,-40} ({1}) - not present on this system, skipped" -f $displayName, $serviceName) -ForegroundColor DarkGray
        $skippedNotFound++
        continue
    }

    try {
        if ($Revert) {
            Set-Service -Name $serviceName -StartupType Manual -ErrorAction Stop
            Write-Host (" {0,-40} ({1}) -> Manual (restored)" -f $displayName, $serviceName) -ForegroundColor Green
        }
        else {
            if ($svc.Status -eq 'Running') {
                Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
            }
            Set-Service -Name $serviceName -StartupType Disabled -ErrorAction Stop
            Write-Host (" {0,-40} ({1}) -> Disabled" -f $displayName, $serviceName) -ForegroundColor Green
        }
        $processed++
    }
    catch {
        Write-Host (" {0,-40} ({1}) -> FAILED: {2}" -f $displayName, $serviceName, $_.Exception.Message) -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host " Done. $processed service(s) updated, $skippedNotFound not present on this system." -ForegroundColor Cyan
if (-not $Revert) {
    Write-Host " Run with -Revert to restore these to Manual startup if needed." -ForegroundColor Cyan
}
Write-Host "=======================================================" -ForegroundColor Cyan
