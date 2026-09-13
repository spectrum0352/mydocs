Password attack with nmap

# Password cracking using NMAP

**Password Cracking with Nmap NSE (Brute Force Scripts)**

**Introduction to Nmap Scripting Engine (NSE)**

- **NSE** allows users to automate various network tasks using scripts
  written in **Lua**, running efficiently alongside Nmap scans.

- NSE scripts are categorized by their purpose, e.g., auth, brute, vuln,
  discovery, etc.

- The **brute category** includes scripts that perform brute-force
  attacks to guess authentication credentials on remote services.

**Using Nmap Brute Force Scripts**

- Brute-force NSE scripts require **username and password dictionaries**
  (userdb and passdb) as input.

- They target common protocols to audit password strength by guessing
  credentials.

**Common Brute-Force NSE Scripts Examples**

| **Protocol** | **NSE Script** | **Default Port** | **Usage Example** | **Notes** |
|----|----|----|----|----|
| FTP | ftp-brute.nse | 21 | nmap -p21 --script ftp-brute.nse --script-args userdb=users.txt,passdb=pass.txt 192.168.1.150 | Requires username & password lists |
| SSH | ssh-brute.nse | 22 | nmap -p22 --script ssh-brute.nse --script-args userdb=users.txt,passdb=pass.txt 192.168.1.150 | Dumps valid credentials if found |
| Telnet | telnet-brute.nse | 23 | nmap -p23 --script telnet-brute.nse --script-args userdb=users.txt,passdb=pass.txt 192.168.1.150 |  |
| SMB | smb-brute.nse | 445 | nmap -p445 --script smb-brute.nse --script-args userdb=users.txt,passdb=pass.txt 192.168.1.150 | Saves valid credentials for reuse |
| PostgreSQL | pgsql-brute.nse | 5432 | nmap -p5432 --script pgsql-brute.nse --script-args userdb=users.txt,passdb=pass.txt 192.168.1.150 |  |
| MySQL | mysql-brute.nse | 3306 | nmap -p3306 --script mysql-brute.nse --script-args userdb=users.txt 192.168.1.150 | Password list optional, depends on script |
| HTTP | http-form-brute | 80 | nmap -p80 --script http-form-brute --script-args "userdb=users.txt,passdb=pass.txt,http-form-brute.path=/dvwa/login.php" 192.168.1.150 | For form-based authentication |
| MS-SQL | ms-sql-brute.nse | 1433 | nmap -p1433 --script ms-sql-brute --script-args userdb=users.txt,passdb=pass.txt 192.168.1.146 |  |

**How to Use NSE Brute Scripts**

- To run common NSE scripts: use -sC flag.

- To specify particular scripts or categories: use --script with script
  names or categories.

- To pass arguments like username and password dictionaries: use
  --script-args or --script-args-file.

**Additional Notes**

- Valid credentials discovered by these scripts can be stored in the
  Nmap registry and reused by other scripts in the same scan.

- Connection timeout defaults to 5 seconds but can be adjusted in script
  arguments if needed.

------------------------------------------------------------------------

**Corrections / Improvements from Original Text**

- Corrected grammar and sentence structure for clarity.

- Clarified that **MySQL brute script** optionally takes password
  dictionaries, depending on the script implementation.

- Consistent formatting for commands and options.

- Highlighted the Nmap registry feature for sharing found credentials
  among scripts.

- Removed redundant or unclear phrases.

------------------------------------------------------------------------

If you want, I can also help create a quick reference table for NSE
brute-force scripts targeting Active Directory, local Windows accounts,
or Microsoft Entra ID (Azure AD) specific scenarios. Would that be
helpful?

Absolutely! Here’s a focused summary and quick reference for **password
cracking and brute forcing targeting Active Directory (AD), local
Windows accounts, and Microsoft Entra ID (Azure AD)**, with context on
tools like Nmap NSE and additional relevant methods:

------------------------------------------------------------------------

**Password Cracking & Brute Force in Active Directory, Local Windows
Accounts, and Microsoft Entra ID (Azure AD)**

**1. Active Directory (AD) Password Cracking**

- **Focus:** AD domain accounts used for Windows authentication in
  on-premises networks.

- **Common targets:** Domain controllers (DCs), SMB, Kerberos, LDAP,
  RDP, and related services.

- **NSE Scripts:**

  - smb-brute.nse — brute forces SMB usernames/passwords on DCs or
    Windows hosts.

  - ldap-brute.nse — brute forces LDAP authentication (not covered above
    but useful for AD).

- **Other tools:**

  - **CrackMapExec** — excellent for AD SMB/WinRM brute forcing and
    post-exploitation.

  - **Hydra/Medusa** — multi-protocol brute forcing.

  - **Impacket tools** (e.g., GetUserSPNs.py, secretsdump.py) for
    extracting hashes and cracking offline.

**2. Local Windows Account Password Cracking**

- **Focus:** Local machine accounts (non-domain) on Windows hosts.

- **Common targets:** SMB service on local hosts, RDP login, or WinRM.

- **NSE Scripts:**

  - smb-brute.nse works here as well for local account brute forcing.

- **Other approaches:**

  - Using tools like nmap with SMB brute scripts.

  - Password spraying or guessing common local admin passwords.

  - Offline hash cracking with tools like hashcat or john the ripper
    after dumping hashes.

**3. Microsoft Entra ID (Azure AD) Password Attacks**

- **Focus:** Cloud-based Azure AD accounts, often synced with on-prem AD
  via Azure AD Connect.

- **Key differences:**

  - Azure AD enforces cloud policies like MFA and lockouts differently.

  - Direct network brute forcing with Nmap NSE is usually **not
    applicable** as authentication is via web/API.

- **Attack approaches:**

  - **Password spraying and brute forcing via Azure AD authentication
    endpoints** using tools like:

    - **MSOLSpray**, **PwnAD**, or custom scripts calling Microsoft
      Graph API.

    - **Burp Suite** or automated web testing tools for brute forcing
      HTTP-based Azure AD login pages.

  - **Phishing and credential harvesting** are common for Azure AD.

  - **Password hash extraction** is typically not possible directly;
    attacks rely more on API abuse or OAuth token theft.

------------------------------------------------------------------------

**Practical NSE Examples and Alternatives**

| **Environment** | **Target Service/Protocol** | **NSE Script / Tool** | **Notes / Usage Example** |
|----|----|----|----|
| Active Directory | SMB (ports 445/139) | smb-brute.nse | nmap -p445 --script smb-brute.nse --script-args userdb=users.txt,passdb=pass.txt \<target\> |
| Active Directory | LDAP | ldap-brute.nse (if available) or custom LDAP tools | LDAP brute forcing with username/password lists |
| Local Windows Accounts | SMB | smb-brute.nse | Same as AD, targeting local accounts |
| Azure AD / Entra ID | Web login forms (HTTP/HTTPS) | No NSE script; use HTTP form brute or external tools | E.g., http-form-brute against Azure login pages or custom scripts |
| Azure AD / Entra ID | Microsoft Graph / OAuth endpoints | External tools/APIs | Use MSOLSpray or MS Graph API scripts for password spraying or token abuse |

------------------------------------------------------------------------

**Additional Recommendations**

- **For AD & Local:** After finding credentials, use tools like
  **CrackMapExec** or **Impacket** for further exploitation.

- **For Azure AD:** Focus on **credential phishing, OAuth token
  manipulation, and API abuse** instead of traditional brute forcing.

- Consider **monitoring account lockouts and alerting** as these attacks
  can generate noisy events.

- Use **account lockout policies, MFA enforcement, and conditional
  access policies** to mitigate brute force risks in both on-prem and
  cloud.

------------------------------------------------------------------------

If you want, I can also help create example commands or scripts
specifically for each environment or suggest tools and techniques
tailored for your pentesting workflow. Just let me know!

## Password cracking with NMAP Scripting Engine

- Nmap Scripting Engine (NSE) is used to write (and share) simple
  scripts to automate a wide variety of networking tasks. NSE scripts
  are executed in parallel. The core of NSE is an embeddable Lua
  interpreter. The second part of the Nmap Scripting Engine is the NSE
  Library, which connects Lua and Nmap.

**NSE scripts categories**

- Auth

- Broadcast

- Brute

- default. Discovery

- dos

- exploit

- external

- Fuzzer

- intrusive

- malware

- safe

- version

- vuln

**Brute force attack with NSE**

- List the NSE scripts: \> locate \*.nse \| grep brute

- **FTP-brute:** Need dictionaries of usernames and passwords: \>nmap
  -p21 --script ftp-brute.nse --script-args
  userdb=users.txt,passdb=pass.txt 192.168.1.150

- **SSH-brute:** \>nmap -p22 --script ssh-brute.nse –script-args
  userdb=users.txt,passdb=pass.txt 192.168.1.150

<!-- -->

- **Password Cracking Techniques** are used to recover passwords from
  computer systems.

- Password attack-Active online Attacker cracks password by directly
  communicating with target such as Dictionary, Brute-forcing,
  Rule-based attack, Cracking Kerberos password, Internal Monologue
  attack, Password Guessing.

# Password cracking with NMAP Scripting Engine

The Nmap Scripting Engine (NSE) is used to write (and share) simple
scripts to automate a wide variety of networking tasks. NSE scripts are
executed in parallel. The core of NSE is an embeddable Lua interpreter.
The second part of the Nmap Scripting Engine is the NSE Library, which
connects Lua and Nmap.

NSE scripts categories

- Auth

- Broadcast

- Brute

- default. Discovery

- dos

- exploit

- external

- Fuzzer

- intrusive

- malware

- safe

- version

- vuln

# Brute force attack with NSE

List the NSE scripts: \> locate \*.nse \| grep brute

## Password cracking with NMAP Scripting Engine

- Nmap Scripting Engine (NSE) is used to write (and share) simple
  scripts to automate a wide variety of networking tasks. NSE scripts
  are executed in parallel. The core of NSE is an embeddable Lua
  interpreter. The second part of the Nmap Scripting Engine is the NSE
  Library, which connects Lua and Nmap.

**NSE scripts categories**

- Auth

- Broadcast

- Brute

- default. Discovery

- dos

- exploit

- external

- Fuzzer

- intrusive

- malware

- safe

- version

- vuln

**Brute force attack with NSE**

- List the NSE scripts: \> locate \*.nse \| grep brute

- **FTP-brute:** Need dictionaries of usernames and passwords: \>nmap
  -p21 --script ftp-brute.nse --script-args
  userdb=users.txt,passdb=pass.txt 192.168.1.150

- **SSH-brute:** \>nmap -p22 --script ssh-brute.nse –script-args
  userdb=users.txt,passdb=pass.txt 192.168.1.150

<!-- -->

- **Password Cracking Techniques** are used to recover passwords from
  computer systems.

- Password attack-Active online Attacker cracks password by directly
  communicating with target such as Dictionary, Brute-forcing,
  Rule-based attack, Cracking Kerberos password, Internal Monologue
  attack, Password Guessing.
