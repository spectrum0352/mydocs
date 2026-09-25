# Azure and Microsoft Entra Concepts

This document provides a comprehensive overview of key Azure identity, governance, service-health, and access-control concepts, including **Microsoft Entra ID, Active Directory Domain Services, Microsoft Entra Connect, Azure Service Health, Azure RBAC, and Azure Policy**.

---

## Table of Contents

1. [Azure Active Directory (Microsoft Entra ID) and Active Directory](#azure-active-directory-microsoft-entra-id-and-active-directory)
2. [Microsoft Entra ID](#microsoft-entra-id)
3. [Active Directory Domain Services](#active-directory-domain-services)
4. [Microsoft Entra Connect](#microsoft-entra-connect)
5. [Microsoft Entra Connect Key Features](#microsoft-entra-connect-key-features)
6. [Azure Service Health](#azure-service-health)
7. [Azure Service Health Components](#azure-service-health-components)
8. [Azure Role-Based Access Control (Azure RBAC)](#azure-role-based-access-control-azure-rbac)
9. [Azure RBAC Role Assignment Model](#azure-rbac-role-assignment-model)
10. [Azure RBAC Example](#azure-rbac-example)
11. [Azure Policy](#azure-policy)
12. [Azure Policy Components](#azure-policy-components)
13. [Azure Policy Evaluation and Enforcement](#azure-policy-evaluation-and-enforcement)
14. [Azure RBAC vs. Azure Policy](#azure-rbac-vs-azure-policy)
15. [Key Security Considerations](#key-security-considerations)
16. [Summary](#summary)

---

# 1. Azure Active Directory (Microsoft Entra ID) and Active Directory

**Azure Active Directory (Azure AD)** has been renamed **Microsoft Entra ID**. Microsoft Entra ID and traditional **Active Directory Domain Services (AD DS)** are both Microsoft identity technologies, but they serve different purposes and are designed for different environments.

A common enterprise architecture may use both technologies together in a **hybrid identity** model.

| Capability               | Microsoft Entra ID                                     | Active Directory Domain Services                              |
| ------------------------ | ------------------------------------------------------ | ------------------------------------------------------------- |
| Primary environment      | Cloud                                                  | On-premises / private network                                 |
| Primary purpose          | Cloud identity and access management                   | Windows domain and network identity                           |
| Authentication           | OAuth 2.0, OpenID Connect, SAML, modern authentication | Kerberos, NTLM, LDAP                                          |
| Device management        | Entra-joined devices                                   | Domain-joined devices                                         |
| Cloud applications       | Native support                                         | Usually requires integration/federation                       |
| SSO                      | Cloud and SaaS applications                            | Windows/domain resources                                      |
| Directory protocol       | REST/Graph-based cloud APIs and modern protocols       | LDAP                                                          |
| Authentication protocols | OAuth 2.0, OpenID Connect, SAML, WS-Fed                | Kerberos, NTLM                                                |
| Typical resources        | Azure, Microsoft 365, SaaS applications                | File shares, printers, Windows servers, internal applications |
| Management boundary      | Tenant                                                 | Active Directory domain/forest                                |
| Typical identity model   | Cloud identity                                         | Domain identity                                               |

---

# 2. Microsoft Entra ID

**Microsoft Entra ID** is Microsoft's cloud-based identity and access management service.

It provides centralized identity management and access control for:

* Azure resources
* Microsoft 365
* Office 365 services
* SaaS applications
* Enterprise applications
* Custom applications
* APIs
* Cloud workloads
* Devices
* Users and groups

Microsoft Entra ID enables organizations to manage authentication and authorization for cloud-based applications and resources.

## Key capabilities

### Identity Management

Microsoft Entra ID manages:

* Users
* Groups
* Service principals
* Managed identities
* Applications
* Enterprise applications
* Devices

### Single Sign-On (SSO)

SSO allows users to authenticate once and access multiple authorized applications without repeatedly entering credentials.

For example:

```text
User
  |
  v
Microsoft Entra ID
  |
  +----> Microsoft 365
  |
  +----> Azure Portal
  |
  +----> SaaS Application
  |
  +----> Enterprise Application
```

### Modern Authentication

Microsoft Entra ID supports modern authentication technologies and protocols, including:

* OAuth 2.0
* OpenID Connect
* SAML 2.0
* WS-Federation

### Conditional Access

Conditional Access can evaluate contextual signals such as:

* User identity
* Group membership
* Device state
* Application
* Location
* Risk
* Authentication strength

and apply controls such as:

* MFA
* Authentication strength
* Device compliance requirements
* Session controls
* Application restrictions
* Access blocking

### Privileged Identity Management

Microsoft Entra Privileged Identity Management (PIM) can provide controlled, time-bound access to privileged roles.

Security controls can include:

* Just-in-time access
* Approval workflows
* MFA
* Access reviews
* Time-limited role activation
* Audit logging

---

# 3. Active Directory Domain Services

**Active Directory Domain Services (AD DS)** is a traditional directory service used primarily for on-premises Windows environments.

It provides centralized management of:

* Users
* Computers
* Groups
* Organizational Units (OUs)
* Domain controllers
* Group Policy
* Network resources

AD DS is commonly used to manage access to internal resources such as:

* File shares
* Printers
* Windows servers
* Domain-joined workstations
* Internal applications
* Network services

## Common AD DS technologies

### Kerberos

Kerberos is the primary authentication protocol used by modern Windows Active Directory environments.

### NTLM

NTLM is an older Windows authentication protocol that may still exist in legacy environments. Organizations should generally reduce unnecessary NTLM usage where technically and operationally feasible.

### LDAP

LDAP is used for directory queries and directory-related operations.

### Group Policy

Group Policy provides centralized configuration and security management for domain-joined Windows systems.

Examples include:

* Password policies
* Windows security settings
* Software configuration
* Firewall configuration
* Audit policies
* User restrictions

---

# 4. Microsoft Entra Connect

**Microsoft Entra Connect** is a Microsoft tool used to integrate on-premises Active Directory with Microsoft Entra ID.

It supports synchronization between on-premises identities and cloud identities, enabling organizations to implement **hybrid identity**.

A simplified architecture is:

```text
On-Premises Environment
-----------------------

Active Directory Domain Services
          |
          v
Microsoft Entra Connect
          |
          v
Microsoft Entra ID
          |
          +----> Microsoft 365
          +----> Azure
          +----> SaaS Applications
          +----> Enterprise Applications
```

Hybrid identity allows organizations to maintain on-premises Active Directory while providing users with access to cloud services.

> **Note:** Microsoft Entra Connect is different from **Microsoft Entra Cloud Sync**, which provides another approach for synchronizing identities between on-premises Active Directory and Microsoft Entra ID.

---

# 5. Microsoft Entra Connect Key Features

## 5.1 Password Hash Synchronization (PHS)

Password Hash Synchronization synchronizes a transformed representation of the user's on-premises password hash to Microsoft Entra ID.

The user's plaintext password is **not synchronized** to Microsoft Entra ID.

PHS allows users to use the same credentials for cloud authentication while Microsoft Entra ID performs authentication against the synchronized password hash.

### Benefits

* Simple deployment
* Reduced dependency on on-premises authentication infrastructure
* Supports cloud authentication during certain on-premises outages
* Helps provide a common identity across environments

---

## 5.2 Pass-Through Authentication (PTA)

Pass-Through Authentication allows users to authenticate against on-premises Active Directory through authentication agents.

The password itself is not synchronized to Microsoft Entra ID.

A simplified flow is:

```text
User
 |
 v
Microsoft Entra ID
 |
 v
PTA Authentication Agent
 |
 v
On-Premises Active Directory
 |
 v
Authentication Result
```

PTA may be useful when organizations require authentication validation against on-premises Active Directory.

### Important consideration

PTA introduces a dependency on the availability of the authentication agents and on-premises Active Directory infrastructure. Organizations should therefore design appropriate redundancy and monitoring.

---

## 5.3 Seamless Single Sign-On

**Seamless SSO** can provide users on corporate networks with a smoother authentication experience for supported Microsoft Entra-integrated applications.

Users may be authenticated without repeatedly being prompted for credentials, depending on the application, authentication flow, device state, and organizational configuration.

---

## 5.4 Hybrid Identity Security Considerations

A hybrid identity architecture should consider:

* Secure Microsoft Entra Connect servers
* Restrict administrative access
* Use dedicated administrative accounts
* Monitor synchronization activity
* Protect synchronization credentials
* Monitor privileged identity changes
* Implement MFA where applicable
* Use Conditional Access
* Monitor authentication failures
* Monitor suspicious synchronization activity
* Maintain redundant authentication infrastructure
* Apply security updates promptly
* Protect domain controllers
* Monitor privileged Active Directory accounts

---

# 6. Azure Service Health

**Azure Service Health** provides information about the health and availability of Azure services that may affect an organization's resources.

It helps organizations:

* Monitor Azure service incidents
* Identify service-impacting issues
* Track planned maintenance
* Review health history
* Configure health alerts
* Understand potential impact
* Support incident response
* Plan for upcoming maintenance

Azure Service Health is particularly useful for operational teams, cloud administrators, security teams, and business continuity teams.

---

# 7. Azure Service Health Components

Azure Service Health includes several important areas.

## 7.1 Service Issues

Service Issues provide information about active Azure service incidents that may affect resources or regions.

Information can include:

* Affected Azure services
* Affected regions
* Current status
* Incident updates
* Potential impact
* Mitigation progress
* Resolution status

Historical incidents can also be reviewed after they have been resolved.

---

## 7.2 Health History

Health History allows organizations to review previous Azure service health events.

Historical information may include:

* Incident summary
* Timeline
* Issue updates
* Affected services
* Affected regions
* Resolution information
* Root Cause Analysis (RCA), where Microsoft provides it

Health history can be useful for:

* Post-incident reviews
* Availability analysis
* Business continuity planning
* Service-level reviews
* Architecture improvement

---

## 7.3 Health Alerts

Health Alerts are customizable notifications that can inform stakeholders about relevant Azure service-health events.

Depending on the configured notification mechanism and available Azure capabilities, alerts can be delivered through channels such as:

* Email
* SMS
* Push notifications
* Other supported notification or automation integrations

Organizations can configure alerts for events such as:

* Service incidents
* Planned maintenance
* Health advisories
* Other relevant service-health events

### Recommended operational approach

Health alerts should be integrated into the organization's:

* ITSM platform
* Incident management process
* Monitoring platform
* Notification system
* SOC/NOC workflows
* Business continuity process

---

# 8. Azure Role-Based Access Control (Azure RBAC)

**Azure Role-Based Access Control (Azure RBAC)** is Azure's authorization system for controlling access to Azure resources.

Azure RBAC helps answer three fundamental questions:

1. **Who** has access?
2. **What** can they do?
3. **Where** can they do it?

The core Azure RBAC model is:

```text
Security Principal
        +
      Role
        +
      Scope
        |
        v
  Role Assignment
```

Azure RBAC follows the principle of **least privilege**, where identities should receive only the permissions required to perform their responsibilities.

---

# 9. Azure RBAC Role Assignment Model

An Azure RBAC role assignment consists primarily of three components:

## 9.1 Security Principal

A **security principal** represents the identity receiving permissions.

Common security principal types include:

* User
* Group
* Service principal
* Managed identity

For example:

```text
User
Group
Service Principal
Managed Identity
       |
       v
Azure RBAC Role
```

---

## 9.2 Role

A role defines the actions that the security principal can perform.

Common built-in roles include:

### Owner

Provides full management access to resources, including the ability to delegate access through role assignments.

### Contributor

Provides broad management permissions over resources but does not allow the user to manage Azure RBAC role assignments.

### Reader

Allows users to view resources but not make configuration changes.

Other specialized built-in roles exist for services such as:

* Networking
* Security
* Storage
* Virtual machines
* Key Vault
* Monitoring
* Databases
* Kubernetes
* Identity

Organizations can also create **custom roles** when built-in roles do not provide the appropriate level of least-privilege access.

---

## 9.3 Scope

Scope defines where the role assignment applies.

Azure RBAC supports a hierarchical scope model:

```text
Management Group
       |
       v
Subscription
       |
       v
Resource Group
       |
       v
Resource
```

Permissions assigned at a higher scope can generally be inherited by child resources.

### Scope levels

1. Management Group
2. Subscription
3. Resource Group
4. Individual Resource

Using the smallest practical scope helps reduce excessive permissions.

---

# 10. Azure RBAC Example

Suppose an organization wants a user to **view all virtual machines within a subscription without making changes**.

The RBAC assignment would be:

```text
Security Principal: User
Role: Reader
Scope: Subscription
```

This allows the user to view resources within the applicable scope while preventing them from making configuration changes through that Reader role.

A more restrictive example would be:

```text
Security Principal: User
Role: Virtual Machine Reader
Scope: Specific Resource Group
```

This provides a narrower permission boundary.

---

# 11. Azure Policy

**Azure Policy** is a governance and compliance service that enables organizations to define, enforce, and assess standards across Azure resources.

Azure Policy can be used to:

* Enforce organizational standards
* Assess resource compliance
* Restrict configurations
* Enforce allowed regions
* Require resource tags
* Enforce security configurations
* Audit resources
* Deny non-compliant deployments
* Deploy required configurations
* Support regulatory compliance

Azure Policy is fundamentally a **governance and resource-compliance control**, whereas Azure RBAC primarily controls **who is authorized to perform actions**.

---

# 12. Azure Policy Components

## 12.1 Policy Definition

A **Policy Definition** contains the rule that Azure Policy evaluates.

For example:

> Every virtual machine must have an `Environment` tag.

A policy definition generally contains:

* Policy rule
* Policy effect
* Parameters
* Metadata

Conceptually:

```text
IF
Resource does not contain required tag
THEN
Audit / Deny / Modify / Deploy
```

---

## 12.2 Policy Assignment

A **Policy Assignment** applies a policy definition to a specific scope.

A policy can be assigned at different scopes, such as:

* Management Group
* Subscription
* Resource Group
* Resource

For example:

```text
Policy Definition
       |
       v
Policy Assignment
       |
       v
Subscription
       |
       +---- Resource Group A
       +---- Resource Group B
       +---- Resource Group C
```

Once assigned, Azure Policy evaluates applicable resources within the assignment scope.

---

## 12.3 Policy Parameters

**Policy Parameters** make policy definitions reusable and configurable.

For example, instead of hardcoding permitted Azure regions, a policy can use a parameter:

```text
Allowed Locations:
- East US
- West Europe
- Central India
```

The same policy definition can then be reused with different parameter values in different environments.

Other examples include parameters for:

* Required tag names
* Required tag values
* Allowed SKUs
* Log Analytics workspace
* Network configuration
* Resource types
* Security settings

---

## 12.4 Initiatives

An **Initiative** is a collection of related policy definitions.

Initiatives are useful when an organization needs to enforce multiple governance or security requirements as a single logical control set.

For example, a security initiative could contain policies requiring:

* Secure network configurations
* Encryption
* Diagnostic logging
* Restricted public access
* Approved regions
* Required tags
* Secure identity configurations

Conceptually:

```text
Initiative
   |
   +-- Policy 1: Require encryption
   |
   +-- Policy 2: Restrict public IPs
   |
   +-- Policy 3: Require diagnostic logs
   |
   +-- Policy 4: Restrict locations
   |
   +-- Policy 5: Require tags
```

Microsoft provides built-in initiatives such as the **Azure Security Benchmark** and other compliance-oriented policy sets.

---

# 13. Azure Policy Evaluation and Enforcement

Azure Policy evaluates resources against assigned policy definitions and determines their compliance state.

Common policy effects include:

| Effect              | Purpose                                                                        |
| ------------------- | ------------------------------------------------------------------------------ |
| `Audit`             | Identifies non-compliant resources without blocking deployment                 |
| `Deny`              | Prevents creation or modification of resources that violate the policy         |
| `Modify`            | Modifies resource properties or adds required configuration where supported    |
| `DeployIfNotExists` | Deploys supporting configuration when required configuration is missing        |
| `Disabled`          | Disables the policy effect                                                     |
| `AuditIfNotExists`  | Audits resources when a related required resource/configuration does not exist |

The exact behavior depends on the policy definition and resource type.

---

## Compliance Evaluation

Azure Policy evaluates resources and provides compliance information.

The compliance view can identify:

* Compliant resources
* Non-compliant resources
* Policy assignments
* Policy definitions
* Compliance percentage
* Resource-level compliance details
* Policy evaluation results

A simplified flow is:

```text
Azure Resources
       |
       v
Azure Policy Evaluation
       |
       +----> Compliant
       |
       +----> Non-Compliant
       |
       v
Compliance Dashboard
       |
       v
Remediation / Governance Action
```

---

# 14. Azure RBAC vs. Azure Policy

Azure RBAC and Azure Policy are complementary controls but solve different security and governance problems.

| Area                                           | Azure RBAC                        | Azure Policy                                     |
| ---------------------------------------------- | --------------------------------- | ------------------------------------------------ |
| Primary purpose                                | Authorization                     | Governance and compliance                        |
| Main question                                  | Who can perform an action?        | Is the resource configured according to policy?  |
| Controls user permissions                      | Yes                               | No                                               |
| Evaluates resource configuration               | No                                | Yes                                              |
| Grants access                                  | Yes                               | No                                               |
| Can deny unauthorized deployment/configuration | Through authorization             | Yes, through applicable policy effects           |
| Supports least privilege                       | Yes                               | Indirectly                                       |
| Uses roles                                     | Yes                               | No                                               |
| Uses policy definitions                        | No                                | Yes                                              |
| Uses assignments                               | Role assignments                  | Policy assignments                               |
| Example                                        | User can read a VM                | VM must not have a public IP                     |
| Example                                        | Contributor can modify a resource | Storage accounts must use approved configuration |

### Example

Consider a virtual machine:

**Azure RBAC:**

> Only authorized administrators can modify the VM.

**Azure Policy:**

> Virtual machines must not have public IP addresses.

Both controls can operate simultaneously.

---

# 15. Key Security Considerations

A secure Azure environment should use Microsoft Entra ID, Azure RBAC, Azure Policy, monitoring, and service-health capabilities together.

## Identity Security

Recommended controls include:

* Enable MFA for privileged and sensitive access.
* Use Conditional Access.
* Apply least privilege.
* Use Privileged Identity Management for eligible privileged roles.
* Avoid permanent administrative access where possible.
* Review privileged role assignments regularly.
* Use managed identities instead of embedded credentials where appropriate.
* Monitor service principals and application permissions.
* Perform periodic access reviews.
* Protect hybrid identity infrastructure.

---

## Azure RBAC Security

Recommended practices include:

* Avoid assigning Owner unnecessarily.
* Minimize Contributor assignments.
* Prefer Reader or specialized roles when possible.
* Use groups for scalable access management.
* Use resource-group or resource-level scopes where practical.
* Create custom roles only when required.
* Regularly review role assignments.
* Remove stale permissions.
* Monitor privileged role changes.
* Use PIM for privileged access.
* Separate administrative responsibilities.

---

## Azure Policy Security

Organizations should establish policies for requirements such as:

* No unauthorized public IP addresses
* Approved Azure regions
* Encryption requirements
* Required resource tags
* Network security controls
* Diagnostic logging
* Defender for Cloud configuration
* Storage security
* Key management requirements
* Private endpoint requirements
* Approved resource types
* Secure TLS configurations
* Resource naming standards

Policies should be tested before moving from `Audit` to enforcement effects such as `Deny`.

---

## Service Health and Operational Security

Azure Service Health should be incorporated into operational processes.

Organizations should:

* Configure appropriate health alerts.
* Monitor affected Azure regions.
* Track planned maintenance.
* Integrate incidents with ITSM processes.
* Review historical service incidents.
* Incorporate service dependencies into business continuity planning.
* Maintain documented incident-response procedures.
* Evaluate application resilience against Azure service dependencies.

---

# 16. Integrated Azure Governance and Security Model

These services work together as part of a broader Azure security architecture:

```text
                         Azure Governance & Security
                                  |
          +-----------------------+-----------------------+
          |                       |                       |
          v                       v                       v
   Microsoft Entra ID        Azure RBAC             Azure Policy
          |                       |                       |
          |                       |                       |
    Identity & IAM          Authorization          Governance &
          |                  & Access Control        Compliance
          |                       |                       |
          +-----------------------+-----------------------+
                                  |
                                  v
                         Azure Resources
                                  |
                    +-------------+-------------+
                    |             |             |
                    v             v             v
                  VMs         Storage        Networks
                    |
                    v
             Monitoring & Security
                    |
                    v
          Azure Monitor / Defender /
              Microsoft Sentinel
```

A hybrid environment can additionally incorporate:

```text
On-Premises Active Directory
             |
             v
 Microsoft Entra Connect
             |
             v
      Microsoft Entra ID
             |
      +------+------+
      |             |
      v             v
 Microsoft 365    Azure
```

---

# Summary

The major concepts covered in this section are:

* **Microsoft Entra ID** is Microsoft's cloud identity and access management service.
* **Active Directory Domain Services (AD DS)** provides traditional Windows domain and on-premises directory services.
* **Microsoft Entra Connect** enables synchronization between on-premises Active Directory and Microsoft Entra ID for hybrid identity scenarios.
* **Password Hash Synchronization (PHS)** synchronizes a derived password representation to Microsoft Entra ID and does not synchronize plaintext passwords.
* **Pass-Through Authentication (PTA)** validates authentication against on-premises Active Directory through authentication agents.
* **Seamless SSO** can provide a smoother authentication experience for users on trusted corporate environments.
* **Azure Service Health** provides information about Azure service incidents, planned maintenance, health history, and configurable health alerts.
* **Azure RBAC** controls who can perform which actions at which Azure scope.
* An Azure RBAC assignment is based on a **security principal, role, and scope**.
* Azure RBAC scopes include **management groups, subscriptions, resource groups, and resources**.
* **Azure Policy** provides governance, compliance, and resource-configuration enforcement.
* **Policy Definitions** define governance rules.
* **Policy Assignments** apply policies to scopes.
* **Policy Parameters** make policies reusable and configurable.
* **Initiatives** group multiple related policy definitions.
* **Compliance Evaluation** identifies resources that conform to or violate assigned policies.
* **Azure RBAC and Azure Policy are complementary**: RBAC controls authorization, while Policy governs resource configuration and compliance.
* A mature Azure security architecture combines **identity security, least privilege, governance, compliance, monitoring, service health, and continuous security assessment**.

> **Key principle:** Microsoft Entra ID establishes identity, Azure RBAC controls authorization, Azure Policy governs resource configuration, and Azure Service Health provides operational visibility into Azure platform health. Together, these capabilities form important building blocks for secure and well-governed Azure environments.
