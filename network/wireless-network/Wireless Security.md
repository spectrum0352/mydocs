Wireless Security
WEP - Wireless Equivalency Privacy
64/128 bit RC4 ICV
RC4 - Rivest Cipher 4 Stream Cipher Algorithm
ICV - Integrity Check Value
🛑 Very old and insecure; Don't use WEP!
WPA - Wi-Fi Protected Access
Uses RC4 with TKIP (Temporal Key Integrity Protocol)
Initialization Vector (IV) is larger and an encrypted hash
Every packet gets a unique 128-bit encryption key
Personal | WPA-PSK
TKIP + PSK
64/128 bit RC4 MIC
Everyone uses the same 256-bit key
Enterprise | WPA-802.1X
TKIP + RADIUS
64/128 bit RC4 MIC
Authenticates users individually with an authentication server (e.g., RADIUS)
169 of 178
Temporal Key Integrity Protocol
Mixed the keys
Combines the secret root key with the IV
Adds sequence counter
Prevents replay attacks
Implements a 64-bit Message Integrity Check
Protecting against tampering
TKIP has it's own set of vulnerabilities
Deprecated in the 802.11-2012 standard
WPA2 - Wi-Fi Protected Access v2
802.11i IEEE standard
Enterprise
CCMP + RADIUS
128 bit AES MIC
Personal
CCMP + PSK
128 bit AES MIC
AES (Advanced Encryption Standard) replaced RC4
CCMP (Counter Mode with Cipher Block Chaining Message Authentication Code Protocol) replaced TKIP
CCMP
Uses AES for data confidentiality
128-bit key and a 128-bit block size
Requires additional computing resources
CCMP provides Data confidentiality (AES), authentication, and access control
Cryptographic Attacks 
Known Plaintext Attack (KPA)
🗡
🔑
The attacker knows at least one sample of both the plaintext and the ciphertext.
Brute Force
Online - keep trying the login process (very slow), most accounts will lockout after a number of failed
attempts.
Offline - force the hash, calculate a password hash, compare it to a stored hash; require a large
computational resource requirement.
Dictionary Attack
Is a form of brute force attack technique for defeating a cipher or authentication mechanism by trying to
determine its decryption key or passphrase by trying thousands or millions of likely possibilities, such as
words in a dictionary or previously used passwords, often from lists obtained from past security breaches.
Rainbow Table (dictionary of hashes)
Pre-built set of hashes; The calculations have already been done
Need different tables for different hashing methods (Windows is different than MySQL)
Rainbow tables won't work with salted hashes
Collision Attack | Birthday Attack
Is the same hash value for two different plaintexts. The attacker will generate multiple versions of plaintext to
match the hashes. (e.g In a classroom of 30 students, what is the chance of two students sharing a birthday?- about 70%)
170 of 178
Replay Attack
A hash with no salt, no session ID tracking, no encryption, can easily grabbed and replayed by an attacker.
Downgrade attack
Makes it change the encrypted connection to the older one (e.g. to cleartext; HTTPS to HTTP).
Weak implementations
One weak link breaks the entire chain.
Examples:
802.11 WEP - The RC4 can be recovered by gathering enough packets; The algorithm didn't sufficiently
protect the key
DES - Relatively small 56-bit keys; modern systems can brute force this pretty quickly
Hiding information
Obfuscation
1. Hidden sensitive data - providing confidentiality
2. Make the source code difficult to read
But it doesn't change the functionality of the code
Steganography
The art of hide information inside the data (hide data within data), and can be encrypted.
Common steganography techniques:
Network Based - Embed messages in TCP packets
Use an image - Embed the message in the image itself
Invisible watermarks - Yellow dots on printers can reaveal serial number and timestamps
PKI - Public Key Infrastructure
Is a system consisting of hardware, software, policies and procedures that creates, manage, distributes, uses,
store and revoke DIGITAL CERTIFICATES.
171 of 178
Also refers to the binding of public keys to people or devices
The certificate authority (CA)
It's all about trust
PKI is the way we do internet. Uses a hierarchical structure with root servers.
Certificate Authority (CA): Issues the certificates (Verisign, Thawte, etc).
Key Management lifecycle 
Key generation
♻
Create a key with the requested strength using the proper cipher
Certificate generation
Allocate a key to a user
Distribution
Make the key available to the user
Storage
Securely store and protect against unauthorized use
Revocation
Manage keys that have been compromised
Expiration
A certificate may only have a certain 'shelf life'
Digital Certificates
A public key certificate
Binds a public key with a digital signature
And other details about the key holder
A digital signature adds trust
PKI uses Certificate Authority for additional trust
Web of Trust adds other ursers for additional trust
Certificate creation can be built into the OS
Part of Windows Domain Services
3rd-party Linux options
172 of 178
Commercial certificate authorities
Built-in your browser
Purchase your web site certificate
It will be trusted by everyone's browser
Create a key pair, send the public key to the CA to be signed
A certificate signing request (CSR)
May provide different levels of trust and additional features
Private certificate authorities
You are your own CA
Build it in-house
Your devices must trust the internal CA
Needed for medium-to-large organizations
Many web servers and privacy requirements
Implement as part fo your overall computing stragey
Windows Certificate Services, OpenCA
PKI trust relationships
Single CA
Everyone receives their certificates from one authority
Hierarchical
Single CA issues certs to intermediate CAs
Distributes the certificates management load
Easier to deal with the revocation of an intermediate CA than the root CA
173 of 178
Mesh
Cross-certifying CAs
Doesn't scale well
Web-of-trust
Everyone is an authority
Alternative to traditional PKI
174 of 178
Mutual Authentication
Mutual authentication requires both sides of a communications session to authenticate to each other.
🛑 Certificate chaining - Chain of trust; List all the certs between the server and the root CA; The chain
starts with the SSL certificate and ends with the Root CA.
CRL - Certificate Revocation List
❌
A list of serial numbers of certificates that have been revoked or are no longer valid, therefore should not be relied on.
OCSP - Online Certificate Status Protocol
Is a more modern version of CRL that are used today, have a better performance.
🛑 OCSP stapling - The certification holder verify their own status instead of CA server; OCSP status is
'stapled' into the SSL/TLS handshake, digitally signed by the CA
🛑 Early Internet Explorer versions did not support OCSP
Types of Certificates
Root certificate
The public key certificate that identifies the root CA (Certificate Authority)
Everything starts with this certificate
The root certificate issues other certificates
Intermediate CA certificates
Any other certs
175 of 178
Web server SSL certificates
Domain validation certificate (DV)
Owner of the certificate has some control over a DNS domain
Exntended validation certificate (EV)
Additional checks have verified the certificate owner's identity (the green name on the address bar)
Subject Alternative Name (SAN)
Extension to an X.509 cert
Lists additional identification information
Allows a certificate to support many different domains
Wildcard domain
Certificates are based on the name of ther server
A wildcard domain will apply to all server names in a domain (e.g., *.google.com)
Self-signed certificates
Internal certificates don't need to be signed by a public CA
Your company is the only one going to use it
No need to purchase trust for devices that already trust you
Build your own CA
Issue your own certificates signed by your own CA
Install the CA certificate/trusted chain on all devices
Machine and computer certificates
You have to manage many devices
Often devices that you'll never physically see
How can you truly authenticate a device?
Put a certificate on the device that you signed
Other business processes rely on the certificate
Access to the remote access VPN from authorized devices
Management software can validate the end device
User certificates
Associate a certificate with a user
A powerful electronic 'id card'
Use as an additional authentication factor
Limit access without the certificate
Integrate onto smart cards
Use as both a physical and digital access card
Email certificates
Use cryptography in an email platform
You'll need public key
Encrypting emails
Use a recipient's public key to encrypt
Receive encrypted emails
Use your private key to decrypt
Digital signatures
Use your private key to digitally sign an email
Non-repudiation, integrity
176 of 178
Code signing certificate
Developers can provide a level of trust
The user's OS will examine the signature
Checks the developer signature
Validates that the software has not been modified
List of All Ports for Security+ Exam
Port Description
20 File Transfer Protocol - FTP Data
21 File Transfer Protocol - FTP Control
22 SSH - Secure Shell Remote Login Protocol / SCP / SFTP
23 Telnet
25 SMTP - Simple Mail Transfer Protocol
49 TACACS+ - Login Host Protocol
53 DNS - Domain Name System
67 DHCP - Bootp-server (Outgoing DHCP)
68 DHCP - Bootp-client (Incoming DHCP)
69 TFTP - Trivial File Transfer Protocol
80 HTTP
88 Kerberos - Secure Encrypted Login
110 POP3 - Post Office Protocol (Email)
119 NNTP - Network News Transfer Protocol
123 NTP - Network Time Protocol
137, 138, 139 NETBios Protocol
143 IMAP 4 - Internet Message Access Protocol (Email)
161, 162 SNMP - Simple Network Management Protocol
389 LDAP - Lightweight Directory Access Protocol
177 of 178
Port
Description
443
HTTPS - HTTP over TLS/SSL
445
SMB
464
Kerberos
465
SMTP/SMTPS over SSL
500
ISAKMP - Internet Security Association and Key Management Protocol - IPSec
514, 6514
SysLog Servers & SysLog TCP over TLS
636
LDAP over SSL
860
iSCSI - Internet Small Computer Systems Interface
993
IMAP 4S - IMAP over TLS/SSL (Email)
995
POP3 over SSL
989, 990
FTP - FTP Data and Control over TLS/SSL
1194
OpenVPN
1645, 1646
RADIUS
1812, 1813
RADIUS
1701
L2TP - Layer 2 Tunneling Protocol (IPSec - used in VPN)
1723
PPTP - Point-to-Point Tunneling Protocol - VPN
3389
RDP - Remote Desktop Protocol
5060, 5061
SIP - Session Initiation Protoco
