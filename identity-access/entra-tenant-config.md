# Microsoft Entra Tenant Configuration

> A comprehensive guide for planning, deploying, and securing a Microsoft Entra ID tenant.

---

# Table of Contents

* Overview
* Phase 1 – Build the Security Foundation
* Phase 2 – Identity Synchronization and Device Management
* Phase 3 – Application Integration
* Phase 4 – Identity Governance and Lifecycle Management
* Licensing Considerations
* Microsoft Entra Administrative Roles
* Administrative Units
* Custom Domains
* Tenant-Wide Settings
* Elevate Access for Azure Resources
* Microsoft Entra Identities
* External Identities
* Identity Providers
* External Collaboration
* Self-Service Sign-up
* Lifecycle Management
* Azure AD B2B Collaboration
* Cross-Tenant Access
* References

---

# Microsoft Entra Tenant Deployment Overview

A Microsoft Entra deployment should be implemented in phases. This approach establishes a secure identity platform before onboarding users, devices, and applications.

---

# Phase 1 – Build the Security Foundation

Configure the tenant security baseline before onboarding users.

## Administrative Security

* Create at least **two Global Administrator** accounts for emergency access.
* Follow the **least privilege principle** by assigning the minimum required administrative role.
* Enable **Privileged Identity Management (PIM)** to provide just-in-time administrative access and auditing. *(Microsoft Entra ID P2)*

---

## Password Protection

* Enable **Self-Service Password Reset (SSPR)**. *(P1)*
* Configure a **custom banned password list**. *(P1)*
* Enable **Microsoft Entra Password Protection** for on-premises Active Directory. *(P1)*
* Use Microsoft's global banned password list.
* Disable periodic password expiration for cloud-only accounts unless required by compliance.
* Configure **Smart Lockout** to protect against password spray attacks. *(P1)*
* Enable **Extranet Smart Lockout** for AD FS deployments.

---

## Authentication Security

* Block **Legacy Authentication** protocols using Conditional Access.

Common legacy protocols include:

* POP3
* IMAP
* SMTP AUTH
* Exchange ActiveSync (where applicable)
* Basic Authentication

---

## Multi-Factor Authentication

Deploy MFA using Conditional Access.

Recommended:

* Require MFA for administrators.
* Require MFA for remote access.
* Require MFA for privileged operations.
* Require MFA for external users where appropriate.

---

## Identity Protection (P2)

Enable Microsoft Entra Identity Protection.

Configure policies for:

* User Risk
* Sign-in Risk
* Risk Detections
* Automatic password reset
* MFA challenge for risky sign-ins

---

## Combined Registration

Enable combined registration for:

* Self-Service Password Reset
* Multi-Factor Authentication

*(Microsoft Entra ID P2)*

---

# Phase 2 – Identity Synchronization and Device Management

## Hybrid Identity

Deploy Microsoft Entra Connect (Azure AD Connect).

Recommended configuration:

* Password Hash Synchronization (PHS)
* Password Writeback *(P1)*
* Microsoft Entra Connect Health *(P1)*

---

## Licensing

Assign licenses using **Group-Based Licensing**. *(P1)*

Benefits include:

* Automated license assignment
* Easier administration
* Consistent licensing

---

## Guest Access Planning

Define policies for:

* Guest invitations
* Guest permissions
* External collaboration
* Cross-tenant access

---

## Device Management

Define the organization's device strategy.

Possible options:

* Microsoft Entra Joined
* Hybrid Microsoft Entra Joined
* Microsoft Entra Registered
* Microsoft Intune Managed
* Co-managed devices

---

## Windows Hello for Business

Deploy passwordless sign-in using:

* PIN
* Biometrics
* FIDO2 Security Keys

---

## Passwordless Authentication

Deploy passwordless authentication methods.

Supported methods include:

* Microsoft Authenticator
* FIDO2 Security Keys
* Windows Hello for Business
* Passkeys (supported scenarios)

---

# Phase 3 – Application Integration

## Application Inventory

Identify:

* SaaS applications
* On-premises applications
* Custom applications
* Line-of-business applications

---

## Enterprise Applications

Integrate supported SaaS applications from the Microsoft Entra application gallery.

Configure:

* Single Sign-On (SSO)
* Automatic provisioning
* Conditional Access
* User assignment

---

## Application Proxy

Publish on-premises web applications securely using Microsoft Entra Application Proxy.

Benefits include:

* No VPN requirement
* Conditional Access support
* MFA integration
* Secure remote access

---

# Phase 4 – Identity Governance and Lifecycle Management

## Privileged Identity Management (P2)

Implement:

* Just-In-Time (JIT) role activation
* Approval workflows
* MFA for activation
* Role activation notifications
* Audit logs

---

## Access Reviews

Perform periodic access reviews for:

* Administrative roles
* Security groups
* Microsoft 365 Groups
* Guest users
* Enterprise applications

---

## Dynamic Groups

Configure Dynamic Membership Rules for:

* Users
* Devices

*(P1)*

---

## Application Provisioning

Enable:

* Group-based application provisioning
* SCIM provisioning where supported
* Automatic user provisioning
* Automatic deprovisioning

---

# Licensing Considerations

## Example Licensing Strategy

| Department        | License          |
| ----------------- | ---------------- |
| Sales             | Microsoft 365 E3 |
| Human Resources   | Microsoft 365 E3 |
| IT Administrators | Microsoft 365 E5 |

---

## MFA Registration Scenario

**Requirement**

* Force MFA registration.
* Allow users up to **14 days** to complete registration.
* Allow registration only from:

  * Compliant devices
  * Trusted locations

### Security Defaults

Not recommended because:

* Forces MFA registration immediately.
* Cannot limit registration to compliant devices.
* Cannot restrict registration to trusted locations.
* Cannot be used together with Conditional Access.

---

### Identity Protection Registration Policy

Provides:

* MFA registration policy

Limitations:

* Requires Microsoft Entra ID P2.
* Users cannot delay registration for 14 days.
* Not suitable for Microsoft 365 E3 users without P2 licensing.

---

### Recommended Solution

Use:

* Authentication Methods Policy
* Registration Campaign
* Conditional Access
* Temporary Access Pass (if required)
* Microsoft Intune Compliance Policies

This provides greater flexibility for phased MFA enrollment.

---

# Microsoft Entra Administrative Roles

Use built-in administrative roles whenever possible.

Examples include:

* Global Administrator
* Privileged Role Administrator
* User Administrator
* Authentication Administrator
* Security Administrator
* Security Reader
* Application Administrator
* Cloud Application Administrator
* Helpdesk Administrator

Avoid assigning Global Administrator unless absolutely necessary.

---

# Administrative Units

Administrative Units allow delegation of administrative permissions to specific departments, regions, or business units without granting tenant-wide administrative rights.

Common use cases:

* Regional IT teams
* Department-specific administration
* Large enterprises

---

# Custom Domains

A custom domain can only be verified in **one Microsoft Entra tenant**.

If a domain is already verified in another tenant, it must first be removed before it can be verified in a new tenant.

---

# Tenant-Wide Settings

Review and configure:

* User settings
* Group settings
* Application consent
* Enterprise application settings
* Collaboration settings
* Self-service features
* External collaboration settings
* Cross-tenant access settings

---

# Elevate Access for Azure Resources

A Global Administrator can temporarily elevate permissions to manage all Azure subscriptions and management groups.

Navigation:

```text
Microsoft Entra Admin Center
    → Identity
        → Properties
            → Access Management for Azure Resources
                → Set to Yes
```

This assigns the **User Access Administrator** role at the root management group.

## Use Cases

* Recover access to Azure subscriptions.
* Recover access to management groups.
* Grant administrators access.
* View all Azure subscriptions.
* Enable automation solutions requiring tenant-wide visibility.

---

# Microsoft Entra Identities

Identity objects include:

* Users
* Groups
* Devices
* Service Principals
* Managed Identities

Device identities include:

* Microsoft Entra Joined
* Hybrid Microsoft Entra Joined
* Microsoft Entra Registered

---

# External Identities

Microsoft Entra External Identities supports secure collaboration with users outside the organization.

Licensing:

* Microsoft Entra ID P1
* Microsoft Entra ID P2

---

## Azure AD B2B Collaboration

Business-to-Business collaboration enables:

* Partner collaboration
* Vendor collaboration
* Contractor access

Benefits:

* Uses partner credentials
* No password management
* No account synchronization
* Secure resource sharing
* Conditional Access support

Guest accounts typically:

* Have **Guest** user type
* Include the **#EXT#** identifier in the User Principal Name (UPN)

---

## Azure AD B2C (Microsoft Entra External ID for Customers)

Provides identity services for:

* Consumer applications
* Customer portals
* Public-facing applications

Supports:

* Social identities
* Local accounts
* Multi-factor authentication
* Custom user journeys

---

# External Identity Providers

Supported identity providers include:

* Microsoft Account
* Google
* Facebook
* SAML Identity Provider
* WS-Federation Identity Provider
* OpenID Connect providers

---

# External Collaboration Settings

Configure:

* Guest user permissions
* Guest invitation permissions
* Guest restrictions
* Cross-tenant collaboration
* External user invitations
* Bulk guest invitations

---

# Self-Service Sign-up

Self-service sign-up enables external users to register without administrator intervention.

Features include:

* User Flows
* Custom User Attributes
* API Connectors
* Identity Providers

---

# Lifecycle Management

Configure identity governance capabilities such as:

* Terms of Use
* Access Reviews
* Entitlement Management
* User provisioning
* User deprovisioning
* Guest lifecycle management

---

# Cross-Tenant Access

Cross-Tenant Access Settings provide centralized control over collaboration with other Microsoft Entra tenants.

Configure:

* Inbound access
* Outbound access
* Trust settings
* Multi-Factor Authentication trust
* Device compliance trust
* Hybrid Azure AD trust

---

# Azure AD B2B Collaboration Process

Typical workflow:

1. Invite an external user.
2. User redeems the invitation.
3. A guest account is created.
4. Assign groups and applications.
5. Apply Conditional Access policies.
6. Review access periodically using Access Reviews.
7. Remove guest access when no longer required.

---

# References

* Microsoft Entra deployment planning
* Microsoft Entra Connect
* Microsoft Entra Conditional Access
* Microsoft Entra Identity Protection
* Microsoft Entra External Identities
* Microsoft Entra B2B Collaboration
* Microsoft Entra Cross-Tenant Access
* Microsoft Entra Identity Governance
* Microsoft Entra Application Proxy
* Microsoft Entra Privileged Identity Management

---
