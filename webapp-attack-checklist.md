 Web Application Testing Overview

Web applications provide an interface between end users and web servers through dynamically generated pages or client-side scripts.
Web application testing is detailed, intense, and time-consuming.
Vulnerabilities may exist on:
Server-side
Client-side
Covers:
Traditional Web Applications
Web APIs
Webhooks
Web Services (SOAP/REST)
Web Shell exposure
Mobile-connected applications
Focus on all web applications across environments (Dev, QA, Prod, CI/CD).
2️⃣ Security Architecture & Design Review
Security Architecture

Defines organizational security framework.
Architectural building blocks:
Infrastructure
Identity & Access Management (IAM)
Detection & Response
Solution architecture focuses on specific system implementation.
Solution building blocks:
Privileged Access Management (PAM)
Web Application Firewall (WAF)
Hardware tokens
Enterprise architecture provides high-level system component view.
Spiral lifecycle ensures security throughout SDLC.
Secure Development Practices

Validate and sanitize all inputs.
Whitelist user input.
Use secure coding standards.
Secure CI/CD pipeline integration.
Perform security reviews before deployment.
3️⃣ Reconnaissance & Footprinting
 

3.1 Server Discovery
Identify physical/virtual servers hosting applications.
Use:
Whois Lookup
DNS interrogation
Port scanning
Discover IP addresses and DNS names.
 

 

3.2 Service Discovery
Identify running services (web server, database, mail).
Enumerate exploitable services.
Discover virtual domains:
nmap --script hostmap <host>
 

3.3 Server Identification
Identify:
Server type (Apache, IIS, Nginx, Tomcat, Jetty)
Version
OS
Installed modules
Example tools:
httprecon
ID Serve
Wfetch
Netcraft
Example:
nmap -sV -O -p <target>
 

3.4 Hidden Content Discovery
Directory brute-forcing.
Discover hidden files & endpoints.
Extract content from:
robots.txt
Sitemap.xml
HTML comments
Example:
nmap --script http-enum -p80 <host>
nmap --script http-robots.txt <host>
4️⃣ Web Infrastructure Footprinting
 









Mirror website:
HTTrack
WebCopier Pro
BlackWidow
Identify:
Directory structure
External links
Admin panels
Sniff traffic (authorized testing only).
Telnet web server for banner grabbing.
Check WAF presence:
nmap -p80 --script http-waf-detect <host>
5️⃣ Authentication & Authorization Testing
 

Authentication Testing
Username enumeration.
Weak password policies.
Password brute-force:
THC-Hydra
Brutus
Verify:
Account lockout after failed attempts.
Throttle failed login attempts.
Password rules enforced everywhere.
Old password invalid after change.
Two-factor authentication (OTP).
Verify login bypass attempts.
Test empty tokens acceptance.
Ensure tokens are session-bound.
 

Authorization Testing
Broken Access Control (BAC).
Insecure Direct Object References (IDOR).
Privilege escalation.
Role validation on every endpoint.
Cross-tenant isolation verification.
Ensure lower privilege users cannot:
Access admin pages
Access higher privilege functions
URL manipulation testing.
Developer console tampering.
6️⃣ Session Management Testing
Session fixation.
Session hijacking.
Session replay.
Session sniffing.
Session ID prediction.
Verify:
Session invalidation after logout.
Expired sessions cannot be reused.
Session IDs not in URL.
Cookies:
HttpOnly
Secure
Signed with strong secret
Not storing passwords
Encrypted
Tools:
Burp Suite
Firesheep
JHijack
7️⃣ Injection Testing
SQL Injection (SQLi)

Test using:
Single quotes
SQLmap
Verify database interaction security.
Connection string injection.
Blind SQLi.
Second-order SQLi.
Cross-Site Scripting (XSS)

Reflected
Stored
DOM-based
Encoding verification.
Test all input fields.
Command Injection

Test OS-specific separators.
Payload encoding bypass.
Test all parameters.
LDAP Injection

XML Injection

XML External Entity (XXE)

Test SOAP/XML payloads.
DoS via recursive payloads.
File exfiltration.
Template Injection (SSTI/CSTI)

SOAP Injection

Use SoapUI.
8️⃣ CSRF Testing
Missing CSRF tokens.
Incorrect CSRF validation.
Tokens not session-bound.
Empty tokens accepted.
Referrer validation bypass.
9️⃣ Server-Side Request Forgery (SSRF)
Blind SSRF.
Internal network access.
File exfiltration.
Command execution.
10️⃣ File Handling Vulnerabilities
Local File Inclusion (LFI)
Remote File Inclusion (RFI)
Directory Traversal
Unrestricted file upload
Oversized payload testing
SVG/DOCX/XLSX parsing abuse
11️⃣ Open Redirect & Header Injection
URL manipulation.
JavaScript-based redirect bypass.
HTTP header injection.
Redirection validation.
12️⃣ Security Headers Verification
Content Security Policy (CSP v2)
No unsafe-inline
Referrer-Policy
Strict-Transport-Security
X-Frame-Options
X-Content-Type-Options
Use integrity attribute for external scripts.
13️⃣ Encryption & Transport Security
All sensitive pages over HTTPS.
SSL/TLS configuration review.
Prevent MITM via encrypted channels.
Encrypt sensitive data at rest.
Ensure no cleartext credentials.
14️⃣ Application Security Testing (AST)
Types

SAST – Source code analysis
DAST – Runtime testing
IAST – Hybrid testing
Mobile security testing
Popular Tools

Veracode
Checkmarx
Burp Suite
Qualys
Acunetix
Netsparker
Insight Appsec
Appscan
Micro Focus Fortify
GitLab
15️⃣ Vulnerability Scanning
Automated scanning.
HP WebInspect.
Acunetix.
Continuous CI/CD scanning.
Identify outdated components.
Third-party vulnerabilities.
16️⃣ Logging & Monitoring
Log:
Authentication attempts
Privilege changes
Important operations
Logs must:
Be tamper-proof
Be traceable
Avoid logging sensitive data.
Implement alerting for suspicious activity.
17️⃣ Web Service Security Testing
Web Service Attacks

SOAP injection
XML parsing attacks
WSDL analysis
Web Service probing
API misconfiguration
Tools

SoapUI
Sandcat Browser
Nmap NSE scripts
Metasploit
18️⃣ Denial of Service Testing
Recursive payloads.
Oversized payloads.
Connection pool exhaustion.
XML parser DoS.
19️⃣ Error Handling & Information Leakage
Custom error pages.
No stack traces.
No DB details exposed.
No server version leakage.
20️⃣ Password & Account Security
Account lockout.
Password complexity.
No password reuse.
Encrypted storage.
No password in cookies.
Password change invalidates old sessions.
21️⃣ Web Server Security Testing
 









Test configuration of:

Apache
IIS
Nginx
Tomcat
Jetty
Check:

TRACE method disabled
Default credentials removed
Unnecessary services disabled
Known vulnerabilities patched
22️⃣ Advanced Attack Vectors
JWT validation
Weak signing algorithms
None algorithm attack
CSP bypass techniques.
Multi-tenant isolation.
Logic flaws.
Business logic abuse.
Cross-application trust exploitation.
23️⃣ Web Application Hacking Methodology
Information gathering
Attack surface mapping
Vulnerability identification
Exploitation validation
Post-exploitation analysis
Reporting with remediation
⚠️ Important Note

This checklist is for authorized security testing only.
Do not attempt testing without explicit written permission.

 Web App Attack Checklist
(Comprehensive, Deduplicated, Expanded – Organized by Attack Types + General Controls)

 

1️⃣ Injection Attacks
🔹 SQL Injection (SQLi)

Exploiting SQL query vulnerabilities to manipulate or extract database data.
Can lead to authentication bypass, data theft, data tampering, or full DB compromise.
Controls / Mitigation

Parameterized queries / prepared statements
Stored procedures (securely implemented)
Strict input validation (type, length, format)
Least privilege database accounts
Disable dangerous DB features (e.g., xp_cmdshell)
Custom error messages (no stack traces)
WAF with SQLi detection
Isolate database server from web server
Regular code review and SAST/DAST testing
🔹 OS Command Injection

Executing arbitrary OS commands via vulnerable input fields.
Controls

Avoid direct shell execution from user input
Input validation and sanitization
Use safe APIs instead of system calls
Run services under least privilege accounts
Application sandboxing
🔹 LDAP Injection

Manipulating LDAP queries to bypass authentication or retrieve unauthorized data.
Controls

Parameterized LDAP queries
Escape special LDAP characters
Restrict LDAP query scope
Strong directory access controls
🔹 File Injection / Remote File Inclusion (RFI/LFI)

Executing malicious files through unsanitized input.
Controls

Strict input validation
Disable allow_url_include / allow_url_fopen (PHP)
Use chroot jail
Restrict file upload types
Store uploaded files outside web root
2️⃣ Broken Authentication & Account Management
🔹 Authentication Hijacking

Stealing credentials via phishing, XSS, MitM.
🔹 Broken Account Management

Weak password policies
No lockout controls
Default accounts enabled
🔹 Session Fixation / Broken Session Management

Forcing predictable session IDs
Hijacking active sessions
Controls

Strong password policies
MFA (Multi-Factor Authentication)
Account lockout policies
Regenerate session ID after login
Use HTTPS everywhere
Secure, HTTPOnly, SameSite cookies
Session timeout enforcement
Hash passwords (bcrypt, Argon2)
3️⃣ Broken Access Control
🔹 Missing Function-Level Access Control

Lack of authorization checks for specific functions.
🔹 Insecure Direct Object References (IDOR)

Accessing resources by manipulating object identifiers.
🔹 Failure to Restrict URL Access

Direct access to unauthorized endpoints.
Controls

Role-Based Access Control (RBAC)
Fine-grained permissions
Server-side authorization checks
Access control lists (ACLs)
Canonicalization of input
Deny-by-default model
4️⃣ Cross-Site Attacks
🔹 Cross-Site Scripting (XSS)

Injecting malicious scripts into web pages.
Controls

Output encoding (HTML, JS, URL context)
Content Security Policy (CSP)
Input validation
Avoid inline scripts
Secure frameworks with auto-escaping
🔹 Cross-Site Request Forgery (CSRF)

Forcing authenticated users to perform unintended actions.
Controls

Anti-CSRF tokens
SameSite cookie attribute
Verify Origin/Referrer headers
Avoid GET for state-changing operations
5️⃣ Data Exposure & Cryptographic Failures
🔹 Sensitive Data Exposure

Storing or transmitting sensitive data without protection.
🔹 Insecure Cryptographic Storage

Weak encryption or poor key management.
🔹 Insufficient Transport Layer Protection

No HTTPS or weak TLS configuration.
Controls

TLS 1.2+ only
Strong cipher suites
Encrypt data at rest (AES-256)
Secure key storage
Tokenization where appropriate
HSTS enabled
Valid, non-expired certificates
Backend encryption
6️⃣ Security Misconfiguration
Default credentials
Unnecessary services enabled
Debug mode enabled in production
Improper SSL configuration
Exposed error messages
Controls

Configuration hardening
Disable unused services and modules
Remove default accounts
Secure error handling
Regular configuration audits
Automated vulnerability scanning
7️⃣ Directory & File System Attacks
🔹 Directory Traversal

Accessing files outside web root.
Controls

Canonicalize file paths
Restrict file system permissions
Disable directory listing
Patch web server software
🔹 Malicious File Execution

Uploading and executing harmful files.
Controls

Restrict file types
Scan uploads with antivirus
Store uploads outside executable paths
8️⃣ Cookie & Session Attacks
🔹 Cookie Poisoning

Modifying cookie values to escalate privileges.
🔹 Cookie Snooping

Intercepting cookies over insecure connections.
Controls

Secure and HTTPOnly flags
SameSite attribute
Encrypt sensitive cookie data
Implement logout function
Avoid storing passwords in cookies
9️⃣ Network-Level & Infrastructure Attacks
🔹 Denial-of-Service (DoS / DDoS)

Flooding server to make it unavailable.
Controls

Rate limiting
Load balancing
WAF
IDS/IPS
DDoS protection services
ICMP restrictions
SYN flood protection
🔹 DNS Hijacking / Amplification

Redirecting traffic or amplifying DDoS via DNS.
Controls

Secure DNS configuration
DNSSEC
Restrict open resolvers
🔹 Man-in-the-Middle (MitM)









Intercepting communication between client and server.
Controls

HTTPS everywhere
Certificate validation
VPN or secure tunneling
Certificate pinning
HSTS
🔟 Other Web Application Threats
Buffer overflow
Hidden field manipulation
Parameter tampering
Log tampering
Platform exploits
Security management exploits
Obfuscation techniques to evade detection
Improper error handling
Information leakage
Network access attacks
Controls

Secure coding practices
Input validation
Memory-safe languages
Centralized logging
Log integrity monitoring
Patch management
SIEM monitoring
1️⃣1️⃣ Web Services Attacks (SOAP / XML / API)
WSDL abuse
XML injection
XXE attacks
Controls

WSDL access controls
Schema validation
Disable external entity processing
API authentication (OAuth, JWT)
Rate limiting
1️⃣2️⃣ Using Components with Known Vulnerabilities
Outdated frameworks
Vulnerable third-party libraries
Controls

Dependency management
SBOM (Software Bill of Materials)
Automated vulnerability scanning
Regular updates
1️⃣3️⃣ Insufficient Logging & Monitoring
Lack of audit trails
No intrusion detection
Controls

Centralized logging
SIEM integration
Log tamper protection
Real-time alerts
Regular log review
1️⃣4️⃣ Web Server Misconfiguration Risks
Weak passwords
Anonymous accounts
Exposed admin panels
Improper SSL configuration
Controls

Harden server configuration
Disable directory browsing
Remove sample files
Secure remote administration
1️⃣5️⃣ Phishing & Website Defacement
Fake websites to steal credentials
Altered website content
Controls

Monitor file integrity
Database access control
WAF protection
DNS monitoring
1️⃣6️⃣ Security Testing & Assessment
🔹 Testing Types

SAST (Static Application Security Testing)
DAST (Dynamic Application Security Testing)
Requires application URL
Quick and cost-effective
Higher false positives
Penetration Testing
Vulnerability Scanning
🔹 Common Tools

Nikto
Nessus
Acunetix
WebInspect
UrlScan
DoS tools: Slowloris, SYN Flood, Hping
1️⃣7️⃣ Open-Source vs Closed Source Security
Open Source

Source code available
Community review
Transparency
Quality depends on project maturity
Closed Source

Proprietary
No source access
Security through vendor QA
Conclusion:
Security depends on development practices, project size, maintenance quality, and secure design — not whether software is open or closed source.

1️⃣8️⃣ Open-Source Web Server Architecture
LAMP Stack







Linux (OS)
Apache (Web server)
MySQL (Database)
PHP (Application layer)
IIS (Windows-Based)

IIS on Windows Server
Integrated with NTFS & Active Directory
ISAPI filters
1️⃣9️⃣ General Security Controls Checklist
Patch management process
Secure configuration baseline
Least privilege everywhere
Encryption in transit and at rest
Input validation & output encoding
Secure session management
WAF deployment
IDS/IPS monitoring
Central logging & SIEM
Backup & disaster recovery plan
Incident response plan
Physical security of servers
Secure SDLC integration
✅ Final Summary

Web servers and web applications face risks from:

Injection attacks
Broken authentication
Access control failures
Cryptographic weaknesses
Misconfigurations
Network attacks
Application logic flaws
A layered defense-in-depth approach combining secure coding, hardened infrastructure, encryption, monitoring, patching, and continuous testing is essential to protect web systems and sensitive data.