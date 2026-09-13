# Identity and Access Management (IAM) Reconnaissance & Footprinting

> **Purpose:** This guide provides an overview of Identity and Access Management (IAM) reconnaissance techniques used during authorized security assessments, penetration testing, Active Directory audits, and Microsoft Entra ID security reviews.
>
> **Scope:** Microsoft Entra ID (Azure AD), Active Directory, Hybrid Identity, Azure AD Connect (Entra Connect), Windows Domain, LDAP, Kerberos, NTLM, DNS, Group Policy, Identity Infrastructure.
>
> **Note:** Perform these activities only with proper authorization.

---

# IAM Reconnaissance Objectives

The objective of IAM reconnaissance is to identify:

- Identity providers
- Authentication mechanisms
- Active Directory domains
- Microsoft Entra tenants
- Domain controllers
- Organizational Units (OUs)
- Forests and trusts
- User accounts
- Groups
- Administrative accounts
- Privileged roles
- Service accounts
- Computers and servers
- Group Policy Objects (GPOs)
- Kerberos configuration
- LDAP configuration
- DNS information
- Certificate Services (AD CS)
- Federation services (ADFS)
- Azure AD Connect / Entra Connect
- Conditional Access implementation
- Multi-Factor Authentication (MFA)
- Hybrid identity configuration

---

# Phase 1 – Local Identity Enumeration

## Current Logged-in User

```cmd
whoami
```

Displays the currently logged-in user.

Example:

```text
corp\john
```

---

## User Principal Name (UPN)

```cmd
whoami /upn
```

Example:

```text
john@company.com
```

---

## Fully Qualified Domain Name (FQDN)

```cmd
whoami /fqdn
```

Displays the fully qualified domain name of the user.

---

## Logon ID

```cmd
whoami /logonid
```

Displays the current logon session identifier.

---

## Security Identifier (SID)

```cmd
whoami /user
```

Displays the SID of the current user.

Example:

```text
S-1-5-21-XXXXXXXX
```

---

## Group Membership

```cmd
whoami /groups
```

Displays all security groups associated with the current user.

Examples:

- Domain Users
- Domain Admins
- Enterprise Admins
- Backup Operators
- Remote Desktop Users

---

## User Privileges

```cmd
whoami /priv
```

Displays security privileges assigned to the current user.

Examples:

- SeDebugPrivilege
- SeBackupPrivilege
- SeImpersonatePrivilege
- SeRestorePrivilege
- SeShutdownPrivilege

---

## Complete User Information

```cmd
whoami /all
```

Displays:

- User
- SID
- Groups
- Privileges
- Logon ID
- Integrity level

---

# Phase 2 – Domain Enumeration

## Computer Name

```cmd
hostname
```

or

```cmd
echo %COMPUTERNAME%
```

---

## Domain Name

```cmd
echo %USERDOMAIN%
```

---

## Logon Server

```cmd
echo %LOGONSERVER%
```

---

## Fully Qualified Domain

```cmd
systeminfo | findstr /B /C:"Domain"
```

---

## Network Configuration

```cmd
ipconfig /all
```

Identify:

- DNS Servers
- Domain Suffix
- DHCP
- IP Address
- Gateway

---

# Phase 3 – Active Directory Reconnaissance

## Enumerate Domain Information

```cmd
net config workstation
```

---

## Domain Users

```cmd
net user /domain
```

---

## Domain Groups

```cmd
net group /domain
```

---

## Domain Administrators

```cmd
net group "Domain Admins" /domain
```

---

## Enterprise Administrators

```cmd
net group "Enterprise Admins" /domain
```

---

## Domain Controllers

```cmd
nltest /dclist:<domain>
```

Example:

```cmd
nltest /dclist:contoso.com
```

---

## Verify Domain Trust

```cmd
nltest /domain_trusts
```

---

## Discover Current Domain Controller

```cmd
echo %LOGONSERVER%
```

or

```cmd
nltest /dsgetdc:<domain>
```

---

## Enumerate Domain Policy

```cmd
net accounts /domain
```

Displays:

- Password policy
- Lockout policy
- Password age
- Password history

---

# Phase 4 – Active Directory PowerShell Enumeration

## Current Domain

```powershell
Get-ADDomain
```

---

## Forest Information

```powershell
Get-ADForest
```

---

## Domain Controllers

```powershell
Get-ADDomainController -Filter *
```

---

## List Users

```powershell
Get-ADUser -Filter *
```

---

## List Computers

```powershell
Get-ADComputer -Filter *
```

---

## List Groups

```powershell
Get-ADGroup -Filter *
```

---

## List Organizational Units

```powershell
Get-ADOrganizationalUnit -Filter *
```

---

## List Service Accounts

```powershell
Get-ADServiceAccount -Filter *
```

---

# Phase 5 – DNS Enumeration

## View DNS Cache

```cmd
ipconfig /displaydns
```

---

## Flush DNS Cache

```cmd
ipconfig /flushdns
```

---

## Query DNS

```cmd
nslookup
```

---

## Lookup Domain Controller

```cmd
nslookup <dc-name>
```

---

## Lookup SRV Records

```cmd
nslookup
set type=SRV
_ldap._tcp.dc._msdcs.<domain>
```

---

# Phase 6 – LDAP Enumeration

Identify:

- LDAP servers
- Global Catalog
- Naming Context
- User objects
- Group objects
- Organizational Units
- Service Accounts

Common LDAP ports:

- TCP 389
- TCP 636 (LDAPS)

---

# Phase 7 – Kerberos Enumeration

Identify:

- Kerberos realm
- KDC
- SPNs
- Service Accounts
- Delegation

Kerberos port:

- TCP/UDP 88

---

# Phase 8 – Microsoft Entra ID Reconnaissance

Identify:

- Tenant Name
- Tenant ID
- Verified Domains
- Authentication Methods
- MFA Status
- Conditional Access
- Identity Protection
- Enterprise Applications
- App Registrations
- Administrative Roles
- Hybrid Identity
- B2B Collaboration
- B2C Configuration
- Privileged Identity Management (PIM)
- Cross-Tenant Access
- External Identities

---

## Azure PowerShell

Connect to Microsoft Entra:

```powershell
Connect-AzAccount
```

View tenant:

```powershell
Get-AzTenant
```

View subscriptions:

```powershell
Get-AzSubscription
```

---

## Microsoft Graph PowerShell

Connect:

```powershell
Connect-MgGraph
```

Current organization:

```powershell
Get-MgOrganization
```

List users:

```powershell
Get-MgUser
```

List groups:

```powershell
Get-MgGroup
```

List service principals:

```powershell
Get-MgServicePrincipal
```

List applications:

```powershell
Get-MgApplication
```

---

# Phase 9 – Hybrid Identity Enumeration

Identify:

- Azure AD Connect / Entra Connect
- Password Hash Synchronization (PHS)
- Pass-through Authentication (PTA)
- Federation (ADFS)
- Seamless SSO
- Sync server
- Synchronization schedule

---

# Phase 10 – Group Policy Enumeration

Generate Group Policy report:

```cmd
gpresult /r
```

Detailed report:

```cmd
gpresult /h gpresult.html
```

Review:

- Applied GPOs
- Security Settings
- User Rights
- Scripts
- Software Deployment
- Firewall Policies

---

# Phase 11 – Certificate Services (AD CS)

Identify:

- Enterprise CA
- Certificate Templates
- Enrollment Permissions
- Web Enrollment
- Certificate Authorities

---

# Phase 12 – Shares and Resources

Shared folders:

```cmd
net share
```

Mapped drives:

```cmd
net use
```

Nearby systems:

```cmd
net view
```

Domain computers:

```cmd
net view /domain
```

---

# Phase 13 – Local System Information

Operating system:

```cmd
systeminfo
```

Installed patches:

```cmd
wmic qfe
```

Running services:

```cmd
sc query
```

Processes:

```cmd
tasklist
```

Scheduled tasks:

```cmd
schtasks /query
```

---

# Phase 14 – Network Discovery

Active connections:

```cmd
netstat -ano
```

Routing table:

```cmd
route print
```

ARP cache:

```cmd
arp -a
```

---

# Information Commonly Collected During IAM Reconnaissance

- Domain name
- Forest name
- Organizational Units (OUs)
- Domain Controllers
- DNS servers
- Global Catalog servers
- Domain trusts
- User accounts
- Administrative users
- Privileged groups
- Service accounts
- Computer objects
- Group Policy Objects
- Security identifiers (SIDs)
- Password policy
- Account lockout policy
- Kerberos configuration
- LDAP configuration
- Certificate Services
- Microsoft Entra tenant information
- Enterprise Applications
- App Registrations
- Conditional Access policies
- MFA configuration
- PIM roles
- Managed identities
- Hybrid identity configuration
- Azure AD Connect / Entra Connect
- Federation services (ADFS)
- Authentication methods
- Identity synchronization
- Network topology
- Shared resources
- Running services
- Installed software

---

# Defensive Recommendations

- Enforce Multi-Factor Authentication (MFA).
- Implement the principle of least privilege.
- Use Microsoft Entra Privileged Identity Management (PIM).
- Secure service accounts and managed identities.
- Restrict anonymous LDAP and SMB enumeration.
- Disable legacy authentication (NTLM where possible).
- Monitor Kerberos and LDAP activity.
- Audit administrative group memberships regularly.
- Protect Active Directory Certificate Services (AD CS).
- Enable Microsoft Defender for Identity.
- Monitor Microsoft Entra sign-in and audit logs.
- Implement Conditional Access policies.
- Review Group Policy Objects (GPOs) regularly.
- Harden domain controllers and administrative workstations.
- Continuously monitor identity-related events using a SIEM such as Microsoft Sentinel.
