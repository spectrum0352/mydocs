SIEM - Security Information and Event
Management
Collects data points from network, including log files, traffic captures, SNMP messages, and so on, from every host
on the network. SIEM can collect all this data into one centralized location and correlate it for analysis to look for
security and performance issues, as well negative trends all in real time.
⚠ SIEM will be explained with more details later below.
Continuos Monitoring
Is a proactive way of ensuring that the network administrator receives all the different logs and other data points
throughout the network from all network devices and all systems, on a constant basis. This data is continually fed into.
Auditing
Important part of ensuring accountability on the network. Examines the logs and other data points of certain events and
construct a time frame and event sequence surrounding an incident.
Auditing also consists of other activities, such as:
Performing Network Sniffing traffic analysis
Password Cracking
Vulnerability Assessment
Penetration Test
Compliance Audits
🛑 Auditing can reveal weak security configurations
Trend Analysis
Enables network administrator to correlate different data sources and data points from various places in the network,
such as log files, IDS logs, wireless and wired sniffing as well as other event sources, and seek to identify on-going
trends in both performance and security. The goal is find patterns that can indicate a emerging issue.


SIEM - Security Information and Event
Management
SIEM tools aggregate and correlate data, allowing you to organize it into valuable information. You can get to the time
sequence of an event in all the logs quickly, have alerts and the ability to notify you based on a configurable trigger.
Aggregation: Collecting data from disparate sources and organizing the data into a single format. Any device
within a SIEM system that collects data is called collector or an aggregator.
Correlation: Is the logic that looks at data from disparate sources and can make determinations about events
taking place on your network. (Could be in-band or out-of-band, depending on the placement of the NIDS/NIPS).
Alerts - For notification if something goes bad.
Triggering - Exceeding thresholds.
Normalization: Will actually create multiple tables / organize in such a way that the data can become more
efficient and allows our analysis and reports tools to work better.
WORM - Write Once Read Many: The concept being is that log files are precious, and a lot of times you might
want to look at them in an archival way, so that we can use optical media like WORM drives to store them.
Another SIEM features
Time synchronization:
Switches, routers, firewalls, servers, workstation has its own clock.
Synchronizing the clocks becomes critical for Log Files, authentication information, outage details.
Automatic update with NTP (Network Time Protocol).
SYSLOG:
Standard for message logging: Diverse systems, consolidated log
Usually a central loggin receiver: Integrated into the SIEM
Require a lot disk space
WORM drive technology
Event de-duplication:
59 of 178
Preventing Event storms
Filter out the noise - focus on the real problems
Flapping (down / up / down)
Automated alerting and triggers:
Constant information flow (important metrics in the incoming logs)
Track important statistics
Send alerts when problems are found (email, text etc)
Create triggers to automate responses (e.g open a ticket, reboot a server)
🛑 SYSLOG stands for System Logging Protocol and is a standard protocol used to send system log or
event messages to a specific server, called a syslog server. It is primarily used to collect various device logs
from several different machines in a central location for monitoring and review.
SIEM Logs Example
Most Popular SIEM Tools:
Splunk
60 of 178
ArcSight
ELK - Elastic Search, Log Stash and Kibana (Open Source)
61 of 178
