# Windows Startup, Authentication, and Cloud Security Fundamentals

## Security Monitoring Sources

Security events and incidents can originate from multiple sources, including:

* Operating system event logs
* Application logs
* Network devices
* Cloud platform logs
* Identity providers
* Endpoint security solutions
* Security monitoring platforms

### Common Monitoring Platforms

* Microsoft Defender for Cloud
* Microsoft Defender for Endpoint
* Microsoft Sentinel
* Azure Monitor
* Microsoft Entra ID Sign-in Logs
* Azure Activity Logs
* Azure Resource Logs
* Security tools (alerts and incidents)

### SOC Escalation Workflow

| Role                   | Responsibility                                                                     |
| ---------------------- | ---------------------------------------------------------------------------------- |
| L1 SOC Analyst         | Initial alert triage, validation, and basic investigation                          |
| L2 SOC Analyst         | Incident investigation, containment, and deeper analysis                           |
| L3 SOC Analyst         | Advanced threat hunting, malware analysis, forensic investigation, and remediation |
| Incident Response Team | Handles confirmed security incidents and coordinates recovery                      |

Alerts are evaluated and escalated to higher support tiers as necessary.

---

# Windows Startup Process

Understanding the Windows startup process helps identify abnormal behavior during incident investigations.

## 1. Session Manager

**Process**

```
smss.exe
```

Responsibilities:

* Creates system sessions
* Starts system processes
* Initializes environment variables
* Launches the Client/Server Runtime Subsystem (CSRSS)
* Starts the Windows logon process

---

## 2. Windows Initialization Process

**Process**

```
wininit.exe
```

Starts critical Windows services including:

* Service Control Manager (`services.exe`)
* Local Security Authority (`lsass.exe`)
* Local Session Manager (`lsm.exe`)

---

## 3. Service Control Manager

**Process**

```
services.exe
```

Responsibilities:

* Starts Windows services
* Manages service lifecycle
* Controls automatic service startup

---

## 4. Local Security Authority

**Process**

```
lsass.exe
```

Responsibilities:

* Authenticates users
* Enforces local security policies
* Generates access tokens
* Manages Kerberos and NTLM authentication

---

## 5. Local Session Manager

**Process**

```
lsm.exe
```

Responsibilities:

* Creates user sessions
* Manages Remote Desktop sessions
* Coordinates logon sessions

---

# Windows Sessions

## Session 0

Reserved for:

* Windows services
* System processes

Processes include:

* smss.exe
* csrss.exe
* wininit.exe

---

## User Sessions (Session 1 and Above)

Each logged-on user receives a separate session containing:

* `csrss.exe`
* `winlogon.exe`
* `LogonUI.exe`
* `userinit.exe`
* `explorer.exe`

---

# User Logon Process

## Windows Logon

```
winlogon.exe
```

Responsibilities:

* Handles secure logon (Ctrl+Alt+Delete)
* Starts LogonUI
* Launches Userinit after successful authentication

---

## Logon User Interface

```
LogonUI.exe
```

Responsibilities:

* Displays the Windows sign-in screen
* Collects user credentials
* Passes credentials securely to LSASS

---

## Authentication

```
lsass.exe
```

Authenticates users using:

* Kerberos (default in Active Directory environments)
* NTLM (legacy compatibility)

---

## User Initialization

```
userinit.exe
```

Responsibilities:

* Processes logon scripts
* Restores network connections
* Starts the Windows shell

---

## Common Processes Started by Userinit

| Process                   | Purpose                                        |
| ------------------------- | ---------------------------------------------- |
| explorer.exe              | Desktop, Start Menu, Taskbar, Windows Explorer |
| cmd.exe                   | Executes batch logon scripts                   |
| powershell.exe            | Executes PowerShell logon scripts              |
| wscript.exe / cscript.exe | Runs VBScript and JavaScript logon scripts     |
| gpupdate.exe              | Applies Group Policy updates                   |
| net.exe                   | Maps network drives                            |
| rundll32.exe              | Loads DLL-based startup components             |
| taskhostw.exe             | Hosts DLL-based Windows services               |
| msiexec.exe               | Processes MSI-based application installations  |

---

# Windows Authentication

## Kerberos Authentication

Kerberos is the default authentication protocol for:

* Windows 11
* Windows Server 2022
* Windows Server 2019
* Active Directory domain environments

### Kerberos Benefits

* Mutual authentication
* Ticket-based authentication
* Strong encryption
* Reduced password exposure
* Single Sign-On (SSO)

---

# Defense in Depth

Defense in Depth applies multiple security layers to reduce organizational risk.

## Identity Security

* Microsoft Entra ID
* Multi-Factor Authentication (MFA)
* Conditional Access
* Privileged Identity Management (PIM)

## Network Security

* Azure Firewall
* Network Security Groups (NSGs)
* Web Application Firewall (WAF)
* DDoS Protection
* Secure Remote Access

## Endpoint Security

* Microsoft Defender for Endpoint
* Antimalware
* Endpoint Detection and Response (EDR)
* Patch Management

## Application Security

* Secure Coding
* Secure DevOps
* Static Application Security Testing (SAST)
* Dynamic Application Security Testing (DAST)

## Data Security

* Encryption at rest
* Encryption in transit
* Data Classification
* Data Loss Prevention (DLP)
* Secure File Transfer

---

# Security Domains

## Network Security

* Firewalls
* Network segmentation
* IDS/IPS
* DDoS protection

## Information Security

* Policies
* Standards
* Technical controls
* Risk management
* Compliance

## Application Security

* Authentication
* Authorization
* Encryption
* Logging
* Secure software development

## Operational Security

* Monitoring
* Incident response
* Change management
* Backup and recovery

## End-User Security

* Security awareness
* Endpoint protection
* Identity management

## Disaster Recovery

* Business continuity
* Backup strategies
* Recovery planning
* High availability

---

# Cloud Access Security Broker (CASB)

A Cloud Access Security Broker (CASB) provides centralized security controls between users and cloud services.

## Primary Functions

* Visibility into cloud application usage
* Threat protection
* Data security
* Compliance monitoring
* Enterprise integration

## Supported Cloud Models

* Infrastructure as a Service (IaaS)
* Platform as a Service (PaaS)
* Software as a Service (SaaS)

CASB supports:

* Corporate-managed devices
* Bring Your Own Device (BYOD)
* API-based integrations
* Reverse proxy deployment
* Forward proxy deployment

---

# RACI Matrix

| Role        | Description                                                                                      |
| ----------- | ------------------------------------------------------------------------------------------------ |
| Responsible | Performs the work required to complete the task.                                                 |
| Accountable | Owns the outcome and approves completion. Only one accountable owner should exist for each task. |
| Consulted   | Provides expertise and input before decisions are made.                                          |
| Informed    | Receives updates on progress and outcomes.                                                       |

Example (Security Audit):

| Activity      | Responsible | Accountable        | Consulted       | Informed        |
| ------------- | ----------- | ------------------ | --------------- | --------------- |
| Conduct Audit | IT Auditor  | Lead Auditor / CAE | Cyber Risk Team | Audit Committee |

---

# Microsoft Sentinel Hybrid Deployment

Microsoft Sentinel can collect security telemetry from:

* Azure
* On-premises infrastructure
* Multi-cloud environments
* Microsoft 365
* Microsoft Defender products
* Third-party security solutions

---

# Access Control in Azure and Microsoft Entra

Azure and Microsoft Entra use multiple authorization models depending on the resource.

## Microsoft Entra Objects

* Users
* Groups
* Applications
* Service Principals
* Devices

Access can be granted using:

* Microsoft Entra roles
* Microsoft Graph API permissions
* Object ownership
* Object-specific roles

---

## Azure Resource Hierarchy

```
Root Management Group
    │
Management Groups
    │
Subscriptions
    │
Resource Groups
    │
Resources
    ├── Virtual Machines
    ├── Storage Accounts
    ├── Key Vaults
    ├── Databases
    └── Networking
```

Permissions can be assigned using:

* Azure RBAC
* Azure ABAC (Attribute-Based Access Control)
* Resource-specific access models

Some Azure services, such as Azure Key Vault, implement additional authorization models (for example, Azure RBAC or Key Vault access policies).

> **Note:** There is currently no single Azure portal view that displays all effective permissions across Microsoft Entra ID, Azure RBAC, Microsoft Graph permissions, resource-specific permissions, and ownership assignments for every object in the tenant. Administrators often need to review multiple portals and scopes to determine a user's complete effective access.
