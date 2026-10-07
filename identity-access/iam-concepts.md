# Concepts of Identity and Access Management

1. Identity Concepts
   - Identity = digital representation of users, devices, or services.
   - Used to recognize who/what is interacting with a system.
   - Foundation for access control and security policies.

2. Identity as the Primary Security Perimeter
   - Traditional firewalls are no longer the main defense.
   - Identity is now the key boundary for access.
   - Driven by cloud, remote work, and Zero Trust models.
   - Secure access now depends on verifying "who" you are, not just "where" you're coming from.

3. Authentication
   - Confirms who you are.
   - Uses credentials like:
     - Passwords
     - Biometrics (fingerprint/face)
     - Multi-Factor Authentication (MFA)
   - Happens before access is granted.

1. Authorization
   - Decides what you're allowed to do.
   - Happens after authentication.
   - Based on roles, permissions, or policies.
   - Controls access to files, apps, and services.

1. Identity Providers (IdPs)
   - Services that manage and verify digital identities.
   - Examples:
     - Microsoft Entra ID
     - Google Identity
     - Okta
   - Help users log in across multiple platforms securely.

1. Active Directory (AD)
   - Microsoft service for managing users and devices.
   - Common in Windows environments.
   - Uses LDAP and Kerberos for authentication.
   - Allows centralized login and policy control.

1. Federated Services
   - Lets users log into different systems/orgs with one account.
   - No need to remember multiple passwords.
   - Uses protocols like:
     - SAML
     - OAuth
     - OpenID Connect

1. Access Management Overview
   - Controls who can access what.
   - Involves:
     - Authentication
     - Authorization
     - Policies and rules
   - Ensures only the right people can access specific resources.

1. Access Control Terms
   - Access Control List (ACL): List of permissions for a file/resource.
   - Access Control Matrix: Table showing who has what access.
   - Access Control Policy: Rules about who can access what.
   - Authorization: Grants or denies access based on identity.
   - PoLP (Least Privilege): Give only the access needed.
   - RBAC: Access based on job role.
   - DAC: Owner decides who can access their files.
   - MAC: System enforces strict access rules.
   - Conditional Access: Access depends on conditions (e.g., location).
   - Access Aggregation: Too many small permissions combine into too much access.
 
1. Authorization in Detail

- Decides:
    o What actions (read/write/delete)
    o What resources (files/apps/data)
    o What conditions (time, device, location)
- Uses roles and policies to enforce access.
- Part of Identity and Access Management (IAM).
 
1. Principle of Least Privilege (PoLP)

- Only give the minimum access needed.
- Helps reduce damage if an account is compromised.
- Prevents unnecessary or excessive access.
- Promotes better security hygiene.
 
1. Authorization vs. PoLP

- Authorization: Process of granting/denying access.
- PoLP: Goal to minimize access.
- Authorization enforces PoLP using roles, rules, and permissions.
 
1. Need-to-Know vs. Least Privilege

- Least Privilege:
    o Limits what actions a user can take (e.g., can’t delete files).
- Need-to-Know:
    o Limits what information a user can see (e.g., only relevant data).
- Both together provide strong data and access security.
 
1. Benefits of PoLP

- Reduced attack surface – limits damage from breaches.
- Compliance – meets regulations for data protection.
- Stronger security – fewer entry points for attackers.
- Simpler management – easier to audit and manage roles.
 
1. Example – Azure Role Assignment

- Choose scope (resource group, subscription, etc.).
- Assign role (e.g., Reader, Contributor).
- Assign to user or group.
- Can add conditions (like only from trusted devices).
- Ensures minimal, specific access – follows PoLP.
 
1. Types of Access Controls
- Conditional Access: Depends on device, location, etc.
- ABAC: Based on user, resource, and environment attributes.
- Rule-Based Access Control: Uses complex rules for access decisions.

You need to reset a password-protected UEFI configuration. What do you do?
How would you conduct a password audit?
Which one is more secure, a strong password or biometric authentication?
What is the most secure authentication methodology, why?
Password based authentication is disabled in your infrastructure. So how do you login to the servers?
· Use key-based authentication, it uses Public-Private key pairs. 
· Public key is added in the server configuration file.
· Private key is kept confidential on the client side. 
· Below listed is the procedure, to set up key-based authentication.
 
 
What are the various ways to handle account brute forcing?
Look for discussion of account lockouts, IP restrictions, fail2ban, commercial versions thereof, etc.
 
What are the three ways to authenticate a person?
· Something you know like password
· Something you have like token
· Something you are like biometrics
 
What can you use to defend against multiple login attempts?
You can create a lockout policy that locks accounts when a user has too many login attempts. 


· What is MAC, DAC and RBAC? Mandatory access control, discretionary access control and role-based access control. MAC uses the operating system to prevent a user from accessing a particular target. DAC restricts access to an object based on a user’s identity or group. RBAC denies or grants access based on a user’s role. 
· Explain file ACL’s permissions in Linux. What is the use of sticky bit? 
· What is RBAC? RBAC stands for Rule-based Access Control. A type of access control model which grants or denies access to resources based on ACL entries. Get live, expert ins 
· What is an ACL? àAn access control list. It is a list used to grant users and processes access to system resources. 
· What is MAC, DAC and RBAC? Mandatory access control, discretionary access control and role-based access control. MAC uses the operating system to prevent a user from accessing a particular target. DAC restricts access to an object based on a user’s identity or group. RBAC denies or grants access based on a user’s role. 
· Explain file ACL’s permissions in Linux. What is the use of sticky bit? 


· How to Elevate access to manage all Azure subscriptions and management groups?
· Azure ADà Properties à Access management for Azure resources à Select Yes and Save
· This way you will be assigned “User Access Administrator role” on all management groups or subscriptions.
 
· Why would you need to Elevate access?
· Regain access to an Azure subscription or management group when a user has lost access
· Grant another user or yourself access to an Azure subscription or management group
· See all Azure subscriptions or management groups in an organization
· Allow an automation app (such as an invoicing or auditing app) to access all Azure subscriptions or management groups

· What is MAC, DAC and RBAC? Mandatory access control, discretionary access control and role-based access control. MAC uses the operating system to prevent a user from accessing a particular target. DAC restricts access to an object based on a user’s identity or group. RBAC denies or grants access based on a user’s role.
· Explain file ACL’s permissions in Linux. What is the use of sticky bit? 
· What is RBAC? RBAC stands for Rule-based Access Control. A type of access control model which grants or denies access to resources based on ACL entries. Get live, expert ins 
· What is an ACL? àAn access control list. It is a list used to grant users and processes access to system resources.
· What is MAC, DAC and RBAC? Mandatory access control, discretionary access control and role-based access control. MAC uses the operating system to prevent a user from accessing a particular target. DAC restricts access to an object based on a user’s identity or group. RBAC denies or grants access based on a user’s role.
· Explain file ACL’s permissions in Linux. What is the use of sticky bit? 

Implementing least privilege access controls in the cloud
In my previous experience implementing least privilege access controls in the cloud, I focused on:

- Granular Permissions: Assigning roles with only required permissions needed for users to perform their tasks. (IAM in AWS/Azure, etc.).
- Just-in-Time Access: Granting temporary access for specific tasks instead of permanent permissions.
- Multi-Factor Authentication (MFA): Enforcing MFA for all cloud account access to add an extra layer of security.
- Regular Reviews: Periodically reviewing and adjusting user access privileges to ensure they remain aligned with current roles and responsibilities.
- Privilege Elevation Audits: Monitoring and auditing any instances where elevated privileges are used to ensure proper justification and prevent unauthorized access.