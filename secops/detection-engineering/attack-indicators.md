Indicators of Compromise (IOCs) are pieces of evidence that suggest a security breach has occurred on a network or endpoint. These digital breadcrumbs can help security teams identify and respond to threats effectively.   

Think of IOCs as red flags that signal potential malicious activity. They can range from unusual network traffic patterns to suspicious file modifications.   

Indicators of Compromise (IOCs) are pieces of evidence that suggest a security breach has occurred on a network or endpoint. These digital breadcrumbs can help security teams identify and respond to threats effectively.   

Think of IOCs as red flags that signal potential malicious activity. They can range from unusual network traffic patterns to suspicious file modifications.   

To further enhance your understanding of IOCs, consider these additional points:
•	IOC Categories: While your list covers various aspects, IOCs can be categorized more specifically into:
o	Network IOCs (IP addresses, domains, URLs, hashes)
o	Endpoint IOCs (file hashes, registry keys, process names)
o	User IOCs (usernames, email addresses, phone numbers)
•	Threat Intelligence Feeds: Many organizations subscribe to threat intelligence feeds that provide pre-defined IOCs related to specific threats.
•	IOC Prioritization: Not all IOCs are created equal. Prioritizing IOCs based on their potential impact is crucial for effective threat hunting.
•	IOC Enrichment: Combining IOCs with other data sources (e.g., threat intelligence, vulnerability information) can provide deeper insights.
•	IOC False Positives: Be aware of potential false positives and have processes in place to validate IOCs.

Beyond Traditional IOCs
Modern threat landscapes demand a more nuanced approach. Consider these emerging IOC types:
•	Behavioural Indicators: Unusual user behaviour, process anomalies, or system performance changes.
•	Cloud-Based IOCs: Indicators specific to cloud environments (e.g., resource usage, API calls).
•	IoT-Specific IOCs: Indicators related to IoT devices (e.g., device communication patterns, firmware updates).
By combining traditional IOCs with these emerging indicators and leveraging advanced analytics, organizations can significantly improve their threat detection and response capabilities.


To further enhance your understanding of IOCs, consider these additional points:
•	IOC Categories: While your list covers various aspects, IOCs can be categorized more specifically into:
o	Network IOCs (IP addresses, domains, URLs, hashes)
o	Endpoint IOCs (file hashes, registry keys, process names)
o	User IOCs (usernames, email addresses, phone numbers)
•	Threat Intelligence Feeds: Many organizations subscribe to threat intelligence feeds that provide pre-defined IOCs related to specific threats.
•	IOC Prioritization: Not all IOCs are created equal. Prioritizing IOCs based on their potential impact is crucial for effective threat hunting.
•	IOC Enrichment: Combining IOCs with other data sources (e.g., threat intelligence, vulnerability information) can provide deeper insights.
•	IOC False Positives: Be aware of potential false positives and have processes in place to validate IOCs.

Beyond Traditional IOCs
Modern threat landscapes demand a more nuanced approach. Consider these emerging IOC types:
•	Behavioural Indicators: Unusual user behaviour, process anomalies, or system performance changes.
•	Cloud-Based IOCs: Indicators specific to cloud environments (e.g., resource usage, API calls).
•	IoT-Specific IOCs: Indicators related to IoT devices (e.g., device communication patterns, firmware updates).
By combining traditional IOCs with these emerging indicators and leveraging advanced analytics, organizations can significantly improve their threat detection and response capabilities.

An IOC is a clue that can be used to indicate an intrusion or compromise of a host in a network

Typical IoC are virus signatures and IP addresses, MD5 hashes of malware files, or URLs or domain names of botnet command and control servers. After IoC have been identified via a process of incident response and computer forensics, they can be used for early detection of future attack attempts using intrusion detection systems and antivirus software.

Types of IOCs: 
•	IP addresses
•	Domains
•	URLs
•	Hashes
•	file names
•	registry keys

Sources of IOCs: 
•	Threat intelligence feeds
•	incident response investigations
•	malware analysis, etc.

What does an IOC reveal?
IOC can reveal:
•	Tactics, Techniques and Procedures (TTPs) used during a cyberattack 
•	Severity of the event 
•	Where to focus incident response and mitigation 
•	Who the threat actors are

Example: A car dashboard provides real-time performance measures and safety indicator signals. Like mechanics, incident responders use indicators to diagnose potential problems and determine how or why they occurred.

IOC and Digital Forensics
As per NIST 800-53, IOCs are forensic artifacts from intrusions identified on organizational systems at the host or network level:
•	Digital forensics is the application of scientific investigatory techniques to digital crimes and attacks. 
•	The Locard Principle: "Every contact leaves a trace"
•	An IOC is the trace of the threat actor

Uses for IOCs
IOCs are a key source for:
•	Identification of an Advanced Persistent Threat (APT) actor or group 
•	Indicating something is wrong on the network 
•	Forensic identification of crime or attack 
•	Understanding how a compromise occurred 
•	Testing your system or network for vulnerabilities

Knowledge Check (1)
An IOC can reveal: 
•	Severity of an attack 
•	Where the attack occurred 
•	Who is responsible 
•	Tactics 
•	All of the above

<img width="1198" height="1313" alt="cyber threat hunting - ai powered" src="https://github.com/user-attachments/assets/e86cc0ae-2f8a-4d1c-847d-ed13b9b84f0c" />


IOC detection methods: Intrusion detection systems (IDS), security information and event management (SIEM), network traffic analysis, etc.

IOC analysis and response: Correlation, prioritization, incident response, threat hunting, etc.
•	Specific attack vectors: IOCs for DDoS, malware, phishing, ransomware, etc.
•	Best practices for IOC management: Collection, enrichment, sharing, and retention.
How can I help you today? Would you like to focus on a specific type of IOC, attack vector, or detection method?


<img width="535" height="256" alt="attack vs compromise indicators" src="https://github.com/user-attachments/assets/0ed5ed38-c421-4e95-804b-2d6700b98fe4" />



# Attack Indicators

List of "Patterns of behaviour" that confirms cyber-attack is happened: 

- Unusual network activity: This can include a sudden increase in network traffic, spikes in bandwidth usage, or unusual patterns of traffic to and from known malicious IP addresses.
- Unexpected login attempts: This can include failed login attempts from unusual locations, login attempts from known compromised accounts, or successful login attempts followed by unusual activity.
- Changes to system or security configurations: This can include disabling security software, changing system permissions, or installing new software, especially software from untrusted sources.
- Data exfiltration: This can include attempts to transfer large amounts of data out of the network, or the presence of unusual files or folders on the network.
- Ransomware demands: This can include the appearance of ransom notes on systems or the encryption of critical files.
- Performance issues: This can include slow system performance, unexpected reboots, or the unavailability of applications or services.
- User complaints: This can include complaints about unusual activity on systems, problems logging in, or missing files.

It is important to note that no single pattern of behavior is conclusive. However, the presence of multiple patterns of behavior can indicate a high probability that a cyber-attack has occurred.

Tips for identifying patterns of behavior that confirm a cyber-attack:

- Look for changes in behavior over time. For example, a sudden increase in network traffic may not be suspicious on its own, but if it is sustained over a period of time, it may be indicative of a cyber-attack.
- Correlate data from multiple sources. For example, you can correlate network traffic data with endpoint logs to identify unusual activity.
- Use threat intelligence feeds. Threat intelligence feeds can provide information about known patterns of behavior associated with cyber-attacks.

- 
