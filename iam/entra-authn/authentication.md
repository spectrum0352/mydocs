🔐 Authentication
1. Introduction
Authentication is the process of verifying that an entity (user, device, or application) is who it claims to be.
Why Authentication is Critical
•	Prevents unauthorized access
•	Protects sensitive data and identities
•	Reduces risk of breaches and account compromise
________________________________________
2. Core Authentication Concepts
Authentication Factors
1.	Something you know – Password, PIN
2.	Something you have – Token, phone, smart card
3.	Something you are – Biometrics
4.	(Optional) Somewhere you are – Location/IP
👉 Most secure approach:
Passwordless + Multi-Factor Authentication (MFA)
Reason: Eliminates password attacks + adds layered security.
________________________________________
Strong Password vs Biometrics
•	Passwords: Vulnerable to phishing, reuse, brute force
•	Biometrics: Convenient but must be protected (cannot be changed if compromised)
👉 Best practice: Use biometrics as part of MFA or passwordless, not standalone
________________________________________
Message Authentication Code (MAC)
•	Ensures data integrity and authenticity
•	Uses shared secret key + hash function
________________________________________
Password Salting
•	Adds randomness to password hashes
•	Prevents rainbow table attacks
Limitation:
•	Does NOT prevent weak passwords or phishing attacks
________________________________________
OAuth & OpenID Connect
•	OAuth: Authorization (access delegation)
•	OpenID Connect: Authentication layer on top of OAuth
________________________________________
3. Authentication Methods
Common Methods
•	Password-based authentication
•	Multi-Factor Authentication (MFA)
•	Passwordless authentication (FIDO2, biometrics)
•	Certificate-based authentication
•	Token-based authentication (OTP, apps)
•	Key-based authentication (Linux/SSH)
________________________________________
Passwordless Authentication
•	Uses:
o	FIDO2 security keys
o	Authenticator apps
o	Windows Hello for Business
👉 Benefits:
•	Phishing-resistant
•	No password management overhead
________________________________________
4. Planning Authentication Strategy
Objectives
•	Strong security posture
•	Minimal user friction
•	Compliance requirements
Key Design Decisions
•	MFA enforcement (all users vs privileged users)
•	Password vs passwordless strategy
•	Cloud vs on-prem authentication
•	Integration with legacy apps
________________________________________
Risk & Impact
Area	Risk if Weak	Impact
Password-only auth	Credential theft	High
No MFA	Account takeover	Critical
Poor monitoring	Undetected attacks	High
Weak policies	Compliance failure	Medium
________________________________________
Cost Considerations
•	Licensing (Entra P1/P2)
•	Hardware tokens (if used)
•	Implementation & maintenance
•	User training
________________________________________
5. Prerequisites
General
•	Identity provider (Entra ID / AD DS)
•	Network connectivity
•	TLS/HTTPS enabled
Microsoft Entra
•	Entra ID tenant
•	P1/P2 license (for MFA, Conditional Access, Identity Protection)
•	Admin roles:
o	Global Admin
o	Security Admin
o	Conditional Access Admin
On-Prem AD
•	Domain controllers
•	AD schema readiness
•	Sync tool (Entra Connect)
Windows
•	TPM 2.0 (for Windows Hello)
•	Supported OS versions
Linux
•	SSH configured
•	Key-based authentication enabled
________________________________________
6. Implementation
6.1 Microsoft Entra Authentication
Authentication Methods
•	Password Hash Sync (PHS)
•	Pass-through Authentication (PTA)
•	Federation (ADFS)
•	Passwordless (FIDO2, Hello)
________________________________________
Multi-Factor Authentication (MFA)
Implementation Steps:
1.	Enable Security Defaults OR
2.	Configure Conditional Access Policy
o	Assign users/groups
o	Define conditions (location, risk)
o	Require MFA
Best Practices:
•	Enforce MFA for admins first
•	Avoid SMS where possible (use app-based)
•	Enable number matching
________________________________________
Self-Service Password Reset (SSPR)
•	Enable for users/groups
•	Configure authentication methods (email, phone, app)
•	Integrate with on-prem AD (writeback)
________________________________________
Password Protection & Smart Lockout
•	Enforce banned password lists
•	Enable Smart Lockout to prevent brute force
How it works (On-prem):
•	DC Agent + Proxy
•	Policies synced from Entra
•	Local enforcement on Domain Controllers
________________________________________
Certificate-Based Authentication (CBA)
•	Requires PKI infrastructure
•	Used for high-security environments
________________________________________
Azure VM Authentication
•	Windows: Entra login / RDP + AAD auth
•	Linux: SSH key + Entra integration
________________________________________
6.2 Active Directory (AD) Authentication
Protocols
•	Kerberos (default) – secure, ticket-based
•	NTLM (legacy) – avoid where possible
Components
•	Domain Controller
•	Kerberos Key Distribution Center (KDC)
•	Security Accounts Manager (SAM)
________________________________________
Best Practices
•	Disable NTLM where possible
•	Enforce Kerberos
•	Use Group Policy for password & lockout
________________________________________
6.3 Windows Authentication
Methods
•	Kerberos / NTLM
•	Windows Hello for Business
•	Smart cards / certificates
________________________________________
Windows Hello for Business
•	Uses asymmetric keys (public/private)
•	Private key stored in TPM
•	Supports PIN or biometrics
Benefits:
•	No password exposure
•	Phishing-resistant
•	Device-bound authentication
________________________________________
6.4 Linux Authentication
Methods
•	SSH password authentication (avoid)
•	SSH key-based authentication (recommended)
Key-Based Authentication
•	Public key → stored on server
•	Private key → stored on client
________________________________________
Hardening
•	Disable password login
•	Use tools like:
o	fail2ban
o	IP restrictions
•	Enable MFA (e.g., PAM modules)
________________________________________
7. Operations & Maintenance
Monitoring
•	Sign-in logs (Entra ID)
•	Risk detections (Identity Protection)
•	Failed login attempts
________________________________________
Security Operations
•	Detect anomalous logins
•	Enforce Conditional Access policies
•	Respond to compromised accounts
________________________________________
Password & Access Audits
•	Check password strength
•	Detect reuse and leaks
•	Review privileged accounts
________________________________________
Incident Response
•	Reset credentials
•	Revoke sessions/tokens
•	Investigate logs
________________________________________
8. Best Practices for Secure Authentication
•	Enforce MFA everywhere
•	Prefer passwordless authentication
•	Use Conditional Access (risk-based)
•	Disable legacy protocols (NTLM, basic auth)
•	Implement account lockout policies
•	Monitor and alert on suspicious activity
•	Educate users on phishing
•	Use least privilege access
________________________________________
9. Summary
A modern authentication strategy should:
•	Combine identity, device, and risk signals
•	Use passwordless + MFA as default
•	Integrate cloud (Entra) + on-prem (AD)
•	Continuously monitor and improve
