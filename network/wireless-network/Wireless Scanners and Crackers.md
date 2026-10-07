Wireless Scanners and Crackers
Wireless Monitoring:
Packet capturing
Wireless attacks:
Rogue access points
Deauthentication attacks
Cracking:
Find a wireless netowrk key
WEP - Cryptographic vulnerabilities - relatively straightforward
25 of 178
WPA PSK and WPA2 PSK - Dictionary brute force, rainbow tables
Many Open Source projects:
Aircrack-ng Suite, Fern
aircrack-ng
Password Crackers
Passwords are stored as Hashes
It's a one-way trip (you can't convert hash to plain-text password)
Some are stored without much complexity - relatively straightforward to brute-force a weak hash
As an attacker, After get the hashes you can use a good wordlist or rainbow-table to crack them.
Many tools available:
John the Ripper:
Ophcrack:
26 of 178
Vulnerability Scanners
Gather as much information as possible
Security Patches alert
Popular tools:
MBSA - Microsoft Baseline Secuirty Analyzer
Nessus by Tenable
Nikto
⚠ Vulnerability Scanners will be explained with more details later below at Chapter 7 - Testing Infrastructure.
Configuration Compliance Scanner
The devices must meet minimum security configurations
Comply with internal requirements or industry regulations
Check for varios configurations
OS version
Installed applications
Network settings
Anti-virus / anti-malware settings, versions and signatures
Server configurations
Auditing may be ongoing
Report on current status, identify changes over time
Integrated with login process and/or VPN connection
