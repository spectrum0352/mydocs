IPSec - Internet Protocol Security
Is a suite of protocols developed to ensure the integrity, confidentiality and authentication of data communications over
an IP network.
🛑 IPSec works at the Layer 3 - Network (IPv4)
IPSec Components
1. Encapsulating Security Payload (ESP) – It provides data integrity, encryption, authentication and anti replay. It
also provides authentication for payload.
2. Authentication Header (AH) – It also provides data integrity, authentication and anti replay and it does not provide
encryption. The anti replay protection, protects against unauthorized transmission of packets. It does not protect
data’s confidentiality.
3. Internet Key Exchange (IKE) – It is a network security protocol designed to dynamically exchange encryption
keys and find a way over Security Association (SA) between 2 devices. The Security Association (SA) establishes
shared security attributes between 2 network entities to support secure communication. The Key Management
Protocol (ISAKMP) and Internet Security Association which provides a framework for authentication and
key exchange. ISAKMP tells how the set up of the Security Associations (SAs) and how direct connections
between two hosts that are using IPsec.
53 of 178
IPSec Transport Mode and Tunnel Mode
When IPsec protects traffic, it has a couple of services and modes to choose from.
Transport mode - preserving original IP header. Typically used in combination with GRE or other encapsulating
protocols. (Host-to-Host)
Tunnel mode - encapsulating entire IP datagram within a new header, essentially tunneling the packet. (The gateway
creates the tunnel)
1. Some TCP data will be sent over:
2. And now about how those IP protocols fit in the two modes.
54 of 178
The last mode is what is typically used with crypto map based IPsec VPNs.
Use of IPSec
VPNs
Pure IPsec (using tunneling mode)
IPSec with L2TP (add a tunnel layer)
RADIUS and TACACS+
IPSec with IPv6
Using IPSec with Non-security protocols / Encrypting Unsecured Protocols
e.g. IPsec over Telnet
