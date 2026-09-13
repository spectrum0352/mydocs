# Gaining Access (Initial Access)

## Overview

**Gaining Access** is the phase in which an attacker successfully enters a target environment by exploiting vulnerabilities, weak security controls, stolen credentials, or user trust. It is one of the most critical stages of the Cyber Kill Chain and corresponds to the **Initial Access** tactic in the MITRE ATT&CK framework.

Once initial access is obtained, an attacker typically attempts to:

- Establish persistence
- Escalate privileges
- Evade security controls
- Move laterally
- Collect credentials
- Exfiltrate sensitive data
- Deploy malware or ransomware

---

# Categories of Initial Access Attacks

## 1. Social Engineering Attacks

Attackers manipulate users into performing actions that compromise security.

### Phishing
- Email phishing
- Spear phishing
- Whaling
- Clone phishing

### Voice-Based Attacks
- Vishing (Voice Phishing)
- Tech Support Scam

### SMS Attacks
- Smishing (SMS Phishing)

### QR Code Attacks
- Quishing (QR Phishing)

### Business Email Compromise (BEC)

### Social Media Impersonation

### Fake Job Recruitment

### Malicious Surveys

### Fake Software Updates

### Fake MFA Requests (MFA Fatigue)

### USB Drop Attack

### Shoulder Surfing

### Tailgating / Piggybacking

### Dumpster Diving

---

# 2. Credential-Based Attacks

Attackers gain access using stolen or weak credentials.

## Password Attacks

- Password Spraying
- Brute Force
- Dictionary Attack
- Hybrid Attack
- Credential Stuffing
- Password Guessing
- Password Reuse Attack

## Hash Attacks

- Pass-the-Hash
- Pass-the-Ticket
- Kerberoasting
- AS-REP Roasting
- Rainbow Table Attack
- Hash Cracking

## Token Attacks

- OAuth Token Theft
- JWT Token Abuse
- Session Hijacking
- Cookie Theft

## Multi-Factor Authentication (MFA) Attacks

- MFA Fatigue
- SIM Swapping
- OTP Theft
- Adversary-in-the-Middle (AiTM)
- Push Notification Bombing

---

# 3. Public-Facing Application Exploitation

Attackers exploit internet-facing applications.

Examples include:

- SQL Injection
- Command Injection
- Remote Code Execution (RCE)
- File Upload Vulnerabilities
- Directory Traversal
- Local File Inclusion (LFI)
- Remote File Inclusion (RFI)
- XML External Entity (XXE)
- Server-Side Request Forgery (SSRF)
- Cross-Site Scripting (XSS)
- Cross-Site Request Forgery (CSRF)
- Insecure Deserialization
- Authentication Bypass
- API Exploitation

---

# 4. Vulnerability Exploitation

Attackers exploit known or zero-day vulnerabilities.

## Examples

- Unpatched Operating Systems
- Outdated Software
- Zero-Day Exploits
- Buffer Overflow
- Memory Corruption
- Privilege Escalation Bugs
- Misconfigured Services

---

# 5. Remote Service Attacks

Compromising exposed remote management services.

## Services

- Remote Desktop Protocol (RDP)
- Secure Shell (SSH)
- Telnet
- FTP
- SMB
- VNC
- WinRM
- Citrix
- VPN Gateways
- Remote Management Consoles

Common techniques:

- Password Spraying
- Brute Force
- Exploiting Service Vulnerabilities

---

# 6. Active Directory Attacks

Targeting Windows domain environments.

## Techniques

- Kerberoasting
- AS-REP Roasting
- Pass-the-Hash
- Pass-the-Ticket
- Golden Ticket
- Silver Ticket
- DCShadow
- DCSync
- LDAP Enumeration
- BloodHound Reconnaissance

---

# 7. Cloud Initial Access

Compromising cloud infrastructure.

## Azure

- Compromised Microsoft Entra ID Accounts
- OAuth Application Abuse
- Service Principal Abuse
- Managed Identity Abuse
- Azure Portal Credential Theft
- Azure CLI Token Theft
- Azure Storage Key Theft
- Azure SAS Token Abuse

## AWS

- IAM Credential Theft
- Access Key Leakage
- STS Token Theft
- EC2 Metadata Exploitation
- S3 Bucket Misconfiguration

## Google Cloud

- Service Account Key Theft
- OAuth Abuse
- API Key Exposure

---

# 8. Container and Kubernetes Attacks

Initial compromise of containerized environments.

Examples:

- Exposed Kubernetes Dashboard
- Anonymous Kubernetes API
- Docker Socket Exposure
- Privileged Containers
- Misconfigured RBAC
- Exposed etcd Database
- Container Escape
- Malicious Images

---

# 9. Network-Based Attacks

Compromising network infrastructure.

## Examples

- ARP Spoofing
- DNS Poisoning
- DHCP Spoofing
- Man-in-the-Middle (MITM)
- LLMNR/NBT-NS Poisoning
- Rogue Access Point
- Evil Twin Wi-Fi
- Packet Sniffing
- Network Pivoting

---

# 10. Wireless Attacks

Targeting wireless networks.

Examples:

- WPA/WPA2 Password Cracking
- WPA3 Downgrade Attacks
- Rogue Wi-Fi
- Evil Twin
- Bluetooth Exploitation
- NFC Attacks
- Deauthentication Attack

---

# 11. Malware-Based Initial Access

Using malicious software to establish access.

Examples:

- Trojan
- Downloader
- Dropper
- RAT (Remote Access Trojan)
- Worm
- Rootkit
- Keylogger
- Spyware
- Backdoor

Delivery methods:

- Email Attachments
- Malicious Links
- USB Devices
- Drive-by Downloads

---

# 12. Supply Chain Attacks

Compromising trusted software or vendors.

Examples:

- Malicious Software Updates
- Third-Party Vendor Compromise
- Compromised Libraries
- Dependency Confusion
- Typosquatting Packages
- Malicious Browser Extensions

---

# 13. Physical Access Attacks

Attackers gain direct physical access.

Examples:

- Stolen Laptop
- Stolen Mobile Device
- Rogue USB Device
- Hardware Keylogger
- BadUSB
- Evil Maid Attack
- Bootable USB Attack
- BIOS Modification

---

# 14. Insider Threat

Malicious or negligent insiders.

Examples:

- Privileged User Abuse
- Data Theft
- Credential Sharing
- Unauthorized Software Installation
- Insider Sabotage

---

# 15. Identity-Based Attacks

Targeting identity providers and authentication systems.

Examples:

- Microsoft Entra ID Compromise
- Active Directory Compromise
- Federation Trust Abuse
- SAML Token Forgery
- OAuth Consent Grant Abuse
- Single Sign-On (SSO) Abuse

---

# 16. Email-Based Initial Access

Examples:

- Malicious Attachments
- Macro Malware
- HTML Smuggling
- ZIP/RAR Password-Protected Malware
- Embedded ISO/VHD Files
- OneNote Malware
- PDF Exploits

---

# 17. Web-Based Initial Access

Examples:

- Drive-by Download
- Watering Hole Attack
- Malvertising
- Browser Exploit
- Fake Login Portal
- Browser Extension Malware

---

# 18. Internet-Facing Infrastructure

Attackers exploit exposed infrastructure.

Examples:

- VPN Appliances
- Firewalls
- Exchange Servers
- Citrix ADC
- VMware ESXi
- Web Servers
- Load Balancers
- Reverse Proxies
- API Gateways

---

# 19. IoT and OT Initial Access

Examples:

- Smart Cameras
- Industrial Control Systems (ICS)
- PLC Devices
- SCADA Servers
- Building Management Systems
- Smart Sensors
- Medical Devices

---

# 20. Misconfiguration Abuse

Examples:

- Open Storage Buckets
- Anonymous File Shares
- Public Databases
- Weak Firewall Rules
- Open Management Ports
- Excessive IAM Permissions
- Disabled MFA
- Default Credentials
- Exposed Secrets

---

# 21. Credential Discovery Sources

Common sources of stolen credentials:

- Dark Web Marketplaces
- Data Breaches
- Password Dumps
- Infostealer Malware
- Browser Password Stores
- Memory Dumps
- Password Managers
- GitHub Secret Leaks
- Configuration Files
- Backup Files

---

# Common Initial Access Scenarios

| Scenario | Example |
|----------|---------|
| Phishing | User opens malicious attachment |
| VPN Compromise | Stolen VPN credentials |
| RDP Attack | Brute-force against exposed RDP |
| Web Exploit | SQL Injection leading to web shell |
| Cloud Account Takeover | Compromised Microsoft Entra ID account |
| OAuth Abuse | User consents to malicious application |
| USB Attack | Malicious USB executes malware |
| Supply Chain | Compromised software update |
| Container Attack | Exposed Kubernetes dashboard |
| Insider Threat | Employee abuses privileged access |
| Wireless Attack | Evil Twin Wi-Fi access point |
| Physical Access | Stolen laptop with cached credentials |

---

# Defensive Controls

## Identity Security

- Multi-Factor Authentication (MFA)
- Passwordless Authentication
- Conditional Access
- Identity Protection
- Privileged Identity Management (PIM)
- Strong Password Policies

## Network Security

- Network Segmentation
- Zero Trust Architecture
- Firewalls
- IDS/IPS
- VPN with MFA
- Secure Remote Access

## Endpoint Security

- Microsoft Defender for Endpoint
- Endpoint Detection and Response (EDR)
- Application Control
- Device Encryption
- USB Device Control

## Email Security

- Secure Email Gateway
- Anti-Phishing Protection
- DMARC, DKIM, and SPF
- Attachment Sandboxing
- URL Rewriting

## Cloud Security

- Microsoft Defender for Cloud
- Azure Policy
- AWS Security Hub
- CSPM
- Cloud Identity Monitoring

## Vulnerability Management

- Continuous Vulnerability Scanning
- Patch Management
- Secure Configuration Baselines
- Regular Penetration Testing

## Monitoring and Detection

- Microsoft Sentinel
- SIEM
- SOAR
- UEBA
- Threat Intelligence Integration
- Continuous Log Monitoring

## Security Awareness

- Phishing Simulations
- Security Awareness Training
- Social Engineering Education
- Incident Reporting Procedures

---

# MITRE ATT&CK Mapping (Initial Access)

| Technique ID | Technique |
|--------------|-----------|
| T1566 | Phishing |
| T1190 | Exploit Public-Facing Application |
| T1133 | External Remote Services |
| T1078 | Valid Accounts |
| T1091 | Replication Through Removable Media |
| T1189 | Drive-by Compromise |
| T1195 | Supply Chain Compromise |
| T1659 | Content Injection |
| T1200 | Hardware Additions |
| T1136 | Create Account |
| T1199 | Trusted Relationship |
| T1584 | Compromise Infrastructure |

---

# Key Takeaway

Successful initial access rarely relies on a single technique. Modern attackers often combine multiple methods—such as phishing to steal credentials, exploiting internet-facing applications, abusing cloud identities, or leveraging supply chain compromises—to penetrate an environment. A defense-in-depth strategy that integrates identity security, endpoint protection, network controls, vulnerability management, continuous monitoring, and user awareness is essential to reduce the risk of initial compromise.
