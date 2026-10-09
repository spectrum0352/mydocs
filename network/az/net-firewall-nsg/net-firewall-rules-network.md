## Network Rules

To create a policy, you will. An **Azure Firewall Policy** is composed of rule collection groups.

* **Rule collection group**: It is a collection of related rules. First create at least one rule collection then create rules with conditions.
* **Rules**: It defines the action to be taken when certain conditions are met.
* **Types of Rule Collection Groups (RCG)**
* Allow all outbound traffic to the internet.
* Allow all traffic between internal networks.



## Network Rules

To create a policy, you will. An **Azure Firewall Policy** is composed of rule collection groups.

* **Rule collection group**: It is a collection of related rules. First create at least one rule collection then create rules with conditions.
* **Rules**: It defines the action to be taken when certain conditions are met.
* **Types of Rule Collection Groups (RCG)**
* Allow all outbound traffic to the internet.
* Allow all traffic between internal networks.

## Basic Rules

* General Inbound/Outbound:

  * Block all incoming and outgoing traffic.
  * Block all incoming traffic except for established connections.
  * Block all traffic except for a specific service (e.g., SSH).
* Internet/DMZ Traffic:

  * Block all inbound traffic from the internet, except for traffic to specific ports (e.g., HTTPS, SSH).
  * Block all traffic between the DMZ and the internet, except for traffic to specific ports (e.g., HTTPS, SSH).
  * Allow specific traffic between the DMZ and internal networks (e.g., HTTPS, SMTP, POP3).
* Basic Allow:

  * Open a custom port range (e.g., 5000-6000).
  * Open port 123 for NTP (Network Time Protocol).



## I. Basic Allow/Block Rules:

* General Inbound/Outbound:

  * Block all incoming and outgoing traffic.
  * Block all incoming traffic except for established connections.
  * Block all traffic except for a specific service (e.g., SSH).
* Internet/DMZ Traffic:

  * Block all inbound traffic from the internet, except for traffic to specific ports (e.g., HTTPS, SSH).
  * Block all traffic between the DMZ and the internet, except for traffic to specific ports (e.g., HTTPS, SSH).
  * Allow specific traffic between the DMZ and internal networks (e.g., HTTPS, SMTP, POP3).
* Basic Allow:

  * Open a custom port range (e.g., 5000-6000).
  * Open port 123 for NTP (Network Time Protocol).

## II. Protocol-Specific Rules:

* DNS:

  * Allow DNS (port 53) for both TCP and UDP.
  * Allow DNS traffic only for a specific domain.
* FTP:

  * Allow FTP (port 21) for a specific interface.
  * FTP Rule.
* SSH:

  * Allow SSH (port 22) from a specific IP address.
  * Allow SSH on a non-default port (e.g., 2222).
  * SSH Rule.
* Telnet:

  * Telnet Rule.
* SMTP:

  * Allow outgoing SMTP traffic (port 25) for a specific IP range.
* RDP:

  * Allow RDP (Remote Desktop Protocol - port 3389) from a specific IP address.
* SIP:

  * Allow SIP (Session Initiation Protocol - port 5060) for VoIP.
* SNMP:

  * Allow SNMP (Simple Network Management Protocol - port 161) for monitoring.
  * Allow traffic on a custom port range for a specific service (e.g., SNMP).
* NFS:

  * Allow NFS (Network File System - port 2049) for file sharing.
* NTP:

  * Allow NTP traffic (port 123) for both TCP and UDP.
* ICMP:

  * Allow ICMP echo requests (ping) from a specific subnet.
  * Block ICMP echo requests (ping) from a specific IP address.
  * Block incoming ICMP (ping) requests.
* Multicast:

  * Allow multicast traffic.
  * Allow multicast traffic for IPv6.

## III. Port-Specific Rules:

* Single Port:

  * Allow incoming and outgoing traffic on a specific port only for a specific time.
  * Allow incoming traffic on a specific port for both TCP and UDP, limiting it to a specific user.
  * Allow incoming traffic on a specific port for IPv6 (e.g., port 8080).
  * Allow only specific IP addresses on a certain port (e.g., 8080).
  * Allow traffic on a specific port for a range of IP addresses during specific days and times.
  * Allow traffic on a specific port for a specific service and network interface.
  * Allow traffic on a specific port for a specific service and source IP address.
  * Allow traffic on a specific port for a specific service, source IP address, and interface.
  * Allow traffic on a specific port for a specific service, source MAC address, and interface.
  * Allow traffic on a specific port for a specific service, source MAC address, and source IP address.
  * Block outgoing traffic on a specific port (e.g., 8080).
  * Block traffic from a specific IP address range on a specific port.
  * Block traffic on a specific port for a specific service and source IP address.
* Port Ranges:

  * Allow incoming connections on a specific port range (e.g., 8000-9000) for UDP.
  * Allow traffic on a custom port range for a specific application and user.
  * Allow traffic on a custom port range for both TCP and UDP (e.g., 7000-8000).
  * Allow traffic on a specific port range for a specific application.
  * Allow traffic on a specific port range for a specific application and destination IP address.
  * Allow traffic on a specific port range for a specific application, user, and interface.
  * Allow traffic on a specific port range for a specific application, user, and source IP address.
  * Allow traffic on a specific port range for a specific application, user, and destination IP address.
  * Allow traffic on a specific port range for a specific application, user, source IP address, and interface.
  * Allow traffic on a specific port range for both TCP and UDP, limiting it to a specific IP address.
  * Allow traffic on a specific port range for both TCP and UDP, limiting it to a specific MAC address.
  * Allow traffic on a specific port range for both TCP and UDP, limiting it to a specific user and interface.
  * Block incoming traffic on a specific port range for a specific application.
  * Block incoming traffic on a specific port range for a specific application and source IP address.
  * Block incoming traffic on a specific port range for a specific application and destination IP address.
  * Block incoming traffic on a specific port range for a specific application and interface.
  * Block incoming traffic on a specific port range for a specific application, user, and source IP address.



## Port-Specific Rules

* Single Port:

  * Allow incoming and outgoing traffic on a specific port only for a specific time.
  * Allow incoming traffic on a specific port for both TCP and UDP, limiting it to a specific user.
  * Allow incoming traffic on a specific port for IPv6 (e.g., port 8080).
  * Allow only specific IP addresses on a certain port (e.g., 8080).
  * Allow traffic on a specific port for a range of IP addresses during specific days and times.
  * Allow traffic on a specific port for a specific service and network interface.
  * Allow traffic on a specific port for a specific service and source IP address.
  * Allow traffic on a specific port for a specific service, source IP address, and interface.
  * Allow traffic on a specific port for a specific service, source MAC address, and interface.
  * Allow traffic on a specific port for a specific service, source MAC address, and source IP address.
  * Block outgoing traffic on a specific port (e.g., 8080).
  * Block traffic from a specific IP address range on a specific port.
  * Block traffic on a specific port for a specific service and source IP address.
* Port Ranges:

  * Allow incoming connections on a specific port range (e.g., 8000-9000) for UDP.
  * Allow traffic on a custom port range for a specific application and user.
  * Allow traffic on a custom port range for both TCP and UDP (e.g., 7000-8000).
  * Allow traffic on a specific port range for a specific application.
  * Allow traffic on a specific port range for a specific application and destination IP address.
  * Allow traffic on a specific port range for a specific application, user, and interface.
  * Allow traffic on a specific port range for a specific application, user, and source IP address.
  * Allow traffic on a specific port range for a specific application, user, and destination IP address.
  * Allow traffic on a specific port range for a specific application, user, source IP address, and interface.
  * Allow traffic on a specific port range for both TCP and UDP, limiting it to a specific IP address.
  * Allow traffic on a specific port range for both TCP and UDP, limiting it to a specific MAC address.
  * Allow traffic on a specific port range for both TCP and UDP, limiting it to a specific user and interface.
  * Block incoming traffic on a specific port range for a specific application.
  * Block incoming traffic on a specific port range for a specific application and source IP address.
  * Block incoming traffic on a specific port range for a specific application and destination IP address.
  * Block incoming traffic on a specific port range for a specific application and interface.
  * Block incoming traffic on a specific port range for a specific application, user, and source IP address.





## Network/Interface-Based Rules

* Network Interface:

  * Allow incoming traffic on a specific network interface (e.g., eth1).
  * Allow traffic from and to a specific network interface (e.g., eth0).
  * Allow traffic on a specific port for a specific service and network interface.
* Network Range:

  * Allow traffic from a specific network range.
* IP Address:

  * Block traffic to a specific IP address.
  * Block outgoing traffic to a specific IP address.
* MAC Address:

  * Allow traffic from a specific MAC address.
  * Block specific MAC address.
  * Block traffic from a specific MAC address for a specific service.
  * Block traffic from a specific MAC address for a specific service and interface.
* Docker:

  * Allow Docker containers to communicate on a bridge network.



## Protocol-Specific Rules

* DNS:

  * Allow DNS (port 53) for both TCP and UDP.
  * Allow DNS traffic only for a specific domain.
* FTP:

  * Allow FTP (port 21) for a specific interface.
  * FTP Rule.
* SSH:

  * Allow SSH (port 22) from a specific IP address.
  * Allow SSH on a non-default port (e.g., 2222).
  * SSH Rule.
* Telnet:

  * Telnet Rule.
* SMTP:

  * Allow outgoing SMTP traffic (port 25) for a specific IP range.
* RDP:

  * Allow RDP (Remote Desktop Protocol - port 3389) from a specific IP address.
* SIP:

  * Allow SIP (Session Initiation Protocol - port 5060) for VoIP.
* SNMP:

  * Allow SNMP (Simple Network Management Protocol - port 161) for monitoring.
  * Allow traffic on a custom port range for a specific service (e.g., SNMP).
* NFS:

  * Allow NFS (Network File System - port 2049) for file sharing.
* NTP:

  * Allow NTP traffic (port 123) for both TCP and UDP.
* ICMP:

  * Allow ICMP echo requests (ping) from a specific subnet.
  * Block ICMP echo requests (ping) from a specific IP address.
  * Block incoming ICMP (ping) requests.
* Multicast:

  * Allow multicast traffic.
  * Allow multicast traffic for IPv6.



