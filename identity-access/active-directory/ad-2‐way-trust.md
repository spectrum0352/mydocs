AD: 2-Way Trust
Two-way trust in Active Directory
•	Two-way trust in Active Directory lets users in two domains access resources in each other's domain. Imagine it as a bridge for users and resources to flow between two domains. 
•	Users in either domain can access resources in other domain.
•	In a two-way trust, each domain trusts the other domain to authenticate its users and groups
•	Users in one domain can log on to computers in the other domain using their own domain credentials, and they can also access resources in the other domain, such as shared files and printers. 
 
Benefits:
•	Improved resource sharing and collaboration: Two-way trusts allow users in one domain to access resources in the other domain
•	Reduced administrative overhead by eliminating the need for users to create separate accounts in each domain.
 
Risks:
•	Increased complexity: Two-way trusts can increase the complexity of your Active Directory environment.
•	Increased security risk: Two-way trusts can increase the security risk of your Active Directory environment if they are not managed properly.
•	Overall, two-way trusts can be a valuable tool for organizations that need to share resources with each other. However, it is important to carefully consider the benefits and drawbacks of two-way trusts before implementing them in your organization.
 
Cyber-attack tactics: 
•	Increased attack surface of both domains, making them more vulnerable to cyberattacks. Attackers can exploit this trust relationship to gain access to resources in either domain.
•	Lateral Movement: Once an attacker gains access to one domain, they can leverage the two-way trust to move laterally within the other domain, escalating their privileges and gaining access to even more sensitive data and systems.
•	Misconfigurations: Improper configuration of trust relationships can lead to unintended consequences, such as granting excessive access permissions or creating security loopholes that attackers can exploit.
•	Complexity Management: Managing multiple trust relationships can become increasingly complex as the number of domains grows. This complexity can make it challenging to maintain proper security posture and identify potential vulnerabilities.
•	Replication of Security Issues: If one domain has security vulnerabilities, those vulnerabilities can be replicated to the other trusted domain, increasing the overall security risk.
•	Increased Denial-of-Service (DoS) Attack Potential: Two-way trusts can be exploited to launch DoS attacks by flooding one domain with authentication requests, causing performance degradation or service outages.
 
General Compensating controls to mitigate risks
•	Implement Least Privileges to perform their jobs, reducing potential impact of compromised account.
•	Regularly Assess Trust Relationships to ensure they are still aligned with business requirements and security policies.
•	Monitor and Audit Trust Activity: Implement monitoring and auditing mechanisms to detect suspicious activity or unauthorized access attempts within the trusted domains.
•	Segment Networks: Segment networks to isolate critical resources and limit the potential spread of attacks through trusted domains.
•	Implement strong password policies and multi-factor authentication (MFA) to protect against unauthorized access and credential theft.
•	Educate employees about security risks associated with two-way trusts and emphasize the importance of following security protocols.
•	Regularly Update Systems and Software: Keep all systems and software up to date with the latest security patches to minimize vulnerabilities that attackers can exploit.
 
AD specific Compensating controls 
•	Forest Functional Level: Ensure that both domains are operating at the same forest functional level (FFL). This ensures compatibility and consistent security features across the trusted domains.
•	Domain Functional Level: Maintain the same domain functional level (DFL) across the trusted domains. This ensures that both domains share the same security features and capabilities.
•	Group Policy Objects (GPOs): Implement consistent Group Policy Objects (GPOs) across the trusted domains to enforce uniform security policies and configurations.
•	Account Permissions: Grant users only the minimum account permissions necessary to perform their tasks within the trusted domains. Avoid granting domain admin privileges to non-administrative users.
•	Service Account Management: Manage service accounts with care, granting them only the minimum permissions required to perform their functions. Regularly review and audit service account privileges.
•	Privileged Access Management (PAM): Implement a Privileged Access Management (PAM) solution to control and monitor privileged account access within the trusted domains.
•	Access Control Lists (ACLs): Use ACLs to restrict access to sensitive resources and limit communication between domains to authorized users and services.
•	Kerberos Constrained Delegation: Utilize Kerberos Constrained Delegation (KCD) to grant users the ability to perform specific tasks within the trusted domains without granting them full domain admin privileges.
•	Auditing and Logging: Enable comprehensive auditing and logging for all trust-related activities, including authentication requests, access attempts, and trust relationship changes.
•	Regular Security Assessments: Conduct regular security assessments to identify and address vulnerabilities within the trusted domains, paying particular attention to trust-related configurations and permissions.
 
