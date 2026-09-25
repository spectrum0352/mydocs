Logging
Common Log Format (CLF) - Standard type of logs that every single type of web server generates.
127.0.0.1 - - [28/OCT/2012/13:12:44 - 0500] "GET /CertifiedHacker.png HTTP/1.0" 200 42213
    |      |             |                    |                                  |     |
  HOST    IDENT     DATE & TIME            REQUEST                             STATUS BYTES
IDENT - If the IdentityCheck directive is enabled and the client machine runs ident, then this is the identity
information reported by the client.
GET - Request HTTP method command
STATUS - status, 200 = Everything is ok
BYTES - the number of bytes in the object returned to the client, excluding all HTTP headers.
There are two types of events: Network and Non-network
events.
35 of 178
Non-Network Logs
Operation System Events
Host starting
Host shutdown
Reboot
Service starting, stopping, and failling
OS Updates
Applications Events
Application Installation
Application starts, stops or crashes
Security Events
Logons
Logons successes and failures
Generic Log Structure:
Date and Time
Process/Source/ID
Account associated/System
Event Number
Event Description
Network Logs
Network Events
O.S. / System-Level
Remote logon fail/not
Events on Shared Applicaton/Resources
Activity on Web Server (e.g. Apache)
Activity on Firewall
Application-Level
Log Management
Descentralized Log management
In environments such as very small networks and don't have large infrastructure or in isolated network segments,
descentralized log management is usually the norm.
36 of 178
Centralized Log management
Means that the log files from different machines are automatically sent to a centralized logging facility or server, such as
a syslog server, administrators review logs from a centralized loogging facility on the network. Enterprise correlate them
into one unifed management interface, so the administrator can look for trends or events. This can be achieved by using
SIEM tools.
Centralized features:
Uses a Central repository
Drag on system
Use SNMP Systems
Pulls informaton needed and generates graphs and charts
🛑 Monitoring-as-a-Services (MaaS)
