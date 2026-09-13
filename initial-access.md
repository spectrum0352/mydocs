# Reconnaissance

## IAM Footprinting

Reconnaissance of User Accounts, Identities, Access, and Authentication
on Windows Server

This document outlines commands and techniques for gathering information
about user accounts, identities, access rights, and authentication on
Windows Server 2019 and 2022. It uses the whoami command as a foundation
and expands upon it.

**I. Basic User Information**



- **All Information for Current User:** whoami /all (Combines all the
  above information into a single output.)

**II. Additional User and Account Discovery (Beyond whoami)**

- **Listing Local Users:** net user (Displays a list of user accounts on
  the local machine.)

- **Detailed User Information:** net user \<username\> (Provides
  detailed information about a specific user account, including full
  name, password last set, account expires, and local group
  memberships.)

- **Listing Domain Users (if domain-joined):** dsquery user (A powerful
  command-line tool for querying Active Directory. Requires the Active
  Directory Domain Services tools to be installed.) Example: dsquery
  user -name \*administrator\*

- **Enumerating Users via PowerShell:** Get-LocalUser (Provides a more
  flexible and scriptable way to retrieve local user account
  information.) For domain users, use Get-ADUser (requires the Active
  Directory module). Example: Get-ADUser -Identity administrator

- **Checking for specific users:** Get-LocalUser \| Where-Object
  {\$\_.Name -like "\*admin\*"}

**III. Access and Authentication Related Information:**

- **Local Group Memberships:** net localgroup \<groupname\> (Displays
  members of a specific local group.)

- **Domain Group Memberships:** Use dsget group \<groupDN\> -members (or
  PowerShell's Get-ADGroupMember) to check membership of domain groups.

- **Effective Access:** Use the "Effective Access" tab in the Security
  properties of a file or folder to determine the actual permissions a
  user has, considering group memberships and explicit permissions.

- **Authentication Methods:** Event logs (Security log) can provide
  insights into user logon events and the authentication methods used
  (e.g., Kerberos, NTLM). Look for Event IDs 4624 (successful logon) and
  4625 (failed logon).

- **Kerberos Delegation:** Check the user's account properties in Active
  Directory for Kerberos delegation settings. This is crucial for
  understanding how a user can access resources on behalf of another
  user.

**IV. Important Considerations:**

- **Permissions:** Running these commands with insufficient privileges
  may result in limited or no information being displayed. Administrator
  privileges are often required for comprehensive reconnaissance.

- **Domain vs. Local:** Some commands are specific to domain-joined
  computers (dsquery, Get-ADUser), while others are for local accounts
  (net user, Get-LocalUser).

- **PowerShell:** PowerShell offers more powerful and flexible ways to
  gather user and access information compared to command-line tools.

- **Event Logs:** Security event logs are a valuable source of
  information about user activity, logon events, and access attempts.

- **Security Best Practices:** Regularly review user accounts, group
  memberships, and privileges to minimize security risks. Implement the
  principle of least privilege.

- **Tools:** Consider using dedicated security assessment tools for more
  in-depth vulnerability scanning and user/access analysis.

This expanded information provides a more complete view of user account
and access reconnaissance on Windows servers. Remember to use this
information responsibly and ethically.

## Network footprinting

This document summarizes and expands on network reconnaissance
techniques for Windows Server 2019 and 2022, focusing on command-line
tools and nmap.

**1. ARP Manipulation:**

- **Displaying the ARP Table:** arp /a shows the IP address to MAC
  address mappings currently cached by the system. Adding /n \<IP
  address\> filters the output to only show the specified IP. The output
  includes the interface, IP address, MAC address, and entry type
  (dynamic or static).

- **Adding a Static ARP Entry:** arp -s \<IP address\> \<MAC address\>
  manually adds a static entry to the ARP table. This can be useful for
  testing or network troubleshooting but should be used cautiously as it
  can cause network issues if incorrect. The MAC address should be
  entered in hyphen-separated hexadecimal format (e.g.,
  00-aa-bb-cc-dd-ee).

- **Deleting an ARP Entry:** arp -d \<IP address\> removes a specific
  entry from the ARP table.

**Example:**

C:\\ arp /a

C:\\ arp -s 10.0.0.210 10-aa-bb-cc-dd-ff

C:\\ arp /a

C:\\ arp -d 10.0.0.210

C:\\ arp /a

**2. Nmap Scanning:**

nmap is a powerful port scanning and network exploration tool. Here are
some common nmap commands for Windows server reconnaissance:

- **Basic Scan:** nmap \<target IP address\> performs a basic port scan,
  identifying open ports and services.

- **Scan Specific Ports:** nmap -p \<port1\>,\<port2\>,\<portN\>
  \<target IP address\> scans only the specified ports.

- **Service Version Detection:** nmap -sV \<target IP address\> attempts
  to determine the version of services running on open ports.

- **OS Detection and Version Detection:** nmap -A \<target IP address\>
  enables OS detection and version detection, providing more information
  about the target system.

- **Interface Scan:** nmap -e \<interface name\> \<target IP address\>
  specifies the network interface to use for the scan. This is useful
  when the system has multiple network interfaces.

- **Common Windows Ports Scan:** nmap -p 53,88,135,139,445,3389 \<target
  IP address\> specifically targets common Windows services (DNS,
  Kerberos, RPC, NetBIOS, SMB, RDP).

**Example:**

C:\\ nmap 172.16.1.10

C:\\ nmap -A 172.16.1.10

C:\\ nmap -p 445 172.16.1.10

**3. Additional Reconnaissance Techniques:**

- **NetBIOS Enumeration:** Use nbtstat -a \<target IP address\> to
  gather information about NetBIOS names and services running on the
  target system. This can reveal the computer name, domain name, and
  other useful information.

- **SMB Enumeration:** Use tools like smbclient or enum4linux (on Linux)
  to enumerate shares, users, and groups on the target system. nmap also
  provides SMB scripting capabilities. Example: nmap --script
  smb-enum-shares \<target IP address\>.

- **LDAP Enumeration:** Use tools like ldapsearch (on Linux) or
  PowerShell cmdlets (on Windows) to query the Active Directory database
  for information about users, groups, and other objects.

- **WMI (Windows Management Instrumentation):** Use PowerShell cmdlets
  like Get-WmiObject to query system information, installed software,
  and hardware configurations.

- **DNS Enumeration:** Use tools like nslookup or dig to gather
  information about the target's DNS records, including hostnames, IP
  addresses, and other DNS data. nmap also provides DNS scripting
  capabilities.

- **Port Scanning with other tools:** While nmap is the most popular,
  other port scanners like masscan (for very fast scans) or specialized
  tools like unicornscan might be used depending on the specific needs.

- **Banner Grabbing:** Tools like nc (netcat) can be used to connect to
  open ports and retrieve banner information, which can reveal the
  service version and other details. Example: nc -v \<target IP
  address\> \<port number\>.

**4. PowerShell for Reconnaissance:**

PowerShell provides a rich set of cmdlets for system and network
reconnaissance. Examples include:

- Get-NetIPAddress: Gets IP address information.

- Get-NetAdapter: Gets network adapter information.

- Get-WmiObject Win32_OperatingSystem: Gets operating system details.

- Get-Service: Lists services running on the system.

## Windows Authentication

Userinit.exe is installed under Software\Microsoft\Windows
NT\CurrentVersion\Winlogon and authentication process is started.
WINLOGON.exe path is %SystemRoot%\System32\winlogon.exe.

<img src="media/image1.png" style="width:3.78188in;height:2.89298in" />

**Goals:**

- Gather system, user, and network information.

- Understand services, file systems, registry structure.

**Commands:**

systeminfo

ipconfig /all

whoami /all

tasklist /v

netstat -ano

net user

net localgroup administrators

wmic service list brief

**Tools:**

- SharpHound (for Active Directory enumeration)

- Seatbelt.exe (collects OS security artifacts)

- PowerView.ps1

**🛠️ 2. File System & Registry Analysis**

**Goals:**

- Identify sensitive files, credentials, misconfigurations.

**Commands:**

dir /s /b C:\\ \| findstr /i "password creds .kdbx .rdp"

reg query "HKLM\SYSTEM\CurrentControlSet\Services"

reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run"

**Notes:**

- Look in C:\Users\\User\>\AppData\Local, Desktop, Documents.

- Review registry autoruns for persistence.

**🛡️ 3. OS & Application Fingerprinting**

**Purpose:**

- Identify OS version, patch level for kernel or privilege escalation
  vulnerabilities.

**Commands:**

systeminfo \| findstr /B /C:"OS Name" /C:"OS Version"

**Exploits:**

- Use kernel exploits like CVE-2022-21907 or EternalBlue (if unpatched).

# Getting Access

## Brute-force 

**Countermeasures**

Enable the account lockout policy on Windows:

- Open Run CTRL + R 🡪 type **“secpol.msc”** it will open the **Local
  Security Policy** tool which is available only on Windows Servers

- Navigate to Account policies 🡪 Account lockout policies 🡪 you will see
  below 3 policies:

  - Account lockout duration

  - Account lockout threshold

  - Reset account lockout counter after

## Credential Dumping

Here is a **corrected and summarized version** of your text on **Azure
Windows VM Pentest – Credential Harvesting Using Fake Login Screens**:

**Azure Windows VM Penetration Testing: Credential Harvesting
Techniques**

**Objective**

Simulate post-exploitation scenarios on an Azure Windows VM by
harvesting user credentials using phishing techniques and fake login
screens.

**Overview**

Once an attacker gains a foothold on a Windows VM in Azure, they can
exploit native Windows behavior that prompts users for authentication
(e.g., Outlook login, UAC prompts, or lock screens). These prompts can
be spoofed using tools to phish valid credentials.

**Techniques Used**

**1. Metasploit Module – phish_windows_credentials**

- **Tool**: post/windows/gather/phish_windows_credentials

- **Purpose**: Displays a fake Windows Security dialog to phish
  credentials from the active user.

- **Usage**:

- use post/windows/gather/phish_windows_credentials

- set session 1

- exploit

- **Functionality**: Waits for a new process to start. Then launches a
  fake security prompt. If the user inputs their credentials, they are
  captured and shown to the attacker.

**2. FakeLogonScreen**

- **Author**: Arris Huijgen

- **Language**: C#

- **Description**: Simulates a Windows lock screen to trick users into
  entering their credentials.

- **Execution Steps**:

- upload /root/FakeLogonScreen.exe .

- shell

- FakeLogonScreen.exe

- **Behavior**: Displays a realistic Windows lock screen. When the user
  enters their password, it is captured and displayed to the attacker.

- **Validation**: The tool can validate credentials against the local
  system or a Domain Controller (if domain joined).

**3. SharpLocker**

- **Author**: Matt Pickford

- **Language**: C#

- **Description**: Another fake lock screen tool, similar to
  FakeLogonScreen, designed to harvest credentials via keystroke
  logging.

- **Execution Steps**:

- upload /root/Downloads/SharpLocker.exe .

- shell

- SharpLocker.exe

- **Behavior**: Mimics the Windows lock screen and logs each keystroke
  as the user types their password.

**Use in Azure Windows VM Pentest**

These tools are typically used **post-compromise**, after establishing a
Meterpreter session or equivalent access. In an Azure VM scenario, the
attacker:

- Gains initial access (e.g., via RDP credential reuse or exploitation).

- Uploads and executes credential phishing tools.

- Harvests domain or local credentials for lateral movement,
  persistence, or privilege escalation.

**Key Takeaways**

- These methods rely on **social engineering** and **user interaction**.

- Tools like phish_windows_credentials, FakeLogonScreen, and SharpLocker
  can harvest credentials from interactive sessions.

- This is highly effective in **Azure hybrid environments**, where
  credential reuse between on-prem and cloud is common.

Would you like this turned into a markdown, PDF, or attack chain diagram
for documentation purposes?

Here's a **corrected and summarized version** of your text on **Azure
Windows VM Pentesting – Credential Harvesting using Prompt Injection
Tools and Scripts**:

**Azure Windows VM Penetration Testing: Credential Phishing via Fake
Prompts**

**Objective**

Simulate credential phishing attacks on Azure Windows VMs using
PowerShell-based tools, Empire, Koadic, and social engineering scripts
that generate fake login prompts.

**Tools & Techniques for Credential Harvesting**

**1. PowerShell Empire – collection/prompt Module**

- **Function**: Displays a fake Windows login prompt to capture user
  credentials.

- **Usage**:

- usemodule collection/prompt

- execute

- **Behavior**: When the user enters their credentials in the fake
  dialog, they are instantly printed to the attacker's terminal.

**2. PowerShell Empire – collection/toasted Module**

- **Function**: Mimics a Windows restart-required notification.

- **Trigger**: When the user selects **Postpone**, a credentials prompt
  appears to "authorize" the decision.

- **Usage**:

- usemodule collection/toasted

- execute

**3. Koadic – password_box Module**

- **Tool**: Koadic (a post-exploitation command & control framework).

- **Function**: Displays a credential prompt dialog on the target.

- **Usage**:

- use password_box

- execute

- **Effect**: Captures and displays user-entered credentials in the
  console.

**PowerShell Scripts**

**4. Invoke-CredentialsPhish.ps1**

- **Function**: Simulates a Windows login box using native PowerShell UI
  elements.

- **Execution**:

- Import-Module C:\Users\raj\Desktop\Invoke-CredentialsPhish.ps1

- Invoke-CredentialsPhish

- **Behavior**: Displays a login prompt; once credentials are entered,
  they are echoed to the screen.

**5. Invoke-LoginPrompt.ps1**

- **Author**: Matt Nelson (enigma0x3)

- **Function**: Similar to Invoke-CredentialsPhish.ps1 but uses a
  different dialog design.

- **Execution**:

- Import-Module C:\Users\raj\Desktop\Invoke-LoginPrompt.ps1

- Invoke-LoginPrompt

**6. Lockphish**

- **Tool Type**: Bash + PHP + Ngrok (for public link generation).

- **Function**: Generates a fake website that mimics a YouTube
  redirection but prompts the user for credentials.

- **Execution**:

- ./lockphish.sh

- **Process**:

  - Sends a phishing link via social engineering.

  - When accessed, the target is tricked into downloading and running a
    file.

  - The script simulates a lock screen and captures credentials.

- **Limitations**: Less accurate lock screen emulation; does not
  validate credentials before submission.

**Conclusion**

Each credential phishing method is suited for different
post-exploitation situations:

| **Tool/Script** | **Validation** | **Realism** | **Requires GUI** | **Social Engineering** |
|----|----|----|----|----|
| Empire (prompt) | Yes | High | Yes | Low |
| Empire (toasted) | Yes | High | Yes | Low |
| Koadic (password_box) | Yes | Medium | Yes | Low |
| Invoke-CredentialsPhish | Yes | Medium | Yes | Low |
| Invoke-LoginPrompt | Yes | Medium | Yes | Low |
| Lockphish | No | Low | Browser/File | High |

These techniques are effective after gaining a foothold on an Azure
Windows VM, especially in environments where users are logged in
interactively and attacker-controlled prompts can appear believable.

Would you like this converted into a visual comparison chart or
formatted into a professional pentest report section?

 

## RDP attacks

**How to prevent Brute-force attack on Windows?**

Enable the account lockout policy on Windows:

- Open Run CTRL + R 🡪 type **“secpol.msc”** it will open the **Local
  Security Policy** tool which is available only on Windows Servers

- Navigate to Account policies 🡪 Account lockout policies 🡪 you will see
  below 3 policies:

  - Account lockout duration

  - Account lockout threshold

  - Reset account lockout counter after

## Credential Dumping

**Autologon:** NTDS.dit, GPP, MSCCache

**Internal monologue:** Dcsync, SSP, LAPS

**Vault:** Applications, wireless, Phishing

**Browser:** LSA/LSASS, WDigest, SAM

## Credential Dumping

**Autologon:** NTDS.dit, GPP, MSCCache

**Internal monologue:** Dcsync, SSP, LAPS

**Vault:** Applications, wireless, Phishing

**Browser:** LSA/LSASS, WDigest, SAM

## RDP 

**How to prevent Brute-force attack on Windows?**

Enable the account lockout policy on Windows:

- Open Run CTRL + R 🡪 type **“secpol.msc”** it will open the **Local
  Security Policy** tool which is available only on Windows Servers

- Navigate to Account policies 🡪 Account lockout policies 🡪 you will see
  below 3 policies:

  - Account lockout duration

  - Account lockout threshold

  - Reset account lockout counter after

## Brute-force Prevention

Enable the account lockout policy on Windows:

- Open Run CTRL + R 🡪 type **“secpol.msc”** it will open the **Local
  Security Policy** tool which is available only on Windows Servers

- Navigate to Account policies 🡪 Account lockout policies 🡪 you will see
  below 3 policies:

  - Account lockout duration

  - Account lockout threshold

  - Reset account lockout counter after

**Initial Access Brokers: An Excess of Access**

**Digital Shadows Photon Research Team**

**Executive Summary**

Over the past decade, technological advancements have dramatically
transformed how we live and work. The widespread adoption of remote
access technologies—such as VPNs and remote desktop software—has
normalized secure remote connectivity from virtually anywhere, whether
it's a cottage in Croatia or a villa in the Maldives.

The COVID-19 pandemic accelerated the use of these technologies,
creating an unprecedented opportunity for cybercriminals. Threat actors,
particularly Initial Access Brokers (IABs), have adapted quickly to
exploit these access points, capitalizing on increased remote work and
the booming ransomware economy. Since 2016, Digital Shadows' Photon Team
has monitored IAB activity, observing a “perfect storm” in 2020: a surge
in remote working and the maturation of ransomware as a service (RaaS)
models.

IABs specialize in breaching networks—often via Remote Desktop Protocol
(RDP), compromised Citrix gateways, or VPNs—and selling that access on
underground forums. These sales serve as a springboard for further
malicious activity by ransomware groups and other cybercriminals.

In 2020 alone, IAB listings soared. The Photon Team analyzed over 500
listings between January 1 and December 31, 2020, revealing important
insights:

------------------------------------------------------------------------

**Key Findings Overview**

- **Surge in Listings:** Access listings increased sharply during 2020,
  particularly for VPN credentials, due to a dramatic rise in remote
  work.

- **Broad Market Reach:** IABs now serve a mature, thriving market,
  selling access to organizations of all sizes, industries, and
  geographies.

- **Average Price:** The average selling price for network access was
  **\$7,100**, determined by organization revenue, access type, and
  number of endpoints.

- **Top Access Type:** **RDP** was the most commonly listed (17%) and
  had the highest average price at **\$9,800**.

- **Targeted Industries:**

  - Retail: 10% of incidents; Avg. listing value: \$4,712

  - Financial Services: 9%; \$6,619

  - Technology: 7%; \$13,607

- **Geographic Focus:**

  - North America: 39% of listings

  - Europe: 15%

  - Asia & Middle East: 9% each

------------------------------------------------------------------------

**Behind the Broker: Marketing Initial Access**

IABs are not a product of the COVID-19 era, though the pandemic fueled
their rapid growth. Digital Shadows has observed access sales as early
as 2005, particularly on Russian-language forums like Exploit and XSS.
By 2020, even English-speaking forums such as RaidForums had
restructured their marketplaces to highlight access listings
prominently.

Access credentials—ranging from FTP and CMS logins to full domain
administrator privileges—have become staple commodities in underground
markets. Some listings even appear in auction formats to maximize
profits.

As IAB operations have matured, brokers have become more
security-conscious. In the past, listings often named victim
organizations directly, increasing buyer interest. Today, better OPSEC
practices prevent victim identification, replacing names with indirect
details like industry, revenue, staff size, or obfuscated domain
references.

------------------------------------------------------------------------

**Who’s Doing the Dirty Work?**

IABs vary widely in skill and sophistication. At the lower end, brokers
may stumble upon access using default credentials without the capability
to exploit it further—so they sell it. These low-skill actors are no
less dangerous; they indiscriminately sell to ransomware affiliates,
nation-state groups, or any buyer with malicious intent.

This model significantly lowers the barrier to entry in cybercrime,
making virtually any organization a potential target, regardless of
industry or geography.

------------------------------------------------------------------------

**Top Initial Access Brokers by Number of Listings (2020)**

| **Broker Handle** | **Listings** |
|-------------------|--------------|
| NETNET            | 41           |
| DRUMRLU           | 16           |
| WAZAWAKA          | 15           |
| JXB1990           | 14           |
| PETERVODZ         | 12           |
| MEDUSA23          | 12           |
| STREETSKIP        | 11           |
| ERONM             | 11           |
| VASYLDN           | 10           |
| STARI4OK          | 9            |
| BC.MONSTER        | 9            |
| HALABUDA          | 9            |
| JOHNAKAMAI        | 9            |
| LA_CITRIX         | 8            |
| BABAM             | 8            |
| LOGSCONSERVATOR   | 8            |
| FERB              | 8            |
| BASSTERLORD       | 8            |
| 7H0RF1NN          | 8            |
| CIPHER_STRIKE     | 7            |
| ZANKO             | 7            |
| BL33D             | 6            |

------------------------------------------------------------------------

**Earning Trust in Criminal Markets**

In criminal forums, reputation is everything. IABs with low trust
ratings struggle to sell high-value accesses and often rely on
third-party guarantors. One negative review can severely damage their
credibility and income potential.

To build trust, new IABs must first demonstrate value—just like new
users on Reddit or Quora must prove reliability before gaining
recognition. Longevity and consistently successful listings are key to
establishing legitimacy in underground markets.

------------------------------------------------------------------------

**Popular Access Types and Average Prices (2020)**

| **Access Type**      | **Avg. Price** |
|----------------------|----------------|
| Remote Desktop (RDP) | \$9,874        |
| Domain Administrator | \$8,187        |
| VPN                  | \$2,545        |
| Citrix Gateway       | \$3,412        |
| Control Panel (CMS)  | \$896          |
| Web Shell            | \$303          |

------------------------------------------------------------------------

**2020 Vision: The Rise of the IAB**

The cyber-threat landscape in 2020 was dominated by ransomware, with new
operators and variants emerging daily. The “pay or get breached” model
pressured victims into paying by threatening to leak their data.

IABs became essential players, acting as intermediaries between
compromised networks and ransomware gangs. Their work fed a steady
stream of victims into the ransomware supply chain—without IABs having
to participate in the extortion themselves.

This business model enabled a wide range of cyber actors to monetize
access at scale, further professionalizing and expanding the cybercrime
economy.

------------------------------------------------------------------------

**OPSEC Challenges and Adaptations**

IABs walk a fine line: they must provide enough information to attract
buyers, but not so much that security researchers can identify the
victim.

To protect operational security, listings often omit company names,
instead using vague indicators like revenue, staff size, country, or
obscured domain names. An example from September 2020 involved a
redacted listing for an RCE vulnerability at a Chilean bank. The seller
cited monitoring by @Bank_Security on Twitter as the reason for avoiding
specific names.

While naming victims boosts buyer interest and pricing, most IABs now
prioritize OPSEC, and the marketplace has adapted to this reality.

------------------------------------------------------------------------

Let me know if you'd like this formatted as a PDF, PowerPoint, or turned
into a professional threat intel report.

Here’s a refined and polished version of the “WHY SHOULD YOU CARE?”
section, with improved flow, clarity, and formatting:

------------------------------------------------------------------------

**Why This Matters**

The increasing **professionalization of cybercrime** has made ransomware
campaigns both highly effective and extremely dangerous. To defend
against these escalating threats, organizations must thoroughly
understand the **ransomware ecosystem**—in particular, the role of
**Initial Access Brokers (IABs)** who supply intrusions to ransomware
operators. This insight is critical in mitigating the staggering damage
these attacks can inflict.

Risk is defined as **likelihood × impact**. With ransomware-as-a-service
(RaaS) networks thriving and IABs lowering the barrier for entry, this
risk has reached unprecedented levels. While mitigation is complex,
organizations equipped with a dedicated **cyber-threat intelligence
(CTI)** function—either in-house or outsourced—stand a much better
chance at preemptively defending themselves.

**CTI teams can:**

1.  Monitor surface, deep, and dark web marketplaces and forums.

2.  Detect IAB activity and access listings in near real-time.

3.  Deliver actionable intelligence to security teams for patching and
    blocking vulnerable assets.

Early identification of IAB activity provides crucial lead time to
harden defenses before ransomware operators can strike.

**🔍 Intelligence Sources & Data Enrichment**

To price and market access effectively, IABs often reference
firmographic details (industry, size, revenue, country) pulled from
commercial B2B data providers like **ZoomInfo**. CTI teams can use the
same sources to correlate suspicious listings with their own
organization’s profile—enabling rapid detection and targeted remediation
before an attack unfolds.

------------------------------------------------------------------------

**📊 Popular Regions Targeted by IABs (2020)**

- **United States** – 31.14% (156 listings)

- **Canada** – 6.39% (32 listings)

- **India** – 3.19% (16 listings)

- **United Kingdom** – 3.39% (17 listings)

- **France**, **Italy**, **Thailand**, **Saudi Arabia** – each 2.0–2.8%

- Others (including Mexico, UAE, China, Brazil, Kuwait) – 1–1.6% each

- **Unspecified** region – 23.55% (118 listings)

*Total listings: 497 · Average price per access: \$7,431*

------------------------------------------------------------------------

**📌 Most Targeted Industries & Average Access Prices**

| **Industry**                 | **% of Listings** | **Avg Price** |
|------------------------------|-------------------|---------------|
| Retail                       | 10.65%            | \$4,712       |
| Financial Services           | 10.23%            | \$6,619       |
| Technology                   | 8.14%             | \$13,607      |
| Healthcare & Pharmaceuticals | 5.01%             | \$10,941      |
| Education                    | 5.85%             | \$4,118       |
| Industrial Goods & Services  | 7.31%             | \$4,955       |
| Energy, Oil & Gas            | 2.71%             | \$5,529       |
| Government                   | 5.22%             | \$4,386       |
| Telco                        | 4.18%             | \$2,877       |
| Travel & Leisure             | 2.71%             | \$4,600       |
| Ecommerce                    | 2.51%             | \$13,541      |
| Engineering & Construction   | 2.09%             | \$16,170      |
| Food & Beverage              | 1.88%             | \$7,431       |
| Automobiles & Aviation       | 2.09%             | \$3,010       |
| Real Estate                  | 1.88%             | \$1,202       |
| Media                        | 3.34%             | \$1,977       |
| Other Industries             | 22.13%            | \$7,431       |

**Total listings: 497 • Average access price: \$7,431**

------------------------------------------------------------------------

Would you like this section formatted as a table or infographic, or
turned into a slide for presentations? Let me know if you'd like to
extend it with actionable recommendations!

Certainly! Here is a polished, corrected, and more concise rewrite of
the provided Digital Shadows report content:

------------------------------------------------------------------------

**Digital Shadows: Control Panels and Web-Shell Access Overview**

------------------------------------------------------------------------

**Control Panels**

**Average Price:** \$304\
**Popular Regions:** North America, Asia\
**Popular Sectors:** Technology, Education

**What Are Control Panels?**\
Control panels are software interfaces that allow users to configure
operating systems and system applications. They come in many forms, with
access often sold by Initial Access Brokers (IABs). A notable example
from 2020 is **cPanel**, a popular web hosting control panel used to
manage websites, domains, email accounts, and server files. Web hosting
providers and site owners use cPanel to manage server resources and
websites efficiently.

Compromised control panels pose significant risks, as they contain
sensitive information such as payment card data and personal user
information. IAB listings for cPanel access typically include details on
the number of active websites, Alexa rankings, and whether the sites
include payment portals.

Another example is **Cloud Control Panels (CCP)**, which manage
cloud-based applications and security settings, such as Web Application
Firewall (WAF) rules, database tables, backups, and domain controller
access. Compromise of a CCP can lead to severe data loss or ransomware
deployment.

------------------------------------------------------------------------

**How Do Threat Actors Use Control Panel Access?**\
Access can be exploited in various ways. For instance, cPanel access to
an e-commerce site with payment capabilities can expose visitor
information, including payment card data and personally identifiable
information (PII), which can be monetized or resold. CCP access can
allow attackers to steal data or use domain controller privileges to
distribute ransomware.

Threat actors generally aim to expand their foothold within victim
networks beyond immediate financial gain.

------------------------------------------------------------------------

**Actor Spotlight: Stari4ok**\
Active on forums like Exploit, Stari4ok advertises access to cPanel and
Web Hosting Manager (WHM) panels, along with occasional credit card
dumps. This actor is engaged in community discussions, offering support
and dispute arbitration. Despite some listings remaining unsold,
evidence suggests Stari4ok has successfully sold multiple access
listings, with overall positive user feedback indicating quality
offerings.

------------------------------------------------------------------------

**Web-Shell Access**

**Average Price:** \$2,845\
**Popular Regions:** North America, Asia, South America\
**Popular Sectors:** Technology, Retail, Government

**What Are Web-Shells?**\
Web-shells are scripts that enable remote administration of web servers
and are often injected through vulnerabilities such as SQL injection,
cross-site scripting (XSS), or file inclusion flaws. While web-shells
can have legitimate uses, malicious actors deploy them to maintain
persistent access, execute commands remotely, conduct man-in-the-middle
attacks, exfiltrate data, or distribute malware.

------------------------------------------------------------------------

**How Do Threat Actors Use Web-Shell Access?**\
A notorious example is the **China Chopper** web-shell, widely used in
espionage and ransomware campaigns, including attacks on
telecommunications firms and distribution of ransomware variants like
Sodinokibi and GandCrab.

Because IABs often do not discriminate between customers, it is
plausible they supply web-shell access to nation-state actors for
cyber-espionage.

------------------------------------------------------------------------

**Actor Spotlight: 7h0rf1nn**\
Active on Exploit and RaidForums, 7h0rf1nn advertises access targeting
education, military, government, and financial organizations in multiple
countries including the US, Portugal, Brazil, and Mexico. While public
forum interest has been limited, feedback from RaidForums indicates some
successful sales, suggesting credible listings.

------------------------------------------------------------------------

**Industries Most Targeted by IABs (2020)**

| **Industry**       | **Percentage of Access Sales** |
|--------------------|--------------------------------|
| Technology         | 22.22%                         |
| Retail             | 17.46%                         |
| Government         | 12.70%                         |
| Education          | 9.52%                          |
| Financial Services | 9.52%                          |
| Media              | 6.35%                          |
| Travel & Leisure   | 4.76%                          |
| E-commerce         | 4.76%                          |
| Unspecified        | 12.70%                         |

------------------------------------------------------------------------

**Industry Insights**

**Retail:**\
Retail was the most frequently targeted sector by IABs in 2020, due to
the volume of sensitive transaction data. Most attacks are financially
motivated rather than nation-state linked. Popular access types include
CMS platforms, especially Magento.

- **Average Access Price:** ~\$4,712

- **Top Regions:** North America (\$6,107), Europe (\$6,108)

**Financial Services:**\
This sector saw rising attacks aligned with remote workforce transitions
in 2020. Extortion via ransomware remains a major threat, with groups
like Egregor, NetWalker, Conti, and Sodinokibi actively targeting this
space.

- **Average Access Price:** North America leads at \$11,439

- **Common Access Types:** Domain admin, VPN, Citrix

**Technology:**\
Tech companies hold valuable data sold on cybercriminal forums, with
average access prices around \$13,607. Access is often used for data
theft, third-party compromise, and ransomware operations.

- **Average Access Price:** \$13,607

- **Common Access Types:** VPN, RDP, Web-shell, Domain user, Citrix

**Healthcare & Pharmaceuticals:**\
Highly targeted due to COVID-19-related research and data, this sector
experienced significant cyber-espionage and financially motivated
attacks.

- **Average Access Price:** \$10,941

- **Top Regions:** North America, Europe, Middle East

------------------------------------------------------------------------

This summary highlights the range of control panel and web-shell access
sold by IABs, their pricing, popular targets, and threat actor behavior,
illustrating the diverse cybercrime landscape impacting multiple
critical sectors worldwide.

------------------------------------------------------------------------

If you'd like, I can also help reformat this into a professional report
style with charts and summaries!

Certainly! Here's a polished, corrected, and better-structured version
of the text you provided:

------------------------------------------------------------------------

**Surge in Ransomware Attacks on Healthcare and Pharmaceutical
Organizations**

Several government agencies have issued security advisories warning
about a significant increase in ransomware attacks targeting healthcare
and pharmaceutical sectors. Accesses gained through these attacks have
proven highly profitable for cybercriminals, with Initial Access Brokers
(IABs) selling such accesses for an average price of \$10,941. The most
frequently mentioned access types on cybercriminal forums included
Remote Desktop Protocol (RDP), domain administrator credentials, and VPN
access.

**Figure 24: Top Access Types for Healthcare Targets**

- 36.36% RDP — 8 posts

- 27.27% Domain User — 6 posts

- 18.18% VPN — 4 posts

- 13.64% Network Access — 3 posts

- 4.55% Citrix — 1 post

------------------------------------------------------------------------

**Regions at Risk**

**North America**\
A majority of attack targets are located in North America, with 80% of
them in the United States. Networks in this region command high value
but are often accessible for relatively low prices, averaging around
\$5,000 for U.S. targets, \$2,000 for Canadian, and \$1,000 for Mexican
networks. These networks are typically accessed remotely or through
compromised Citrix gateways, both of which saw increased use during the
COVID-19 pandemic.

The February 2021 ransomware attack on a Florida water treatment
facility via RDP access highlighted the insufficient cybersecurity
investment in critical American infrastructure. Ransomware operators can
demand higher ransoms when they control critical systems, such as
industrial goods and manufacturing networks (the second most targeted
sector), or when accessing customer data (with retail being the most
targeted sector).

**Figure 25: Top Countries Targeted in North America (2020)**

- United States: 156 posts

- Canada: 33 posts

- Mexico: 6 posts

**Figure 26: Top Industries Targeted in North America**

- Retail: 29.03% (27 posts)

- Industrial Goods and Services: 24.73% (23 posts)

- Financial Services: 21.51% (20 posts)

- Education: 13.98% (13 posts)

- Technology: 10.75% (10 posts)

**Figure 27: Average Price of Access per Country in North America
(2020)**

- United States: \$5,702 (58.43%)

- Canada: \$2,371 (24.30%)

- Mexico: \$1,675 (17.27%)

------------------------------------------------------------------------

**Europe**

Europe is an attractive region for IABs due to its economic powerhouses
and widespread remote work adoption during the pandemic. The UK, with
Europe’s longest lockdown, had the highest number of IAB incidents (18)
in 2020, followed by Italy (14), the first EU country to implement
strict stay-at-home measures.

Average access prices ranged from \$3,000 to \$7,000 in most countries,
with Switzerland and France as notable exceptions—averaging
approximately \$101,000 and \$904 respectively.

**Figure 29: Top Countries Targeted in Europe (2020)**

- United Kingdom: 18 posts

- Italy: 14 posts

- France: 10 posts

- Germany: 6 posts

- Spain: 4 posts

- Switzerland: 3 posts

- Greece: 2 posts

**Figure 30: Top Industries Targeted in Europe (2020)**

- Technology: 23.53% (9 posts)

- Government: 23.53% (8 posts)

- Retail: 17.65% (6 posts)

- Education: 17.65% (6 posts)

- Healthcare and Pharmaceutical: 14.71% (5 posts)

**Figure 31: Average Price of Access in Europe (2020)**

- Switzerland: \$101,745 (81%)

- Europe (general): \$7,475 (5%)

- Italy: \$3,746 (3%)

- Greece: \$3,200 (2.5%)

- United Kingdom: \$3,171 (2.5%)

- Germany: \$2,762 (2%)

- Spain: \$1,766 (1.5%)

- France: \$904 (1%)

------------------------------------------------------------------------

**Middle East**

The Middle East’s economic growth has made it an increasingly popular
target for data breaches, often through account takeovers (ATO)
involving exposed credentials or IABs. Saudi Arabia was heavily targeted
in 2020, with 13 reported IAB incidents and credential prices averaging
\$1,173.

The telecommunications sector faced the most attacks (10 incidents),
followed by financial services (7) and healthcare (5), reflecting
financially motivated actors exploiting pandemic-induced remote work
vulnerabilities.

**Figure 32: Top Countries Targeted in the Middle East (2020)**

- Saudi Arabia: 13 posts

- UAE: 9 posts

- Kuwait: 5 posts

- Egypt: 3 posts

- Turkey: 2 posts

- Israel: 2 posts

**Figure 33: Average Price of Access in the Middle East (2020)**

- Turkey: \$2,800 (32.63%)

- Egypt: \$1,800 (20.97%)

- Saudi Arabia: \$1,173 (13.67%)

- Israel: \$540 (6.22%)

- Kuwait: \$600 (6.99%)

- UAE: \$41 (0.5%)

- Dubai: \$100 (1.17%)

- General Middle East: \$1,529 (17.82%)

**Figure 34: Top Industries Targeted in the Middle East (2020)**

- Telecommunications: 10 posts

- Financial Services: 7 posts

- Healthcare and Pharmaceutical: 5 posts

- Technology: 5 posts

- Government: 5 posts

**Asia**

IAB activity in Asia surged in 2020, with India (16 incidents), Thailand
(8), and the People’s Republic of China (7) being top targets.
Cyber-attacks in India rose by as much as 500% following the March 2020
lockdowns, with phishing to harvest credentials as the most common
tactic.

Financial services, retail, and technology sectors were the hardest hit,
given the premium value of credentials granting access to customer
personally identifiable information (PII), financial data, and
intellectual property.

**Figure 35: Top Countries Targeted in Asia (2020)**

- India: 16 posts

- Thailand: 8 posts

- Singapore: 8 posts

- Pakistan: 7 posts

- PRC: 3 posts

- Japan: 2 posts

- Taiwan: 2 posts

**Figure 36: Average Price of Access in Asia (2020)**

- Singapore: \$8,250 (36.65%)

- Thailand: \$5,268 (23.40%)

- Asia (general): \$2,249 (9.99%)

- Pakistan: \$2,075 (9.22%)

- Taiwan: \$1,825 (8.11%)

- India: \$1,764 (7.84%)

- PRC: \$728 (3.23%)

- Japan: \$350 (1.55%)

**Figure 37: Top Industries Targeted in Asia (2020)**

- Financial Services: 30.30% (10 posts)

- Retail: 24.24% (8 posts)

- Technology: 18.18% (6 posts)

- Telecommunications: 15.15% (5 posts)

- Automobiles and Aviation: 12.12% (4 posts)

------------------------------------------------------------------------

**Australasia**

Australia and New Zealand were also significant targets in 2020.
Australian access listings commanded a high average price of \$66,446,
compared to \$1,500 for New Zealand, despite a smaller data sample.

Financial services was the primary targeted sector, followed by
engineering and construction, education, government, and insurance.

**Figure 38: Top Countries Targeted in Australasia (2020)**

- Australia: 8 posts

- New Zealand: 1 post

**Figure 39: Average Price of Access in Australasia (2020)**

- Australia: \$57,452 (97.46%)

- New Zealand: \$1,500 (2.54%)

**Figure 40: Top Industries Targeted in Australasia (2020)**

- Financial Services: 33.33% (2 posts)

- Engineering and Construction: 16.67% (1 post)

- Education: 16.67% (1 post)

- Government: 16.67% (1 post)

- Insurance: 16.67% (1 post)

------------------------------------------------------------------------

**Mitigation Steps to Block Initial Access Brokers (IABs)**

Given the crucial role of IABs in attack chains, identifying and
blocking their access listings presents an opportunity to prevent
attacks before they occur. Below are key mitigation recommendations by
access type:

**RDP (MITRE ATT&CK T1133)**

- Block RDP connections over the open internet; RDP servers are easily
  found via search engines like Shodan.

- Use Network Level Authentication (NLA).

- Enforce strong, complex password policies and regular password
  expiration for RDP accounts.

- Implement multi-factor authentication (MFA) on RDP gateways.

- Use IP whitelisting where possible to reduce exposure.

- Tunnel RDP connections through secure protocols like SSH or IPSec.

- Minimize and control local and domain admin accounts using Role-Based
  Access Control (RBAC).

- Keep systems patched regularly to mitigate known vulnerabilities.

- Lock out accounts and block IP addresses after multiple failed login
  attempts.

- Use non-descriptive account naming conventions to avoid organizational
  exposure.

## Wordlist Scanning

Wordlists is used for password cracking, stressing authentication
panels, directory brute force.

Wordlists in Kali Linux are dirb, Rockyou, Wfuzz wordlists.

Online wordlists are Github, Seclists, Assetnode, Packetstorm wordlists

Cleaning wordlists

Crafting wordlists are CEWL, Crunch, Cupp

A wordlist is a file (a text file in most cases) that contains a set of
values that the attacker requires to provide to test a mechanism.

Whenever an attacker is faced with an Authentication Mechanism, they can
try to work around it but if that is not possible then the attacker has
to try some well-known credentials into the Authentication Mechanism to
try and guess. This list of well know credentials is a wordlist.

And instead of manually entering the values one by one, the attacker
uses a tool or script to automate this process.

Similarly, in the case of cracking hash values, the tool uses the
wordlists and encodes the entries of wordlists into the same hash and
then uses a string compare function to match the hashes.

If a match is found then hash is deemed as cracked. It can be observed
that the importance of wordlist is paramount in the Cyber Security
World.

In Kali Linux, wordlists are located inside the /usr/share directory.

Here, we have the dirb directory for the wordlists to be used while
using the dirb tool to perform Directory Brute force.
