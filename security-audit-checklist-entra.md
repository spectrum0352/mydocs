Microsoft Entra Security Checklist

Identity
Users, Groups and Devices
•	Users can register applications: NO
•	Restrict non-admin users from creating tenants: YES
•	Users can create security groups: NO
•	Restrict user access to Microsoft Entra admin center: YES
•	Allow users to connect work or school account with LinkedIn: NO
•	Users can create security groups via Azure portal, API, or PowerShell: NO
•	Users can create Microsoft 365 groups via Azure portal, API, or PowerShell: NO
•	Users allowed to join devices to Microsoft Entra: Selected users
•	Users allowed to register devices with Microsoft Entra: All
•	Require MFA to register or join devices: YES
•	Maximum number of devices per user: 1 (client dependent)
•	Restrict users from recovering BitLocker keys for owned devices: YES
•	Maintain at least two emergency access (break-glass) Global Administrator accounts

External Identities
•	Guest user access restricted to their own directory object properties and memberships (most restrictive): YES
•	Only users assigned specific admin roles can invite guest users
•	Guest self-service sign-up via user flows: NO
•	Allow invitations only to specified domains (most restrictive)
•	Cross-tenant access evaluated during guest invitation
•	Cross-tenant access settings (inbound/outbound): Block all identity providers except Microsoft Entra ID

Guest Access
•	Control guest access using Conditional Access and limited roles
•	Perform periodic guest access reviews
•	Enforce MFA for all guest users using Conditional Access

Enterprise Applications
•	Allow user consent only for apps from verified publishers with selected permissions
•	Configure user consent settings for organizational data access
•	Admin consent requests disabled; users must contact administrators

Protection
Identity Protection – Risk Policies
•	Configure User Risk Policy: Risk level Low or above, Assignment All users, Control Require password change
•	Configure Sign-in Risk Policy: Risk level Low or above, Assignment All users, Control Require MFA
•	Configure MFA Registration Policy: Assignment All users, Control Require Microsoft Entra MFA registration

Risky Sign-In Alerts
•	Configure “Users at risk detected alerts”
•	Add required notification email addresses
•	Set alert threshold to Low or above

Conditional Access Policies
•	Require MFA for all users
•	Require MFA and compliant device for Microsoft Admin portals including Entra services
•	Require password change for high-risk users
•	Require MFA for risky sign-ins
•	Block legacy authentication protocols

Named Locations
•	Configure trusted country locations as per customer requirement
•	Configure trusted IP ranges (internal/external/VPN ranges)
•	Block sign-ins from risky countries or TOR networks
•	Create Named Location: “Risky Countries / TOR”
•	Apply Conditional Access policy to block access from risky locations

Authentication
•	Enable Microsoft Authenticator as default authentication method
•	Allow stronger authentication such as Passkeys or Hardware (RSA) tokens
•	Enable MFA registration policy using default settings

Password Reset
•	Enable Self-Service Password Reset (SSPR) for All users
•	Require 2 authentication methods for password reset
•	Allowed methods: Email, Mobile phone (SMS), Mobile app code
•	Notify users on password reset: YES
•	Notify admins when other admins reset password: NO

Governance
•	Perform monthly access reviews for privileged roles (Teams + Groups)
•	Perform access reviews for guest users monthly or quarterly
•	Configure access review for inactive users (no sign-in for 30 days)
•	Use Teams + Groups for access review configuration

Security Review & Operational Checks
•	Assess enterprise application access via Microsoft Entra
•	Verify break-glass emergency accounts exist
•	Review Conditional Access policies (user, device, location, application)
•	Review guest users and remove unnecessary accounts or permissions
•	Ensure MFA enforced for all users including administrators
•	Assess Privileged Identity Management (PIM) for high-privilege roles
•	Use groups instead of direct user permission assignments
•	Review application registrations and remove unused apps
•	Enforce least-privilege permissions for applications
•	Ensure legacy authentication is blocked
•	Review password policies (length, complexity, expiration)
•	Monitor self-service password reset activity
•	Block non-compliant devices from accessing resources
•	Review external/guest users and clean unused access
•	Review group memberships and remove unnecessary users
•	Remove inactive user accounts
•	Validate Identity Protection configuration
•	Ensure sign-in frequency policies are configured
•	Ensure user risk policies are configured
•	Limit Global Administrator accounts to 3–5 maximum
•	Ensure PIM requires approval and Just-In-Time access
•	Review cross-tenant synchronization configuration (if used)
•	Review external collaboration settings for guest capabilities
•	Review authentication methods configuration
•	Review default user and group permissions
•	Verify whether Security Defaults are enabled in Microsoft Entra

Security checks for Microsoft Entra
Assess access of enterprise applications: Microsoft Entra is the central point for application access management.
Verify if break-glass accounts for emergency access are created
Assess the Conditional Access policies based on user, location, device, and applications
Review guest user access and permissions, remove unnecessary accounts and permissions
Check if MFA is enforced for all users
Assess Privileged Identity Management (PIM) for access to high privileged roles.
Review if user groups are used to manage permissions instead of assigning them directly to users.
Review application registrations and remove unused or unnecessary apps.
Ensure least privileged accesses for registered applications 
Ensure legacy authentication protocols are blocked
Enable MFA for all users, including administrators.
Review Password policies (length, complexity, expiration).
Monitor self-service password reset activity for potential abuse.
Block non-compliant devices from accessing resources.
Review external/guest users remove unnecessary users and/or their permissions
Review group memberships and remove unnecessary users.
Review inactive user accounts and remove them
Assess Identity Protection configuration
Ensure sign-in frequency policies are configured
Ensure user risk policies are configured
Limit the number of Global Administrator accounts (ideally between 3 to 5 only).
Review PIM configuration - ensure privileged role action should require approval, Just in time access
Review Cross tenant synchronization configuration (if applicable)
Review External collaboration settings (What Guest users can do in this tenant?)
Review authentication method
Review default users and groups permissions 
Check if Security defaults enabled in Microsoft Entra


Specific Control (Example)	Granular Setting (Example)
Require MFA for all users	"Prompt for MFA every time a user signs in"
Enforce strong password policies	"Minimum password length: 16 characters, require uppercase, lowercase, numbers, and symbols"
Block legacy authentication	"Block all legacy authentication protocols (e.g., POP3, IMAP, SMTP)"
Require compliant devices for access	"Require devices to be registered with Azure AD and marked as compliant by Intune"
Limit the number of Global Administrators	"Limit to a maximum of 3 Global Administrators"
Require approval for privileged role activation	"Require approval from 2 designated approvers for Global Administrator role activation"
Set time limits for privileged role activation	"Maximum activation duration for the Security Administrator role: 2 hours"
Control access to enterprise applications	"Grant access only to necessary applications and require admin consent for new app registrations"
Monitor application usage for suspicious activity	"Alert on unusual access patterns or data exfiltration attempts"
Protect sensitive data with encryption	"Encrypt all documents containing PII using Azure Information Protection"
Prevent data loss with DLP policies	"Block sending sensitive data (e.g., credit card numbers) to external email addresses"
Detect and respond to identity-based threats	"Alert on suspicious sign-in attempts, such as from unusual locations or IP addresses"
Monitor security alerts and respond to incidents	"Investigate and remediate all high-priority security alerts within 24 hours"
Configure Conditional Access policies based on location	"Block access from known malicious IP addresses or countries"
Require MFA for specific applications	"Require MFA for users accessing sensitive applications like SharePoint Online or Exchange Online"
Control access based on device state	"Block access from unmanaged or non-compliant devices"
Configure sign-in risk policies	"Require MFA for users with medium or high sign-in risk"
Configure user risk policies	"Require password change for users with medium or high user risk"
Implement app protection policies	"Restrict copy/paste functionality for managed applications on mobile devices"
Control access to Azure resources based on roles	"Grant least privilege access to Azure resources using built-in or custom roles"
Monitor privileged accounts for suspicious activity	"Alert on any changes to privileged role assignments or unusual activity by privileged users"
Enforce device compliance policies with Intune	"Require devices to have a minimum OS version, up-to-date antivirus software, and firewall enabled"
Configure sensitivity labels for data classification	"Create sensitivity labels to classify data as Confidential, Public, etc."
Implement data loss prevention (DLP) policies	"Prevent users from sharing sensitive data outside the organization via email, chat, or file sharing"
Configure alerts for suspicious activities in Defender for Identity	"Alert on pass-the-hash attacks, brute-force attacks, or other suspicious activities"

Category	Subcategory	Specific Control (Example)	Granular Setting (Example)	How to Find/Configure
Identity & Authentication	MFA	Require MFA for all users	"Prompt for MFA every time" (more granular than just "enabled")	Azure portal -> Azure AD -> Security -> Conditional Access -> Create/Edit Policy -> Grant controls
	Password Policy	Enforce strong passwords	"Minimum password length: 16 characters" (more granular than default)	Azure portal -> Azure AD -> Security -> Authentication methods -> Password policies
	Block Legacy Auth	Block legacy authentication	"Block all legacy authentication protocols" (more granular than just "enabled")	Azure portal -> Azure AD -> Security -> Authentication methods -> Basic authentication (legacy)
	Conditional Access	Require compliant device	"Require device to be marked as compliant"	Azure portal -> Azure AD -> Security -> Conditional Access -> Create/Edit Policy -> Grant controls -> Require compliant device
	Passwordless Auth	Encourage passwordless	"Enable Windows Hello for Business"	Azure portal -> Azure AD -> Security -> Authentication methods -> Windows Hello for Business
Privileged Access	PIM	Limit Global Admins	"Only 2 Global Admins allowed"	Azure portal -> Azure AD -> Security -> Privileged Identity Management -> Roles
	PIM	Require approval for role activation	"Require approval from 2 designated approvers"	Azure portal -> Azure AD -> Security -> Privileged Identity Management -> Roles -> Role Settings
	PIM	Set activation duration	"Maximum activation duration: 4 hours"	Azure portal -> Azure AD -> Security -> Privileged Identity Management -> Roles -> Role Settings
Device Management	Device Registration	Require device registration	"Require all devices to be registered with Azure AD"	Azure portal -> Azure AD -> Devices -> Device settings
	Intune	Enforce BitLocker encryption	"Require BitLocker encryption on all Windows devices"	Microsoft Intune admin center -> Devices -> Configuration profiles
Application Security	App Registration	Control app access	"Grant consent only to verified publishers"	Azure portal -> Azure AD -> Enterprise applications -> Consent and permissions
	App Governance	Monitor app usage	"Alert on access to sensitive data by unapproved apps"	Microsoft Cloud App Security (MCAS)
Data Protection	Azure Information Protection	Enable data encryption	"Encrypt all documents containing PII"	Azure portal -> Azure Information Protection
	Data Loss Prevention (DLP)	Prevent data exfiltration	"Block sending sensitive data to external email addresses"	Microsoft Purview compliance portal -> Data loss prevention
Threat Protection	Defender for Identity	Monitor for suspicious activity	"Alert on unusual Kerberos authentication attempts"	Microsoft 365 Defender portal -> Identities
	Identity Protection	Respond to risk	"Require password change for medium risk users"	Azure portal -> Azure AD -> Security -> Identity Protection -> User risk policy

Control Area	Specific Control	Recommended Value	Rationale
Identity & Authentication	Require MFA for all users	Enabled	Significantly reduces risk of compromised accounts
	Enforce strong password policies	Minimum length 14 characters, complexity requirements, block common passwords	Makes passwords harder to guess or crack
	Block legacy authentication	Enabled	Legacy protocols don't support MFA, posing a security risk
	Use Conditional Access policies	Granular policies based on user, location, device, app, risk	Enables context-aware access control, enhancing security
	Implement passwordless authentication	Encourage use of Windows Hello for Business, Microsoft Authenticator	Phishing-resistant, improves user experience
Privileged Access	Limit number of Global Admins	Minimize, use least privilege	Reduces the impact of a compromised admin account
	Use Privileged Identity Management (PIM)	Require approval for privileged role activation, set time limits	Provides just-in-time access, reduces standing privileges
	Monitor privileged accounts	Alert on unusual activity, review audit logs	Detects potential misuse or compromise
Device Management	Require compliant devices	Enforce device registration, require up-to-date OS and security patches	Ensures devices meet security standards before accessing resources
	Use Intune for device management	Deploy and manage devices, enforce security policies	Provides centralized control over device security
Application Security	Control app access	Grant access only to necessary apps, use app governance policies	Limits the impact of compromised apps
	Monitor app usage	Detect unusual activity, identify risky apps	Helps prevent data exfiltration or malware
Data Protection	Enable data encryption	Use Azure Information Protection, Microsoft Purview	Protects data at rest and in transit
	Implement data loss prevention (DLP) policies	Prevent sensitive data from leaving the organization	Reduces risk of data leaks
Threat Protection	Enable Microsoft Defender for Identity	Detects and responds to identity-based threats	Provides advanced threat protection
	Monitor security alerts	Investigate and respond to suspicious activity	Helps prevent or mitigate attacks

Security Check	Category	Recommended Security Value
Modern Authentication	Isolation Principles	Use only claims-based modern authentication (SAML, OAuth2, OpenID Connect). Eliminate legacy authentication methods (NTLM).
Strong Authentication	Isolation Principles	Enforce strong authentication for all access. Prioritize passwordless authentication (Windows Hello for Business, FIDO2 keys).
Secure Workstations	Isolation Principles	Deploy secure workstations for administrative tasks. Consider Windows 365 Cloud PCs or Conditional Access with device filters.
Eliminate Legacy Trusts	Isolation Principles	Avoid legacy trust mechanisms (Active Directory trusts). Use modern constructs like federation and claims-based identity.
Isolate Services	Isolation Principles	Minimize the attack surface. Enable access only through modern authentication. Secure remote access with modern authentication.
Directory-Level Role Assignments	Isolation Principles	Minimize directory-level role assignments. Use AU-scoping instead of directory-wide User Administrator roles. Limit service-specific directory roles with control plane actions.
Tenant Branding	General Guidance	Use clear and differentiated branding for isolated tenants to prevent human error.
Privileged Account Provisioning	Human Identity	Provision separate privileged accounts in the isolated environment. Consider Microsoft Entra B2B collaboration for non-production environments.
Cloud-Only Accounts	Human Identity	Use cloud-only accounts for new environments. Consider synchronizing from isolated on-premises AD if required.
Identity Proofing for B2B	Human Identity	Implement processes to proof external identities before issuing B2B invitations. Enable Conditional Access for MFA registration.
Outsourcing High-Risk Roles	Human Identity	Outsource Global Administrator and Privileged Role Administrator roles to a managed service provider via Azure B2B or CSP. Control access with PIM approval flows.
Emergency Access Accounts	Nonhuman Identity	Create two cloud-only emergency access accounts with the Global Administrator role. Follow emergency access account recommendations.
Azure Managed Identities	Nonhuman Identity	Use Azure managed identities for Azure resources whenever possible.
Service Principals	Nonhuman Identity	Use service principal objects if managed identities are not supported. Use certificates or Conditional Access for protection.
Hybrid Service Accounts	Nonhuman Identity	Avoid syncing on-premises service accounts. Use managed identities or service principals with certificates or Conditional Access. Implement compensating controls if necessary.
Resource Group-Based Access	Resource Assignment	Manage access to Azure resources using resource groups and Microsoft Entra security groups.
Group-Based Licensing	Resource Assignment	Use group-based licensing and security groups for Microsoft services.
Cloud-Native Group Governance	Resource Assignment	Use Microsoft Entra access reviews and entitlement management for cloud-native groups.
Direct User Assignment	Resource Assignment	Use direct user assignment for third-party SaaS and on-premises applications. Govern with access reviews and entitlement management.
On-Premises Group Sync	Resource Assignment	Consider synchronization cycles for on-premises AD security groups needing access to cloud resources.
Strong Credentials	Credential Management	All identities must use strong authentication (MFA, FIDO keys). Support smart card authentication if applicable.
Passwordless Credentials	Credential Management	Prioritize passwordless authentication (FIDO keys, Windows Hello for Business) for privileged roles.
Password Protection	Credential Management	Deploy Microsoft Entra password protection and smart lockout.
Self-Service Password Management	Credential Management	Implement self-service password management.
External Identity Passwords	Credential Management	Use Microsoft Entra B2B collaboration to avoid introducing new passwords.
Service Principal Credentials	Credential Management	Use certificate credentials for service principals or Conditional Access for workload identities. Use Azure Key Vault for secure storage.
Conditional Access for Azure Management	Access Policies	Define Conditional Access policies for the Windows Azure Service Management API with MFA and device-based controls.
Application-Specific Conditional Access	Access Policies	Apply explicit Conditional Access policies to all onboarded applications.
Conditional Access for Security Info Registration	Access Policies	Define Conditional Access policies for security information registration.
Conditional Access for Workload Identities	Access Policies	Use Conditional Access to restrict workload identities based on location or other factors.
B2B Authentication Challenges	Access Policies	Address potential MFA reprovisioning needs for B2B users. Use cross-tenant access settings.
Device Filters in Conditional Access	Access Policies	Use device filters to restrict access from specific devices (e.g., SAWs).
Conditional Access for Billing Apps	Access Policies	Use dedicated admin accounts and target Conditional Access policies to them for billing applications.
No Standing Access	Privileged Roles	Eliminate standing access for privileged operations. Use PIM for just-in-time activation.
Number of Admins	Privileged Roles	Define minimum and maximum number of privileged roles.
Limit Privileged Access	Privileged Roles	Create cloud-only, role-assignable groups for high-privilege operations.
Least Privileged Access	Privileged Roles	Grant only necessary permissions. Use Azure RBAC custom roles.
Privileged Access from Secure Workstations	Privileged Roles	Require all privileged access from secure, locked-down devices.
Privileged Role Process Guardrails	Privileged Roles	Define processes and guardrails for privileged operations (qualification, separation of duties, etc.).
Resource Access Attestation	Resource Access	Perform regular access reviews for privileged roles.
Resource Access Lifecycle	Resource Access	Use Microsoft Entra Entitlement Management for access packages and lifecycle management.
Tenant Lifecycle Process	Tenant & Subscription Lifecycle	Implement a process for requesting new tenants, including justification, cloud, production status, data residency, management, and training.
Tenant Review	Tenant & Subscription Lifecycle	Regularly review tenants in the billing plane to detect unauthorized creation.
Subscription Lifecycle Process	Tenant & Subscription Lifecycle	Define a taxonomy for applications and solutions requiring Azure resources. Manage subscriptions programmatically.
Subscription Role Assignments	Tenant & Subscription Lifecycle	Create Microsoft Entra groups for Azure RBAC roles and delegate management to solution owners.
EA/MCA Role Management	Tenant & Subscription Lifecycle	Use dedicated accounts for EA/MCA roles and monitor their usage.
B2C Tenant Security	Tenant & Subscription Lifecycle	Use B2B collaboration for B2C admin access, apply Conditional Access, and perform regular access reviews.
Cross-Environment Roles	Operations	Define principles for environment lifecycle, management group hierarchy, billing, tenant creation, application taxonomy, subscription provisioning, isolation boundaries, baseline controls, operational procedures, role delegation, segregation of duties, supply chain management, naming conventions, and correlation mechanisms.
Tenant Creation Ownership	Operations	Assign a specific team to own tenant creation following standardized procedures.
Cross-Environment Tooling	Operations	Involve architects from all environments in defining cross-environment tools.
Azure Subscription Discovery	Inventory & Visibility	Use Global Administrator elevation to gain visibility of all subscriptions.
Enabling Read Access	Inventory & Visibility	Grant Reader role at the root management group for centralized IT team access.
Resource Discovery	Inventory & Visibility	Use Azure Resource Graph to query resources.
Central Security Log Management	Logging & Monitoring	Ingest logs from all environments centrally. Use Azure Monitor.
Cross-Environment Correlation	Logging & Monitoring	Implement procedures to correlate identity activities across environments.
Microsoft Entra Log Strategy	Logging & Monitoring	Include Sign-in activity, Audit logs, and Risk events in the log strategy.
Hybrid Infrastructure OS Logs	Logging & Monitoring	Archive and monitor hybrid identity infrastructure OS logs (AD FS, Azure AD Connect, etc.).
Log Storage Retention	Logging & Monitoring	Implement a consistent log storage retention strategy.
Monitoring and Log Reviewing	Logging & Monitoring	Ensure consistent monitoring tasks and ownership across environments.
Suspicious Activity Monitoring	Logging & Monitoring	Monitor Microsoft Entra risk events and investigate suspicious activity.

Security Check	Category	Cyber Risk/Attack	Recommended Value for Most Secure
MFA enabled for all users	MFA Configuration	Credential Stuffing, Phishing	Yes
MFA methods (e.g., SMS, Authenticator App)	MFA Configuration	SIM Swap, Device Theft	Authenticator App
Password complexity requirements	Password Policies	Brute Force Attacks	14+ characters, mix of letters, numbers, and special characters
Password expiration policy	Password Policies	Stale Passwords	90 days
Password history (prevent reuse)	Password Policies	Credential Reuse	24 passwords
Account lockout threshold	Account Lockout	Brute Force Attacks	20 failed attempts
Account lockout duration	Account Lockout	Denial of Service	15 minutes
Reset account lockout counter	Account Lockout	Brute Force Attacks	30 minutes
Enable identity protection policies	Identity Protection	Identity Theft, Unauthorized Access	Yes
Monitor sign-in logs	Identity Protection	Unauthorized Access	Enable logging and alerts
Implement conditional access policies	Identity Protection	Insider Threats	Yes
Enable MFA	Access Control	Credential Stuffing, Phishing	Always Enabled
Enforce Password Policy	Access Control	Brute Force Attacks	Strong Passwords, Regular Changes
Limit Admin Privileges	RBAC	Privilege Escalation	Least Privilege Access
Regular Access Reviews	Access Reviews	Insider Threats	Quarterly Reviews
Conditional Access Policies	Conditional Access	Unauthorized Access	Enforced for All Users
Use Secure Authentication Context	Conditional Access	Session Hijacking	Always Enforced
Automate Provisioning/Deprovisioning	RBAC	Account Hijacking	Automated Processes
Monitor User Activity	Access Control	Data Exfiltration	Continuous Monitoring
Implement Session Controls	Conditional Access	Session Hijacking	Enforced for Sensitive Roles
Encrypt Data at Rest and in Transit	Access Control	Data Breach	Always Enabled
Use Entitlement Management	Access Control	Over-Privileged Accounts	Regularly Reviewed
Conditional Access Policies	Access Control	Unauthorized Access	Enable Multi-Factor Authentication (MFA)
Conditional Access Policies	Access Control	Phishing Attacks	Enable Risk-Based Conditional Access
Role-Based Access Control (RBAC)	Access Control	Privilege Escalation	Implement Least Privilege Principle
Role-Based Access Control (RBAC)	Access Control	Insider Threats	Regularly Review and Update Roles
Access Reviews	Access Control	Stale Accounts	Conduct Quarterly Access Reviews
Access Reviews	Access Control	Over-privileged Accounts	Remove Unnecessary Permissions
Access Reviews	Access Control	Compliance Violations	Ensure Compliance with Regulatory Standards
Access Reviews	Access Control	Data Breaches	Monitor and Audit Access Logs Regularly
Guest Accounts	Category	Cyber Risk/Attack	Recommended Value for Most Secure
Restrict Guest Access Permissions	Access Management	Unauthorized access	Restricted access (default)
Enable Multi-Factor Authentication (MFA)	Authentication	Account compromise	Always required for guests
Regularly Review Guest Accounts	Monitoring	Inactive accounts	Conduct regular reviews
Limit Guest User Roles	User Management	Privilege escalation	Assign least privilege roles
Monitor Guest Activity	Logging	Insider threats	Enable guest activity logging
Set Expiry Dates for Guest Accounts	Access Management	Persistent access	Set expiration dates
Restrict Guest Access to Specific Resources	Access Management	Data leakage	Limit access to necessary resources
Audit Guest Access	Governance	Unauthorized changes	Enable audit logs for guest access
Conditional Access Policy Checks			
Security Check	Category	Cyber Risk/Attack	Recommended Value for Most Secure
Multifactor Authentication (MFA)	User Authentication	Phishing, Credential Stuffing	Require MFA
Device Compliance	Device Security	Malware, Unauthorized Access	Require compliant devices
Trusted Locations	Network Security	Man-in-the-Middle Attacks	Restrict to trusted locations
Application Access Control	Application Security	Unauthorized Application Access	Restrict access to specific apps
Sign-In Risk Assessment	Risk Management	Account Compromise, Insider Threats	Block high-risk sign-ins
Session Control	Session Security	Session Hijacking	Limit session duration
Conditional Access Templates	Policy Management	Misconfiguration, Policy Bypass	Use predefined templates
Privileged Identity Management Checks			
Security Check	Category	Cyber Risk/Attack	Recommended Value for Most Secure
Just-In-Time Access	Access Control	Unauthorized Access, Insider Threats	Enable JIT access
Approval Workflows	Access Control	Privilege Escalation, Insider Threats	Require approval for role activation
Access Expiration	Access Control	Unused Accounts, Insider Threats	Set expiration for privileged roles
Multifactor Authentication (MFA)	User Authentication	Credential Theft, Phishing	Require MFA for role activation
Role-Based Access Reviews	Access Control	Overprivileged Accounts, Insider Threats	Conduct regular access reviews
Audit Logs and Alerts	Monitoring	Unauthorized Access, Insider Threats	Enable audit logs and alerts
Session Control	Session Security	Session Hijacking	Limit session duration
Service principals and Application registraion Checks			
Security Check	Category	Cyber Risk/Attack	Recommended Value for Most Secure
Remove unused credentials from applications	Application Security	Credential Misuse, Unauthorized Access	Remove unused credentials regularly
Renew expiring service principal credentials	Credential Management	Downtime, Credential Theft	Renew before expiration
Renew expiring application credentials	Credential Management	Downtime, Credential Theft	Renew before expiration
Remove unused applications	Application Security	Unauthorized Access, Application Compromise	Remove unused applications
Migrate applications from Azure AD Graph to Microsoft Graph	API Management	API Misuse, Data Exposure	Migrate to Microsoft Graph APIs
Migrate service principals from Azure AD Graph to Microsoft Graph	API Management	API Misuse, Data Exposure	Migrate to Microsoft Graph APIs
Authentication			
Security Check	Category	Cyber Risk/Attack	Recommended Value for Most Secure
Multifactor Authentication (MFA)	User Authentication	Phishing, Credential Stuffing	Require MFA
Passwordless Authentication	User Authentication	Password Theft, Brute Force Attacks	Enable passwordless methods
Biometric Authentication	User Authentication	Identity Theft, Spoofing	Use biometrics (e.g., fingerprint, face)
Conditional Access Policies	Access Control	Unauthorized Access, Insider Threats	Implement conditional access policies
Session Control	Session Security	Session Hijacking	Limit session duration
Audit Logs and Alerts	Monitoring	Unauthorized Access, Insider Threats	Enable audit logs and alerts
Device Compliance	Device Security	Malware, Unauthorized Access	Require compliant devices
User Risk Assessment	Risk Management	Account Compromise, Insider Threats	Block high-risk sign-ins
B2B users			
Security Check	Category	Cyber Risk/Attack	Recommended Value for Most Secure
Multifactor Authentication (MFA)	User Authentication	Phishing, Credential Stuffing	Require MFA for B2B users
Conditional Access Policies	Access Control	Unauthorized Access, Insider Threats	Implement conditional access policies
Session Control	Session Security	Session Hijacking	Limit session duration
Device Compliance	Device Security	Malware, Unauthorized Access	Require compliant devices
User Risk Assessment	Risk Management	Account Compromise, Insider Threats	Block high-risk sign-ins
Audit Logs and Alerts	Monitoring	Unauthorized Access, Insider Threats	Enable audit logs and alerts
Tenant Restrictions	Network Security	Unauthorized Access, Data Exposure	Restrict guest user access
Identity Provider Federation	Authentication	Credential Theft, Phishing	Federate with identity providers
RBAC			
Role Assignments	Access Control	Overprivileged Accounts, Insider Threats	Assign roles based on the principle of least privilege
Role-Based Access Reviews	Access Control	Unauthorized Access, Insider Threats	Conduct regular access reviews
Just-In-Time Access	Access Control	Unauthorized Access, Insider Threats	Enable JIT access
Approval Workflows	Access Control	Privilege Escalation, Insider Threats	Require approval for role assignments
Role Definition Management	Policy Management	Misconfiguration, Policy Bypass	Regularly review and update role definitions
Multifactor Authentication (MFA)	User Authentication	Credential Theft, Phishing	Require MFA for role assignments
Audit Logs and Alerts	Monitoring	Unauthorized Access, Insider Threats	Enable audit logs and alerts
Session Control	Session Security	Session Hijacking	Limit session duration
Conditional Access Policy Configuration			
Security Check	Recommended Value for Most Secure		
Multifactor Authentication (MFA)	Require MFA for all users		
Device Compliance	Require compliant devices		
Trusted Locations	Restrict access to trusted locations		
Application Access Control	Restrict access to specific applications		
Sign-In Risk Policy	Block high-risk sign-ins		
User Risk Policy	Block high-risk users		
Session Control	Limit session duration		
Conditional Access Templates	Use predefined templates		
Audit Logs and Alerts	Enable audit logs and alerts		
Identity Protection Policies	Enable Identity Protection Policies		
Access Reviews	Conduct regular access reviews		
Tenant Restrictions			
Overall Security Settings			
Security Setting	Recommended Value		
Multifactor Authentication (MFA)	Enabled for all users		
Passwordless Authentication	Enabled (e.g., Windows Hello, FIDO2)		
Conditional Access Policies	Enforced for all sign-ins		
Legacy Authentication Protocols	Blocked		
Privileged Identity Management (PIM)	Enabled		
Security Defaults	Enabled		
User Risk Policies	Configured based on organization's policies		
Device Compliance Policies	Enforced for all devices		
Access Reviews	Scheduled regularly		
Audit Logs	Enabled and monitored		
Application Access Policies	Configured based on organization's needs		
Security Information and Event Management (SIEM)	Integrated with SIEM solution		

Category	Policy/Control	Recommended Setting	Cybersecurity Risk if Not Configured	Example Attack Vector
Identity Protection	Enable Multi-Factor Authentication (MFA)	Enabled for all users, especially administrators	Unauthorized access due to single-factor authentication	Attackers using stolen credentials to gain access to sensitive data
	Password Policies	Strong passwords with complexity and expiration	Weak or easily guessable passwords	Attackers guessing weak passwords to gain access
	Account Lockout Policy	Account lockout after 5 failed attempts, lockout duration: 30 mins	Brute-force attacks	Attackers repeatedly trying passwords to gain access
Access Control	Conditional Access Policies	Policies based on risk, location, device compliance	Unauthorized access from untrusted locations or devices	Attackers accessing resources from compromised or untrusted devices
	Role-Based Access Control (RBAC)	Least privilege access for users and applications	Excessive permissions	Attackers exploiting excessive permissions to escalate privileges
	Access Reviews	Regular review and update of access permissions	Outdated or inappropriate access permissions	Attackers using outdated access permissions to exploit resources
Audit and Monitoring	Enable Audit Logs	Enabled for all critical activities	Lack of visibility into security events	Attackers performing malicious actions without detection
	Monitor for Anomalies	Alerts for unusual activities	Delayed detection of security incidents	Attackers performing anomalous activities without raising alerts
	Regular Review of Logs	Periodic review of audit logs	Unnoticed security incidents	Attackers covering tracks by tampering with logs
Security Policies	Configure Security Defaults	Enabled	Weak security settings	Attackers exploiting default or weak configurations
	Configure Allowable Encryption Types for Kerberos	Only secure encryption types allowed	Weak encryption	Attackers breaking weak encryption to intercept sensitive data
	Disable Legacy Authentication Protocols	Disabled (NTLM, Basic Authentication)	Increased attack surface	Attackers using outdated authentication protocols to gain access
Endpoint Security	Deploy Anti-Malware Software	Installed and updated regularly	Malware infections	Attackers deploying malware to compromise endpoints
	Secure Workstations	Device compliance policies, conditional access	Insecure devices	Attackers exploiting insecure devices to gain access
Governance and Compliance	Access Reviews	Conducted regularly	Unauthorized access	Attackers exploiting outdated access permissions
	Compliance Policies	Implemented for regulatory requirements	Non-compliance with regulations	Regulatory fines or breaches due to non-compliance
Incident Response	Incident Response Plan	Developed and regularly updated	Delayed or ineffective response to incidents	Attackers causing prolonged damage due to slow response
	Automate Threat Response	Utilized	Manual intervention required for every threat	Attackers overwhelming security teams with numerous incidents
User Education and Awareness	Security Training	Regular training for users	Lack of awareness about security threats	Users falling for phishing or social engineering attacks

Microsoft Entra ID Security Checklist

1. Global Administrator Accounts:
Limit the number of Global Administrator accounts (ideally 4 or less).
Use Privileged Identity Management (PIM) for just-in-time access to privileged roles.
Ensure Global Admins use strong, unique passwords and multi-factor authentication (MFA).
2. User Accounts:
Enforce strong password policies (length, complexity, expiration).
Enable MFA for all users, especially administrators.
Review inactive user accounts and disable them promptly.
3. Conditional Access Policies:
Implement Conditional Access policies to enforce MFA based on location, device, or risk.
Block legacy authentication protocols (e.g., POP3, IMAP).
Require compliant devices for accessing sensitive applications.
4. External Users:
Review guest user access and remove unnecessary accounts.
Use Conditional Access to control external user access.
Monitor external user activity for potential risks.
5. Groups:
Use groups to manage permissions instead of assigning them directly to users.
Review group memberships and remove unnecessary users.
Use nested groups to simplify administration.
6. Self-Service Password Reset:
Enable self-service password reset with strong authentication methods.
Monitor self-service password reset activity for potential abuse.

Application Security
7. Application Registrations:
Review application registrations and remove unused or unnecessary apps.
Ensure applications have least privilege access to resources.
Monitor application activity for suspicious behavior.
8. API Permissions:
Review API permissions granted to applications and users.
Limit API access to only necessary resources.
Monitor API usage for potential abuse.
9. Enterprise Applications:
Review enterprise applications and remove unused or unnecessary apps.
Ensure applications have appropriate security settings.
Monitor enterprise application activity for suspicious behavior.

Device Management
10. Device Registration:
Require devices to be registered in Azure AD for access to resources.
Use Intune to manage and secure devices.
Enforce device compliance policies.
11. Device Compliance:
Implement device compliance policies to ensure devices meet security standards.
Block non-compliant devices from accessing resources.
Monitor device compliance for potential risks.


Security Monitoring and Logging
14. Audit Logs:
Enable Azure AD audit logs to track user and administrator activity.
Review audit logs regularly for suspicious behavior.

15. Sign-in Logs:
Enable Azure AD sign-in logs to track user sign-in attempts.
Review sign-in logs for suspicious activity, such as failed logins or unusual locations.

16. Identity Protection:
Enable Azure AD Identity Protection to detect and respond to identity-based risks.
Review Identity Protection reports regularly.







