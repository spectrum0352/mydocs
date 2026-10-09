# IAM Questions and Answers

**On a Windows network, why is it easier to break into a local account than an AD account?**
Local accounts are generally easier to break into than AD accounts due to several factors:

- Legacy Support: Local accounts have a long history of support, leading to potential vulnerabilities.
-	Password Restrictions: Local accounts may have less stringent password requirements, making them easier to crack.
-	Authentication Location: AD accounts are authenticated by a centralized server, making it harder for attackers to compromise the authentication process.
-	Physical Access: With physical access, attackers can use specialized tools to bypass security measures and access local accounts.
 
## 1. What Are MAC, DAC, and RBAC?

•	Mandatory Access Control (MAC):
This is a strict access control system where the operating system enforces who can access resources. Users cannot change permissions themselves. Access is based on predefined security policies. For example, a user with a “confidential” clearance cannot access “top secret” files, no matter what.
•	Discretionary Access Control (DAC):
Here, the owner of a resource (like a file or folder) decides who can access it. Access is controlled based on user identity or group membership. For example, the file owner can give read or write permission to specific users.
•	Role-Based Access Control (RBAC):
Access is granted or denied based on a user’s role in the organization, such as “Manager,” “HR,” or “IT Admin.” Each role has specific permissions assigned, making it easier to manage access by job function rather than by individual user.
________________________________________
2. What Is RBAC?
RBAC stands for Role-Based Access Control (not Rule-based). It is a model where users are assigned roles, and each role has a set of permissions. Access decisions are based on these roles. For example, all “Sales” team members get access to the sales database without setting permissions for each user individually.
________________________________________
3. What Is an Access Token?
An access token is a digital key or credential given after a user authenticates successfully. It lets the system or API verify that the user has permission to access specific resources or perform actions.
________________________________________
4. What Is an ACL (Access Control List)?
An Access Control List (ACL) is a list attached to a resource that specifies which users or processes can access it and what they can do (read, write, execute). Think of it as a guest list that controls who is allowed in and what they can do once inside.
________________________________________
5. What Are Best Practices for Conditional Access?
Conditional Access policies help secure access based on conditions like user location, device status, or risk level. Best practices include:
•	Set up emergency access accounts: Special accounts with limited use for admins to access the system during outages.
•	Use report-only mode: Test policies first to see their impact without enforcing them immediately.
•	Exclude trusted countries: Block or restrict sign-ins from countries your organization never expects users to log in from.
•	Require MFA: Always use Multi-Factor Authentication for extra security.
•	Respond to compromised accounts: Automatically block or limit access if an account shows signs of compromise.
•	Require managed devices: Only allow access from devices that meet security standards.
•	Require approved client applications: Allow only secure, trusted apps to access your resources.
•	Block risky access: Automatically deny access from suspicious or untrusted conditions.
________________________________________
Let me know if you want me to explain any part more or create a simple cheat sheet!



Absolutely! Here’s a clear, corrected, and easy-to-understand summary for each point you listed:
________________________________________
1. Why Is It a Problem If a User Logs in as Root for Basic Functions?
Logging in as root gives full system control to all programs you run. If any application (like a browser or document editor) has a security flaw, attackers can exploit it to take over your entire system. This means malware like trojans or keyloggers could be installed deeply into the system (even the kernel), causing serious damage. It’s safer to use a normal user account and only get root privileges temporarily (using tools like sudo) when needed.
________________________________________
2. What Is the Most Secure Authentication Methodology, and Why?
Multi-Factor Authentication (MFA) is the most secure method because it requires two or more proofs of identity, such as:
•	Something you know (password)
•	Something you have (a phone app or hardware token)
•	Something you are (fingerprint or face scan)
This makes it much harder for attackers to gain access since they would need more than just a password.
________________________________________
3. Can MFA Be Enabled or Disabled in Bulk?
Yes. The MFA portal allows administrators to enable or disable MFA for multiple users at once, saving time in large organizations.
________________________________________
4. What Is an Access Token?
An access token is like a digital key given to a user or app after authentication. It proves to the system or API that the user has permission to access certain resources or perform actions.
________________________________________
5. What Is SSPR (Self-Service Password Reset)?
SSPR allows users to reset or change their passwords on their own, without needing help from an administrator. This improves user convenience and reduces IT workload.
________________________________________
6. Do People in Your Organization Have Access to a Self-Service Portal?
Yes. Users get access to portals like the Azure AD Access Panel or Office portal, where they can manage applications and reset passwords themselves securely.
________________________________________
7. How Can Identity Theft Be Prevented?
To avoid identity theft:
•	Use strong, unique passwords
•	Don’t share personal info publicly, especially on social media
•	Shop only on trusted websites
•	Keep browsers and software updated
•	Use antivirus and anti-malware tools
•	Protect sensitive info like Social Security Numbers (SSNs) carefully
________________________________________
8. What to Do If You Fall Victim to Identity Theft?
•	Contact the fraud departments of the three main credit bureaus to put a fraud alert on your file
•	File a report with your local police or the police where the theft happened
________________________________________
9. How to Defend Against Multiple Login Attempts?
Create an account lockout policy that temporarily locks accounts after a certain number of failed login attempts. Other ways include blocking suspicious IP addresses and using tools like Fail2Ban.
________________________________________
10. What Is Authenticode?
Authenticode is a technology that digitally signs software to prove who published it. This helps users verify the software is legitimate and hasn’t been tampered with or infected by malware.
________________________________________
11. How to Conduct a Password Audit?
Use password auditing tools that simulate hacker techniques like dictionary and brute-force attacks to check for weak or compromised passwords in your network. This helps you identify and fix vulnerabilities before attackers exploit them.
________________________________________
12. What Are Two Common Techniques to Protect a Password File?
•	Hashing: Converting passwords into irreversible strings so actual passwords aren’t stored.
•	Salting: Adding random data to each password before hashing to make attacks harder.
•	Also, controlling access permissions to the password file is important.
________________________________________
13. What Are Common Network Authentication Methods?
•	Biometrics: Using physical traits (fingerprint, face) to verify identity.
•	Tokens: Physical or digital devices that provide a unique code for access.
•	Transaction Authentication: One-time PINs or passwords for financial transactions.
•	Multi-Factor Authentication (MFA): Combining multiple verification methods.
•	Out-of-Band Authentication: Verifying identity through two separate communication channels (e.g., SMS and email) to prevent hacking.
________________________________________
14. What Is the Use of ‘Salt’ in Passwords? Any Limitations?
A salt is random data added before hashing a password to make each hash unique, preventing attackers from using precomputed tables (rainbow tables).
Limitations:
•	Salt doesn’t protect against very weak passwords by itself; strong passwords are still needed.
•	Salts need to be unique per password and stored safely alongside hashes.
________________________________________
15. How to Enable/Disable MFA in Bulk?
Use the MFA management portal provided by your identity provider (like Azure AD) to apply changes for multiple users at once.
________________________________________
16. What Are the 3 Methods to Verify Someone’s Identity?
•	Something you know (password, PIN)
•	Something you have (phone, token device)
•	Something you are (biometric traits like fingerprint or face)
________________________________________
17. How to Handle Account Brute Forcing?
•	Implement account lockouts after repeated failed login attempts
•	Use IP restrictions to block suspicious sources
•	Deploy tools like Fail2Ban to detect and block brute-force patterns
•	Use commercial solutions with advanced protections for large networks


1. How Kerberos Works
Kerberos is a secure authentication system used mainly in Windows networks (like Active Directory). It works by using “tickets” to prove your identity without sending your password over the network. When you log in, you get a Ticket Granting Ticket (TGT) from the Key Distribution Center (KDC). This ticket lets you request service tickets for other resources without repeatedly entering your password. The tickets are encrypted and time-limited to keep things secure.
________________________________________
2. How to Make User Authentication More Secure
Users prove their identity with an ID (username) and a secret key (password or token). To make authentication more secure:
•	Use strong, complex passwords or multi-factor authentication (MFA) which combines something you know (password) with something you have (like a phone app) or something you are (fingerprint).
•	Use encrypted connections (like TLS) so credentials aren’t sent in plain text.
•	Use key-based authentication instead of passwords when possible.
________________________________________
3. How to Conduct a Password Audit
A password audit checks how strong and secure user passwords are. To do this:
•	Use tools that test password strength or try to crack passwords using dictionaries or brute force (only on your own systems!).
•	Look for weak or default passwords, reused passwords, or passwords that don’t meet complexity rules.
•	Enforce policies requiring complex, long passwords and regular changes.
________________________________________
4. How to Log In to Active Directory from Linux or Mac
Active Directory (AD) uses SMB protocol for file and printer sharing. Linux or Mac users can access AD resources using Samba, a free software that supports SMB. Samba lets you join a Linux/Mac machine to an AD domain, access shared files, and use AD accounts for authentication.
________________________________________
5. When Should AD Authentication Be Used?
Use AD authentication when you want centralized control of user accounts, access rights, and policies across a Windows network or mixed environment. It’s ideal for managing users and resources securely in organizations.
________________________________________
6. Is It Right to Send Login Credentials Through Email?
No, sending usernames and passwords by email is unsafe. Emails can be intercepted or read by attackers. Instead, use secure password reset systems, encrypted messaging, or trusted password managers.
________________________________________
7. Why Is It Easier to Break Into a Local Windows Account Than an AD Account?
Local accounts have older, less secure storage and password policies. AD accounts have stronger security because authentication happens on a domain controller, not the local machine. AD accounts benefit from centralized security policies, auditing, and network protections.
________________________________________
8. If Password Authentication Is Disabled, How to Log In to Servers?
Use key-based authentication (SSH keys). This uses a pair of cryptographic keys: a public key stored on the server, and a private key kept safely on the client. When you log in, the server verifies the client’s private key without sending a password.
________________________________________
9. What Are Salted Hashes?
A salt is random data added to a password before hashing it. This means even if two users have the same password, their stored hashes will look different because of the salt. Salted hashes protect against attacks like dictionary or rainbow table attacks by making precomputed hash tables ineffective.
________________________________________
10. How to Defend Against Multiple Login Attempts?
Set an account lockout policy that temporarily blocks user accounts after a set number of failed login attempts. This helps prevent brute-force attacks.
________________________________________
11. What Is a Session Key?
A session key is a temporary encryption key used to secure communication during a user’s session. It’s generated during authentication and used to encrypt data exchanged between the user and the service.
________________________________________
12. What Is SSH?
SSH (Secure Shell) is a protocol and tool to securely access and manage computers over a network. It encrypts the connection, protecting data like passwords and commands from eavesdropping.
________________________________________
13. Why Use SSH From a Windows PC?
SSH provides a secure way to remotely access devices like servers, routers, or switches. Windows users can use tools like PuTTY or FileZilla to connect securely to Linux or other systems via SSH, protecting against spying and man-in-the-middle attacks.
________________________________________
14. Is It a Problem if a User Logs in as Root for Basic Tasks?
Yes, it’s risky. The root user has full system control, so mistakes or malicious actions can cause serious damage. It’s better to use sudo to temporarily gain admin rights only when needed, minimizing risk.
________________________________________
15. Can a Child Domain Be Created Under Managed Domain Services?
No. Managed domain services like Azure AD Domain Services only support a single domain and forest. You cannot create child domains under them.
________________________________________
16. Can On-Premises Applications Be Added to Azure AD?
Yes. Using Azure AD Application Proxy, you can securely publish on-premises web applications to be accessed via Azure AD without changing network setup or needing VPN.
________________________________________
17. Can Tenant ID and Client ID Be Hidden in Azure AD Requests?
No. Tenant ID and Client ID are not secrets and appear in URLs and headers. They are visible through browser developer tools. Only client secrets or keys should be kept confidential.
________________________________________
If you want, I can also help you expand or simplify any of these further! Would you like me to?






Password based authentication is disabled in your infrastructure. So how do you login to the servers? 
Use key-based authentication, it uses Public-Private key pairs. Public key is added in the server configuration file. Private key is kept confidential on the client side. Below listed is the procedure, to set up key-based authentication. 

What are salted hashes? 
Here is the summary of salted hashes:
•	Adding Randomness: Salted hashes are a way to improve password security by adding a random string (salt) to the password before it is hashed.
•	Enhanced Security: This extra randomness makes it much harder for attackers to crack passwords using pre-computed rainbow tables or dictionary attacks.
•	Unique Hashes: Even if two users have the same password, the addition of a unique salt will result in different hashed values stored in the database.
Imagine passwords as ingredients and the hash as a unique cake. Salt acts like a secret spice added before baking. Even if someone knows the base recipe (password), the added salt (randomness) makes it difficult to guess the final cake (hashed value).


What can you use to defend against multiple login attempts? 
You can create a lockout policy that locks accounts when a user has too many login attempts. 

Why would you want to use SSH from a Windows PC? 
•	Secure Connection: SSH encrypts communication between your Windows PC and the remote device, protecting your data from eavesdropping. This is especially important when working on public or shared networks.
•	Wide Device Compatibility: SSH works on various systems, including routers, switches, and Linux servers. Using a Windows SSH client like PuTTY allows you to connect to these devices for administration or file transfer.
•	Convenience for Windows Users: While not built-in by default, Windows users can install SSH clients like PuTTY or FileZilla. These programs provide a familiar way to connect and manage remote devices, like how Linux users do it natively.

You see a user logging in as root to perform basic functions. Is this a problem?
•	Root has too much power: The root user account has full control over the system and can make major changes. This is risky because mistakes or even malicious actions can have serious consequences.
•	Sudo provides a safe alternative: Sudo allows you to run specific commands with root privileges without logging in as root. It is like giving temporary high-level access for a specific task.
•	Less time with high permissions: The less time you spend logged in as root, the lower the risk of accidentally messing something up. Sudo helps you minimize that risky time.

Is it right to send login credentials through email? 
No, it is not right to send login credentials through email. Email is an insecure channel and your credentials could be intercepted by hackers. Here is why it is risky:
•	Unencrypted: Emails are typically sent in plain text, meaning anyone who intercepts them can easily read your login credentials.
•	Man-in-the-Middle Attacks: Hackers can set up phishing scams or exploit vulnerabilities to intercept emails containing your credentials.
•	Data Breaches: Email providers are not immune to data breaches. If a breach occurs, your credentials stored on the email server could be compromised.
Here are some secure alternatives to sending login credentials via email:
•	Password Reset Links: Most websites allow you to request a password reset link through email. Clicking this link takes you to a secure page where you can create a new password.
•	Secure Messaging Apps: Some services offer secure messaging options for sending sensitive information. However, ensure the app itself has strong security practices.
•	Password Managers: Consider using a password manager that allows you to securely store and share credentials.
Remember, protecting your login credentials is crucial for maintaining online security. Avoid sending them through email and opt for more secure methods.

You see a user logging in as root to perform basic functions. Is this a problem?
Yes, it is a problem. Logging in as the root user poses security risks. The root account has unrestricted privileges, which means any action taken by the root user can have significant consequences. It is best to avoid using the root account for routine tasks and instead use a regular user account with limited permissions. 
•	Explain Oauth?  The primary role of the OAuth protocol is verifying the user's identity but not at the cost of disclosing their passwords. OAuth authorization is covered but does not include authentication. The tokens obtained by users, generally called bearer tokens, can be used to verify identities. The use of bearer tokens implies verifying a user's identity by third-party services rendering them with secure and privileged resources. 
•	Explain passwordless authentication? Passwordless authentication is not a process under which remembering the password is not a criterion because authentication is done by using FIDO keys, the MS authenticator app, or Windows Hello for business. 

Explain Oauth?  The primary role of the OAuth protocol is verifying the user's identity but not at the cost of disclosing their passwords. OAuth authorization is covered but does not include authentication. The tokens obtained by users, generally called bearer tokens, can be used to verify identities. The use of bearer tokens implies verifying a user's identity by third-party services rendering them with secure and privileged resources. 

How can identity theft be prevented? 
Here is what you can do to prevent identity theft: Ensure strong and unique password, avoid sharing confidential information online, especially on social media, Shop from known and trusted websites, Use the latest version of the browsers, install advanced malware and spyware tools, Use specialized security solutions against financial data, always update your system and the software, Protect your SSN (Social Security Number).

You need to reset a password-protected BIOS configuration. What do you do? 
Key points to remember:
•	CMOS battery removal: This is often the quickest and easiest method.
•	Jumper shorting: Requires access to the motherboard and knowledge of the jumper location.
•	Password removal tools: These tools can sometimes bypass BIOS passwords, but their effectiveness varies.
•	Default password: Trying "password" is worth a shot, but don't rely on it exclusively.
Additional considerations:
•	UEFI: While UEFI has replaced BIOS, the concept of password protection and reset methods remains similar.
•	Data loss: Be aware that resetting the BIOS might clear other settings, such as boot order and overclocking configurations.
•	Motherboard documentation: Always consult the motherboard's manual for specific instructions.
It is important to note that attempting to bypass a BIOS password without authorization might violate legal and ethical guidelines.


Why it is easy to break in to windows local accounts than active directory accounts?
Breaking into Windows local accounts versus Active Directory (AD) accounts involves different challenges and risks. Let us explore why local accounts are often considered easier targets:
1.	Scope and Attack Surface:
o	Local Accounts: Local accounts exist on individual machines. Attacker needs physical or remote access to the specific device to target them.
o	AD Accounts: AD accounts are part of a centralized directory service. They have a broader attack surface, accessible from multiple machines.
2.	Password Complexity:
o	Local Accounts: Users often set weaker passwords for local accounts. These passwords may lack complexity or be reused across systems.
o	AD Accounts: AD enforces password policies (complexity, length, history). AD users typically have stronger passwords.
3.	Privilege Levels:
o	Local Accounts: Local accounts often have elevated privileges (e.g., local admin). Compromising them grants significant access.
o	AD Accounts: AD follows the principle of least privilege. Users have specific roles and permissions, reducing the impact of compromise.
4.	Visibility and Monitoring:
o	Local Accounts: Monitoring local account activity is challenging. Logs are scattered across individual machines.
o	AD Accounts: AD provides centralized logging and auditing. Suspicious activity is easier to detect.
5.	Credential Reuse:
o	Local Accounts: Users may reuse local account credentials across different systems.
o	AD Accounts: AD discourages this practice, improving security.
6.	Single Point of Failure:
o	Local Accounts: Compromising one local account affects only that machine.
o	AD Accounts: AD is critical infrastructure. Breaching it impacts the entire domain.
In summary, while local accounts are easier to target due to their limited scope, AD accounts are better protected and offer centralized management. Organizations must secure both effectively.


Absolutely! Here's an easy-to-understand, corrected, and detailed summary of your questions:
________________________________________
1. How Does Kerberos Work?
Kerberos is a secure authentication system used to prove your identity on a network without sending passwords over the network. Here’s how it works:
•	When you log in, you request a Ticket Granting Ticket (TGT) from the Kerberos server by proving who you are (usually by entering your password).
•	Once you get the TGT, you can request access to different services by exchanging the TGT for a service ticket.
•	This ticket is then presented to the service to prove your identity without sending your password again. This helps protect your password and prevents eavesdropping or replay attacks.
________________________________________
2. How to Defend Against Multiple Login Attempts?
To protect against attackers trying many passwords (brute force), set up an account lockout policy that temporarily locks a user account after several failed login attempts. You can also use IP blocking or rate-limiting tools like Fail2Ban to block repeated failed logins from the same source.
________________________________________
3. How to Disable “Restart” & “Shut Down” Buttons on the GUI Login Screen?
You can restrict these options via system policies or group policies depending on your OS. For Windows, use Group Policy Editor to disable these buttons on the login screen. For Linux, modify the display manager’s configuration to hide or disable these buttons.
________________________________________
4. How to Enable/Disable MFA in Bulk?
Use the MFA management portal provided by your identity provider (like Azure AD). It allows administrators to enable or disable Multi-Factor Authentication for multiple users at once, saving time and ensuring consistent security.
________________________________________
5. How to Login to Servers If Password-Based Authentication Is Disabled?
Use key-based authentication instead of passwords. This uses a pair of cryptographic keys: a public key stored on the server and a private key kept secret on the client. Only clients with the matching private key can log in, making it more secure.
________________________________________
6. How to Make User Authentication More Secure?
•	Use strong, unique passwords.
•	Implement Multi-Factor Authentication (MFA).
•	Use encrypted connections (like HTTPS or SSH).
•	Avoid sending credentials over insecure channels.
•	Monitor and audit login attempts regularly.
________________________________________
7. How to Prevent Brute Force Attacks?
•	Use account lockout policies after a certain number of failed attempts.
•	Implement MFA for extra verification.
•	Use CAPTCHAs or other challenge-response tests on login forms.
•	Limit login attempts by IP address or use fail2ban-like tools.
•	Encourage strong password policies.
________________________________________
8. How to Prevent the Compromise of Identities from On-Premises Active Directory?
•	Enforce strong password policies and regular password changes.
•	Implement MFA for critical accounts.
•	Monitor logs for suspicious activity.
•	Restrict privileged access and use the principle of least privilege.
•	Keep systems updated and patched.
•	Use tools like Microsoft ATA or Azure ATP for threat detection.
________________________________________
9. How to Temporarily Disable All User Logins Except Root?
•	Modify SSH configuration to allow only root login temporarily.
•	Disable user accounts via account management commands (like usermod -L).
•	Use firewall or PAM (Pluggable Authentication Modules) rules to restrict logins.
•	For GUI, change login manager settings or disable user sessions.
________________________________________
10. How Would You Lock Down a Mobile Device?
•	Set a strong password or biometric lock.
•	Enable device encryption.
•	Keep the OS and apps updated.
•	Install trusted security apps and anti-malware.
•	Limit app permissions.
•	Enable remote wipe and tracking features.
•	Avoid connecting to untrusted Wi-Fi networks.
________________________________________
11. How to Login to Active Directory From Linux or Mac?
Active Directory uses the SMB protocol, which can be accessed from Linux or Mac using Samba. Samba allows these systems to:
•	Access shared files and printers on the network.
•	Authenticate against Active Directory.
•	Join Active Directory domains depending on Samba version and configuration.
________________________________________
12. What Are the 3 Methods for Verifying Someone’s Identity?
1.	Something You Know: Passwords, PINs, or answers to secret questions.
2.	Something You Have: Security tokens, smart cards, or mobile devices.
3.	Something You Are: Biometrics like fingerprints, facial recognition, or iris scans.
________________________________________
If you want me to explain any part with examples or commands, just ask!


Sure! Here’s a clear, easy-to-understand, corrected, and detailed summary of your questions:
________________________________________
1. What Are the 3 Ways to Authenticate a Person?
•	Something you know: Like a password or PIN.
•	Something you have: Like a security token, smart card, or phone.
•	Something you are: Biometrics such as fingerprints, face recognition, or iris scans.
________________________________________
2. What Are Different Cyber Attacks on Identity and Access Management (IAM)?
•	Phishing: Trick users into revealing credentials.
•	Password attacks: Brute force, dictionary attacks, credential stuffing.
•	Man-in-the-middle: Intercepting authentication data.
•	Token theft: Stealing access tokens or session cookies.
•	Privilege escalation: Gaining higher access than authorized.
________________________________________
3. What Are Different Types of Identity Theft?
•	Financial identity theft: Using someone’s identity to steal money or credit.
•	Medical identity theft: Using someone’s information for medical services.
•	Criminal identity theft: Using someone else’s identity to commit crimes.
•	Synthetic identity theft: Creating fake identities using real and fake info.
________________________________________
4. What Are the Three Methods for Verifying Someone’s Identity?
(Same as #1)
•	Something you know
•	Something you have
•	Something you are
________________________________________
5. What Are the Various Ways to Handle Account Brute Forcing?
•	Lock accounts temporarily after multiple failed login attempts.
•	Use IP blocking or rate limiting tools (like Fail2Ban).
•	Implement Multi-Factor Authentication (MFA).
•	Use CAPTCHAs to prevent automated login attempts.
________________________________________
6. What Can You Use to Defend Against Multiple Login Attempts?
•	Account lockout policies.
•	MFA enforcement.
•	IP blacklisting or throttling.
•	Monitoring and alerting on suspicious login activity.
________________________________________
7. What Does User Enumeration Mean?
User enumeration is when an attacker tries to find out valid usernames on a system by analyzing responses from login or registration forms, often based on error messages that differ for existing vs. non-existing users.
________________________________________
8. What Is an Access Token?
An access token is a digital key or credential that proves a user or application has permission to access a resource or service, like an API.
________________________________________
9. What Is an ACL (Access Control List)?
An ACL is a list that defines which users or system processes are allowed to access certain resources and what kind of access (read, write, execute) they have.
________________________________________
10. What Is Authentication?
Authentication is the process of verifying who someone is, usually by checking credentials like passwords, tokens, or biometrics.
________________________________________
11. What Are Conditional Access Best Practices?
•	Use emergency access accounts for recovery.
•	Test policies in report-only mode before enforcing.
•	Block or restrict login from countries you never expect users to sign in from.
•	Require MFA for risky sign-ins or sensitive accounts.
•	Enforce device compliance and approved client apps.
________________________________________
12. What Is IAM (Identity and Access Management)?
IAM is the system and policies used to manage users’ identities and control their access to resources in a secure way.
________________________________________
13. What Are MAC, DAC, and RBAC?
•	MAC (Mandatory Access Control): The system controls access based on strict policies, not user choice.
•	DAC (Discretionary Access Control): The owner of the resource decides who can access it.
•	RBAC (Role-Based Access Control): Access is granted based on the user’s role in the organization.
________________________________________
14. What Is MFA (Multi-Factor Authentication)?
MFA requires users to provide two or more different types of authentication factors (e.g., password + a code from a phone) to access an account, making it much harder for attackers to gain access.
________________________________________
15. What Is RBAC (Role-Based Access Control)?
RBAC is a method to restrict system access by assigning permissions to roles, and then assigning users to those roles. This makes managing permissions easier and more secure.
________________________________________
16. What Is the Most Secure Authentication Methodology, and Why?
Multi-Factor Authentication (MFA) is the most secure because it requires multiple types of evidence (factors), so even if one factor (like a password) is compromised, attackers still cannot access the account without the others.
________________________________________
17. What Is the Problem If a User Logs in as Root to Perform Basic Functions?
Logging in as root gives full control of the system, so if malware or an attacker exploits a vulnerability, they get complete access. It increases the risk of accidental or malicious damage. Instead, users should use sudo to perform tasks needing elevated privileges only when necessary.
________________________________________
18. What Is the Use of ‘Salt’ in Reference to Passwords? Are There Limitations?
A salt is random data added to a password before hashing to make each hash unique, even if two users have the same password. This protects against precomputed attacks like rainbow tables. Limitations: If the salt is not unique or is exposed, it reduces security benefits. Also, salt alone doesn’t protect against all attack types—strong hashing algorithms and other protections are needed.
________________________________________
19. What Is Two-Factor Authentication (2FA), and How Can It Be Implemented for Public Websites?
2FA requires users to provide two types of identification before logging in, commonly a password plus a code sent to their phone or generated by an app. Public websites implement 2FA by integrating SMS verification, authenticator apps (like Google Authenticator), hardware tokens, or biometric verification during login.
________________________________________
If you want, I can expand on any of these or provide examples!

Sure! Here's a simplified, corrected, and clearer version of your points about Azure AD:
________________________________________
Azure AD and Related Concepts — Simple Summary
1. What is the relation between Azure AD and subscriptions?
Azure AD is a cloud identity and access management service that helps control access to Azure resources. One Azure AD tenant can be linked to many Azure subscriptions, but each subscription trusts only one Azure AD tenant.
2. Can you create a child domain under Azure AD Domain Services?
No. Azure AD Domain Services supports only a single domain and forest. Child domains cannot be created.
3. Can on-premises applications be added to Azure AD?
Yes. Azure AD Application Proxy allows secure and easy access to on-premises web apps without needing VPN or network changes. Users access these apps just like any cloud app.
4. Can tenant ID and client ID be hidden in requests?
No. Tenant ID and client ID are not secrets and are visible in URLs and developer tools. They should never be used as secrets or hidden because OAuth defines them as public identifiers.
5. What is Azure AD?
Azure AD is a cloud-based identity and access management service. It allows users to access Microsoft services, SaaS apps, and internal apps using single sign-on (SSO). It also helps improve business productivity.
6. What are dynamic groups in Azure AD?
Dynamic groups automatically add or remove users based on their attributes matching certain rules. Membership changes happen automatically as user attributes change.
7. Difference between Windows AD and Azure AD?
•	Windows AD is an on-premises directory service managing users and devices in a network.
•	Azure AD is cloud-based, focusing on identity and access management for cloud applications.
8. How is Azure AD architected?
Azure AD uses multiple replicas:
•	Primary replica: Handles all writes and updates.
•	Secondary replicas: Distributed globally, handle read requests like authentications, ensuring high availability and geo-redundancy.
9. How to connect on-premises directory to Azure AD?
Use Azure AD Connect, a tool that syncs your on-premises Active Directory with Azure AD.
10. How does Azure AD compare to AWS?
Azure AD integrates tightly with Microsoft technologies (Windows, SQL Server). Cloud architects should understand both Azure and AWS deployment models for best use.
11. How to find your Azure tenant ID?
Go to Azure Portal → Azure Active Directory → Properties → Copy the Directory ID (this is your tenant ID).
12. Is LDAP available with Azure AD?
No direct LDAP access in Azure AD. However, Azure AD Domain Services provides LDAP support through managed domain services.
13. Types of cloud computing in Azure AD?
Azure AD supports IaaS, PaaS, and SaaS cloud service models.
14. How to enable Single Sign-On (SSO) for enterprise apps in Azure AD?
•	Have the right admin role (e.g., Global Administrator).
•	Go to Azure AD Admin Center → Enterprise Applications → Select app → Single sign-on → Choose SAML → Configure URLs and certificate → Save.
15. What are Azure AD Domain Services?
Managed domain services like LDAP, Kerberos, NTLM, domain join, and group policy — all without needing to manage domain controllers.
16. Benefits of Azure AD?
•	Works on multiple platforms and devices
•	Global availability via many data centers
•	Single sign-on for many apps
•	Pre-integrated with popular cloud apps
•	Detailed security and activity reports
17. What are Azure AD licenses?
•	Azure AD Free
•	Azure AD Premium P1
•	Azure AD Premium P2
•	Pay-as-you-go options
18. Functions of Azure AD Domain Services?
•	Organizes objects using domains, forests, and OUs
•	Supports authentication (NTLM, Kerberos, LDAP)
•	Enables group policies and secure object storage
19. Cost of Azure AD Connect?
Azure AD Connect is free with an Azure subscription.
20. Features unavailable in Azure AD B2C?
Currently missing API connectors and Conditional Access policies.
21. What if an app is missing from Azure AD Marketplace?
Users with Azure AD Premium can add custom apps and configure SSO and provisioning.
22. What is Azure AD B2C?
Business-to-Consumer service that manages customer identity and access, improving security and user relationships.
23. What is Conditional Access?
Policies that control how and when users can access resources, based on conditions like location, device, or risk level.
24. What is identity in Azure AD?
An identity represents a user or entity that can be authenticated via credentials like passwords, keys, or certificates.
25. How are Windows updates applied in Azure AD Domain Services?
Windows updates are applied automatically by Microsoft-managed domain controllers, but users must allow outbound traffic for update servers.
26. What is User Principal Name (UPN)?
A unique username (like email) in Azure AD used for signing in to Microsoft services and apps.
27. What is two-factor authentication (2FA) and how is it used?
2FA requires users to verify identity with two methods (e.g., password + phone code). It can be enabled on public websites (e.g., Twitter, LinkedIn) via security settings.
28. Who uses Azure AD?
•	App developers adding SSO
•	Microsoft cloud service subscribers (Azure, Office 365, Dynamics)
•	IT admins managing app and resource access
29. Why choose Azure over AWS?
Azure offers better integration with Microsoft products, supports .NET programming well, and syncs across multiple OS platforms, plus strong security foundations.


Access
What is MAC, DAC and RBAC? Mandatory access control, discretionary access control and role-based access control. MAC uses the operating system to prevent a user from accessing a particular target. DAC restricts access to an object based on a user’s identity or group. RBAC denies or grants access based on a user’s role. 
What is RBAC? RBAC stands for Rule-based Access Control. A type of access control model which grants or denies access to resources based on ACL entries. Get live, expert ins 
What is an access token? An access token is a credential which is used by the system to check whether the API should be granted to a particular object or not.  
What is an ACL? An access control list. It is a list used to grant users and processes access to system resources. 
What is the conditional access best practices? Set up emergency access accounts. Set up report only mode. Exclude countries from which you never expect sign in. Common policies, validate if you want to create following policies: Require MFA, respond to potentially compromised accounts, require managed devices, Require approved client applications, Block access

Authentication

What is the most secure authentication methodology, why? 
How to defend against multiple login attempts? Create account lockout policy that locks accounts when user has too many failed login attempts. 
What do you mean by Authenticode?  Authenticode is a technology that identifies the publisher of Authenticode sign software. It allows users to ensure that the software is genuine and not contain any malicious program.  
How would you conduct a password audit? A password audit is simply using similar software as hackers to test your network against dictionary attacks, brute force attacks, and more. Special software is used to audit passwords. They attempt to break into your network similarly to nefarious actors to show you all your password vulnerabilities, from weak passwords to pawned passwords, so that your network can realize maximum security. 
Name the two common techniques used to protect a password file? Answer: Two common techniques to protect a password file is- hashed passwords and a salt value or password file access control. 
What are the common methods of authentication for network security? Biometrics - It is a known and registered physical attribute of a user specifically used for verifying their identity.  Token - A token is used for accessing systems. It makes more difficult for hackers to access accounts as they have long credentials. Transaction Authentication - A onetime pin or password is used in processing online transactions through which they verify their identity. Multi-Factor Authentication - It’s a security system that needs more than one method of authentication. Out-of-Band Authentication - This authentication needs two different signals from two different channels or networks. It prevents most of the attacks from hacking and identity thefts in online banking. 
What is the use of ‘salt’ in reference to passwords? Are there any limitations of using it?
How to enable/disable MFA in bulk? MFA portal helps us enable/disable MFA in bulk for user- level. 
What are the 3 methods for verifying someone's identity? 
What are the various ways to handle account brute forcing? Look for discussion of account lockouts, IP restrictions, fail ban, commercial versions thereof, etc.
What can you use to defend against multiple login attempts? à You can create a lockout policy that locks accounts when a user has too many login attempts. 


Identity
What can you do if you fall victim to identity theft? Contact the fraud department of each three credit bureaus and request a fraud alert be put on your file. File a report with your local police or the police in the community where the theft took place



IAM Attacks
How to prevent Brute Force attacks? Adding password complexity: Include different formats of characters to make passwords stronger. Limit login attempts: set a limit on login failures. Two-factor authentication: Add this layer of security to avoid brute force attacks. 
How to prevent Rainbow attack? 
What are the different Cyber Attacks on Identity and Access management? Password based attacks: Brute Force Attack, Password Spray Attack
What are the different identity thefts? Credit Card, Loan or Lease, Phone or Utilities, Bank Fraud, Employment or Tax related Fraud, Government documents or benefits fraud
What are the password attacks and which tools are used? A hacker can gain access to the password information of an individual by ‘sniffing’ the connection to the network, using social engineering, guessing, or gaining access to a password database. An attacker can ‘guess’ a password in a random or systematic way. Passwords attacks include: 
What are the ways to defend against password attacks? 



Old

What is the problem if user login as root to perform basic functions? It is not recommended to use root account to perform basic functions because it can lead to security issues. When you log in as root, all applications are running with root privileges. Every vulnerability in Firefox, Flash, OpenOffice etc. now can destroy your system because possible viruses now have access everywhere. If you run a program as root and a security flaw is exploited, the attacker has access to all data and can directly control the hardware. For example, it might install a trojan or key-logger into your kernel.
What is the most secure authentication methodology, why? 
Can MFA be enabled or disabled in bulk?  Ans: The MFA portal helps us enable or disable MFA in bulk for the user- level. 
What is an access token? An access token is a credential which is used by the system to check whether the API should be granted to a particular object or not.  
Define SSPR?  Self-service password reset of the Active Directory provides the users' allowance to reset or change their password without the assistance of an administrator. 
Do people in your organization have access to a self-service portal?  Yes, the users are given the Azure AD Access Panel by the Azure AD for application access and self-service. Similarly, in the Office portal, a Microsoft user can avail of the same capabilities. 
How can identity theft be prevented? Here is what you can do to prevent identity theft: Ensure strong and unique password, avoid sharing confidential information online, especially on social media, Shop from known and trusted websites, Use the latest version of the browsers, Install advanced malware and spyware tools, Use specialized security solutions against financial data, always update your system and the software, Protect your SSN (Social Security Number).
How Kerberos works? 
How to make the user authentication process more secure?  In order to authenticate users, they must provide their identity. The ID and Key can be used to confirm the user's identity. This is an ideal way how the system should authorize the user. 
How would you conduct a password audit?
How would you login to Active Directory from a Linux or Mac box?  While it may sound odd, it is possible to access Active Directory from a non-Windows system. Active Directory uses an SMB protocol, which can be accessed from a Linux or Mac system by using the Samba program. Depending on the version, this can allow for share access, printing and even Active Directory membership.
In what scenario, AD authentication should be used?
Is it right to send login credentials through email?  It is not right to send login credentials through email because if you send someone userid and password in the mail, chances of email attacks are high.  
On a Windows network, why is it easier to break into a local account than an AD account?  Windows local accounts have a great deal of baggage tied to them, running back a long way to keep compatibility for user accounts. If you are a user of passwords longer than  characters, you may have seen the message referring to this fact. However, Active Directory accounts have a great deal of security tied onto them, not the least of which is that the system doing the authenticating is not the one you are usually sitting at when you are a regular user. Breaking into a Windows system if you have physical access is not that difficult at all, as there are quite a few dedicated utilities for just such a purpose. However, that is beyond the scope of what we will be getting into here. 
Password based authentication is disabled in your infrastructure. So how do you login to the servers?  Use key-based authentication, it uses Public-Private key pairs. Public key is added in the server configuration file. Private key is kept confidential on the client side. Below listed is the procedure, to set up key-based authentication. 
What are salted hashes? Salt is a random data. When a properly protected password system receives a new password, it creates a hash value of that password, a random salt value, and then the combined value is stored in its database. This helps to defend against dictionary attacks and known hash attacks. Example: If someone uses the same password on two different systems and they are being used using the same hashing algorithm, the hash value would be same, however, if even one of the systems uses salt with the hashes, the value will be different.  
What can you use to defend against multiple login attempts?  You can create a lockout policy that locks accounts when a user has too many login attempts. 
What is a session key?
What is SSH?  SSH stands for Secure Socket Shell or Secure Shell. It is a utility suite that provides system administrators secure way to access the data on a network.  
Why would you want to use SSH from a Windows PC?  SSH (TCP port 22) is a secure connection used on many different systems and dedicated appliances. Routers, switches, SFTP servers and unsecure programs being tunnelled through this port all can be used to help harden a connection against eavesdropping. Even though most times when you hear about somebody SSH into a box it involves Linux, the SSH protocol itself is implemented on a wide variety of systems — though not by default on most Windows systems. Programs like PuTTY, Filezilla and others have Windows ports available, which allow Windows users the same ease-of-use connectivity to these devices as do Linux users. 
You see a user logging in as root to perform basic functions. Is this a problem? A Linux admin account (root) has many powers that are not permitted for standard users. It is not always necessary to log all the way off and log back in as root in order to do these tasks. For example, if you have ever used the “run as admin” command in Windows, then you will know the basic concept behind “sudo” or “superuser (root) do” for whatever it is you want it to do. It is a very simple and elegant method for reducing the amount of time you need to be logged in as a privileged user. The more time a user spends with enhanced permissions, the more likely it is that something is going to go wrong — whether accidentally or intentionally. 
Can a child domain be created under managed domain services? Ans: The creation of child domains is not allowed under managed domain services. Azure AD Domain services only allow single forest design and single domain provision. 
Can the on-premises applications be added?  Ans: The required on-premises web applications chosen are given secure and easy access by the Azure AD application proxy. This process does not involve changing network infrastructure or a VPN requirement. Instead, the user can access it the same way you access the SaaS apps in Azure AD. 
Can the tenant id and client id be hide able in the body or headers in Azure AD? You must not use a client identifier for client authentication as it is visible to the resource owner and not a secret. The client id and the tenant id are both visible in the URL. Passing them to the body or headers does not mean they are hidden. Their visibility is still accessible via the developer tools. According to the OAuth RFC, tenant and client id are not secrets. 



QnA

Password based authentication is disabled in your infrastructure. So how do you login to the servers? 
Use key-based authentication, it uses Public-Private key pairs. Public key is added in the server configuration file. Private key is kept confidential on the client side. Below listed is the procedure, to set up key-based authentication. 

What are salted hashes? 
Here is the summary of salted hashes:
•	Adding Randomness: Salted hashes are a way to improve password security by adding a random string (salt) to the password before it is hashed.
•	Enhanced Security: This extra randomness makes it much harder for attackers to crack passwords using pre-computed rainbow tables or dictionary attacks.
•	Unique Hashes: Even if two users have the same password, the addition of a unique salt will result in different hashed values stored in the database.
Imagine passwords as ingredients and the hash as a unique cake. Salt acts like a secret spice added before baking. Even if someone knows the base recipe (password), the added salt (randomness) makes it difficult to guess the final cake (hashed value).


What can you use to defend against multiple login attempts? 
You can create a lockout policy that locks accounts when a user has too many login attempts. 

Why would you want to use SSH from a Windows PC? 
•	Secure Connection: SSH encrypts communication between your Windows PC and the remote device, protecting your data from eavesdropping. This is especially important when working on public or shared networks.
•	Wide Device Compatibility: SSH works on various systems, including routers, switches, and Linux servers. Using a Windows SSH client like PuTTY allows you to connect to these devices for administration or file transfer.
•	Convenience for Windows Users: While not built-in by default, Windows users can install SSH clients like PuTTY or FileZilla. These programs provide a familiar way to connect and manage remote devices, like how Linux users do it natively.

You see a user logging in as root to perform basic functions. Is this a problem?
•	Root has too much power: The root user account has full control over the system and can make major changes. This is risky because mistakes or even malicious actions can have serious consequences.
•	Sudo provides a safe alternative: Sudo allows you to run specific commands with root privileges without logging in as root. It is like giving temporary high-level access for a specific task.
•	Less time with high permissions: The less time you spend logged in as root, the lower the risk of accidentally messing something up. Sudo helps you minimize that risky time.

Is it right to send login credentials through email? 
No, it is not right to send login credentials through email. Email is an insecure channel and your credentials could be intercepted by hackers. Here is why it is risky:
•	Unencrypted: Emails are typically sent in plain text, meaning anyone who intercepts them can easily read your login credentials.
•	Man-in-the-Middle Attacks: Hackers can set up phishing scams or exploit vulnerabilities to intercept emails containing your credentials.
•	Data Breaches: Email providers are not immune to data breaches. If a breach occurs, your credentials stored on the email server could be compromised.
Here are some secure alternatives to sending login credentials via email:
•	Password Reset Links: Most websites allow you to request a password reset link through email. Clicking this link takes you to a secure page where you can create a new password.
•	Secure Messaging Apps: Some services offer secure messaging options for sending sensitive information. However, ensure the app itself has strong security practices.
•	Password Managers: Consider using a password manager that allows you to securely store and share credentials.
Remember, protecting your login credentials is crucial for maintaining online security. Avoid sending them through email and opt for more secure methods.

You see a user logging in as root to perform basic functions. Is this a problem?
Yes, it is a problem. Logging in as the root user poses security risks. The root account has unrestricted privileges, which means any action taken by the root user can have significant consequences. It is best to avoid using the root account for routine tasks and instead use a regular user account with limited permissions. 
•	Explain Oauth?  The primary role of the OAuth protocol is verifying the user's identity but not at the cost of disclosing their passwords. OAuth authorization is covered but does not include authentication. The tokens obtained by users, generally called bearer tokens, can be used to verify identities. The use of bearer tokens implies verifying a user's identity by third-party services rendering them with secure and privileged resources. 
•	Explain passwordless authentication? Passwordless authentication is not a process under which remembering the password is not a criterion because authentication is done by using FIDO keys, the MS authenticator app, or Windows Hello for business. 

Explain Oauth?  The primary role of the OAuth protocol is verifying the user's identity but not at the cost of disclosing their passwords. OAuth authorization is covered but does not include authentication. The tokens obtained by users, generally called bearer tokens, can be used to verify identities. The use of bearer tokens implies verifying a user's identity by third-party services rendering them with secure and privileged resources. 

How can identity theft be prevented? 
Here is what you can do to prevent identity theft: Ensure strong and unique password, avoid sharing confidential information online, especially on social media, Shop from known and trusted websites, Use the latest version of the browsers, install advanced malware and spyware tools, Use specialized security solutions against financial data, always update your system and the software, Protect your SSN (Social Security Number).

You need to reset a password-protected BIOS configuration. What do you do? 
Key points to remember:
•	CMOS battery removal: This is often the quickest and easiest method.
•	Jumper shorting: Requires access to the motherboard and knowledge of the jumper location.
•	Password removal tools: These tools can sometimes bypass BIOS passwords, but their effectiveness varies.
•	Default password: Trying "password" is worth a shot, but don't rely on it exclusively.
Additional considerations:
•	UEFI: While UEFI has replaced BIOS, the concept of password protection and reset methods remains similar.
•	Data loss: Be aware that resetting the BIOS might clear other settings, such as boot order and overclocking configurations.
•	Motherboard documentation: Always consult the motherboard's manual for specific instructions.
It is important to note that attempting to bypass a BIOS password without authorization might violate legal and ethical guidelines.


Why it is easy to break in to windows local accounts than active directory accounts?
Breaking into Windows local accounts versus Active Directory (AD) accounts involves different challenges and risks. Let us explore why local accounts are often considered easier targets:
1.	Scope and Attack Surface:
o	Local Accounts: Local accounts exist on individual machines. Attacker needs physical or remote access to the specific device to target them.
o	AD Accounts: AD accounts are part of a centralized directory service. They have a broader attack surface, accessible from multiple machines.
2.	Password Complexity:
o	Local Accounts: Users often set weaker passwords for local accounts. These passwords may lack complexity or be reused across systems.
o	AD Accounts: AD enforces password policies (complexity, length, history). AD users typically have stronger passwords.
3.	Privilege Levels:
o	Local Accounts: Local accounts often have elevated privileges (e.g., local admin). Compromising them grants significant access.
o	AD Accounts: AD follows the principle of least privilege. Users have specific roles and permissions, reducing the impact of compromise.
4.	Visibility and Monitoring:
o	Local Accounts: Monitoring local account activity is challenging. Logs are scattered across individual machines.
o	AD Accounts: AD provides centralized logging and auditing. Suspicious activity is easier to detect.
5.	Credential Reuse:
o	Local Accounts: Users may reuse local account credentials across different systems.
o	AD Accounts: AD discourages this practice, improving security.
6.	Single Point of Failure:
o	Local Accounts: Compromising one local account affects only that machine.
o	AD Accounts: AD is critical infrastructure. Breaching it impacts the entire domain.
In summary, while local accounts are easier to target due to their limited scope, AD accounts are better protected and offer centralized management. Organizations must secure both effectively.



How is Kerberos works? (Understanding a Kerberos authentication system)
How to defend against multiple login attempts?
How to disable “Restart” & “Shut Down” buttons on the GUI Login screen?
How to enable/disable MFA in bulk?
How to login to servers if password-based authentication is disabled?
How to make the user authentication process more secure?
How to prevent Brute Force attacks?
How to prevent the compromise of Identities from on-premises Active Directory?
How to temporarily disable all user log-in except root user (either via SSH or terminal or in GUI)?
How would you lock down a mobile device?
How would you login to Active Directory from a Linux or Mac box? à While it may sound odd, it is possible to access Active Directory from a non-Windows system. Active Directory uses an SMB protocol, which can be accessed from a Linux or Mac system by using the Samba program. Depending on the version, this can allow for share access, printing and even Active Directory membership.   
How would you login to Active Directory from a Linux or Mac box? à While it may sound odd, it is possible to access Active Directory from a non-Windows system. Active Directory uses an SMB protocol, which can be accessed from a Linux or Mac system by using the Samba program. Depending on the version, this can allow for share access, printing and even Active Directory membership.   
What are the 3 methods for verifying someone's identity?
What are the 3 ways to authenticate a person?
What are the different Cyber Attacks on Identity and Access management?
What are the different identity thefts?
What are the three methods for verifying someone's identity?
What are the three ways to authenticate a person?
What are the various ways to handle account brute forcing?
What can you use to defend against multiple login attempts?
What does user enumeration mean?
What is an access token?
What is an ACL?
What is authentication?
What is conditional access best practices?
What is IAM?
What is MAC, DAC and RBAC?
What is MFA?
What is RBAC?
What is the most secure authentication methodology, why?
What is the problem if user login as root to perform basic functions?
What is the use of ‘salt’ in reference to passwords? Are there any limitations of using it?
What is two-factor authentication and how it can be implemented for public websites?


The End


Microsoft Entra

How to connect devices with Microsoft Entra?
There are two main approaches to connect Windows and Linux machines to Microsoft Entra,
Azure Active Directory Domain Services (Azure AD DS): 
This method involves joining machines to a managed domain hosted by Microsoft Entra. 
On Windows machines:
•	Prerequisites: Windows OS should be supported. https://learn.microsoft.com/en-us/entra/identity/domain-services/
•	Domain Join: 
o	Use the standard domain join process available in Windows settings or command prompt to join the Azure AD DS managed domain. 
o	Need the domain name and administrator credentials.
On Linux machines:
•	Prerequisites: 
o	Install the AADLoginForLinux extension on your Linux machines. 
o	The process differs slightly depending on your distribution, but generally involves using your package manager. 
o	https://learn.microsoft.com/en-us/entra/identity/devices/howto-vm-sign-in-azure-ad-linux
•	Domain Join: 
o	Use the realm join command with the appropriate parameters to join the Azure AD DS managed domain. 
o	Credentials for a domain administrator user are required.

2. Azure Active Directory (Azure AD) passwordless authentication:
This method leverages Azure AD for authentication without joining a domain. 
On both Windows and Linux machines:
•	Azure AD Connect: Ensure you have Azure AD Connect set up to synchronize your on-premises Active Directory (if applicable) or other identity sources with Azure AD.
•	Password Hash Synchronization (PHS): Configure PHS in Azure AD Connect to securely synchronize password hashes from your on-premises directory to Azure AD.
•	Multi-factor Authentication (MFA): Enable MFA for user accounts to add an extra layer of security during the login process.

Benefits of Passwordless Authentication:
•	Improved security posture by eliminating the need for domain credentials on local machines.
•	Simplified management as machines are not directly joined to a domain.

Choosing the Right Method:
•	Azure AD DS: This approach is suitable if you need group policy management or desire a familiar domain-based structure for your on-premises and cloud resources.
•	Passwordless Authentication: This method offers a more cloud-centric approach, eliminating domain management overhead and potentially improving security.


What is the prerequisite to join windows machine to Azure Active Directory Domain Services (Azure AD DS)?
Azure AD and Azure AD DS Requirements:
•	Need active Azure Subscription
•	Enabled Azure AD tenant
•	Integrate Azure AD DS with Azure AD tenant for identity management. 
•	Enable Azure AD DS managed domain this acts as the domain that your Windows machines will join.
Windows Machine Requirements:
•	Supported Operating System: https://learn.microsoft.com/en-us/entra/fundamentals/
•	Network Connectivity: Windows need outbound connectivity to Azure AD and Azure AD DS endpoints to facilitate communication during the domain join process.
•	Firewall Rules: Ensure any firewalls on the Windows machines allow outbound traffic to the required Microsoft Azure IP ranges and specific Azure AD DS service endpoints.
Additional Considerations:
•	Domain Admin Credentials: Need domain administrator credentials for Azure AD DS managed domain during join process.
•	Time Synchronization: Windows machines should be configured to synchronize time with a reliable time source, such as a NTP. This ensures consistent time across the domain.
•	Optional: Azure AD Connect: If you have an existing on-premises Active Directory environment and want to synchronize user identities with Azure AD for centralized management, you can set up Azure AD Connect.



How to implement MFA in Microsoft Entra?
Identify and remediate Sign-in risks
How identify and remediate security risks related to sign-in risk policies in MD-XDR?

To identify and remediate security risks related to sign-in risk policies in MD-XDR, you can follow these steps:
Identify
1.	Review your sign-in risk policies. Make sure that your policies are aligned with your security posture and that they are effective in mitigating the risks that you face.
2.	Monitor your sign-in risk data. Use MD-XDR to monitor sign-in activity and identify risky sign-ins.
3.	Investigate risky sign-ins. If you identify a risky sign-in, investigate it to determine whether it is a legitimate sign-in or a malicious attempt.
4.	Remediate security risks. If you determine that a sign-in is malicious, remediate the risk by blocking the user, resetting their password, and reviewing their account for other signs of compromise.
Remediate
Here are some specific ways to remediate security risks related to sign-in risk policies in MD-XDR:
•	Require multi-factor authentication (MFA) for all users. MFA is one of the most effective ways to mitigate sign-in risk.
•	Implement conditional access policies. Conditional access policies can be used to require additional authentication or block access to specific resources based on user risk and other factors.
•	Block anomalous sign-ins. MD-XDR can be used to block sign-ins that are anomalous, such as sign-ins from unusual locations or devices.
•	Reset user passwords. If you suspect that a user's password has been compromised, reset their password immediately.
•	Review user accounts for other signs of compromise. If you identify a risky sign-in, review the user's account for other signs of compromise, such as suspicious changes to their account settings or unusual activity in their email inbox.
Here are some additional tips for identifying and remediating security risks related to sign-in risk policies in MD-XDR:
•	Use Azure Active Directory (AD) Premium. Azure AD Premium provides additional features for managing sign-in risk, such as user risk policies and risk-based conditional access.
•	Use Microsoft Entra Identity Protection. Microsoft Entra Identity Protection is a unified identity protection solution that provides a comprehensive view of user risk across Microsoft 365 and other cloud services.
•	Use a security information and event management (SIEM) tool. A SIEM tool can be used to correlate data from multiple sources, including MD-XDR, to identify and remediate security risks.
By following these tips, you can identify and remediate security risks related to sign-in risk policies in MD-XDR and help to protect your organization from cyberattacks.

Identify and remediate Conditional Access Risks
How to identify and remediate security risks related to Conditional Access events in MD-XDR?
To identify and remediate security risks related to Conditional Access events in MD-XDR, you can follow these steps:
Identify
1.	Review your Conditional Access policies. Make sure that your policies are aligned with your security posture and that they are effective in mitigating the risks that you face.
2.	Monitor your Conditional Access event data. Use MD-XDR to monitor Conditional Access events and identify risky events.
3.	Investigate risky events. If you identify a risky Conditional Access event, investigate it to determine whether it is a legitimate event or a malicious attempt.
4.	Remediate security risks. If you determine that a Conditional Access event is malicious, remediate the risk by blocking the user, resetting their password, or reviewing their account for other signs of compromise.
Remediate
Here are some specific ways to remediate security risks related to Conditional Access events in MD-XDR:
•	Block anomalous Conditional Access events. MD-XDR can be used to block Conditional Access events that are anomalous, such as events from unusual locations or devices.
•	Reset user passwords. If you suspect that a user's password has been compromised, reset their password immediately.
•	Review user accounts for other signs of compromise. If you identify a risky Conditional Access event, review the user's account for other signs of compromise, such as suspicious changes to their account settings or unusual activity in their email inbox.
•	Update your Conditional Access policies. If you identify a new security risk, update your Conditional Access policies to mitigate the risk.
Here are some additional tips for identifying and remediating security risks related to Conditional Access events in MD-XDR:
•	Use Azure Active Directory (AD) Premium. Azure AD Premium provides additional features for managing Conditional Access events, such as risk-based conditional access and Conditional Access Insights.
•	Use Microsoft Entra Identity Protection. Microsoft Entra Identity Protection is a unified identity protection solution that provides a comprehensive view of user risk across Microsoft 365 and other cloud services.
•	Use a security information and event management (SIEM) tool. A SIEM tool can be used to correlate data from multiple sources, including MD-XDR, to identify and remediate security risks.
By following these tips, you can identify and remediate security risks related to Conditional Access events in MD-XDR and help to protect your organization from cyberattacks.
Here are some specific examples of how you can identify and remediate security risks related to Conditional Access events in MD-XDR:
•	Identify suspicious login attempts. You can use MD-XDR to monitor Conditional Access events for suspicious login attempts, such as login attempts from unusual locations or devices. If you identify a suspicious login attempt, you can block the user or reset their password.
•	Identify failed authentication attempts. You can also use MD-XDR to monitor Conditional Access events for failed authentication attempts. If a user fails to authenticate multiple times, you can block the user or review their account for other signs of compromise.
•	Identify risky app access. You can also use MD-XDR to monitor Conditional Access events for risky app access. For example, you can monitor for users accessing apps from unusual locations or devices. If you identify risky app access, you can block the user or review their account for other signs of compromise.
By monitoring Conditional Access events in MD-XDR, you can identify and remediate security risks and help to protect your organization from cyberattacks.

Identify and remediate risks in Microsoft Entra
identify, investigate, and remediate security risks related to privileged identities

configure detection alerts in Azure AD Identity Protection
identify and remediate security risks related to Active Directory Domain Services using Microsoft Defender for Identity



Security Checklist Microsoft Entra

Microsoft Entra ID (Azure AD) security assessment:

Identity and Access Management (IAM)
•	User Accounts: 
o	Inactive/Guest User Accounts 
	Identify and review inactive user accounts. Assess guest user access and permissions.
	Check for automated account lifecycle management. Review guest user invitation and access review processes.
o	Multi-Factor Authentication (MFA) 
	Determine MFA enforcement for all users, especially privileged accounts. Identify allowed MFA methods.
	Review Conditional Access policies requiring MFA for various scenarios (login, application access, privileged actions). Check MFA registration rates and methods.
o	Password Policies
	Verify password complexity requirements (length, character types, history).
	Check password policy settings in Azure AD (password length, complexity, age, history). Look for custom password hash settings.
o	Privileged Accounts (Global Admins, etc.) 
	Minimize the number of privileged accounts. Verify just-in-time access using Privileged Identity Management (PIM).
	Review the list of Global Administrators and other privileged roles. Check PIM configuration, including approval workflows and activation durations.
o	User Lifecycle Management 
	Evaluate processes for onboarding, offboarding, and changes in user roles.
	Check for integration with HR systems for automated provisioning/deprovisioning.
•	Groups: 
o	Group Management 
	Verify the use of groups for permission assignments instead of direct user assignments.
	Review group nesting and membership. Check for orphaned groups (no owner).
	
o	Role-Based Access Control (RBAC) 
	Verify appropriate RBAC implementation for Azure resources.
	Review role assignments at different scopes (subscription, resource group, resource).
•	Conditional Access: 
o	Policy Review 
	Examine all Conditional Access policies for effectiveness and coverage.
	Check policies for:
	MFA enforcement for various conditions (location, device, application).
	Blocking legacy authentication.
	Requiring compliant devices.
	Risk-based access control.
	Session lifetime management.
o	Location-Based Access 
	Verify the configuration of trusted locations and IP ranges.
	Review named locations and their use in Conditional Access policies.
•	Identity Protection: 
o	Risk Assessment 
	Evaluate the use of Azure AD Identity Protection for detecting and responding to identity risks.
	Review risk detection settings and automated responses (e.g., MFA challenge, password reset).
	
o	Risk Reporting 
	Review Identity Protection reports for high-risk users and sign-ins.
	Check the configuration of alerts and notifications for suspicious activity.

Application Security
•	A. Application Registrations: 
o	App Inventory 
	Identify all registered applications and their permissions.
	Review app registrations in Azure AD. Check for unused or overly permissive applications.
	
o	API Permissions 
	Verify the API permissions granted to applications and users.
	Review API permissions for each application registration.
o	Consent Framework 
	Evaluate the process for granting consent to applications.
	Review user consent settings and admin consent workflows.
•	B. Enterprise Applications: 
o	SaaS App Integration 
	Review the integration of SaaS applications with Azure AD for single sign-on (SSO).
	Check SSO configuration for each enterprise application.
o	App Governance 
	Verify processes for managing and governing access to enterprise applications.
	Review application access reviews and lifecycle management.

Device Management
•	A. Device Registration: 
o	Device Enrolment 
	Evaluate the process for enrolling devices in Azure AD.
	Review device registration requirements and methods (e.g., Azure AD Join, Hybrid Azure AD Join).
o	Device Compliance 
	Verify the implementation of device compliance policies.
	Review compliance policies for operating system versions, security updates, and other requirements.

Security Monitoring and Logging
•	A. Audit Logs: 
o	Log Retention 
	Verify the retention period for Azure AD audit logs.
	Check audit log retention settings in Azure AD.
	
o	Log Analysis 
	Evaluate the process for analysing audit logs for security events.
	Integrate audit logs with a SIEM or other log management system.
•	B. Sign-in Logs: 
o	Sign-in Monitoring 
	Verify the monitoring of sign-in logs for suspicious activity.
	Review sign-in logs for failed logins, unusual locations, and other anomalies.
	





Identity and Authentication:
•	Require multi-factor authentication (MFA) for all users, including administrators.
•	Enforce strong password policies (length, complexity, history).
•	Block legacy authentication protocols (e.g., POP3, IMAP, SMTP).
•	Implement Conditional Access policies based on user, location, device, and application.
•	Require compliant devices for access to specific resources.
•	Use passwordless authentication methods (e.g., Windows Hello for Business, Microsoft Authenticator).
•	Monitor sign-in risk and user risk using Identity Protection.
•	Configure sign-in frequency policies.
•	Implement custom authentication methods if needed.
•	Manage guest user access and permissions.
Privileged Access:
•	Minimize the number of Global Administrators.
•	Use Privileged Identity Management (PIM) for just-in-time privileged access.
•	Require approval for privileged role activation.
•	Set time limits for privileged role activations.
•	Monitor privileged accounts for suspicious activity.
•	Implement break-glass accounts for emergency access.
•	Review and audit privileged access regularly.
Device Management:
•	Require device registration with Azure AD.
•	Enforce device compliance policies using Intune.
•	Manage devices using Microsoft Endpoint Manager.
•	Implement app protection policies on mobile devices.
•	Require BitLocker encryption on Windows devices.
•	Monitor device health and compliance.
Application Security:
•	Control access to enterprise applications.
•	Grant access only to necessary applications.
•	Require admin consent for app registrations.
•	Monitor application usage for suspicious activity.
•	Implement app governance policies.
•	Manage OAuth app permissions.
•	Use Conditional Access to control app access.
Data Protection:
•	Enable data encryption at rest and in transit.
•	Implement data loss prevention (DLP) policies.
•	Use Azure Information Protection for data classification and labeling.
•	Protect sensitive data with sensitivity labels.
•	Monitor data access and usage.
•	Implement data governance policies.
Threat Protection:
•	Enable Microsoft Defender for Identity to detect identity-based threats.
•	Monitor security alerts and respond to incidents promptly.
•	Use Azure Sentinel for security information and event management (SIEM).
•	Configure alerts for suspicious activities.
•	Implement threat intelligence to prevent attacks.
•	Regularly perform security assessments and penetration testing.


Based on the provided list, here are the security controls that are specifically related to a Microsoft Entra ID (Azure AD) security assessment:
•	Require MFA for all users: Azure AD's Conditional Access policies are used to enforce MFA.
•	Enforce strong password policies: Azure AD password policies are directly related to this.
•	Block legacy authentication: This is configured within Azure AD.
•	Require compliant devices for access: Azure AD integrates with Intune for device compliance checks.
•	Limit the number of Global Administrators: This is a core Azure AD role management function.
•	Require approval for privileged role activation: Azure AD Privileged Identity Management (PIM) enables this.
•	Set time limits for privileged role activation: PIM also handles this.
•	Control access to enterprise applications: Azure AD is the central point for application access management.
•	Monitor application usage for suspicious activity: Azure AD logs and reporting can be used for this.
•	Detect and respond to identity-based threats: Azure AD Identity Protection is designed for this.
•	Configure Conditional Access policies based on location: This is a key feature of Azure AD Conditional Access.
•	Require MFA for specific applications: Achieved via Azure AD Conditional Access.
•	Control access based on device state: Azure AD Conditional Access with device state conditions.
•	Configure sign-in risk policies: Azure AD Identity Protection provides this functionality.
•	Configure user risk policies: Azure AD Identity Protection assesses user risk.
•	Control access to Azure resources based on roles: Azure RBAC (Role-Based Access Control) is integrated with Azure AD.
•	Monitor privileged accounts for suspicious activity: Azure AD audit logs and PIM can be used.
•	Enforce device compliance policies with Intune: While Intune is the primary tool, Azure AD integration is essential for this control.
•	Configure alerts for suspicious activities in Defender for Identity: Defender for Identity integrates with Azure AD for identity-related threat detection.

What is Azure AD and its features?
How to configure MFA in Azure AD?
How to configure SSO in Azure AD?
How to configure hybrid identity on Azure AD?
How to register device on Azure AD?
What are the Identity protection solutions in Azure AD?
What is Windows Hello for Business?
What is FIDO2?


Entra
•	Briefly explain the relation of Azure AD with subscriptions?  Ans: Azure AD is a cloud-based identity access management service that, in turn, assists the management of Azure resources. There are one too many subscriptions available, and the admin can trust a single Azure AD. However, a single Azure AD can access multiple subscriptions.
•	Can a child domain be created under managed domain services?  Ans: The creation of child domains is not allowed under managed domain services. Azure AD Domain services only allow single forest design and single domain provision. 
•	Can the on-premises applications be added?   Ans: The required on-premises web applications chosen are given secure and easy access by the Azure AD application proxy. This process does not involve changing network infrastructure or a VPN requirement. Instead, the user can access it the same way you access the SaaS apps in Azure AD. 
•	Can the tenant id and client id be hide able in the body or headers in Azure AD?  You must not use a client identifier for client authentication as it is visible to the resource owner and not a secret. The client id and the tenant id are both visible in the URL. Passing them to the body or headers does not mean they are hidden. Their visibility is still accessible via the developer tools. According to the OAuth RFC, tenant and client id are not secrets. 
•	Define Azure AD?  Azure AD is Cloud-based access and identity management service that enables users to access external resources like the Azure portal, Microsoft , and several other SaaS applications. Azure AD's other services include the help provided in enhancing productivity and business streamlining processing. In contrast, the SSO GIVES access to internal resources such as cloud apps developed in your organization or apps on your corporate intranet network.
•	Define dynamic groups in Azure AD?  The dynamic groups are those running on the user's attribute. The significant criteria involve satisfying the conditions. Otherwise, the user is removed from the group. Thus, the dynamic groups are active in adding and removing users. 
•	Differentiate between Windows AD and Azure AD?  Windows active directory is a service that facilitates interconnected and varying network conditions in a unified manner. Azure AD is a directory for cloud-based applications. It is mainly used for identity management and resource access management by admins. 
•	Explain architecture design under Azure AD service?  Azure AD makes managing and controlling the resources and services secure for the users. Primary replica and secondary replica are the two components that fall under Azure AD architecture: ) Primary replica: The preceding model receives all the writes for the residing partitions. Before returning success to the caller, all the correct operations are instantaneously duplicated to secondary replicas. Thus, the durability of rights reserved is geo-redundant. ) Secondary replica: Secondary replicas located throughout the geographies in data centers service all the directory reads. Asynchronous replication of data is a significant cause of the multiple secondary representations. Data centers near the customers handle the directory reads that include authentication requests. 
•	How can the on-premises directory be connected to Azure AD?  Ans: Azure AD connect looks up to connecting your on-premises directory to Azure AD. Checking up on "Integrating your on-premises identities with Azure AD" provides you with more information. 
•	How does Azure AD compare to AWS from your viewpoint?  Your knowledge of developer tools should be compatible with Microsoft's interface for Windows/SQL servers. In addition, it would be best if you were well versed with the deployment options of Azure and AWS as a cloud architect. 
•	How to get the Azure account tenant Id?  Ans: Getting your Azure account tenant id involves the following steps: Navigate to dashboard, Navigate to Active Directory, Navigate to Properties, Finally, copy the "Directory ID." 
•	Is it possible to set up a secure LDAP connection with Azure AD?   Lightweight Directory Access Protocol(LDAP) is inaccessible through Azure AD. However, adequately configured network groups help enable Azure AD domain services, establishing LDAP connectivity through Azure networking. 
•	Name the types of cloud computing in Azure AD?  Ans: The various cloud computing types in Azure AD include : IDEAS, PAAS, SAAS
•	State the enabling and configuration of a single sign-on for an enterprise solution on Azure AD tenant? Before configuring SSO, you need the following: Prerequisites: Create an Azure AD account using one of the following roles: Owner of Service Principal, Application Administrator, Cloud Application Administrator, Global Administrator. To enable SSO: Visit [Azure AD Admin Center](https://aad.portal.azure.com/) and sign in with one of the abovementioned roles. Select Enterprise solutions on the left side. Now, you will see a pane with All Applications and the list of applications for your Azure AD tenant. You can choose the one you need; for instance - Azure AD SAML Toolkit . Select SSO on the left side of the menu, where you see the Manage section. Open the single sign on the page to edit. To open the configuration page, choose SAML. Next, go to the Setup Azure AD SAML Toolkit  panel. Record the inputs of Logout, Login URL, and Azure AD identifier for your future reference. Configuration of SSO on tenant: Go to the Set Up Single Sign-on panel in the Azure portal and choose the Edit menu. Enter the following for Reply URL https://samltoolkit.azurewebsites.net/SAML/Consume Enter  https://samltoolkit.azurewebsites.net/ for Sign on URL Click Save. Choose Download for Certificate in SAML Signing Certificate to download the certificate. Use it later whenever you need it. 
•	What are Azure Directory domain services?  Ans: The Azure AD domain services include authentication of various managed domain services like the lightweight directory access protocol (LDAP), Kerberos/NTLM, domain join, and group policy. All these domain services are usable for the users without having to operate, patch or deploy the cloud-based domain controllers (DCS). 
•	What are the advantages of Azure AD?  Ans: The significant benefits of using Azure AD are: Multiple platform availability: It facilitates operation on various devices and platforms for time consumption and productivity. Global availability: Operates 8 data centers worldwide and is accessible throughout the globe irrespective of your location. Single sign-on for multiple applications: Azure AD makes onboarding new employees faster and easier and helps implement access to new cloud services and terminate those for the leavers. Pre integration with favourite cloud services: Helps collaborate with salesforce, office , and social media. Comprehensive reporting: Protection from additional threats through enhancing security and enabling business monitor applications.
•	What are the different Azure AD licenses?  Ans: Azure AD licenses include: “Pay as you go” feature licenses, Azure AD Free, Azure AD Premium P, Azure AD Premium P
•	What are the functions of Azure AD Domain Services?  Ans: Functions of Azure AD services include: Makes use of domains, forests, and organizational units for object organization. Provides authorization and standard authentication, Customizable schemes, Provides authentication of NTLM, Kerberos, LDAP, etc. Secures object stores, Provides group policies
•	What are the license requirements for using Azure AD connect?  Azure AD Connect does not involve any fee, i.e., it is free and can be availed with an Azure subscription. 
•	
•	What Azure AD BC features in Azure AD are unavailable?  Ans: The features currently unavailable are : The API connectors, Conditional access.
•	What can be done if the required application is missing from the Azure AD marketplace? You can add any required application per the user's requirement by subscribing to Azure AD premium. Users can add automated provisioning and SSO configuration based on preferences and the capabilities of the applications. 
•	
•	What is Azure AD BC? Azure AD Business to Consumer or Azure AD BC manages the access and customer identity. Not only the protection of their identities is assisted by Azure AD, but also it enhances consumer relationships.
•	What is conditional access in Azure AD?  Ans: Conditional access refers to policies under which actions are completed and helps access resources. 
•	What is identity in Azure AD?  Ans: Identity in Azure AD is the representation of something or a thing that by some means can be authenticated. For example, identity in the Azure AD Directory usually represents a user with a password associated and a unique username used for authentication. Their authentications can be accessed using secret keys or certificates.
•	What is the method for applying windows updates under Azure AD Domain Services?  Ans: Controllers automatically apply the necessary window updates in a managed domain, even without your configuration or administration. However, the user must ensure that he does not block access to outbound traffic to Windows updates by creating network security groups. 
•	What is the User principal name in Azure AD?  Ans: Microsoft's Active Directory is the username or sign-in name that uniquely identifies a user in the User Principal Name (UPN) in Azure AD. The Azure AD supports all the online business services of Microsoft, such as Dynamics , Azure, Microsoft , Power apps, Office , etc. 
•	What is two-factor authentication and how it can be implemented for public websites?Tw0-factor authentication is also referred to as dual-factor authentication or two-step verification where the user provides two authentication factors for protecting both user credentials and resources while accessing. The two-factor authentication can be implemented on public websites such as Twitter, Microsoft, LinkedIn, and more for enabling another protection on your already protected account with a password. For enabling this double factor authentication, you can easily go to settings and then manage security settings. 
•	Where did you learn Azure AD?  The interviewer asks you if you have a job certification or a college degree in the subject. 
•	Who utilizes an Azure AD?  Ans: Azure AD is mainly intended for the use of: App developers: Working with the clients' pre-existing credentials and adding SSO to the applications are the two areas where app developers use Azure AD. Here they act as a guideline-based method. Online subscribers of Azure, Microsoft , Dynamics CRM, and Office : the online subscribers use Azure AD as it is readily provided with Microsoft  for accessing their integrated cloud applications. As per their business requirements, IT Admins use Azure AD to regulate access to various app resources and apps. 
•	Why made you choose Microsoft Azure over AWS and other platforms?  The main advantages that give Azure AD an upper hand is: Net programming compatibility, Sync across multiple OS, SDL foundation



Can MFA be enabled or disabled in bulk? 
The MFA portal helps us enable or disable MFA in bulk for the user- level. 

Define SSPR? 
Ans: Self-service password reset of the Active Directory provides the users' allowance to reset or change their password without the assistance of an administrator. 
5. Name the steps that help implement MFA? 
Ans: Implementing MFA in Azure can be listed in three ways, they are 
User-level MFA
The policy of conditional access
Security default. 

6. Explain Oauth? 
Ans: The primary role of the OAuth protocol is verifying the user's identity but not at the cost of disclosing their passwords. OAuth authorization is covered but does not include authentication. 
The tokens obtained by users, generally called bearer tokens, can be used to verify identities. The use of bearer tokens implies verifying a user's identity by third-party services rendering them with secure and privileged resources. 
10. Explain Azure site-to-site VPN? 
Ans: Connecting the on-services premises network over the IKE/ IPsec VPN tunnel is one of the significant functions falling under Azure site-to-site VPN. Its primary requirement is a VPN device with which one must assign an extreme-facing public IP. 
11. Mention the tools used in the creation of Vents? 
Ans: Tools employed in creating Vents are Powershell, Azure CLI, and Azure Portal. 
12. How to get the Azure account tenant Id? 
Ans: Getting your Azure account tenant id involves the following steps - 
Navigate to dashboard
Navigate to Active Directory
Navigate to Properties 
Finally, copy the "Directory ID." 
13. What Azure AD B2C features in Azure AD are unavailable? 
Ans: The features currently unavailable are : 
The API connectors 
Conditional access.
14. What are the differences between Owner and Global Administrator? 
Ans: A person signing up for an Azure subscription is assigned the owner role for Azure resources. This owner can use a school or work account or a Microsoft account to manage services in the Azure portal. It is associated with the Azure subscription. 
A person signing up with the QAzure subscription is assigned the global administrator role for the directory. Access to various directory features and related features is given to these administrators. The administrator's job includes managing domain or user licenses, assigning administrative roles to other users, etc. 
15. How can the on-premises directory be connected to Azure AD? 
Ans: Azure AD connect looks up to connecting your on-premises directory to Azure AD. 
Checking up on "Integrating your on-premises identities with Azure Active Directory" provides you with more information. 
16. Do people in my organization have access to a self-service portal? 
Ans: Yes, the users are given the Azure AD Access Panel by the Azure AD for application access and self-service.
Similarly, in the Office 365 portal, a Microsoft 365 user can avail of the same cap[abilities. 
17. What can be done if the required application is missing from the Azure AD marketplace?
Ans: You can add any required application per the user's requirement by subscribing to Azure AD premium. Users can add automated provisioning and SSO configuration based on preferences and the capabilities of the applications. 
18. Can the on-premises applications be added?  
Ans: The required on-premises web applications chosen are given secure and easy access by the Azure AD application proxy. This process does not involve changing network infrastructure or a VPN requirement. Instead, the user can access it the same way you access the SaaS apps in Azure AD. 
19. Is it possible to set up a secure LDAP connection with Azure AD?
Ans: Lightweight Directory Access Protocol(LDAP) is inaccessible through Azure AD. However, adequately configured network groups help enable Azure AD domain services, establishing LDAP connectivity through Azure networking. 
20. What is automated user provisioning for SaaS apps? 
Ans: Azure VAD automates creating, removing, and maintaining identities in various SaaS apps.
21. What are the license requirements for using Azure AD connect? 
Ans: Azure AD Connect does not involve any fee, i.e., it is free and can be availed with an Azure subscription. 
22. Name the types of cloud computing in Azure AD? 
Ans: The various cloud computing types in Azure AD include : 
IDEAS
PAAS
SAAS
23. Define dynamic groups in Azure AD? 
Ans: The dynamic groups are those running on the user's attribute. The significant criteria involve satisfying the conditions. Otherwise, the user is removed from the group. Thus, the dynamic groups are active in adding and removing users. 
24. What is conditional access in Azure Active Directory? 
Ans: Conditional access refers to policies under which actions are completed and helps access resources. 
25. What is risk detection? 
Ans: Risk detection is categorized under Azure Identity Protection. All the activities against the user account can be detected using Risk detection. 
26. Name some critical applications of Azure?
Ans: The critical applications of Azure are as listed below 
Web applications
Storage
Cloud services
Mobile apps 
Media services 
Infrastructure services
27. What are the functions of Azure AD Domain Services?
Ans: Functions of Azure AD services include 
Makes use of domains, forests, and organizational units for object organization.
Provides authorization and standard authentication
Customizable schemes 
Provides authentication of NTLM, Kerberos, LDAP, etc. 
Secures object stores 
Provides group policies
28. Explain architecture design under Azure Active Directory service?
Ans: Azure Active Directory makes managing and controlling the resources and services secure for the users. 
Primary replica and secondary replica are the two components that fall under Azure AD architecture - 
Primary replica: The preceding model receives all the writes for the residing partitions. Before returning success to the caller, all the correct operations are instantaneously duplicated to secondary replicas. Thus, the durability of rights reserved is geo-redundant. 
Secondary replica: Secondary replicas located throughout the geographies in data centers service all the directory reads. Asynchronous replication of data is a significant cause of the multiple secondary representations. Data centers near the customers handle the directory reads that include authentication requests. 
29. Differentiate between Windows AD and Azure AD?
Ans: Windows active directory is a service that facilitates interconnected and varying network conditions in a unified manner. 
Azure AD is a directory for cloud-based applications. It is mainly used for identity management and resource access management by admins. 
30. What is Azure AD B2C?
Ans: Azure Active Directory Business to Consumer or Azure AD B2C manages the access and customer identity. Not only the protection of their identities is assisted by Azure AD, but also it enhances consumer relationships.
31. State the enabling and configuration of a single sign-on for an enterprise solution on Azure AD tenant?
Ans: Before configuring SSO, you need the following:
Prerequisites: 
Create an Azure Active Directory account using one of the following roles:
Owner of Service Principal
Application Administrator
Cloud Application Administrator
Global Administrator
To enable SSO:
Visit Azure Active Directory Admin Center and sign in with one of the abovementioned roles.
Select Enterprise solutions on the left side. Now, you will see a pane with All Applications and the list of applications for your Azure AD tenant. You can choose the one you need; for instance - Azure AD SAML Toolkit 1.
Select SSO on the left side of the menu, where you see the Manage section. Open the single sign on the page to edit.
To open the configuration page, choose SAML.
Next, go to the Setup Azure AD SAML Toolkit 1 panel.
Record the inputs of Logout, Login URL, and Azure Active Directory identifier for your future reference. 
Configuration of SSO on tenant:
Go to the Set Up Single Sign-on panel in the Azure portal and choose the Edit menu.
Enter the following for Reply URL https://samltoolkit.azurewebsites.net/SAML/Consume
Enter https://samltoolkit.azurewebsites.net/ for Sign on URL
Click Save
Choose Download for Certificate in SAML Signing Certificate to download the certificate.
Use it later whenever you need it.
32. What are Azure Directory domain services? 
Ans: The Azure Active Directory domain services include authentication of various managed domain services like the lightweight directory access protocol (LDAP), Kerberos/NTLM, domain join, and group policy. All these domain services are usable for the users without having to operate, patch or deploy the cloud-based domain controllers (DCS). 
33. Define Redis Databases? 
Ans: When a logical separation of data occurs inside the same Redis instance, it is referred to as Redis Databases. Values/Keys stored in a database is determinant of the actual memory consumption, whereas, on the other hand, all the databases share the cache memory.
34. Can a child domain be created under managed domain services?
Ans: The creation of child domains is not allowed under managed domain services. Azure AD Domain services only allow single forest design and single domain provision. 
35. What is the method for applying windows updates under Azure AD Domain Services?
Ans: Controllers automatically apply the necessary window updates in a managed domain, even without your configuration or administration. 
However, the user must ensure that he does not block access to outbound traffic to Windows updates by creating network security groups. 
36. What is the possible way of displaying block devices associated with a virtual machine?
Ans: You can get a list of the blocked devices at a specified domain through the below:
domblklist domain --inactive --details
If you specify the --inactive, you will see the devices that you can use at the next start. However, you can’t see the ones currently used by the running domain. 
If you specify the --details, you will have the disk type and device value in the table. Now, you can use the information to get in this table with the domblkinfo and snapshot-create.
#domblist rhel6   - -details
37. Write the advantages of scaling in Azure?
Ans: The advantages of scaling in Azure can be categorized as 
Scale up or down based on demand
Highly cost-effective
Application performance is maximized
Scheduled scaling to particular periods
38. What ways to collect memory statistics for a running guest virtual machine?
Ans: The method of collecting memory statistics are 
virsh dommemstat rhel7
actual 1048576
swap_in 0
swap_out 0
major_fault 2974
minor_fault 1272454
unused 246020
available 1011248
rss 865172
# virsh domiflist rhel7
Interface  Type       Source     Model       MAC
-------------------------------------------------------
vnet   network     default        virtio     52:54:00:01:1d:d0

# virsh domifstat rhel7 vnet0
vnet0 rx_bytes 55308
vnet0 rx_packets 969
vnet0 rx_errs 0
vnet0 rx_drop 0
vnet0 tx_bytes 14341
vnet0 tx_packets 148
vnet0 tx_errs 0
vnet0 tx_drop 0
39. How to display network statistics for a guest virtual machine?
Ans: The required code is
virsh domiflist guest1
Interface  Type       Source     Model       MAC
-------------------------------------------------------
macvtap0   direct     em1        rtl8139     12:34:00:0f:8a:4a
virsh domifstat guest1 macvtap0
macvtap0 rx_bytes 51120
macvtap0 rx_packets 440
macvtap0 rx_errs 0
macvtap0 rx_drop 0
macvtap0 tx_bytes 231666
macvtap0 tx_packets 520
macvtap0 tx_errs 0
macvtap0 tx_drop 0
# virsh domiflist guest1
Interface  Type       Source     Model       MAC
-------------------------------------------------------
mactap0   direct     em1        rt18139     12:534:00:0f:8a:4a

# virsh domifstat guest1 mactap0
mactap0 rx_bytes 51120
mactap0 rx_packets 440
mactap0 rx_errs 0
mactap0 rx_drop 0
mactap0 tx_bytes 231666
mactap0 tx_packets 520
mactap0 tx_errs 0
mactap0 tx_drop 0
40. How is a VM created in Azure CLI?  
Ans:
The code is
- Running ...
{
  "fqdns": "",
  "id": "/subscriptions/11111111-1111-1111-1111-111111111111/resourceGroups/MyResourceGroup/providers/Microsoft.Compute/virtualMachines/MyVM",
  "location": "frn00006",
  "macAddress": "111111111111",
  "powerState": "VM running",
  "privateIpAddress": "10.0.0.1",
  "publicIpAddress": "11.111.111.11",
  "resourceGroup": "MyResourceGroup"
}
41. Can the tenant id and client id be hideable in the body or headers in Azure AD? 
Ans: You must not use a client identifier for client authentication as it is visible to the resource owner and not a secret. 
The client id and the tenant id are both visible in the URL. Passing them to the body or headers does not mean they are hidden. Their visibility is still accessible via the developer tools. 
According to the OAuth RFC, tenant and client id are not secrets.
42. What are the different Azure AD licenses?
Ans: Azure AD licenses include 
“Pay as you go” feature licenses
Azure Active Directory Free 
Azure Active Directory Premium P1
Azure Active Directory Premium P2
1. Why did you choose your career in cloud computing?
Ans: Cloud computing is the center of all technologies. As a result, more and more organizations depend on cloud-based platforms to meet market efficiencies. In the coming years, clouds will be the backbones of many organizations, allowing them to be competitive, agile, productive, and secure. 
2. Tell us about the last problem you solved? 
Ans: As a cloud architect, it was being a good listener counts. It would be best if you answered this question in a solid compact way. a) The problem in 1 line. b) The turning point which helped overcome the crisis (max two lines).
3. Why made you choose Microsoft Azure over AWS and other platforms?
Ans: The main advantages that give Azure AD an upper hand are:
Net programming compatibility 
Sync across multiple OS
SDL foundation 
4. How does Azure AD compare to AWS from your viewpoint?
Ans: Your knowledge of developer tools should be compatible with Microsoft's interface for Windows/SQL servers. In addition, it would be best if you were well versed with the deployment options of Azure and AWS as a cloud architect. 
5. Where did you learn Azure AD?
Ans: The interviewer asks you if you have a job certification or a college degree in the subject. 
6. How would you differentiate between IaaS, PaaS, and SaaS in your language?
Ans:
Infrastructure as a service (IaaS): It’s a paid service providing users with components like OS, Networking, etc. The admin can use it for application hosting—for example, Azure VMs.
Platform as a service (PaaS): Mainly used for building and developing applications regardless of the host environment. For example, Azure SQL.
Software as a service (SaaS): It is mainly a paid service. For example, Office 365
7. Can you name the instance types offered by Azure?
Ans: Azure offers CPU-to-memory ratio, memory, and compute-optimized interface. In addition, Azure also provides high disk IO (storage optimization) and GPU render (heavy graphic works and rendering).
8. What are the advantages of auto-scaling in Azure?
Ans: Scaling is based on demand and cost-effective; schedule scaling to a specific period.



Microsoft Entra ID
1. Define Microsoft?
Ans: Azure Active Directory is Cloud-based access and identity management service that enables users to access external resources like the Azure portal, Microsoft 365, and several other SaaS applications.
Azure Active Directory's other services include the help provided in enhancing productivity and business streamlining processing. In contrast, the SSO GIVES access to internal resources such as cloud apps developed in your organization or apps on your corporate intranet network.
If you want to enrich your career and become a professional in Azure, then enroll in "Azure Online Training" - This course will help you to achieve excellence in this domain.
2. What are the advantages of Azure AD?
Ans: The significant benefits of using Azure AD are 
Multiple platform availability: It facilitates operation on various devices and platforms for time consumption and productivity.
Global availability: Operates 28 data centers worldwide and is accessible throughout the globe irrespective of your location.
Single sign-on for multiple applications: Azure AD makes onboarding new employees faster and easier and helps implement access to new cloud services and terminate those for the leavers.
Pre integration with favorite cloud services: Helps collaborate with salesforce, office 365, and social media.
Comprehensive reporting: Protection from additional threats through enhancing security and enabling business monitor applications.

9. What is identity in Azure Active Directory?
Ans: Identity in Azure AD is the representation of something or a thing that by some means can be authenticated. For example, identity in the Azure AD Directory usually represents a user with a password associated and a unique username used for authentication. Their authentications can be accessed by the use of secret keys or certificates.

Passwordless authentication
Passwordless authentication is not a process under which remembering the password is not a criterion because authentication is done by using FIDO keys, the MS authenticator app, or Windows Hello for business. 

Azure service fabric
The process of managing, deploying, and packaging reliable microservices is made more accessible using a distributed systems platform, Azure Service Fabric. 
The service fabric helps the administrators and developers to focus more on the reliable, scalable, and manageable workload, i.e., demanding workloads. The primary problems faced during the management and development of cloud applications are also tackled under Service Fabric. 

7. Briefly explain the relation of Azure AD with subscriptions?
Ans: Azure AD is a cloud-based identity access management service that, in turn, assists the management of Azure resources. There are one too many subscriptions available, and the admin can trust a single Azure Active Directory. However, a single Azure Active Directory is capable of accessing multiple subscriptions.
8. Who utilizes an Azure Active directory?
Ans: Azure AD is mainly intended for the use of 
App developers: Working with the clients' pre-existing credentials and adding SSO to the applications are the two areas where app developers use Azure AD. Here they act as a guideline-based method.
Online subscribers of Azure, Microsoft 365, Dynamics CRM, and Office 365: the online subscribers use Azure AD as it is readily provided with Microsoft 365 for accessing their integrated cloud applications.
As per their business requirements, IT Admins use Azure AD to regulate access to various app resources and apps.
9. What is the User principal name in Azure AD?
Ans: Microsoft's Active Directory is the username or sign-in name that uniquely identifies a user in the User Principal Name (UPN) in Azure AD. The Azure Active Directory supports all the online business services of Microsoft, such as Dynamics 365, Azure, Microsoft 365, Power apps, Office 365, etc. 



What is the most secure authentication method and why?
Multi-Factor Authentication (MFA) is considered the most secure. It combines two or more factors (e.g., password + fingerprint), making it much harder for attackers to gain access, even if one factor is compromised.

Which is more secure: strong password or biometrics?
Biometric authentication (like fingerprint or facial recognition) is generally more secure than even strong passwords. Biometrics are unique to each person and hard to steal or guess. But they should be used with MFA for best security.

What is a MAC?
A Message Authentication Code (MAC) ensures the message is authentic and unchanged during transmission. It combines a secret key with the message using a hashing algorithm. MAC verifies data integrity and authenticity.

What is 'salt' in password and its purpose?
A salt is a random value added to a password before hashing it. It prevents attackers from using precomputed tables (rainbow tables) to crack passwords.

Limitations:
•	Doesn’t stop weak passwords or reuse.
•	Needs to be stored securely.
•	Still relies on good hashing and storage practices.

What are the 3 ways to authentication?
Here are the ways of authentication
•	Something you know: e.g., Password or PIN
•	Something you have: e.g., Security token, smart card, mobile phone
•	Something you are: e.g., Biometrics like fingerprint, face, voice
•	Somewhere you are: e.g., Location-based access (like IP or GPS) 

What is MFA?
Combines two or more authentication types (e.g., password + mobile token). Adds extra protection even if one method is compromised. Examples: Password + OTP code, PIN + fingerprint.

What is Passwordless Authentication?
•	No passwords involved. Uses biometrics or hardware keys to log in.
•	Examples:
o	FIDO2 security keys
o	Microsoft Authenticator app
o	Windows Hello for Business (face or fingerprint login)
•	Benefits: Avoids password theft, phishing, and weak passwords altogether.

How to Make User Authentication More Secure
Best Practices:
•	Use strong, complex passwords with length and no reuse.
•	Enable Multi-Factor Authentication (MFA).
•	Limit login attempts to block brute-force attacks.
•	Monitor logins for suspicious behaviour.
•	Encrypt communication using HTTPS.
•	Regularly update software to patch security holes.
•	Educate users about phishing, secure passwords, and MFA.
•	Use CAPTCHA to stop bots.
•	Move toward passwordless authentication for higher security.

What is the most secure authentication methodology, and why?
Multi-Factor Authentication (MFA) is the most secure. MFA requires two or more verification methods (like a password and a fingerprint). Even if one factor is stolen (e.g., a password), the attacker still can’t log in without the second factor.

Which is more secure: a strong password or biometric authentication?
Biometric authentication is more secure. Biometrics (like fingerprints or facial recognition) are unique to each person and can't be easily guessed or reused like passwords. However, using them with MFA is even better.

What is Message Authentication Code (MAC)?
A MAC is used to verify message integrity and authenticity.
Explanation: It combines the message with a secret key and creates a code. If the message or the code is changed, verification fails. It ensures the message is from the expected sender and wasn’t tampered with.

Explain OAuth
OAuth allows apps to access user data without sharing passwords.
Explanation: OAuth is a protocol that lets third-party apps use your account information (like from Google or Facebook) via access tokens, not your actual password. It is about authorization (not authentication). For example, logging into a site using your Google account without typing your password into that site.

Explain Multi-Factor Authentication (MFA)
MFA uses two or more identity checks for login.
Explanation: It combines things like:
•	Something you know (password)
•	Something you have (OTP/token)
•	Something you are (fingerprint)
This makes accounts much harder to break into.

What is the use of ‘salt’ in passwords, and its limitations?
A salt is added to a password before hashing to protect it.
•	Salt is random data added to a password before it is hashed.
•	It makes each password hash unique, even for the same password.

Limitations:
•	Doesn't stop weak passwords.
•	Still needs strong hash algorithms and secure storage.

Explain Passwordless Authentication
No password is needed—authentication uses other secure methods.
Explanation: Users log in using biometrics (fingerprint, face), physical keys (FIDO2), or apps like Microsoft Authenticator. This removes the risk of stolen or weak passwords.

Common Authentication Methods for Network Security
Includes biometrics, tokens, OTPs, MFA, and out-of-band authentication.
•	Biometrics: Fingerprint or face ID.
•	Token: Hardware or software code generators.
•	Transaction authentication: One-time passwords for online transactions.
•	Multi-Factor Authentication: Uses two or more methods.
•	Out-of-Band Authentication: Sends a code via a separate channel (e.g., SMS + email).

Three Ways to Authenticate a Person
Authentication factors are:
1.	Something you know – e.g., password
2.	Something you have – e.g., OTP token
3.	Something you are – e.g., biometrics
Explanation: MFA is often a mix of these. Example: password (know) + fingerprint (are).

What is Authenticode?
Authenticode checks the identity and integrity of software.
Explanation: It uses digital signatures to confirm the software's publisher and verify that the software hasn’t been tampered with. It helps prevent installing malware disguised as trusted software.

What is 2FA, and how is it used for public websites?
Two-Factor Authentication (2FA) adds a second layer of security.
Explanation:
•	Combines password + something else (like an OTP, token, or app verification).
•	Used on websites by sending codes to an app (like Google Authenticator) or device.
•	Protects accounts even if the password is leaked.



Authentication methods
Authentication is how systems confirm a user’s identity before granting access. Different methods offer different levels of security.

Common Authentication Methods
1.	Biometrics:
Uses unique physical features like fingerprints, facial recognition, or iris scans to verify identity. These traits are hard to fake, making biometrics very secure.
2.	Tokens:
Physical devices (like a key fob) or software apps generate temporary codes that users enter to prove their identity. These codes change frequently, making it tough for attackers to reuse them.
3.	Transaction Authentication (One-Time Passwords - OTP):
One-time codes sent via SMS, phone call, or email are used to verify identity during sensitive actions like money transfers.
4.	Multi-Factor Authentication (MFA):
Requires users to provide two or more different types of verification—for example, a password plus a fingerprint or a password plus a token code—making it much harder for attackers to gain access.
5.	Out-of-Band Authentication:
Uses two separate communication channels, such as logging in on a computer and confirming on a mobile device, which reduces the risk of interception or hacking.
6.	Password:
The traditional method where a user provides a secret word or phrase to prove identity. Passwords are easy but often less secure if weak or reused.

Microsoft-Specific Authentication Methods
1.	Security Accounts Manager (SAM):
o	Windows stores user passwords in the SAM database (or Active Directory for domains).
o	Passwords are never saved in plain text; instead, they are hashed (converted into a scrambled format) for security.
2.	NTLM Authentication:
o	An older Microsoft authentication protocol, including NTLM and LM versions.
o	Uses hashed passwords stored in the SAM database.
o	Less secure than newer protocols.
3.	Kerberos Authentication:
o	The modern default protocol in Microsoft environments.
o	Uses “tickets” to prove identity securely over the network without sending passwords.
o	Offers stronger, faster, and more secure authentication compared to NTLM.

Additional Authentication Methods and Concepts
•	Password-Based Authentication:
The basic username and password method still widely used.
•	Multi-Factor Authentication (MFA):
Adds extra layers of security beyond passwords, such as biometrics or one-time codes.
•	Self-Service Password Reset (SSPR):
Allows users to reset their own passwords safely using methods like email verification or security questions, reducing helpdesk workload.
•	Passwordless Authentication:
Completely removes the need for passwords by using biometrics or trusted devices (examples: Windows Hello for Business, FIDO2 security keys), increasing convenience and security.

Hybrid Integration (Cloud + On-premises)
•	Password Changes:
Synchronize password updates between on-premises Active Directory (AD) and Azure Active Directory (Azure AD) so users have consistent credentials.
•	Password Policies:
Apply on-premises password rules to Azure AD users for unified security standards.

Authentication Protocols
•	SAML (Security Assertion Markup Language):
A widely used standard that lets identity providers securely pass authentication data to service providers.
•	OAuth (Open Authorization):
A framework that allows apps to access resources on behalf of a user without sharing the user’s password.
•	OpenID Connect:
Built on OAuth 2.0, it provides a secure way to authenticate users and get their identity information.

Other Important Points
•	Azure Portal & Microsoft Graph API:
Tools to configure and manage authentication methods in Microsoft environments.
•	Legacy Applications:
Older apps that don’t support modern authentication can use special “app passwords” to work securely.
•	SSPR Verification:
Common methods include answering security questions or verifying via email or phone.

Summary
A strong authentication strategy usually combines:
•	Multiple methods (passwords, biometrics, tokens, MFA).
•	Secure protocols (Kerberos, SAML, OAuth).
•	Hybrid syncing between cloud and on-premises.
•	User-friendly features like self-service password reset and passwordless options.



Windows SAM (Security Account Manager)
•	What is SAM?
SAM is a special database on Windows computers that stores user account information and password data.
•	How are passwords stored?
Passwords are never stored as plain text. Instead, Windows stores hashed versions of passwords in the SAM database (or in Active Directory if it's a domain). Hashing means the password is transformed into a fixed-length code that can’t easily be reversed back to the original password.

NTLM (NT LAN Manager)
•	What is NTLM?
NTLM is an older Microsoft authentication protocol used to verify users trying to log in. It includes:
o	NTLM Authentication Protocol
o	LM (Lan Manager) Authentication Protocol (even older and less secure)
•	Password Storage:
Passwords in SAM are hashed using methods related to NTLM or LM hashes.
•	Note: NTLM is considered less secure than newer protocols like Kerberos.

Kerberos
•	What is Kerberos?
Kerberos is the modern default authentication protocol in Windows networks, replacing NTLM for better security.
•	How does it work?
It uses "tickets" to allow computers (clients and servers) to prove their identities securely over insecure networks.
•	Why is it better?
It provides stronger authentication and protects against certain attacks that NTLM is vulnerable to.

Windows Hello for Business
•	What is Windows Hello for Business?
It’s a new way to log in that uses biometrics (fingerprint, face) or a PIN instead of passwords, and ties credentials directly to a specific device.
•	Why is it better than passwords?
o	Strong passwords are hard to remember and often reused.
o	Passwords can be stolen during server breaches.
o	Passwords are vulnerable to replay attacks and phishing.
•	How does it work?
o	Uses asymmetric cryptography: a public-private key pair instead of passwords.
o	Keys are generated either in hardware (TPM chip) or software depending on settings.
o	The user’s identity provider (like Active Directory or Azure AD) links the public key to their account.
o	The private key never leaves the device, improving security.
o	Logging in requires something you have (device with private key) and something you know or are (PIN or biometrics).
o	Biometric data and PINs are stored only locally and never sent to servers.
•	Summary:
This method offers strong, two-factor authentication without the risks of passwords.

FIDO2
•	What is FIDO2?
An open standard by the FIDO Alliance designed to enable passwordless authentication using external or built-in security keys.
•	How does it work?
o	Users register a security key (like a USB device, Bluetooth, or NFC token).
o	When signing in, they use this key instead of a password.
o	It’s phishing-resistant because authentication involves cryptographic proof that can't be intercepted and reused.
•	Why use FIDO2?
It’s secure, easy to use, and removes the risks associated with password theft or reuse.

Key-Based Authentication (for servers)
•	How to login without passwords?
Use public-private key pairs:
o	The public key is placed on the server.
o	The private key stays safe on the client’s side.
o	When connecting, the server verifies the client’s private key without the need for a password.
•	Setup:
o	Generate key pairs (e.g., using ssh-keygen).
o	Add public key to server’s authorized keys file.
o	Use the private key when connecting.

Handling Account Brute Forcing
•	Use methods like:
o	Account lockout policies (lock account after too many failed attempts)
o	IP restrictions to limit where logins can come from
o	Tools like fail2ban that block repeated failed login attempts
o	Commercial security tools for advanced protection

Three Ways to Authenticate a Person
1.	Something you know — like a password or PIN
2.	Something you have — like a security token, smart card, or phone
3.	Something you are — biometrics such as fingerprints, face recognition, or iris scans

Defending Against Multiple Login Attempts
•	Implement account lockout policies: after a number of failed attempts, the account temporarily locks, preventing further guesses.

Most Secure Authentication Methodology
•	Multi-factor authentication (MFA) is the most secure because it combines two or more factors from the three types above, making it much harder for attackers to compromise accounts.
•	For example, Windows Hello for Business or FIDO2 combines something you have (device key) and something you are (biometrics) or know (PIN), offering strong security without relying on passwords.

If you want, I can help explain any part further or make a step-by-step guide for any of these!




Something You Know (Passwords, PINs, Security Questions)
What is it?
This is the most common way to verify someone's identity by asking them to provide something they know, like a password, PIN, or answers to security questions.

Password-Based Authentication
•	Why is it popular?
Because it’s simple to use and easy for developers to implement. It doesn't need extra hardware or complex setups.
•	Advantages:
o	Works everywhere and is supported by all systems.
o	No special equipment or external services needed.
o	Easy for users and developers to handle.
•	Disadvantages:
o	Many users choose weak or easy-to-guess passwords.
o	People often reuse the same password across many sites, increasing risk.
o	Passwords can be stolen through phishing attacks (tricking users into revealing them).
•	Note:
PINs or “secret words” are basically the same as passwords — just shorter or simpler. Using two different passwords or PINs does not count as multi-factor authentication (MFA).

Security Questions
•	What are they?
These ask users to answer personal questions (like "What is your mother's maiden name?") to prove their identity.
•	Advantages:
o	Easy to implement and understand.
•	Disadvantages:
o	Answers can often be guessed or found online (e.g., social media).
o	Users may forget their answers over time.
o	Answers are just like passwords and vulnerable to phishing.
o	Must be chosen carefully to balance security and memorability.

Summary
•	Passwords, PINs, and security questions are all examples of "something you know" authentication.
•	They are simple and widely used but have important security weaknesses.
•	To improve security, these should ideally be combined with other authentication methods (like something you have or something you are) in multi-factor authentication (MFA).

If you'd like, I can help you understand how to create stronger password policies or explore better authentication methods!



Something You Have (Possession-Based Authentication)
This means the user proves who they are by showing they have something physical or digital — like a hardware token, a certificate, a phone, or a security key. This second factor adds a layer of security because even if a password is stolen, the attacker still needs this item to access the account.

Key Points:
•	It can be a physical item (hardware token, smartcard),
•	A digital item (certificate, private key),
•	Or based on owning a device like a phone (using SMS codes or apps).
•	It’s more secure but requires users to carry or have access to the device or token.
•	Some users without mobile devices may find it hard to use certain methods.

Common Types of “Something You Have” Authentication:

1. Hardware OTP (One-Time Password) Tokens
•	Small physical devices that generate a new numeric code every 30-60 seconds (e.g., RSA SecureID).
•	Pros:
o	Very hard to hack remotely because it’s a separate device.
o	No phone required.
•	Cons:
o	Expensive and complicated to distribute.
o	If lost, replacement takes time.
o	Stolen tokens can be misused without PINs.
o	Some backend systems are required, which can be a weak point.
o	Can still be phished (but codes expire quickly).

2. Software TOTP Tokens
•	Apps (like Google Authenticator) on phones generate codes similar to hardware tokens.
•	User scans a QR code once to set up, then app generates codes every 30-60 seconds.
•	Pros:
o	Cheaper and easier to deploy than hardware tokens.
o	Users can quickly set up or replace app.
o	Many users already have these apps.
o	If phone is locked, codes are safer from thieves.
•	Cons:
o	Phones can be hacked or lost.
o	Sometimes the authenticator app is on the same device used for login, reducing security.
o	Users might store backup codes insecurely.
o	Not all users have compatible phones.
o	If phone battery dies or is lost, they can’t log in.
o	Still vulnerable to phishing (but short-lived codes help).

3. Hardware U2F Tokens
•	USB or NFC devices that use a button press or tap to authenticate without typing codes.
•	Use cryptographic challenge-response, making phishing very hard.
•	Pros:
o	Very secure and phishing resistant.
o	Easy for users—just press a button.
•	Cons:
o	Physical tokens have cost and management challenges.
o	If stolen, can be used without PIN.
o	Users often forget or lose them.

4. Digital Certificates
•	Files (usually X.509 certificates) stored on the user’s device that automatically verify identity.
•	Widely supported by browsers and systems.
•	Pros:
o	No need for physical tokens.
o	Easy once installed; no user action needed each time.
o	Central management and easy revocation possible.
o	Resistant to phishing.
•	Cons:
o	Requires complex backend infrastructure (PKI).
o	Installing certificates can be hard for users.
o	Some enterprise setups interfere with certificates (like SSL-decrypting proxies).
o	If device is hacked, certificates can be stolen.

5. Smartcards
•	Physical cards with chips that hold digital certificates and require a PIN.
•	Used mostly for OS login, rarely for web apps.
•	Pros:
o	Cannot be used if stolen without PIN.
o	Can be used across multiple systems.
o	Resistant to phishing.
•	Cons:
o	Expensive and complex to manage like hardware tokens.
o	Not well supported by modern browsers.
o	Many personal computers don’t have smartcard readers.
o	Requires backend PKI systems.

6. SMS and Phone Calls
•	Send a one-time code to the user’s phone via SMS or a voice call.
•	User enters the code to verify identity.
•	Pros:
o	Easy to implement.
o	Users only need a phone number.
•	Cons:
o	Needs mobile coverage or a landline.
o	Costs money and can be abused by attackers requesting many codes.
o	Vulnerable to SIM swapping and interception attacks.
o	Codes can be received on the same device used to log in.
o	Susceptible to phishing.

7. Email Verification
•	Send a code or link to user’s email to confirm identity.
•	Pros:
o	Very easy to implement.
o	No special hardware or mobile device needed.
•	Cons:
o	Depends on email account security, which is often weak or without MFA.
o	If email is compromised, attacker can get in easily.
o	Email may be accessed on the same device used for login.
o	Susceptible to phishing.

Summary:
•	“Something you have” adds strong security by requiring possession of a device or token.
•	Hardware tokens and U2F keys provide very strong security but are costly and need management.
•	Software tokens (TOTP apps) are more convenient but have their own risks.
•	SMS and email are easier but less secure and vulnerable to attacks.
•	Certificates and smartcards offer strong security but need complex infrastructure.
________________________________________
Would you like me to explain how these fit together with other factors like biometrics or "something you know"?


Something You Are (Biometric Authentication)
This factor uses physical traits of the user to confirm their identity. These traits are unique to each person and include things like fingerprints, face shape, iris patterns, or handprints. This type of authentication is called biometrics.

Common Types of Biometrics:
•	Fingerprint scans
•	Facial recognition
•	Iris (eye) scans
•	Handprint scans

Pros:
•	When done well, biometrics are very hard to fake or copy — an attacker usually needs a very targeted and sophisticated attack.
•	You don’t need to remember anything or carry a device, since it’s based on your body.

Cons:
•	Users need to register their biometric data first, which requires special enrollment steps.
•	Often special hardware is needed to scan biometrics, which can be expensive and isn’t always available.
•	Most web browsers do not support biometrics natively, so extra software or apps are required.
•	There are privacy concerns, because biometric data is very sensitive personal information and must be stored securely.
•	If biometric data is stolen or compromised, it’s hard or impossible to change, unlike passwords.

Summary:
“Something you are” means using your unique physical features to log in. It is very secure but harder to implement because it needs special devices and raises privacy issues. It’s also not commonly used directly on websites due to these challenges.

Would you like me to explain how biometric authentication fits with other factors like passwords or tokens?


Location as an Authentication Factor
Location is sometimes considered as an additional factor in multi-factor authentication (MFA), but it’s not universally accepted as a true authentication factor. Instead, it’s often used to decide when to ask for MFA, rather than being an MFA factor on its own.
Examples:
•	Microsoft Azure Conditional Access uses location to decide if extra authentication is needed.
•	BitLocker’s Network Unlock also uses location information for security.

Location Details:
•	Access location means where the user is physically or network-wise when logging in.
•	Usually, the exact location of the app or service is not considered, since it doesn’t change.

Source IP Ranges
This uses the IP address you connect from as a “factor.” For example, only allowing logins from known office IP addresses.

Pros:
•	Easy for users — no extra steps needed.
•	Simple for administrators to set up and manage.
Cons:
•	Doesn’t protect if the user’s computer is already hacked.
•	Doesn’t stop a bad employee inside the company.
•	IP ranges need careful management — e.g., if guest Wi-Fi shares corporate IP range, security is weakened.

Geolocation
Instead of exact IPs, it looks at the country or region of the IP address. This is less exact but can work better if IPs change often.

Pros:
•	Easy for users.

Cons:
•	Same as IP ranges: no protection if user’s device is compromised or insider threat.
•	Attackers can get IPs from trusted countries to bypass this.

Summary for Location Factor:
Location can help improve security by deciding when MFA is required, but it should not be the only factor trusted for authentication. It’s best combined with other MFA methods.


Implementing MFA
MFA means requiring users to prove their identity with more than one method during login, adding an extra layer of security.

Requirements for MFA in Microsoft Entra ID (Azure AD):
•	You need Microsoft Entra ID P1 or P2 license.
•	Only users with roles like Global Admin, Security Admin, Conditional Access Admin, or Authentication Policy Admin can manage MFA settings.

Microsoft’s Recommendation:
•	Use Conditional Access Policies to enable and manage MFA.

How Conditional Access Works:
•	You create rules that trigger extra verification steps based on certain conditions (like user, device, location).
•	Example: If login happens from an unknown location, require MFA.

Steps to Create a Conditional Access MFA Policy:
1.	Go to Microsoft Entra Admin Center
2.	Navigate to Protection > Conditional Access > New Policy
3.	Name the policy (e.g., “MFA_policy”)
4.	Assign the policy to specific users or groups to enforce MFA on them.

Summary:
Location-based checks help decide when to ask for MFA, but shouldn’t be the only security control. Enabling MFA with Conditional Access in Microsoft Entra (Azure AD) provides flexible, stronger protection.




