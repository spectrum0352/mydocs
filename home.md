Welcome to the microsoft-entra wiki!

[Identity and Access Management with Microsoft Entra ID and Active Directory.docx](https://github.com/user-attachments/files/27312907/Identity.and.Access.Management.with.Microsoft.Entra.ID.and.Active.Directory.docx)

•	Access Aggregation:
Attackers gather many small pieces of harmless information from different places and combine them to get bigger access across multiple systems. This is often linked to privilege creep (when users get more access than they need over time).
•	Access Control:
This means limiting who or what can enter or use something—like a building, computer, or data.
•	Access Management:
The bigger process that includes setting up access rules, checking who people are, and keeping track of who accesses what.
•	Access Control List (ACL):
A list attached to a resource (like a file or folder) that says which users or groups can do what (read, write, run, etc.) on that resource.
•	Access Control Matrix (ACM):
A table showing all users and resources, detailing exactly what each user can do with each resource. It’s like a big permissions chart for the entire system.
•	Access Control Policy:
High-level rules that say how access should be controlled, who is allowed to access what, and under what conditions.
•	Microsoft Entra Dynamic Groups:
Groups that automatically add or remove users based on certain conditions like user attributes (for example, department or job title). Users are included only if they meet the group's criteria.
•	Microsoft Entra:
A cloud service that manages who can access what. It helps users log into external services (like Azure portal, Microsoft apps, or other SaaS apps). It also supports Single Sign-On (SSO), letting users access internal apps (like your company’s cloud apps or intranet) with one login.
•	Microsoft Entra and Azure Subscriptions:
Microsoft Entra manages identity and access for Azure resources. One Azure Active Directory (Azure AD) can be linked to many Azure subscriptions, making it easier for admins to manage access centrally.
•	OAuth:
A protocol that lets users prove their identity without sharing their password. Users get “tokens” (called bearer tokens) which third-party apps use to securely confirm the user’s identity and grant access.
•	Passwordless Authentication:
Logging in without using a password. Instead, users authenticate using tools like FIDO security keys, Microsoft Authenticator app, or Windows Hello (facial recognition, fingerprint, etc.).
•	Accountability:
Being able to trace every action back to the person or system that did it.
•	Auditing:
Recording all activities in a system or app to find technical problems or security breaches.
•	Authentication:
The process of verifying that someone is who they say they are.
•	Authenticator:
A device or app (like a security token or phone app) used to confirm a user’s identity.
•	Authorization:
Deciding if someone has permission to access or do something, based on their verified identity and roles.
•	Biometrics:
Using physical features like fingerprints or voice to identify someone.
•	CAPTCHA:
A test (like clicking pictures or typing letters) used to make sure the user is human, not a bot.
•	Federated Identity:
Using one set of login credentials to access multiple apps or devices, even across different organizations. Trust between systems in this setup may not always be two-way.
•	Identity:
A unique digital "fingerprint" that identifies a user, group, device, or app.
•	Identification:
The process of finding out or confirming the unique identity of a user or system from many possible identities.
•	Identity Management:
How identities (who you are) are created, stored, and managed.
•	Non-repudiation:
Ensures that once a party sends or receives a transaction, they cannot deny it later.
•	Principle of Least Privilege:
Users should only have the minimum access they need to do their job — nothing more. Authorization helps enforce this rule.
•	Single Sign-On (SSO):
A goal where users can log in once and access many different systems without logging in again. It’s not a product, but a concept.
•	Access Token:
A digital key used by a system to check if a user or app can access a resource or API.
•	Self-Service Password Reset (SSPR):
Allows users to reset their own passwords without needing help from IT.
•	Session Key:
Temporary keys created during secure connections (like SSH) to protect communication without sharing permanent keys.



Access Aggregation: Associated with privilege creep, this technique also functions as a reconnaissance tool by attackers to collect multiple pieces of non-sensitive data, which is combined to gain greater access across more systems. 
Access control is the act of limiting who or what can access something, like a building or computer system.
Access management is the bigger picture, which includes setting up the rules for access control, verifying identities, and keeping track of who tries to access what.
Access Control List (ACL):  A list associated with a specific resource that defines what actions (read, write, execute, etc.) different users or groups (subjects) can perform on that resource. It essentially functions as a set of rules determining whether someone or something has permission to access a specific resource and what they can do with it.
Access Control Matrix (ACM): A table-like structure where rows represent subjects (users, groups, processes) and columns represent objects (resources, files, programs). Each cell in the table defines the access rights a specific subject has for a specific object. It provides a comprehensive overview of all access permissions within a system, allowing you to see exactly what each user can do with each resource.
Access Control Policy: High-level security policy requirements specifying how access is managed and which subjects may access objects, information, resources and under what circumstances.
Accountability is tracing an action to a subject
Auditing: Any activity in the application/system should be audited (Identify technical issues/breaches)
Authentication is the process of verifying an identity to be legitimate or we can say it is the validation of an entity’s identity claim
Authenticator: A tool used to confirm user identity, such as a security token or app.
Authorization is the process of deciding whether to grant someone or something access to a system or resource. It involves checking their credentials and permissions to see if they have the right to perform a specific action.
Biometrics: Physical characteristics (fingerprint) or traits (voice) used for identification.
CAPTCHA: A challenge used to distinguish humans from automated bots.
Federated identity only one credentials are used to login multiple devices or applications. In Federated identity trust is not always bidirectional.
Identity refers to a unique identifier for a user, group, application, or device. It's like a digital fingerprint that allows verification and authentication.
Identification is the process of discovering this unique identity from a pool of similar entities. Imagine searching a database to find the specific user based on their credentials.
Identity management involves who you are and how that is recorded
Non-repudiation is one party of a transaction cannot deny having received a transaction, nor can the other party deny having sent a transaction.
Principle of Least Privilege is a security principle that states users should only be given the minimum permissions they need to perform their tasks.  Authorization helps enforce this principle by ensuring users do not have more access than necessary.
Single Sign On (SSO) is Goal not Product.
Access Token is a credential which is used by the system to check whether the API should be granted to a particular object or not.  
Self-service password reset (SSPR) allows users to reset or change their password without the assistance of IT team.
Session key are more commonly used in protocols like SSH (Secure Shell) where they are temporary keys generated during the connection establishment process. These keys provide an extra layer of security by eliminating the need to transmit the long-term secret key across the network.

Tools
•	NTFS Permissions Reporter – Easily audit folder permissions and see who has permissions to what. 
•	AD Cleanup Tool – Find inactive user and computer accounts, bulk move and disable accounts. 
•	Export Group Membership – Get all users group membership and export to a CSV file. 
•	User Unlock & lockout troubleshooter – Quickly find all locked users and the source of account lockouts. 
•	Bulk User Updater – Bulk update user account properties. Huge time saver


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


