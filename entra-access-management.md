# Microsoft Entra Access Management

## Overview

Microsoft Entra Access Management defines how identities are granted permissions to access and manage resources across Microsoft Entra ID, Azure, Microsoft 365, and other integrated services.

It leverages:

* Role-Based Access Control (RBAC)
* Microsoft Entra directory roles
* Privileged Identity Management (PIM)
* Conditional Access
* Access Reviews

The primary objective is to enforce the **Principle of Least Privilege (PoLP)** while maintaining operational efficiency and security.

---

## Access Management Architecture

```text
                    Microsoft Entra ID
                             │
         ┌───────────────────┼───────────────────┐
         │                   │                   │
         ▼                   ▼                   ▼

 Directory Roles      Azure RBAC Roles     Application Roles
 (Identity Mgmt)     (Resource Mgmt)      (App Permissions)

         │                   │                   │
         ▼                   ▼                   ▼

 Users & Groups    Azure Resources      Enterprise Applications
 Policies          Subscriptions        SaaS Applications
 Authentication    Resource Groups      Custom Applications
```

---

# Types of Roles

Microsoft environments use three primary role models.

## 1. Azure Roles (Azure RBAC)

Azure RBAC roles control access to Azure resources.

### Common Resources

* Virtual Machines
* Storage Accounts
* Networking Resources
* Azure Key Vault
* Databases
* Resource Groups
* Subscriptions

### Common Built-In Roles

| Role                        | Description                              |
| --------------------------- | ---------------------------------------- |
| Owner                       | Full access, including role assignments  |
| Contributor                 | Manage resources but cannot assign roles |
| Reader                      | Read-only access                         |
| User Access Administrator   | Manage access assignments                |
| Virtual Machine Contributor | Manage virtual machines                  |
| Network Contributor         | Manage networking resources              |

### RBAC Scope Hierarchy

```text
Management Group
        │
        ▼
Subscription
        │
        ▼
Resource Group
        │
        ▼
Resource
```

Permissions inherited from higher scopes flow down to lower scopes.

---

## 2. Microsoft Entra ID Roles

Microsoft Entra roles manage identity and directory resources.

### Managed Resources

* Users
* Groups
* Devices
* Applications
* Authentication Methods
* Security Policies
* Licenses
* Domains

### Common Built-In Roles

| Role                             | Description                        |
| -------------------------------- | ---------------------------------- |
| Global Administrator             | Full tenant administration         |
| User Administrator               | Manage users and groups            |
| Security Administrator           | Manage security configurations     |
| Conditional Access Administrator | Manage Conditional Access policies |
| Authentication Administrator     | Manage authentication methods      |
| Helpdesk Administrator           | Reset passwords and assist users   |
| Application Administrator        | Manage enterprise applications     |
| Privileged Role Administrator    | Manage role assignments            |

### Scope

Entra roles are generally assigned at the tenant level, although some support administrative units for delegated administration.

---

## 3. Classic Subscription Administrator Roles (Legacy)

Legacy Azure administration roles include:

* Account Administrator
* Service Administrator
* Co-Administrator

### Important

These roles are considered legacy and should be replaced with Azure RBAC wherever possible.

Modern environments should use:

* Azure RBAC roles
* Privileged Identity Management (PIM)
* Just-In-Time (JIT) access

---

# Azure RBAC vs Microsoft Entra Roles

| Feature          | Azure RBAC Roles                      | Microsoft Entra Roles                    |
| ---------------- | ------------------------------------- | ---------------------------------------- |
| Purpose          | Manage Azure resources                | Manage identities and directory services |
| Scope            | Azure resources                       | Microsoft Entra tenant                   |
| Examples         | Virtual Machines, Storage, Networking | Users, Groups, Authentication, Policies  |
| Assignment Level | Resource hierarchy                    | Tenant-wide or Administrative Units      |
| Security Focus   | Resource administration               | Identity administration                  |

---

# Identity Management in Microsoft Entra ID

Microsoft Entra ID serves as the central identity provider for modern organizations.

## Core Functions

### Authentication

Verifies user identity through:

* Single Sign-On (SSO)
* Multi-Factor Authentication (MFA)
* Passwordless Authentication
* Certificate-Based Authentication (CBA)

### Authorization

Determines what resources a user can access through:

* Azure RBAC
* Entra Roles
* Application Roles
* Conditional Access Policies

---

## Supported Identity Types

### Cloud-Only Identities

```text
User
  │
  ▼
Microsoft Entra ID
```

Accounts exist only in the cloud.

---

### Hybrid Identities

```text
Active Directory
        │
        ▼
Microsoft Entra Connect / Cloud Sync
        │
        ▼
Microsoft Entra ID
```

Accounts originate from on-premises Active Directory and synchronize to Microsoft Entra ID.

---

### External Identities

Supports:

* Business-to-Business (B2B)
* Business-to-Consumer (B2C)
* Partner collaboration
* Guest users

---

# Privileged Identity Management (PIM)

Microsoft Entra Privileged Identity Management provides just-in-time administrative access.

## Benefits

* Reduces standing privileges
* Limits exposure to privileged accounts
* Improves auditability
* Supports approval workflows

### Typical Workflow

```text
Eligible Administrator
         │
         ▼
Request Activation
         │
         ▼
MFA Verification
         │
         ▼
Approval (Optional)
         │
         ▼
Temporary Privileged Access
```

### Recommended Roles for PIM

* Global Administrator
* Security Administrator
* Privileged Role Administrator
* Owner
* User Access Administrator

---

# Access Reviews

Access Reviews help organizations validate whether users still require assigned permissions.

Review:

* Group memberships
* Application access
* Guest accounts
* Administrative roles

Benefits:

* Reduces privilege creep
* Supports compliance requirements
* Improves governance

---

# Conditional Access

Conditional Access provides policy-based access control.

### Common Conditions

* User or group
* Device compliance
* Geographic location
* Application
* Sign-in risk
* User risk

### Common Controls

* Require MFA
* Block access
* Require compliant devices
* Require approved applications
* Require passwordless authentication

---

# Enterprise Access Management Model

A recommended enterprise model:

```text
Tier 0
│
├── Global Administrators
├── Privileged Role Administrators
└── Identity Infrastructure

Tier 1
│
├── Server Administrators
├── Security Administrators
└── Platform Administrators

Tier 2
│
├── Helpdesk
├── Business Administrators
└── Application Owners
```

Administrative accounts should be separated from standard user accounts.

---

# Security Best Practices

## Least Privilege

* Assign only required permissions.
* Remove unnecessary access promptly.
* Review permissions regularly.

## Administrative Security

* Limit the number of Global Administrators.
* Use dedicated administrative accounts.
* Protect privileged accounts with MFA.

## Privileged Access

* Enable Privileged Identity Management (PIM).
* Use Just-In-Time (JIT) access.
* Require approval for sensitive roles.

## Governance

* Perform regular access reviews.
* Monitor role assignments.
* Audit privileged activities.

## Conditional Access

* Require MFA for all administrators.
* Block legacy authentication.
* Enforce device compliance policies.

## Zero Trust

Follow Zero Trust principles:

* Verify explicitly.
* Use least privilege access.
* Assume breach.

---

# Common Mistakes

* Assigning Global Administrator unnecessarily
* Granting permanent privileged access
* Using individual permissions instead of RBAC
* Failing to review guest accounts
* Ignoring access reviews
* Excessive subscription-level permissions
* Not enabling MFA for administrators
* Lack of role separation

---

# Summary

Microsoft Entra Access Management combines:

* Microsoft Entra Roles
* Azure RBAC
* Privileged Identity Management (PIM)
* Conditional Access
* Access Reviews

Together, these capabilities provide secure, scalable, and auditable identity governance across cloud and hybrid environments.

## Recommended Modern Approach

```text
Microsoft Entra ID
       │
       ├── Least Privilege
       ├── Azure RBAC
       ├── Entra Roles
       ├── PIM
       ├── Conditional Access
       ├── Access Reviews
       └── Zero Trust Security
```

### Key Recommendations

* Use Azure RBAC for Azure resources.
* Use Entra roles for identity administration.
* Enable PIM for privileged roles.
* Enforce MFA and Conditional Access.
* Conduct regular access reviews.
* Adopt a Zero Trust security model.
