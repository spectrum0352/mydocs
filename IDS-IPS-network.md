NIDS and NIPS
Both technologies watch network traffic to detect exploits against OS, applications, etc.
Network Intrusion Detection Systems (NIDS)
Passive device that detect anomalies.
Network Intrusion Prevention Systems (NIPS)
Active device that detect and prevents when something on the network traffic is suspicious by blocking it.
55 of 178
�
� Attacks could be in the form of malformed network traffic or excessive amounts of traffic.
Prevention vs. Detection
Detection
NIDS is a passive device and focuses on detection alone, making it a detection control. It detects network traffic
issues and alerts and administrator to these issues, also logging the events in the process.
Prevention
NIPS is /inline(Active) device and focuses not only on detecting network attacks, but preventing them. (e.g block
things from router)
Identification technologies
NIDS/NIPS solutions act very much like firewalls in that they inspect packets.
There's 4 types of detection methods:
1. Behavioral/Anomaly - Comparing traffic with a baseline of patterns considered normal for the network
2. Signature - Preconfigured Signature-based
3. Rule - Preconfigured rules in a ruleset - like firewall
4. Heuristic - Use AI to identify (Anomaly and Signature)
🛑 Anomaly-based NIPS/NIDS detect new patterns and are much more efficient than signature-based, which
can only work with known variants.
🛑 Remember all these technologies can report False positives or False negatives.
🛑 In simple words:
IDS: Notifies
IPS: Acts to stop
Firewall: Filters
56 of 178
Sensors
NIPS uses In-band sensor
NIPS sensor must be installed in-band to your network traffic. All packets must go through in-band sensor devices/
NIDS uses Out-of-band sensor
NIDS sensor, being passive, is normally installed out-of-band of the communication. Just plugging it into a switch
only allows the sensor to see traffic to and from the switch plus broadcast traffic. The common out-of-band devices
is a network tap or a port mirror.
Network Tap
Is a device that you can insert anywhere along a run to grab packets / intercepting network traffic
Physical taps
Disconnect the link, the tap goes in the middle
Can be an active or passive tap
57 of 178
Port Mirror
Port Mirror is a software-based tap, also called a Switch Port Analyzer, or SPAN in Cisco devices, is a special port
on a managed switch configured to listen for all data going in and out of the switch. Unlike a network tap, port mirroing is
convenient and easily changed to reflect any changes in your NIDS/NIPS monitoring stragegy.
Other types of Sensors and Collectors
Gather information from network devices
Built-in sensors, separate devices
Integrated into switches, routers, servers, firewalls, etc
Sensors
IPS
Firewall logs
Authentication logs,
Web server access logs, database transaction logs, email logs
Collectors
Proprietary consoles IPS, Firewall, SIEM consoles, syslo servers
Many SIEMs include a correlation engine to compare diverse sensor data
Mail Gateways
Unsolicited email - stop it at the gateway before it reaches the user
Can be on-site or cloud-based
Email filtering - Inbound and outbound
Unsolicited email advertisments
Control of phishing attempts
Anti-virus - blocking bad attachments
DLP - Data Loss Prevention - Block confidential information in emails
Another Features:
Whitelisting (only receive email from trusted users)
SMTP standards cheking - Block anything doesn't follow RFC standards
rDNS - Reverse DNS - Block email where the sender's domain doesn't match the IP Address
Tarpitting - Intentionally slow down the server conversation
Encryption - can be required on the gateway based on policy; force encryptionS
