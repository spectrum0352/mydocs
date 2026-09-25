6. Incident Response & Forensics
Incident response is an organized approach to addressing and managing the aftermath of a security breach or
cyberattack, also known as an IT incident, computer incident or security incident. The goal is to handle the situation in a
way that limits damage and reduces recovery time and costs.
Examples of incident categories
External/removable media
Attack used removable media
Attrition
Brute-force attack
Web
Attack executed from a web site or web-base application
Email
Attack executed from an email message or attachment
Improper usage
Attack resulted from a violation of the Acceptable Use Policy (AUP)
Loss or theft of equipment
Laptop or mobiel device stole
Many others
Incident Response Process
138 of 178
NIST SP800-61 - Computer Security Incident Handling Guide
NIST SP800-61
The popular guideline for Incident Response process is the NIST SP800-61 - Computer Security Incident Handling
Guide
The incident response lifecyle:
Preparation
Detection and Analysis
Containment, Eradication, and Recovery
Post-incident Activity
1) Preparation
Who's doing what
Incident handling hardware and software
Laptops, removable media, forensic software, digital cameras, etc
Organize types of incidents that might happen
Incident analysis resources
Documentation, network diagrams, baselines, critical file hash values
Incident mitigation software
Policies needed for incident handling
2) Detection & Analysis
Many different detection sources
Different levels of detail, different levels of perception
Large amout of 'volume'
Attacks are incoming all the time
How do you identify the legitimate threats?
Incidents are almost always complex
Extensive knowledge needed
Incident precursors
An incident might occur in the future
Web server log: vulnerability scanner in use
Montly patch release
Direct threats
Incident indicators
When an attack is underway / or an exploit is successful
Can be identified by IDS/IPS
Anti-virus software identifies malwares
Host-based monitor detects a configuration change
Constantly monitors system files
Network traffic flows deviate from the norm
Requires constant monitoring
3) Containment and Isolation
Mitigate the damage
Stop the attack
Sandboxes
The attacker thinks they're on a real system
Segregate the network
Shutdown the system
Turn off a service
139 of 178
Recovery after an Incident
Eradicate the bug
Remove malware
Disable breached user accounts
Fix vulnerabilities
Recover the system
Restore from backups
Pull from snapshots
Hire replacement personnel
Monitor to ensure good operation
Tighten down the perimeter
Reconstitution
Recovery may take a long time
Large-scale incidents require a large amount of work
The plan should be efficient
Start with quick, high-value security changes
Patches, firewall policy changes
Later phases involve much 'heavier lifting'
Infrastructure changes, large-scale security rollouts
4) Lessons learned or Post-incident Activity
Learn and improve
No system is perfect
Post-incident meeting
Invite everyone affected by the incident
Document the incident
Timestamp of the events
How did the incident plan work?
Did the process operate successfully?
What would you do differently next time?
Which indicators would you watch next time?
Different precursors may give you better alerts
Incident Response Plan
Cyber Incident Response Team - CIRT
This group is responsible for responding to security breaches, viruses and other potentially catastrophic incidents in
enterprises that face significant security risks. In addition to technical specialists capable of dealing with specific threats,
it should include experts who can guide enterprise executives on appropriate communication in the wake of such
incidents. The CIRT normally operates in conjunction with other enterprise groups, such as site security, public-relations
and disaster recovery teams.
A group of people whose job is to response to all incident
Full or part time - or both
IT Security Team
IT Department
Human Resources
Legal
Public Relations
140 of 178
Document incident types / Category definitions
Physical access
Malware Phishing
Social engineering
Data access
Roles and Responsabilities
Users
Help Desk
Human Resources
Database manager
Incident Hotline
IR manager/ IR officer
IR team
Reporting Requirements / Escalation
Determine Severity
Based on severity have a clear chain of escalation
Informing law enforcement
Practice
Annual scenario drills
Digital Forensics
Digital forensics is the process of uncovering and interpreting electronic data. The goal of the process is to preserve any
evidence in its most original form while performing a structured investigation by collecting, identifying and validating the
digital information for the purpose of reconstructing past events.
The context is most often for usage of data in a court of law, though digital forensics can be used in other instances.
Forensic procedures
Collect and protect information relating to an intrusion
Many different data sources and protection mechanisms
RFC 3227 - Guidelines for Evidence Collection and Archiving
A good set of best practices
Standard digital forensic process
Acquisition, analysis, and reporting
Must be detail oriented
Order of Volatility
141 of 178
Memory
The order of volatility is a process that enumerates when, where, and how to gather the data/evidence before
the data changes or disappears. (How long does data stick around?
Some media is much more volatile than others;
Gather data in order from the most volatile to less volatile
Caches
Routing tables
ARP tables
Data on the Disk
Optical, flash drives
Cache files, temp files
Write blocks enabled tools
Remotely logged data
Web site data
Remote file server logs
Backups
Backups
Trends
Low volatility takes time to gather data
Chain of Custody
The whole idea of Chain of Custody is to show good integrity of the evidence itself.
Gathering Evidence - data is of high integrity
Control evidence - Maintain integrity
Everyone who contacts the evidence
Avoid tampering
Use hashes
Label and catalog everything
Seal and store
Chain of Custody Process
142 of 178
1. Define the Evidence
2. Document collection method
3. Data/time collected
4. Person(s) handling the evidence
5. Function of person handling evidence (qualified person)
6. All locations of the evidence (e.g inital collection, moved to law enforcement...)
Forensic Data Acquisition
Checklist of issues you should consider when you're performing Digital Forensics.
1. Capture the system image
Bit-for-bit, byte-for-byte
Software imaging tools - bootable device
Remove the physical drive
Get the backup tapes
2. Netwrok traffic and logs
Firewalls log a lot of information
IDS/IPS logs
Raw network traffic data
Stream-to-disk
An exact recording of network communication
3. Capture video
Rebuild images, email messages, browser sessions, file transfers
Security cameras, mobile devices
Record time offset
4. Take Hashes
Ensure that there's no tampering
MD5 (Message Digest 5)
128 bits, displayed as hexadecimal
Chance of duplication is one in 2^128
CRC (Cyclical Redundancy Check)
143 of 178
32 bits, displayed as hexadecimal
One in 2^32
Create an MD5 hash for an image, file, or groups of files
Data can be verified at any time
5. Take screenshots
Capture the state of the screen
External capture (Camera, Mobile device)
Internal capture (PrintScreen)
6. Interview witnesses
7. Track man hours
Contingency Planning
Attempts to mitigate adverse incidents to preserve business continuity.
How do we recover from a specific type of a disaster?
What to do for keep the Business Continuity going?
Evidences on Computer forensics
1. Documentary evidence - directly supports or proves a definitive assertion.
2. Exculpatory - evidence proves innocence.
3. Inculpatory - evidence proves guilt.
4. Demonstrative evidence - which can be in the form of charts, graphs, drawings, and so forth, is used to help
nontechnical people, such as the members of a jury, understand an event.


