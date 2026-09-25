3. Networks and Infrastructure
Switches
A network switch is networking hardware that connects devices on a computer network by using packet switching to
receive and forward data to the destination device. A network switch is a multiport network bridge that uses MAC
addresses to forward data at the data link layer of the OSI model.
Filter & forward data based on MAC address
OSI Layer 2 [Data Link]
Where VLANs are set up
STP (Spanning Tree Protocol) prevents bridge loop / loop floods
🛑 Operates in the OSI Layer 2 (Data Link)
🛑 Bridge Loop/Switching Loop - A switching loop or bridge loop occurs in computer networks when there
is more than one Layer 2 path between two endpoints. The loop creates broadcast storms as broadcasts and
multicasts are forwarded by switches out every port, the switch or switches will repeatedly rebroadcast the
broadcast messages flooding the network.
38 of 178
VLANs
A virtual LAN is any broadcast domain that is partitioned and isolated in a computer network at the data link layer. LAN is
the abbreviation for local area network and in this context virtual refers to a physical object recreated and altered by
additional logic.
Provides layer 2 separation of networks
Flood guarding
STP (Spanning Tree Protocol) - enable
Routers
Router is a networking device which helps in routing the data packets between home network & other networks.
Filter & forward based on IP address
OSI Layer 3 [Network]
Allocates IP addresses to the devices connected to it using a DHCP server.
It performs NAT (Network Address Translation)
🛑 NAT doesn't provide any security mechanisms. It's simply a way to convert from one IP address to
another while the traffic is going through the network.
NAT example:
39 of 178
Origin address
NAT address
Internal Network
External Network
172.17.20.3
10.0.2.5
🛑 Generally operates in the Network layer
🛑 A firewall is a piece of software that is commonly run on a gateway router which protects us from the evils
of the Internet, so it can forward and filter based on port numbers, based on IP addresses, URL's, all kinds of
different stuff. So we would call this a network firewall because the gateway is running the firewall
software and protecting us from the evil of the Internet.
Network Topologies - Basics
The actual organization of a network in terms of how is the data moving around and the best way to do it.
LAN - Local Area Network
A LAN is a network that has a logical and physical borders that a computer can broadcast
WAN - Wide Area Network
WAN is a multiple LANs or additional WANs with routing functionality for interconnectivity.
40 of 178
MAN - Metropolitan Area Network
Internet
Connecting WANs through WANs until complete the entire world = Internet.
The protocol which runs the internet is TCP/IP
As long you're using legitimate IPv4 address or IPv6
41 of 178
Intranet
If you're using the TCP/IP stack and making your own LAN or WAN = Intranet.
Intranet is a private network which still runs TCP/IP
🛑 Extranet: example of some vendor who need to access the Intranet network. Works like a DMZ but for
private access
