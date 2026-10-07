\## Identity \& Access Management



\- MFA enforced for all users

\- MFA enforced for all admins

\- Conditional access policies defined

\- Identity federation documented

\- Privileged accounts separated

\- No shared admin accounts

\- Privileged Identity Management enabled

\- Just-in-time admin access enabled

\- Password policy enforced

\- Passwordless authentication enabled where possible

\- Legacy authentication disabled

\- Service accounts inventoried

\- Service account permissions reviewed

\- Managed identities used instead of credentials

\- Access keys rotation policy defined

\- API keys rotated regularly

\- OAuth applications reviewed

\- OAuth consent policies enforced

\- Admin consent workflow defined

\- Guest access reviewed

\- B2B access reviewed

\- External identity lifecycle managed

\- Stale accounts disabled

\- Dormant accounts removed

\- Emergency access accounts secured

\- Break-glass accounts monitored

\- RBAC implemented using least privilege

\- No wildcard permissions in IAM policies

\- Azure role assignments reviewed

\- GCP IAM bindings reviewed

\- Identity logs integrated with SIEM

\- Identity risk detection enabled

\- Impossible travel detection enabled

\- Login anomaly detection enabled

\- Session timeout configured

\- Token lifetime configured

\- Device compliance required for access

\- Endpoint compliance integrated with access

\- Admin portal access restricted

\- Conditional access location-based policies implemented

\- Risk-based authentication implemented

\- Identity protection alerts monitored

\- Ensure no use of the Azure subscription Owner account

\- Enforce MFA on all users with portal access

\- Rotate access keys (App Registrations, Service Principals) every 90 days

\- Set strong password policies: Minimum length \[14+], Require uppercase, lowercase, number, and symbol

\- Avoid excessive privilege via role assignments (e.g., use PIM)

\- use managed identities for VM/app resource access

\- Avoid Global Administrator Overuse: Ensure the Global Admin role is only assigned to break-glass accounts

\- MFA for All Users: Enforce MFA via Conditional Access, especially for admins and users with portal access.

\- Remove Stale Accounts: Disable accounts that haven't logged in within 90 days (SignInActivity).

\- Rotate Azure AD App Secrets: Ensure app/client secrets are rotated every 90 days or less.

\- Strong Password Policy: Enforce at least 14-character passwords, including uppercase, lowercase, number, and symbol.

\- Disable Legacy Authentications: Block legacy protocols (IMAP, POP3, SMTP) to prevent bypassing MFA.

\- No Default Access Keys: Ensure there are no leftover shared keys or default credentials (e.g., Logic Apps or Function Apps).

\- Use Role-Based Access Control (RBAC): Assign permissions through groups or roles, not directly to users.

\- Monitor Directory Role Changes: Alert on additions to high-privilege roles (Global Admin, Privileged Auth Admin, etc.).

\- Register Security Contact Info: Ensure securityContact and notification emails are defined in the tenant properties.

\- Use Managed Identities: Use system-assigned or user-assigned managed identities for services like VMs, Functions, and Logic Apps.

\- Avoid Access Keys for Storage: Use RBAC + Azure AD auth instead of access keys for storage account access.

\- Audit Service Principals: Review permissions assigned to Azure AD applications and automation accounts.

\- Suggested Azure Pentest Tests

\- Attempt login with legacy protocols (MFA bypass).

\- Abuse stale service principals with overprivileged roles.

\- Exploit shared keys (e.g., AzureWebJobsStorage) found in config files.

\- Enumerate users missing MFA using Microsoft Graph or AzureHound.

\- MFA enforced for all users

\- MFA enforced for privileged users

\- Conditional Access policies enforced

\- Legacy authentication disabled

• Basic authentication disabled

• Passwordless authentication enabled

• Azure AD Identity Protection enabled

• Risk-based conditional access configured

• Impossible travel detection enabled

• Privileged Identity Management enabled

• Just-in-time role activation enabled

• Global admin accounts minimized

• Privileged roles reviewed quarterly

• Guest user access reviewed quarterly

• B2B collaboration policy defined

• B2C configuration secured

• Azure AD application registrations reviewed

• Enterprise applications reviewed

• OAuth consent restricted

• Admin consent workflow defined

• Service principals permissions reviewed

• Managed identities used instead of secrets

• App secrets expiration enforced

• App certificates expiration enforced

• Azure AD password policy enforced

• Self-service password reset secured

• Azure AD device compliance enforced

• Azure AD join policy restricted

• Hybrid identity sync secured

• Azure AD Connect hardened

• Azure AD Connect server restricted

• Azure AD Connect admin access limited

• Azure AD Connect staging mode documented

• Azure AD audit logs monitored

• Azure AD risky users monitored

• Azure AD risky sign-ins monitored

• Azure AD token lifetime configured

• Azure AD external collaboration restrictions defined

• Azure AD conditional access report-only mode reviewed





AZURE AD / ENTRA ID SECURITY



• MFA enforced for all users



• MFA enforced for privileged users



• Conditional Access policies enforced



• Legacy authentication disabled



• Basic authentication disabled



• Passwordless authentication enabled



• Azure AD Identity Protection enabled



• Risk-based conditional access configured



• Impossible travel detection enabled



• Privileged Identity Management enabled



• Just-in-time role activation enabled



• Global admin accounts minimized



• Privileged roles reviewed quarterly



• Guest user access reviewed quarterly



• B2B collaboration policy defined



• B2C configuration secured



• Azure AD application registrations reviewed



• Enterprise applications reviewed



• OAuth consent restricted



• Admin consent workflow defined



• Service principals permissions reviewed



• Managed identities used instead of secrets



• App secrets expiration enforced



• App certificates expiration enforced



• Azure AD password policy enforced



• Self-service password reset secured



• Azure AD device compliance enforced



• Azure AD join policy restricted



• Hybrid identity sync secured



• Azure AD Connect hardened



• Azure AD Connect server restricted



• Azure AD Connect admin access limited



• Azure AD Connect staging mode documented



• Azure AD audit logs monitored



• Azure AD risky users monitored



• Azure AD risky sign-ins monitored



• Azure AD token lifetime configured



• Azure AD external collaboration restrictions defined



• Azure AD conditional access report-only mode reviewed





IDENTITY \\\& ACCESS MANAGEMENT



• MFA enforced for all users



• MFA enforced for all admins



• Conditional access policies defined



• Identity federation documented



• Privileged accounts separated



• No shared admin accounts



• Privileged Identity Management enabled



• Just-in-time admin access enabled



• Password policy enforced



• Passwordless authentication enabled where possible



• Legacy authentication disabled



• Service accounts inventoried



• Service account permissions reviewed



• Managed identities used instead of credentials



• Access keys rotation policy defined



• API keys rotated regularly



• OAuth applications reviewed



• OAuth consent policies enforced



• Admin consent workflow defined



• Guest access reviewed



• B2B access reviewed



• External identity lifecycle managed



• Stale accounts disabled



• Dormant accounts removed



• Emergency access accounts secured



• Break-glass accounts monitored



• RBAC implemented using least privilege



• No wildcard permissions in IAM policies



• AWS IAM roles reviewed



• Azure role assignments reviewed



• GCP IAM bindings reviewed



• Identity logs integrated with SIEM



• Identity risk detection enabled



• Impossible travel detection enabled



• Login anomaly detection enabled



• Session timeout configured



• Token lifetime configured



• Device compliance required for access



• Endpoint compliance integrated with access



• Admin portal access restricted



• Conditional access location-based policies implemented



• Risk-based authentication implemented



• Identity protection alerts monitored



\### Access Control to Azure Resources







| \*\*🔐 Check\*\* | \*\*Recommended Practice\*\* |



|----|----|



| \*\*Use Managed Identities\*\* | Use system-assigned or user-assigned managed identities for services like VMs, Functions, and Logic Apps. |



| \*\*Avoid Access Keys for Storage\*\* | Use RBAC + Azure AD auth instead of access keys for storage account access. |



| \*\*Audit Service Principals\*\* | Review permissions assigned to Azure AD applications and automation accounts. |



\*\*🛡️ Identity \& Access Management (Azure AD)\*\*







| \*\*🔒 Check\*\* | \*\*Recommended Practice\*\* |



|----|----|



| \*\*Avoid Global Administrator Overuse\*\* | Ensure the Global Admin role is only assigned to break-glass accounts. |



| \*\*MFA for All Users\*\* | Enforce MFA via Conditional Access, especially for admins and users with portal access. |



| \*\*Remove Stale Accounts\*\* | Disable accounts that haven't logged in within 90 days (SignInActivity). |



| \*\*Rotate Azure AD App Secrets\*\* | Ensure app/client secrets are rotated every 90 days or less. |



| \*\*Strong Password Policy\*\* | Enforce at least 14-character passwords, including uppercase, lowercase, number, and symbol. |



| \*\*Disable Legacy Auth\*\* | Block legacy protocols (IMAP, POP3, SMTP) to prevent bypassing MFA. |



| \*\*No Default Access Keys\*\* | Ensure there are no leftover shared keys or default credentials (e.g., Logic Apps or Function Apps). |



| \*\*Use Role-Based Access Control (RBAC)\*\* | Assign permissions through groups or roles, not directly to users. |



| \*\*Monitor Directory Role Changes\*\* | Alert on additions to high-privilege roles (Global Admin, Privileged Auth Admin, etc.). |



| \*\*Register Security Contact Info\*\* | Ensure securityContact and notification emails are defined in the tenant properties. |



\## Identity \& Access Management (IAM)







\- Ensure no use of the Azure subscription root account



\- Enforce MFA on all users with portal access



\- Rotate access keys (App Registrations, Service Principals) every 90 days



\- Set strong password policies:



\&#x20; - Minimum length: 14+



\&#x20; - Require uppercase, lowercase, number, and symbol



\- Avoid excessive privilege via role assignments (e.g., use PIM)



\- Use managed identities for VM/app resource access







Inspired by AWS Zeus audit principles, these Azure-specific checks focus



on misconfigurations and weak identity practices that red teams should



target or defenders should harden.







\## 1. Identity \& Access Management (IAM)







Inspired by AWS Zeus audit principles, these Azure-specific checks focus on misconfigurations and weak identity practices that red teams should target or defenders should harden.







\- Ensure no use of the Azure subscription Owner account



\- Enforce MFA on all users with portal access



\- Rotate access keys (App Registrations, Service Principals) every 90 days



\- Set strong password policies:



\&#x20; - Minimum length: 14+



\&#x20; - Require uppercase, lowercase, number, and symbol



\- Avoid excessive privilege via role assignments (e.g., use PIM)



\- Use managed identities for VM/app resource access







\*\*Recommendations:\*\*



\- Avoid Global Administrator Overuse: Ensure the Global Admin role is only assigned to break-glass accounts.



\- MFA for All Users: Enforce MFA via Conditional Access, especially for admins and users with portal access.



\- Remove Stale Accounts: Disable accounts that haven't logged in within 90 days (SignInActivity).



\- Rotate Azure AD App Secrets: Ensure app/client secrets are rotated every 90 days or less.



\- Strong Password Policy: Enforce at least 14-character passwords, including uppercase, lowercase, number, and symbol.



\- Disable Legacy Authentications: Block legacy protocols (IMAP, POP3, SMTP) to prevent bypassing MFA.



\- No Default Access Keys: Ensure there are no leftover shared keys or default credentials (e.g., Logic Apps or Function Apps).



\- Use Role-Based Access Control (RBAC): Assign permissions through groups or roles, not directly to users.



\- Monitor Directory Role Changes: Alert on additions to high-privilege roles (Global Admin, Privileged Auth Admin, etc.).



\- Register Security Contact Info: Ensure securityContact and notification emails are defined in the tenant properties.



\- Use Managed Identities: Use system-assigned or user-assigned managed identities for services like VMs, Functions, and Logic Apps.



\- Avoid Access Keys for Storage: Use RBAC + Azure AD auth instead of access keys for storage account access.



\- Audit Service Principals: Review permissions assigned to Azure AD applications and automation accounts.







\*\*Suggested Azure Pentest Tests\*\* 



\- Attempt login with legacy protocols (MFA bypass).

\- Abuse stale service principals with overprivileged roles.

\- Exploit shared keys (e.g., AzureWebJobsStorage) found in config files.

\- Enumerate users missing MFA using Microsoft Graph or AzureHound.





🛡️ Identity \& Access Management (Azure AD)

🔒 Check	Recommended Practice

Avoid Global Administrator Overuse	Ensure the Global Admin role is only assigned to break-glass accounts.

MFA for All Users	Enforce MFA via Conditional Access, especially for admins and users with portal access.

Remove Stale Accounts	Disable accounts that haven't logged in within 90 days (SignInActivity).

Rotate Azure AD App Secrets	Ensure app/client secrets are rotated every 90 days or less.

Strong Password Policy	Enforce at least 14-character passwords, including uppercase, lowercase, number, and symbol.

Disable Legacy Auth	Block legacy protocols (IMAP, POP3, SMTP) to prevent bypassing MFA.

No Default Access Keys	Ensure there are no leftover shared keys or default credentials (e.g., Logic Apps or Function Apps).

Use Role-Based Access Control (RBAC)	Assign permissions through groups or roles, not directly to users.

Monitor Directory Role Changes	Alert on additions to high-privilege roles (Global Admin, Privileged Auth Admin, etc.).

Register Security Contact Info	Ensure securityContact and notification emails are defined in the tenant properties.

Access Control to Azure Resources

🔐 Check	Recommended Practice

Use Managed Identities	Use system-assigned or user-assigned managed identities for services like VMs, Functions, and Logic Apps.

Avoid Access Keys for Storage	Use RBAC + Azure AD auth instead of access keys for storage account access.

Audit Service Principals	Review permissions assigned to Azure AD applications and automation accounts.

Networking

Deny inbound traffic on ports 22/3389 from 0.0.0.0/0 in all NSGs

Enable NSG Flow Logs across all Network Security Groups

Restrict default NSGs and Subnets to least privilege

Review Public IP usage — avoid assigning directly to critical VMs

Confirm no overly permissive route tables or peering links

Logging \& Diagnostic Settings

Enable diagnostic logs on all critical services (Key Vault, SQL, Storage, etc.)

Ensure logs are sent to Log Analytics / Event Hub / Storage

Use customer-managed keys (CMKs) and enable key rotation

Enable Azure Policy to enforce diagnostic settings

Block removal of diagnostic settings using policy

Monitoring \& Alerting

Configure alerts on:

Unauthorized API calls (403/401)

Non-MFA sign-ins to portal

Role assignment or permission changes

Key Vault key delete/disable attempts

NSG/Route Table/VNet configuration changes

Sign-in failures and brute-force attempts

Enable Azure Defender / Microsoft Defender for Cloud

Use Azure Monitor Activity Log alerts + Log Analytics queries

Billing \& Contact Integrity

📤 Check	Recommended Practice

Enable Cost Management Alerts	Set up budgets and alerts for cost spikes.

Maintain Updated Contact Info	Ensure organization’s billing and technical contacts are current.



🧪 Suggested Azure Pentest Tests Based on This:

Attempt login with legacy protocols (MFA bypass).

Abuse stale service principals with overprivileged roles.

Exploit shared keys (e.g., AzureWebJobsStorage) found in config files.

Enumerate users missing MFA using Microsoft Graph or AzureHound.



Azure Security Audit Playbook

Identity \& Access Management (IAM)

Ensure no use of the Azure subscription root account

Enforce MFA on all users with portal access

Rotate access keys (App Registrations, Service Principals) every 90 days

Set strong password policies:

Minimum length: 14+

Require uppercase, lowercase, number, and symbol

Avoid excessive privilege via role assignments (e.g., use PIM)

Use managed identities for VM/app resource access

Inspired by AWS Zeus audit principles, these Azure-specific checks focus on misconfigurations and weak identity practices that red teams should target or defenders should harden.





Identity and Access Management (IAM)

IAM is the Foundation of Zero Trust.

Focus: Securely manage identities and control access to Azure resources.

Zero Trust Principles: Verify every identity, enforce least privilege, and use multi-factor authentication (MFA).

Defense in Depth: Multiple layers of authentication, authorization, and access governance.

Azure Resources: Azure Active Directory (Azure AD), Azure AD B2C, Azure AD B2B

Security Controls:

Strong Authentication: MFA (e.g., Azure MFA, FIDO2 keys), password policies, Conditional Access.

Least Privilege: Role-Based Access Control (RBAC) for granular permissions, Privileged Identity Management (PIM) for just-in-time access.

Identity Governance: Access reviews, entitlement management, and lifecycle management for user accounts.

Conditional Access: Context-aware access control based on user, location, device, and application.

Break-Glass Accounts: Securely managed emergency access accounts with strict auditing.

Regular Audits: Review user permissions and access logs.



Identity and Access Management (IAM): Implement strong authentication, authorization, and access controls.



·       Multi-Factor Authentication (MFA): Ensure all users authenticate with multiple factors.

·       Conditional Access Policies: Implement policies based on user risk, device compliance, location, and other factors.

·       Least Privilege Access: Grant users the minimum necessary permissions to perform their tasks.

·       Just-In-Time (JIT) and Just-Enough-Access (JEA): Provide temporary access when needed and revoke it immediately after use.

Identity and Access Management (IAM): Implement strong authentication, authorization, and access controls.

Password Usage: Enforce strong password policies and account lockout procedures.







