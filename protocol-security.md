Protocols Security
84 of 178
Clear Text (Unencrypted) Protocols ❌❌🔓🔓
Protocol Port Description
20, 21 FTP Used for upload and download files to a remote server
23 Telnet Terminal session access
25 SMTP Mail transfer
80 HTTP Defines how messages are formatted and transmitted between webservers and
browsers
110 POP3 Mail transfer
143 IMAPv4 Mail transfer
139, 445 NETBIOS TCP NetBIOS connections between 2 hosts using SMB (Samba)
161, 162 SNMP Simple Network Management Protocol is a way for different devices on a network to
share information with one another
1521 SQLnet TCP port that listens for and handles network requests to be passed to a database
instance, usually a SQL/Oracle database
Threats of Clear Text Protocols
Good password policy doesn't help
Same passwords for everything are a threat
Is dangerous to use Telnet or FTP internally
Confidentiality becomes a major problem using FTP, Telnet and SMTP
Switched networks do not prevent sniffing
Where ever you go wireless networks can be detected
War driving could become a major issue
Sniffing Tools:
Etheral
Ngrep
Ettercap, Bettercap
Kismet
Dsniff
Drifnet
Encrypting Traffic ✅✅🔒🔒
Clear Text Protocol Port Over SSL/TLS
HTTP 80 443
NNTP 119 563
85 of 178
Clear Text Protocol Port Over SSL/TLS
FTP-data 20 989
FTP-control 21 990
Telnet 23 992
IMAP 143 993
POP3 110 995
SMTP 25 465 (revoked)
SSL and TLS 🔐🔐
Secure Socket Layer (SSL) and Transport Layer Security (TLS), they are protocols that are designed to make secure
connections between two points.
🛑 SSL and TLS originally designed for Secure Websites (HTTPS)
🛑 TLS is more robust and new solution for secure connection than SSL
🛑 SSL/TLS is not only for HTTPS, you can see in e-mails, VPNs, all over the internet.
Making a Secure Connection
Client Hello - Body/Example (from Wireshark):
Symmetric Encryption (e.g AES 128 GCM)
Key Exchange (e.g ECDHE)
Authentication (e.g RSA certs)
HMAC (hash-based message authentication code) (e.g SHA 256)
SRTP protocol - Voice and Video
Secure Real-Time Transport Protocol / Secure RTP
Uses AES to encrypt the voice/video flow
Provides Authentication, Integrity and replay protection
HMAC-SHA1 - Hash-based message authentication code using SHA1
NTP protocol - Time synchronization
Classic NTP has no security features
Exploited as amplifiers in DDoS attacks
NTP has been arroun prior to 1985
NTPsec
Secure network time protocol
Began development in June 2015
Runs on Port 123
S/MIME - Email
Secure/Multipurpose Internet Mail Extensions
Public key encryption and digital igning of mail content
Requires a PKI or similar organization of keys
Secure POP and Secure IMAP
86 of 178
Use a STARTTLS extension to encrypt POP3 with SSL or use IMAP with SSL
SSL/TLS
If the mail is browser based, always encrypt with SSL
🛑 SMTP, POP and IMAP is not secure.
SMTP over TLS/SSL
Encrypt the connection to the server
Uses port 465 or 587
IMAP over TLS/SSL
Creates a TLS encrypted tunnel
Uses port 993
POP over TLS/SSL
Creates a TLS encrypted tunnel
Uses port 995
HTTP /S - Web
HTTP is the foundation of data communication for the World Wide Web.
HTTP is unencrypted
HTTP over TLS / HTTP over SSL / HTTP secure = HTTPS
Uses public key encryption
Symmetric session key is transferred using asymmetric encryption
Security and speed
HTTP Runs on Port 80
HTTPS Runs on Port 443
🛑 TLS encryption is a protocol that you can plug it into different types of applications
SSH protocol
Key exchange algorithms
Designed to run in a tunneling mode (encrypted); And then can provide their own encryption (AES, DES...)
Runs on Port 22
🛑 Almost any encrypted application or protocol number do some kind of key exchange.
