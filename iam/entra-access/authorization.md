Authorization Fundamentals

Introduction
•	Analyze Azure role permissions 
•	Assign Azure roles
•	Configure Azure Key Vault RBAC and policies
•	Custom Azure roles
•	Managed identity
•	Use managed identities to access Azure resources

•	describe what conditional access is
•	describe uses and benefits of conditional access
•	describe the benefits of Azure AD roles
•	Manage secure access by using Azure AD
•	configure Azure AD Privileged Identity Management (PIM) 
•	implement Conditional Access policies, including multifactor authentication
•	implement Azure AD Identity Protection
•	implement Passwordless authentication
•	configure access reviews
•	Manage access control
•	configure Azure role permissions for management groups, subscriptions, resource groups, and resources
•	interpret role and resource permissions
•	assign built-in Azure AD roles
•	create and assign custom roles, including Azure roles and Azure AD roles


1.	Identity Concepts
Identity refers to the digital representation of users, devices, or services within a system. It serves as the foundation for access control and security policies.
2.	Identity as the Primary Security Perimeter
In modern security architectures, identity is considered the primary security perimeter, replacing traditional network-based perimeters. This shift is driven by the rise of cloud computing, remote work, and Zero Trust principles.
3.	Authentication
Authentication is the process of verifying an entity’s identity using credentials such as passwords, biometrics, or multi-factor authentication (MFA).
4.	Authorization
Authorization determines what resources an authenticated entity is allowed to access based on predefined permissions and policies.
5.	Identity Providers (IdPs)
Identity Providers are systems or services that manage and authenticate user identities. Examples include Microsoft Entra ID (formerly Azure AD), Okta, and Google Identity.
6.	Active Directory (AD)
Active Directory (AD) is Microsoft’s directory service used for managing users, computers, and policies within a Windows-based network. It enables centralized authentication and authorization through protocols like Kerberos and LDAP.
7.	Federated Services
Federated identity services enable authentication across multiple organizations or domains without requiring separate credentials for each. This is typically achieved using protocols like SAML, OAuth, and OpenID Connect.
8.	Common Identity Attacks
o	Phishing – Trick users into revealing credentials.
o	Credential Stuffing – Using leaked credentials to access accounts.
o	Pass-the-Hash – Exploiting hashed credentials to gain access.
o	Man-in-the-Middle (MitM) – Intercepting authentication traffic.
o	Brute Force Attacks – Repeatedly guessing passwords.
o	Session Hijacking – Taking over an authenticated session.
Would you like me to expand on any of these topics?


Concepts
Access Management encompasses the processes and technologies used to control who has access to what resources. It involves several key concepts:
•	Access Control: The mechanism that restricts access to resources based on predefined rules. This involves identification, authentication, and authorization of subjects (users, processes, etc.). It's implemented through hardware, software, and policies. Access Management is the overall process, while Access Control is the specific mechanism.
•	Access Control List (ACL): A list of permissions associated with a specific object (resource). It defines which subjects (users, groups, processes) can access the object and what actions they can perform (read, write, execute, etc.). Think of it as a column in an access control matrix.
•	Access Control Matrix: A table representing access rights. Rows represent subjects, columns represent objects, and each cell defines the access rights a specific subject has on a specific object. ACLs are essentially the columns of this matrix, while capabilities (permissions a subject has on various objects) are the rows.
•	Access Control Policy: High-level rules that govern access decisions. These policies define how access is managed and which subjects can access which objects under what circumstances.
•	Authorization: The process of granting or denying access to a resource based on a subject's identity and privileges. This happens after authentication (verifying who the subject is).
•	Principle of Least Privilege: A security best practice that dictates granting users only the minimum necessary privileges to perform their tasks. This limits the potential damage from unauthorized access or malicious activity.
•	Role-Based Access Control (RBAC): An access control model where access is granted or denied based on a user's role within the organization. This simplifies access management by grouping permissions into roles.
•	Discretionary Access Control (DAC): Access is restricted based on the owner's discretion. The owner of a resource can decide who has access.
•	Mandatory Access Control (MAC): The operating system enforces access rules based on security labels assigned to subjects and objects. Commonly used in high-security environments.
•	Conditional Access: Access is granted or denied based on meeting specific criteria (e.g., location, device, authentication method).
•	Access Aggregation: The accumulation of multiple, individually insignificant permissions, which, when combined, can grant a user excessive access rights. This can lead to privilege creep and be exploited by attackers. It's not a technique for granting access, but rather a risk associated with how access is managed.



Authorization

Authorization is the process of granting or denying access rights to a system entity (user, process, program) for specific resources. It answers the question "What is this entity allowed to do?" This includes determining:
•	Actions: What actions can the entity perform (read, write, delete, execute, etc.)?
•	Resources: Which files, data, applications, and systems can the entity access?
•	Conditions: Under what circumstances can the entity access these resources?

Authorization mechanisms evaluate the entity's attributes (roles, permissions, attributes) to make access decisions. It's a core component of Identity and Access Management (IAM) and is typically automated.

Principle of Least Privilege (PoLP) is a security best practice that dictates that every user, process, and program should only have the minimum privileges necessary to perform its designated tasks. It is about "need-to-have" access, not "nice-to-have." PoLP minimizes the potential damage from compromised accounts or malicious activity by limiting the scope of what an attacker can do, even if they gain access. It answers the question "What's the absolute minimum access this entity needs to function?"

Relationship between Authorization and PoLP:
Authorization is the mechanism by which PoLP is implemented. By carefully controlling access through authorization, organizations can ensure that entities only have the minimal set of permissions they require, thus adhering to PoLP. Authorization policies, roles, and permissions are the tools used to enforce PoLP.

Need-to-Know vs. Least Privilege:
While related, these are distinct concepts:
•	Least Privilege: Focuses on limiting capabilities (what actions can be performed). It's about giving the minimum necessary keys.
•	Need-to-Know: Focuses on limiting information access (what data can be viewed). It's about ensuring the keys only open the rooms absolutely necessary for the task at hand.
Together, they provide a strong defense. Least Privilege limits the potential damage from a compromised account, while Need-to-Know further restricts access to sensitive information, even within those limited capabilities.

Key Benefits of PoLP:
•	Reduced attack surface: Limiting privileges reduces the potential impact of a security breach.
•	Improved compliance: PoLP helps organizations meet regulatory requirements related to data security and privacy.
•	Enhanced security posture: By minimizing access, PoLP strengthens overall security.
•	Easier auditing and management: Clearly defined roles and permissions simplify access reviews and management.

Example (Azure Role Assignment):
Assigning Azure roles demonstrates PoLP. You identify the specific scope (resource group, subscription), choose the appropriate role (e.g., Reader, Contributor), select the user, and potentially add conditions. This ensures the user has only the necessary permissions at the right level, adhering to PoLP.



Types of Access Controls

Access controls are mechanisms that regulate access to resources and define permissible actions. 
•	Role-Based Access Control (RBAC): Access is granted or denied based on a user's role within an organization. Roles are assigned specific permissions, and users inherit those permissions.
•	Discretionary Access Control (DAC): The owner of a resource determines who can access it and their permissions. This is common in file systems.
•	Mandatory Access Control (MAC): The system enforces access control based on security labels assigned to users and resources, regardless of user roles.
•	Need-to-Know Access Control: Access is restricted to information essential for a user's job duties.
•	Logical Access Control: Automated systems control access to resources, including authentication (identity verification) and authorization (permission determination).
•	Conditional Access Control: Access dynamically adjusts based on conditions like device, location, or user behaviour.
•	Attribute-Based Access Control (ABAC): Access is granted based on attributes of the user, resource, and environment, enabling granular control.
•	Rule-Based Access Control: Access is enforced by predefined rules, which can be complex and consider multiple factors.

