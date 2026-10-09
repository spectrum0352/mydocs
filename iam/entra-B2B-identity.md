# Entra ID B2B (Business-to-Business Collaboration)

**Entra ID B2B** enables secure collaboration with external users (partners, vendors, customers) by allowing them to access your organization’s resources using their own identities.

## Key Capabilities

* **External User Collaboration**

  * Invite external (guest) users to collaborate with your organization.
  * Grant access to applications, groups, and resources.

* **Authentication & Authorization Model**

  * External users **authenticate using their own credentials** (home identity provider).
  * Your organization handles **authorization** (permissions and access control).

* **Invitation & Access Process**

  * Simple **invitation and redemption workflow**.
  * Users receive an invite and access resources using their existing accounts.
  * Supports **bulk invitations** for large-scale onboarding.

* **Self-Service Sign-Up**

  * Enable **self-service user flows** for external users to sign up and request access to applications.

* **User Representation**

  * External users are created as **user objects** in your directory.
  * Typically assigned **User Type: Guest**.
  * पहचान (identifier): User Principal Name (UPN) contains **`#EXT#`**.

* **Identity Flexibility**

  * External users can sign in using:

    * Microsoft accounts
    * Work/school accounts
    * Social identities (if configured)
    * Federated identity providers

* **No Credential Management Overhead**

  * No need to:

    * Manage external passwords
    * Sync external directories
    * Maintain lifecycle of external credentials

---

## Cross-Tenant Access Settings

* Define how users from other tenants can access your resources.
* Configure:

  * **Allow/Deny lists**
  * Trust settings (MFA, compliant devices, etc.)
  * Inbound and outbound access policies

---

## External Collaboration Configuration

* Control who can:

  * Invite external users
  * Accept invitations
* Restrict domains (allow/block specific partner organizations)
* Configure guest user permissions and visibility

---

## External User Management

* Manage guest users like internal users:

  * Assign roles and permissions
  * Add to groups
  * Apply Conditional Access policies
* Monitor and review access regularly (e.g., access reviews)

---

## Supported Identity Providers

* **SAML 2.0 Identity Providers**
* **WS-Federation (WS-Fed) Providers**
* Social identity providers (optional, depending on configuration)

---

## Common Use Cases

* Partner collaboration (vendors, suppliers)
* Customer access to applications (B2B portals)
* Joint projects across organizations
* Secure sharing of internal resources (apps, SharePoint, Teams)

---

## Key Benefits

* Simplified external collaboration
* Reduced identity management overhead
* Enhanced security with centralized access control
* Seamless user experience for partners

---

If you want, I can also create a **diagram/architecture flow** for Entra ID B2B (invitation → authentication → token issuance → resource access) or compare it with **B2C**.
