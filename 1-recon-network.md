
# Network Reconnaissance and Vulnerability Analysis

**Network Reconnaissance**
Network reconnaissance is the initial phase of an attack where attackers gather information about a target network. This information helps identify vulnerabilities and plan attack strategies.

**Network Vulnerability Analysis**
Network enumeration is the process of discovering hosts, services, and vulnerabilities on a network. It is a crucial step in penetration testing and security assessments.

**Network Scanning**
Network scanning is the process of identifying active devices on a network and gathering information about them.

Nmap is a valuable tool for network administrators and security professionals, but it must be used responsibly and with proper authorization. Always prioritize network security and avoid causing harm or disruption.

---

# Information Gathered During Network Reconnaissance

The following information may be collected during reconnaissance activities:

* Domain names (internal and external) — Examples: `example.com`, `mail.example.com`, `corp.local`, `hr.internal.example.com`

* IP addresses and network blocks — Examples: `192.168.1.10`, `203.0.113.25`, `10.0.0.0/16`, `192.168.1.0/24`

* Network protocols in use — Examples: TCP, UDP, HTTP, HTTPS, DNS, SMB, LDAP, SSH, FTP, SNMP

* Rogue or private websites — Examples: `http://dev-test.local`, `https://fileshare-company.xyz`, unauthorized internal admin portal

* Running TCP and UDP services — Examples: TCP 22 (SSH), TCP 80 (HTTP), TCP 443 (HTTPS), UDP 53 (DNS), UDP 161 (SNMP)

* Authentication methods — Examples: Password authentication, Multi-Factor Authentication (MFA), Kerberos, NTLM, LDAP authentication, Smart Cards

* Access control mechanisms and ACLs — Examples: Firewall ACL allowing only `10.0.0.0/24`, Role-Based Access Control (RBAC), file permissions, network segmentation rules

* VPN access points — Examples: `vpn.example.com`, Cisco AnyConnect gateway, OpenVPN server, IPsec VPN concentrator

* Intrusion Detection Systems (IDS) status — Examples: Snort detected, Suricata alerts enabled, IDS blocking scan attempts

* Analog and digital telephone numbers — Examples: `+1-555-0100`, PBX extension `1001`, VoIP/SIP endpoint `sip.example.com`

* Operating systems and software versions — Examples: Windows Server 2022, Ubuntu 22.04, Apache HTTP Server 2.4.58, OpenSSH 9.3, Microsoft SQL Server 2019


---

# Network Footprinting

Network footprinting is the process of gathering information about a target system or network.

The process of identifying a target’s operating system and software versions is known as TCP/IP fingerprinting.

---

# Performing Network Reconnaissance Using Packet Analysis

Performing network reconnaissance using packet analysis involves a structured approach combining technical tools and analytical skills.

## 1. Planning and Scope Definition

### Define Objectives

* Determine the information to gather:

  * Network topology
  * Active hosts
  * Running services
  * Potential vulnerabilities
* Define the scope:

  * Specific network segment
  * Target IP address
  * Entire environment

### Legal and Ethical Considerations

* Ensure proper authorization before conducting reconnaissance.
* Comply with all applicable laws and regulations.

---

## 2. Packet Capture

### Choose a Capture Tool

* Wireshark — GUI-based packet capture and analysis
* tcpdump — Command-line packet capture utility

### Select the Capture Interface

* Identify the network interface carrying target traffic.

### Enable Promiscuous Mode (if required)

* Allows capturing all traffic on a network segment.

### Capture the Traffic

* Start capturing traffic for sufficient duration.
* Use capture filters to reduce unnecessary data and focus on:

  * IP addresses
  * Ports
  * Protocols

---

## 3. Packet Analysis

### Filtering and Decoding

* Use display filters in Wireshark to isolate relevant traffic.
* Decode packets to analyze:

  * Network layer
  * Transport layer
  * Application layer

### Network Layer Analysis

* Identify active hosts and topology using IP addresses.
* Analyze IP headers and routing behavior.
* Detect unusual or suspicious traffic.

### Transport Layer Analysis

* Identify open ports and running services.
* Analyze TCP and UDP communication patterns.
* Detect:

  * Port scanning
  * Reconnaissance activity

### Application Layer Analysis

Analyze protocols such as:

* HTTP
* DNS
* SSH
* LDAP
* SMB

Look for:

* Unencrypted credentials
* Information leakage
* Misconfigurations

### Identifying Anomalies

Look for:

* Excessive port scanning
* Unusual protocols or services
* Unexpected host communication
* Large data transfers

---

## 4. Documentation and Reporting

### Document Findings

* Record all relevant information gathered during reconnaissance.

### Create a Report

Include:

* Summary of findings
* Identified vulnerabilities
* Security risks
* Recommendations

---

# Common Tools Used in Network Reconnaissance

* Wireshark — Detailed packet analysis
* tcpdump — Command-line packet capture
* Nmap — Network scanning and enumeration
* whois — Domain registration information lookup
* arp — View and manipulate ARP tables

---

# Services and Ports Commonly Enumerated

| Port | Protocol | Service                                      |
| ---- | -------- | -------------------------------------------- |
| 22   | TCP      | Secure Shell (SSH)                           |
| 25   | TCP      | Simple Mail Transfer Protocol (SMTP)         |
| 53   | TCP/UDP  | Domain Name System (DNS)                     |
| 135  | TCP/UDP  | Microsoft RPC Endpoint Mapper                |
| 137  | UDP      | NetBIOS Name Service (NBNS)                  |
| 139  | TCP      | NetBIOS Session Service                      |
| 161  | UDP      | Simple Network Management Protocol (SNMP)    |
| 162  | TCP/UDP  | SNMP Trap                                    |
| 389  | TCP/UDP  | Lightweight Directory Access Protocol (LDAP) |
| 445  | TCP/UDP  | SMB over TCP                                 |
| 500  | UDP      | ISAKMP / Internet Key Exchange (IKE)         |
| 2049 | TCP      | Network File System (NFS)                    |
| 3268 | TCP/UDP  | Global Catalog Service                       |

---

# Network Scanning Challenges and Limitations

## Security Devices

Firewalls, routers, proxy servers, and other security devices can:

* Block scans
* Distort results
* Provide misleading information

Scanning remote hosts outside the local network may not always produce accurate results.

## Privilege Requirements

Some advanced scanning techniques require elevated privileges such as:

* sudo
* Administrator access

---

# Ethical and Legal Considerations

## Permission is Required

Scanning networks without authorization is illegal and may result in:

* ISP complaints
* Legal action
* Government investigation

Do not scan organizations such as:

* Federal Bureau of Investigation
* United States Secret Service

without explicit authorization.

## Respect for Systems

Aggressive scanning may:

* Crash systems
* Cause downtime
* Lead to data loss

Always use caution when scanning mission-critical systems.

---

# Scanning IP Blocks

Attackers may scan IP address ranges allocated to organizations to identify:

* Active hosts
* Services
* Vulnerabilities
* Network structure

Public IP addresses are often assigned in sequential blocks, making targeted scanning easier.

---

# Port Scanning

There are:

* 65,535 TCP ports
* 65,535 UDP ports

Port scanning helps identify:

* Open ports
* Running services
* Potential attack surfaces

---

# Useful Nmap Commands

### Display Host Networking and Routing Information

```bash
nmap --iflist
```

### Trace Packets for Connectivity Troubleshooting

```bash
nmap --packet-trace 172.16.1.10
```

### Scan Using a Specific Network Interface

```bash
nmap -e eth0 172.16.1.10
```

---

# Key Considerations

* Packet analysis can expose sensitive information.
* Handle captured data securely.
* Continuously update knowledge of:

  * Network protocols
  * Security practices
  * Emerging threats

By understanding reconnaissance techniques and tools, organizations can strengthen defenses and reduce the risk of information disclosure and unauthorized access.

📌 Overview
Network reconnaissance is the phase of penetration testing where testers (or attackers) gather information about the target’s network by scanning IP ranges and open ports. Port scanning is a primary method used in this phase to discover active services and potential vulnerabilities.

🧭 1. What is Port Scanning?
Port scanning is the process of probing a target system to identify open or active ports and the services running on them. These open ports may reveal critical information that can be exploited or used to strengthen security.
⚙️ Who Uses It?
•	Security Professionals – To assess firewall configurations, validate policies, and discover vulnerabilities.
•	Attackers – To identify weak points in a system for exploitation or mapping the network structure.
⚠️ Ethical Considerations
•	Legal Compliance: Unauthorized port scanning is illegal in many jurisdictions.
•	Responsible Use: Always scan systems you own or have permission to test.

🧪 2. Port Scanning Techniques
Technique	Description
Ping Scan	Identifies live hosts using ICMP ECHO requests
TCP Connect Scan	Attempts full TCP handshake to check if a port is open
TCP Half-Open (SYN)	Sends only SYN packets to identify open ports without completing the handshake
UDP Scan	Sends empty UDP packets to detect services running on UDP ports
Stealth Scans	Includes NULL, FIN, and XMAS scans to bypass firewalls and IDS
Strobe/Fragmented Scan	Sends small, fragmented packets to evade detection by network devices


🔌 3. Common Ports to Monitor
Port	Service
22	Secure Shell (SSH)
25	Simple Mail Transfer Protocol (SMTP)
53	Domain Name System (DNS)
135	Remote Procedure Call (RPC)
2049	Network File System (NFS)
...	(There are 65,535 TCP/UDP ports in total)
________________________________________
🛡️ 4. Port Scanning Countermeasures
To protect against malicious scanning in Azure or any environment:
•	✅ Firewalls & IDS/IPS:
o	Configure to detect and block unauthorized probes.
o	Use custom rule sets to restrict access to unused or sensitive ports.
•	🔄 Run Internal Tests:
o	Simulate port scans to ensure your defensive tools are detecting properly.
•	🔐 Patch Management:
o	Keep firewall, IDS, router firmware updated.
•	🌐 Network Filtering:
o	Block ICMP messages (e.g., echo replies, unreachable types).
o	Prevent bypass via source-routing or manipulated source ports.
•	🧱 Segmentation:
o	Use network segmentation and least privilege to limit attack surfaces.
•	🚫 Anti-Spoofing & Anti-Scanning:
o	Configure rules to block spoofed IPs and abnormal scan behavior.
________________________________________
🛠️ 5. Tools Commonly Used
•	Nmap: Advanced scanning with OS detection, scripting, and evasion.
•	PathAnalyzerPro: Helps identify network devices and paths.
________________________________________
✅ Summary
Port scanning is a critical reconnaissance technique—whether used for ethical security testing or by threat actors. In Azure environments, it's vital to monitor and restrict network exposure using:
•	Firewall/IDS rules
•	Regular vulnerability assessments
•	Responsible and legal usage policies
Always test your own systems and never scan without permission.

Azure-Specific Recon Tips
1.	Azure DNS Enumeration
o	Look up Azure-hosted domains using dig, nslookup, or dnsrecon.
o	Try zone transfers (AXFR) only if misconfigured (rare in production).
o	Check subdomains using tools like Sublist3r, Amass, or dnsx.
2.	Azure Services Discovery
o	Identify public IPs of services like App Services, SQL databases, VMs.
o	Use nmap to scan for open ports listed above.
o	Look for misconfigured storage accounts (e.g., .blob.core.windows.net).
3.	Azure VM Enumeration
o	Test SSH (port 22) for Linux VMs and RDP (port 3389, not in original list) for Windows VMs.
o	Use tools like nmap, masscan, or az vm list-ip-addresses (with Azure CLI, if internal).

When performing reconnaissance on Azure, especially for security assessments or penetration testing (with permission), it’s important to enumerate key services and ports used across Azure DNS, Azure services, and virtual machines (VMs).
________________________________________

🔧 Key Services and Ports to Enumerate

Port	Protocol	Service Name	Purpose
22	TCP	SSH (Secure Shell)	Remote login to Linux-based VMs
25	TCP	SMTP	Email sending services
53	TCP/UDP	DNS (Zone Transfer if allowed)	Name resolution, zone transfer checks
135	TCP/UDP	Microsoft RPC Endpoint Mapper	Windows RPC services
137	UDP	NetBIOS Name Service (NBNS)	Windows network name lookups
139	TCP	NetBIOS Session (SMB over NetBIOS)	File sharing on Windows
161	UDP	SNMP	Device and service monitoring
162	TCP/UDP	SNMP Trap	Receive alerts from SNMP-enabled devices
389	TCP/UDP	LDAP	Directory services, user lookups
445	TCP/UDP	SMB (Direct over TCP)	Windows file and printer sharing
500	UDP	ISAKMP / IKE	VPN negotiation (IPSec)
2049	TCP	NFS (Network File System)	File sharing in Unix/Linux environments


Firewall Evasion

Firewall Evasion Techniques during Network Reconnaissance
Firewall evasion techniques are used to bypass intrusion detection systems (IDS), intrusion prevention systems (IPS), and firewalls during reconnaissance. These methods aim to hide or disguise the source and intent of the scan.

Packet Manipulation Techniques

Technique	Description	Command
Fragment Packets	Splits TCP headers into small packets to evade detection.	nmap -f [target]
Set Specific MTU	Alters packet size to bypass filters expecting standard sizes.	nmap --mtu [value] [target]
Append Random Data	Adds extra data to packets to change their signature.	nmap --data-length [size] [target]
Bad Checksums	Sends deliberately malformed packets that some firewalls may ignore.	nmap --badsum [target]

🕵️ Obfuscation & Deception

Technique	Description	Command
Decoy Scanning	Uses decoy IPs to confuse defenders about the true source.	nmap -D RND:[number] [target]
Idle Zombie Scan	Uses a third-party "zombie" host to perform scans, hiding the attacker’s IP.	nmap -sI [zombie] [target]
Source Port Spoofing	Fakes the source port to mimic trusted services (e.g., port 53 for DNS).	nmap --source-port [port] [target]
MAC Address Spoofing	Fakes the MAC address to impersonate another device/vendor.	`nmap --spoof-mac [MAC

🔀 Randomization Techniques

Technique	Description	Command
Randomize Host Order	Scans targets in random order to avoid detection patterns.	nmap --randomize-hosts [target]

✅ Summary:
These Nmap-based firewall evasion techniques are critical for red teamers during reconnaissance in Azure environments, especially when facing network security mechanisms like Azure Firewall, NSGs, and third-party virtual appliances. However, these actions must be performed with proper authorization to avoid legal and ethical violations.
Let me know if you want this turned into a one-page visual reference or infographic.


NFS
•	Checking for Accessible mounts: showmount –e <IP>
•	Mounting: mount -t nfs [-o vers=2] <ip>:<remote_folder> <local_folder> -o nolock



The process of identifying a target’s operating system and software versions is known as TCP/IP fingerprinting

Network Scanning
Firewalls, routers, proxy servers, and other security devices can skew the results of an Nmap scan. 
Scanning remote hosts that are not on your local network may provide misleading information because of this. 
Some scanning options require elevated privileges. Like sudo command. 

Scanning IP Blocks
Attackers’ scans victim IP blocks to gather information that can be used during targeting. Public IP addresses may be allocated to organizations by block, or a range of sequential addresses.

Warnings
Scanning networks that you do not have permission to scan can get you in trouble with your internet service provider, the police, and possibly even the government. Do not go off scanning the FBI or Secret Service websites unless you want to get in trouble. 
Aggressively scanning some systems may cause them to crash which can lead to undesirable results like system downtime and data loss. Always scan mission critical systems with caution. 

Port Scanning
There are total 65535 TCP and 65535 UDP ports.
Firewalls, routers, proxy servers, and other security devices can skew the results of an Nmap scan. 
Scanning remote hosts that are not on your local network may provide misleading information because of this. 
Some scanning options require elevated privileges. Like sudo command. 

Warnings
Scanning networks that you do not have permission to scan can get you in trouble with your internet service provider, the police, and possibly even the government. Don’t go off scanning the FBI or Secret Service websites unless you want to get in trouble. 
Aggressively scanning some systems may cause them to crash which can lead to undesirable results like system downtime and data loss. Always scan mission critical systems with caution. 

# Network information to gather for pentest


Information to gather during network recon
1.	Access Control Mechanisms
o	Access Control Lists (ACLs)
o	Authentication methods
2.	Network Infrastructure
o	IP addresses and network blocks
o	Domain names (internal and external)
o	VPN access points
o	Network protocols in use (e.g., TCP, UDP, ICMP)
3.	Services & Systems
o	Running TCP and UDP services
o	Operating systems and software versions
o	Intrusion Detection Systems (IDS) status
4.	Telecommunications
o	Analog and digital phone numbers
5.	Web Assets
o	Rogue or private/internal websites


Techniques Used for Network Reconnaissance:
•	DNS Enumeration: Extracting information by querying DNS servers for zone transfers (if allowed).
•	SNMP Enumeration: Extracting usernames and other details using the Simple Network Management Protocol.
•	SMTP Enumeration: Techniques to gather information about email servers, potentially revealing usernames.
•	Port Scanning: Tools like nmap can scan a target network to identify open ports and running services.
•	Social Engineering: Tricking users into revealing information about the network.

Network Reconnaissance Tools:
•	nmap: A popular open-source tool for network scanning and enumeration.
•	whois: A command-line tool to query domain name registration information.
•	arp: A command-line tool to view and manipulate the Address Resolution Protocol (ARP) table.

By understanding network reconnaissance techniques and tools, organizations can take steps to harden their defenses and make it more difficult for attackers to gather information.

•	Display host networking configuration, general network, and routing information for the local system: >nmap - -iflist
•	Troubleshoot connectivity issues (Trace packets) by displaying summary of sent and received packets: >nmap - -packet-trace 172.16.1.10
•	Troubleshoot connectivity issues on specific network interface (et0/wlan0): >nmap -e eth0 172.16.1.10

# Recon ‐ SMB

Countermeasures for SMB Recon: 
•	Disable SMB protocol on Web and DNS Servers 
•	Disable SMB protocol on Internet facing servers 
•	Disable ports TCP 139 and TCP 445 used by the SMB protocol 
•	Restrict anonymous access through RestrictNullSessAccess parameter from the Windows Registry 
•	SMB (Server Message Block):
o	Disable on Unnecessary Servers: Disable SMB on web and DNS servers, as they typically don't require this protocol.
o	Restrict Internet Access: Disable SMB on internet-facing servers to minimize attack surface.
o	Block Ports: Block ports TCP 139 and TCP 445, which are used by SMB.
o	Limit Anonymous Access: Restrict anonymous access through the RestrictNullSessAccess parameter in the Windows Registry.
SMB Enumeration Countermeasures
●	Disable SMB protocol on Web and DNS Servers 
●	Disable SMB protocol on Internet facing servers 
●	Disable ports TCP 139 and TCP 445 used by the SMB protocol 
●	Restrict anonymous access from the Windows Registry 
 
# Recon ‐ DNS

DNS Footprinting
o	DNS footprinting is Collecting information about DNS zone data
o	Attackers can gather DNS information to determine key hosts in the network and can perform social engineering attacks.
o	DNS records provide important information about location and type of servers.
o	DNS Interrogation Tools: 
•	http://www.dnsstuff.com/
•	http://network-tools.com/
o	Name -> IP
o	IP -> Name
o	Service -> Name
o	DNS Records:
•	A: Maps host name to an IP address
•	MX: Points to domain's mail server
•	NS: Points to host's name server
•	CNAME: Canonical naming allows aliases to a host
•	SDA: Indicate authority for domain
•	SRV: Service records
•	PTR: (pointer) Maps IP address to a hostname
•	RP: Responsible person
•	HINFO: Host information record includes CPU type and OS
•	TXT: Unstructured text records
 
Using Search Engines:
o	Information obtained from WHOIS database assists an attacker to: Gather personal information to perform social engineering attacks.
o	WHOIS query returns: 
•	Domain name details
•	Contact details of domain owner
•	Domain name servers
•	NetRange
•	When a domain has been created
•	Expiry records
•	Records last updated
•	DNS Enumeration

Extract information using DNS zone transfer

DNS reconnaissance, also known as DNS footprinting, is the process of gathering information about a target network by querying the Domain Name System (DNS). This information can be crucial for attackers to:
•	Identify key network hosts: By analyzing DNS records, attackers can pinpoint critical servers like mail servers, web servers, and domain name servers within the target network.
•	Craft social engineering attacks: Information like domain owner contact details and domain creation date can be used to launch social engineering attacks, where attackers impersonate legitimate users to gain access or information.

Information Gathered Through DNS Reconnaissance:

DNS Records:
o	A (Address): Maps a hostname (e.g., [www.example.com](https://www.example.com/)) to an IP address.
o	MX (Mail Exchange): Points to the mail server(s) responsible for handling email for a domain.
o	NS (Nameserver): Specifies the authoritative nameservers for a domain.
o	CNAME (Canonical Name): Creates an alias for a hostname, pointing it to another hostname.
o	PTR (Pointer): Maps an IP address back to a hostname (reverse DNS lookup).
o	Other Records (SRV, RP, HINFO, TXT): Provide additional information like service location (SRV), responsible person (RP), hardware/OS details (HINFO), and unstructured text data (TXT).

WHOIS Information:
o	Domain name details (creation date, expiry)
o	Contact details of the domain owner (name, email, address)
o	Nameservers for the domain
o	Net range (geographical location)
o	Records last updated

DNS Interrogation Tools:
•	Online tools like http://www.dnsstuff.com/ and http://network-tools.com/ can be used to perform basic DNS lookups.
•	Command-line tools like dig and host are available on most operating systems.

Defending Against DNS Reconnaissance:
•	Limit Information in DNS Records: Avoid including sensitive details like contact information or server types in public DNS records.
•	Restrict Zone Transfers: Disable zone transfers on DNS servers to prevent attackers from obtaining complete network information.
•	Monitor DNS Traffic: Watch for unusual queries or suspicious activity related to your DNS infrastructure.
By understanding DNS reconnaissance techniques and implementing proper security measures, organizations can make it more difficult for attackers to gather valuable information about their networks.

Example:

NSLOOKUP
Resolve given hostname/URL to IP address: >nslookup example.com
Reverse DNS lookup: >nslookup -type=PTR IP_address

MX(Mail Exchange) lookup: >nslookup -type=MX domain

Zone Transfer: 
>nslookup 
server domain.com 
ls -d domain.com

Using HOST Command
host -t ns (Name Server) < domain >
host -t ns domain.com

After that test nameservers
host -l < domain > < nameserver >
host -l domain.com ns2.domain.com

Nmap DNS Enumeration
nmap -F --dns-server <dns server ip> <target ip range>

Auto tools
DNSenum: 
dnsenum targetdomain.com
dnsenum --target_domain_subs.txt -v -f dns.txt -u a -r targetdomain.com

DNSmap
targetdomain.com 
dnsmap targetdomain.com -w

Brute Force, the file is saved in /tmp
dnsmap targetdomain.com -r

DNSRecon DNS Brute Force
dnsrecon -d TARGET -D /usr/share/wordlists/dnsmap.txt -t std --xml ouput.xml

Fierce.pl
fierce -dns targetdomain.com

HostMap
hostmap.rb -only-passive -t <IP>
We can use -with-zonetransfer or -bruteforce-level

•	DNS Foot printing is Collecting information about DNS zone data 
•	Attackers can gather DNS information to determine key hosts in the network and can perform social engineering attacks. 
•	DNS records provide important information about location and type of servers. 
•	DNS Interrogation Tools: 
o	http://www.dnsstuff.com/
o	http://network-tools.com 
•	Name -> IP 
•	IP -> Name 
•	Service -> Name

Record 	Description 
A 	Maps host name to an IP address 
MX 	Points to domain's mail server 
NS 	Points to host's name server 
CNAME 	Canonical naming allows aliases to a host 
SDA 	Indicate authority for domain 
SRV 	Service records 
PTR 
(pointer) 	Maps IP address to a hostname 
RP 	Responsible person 
HINFO 	Host information record includes CPU type and OS 
TXT 	Unstructured text records 
 	


WHOIS query returns:
•	Domain name details 
•	Contact details of domain owner 
•	Domain name servers 
•	NetRange 
•	When a domain has been created 
•	Expiry records 
•	Records last updated 
Information obtained from WHOIS database assists an attacker to: Gather personal information to perform social engineering attacks. 
 
DNS Footprinting 


1. DNS Enumeration
•	Purpose: Gathering information about a target's DNS infrastructure.
•	Methods: 
o	DNS Zone Transfer (AXFR): 
	This technique attempts to retrieve a complete copy of a domain's DNS zone file from a DNS server.
	If successful, it reveals all hostnames, IP addresses, and other DNS records associated with the domain.
	This is a very powerful technique, but it's often disabled for security reasons.
	Tools: dig, nslookup.
	Example: dig axfr example.com @ns1.example.com
o	DNS Brute-forcing: 
	Trying common hostnames (e.g., www, mail, ftp) or using a wordlist to discover subdomains.
	Tools: dnsrecon, fierce.
o	Reverse DNS Lookup: 
	Mapping IP addresses to hostnames.
	Tools: dig -x, nslookup.
•	Information Extracted: 
o	Hostnames.
o	IP addresses.
o	Mail servers (MX records).
o	Name servers (NS records).
o	Other DNS records (A, AAAA, CNAME, TXT, etc.).


DNS Footprinting
DNS footprinting is Collecting information about DNS zone data
Attackers can gather DNS information to determine key hosts in the network and can perform social engineering attacks.
DNS records provide important information about location and type of servers.
•	Name -> IP
•	IP -> Name
•	Service -> Name

DNS Records:
•	A: Maps host name to an IP address
•	MX: Points to domain's mail server
•	NS: Points to host's name server
•	CNAME: Canonical naming allows aliases to a host
•	SDA: Indicate authority for domain
•	SRV: Service records
•	PTR: (pointer) Maps IP address to a hostname
•	RP: Responsible person
•	HINFO: Host information record includes CPU type and OS
•	TXT: Unstructured text records

Potential Information Leakage
While DNS records offer valuable insights, it is crucial to understand that they can also inadvertently reveal sensitive information. For example:
•	Subdomain Enumeration: By systematically trying different subdomains (e.g., [invalid URL removed], [invalid URL removed]), attackers can discover potential vulnerabilities or systems.
•	Service Discovery: DNS records can expose services running on a network, aiding attackers in identifying potential targets.
•	Internal Network Structure: Analysis of DNS records can sometimes reveal internal network structure, providing clues about network topology.
•	Social Engineering: Information gathered through DNS footprinting can be used to craft targeted social engineering attacks.

Mitigation Techniques
To protect against DNS footprinting, consider the following measures:
•	Restrict DNS Zone Transfers: Prevent unauthorized access to DNS zone data.
•	Limit DNS Record Information: Provide only essential information in DNS records.
•	Implement DNS Security Extensions (DNSSEC): Enhance DNS data integrity and authenticity.
•	Monitor DNS Traffic: Detect and respond to unusual DNS queries.
•	Employee Awareness: Educate employees about the risks of sharing sensitive information.

Tools for DNS Footprinting
Beyond nslookup and dig, there are several specialized tools for DNS footprinting:
•	Fierce: A popular tool for subdomain discovery and DNS reconnaissance.
•	Maltego: A graphical intelligence tool that can be used for DNS footprinting and correlation.
•	DNSRecon: A Python script for DNS reconnaissance.
•	ZMap: A tool for Internet-wide network discovery, which can also be used for DNS footprinting.

Practical Example
Let us illustrate DNS footprinting with a hypothetical scenario:
An attacker targets a company, example.com. They perform DNS footprinting and discover the following:
•	Multiple subdomains: [invalid URL removed], [invalid URL removed], [invalid URL removed]
•	MX record: points to an external mail server, suggesting potential email vulnerabilities
•	HINFO record: reveals outdated operating system information, indicating potential attack vectors
Based on this information, the attacker can:
•	Attempt to compromise the mail server
•	Exploit vulnerabilities in the outdated operating system
•	Launch targeted phishing attacks against employees
Additional Considerations
•	DNSSEC Validation: Ensure that DNSSEC is properly configured and validated to prevent DNS spoofing and data tampering.
•	Rate Limiting: Implement rate limiting on DNS queries to mitigate brute-force attacks.
•	Regular Audits: Conduct regular DNS audits to identify potential issues and vulnerabilities.
Would you like to delve deeper into a specific aspect of DNS footprinting, such as tools, mitigation techniques, or real-world examples?

o	DNS Interrogation Tools: 
•	http://www.dnsstuff.com/
•	http://network-tools.com/


Whois Footprinting through Search Engines:
WHOIS footprinting involves gathering information about a domain and its owner from the WHOIS database. This data can be accessed through search engines.

Information obtained:
•	Domain name details
•	Contact information of the domain owner
•	Domain name servers
•	Creation and expiration dates of the domain
•	Record update history

Potential misuse:
Attackers can use this information to:
•	Perform social engineering attacks by gathering personal details.
•	Identify potential targets for further attacks.

Mitigation:
Protecting personal information in WHOIS records and being aware of the risks is crucial to prevent misuse.

Network enumeration focuses on extracting specific details about a target network after the initial reconnaissance phase. Here's a breakdown of the techniques mentioned:
•	DNS Enumeration: This involves querying a DNS server for zone transfers. If permitted, it can reveal a wealth of information like internal hostnames, IP addresses, and subdomains within the target network.
•	Extracting Usernames from SNMP (Simple Network Management Protocol): SNMP is a protocol used for network device management. In some configurations, it might be possible to leverage SNMP to retrieve usernames or other user information from the target system. This can give attackers a foothold for further attacks.
Why are these techniques useful for attackers?
By using these techniques, attackers can gather valuable information about the target network, such as:
•	Usernames: These can be used in brute-force attacks or social engineering attempts.
•	Internal hostnames: This can help attackers identify critical systems within the network.
•	Network structure: Understanding the network layout allows attackers to target specific devices or services.
How can organizations defend against these techniques?
Here are some steps organizations can take:
•	Disable DNS zone transfers: This prevents attackers from obtaining detailed network information through DNS.
•	Secure SNMP configurations: Limit access to SNMP and restrict the information it reveals.
•	Implement strong password policies: Complex passwords make brute-force attacks more difficult.
•	Monitor network activity: Look for suspicious queries or unauthorized access attempts.

By understanding these enumeration techniques and implementing proper security measures, organizations can significantly reduce the risk of successful attacks.

# Countermeasures to DNS
•	Disable the DNS zone transfers to the untrusted hosts 
•	Make sure that the private hosts and their IP addresses are not published into DNS zone files of public DNS server 
•	Use premium DNS registration services that hide sensitive information such as HINFO from public 
•	Use standard network admin contacts for DNS registrations to avoid social engineering attacks 

o	Limit Zone Transfers: Disable zone transfers to untrusted hosts to prevent unauthorized information disclosure.
o	Protect Private Information: Don't publish private host IPs or sensitive details like HINFO in public DNS records.
o	Privacy Services: Consider premium DNS registration services that offer privacy features.
o	Standard Contacts: Use standard network admin contacts for DNS registrations to avoid social engineering attacks.
DNS Enumeration Countermeasures
•	Disable the DNS zone transfers to the untrusted hosts 
•	Make sure that the private hosts and their IP addresses are not published into DNS zone files of public DNS server 
•	Use premium DNS registration services that hide sensitive information such as HINFO from public 
•	Use standard network admin contacts for DNS registrations in order to avoid social engineering attacks 

# Recon ‐ NTP

 
NTP Enumeration 

Network Time Protocol (NTP) is a network protocol designed to synchronize the clocks of computer systems over a network. It uses UDP port 123 for communication and can achieve high levels of accuracy, especially in local networks.

Attackers can leverage NTP to gather valuable information:
•	Host Discovery: Identify devices connected to the NTP server.
•	IP Address Enumeration: Discover internal and external IP addresses.
•	OS Fingerprinting: Determine the operating systems of connected devices.

Common NTP Enumeration Tools:
•	ntptrace: Traces the path of NTP requests to the primary time source.
•	ntpdc: Monitors the NTP daemon and provides detailed information about its operation.
•	ntpq: Queries the NTP daemon for specific information and statistics.
By understanding NTP and its potential vulnerabilities, organizations can implement security measures to protect their networks from unauthorized access and information leakage.

•	Network Time Protocol (NTP) is designed to synchronize clocks of networked computers.
•	It uses UDP port 123 as its primary means of communication.   
•	NTP can maintain time to within 10 milliseconds (1/100 seconds) over the public Internet.
•	It can achieve accuracies of 200 microseconds or better in local area networks under ideal conditions.   
•	An attacker can query an NTP server to gather valuable information such as: 
o	List of hosts connected to the NTP server
o	Client IP addresses in a network, their system names, and operating systems
o	Internal IP addresses can also be obtained if the NTP server is in a DMZ.
NTP Enumeration Commands:
•	ntptrace:
o	Traces a chain of NTP servers back to the primary source.
o	Syntax: ntptrace [-vdn] [-r retries] [-t timeout] [server]
•	ntpdc:
o	Monitors the operation of the NTP daemon, ntpd.
o	Syntax: /usr/bin/ntpdc [-n] [-v] host1 | IPaddress1...
•	ntpq:
o	Monitors NTP daemon ntpd operations and determines performance.
o	Syntax: ntpq [-inp] [-c command] [host] [...]
Additional Notes:
•	Older NTP versions were vulnerable to monlist or similar commands within ntpq/ntpdc. These commands could return a list of the last 600 or so hosts that connected to the NTP server. Modern NTP servers should have these commands disabled by default, or be patched against this vulnerability.
•	NTP enumeration can be used to fingerprint operating systems based on the time offsets and other data returned by the NTP server.
•	Properly configured firewalls should block external access to NTP servers, except for necessary traffic.

# Recon ‐ NetBIOS

NetBIOS 

NetBIOS reconnaissance focuses on gathering information about devices and resources on a network using the NetBIOS protocol. NetBIOS is an older naming system primarily used in Windows environments.

Why is NetBIOS reconnaissance useful for attackers?
By exploiting NetBIOS, attackers can potentially obtain valuable information like:
•	List of computers: This helps attackers identify devices within the network.
•	Shared resources: Information about shared folders and printers on network machines.
•	Usernames and passwords: In some cases, weak configurations might reveal usernames or allow access through techniques like null sessions.

NetBIOS Name Format:
•	A unique 16-character string (15 for device name, 1 replaced with service/record type).

NetBIOS Enumeration Techniques:
•	Net view commands: These commands can be used to list shared resources on remote machines or within a workgroup.
o	Examples:
	net view \\<computername>
	net view /workgroup:<workgroupname>
•	Nbtstat utility: This Windows command-line tool displays NetBIOS statistics, name tables, and the name cache.
o	Examples:
	nbtstat.exe -c to view the local NetBIOS name cache.
	nbtstat.exe -a <IP address> to get the NetBIOS name table of a remote machine.

NetBIOS Enumeration Tools:
•	SuperScan: A tool that can scan for open ports and perform NetBIOS name resolution.
•	Hyena: A GUI tool for managing and potentially revealing shares and usernames on Windows systems.
•	Winfingerprint: A tool that can enumerate various details on a Windows machine, including users, shares, and open ports.
•	NetBIOS Enumerator and Nsauditor Network Security Auditor: Other tools specifically designed for NetBIOS enumeration.

Defending Against NetBIOS Reconnaissance:
•	Disable NetBIOS: If not required, consider disabling NetBIOS on systems to reduce the attack surface.
•	Secure Shared Resources: Properly configure permissions for shared folders and printers to restrict access.
•	Use Strong Passwords: Implement complex passwords to prevent unauthorized access.
•	Monitor Network Activity: Look for suspicious queries or attempts to access network resources.

By understanding NetBIOS reconnaissance techniques and implementing proper security measures, organizations can make it more difficult for attackers to exploit vulnerabilities in their Windows environments.

●	NetBIOS name is a unique 16 ASCII character string used to identify the network devices over TCP/IP, 15 characters are used for the device name and 16th character is reserved for the service or name record type. 
●	Attackers use the NetBIOS enumeration to obtain: ○ List of computers that belong to a domain 
○ List of shares on the individual hosts in the network 
○ Policies and passwords 
●	net view /domain 
●	net view /domain:name 
●	net view \\FIRE 
●	net use \\FIRE "password" /u:"name" 
●	Null Session: net use \\FIRE "" /u:"" 
  
Note: NetBIOS name resolution is not supported by Microsoft for Internet Protocol Version 6 (IPv6) 
●	Nbtstat utility in Windows displays NetBIOS over TCP/IP (NetBT) protocol statistics, NetBIOS name tables for both the local and remote computers, and the NetBIOS name cache. 
○ Run nbtstat command nbtstat.exe -c to get the contents of the NetBIOS name cache, the table of NetBIOS names, and their resolved IP addresses. 
○ Run nbtstat command nbtstat.exe -a <IP address of the remote machine> to get the NetBIOS name table of a remote computer. 
NetBIOS Enumeration Tools: 
●	SuperScan: 
○ SuperScan is a connect-based TCP port scanner, pinger, and hostname resolver. 
●	Hyena: 
○ Hyena is a GUI product for managing and securing Microsoft operating systems. It shows shares and user logon names for Windows servers and domain controllers. 
○ It displays graphical representation of Microsoft Terminal Services, Microsoft Windows Network, Web Client Network, etc. 
●	Winfingerprint: 
○ Winfingerprint determines OS, enumerate users, groups, shares, SIDs, transports, sessions, services, service pack and hotfix level, date and time, disks, and open TCP and UDP ports. 
●	NetBIOS Enumerator 
●	Nsauditor Network Security Auditor 
Enumerating Shared Resources Using Net View  
●	Net View utility is used to obtain a list of all the shared resources of remote hosts or workgroups. 
●	Net View Commands: 
○ net view \\<computername> 
○ net view /workgroup:<workgroupname> 
 
 
NetBIOS Enumeration   

NetBIOS is a legacy protocol used to identify and locate devices on a network. While it's still used in many environments, it's vulnerable to various attacks.

Key Points:
•	Identification: NetBIOS assigns unique 16-character names to devices, aiding in network discovery.
•	Attack Vector: Attackers exploit NetBIOS to: 
o	Discover devices on a network
o	Identify shared resources
o	Gather information about system configurations and security policies
o	Potentially gain unauthorized access
•	Common Tools: 
o	Net View: Used to list shared resources on remote systems.
o	Nbtstat: Displays NetBIOS statistics and name resolution information.
o	Third-party tools: SuperScan, Hyena, Winfingerprint, and others can be used for more advanced scanning and enumeration.
•	Mitigation: 
o	Disable NetBIOS: If possible, disable NetBIOS on systems and network devices.
o	Firewall Rules: Implement firewall rules to block NetBIOS traffic.
o	Strong Password Policies: Enforce strong password policies to protect against unauthorized access.
o	Regular Security Audits: Conduct regular security audits to identify and address vulnerabilities.
o	Network Segmentation: Segment the network to limit the impact of potential breaches.

By understanding the risks associated with NetBIOS and implementing appropriate security measures, organizations can significantly reduce their exposure to attacks.

# Recon ‐ SNMP

SNMP

Extract usernames from SNMP (MiB, SNMPWAL)
DHCP Enumeration
SMTP Enumeration

2. SNMP Enumeration
•	Purpose: Gathering information about devices and their configurations using the Simple Network Management Protocol (SNMP).
•	SNMP Basics: 
o	SNMP uses community strings (like passwords) for authentication.
o	Common community strings: public (read-only), private (read-write).
o	SNMP MIBs (Management Information Bases): 
	Databases that define the objects and their properties that can be managed via SNMP.
	They provide a structured way to access device information.
o	SNMPWalk: 
	A tool that retrieves all available SNMP information from a device.
	It iterates through the MIB tree, collecting data.
	Tools: snmpwalk.
	Example: snmpwalk -v 1 -c public target_ip
•	Information Extracted: 
o	System information (hostname, uptime, etc.).
o	Network interfaces and their status.
o	Routing tables.
o	Installed software.
o	Usernames (sometimes).
o	Security Concerns: Default community strings are a significant security risk.
•	Extract usernames from SNMP: 
o	Depending on the device and its configuration, SNMP can sometimes expose usernames. This is usually due to poorly configured MIBs or older SNMP versions.



SNMP 

SNMP Reconnaissance: Unveiling Device Details

SNMP enumeration focuses on extracting information from network devices using the Simple Network Management Protocol (SNMP). SNMP is a widely used protocol for managing network devices, but it can also be exploited by attackers to gather valuable information.

How SNMP Works:
•	SNMP involves a manager-agent architecture.
•	Agents reside on network devices and collect information.
•	Managers can query agents to retrieve information or change configurations.

Security Concerns with SNMP:
•	Default Community Strings: By default, SNMP uses community strings for authentication, and these strings are often well-known ("public" for read access, "private" for read-write). Attackers can leverage these defaults to gain unauthorized access.
•	Information Leakage: SNMP can reveal a wealth of information about a device, including:
o	Network resources (hosts, routers, devices, shares)
o	Network information (ARP tables, routing tables, traffic)
o	Usernames and other sensitive details (depending on configuration)

SNMP Enumeration Techniques:
•	SNMP Walk Command: Tools like snmpwalk can be used to systematically query an SNMP agent for information.

SNMP Enumeration Tools:
•	OpUtils: A network management suite that includes SNMP enumeration capabilities.
•	Engineer's Toolset: A tool that can discover network devices using SNMP and display information about them.

Defending Against SNMP Reconnaissance:
•	Disable Unused SNMP: If SNMP is not required, disable it on devices to eliminate the attack surface.
•	Strong Community Strings: Use complex, unique community strings for both read and write access.
•	Limit Access: Restrict access to SNMP management to authorized personnel and networks.
•	Monitor SNMP Traffic: Watch for suspicious queries or unauthorized access attempts.

By understanding SNMP enumeration techniques and implementing proper security measures, organizations can significantly reduce the risk of information disclosure and unauthorized configuration changes.

Note: The document you provided included extraneous content about SMTP enumeration and DNS zone transfers. These are separate reconnaissance techniques, not directly related to SNMP.

●	SNMP enumeration is a process of enumerating user accounts and devices on a target system using SNMP. 
●	SNMP consists of a manager and an agent; agents are embedded on every network device, and the manager is installed on a separate computer. 
●	SNMP holds two passwords to access and configure the SNMP agent from the management station: 
○	Read community string: It is public by default; allows viewing of device/system configuration. 
○ Read/write community string: It is private by default; allows remote editing of configuration. 
●	Attackers use these default community strings to extract information about a device. 
●	Attackers enumerate SNMP to extract information about network resources such as hosts, routers, devices, shares, etc. and network information such as ARP tables, routing tables, traffic, etc. 
●	snmpwalk: snmpwalk -v 1 -c public 192.168.99.144 
●	snmpcheck: snmpcheck -t 192.168.99.144 
SNMP Enumeration Tools: 
●	OpUtils: OpUtils with its integrated set of tools helps network engineers to monitor, diagnose, and troubleshoot their IT resources. 
●	Engineer's Toolset: 
○	Engineer's Toolset performs network discovery on a single subnet or a range of subnets using ICMP and SNMP. 
○ It scans a single IP, IP address range, or subnet and displays network devices discovered in real time. 
 
 
SNMP Enumeration 

SNMP (Simple Network Management Protocol) is a protocol used to monitor and manage network devices. However, it can be exploited by attackers to gather sensitive information about a network.

How does SNMP Enumeration work?
1.	Default Credentials: SNMP uses community strings for authentication. Default community strings like "public" and "private" are often left unchanged, making it easy for attackers to access devices.
2.	Information Gathering: Attackers can use tools like snmpwalk and snmpcheck to query SNMP agents and extract information such as: 
o	Device information (vendor, model, OS version)
o	Network configuration (IP addresses, subnet masks, routing tables)
o	User accounts and passwords (if poorly configured)
o	System logs and error messages

Mitigation Techniques:
1.	Change Default Community Strings: Assign strong, unique community strings to each device.
2.	Restrict SNMP Access: Limit SNMP access to authorized network administrators.
3.	Implement Network Segmentation: Divide the network into smaller segments to reduce the impact of a potential breach.
4.	Use SNMPv3: SNMPv3 provides stronger security features like encryption and authentication.
5.	Monitor Network Traffic: Regularly monitor network traffic for suspicious activity.
6.	Keep Software Up-to-Date: Apply security patches to address vulnerabilities in SNMP agents and management software.

By following these best practices, organizations can significantly reduce the risk of SNMP enumeration attacks and protect their network infrastructure.
## Countermeasures to SNMP
•	Remove the SNMP agent or turn off the SNMP service 
•	If shutting off SNMP is not an option, then change the default community string name 
•	Upgrade to SNMP3, which encrypts passwords and messages 
•	Implement the Group Policy security option called "Additional restrictions for anonymous connections" 
•	Ensure that the access to null session pipes, null session shares, and IPSec filtering is restricted. 
•	SNMP (Simple Network Management Protocol):
o	Disable: If possible, remove the SNMP agent or turn off the service entirely.
o	Strong Passwords: If disabling isn't an option, change the default community string to a strong, complex password.
o	Encryption: Upgrade to SNMPv3, which encrypts both passwords and messages for better security.
o	Limit Access: Implement security options like "Additional restrictions for anonymous connections" to restrict unauthorized access.
o	Restrict Null Sessions: Ensure access to null session pipes, shares, and IPSec filtering is restricted.
SNMP Enumeration Countermeasures
•	Remove the SNMP agent or turn off the SNMP service 
•	If shutting off SNMP is not an option, then change the default community string name 
•	Upgrade to SNMP3, which encrypts passwords and messages 
•	Implement the Group Policy security option called "Additional restrictions for anonymous connections" 
•	Ensure that the access to null session pipes, null session shares, and IPSec filtering is restricted. 

# Port Scanning

Port Scanning Techniques:
There are various port scanning techniques, each with its advantages and limitations. Here are a few examples:
* •	Basic Techniques: Ping scan, TCP connect scan
* •	Stealthier Techniques: TCP half-open scan, NULL scan, FIN scan, X-MAS scan
* •	Advanced Techniques: UDP scan, strobe scan, fragmented packets


Port Scanning: A Double-Edged Sword

Port scanning is a technique used to identify open ports on a computer or network device. These open ports reveal the services running on the device and can be used for both good and bad purposes.

Understanding Port Scanning:
* •	Who Uses It?
  * o	Security Professionals: Used to verify network security policies, identify vulnerabilities, and troubleshoot network issues.
  * o	Attackers: Used to find weaknesses in a system for exploitation or gather information for malicious activities.
* •	Importance: Understanding port scanning is crucial for both security professionals and regular users to protect their devices and networks.

Responsible Use:
* •	Legality: Port scanning without authorization is illegal in most countries.
* •	Ethics: Responsible use is essential to avoid harming others' networks.
* •	Network Security: Firewalls and keeping software updated help mitigate risks associated with open ports.

Common Ports to Scan:
These are some well-known ports and their associated services:
* •	Secure Shell (SSH): 22
* •	Simple Mail Transfer Protocol (SMTP): 25
* •	Domain Name System (DNS): 53
* •	Remote Procedure Call (RPC): 135
* •	Network File System (NFS): 2049
* •	Many more... (The full list includes 65,535 ports for both TCP and UDP)

Protecting Yourself:
* •	Firewalls and IDS: Configure firewalls and Intrusion Detection Systems (IDS) to detect and block suspicious port scanning activity.
* •	Regular Updates: Ensure your network devices (routers, firewalls) and software are updated with the latest security patches.
* •	Custom Firewall Rules: Consider using custom firewall rules to block unwanted ports.
* •	Network Scanning Tools: Use port scanning tools on your own network to test your firewall's effectiveness.


Additional Points:
* •	Network Footprinting tools like PathAnalyzerPro can help identify network devices and their characteristics.
* •	Nmap is a popular open-source port scanner with various features like OS fingerprinting and advanced scan techniques.

Remember: Port scanning is a powerful tool, but use it responsibly and ethically. Always obtain permission before scanning someone else's network.

Port Scanning is the technique used to identify open ports and service available on a host. Hackers use port scanning to find information that can be helpful to exploit vulnerabilities. Administrators use Port Scanning to verify the security policies of the network. Some of the common Port Scanning Techniques are: 
* Ping Scan 
* TCP Half-Open 
* TCP Connect 
* UDP 
* Stealth Scanning 

### Port Scanning Countermeasures 
Configure firewall and IDS rules to detect and block probes. 
* ●	Run the port scanning tools against hosts on the network to determine whether the firewall properly detects the port scanning activity. 
* ●	Ensure that mechanisms used for routing and filtering at the routers and firewalls respectively cannot be bypassed using particular source ports or source-routing methods. 
* ●	Ensure that the router, IDS, and firewall firmware are updated to their latest releases. 
* ●	Use a custom rule set to lock down the network and block unwanted ports at the firewall. 
* ●	Filter all ICMP messages (i.e. inbound ICMP message types and outbound ICMP type 3 unreachable messages) at the firewalls and routers. 
* ●	Perform TCP and UDP scanning along with ICMP probes against your organization's IP address space to check the network configuration and its available ports. 
* ●	Ensure that the anti scanning and anti spoofing rules are configured. 
 


### Port Scanning Countermeasures 
* Configure firewall and IDS rules to detect and block probes. 
* ●	Run the port scanning tools against hosts on the network to determine whether the firewall properly detects the port scanning activity. 
* ●	Ensure that mechanisms used for routing and filtering at the routers and firewalls respectively cannot be bypassed using particular source ports or source-routing methods. 
* ●	Ensure that the router, IDS, and firewall firmware are updated to their latest releases. 
* ●	Use a custom rule set to lock down the network and block unwanted ports at the firewall. 
* ●	Filter all ICMP messages (i.e. inbound ICMP message types and outbound ICMP type 3 unreachable messages) at the firewalls and routers. 
* ●	Perform TCP and UDP scanning along with ICMP probes against your organization's IP address space to check the network configuration and its available ports. 
* ●	Ensure that the anti scanning and anti spoofing rules are configured. 
 
# NMAP ‐ scaning technique

# Basic scanning technique
* Scan Single Target: By default Nmap scan will check for the 1000 most commonly used TCP/IP ports `nmap 10.10.10.10`	
* Scan Multiple Targets: `nmap 10.10.10.10 10.10.10.11 10.10.10.12`
* Scan IP Address Range: Nmap can be used to scan an entire subnet using CIDR (Classless Inter-Domain Routing) notation. 
  * `nmap 10.10.10.10-12`        
  * `nmap 10.10.10.*`
  * `nmap 10.10.10.10-10.10.*`
  * `nmap 10.10.10.10/24`
* Scan list of targets:	Each entry in the list.txt file must be separated by a space, tab, or newline `nmap list.txt -iL`  	
* Random Scan - It will randomly generate specified number of targets and scan them. Not Recommended `nmap -iR 5`	
* Exclude Targets from Scan: This option accepts single hosts, ranges, or entire network blocks  `nmap 10.10.10.0/24 --exclude 10.10.10.140`
* Exclude Targets Using List: `nmap 10.10.10.0/24 --excludefile list.txt` 
* Aggressive Scan: use -A parameter is a synonym for several advanced options like -O -sC --traceroute `nmap -A 10.10.10.10`	
* Scan IPv6 target: use -6 parameter is used to perform a scan of an IPv6 target `nmap -6 fe80::29aa:9db9:4164:d80e` 

* Fast Scan: 	#nmap 10.10.10.10 -F	Scan only 100 most commonly used ports
* Scan specific ports:        	#nmap 10.10.10.10 -p 80, 443, 21-25	 
* Scan ports by name:      	#nmap 10.10.10.10 -p http, smtp, ftp	 
* Scan ports for multiple services by name	#nmap 10.10.10.10 -p "http*"	 
* Scan ports by protocol:  	#nmap 10.10.10.10 -p U:80,T:80 	U:UDP port, T:TCP port
* Scan All ports:                	#nmap 10.10.10.10 -p * 	 
* Show Open Ports: 	#nmap 10.10.10.10 --open	 
* Reason for Port State:	#nmap 10.10.10.10 --reason                	 "syn-ack" means ports are open, "conn-refused or reset" means closed
* Scan Top ports: 	#nmap 10.10.10.10 --top-ports 20 	Scans specified number of ports
* Sequential port scan:	#nmap 10.10.10.10 -r 	 By default Nmap’s randomizes port scan order. -r overrides this.
* Scan Flags	#nmap 10.10.10.10 --scan-flags	 


# Firewall Evasion
Fragment Packets      	nmap -f [target] 
Specify a Specific MTU      	nmap --mtu [MTU] [target] 
Use a Decoy      	nmap -D RND:[number] [target] 
Idle Zombie Scan      	nmap -sI [zombie] [target] 
Manually Specify a Source Port  	nmap --source-port [port] [target] 
Append Random Data  	nmap --data-length [size] [target] 
Randomize Target Scan Order 	nmap --randomize-hosts [target] 
Spoof MAC Address      	nmap --spoof-mac [MAC|0|vendor] [target] 
Send Bad Checksums 	nmap --badsum [target] 

## Discovery Options
* Don’t Ping: 	#nmap 10.10.10.10 -PN	While scanning ports first nmap ping the target to see if it is online then it scans. -PN option instructs Nmap to skip the default discovery check and perform a complete port scan on the target. Nmap is able to produce a list of open ports on the unpingable system. 
* Perform a Ping Only Scan: 	#nmap 10.10.10.0/24  -sP 	Used to perform quick search of the target in the network. -sP option will perform ARP ping and produces MAC addresses.
* TCP SYN Ping: 	#nmap 10.10.10.10 -PS 	It sends a SYN packet to target systems. Useful when standard ICMP pings are blocked. Default port for -PS is 80
* TCP ACK Ping 	#nmap 10.10.10.10 -PA 	Used to send ACK packets to target systems. Useful when standard ICMP pings are blocked. Default port for -PS is 80
* UDP Ping 	#nmap 10.10.10.10 -PU 	Used to send UDP packets to target systems. Useful when TCP connections are blocked. Default port for -PS is 40125
* SCTP INIT Ping 	#nmap 10.10.10.10 -PY 	Used to locate hosts using the Stream Control Transmission Protocol (SCTP). Default port for -PS is 80
* ICMP Echo Ping 	#nmap 10.10.10.10 -PE 	Used to send standard ICMP ping to target. -PE option is automatically implied if no other ping options are specified. 
* ICMP Timestamp Ping 	#nmap 10.10.10.10 -PP 	Useful when ICMP pings are blocked
* ICMP Address Mask Ping 	#nmap 10.10.10.10 -PM 	Used to ping specified host using alternative ICMP registers. Useful when ICMP echo pings are blocked
* IP Protocol Ping 	#nmap 10.10.10.10 -PO 1, 2, 4	Used to sends packets with the specified protocol to the target. If no protocols are specified then default protocols 1 (ICMP), 2 (IGMP), and 4 (IP-in-IP) are used
* ARP Ping 	#nmap 10.10.10.10 -PR 	The -PR option is automatically implied when scanning the local network. It is much faster than the other ping methods. It is more accurate because LAN hosts can’t block ARP requests. 
* Traceroute 	#nmap 10.10.10.10 --traceroute 	Used to trace the network path to the specified host
* Force Reverse DNS Resolution 	#nmap 10.10.10.10 -R 	Used to perform reverse DNS resolution on the every target IP address. By default, Nmap will only do reverse DNS for hosts that appear to be online. Reduces performance of scan.
* Disable Reverse DNS Resolution 	#nmap 10.10.10.10 -n 	Used to Disable Reverse DNS Resolution. Reduces scanning time when scanning large number of hosts. Used when you don’t care of DNS information
* Alternative DNS Lookup 	#nmap 10.10.10.10 --system-dns 	It instructs Nmap to use the host system’s DNS resolver instead of its own internal method. Useful when troubleshooting DNS problems 
* Manually Specify DNS Server(s) 	#nmap 10.10.10.10 --dns-servers 	Used to manually specify DNS servers to be queried when scanning
* Create a Host List 	#nmap 10.10.10.0/24 -sL 	The -sL option will display a list and performs a reverse DNS lookup of the specified IP addresses. Useful for identifying the IP addresses and DNS names for the specified targets without sending any packets to them

## Advanced Scanning
* TCP SYN Scan:  Half open scanning	#nmap 10.10.10.10 -sS	because only send syn packets and it does not attempt to open a full-fledged connection to the remote host. Prevents connection logging. (Modern firewall able to detect it) Stealth scan.
* TCP Connect Scan:	#nmap 10.10.10.10 -sT 	 attempts to directly connect to the remote system without using any 
* UDP Scan: 	#nmap 10.10.10.10 -sU  	Many services still utilize UDP like DNS, DHCP, SNMP
* TCP Null Scan:  . 	#nmap 10.10.10.10 -sN  	used to send packets with no TCP flags enabled. This is done by setting the packet header to 0. Sending NULL packets to a target is a method of tricking a firewalled system to generate a response
* TCP FIN Scan 	#nmap 10.10.10.10 -sF	In a -sF scan, Nmap marks the TCP FIN bit active when sending packets in an attempt to solicit a TCP ACK from the specified target system. This is another method of sending unexpected packets to a target in an attempt to produce results from a system protected by a firewall.  
* Xmas Scan	#nmap 10.10.10.10 -sX	Nmap sends packets with URG, FIN, and PSH, and flags activated. This has the effect of “lighting the packet up like a Christmas tree” and can occasionally solicit a response from a firewalled system. 
* TCP ACK Scan 	#nmap 10.10.10.10 -sA 	The -sA option can be used to determine if the target system is protected by a firewall. When performing a TCP ACK scan, Nmap will probe a target and look for RST responses. If no response is received the system is considered to be filtered. If the system does return an RST packet, then it is labelled as unfiltered. In the above example 994 ports are labelled as filtered meaning that the system is likely protected by a firewall. The 6 unfiltered ports displayed are likely to have special rules in the target’s firewall that enable them to be open or closed.  The -sA option does not display whether or not the unfiltered ports are open or closed. Its only purpose is to determine whether or not the system is filtering ports. 
* Custom TCP Scan 	#nmap 10.10.10.10 --scanflags FINACK	The --scanflags option allows users to define a custom scan using one or more TCP header flags. Any combination of flags listed in the table below can be used  with the --scanflags option.
* SYN=Synchronize, ACK=Acknowledgment, PSH=Push, URG=Urgent, RST=Reset, FIN=Finished 
* IP Protocol Scan 	#nmap 10.10.10.10 -sO 	Displays the IP protocols that are supported on the target system. Used to find what types of scans you want to perform on the selected target.
* Send Raw Ethernet Packets 	#nmap 10.10.10.10 --send-eth 	Used to bypass the IP layer on your system and send raw ethernet packets on the data link layer
* Send IP Packets 	#nmap 10.10.10.10 --send-ip 	Used to scan using the local system’s IP stack instead of generating raw ethernet packets

## OS and Service Detection
* Operating System Detection 	#nmap 10.10.10.10 -O  	OS detection is performed by analysing responses from the target for a set of predictable characteristics which can be used to identify the type of OS on the remote system. In order for OS detection to work properly there must be at least one open and one closed port on the target system. When scanning multiple targets, the --osscan-limit option can be combined with -O to instruct Nmap not to OS scan hosts that do not meet this criteria. The -v option can be combined with -O to display additional information
* Submit  TCP/IP Fingerprints 	#nmap 10.10.10.10 -O  	www.nmap.org/submit/  If Nmap is unable to determine the operating system on a target, it will provide a fingerprint which can be submitted to Nmap’s OS database at www.nmap.org/submit/. The example below demonstrates Nmap’s output in this scenario. 
* Attempt to Guess an Unknown  OS	#nmap 10.10.10.10 -O --osscan-guess 	Displays a list of possible matches for the target’s operating system
* Service Version Detection  	#nmap 10.10.10.10 -sV 	Nmap version detection purposely skips some problematic ports (specifically 9100-9107). This can be overridden by combining the --allports parameter with -sV which instructs Nmap not to exclude any ports from version detection
* Troubleshooting Version Scans 	#nmap 10.10.10.10 -sV --version-trace	The --version-trace option can be helpful for debugging problems or to gain additional information about the target system
* Perform a RPC Scan 	#nmap 10.10.10.10 -sR 	The -sR option performs a RPC (Remote Procedure Call) scan on the specified target. 

## Timing Options

* Timing Templates      	#nmap 10.10.10.10 -T0
* #nmap 10.10.10.10 -T1
* #nmap 10.10.10.10 -T2
* #nmap 10.10.10.10 -T3
* #nmap 10.10.10.10 -T4
* #nmap 10.10.10.10 -T5	All timing parameters are accepted as milliseconds. 1ms = (1/1000sec), s=seconds, m=minutes, h=hours 
* •	Paranoid: Extremely slowly T0 Evade Firewall
* •	Sneaky: Useful for avoiding intrusion detection systems T1
* •	Polite: Unlikely to interfere with the target system  T2
* •	Normal: This is the default timing template T3
* •	Aggressive: Produces faster results on local networks T4
* •	Insane: Very fast and aggressive scan T5 -->Faster result
* Set the Packet TTL      	#nmap 10.10.10.10 --ttl 500 	The --ttl option is used to specify the TTL (time-to-live) for the specified scan (in milliseconds). Packets sent using this option will have the specified TTL value. This option is useful when scanning targets on slow connections where normal packets may time out before receiving a response. 
* Minimum # of Parallel Operations 	#nmap 10.10.10.10 --min-parallelism 25	Nmap automatically adjusts parallel scanning options based on network conditions. This command instructs nmap to perform 25 parallel operations at any given time. Setting it high may produce wrong results
* Maximum #  of Parallel Operations 	#nmap 10.10.10.10 --max-parallelism 200	--max-parallelism 1 is used to restrict Nmap so that only one operation is performed at a time
* Minimum Host Group Size      	#nmap 10.10.10.10 --min-hostgroup 3	Nmap will perform scans in parallel to save time when scanning multiple targets such as a range or entire subnet. By default, Nmap will automatically adjust the size of the host groups based on the type of scan being performed and network conditions. By specifying the --min-hostgroup option, Nmap will attempt to keep the group sizes above the specified number. 
* Maximum Host Group Size      	#nmap 10.10.10.10 --max-hostgroup 5	--max-hostgroup option controls the maximum number of hosts in a group. 
* Maximum RTT Timeout      	#nmap 10.10.10.10 --initial-rtt-timeout 5000 	The --initial-rtt-timeout option controls the initial RTT (round-trip time) timeout value used by Nmap. 
* retransmissions due to timeouts. By decreasing the value you can speed up scans; but do so with caution. Setting the RTT timeout value too low can negate any potential performance gains and lead to inaccurate results. 
* Initial RTT Timeout      	#nmap 10.10.10.10 --max-rtt-timeout 400 	The --max-rtt-timeout option is used to specify the maximum RTT (Round-Trip Time) timeout for a packet response. Nmap dynamically adjusts RTT timeout options for best results by default. The default maximum RTT timeout is 10 seconds. Manually adjusting the maximum RTT timeout lower will allow for faster scan times (especially when scanning large blocks of addresses). Specifying a high maximum RTT timeout will prevent Nmap from giving up too soon when scanning over slow/unreliable connections. Typical values are between 100 milliseconds for fast/reliable networks and 10000 milliseconds for slow/unreliable connections. 
* Maximum Retries      	#nmap 10.10.10.10 --max-retries 5  	The --max-retries option is used to control the maximum number of probe retransmissions Nmap will attempt to perform. By default, Nmap will automatically adjust the number of probe retransmissions based on network conditions. The --max-retries option can be used if you want to override the default settings or troubleshoot a connectivity problem. Specifying a high number can increase the time it takes for a scan to complete, but will produce more accurate results. By lowering the --max-retries you can speed up a scan – although you may not get accurate results if Nmap gives up too quickly. 
* Host Timeout      	#nmap 10.10.10.10 --host-timeout 5m	The --host-timeout option causes Nmap to give up on slow hosts after the specified time. A host may take a long time to scan if it is located on a slow or unreliable network. Systems that are protected by rate limiting firewalls may also take a considerable amount of time to scan. The --host-timeout option instructs Nmap to give up on the target system if it fails to complete after the specified time interval. In the above example, the scan takes longer than one minute to complete (as specified by the 1m parameter) which causes Nmap to terminate the scan. This option is particularly useful when scanning multiple systems across a WAN or internet connection. Nmap performs parallel operations when scanning multiple targets. In the event that one host is taking a long time to respond, Nmap is likely scanning other hosts during that time. This reduces potential bottlenecks that slow hosts can create
* Minimum Scan Delay  	#nmap 10.10.10.10 --scan-delay 5s	The --scan-delay option instructs Nmap to pause for the specified time interval between probes. Some systems employ rate limiting which can hamper Nmap scanning attempts. Nmap will automatically adjust the scan delay by default on systems where rate limiting is detected. In some cases it may be useful to specify your own scan delay if you know that rate limiting or IDS (Intrusion Detection Systems) are in use. In the example above the scan delay of 5s instructs Nmap to wait five seconds between probes. 
* Maximum Scan Delay  	#nmap 10.10.10.10 --max-scan-delay 10s 	The --max-scan-delay is used to specify the maximum amount of time Nmap should wait between probes
* Minimum Packet Rate  	#nmap 10.10.10.10 --min-rate 30 	The --min-rate option is used to specify the minimum number of packets Nmap should send per second. Nmap, by default, will automatically adjust the packet rate for a scan based on network conditions. In some cases, you may want to specify your own minimum rate - although this is generally not recommended. In the above example --min-rate 30 instructs Nmap to send at least 30 packets per a second. Nmap will use the number as a low threshold but may scan faster than this if network conditions allow. 
* Maximum Packet Rate      	#nmap 10.10.10.10 --max-rate 50 	The --max-rate option is used to specify the maximum number of packets Nmap should send per second. To perform a very sneaky scan use --max-rate 0.1 which instructs Nmap to send one packet every ten seconds. 
* Defeat Reset Rate Limits 	#nmap 10.10.10.10 --defeat-rst-ratelimit 	The --defeat-rst-ratelimit is used to defeat targets that apply rate limiting to RST (reset) packets. The --defeat-rst-ratelimit option can be useful if you want to speed up scans on targets that implement RST packet rate limits. It can, however, lead to inaccurate results and as such it is rarely used.  The --defeat-rst-ratelimit option is rarely used because, in most cases, Nmap will automatically detect rate limiting hosts and adjust itself accordingly. 

<img width="555" height="311" alt="image" src="https://github.com/user-attachments/assets/653fc1bf-eeb3-4d69-a27b-0d58670e4143" />
<img width="555" height="311" alt="image" src="https://github.com/user-attachments/assets/653fc1bf-eeb3-4d69-a27b-0d58670e4143" />
<img width="550" height="322" alt="image" src="https://github.com/user-attachments/assets/7aa7a3dd-d82e-4254-86ba-788add017b5d" />
<img width="550" height="322" alt="image" src="https://github.com/user-attachments/assets/7aa7a3dd-d82e-4254-86ba-788add017b5d" />


# NMAP

NMAP

Nmap for Network Reconnaissance
Nmap is a versatile tool used by both network administrators and attackers.
•	Administrators: Use it for network inventory, service upgrade scheduling, and uptime monitoring.
•	Attackers: Use it to discover live hosts, services (application and version), firewall/packet filter types, and operating system information.
TCP Scanning Techniques
Nmap offers various TCP scanning methods:
•	Open TCP Scans: 
o	TCP Connect Scan (-sT): Completes the full three-way handshake, easily detectable, doesn't require root privileges.
•	Stealth TCP Scans: 
o	SYN Scan (Half-open Scan) (-sS): Sends a SYN packet, responds to SYN/ACK with RST, less detectable.
o	Inverse TCP Flag Scans (-sF, -sN, -sX): 
	FIN Scan (-sF): Sends FIN packets.
	NULL Scan (-sN): Sends packets with no flags set.
	Xmas Scan (-sX): Sends packets with FIN, URG, and PUSH flags set. (These scans rely on RFC 793, and may not work on modern windows systems).
o	ACK Flag Probe Scan (-sA): Sends ACK packets, analyzes RST responses for TTL and WINDOW values to determine port status and firewall filtering.
•	Spoofed TCP Scans: 
o	IDLE/IP ID Header Scan (-sI): Uses a "zombie" host to indirectly scan a target, relying on IP ID sequence numbers.
Key Nmap Concepts and Flags
•	Three-way handshake: SYN, SYN/ACK, ACK.
•	RST packet: Used to reset a connection.
•	IP ID (IPID): A fragment identification number that increments with each sent IP packet.
•	Nmap Flags: 
o	-sT: TCP Connect scan.
o	-sS: SYN (Stealth) scan.
o	-sF, -sN, -sX: Inverse TCP flag scans (FIN, NULL, Xmas).
o	-sA: ACK flag probe scan.
o	-sI: IDLE/IP ID header scan.
o	-sU: UDP scan.
o	-sn or -sP: ICMP echo (ping) scan.
o	-sL: List scan (DNS resolution only).
o	-O: OS detection.
o	-Pn: Port scan only (no host discovery).
UDP Scanning (-sU)
•	UDP scans don't use the three-way handshake.
•	Open ports don't respond.
•	Closed ports respond with ICMP port unreachable messages.
ICMP Scanning (-sn/-sP) and List Scan (-sL)
•	ICMP echo scans (ping) determine active hosts.
•	List scans perform DNS resolution without pinging.
Port Scanning Countermeasures
•	Configure firewalls and intrusion detection systems (IDS) to detect and block scans.
•	Regularly scan your own network to test defenses.
•	Ensure routers and firewalls are updated.
•	Use custom firewall rules to block unwanted ports.
•	Filter ICMP messages.
•	Test anti-scanning and anti-spoofing rules.



Nmap Port States 
•	Open: A port that actively responds to an incoming connection. means that an application on the target machine is listening for connections/packets on that port
•	Closed: A port on a target that actively responds to a probe but does not have any service running on the port. Closed ports are commonly found on systems where no firewall is in place to filter incoming traffic. means ports have no application listening on them, though they could open at any time.
•	Filtered: Filtered ports are ports that are typically protected by a firewall of some sort that prevents Nmap from determining whether or not the port is open or closed. means that a firewall, filter, or other network obstacle is blocking the port so that Nmap cannot tell whether it is open or closed.
•	Unfiltered: An unfiltered port is a port that Nmap can access but is unable to determine whether it is open or closed. Ports are classified as unfiltered when they are responsive to Nmap’s probes, but Nmap cannot determine whether they are open/ closed
•	Open | filtered: An open | filtered port is a port which Nmap believes to be open or filtered but cannot determine which exact state the port is actually in.  This indicates that the port was filtered or open but Nmap couldn’t establish the state
•	Closed | filtered: A closed | filtered port is a port that Nmap believes to be closed or filtered but cannot determine which respective state the port is actually in. This indicates that the port was filtered or closed but Nmap couldn’t establish the state.

Nmap Port States 

Demystifying Nmap Port States: Open or Closed, maybe?

Nmap, a popular port scanner, helps identify open ports on a target device, revealing potential vulnerabilities. But Nmap doesn't always provide a definitive answer. Here is a breakdown of the different port states Nmap reports:
•	Open: This is the good news for attackers (and the bad news for defenders). An open port means a service is actively listening for incoming connections, indicating potential attack surfaces.
•	Closed: This might seem like a good thing, but it's not always definitive. A closed port simply means no service is actively listening now. However, it could be opened in the future.
•	Filtered: This is where things get tricky. A filtered port suggests a firewall or other security measure is blocking Nmap's scan, making it impossible to determine if the port is truly open or closed.
•	Unfiltered: This is another ambiguous state. Nmap can access the port, but it can't tell if it's open or closed. This could be due to the target device's specific configuration.
•	Open filtered: This combines the uncertainty of open and filtered. Nmap suspects the port might be open, but the firewall is making it difficult to be sure.
•	Closed filtered: Like open filtered, Nmap leans towards closed but can't be certain due to filtering.

In Summary:
While Nmap provides valuable insights, these port states highlight the limitations of automated scanning. Firewalls and other security measures can make it challenging to get a complete picture of a target device's vulnerabilities.
For a more comprehensive understanding, consider combining Nmap scans with other techniques like vulnerability scanners and manual analysis.

Recon with NMAP
nmap 172.16.1.10           
Scan via specific network interface (eth0/wlan0): >nmap -e eth0 172.16.1.10
Display host networking configuration, general network, and routing information for the local system: >nmap - -iflist
Troubleshoot connectivity issues (Trace packets) by displaying summary of sent and received packets: >nmap - -packet-trace 172.16.1.10
Troubleshoot connectivity issues on specific network interface (et0/wlan0): >nmap -e eth0 172.16.1.10
nmap 172.16.1.10           
Scan via specific network interface (eth0/wlan0): >nmap -e eth0 172.16.1.10

NMAP
Nmap is a powerful tool used to explore and check networks. Both network administrators and attackers use it, but for different reasons:
•	Network Administrators: Use Nmap to see what devices are on their network, check software versions, plan updates, and monitor uptime.
•	Attackers: Use Nmap to find live devices, what services they run, what firewall or filters are in place, and which operating systems they use.

Nmap helps discover important information about Azure networks before deeper testing.

TCP Scanning Methods in Nmap
Nmap has several ways to scan TCP ports to find out if they are open or closed:
1.	Open TCP Scans (Full connection):
o	TCP Connect Scan (-sT):
This scan completes the full connection (three-way handshake: SYN, SYN/ACK, ACK).
	Easy to detect by security systems.
	Does not need special permissions (no root access needed).
2.	Stealth TCP Scans (Less detectable):
o	SYN Scan (-sS):
Sends a SYN packet and waits for SYN/ACK, but then resets the connection before completing it.
	Harder to detect than full connect scan.
o	Inverse TCP Flag Scans:
These scans send packets with unusual flags set and observe the response to guess if ports are open or closed.
	FIN Scan (-sF): Sends FIN packets.
	NULL Scan (-sN): Sends packets with no flags set.
	Xmas Scan (-sX): Sends packets with FIN, URG, and PUSH flags set.
Note: These may not work well on modern Windows systems.
o	ACK Flag Probe Scan (-sA):
Sends ACK packets and analyses the reset (RST) response to check firewall filtering and port status.
3.	Spoofed TCP Scans:
o	IDLE/IP ID Header Scan (-sI):
Uses a "zombie" host to scan the target indirectly by watching how the zombie’s IP ID number changes. This method is stealthy and hard to detect.

Important Concepts & Nmap Flags
•	Three-way handshake: The normal TCP connection steps — SYN, SYN/ACK, ACK.
•	RST packet: A reset signal to close or refuse a connection.
•	IP ID (IPID): A number that identifies and tracks packets sent by a host.


UDP Scanning (-sU)
•	UDP scans are different because UDP doesn't have a handshake like TCP.
•	Open UDP ports usually do not reply.
•	Closed UDP ports send back ICMP "port unreachable" messages.

ICMP and List Scans
•	ICMP Ping Scan (-sn or -sP):
Sends ping requests to see which hosts are alive.
•	List Scan (-sL):
Lists targets by resolving DNS names but does not send any packets to the host.

Port Scanning Countermeasures
•	Configure firewalls and intrusion detection systems (IDS) to detect and block scans.
•	Regularly scan your own network to test defenses.
•	Ensure routers and firewalls are updated.
•	Use custom firewall rules to block unwanted ports.
•	Filter ICMP messages.
•	Test anti-scanning and anti-spoofing rules.

Nmap Port States 
Demystifying Nmap Port States: Open or Closed, maybe?
Nmap, a popular port scanner, helps identify open ports on a target device, revealing potential vulnerabilities. But Nmap doesn't always provide a definitive answer. Here is a breakdown of the different port states Nmap reports:
•	Open: This is the good news for attackers (and the bad news for defenders). An open port means a service is actively listening for incoming connections, indicating potential attack surfaces.
•	Closed: This might seem like a good thing, but it's not always definitive. A closed port simply means no service is actively listening now. However, it could be opened in the future.
•	Filtered: This is where things get tricky. A filtered port suggests a firewall or other security measure is blocking Nmap's scan, making it impossible to determine if the port is truly open or closed.
•	Unfiltered: This is another ambiguous state. Nmap can access the port, but it can't tell if it's open or closed. This could be due to the target device's specific configuration.
•	Open filtered: This combines the uncertainty of open and filtered. Nmap suspects the port might be open, but the firewall is making it difficult to be sure.
•	Closed filtered: Like open filtered, Nmap leans towards closed but can't be certain due to filtering.

In Summary:
While Nmap provides valuable insights, these port states highlight the limitations of automated scanning. Firewalls and other security measures can make it challenging to get a complete picture of a target device's vulnerabilities.
For a more comprehensive understanding, consider combining Nmap scans with other techniques like vulnerability scanners and manual analysis.



Nmap Advance Port Scan
•	Fragment Scan
•	Data Length Scan
•	TTL Scan
•	Source Port Scan
•	Decoy Scan

# Techniques Used for Network Reconnaissance:

•	DNS Enumeration: Extracting information by querying DNS servers for zone transfers (if allowed).
•	SNMP Enumeration: Extracting usernames and other details using the Simple Network Management Protocol.
•	SMTP Enumeration: Techniques to gather information about email servers, potentially revealing usernames.
•	Port Scanning: Tools like nmap can scan a target network to identify open ports and running services.
•	Social Engineering: Tricking users into revealing information about the network.


# Ping  

Ping  

What is Ping?
•	Ping is a tool used to check which devices (hosts) are active on a network.
•	It works by sending a special message called an ICMP Echo Request to many IP addresses.
•	If a device is active, it responds with an ICMP Echo Reply.

How Attackers Use Ping in Azure:
•	Attackers first figure out the network size using tools called Subnet Mask Calculators. This tells them how many devices could be on the network.
•	Then, they perform a "ping sweep" — sending ping requests to all IP addresses in the subnet to find out which devices are live.


Common ICMP Message Types

ICMP Type	Name	Description
0	Echo Reply	Response to a ping request
3	Destination Unreachable	Host or network can't be reached
 	 	- 0: Network Unreachable
 	 	- 1: Host Unreachable
 	 	- 2: Protocol Unreachable
 	 	- 3: Port Unreachable
 	 	- 9: Network blocked by admin rules
 	 	- 10: Host blocked by admin rules
 	 	- 13: Communication blocked administratively
8	Echo	Ping request message
11	Time Exceeded	Packet took too long or couldn’t be reassembled


Ping Sweep Tools
•	Angry IP Scanner: Scans IP addresses by sending pings to see which are alive. It can also find hostnames, MAC addresses, and open ports.
•	SolarWinds Engineer Toolset (Ping Sweep): Scans a range of IP addresses to find which are active or free, and can perform reverse DNS lookups.


# OS and Service Detection


1. Detect Operating System
nmap 10.10.10.10 -O
•	Nmap tries to identify the OS by analyzing how the target responds to network probes.
•	For best results, the target should have at least one open and one closed port.
•	Add -v for more verbose output:
nmap -O -v 10.10.10.10
•	If scanning many hosts, use --osscan-limit to skip OS detection for systems that don't meet the required conditions:
nmap -O --osscan-limit 10.10.10.10
2. Submit TCP/IP Fingerprints
•	If Nmap cannot identify the OS, it will show a fingerprint.
•	You can submit this fingerprint to Nmap for analysis at: [www.nmap.org/submit/](https://nmap.org/submit/)
nmap -O 10.10.10.10
3. Guess Unknown Operating System
nmap -O --osscan-guess 10.10.10.10
•	Nmap will try to guess the OS and show a list of likely matches.
________________________________________
🔧 Service Version Detection
4. Detect Service Versions
nmap -sV 10.10.10.10
•	Shows software and version info for open ports.
•	Some ports are skipped by default (e.g., 9100–9107). To include all ports:
nmap -sV --allports 10.10.10.10
5. Troubleshoot Version Scanning
nmap -sV --version-trace 10.10.10.10
•	Helps troubleshoot version detection by showing detailed trace output.
________________________________________
📡 RPC Scan
6. Scan for Remote Procedure Call Services
nmap -sR 10.10.10.10
•	Scans the system for RPC (Remote Procedure Call) services.




# Network Reconnaissance and Vulnerability Analysis

**Network Reconnaissance**
Network reconnaissance is the initial phase of an attack where attackers gather information about a target network. This information helps identify vulnerabilities and plan attack strategies.

**Network Vulnerability Analysis**
Network enumeration is the process of discovering hosts, services, and vulnerabilities on a network. It is a crucial step in penetration testing and security assessments.

**Network Scanning**
Network scanning is the process of identifying active devices on a network and gathering information about them.

Nmap is a valuable tool for network administrators and security professionals, but it must be used responsibly and with proper authorization. Always prioritize network security and avoid causing harm or disruption.

---

# Information Gathered During Network Reconnaissance

The following information may be collected during reconnaissance activities:

* Domain names (internal and external) — Examples: `example.com`, `mail.example.com`, `corp.local`, `hr.internal.example.com`

* IP addresses and network blocks — Examples: `192.168.1.10`, `203.0.113.25`, `10.0.0.0/16`, `192.168.1.0/24`

* Network protocols in use — Examples: TCP, UDP, HTTP, HTTPS, DNS, SMB, LDAP, SSH, FTP, SNMP

* Rogue or private websites — Examples: `http://dev-test.local`, `https://fileshare-company.xyz`, unauthorized internal admin portal

* Running TCP and UDP services — Examples: TCP 22 (SSH), TCP 80 (HTTP), TCP 443 (HTTPS), UDP 53 (DNS), UDP 161 (SNMP)

* Authentication methods — Examples: Password authentication, Multi-Factor Authentication (MFA), Kerberos, NTLM, LDAP authentication, Smart Cards

* Access control mechanisms and ACLs — Examples: Firewall ACL allowing only `10.0.0.0/24`, Role-Based Access Control (RBAC), file permissions, network segmentation rules

* VPN access points — Examples: `vpn.example.com`, Cisco AnyConnect gateway, OpenVPN server, IPsec VPN concentrator

* Intrusion Detection Systems (IDS) status — Examples: Snort detected, Suricata alerts enabled, IDS blocking scan attempts

* Analog and digital telephone numbers — Examples: `+1-555-0100`, PBX extension `1001`, VoIP/SIP endpoint `sip.example.com`

* Operating systems and software versions — Examples: Windows Server 2022, Ubuntu 22.04, Apache HTTP Server 2.4.58, OpenSSH 9.3, Microsoft SQL Server 2019


---

# Network Footprinting

Network footprinting is the process of gathering information about a target system or network.

The process of identifying a target’s operating system and software versions is known as TCP/IP fingerprinting.

---

# Performing Network Reconnaissance Using Packet Analysis

Performing network reconnaissance using packet analysis involves a structured approach combining technical tools and analytical skills.

## 1. Planning and Scope Definition

### Define Objectives

* Determine the information to gather:

  * Network topology
  * Active hosts
  * Running services
  * Potential vulnerabilities
* Define the scope:

  * Specific network segment
  * Target IP address
  * Entire environment

### Legal and Ethical Considerations

* Ensure proper authorization before conducting reconnaissance.
* Comply with all applicable laws and regulations.

---

## 2. Packet Capture

### Choose a Capture Tool

* Wireshark — GUI-based packet capture and analysis
* tcpdump — Command-line packet capture utility

### Select the Capture Interface

* Identify the network interface carrying target traffic.

### Enable Promiscuous Mode (if required)

* Allows capturing all traffic on a network segment.

### Capture the Traffic

* Start capturing traffic for sufficient duration.
* Use capture filters to reduce unnecessary data and focus on:

  * IP addresses
  * Ports
  * Protocols

---

## 3. Packet Analysis

### Filtering and Decoding

* Use display filters in Wireshark to isolate relevant traffic.
* Decode packets to analyze:

  * Network layer
  * Transport layer
  * Application layer

### Network Layer Analysis

* Identify active hosts and topology using IP addresses.
* Analyze IP headers and routing behavior.
* Detect unusual or suspicious traffic.

### Transport Layer Analysis

* Identify open ports and running services.
* Analyze TCP and UDP communication patterns.
* Detect:

  * Port scanning
  * Reconnaissance activity

### Application Layer Analysis

Analyze protocols such as:

* HTTP
* DNS
* SSH
* LDAP
* SMB

Look for:

* Unencrypted credentials
* Information leakage
* Misconfigurations

### Identifying Anomalies

Look for:

* Excessive port scanning
* Unusual protocols or services
* Unexpected host communication
* Large data transfers

---

## 4. Documentation and Reporting

### Document Findings

* Record all relevant information gathered during reconnaissance.

### Create a Report

Include:

* Summary of findings
* Identified vulnerabilities
* Security risks
* Recommendations

---

# Common Tools Used in Network Reconnaissance

* Wireshark — Detailed packet analysis
* tcpdump — Command-line packet capture
* Nmap — Network scanning and enumeration
* whois — Domain registration information lookup
* arp — View and manipulate ARP tables

---

# Services and Ports Commonly Enumerated

| Port | Protocol | Service                                      |
| ---- | -------- | -------------------------------------------- |
| 22   | TCP      | Secure Shell (SSH)                           |
| 25   | TCP      | Simple Mail Transfer Protocol (SMTP)         |
| 53   | TCP/UDP  | Domain Name System (DNS)                     |
| 135  | TCP/UDP  | Microsoft RPC Endpoint Mapper                |
| 137  | UDP      | NetBIOS Name Service (NBNS)                  |
| 139  | TCP      | NetBIOS Session Service                      |
| 161  | UDP      | Simple Network Management Protocol (SNMP)    |
| 162  | TCP/UDP  | SNMP Trap                                    |
| 389  | TCP/UDP  | Lightweight Directory Access Protocol (LDAP) |
| 445  | TCP/UDP  | SMB over TCP                                 |
| 500  | UDP      | ISAKMP / Internet Key Exchange (IKE)         |
| 2049 | TCP      | Network File System (NFS)                    |
| 3268 | TCP/UDP  | Global Catalog Service                       |

---

# Network Scanning Challenges and Limitations

## Security Devices

Firewalls, routers, proxy servers, and other security devices can:

* Block scans
* Distort results
* Provide misleading information

Scanning remote hosts outside the local network may not always produce accurate results.

## Privilege Requirements

Some advanced scanning techniques require elevated privileges such as:

* sudo
* Administrator access

---

# Ethical and Legal Considerations

## Permission is Required

Scanning networks without authorization is illegal and may result in:

* ISP complaints
* Legal action
* Government investigation

Do not scan organizations such as:

* Federal Bureau of Investigation
* United States Secret Service

without explicit authorization.

## Respect for Systems

Aggressive scanning may:

* Crash systems
* Cause downtime
* Lead to data loss

Always use caution when scanning mission-critical systems.

---

# Scanning IP Blocks

Attackers may scan IP address ranges allocated to organizations to identify:

* Active hosts
* Services
* Vulnerabilities
* Network structure

Public IP addresses are often assigned in sequential blocks, making targeted scanning easier.

---

# Port Scanning

There are:

* 65,535 TCP ports
* 65,535 UDP ports

Port scanning helps identify:

* Open ports
* Running services
* Potential attack surfaces

---

# Useful Nmap Commands

### Display Host Networking and Routing Information

```bash
nmap --iflist
```

### Trace Packets for Connectivity Troubleshooting

```bash
nmap --packet-trace 172.16.1.10
```

### Scan Using a Specific Network Interface

```bash
nmap -e eth0 172.16.1.10
```

---

# Key Considerations

* Packet analysis can expose sensitive information.
* Handle captured data securely.
* Continuously update knowledge of:

  * Network protocols
  * Security practices
  * Emerging threats

By understanding reconnaissance techniques and tools, organizations can strengthen defenses and reduce the risk of information disclosure and unauthorized access.

