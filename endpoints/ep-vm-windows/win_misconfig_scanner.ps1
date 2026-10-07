# ================================
# Windows Security Posture Scanner (Final)
# ================================

$results = @()
$riskScore = 0
$maxScore = 100

function Add-Finding {
    param($Name, $Status, $Risk, $Recommendation)

    $script:results += [PSCustomObject]@{
        Check = $Name
        Status = $Status
        Risk = $Risk
        Recommendation = $Recommendation
    }

    if ($Status -eq "FAIL") {
        $script:riskScore += $Risk
    }
}

function Safe-Check {
    param($Name, $ScriptBlock)

    try {
        & $ScriptBlock
    } catch {
        Add-Finding $Name "ERROR" 5 "Check failed: $($_.Exception.Message)"
    }
}

# -------------------------------
# BASIC SECURITY
# -------------------------------

Safe-Check "RDP" {
    $rdp = Get-ItemProperty "HKLM:\System\CurrentControlSet\Control\Terminal Server"
    if ($rdp.fDenyTSConnections -eq 0) {
        Add-Finding "RDP Enabled" "FAIL" 10 "Disable or restrict via VPN"
    } else {
        Add-Finding "RDP Enabled" "PASS" 0 "Correctly configured"
    }
}

Safe-Check "Password Policy" {
    $line = (net accounts) | Select-String "Minimum password length"
    if ($line) {
        $minLen = [int]($line -replace "[^\d]", "")
        if ($minLen -lt 8) {
            Add-Finding "Password Length" "FAIL" 10 "Set >= 12 characters"
        } else {
            Add-Finding "Password Length" "PASS" 0 "Correctly configured"
        }
    } else {
        Add-Finding "Password Policy" "ERROR" 5 "Unable to read policy"
    }
}

Safe-Check "Defender" {
    if (Get-Command Get-MpComputerStatus -ErrorAction SilentlyContinue) {
        $def = Get-MpComputerStatus
        if ($def.AntivirusEnabled) {
            Add-Finding "Defender" "PASS" 0 "Enabled"
        } else {
            Add-Finding "Defender" "FAIL" 15 "Enable Defender"
        }
    } else {
        Add-Finding "Defender" "ERROR" 5 "Module missing"
    }
}

Safe-Check "Firewall" {
    $fw = Get-NetFirewallProfile
    if ($fw.Enabled -contains $false) {
        Add-Finding "Firewall" "FAIL" 15 "Enable all profiles"
    } else {
        Add-Finding "Firewall" "PASS" 0 "Correctly configured"
    }
}

Safe-Check "UAC" {
    $uac = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System
    if ($uac.EnableLUA -eq 1) {
        Add-Finding "UAC" "PASS" 0 "Enabled"
    } else {
        Add-Finding "UAC" "FAIL" 10 "Enable UAC"
    }
}

Safe-Check "Guest Account" {
    $guest = Get-LocalUser -Name "Guest" -ErrorAction SilentlyContinue
    if ($guest -and $guest.Enabled) {
        Add-Finding "Guest Account" "FAIL" 10 "Disable guest account"
    } else {
        Add-Finding "Guest Account" "PASS" 0 "Correctly configured"
    }
}

Safe-Check "SMBv1" {
    $smb = Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -ErrorAction SilentlyContinue
    if ($smb -and $smb.State -eq "Enabled") {
        Add-Finding "SMBv1" "FAIL" 10 "Disable SMBv1"
    } else {
        Add-Finding "SMBv1" "PASS" 0 "Correctly configured"
    }
}

Safe-Check "Windows Updates" {
    $svc = Get-Service wuauserv
    if ($svc.Status -eq "Running") {
        Add-Finding "Windows Update" "PASS" 0 "Running"
    } else {
        Add-Finding "Windows Update" "FAIL" 10 "Enable updates"
    }
}

# -------------------------------
# ADVANCED SECURITY
# -------------------------------

Safe-Check "LSASS Protection" {
    $lsa = Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -ErrorAction SilentlyContinue
    if ($lsa.RunAsPPL -eq 1) {
        Add-Finding "LSASS Protection" "PASS" 0 "Enabled"
    } else {
        Add-Finding "LSASS Protection" "FAIL" 15 "Enable RunAsPPL"
    }
}

Safe-Check "Credential Guard" {
    $cg = Get-CimInstance Win32_DeviceGuard -ErrorAction SilentlyContinue
    if ($cg.SecurityServicesRunning -contains 1) {
        Add-Finding "Credential Guard" "PASS" 0 "Enabled"
    } else {
        Add-Finding "Credential Guard" "FAIL" 15 "Enable Credential Guard"
    }
}

Safe-Check "BitLocker" {
    $bl = Get-BitLockerVolume -ErrorAction SilentlyContinue
    if ($bl -and ($bl.ProtectionStatus -contains 1)) {
        Add-Finding "BitLocker" "PASS" 0 "Enabled"
    } else {
        Add-Finding "BitLocker" "FAIL" 15 "Enable disk encryption"
    }
}

Safe-Check "Secure Boot" {
    if (Confirm-SecureBootUEFI -ErrorAction SilentlyContinue) {
        Add-Finding "Secure Boot" "PASS" 0 "Enabled"
    } else {
        Add-Finding "Secure Boot" "FAIL" 10 "Enable in BIOS"
    }
}

Safe-Check "RDP NLA" {
    $nla = Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp"
    if ($nla.UserAuthentication -eq 1) {
        Add-Finding "RDP NLA" "PASS" 0 "Enabled"
    } else {
        Add-Finding "RDP NLA" "FAIL" 10 "Enable NLA"
    }
}

Safe-Check "SMB Signing" {
    $smb = Get-SmbServerConfiguration
    if ($smb.EnableSecuritySignature) {
        Add-Finding "SMB Signing" "PASS" 0 "Enabled"
    } else {
        Add-Finding "SMB Signing" "FAIL" 10 "Enable SMB signing"
    }
}

Safe-Check "Open Ports" {
    $ports = Get-NetTCPConnection -State Listen | Where-Object { $_.LocalPort -notin @(80,443) }
    if ($ports.Count -gt 10) {
        Add-Finding "Open Ports" "FAIL" 10 "Too many listening ports"
    } else {
        Add-Finding "Open Ports" "PASS" 0 "Limited exposure"
    }
}

Safe-Check "Admin Users" {
    $admins = Get-LocalGroupMember Administrators
    if ($admins.Count -gt 3) {
        Add-Finding "Admin Users" "FAIL" 15 "Reduce admin users"
    } else {
        Add-Finding "Admin Users" "PASS" 0 "Minimal admins"
    }
}

Safe-Check "PowerShell Logging" {
    $pslog = Get-ItemProperty "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -ErrorAction SilentlyContinue
    if ($pslog.EnableScriptBlockLogging -eq 1) {
        Add-Finding "PowerShell Logging" "PASS" 0 "Enabled"
    } else {
        Add-Finding "PowerShell Logging" "FAIL" 10 "Enable logging"
    }
}

Safe-Check "Audit Policy" {
    $audit = auditpol /get /category:*
    if ($audit -match "No Auditing") {
        Add-Finding "Audit Policy" "FAIL" 15 "Enable auditing"
    } else {
        Add-Finding "Audit Policy" "PASS" 0 "Enabled"
    }
}

# -------------------------------
# RISK SCORE
# -------------------------------
$finalScore = [math]::Round((($maxScore - $riskScore) / $maxScore) * 100)

# -------------------------------
# HTML REPORT
# -------------------------------
$rows = ""

foreach ($r in $results) {
    $color = switch ($r.Status) {
        "PASS" {"#16a34a"}
        "FAIL" {"#dc2626"}
        "ERROR" {"#f59e0b"}
    }

    $rows += "<tr>
<td>$($r.Check)</td>
<td style='color:$color'>$($r.Status)</td>
<td>$($r.Risk)</td>
<td>$($r.Recommendation)</td>
</tr>"
}

if ($results.Count -eq 0) {
    $rows = "<tr><td colspan='4'>No data collected</td></tr>"
}

$report = @"
<html>
<head>
<title>Windows Security Report</title>
<style>
body { font-family:Segoe UI; background:#0f172a; color:white; }
table { width:100%; border-collapse:collapse; }
th,td { padding:10px; border:1px solid #333; }
th { background:#1e293b; }
</style>
</head>
<body>

<h1>Windows Security Posture Report</h1>
<h2>Score: $finalScore / 100</h2>

<table>
<tr><th>Check</th><th>Status</th><th>Risk</th><th>Recommendation</th></tr>
$rows
</table>

</body>
</html>
"@

$path = "$env:USERPROFILE\Desktop\Security_Report.html"
$report | Out-File $path -Encoding utf8

Write-Host "[OK] Scan completed"
Write-Host "[INFO] Report saved at: $path"
Write-Host "[INFO] Score: $finalScore / 100"
