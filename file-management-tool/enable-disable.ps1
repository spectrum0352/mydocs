#Requires -RunAsAdministrator

$hostsFile = Join-Path $env:SystemRoot "System32\drivers\etc\hosts"

$startMarker = "# >>> YOUTUBE BLOCK START >>>"
$endMarker   = "# <<< YOUTUBE BLOCK END <<<"

$domains = @(
    "youtube.com",
    "www.youtube.com",
    "m.youtube.com",
    "youtu.be",
    "www.youtu.be",
    "youtube-nocookie.com",
    "www.youtube-nocookie.com",
    "ytimg.com",
    "www.ytimg.com",
    "googlevideo.com",
    "www.googlevideo.com"
)

# Read hosts file safely
if (Test-Path $hostsFile) {
    $content = [System.IO.File]::ReadAllText($hostsFile)
} else {
    Write-Host "Hosts file not found: $hostsFile" -ForegroundColor Red
    exit
}

if ($content -like "*$startMarker*") {

    Write-Host "Unblocking YouTube..." -ForegroundColor Green

    $lines = Get-Content $hostsFile
    $newLines = @()
    $skip = $false

    foreach ($line in $lines) {
        if ($line -eq $startMarker) {
            $skip = $true
            continue
        }

        if ($line -eq $endMarker) {
            $skip = $false
            continue
        }

        if (-not $skip) {
            $newLines += $line
        }
    }

    Set-Content -Path $hostsFile -Value $newLines -Encoding ASCII

    ipconfig /flushdns | Out-Null

    Write-Host ""
    Write-Host "✓ YouTube has been UNBLOCKED." -ForegroundColor Green
}
else {

    Write-Host "Blocking YouTube..." -ForegroundColor Yellow

    Add-Content $hostsFile ""
    Add-Content $hostsFile $startMarker

    foreach ($d in $domains) {
        Add-Content $hostsFile "127.0.0.1 $d"
        Add-Content $hostsFile "::1 $d"
    }

    Add-Content $hostsFile $endMarker

    ipconfig /flushdns | Out-Null

    Write-Host ""
    Write-Host "✓ YouTube has been BLOCKED." -ForegroundColor Yellow
}

Pause