# PowerShell Attack Patterns

## Suspicious PowerShell Behaviors

Monitor for the following suspicious PowerShell activities:

* PowerShell interacting with unusual or unauthorized processes
* PowerShell execution without invoking `powershell.exe`
* Unusual or suspicious parent processes spawning PowerShell
* Suspicious child processes launched by PowerShell
* Malicious or suspicious PowerShell command-line arguments
* PowerShell obfuscation and encoding techniques
* Renamed or masqueraded PowerShell binaries
* Suspicious outbound network connections initiated by PowerShell
* File creation or modification activity performed by PowerShell
* PowerShell scripts or interpreters configured in persistence or autorun locations

---

## Security Evasion & Bypass Techniques

Detect attempts to evade or disable PowerShell security controls, including:

* AMSI (Antimalware Scan Interface) bypass techniques
* Disabling or tampering with Script Block Logging
* Bypassing Constrained Language Mode (CLM)
* Suspicious content within Script Block Logs or AMSI scan buffers

---

## Lateral Movement

Monitor for PowerShell usage associated with lateral movement techniques, including:

* Remote PowerShell execution across systems
* PowerShell-based remote command execution
* WMI, WinRM, or PsExec-style activity initiated via PowerShell

---

# Common PowerShell Offensive Frameworks & Toolkits

The following offensive frameworks and tools are commonly associated with malicious PowerShell activity:

* PowerSploit
* PowerCat
* Empire
* DarkObserver
* PowerMemory
* Invoke-Mimikatz
* Invoke-Mimikittenz
* Offensive-PowerShell
* Kautilya
* Nishang
* PoshRat
* PowerShell Suite
* OWA-Toolkit
* Sherlock
* Invoke-Phant0m

---

# Suspicious PowerShell Functions & Cmdlets

Search PowerShell command lines, Script Block Logs, and telemetry for the following cmdlets and function names:

* `Get-GPPPassword`
* `Get-Keystrokes`
* `Get-MicrophoneAudio`
* `Get-ModifiablePath`
* `Get-TimedScreenshot`
* `Invoke-AllChecks`
* `Invoke-AmsiBypass`
* `Invoke-DllInjection`
* `Invoke-Mimikatz`
* `Invoke-NinjaCopy`
* `Invoke-PsUACme`
* `Invoke-ReflectivePEInjection`
* `Invoke-Shellcode`
* `PowerUp`
* `PowerView`

---

# Suspicious Parent Processes Launching PowerShell

Monitor PowerShell executions spawned by the following parent processes, as they may indicate phishing, exploitation, or post-exploitation activity:

* `amigo.exe`
* `browser.exe`
* `chrome.exe`
* `excel.exe`
* `firefox.exe`
* `httpd.exe`
* `iexplore.exe`
* `jbosssvc.exe`
* `microsoftedge.exe`
* `microsoftedgecp.exe`
* `MicrosoftEdgeSH.exe`
* `msaccess.exe`
* `mshta.exe`
* `mspub.exe`
* `nginx.exe`
* `outlook.exe`
* `php-cgi.exe`
* `powerpnt.exe`
* `regsvr32.exe`
* `rundll32.exe`
* `safari.exe`
* `services.exe`
* `sqlagent.exe`
* `sqlserver.exe`
* `sqlservr.exe`
* `tomcat.exe`
* `visio.exe`
* `vivaldi.exe`
* `w3wp.exe`
* `winword.exe`
* `wmiprvse.exe`
