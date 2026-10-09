# Concepts

- **Access Point (AP):** A wireless transmitter and receiver that logically connects wireless client devices operating in the infrastructure to one another and provides access to a distribution system, if connected, which is typically an organization’s enterprise wired network. A device that allows wireless devices to connect to a wired network.

- **APIPA:** A Windows feature that automatically assigns IP addresses if DHCP fails.

- **Application Firewall:** A firewall that uses stateful protocol analysis to analyse network traffic for one or more applications. A specific type of firewall that analyses network traffic at the application layer to protect against attacks.

- **Application-Level Gateway (ALG):** Application specific translation agents that allow an application (like VoIP) on a host in one address realm to connect to its counterpart running on a host in different realm transparently. It may interact with NAT to set up state, use NAT state information, modify application specific payload, and perform whatever else is necessary to get the application running across disparate address realms.

- **Application-Level Gateway Firewall:** A firewall that filters traffic based on the application being used. A second-generation firewall that filters traffic based on the internet service (the application) used to transmit or received the data.

- **Application-Level Proxy:** A firewall that deeply inspects network traffic for each application. A type of firewall that performs deep pack inspection and based on Layer 7 communication processes for each application.

- **Automatic Private IP Addressing (APIPA):** A feature of Windows that assigns an IP address to a system should DHCP address assignment fail. The IP address range used by APIPA is 169.254.0.0 - 169.254.255.255.

- **Boundary Defence:** Detect/prevent/correct the flow of information transferring networks of different trust levels with a focus on security-damaging data. Protecting the flow of information between networks with different trust levels.

- **Broadcast:** Sending data to all devices on a network. Transmission to all devices in a network without any acknowledgement by the receivers.

- **Demilitarized Zone (DMZ)** - Perimeter network segment that is logically between internal and external networks. Its purpose is to enforce the internal network’s Information Assurance (IA) policy for external information exchange and to provide external, untrusted with restricted access to releasable information while shielding the internal networks from outside attacks.

- **DevOps:** Emphasizes the need for rapid change and adaptation, which is crucial for network security.

- **DMZ (Demilitarized Zone):** A network segment between internal and external networks to protect internal systems from external threats. DMZ is a security buffer between internal and external networks.

- **Extranet** - A computer network that an organization uses for application data traffic between the organization and its business partners. A network used for communication between an organization and its business partners.

- **Firewall:** A security system that monitors and controls incoming and outgoing network traffic.

- **Gateway** - An intermediate system (interface, relay) that attaches to two (or more) computer networks that have similar functions but dissimilar implementations and that enables either one-way or two-way communication between the networks. Connects different networks allowing communication between them.

- **Handshake** - Protocol dialogue between two systems for identifying and authenticating themselves to each other, or for synchronizing their operations with each other. A protocol for establishing a secure connection between two systems.

- **Network Administrator** - Ensures availability of the organization’s network res. Role should be separated from that of the Security Administrator role to avoid conflict of interests.

- **Open Shortest Path First (OSPF)** - A standards-based link state protocol, it is a routing protocol for IP networks. It uses link-state algorithms to calculate the shortest path between each node. A routing protocol used to determine the best path for data packets.

- **Point-to-Point Protocol (PPP)** - A full-duplex TCP protocol used to connect two endpoints over a WLAN. In a wire WAN it uses a high-bandwidth fiver cable and the traffic is dedicated to the end points. Used also to connect non-LAN connections (e.g., modems, ISDN, VPNs, Frame Relay, and dial-up connections). Considered expensive.

- **Point-to-Point Tunnelling Protocol (PPTP)** - An enhanced version of PPP that uses generic routing encapsulation (GRE) to create encrypted tunnels between endpoints. Used with VPN and L2TP. Uses TCP port 1723.

- **PPP:** A protocol used to establish a connection between two endpoints over a network.

- **PPTP:** An enhanced version of PPP that provides encrypted tunnels for secure communication.

- **Proxy:** A server that acts as an intermediary between clients and other servers. A proxy server acts as a middleman in network communication. Proxy is a network services that allows clients to make indirect network connections to other network services.

- **Secure Socket Layer (SSL)** - An encryption protocol used as a TCP handshake to establish secure private communications during internet data transmissions. Usually presented in web browsers as “https.” SSL was established by Netscape.

- **Three-legged Firewall** - A firewall with three interfaces allowing the addition of a DMZ; it requires the firewall to be configured to route packets between the outside world and the DMZ differently than between the outside world and the internal network (one interface towards the internal network, one to the DMZ, and one to the internet). A firewall with three interfaces for added security, creating a DMZ.

- **Transport Layer Security (TLS)** - The current replacement for Secure Socket Layer (SSL), also known as SSL 3 or TLS 1. TLS uses TCP port 443. A cryptographic protocol used to secure communications over the internet. Transport Layer Security (TLS) is a security protocol providing privacy and data integrity between two communicating applications. The protocol is composed of two layers: the TLS Record Protocol and the TLS Handshake Protocol.

- **Transport Layer Security/Secure Sockets Layer (TLS/SSL)** - A security protocol providing privacy and data integrity between two

- **Virtual LAN (VLAN)** - A logical network segmentation implemented on switches and bridges to manage traffic. When multiples are used on a single switch, they are considered separate physical networks and function as such.

- **Virtual Private Network (VPN)** - Protected information system link utilizing tunnelling, security controls, and endpoint address translation giving the impression of a dedicated line. The term VPN describes a network connection between two sites (such as branch offices of a company) that have an end-to-end encrypted connection. With this in place, no data passing between the branch offices are visible to prying eyes. The term also describes the encrypted link between a laptop and the corporate network where all data is encrypted. The term VPN describes a network connection between two sites (such as branch offices of a company) that have an end-to-end encrypted connection. With this in place, no data passing between the branch offices are visible to prying eyes. The term also describes the encrypted link between a laptop and the corporate network where all data is encrypted.

- **Virtual Storage Area Network (vSAN)** - A collection of ports from the set of connected Fiber Channel Switches (FCS) used to form to increase storage scalability within a network.

- **VLAN:** A logical division of a network into multiple virtual networks.

- **VPN:** A secure network connection over a public network.

- **vSAN (Virtual Storage Area Network):** A software-defined storage solution that combines the local storage of multiple servers into a single, shared storage pool. It offers increased scalability and flexibility compared to traditional SANs. vSAN is a technology for efficient storage management.

- **WAN (Wide Area Network):** A network that covers a large geographic area, connecting multiple LANs. WAN and WLAN are types of networks with different geographic scopes.

- **WEP (Wired Equivalent Privacy):** An outdated and insecure encryption protocol for wireless networks. WEP is an old, weak security protocol, while WPA2 is a stronger one.

- **Wide Area Network (WAN)** A physical or logical network that provides data communications to a larger number of independent users than are usually served by a local area network (LAN) and that is usually spread over a larger geographic area than that of a LAN.

- **Wi-Fi Protected Access 2 (WPA2):** The approved Wi-Fi Alliance interoperable implementation of the IEEE 802.11i security standard. For federal government use, the implementation must use federal information processing standards (FIPS) approved encryption, such as advanced encryption standard (AES).

- **Wired Equivalent Privacy (WEP)** - A security protocol, specified in the IEEE 802.11 standard, that is designed to provide a WLAN with a level of security and privacy comparable to what is usually expected of a wired LAN. Weaknesses have been found in it and so that it is no longer considered a viable encryption mechanism.

- **Wireless Access Control:** Measures to protect wireless networks from unauthorized access. Wireless Access Control protects wireless networks.

- **Wireless Access Control:** The processes and tools used to track/control/prevent/correct the security use of wireless local area networks (LANS), access points, and wireless client systems.

- **Wireless Local Area Network (WLAN):** A group of wireless APs and associated infrastructure within a limited geographic area, such as an office building or building campus, that is capable of radio communications. WLANs are usually implemented as extensions of existing wired LANs to provide enhanced user mobility.

- **WLAN (Wireless Local Area Network):** A wireless network that covers a limited area, like an office building.

- **WPA2 (Wi-Fi Protected Access 2):** A more secure encryption protocol for wireless networks.

- **Border Gateway Protocol (BGP)** is a routing protocol used by the core internet routers to discover where exactly IP address blocks are located. If an invalid route is accepted by one or more routers, all traffic for a particular IP address block can be redirected elsewhere, that is, to the attacker.

The basics of computer networking involve connecting devices to share resources and information

Building Blocks:

- **Nodes:** These are individual devices on the network, such as computers, laptops, tablets, printers, servers, etc.

- **Links:** These are the physical or wireless connections that allow nodes to communicate. Examples include cables (Ethernet, fiber optic), or Wi-Fi signals.

Communication Protocols:

- These are sets of rules that define how devices format, transmit, and receive data over the network. They ensure all devices understand each other.

- A common protocol is the **TCP/IP suite**, which includes protocols like TCP (Transmission Control Protocol) for reliable data delivery and IP (Internet Protocol) for addressing devices.


# Network Basics

**What is a computer network?**

- Computer network is a set of nodes connected by communication links.

- Nodes can be a computer, printer, or any other device capable of sending /receiving data generated by others node network.

- Communication links could be wired or wireless.

<img src="media/image1.png" style="width:3.37246in;height:3.12026in" />

**Submarine Cable map:**

Tele Geography’s comprehensive and regularly updated interactive map of the world's major submarine cable systems and landing stations

## Transmission Media

- Physical Connections: These are the physical mediums that carry data signals between devices, such as:

- Ethernet cables: Twisted-pair copper wires used for wired connections in local area networks (LANs)

- Fiber optic cables: Glass or plastic fibers that transmit data using light signals, offering high speed and long-distance transmission.

- Wireless signals: Radio waves used for wireless communication, enabling devices to connect without physical cables.
