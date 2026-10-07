QnA

RISK – What is Risk and how does it differ from a Vulnerability or a Threat?
Risk refers to the potential loss or impact that can occur when a vulnerability is exploited by a threat. It represents the likelihood and consequence of an adverse event affecting systems or data.
While related, these terms differ:
•	Threat is anything that can exploit a vulnerability.
•	Vulnerability is a weakness or gap in protection that could be exploited.
•	Risk is the result of a threat exploiting a vulnerability, often expressed as:
Risk = Threat × Vulnerability × Impact
Think of risk as the combination of the possibility of something bad happening and the consequences if it does—especially if no action is taken to mitigate it.

VULNERABILITY – What is a Vulnerability?
A vulnerability is a flaw, weakness, or absence of a control in a system that could be exploited by a threat. It can be due to software bugs, misconfigurations, weak passwords, or missing updates.
Example: A secure system that allows users to set weak passwords—such as "1234"—has a vulnerability. If an attacker guesses the password, they can gain unauthorized access.

THREAT – What is a Threat?
A threat is any circumstance or event with the potential to cause harm to a system or data. Threats can be intentional (e.g., hackers, malware) or unintentional (e.g., human error, natural disasters).
Examples:
•	A zero-day exploit targeting an outdated service.
•	An untrained user with excessive privileges accidentally deleting sensitive files.

IDS – What does IDS stand for, and how would you explain it?
IDS stands for Intrusion Detection System. It monitors network or host activity to identify suspicious behavior or known attack patterns.
There are two main types:
•	Network-based IDS (NIDS): Monitors traffic on a network.
•	Host-based IDS (HIDS): Monitors activity on a specific device or server.
Note: IDS only detects intrusions—it does not block or respond to them.

IPS – What does IPS stand for, and how would you explain it?
IPS stands for Intrusion Prevention System. Like an IDS, it monitors and detects suspicious activity—but it also takes action to block or prevent threats in real time.
Actions might include:
•	Blocking IP addresses
•	Dropping malicious packets
•	Resetting connections
An IPS is often placed in-line with network traffic to actively prevent attacks.

What is Encryption?
Encryption is a process that transforms readable data into an unreadable format using cryptographic algorithms. It ensures confidentiality and protects data from unauthorized access.
To reverse the encryption, a decryption key or algorithm is used.
Types of encryptions:
•	Symmetric encryption: Uses a single shared key (e.g., AES, 3DES).
•	Asymmetric encryption: Uses a public and private key pair (e.g., RSA, ECC).
•	Hybrid encryption: Combines both symmetric and asymmetric methods for secure and efficient data exchange.

What are some commonly used encryption algorithms today?
Asymmetric Algorithms:
•	RSA (commonly 2048-bit or higher)
•	ECC (Elliptic Curve Cryptography)
•	DSA (Digital Signature Algorithm)
Symmetric Algorithms:
•	AES (Advanced Encryption Standard)
•	3DES (Triple Data Encryption Standard)
•	Blowfish
•	Twofish

Hashing – What is Hashing?
Hashing is the process of applying a one-way cryptographic algorithm to data to produce a fixed-size string (hash value). It is primarily used to ensure data integrity by enabling the detection of changes or tampering.
Common hashing algorithms include:
•	MD5
•	SHA-1
•	SHA-2 (e.g., SHA-256)
•	Whirlpool

How is Hashing different from Encryption?
•	Encryption transforms data into an unreadable format to maintain confidentiality and can be reversed (decryption).
•	Hashing verifies data integrity through a one-way function and cannot be reversed.

XSS – What is Cross-Site Scripting (XSS)?
Cross-Site Scripting (XSS) is a vulnerability that allows attackers to inject malicious scripts (typically JavaScript) into web pages viewed by other users. The browser executes the script as if it were legitimate, potentially compromising user sessions or data.
Mitigation techniques include:
•	Input validation
•	Output encoding
•	Content security policies (CSP)
•	Web application firewalls (WAFs)

Black Hat, Grey Hat, and White Hat Hackers – What are the differences?
•	Black Hat Hackers: Malicious hackers who break into systems without permission for personal or financial gain.
•	White Hat Hackers: Ethical hackers authorized to test and secure systems.
•	Grey Hat Hackers: Operate without permission but without malicious intent—often disclosing vulnerabilities to organizations.

Firewall – What is a Firewall?
A firewall is a hardware or software-based security system that monitors, filters, and controls incoming and outgoing network traffic based on predetermined rules.
Types of Firewalls:
1.	Packet-Filtering Firewall: Filters traffic based on IP addresses, ports, and protocols.
2.	Circuit-Level Gateway: Monitors TCP handshakes to validate sessions.
3.	Application-Level Gateway (Proxy Firewall): Inspects traffic at the application layer and provides content filtering.
4.	Stateful Inspection Firewall: Tracks active sessions and analyses traffic state and context.
5.	Next-Generation Firewall (NGFW): Combines traditional firewall functions with additional features like IDS/IPS, deep packet inspection, VPN support, and malware protection.

TCP vs UDP – What are they?
•	TCP (Transmission Control Protocol): Connection-oriented, reliable, and ensures data delivery using acknowledgments and retransmission.
•	UDP (User Datagram Protocol): Connectionless, faster, and used for low-latency or real-time applications but does not guarantee delivery.


SIEM – What is a SIEM?
A Security Information and Event Management (SIEM) system aggregates, analyses, and correlates security data from multiple sources. It helps Security Operations Center (SOC) analysts detect and respond to threats in real time.

Common SIEM Solutions:
•	Splunk Enterprise Security
•	IBM QRadar
•	ManageEngine Log360
•	McAfee Enterprise Security Manager (ESM)
•	LogRhythm
•	Elastic Stack (ELK)
•	Wazuh (Open Source)

Zero-Day – What is a Zero-Day?
A Zero-Day is a vulnerability in software or hardware that is unknown to the vendor and has no available patch. Because there's "zero" time to prepare, these are often exploited before a fix is released, making them highly dangerous.

Network Scanning – What is Network Scanning?
Network scanning is the process of discovering active hosts, services, and vulnerabilities on a network. Common types include:
•	Host discovery
•	Port scanning
•	Vulnerability scanning
•	Network enumeration
Each scan varies in intensity and detail based on its purpose.

HTTP Response Codes – What are they?
HTTP response codes indicate the outcome of a request:
•	1XX – Informational
•	2XX – Success
•	3XX – Redirection
•	4XX – Client Error
•	5XX – Server Error

Why are HTTP codes useful to SOC Analysts?
They help analysts determine if a web-based attack was successful. For example:
•	A 200 OK might indicate a script was executed.
•	A 403 Forbidden shows blocked access.
•	A 500 Internal Server Error could suggest system misbehaviour or exploitation.
Understanding these codes supports incident investigation and response.

DoS vs DDoS – What are the differences?
•	DoS (Denial of Service): An attack where a single source floods a service to make it unavailable.
•	DDoS (Distributed Denial of Service): Like DoS but uses multiple systems (often a botnet) to launch a large-scale, distributed attack.
Both disrupt services but DDoS is harder to mitigate due to its scale.

Web Architecture – Describe a basic Web Architecture.
A basic web architecture typically includes:
•	Front-End (Client/Web Server): Handles user interaction and serves web content.
•	Application Server: Processes business logic and connects the front-end to the back-end.
•	Database Server: Stores and manages data.
These components can be deployed:
•	On-premises (hardware/virtualized)
•	In the cloud (e.g., AWS, Azure)
•	Serverless (functions-as-a-service for scalable compute)

False Positives vs False Negatives – What are they, and what is the difference?
These terms relate to event alerting in security monitoring:
•	A False Positive occurs when a security system triggers an alert for an event that is not actually malicious.
•	A False Negative occurs when a malicious event happens but is not detected or alerted by the system.

Which is more concerning for a SOC Analyst?
Both are important, but False Negatives are generally more concerning because they allow undetected threats to persist in the environment. These indicate a need for better tuning of detection systems to ensure accurate identification of malicious activity.

Red Team vs Blue Team – What are they?
•	Red Teams simulate real-world attackers to identify security weaknesses through offensive testing.
•	Blue Teams are defensive teams that monitor, detect, and respond to threats to protect systems and data.

Which team is more important?
Both are equally critical. A strong security posture relies on:
•	Red Teams to find and expose vulnerabilities proactively.
•	Blue Teams to continuously defend and respond to attacks.
There is also a Purple Team, which facilitates collaboration between Red and Blue Teams to improve overall security effectiveness.

Common TCP Ports – What should an Analyst know?
Key TCP ports to know:
•	80 – HTTP (Unsecure Web Traffic)
•	443 – HTTPS (Encrypted Web Traffic via TLS)
•	25 – SMTP (Email Sending)
•	21 – FTP (Unsecure File Transfer)
•	22 – SSH (Secure Shell)
•	23 – Telnet (Unsecure Remote Access)
•	53 – DNS (Domain Name System)
•	135 – MSRPC (Microsoft RPC Services)
•	139 – NetBIOS Session Service
•	143 – IMAP (Email Retrieval)
•	993 – IMAPS (Secure IMAP)
•	445 – Microsoft-DS (Directory Services)
•	3306 – MySQL Database
•	3389 – RDP (Remote Desktop Protocol)
•	5900 – VNC (Remote Access)
•	8080 – HTTP Proxy or Alternate Web Traffic

What are TCP port ranges?
•	0–1023: Well-known ports (reserved for standard services)
•	1024–49151: Registered ports (assigned for specific applications)
•	49152–65535: Dynamic or ephemeral ports (used for temporary connections)
Note: Ephemeral port ranges may vary by operating system.

Chain of Custody – What is it, and why is it important?
A Chain of Custody is a documented record that tracks the collection, handling, and transfer of evidence. It ensures the integrity and authenticity of evidence for legal or investigative use by documenting who handled it, when, where, what was collected, and why. Maintaining an accurate Chain of Custody is critical. Missing or incomplete information can render evidence inadmissible in court.

CIA Triad – What is the CIA Triad in cybersecurity?
The CIA Triad represents the three core principles of information security:
1.	Confidentiality – Ensuring only authorized individuals have access to information.
2.	Integrity – Ensuring data is accurate, consistent, and not tampered with.
3.	Availability – Ensuring information and systems are accessible when needed.

VLAN – What is a VLAN?
A VLAN (Virtual Local Area Network) is a logical segmentation of a physical network. It isolates traffic by grouping devices on separate broadcast domains, even if they are connected to the same physical switch. Devices in different VLANs require a router or Layer-3 switch to communicate.

Router – What is a router, and how is it different from a switch?
A Router is a Layer 3 (Network Layer) device that routes traffic between different networks using IP addresses. It's responsible for forwarding packets and enabling communication across networks or VLANs.

What is a switch?
A Switch is a Layer 2 (Data Link Layer) device that connects devices within the same network using MAC addresses. Switches forward frames between ports and can segment traffic using VLANs. Some advanced switches also have Layer 3 routing capabilities.

What is a Security Framework?
A Security Framework is a structured set of guidelines, best practices, and standards designed to help organizations manage and reduce cybersecurity risks. These frameworks support the development of robust security policies, processes, and controls.

What are some common Security Frameworks?
•	NIST (National Institute of Standards and Technology) – Offers comprehensive frameworks like the Cybersecurity Framework (CSF).
•	CIS (Center for Internet Security) – Provides CIS Controls for prioritizing security measures.
•	ISO/IEC 27000 Series – International standards for managing information security (e.g., ISO 27001).
•	PCI-DSS (Payment Card Industry Data Security Standard) – Security standards for handling credit card information.
Each framework addresses specific use cases and industries but shares the common goal of improving organizational security.



Sandeep Jadhav 
Cloud Security Architect | Azure & Entra ID | Zero Trust & Risk-Based Security 
7972582145 | sandeepj0352@gmail.com | Pune, India
Cloud Security Consultant with 12 years of IT, Telecom, and Cyber Security experience, including 7 years in Azure Cloud Security. Strong expertise in Microsoft Defender for Cloud, Sentinel (SIEM), XDR, CSPM, vulnerability management, and Microsoft Entra ID. Proven track record of improving cloud security posture, enforcing security baselines, and remediating risks across enterprise Azure environments. Seeking roles in Cloud Security, Security Engineering, or Cybersecurity Operations.
 
Skills:
•	Cloud & Security Platforms: Microsoft Azure, Defender for Cloud, Defender XDR, Microsoft Sentinel (SIEM), Microsoft Purview, CNAPP, SIEM, SOAR, Zero Trust, EDR, CrowdStrike, KQL, Windows, Linux (RHEL), TCP/IP, IDS/IPS.
•	Azure Security & Architecture: Azure VMs, App Services, Key Vault, Storage Accounts, VNETs, NSGs, Azure Firewall, Application Gateway (WAF), Hub-Spoke topology, Azure Policy, Azure Monitor
•	Security Operations: Incident Response, Threat Detection, Threat Hunting, Security Hardening, Patch Management
•	Identity & Access Management: Microsoft Entra ID, Azure RBAC, PIM, Conditional Access, JIT Access, PAM
•	DevSecOps & Automation: Azure DevOps, Terraform, Azure CLI, Bash, Compliance as Code
•	GRC & Platforms: ISO 27001, NIST CSF, Risk Assessment, Internal Audit, Vulnerability Management
 
Certifications:
•	Microsoft Certified Azure Security Engineer Associate (AZ-500)
•	Microsoft Certified Security, Compliance, and Identity Fundamentals (SC-900)
•	Microsoft Certified Azure Fundamentals (AZ-900)
•	Certified Lead Auditor for ISO 27001:2022
 
Professional Experience:
Consultant, Amdocs India | Oct 2024 - Present
•	Performed Azure cloud security architecture reviews covering identity, network segmentation, and platform controls.
•	Conduct security assessments of Azure environments, reviewing configurations, RBAC, and security controls.
•	Define, enforce, and remediate Azure cloud security baselines aligned with industry best practices.
•	Design and enforce security policies for Azure Firewall, Virtual Machines, Key vaults, and Storage Accounts.
•	Perform Azure cloud security assessments and review security configurations and provide mitigation plan.
 
Expert Security Engineer, Altera Digital Health (Previously Allscripts) | Apr 2022 - Sep 2024
•	Managed vulnerability lifecycle including discovery, risk analysis, prioritization, reporting, and remediation tracking.
•	Coordinated remediation activities with development, Infrastructure teams to address identified vulnerabilities.
•	Create vulnerability reports and coordinate remediation activities with Development and IT teams.
 
Assistant Consultant, Tata Consultancy Services (TCS) | Aug 2021 - Apr 2022
•	Implemented Microsoft Entra ID (Azure AD) security configurations for enterprise cloud environments.
•	Designed and deployed Conditional Access policies to enforce adaptive authentication and Zero Trust access controls.
•	Implemented Privileged Access Management (PAM) and role-based access governance to secure administrative accounts.
 
Technology Analyst, Infosys Limited | Oct 2016 - Jul 2021
•	Microsoft 365 Compliance & Defender for Endpoint (Boston Private Bank Client, US)
•	Assess and implement Insider Risk Management using Microsoft Purview.
•	Support onboarding of on-premises Endpoints into Microsoft Defender for Endpoint (EDR).
•	Azure Security & Sentinel (Client Mobile Health, Switzerland)
•	Design and deploy Azure Key Vault, Log Analytics, Azure Firewall, Application Gateway, and WAF.
•	Implement Azure Security Center, remediate Azure security controls to improve overall cloud security posture.
•	Splunk SIEM & Infrastructure Monitoring (Airbus, Europe)
•	Develop real-time monitoring dashboards in Splunk for large-scale application environments.
•	Onboard Servers using Splunk and create SPL queries for dashboards, alerts, and operational reporting.
•	Administer Red Hat Enterprise Linux servers and develop Bash scripts for data extraction.
 
Customer Service Executive, Tata Communications Transformation Services Ltd | Aug 2014 - Sep 2016
Associate Engineer, Prompt Personnel Ltd | Oct 2013 - May 2014
Associate Engineer, Lobo Staffing Ltd | Mar 2013 - Sep 2013


