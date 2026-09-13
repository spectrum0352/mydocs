# Introduction

**Penetration Testing (Pentesting)** is the ethical hacking of a system to identify vulnerabilities. It's crucial for assessing and improving system security.

**Key Points:**

- **Legality:** Only perform hacking with explicit, written permission. Hacking without consent is illegal.

- **Purpose:** Pentesting aims to find and exploit vulnerabilities like a hacker, but with the goal of improving security.

- **Process:** It involves various levels of testing, from simple vulnerability scans to complex attack simulations (red teaming).

- **Skills:** Requires technical knowledge, understanding of security principles, and a hacker mindset.

- **Benefits:** Helps identify risks, prioritize security improvements, meet compliance standards, and offers career opportunities.

Differences between Pentesting and Criminal Hacking:

- **Authorization:** Pentesters have legal permission; criminals do not.

- **Responsibility:** Pentesters clean up after testing; criminals cause damage.

- **Cost:** Pentesting is often less costly than the damage caused by a real attack.

**In essence, Pentesting is a controlled, authorized attack used to strengthen system defenses.**

What is Penetration Testing?

**Penetration testing**, also known as **pen testing**, simulates real-world cyberattacks on a system with the owner’s permission. Ethical hackers use this technique to evaluate security defenses and uncover weaknesses. Here’s what you need to know:

1.  **Definition**: Penetration testing involves testing a computer system, network, or application for security flaws using a mix of tools and techniques that real hackers would employ.

2.  **Objective**: The primary goal is to identify security concerns, including system vulnerabilities, compliance gaps, and flaws in threat identification protocols.

3.  **Methods**: Pen testers combine automated tools with manual practices to simulate attacks. They scan systems, analyze results, and verify weak points.

4.  **Reporting**: The result of a pen test is a detailed report. It informs IT managers about discovered flaws, exploits, and steps to improve system defenses.

Why is Penetration Testing Important?

1.  **Risk Mitigation**: Pen tests help organizations proactively address vulnerabilities before malicious actors exploit them.

2.  **Compliance**: Penetration testing ensures compliance with data privacy and security regulations (such as PCI, HIPAA, and GDPR).

3.  **Security Awareness**: It reveals gaps in security awareness across teams, promoting a culture of vigilance.

4.  **Incident Response**: Identifying weaknesses improves incident response plans.

Popular Penetration Testing Tools

- **Metasploit**: A powerful framework for developing, testing, and executing exploits.

- **Nmap**: A versatile network scanner.

- **Burp Suite**: For web application security testing.

- **Wireshark**: Analyzes network traffic.

- **OWASP Zap**: Web app vulnerability scanner.

Remember, penetration testing is an ongoing process. Regular assessments help maintain robust security defenses and protect against costly breaches. So, embrace ethical hacking and safeguard your digital assets!

Penetration Testing

Penetration testing, commonly known as “pen testing,” involves assessing security by simulating real-world cyberattacks with the owner’s permission. Here is a summary:

1.  **Definition**: Penetration testing evaluates vulnerabilities, attempting to exploit them to gain unauthorized access (akin to ethical hacking).

2.  **Importance**:

    - **Risk Mitigation**: Identifies weaknesses before malicious actors do.

    - **Security Risk Severity**: Helps prioritize remediation efforts.

    - **Compliance**: Required for standards like PCI DSS.

    - **Career Opportunities**: Offers exciting job prospects.

    - 

3.  **Popular Synonyms**:

    - Ethical Hackers

    - Offensive Security

    - Adversarial Security

Threat and Vulnerability Management

Pre-engagement Interactions

- Introduction to Scope

- Metrics for Time Estimation

- Questionnaires

- Specify Start and End Dates

- Specify IP Ranges and Domains

- Dealing with Third Parties

- Report delivery

Difference between the Red team and blue team?

- Red team and blue team refers to cyberwarfare.

- Many organizations split the security team into two groups as red team and blue team. The red team refers to an attacker who exploits weaknesses in an organization's security.

- The blue team refers to a defender who identifies and patches vulnerabilities into successful breaches.

| Type | Vulnerability Assessment | Penetration Testing (Ethical Hacking) |
|----|----|----|
| Scan or Attack | VA is primarily a scan and evaluation of security | Pen Test simulates a cyberattack and exploits discovered vulnerabilities |
| Is my Network Destroyed? | No | Pen test teams have multiple safety measures in place to limit any impacts to the network. Pen testers can create two lists to exclude activities and devices. Exclude Activities List: Denial of Service Attack Exclude Devices: Exclude those routers having Highest importance. |
| Known or Unknown? | VA search systems for known vulnerabilities | Pend testing search for unknown vulnerabilities in environment |
| Automation | VA scan can be Automated | Difficult to Automate |
|  | VA scanners attempt to check open ports, security misconfigurations, running old versions OS/Software's, unauthorized changes to environment, malware infections or employee violating control policies. | Attempt to analyze insecure business processes, security misconfigurations or other weaknesses that other threat actors can exploit. Attempt to check transmission of unencrypted passwords, password reuse, forgotten DB storing credentials. |
| Who will conduct? | Enterprises internal Cyber Security Team. Does not require a high skill level | Third party Vendor Requires a great deal of skill |
| Frequency | Daily/Weekly/Monthly/Quarterly Specially Events: Changes in Network Changes in Devices Changes in Process Changes in Software's And OS. | Half Yearly / Yearly Special Events: Changes in Network Perimeter Changes in Internet Facing firewalls |
| Focus | Lists known software vulnerabilities that could be exploited | Discovers unknown and exploitable weaknesses in normal business processes |
| Value | Detects when equipment could be compromised | Identifies and reduces weaknesses |
| Reports | Provide a comprehensive baseline of what vulnerabilities exist and what changed since the last report | Concisely identify what data was compromised |

PenTest Pre-engagement Interactions

- Introduction to Scope

- Metrics for Time Estimation

- Questionnaires

- Specify Start and End Dates

- Specify IP Ranges and Domains

- Dealing with Third Parties

- Report delivery

Difference between the Red team and blue team?

- Red team and blue team refers to cyberwarfare.

- Many organizations split the security team into two groups as red team and blue team. The red team refers to an attacker who exploits weaknesses in an organization's security.

- The blue team refers to a defender who identifies and patches vulnerabilities into successful breaches.

Where to start Pen Test?

Getting started in pen testing involves building a foundation and creating a practice environment.

**Prerequisites:**

- **No IT Experience:** Learn operating systems, hardware, and networking basics.

- **IT Experience:** Focus on Linux, security, and networking.

- **InfoSec Experience:** Address any knowledge gaps, explore pen testing/hacking, participate in CTFs and bug bounties.

- **Everyone:** Build a practice lab (home lab).

**Building a Home Lab:**

- **Lab Setup:** Choose from minimalist (virtual machines), dedicated computer, or advanced setups with physical hardware.

- **Attack Platform:** Use Kali Linux, Parrot OS, Ubuntu with a Pen Tester Framework (PTF), or Windows 10 with Commando VM.

- **Target Systems:** Create vulnerable target VMs using VulnHub.com (Metasploitable, OWASP WebGoat) or build your own with Exploit-DB.

**Learning Resources:**

- Penetration Testing: A Hands-On Introduction to Hacking

- The Hacker's Playbook 2 & 3

- The Web Application Hacker's Handbook: Discovering and Exploiting Security Flaws

- RTFM: Red Team Field Manual

**Ethical Hacking and Legal Considerations:**

- **Ethical hacking principles:** Discuss the importance of ethical hacking, including the need for written authorization, respecting privacy, and avoiding unauthorized access.

- **Legal implications:** Explore the legal aspects of penetration testing, such as compliance with laws like GDPR, CCPA, and local regulations.

Network PenTest is a simulated cyberattack used to identify vulnerabilities in a network. It involves using hacking techniques to assess network security and propose improvements.

**Key Areas**

- **Network Fundamentals:** Understanding network layers (Data Link, Internet, Transport), protocols, and devices.

- **Network Scanning:** Using tools like Nmap for port scanning and service discovery.

- **Packet Analysis:** Capturing and analysing network traffic with tools like Wireshark.

- **Vulnerability Assessment:** Identifying weaknesses in network infrastructure, configurations, and authentication.

- **Exploitation Techniques:** Using tools like Metasploit to simulate attacks and gain unauthorized access.

- **Lateral Movement:** Testing the ability to move within a compromised network.

- **Evasion Techniques:** Bypassing security measures like firewalls.

- **Wireless Network Pentesting:** Assessing the security of wireless networks.

**Defensive Measures**

- **Perimeter Protection:** Firewalls, web application firewalls.

- **Secure Connections:** SSL for databases, VPN with Azure AD authentication for remote access.

- **Network Segmentation:** Using tools like Azure NSG and Vnet Service Endpoints.

**Tools and Technologies**

- **Operating Systems:** Kali Linux, Windows.

- **Virtualization:** VirtualBox, VMware.

- **Network Analysis:** Wireshark, Nmap, Metasploit.

- **Cloud Platforms:** Azure.

In essence, a Network PenTest aims to identify and mitigate risks by simulating real-world attacks on a network.

# PenTest

- How to prevent Rainbow attack? (Partially relevant - understands password hashing)

- How would you bypass AV? (**Red Flag!** Malicious intent)

- How would you compromise an “office workstation” at a hotel? (**Red Flag!** Malicious intent)

- How would you tamper with a hotel "office workstation"? (**Red Flag!** Malicious intent)

<!-- -->

- If you were going to break into a database-based website, how would you do it?

- What are your biggest bounties you have earned?

**Penetration testing** is a simulated cyberattack performed on a computer system to evaluate its security. It is conducted by ethical hackers, or penetration testers (Pentesters), who use the same tools and techniques as malicious attackers.

**Key Points:**

- **Ethical Hacking:** This is the authorized practice of hacking to identify vulnerabilities.

- **Penetration Testing:** A simulated attack to expose vulnerabilities.

- **Hacker Types:** Different types of hackers exist, including black hat (malicious), white hat (ethical), and grey hat (mix of both).

- **Penetration Testing Phases:** Generally, involves reconnaissance, scanning, gaining access, maintaining access, and covering tracks.

- **Testing Types:**

  - **Black Box:** Tester has no prior knowledge of the system.

  - **Grey Box:** Tester has limited information about the system.

  - **White Box:** Tester has full access to the system.

**In essence:** Penetration testing helps organizations identify and address security weaknesses before malicious actors can exploit them.

**Information Security Threats and Attacks**

Cyberattacks are driven by a combination of motive, method, and vulnerability. Common motives include financial gain, disruption, data manipulation, and causing fear. Attack vectors range from cloud-based threats to insider threats.

Threat Categories:

- **Network Threats:** Involve attacks on network infrastructure like sniffing, spoofing, DDoS, and DNS/ARP poisoning.

- **Host Threats:** Target individual systems with malware, unauthorized access, and privilege escalation.

- **Application Threats:** Exploit vulnerabilities in software, such as SQL injection and cross-site scripting.

**Ethical Hacking (Penetration Testing)**

Ethical hacking involves simulating attacks to identify vulnerabilities before malicious actors exploit them. It differs from vulnerability assessment by proving exploitability.

**Types of Hackers:** Black hat (malicious), grey hat (mix of both), white hat (ethical), hacktivist (motivated by activism), script kiddie (less skilled attacker).

**Phases of Hacking:** Reconnaissance (gathering information), scanning (identifying vulnerabilities), gaining access, maintaining access, covering tracks.

**Testing Types:**

- **Black box:** No prior knowledge of the system.

- **Grey box:** Limited internal information.

- **White box:** Complete access to system and source code.

**Security Controls**

Security controls aim to protect systems and data.

- **Physical Controls:** Address physical security measures like access control, environmental controls, and equipment protection.

- **Logical Controls:** Focus on software and network security, including firewalls, user permissions, and multi-factor authentication.

 

# PenTest Types

Penetration testing (Pentesting) is a simulated cyberattack used to identify vulnerabilities in a system or network.

There are various types of Pentesting based on different factors:

Types of Pentesting Based on Target

- **Network Pentesting**: Evaluates network infrastructure, firewalls, and routers.

- **Web Application Pentesting**: Focuses on web applications, APIs, and databases.

- **Wireless Network Pentesting**: Assesses Wi-Fi security.

- **Social Engineering Pentesting**: Tests human vulnerabilities.

- **Physical Pentesting**: Targets physical security measures.

Types of Pentesting Based on System Knowledge

- **Black Box Testing**: The tester has no prior knowledge of the system.

- **White Box Testing**: The tester has complete knowledge of the system.

- **Grey Box Testing**: The tester has limited knowledge of the system.

Programming Languages Used in Pentesting

- **Python**: Widely used for socket programming and scripting.

- **Java**: Used to create backdoors and other malicious tools.

- **C and C++**: Commonly used for system-level programming and exploit development.

- **Ruby**: Popular for developing penetration testing tools like Metasploit.

Additional Notes:

- Network Pentesting can be further categorized into internal, external, and wireless.

- Application Pentesting can target web apps, thick clients, mobile apps, and cloud environments.

- Hardware Pentesting includes network devices, IoT devices, and medical devices.

- Transportation and building security can also be assessed through Pentesting.

By understanding these different types of Pentesting, organizations can effectively identify and mitigate vulnerabilities in their systems.

**What is the difference between a black hat and a white hat?**

**What is the difference between deep web and dark web**

# Summary

This document covers penetration testing, a process that simulates cyber-attacks to identify security weaknesses in computer systems and networks.

**Key Concepts:**

- **Penetration Testing (Pen Testing):** Authorized attempt to find and exploit vulnerabilities in a system. It helps identify security holes, but not their absence.

- **Penetration Study:** Comprehensive evaluation of security controls through pen testing. It includes suggestions for fixing vulnerabilities and understanding their causes.

- **Lifecycle:** Phases of a pen test: information gathering, scanning, exploitation, reporting.

- **Tools:** Recommended tools include Kali Linux, Dradis, MagicTree, ThreadFix, and nmap.

- **Types of Pen Testing:**

  - **Black-box:** Tester has no prior knowledge of the system (simulates external attacker).

  - **Grey-box:** Tester has some architectural details or credentials.

  - **White-box:** Tester has full access to system information (source code, architecture).

**Determining Scope:**

- Define who authorizes the test, its purpose, timeframe, and who needs to be informed.

- Specify documentation provided (IP ranges, applications, databases).

- Set conditions for stopping the test, permission for exploiting vulnerabilities, and legal considerations.

- Determine if social engineering or physical security testing is included.

**Important Aspects:**

- Take good notes throughout the testing process (setup, procedures, tools, results, follow-ups).

- Prioritize and validate gathered information during information gathering.

**Information Gathering Techniques:**

- Network scanning to identify live IP addresses and services.

- Service scanning to identify service versions, operating systems, and potential vulnerabilities.

- Tools like nmap for scanning and fingerprinting.

- Gathering information from publicly available sources (WHOIS database).

**Metasploit Framework:**

- A powerful tool for pen testing, automating tasks and storing results in a database.

- Offers workspaces for different projects and integrates with nmap.

**CVE Database:**

- Common Vulnerabilities and Exposures (CVE) is a reference for publicly known vulnerabilities.

- Metasploit can search for exploits related to specific CVEs.

**Pentest Reporting:**

- Report should cover the scope, scanned systems, goals, exclusions, and discovered vulnerabilities.

- Each vulnerability should be described with its risk, impact, exploitability, and affected systems.

- Include evidence, recommendations, and references.

**Additional Resources:**

- OWASP Testing Guide: <https://owasp.org/www-project-web-security-testing-guide/assets/archive/OWASP_Testing_Guide_v4.pdf>  

- OWASP Reporting Guide: <https://cheatsheetseries.owasp.org/cheatsheets/Vulnerability_Disclosure_Cheat_Sheet.html>  

- Certified Ethical Hacker (CEH) certification

**Note:** This summary removes duplicates, clarifies some points, and maintains a consistent structure.

# Concepts

Advanced Persistent Threat (APT)

**An APT is a sophisticated and sustained cyberattack where intruders gain unauthorized access to a network and remain undetected for an extended period.** These attacks are typically carried out by nation-states or state-sponsored groups with significant resources and expertise.

**Key characteristics of APTs include:**

- **Stealthy and persistent:** Attackers carefully avoid detection while maintaining long-term access to the target network.

- **Targeted:** APTs focus on specific high-value targets like governments, large corporations, or critical infrastructure.

- **Destructive:** The goal is often to steal sensitive data, disrupt operations, or undermine organizational missions.

- **Complex:** These attacks require advanced technical skills and significant planning.

By understanding the nature of APTs, organizations can better protect themselves against these advanced threats.

Attack and Related Terms

- **Attack Vector:** The path an attacker uses to exploit a vulnerability.

- **Attack:** A malicious action to compromise a system's security.

- **Attacker:** An individual or entity with malicious intent.

- **Backdoor:** A hidden entry point into a system.

Attack Methods and Techniques

- **Birthday Attack:** A brute-force attack leveraging probability to crack passwords.

- **Black Box Testing:** Testing a system without knowing its internal workings.

- **Blind Test:** A simulated attack using public information.

- **Blue Snarfing:** Stealing information via a Bluetooth connection.

- **Bluejacking:** Unauthorized access to a Bluetooth device.

- **Buffer Overflow:** Overloading a system's memory to execute malicious code.

- **Chosen Ciphertext Attack:** Decrypting parts of a message to break encryption.

Security Assessment and Testing

- **Code Review and Testing:** Analysing code for vulnerabilities and errors.

Security Channels

- **Covert Storage Channel:** Unauthorized data transfer through system storage.

- **Covert Timing Channel:** Unauthorized data transfer by manipulating system resources.

These terms provide a foundation for understanding various aspects of cybersecurity, including attack methodologies, testing techniques, and potential vulnerabilities.

Dark Web

The dark web is a hidden part of the internet not accessible through regular search engines. It's like a secret club with its own entrance requirements. Here is the key takeaway:

- **Hidden:** You cannot find dark web content with Google or Bing.

- **Exclusive Access:** Special software and potentially invitations are needed to enter.

- **Illicit Activity:** The dark web is infamous for illegal marketplaces selling drugs, weapons, and even people.

- **Not All Bad:** There are also legitimate uses, like accessing censored information in repressive regimes.

**Important to remember:** While the dark web offers anonymity, it can be a dangerous place. Avoid illegal activities and be cautious when entering this hidden part of the internet.

Exploit

**An exploit is a term used in computing to describe the act of taking advantage of a vulnerability in a computer system.**

This can refer to:

- **Exploit software:** The malicious code used to attack a system.

- **The act of exploiting:** When someone successfully compromises a computer system.

- **The vulnerability itself:** The weakness in the system that is exploited.

Essentially, an exploit is any method or tool used to bypass a system's security measures for malicious purposes.

External Insider

**An external insider is someone who launches an insider attack from outside the organization's network.**

This often involves tricking employees into compromising the network, such as by sending malicious emails with harmful attachments. Once opened, these attachments can install malware, giving the attacker remote control over the compromised computer.

Security Testing:

- **Functional Testing:** Checks if advertised security features work as intended.

- **Penetration Testing (Pentest):** Simulates an attack to find weaknesses in a system's defenses.

- **Gray-Box Testing:** Tests a system with some knowledge of its internal workings.

- **White-Box Testing:** Tests a system with full knowledge of its internal workings.

Attacks:

- **Phishing:** Tries to trick you into clicking a malicious link or giving away personal information.

- **Vishing:** Phishing done over the phone.

- **Whaling:** Phishing targeted at high-ranking officials.

- **Social Engineering:** Uses deception to manipulate people into giving away information.

- **Man-in-the-Middle (MitM) Attack:** Intruder intercepts communication between two parties.

- **Zero-Day Attack:** Exploits a previously unknown vulnerability.

Security Tools and Techniques:

- **Honeypot:** A decoy system designed to attract and trap attackers.

- **John the Ripper:** A password cracking tool.

- **Obfuscation:** Hiding information to make it harder to understand.

- **Padding:** Adding dummy data to disguise the actual data being transmitted.

- **Passive Wiretapping:** Monitoring communication without altering it.

- **Zero-Knowledge Proof:** Verifies someone's identity without revealing their secret information.

Other:

- **Work Factor:** The effort needed to overcome a security measure.

- **Teardrop Attack:** A DoS attack that crashes a system by overwhelming it with fragmented packets.

- **USB Seeding:** Leaving infected USB drives for people to find and use.

# PenTesting Learning Resources

That is a great list of resources to get you started with PenTesting! Here's a breakdown of some options to consider based on your learning style and goals:

Platforms with Labs:

- **SANS Institute:** Offers a wide range of penetration testing courses, some with hands-on labs. These courses can be expensive, but highly regarded in the industry.

- **eLearnSecurity:** Provides penetration testing training with labs, ranging from beginner to advanced levels.

- **Virtual Hacking Labs (VHL):** Offers a subscription service with various penetration testing labs for practicing your skills.

- **Pentester Academy:** Features video courses on different pen testing specialties with associated labs.

- **Pentester Lab:** Provides a platform with vulnerable systems to practice penetration testing techniques.

- **Practical Pentest Labs:** Offers labs with real-world scenarios to test your pen testing skills.

Free Resources:

- **Bugcrowd University:** Features free courses and resources on security topics, including some related to penetration testing.

- **SANS Pentesting Blog:** Offers articles and write-ups on different pen testing techniques and tools.

- **HackingTutorials.org:** Provides free tutorials and information on various hacking and security topics.

- **Cybrary.it:** Offers a wide range of free cybersecurity courses, including some introductory pen testing courses.

- **OWASP:** The Open Web Application Security Project (OWASP) provides free resources on web application security testing, which is a crucial part of pen testing.

Challenge Platforms:

- **Hack The Box (HTB):** Offers a gamified platform with capture-the-flag (CTF) challenges related to penetration testing. Great for practicing your skills in a competitive environment.

- **Over The Wire CTF:** Another CTF platform with challenges ranging from beginner to advanced levels, focusing on various security topics.

Tips for Choosing Resources:

- **Consider your learning style**: Do you prefer video lectures, written tutorials, or hands-on labs? Choose resources that align with your learning preferences.

- **Start with the basics**: If you're new to pen testing, start with beginner-friendly resources to build a foundational understanding.

- **Focus on your goals**: Different resources cater to different needs. Some focus on specific pen testing methodologies, while others offer a broader overview. Choose resources that align with your learning goals.

**Additional Resources:**

- **Books**: Several great books cover penetration testing concepts and methodologies.

- **Communities**: Online communities like forums and subreddits dedicated to pen testing can be a valuable resource for learning and asking questions.

# PenTest Syllabus

Analyzing Network Traffic

- Importance of Packet Analysis

- How to Capture Network Traffic

- Promiscuous Mode

- Introduction to Wireshark

- Filtering and Decoding Traffic

- Physical Data-Link Layer

- Network Internet Layer

- Transport Host-Host Layer

- Application Layer

Detecting Live Systems and Analyzing Results

- Detecting Live Systems with ICMP

- Detecting Live Systems with TCP

- ICMP Packet Analysis

- Traceroute

Nmap Advance Port Scan

- Fragment Scan

- Data Length Scan

- TTL Scan

- Source Port Scan

- Decoy Scan

- TCP and UDP Port Scan

- Nmap Scan with Wireshark

- Nmap Output Scan

- OS Fingerprinting

- Spoof IP Scan

- Spoof MAC Scan

- Data String Scan

- Hex String Scan

- IP Options Scan

Metasploit Framework Hands-on

- Metasploit Basic

- Msfvenom

- Auxiliary scanner

- Windows Reverse TCP

- Windows HTTPS Tunnel

- Hidden Bind TCP

- Macro Payloads

- Shell on the Fly (Transport)

- Bypass User Access Control

- Pass the Hash

- Post Exploitation

Dictionary & Passwords Attacks

- Hydra

- Medusa

- Crunch

- CeWL

- cUPP

- Online Attacks

Telnet Penetration Testing

- Introduction & Lab Setup

- Banner Grabbing/Banner Hiding

- Port Redirection

- Brute Force & Password Cracking

- Remote Port Forwarding

- Pivoting

SMTP Penetration Testing

- Introduction & Lab setup

- Banner Grabbing \| Banner Hiding

- Brute Force & Password Cracking

- Prevent against brute force

- Remote Port Forwarding

- Pivoting

- Port Redirection

- User Enumeration

DNS & DHCP Penetration Testing

- Introduction & Lab Setup •

- DNS Enumeration •

- DHCP Packet Analysis with Wireshark

- DHCP Starvation Attack

- Rogue DHCP Server

NetBIOS & SMB Penetration Testing

- Introduction & Lab Setup

- 

- SMB Enumeration

- SMB Null Sessions

- Enum4Linux

- Brute Force & Password Cracking

- SMB DOS

- Eternal Blue & Eternal romance

- Remote Login with SMB

MySQL Penetration Testing

- Introduction and Lab setup

- Brute Force & Password Cracking

- MySQL Enumeration

- Extract MySQL-Schema Information

- Execute MySQL query Remotely

- Extracting Password Hashes

- Enumerate writeable directories

- Enumerating System Files

Remote Desktop Penetration Testing

- Introduction & Lab setup

- RDP Enumeration

- RDP MITM over SSL

- Brute Force & Password Cracking

- RDP Session Hijacking

- Remote Port Forwarding

- DOS Attack

VNC Penetration Testing

- Introduction & Lab setup

- Banner Grabbing

- Banner Hiding

- Port Redirection

- Brute Force & Password Cracking

- Remote Port Forwarding

- Tunneling Through SSH

Credential Dumping

- Wireless Creds

- Auto login Password Dump

- Application Creds

- Fake Services

Sniffing and Spoofing

- Introduction

- ARP Poisoning

- MAC Address Snooping

- DNS Spoofing

- ICMP Redirect

- NTLM Hash Capture

DOS Attack Penetration Testing

- Introduction to DOS Attack

- Botnet

- D-DOS Attack

- SYN Flood Attack

- UDP Flood

- Smurf Attack

- Packet Crafting

- Others DOS Attack Tools

Covering Tracks & Maintaining Access

- Persistence Service

- Persistence Exe

- Registry Persistence

- Persistence through Netcat

- Clear Event Logs

Honeypots

- What are Honeypots

- Working of Honeypots

- Types of Honeypots

- Installation and working of Honeypots

Firewall

- Introduction to Firewall

- Types of Firewalls

- Windows Firewall

- Linux Firewall

- Untangle Firewall Implementation

Intrusion Detection System

- What is Intrusion Detection System

- Working of IDS

- Types of IDS

- Type of IDS Alert

- IDS Implementation using Snort

- Capture ICMP Alert

- TCP Packet Alert

- Capture Malicious Attacks

Network Vulnerability Assessment Tool

- Nessus

- Vulnerability Scanning using Nmap

- Nexpose

**Cloud Security:**

- **Cloud-based attacks:** Discuss common cloud-specific attacks, such as misconfigurations, API abuse, and cloud-based malware.

- **Cloud security tools:** Introduce tools and techniques for assessing cloud security, including cloud security posture management (CSPM) and cloud workload protection platforms (CWPP).

**IoT Security:**

- **IoT vulnerabilities:** Explore the unique vulnerabilities of IoT devices, such as weak default credentials, lack of updates, and insecure communication protocols.

- **IoT penetration testing:** Discuss techniques for assessing IoT security, including identifying vulnerable devices, exploiting vulnerabilities, and implementing mitigation strategies.

**Web Application Security:**

- **Web application vulnerabilities:** Cover common web application vulnerabilities, such as SQL injection, cross-site scripting (XSS), and cross-site request forgery (CSRF).  

- **Web application testing tools:** Introduce tools for web application penetration testing, such as Burp Suite, OWASP ZAP, and Acunetix.

**Mobile Application Security:**

- **Mobile application vulnerabilities:** Discuss vulnerabilities specific to mobile applications, such as insecure data storage, reverse engineering, and malware attacks.

- **Mobile application testing tools:** Introduce tools for mobile application penetration testing, such as MobSF, Android Studio, and Xcode.

**Social Engineering:**

- **Social engineering techniques:** Discuss various social engineering tactics, such as phishing, pretexting, and baiting.

- **Social engineering defense mechanisms:** Explore techniques for defending against social engineering attacks, including employee awareness training and security policies.

**Wireless Network Security:**

- **Wireless network vulnerabilities:** Discuss vulnerabilities specific to wireless networks, such as rogue access points, weak encryption, and man-in-the-middle attacks.

- **Wireless network testing tools:** Introduce tools for wireless network penetration testing, such as Aircrack-ng, Wireshark, and Kismet.

**Emerging Threats:**

- **Artificial intelligence and machine learning:** Discuss how AI and ML can be used for both offensive and defensive purposes in cybersecurity.

- **Quantum computing:** Explore the potential impact of quantum computing on cryptography and security.

By incorporating these additional topics, the network penetration testing syllabus will provide a more comprehensive and up-to-date understanding of the field, equipping professionals with the knowledge and skills to address the evolving cybersecurity landscape.

## PenTest 

- Why is penetration testing important to an organization’s risk management strategy?

- Why is Tesla paying million dollars for bugs/vulnerabilities?

- What are your thoughts on automated penetration testing?

<!-- -->

- What is the difference between a black hat and a white hat?

- What is the difference between Red, Blue, and Purple Teams?

- What is the difference between the red team and blue team?

<!-- -->

- Why are the containers vulnerable?

- Why did you choose to approach it the way you did vs. list alternatives?

## Cyber Threats and Attacks

- If you were going to break into a database-based website, how would you do it?

- List out the types of cyber attackers.

- List out the types of sniffing attacks.

- List the common types of cybersecurity attacks:

- What are the common cyber-attacks?

- What are the common security vulnerabilities?

- What are the different components of Metasploit? Explain client-side exploits/attacks.

- What are the different HTTP response codes?

- What are the types of password attacks?

- What are the ways cyber criminals are using services like LinkedIn?

- What are the ways the attackers are using AI?

**A friend of yours sends an e-card to your mailbox. You must click on the attachment to get the card. What do you do? Justify your answer.** Email addresses could be fake, and their attachments may contain malware that could be executed by just clicking on them, so first I will verify the email address with my friend and ask if he sent me an e-card before I open it.

**After a pentest is conducted, what are some of the top network controls you would advise your client to implement?** The following types of controls should be implemented: Only use those applications and software tools that are deemed “whitelisted.” Always implement a regular firmware upgrade and software patching schedule, and make sure that your IT staff sticks with the prescribed timetable. With regards to the last point, it is imperative that the operating systems(s) you utilize are thoroughly patched and upgraded. Establish a protocol for giving out administrative privileges only on an as-needed basis, and only to those individuals that absolutely require them.

**DDoS attack testing:** DDoS are also within the scope of penetration testing. Many tools are available to see whether the system is vulnerable to DoS attacks or not.

# Interview PenTest

**Improving the SecTest Interview Guide**

**Excellent foundation!** The provided SecTest interview guide covers essential aspects of security testing, particularly penetration testing. To enhance its effectiveness, let's consider some additional points and improvements:

**Expanding the Scope**

- **Security Testing Lifecycle:** Incorporate questions about the different phases of security testing (requirements, design, implementation, testing, deployment, maintenance) and how penetration testing fits within this lifecycle.

- **Security Testing Methodologies:** Discuss other security testing methodologies beyond penetration testing, such as vulnerability scanning, threat modeling, and risk assessment.

- **Security Testing Tools:** Explore the candidate's familiarity with a broader range of security testing tools, including open-source and commercial options.

- **Compliance and Regulations:** Include questions about security testing in the context of compliance with industry standards and regulations (e.g., PCI DSS, GDPR, HIPAA).

- **Security Testing Automation:** Discuss the role of automation in security testing and the candidate's experience with security testing automation tools and frameworks.

**Deepening the Questions**

- **Penetration Testing Methodology:** Delve deeper into specific penetration testing methodologies (e.g., black box, white box, gray box) and when to use each.

- **Vulnerability Assessment:** Explore the candidate's experience with vulnerability assessment tools and how they integrate with penetration testing.

- **Security Testing Reporting:** Discuss the importance of clear and concise security testing reports, including metrics and recommendations.

- **Security Testing and Agile Development:** Explore the candidate's experience with integrating security testing into Agile development processes.

- **Security Testing and DevOps:** Discuss the role of security testing in DevOps pipelines and continuous integration/continuous delivery (CI/CD).

**Addressing Potential Challenges**

- **Candidate Experience Level:** Tailor questions based on the candidate's experience level. For junior candidates, focus on foundational knowledge and problem-solving skills. For senior candidates, delve deeper into complex scenarios and leadership abilities.

- **Non-Disclosure Agreements (NDAs):** Respect candidate confidentiality by avoiding questions that might violate NDAs. Focus on general approaches, methodologies, and lessons learned rather than specific projects.

- **C-Level Communication:** Provide examples of effective communication techniques for translating technical findings into business impact for C-level executives.

# Identity Theft 

- Identity theft occurs when someone steals your personally identifiable information for fraudulent purposes.

- It is a crime in which an imposter obtains personal identifying information such as name, credit card number, social security or driver license numbers, etc. to commit fraud or other crimes.

- Attackers can use identity theft to impersonate employees of a target organization and physically access the facility.

> Identify Theft

- Identity theft occurs when someone steals your personally identifiable information for fraudulent purposes.

- It is a crime in which an imposter obtains personal identifying information such as name, credit card number, social security or driver license numbers, etc. to commit fraud or other crimes.

- Attackers can use identity theft to impersonate employees of a target organization and physically access the facility.

> How to Steal an Identity

- **Step 1**:

  1.  Search for Steven's address on social networking sites (Facebook, Twitter, etc.) or on people search sites.

> ○ Get hold of Steven's telephone bill, water bill, or electricity bill using dumpster diving, stolen email, or onsite stealing.

- **Step 2**:

  1.  Go to the Department of Motor Vehicles and tell them you lost your driver license.

> ○ They will ask you for proof of identity such as a water bill and electricity bill.
>
> ○ Show them the stolen bills.
>
> ○ Tell them you have moved from the original address.
>
> ○ The department employee will ask to complete replacement of the driver license form and change in address form.
>
> ○ You will need a photo for the driver license.
>
> ○ Your replacement driver license will be issued to your new home address.
>
> ○ Now you are ready to have some serious fun.
>
> **Step 3**:
>
> ○ Go to a bank in which the original Steven Charles has an account and tell them you would like to apply for a new credit card.
>
> ○ Tell them you do not remember the account number and ask them to look it up using Steven's name and address.
>
> ○ The bank will ask for your ID: Show them your driver license as ID, and if the ID is accepted, your credit card will be issued and ready for. ○ Now you are ready for shopping.
>
> Outcome: The real Steven Gets a Huge Credit Card Statement
>
> Identity Theft is a Serious Problem

- Identity theft is a serious problem and the number of violations are increasing rapidly.

- Some of the ways to minimize the risk of identity theft include checking the credit card reports periodically, safeguarding personal information at home and in the workplace, verifying the legality of sources, etc.

>  

How to Steal an Identity

- **Step-1**: Search for Steven's address on social networking sites (Facebook, Twitter, etc.) or on people search sites. Get hold of Steven's telephone bill, water bill, or electricity bill using dumpster diving, stolen email, or onsite stealing.

- **Step-2**: Go to the Department of Motor Vehicles and tell them you lost your driver license.

  - They will ask you for proof of identity such as a water bill and electricity bill.

  - Show them the stolen bills.

  - Tell them you have moved from the original address.

  - The department employee will ask to complete replacement of the driver license form and change in address form.

  - You will need a photo for the driver license.

  - Your replacement driver license will be issued to your new home address.

  - Now you are ready to have some serious fun.

- **Step 3:**

  - Go to a bank in which the original Steven Charles has an account and tell them you would like to apply for a new credit card.

  - Tell them you do not remember the account number and ask them to look it up using Steven's name and address.

  - The bank will ask for your ID: Show them your driver license as ID, and if the ID is accepted, your credit card will be issued and ready for. ○ Now you are ready for shopping.

- **Outcome**: The real Steven Gets a Huge Credit Card Statement

>  

Identity Theft is a Serious Problem

Identity theft violations are increasing rapidly.

Some of the ways to minimize the risk of identity theft include checking the credit card reports periodically, safeguarding personal information at home and in the workplace, verifying the legality of sources, etc.

>  

# Cyber Kill Chain

The Cyber Kill Chain is a framework outlining the stages of a typical cyberattack. Developed by Lockheed Martin, it helps organizations understand the adversary's perspective and potential attack paths.

Stages of the Cyber Kill Chain

1.  **Reconnaissance:** Gathering information about the target organization.

2.  **Weaponization:** Creating a malicious payload by combining malware with an exploit.

3.  **Delivery:** Delivering the malicious payload to the target.

4.  **Exploitation:** Triggering the vulnerability to gain initial access.

5.  **Installation:** Establishing persistence on the target system.

6.  **Command and Control (C2):** Establishing communication with the attacker.

7.  **Actions on Objectives:** Achieving the final goal, such as data exfiltration or system damage.

By understanding these stages, organizations can implement defense strategies at each point in the chain to prevent or detect attacks.

# Common Malwares

- **Ransomware** encrypts files or systems, demanding a ransom for decryption.

- **Trojans** disguise as legitimate software to execute malicious code.

- **Viruses** self-replicate to infect files and alter system function.

- **Adware** displays or downloads unwanted advertisements.

- **Spyware** secretly monitors and collects user data.

- **Computer worms** self-replicate across networks.

- **Bots** automate online tasks.

- **Rootkits** gain system access stealthily.

Zip Bombs

- A zip bomb, also known as a decompression bomb or zip of death is a malicious archive file designed to crash or render useless the program or system reading it.

- It is often employed to disable antivirus software, in order to create an opening for more traditional viruses.

- A zip bomb is usually a small file for ease of transport and to avoid suspicion. However, when the file is unpacked, its contents are more than the system can handle. Example:

- Compressed file 42.zip having size 42KB

- Contains 5 layers of Nested Zip Files in sets of 16

- Each Bottom layer archive contains 4.3GB file

- Total uncompressed size is 4.5 Peta Bytes

<!-- -->

- **Zip Bombs** also known as a decompression bomb or zip of death is a malicious archive file designed to crash or render useless the program or system reading it. It is often employed to disable antivirus software, in order to create an opening for more traditional viruses. A zip bomb is usually a small file for ease of transport and to avoid suspicion. However, when the file is unpacked, its contents are more than the system can handle. Example 42.zip

# APT concepts 

Advanced persistent threats (APTs) are defined as a type of network attack, where an attacker gains unauthorized access to a target network and remains undetected for a long period of time.

The main objective behind these attacks is to obtain sensitive information rather than sabotaging the organization and its network

- **Advanced** means most sophisticated techniques to exploit vulnerabilities

- **Persistent** means external command and control (C&C) system that continuously extracts data and monitor victim network.

- **Threat** signifies human involvement in coordination.

Characteristics of APTs

APTs are sophisticated, long-term cyberattacks carried out by highly skilled adversaries with specific goals.

They are characterized by:

- **Persistence:** Attackers maintain access to a target network for extended periods, often undetected.

- **Sophistication:** APTs employ advanced techniques, tools, and procedures (TTPs) to bypass traditional security measures.

- **Targeting:** Attacks are carefully planned and executed against specific targets with valuable information.

- **Stealth:** Attackers use covert methods to avoid detection, such as zero-day exploits and lateral movement.

- **Multiple Phases:** APTs involve several stages, including reconnaissance, intrusion, data exfiltration, and command and control.

- **High Impact:** Successful APTs can result in significant financial loss, reputational damage, or intellectual property theft.

**Key indicators of an APT attack include:**

- Unusual network traffic patterns

- Unauthorized access attempts

- Compromised user accounts

- Presence of backdoors or malware

- Data exfiltration

Understanding these characteristics is essential for organizations to develop effective defense strategies against APTs.

# Supply Chain Attack

Examples of supply chain attack

# Honeypots

- What are Honeypots

- Working of Honeypots

- Types of Honeypots

- Installation and working of Honeypots

- Persistence through Netcat

- Clear Event Logs

<!-- -->

- **What is a honeypot? What type of attack does it defend against?**

<!-- -->

- **What is a honeypot?** Honeypot is a fake computer system that behaves like a real system and attracts hackers to attack it. Honeypot is used to find out loopholes in the system and to provide a solution for these kinds of attacks.

- **Explain honeypot and its Types.** Honeypot is a decoy computer system which records all the transactions, interactions, and actions with users. Honeypot is classified into two categories: 1) Production honeypot and 2) Research honeypot. Production honeypot: It is designed to capture real information for the administrator to access vulnerabilities. They are generally placed inside production networks to increase their security. Research Honeypot: It is used by educational institutions and organizations for the sole purpose of researching the motives and tactics of the back-hat community for targeting different networks.

 

# QnA

**What is you preferred - Bug bounty or security testing?** Both are fine, just support your answer like Bug Bounty is decentralised, can identify rare bugs, large pool of testers etc.

**What is your opinion on hacktivist groups such as Anonymous?** You might have guessed that this level is very much about forming opinions and drawing conclusions, and you would be right. This one is an especially loaded question. Like any major group without a central leader, they seem to be mostly chaotic, at times seeming like a force for good, while at others causing havoc for innocents. Choose your words very carefully here, as it could be a deal breaker.

**What is Zero Day Exploit?** A zero-day exploit is a cyber-attack that occurs on the same day a weakness is discovered in software. At that point, it is exploited before a fix becomes available from its creator.

**What is your favourite exploit?**

**What type of attack honeypot defend against?**

## **Penetration Testing Fundamentals:**

- What is penetration testing?

- Explain the Phases of Penetration Testing:

- Explain the Advantages of Penetration Testing

- Explain How Risk Analysis and Penetration Testing Are Different from Each Other.

- How do you test information security?

- How much experience do you have performing penetration testing?

- How long does it take to perform a penetration test?

- How much time required to complete Penetration Test?

- Do You Have Any Penetration Testing Certification?

- Do You Automate Using Scripting?

- Can Penetration Testing Be Automated?

- Explain the Tools You Will Use for Penetration Testing

## **Penetration Testing Fundamentals:**

- Penetration Testing definition (includes "What is Penetration Testing?" and "What is a specific definition of Pentesting?")

- What is Security Testing?

- What is Different between Penetration Testing and Security Testing?

- What are the advantages of Penetration Testing?

- What are the disadvantages of penetration testing?

- What are the goals of conducting a Pentesting exercise?

- What is the primary purpose of Pentesting?

- What is the importance of A Penetration Test?

- Why is Penetration Testing important?

- Why Should Penetration Testing Be Carried out by a Third Party?

- Why would you bring in an outside contractor to perform a penetration test?

- If we are already performing vulnerability scanning, why should we perform a penetration test?

- Is Penetration Testing Still Important If the Company Has a Firewall?

- My data is stored in the cloud. Why do I need a Penetration test?

- List the various methodologies in Security testing? White Box, Black Box, Grey Box

- What are the three types of Pentesting methodologies?

- List the attributes of Security Testing? Authentication, Authorization, Confidentiality, Availability, Integrity, Non-Repudiation, Resilience

- List down the seven main types of security testing as per Open-Source Security Testing methodology manual? Vulnerability Scanning, Security Scanning, Penetration testing, Risk Assessment, Security Auditing, Ethical hacking, Posture Assessment

## **Penetration Testing Scope and Impact:**

- Can a penetration test break any system?

- Does Penetration Testing Break a System?

- Can Penetration Testing Disrupt a Company’s Network of Operations?

- Do penetration tests cause any disruption to an organization’s network?

- Can you target any IP Address for penetration testing?

- Do I Still Need Penetration Testing Although My Data Is in the Cloud?

- Even data is stored in the cloud, penetration testing is still essential to see whether your data is secure or not.

- How do you schedule a penetration test?

## **Penetration Testing Process and Scope:**

- How often should an organization have a penetration test performed by a third-party?

- What are the legal requirements for Penetration Tests?

- What are the legal Steps involved in Penetration Testing?

- Outline the Systems on Which Penetration Testing Can Be Performed?

- What types of systems have you performed penetration testing on?

- What are the steps to perform VA/PT?

- What precautions are required to be taken while performing VA/PT?

- What time investment do you estimate for a Penetration Test?

- We received a Penetration Test proposal that was quoted significantly lower than other proposals we received – why is that?

- What are the objects that should be included in a good penetration testing report?

- With whom would you share the findings of VA/PT and how would you convey the risk of the findings effectively so that mitigation can be initiated immediately?

- In pen testing what is better, a red team or a blue team?

- What are the teams that can carry out a pentest?

- What is an example of a large pen test engagement you have performed?

## **Vulnerability Analysis and Exploitation:**

- Explain a buffer overflow attack.

- Explain the brute force attack. How to prevent it?

- Explain the concept of session hijacking:

- Explain “URL manipulation”?

- Explain what cross-site scripting (XSS) is all about.

- Explain the Term “File Enumeration”

- Give examples of System-based attacks:

- How can you avoid cross script hacks?

- How do you prioritize vulnerabilities found during a penetration test?

## **Vulnerability Analysis and Exploitation Techniques:**

- How would you bypass AV?

- If you were going to break into a database-based website, how would you do it?

- Is it possible to hack into a system without using any tool? If yes, how would you do it? (Manually?)

- List a couple of tests that you would do to a network to identify security flaws.

- What are the different Penetration Testing methods?

- What are the different Pentesting techniques?

- What are the hacking stages? Explain each stage.

- What are the most common types of attacks that threaten enterprise data security?

- What are the phases of Network Penetration?

- What is XSS or Cross-Site Scripting?

- What are the three types of cross-site scripting (XSS)?

- What does CSRF mean and how can it be prevented when executing a pentest exercise?

- What exactly is CSRF and how can it be prevented when executing a pentest exercise?

- What does user enumeration mean?

- What is port scanning?

- What are the Port Scanning Techniques?

- What network ports are commonly examined in a Pentesting exercise, and what tool can be used for this?

- What are the common ports to focus on during penetration testing?

- How to identify if a remote server is running IIS or Apache?

- What would you do if nmap port scans are blocked by network security administrator? How would you gather host information in such case?

- What number of vulnerabilities can the abovementioned service detect?

## **Network Security and Attacks:**

- Denial-of-Service (DoS) attack and common forms

- Distributed Denial-of-Service (DDoS) attack (includes "What is a distributed denial-of-service attack (DDoS)?")

- DDoS and its mitigation?

- Explain DDOS attack and how to prevent it?

- How can you prevent DOS/DDOS attack?

- Can you explain man-in-the middle attack?

- Explain MITM attack and how to prevent it?

- How can you prevent the Man-in-the-Middle attack?

- Data packet sniffing and tools used (includes "What is a packet sniffer or protocol analyser?")

- How does sniffing works? Explain how can you sniff into a network. Can sniffing attack be prevented and how?

- How does traceroute/tracert exactly work?

- Describe the different phases of a network intrusion attack.

## **Network Security and Attacks:**

- How to prevent Man-in-the-Middle Attack?

- Name some tools used for packet sniffing? Tcpdump, Kismet, Wireshark, Network Miner, Dsniff

- What type of tools are there out there for packet sniffing?

- What is a pineapple device?

- When pineapple devices used for pen testing then it is referred to as honeypot.

- What are the types of cyber-attacks?

- What are the techniques used in preventing a Brute Force Attack?

- What are the types of Cookies?

- PenTest - Define WEP cracking.

- What are various WEP cracking tools?

- Specific Pentesting exercise with Diffie-Hellman exchange

- What is SOAP and WSDL?

- What is the primary difference between asymmetric and symmetric cryptography? Give an example of the former.

## **Security Concepts and Definitions:**

- Name the two common techniques used to protect a password file? hashed passwords and a salt value or password file access control

- Please provide the exact names of the following abbreviations that are commonly used in Pentesting: 2FA, 2S2D, 2VPCP, 3DES, 3DESE, 3DESEP.

- SecTest - Define hybrid attacks.

- What are the three classes of intruders?

- What are white hat hackers?

- What is the difference between a black hat and a white hat?

- What is the difference between black hat, white hat, and grey hat hackers?

- What is the difference between a white box test and a black box test?

- What is the difference between active and passive information gathering? (give 1 example of each)

- What is the difference between black box and white box penetration testing?

- What is the difference between deep web and dark web?

- What is the difference between security audit and penetration test?

- What is the difference between Vulnerability Assessment and Penetration Testing? Which one needs to be performed first?

- What is the difference between Vulnerability Scan, Risk Analysis, and Penetration Test?

- What is scanning and what are some examples of the types of scanning used?

- Why is deleted data not truly gone when you delete it?

## **Advanced Threats and Techniques:**

- Can you define what is APT?

- Can you describe rainbow tables?

- Can give me an example of a supply chain attack?

- Can you explain some ways Cyber criminals are using services like LinkedIn?

- Can you explain some ways the attackers are using AI?

- How do you think the hacker got into the computer to set this up?

## **Penetration Testing Process and Reporting:**

- After a pentest is conducted, what are some of the top network controls you would advise your client to implement?

- Discuss a recent project of pen test which you have done?

- Can you discuss a security testing project where you faced significant challenges and how you overcame them?

- Explain the Most Difficult Penetration Test You Have Experienced

- Explain How Data Is Protected During and after Penetration Testing

- Describe a time when you had to explain complex security issues to a non-technical audience.

## **Development Lifecycle and Security Integration:**

- At what stage do you usually engage with the developers?

- At what stage of development lifecycle should you do the security testing?

- How do you test the security of cloud services like Azure?

## **Team and Expertise:**

- Do you hire criminals for a pen test? Aren’t former “black hats” the best penetration testers?

- How do you stay updated on the latest security threats and vulnerabilities?

- Have you worked in a virtualized environment?

- How can you identify whether a remote machine is a Windows Machine or Linux Machine?

- Bringing in extra help as an audit can really help eliminate problems your team is not able to resolve on their own.

- Are Denial-of-service attacks also tested?

- The biggest challenge while doing a security test and how did you overcome that?

- Give at least commands to copy a file from one server to another:

- Explain Security Scanning.

- Describe the theoretical constructs of a threat model that can be used in a Pentesting exercise.

## **Tools and Technologies:**

- Name the available hacking tools? Acunetix, WebInspect, Probably, Netsparker, Angry IP scanner, Burp Suite, Savvius

- What are some of the standard tools used by ethical hackers?

- What are the different components of Metasploit? Explain client-side exploits/attacks.

- What tools do you normally use for VA and PT? Which tool you find the best and why?

- What tools/infrastructure do you have in your penetration testing lab?

- What is your experience with security testing automation tools and frameworks?

- What are your thoughts on automated penetration testing?

## **Social Engineering and Physical Security:**

- How would you deliver a social engineering security test?

- How would you compromise an “office workstation” at a hotel?

- How would you test a ATM or smart parking meter?

- What does lockpicking have to do with security testing?

- What is your favourite physical security testing tool or device?

- You managed to hack the smart thermometer in casino, how would you make your way to the high-roller database and back?

## **Application and API Security:**

- What is the difference in testing mobile and web application?

- What is the difference in testing web application and API?

- Which application testing method requires a URL to the application, is quick and cheap but also produces the most false-positive results?

- Why are the roles important when testing API’s?

## **Bug Bounties and Ethical Hacking:**

- What are the advantages offered by bug bounty programs over normal testing practices?

- What are the biggest bounties you have earned?

- Why is Tesla paying million dollars for bugs/vulnerabilities?

- What kinds of certifications in the most demand for penetration testing?

- What certifications do you have to perform penetration testing?

- What are white hat hackers?

- What is your opinion on hacktivist groups such as Anonymous?

## Recent Security Breaches

Tell about any of the major security incident that happened recently.

What are the a few recent security breaches? Name a few types of security breaches.

## Metasploit

**What are the different components of Metasploit? Explain client-side exploits/attacks.**

## PenTest Techniques

Pentesting techniques fall into these following categories:

- Web Application Testing,

- Wireless Network/Wireless Device Testing

- Network Infrastructure Services

- Social Engineering Testing

- Client-Side Application Testing

**After a pentest is conducted, what are some of the top network controls you would advise your client to implement?** The following types of controls should be implemented: Only use those applications and software tools that are deemed “whitelisted.” Always implement a regular firmware upgrade and software patching schedule, and make sure that your IT staff sticks with the prescribed timetable. With regards to the last point, it is imperative that the operating systems(s) you utilize are thoroughly patched and upgraded. Establish a protocol for giving out administrative privileges only on an as-needed basis, and only to those individuals that absolutely require them.

**What network ports are commonly examined in a Pentesting exercise, and what tool can be used for this?**

They are as follows: HTTPS (Port \#443), FTP (Port \#’s 20 & 21), NTP (Port \#123), SSH (Port \#22), HTTP (Port \#80), Telnet (Port \#23), SMTP (Port \#25), In these instances, “Nmap” is the most used tool.

**How do you test information security?**

**How would you bypass AV?** Techniques used to bypass AV: Encoding the payload, using direct system calls, and obfuscation.

**Who are hackers?** A Hacker is a person who finds and exploits the weakness in computer systems, smartphones, tablets, or networks to gain access. Hackers are well experienced computer programmers with knowledge of computer security.

**How much time required to complete Penetration Test?** The length of time it would take to complete a penetration test depends on some factors such as the nature of the software being tested, the size of the software, its vulnerability level, the level of security of the software, the experience level of the penetration tester, the software being used for the test, the technique of the test (either automated or manual), etc. These factors will determine how fast or how slow the test will go. For instance, if the software is enormous, expect the penetration test to take more time than when a smaller software is being tested.

**What is a honeypot?** Honeypot is a fake system that behaves like a real system and attracts hackers to attack it. Honeypot is used to find out loopholes in the system and to provide a solution for these kinds of attacks.

**What is a honeypot? What type of attack does it defend against?**

**What are the legal requirements for Penetration Tests? Ans:** Penetration testing started only when there is an agreement signed by the organization and pen testing agency. In an agreement, the list of targets explicitly mentioned which are the scope of pen-testing. Testers advised not to test any other target outside the scope.

**What are the advantages offered by bug bounty programs over pen testing?** You should hear coverage of many testers vs. one, incentivization, focus on rare bugs, etc.

What are your thoughts on automated penetration testing?

What are the legal requirements for Penetration Tests?

What is the difference between black box and white box penetration testing?

Why would you bring in an outside contractor to perform a penetration test?

**Which device would you inspect while looking for failed attempts to penetrate your company's network?** - Firewall

**Give examples of System-based attacks:** Examples of system-based attacks are: Virus Backdoors Bots Worm

**How can you avoid cross script hacks?**

**How would you compromise an “office workstation” at a hotel?** Considering how infected these typically are, I would not touch one with a ten-foot pole. A USB keylogger is easy to fit into the back of these systems without much notice. An autorun program would be able to run quickly and quietly leaving behind software to do the dirty work. In essence, it is open season on exploits in this type of environment.

**How would you test an ATM or smart parking meter?**

**How would you deliver a social engineering security test?**

**What is a Social Engineer?** Social Engineer is an art. Someone that will talk people into revealing passwords or sensitive information that will be used hacked application, systems.

**What are your views on usage of social media in office?** Social media is acceptable, just ensure content filtering is enabled and uploading features are resources

**Is it possible to hack into a system without using any tool? If yes, how would you do it? (Manually?)**

**Name the available hacking tools.** Following is a list of useful hacking tools. Acunetix, WebInspect, Probably, Netsparker, Angry IP scanner: Burp Suite, Savvius

**What are the high-level steps for seizing a live computer system?**

**What are various WEP cracking tools?** Well known WEP cracking tools are: Aircrack, WebDecrypt, Kismet, WEPCrack

**What is an active reconnaissance?** Ans. Active reconnaissance is a kind of computer attack where an intruder engages the target system for collecting data about vulnerabilities. The attackers mostly use port scanning to identify vulnerable ports and then exploit the vulnerabilities of services that are associated with open ports.

**What is hacking?** Hacking is a process of finding weakness in computer or private networks to exploit its weaknesses and gain access. For example, using password cracking technique to gain access to a system.

**What is Pharming and Defacement?** Pharming is a scamming practice in which malicious code is installed on a personal computer or server, misdirecting users to fraudulent Web sites without their knowledge or consent. Pharming has been called "phishing without a lure." Defacement: The attacker replaces the firm's site with an alternate page. It contains the hacker's name, images and may even incorporate messages and background music.

**What is scanning and what are some examples of the types of scanning used?** Scanning may be referred to as a set of procedures for identifying hosts, ports and the services attached to a network. Scanning is a critical component for information gathering. It allows the hacker to create a profile on the site of the organization to be hacked. Types of scanning include: Port scanning, Vulnerability scanning, Network scanning.

**What is the biggest challenge while doing a security test and how did you overcome that?**

**What is the difference between deep web and dark web?**

**What is the difference between active and passive information gathering?**

**What is the main reason why organisations do not fix the penetration test findings?**

Can you explain some ways the attackers are using AI?

Can you explain the biggest challenge while doing a security test and how did you overcome that?

How do you test information security?

How do you test security for web services?
