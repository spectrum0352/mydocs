# Firewall Management





# Administration

* Only authorized administrators can modify firewall rules.
* Firewall rules and connections should be reviewed periodically and removed if no longer needed.
* Users and application owners must be authorized for any firewall changes.

<!-- -->

* **Audit Logs:** Regularly review firewall logs to identify anomalies, unused rules, and false positives. Optimize firewall settings based on this data.
* **Firewall Updates:** Keep firewall software and firmware up-to-date to prevent vulnerabilities and maintain effectiveness.
* **Internal Modems:** Eliminate modems from the internal network as they pose a significant security risk and can bypass the firewall.
* **Application-Level Firewalls:** Ensure the operating system is secure before evaluating the application-level firewall due to their close relationship.
* **Use a centralized management system**. A centralized management system can help you to manage multiple firewalls for IoT devices more easily and efficiently.

Overall, the policy emphasizes the importance of regular monitoring, maintenance, and a thorough security assessment to ensure the firewall effectively protects the network.

**Encrypted Communications**

* All external communications (e.g., B2B) must use encryption methods like VPN, SSL, SSH to protect data.
* Secure key distribution is essential for encryption to work effectively.

**Enforcement and Compliance**

* All employees must follow security policies, including those related to firewalls. Violations can result in disciplinary action.
* Employees must report any security misuse or malpractice immediately.
* Contractors and third-party users must also comply with security policies.
* When outsourcing firewall management, the vendor must adhere to the organization's policies.

**Firewall Deployment and Management**

* Maintain consistent firewall policies across all devices in a distributed firewall setup.
* Secure policy transfers and host authentication using IPSec and cryptographic certificates.
* Implement a redundant firewall system for continuous operation.

**Firewall Administration Roles and Responsibilities**

* **Designated Firewall Administrators** and **Backup Administrators** are responsible for firewall management.
* All firewall modifications require approval from **IT Security**.
* Administrators must regularly review firewall rules and connections with application owners, removing obsolete entries.
* All requests for new firewall connections and rules require authorization from users, application owners, and the **Information Security Manager**.

**Firewall Access Control**

* **Logical access** to the firewall is restricted to Firewall Administrators, Backup Administrators, and the Information Security Manager. Other access is granted on a need-to-basis with IT Security approval.
* **Remote access** to the firewall is allowed only when necessary and must be secured with encryption if over an untrusted network.
* All access and privileges are approved by the Information Security Manager.
* Unused access and privileges must be removed promptly.
* Strong authentication (e.g., username and password) is required for firewall access.

**Automation**

* **Challenge:** Frequent firewall rule updates due to new technologies create a heavy workload for administrators.
* **Solution:** Automate firewall configuration changes to:

  * Streamline the change process.
  * Reduce human error leading to system failures.
  * Free up administrator time for higher-level security tasks.

**Rule Maintenance**

* **Challenge:** Network changes (new users, devices, services, applications) require constant firewall rule updates and reviews.
* **Solution:** Establish a regular maintenance schedule to:

  * Add new firewall rules.
  * Review and remove outdated rules.

Overall, effective firewall administration involves automating routine tasks, regularly maintaining firewall rules, and freeing up administrator time for strategic security initiatives.

**Identity and Access Management (IAM)**

* **User and Role Management:** Clearly defined roles with documented privileges, enforced through Role-Based Access Control (RBAC).
* **Authentication:** Strong authentication methods using encrypted cookies, avoiding persistent cookies and HTTP GET for credentials.
* **Authorization:** Granular authorization based on roles, preventing unauthorized access through parameter or cookie manipulation.

**Change Management**

* **Dedicated Roles:** Firewall managed by dedicated administrators and backups.
* **Approval Process:** All changes require IT Security approval. New firewall rules need additional approval from application owners and users.
* **Oversight:** Information Security Manager oversees the entire process.

**Physical and Logical Access**

* **Restricted Access:** Physical access to the firewall is limited, and it's housed in a controlled environment.
* **Authorized Personnel:** Logical access is restricted to authorized personnel only.
* **Secure Remote Access:** Remote access is approved and uses strong encryption.

**Additional Considerations**

* **Regular Reviews:** Periodically review and update firewall access controls.
* **Least Privilege Principle:** Grant user’s minimum necessary access.
* **Multi-Factor Authentication (MFA):** Consider implementing MFA for enhanced security.

Overall, the document emphasizes the importance of strong IAM practices, controlled access, and a robust change management process for effective firewall administration.

**Key points:**

* Clearly defined roles and responsibilities
* Strong authentication and authorization mechanisms
* Restricted physical and logical access
* Regular review and updates
* Adherence to least privilege principle
* Consideration of MFA for additional security

**SSL/TLS configuration**

**SSL/TLS** (Secure Sockets Layer/Transport Layer Security) is crucial for securing network communication. Firewalls play a vital role in managing and securing SSL/TLS traffic.

Key Considerations for SSL/TLS Configuration on Firewall:

**1. SSL/TLS Inspection:**

* **Decrypt and Inspect:** Firewalls can decrypt encrypted traffic, inspect it for threats, and then re-encrypt it before forwarding.
* **Performance Impact:** Decryption and re-encryption can impact performance, so it's essential to balance security needs with performance requirements.
* **Certificate Management:** The firewall needs appropriate certificates to decrypt and re-encrypt traffic.
* **Policy-Based Inspection:** Implement policies to define which traffic should be inspected and which should be bypassed.

**2. Cipher Suite Selection:**

* **Strong Cipher Suites:** Choose strong cipher suites that offer robust encryption and protection against vulnerabilities.
* **Avoid Weak Ciphers:** Disable or restrict weak cipher suites to enhance security.
* **Regular Updates:** Keep cipher suite lists updated to address emerging threats.

**3. Protocol Versions:**

* **TLS 1.3:** Prioritize TLS 1.3 as it offers improved performance and security compared to older versions.
* **Disable Older Versions:** Disable or restrict older, less secure protocols like SSLv3 and TLS 1.0/1.1.

**4. Certificate Management:**

* **Trusted Certificate Authorities (CAs):** Configure the firewall to trust only reputable CAs.
* **Certificate Revocation:** Implement certificate revocation checking to prevent communication with compromised certificates.
* **Certificate Expiration:** Monitor certificate expiration dates and renew them before they expire.

**5. SSL/TLS Termination:**

* **Load Balancing:** If terminating SSL/TLS at the firewall, ensure load balancing is configured to distribute traffic across multiple servers.
* **Performance Optimization:** Optimize firewall resources for SSL/TLS termination to avoid performance bottlenecks.

**6. Logging and Monitoring:**

* **Detailed Logs:** Enable comprehensive logging of SSL/TLS events to detect anomalies and security incidents.
* **Regular Monitoring:** Monitor SSL/TLS traffic for signs of attacks or vulnerabilities.

**Additional Considerations:**

* **Strict Transport Security (HSTS):** Implement HSTS to enforce secure connections and prevent downgrade attacks.
* **Perfect Forward Secrecy (PFS):** Utilize PFS to protect against key compromise.
* **OCSP Stapling:** Consider using OCSP stapling to improve certificate validation performance.

By following these guidelines and tailoring the configuration to specific security requirements, organizations can effectively protect their network traffic with SSL/TLS and mitigate potential risks.

General

* **Dedicated Server:** Isolate the firewall for optimal performance and security.
* **Least Privilege:** Grant minimal necessary access to users and applications.

Rule Management

* **Regular Reviews:** Periodically examine firewall rules to add, remove, or modify as needed.
* **Rule Order:** Prioritize rule evaluation for effective security:

  * Block spoofed addresses.
  * Allow specific user traffic.
  * Permit network management access.
  * Discard unnecessary traffic.
  * Alert on suspicious activity.
  * Log remaining traffic.
* **Customization:** Adapt general guidelines to specific organizational needs while maintaining essential protections.

Security

* **Updates:** Keep firewall software current with patches.
* **Network Segmentation:** Physically separate network segments using firewalls.
* **Routing Restrictions:** Disable loose and strict source routing.
* **Spoofing Prevention:** Block forged IP addresses, including private and illegal ones.

Additional Considerations

* **Refer to SANS Firewall Checklist:** For detailed guidance on blocking specific traffic types.
* **Beyond Firewalls:** Implement identity and access management (IAM) for enhanced security.

**Key Points:**

* Firewall placement, user access, and rule management are crucial for security.
* Rule order and customization are essential for efficient and effective protection.
* Regular updates, network segmentation, and spoofing prevention are vital security measures.
* Consider IAM for complementary security.

Network Zones

Network zones are a critical concept for secure firewall configuration. Here is a breakdown of best practices:

* **Grouping Devices:** Organize devices based on security needs. Create zones for servers, workstations, guests, etc.
* **Firewall Rules per Zone:** Apply specific firewall rules to each zone to control traffic flow between them.
* **Segmentation for Different Policies:** If user groups or network communities require different security levels, physically isolate them using network segmentation.

  * Place more permissive users/networks on separate subnets from the more secure ones.
  * All access from these subnets should comply with established firewall policies.
* **Internal Controls for Critical Systems:** Use internal firewalls or filtering routers for critical information, applications, and systems.

  * This provides access control, auditing, and logging capabilities.
  * Segment the internal network to enforce access policies defined by information owners.
* **Critical Server Protection:** Create a deny rule for traffic originating from external sources and destined for critical internal addresses.

  * Exceptions may exist based on organizational needs (e.g., web applications accessed via a DMZ).

Zone Transfers (Stateful Firewalls):

* Use packet filtering on UDP/TCP port 53 to limit replies from the internal network for external DNS requests.
* Block unauthorized zone transfers from external sources.

FTP Servers

* **Isolate FTP Servers:** Place FTP servers on a separate network segment to protect the internal network.

VPN Security

* **VPN is Not a Guarantee:** Even with a VPN, compromised laptops can pose a risk to the corporate network.

Stealth Firewalls

* **Strengthen Credentials:** Reset default firewall credentials.
* **Network Awareness:** Configure firewall to recognize network segments.
* **Traffic Control:** Review and refine access control lists.
* **Connection Prevention:** Enable ACK bit monitoring to thwart unauthorized connections.

Identity Management

* **Centralized Authentication:** Integrate firewall with identity management systems for user authentication.

DMZ Security

* **Dual Firewalls:** Employ two firewalls for enhanced DMZ protection.
* **Firewall Diversity:** Utilize different firewall types in the DMZ.
* **Network Isolation:** Implement dual NICs on the web server.
* **Rule Separation:** Maintain distinct rule sets for each firewall.

Compliance

* **Policy Adherence:** Ensure firewall rules align with organizational security policies.

Intrusion Detection/Prevention Systems (IDS/IPS)

* **Threat Monitoring and Blocking:** Implement IDS/IPS to detect and prevent malicious network activity.

Maintenance

* **Rule Management:** Regularly review and update firewall rules to accommodate changes.
* **Firmware Updates:** Keep firewall software up-to-date for optimal security.

Change Management

* **Formal Process:** Establish a structured approach for managing firewall configuration changes.
* **Change Control:** Include change request submission, review, testing, deployment, validation, and documentation.

Backups

* **Regular Backups:** Create and store backups of firewall configurations, software, logs, and operating system files.
* **Secure Storage:** Maintain backups in a secure location with appropriate labelling.

Additional points:

* Firewall administrators periodically review firewall rules with application owners to ensure they are still valid.
* Any unused or invalid access privileges should be promptly removed.

Upgrades and Patches:

* Apply vendor-recommended firewall patches promptly with management approval.
* Evaluate the need for firewall upgrades and get approval before implementing.
* Verify proper firewall operation after any upgrades.

**Logs and Audit Trails:**

* Enable logging for firewall activity, audit trails, and system events.
* The Information Security Manager determines how often to review logs (based on criticality).
* Logs can be reviewed periodically for accountability or as needed for troubleshooting/forensics.
* An internal party (Security Manager) or independent party should review logs for accountability.
* Archive logs for a set period and then securely erase or overwrite the data.

Documentation:

* Document all firewall operational procedures (administration, backups, troubleshooting, log review, etc.).
* Document firewall configurations confidentially, including network diagrams, IP addresses, routing tables, and firewall rules.
* Update all documentation whenever the firewall configuration changes.

**Encrypted Channels:**

* Use encrypted channels (VPN/SSL/SSH) for communication between internal and external hosts on public or trusted networks.
* Securely distribute encryption keys before using encrypted channels.

Enforcement:

* All staff must comply with the firewall policy.
* Report any security violations or misuse of IT systems.
* Ensure contractors and authorized parties also comply with this policy.
* Outsourced vendors providing firewall services must ensure compliance with this policy.

<!-- -->

* **Use a centralized management system.** This can help you to manage multiple firewalls more easily and efficiently.
* **Document your firewall configuration**. This will help you to understand your configuration and make changes more easily in the future.
* **Have a disaster recovery plan**. This should include a plan for restoring your firewall configuration in the event of a failure.

Firewall Maintenance

* **Upgrade and Patch Management:** Regularly update firewall software and patches with management approval, verifying functionality post-upgrade.
* **Stateful Inspection:** Monitor firewall rules for accuracy in IP addresses, ports, and timeouts.
* **MAC Filtering (if applicable):** Restrict MAC addresses to authorized devices.

Security and Compliance

* **Change Management:** Establish a formal process for firewall rule changes, including security review, testing, and documentation.
* **Vulnerability Assessment:** Regularly scan for open ports and test firewall rules.
* **Physical Security:** Place the firewall in a restricted access area with environmental controls (e.g., air conditioning, UPS).

Additional Considerations

* **Vendor Verification:** Ensure downloaded updates originate from trusted sources.
* **Security Policy Adherence:** Firewall configurations should align with the organization's security policies.

Logging and Monitoring Best Practices

**Key Points**

* **Enable comprehensive logging:** Capture firewall activity, audit trails, and system-level events.
* **Protect sensitive data:** Avoid logging personal information, passwords, or other sensitive data.
* **Monitor connection attempts:** Log both successful and failed connection attempts.
* **Regularly review logs:** Establish a process for analyzing logs to detect anomalies, suspicious activity, and inefficient rules.
* **Session management:** Validate sessions on both ends, especially when sharing sessions between components.
* **Secure external connections:** Use HTTPS when making external connections with HTTPClient.

Additional Considerations

* **Log retention:** Determine an appropriate retention period for firewall logs based on regulatory and operational requirements.
* **Log disposal:** Implement secure methods for disposing of old logs, such as overwriting or physical destruction.
* **Role-based access:** Grant access to firewall logs only to authorized personnel.
* **Log analysis tools:** Consider using specialized tools to automate log analysis and detection of threats.
* **False positives:** Regularly review and adjust firewall rules to minimize false positives.

By following these guidelines, organizations can enhance their ability to detect and respond to security threats, optimize firewall performance, and maintain compliance with relevant regulations.

**Note:** The provided information focuses on general firewall logging and monitoring best practices. Specific implementation details may vary depending on the firewall platform and organizational requirements.

[https://techcommunity.microsoft.com/t5/azure-network-security-blog/enabling-central-visibility-for-dns-using-azure-firewall-custom/ba-p/2156331](https://techcommunity.microsoft.com/t5/azure-network-security-blog/enabling-central-visibility-for-dns-using-azure-firewall-custom/ba-p/2156331)

System Backup

* **Regularly backup firewall configuration:** This includes firewall software settings (rules, policies, network objects), operating system configurations, and network definitions (routing tables, hostnames).
* **Backup firewall logs:** Preserve firewall and operating system logs for incident investigation and forensic analysis.
* **Secure backup storage:** Store backup media in a secure location and label them appropriately.

By following these guidelines, organizations can protect their firewall configuration and logs, enabling recovery from system failures and effective incident response.

Documentation

**Essential Documentation:**

* **Operational Procedures:** Detailed guidelines for administration, backup, troubleshooting, log review, and maintenance.
* **Configuration Details:** Securely stored information about network diagrams, IP addresses, routing tables, and firewall rules.

**Access Control:**

* Firewall configuration documents should be restricted to Firewall Administrators, Backup Administrators, and the Information Security Manager.

**Document Maintenance:**

* All documentation must be updated promptly after any firewall changes.



