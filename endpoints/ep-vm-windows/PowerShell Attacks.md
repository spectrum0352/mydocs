# PowerShell attacks

Understanding the Power of PowerShell in Cyberattacks

**Excellent summary of the key points!** You have accurately highlighted the reasons why PowerShell has become a preferred tool for attackers.

Let us delve deeper into specific attack vectors and mitigation strategies:

Common PowerShell Attack Techniques:

- **Living Off the Land (LoTL):** Attackers leverage legitimate PowerShell commands and cmdlets to perform malicious actions, making it difficult to detect as it blends seamlessly with normal system activity.

- **PowerShell Empire:** A popular post-exploitation framework that uses PowerShell for command and control, lateral movement, and data exfiltration.

- **Obfuscated and Encoded Scripts:** Attackers use techniques like base64 encoding, compression, and custom character substitutions to make scripts harder to analyse.

- **PowerShell Injection:** Attackers inject malicious PowerShell commands into legitimate scripts or user input to execute unintended actions.

- **Remote PowerShell:** Attackers exploit remote PowerShell capabilities to access and control systems across a network.

Why PowerShell Execution Policies Aren't Enough:

While PowerShell execution policies are a good first step, they can be bypassed in various ways:

- **Group Policy Overrides:** Attackers can modify group policies to bypass execution policy restrictions.

- **Direct Invocation:** Running PowerShell as an administrative user can bypass execution policies.

- **Script Signing:** While script signing adds a layer of trust, it can be forged or bypassed.

- **PowerShell Bypass Techniques:** Numerous methods exist to circumvent execution policies, such as using -NonInteractive or -ExecutionPolicy Bypass flags.

Mitigating PowerShell Risks:

To effectively defend against PowerShell attacks, a multi-layered approach is essential:

- **Application Whitelisting:** Restrict executable files to a known, trusted set.

- **Intrusion Detection and Prevention Systems (IDPS):** Implement robust IDPS solutions to detect malicious PowerShell activity.

- **Network Segmentation:** Isolate critical systems and networks to limit lateral movement.

- **User Education:** Train users to be cautious of suspicious emails and attachments.

- **Regular Security Audits:** Conduct thorough security assessments to identify vulnerabilities.

- **Advanced Threat Protection (ATP):** Utilize ATP solutions to detect and block advanced attacks.

- **PowerShell Logging and Monitoring:** Implement detailed PowerShell logging and monitoring to identify suspicious activity.

- **Regular Patching:** Keep operating systems and software up-to-date with the latest patches.

**Additional Considerations:**

- **Threat Intelligence:** Stay informed about the latest PowerShell attack techniques and trends.

- **Incident Response Planning:** Develop a comprehensive incident response plan to effectively handle PowerShell-based attacks.

- **Regular Security Testing:** Conduct penetration testing and vulnerability assessments to identify weaknesses.

By combining these measures, organizations can significantly reduce the risk of PowerShell-based attacks and protect their valuable assets.

## PowerShell

PowerShell is a powerful task automation and configuration management framework from Microsoft, consisting of a command-line shell and scripting language built on the .NET Framework. It allows administrators to manage local and remote Windows systems. However, its features also make it attractive to attackers.

Why attackers love PowerShell?

- **Default Availability:** PowerShell is installed and enabled by default on Windows systems.

- **Built-in Functionality:** Attackers can leverage PowerShell's built-in capabilities to interact with the .NET Framework and Windows API, execute payloads directly in memory, download and execute code from remote systems, and perform other malicious actions without needing to install separate binaries.

- **Remote Access:** PowerShell has inherent remote access capabilities.

- **Obfuscation:** PowerShell scripts are easy to obfuscate, making them difficult to detect using signature-based methods.

- **Blending In:** Because PowerShell is commonly used by system administrators, malicious PowerShell activity can easily blend in with legitimate administrative tasks.

- **Lack of Monitoring:** Many organizations do not adequately monitor PowerShell activity, further increasing its appeal to attackers.

PowerShell Execution Policies:

It is crucial to understand that PowerShell Execution Policies are *not* a security measure. They are designed to prevent accidental script execution, not to stop malicious actors. Execution policies are easily bypassed and should not be relied upon for security.

## Detection of powershell abuses

**PowerShell Abuse Detection Methods:**

- **Process Anomalies:**

  - Suspicious PowerShell interaction with other processes

  - PowerShell without "PowerShell.exe" (e.g., renamed)

  - Suspicious PowerShell parent or child processes

- **Script Analysis:**

  - Suspicious patterns in PowerShell scripts (Script blocks, AMSI Scan buffers)

  - Obfuscation techniques

- **Security Feature Tampering:**

  - Disabling/bypassing PowerShell security features (AMSI, Script Block Logging, Constrained Language Model)

- **Execution Context:**

  - PowerShell script or interpreter in autorun

  - Suspicious patterns in PowerShell command line

- **Lateral Movement:**

  - Lateral movement with PowerShell

- **Network Activity:**

  - Suspicious PowerShell network activity

- **File System Changes:**

  - Suspicious file creation or modification by PowerShell

Event Sources to hunt for PowerShell Abuses

The image depicts a mind map summarizing event sources to hunt for PowerShell abuses.

**Key Event Logs and Sources:**

- **Windows Security Event Log:**

  - **EID 4688:** Process Creation with command line details. Crucial for seeing what commands PowerShell is executing.

  - **EID 4698:** Scheduled Task Creation. Indicates potential persistence mechanisms.

  - **EID 4702:** Scheduled Task Modification. Shows changes to existing tasks, possibly for malicious purposes.

  - **EID 7045:** Service Creation. Another persistence mechanism where PowerShell scripts might be disguised as services.

- **Windows System Event Log:**

  - **EID 7045 (Duplicate):** While listed again, it is already under Security Log. Likely an error in the image.

- **PowerShell Engine state logging (Microsoft-Windows-PowerShell/Operational):**

  - **EID 4104:** Script Block/Module Logging. Essential for seeing the actual PowerShell code executed, even if obfuscated.

  - **EID 4103:** (Not specified in detail, but likely related to logging within the PowerShell engine)

- **Windows WMI logging (Microsoft-Windows-WMI-Activity/Operational):**

  - **EID 5861:** Captures WMI (Windows Management Instrumentation) activity, which PowerShell often uses.

  - **EID 5858:** (Not specified in detail, but likely related to WMI activity)

- **Antimalware Scan Interface (AMSI/Operational):**

  - Logs from AMSI can reveal malicious PowerShell code submitted for scanning. This is a crucial source as it intercepts scripts before execution.

- **Sysmon/EDR:** (System Monitor/Endpoint Detection and Response)

  - These tools provide detailed event logging, including:

    - Process creation events

    - DLL loading events

    - Inter-process communication (memory access, remote thread creation)

    - Process network activity events

    - Registry key modification events

    - File creation/modification events

- **PowerShell ConsoleHost_history.txt:**

  - Contains command history from PowerShell consoles. Useful for post-incident analysis but can be deleted by a user.

- **Transcription Logging:**

  - PowerShell's transcription feature creates logs of all commands entered and output displayed in a console. Provides a very complete record.

**Detection Methods:**

- **Behaviour detects on PowerShell processes:** Identifying unusual PowerShell activity (e.g., suspicious parent processes, unusual API calls).

- **Signature/heuristic detects on PowerShell scripts:** Looking for known malicious code patterns or suspicious script behaviour.

- **Signature/heuristic detects on PowerShell scripts bodies, received via AMSI:** Like above, but leveraging AMSI to scan scripts before execution.

- **Signature/heuristic detects on Console Host history.txt files:** Analysing history files for malicious commands.

- **EPP (AV) detects log:** Traditional Endpoint Protection/Antivirus solutions might detect malicious PowerShell activity and log it.

**Summary:**

Hunting for PowerShell abuses requires monitoring a variety of event sources, including dedicated PowerShell logs, Windows logs, and security tools like Sysmon and EDR. Analysing process creation, script content, WMI activity, and system changes is crucial for detecting malicious PowerShell activity. Leveraging AMSI is particularly important for catching malicious scripts before they are executed. A combination of signature-based and behavioural analysis is needed to identify both known and novel threats.

**PowerShell Abuse Detection Summary:**

The graphic outlines key areas and techniques for detecting malicious PowerShell activity. It categorizes suspicious behaviors into several core areas:

**1. Suspicious Process Relationships:**

- **Suspicious Parent Processes:** PowerShell being launched by unusual or untrusted parent processes (highlighted in green).

- **Suspicious Child Processes:** PowerShell spawning suspicious or malicious child processes (highlighted in green).

- **Interaction with Other Processes:** PowerShell interacting with unrelated processes in a suspicious manner (highlighted in green).

**2. Anomalous PowerShell Execution:**

- **"PowerShell without PowerShell.exe":** Executing PowerShell code without using the standard powershell.exe executable (highlighted in green).

- **Renamed PowerShell:** Renaming the powershell.exe executable to try and evade detection (highlighted in green).

**3. Suspicious Code and Patterns:**

- **Suspicious Patterns in Command Lines:** Unusual or malicious keywords, parameters, or encoded commands within PowerShell command lines (highlighted in green).

- **Suspicious Patterns in Scripts:** Obfuscated code, use of specific keywords indicative of malicious intent, or manipulation of the Anti-Malware Scan Interface (AMSI) within PowerShell scripts (highlighted in green).

- **Obfuscation:** Techniques used to hide the true intent of PowerShell code, making it difficult to analyze.

**4. Security Feature Evasion:**

- **Disabling/Bypassing Security Features:** Attempts to disable or circumvent key PowerShell security features like AMSI, Script Block Logging, and Constrained Language Mode.

**5. Lateral Movement and Persistence:**

- **Lateral Movement with PowerShell:** Using PowerShell to spread malware or gain access to other systems on a network.

- **PowerShell Script/Interpreter in Autorun:** Setting PowerShell scripts to run automatically at startup to maintain persistence.

**6. File System Manipulation:**

- **Suspicious Files Creation/Modification:** PowerShell creating or modifying files in unusual or sensitive locations.

- **PowerShell script/interpreter in autorun:** Setting PowerShell scripts to run automatically at startup to maintain persistence.

<!-- -->

- **Network Communication:** Suspicious network connections initiated by PowerShell, such as command and control (C2) communication.

- **Registry Manipulation:** PowerShell modifying registry keys for persistence or malicious purposes.

- **WMI (Windows Management Instrumentation) Abuse:** PowerShell using WMI for malicious activities like remote execution or data exfiltration.

By incorporating these suggestions, the graphic can become an even more comprehensive and effective tool for understanding and detecting PowerShell abuse.

## Suspicious PowerShell parent process

The phrase "Suspicious PowerShell parent process" refers to the detection of PowerShell being launched by an unusual or potentially malicious parent process. This is a significant indicator of potential PowerShell abuse because malware often leverages legitimate tools like PowerShell, but disguises its activity by initiating them from unexpected or compromised parent processes.

**Why is this suspicious?**

Legitimate use of PowerShell usually originates from expected sources like:

- **User directly running PowerShell:** Typing powershell.exe in the console or using the Start Menu.

- **Administrative tools:** Scripts or applications designed for system management.

- **Installation processes:** Software installers might use PowerShell for configuration.

**However, malicious actors can exploit these scenarios:**

- **Compromised Applications:** Attackers might inject malicious code into applications (like Microsoft Office or PDF readers) so they launch PowerShell to execute malicious payloads when a document is opened.

- **Exploiting Vulnerabilities:** Vulnerabilities in applications (browsers, server software) can be used to trigger PowerShell with malicious arguments.

- **Social Engineering:** Users might be tricked into running seemingly harmless files (macros, scripts) that in turn launch PowerShell surreptitiously.

**The provided table gives examples of this:**

- **Microsoft Office App / PDF Reader:** If PowerShell is launched as a child process of these applications, it could indicate malicious macros or exploit attempts.

- **Browsers:** PowerShell spawned by a browser might signal a web shell or a browser exploit.

- **Server Applications:** Unexpected PowerShell activity from server applications could indicate a compromise or an attempt to leverage vulnerabilities.

**In summary, detecting suspicious PowerShell parent processes is a crucial part of security monitoring, as it can reveal hidden malicious activity that abuses a legitimate tool.** It involves analysing process relationships and identifying unusual or unauthorized processes initiating PowerShell.

amigo.exe

browser.exe

chrome.exe

excel.exe

firefox.exe

httpd.exe

iexplore.exe

jbosssvc.exe

microsoftedge.exe

microsoftedgecp.exe

MicrosoftEdgeSH.exe

msaccess.exe

mshta.exe

mspub.exe

nginx.exe

outlook.exe

php-cgi.exe

powerpnt.exe

regsvr32.exe

rundll32.exe

safari.exe

services.exe

sqlagent.exe

sqlserver.exe

sqlservr.exe

tomcat

visio.exe

vivaldi.exe

w3wp.exe

winword.exe

wmiprvse.exe

## PowerShell PenTest Frameworks

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

Search for commandlet and function names from well-known PowerShell offensive frameworks in PowerShell command lines and script blocks:

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

# PowerShell 

Here is a **corrected and summarized version** of your content on **PowerShell Abuse in Azure Windows VM Penetration Testing**:

**Azure Windows VM – PowerShell in Penetration Testing**

**Overview of PowerShell**

- A **task automation and configuration management framework** developed by Microsoft.

- Consists of a **command-line shell** and a **powerful scripting language**.

- Built on the **.NET Framework**, enabling deep integration with Windows internals.

- Used to administer **local and remote systems**, making it ideal for both defenders and attackers.

------------------------------------------------------------------------

**Why Attackers Love PowerShell**

- ✅ **Pre-installed and enabled by default** on all modern Windows systems.

- ✅ Can perform most attack logic **without dropping binaries** (in-memory execution).

- ✅ Integrates with the **.NET and Windows API**, allowing advanced operations like:

  - Memory injection

  - Fileless payload execution

  - Download and execution of remote scripts

- ✅ **Remote access features** (e.g., Invoke-Command, New-PSSession) are built-in.

- ✅ Scripts are easily **obfuscated**, making detection by signature-based tools difficult.

- ✅ **Trusted by administrators**, making PowerShell abuse blend with legitimate usage.

- ❌ **Most organizations don’t monitor PowerShell logs** (e.g., Module/ScriptBlock logging).

- ❌ **Execution Policy is not a security control** — it can be bypassed easily:

  - -ExecutionPolicy Bypass, Unrestricted, or encoded command flags

  - Its purpose is to prevent accidental script execution, not malicious use.

**PowerShell Abuse Detection**

- Monitor:

  - **Encoded commands** (-enc, -e)

  - **Unusual child processes** (e.g., PowerShell spawning cmd.exe, mshta.exe)

  - **ScriptBlock and Module logging**

  - **Network connections from PowerShell**

------------------------------------------------------------------------

**Common PowerShell Abuse Patterns**

- Fileless execution of malware (e.g., encoded shellcode)

- Living-off-the-land attacks (e.g., using PowerShell to control Windows Defender)

- Credential dumping (e.g., using Invoke-Mimikatz)

- Lateral movement and remote access

------------------------------------------------------------------------

**Well-Known PowerShell Offensive Frameworks**

- **PowerSploit** – Post-exploitation and memory injection modules

- **PowerCat** – Netcat-like reverse shell over PowerShell

- **Empire** – Full-fledged C2 framework using PowerShell

- **DarkObserver** – PowerShell RAT with evasion capabilities

- **PowerMemory** – Memory manipulation and credential theft

- **Invoke-Mimikatz / Invoke-Mimikittenz** – Credential dumping

- **Offensive-PowerShell** – Collection of offensive PowerShell scripts

- **Kautilya / Nishang** – Offensive scripts for USB drops and payload delivery

- **PoshRat / PowerShell Suite** – Post-exploitation frameworks

- **OWA-Toolkit** – Exploitation of Exchange Outlook Web Access

- **Sherlock** – Local privilege escalation vulnerability scanner

- **Invoke-Phant0m** – Kill Windows Event Log process to evade detection

------------------------------------------------------------------------

Let me know if you'd like a mapped detection matrix for these tools using Defender for Endpoint or Microsoft Sentinel KQL queries.

Here is a **corrected and summarized version** of your content on **PowerShell Framework Hunting in Azure Windows VM Penetration Testing**:

------------------------------------------------------------------------

**Azure Windows VM – Hunting PowerShell-Based Attacks**

------------------------------------------------------------------------

**🎯 Goal: Detect Well-Known PowerShell Offensive Frameworks**

Search for **suspicious PowerShell commandlets and function names** from commonly used attack frameworks in:

- **PowerShell command lines**

- **Script blocks**

- **Event logs (e.g., 4104 - ScriptBlock Logging)**

**Indicators of PowerShell Offense Tool Usage**

Look for any of the following functions commonly used in offensive frameworks like PowerSploit, Empire, Nishang, etc.:

- Get-GPPPassword – Group Policy preference password extraction

- Get-Keystrokes – Keylogging

- Get-MicrophoneAudio – Microphone recording

- Get-ModifiablePath – Searches for vulnerable file paths

- Get-TimedScreenshot – Periodic screenshot capture

- Invoke-AllChecks – Full system enumeration (PowerUp/WinPEAS-like)

- Invoke-AmsiBypass – AMSI bypass to evade detection

- Invoke-DllInjection – DLL injection into remote processes

- Invoke-Mimikatz – Credential dumping via Mimikatz

- Invoke-NinjaCopy – Copy locked files (like SAM or NTDS)

- Invoke-PsUACme – UAC bypass techniques

- Invoke-ReflectivePEInjection – Inject EXEs directly into memory

- Invoke-Shellcode – Execute raw shellcode in memory

- PowerUp – Privilege escalation checks and exploits

- PowerView – AD enumeration and attack tool

------------------------------------------------------------------------

**🚩 Suspicious PowerShell Parent Processes**

PowerShell launched **from or by unusual processes** is highly suspicious in most enterprise environments, especially if unrelated to legitimate scripting or automation tools.

**Common Suspicious Parent Processes:**

- Web browsers: chrome.exe, firefox.exe, iexplore.exe, edge.exe, safari.exe, vivaldi.exe

- Office apps: winword.exe, excel.exe, outlook.exe, powerpnt.exe, visio.exe, msaccess.exe, mspub.exe

- Web servers and services: w3wp.exe, httpd.exe, nginx.exe, php-cgi.exe, tomcat, jbosssvc.exe

- Scripting engines and interpreters: mshta.exe, regsvr32.exe, rundll32.exe

- SQL services: sqlservr.exe, sqlserver.exe, sqlagent.exe

- Background/system: services.exe, wmiprvse.exe, MicrosoftEdgeSH.exe, MicrosoftEdgeCP.exe

- Unknown/untrusted: amigo.exe, browser.exe

------------------------------------------------------------------------

**✅ Recommended Detection Actions:**

- Use **PowerShell ScriptBlock Logging** (Event ID 4104) and **Module Logging** to capture suspicious usage.

- Monitor **parent-child process relationships** (e.g., winword.exe → powershell.exe).

- Apply **Defender for Endpoint** or **Microsoft Sentinel KQL queries** to hunt for these patterns.

- Combine with threat intelligence (e.g., YARA/Sigma rules) to flag known attack signatures.
