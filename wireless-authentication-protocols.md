Wireless Authentication Protocols
EAP - Extensible Authentication Protocol
Developed initially as an extension to the authentication part of PPP. EAP is only an extension for the protocol that
having a connection, and was created as a better authentication method to PPP.
EAP-MD5
basically MSCHAP
Takes those passwords and hashes them into MD5 hash
EAP-PSK
Uses pre-determined symmetric keys
89 of 178
Similar to WPA and WPA-2
EAP-TLS (EAP Transport Layer Security)
Cand handle an entire TLS
Needs server and client certificates
EAP-TTLS (EAP Tunneled Transport Layer Security)
Support other authentication protocols in a TLS tunnel
Use any authentication you can support, maintain security with TLS
Uses the TLS exchange method
Only requires server certificates
Protocols that Encapsulates the EAP
802.1X - Full blown authentication standard that allows us to make connections between some type of client
system. It provides an authentication mechanism to devices wishing to attach to a LAN or WLAN.
Early EAP adaptations:
LEAP (Cisco) - LEAP is weak nowdays
PEAP (Microsoft) - PEAP is weak nowdays
Protected Extensible Authentication Protocol
Protected EAP
Created by Cisco, Microsoft and RSA Security
Encapsulates EAP in a TLS tunnel, one certificate on the server
Combined a secured channel and EAP
Commonly implemented as PEAPv0/EAP-MSCHAPv2
Authenticates to Microsoft MS-CHAPv2 databases
IEEE 802.1X
IEEE 802.1X - Port-based Network Access Control (NAC)
You don't get access until you authenticate
Used in conjunction with an access database
RADIUS
LDAP
TACACS
