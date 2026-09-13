

## Intrusion Vectors

Initial Access involves techniques that adversaries use to gain a foothold within an Azure environment. These methods include brute force, valid credential use, and exploitation of public-facing or vulnerable applications.

------------------------------------------------------------------------

**🔹 1. Credential-Based Access**

**✅ 1.1. Brute Force Attacks**

- **Description**: Attempting logins on exposed Azure services using
  password guessing or spraying techniques.

- **Targets**:

  - Azure-exposed VPNs

  - RDP endpoints

  - Microsoft Exchange Autodiscover (vulnerable configuration)

- **TTPs**:

  - **T1110.001** – *Brute Force: Password Guessing*

  - **T1110.003** – *Brute Force: Password Spraying*

  - **T1190** – *Exploit Public-Facing Application* (Autodiscover
    Exploit)

------------------------------------------------------------------------

**✅ 1.2. Use of Valid Accounts**

- **Description**: Logging in using known or previously compromised
  legitimate credentials.

- **Targets**:

  - Azure-based VPNs and RDP endpoints

  - Microsoft 365 / Azure AD accounts

- **TTPs**:

  - **T1078.003** – *Valid Accounts: Local Accounts*

  - **T1078.004** – *Valid Accounts: Cloud Accounts*

------------------------------------------------------------------------

**🔹 2. Exploitation of Public-Facing Applications**

**✅ 2.1. Vulnerability Exploitation**

- **Description**: Direct exploitation of known CVEs in public-facing
  services to gain unauthorized access.

- **Examples**:

  - **ProxyLogon (CVE-2021-27065)**: Used against Exchange Servers.

  - **Fortinet VPN (CVE-2018-13379)**: Credential theft via path
    traversal vulnerability.

  - **SQL Injection**: Injecting malicious SQL queries into exposed web
    applications hosted in Azure.

- **TTPs**:

  - **T1190** – *Exploit Public-Facing Application*

------------------------------------------------------------------------

**✅ Summary Table: Azure Cloud Initial Access Techniques**

| **Category** | **Technique / Exploit** | **MITRE ATT&CK ID** | **Description / Target** |
|----|----|----|----|
| Brute Force | Password Guessing | T1110.001 | Guessing passwords on RDP, VPN, Exchange endpoints |
| Brute Force | Password Spraying | T1110.003 | Spraying common passwords across multiple accounts |
| Valid Credentials | Use of Local Accounts | T1078.003 | Logging in with known local credentials via VPN/RDP |
| Valid Credentials | Use of Cloud Accounts | T1078.004 | Azure AD / O365 login with compromised credentials |
| Public Exploitation | ProxyLogon (CVE-2021-27065) | T1190 | Exchange vulnerability exploited to gain access |
| Public Exploitation | Fortinet VPN (CVE-2018-13379) | T1190 | FortiOS path traversal vulnerability for credential theft |
| Web Exploitation | SQL Injection | T1190 | Malicious SQL queries in exposed Azure web apps |

------------------------------------------------------------------------

Let me know if you'd like to extend this with **Azure-native attack
surfaces** like:

- Azure Management API exploitation,

- Azure Function abuse,

- Token replay/credential stuffing,

- Azure AD misconfigurations.

I can also add **PowerShell/CLI commands, tools (e.g., AADInternals,
ROADtools),** or **real-world threat actor mappings** next.

# Malicious Code

Here is a **corrected, categorized, summarized, rewritten**, and
**deduplicated** version of your content on **Malicious Code & Payload
Execution** as part of **Initial Access in Azure Cloud Penetration
Testing**, structured with relevant MITRE ATT&CK references and
appropriate context.

------------------------------------------------------------------------

**💻 Malicious Code Execution in Azure Cloud Penetration Testing**

Malware deployment is a key part of gaining persistence or executing
post-access operations after the initial foothold in an Azure cloud
environment. Threat actors commonly deploy command-and-control (C2)
agents and custom malicious code once credentials or remote access is
achieved.

------------------------------------------------------------------------

**🔹 1. Malware Deployment for Command & Control**

**✅ 1.1. Cobalt Strike Beacon**

- **Description**: The Cobalt Strike Beacon is a widely used
  post-exploitation tool for establishing C2 communications. It allows
  execution of arbitrary commands, lateral movement, and credential
  theft.

- **Context**:

  - Deployed post-compromise, often following valid credential use or
    exploitation of a public-facing application.

  - Can operate over HTTPS or DNS tunnels to evade detection in Azure
    environments.

- **TTPs**:

  - **T1055.012** – *Process Injection: PowerShell*

  - **T1105** – *Ingress Tool Transfer*

  - **T1071.001** – *Application Layer Protocol: Web Protocols (HTTPS
    C2)*

  - **T1059.001** – *Command and Scripting Interpreter: PowerShell*

------------------------------------------------------------------------

**🔹 2. Custom Malicious Tools**

**✅ 1.2. Threat Actor-Specific Toolsets**

- **Description**: Threat groups often deploy custom malware tailored
  for persistence, reconnaissance, and privilege escalation in hybrid
  environments, including Azure VMs and services.

- **Examples**:

  - Dropper scripts embedded in Office macros or user-initiated
    downloads

  - Malware adapted to target Azure-integrated endpoints or services

  - Payloads hosted on compromised or attacker-controlled Azure Blob
    Storage

- **TTPs**:

  - **T1204.002** – *User Execution: Malicious File*

  - **T1505.003** – *Server Software Component: Web Shell*

  - **T1566.001** – *Phishing: Spearphishing Attachment*

------------------------------------------------------------------------

**✅ Summary Table: Malicious Code & Payload Deployment in Azure**

| **Category** | **Technique / Tool Used** | **MITRE ATT&CK ID(s)** | **Description / Notes** |
|----|----|----|----|
| Malware Payload | Cobalt Strike Beacon | T1055.012, T1105, T1071.001 | Used for C2, post-access exploitation, persistence in Azure VMs or endpoints |
| Malicious Files | Custom Threat Actor Malware | T1204.002 | Tailored malware for privilege escalation, Azure reconnaissance |
| Web Shells | Server Component Installation | T1505.003 | Web shells deployed on Azure App Services or exposed VMs |
| Phishing Vector | Spearphishing Attachment | T1566.001 | Malware-laden documents leading to initial code execution |

------------------------------------------------------------------------

Would you like this extended with:

- **Detection rules** for Microsoft Defender for Cloud,

- **YARA/sigma rules for Cobalt Strike on Azure VMs**, or

- **Automation of malware delivery simulation in an Azure test lab**?

Let me know if you want the full **Appendix A.1** of tools or sample
payloads recreated for training.

# Persistence

Here is the **categorized, corrected, summarized, rewritten, and
deduplicated** version of your content on **Persistence Techniques in
Azure Cloud Penetration Testing**, structured professionally with
**MITRE ATT&CK mappings** and use-case relevance for Azure environments.

------------------------------------------------------------------------

**🛡️ Persistence Techniques in Azure Cloud Penetration Testing**

Persistence ensures that attackers can maintain long-term access to
compromised Azure resources. In Azure environments, this can involve
abusing scheduled tasks, creating accounts, leveraging valid
credentials, and deploying backdoors like web shells.

------------------------------------------------------------------------

**🔹 1. Scheduled Task Persistence (Windows-based Azure VMs)**

**✅ 1.1. Scheduled Tasks Execution**

- **Description**: Attackers create or modify scheduled tasks on
  Azure-hosted Windows VMs to execute malware at specific intervals or
  system events.

- **Observed Examples**:

  - Task names like test, chkdsksvc, Microsoft Helps Center, etc., were
    used to disguise malicious jobs.

  - Task paths such as \Windows\System32\Tasks\Microsoft\Windows\\NET
    Framework\\NET Framework NGEN v4.0.30319 x64

- **TTP**:

  - **T1053.005** – *Scheduled Task/Job: Scheduled Task*

------------------------------------------------------------------------

**🔹 2. Account Abuse & Creation**

**✅ 1.2. Use of Valid and Default Accounts**

- **Description**: Reuse or abuse of existing privileged accounts—either
  local, domain, or default accounts—to maintain access.

- **Azure-Relevant Scenarios**:

  - Persistence via cloud (Azure AD) or hybrid accounts

  - Use of pre-existing accounts on IaaS virtual machines
    (Windows/Linux)

- **TTPs**:

  - **T1078.001** – *Valid Accounts: Default Accounts*

  - **T1078.002** – *Valid Accounts: Domain Accounts*

  - **T1078.003** – *Valid Accounts: Local Accounts*

  - **T1133** – *External Remote Services* (e.g., RDP, SSH, VPN with
    valid credentials)

**✅ 1.3. Creation of Mimic Accounts**

- **Description**: Attackers create fake accounts (in AD or locally)
  resembling legitimate users or services to evade detection.

- **TTP**:

  - **T1136.002** – *Create Account: Domain Account*

------------------------------------------------------------------------

**🔹 3. Backdoor Persistence via Web Shells**

**✅ 1.4. Web Shell Deployment**

- **Description**: After compromising an Azure-hosted web server (e.g.,
  IIS on a VM or Azure App Service), attackers deploy web shells to
  maintain remote access.

- **TTP**:

  - **T1505.003** – *Server Software Component: Web Shell*

------------------------------------------------------------------------

**✅ Summary Table: Persistence Techniques in Azure Cloud PenTest**

| **Category** | **Technique** | **MITRE ATT&CK ID** | **Description / Use Case** |
|----|----|----|----|
| Scheduled Task Jobs | Scheduled Task | T1053.005 | Malicious tasks scheduled on Azure VMs to execute malware |
| Valid Accounts | Use of Default/Local/Domain Accounts | T1078.001 / .002 / .003 | Reusing valid or default credentials for persistent access |
| Remote Access | External Remote Services | T1133 | Access via RDP/SSH/VPN with valid credentials |
| Account Creation | Domain Account Creation | T1136.002 | Creating fake privileged accounts in AD or local systems |
| Web Shell Backdoors | Web Shell Deployment | T1505.003 | Dropping persistent web shells on Azure VMs or web apps |

------------------------------------------------------------------------

Would you like to follow up with:

- **Detection logic using Microsoft Defender for Endpoint or Defender
  for Cloud?**

- **Azure-specific persistence techniques (e.g., Service Principal
  backdooring, Azure Automation abuse)?**

- **Scripts or examples of scheduled task creation via PowerShell in an
  Azure VM context?**

Let me know and I’ll build the next section.

# Privilege Escalation

Here's a **cleaned-up, categorized, corrected, summarized, and
deduplicated version** of your section on **Privilege Escalation in
Azure Cloud PenTest**, based on the techniques and observations
provided:

------------------------------------------------------------------------

**🔐 Privilege Escalation Techniques in Azure Cloud Penetration
Testing**

Privilege escalation involves gaining higher-level permissions on a
system or service, typically moving from a limited user account to
SYSTEM or domain admin levels. Below are common techniques and
associated tactics used during Azure-based Windows VM penetration
testing.

------------------------------------------------------------------------

**1. Exploitation-Based Privilege Escalation**

**Description:**\
The attacker exploits **CVE-2021-26885**, a vulnerability in the
**Windows WalletService** application, to escalate privileges. This is
followed by the use of **Juicy Potato**, a well-known privilege
escalation tool, to impersonate privileged tokens and execute commands
as **NT AUTHORITY\SYSTEM**.

**Example Tools & Exploits:**

- **Juicy Potato** for token impersonation

- **CVE-2021-26885** vulnerability exploit

**MITRE ATT&CK Mapping:**

| **Phase** | **ATT&CK ID** | **Technique** | **Description** |
|----|----|----|----|
| Privilege Escalation | T1068 | Exploitation for Privilege Escalation | Exploiting local privilege escalation flaws |
| Privilege Escalation | T1134.005 | Access Token Manipulation: SID-History Injection | Abuse of SID-History to escalate privileges |

------------------------------------------------------------------------

**2. Credential Access via Memory Dumping**

**Description:**\
The attacker leverages a **LOLBin** technique by calling comsvcs.dll via
rundll32.exe to dump the memory of LSASS. This memory dump is then
analyzed to extract credentials, including plaintext passwords and
cached domain credentials.

**Observed Command:**

powershell -c "rundll32.exe C:\Windows\System32\comsvcs.dll, MiniDump
624 C:\Windows\Temp\log.txt"

**Targeted Process:**

- LSASS.exe — stores credentials and hashes

**MITRE ATT&CK Mapping:**

| **Phase** | **ATT&CK ID** | **Technique** | **Description** |
|----|----|----|----|
| Credential Access | T1003.001 | OS Credential Dumping: LSASS Memory | Dumping LSASS memory to extract credentials |
| Credential Access | T1003.005 | OS Credential Dumping: Cached Domain Credentials | Extracting stored domain credentials from memory |

------------------------------------------------------------------------

**✅ Summary of Key Tools and Techniques**

| **Tool/Method** | **Purpose** |
|----|----|
| **Juicy Potato** | Token impersonation to escalate to SYSTEM |
| **comsvcs.dll** via rundll32.exe | Dump LSASS memory for credential extraction |
| **CVE-2021-26885** | Local privilege escalation exploit on vulnerable Windows systems |

------------------------------------------------------------------------

Let me know if you'd like this formatted as a markdown or docx report
for your Azure pentest documentation.

# Evasion Methods

Here's the **cleaned-up, categorized, summarized, rewritten, and
deduplicated** version of the section on **Evasion Methods in Azure
Cloud Penetration Testing**, with ATT&CK mappings and descriptions for
professional reporting or red team documentation:

------------------------------------------------------------------------

**🛡️ Evasion Techniques in Azure Cloud Penetration Testing**

Adversaries use various **defense evasion** methods to avoid detection
by firewalls, antivirus solutions, endpoint detection tools, and SIEM
systems in Azure environments. These techniques are especially relevant
when operating within Azure-hosted Windows VMs or hybrid infrastructure.

------------------------------------------------------------------------

**1. Firewall Rule Manipulation**

**Description:**\
Attackers add or modify **firewall rules** on the victim machine to
allow outbound connections to command and control infrastructure. To
remain stealthy, they **masquerade the rule names** as legitimate system
or application processes (e.g., Xbox Game Center).

**Examples:**

- Adding custom allow rules for outbound connections

- Naming firewall rules after trusted applications

**MITRE ATT&CK Mapping:**

| **Phase** | **ATT&CK ID** | **Technique** | **Description** |
|----|----|----|----|
| Defense Evasion | T1036.005 | Masquerading: Match Legitimate Name or Location | Spoof firewall rule names to look like trusted apps |
| Defense Evasion | T1562.004 | Impair Defenses: Disable or Modify System Firewall | Add or alter firewall rules to enable C2 communication |

------------------------------------------------------------------------

**2. Windows Defender Evasion via Exclusion Rules**

**Description:**\
Adversaries add **Windows Defender exclusion paths** to bypass antivirus
scanning of malicious tools or working directories. This is commonly
done through PowerShell commands.

**Example Command:**

Add-MpPreference -ExclusionPath 'C:\Windows\Temp'

**MITRE ATT&CK Mapping:**

| **Phase** | **ATT&CK ID** | **Technique** | **Description** |
|----|----|----|----|
| Defense Evasion | T1562.001 | Impair Defenses: Disable or Modify Tools | Modify AV settings to exclude directories from scanning |

------------------------------------------------------------------------

**3. File Deletion and Artifact Cleanup**

**Description:**\
The attacker deletes temporary files, tools, and logs after execution to
minimize forensic artifacts. This is typically used post-exploitation to
evade host-based detection and investigation.

**Examples:**

- Deleting custom scripts or payloads after execution

- Removing logs or dump files from Temp folders

**MITRE ATT&CK Mapping:**

| **Phase** | **ATT&CK ID** | **Technique** | **Description** |
|----|----|----|----|
| Defense Evasion | T1070.004 | Indicator Removal on Host: File Deletion | Delete payloads and evidence to erase activity traces |

------------------------------------------------------------------------

**4. Masquerading of Tools, Services, and Hostnames**

**Description:**\
Adversaries rename binaries or services to mimic legitimate processes or
match internal naming conventions (e.g., using perfmon.exe, or renaming
a compromised host to match existing network hostnames).

**Techniques Observed:**

- Renaming services to appear legitimate

- Matching hostnames to victim's naming conventions

**MITRE ATT&CK Mapping:**

| **Phase** | **ATT&CK ID** | **Technique** | **Description** |
|----|----|----|----|
| Defense Evasion | T1036.004 | Masquerading: Masquerade Task or Service | Name malware or tools after trusted services like perfmon.exe |
| Defense Evasion | T1036.005 | Masquerading: Match Legitimate Name or Location | Impersonate valid machine naming conventions |

------------------------------------------------------------------------

**✅ Summary Table of Azure Evasion Tactics**

| **Technique** | **Tool/Method** | **ATT&CK ID** | **Purpose** |
|----|----|----|----|
| Firewall Rule Spoofing | Windows Firewall | T1036.005 / T1562.004 | Allow outbound traffic and masquerade rule names |
| Defender Exclusion Path | PowerShell (Add-MpPreference) | T1562.001 | Bypass antivirus scanning |
| File/Log Deletion | Manual or script | T1070.004 | Remove attack evidence |
| Masquerading Names | Legitimate-looking binaries/services | T1036.004 / T1036.005 | Blend in with trusted system components |

# Discovery

Here is the **cleaned-up, categorized, corrected, summarized, and
deduplicated** version of your section on **Discovery Techniques in
Azure Cloud Penetration Testing**, structured with clear ATT&CK mappings
and professional phrasing:

------------------------------------------------------------------------

**🔍 Discovery Techniques in Azure Cloud Penetration Testing**

During Azure-based intrusions, attackers—such as **APT31**—frequently
rely on **native Windows tools** and **lightweight reconnaissance
utilities** to map the target environment, identify active services,
enumerate user accounts, and discover other networked machines. This
helps them avoid detection and minimize noise.

------------------------------------------------------------------------

**1. Process Discovery**

**Description:**\
The attacker uses the built-in tasklist command to enumerate all running
processes on the compromised host. This allows the identification of
security tools, system services, and potentially exploitable
applications.

**Command Used:**

tasklist

**MITRE ATT&CK Mapping:**

| **Phase** | **ATT&CK ID** | **Technique** | **Description** |
|----|----|----|----|
| Discovery | T1057 | Process Discovery | Enumerate running processes using native tools |

------------------------------------------------------------------------

**2. Network Connection Discovery**

**Description:**\
netstat is used to gather details about active connections, listening
ports, and connected remote systems. This provides insight into services
in use and possible C2 or lateral movement paths.

**Command Used:**

netstat -ano

**MITRE ATT&CK Mapping:**

| **Phase** | **ATT&CK ID** | **Technique** | **Description** |
|----|----|----|----|
| Discovery | T1049 | System Network Connections Discovery | Identify active connections and listening services |

------------------------------------------------------------------------

**3. Network Service Scanning**

**Description:**\
Attackers probe the environment for open ports and services like **RDP,
SMB, and LDAP**. This helps identify lateral movement opportunities or
systems with exposed authentication mechanisms.

**Example Tools/Methods:**

- Native port scanning via PowerShell

- Custom scripts or utilities for RDP/SMB discovery

**MITRE ATT&CK Mapping:**

| **Phase** | **ATT&CK ID** | **Technique** | **Description** |
|----|----|----|----|
| Discovery | T1046 | Network Service Scanning | Scan internal hosts for exposed services like RDP, SMB, LDAP |

------------------------------------------------------------------------

**4. Account Discovery (via Net Commands)**

**Description:**\
Basic enumeration using the net command reveals local and domain user
accounts, shared resources, and trust relationships.

**Command Examples:**

net user

net group

net localgroup administrators

**MITRE ATT&CK Mapping:**

| **Phase** | **ATT&CK ID** | **Technique** | **Description** |
|----|----|----|----|
| Discovery | T1087.002 | Account Discovery: Domain Account | Enumerate domain-level users using native tools |

------------------------------------------------------------------------

**5. Active Directory Enumeration via ADExplorer**

**Description:**\
APT31 uses **Active Directory Explorer (ADExplorer)** to extract
detailed information about domain users, groups, computers, and
policies. This tool enables in-depth exploration of the AD structure.

**Tool Used:**

- **Sysinternals ADExplorer**

**MITRE ATT&CK Mapping:**

| **Phase** | **ATT&CK ID** | **Technique** | **Description** |
|----|----|----|----|
| Discovery | T1087.001 | Account Discovery | Enumerate accounts and groups in AD using specialized tools |

------------------------------------------------------------------------

**✅ Summary Table of Discovery Techniques in Azure PenTest**

| **Tool/Command** | **Purpose** | **ATT&CK ID** | **Technique Description** |
|----|----|----|----|
| tasklist | List running processes | T1057 | Process Discovery |
| netstat | View open connections and ports | T1049 | System Network Connections Discovery |
| net user, net group | List domain/local accounts | T1087.002 | Account Discovery: Domain Account |
| Port scan (RDP/SMB/LDAP) | Find exposed services | T1046 | Network Service Scanning |
| ADExplorer | Explore Active Directory structure | T1087.001 | Account Discovery via Directory Tools |

------------------------------------------------------------------------

Let me know if you want this converted into Markdown, PDF, or Word
format for use in a formal pentest report or methodology guide.

# Lateral Movement

Here's a cleaned, corrected, categorized, summarized, and rewritten
version of the content on **Lateral Movement in Azure Cloud Penetration
Testing** with duplicates removed and structure improved:

------------------------------------------------------------------------

**Azure Cloud PenTest – Lateral Movement**

**Overview:**\
Lateral movement techniques allow attackers to pivot between systems
within a compromised Azure or hybrid environment. APT31 has demonstrated
lateral movement using a combination of native Windows protocols and
services, often impersonating legitimate local accounts to evade
detection.

------------------------------------------------------------------------

**Techniques Used**

| **Tactic** | **MITRE ATT&CK ID** | **Technique** | **Description** |
|----|----|----|----|
| Lateral Movement | T1021.001 | Remote Services: Remote Desktop (RDP) | Used to access systems interactively using stolen credentials of local accounts. |
| Lateral Movement | T1021.002 | Remote Services: SMB/Windows Admin Shares | Used to access file shares or admin shares to move tools or payloads laterally. |
| Lateral Movement | T1570 | Lateral Tool Transfer | Transfers malware/tools via SMB, FTP, or other shared resources. |
| Lateral Movement | T1210 | Exploitation of Remote Services | Exploits vulnerabilities in exposed or internal services for lateral access. |

------------------------------------------------------------------------

**Protocols Observed in Use**

- **Remote Desktop Protocol (RDP)**

  - Used for interactive login with local credentials.

  - Often abused in environments with exposed or weak RDP policies.

- **Server Message Block (SMB)**

  - Utilized for payload/tool transfer and accessing admin shares.

  - Exploited for privilege escalation and movement using psexec,
    wmiexec, etc.

- **File Transfer Protocol (FTP)**

  - Leveraged for transferring custom tools or payloads.

  - Indicates use of legacy or weakly secured services.

------------------------------------------------------------------------

**Adversary Tradecraft Summary (APT31 Case Study)**

- **Masquerading:**\
  APT31 frequently uses legitimate **local accounts** for accessing
  remote services and transferring tools, which helps them blend in with
  normal administrative operations.

- **Tool Delivery:**\
  Tool transfer is often achieved using SMB or FTP in combination with
  command-line utilities and scripts.

- **Remote Exploitation:**\
  Exploitation of vulnerable remote services facilitates initial lateral
  footholds before credential-based movements are initiated.

------------------------------------------------------------------------

**Defensive Recommendations**

- **Monitor** for unusual use of RDP, SMB, and FTP, especially involving
  local accounts.

- **Implement Network Segmentation** to limit east-west traffic within
  Azure VNets and hybrid networks.

- **Use Just-In-Time (JIT) VM Access** to reduce RDP exposure.

- **Deploy EDR/SIEM Rules** for ATT&CK T1021.\*, T1570, and T1210
  behaviors.

- **Enforce MFA** for all remote access paths.

- **Audit Local Accounts** and restrict their use where possible.

------------------------------------------------------------------------

Let me know if you want this turned into a professional PDF report, red
team simulation exercise, or KQL detection rules for Microsoft Sentinel.

# Data Collection

Here is a corrected, summarized, de-duplicated, categorized, and
rewritten version of the content on **Data Collection during Azure Cloud
Penetration Testing**, based on observed TTPs (Tactics, Techniques, and
Procedures):

------------------------------------------------------------------------

**Azure Cloud PenTest – Data Collection Phase**

**Overview:**\
In the data collection phase of an Azure penetration test, attackers
attempt to gather sensitive information such as system configuration,
registry values, and user emails. APT31, for instance, has demonstrated
use of native tools and third-party utilities like WinRAR to collect and
prepare data for exfiltration.

------------------------------------------------------------------------

**Techniques Used for Data Collection**

| **Tactic** | **MITRE ATT&CK ID** | **Technique** | **Description** |
|----|----|----|----|
| Collection | T1005 | Data from Local System | Registry keys and system configuration files are collected for host profiling. |
| Collection | T1114.001 | Email Collection: Local Email Collection | Emails are extracted from local clients such as Outlook or Windows Mail. |
| Collection | T1560.001 | Archive Collected Data: Archive via Utility | Collected data is compressed using tools like **WinRAR** for staging and exfil. |

------------------------------------------------------------------------

**Observed Adversary Behaviors (APT31 Case Study)**

- **Registry & System Data Collection:**\
  APT31 targets local system data, particularly Windows Registry
  entries, to gain insight into host configuration and user activity.

- **Email Harvesting:**\
  Local email clients are accessed to collect inbox contents, possibly
  targeting credentials, communications, and attachments.

- **Data Archiving with WinRAR:**\
  Prior to exfiltration, sensitive data is often compressed into .rar
  files using the WinRAR utility, which reduces file size and may help
  evade detection.

------------------------------------------------------------------------

**Defensive Recommendations**

- **Monitor File Compression Activity:**\
  Alert on unusual use of tools like WinRAR or creation of .rar files on
  critical systems.

- **Restrict Access to Email Clients & Registry:**\
  Limit access permissions and monitor processes accessing email stores
  and registry keys.

- **Implement DLP Controls:**\
  Use Azure Information Protection and Microsoft Purview to flag or
  block sensitive data movement.

- **Enable Logging:**\
  Ensure Windows Event Logging, Microsoft Defender for Endpoint, and
  Azure Audit Logs are capturing data access and archiving behaviors.

- **Use Endpoint Detection Rules:**\
  Detect T1005, T1114.001, and T1560.001 using Defender for Endpoint or
  Microsoft Sentinel with appropriate KQL queries.

------------------------------------------------------------------------

Let me know if you'd like a detection matrix, YAML-based Sigma rules, or
Microsoft Sentinel KQL queries based on these techniques.

# Exfiltration

Here's a clean, categorized, corrected, summarized, and rewritten
version of the **Exfiltration during Azure Cloud PenTest** content with
duplicates removed and clear formatting:

------------------------------------------------------------------------

**Azure Cloud PenTest – Data Exfiltration**

**Overview:**\
During the exfiltration phase, adversaries like APT31 extract sensitive
user databases, emails, and business-critical data from compromised
environments. They use several methods to stealthily move data out,
including abuse of Microsoft Exchange accounts, DNS protocol, and SMB
file sharing.

------------------------------------------------------------------------

**Exfiltration Techniques and Procedures**

| **Phase** | **MITRE ATT&CK ID** | **Technique Name** | **Description / Comments** |
|----|----|----|----|
| Exfiltration | T1048.003 | Exfiltration Over Alternative Protocol: Obfuscated Non-C2 Protocol | Uses DNS and SMB protocols for covert data exfiltration channels. |
| Exfiltration | T1567 | Exfiltration Over Web Service | Data exfiltration leveraging Microsoft Exchange web services. |
| Defense Evasion | T1078.003 | Valid Accounts: Local Accounts | Uses forged or masqueraded local accounts such as HealthMailbox accounts. |

------------------------------------------------------------------------

**Observed Adversary Tactics (APT31 Case Study)**

1.  **Exchange Account Creation and Impersonation:**

    - Creates specially named accounts following the format
      HealthMailbox\<7-alphanumeric\> on Microsoft Exchange servers.

    - These accounts leverage the **ApplicationImpersonation** role,
      allowing access to multiple mailboxes to extract emails and
      business data.

    - The HealthMailbox accounts masquerade as legitimate health
      monitoring mailboxes to avoid detection.

2.  **Data Exfiltration via DNS Protocol:**

    - Utilizes **Cobalt Strike** to tunnel collected data through DNS
      queries, providing a stealthy exfiltration channel bypassing many
      firewalls.

3.  **Exfiltration Using SMB:**

    - Leverages SMB remote file sharing protocol to transfer large
      datasets out of the environment efficiently.

------------------------------------------------------------------------

**Defensive Recommendations**

- **Monitor for Suspicious Exchange Accounts:**\
  Look for anomalous creation or use of HealthMailbox or similarly named
  accounts with impersonation privileges.

- **DNS Traffic Analysis:**\
  Detect unusual DNS query patterns that may indicate tunneling or data
  exfiltration.

- **SMB Traffic Monitoring:**\
  Implement controls to monitor and restrict SMB usage for large data
  transfers, especially outbound.

- **Audit and Alert on ApplicationImpersonation Role Usage:**\
  Track assignment and use of this role within Exchange to identify
  potential abuse.

- **Use Endpoint and Network Detection Tools:**\
  Deploy Microsoft Defender for Endpoint and Azure Sentinel rules to
  detect T1048.003, T1567, and T1078.003 techniques.

------------------------------------------------------------------------

If you want, I can prepare sample detection rules (e.g., Sentinel KQL
queries), or a detailed exfiltration mitigation playbook based on these
techniques.

# Anonymisation Infrastructure

## 2.1. Targeted Equipment

Here’s a categorized, corrected, summarized, rewritten, and deduplicated
version of the **Anonymisation Infrastructure used by Attacker during
Azure Cloud PenTest** based on your input:

------------------------------------------------------------------------

**Azure Penetration Testing: Attacker Anonymisation Infrastructure**

**1. Overview**

During Azure cloud penetration testing campaigns, attackers often use
anonymisation infrastructure to obfuscate their origin and activities.
One common technique involves leveraging a network of compromised
devices, primarily routers, to mask attack traffic.

**2. Targeted Equipment: Compromised Routers Network**

**2.1 Router Brands and Models Identified**

The attacker’s anonymisation infrastructure largely comprises a botnet
of compromised **Small Office/Home Office (SOHO) routers**, specifically
targeting several brands and models:

- **PAKEDGE routers** (dominant, representing ~64% of compromised
  routers)

  - RE-1

  - RE-2

  - RK-1

  - RK-2

- Other identified brands:

  - **SOPHOS CYBEROAM**

  - **CISCO** (models RV042, RV042G)

**2.2 Scale and Identification**

- Approximately **1,000 IP addresses** were observed as part of the
  anonymisation infrastructure.

- **623 IPs** were statistically linked to specific router models
  through exposed service fingerprinting.

- Single IP addresses might host multiple compromised devices, making
  exact device counts uncertain.

- Statistical analysis highlights a strong over-representation of
  PAKEDGE routers in the network.

**2.3 Possible Breach Vectors**

The exact methods used to compromise these routers remain undetermined.
However, plausible hypotheses include:

- **Shared Firmware Vulnerabilities:** Different router brands might run
  firmware containing common vulnerabilities. For instance, a known
  vulnerability in the **Realtek Managed Switch Controller** chip
  affects multiple brands, including PAKEDGE and CISCO.

- **Brand-specific Exploits:** Separate vulnerabilities could have been
  exploited for each router brand/model.

Certainly! Here's a categorized, corrected, summarized, rewritten, and
duplicate-removed version of your **Azure Pentest: Anonymisation
Infrastructure used by Attacker** content.

------------------------------------------------------------------------

**Azure Pentest — Attacker Anonymisation Infrastructure**

**Overview**

During Azure cloud penetration testing scenarios, sophisticated
attackers often utilize an anonymisation infrastructure to mask their
activities and maintain persistence. This infrastructure frequently
leverages compromised network devices, particularly Small Office/Home
Office (SOHO) routers.

------------------------------------------------------------------------

**1. Targeted Equipment**

- **Compromised Devices:**

  - Primarily SOHO routers from brands such as Pakedge, Sophos, and
    Cisco.

  - Approximately one thousand IP addresses linked to these devices were
    identified as part of the attacker’s infrastructure.

------------------------------------------------------------------------

**2. Pakdoor Backdoor**

- **Description:**

  - A specialized backdoor named *Pakdoor*, identified and analyzed by
    ANSSI (French National Cybersecurity Agency), is installed on each
    compromised router.

  - Pakdoor enables remote control and inter-device communication within
    the attacker’s network of infected routers.

- **Reference:**

  - Detailed analysis available in the report titled “APT31: Pakdoor.”

------------------------------------------------------------------------

**3. Structure of the Anonymisation Infrastructure**

- **Representation:**

  - Leveraging insights from ANSSI partners and Pakdoor code analysis,
    the anonymisation infrastructure can be mapped as a distributed
    network of compromised routers acting as relay points and proxies.

- **Purpose:**

  - This network allows the attacker to route traffic, scan targets, and
    browse web resources anonymously, effectively hiding their true
    origin.

------------------------------------------------------------------------

**4. Usage of the Anonymisation Infrastructure**

- **Command and Control (C2) Operations:**

  - The attacker’s C2 framework, such as Cobalt Strike Beacon, utilizes
    domains tied to the compromised routers within the anonymisation
    network.

  - This infrastructure serves as the primary anonymisation layer for
    all attacker communications, making detection and attribution
    significantly more difficult.

- **Operational Activities:**

  - Beyond C2, the infrastructure supports scanning activities and web
    browsing by the attacker, enhancing operational security and
    evasion.

------------------------------------------------------------------------

**Summary**

The anonymisation infrastructure in an Azure penetration test context
often involves a large network of compromised SOHO routers infected with
a sophisticated backdoor like Pakdoor. This network acts as a
distributed proxy to obscure attacker origins, supports command and
control domains, and facilitates reconnaissance and exploitation
activities within the cloud environment.

------------------------------------------------------------------------

If you want, I can help expand this summary with recommended detection
and mitigation strategies or integrate it into a full Azure pentest
report section. Would you like that?

# Victimology

Sure! Here's a cleaned-up, categorized, summarized, and rewritten
version of your **Azure Pentest Victimology** content:

**Azure Pentest — Victimology**

**Overview**

Analysis of targeted victims during the Azure Cloud penetration test
reveals a broad and opportunistic targeting approach.

------------------------------------------------------------------------

**1. Victim Selection Approach**

- **Broad Targeting:**

  - The campaign’s victims were diverse and not limited to specific
    organizations or sectors.

  - This suggests the attacker group, identified as APT31, employed
    opportunistic tactics, selecting targets based on availability
    rather than high-value or tailored selection criteria.

- **Implications:**

  - Opportunistic targeting increases the scope of potential compromise,
    making defenses across a wide range of environments critical.

------------------------------------------------------------------------

**Summary**

The victimology analysis during this Azure Cloud pentest indicates that
APT31 did not focus narrowly but instead targeted victims broadly and
opportunistically, reflecting a strategy that leverages any accessible
attack surface rather than a selective, high-value focus.

------------------------------------------------------------------------

Let me know if you want this expanded with examples of typical victim
profiles, or integrated into a larger threat actor profile for your
Azure pentest report!

# Tools Used

Absolutely! Here’s an explanation of typical **scenarios** during an
Azure penetration test where each of those tools might be used,
including how they fit into an attacker’s workflow:

------------------------------------------------------------------------

**1. WinRAR — Data Compression for Exfiltration**

**Scenario:**\
After successfully gaining access to an Azure VM or a compromised host,
the tester/attacker wants to exfiltrate sensitive files or data (e.g.,
credentials, logs, or databases).

- **How it’s used:**\
  The attacker compresses large amounts of data into smaller archives
  using WinRAR to minimize transfer size and avoid detection during
  exfiltration over constrained or monitored network channels.

- **Example:**\
  Compressing user database exports or logs before sending them out over
  a tunnel or upload to an external server.

------------------------------------------------------------------------

**2. Active Directory Explorer — AD Enumeration and Mapping**

**Scenario:**\
The tester has internal access within an Azure environment, often inside
an Azure AD-joined VM or a hybrid environment with synced on-prem Active
Directory. They want to map the domain structure to identify targets for
lateral movement or privilege escalation.

- **How it’s used:**\
  Active Directory Explorer is launched to browse and extract detailed
  information such as user accounts, groups, organizational units (OUs),
  permissions, service accounts, and computer accounts.

- **Example:**\
  Identify high-privilege groups like “Domain Admins” or service
  accounts with elevated rights to plan privilege escalation attacks or
  pivot to sensitive resources.

------------------------------------------------------------------------

**3. Metasploit Framework — Exploitation**

**Scenario:**\
A known vulnerability exists on a public-facing Azure VM (e.g.,
unpatched Windows RDP, SMB, or a web app vulnerability).

- **How it’s used:**\
  The penetration tester runs Metasploit modules to exploit the
  vulnerability remotely and gain an initial foothold on the system.

- **Example:**\
  Using a Metasploit exploit for an unpatched Windows SMB vulnerability
  to execute code remotely and deploy a Meterpreter shell.

------------------------------------------------------------------------

**4. RCMD Script — Remote Command Execution & Registry Writing**

**Scenario:**\
An attacker or tester has limited remote execution capability but needs
to persist commands or results on a Windows Azure VM without triggering
alarms by spawning suspicious processes.

- **How it’s used:**\
  The RCMD script writes command outputs directly into the Windows
  registry. This stealth technique allows command results to be stored
  persistently and retrieved later without conventional logs.

- **Example:**\
  Remotely executing reconnaissance commands (ipconfig, net user) and
  storing their output in the registry for later exfiltration or review.

------------------------------------------------------------------------

**5. Juicy Potato — Privilege Escalation via COM Interface**

**Scenario:**\
The tester has user-level access to an Azure VM but needs SYSTEM-level
privileges to fully control the machine and access sensitive system
areas.

- **How it’s used:**\
  Juicy Potato exploits Windows COM impersonation tokens by running
  under a user account that has certain permissions, elevating
  privileges to SYSTEM by impersonating a service account.

- **Example:**\
  Running Juicy Potato locally on the compromised VM to spawn a SYSTEM
  shell, allowing the tester to bypass security restrictions and run
  higher-privileged commands.

------------------------------------------------------------------------

**Summary Workflow Example in Azure Pentest:**

1.  **Initial foothold:** Use Metasploit to exploit a vulnerable Azure
    VM and get a shell.

2.  **Reconnaissance:** Run commands to gather information about the
    environment. Use RCMD to stealthily log command outputs in the
    registry.

3.  **Internal mapping:** Use Active Directory Explorer to gather domain
    data from Azure AD synced domain or local AD.

4.  **Privilege escalation:** Run Juicy Potato to escalate from a user
    to SYSTEM privileges.

5.  **Data exfiltration:** Compress sensitive files using WinRAR to
    prepare them for exfiltration.

------------------------------------------------------------------------

If you want, I can provide command examples or detailed detection and
mitigation techniques for these tools in an Azure environment. Would
that help?

**Cobalt Strike**

------------------------------------------------------------------------

**Azure Penetration Testing Tools**

Attackers and penetration testers in Azure environments use a range of
specialized tools to achieve initial access, post-exploitation control,
persistence, and exfiltration. Below is an updated, categorized list of
tools observed during Azure cloud penetration tests.

------------------------------------------------------------------------

**A. Post-Exploitation and Command & Control Tools**

**Cobalt Strike**

- **Purpose:**\
  Cobalt Strike is a commercial red team and post-exploitation framework
  used for covert command and control (C2), lateral movement, and
  persistence within a compromised network.

- **Usage in Azure Pentest:**\
  Once inside an Azure environment, an attacker may deploy Cobalt Strike
  Beacon payloads configured for stealthy communication back to their C2
  infrastructure. The campaign example shows a Beacon using **Pure DNS**
  communication mode, disguising traffic as legitimate DNS queries, with
  sophisticated parameters to evade detection.

- **Key Observed Configuration Details:**

  - Communication over DNS (BeaconType-Pure DNS)

  - Very long sleep time (900,000 ms = 15 minutes) to reduce network
    noise

  - Use of HTTP User-Agent mimicking common browsers (e.g., Mozilla/4.0
    compatible)

  - Custom HTTP headers and cookie fields designed to blend into normal
    traffic

  - Process injection techniques for stealth execution (e.g.,
    rundll32.exe)

  - Proxy settings configured to use Internet Explorer system settings

  - DNS beaconing and metadata encoding using base64url

  - Process injection methods such as VirtualAllocEx,
    CreateRemoteThread, SetThreadContext

- **Reference:** [Cobalt Strike Official
  Website](https://www.cobaltstrike.com/)

------------------------------------------------------------------------

**Summary Context for Use**

- **Cobalt Strike** fits primarily in the **post-exploitation** phase
  where persistence and stealthy command & control channels are
  required, especially in environments like Azure where outbound traffic
  may be monitored closely.

- Attackers utilize Cobalt Strike to maintain covert access, conduct
  lateral movement, gather intelligence, and execute payloads while
  minimizing network signature detection.

# Techniques, tactics and procedures

Sure! Here's a categorized, corrected, deduplicated, and neatly
summarized version of the **Azure Cloud Penetration Testing Techniques,
Tactics, and Procedures (TTPs)** you provided.

------------------------------------------------------------------------

**Azure Cloud Penetration Testing Techniques, Tactics, and Procedures
(TTPs)**

------------------------------------------------------------------------

**1. Initial Access**

Techniques used to gain entry into the Azure environment:

- **Exploit Public-Facing Application**

- **External Remote Services Access**

- **Valid Accounts**

  - Cloud Accounts

  - Local Accounts

  - Domain Accounts

------------------------------------------------------------------------

**2. Execution**

Techniques to execute malicious code or commands:

- **Windows Management Instrumentation (WMI)**

- **Scheduled Task/Job Execution**

- **Service Execution**

- **Web Shell Deployment (Server Software Component)**

- **DLL Side-Loading (Hijack Execution Flow)**

- **Valid Accounts Execution**

  - Local Accounts

  - Domain Accounts

------------------------------------------------------------------------

**3. Persistence**

Maintaining long-term access in the environment:

- **Scheduled Tasks/Jobs**

- **Web Shells**

- **DLL Side-Loading**

- **Create/Modify System Processes**

  - Windows Services

- **Account Manipulation**

  - Exchange Email Delegate Permissions

- **Boot or Logon Initialization Scripts**

- **Create Accounts**

  - Domain Accounts

  - Local Accounts

------------------------------------------------------------------------

**4. Privilege Escalation**

Techniques to gain higher privileges:

- **Access Token Manipulation**

  - SID History Injection

- **Exploitation for Privilege Escalation**

- **Scheduled Tasks**

- **DLL Side-Loading**

- **Valid Accounts**

  - Local Accounts

------------------------------------------------------------------------

**5. Defense Evasion**

Techniques to avoid detection and bypass defenses:

- **Indicator Removal on Host**

  - File Deletion

- **Process Injection**

  - DLL Injection (Dynamic-link Library Injection)

- **Impair Defenses**

  - Disable/Modify System Firewall

  - Disable/Modify Security Tools

- **DLL Side-Loading**

- **Masquerading**

  - Masquerade Task or Service

  - Match Legitimate Name or Location

- **Modify Registry**

- **Obfuscated Files or Information**

- **Valid Accounts**

  - Local Accounts

------------------------------------------------------------------------

**6. Credential Access**

Techniques to obtain account credentials:

- **OS Credential Dumping**

  - Cached Domain Credentials

  - LSASS Memory

- **Brute Force Attacks**

  - Password Guessing

  - Password Spraying

------------------------------------------------------------------------

**7. Discovery**

Techniques to gather information about the environment:

- **Account Discovery**

  - Domain Accounts

  - Local Accounts

- **Network Service Scanning**

- **File and Directory Discovery**

- **Process Discovery**

- **Remote System Discovery**

- **System Network Configuration Discovery**

- **System Network Connections Discovery**

- **System Service Discovery**

------------------------------------------------------------------------

**8. Lateral Movement**

Techniques to move through the network:

- **Exploitation of Remote Services**

- **Remote Services**

  - SMB / Windows Admin Shares

------------------------------------------------------------------------

**9. Collection**

Techniques to gather data of interest:

- **Archive Collected Data**

  - Archive via Utility

- **Email Collection**

  - Local Email Collection

- **Data from Local System**

------------------------------------------------------------------------

**10. Command and Control (C2)**

Techniques to communicate with compromised systems:

- **Application Layer Protocol**

  - Web Protocols

- **Proxy Usage**

------------------------------------------------------------------------

**11. Exfiltration**

Techniques to remove data from the environment:

- **Exfiltration Over Alternative Protocols**

  - Over Unencrypted or Obfuscated Non-C2 Protocol

------------------------------------------------------------------------

**Summary Notes:**

- **DLL Side-Loading** and **Scheduled Tasks** appear repeatedly across
  Execution, Persistence, Privilege Escalation, and Defense Evasion
  phases, showing their importance in Azure pentesting.

- **Valid Accounts** are a common thread used across multiple tactics
  (Initial Access, Execution, Persistence, Privilege Escalation, Defense
  Evasion), emphasizing the importance of account security.

- **Credential Dumping** and **Brute Force** remain key for Credential
  Access.

- Discovery phases cover extensive enumeration both on account level and
  network/service level.

- Techniques relevant to Azure-specific components like Exchange email
  delegation and cloud accounts are included.

- Defense Evasion heavily focuses on process injection, masquerading,
  and disabling/modifying defenses.

- Exfiltration focuses on stealthy, often non-C2 protocol channels.

------------------------------------------------------------------------

If you'd like, I can also help build a **table format** or create
**mitigation mappings** or even expand on each technique with
Azure-specific examples. Would you like that?
