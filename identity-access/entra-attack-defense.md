# Microsoft Entra ID, Azure RBAC, Managed Identity, and Service Principal
# Attack and Defense Strategy (Red Team & Blue Team Guide)

> **Audience:** Security Architects, Cloud Security Engineers, Red Teams, Blue Teams, SOC Analysts, Penetration Testers, Incident Responders, IAM Engineers
>
> **Platforms:** Microsoft Entra ID, Azure, Microsoft Defender XDR, Microsoft Defender for Cloud, Microsoft Sentinel, Azure RBAC, Azure Key Vault, Azure Managed Identities, Azure Resource Manager (ARM), Microsoft Graph

---

# Overview

Modern Azure environments rely heavily on **Microsoft Entra ID** (formerly Azure Active Directory) as the central Identity and Access Management (IAM) platform. It authenticates users, applications, workloads, managed identities, and cloud services while providing authorization through Azure RBAC.

Over **95% of Fortune 500 organizations** use Microsoft Azure in some capacity, making Microsoft Entra one of the most targeted cloud identity platforms.

A compromise of Microsoft Entra can quickly lead to:

- Complete Azure subscription takeover
- Tenant-wide privilege escalation
- Secret theft
- Data exfiltration
- Lateral movement
- Persistent cloud backdoors
- Hybrid Active Directory compromise
- Supply chain attacks through service principals

Understanding both **offensive techniques** and **defensive controls** is essential for protecting enterprise cloud environments.

---

# Learning Objectives

After completing this guide, you should understand how attackers:

- Perform Microsoft Entra reconnaissance
- Enumerate Azure resources
- Abuse Azure RBAC
- Exploit Service Principals
- Abuse Managed Identities
- Compromise Enterprise Applications
- Escalate privileges
- Move laterally between Azure resources
- Establish persistence
- Exfiltrate sensitive data
- Attack hybrid identities
- Evade monitoring

You should also understand how defenders can:

- Detect attacks
- Harden Azure identities
- Secure RBAC
- Protect Managed Identities
- Monitor Service Principals
- Enable Zero Trust
- Respond to incidents

---

# Microsoft Entra Attack Lifecycle

```text
Recon
        │
        ▼
Initial Access
        │
        ▼
Enumeration
        │
        ▼
Privilege Escalation
        │
        ▼
Credential Access
        │
        ▼
Lateral Movement
        │
        ▼
Persistence
        │
        ▼
Defense Evasion
        │
        ▼
Collection
        │
        ▼
Data Exfiltration
```

---

# Module 1 – Reconnaissance

## Objectives

Understand:

- Tenant structure
- Domains
- Users
- Applications
- Conditional Access
- Authentication methods
- External identities

---

## External Recon

### Domain Enumeration

Discover:

- Tenant ID
- Azure Tenant Name
- Custom Domains
- Federation Status

Examples:

- Tenant discovery
- OpenID configuration
- Microsoft Graph endpoints
- DNS records

---

## Email Enumeration

Identify:

- Valid usernames
- User naming conventions
- Guest accounts

---

## Azure Resource Discovery

Discover:

- Public Storage Accounts
- Azure App Services
- Azure Functions
- Logic Apps
- API Management
- Public IPs
- Key Vault endpoints
- Azure SQL
- Cosmos DB

---

## Enterprise Application Discovery

Identify:

- OAuth Applications
- Multi-tenant Apps
- Enterprise Applications
- API Permissions

---

# Defensive Controls

- Hide unnecessary information
- Disable legacy authentication
- Restrict guest access
- Enable Conditional Access
- Monitor reconnaissance activity
- Restrict public endpoints
- Use Microsoft Defender External Attack Surface Management (EASM)

---

# Module 2 – Initial Access

## Attack Techniques

### Password Attacks

- Password spraying
- Credential stuffing
- Brute force
- MFA fatigue
- Password reuse

---

### Phishing

- OAuth phishing
- Token theft
- Device code phishing
- Adversary-in-the-middle (AiTM)
- Session hijacking

---

### Consent Grant Attacks

Attackers trick users into granting:

- Mail.Read
- Files.Read
- User.Read.All
- Directory.Read.All
- Offline Access

Result:

Application receives long-lived refresh tokens.

---

### Enterprise App Abuse

Abuse:

- Excessive Graph permissions
- Weak admin consent
- Overprivileged applications

---

### Logic Apps Abuse

Possible abuses include:

- Data extraction
- Workflow execution
- Credential theft

---

### Azure Functions Abuse

Compromise:

- Function Keys
- Managed Identity
- Storage Account

---

### Storage Account Exposure

Examples:

- Public blobs
- Anonymous containers
- SAS token leakage

---

# Defensive Controls

- Phishing-resistant MFA (FIDO2, Passkeys)
- Conditional Access
- Defender for Office 365
- Defender for Cloud Apps
- Disable user consent where appropriate
- Admin Consent Workflow
- Risk-based authentication
- Passwordless authentication

---

# Module 3 – Authenticated Enumeration

Once authenticated, attackers enumerate resources.

---

## Microsoft Entra

Enumerate:

- Users
- Groups
- Devices
- Applications
- Service Principals
- Administrative Units
- Administrative Roles

---

## Azure Resource Enumeration

Discover:

- Subscriptions
- Resource Groups
- Virtual Machines
- Storage Accounts
- Key Vaults
- Automation Accounts
- Managed Identities
- App Services
- SQL Databases
- Recovery Services Vaults
- Virtual Networks
- Private Endpoints

---

## Secret Hunting

Search for:

- Connection strings
- Storage keys
- SAS tokens
- Key Vault secrets
- Certificates
- SSH keys
- Deployment templates
- Automation variables
- Runbook credentials

---

# Defensive Controls

- Least privilege
- Reader role restrictions
- Private networking
- Microsoft Defender for Cloud
- Key Vault RBAC
- Disable public access

---

# Module 4 – Azure RBAC Attacks

Azure RBAC is one of the most abused privilege escalation mechanisms.

---

## High-Risk Roles

Examples include:

- Owner
- User Access Administrator
- Contributor
- Privileged Role Administrator
- Global Administrator
- Security Administrator

---

## Privilege Escalation Techniques

- Role assignment abuse
- Custom role abuse
- Privileged Identity Management bypass opportunities
- Subscription inheritance
- Management Group inheritance
- Resource Group inheritance

---

## Dangerous Permissions

Examples:

- `Microsoft.Authorization/*`
- `roleAssignments/write`
- `roleDefinitions/write`
- `elevateAccess`

---

# Defensive Controls

- Least privilege
- Just-In-Time (JIT) access
- Microsoft Entra Privileged Identity Management (PIM)
- Access Reviews
- RBAC auditing
- Deny assignments where appropriate
- Management Group governance

---

# Module 5 – Service Principal Attacks

Service Principals are frequently overprivileged.

---

## Attack Techniques

- Secret extraction
- Certificate theft
- Client secret reuse
- Overprivileged applications
- OAuth abuse
- Graph API abuse
- Credential dumping

---

## Common Targets

- Azure DevOps
- GitHub Actions
- Terraform
- CI/CD pipelines
- Automation Accounts

---

## Persistence

Create:

- New credentials
- New certificates
- Additional secrets
- Hidden applications

---

# Defensive Controls

- Prefer certificates over shared secrets
- Rotate credentials
- Use workload identities
- Monitor credential additions
- Review Graph permissions
- Restrict app registrations

---

# Module 6 – Managed Identity Attacks

Managed Identities eliminate stored credentials but can still be abused.

---

## Attack Surface

### System Assigned Managed Identity

Compromise:

- Virtual Machine
- App Service
- Azure Function
- AKS

---

### User Assigned Managed Identity

Abuse:

- Shared identities
- Cross-resource permissions

---

## Attack Techniques

- Access metadata endpoint
- Token theft
- Key Vault access
- Storage access
- ARM API abuse
- Microsoft Graph abuse

---

## Token Abuse

Obtain:

- ARM tokens
- Storage tokens
- Key Vault tokens
- Graph tokens

---

# Defensive Controls

- Least privilege RBAC
- Monitor token requests
- Restrict Key Vault access
- Network isolation
- Defender for Cloud recommendations
- Identity governance

---

# Module 7 – Lateral Movement

Attackers move across:

- Subscriptions
- Resource Groups
- Azure AD tenants
- Virtual Machines
- Kubernetes clusters
- Hybrid environments

---

## Common Techniques

- Pass-the-PRT
- Pass-the-Certificate
- Token replay
- Managed Identity abuse
- Service Principal abuse
- Azure Bastion abuse
- Azure Arc abuse

---

## Hybrid Identity Attacks

Movement between:

- Azure → On-Premises
- On-Premises → Azure

Targets include:

- Active Directory
- Microsoft Entra Connect
- ADFS
- PKI

---

# Defensive Controls

- Network segmentation
- Privileged Access Workstations (PAWs)
- Tiered administration
- Conditional Access
- Continuous Access Evaluation (CAE)

---

# Module 8 – Persistence

Attackers establish long-term access.

---

## Techniques

- Malicious Enterprise Apps
- Hidden Service Principals
- New credentials
- OAuth grants
- Guest accounts
- Custom RBAC roles
- Automation Runbooks
- Azure Functions
- Logic Apps
- Scheduled workflows

---

# Defensive Controls

- Credential rotation
- Access Reviews
- PIM
- App Governance
- Continuous auditing

---

# Module 9 – Credential Access

Targets include:

- Azure Key Vault
- Automation credentials
- App Service configuration
- Deployment templates
- Azure DevOps secrets
- GitHub secrets
- AKS secrets
- Storage Account keys

---

# Defensive Controls

- Azure Key Vault RBAC
- Customer-managed keys (CMK)
- Secret rotation
- Managed HSM
- Managed Identity

---

# Module 10 – Data Collection & Exfiltration

## High-Value Targets

- Key Vault secrets
- Blob Storage
- Azure SQL
- Cosmos DB
- Microsoft 365
- Exchange Online
- SharePoint Online
- OneDrive
- Microsoft Teams
- Microsoft Graph

---

## Exfiltration Methods

- Graph API
- Storage download
- SAS tokens
- HTTPS
- Azure Functions
- Logic Apps

---

# Defensive Controls

- Microsoft Purview
- Data Loss Prevention (DLP)
- Defender for Cloud Apps
- Sensitivity labels
- Private Endpoints
- Customer Lockbox

---

# Module 11 – Detection, Monitoring, and Response

## Microsoft Security Stack

### Identity

- Microsoft Entra ID Protection
- Identity Protection Risk Policies
- Conditional Access

### Endpoint

- Microsoft Defender for Endpoint

### Cloud

- Microsoft Defender for Cloud

### Applications

- Microsoft Defender for Cloud Apps

### SIEM/SOAR

- Microsoft Sentinel

### Threat Intelligence

- Microsoft Defender Threat Intelligence

---

## Logging Sources

Monitor:

- Sign-in logs
- Audit logs
- Microsoft Graph activity
- Azure Activity Logs
- Azure Resource Logs
- Key Vault logs
- Storage logs
- Defender alerts
- Conditional Access logs
- PIM activation logs
- Managed Identity token requests

---

## Detection Use Cases

Detect:

- Impossible travel
- MFA fatigue
- Password spraying
- OAuth abuse
- Consent grants
- New Service Principal credentials
- Privilege escalation
- Role assignments
- Managed Identity abuse
- Token theft
- Guest account abuse
- Mass downloads
- Key Vault enumeration

---

# Module 12 – Security Hardening

## Identity Security

- Enable MFA for all users
- Use phishing-resistant authentication
- Disable legacy authentication
- Implement passwordless authentication
- Enforce Conditional Access
- Enable Continuous Access Evaluation
- Restrict guest access
- Implement Identity Governance

---

## RBAC Security

- Least privilege
- PIM
- Access Reviews
- Separation of duties
- Custom roles
- Deny assignments
- Quarterly RBAC reviews

---

## Service Principal Security

- Eliminate unused Service Principals
- Rotate credentials regularly
- Prefer certificate authentication
- Limit Graph API permissions
- Monitor credential additions
- Restrict app registration permissions

---

## Managed Identity Security

- Assign only required permissions
- Avoid broad subscription-level access
- Prefer system-assigned identities where appropriate
- Regularly review RBAC assignments
- Monitor token usage
- Restrict network access to metadata endpoints where feasible

---

## Azure Resource Security

- Azure Policy
- Defender for Cloud
- Private Link
- Network Security Groups
- Azure Firewall
- Microsoft Sentinel
- Azure Monitor
- Resource Locks
- Customer-managed keys
- Backup and Recovery

---

# Mapping to MITRE ATT&CK

| ATT&CK Phase | Azure Examples |
|--------------|----------------|
| Reconnaissance | Tenant discovery, domain enumeration |
| Initial Access | Phishing, OAuth consent, password spraying |
| Execution | Azure Functions, Automation Runbooks |
| Persistence | Service Principal credentials, Enterprise Apps |
| Privilege Escalation | Azure RBAC abuse, PIM abuse, role assignments |
| Defense Evasion | Token replay, log tampering, disabling monitoring |
| Credential Access | Key Vault, secrets, certificates |
| Discovery | Microsoft Graph, ARM enumeration |
| Lateral Movement | Pass-the-PRT, Managed Identity abuse |
| Collection | Blob Storage, Microsoft Graph |
| Exfiltration | Storage Accounts, Graph API, HTTPS |
| Impact | Resource deletion, ransomware, encryption, service disruption |

---

# Blue Team Checklist

## Identity

- [ ] Enable MFA for all users
- [ ] Disable legacy authentication
- [ ] Enforce Conditional Access
- [ ] Enable Identity Protection
- [ ] Configure Risk Policies
- [ ] Review guest users regularly

## Azure RBAC

- [ ] Review privileged role assignments
- [ ] Enable PIM
- [ ] Conduct periodic Access Reviews
- [ ] Audit custom roles
- [ ] Remove unused permissions

## Service Principals

- [ ] Remove unused Service Principals
- [ ] Rotate secrets and certificates
- [ ] Review Graph API permissions
- [ ] Restrict application registration rights

## Managed Identities

- [ ] Audit Managed Identity permissions
- [ ] Remove excessive RBAC assignments
- [ ] Monitor token requests
- [ ] Review access to Key Vault and Storage

## Monitoring

- [ ] Enable Microsoft Sentinel
- [ ] Enable Microsoft Defender for Cloud
- [ ] Collect Microsoft Entra logs
- [ ] Enable Azure Activity Logs
- [ ] Enable Key Vault diagnostics
- [ ] Monitor RBAC changes
- [ ] Alert on new privileged assignments
- [ ] Detect suspicious OAuth consent grants

---

# Key Takeaways

- Microsoft Entra ID is the foundation of Azure identity security and a primary attack target.
- Azure RBAC misconfigurations are among the most common causes of cloud privilege escalation.
- Service Principals and Managed Identities require strict governance and least-privilege permissions.
- Continuous monitoring with Microsoft Sentinel, Microsoft Defender XDR, and Microsoft Defender for Cloud is essential for detecting identity-based attacks.
- Implement Zero Trust principles, Privileged Identity Management (PIM), Conditional Access, phishing-resistant MFA, and regular access reviews to reduce the attack surface.
- Security should address the entire attack lifecycle—from reconnaissance and initial access to detection, response, recovery, and continuous improvement.