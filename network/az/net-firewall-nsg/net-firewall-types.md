## Firewall Types



|Category|Type|Description|Key Features|Use Cases|
|-|-|-|-|-|
|Deployment (Platform)|Hardware Firewall|Dedicated physical appliance.|High performance, robust security.|Medium to large enterprises, data centers.|
||Software Firewall|Software installed on operating systems.|Flexible, cost-effective.|Individual devices, small businesses, home networks.|
||Cloud Firewall (FWaaS)|Cloud-based security service.|Scalable, flexible, centralized management.|Distributed networks, remote workforces, cloud applications.|
|Functionality (Inspection)|Packet Filtering Firewall|Examines packet headers.|Basic security, rule-based.|Simple network security needs.|
||Stateful Inspection Firewall|Tracks connection states.|Improved security, context awareness.|Most modern network environments.|
||Circuit-Level Gateway|Monitors network sessions.|Session-level control.|Specific security protocols.|
||Application-Level Gateway (Proxy Firewall)|Inspects packet content.|Deep packet inspection, application control.|Advanced security, application-specific filtering.|
||Next-Generation Firewall (NGFW)|Combines multiple security functions.|Comprehensive threat protection, DPI, IPS, application control.|Modern networks requiring advanced security.|
|Network Function|NAT Firewall|Acts as intermediary between networks.|Hides internal IP addresses.|internal network protection.|
|Related Network Tools|Proxy Server|Intermediary for network services.|Caching, filtering, anonymity.|General network services.|
||SOCKS Proxy|Network protocol for secure connections.|secure connections through a proxy.|bypassing network restrictions.|





## 2\. Types of Firewall Policies

* Core Policies:

  * Fundamental rules defining allowed and blocked protocols.
  * The foundation of network security.
* System Policies:

  * Manage traffic to and from the firewall itself.
  * Essential for management, monitoring, VPN, and DNS.
* Application Policies:

  * Control traffic for specific applications.
  * Restrict access, prioritize traffic, and enhance security.
* Content Policies:

  * Control traffic based on packet content.
  * Block malicious traffic and filter unwanted content.
* Default Policies:

  * Pre-configured by vendors, often allowing all traffic.
  * Highly discouraged for production environments due to security risks.
* Stateful vs. Stateless Policies:

  * Stateful: Tracks connection states for enhanced security.
  * Stateless: Evaluates each packet independently, simpler but less secure.
* Hierarchical Policies:

  * Organize rules in a hierarchy for complex environments.
  * Improve manageability and scalability.
* Zone-Based Policies:

  * Divide the network into zones with specific security rules for each zone.
  * Example zones: internal, external, DMZ.
* Web Filtering Policies:

  * Block access to specific websites or categories of websites.
* VPN Policies:

  * Configure secure tunnels for remote access.
* IDS/IPS Policies:

  * IDS (Intrusion Detection System): Detects and alerts on suspicious activity.
  * IPS (Intrusion Prevention System): Actively blocks or mitigates threats.
* Network Rules:

  * Rules that filter based on network layer information (IP addresses, protocols, ports).
* Application Rules:

  * Rules that filter based on application layer information (specific applications).
* DNAT Rules:

  * Destination Network Address Translation rules, used to redirect traffic to different internal servers



