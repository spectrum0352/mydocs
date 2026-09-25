# ================================
# Advanced Software Inventory Script
# Covers: Registry + Store Apps
# ================================

$OutputPath = "$env:USERPROFILE\Desktop\Software_Report_Full.html"

Write-Host "Collecting installed software..."

$softwareList = @()

# -------------------------------
# 1. Registry आधारित apps
# -------------------------------
$paths = @(
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*",
    "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*"
)

foreach ($path in $paths) {
    $softwareList += Get-ItemProperty $path -ErrorAction SilentlyContinue | Where-Object {
        $_.DisplayName
    } | Select-Object @{
        Name="Name"; Expression={$_.DisplayName}
    }, @{
        Name="Version"; Expression={$_.DisplayVersion}
    }, @{
        Name="Source"; Expression={"Registry"}
    }
}

# -------------------------------
# 2. Microsoft Store apps
# -------------------------------
$storeApps = Get-AppxPackage | Select-Object @{
    Name="Name"; Expression={$_.Name}
}, @{
    Name="Version"; Expression={$_.Version}
}, @{
    Name="Source"; Expression={"Microsoft Store"}
}

$softwareList += $storeApps

# -------------------------------
# 3. CLI / Dev tools (basic detection)
# -------------------------------
$cliTools = @("node", "npm", "python", "pip", "firebase", "git")

foreach ($tool in $cliTools) {
    try {
        $version = & $tool --version 2>$null
        if ($version) {
            $softwareList += [PSCustomObject]@{
                Name = $tool
                Version = $version
                Source = "CLI Tool"
            }
        }
    } catch {}
}

# Remove duplicates
$softwareList = $softwareList | Sort-Object Name -Unique

# -------------------------------
# HTML Report
# -------------------------------
$style = @"
<style>
body { font-family: Arial; background:#f4f6f8; }
table { border-collapse: collapse; width:100%; background:white; }
th { background:#0078D7; color:white; padding:8px; }
td { padding:8px; border:1px solid #ddd; }
tr:nth-child(even) { background:#f2f2f2; }
</style>
"@

$html = "<html><head>$style</head><body>"
$html += "<h1>Full Software Inventory</h1>"
$html += "<p>Generated: $(Get-Date)</p>"
$html += "<table><tr><th>Name</th><th>Version</th><th>Source</th></tr>"

foreach ($app in $softwareList) {
    $html += "<tr><td>$($app.Name)</td><td>$($app.Version)</td><td>$($app.Source)</td></tr>"
}

$html += "</table></body></html>"

$html | Out-File -Encoding UTF8 $OutputPath

Write-Host "Report saved at: $OutputPath"
