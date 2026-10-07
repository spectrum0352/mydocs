# Azure Bastion Attack Techniques & Attack Scenarios

## Purpose

Although Azure Bastion significantly reduces the attack surface by eliminating exposed RDP and SSH ports, it is **not immune to compromise**. Attackers typically target the identities, Azure control plane, or surrounding Azure infrastructure rather than Azure Bastion itself.

This document describes common attack techniques, attack scenarios, and attack flows associated with Azure Bastion deployments.

---

## MITRE ATT&CK Mapping

| Tactic | Technique |
|---------|-----------|
| Initial Access | Valid Accounts (T1078) |
| Credential Access | Steal Access Tokens (T1528) |
| Credential Access | OS Credential Dumping (T1003) |
| Privilege Escalation | Abuse Elevation Control Mechanism (T1548) |
| Discovery | Cloud Service Discovery (T1526) |
| Discovery | Network Service Discovery (T1046) |
| Lateral Movement | Remote Services (T1021) |
| Persistence | Additional Cloud Roles (T1098.003) |
| Persistence | Account Manipulation (T1098) |
| Collection | Data from Local System (T1005) |
| Exfiltration | Exfiltration Over Web Services (T1567) |
| Defense Evasion | Modify Cloud Compute Infrastructure (T1578) |

---

## Attack Surface

Azure Bastion itself is a managed PaaS service. Attackers generally target:

- Microsoft Entra ID identities
- Azure RBAC permissions
- Azure Portal sessions
- Azure CLI authentication
- Browser authentication tokens
- Virtual Machines reachable through Bastion
- Azure Resource Manager (ARM)
- Azure Activity Logs
- Bastion configuration
- Azure subscriptions
- Azure networking

---

## Attack Scenario 1 – Stolen Azure Administrator Credentials

### Objective

Gain remote access to Azure virtual machines.

### Attack Flow

```flow
Phishing
        │
        ▼
Steal Azure Administrator Credentials
        │
        ▼
Authenticate to Azure Portal
        │
        ▼
Pass MFA (or steal session token)
        │
        ▼
Locate Azure Bastion
        │
        ▼
Connect to VM
        │
        ▼
Interactive Remote Access
        │
        ▼
Credential Dumping
        │
        ▼
Lateral Movement
```

#### Indicators

- Successful login from unusual location
- New browser fingerprint
- Bastion session initiated
- Privileged VM access

#### Mitigation

- MFA
- Conditional Access
- Identity Protection
- PIM
- Session monitoring

---

## Attack Scenario 2 – OAuth Token Theft

### Objectives

Reuse stolen Azure authentication tokens.

### Attack Flow

```flow
Compromise Administrator Workstation
        │
        ▼
Steal Azure Portal Cookies
        │
        ▼
Reuse Session Token
        │
        ▼
Open Azure Portal
        │
        ▼
Launch Azure Bastion
        │
        ▼
Access Internal VM
```

#### Indicators

- Session without new authentication
- Impossible travel
- New browser device
- Bastion session immediately after token reuse

#### Mitigation

- Short token lifetime
- Conditional Access
- Continuous Access Evaluation
- Endpoint Detection & Response

---

## Attack Scenario 3 – Azure RBAC Privilege Escalation

### Objective

Gain permission to use Azure Bastion.

### Attack Flow

```flow
Compromise Contributor Account
        │
        ▼
Enumerate Azure Roles
        │
        ▼
Exploit Misconfigured RBAC
        │
        ▼
Assign VM Login Role
        │
        ▼
Launch Bastion Session
        │
        ▼
Access Target VM
```

#### Indicators

- New role assignment
- Activity Log changes
- Unexpected privilege elevation

#### Mitigation

- Least privilege
- PIM
- RBAC monitoring
- Azure Policy

---

## Attack Scenario 4 – Compromised Azure Portal Session

### Objective

Hijack an authenticated Azure Portal session.

### Attack Flow

```flow
Malware on Administrator Laptop
        │
        ▼
Steal Browser Session
        │
        ▼
Azure Portal Already Authenticated
        │
        ▼
Open Azure Bastion
        │
        ▼
Access Production VM
```

#### Indicators

- Browser cookie theft
- Impossible travel
- New IP address
- Bastion session

#### Mitigation

- Microsoft Defender for Endpoint
- Browser protection
- Device Compliance
- Conditional Access

---

## Attack Scenario 5 – Insider Abuse

### Objective

Abuse legitimate Bastion access.

### Attack Flow

```flow
Authorized Administrator
        │
        ▼
Connect via Bastion
        │
        ▼
Download Sensitive Data
        │
        ▼
Create Backdoor
        │
        ▼
Delete Evidence
```

#### Indicators

- Large file transfers
- Off-hours access
- Multiple VM connections
- Suspicious PowerShell

#### Mitigation

- Session Recording
- Just-in-Time Access
- Least Privilege
- Audit Reviews

---

## Attack Scenario 6 – Compromised VM After Bastion Login

### Objective

Move laterally after obtaining VM access.

### Attack Flow

```flow
Azure Bastion
        │
        ▼
Authenticate to VM
        │
        ▼
Dump Credentials
        │
        ▼
Extract Kerberos Tickets
        │
        ▼
Move to Other Systems
        │
        ▼
Compromise Domain
```

#### Common Techniques

- Mimikatz
- LSASS dumping
- Pass-the-Hash
- Pass-the-Ticket
- Kerberoasting

#### Mitigation

- Defender for Endpoint
- Credential Guard
- LAPS
- Local Admin Restrictions

---

## Attack Scenario 7 – Managed Identity Abuse

### Objective

Steal Azure access tokens from the VM.

### Attack Flow

```flow
Azure Bastion
        │
        ▼
Login to VM
        │
        ▼
Query Instance Metadata Service
        │
        ▼
Retrieve Managed Identity Token
        │
        ▼
Access Azure Resources
```

#### Target Resources

- Key Vault
- Storage Account
- Azure SQL
- Cosmos DB
- ARM APIs

#### Mitigation

- Least privilege managed identities
- Monitor IMDS access
- Defender for Cloud alerts

---

## Attack Scenario 8 – Azure Key Vault Discovery

### Objective

Steal secrets.

### Attack Flow

```flow
Access VM
        │
        ▼
Azure CLI Login
        │
        ▼
Enumerate Subscription
        │
        ▼
Locate Key Vault
        │
        ▼
Download Secrets
```

#### Mitigation

- Private Endpoints
- RBAC
- Key Vault Firewall
- Logging

---

## Attack Scenario 9 – Data Exfiltration

### Objective

Steal sensitive information.

### Attack Flow

```flow
Azure Bastion Login
        │
        ▼
Compress Sensitive Files
        │
        ▼
Upload to Cloud Storage
        │
        ▼
Delete Local Evidence
```

#### Indicators

- Large archive files
- PowerShell compression
- External uploads
- Unusual network traffic

#### Mitigation

- Microsoft Defender for Endpoint
- Microsoft Purview
- DLP
- Network monitoring

---

## Attack Scenario 10 – Persistence Through Azure Resources

### Objective

Maintain long-term access.

### Attack Flow

```flow
Compromise Azure VM
        │
        ▼
Create New Administrator
        │
        ▼
Install Remote Access Tool
        │
        ▼
Modify Startup Tasks
        │
        ▼
Reconnect Through Bastion
```

#### Mitigation

- File Integrity Monitoring
- Defender for Servers
- Configuration Monitoring
- Endpoint Detection

---

## Attack Scenario 11 – Azure CLI Credential Abuse

### Objective

Use stolen Azure CLI credentials.

### Attack Flow

```flow
Compromise Developer Machine
        │
        ▼
Steal Azure CLI Tokens
        │
        ▼
Enumerate Resources
        │
        ▼
Locate Bastion Host
        │
        ▼
Connect to Target VM
```

#### Indicators

- Azure CLI from unusual IP
- Unexpected Bastion usage
- Azure Activity Log events

#### Mitigation

- Conditional Access
- Device Compliance
- Short-lived Tokens

---

## Attack Scenario 12 – Resource Discovery

### Objective

Identify high-value Azure assets.

### Attack Flow

```flow
Compromise Azure Identity
        │
        ▼
Enumerate Resource Groups
        │
        ▼
Enumerate Virtual Machines
        │
        ▼
Locate Bastion
        │
        ▼
Identify High-Value Targets
```

#### Discovery Commands

```bash
az vm list

az network bastion list

az network nic list

az network vnet list

az account show

az role assignment list
```

---

## Attack Scenario 13 – Malicious Azure Administrator

### Objective

Abuse legitimate administrative privileges.

### Attack Flow

```flow
Administrator Login
        │
        ▼
Azure Bastion
        │
        ▼
Connect to Multiple VMs
        │
        ▼
Collect Sensitive Data
        │
        ▼
Delete Audit Evidence
```

#### Mitigation

- Session Recording
- Immutable Logging
- Separation of Duties
- Regular Access Reviews

---

## Common Post-Exploitation Activities

After gaining access through Azure Bastion, attackers commonly:

- Enumerate local administrators
- Dump credentials
- Harvest browser credentials
- Steal Azure CLI tokens
- Query Instance Metadata Service (IMDS)
- Enumerate Managed Identities
- Discover Azure subscriptions
- Enumerate Key Vaults
- Discover Storage Accounts
- Access Azure SQL databases
- Install persistence mechanisms
- Create scheduled tasks
- Deploy malware
- Encrypt files (ransomware)
- Exfiltrate sensitive data
- Delete forensic evidence

---

## Indicators of Compromise (IoCs)

Watch for:

- Unusual Bastion connection times
- Multiple failed Bastion logins
- Administrator logins from new locations
- Impossible travel events
- New RBAC role assignments
- Unexpected PIM activations
- New local administrator accounts
- PowerShell execution immediately after login
- Azure CLI activity on production servers
- Managed Identity token requests
- Large outbound data transfers
- Access to multiple VMs in a short period
- Suspicious Azure Activity Log events

---

## Detection Opportunities

Monitor the following telemetry sources:

- Azure Activity Logs
- Azure Bastion Diagnostic Logs
- Microsoft Entra ID Sign-in Logs
- Microsoft Entra Audit Logs
- Azure Monitor
- Log Analytics Workspace
- Microsoft Defender for Cloud
- Microsoft Defender for Endpoint
- Microsoft Defender for Identity
- Microsoft Sentinel Analytics Rules
- Windows Security Event Logs
- Linux Syslog
- Azure Resource Graph

---

## Security Recommendations

- Eliminate public IP addresses from all production VMs.
- Require Microsoft Entra ID authentication with phishing-resistant MFA.
- Protect privileged access using Microsoft Entra Privileged Identity Management (PIM).
- Enable Conditional Access for all Azure administrators.
- Use Azure Bastion Premium with Session Recording for privileged environments.
- Forward all Bastion, Activity, and Sign-in logs to Microsoft Sentinel.
- Monitor Azure RBAC changes and PIM activations continuously.
- Apply Microsoft Defender for Endpoint to all Bastion-accessible VMs.
- Restrict Managed Identity permissions using least privilege.
- Perform regular reviews of Bastion access, RBAC assignments, and audit logs to detect unauthorized activity.
- Treat Azure Bastion as a secure access broker, but assume that compromise of an administrator identity can still lead to full VM compromise; therefore, prioritize identity security, continuous monitoring, and Zero Trust controls.
