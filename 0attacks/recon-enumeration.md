# Enumeration



Enumeration
Enumeration is an active information-gathering phase of a cyberattack. In this phase, attackers establish direct connections with the target system and send specific queries to extract detailed information, such as network structure, user accounts, system services, and configurations. This data is then used to identify vulnerabilities and plan targeted attacks.
* •	Enumeration is the active reconnaissance phase, in this attackers probe systems for valuable information.
* •	It involves targeted interactions with the system to discover user accounts, services, configurations, and more.
* •	Preventing enumeration requires tight security controls, continuous monitoring, and awareness of common enumeration techniques.

What Attackers Do in Enumeration
* •	Actively connect to the target system.
* •	Send crafted queries to gather specific information.
* •	Identify potential weaknesses for exploitation.

Key Information Collected
* •	Network Resources (e.g., shared folders, routing tables)
* •	Audit & Service Settings
* •	DNS and SNMP Details
* •	Machine Names
* •	Usernames & Groups
* •	Installed Applications & Service Banners

Common Enumeration Techniques

Technique: Purpose
* Extract usernames from email IDs	Guess user accounts
* Default credentials	Exploit systems with unchanged passwords
* SNMP enumeration	Gather network and user data
* DNS Zone Transfer	Retrieve domain and network configuration
* Active Directory brute-force	Attempt login to internal services
* Extract user groups	Understand user privilege structure

Enumeration Tools
Tool
* NetBIOS & SMB	Collect information on shared files and services
* Enum4Linux	Linux-based enumeration tool for SMB, NetBIOS, and RPC
* Nmap with SMB NSE Scripts	Used to enumerate shares and users over SMB
* SMTP (VRFY command)	Validate existing email accounts
* Python Scripts	Automate enumeration tasks
* SNMPWalk	Extract SNMP data for network devices


**Enumeration in Intranet Environments**
Internal (intranet) networks are a popular target because they are often less protected. Attackers can exploit:
* •	Weak internal access controls
* •	Poor password policies
* •	Unpatched systems
* •	Misconfigured services

**Countermeasures **
* •	Enforce strong password policies
* •	Disable unused services and ports
* •	Regularly patch and update systems
* •	Use firewalls and access control lists to restrict access
* •	Monitor and log network traffic
* •	Deploy Intrusion Detection/Prevention Systems (IDS/IPS)
* •	Harden DNS and restrict zone transfers
* •	Configure SNMP with strong community strings or disable it

