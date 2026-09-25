Network Firewalls - Concepts
Control the flow of network traffic
Standard issue - home, office, and in your operating system
Corporate control of outbound and inbound area (sensitive data)
Control of inappropriate content
Protection adware, spyware etc
Firewall Rules
ACL - Access Control Lists
Allow or disallow traffic based on tuples
Grouping of categories (Source IP, Destination IP, port number, time of day, application, etc)
Can be very general or very specific
Implicit deny - prevents access unless specifically permitted.
Filters traffic by port number
OSI layer 4 (TCP/UDP) - some firewalls can filter through OSI layer 7
Can encrypt traffic into/out of the network
Can proxy traffic
Most firewalls can be layer 3 devices (routers)
🛑 A "deny any-any" rule denies all traffic from all sources, so it should be the last rule in the ruleset.
Stateless Firewall
Typically faster and perform better under havier traffic loads.
They watch network traffic and restrict / block packets based on source and destination address or static values (ACL
Rules) as shown below.
46 of 178
Stateful Firewall
Are better at identifying unauthorized and forged communications.
Can watch traffic streams from end to end. They are aware of communications paths; Can implement varios IPSec
functions (tunnels and encryption); Can tell what stage a TCP connection is in (open, open sent, synchronized SYN
ACK or established).
Packet-filtering
Inspect data packets (drop or forward), such as the destination and originiation IP address, packet type, port
number and other surface-level information.
47 of 178
Circuit-level firewall
Quickly approve or deny traffic; verify transmission protocol (TCP) handshake (session).
Application-level Firewall
Filter traffic based on user group, group membership, application or services (works at layer 7 OSI [Application
Layer] - also called proxy firewall as well).
Every packet must be analyzed and categorized before a security decision is determined
