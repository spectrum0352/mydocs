# Recon Organization

Information to gather about organization:

* Employee details and directory
* Address and phone numbers
* Organization's website, locations
* Company directory
* Comments in HTML source code,
* Security policies implemented,
* Web server links relevant to the organization,
* Background of the organization,
* News articles and Press releases

* Collected from open sources (OSINT) to understand the broader context:
* •	Corporate Website: Pages, links, subdomains, public-facing infrastructure
* •	HTML Comments: Hidden metadata or developer notes in web code
* •	Employee Details: Names, job titles, email formats
* •	Company Directory: Internal or leaked directory structures
* •	Contact Details: Office addresses, phone numbers
* •	Security Policies: Public or leaked policy documents
* •	Background Info: From news articles, press releases, and social platforms
* •	Geographic Data: Locations of offices, data centers, or remote sites

Organizational Reconnaissance
🔍 Purpose:
Organizational reconnaissance focuses on gathering publicly available or easily accessible information about the target company. This helps identify potential attack vectors, social engineering opportunities, and infrastructure weak points.

🗂️ 1. Corporate Identity & Background
Information that defines the organization's public image and internal structure:
•	Organization’s Website: Structure, subdomains, exposed links
•	Company Directory: Departmental structure, roles, internal hierarchy
•	Corporate Locations: Office locations, data centers, cloud region hints
•	Background Details: History, mission, services, industry partnerships
•	Press Releases & News Articles: Public communications and changes (e.g., mergers, security initiatives)

👥 2. Employee & Contact Information
Used for social engineering and user enumeration:
•	Employee Names & Titles: From LinkedIn, website, or directory listings
•	Contact Numbers: Office phone numbers (landlines/mobile), helpdesk lines
•	Email Formats: To guess valid addresses for phishing or brute-force attempts
•	Internal Directories (if accessible): Names, departments, job roles

🌐 3. Web & Metadata Discovery
Data hidden in plain sight that could aid enumeration or exploitation:
•	HTML Comments in Source Code: Developer notes, versioning, internal IPs or paths
•	Web Server Links: Internal references, APIs, staging/test environments
•	Security Policy Documents: Publicly shared policies that reveal system architecture or compliance models

✅ Summary Table
Category	Details Collected
Corporate Identity	Website, locations, company background, news, press releases
Employee Information	Employee names, roles, contact info, directories
Web & Metadata	HTML comments, internal links, published policies

This reconnaissance phase supports phishing, social engineering, cloud asset discovery, and indirect infrastructure mapping in later stages of the Azure penetration test.


✅ Validation of Categories and Techniques
Technique	Accurate?	Explanation
Active Scanning	✅	This includes tools like Nmap or hping3 that send packets to discover live hosts and services — standard in penetration testing.
Collecting Host Information	✅	Identifying hostnames, operating systems, banners, and configurations is critical for system enumeration.
Collecting Identity Information	✅	Gathering usernames, groups, email formats, etc., supports account enumeration and password spraying attacks.
Collecting Network Information	✅	Mapping out the network (IPs, subnets, domains, services) is a core recon task.
Collecting Organizational Information	✅	Company structure, employees, policies, and infrastructure all feed into social engineering and passive discovery.
Phishing for Information	✅	A well-known and common social engineering method to collect credentials or access links.
Searching Closed Sources	✅	Valid technique, often overlooked. Includes dark web forums, private threat intel feeds, and breach data (e.g., HaveIBeenPwned).
Searching Open Technical Databases	✅	Platforms like Shodan, Censys, GitHub, and Pastebin are frequently used to find leaked credentials or exposed services.
Searching Open Websites and Domains	✅	OSINT from company websites, blogs, and news sources helps map infrastructure and personnel.
Searching Victim-Owned Websites	✅	Targets may leak internal information through their own portals, comment sections, APIs, or staging sites.

📌 Summary:
•	The list is accurate and reflects real-world Azure pentest practices.
•	It aligns with both MITRE PRE-ATT&CK and OSINT/Recon frameworks.
•	You’ve covered both passive and active recon methods.
•	It includes cloud-specific focus (e.g., victim-owned Azure assets), which is crucial for Azure environments.



Purpose 
1.	Understand Security Posture
Learn how secure the organization’s Azure environment is from the outside.
2.	Narrow the Attack Surface
Focus only on useful information like Azure IP ranges, DNS names, subdomains, virtual networks, and remote login options (e.g., RDP, SSH).
3.	Find Vulnerabilities
Identify weaknesses in public-facing services (like misconfigured storage accounts or exposed APIs).
4.	Map the Network
Build a logical layout of the Azure setup – such as regions used, exposed services, traffic flows, or dependencies.
•	To learn about the target’s external security setup.
•	To narrow down the area to focus the attack (like specific IP addresses or domain names).
•	To find weak points or vulnerabilities in the target’s systems.
•	To create a map of the target’s network and understand its structure.
Objectives of Footprinting:
•	Understanding Security Posture: Identify the target's overall security strength and weaknesses.
•	Reducing Attack Scope: Refine the attack focus to specific areas like IP ranges, networks, or services.
•	Identifying Vulnerabilities: Discover exploitable weaknesses in systems to choose the most effective attack methods.
•	Mapping the Network: Create a layout of the target network infrastructure to understand its architecture.

What is the Objective of Footprinting?
The main goal is to gather as much information as possible about the target's network and security. This helps penetration testers or attackers understand where the weaknesses are and how to plan their next steps.

Key Information Collected During Footprinting:
•	Domain names (websites and internal domains)
•	IP address ranges and network blocks
•	Active devices and services running on TCP/UDP ports
•	Security defenses like firewalls, VPNs, and access controls
•	Telephone and communication lines
•	System details like operating system and software versions

Strategies
•	Use public sources like websites, social media, and DNS records
•	Scan networks and ports to find active systems
•	Check for security measures like firewalls or VPN gateways
•	Analyze domain registration details and email servers


