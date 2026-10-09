Metadata of Threat intelligence


• Timestamp: When the CTI was collected
• Risk score: relative maliciousness of the CTI
• Source: the origin of the CTI
• Geolocation: the physical location of the host that presents the threat
• Threat category: anonymous proxy, bogon, bot, botnet, malware, passive DNS, etc.
• Note: Not all metadata is equally important


Threat Indicator Metadata
• Threat Indicator Metadata
• Timestamp: When the CTI was collected
• Risk score: relative maliciousness of the CTI
• Source: the origin of the CTI
• Geolocation: the physical location of the host that presents the threat
• Threat category: anonymous proxy, bogon, bot, botnet, malware, passive DNS, etc.
• Note: Not all metadata is equally important
•  
• Why Does CTI Matter?
• Incident prevention, detection, and response, supported by next-generation firewalls, intrusion prevention systems, unified threat management appliances, web proxies, load balancers, and security information and event management (SIEM) systems.
• Forensic investigations
• Risk assessment

• Timestamp: When the CTI was collected
• Risk score: relative maliciousness of the CTI
• Source: the origin of the CTI
• Geolocation: the physical location of the host that presents the threat
• Threat category: anonymous proxy, bogon, bot, botnet, malware, passive DNS, etc.
• Note: Not all metadata is equally important
Why Does CTI Matter?
• Incident prevention, detection, and response, supported by next-generation firewalls, intrusion prevention systems, unified threat management appliances, web proxies, load balancers, and security information and event management (SIEM) systems.
• Forensic investigations
• Risk assessment
CTI Delivery
• Often think of machine-readable CTI (CTI feeds) as being the only form of TI
• Human-readable CTI reports
• Console-based CTI
• CTI appliances
CTI Data Gathering
• Primary locations – 
o Existing data feeds: Often free, Concerns about data integrity
o Internal customer networks: Can significantly speed threat detection, can inadvertently expose sensitive information
o External networks: Most comprehensive picture of threats, More costly than using other locations

Automated CTI Sources
• Anonymous proxies
• Crawlers
• Free services
• Geolocation
• Honeypots
• Internet registries
• Internet Relay Chat (IRC)
• Peer-to-peer (P2P) networks
• And others…
CTI Scoring Basics
• Quality differs among TI sources and potentially within a single source: Confidence, timeliness
• Subjective nature of risk measurement: Dozens or hundreds of variables
• Score aging
• Score history
• Score threshold: Based on risk tolerance and acceptable levels of false positives and negatives

Using CTI in Incident Response

• Improves incident detection
o Provides insights into the sources of observed events
o Lists internal hosts that are compromised
o Enables proactive attack detection and blocking by reusing information on current and recent attacks elsewhere
• Reduces workloads for existing devices
• Facilitates forensic investigations
• CTI Delivery
• Often think of machine-readable CTI (CTI feeds) as being the only form of TI
• Human-readable CTI reports
• Console-based CTI
• CTI appliances
• CTI Data Gathering
• Primary locations – 
o Existing data feeds: Often free, Concerns about data integrity
o Internal customer networks: Can significantly speed threat detection, can inadvertently expose sensitive information
o External networks: Most comprehensive picture of threats, More costly than using other locations
• Automated CTI Sources
• Anonymous proxies
• Crawlers
• Free services
• Geolocation
• Honeypots
• Internet registries
• Internet Relay Chat (IRC)
• Peer-to-peer (P2P) networks
• And others…
• CTI Scoring Basics
• Quality differs among TI sources and potentially within a single source: Confidence, timeliness
• Subjective nature of risk measurement: Dozens or hundreds of variables
• Score aging
• Score history
• Score threshold: Based on risk tolerance and acceptable levels of false positives and negatives

• Using CTI in Incident Response
• Improves incident detection
o Provides insights into the sources of observed events
o Lists internal hosts that are compromised
o Enables proactive attack detection and blocking by reusing information on current and recent attacks elsewhere
• Reduces workloads for existing devices
• Facilitates forensic investigations
• Using TI to Strengthen Threat Mitigation
• Stopping threats before they succeed
• Reducing impact of successful threats by detecting their compromises much faster
• Manual mitigation: Potentially minimizes false positives and Slow, easy to evade
• Automatic mitigation: IPS blocking network traffic and SIEM reconfiguring firewalls and IPSs
• Threat Mitigation Strategies
• Blocking attacks: Community immunity and Anonymous proxy, bot, and botnet connection attempts
• Improving catch rates: How likely it is for your security controls to identify an attack in progress?
• Stopping advanced attacks before compromise when possible:
o Can evade inclusion in TI feeds
o Generally ineffective at stopping insider threats
• Feeding TI into Existing Controls
• Firewall, unified threat management (UTM), or other device with firewall capabilities
• Using TI with Existing Controls
• Pros: Block connection attempts and terminate existing connections. Reduce load on other security controls
• Cons: Not supported by all controls. Limited indicator processing and/or storage. Inability to keep up with frequent updates
• Using a Dedicated Appliance
• Pros: All the same pros as using an existing control. Reduces workload on existing controls Designed to fully use the TI
• Cons: Cost
• Ten Criteria for Evaluating TI Solutions
• Automation
• Integration and interoperability
• Frequency of updates
• Metadata richness
• Scoring sophistication
• Threat coverage
• Darknet visibility
• Geolocation accuracy
• Variety and number of sources
• Source quality


