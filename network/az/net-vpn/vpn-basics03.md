VPN - Virtual Private Networks
Organizations use virtual private networks (VPNs) to create an end-to-end private network connection (tunnel) over third
party networks such as the Internet or extranets. The tunnel eliminates the distance barrier and enables remote users to
access central site network resources. The IP Security (IPsec) protocol provides a framework for configuring secure
VPNs and is commonly deployed over the Internet to connect branch offices, remote employees, and business partners.
Secure site-to-site VPNs, between central and remote sites, can be implemented using the IPsec protocol. IPsec can
also be used in remote-access tunnels for telecommuter access.
51 of 178
The two types of VPN - Remote Access and Site-to-Site
Remote-access VPN
is created when VPN information is not statically set up, but instead allows for dynamically changing information and can
be enabled and disabled. Consider a telecommuter who needs VPN access to corporate data over the Internet. The
telecommuter does not necessarily have the VPN connection set up at all times. The telecommuter's PC is responsible
for establishing the VPN, each host typically has Cisco VPN client software.
Site-to-Site VPN
is created when connection devices on both sides of the VPN connection are aware of the VPN configuration in advance.
VPN Setup Steps
1. Protocol to set up tunnel
2. Protocol to handle authentication and encryption
VPN Concentrators
VPN appliances are usually located on the edge of the network
Internet-facing
Sites connect from one site to another across the Internet
The Appliances can be a standalone VPN devices or it may be integrated into another technology, such as
Firewall.
Early VPNs Protocols
PPTP - Point-to-Point tunneling Protocol
Oldest VPN protocol
Uses PPP for tunnel
Password only
52 of 178
TCP port 1723
Weak encryption
L2TP - Layer 2 Tunneling Protocol
Cisco proprietary
SImilar to PPTP
L2TP tunnel
IPsec encryption
UDP ports 500, 1701, 4500
'Pure' IPsec
uses IPsec for tunneling and encryption
Great for IPv6
UDP ports 500, 4500
SSL and TLS
TCP port 443
Often works within a web browser
TUN/TAP (virtual network driver) tunnel
TLS encryption
OpenVPN
Unique tunnel
Encryption based on SSL/TLS protocol
TCP port 1194, but can be changed
