# Azure RBAC, Microsoft Entra Roles, and Classic Subscription Administrator Roles

## Overview

Azure uses multiple role-based access control (RBAC) models to secure cloud resources and identity services. Although they are related, **Azure RBAC**, **Microsoft Entra roles**, and **Classic Subscription Administrator roles** serve different purposes and operate at different scopes.

The following diagram represents the relationship between these role models.

| Role Model | Used For | Scope | Current Status |
|------------|----------|-------|----------------|
| **Microsoft Entra Roles** | Identity and directory administration | Microsoft Entra tenant | Recommended |
| **Azure RBAC Roles** | Azure resource authorization | Management Group → Subscription → Resource Group → Resource | Recommended |
| **Classic Subscription Administrator Roles** | Legacy Azure Service Management (ASM) administration | Subscription | Legacy (Avoid for new deployments) |

---

# Relationship Between Azure Authorization Models

```text
Microsoft Entra Tenant
│
├── Microsoft Entra Roles
│     ├── Global Administrator
│     ├── Privileged Role Administrator
│     ├── User Administrator
│     ├── Application Administrator
│     ├── Security Administrator
│     ├── Billing Administrator
│     └── ...
│
│
├── Azure Management Hierarchy
│
│   Root Management Group
│       │
│       ├── Management Group
│       │      │
│       │      ├── Subscription
│       │      │      │
│       │      │      ├── Resource Group
│       │      │      │      │
│       │      │      │      └── Azure Resources
│       │      │      │
│       │      │      └── Azure RBAC Roles
│       │      │             ├── Owner
│       │      │             ├── Contributor
│       │      │             ├── Reader
│       │      │             ├── User Access Administrator
│       │      │             ├── Virtual Machine Contributor
│       │      │             ├── Storage Blob Data Contributor
│       │      │             └── ...
│       │
│       └── Classic Subscription Administrator Roles
│               ├── Account Administrator
│               ├── Service Administrator
│               └── Co-Administrator
```

---

# Role Categories

## 1. Microsoft Entra Roles

Microsoft Entra roles (formerly Azure AD roles) manage **identity and directory services**.

These roles control administration of:

- Users
- Groups
- Devices
- Applications
- Enterprise Applications
- Authentication
- Conditional Access
- Identity Protection
- Microsoft 365 administration
- Privileged Identity Management (PIM)

Examples include:

- Global Administrator
- Privileged Role Administrator
- User Administrator
- Authentication Administrator
- Security Administrator
- Conditional Access Administrator
- Application Administrator
- Cloud Application Administrator
- Groups Administrator
- Helpdesk Administrator
- Billing Administrator

**Scope**

- Entire Microsoft Entra tenant
- Administrative Units (optional)
- Individual objects (limited scenarios)

---

## 2. Azure RBAC Roles

Azure RBAC controls **who can perform actions on Azure resources**.

These permissions apply to Azure infrastructure.

Examples:

- Virtual Machines
- Storage Accounts
- Key Vault
- Azure Firewall
- Virtual Networks
- SQL Database
- AKS
- App Service
- Resource Groups
- Subscriptions

Common built-in roles:

- Owner
- Contributor
- Reader
- User Access Administrator
- Monitoring Contributor
- Network Contributor
- Virtual Machine Contributor
- Key Vault Administrator
- Storage Account Contributor
- Security Admin

Azure RBAC permissions are inherited through the Azure hierarchy.

```
Management Group
        ↓
Subscription
        ↓
Resource Group
        ↓
Resource
```

---

## 3. Classic Subscription Administrator Roles

These are legacy roles from the **Azure Service Management (ASM)** model.

They predate Azure RBAC.

Roles include:

- Account Administrator
- Service Administrator
- Co-Administrator

These roles are maintained only for backward compatibility.

Microsoft recommends migrating to Azure RBAC.

---

# Azure RBAC vs Microsoft Entra Roles

| Feature | Azure RBAC Roles | Microsoft Entra Roles |
|----------|------------------|-----------------------|
| **Primary Purpose** | Manage Azure infrastructure resources | Manage Microsoft Entra identity resources |
| **Controls** | Azure services | Identity and directory services |
| **Applies To** | Azure Resource Manager (ARM) | Microsoft Entra ID |
| **Scope** | Management Group, Subscription, Resource Group, Resource | Tenant, Administrative Unit, Individual Objects |
| **Permission Model** | Resource authorization | Identity administration |
| **Inheritance** | Yes | Limited (depends on object hierarchy) |
| **Custom Roles** | Supported | Supported |
| **Role Assignment** | Azure RBAC | Microsoft Entra RBAC |
| **Managed Through** | Azure Portal, CLI, PowerShell, ARM, REST API | Microsoft Entra Admin Center, Microsoft Graph, PowerShell |
| **Authentication Required** | Microsoft Entra Identity | Microsoft Entra Identity |
| **Supports PIM** | Yes | Yes |
| **Applies to Azure Resources** | Yes | No |
| **Applies to Users & Groups** | No | Yes |
| **Applies to Applications** | Limited | Yes |
| **Typical Administrator** | Azure Infrastructure Administrator | Identity Administrator |

---

# Azure RBAC Hierarchy

Azure RBAC permissions flow from higher scopes to lower scopes.

```
Tenant
   │
Root Management Group
   │
Management Group
   │
Subscription
   │
Resource Group
   │
Resource
```

Permissions assigned at a higher scope are inherited by child scopes unless explicitly restricted.

Example:

- Owner at Management Group
  - Access to all subscriptions
  - Access to all resource groups
  - Access to every resource

---

# Microsoft Entra Role Scope

Microsoft Entra permissions apply differently.

```
Tenant
   │
Administrative Unit (Optional)
   │
Users
Groups
Devices
Applications
```

Example:

A User Administrator assigned to an Administrative Unit can manage only the users inside that Administrative Unit.

---

# Common Azure RBAC Built-in Roles

| Role | Description |
|------|-------------|
| Owner | Full access to resources, including permission management |
| Contributor | Manage resources but cannot grant access |
| Reader | Read-only access |
| User Access Administrator | Manage RBAC role assignments |
| Network Contributor | Manage networking resources |
| Virtual Machine Contributor | Manage virtual machines |
| Storage Account Contributor | Manage storage accounts |
| Key Vault Administrator | Full management of Key Vault data plane |
| Monitoring Contributor | Manage Azure Monitor resources |
| Backup Contributor | Manage Azure Backup resources |

---

# Common Microsoft Entra Roles

| Role | Description |
|------|-------------|
| Global Administrator | Full control of Microsoft Entra tenant |
| Privileged Role Administrator | Manage privileged role assignments |
| User Administrator | Manage users and groups |
| Authentication Administrator | Manage authentication methods |
| Security Administrator | Configure security settings |
| Conditional Access Administrator | Manage Conditional Access policies |
| Application Administrator | Manage App Registrations |
| Cloud Application Administrator | Manage Enterprise Applications |
| Groups Administrator | Manage Microsoft Entra groups |
| Helpdesk Administrator | Reset passwords for non-admin users |
| Billing Administrator | Manage subscriptions and billing |

---

# Classic Subscription Administrator Roles

| Role | Description |
|------|-------------|
| Account Administrator | Billing owner of the Azure subscription |
| Service Administrator | Full management of Azure services within the subscription |
| Co-Administrator | Same resource management permissions as Service Administrator (legacy) |

> **Note:** Classic administrators are legacy constructs from Azure Service Management (ASM). Azure RBAC should be used for all new deployments.

---

# Relationship Between Microsoft Entra and Azure RBAC

Microsoft Entra authenticates identities, while Azure RBAC authorizes actions on Azure resources.

```text
User
   │
Authenticates using Microsoft Entra ID
   │
Authentication Successful
   │
Azure RBAC evaluates assigned permissions
   │
Access Granted or Denied
```

Authentication and authorization are separate processes:

- **Microsoft Entra ID** → Authentication (Who are you?)
- **Azure RBAC** → Authorization (What can you do?)

---

# Important Notes

- Microsoft Entra roles **do not automatically grant access** to Azure resources.
- Azure RBAC roles **do not grant permissions** to manage Microsoft Entra users or directory settings.
- A Global Administrator does **not** automatically become an Azure Subscription Owner.
- A Subscription Owner does **not** automatically become a Global Administrator.
- Users may require both Microsoft Entra roles and Azure RBAC roles depending on their responsibilities.
- Azure RBAC follows hierarchical inheritance.
- Microsoft Entra roles are tenant-centric and identity-focused.
- Classic administrator roles are retained only for backward compatibility and should be replaced with Azure RBAC wherever possible.

---

# Best Practices

- Prefer **Azure RBAC** over Classic Subscription Administrator roles.
- Use **least privilege** by assigning only the minimum required permissions.
- Assign permissions at the **highest appropriate scope** to simplify management.
- Use **Management Groups** for enterprise-wide governance.
- Protect privileged roles using **Microsoft Entra Privileged Identity Management (PIM)**.
- Enable **Multi-Factor Authentication (MFA)** for privileged accounts.
- Use **custom roles** only when built-in roles do not satisfy business requirements.
- Regularly review role assignments using **Access Reviews**.
- Monitor privileged activities with **Microsoft Sentinel**, **Microsoft Defender for Cloud**, and **Azure Activity Logs**.
- Avoid assigning permanent **Global Administrator** or **Owner** roles; use **Just-In-Time (JIT)** access through PIM.
- Migrate any remaining **Classic Subscription Administrator** assignments to Azure RBAC.

---

# Key Takeaways

| Microsoft Entra Roles | Azure RBAC Roles | Classic Subscription Administrator Roles |
|------------------------|------------------|------------------------------------------|
| Identity & directory management | Azure infrastructure authorization | Legacy subscription administration |
| Tenant-centric | Resource-centric | Subscription-centric |
| Manage users, groups, applications, authentication | Manage Azure resources | Legacy ASM model |
| Supports custom roles | Supports custom roles | No custom roles |
| Works with Microsoft Entra ID | Works with Azure Resource Manager | Legacy Azure Service Management |
| Recommended | Recommended | Deprecated / Legacy |