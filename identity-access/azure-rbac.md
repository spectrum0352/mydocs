# Azure RBAC Policy
SOP for Principle of Least Privilege 

1. Purpose
•	To establish guidelines and procedures for implementing and managing Azure Role-Based Access Control (RBAC) in alignment with the principle of least privilege.
•	To ensure that users and groups have only the minimum necessary permissions to perform their assigned tasks.

2. Scope 
This SOP applies to all Azure resources and users within [Organization Name].

3. Roles and Responsibilities
•	Security Administrator: Responsible for creating and managing Azure RBAC roles and assignments.
•	Resource Owners: Responsible for identifying the minimum required permissions for their resources.
•	Users: Responsible for using their assigned permissions responsibly and avoiding unnecessary privilege escalation.

4. Procedures

4.1 Role Creation and Assignment
1.	Identify Required Permissions: 
o	Determine the specific actions and resources that a user or group needs to access.
o	Consider the least privilege principle and avoid granting unnecessary permissions.
2.	Create Custom Roles (if necessary): 
o	If built-in roles do not meet specific requirements, create custom roles with precise permissions.
o	Define a clear and concise role name and description.
o	Assign the necessary permissions to the role.
3.	Assign Roles to Users and Groups: 
o	Assign roles to users or groups based on their job functions and responsibilities.
o	Use Azure AD groups to efficiently manage role assignments for multiple users.
o	Consider using role-based access control (RBAC) to assign roles to service principals for automated tasks.



4.2 Regular Review and Re-evaluation
1.	Periodic Review: 
o	Conduct regular reviews of role assignments to ensure they remain appropriate.
o	Identify and remove any unnecessary permissions.
2.	Re-evaluate Permissions: 
o	When user roles or responsibilities change, re-evaluate, and adjust their permissions accordingly.
o	Consider using role expiration policies to automatically remove permissions after a certain period.

4.3 Monitoring and Auditing
1.	Monitor Access Activity: 
o	Use Azure AD sign-in logs and Azure Activity Log to monitor access to Azure resources.
o	Identify any unusual or suspicious activity.
2.	Audit Role Assignments: 
o	Regularly audit role assignments to ensure compliance with security policies.
o	Identify and address any unauthorized or excessive permissions.

5. Security Best Practices
•	Use the Principle of Least Privilege: Grant users and groups the minimum permissions necessary to perform their tasks.
•	Limit Administrative Privileges: Restrict administrative privileges to authorized personnel.
•	Implement Strong Password Policies: Enforce strong password policies to protect accounts.
•	Enable Multi-Factor Authentication (MFA): Require MFA for all privileged accounts.
•	Regularly Patch Systems: Keep systems and software up-to-date with the latest security patches.
•	Monitor for Threats: Use security tools to monitor for threats and vulnerabilities.
•	Conduct Regular Security Awareness Training: Educate users about security best practices.

6. Incident Response
•	If a security incident occurs, promptly investigate and take corrective action.
•	Revoke unnecessary permissions and disable compromised accounts.
•	Review and update security policies and procedures as needed.


7. User Groups with RBAC
Understanding User Groups and Default Access Groups
When structuring user groups in Azure, it is crucial to align them with your organizational structure and security requirements. Here is a suggested approach based on the teams you have mentioned:

DevOps: 
This group should consist of developers and operations engineers responsible for application development, deployment, and management.
•	Contributor role for resource groups, virtual machines, storage accounts, and other resources they need to manage.
•	Reader role for resources they do not need to manage.

<img width="422" height="109" alt="azure-rbac-policy" src="https://github.com/user-attachments/assets/aea87989-4d31-4481-8134-108170693421" />


Access management for Azure resources
Assign Azure roles
Custom Azure roles
Managed identity
Use managed identities to access Azure resources
Analyse Azure role permissions 
Configure Azure Key Vault RBAC and policies

 
 
Azure RBAC vs Microsoft Entra Roles

Azure Roles
•	User Access Administrator – highest access in Subscription/RG/Resource
•	Owner – Full access including assigning roles
•	Contributor – Full access, but excluding Role assignment
•	Reader – View all resource
•	Custom Role – Provide permissions as required.

Azure AD Roles
•	Global Administrator – Full access, 
•	User Administrator – manage user/groups, password change
•	Billing Administrator – Make purchase, Manage subscriptions, manage support tickets, service health.







Migration: 
This group should include individuals responsible for migrating workloads to Azure.
•	Contributor role for resource groups, virtual machines, storage accounts, and other resources related to migration.
•	Reader role for other resources.


Security: 
This group should comprise security analysts and engineers who monitor and protect Azure resources.
•	Reader role for most resources.
•	Owner or Contributor role for security-related resources like Security Center and Azure Monitor.
o	Reader role for most resources
o	Security Reader role for Security Center
o	Security Admin role for specific security operations


Network: 
This group should consist of network engineers who manage network infrastructure within Azure.
•	Contributor role for network resources like virtual networks, network security groups, and load balancers.
•	Reader role for other resources.


Default Access Groups:
•	Readers: This group can view Azure resources but cannot make changes.
•	Contributors: This group can create and manage Azure resources.
•	Owners: This group has full control over Azure resources, including the ability to delete them.

PIM for Production:
•	Privileged Identity Management (PIM): 
o	Use PIM to manage access to high-privilege roles like Owner.
o	Implement time-based access and justification workflows.
•	Just-In-Time Access: 
o	Grant elevated permissions only when needed, and revoke them as soon as the task is complete.
•	Role-Based Access Control (RBAC): 
o	Utilize RBAC to assign permissions based on roles and responsibilities.
o	Create custom roles with specific permissions if necessary.
•	Multi-Factor Authentication (MFA): 
o	Enforce MFA for all user accounts, especially privileged accounts.
•	Network Security Groups (NSGs): 
o	Configure NSGs to restrict network access to Azure resources.
•	Azure Security Center: 
o	Use Azure Security Center to monitor for threats and vulnerabilities.
•	Regular Security Assessments: 
o	Conduct regular security assessments to identify and address security risks.
•	Incident Response Plan: 
o	Have a well-defined incident response plan to handle security incidents.
By carefully designing user groups, assigning appropriate roles, and implementing robust security controls, you can effectively manage access to your Azure resources and protect your organization from security threats.


Administrators: 
This group includes individuals with overall administrative privileges.
•	Owner role for all resources



8. Best Practices
•	Least Privilege Principle: Always assign the minimum necessary permissions to users and groups.
•	Separation of Duties: Avoid assigning excessive privileges to a single user or group.
•	Just-In-Time Access: Use PIM to grant elevated permissions only when necessary.
•	Regular Review: Regularly review and update role assignments to ensure they align with current needs.
•	MFA: Enforce MFA for all user accounts, especially privileged accounts.
By using this simplified approach, you can manage user groups and role assignments more efficiently while maintaining a high level of security.





