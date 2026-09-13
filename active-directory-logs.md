### Active Directory Logs

Active Directory Log Categories and Descriptions:
•	Logon/Logoff Events:
o	Audits successful and failed logon attempts.
o	Includes detailed logon type information.
o	Covers logoff events.
o	Includes Account Lockout and Special Logon events.
o	Network Policy Server events.
•	Account Logon Events:
o	Tracks domain account activity on domain controllers.
o	Tracks local account activity on local devices.
o	Records authentication events.
o	Credential Validation.
o	Kerberos Authentication and Service ticket operations.
•	Object Access:
o	Audits access to objects: files, folders, registry keys, printers, etc.
o	Includes File System, Registry, SAM, File share access, and other object access events.
•	Policy Change Events:
o	Audits changes to user rights, auditing, and trust relationships.
o	Includes Audit, Authentication, and Authorization Policy changes.
•	Privilege Use:
o	Audits the use of user rights, including privileged services.
o	Includes Sensitive and Non-sensitive privilege use.
•	System Events:
o	Logs operating system events.
o	Indicates successful or failed loading of processes and drivers.
o	System Integrity, Security State changes, and other system events.
•	Account Management:
o	Audits Computer, Security Group, and User Account management.
•	Detailed Tracking:
o	Tracks Process creation and termination.
•	Directory Service Access:
o	Logs Active Directory service operations.
o	Records authentication and privilege modifications.
o	Directory Service changes and replication.
•	Replication Event Log:
o	Tracks Active Directory replication attempts (successes, failures, conflicts).
•	DNS Event Log:
o	Records DNS activities on domain controllers, including queries, updates, and errors.
•	DHCP Event Log:
o	Logs DHCP events on domain controllers, such as IP address lease requests, renewals, releases, and errors.
•	Active Directory Certificate Services (ADCS) Logs:
o	ADCS Audit Log: Tracks certificate issuance, renewal, and revocation.
o	ADCS Enrolment Log: Logs user certificate requests and enrolment errors.
•	Active Directory Federation Services (ADFS) Logs:
o	ADFS Audit Log: Records authentication and authorization requests and responses.
o	ADFS Token Log: Tracks token issuance, renewal, and validation.
•	Security Event Log (SEL):
o	Focuses on security events like authentication, authorization, user/group changes, object permission changes, security/audit policy changes, and Kerberos/LDAP/Group Policy/Certificate Services events.
•	Directory Service Event Log (DSE):
o	Captures events related to Active Directory itself, including user/group changes, object permission changes, security/audit policy changes, and Kerberos/LDAP/Group Policy events.

Analysis of auditpol /get /Category: * Output:
•	The provided output displays the current audit policy settings.
•	Many categories, such as "Object Access" and "Privilege Use," are set to "No Auditing," indicating those events are not logged.
•	Logon/Logoff success and failures, System Integrity, other System events, Policy Change successes, and Account Management successes are being audited.
•	To improve security monitoring, enabling auditing for more categories, particularly "Object Access" and "Privilege Use," is recommended based on organizational security needs.

Key Considerations:
•	Active Directory logs are crucial for security monitoring and incident response.
•	Proper configuration of audit policies is essential to capture relevant events.
•	Regular log review and analysis are necessary to detect malicious activity and policy violations.
•	Log management solutions streamline log collection, storage, and analysis.
•	Ingestion of AD logs into SIEM, XDR, and CSPM tools is important for security monitoring.

