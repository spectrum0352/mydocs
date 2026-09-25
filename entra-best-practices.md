Microsoft Entra Tenant Configuration Best Practices
A secure and well-organized Microsoft Entra (Azure AD) tenant begins with a structured, phased approach. The following guidelines cover foundational security, identity synchronization, device management, application integration, and governance. Each section corresponds to a phase of deployment, ensuring no critical step is overlooked. Recommendations include licensing notes (e.g. P1, P2 for Premium plans) and official Microsoft guidance for accuracy.

## Phase 1: Build Security Foundations
* Multiple Global Administrators: Assign at least two dedicated Global Administrator accounts (often “break-glass” emergency accounts) to avoid a single point of failure. Microsoft advises having two cloud-only Global Admins at all times.
* Least-Privilege Roles: Follow the principle of least privilege. Use built-in role-based access control (RBAC) roles instead of granting unnecessary Global Admin rights. Limit each admin to only the permissions needed for their role.
* Privileged Identity Management (PIM): Enable Microsoft Entra PIM so admins get just-in-time access. With PIM, administrators can be made eligible for a role and must activate it only when needed. PIM can enforce approval workflows, notifications, and time-limited assignments.
* Require Multi-Factor Authentication (MFA): Protect all admin accounts (and ideally all user accounts) with MFA. MFA reduces account compromise by 99.9%. Use Conditional Access policies to require MFA for sign-in to management roles and sensitive apps. (Entra Premium P1 is needed for Conditional Access policies.)
* Self-Service Password Reset (SSPR): Enable SSPR so users can recover or reset passwords without helpdesk tickets. This improves security and productivity. A Microsoft Entra ID Premium P1 license is required for SSPR features. Deploy SSPR with strong registration (e.g. using Authenticator app) and combine it with Conditional Access to require secure methods.
* Custom Banned Password List: Create an organization-specific banned password list. This blocks easily guessed or company-specific weak passwords (e.g. product or brand names). When users change/reset passwords, the system checks both the global and your custom lists. (A Premium license is required to use custom banned lists.)
* Microsoft Entra Password Protection: Enable Entra Password Protection and, if hybrid, install the AD password protection agents on your domain controllers. This extends weak-password banning to on-premises AD. Even in cloud-only, the built-in banned-password policy helps prevent common weak passwords.
* Password Policy Guidance: Follow Microsoft’s password best practices: prefer longer passwords over complex ones, and avoid forcing frequent changes. Microsoft recommends no expiration for cloud-only accounts and a minimum of 14-character passwords for stronger security. Educate users not to reuse corporate passwords elsewhere.
* Smart Lockout Policies: Configure Microsoft Entra’s Smart Lockout to block sign-ins from repeated bad attempts. Smart Lockout is enabled by default; customize its thresholds if needed (requires P1/P2). If you use AD FS, enable AD FS Extranet Smart Lockout to differentiate familiar and suspicious locations and block password spray attacks.
* Block Legacy Authentication: Disable/basic-auth protocols (POP, IMAP, SMTP, etc.) that cannot do MFA. Use Conditional Access to block legacy authentication, as 97–99% of credential attacks use these protocols. If you lack Conditional Access, at least enable Security Defaults to disable legacy auth for everyone.
* Conditional Access for MFA and Compliance: Create Conditional Access policies to enforce MFA for sign-in (especially for admins and privileged roles). Protect sign-in paths with conditions (trusted devices, network locations, compliance checks, etc.) to implement Zero Trust. Use “Authentication Strength” in Conditional Access to require specific MFA methods on compliant devices.
* Microsoft Entra Identity Protection: Activate Identity Protection (Microsoft Entra ID P2) to detect and respond to risky sign-ins and compromised accounts. Enable the built-in risk-based policies:
  * User risk policy: force password change on detected compromised credentials.
  * Sign-in risk policy: require MFA when sign-in is suspicious.
  * MFA registration policy: ensure all users register for MFA in advance
* These require Entra ID Premium P2 (e.g. Microsoft 365 E5). Identity Protection can automate remediations or simply alert admins.
* Combined MFA and SSPR Registration: Use the combined security info registration experience so users register their MFA and SSPR methods in one workflow. This simplifies onboarding. With combined registration, users sign up once and get both MFA and password reset methods registered. (This is the new unified experience in Entra.)

## Phase 2: Sync Identities and Manage Devices
* Install Microsoft Entra Connect: Deploy Microsoft Entra Connect to synchronize on-premises Active Directory users and passwords to Microsoft Entra ID. Use Password Hash Sync (PHS) or Pass-through Authentication (PTA) so on-prem users can sign in to cloud services securely.
* Password Writeback: Enable Password Writeback in Entra Connect so cloud-managed password resets write back to on-prem AD. This lets users reset on-prem passwords via the cloud SSPR portal (Premium P1 required).
* Entra Connect Health: Configure the Entra Connect Health service (requires P1) to monitor synchronization status and health of AD infrastructure. It alerts you to sync errors, AD problems, or ADFS issues.
* Group-Based Licensing: Use group-based licensing to automatically assign Microsoft 365 and Azure AD licenses based on group membership. By assigning licenses to security groups, members inherit licenses without manual per-user steps. Group-based licensing requires Entra ID P1 (or equivalent Microsoft 365 subscriptions) for all users[[17]](https://learn.microsoft.com/en-us/entra/fundamentals/concept-group-based-licensing#:~:text=Microsoft%20Entra%20ID%20includes%20group,user%20basis).
* Guest User Strategy: Plan and configure your B2B guest access policy. By default, guests have limited directory access (they see only their own profile). You can further restrict guest permissions (for example, to hide other directory info) and decide who can invite them. Restricting guest invite rights (e.g. to User Admins only) and defining cross-tenant access settings ensures secure collaboration.
* Device Management Strategy: Define how corporate devices will join Azure AD or Hybrid AD (Azure AD Join, Hybrid Azure AD Join) and how they enroll in Intune (or another MDM). Configure auto-enrollment so that Windows 10/11 devices automatically enroll in Intune upon Azure AD Join. This enables device-based Conditional Access (e.g. requiring a compliant device for sensitive resources).
* Windows Hello for Business: Deploy Windows Hello for Business to replace passwords with strong device-bound credentials (PIN or biometrics). This enables multi-factor passwordless sign-in (certificate or key-based) on managed Windows devices. It greatly improves sign-in security and user convenience.
* Passwordless Authentication: Roll out additional passwordless options such as FIDO2 security keys and the Microsoft Authenticator app. Encourage users to register these methods so they can sign in without passwords. Passwordless methods (FIDO2 keys, Authenticator phone sign-in, etc.) eliminate password attack vectors and simplify MFA.

## Phase 3: Manage Applications
* Inventory Your Applications: Identify all applications in use (SaaS, on-prem, custom). Classify them by criticality and authentication method. Ensure enterprise apps are registered in Entra ID.
* Integrate SaaS Apps (Entra App Gallery): For each supported cloud application, use the Microsoft Entra Application Gallery. The gallery has thousands of prebuilt app integrations with single sign-on (SSO) and automated provisioning. Deploy SSO for apps like Salesforce, Google Workspace, ServiceNow, etc., via the gallery to centralize identity and enable federated access.
* Application Proxy for On-Premises: Use Microsoft Entra Application Proxy to publish internal web applications (e.g. intranet sites, legacy web apps) to remote users. Application Proxy provides secure remote access with Entra ID single sign-on and conditional access control, without opening inbound firewall ports. Published apps automatically respect your Entra access policies and MFA settings.
* Group-Based Application Access: Assign access to line-of-business (LOB) and SaaS apps by security groups. For example, put users in an “HR Apps” group, and give that group access to Workday and SharePoint. This ensures that changing a user’s group membership automatically grants or removes app access, simplifying user provisioning and deprovisioning.

## Phase 4: Privileged Access Governance and Lifecycle Management
* Privileged Identity Management Enforcement: Require all admin roles to be managed through PIM (Entra ID P2 feature). This means admins are only in privileged roles when they “activate” them via PIM, generating audit logs and requiring MFA/approvals as configured. Use PIM for Azure roles as well, not just directory roles.
* Access Reviews: Schedule regular access reviews. For directory roles (Global Admin, etc.), use PIM’s access review capability to certify that role assignments are still needed. Also review membership of critical groups and app access. Remove stale or over-privileged accounts. Access reviews ensure least-privilege is maintained over time.
* Dynamic Groups: Implement dynamic group membership rules to automate grouping of users or devices by attributes (department, location, etc.). Dynamic groups automatically add/remove members when their attributes change. This is useful for applying policies, licensing, or app assignment at scale. Note: Dynamic group rules require Entra ID P1.
* Group-Based Application Provisioning: Use groups to manage access to applications. For example, assign a group to an enterprise app so that all group members get SSO access. When users join/leave the group, their app access updates automatically. (This often works in tandem with SCIM provisioning.)
* Automated User Provisioning/Deprovisioning: Leverage Microsoft Entra’s provisioning service for SaaS and on-prem apps. With SCIM or native connectors, Entra can automatically create, update, and remove user accounts in target systems as users join or leave your company. This ensures that leavers are promptly removed from all apps, and joiners get needed access without manual steps.
* Terms of Use and Compliance: Create Terms of Use policies (a PDF of your usage agreement) in Entra and enforce them via Conditional Access. Users must accept your Terms of Use before accessing corporate resources[[24]](https://learn.microsoft.com/en-us/entra/identity/conditional-access/terms-of-use#:~:text=Microsoft%20Entra%20terms%20of%20use,the%20provided%20logs%20or%20APIs). Use different TOU documents per language or group as needed. Administrators can monitor acceptance and expiration of consents for audit purposes.
* Conditional Access Governance: As part of user lifecycle management, continue using Conditional Access to enforce policies on compliant devices, MFA, session controls, and more. This includes guest/partner users too. Combine identity governance (access reviews, policies) with access policies to maintain security for all identities.

## Roles, Administrative Units, and Tenant Settings
* Built-In Roles: Familiarize yourself with the wide range of built-in Entra ID roles (Global Admin, User Admin, Security Reader, etc.) and use them appropriately. Avoid creating unnecessary custom roles. Assign roles to users or to security groups whenever possible for easier management.
* Administrative Units (AUs): Use Administrative Units to scope administrative roles to a subset of users or devices (for example, by department or region). For instance, create an AU for each department and assign a User Administrator role scoped to that AU. That admin can then manage only the users in their AU, not the entire tenant. Admin Units require Entra ID P1 licenses for the admins, but they let large organizations delegate administration safely.
* Custom Domains: Verify your corporate domains in the tenant. Note that a domain name can only be verified in one directory at a time. If the domain was previously verified in another tenant, it must be removed there first. Ensure you add the required DNS TXT/MX records to prove ownership before adding a custom domain name.
* Tenant-Wide Settings: Review and adjust tenant-level settings (External Collaboration, security defaults, etc.). For example, disable Security Defaults if you need custom Conditional Access policies (they conflict). Instead, use CA policies to enforce secure registration and MFA. Limit legacy auth clients by default.
* Elevated Access for Azure: If you manage Azure subscriptions/resources, enable the “Access management for Azure resources” toggle under Microsoft Entra ID > Properties. This elevates your current Global Admin account to User Access Administrator at the tenant root scope, letting you grant yourself (or others) access to all subscriptions and management groups. (Use this sparingly, and disable it when done.) This bridges the gap that by default Entra roles do not grant Azure resource access.
* Subscriptions and Linked Tenants: If you have multiple Azure subscriptions or linked directories, plan how identities and resources will be managed across them (for example, use Management Groups, Guest users across tenants, or Azure Lighthouse as needed).

## External Identities and Collaboration
* Azure AD B2B (Business-to-Business): Use Azure AD B2B to invite partner or vendor users into your directory. Guests can log in with their home organization credentials (or Microsoft accounts). Restrict guest permissions as needed (by default they see only their own profile) and configure invitation policies. Limit who can invite guests (e.g. only designated staff) and set collaboration restrictions (e.g. allow only specific domains or organizations)
* Azure AD B2C (Business-to-Consumer): For customer-facing apps, use Azure AD B2C. It lets you build sign-up/sign-in experiences with social or email accounts. Configure user flows or custom policies to enable self-service sign-up, profile management, password reset, etc. B2C supports many identity providers (Google, Facebook, etc.) so customers can use familiar accounts.
* External Identity Providers: Entra supports federation to common IdPs. For guest sign-in, you can let users sign in with Google accounts or federate to any SAML/WS-Fed identity provider. This enhances experience for B2B/B2C users. For example, allowing Google federated login for external users means they never need a separate Microsoft or Entra account.
* External Collaboration Settings: Configure External Collaboration Settings in the Entra portal. Decide if guests can invite other guests, if external users can see directory info, and if members can invite guests. These tenant-wide settings help enforce governance of your B2B environment.
* Terms of Use and Access Reviews: For guest users accessing sensitive resources, consider enforcing Conditional Access including MFA and Terms of Use as well. Regularly review guest account access via access reviews to ensure guests still require the access given.

## Licensing Considerations
* Ensure you have the right Microsoft 365 licenses for your plans. Many security and management features require Azure AD Premium P1 or P2:
* Azure AD Premium P1 (or Microsoft 365 E3/E5): Enables Conditional Access, dynamic groups, group-based licensing, SSPR, Microsoft Entra Connect Health, administrative units, and more.
* Azure AD Premium P2 (or E5/Azure AD P2): Required for Identity Protection (risk-based policies), Privileged Identity Management (PIM), access reviews, entitlement management, and Identity Governance features.
* For example, if your IT team has E5 licenses, they get Identity Protection and can use risk policies; other departments on E3 get core features like MFA and SSPR. Be aware that features like B2C, B2B (basic) and free-tier authentication cover many scenarios, but premium features need paid licenses. Plan licensing (E3/E5 assignments or standalone P1/P2) to match each phase’s requirements.

## Identity Objects and Services
* User and Group Accounts: Use Microsoft Entra ID to manage users and groups for all cloud resources. Prefer security groups (and dynamic membership) for access management.
* Device Identities: Allow corporate devices to be registered or joined to Entra ID. Azure AD Join (or Hybrid Join for domain-joined PCs) registers the device in Entra, enabling Intune MDM enrollment and Conditional Access. Registered devices can also use Windows Hello for Business. Use device write-back if needed for hybrid scenarios.
* Service Principals and Managed Identities: Manage service accounts and applications through Entra. Use managed identities for Azure services instead of manual secrets. Ensure any service accounts that need admin access are exempted from legacy-auth blocking policies as needed.
* Workload Identities: For automated access (like scripts or tools), use service principals or managed identities with least-privilege roles, not regular user accounts.

## Recap of Key Configuration Steps
1. Security Baseline: 2+ Global Admins, least privilege roles, PIM, SSPR, banned passwords, password policies, lockout, MFA/CA, Identity Protection, combined MFA/SSPR registration.
2. Sync & Devices: Install Entra Connect (PHS, writeback, health), group-based licensing, guest user policy, device join/Intune/WHfB/passwordless.
3. Applications: Inventory apps, integrate SaaS via Entra app gallery (SSO/provisioning), publish on-prem apps with Application Proxy.
4. Governance: Enforce PIM (P2), run access reviews, dynamic groups (P1), group-based app access, automated provisioning (P1), Terms of Use, and other identity lifecycle policies.

By following these best practices – as detailed in Microsoft’s documentation – you ensure your Microsoft Entra tenant is securely configured, resilient, and well-governed. Each step closes gaps and prepares your environment for Zero Trust operations.
Sources: Microsoft official documentation and guidance (Microsoft Entra / Azure AD) for security and identity best practices, ensuring all recommendations are current and comprehensive.

Entra Security Baseline

Azure AD Baseline Level 1:
•	Restrict access to the Azure AD administration portal
•	About guests: Azure AD  Users  Check present guest users
•	Notify users on password resets
•	Require two methods to reset passwords
•	Establish an interval for reconfirming user authentication methods

Azure AD Baseline Level 2:
•	Enable Azure AD Multi-Factor Authentication
•	Block remembering MFA on trusted devices
•	Notify all admins when other admins reset passwords
•	Members and guests can invite
•	Users to create and manage security groups
•	Self-service group management enabled
•	Application options - Allow users to register apps