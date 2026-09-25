Microsoft Authentication methods

Security accounts manager (SAM)
Windows stores user passwords in SAM or in active directory database in domains. Passwords are never stored in clear text and are hashed and results are stored in SAM.

NTLM Authentication
The NTLM authentication protocols are as follows: 
•	NTLM Authentication protocol
•	LM Authentication protocol
•	In these passwords are stored in SAM database using different hashing methods.

Kerberos Authentication
Microsoft has upgraded its default authentication protocol to Kerberos which provides stronger authentication for client/server applications than NTLM. It is a computer-network authentication protocol that works based on tickets to allow nodes communicating over a non-secure network to prove their identity to one another in a secure manner.


Windows Hello for Business
Windows Hello for Business is a modern authentication method that replaces traditional passwords with strong biometric or PIN-based credentials tied to a specific device. 

This approach addresses several password-related security concerns, including:
•	Password complexity and reuse: Strong passwords can be hard to remember, leading to weak password choices or reuse across multiple accounts.
•	Server breaches: Password breaches can expose sensitive information.
•	Replay attacks: Passwords can be intercepted and replayed to gain unauthorized access.
•	Phishing attacks: Users may inadvertently reveal their passwords to malicious actors.

How Windows Hello for Business works?
1.	Credential Creation: Windows Hello creates a credential based on a certificate or asymmetric key pair.
2.	Device Binding: The credential and its associated token are bound to the device.
3.	Identity Provider Validation: During registration, the identity provider (e.g., Active Directory, Azure AD) verifies the user's identity and maps their public key to their account.
4.	Key Generation: Keys are generated either in hardware (TPM) or software, depending on policy.
5.	Two-Factor Authentication: Users authenticate using a combination of: Something they know (PIN) and Something they are (biometrics)
6.	Private Key Security: The private key remains on the device, never leaving during authentication.
7.	Authentication Process: The user's biometric gesture or PIN triggers the device to use the private key to sign data sent to the identity provider.
8.	Identity Verification: The identity provider verifies the signature and authenticates the user.
9.	Key Storage: Personal and corporate accounts use a single container for keys, but they are separated by domain to protect user privacy.

By leveraging strong cryptographic methods and device-specific credentials, Windows Hello for Business significantly enhances security and user experience compared to traditional password-based authentication.

Microsoft Entra Authentication
Microsoft Entra ID (formerly Azure AD) handles how users sign in to access apps and resources. This includes planning, setting up, and managing how authentication works securely and conveniently.

1. Planning Authentication
Before setting up authentication, consider:
•	Security Needs: Choose stronger methods for sensitive data or compliance (like GDPR or HIPAA).
•	User Experience: Make it secure and user-friendly to avoid user frustration.
•	Authentication Methods: Pick methods that fit your needs (passwords, MFA, biometrics, etc.).
•	Conditional Access: Use rules to allow or block access based on location, device, or app.
•	Identity Management: Control who gets access, when, and for how long.
•	Monitoring: Track login activity and review for unusual behavior.
________________________________________
2. Authentication Methods
Microsoft Entra supports several ways for users to log in:
•	Passwords: Common but weak alone — use with other methods.
•	Multi-Factor Authentication (MFA): Adds extra steps like codes or biometrics.
•	Certificate-Based Authentication: Uses digital certificates instead of passwords for strong security.
•	Windows Hello for Business: Uses fingerprint, facial recognition, or PIN tied to a device.
•	Federated Authentication: Lets users log in with other systems (like on-prem Active Directory).
•	Social Logins: Allows sign-in with Google, Facebook, etc. (mainly for external users).
________________________________________
3. Password Protection and Smart Lockout
Helps stop attackers who try to guess passwords:
•	Password Protection: Blocks weak or common passwords (using Microsoft’s global ban list or your custom list).
•	Smart Lockout: Temporarily locks accounts after repeated failed attempts, but intelligently lets real users back in.
•	Note: Requires Microsoft Entra Premium P2 license.
How it works (technical summary):
•	Agents are installed on Domain Controllers (DCs).
•	These connect to Microsoft Entra and enforce the banned password rules.
•	They use service connection points in Active Directory to function properly.
________________________________________
4. Windows Hello for Business
•	Secure login with biometrics or PINs, tied to a specific device.
•	Stronger than passwords and easier to use.
•	Great for replacing passwords completely.
________________________________________
5. Certificate-Based Authentication
•	Users sign in using digital certificates, not passwords.
•	Very secure — often used for admins or sensitive systems.
•	Needs proper setup in Microsoft Entra to accept certificate-based logins.
________________________________________
6. Signing in to Azure VMs with Entra ID
•	You can set up Azure VMs (Windows or Linux) to allow login using Microsoft Entra accounts.
•	Benefits:
o	No need to manage local VM passwords.
o	Centralized identity management.
o	Works with Microsoft Entra Join, Entra registration, or VM extensions.
o	Use Managed Identities for secure app authentication inside VMs.
________________________________________
7. Conditional Access
•	Controls access based on:
o	Who is logging in (user or group)
o	Where from (location or IP)
o	What device is used (compliant or not)
o	Risk level or application sensitivity
•	Can enforce actions like:
o	Require MFA
o	Block access
o	Allow only from managed devices

Final Tip:
Always check the official [Microsoft Entra Documentation](https://learn.microsoft.com/en-us/entra/) for setup steps and the latest best practices.
This setup helps protect users and resources while keeping the sign-in experience as smooth as possible.


Microsoft Entra Authentication
This section covers planning, implementing, and managing user authentication within Microsoft Entra ID (formerly Azure AD).

1. Planning for Authentication:
A comprehensive authentication plan should consider various factors, including:
•	Security Requirements: Determine the appropriate level of security based on the sensitivity of the resources being protected. This includes considering regulatory compliance requirements (e.g., GDPR, HIPAA).
•	User Experience: Balance security with ease of use. Complex authentication methods can lead to user frustration and decreased productivity.
•	Authentication Methods: Select the most suitable authentication methods based on security needs and user experience goals.
•	Conditional Access Policies: Define granular access controls based on various conditions like user location, device state, and application sensitivity.
•	Identity Governance: Implement processes for managing user identities, including provisioning, deprovisioning, and lifecycle management.
•	Monitoring and Auditing: Establish mechanisms for monitoring authentication activity and auditing access attempts.

2. Authentication Methods:
Microsoft Entra ID supports a wide range of authentication methods, including:
•	Password-based Authentication: Traditional username and password authentication. While still common, it's often supplemented with stronger methods.
•	Multi-Factor Authentication (MFA): Adds an extra layer of security by requiring users to provide multiple forms of verification1 (e.g., password + code from an authenticator app, biometric scan). MFA is highly recommended.
•	Certificate-based Authentication: Uses digital certificates for authentication, providing strong security and eliminating the need for passwords.
•	Windows Hello for Business: Replaces passwords with strong biometric authentication (fingerprint, facial recognition) or PINs linked to a device.
•	Federated Authentication: Enables users to sign in with credentials from another identity provider (e.g., on-premises Active Directory Federation Services).
•	Social Identity Providers: Allows users to sign in with accounts from social media platforms (e.g., Google, Facebook).

3. Password Protection and Smart Lockout:
•	Password Protection: Addresses the vulnerability of weak passwords by preventing users from setting passwords that are on a global or custom banned password list. This helps mitigate dictionary attacks.
•	Smart Lockout: Protects against brute-force attacks by temporarily locking user accounts after a certain number of failed login attempts. Smart Lockout intelligently differentiates between legitimate login attempts and malicious ones.
•	Licensing: Azure AD Password Protection requires Azure AD Premium P2 licensing.
•	How Password Protection Works: 
o	Azure AD Password Protection Proxies advertise their presence to Domain Controllers (DCs) by creating serviceConnectionPoint objects in Active Directory.
o	The Azure AD Password Protection DC Agent service also creates a serviceConnectionPoint object. These objects are used for reporting and diagnostics.
o	The DC Agent service initiates the download of new password policies from Azure AD.
o	The DC Agent service locates the Azure AD Password Protection Proxies by querying Active Directory for the proxy serviceConnectionPoint objects.

4. Windows Hello for Business:
•	Provides strong two-factor authentication by linking a user's credentials to a specific device.
•	Supports biometric authentication (fingerprint, facial recognition) and PINs.
•	Improves security and user experience compared to traditional passwords.

5. Certificate-based Authentication in Azure AD:
•	Enables users to authenticate using digital certificates instead of passwords.
•	Offers strong security and is particularly useful for privileged access.
•	Requires configuring Azure AD to accept certificates as a valid authentication method.

6. Configuring Azure AD User Authentication for Azure VMs:
•	Azure AD can be integrated with Azure Virtual Machines (VMs) running Windows and Linux.
•	Enables users to authenticate to VMs using their Azure AD credentials.
•	Simplifies identity management and improves security. This can be achieved using Azure AD Join or Azure AD registered for Windows VMs, and using extensions for Linux VMs. More details on specific configuration steps would depend on the VM operating system and the desired level of integration. Consider using managed identities for Azure resources whenever possible.

7. Conditional Access:
•	Conditional Access policies are crucial for enforcing security policies based on various conditions. These policies can require MFA, block access, or grant limited access based on factors like user location, device state, application sensitivity, and sign-in risk.
This expanded explanation provides more context and covers important aspects of Microsoft Entra authentication. Remember to consult the official Microsoft documentation for the most up-to-date information and detailed configuration instructions.


Microsoft Authentication methods

Security accounts manager (SAM)
Windows stores user passwords in SAM or in active directory database in domains. Passwords are never stored in clear text and are hashed and results are stored in SAM.

NTLM Authentication
The NTLM authentication protocols are as follows: 
•	NTLM Authentication protocol
•	LM Authentication protocol
•	In these passwords are stored in SAM database using different hashing methods.

Kerberos Authentication
Microsoft has upgraded its default authentication protocol to Kerberos which provides stronger authentication for client/server applications than NTLM. It is a computer-network authentication protocol that works based on tickets to allow nodes communicating over a non-secure network to prove their identity to one another in a secure manner.


Windows Hello for Business

Windows Hello for Business is a modern authentication method that replaces traditional passwords with strong biometric or PIN-based credentials tied to a specific device. 

This approach addresses several password-related security concerns, including:
•	Password complexity and reuse: Strong passwords can be hard to remember, leading to weak password choices or reuse across multiple accounts.
•	Server breaches: Password breaches can expose sensitive information.
•	Replay attacks: Passwords can be intercepted and replayed to gain unauthorized access.
•	Phishing attacks: Users may inadvertently reveal their passwords to malicious actors.

How Windows Hello for Business works?
1.	Credential Creation: Windows Hello creates a credential based on a certificate or asymmetric key pair.
2.	Device Binding: The credential and its associated token are bound to the device.
3.	Identity Provider Validation: During registration, the identity provider (e.g., Active Directory, Azure AD) verifies the user's identity and maps their public key to their account.
4.	Key Generation: Keys are generated either in hardware (TPM) or software, depending on policy.
5.	Two-Factor Authentication: Users authenticate using a combination of: Something they know (PIN) and Something they are (biometrics)
6.	Private Key Security: The private key remains on the device, never leaving during authentication.
7.	Authentication Process: The user's biometric gesture or PIN triggers the device to use the private key to sign data sent to the identity provider.
8.	Identity Verification: The identity provider verifies the signature and authenticates the user.
9.	Key Storage: Personal and corporate accounts use a single container for keys, but they are separated by domain to protect user privacy.

By leveraging strong cryptographic methods and device-specific credentials, Windows Hello for Business significantly enhances security and user experience compared to traditional password-based authentication.

