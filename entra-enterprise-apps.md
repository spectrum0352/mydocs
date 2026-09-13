# Enterprise Applications in Microsoft Entra ID

## Overview

Microsoft Entra ID Enterprise Applications provides centralized identity, authentication, authorization, and lifecycle management for Software-as-a-Service (SaaS), on-premises, and custom applications.

Enterprise Applications enable organizations to:

- Centralize application authentication
- Enable Single Sign-On (SSO)
- Enforce Multi-Factor Authentication (MFA)
- Apply Conditional Access policies
- Automate user provisioning and deprovisioning
- Manage application permissions and consent
- Monitor application usage and security
- Govern application identities and service principals

---

# Enterprise Application Lifecycle

Managing enterprise applications involves four major phases:

1. Planning
2. Implementation
3. Operations
4. Monitoring and Governance

---

# 1. Planning

## Application Discovery

Identify all applications that require Microsoft Entra ID integration.

Application types include:

- SaaS applications
- On-premises applications
- Custom applications
- Line-of-Business (LOB) applications
- APIs
- Legacy applications

Useful discovery sources:

- Microsoft Entra Sign-in Logs
- Enterprise Application Usage Reports
- Azure AD Connect reports
- ADFS Application Activity Reports (during migration)
- Defender for Cloud Apps

Document:

- Business owner
- Technical owner
- Criticality
- Data classification
- Authentication requirements
- User groups
- Compliance requirements

---

## Access Management Design

Define:

- Authentication methods
- Authorization model
- Group strategy
- RBAC model
- Application ownership

Authentication options:

- Password
- Passwordless
- Microsoft Authenticator
- FIDO2 Security Keys
- Windows Hello for Business
- Certificate-based authentication

Authorization methods:

- Security Groups
- Microsoft 365 Groups
- Dynamic Groups
- Administrative Units
- App Roles

---

## Conditional Access Planning

Define access requirements based on:

- User
- Group
- Device compliance
- Device platform
- Risk level
- Sign-in risk
- User risk
- Network location
- Named locations
- Client applications

Access controls:

- Require MFA
- Require compliant device
- Require Hybrid Azure AD joined device
- Require Terms of Use
- Block access
- Require Authentication Strength

---

## Identity Governance Planning

Plan for:

- Access Reviews
- Entitlement Management
- Privileged Identity Management (PIM)
- Lifecycle Workflows
- Joiner-Mover-Leaver processes

---

## Provisioning Strategy

Choose provisioning method:

- Manual
- SCIM
- HR-driven provisioning
- Microsoft Entra Cloud Sync
- Microsoft Entra Connect Sync
- API-based provisioning

Provision:

- Users
- Groups
- Roles

Configure:

- Automatic provisioning
- Automatic deprovisioning
- Group synchronization

---

## Integration Planning

### SaaS Applications

Authentication methods:

- SAML 2.0
- OpenID Connect (OIDC)
- OAuth 2.0

Examples:

- Salesforce
- ServiceNow
- Workday
- Dropbox
- Box
- Zoom

---

### On-Premises Applications

Use:

- Microsoft Entra Application Proxy

Authentication options:

- Integrated Windows Authentication (Kerberos)
- Header-based Authentication
- SAML
- Password-based authentication

---

### Custom Applications

Integration methods:

- Microsoft Identity Platform
- OAuth 2.0
- OpenID Connect
- Microsoft Graph API
- REST APIs

---

## Consent Planning

Configure:

- User Consent
- Admin Consent
- Permission Grant Policies

Decide:

- Who can grant consent
- Which applications require administrator approval
- Third-party application approval process

---

# 2. Implementation

## Register Applications

Register applications in Microsoft Entra ID.

Configure:

- Name
- Redirect URI
- Supported account types
- Certificates
- Client secrets
- Branding
- Logo
- Homepage URL
- Logout URL

---

## Configure Authentication

Authentication options:

- SAML
- OAuth 2.0
- OpenID Connect
- WS-Federation

Configure:

- Redirect URIs
- Reply URLs
- Token configuration
- Claims
- Certificates

---

## Configure Single Sign-On (SSO)

Supported methods:

- SAML
- OIDC
- Password-based SSO
- Linked SSO
- Integrated Windows Authentication

Benefits:

- Reduced password fatigue
- Improved security
- Centralized authentication
- Better user experience

---

## Configure Provisioning

Enable:

- SCIM provisioning
- User provisioning
- Group provisioning
- Attribute mapping

Provision automatically:

- Create users
- Update users
- Disable users
- Remove users

---

## Configure Enterprise Application Settings

Configure:

- User assignment required
- Visibility
- Assignment rules
- Application roles
- Groups
- Owners

---

## Configure Conditional Access

Apply policies for:

- MFA
- Device compliance
- Location restrictions
- Risk-based authentication
- Authentication Strength
- Session controls

---

## Configure Permissions

Grant:

- Microsoft Graph permissions
- Delegated permissions
- Application permissions

Review:

- Least privilege
- Admin consent
- API permissions

---

## Configure Access Reviews

Schedule periodic reviews for:

- Users
- Groups
- Application assignments
- Guest users

---

# 3. Operations

## User Management

Manage:

- User assignments
- Group assignments
- Dynamic Groups
- Application roles

---

## Role Management

Assign administrative roles such as:

- Cloud Application Administrator
- Application Administrator
- Global Administrator
- Privileged Role Administrator
- Security Administrator

---

## Application Ownership

Assign:

- Application Owners
- Backup Owners

Owners manage:

- Certificates
- Secrets
- Redirect URIs
- API permissions
- Branding

---

## Secret Management

Replace client secrets with:

- Certificates
- Managed Identities
- Workload Identities

Monitor:

- Secret expiration
- Certificate expiration

Rotate credentials regularly.

---

# 4. Monitoring and Governance

## Sign-in Monitoring

Monitor:

- Successful sign-ins
- Failed sign-ins
- Risky sign-ins
- Conditional Access failures
- Token issuance

Use:

- Microsoft Entra Sign-in Logs
- Log Analytics
- Microsoft Sentinel

---

## Audit Logs

Review:

- Application registration
- Permission changes
- Consent changes
- Role assignments
- Secret updates
- Certificate changes

---

## Security Monitoring

Monitor:

- Suspicious applications
- Consent phishing
- OAuth abuse
- Impossible travel
- Risk detections
- Service Principal sign-ins

Use:

- Microsoft Defender XDR
- Microsoft Defender for Cloud Apps
- Microsoft Sentinel
- Microsoft Entra ID Protection

---

## Usage Reporting

Analyze:

- Application usage
- Active users
- License utilization
- Inactive applications
- Unused permissions

---

## Performance Monitoring

Monitor:

- Authentication latency
- Token failures
- Provisioning failures
- SSO failures
- Application availability

---

# Application Registration

## Overview

An Application Registration represents an application's identity in Microsoft Entra ID.

It enables:

- Authentication
- Authorization
- API access
- OAuth
- OpenID Connect
- Single Sign-On

By default, users may be allowed to register applications depending on tenant configuration.

---

# Microsoft Entra Application Identities

Application identities allow applications to securely authenticate to Microsoft Entra ID and access protected resources.

Capabilities include:

- Application authentication
- API authorization
- Token issuance
- Managed identities
- Service principals
- OAuth permissions

---

# Application Objects

An Application Object is the global definition (blueprint) of an application.

It contains:

- Display name
- Application (Client) ID
- Object ID
- Redirect URIs
- Certificates
- Client secrets
- Branding
- API permissions
- OAuth scopes
- App roles
- Required resource access

Only one Application Object exists per application.

---

# Service Principal

A Service Principal is the local security identity of an application within a Microsoft Entra tenant.

It contains:

- Assigned users
- Assigned groups
- Assigned roles
- Enterprise application configuration
- Conditional Access applicability
- Access permissions

A Service Principal is created whenever an application is used in a tenant.

---

# Application Object vs Service Principal

| Feature | Application Object | Service Principal |
|----------|-------------------|-------------------|
| Scope | Global | Tenant-specific |
| Purpose | Application definition | Application identity |
| Quantity | One | One per tenant |
| Contains | Metadata | Permissions and assignments |
| Used for | Registration | Authentication and authorization |

---

# Security Principal

A Security Principal is an identity recognized by Microsoft Entra ID.

Types include:

- User Principal
- Group
- Service Principal
- Managed Identity

Security principals are assigned permissions to access Azure resources.

---

# Service Principal vs Security Principal

| Service Principal | Security Principal |
|-------------------|-------------------|
| Represents an application | Represents any identity |
| Used by applications | Used by users, groups, applications, and managed identities |
| Authenticates applications | Controls access permissions |

A Service Principal is a type of Security Principal.

---

# Authentication Methods for Service Principals

Microsoft recommends avoiding client secrets whenever possible.

Supported authentication methods:

- Client Secret
- Certificate Authentication
- Federated Credentials
- Managed Identity
- Workload Identity Federation

Recommended order:

1. Managed Identity
2. Workload Identity Federation
3. Certificate Authentication
4. Client Secret (least preferred)

---

# Enterprise Application Security Best Practices

- Enable Single Sign-On (SSO)
- Enforce Multi-Factor Authentication (MFA)
- Use Conditional Access
- Implement least privilege
- Regularly review API permissions
- Restrict user consent
- Require administrator approval for high-risk permissions
- Use Access Reviews
- Enable Identity Protection
- Use Privileged Identity Management (PIM)
- Rotate secrets and certificates regularly
- Prefer Managed Identities over client secrets
- Enable audit logging
- Monitor sign-in activity
- Monitor risky applications
- Remove unused enterprise applications
- Remove unused service principals
- Review third-party applications periodically
- Integrate logs with Microsoft Sentinel
- Follow Zero Trust principles

---

# Common Enterprise Application Protocols

| Protocol | Purpose |
|----------|----------|
| OAuth 2.0 | Authorization |
| OpenID Connect (OIDC) | Authentication |
| SAML 2.0 | Enterprise SSO |
| WS-Federation | Legacy federation |
| SCIM | User provisioning |
| LDAP | Directory access |
| Kerberos | Integrated Windows Authentication |

---

# Microsoft Entra Portal Navigation

## Enterprise Applications

```

Microsoft Entra Admin Center
└── Identity
    └── Applications
        └── Enterprise Applications

```

## App Registrations

```

Microsoft Entra Admin Center
└── Identity
    └── Applications
        └── App Registrations

```

---

# Enterprise Application Management Workflow

```text
Discover Applications
        │
        ▼
Register Application
        │
        ▼
Configure Authentication
        │
        ▼
Enable SSO
        │
        ▼
Assign Users and Groups
        │
        ▼
Configure Conditional Access
        │
        ▼
Enable Provisioning
        │
        ▼
Grant API Permissions
        │
        ▼
Monitor Usage
        │
        ▼
Audit and Govern
```
