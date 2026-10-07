Powershell attacks

# PowerShell 

- Task automation and configuration management framework from Microsoft.

- Consisting of a command-line shell and associated scripting language

- Built on the .NET Framework;

- Enabling administrators to perform administrative tasks on both local and remote Windows systems

- **Why attackers love PowerShell?**

<!-- -->

- It is installed and enabled by default;

- Most attacker logic can be written in PowerShell without the need to install malicious binaries (interaction with .NET & Windows API, execution of payloads directly from memory, downloading & execution code from another system, etc.);

- It has remote access capabilities by default;

- As a script, It is easy to obfuscate and difficult to detect with signature-based approach;

- Many sysadmins use and trust it, allowing PowerShell malware to blend in with regular administration work;

- Most organizations are not watching PowerShell activity

<!-- -->

- **PowerShell Execution Policies aren’t about security**

- Execution Policy is not a security measure as it is known and can be easily overcome.

- It has been developed to prevent the damage they cause users run the script by accident

- **PowerShell Execution Policies aren’t about security A lot of ways to bypass it!**

Detection of PowerShell abuses

<img src="media/image1.png" style="width:7.33638in;height:3.27083in" />

**PowerShell abuse patterns**

<img src="media/image2.png" style="width:7.14548in;height:3.5625in" />

Well-known PowerShell Offensive Frameworks

- PowerSploit

- PowerCat

- Empire

- DarkObserver

- PowerMemory

- Invoke-Mimikatz

- Invoke-Mimikittenz

- Offensive-PowerShell

- Kautilya

- Nishang

- PoshRat

- PowerShell Suite

- OWA-Toolkit

- Sherlock

- Invoke-Phant0m

Search for commandlet and function names from well-know PowerShell offensive frameworks in PowerShell command lines and script blocks:

- Get-GPPPassword

- Get-Keystrokes

- Get-MicrophoneAudio

- Get-ModifiablePath

- Get-TimedScreenshot

- Invoke-AllChecks

- Invoke-AmsiBypass

- Invoke-DllInjection

- Invoke-Mimikatz

- Invoke-NinjaCopy

- Invoke-PsUACme

- Invoke-ReflectivePEInjection

- Invoke-Shellcode

- PowerUp

- PowerView

**Suspicious PowerShell parent process**

<img src="media/image3.png" style="width:7.41436in;height:3.59722in" />

**Suspicious PowerShell parent process**

- amigo.exe

- browser.exe

- chrome.exe

- excel.exe

- firefox.exe

- httpd.exe

- iexplore.exe

- jbosssvc.exe

- microsoftedge.exe

- microsoftedgecp.exe

- MicrosoftEdgeSH.exe

- msaccess.exe

- mshta.exe

- mspub.exe

- nginx.exe

- outlook.exe

- php-cgi.exe

- powerpnt.exe

- regsvr32.exe

- rundll32.exe

- safari.exe

- services.exe

- sqlagent.exe

- sqlserver.exe

- sqlservr.exe

- tomcat

- visio.exe

- vivaldi.exe

- w3wp.exe

- winword.exe

- wmiprvse.exe

 Path Traversal

- Linux Server Path Traversal Exploitation

- Basic Path Traversal

- Blocked Traversal Sequence

- Validated Path Traversal

- Path Disclosure in URL

- Null Byte Bypass

- Windows Server Path Traversal Exploitation

- Basic Path Traversal

- Double dots with Forward-Backward Slashes

- Blocked Traversal Sequence
