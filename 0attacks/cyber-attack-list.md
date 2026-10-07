# Top 50 Cybersecurity Attacks

> A comprehensive reference guide to common, emerging, and technically significant cyberattack techniques. This document is intended for cybersecurity awareness, defensive security engineering, threat modeling, security operations, vulnerability management, penetration testing, and incident response.
>
> **Note:** The items below represent attack types, techniques, and threat categories. Some are broad categories rather than individual exploits, and several techniques can overlap.

## Table of Contents

* [1. Phishing](#1-phishing)
* [2. Denial of Service (DoS)](#2-denial-of-service-dos)
* [3. Distributed Denial of Service (DDoS)](#3-distributed-denial-of-service-ddos)
* [4. Man-in-the-Middle (MitM)](#4-man-in-the-middle-mitm)
* [5. SQL Injection](#5-sql-injection)
* [6. Cross-Site Scripting (XSS)](#6-cross-site-scripting-xss)
* [7. Cross-Site Request Forgery (CSRF)](#7-cross-site-request-forgery-csrf)
* [8. Brute-Force Attack](#8-brute-force-attack)
* [9. Social Engineering](#9-social-engineering)
* [10. Ransomware](#10-ransomware)
* [11. Malware](#11-malware)
* [12. Zero-Day Exploitation](#12-zero-day-exploitation)
* [13. Buffer Overflow](#13-buffer-overflow)
* [14. Eavesdropping](#14-eavesdropping)
* [15. Pharming](#15-pharming)
* [16. Clickjacking](#16-clickjacking)
* [17. Password Cracking](#17-password-cracking)
* [18. Keylogging](#18-keylogging)
* [19. Malvertising](#19-malvertising)
* [20. DNS Spoofing](#20-dns-spoofing)
* [21. Session Hijacking](#21-session-hijacking)
* [22. Wireless Sniffing](#22-wireless-sniffing)
* [23. Insider Threat](#23-insider-threat)
* [24. Watering Hole Attack](#24-watering-hole-attack)
* [25. Advanced Persistent Threat (APT)](#25-advanced-persistent-threat-apt)
* [26. File Inclusion Exploitation](#26-file-inclusion-exploitation)
* [27. Click Fraud](#27-click-fraud)
* [28. DNS Tunneling](#28-dns-tunneling)
* [29. Smishing](#29-smishing)
* [30. Vishing](#30-vishing)
* [31. Cryptojacking](#31-cryptojacking)
* [32. Trojan Horse](#32-trojan-horse)
* [33. Keystroke Injection](#33-keystroke-injection)
* [34. Logic Bomb](#34-logic-bomb)
* [35. Fileless Malware](#35-fileless-malware)
* [36. DNS Amplification](#36-dns-amplification)
* [37. Password Spraying](#37-password-spraying)
* [38. Session Replay](#38-session-replay)
* [39. USB-Based Attacks](#39-usb-based-attacks)
* [40. Reverse Engineering](#40-reverse-engineering)
* [41. DNS Hijacking](#41-dns-hijacking)
* [42. IoT Exploitation](#42-iot-exploitation)
* [43. Wireless/Bluetooth Eavesdropping](#43-wirelessbluetooth-eavesdropping)
* [44. Insider Data Theft](#44-insider-data-theft)
* [45. Supply Chain Attacks](#45-supply-chain-attacks)
* [46. DNSSEC Attacks](#46-dnssec-attacks)
* [47. Side-Channel Attacks](#47-side-channel-attacks)
* [48. Physical Attacks](#48-physical-attacks)
* [49. Voice Assistant Exploitation](#49-voice-assistant-exploitation)
* [50. AI-Based Attacks](#50-ai-based-attacks)
* [Attack Lifecycle and Defensive Controls](#attack-lifecycle-and-defensive-controls)
* [Common Security Controls](#common-security-controls)
* [Detection and Response Considerations](#detection-and-response-considerations)

---

## 1. Phishing

**Phishing** is a social-engineering attack in which an attacker impersonates a trusted person, organization, service, or website to trick victims into disclosing sensitive information or performing an unsafe action.

### Common objectives

* Steal usernames and passwords.
* Capture MFA codes or session information.
* Deliver malware.
* Redirect users to fraudulent websites.
* Initiate unauthorized financial transactions.
* Obtain access to corporate systems.

### Common variants

* Email phishing.
* Spear phishing.
* Whaling.
* Clone phishing.
* Business Email Compromise (BEC).
* Credential phishing.
* QR-code phishing (quishing).

### Defensive controls

* Phishing-resistant MFA.
* Secure Email Gateway.
* URL and attachment scanning.
* DMARC, DKIM, and SPF.
* Security awareness training.
* Conditional Access.
* Identity Protection.
* Endpoint protection.
* User reporting mechanisms.

---

## 2. Denial of Service (DoS)

A **Denial-of-Service (DoS)** attack attempts to make a system, application, network, or service unavailable to legitimate users by exhausting resources or exploiting service weaknesses.

### Potential targets

* CPU.
* Memory.
* Network bandwidth.
* Connection tables.
* Application threads.
* Database resources.

### Defensive controls

* Rate limiting.
* Network segmentation.
* Firewalls.
* DDoS protection services.
* Load balancing.
* Traffic filtering.
* Capacity planning.
* Application-level throttling.

---

## 3. Distributed Denial of Service (DDoS)

A **Distributed Denial-of-Service (DDoS)** attack is a DoS attack originating from multiple systems or locations simultaneously.

Compromised systems, botnets, cloud infrastructure, or abused third-party services may be used to generate traffic.

### Common categories

* Volumetric attacks.
* Protocol attacks.
* Application-layer attacks.
* Reflection attacks.
* Amplification attacks.

### Defensive controls

* DDoS protection.
* Web Application Firewall (WAF).
* Rate limiting.
* CDN-based traffic absorption.
* Network traffic analysis.
* Anycast distribution.
* Automated mitigation.

---

## 4. Man-in-the-Middle (MitM)

A **Man-in-the-Middle (MitM)** attack occurs when an attacker positions themselves between communicating parties to intercept, observe, relay, or potentially modify communications.

### Potential attack scenarios

* Rogue Wi-Fi access points.
* DNS manipulation.
* TLS downgrade attempts.
* Compromised network infrastructure.
* Session interception.
* Proxy-based interception.

### Defensive controls

* TLS/HTTPS.
* Certificate validation.
* Mutual TLS where appropriate.
* VPNs.
* Secure Wi-Fi.
* Network segmentation.
* Strong authentication.
* HSTS.

---

## 5. SQL Injection

**SQL Injection (SQLi)** occurs when untrusted input is improperly incorporated into database queries, allowing an attacker to manipulate database operations.

### Potential impact

* Unauthorized data access.
* Data modification.
* Data deletion.
* Authentication bypass.
* Database enumeration.
* Potential server compromise in certain configurations.

### Defensive controls

* Parameterized queries.
* Prepared statements.
* Secure ORM usage.
* Input validation.
* Least-privilege database accounts.
* WAF rules.
* Secure coding practices.
* Database activity monitoring.

---

## 6. Cross-Site Scripting (XSS)

**Cross-Site Scripting (XSS)** occurs when an application allows attacker-controlled content to execute as script within a victim's browser.

### Common types

* Stored XSS.
* Reflected XSS.
* DOM-based XSS.

### Potential impact

* Session compromise.
* Credential theft.
* Unauthorized browser actions.
* Phishing.
* Website content manipulation.

### Defensive controls

* Context-aware output encoding.
* Input validation.
* Content Security Policy (CSP).
* Secure cookie attributes.
* Framework security controls.
* HTML sanitization.

---

## 7. Cross-Site Request Forgery (CSRF)

**Cross-Site Request Forgery (CSRF)** tricks an authenticated user's browser into sending an unintended request to a vulnerable application.

### Potential impact

* Unauthorized transactions.
* Account changes.
* Password changes.
* Data modification.
* Administrative actions.

### Defensive controls

* Anti-CSRF tokens.
* SameSite cookies.
* Origin/Referer validation.
* Re-authentication for sensitive operations.
* Appropriate CORS configuration.

---

## 8. Brute-Force Attack

A **brute-force attack** systematically attempts many possible credentials or secrets until a valid combination is discovered.

### Examples

* Username/password guessing.
* PIN guessing.
* Encryption-key guessing.
* API-key guessing.

### Defensive controls

* MFA.
* Account lockout or progressive delays.
* Rate limiting.
* Strong password policies.
* Passwordless authentication.
* Risk-based authentication.
* Monitoring for repeated authentication failures.

---

## 9. Social Engineering

**Social engineering** exploits human behavior rather than primarily exploiting technical vulnerabilities.

### Common techniques

* Pretexting.
* Impersonation.
* Baiting.
* Tailgating.
* Scareware.
* Quid pro quo.
* Business Email Compromise.
* Help-desk manipulation.

### Defensive controls

* Security awareness training.
* Identity verification procedures.
* Phishing-resistant MFA.
* Privileged access controls.
* Strong help-desk verification processes.
* Least privilege.

---

## 10. Ransomware

**Ransomware** is malware designed to disrupt operations, commonly by encrypting data and/or systems and demanding payment.

Modern ransomware operations may also involve **data theft and extortion** before or instead of encryption.

### Potential impact

* Data unavailability.
* Business interruption.
* Data exfiltration.
* Regulatory exposure.
* Financial loss.
* Reputational damage.

### Defensive controls

* Immutable backups.
* Offline backups.
* Endpoint Detection and Response (EDR).
* Network segmentation.
* Privileged Access Management (PAM).
* MFA.
* Patch management.
* Application control.
* Backup recovery testing.

---

## 11. Malware

**Malware** is a broad category of malicious software designed to compromise systems, disrupt operations, obtain unauthorized access, or steal information.

### Common malware categories

* Viruses.
* Worms.
* Trojans.
* Spyware.
* Rootkits.
* RATs.
* Infostealers.
* Botnet malware.
* Ransomware.
* Fileless malware.

### Defensive controls

* EDR/XDR.
* Antivirus.
* Application allowlisting.
* Patch management.
* Email security.
* Network monitoring.
* Least privilege.
* Threat intelligence.

---

## 12. Zero-Day Exploitation

A **zero-day exploit** targets a previously unknown or unpatched vulnerability for which effective remediation may not yet be broadly available.

> **Important distinction:** A zero-day refers to the vulnerability/exploitation situation, not simply any newly discovered vulnerability.

### Defensive controls

* Attack surface management.
* Threat intelligence.
* Virtual patching.
* WAF.
* EDR/XDR.
* Network segmentation.
* Compensating controls.
* Rapid emergency patching.
* Continuous vulnerability management.

---

## 13. Buffer Overflow

A **buffer overflow** occurs when a program writes more data to a memory buffer than the allocated space can safely contain.

### Potential impact

* Application crashes.
* Memory corruption.
* Arbitrary code execution.
* Privilege escalation.
* System compromise.

### Defensive controls

* Secure coding.
* Memory-safe languages.
* Compiler protections.
* ASLR.
* DEP/NX.
* Stack canaries.
* Fuzz testing.
* Regular patching.

---

## 14. Eavesdropping

**Eavesdropping** involves unauthorized interception or monitoring of communications to obtain information.

It can target:

* Network traffic.
* Voice communications.
* Wireless communications.
* Unencrypted application protocols.
* Sensitive business communications.

### Defensive controls

* Encryption in transit.
* TLS.
* VPN.
* Secure Wi-Fi.
* Network segmentation.
* Certificate validation.
* Zero Trust network principles.

---

## 15. Pharming

**Pharming** redirects users from legitimate websites to fraudulent destinations, often through manipulation of DNS resolution, hosts files, routers, or other infrastructure.

### Potential impact

* Credential theft.
* Financial fraud.
* Malware delivery.
* Data theft.

### Defensive controls

* DNS security.
* DNSSEC.
* Secure DNS resolvers.
* Endpoint protection.
* Router hardening.
* Certificate validation.
* User awareness.

---

## 16. Clickjacking

**Clickjacking** tricks users into clicking on a disguised or hidden interface element, causing unintended actions.

### Defensive controls

* `Content-Security-Policy: frame-ancestors`.
* `X-Frame-Options`.
* Secure UI design.
* SameSite cookies.
* User confirmation for sensitive actions.

---

## 17. Password Cracking

**Password cracking** involves attempting to recover passwords or password-derived secrets.

### Common techniques

* Brute force.
* Dictionary attacks.
* Password spraying.
* Credential stuffing.
* Offline hash cracking.
* Rainbow tables.

### Defensive controls

* Strong password hashing.
* Salted password storage.
* MFA.
* Passwordless authentication.
* Breached-password detection.
* Rate limiting.
* Credential monitoring.

---

## 18. Keylogging

**Keylogging** records keyboard input to capture sensitive information such as passwords, messages, or financial information.

Keyloggers can be:

* Software-based.
* Hardware-based.
* Firmware-based.

### Defensive controls

* EDR/XDR.
* Application control.
* Endpoint hardening.
* Privilege management.
* Hardware security controls.
* Behavioral monitoring.

---

## 19. Malvertising

**Malvertising** involves distributing malicious content or redirecting users through compromised or fraudulent online advertising.

### Potential impact

* Malware delivery.
* Browser exploitation.
* Credential phishing.
* Malicious redirects.

### Defensive controls

* Secure web gateways.
* Browser security.
* Endpoint protection.
* DNS filtering.
* Ad and script controls.
* Patch management.

---

## 20. DNS Spoofing

**DNS spoofing** involves providing false DNS information to redirect users or applications to an unintended destination.

### Potential impact

* Credential theft.
* Traffic redirection.
* Malware distribution.
* Traffic interception.

### Defensive controls

* DNSSEC.
* Secure recursive resolvers.
* DNS monitoring.
* Network segmentation.
* Protected DNS infrastructure.

---

## 21. Session Hijacking

**Session hijacking** occurs when an attacker obtains or abuses a valid session identifier to impersonate an authenticated user.

### Common causes

* Session-token theft.
* XSS.
* Insecure cookies.
* Unencrypted communications.
* Malware.
* Session fixation.

### Defensive controls

* HTTPS.
* Secure and HttpOnly cookies.
* SameSite cookies.
* Session rotation.
* Short session lifetimes.
* Re-authentication for sensitive actions.
* Token protection.

---

## 22. Wireless Sniffing

**Wireless sniffing** involves capturing and analyzing wireless network traffic.

Potentially exposed information depends on the wireless security protocol and application-layer encryption.

### Defensive controls

* WPA3 where supported.
* Strong WPA2 configurations.
* Enterprise Wi-Fi authentication.
* TLS.
* Network segmentation.
* Rogue AP detection.
* Wireless intrusion detection/prevention.

---

## 23. Insider Threat

An **insider threat** occurs when an employee, contractor, partner, or other trusted individual misuses legitimate access or becomes compromised.

### Types

* Malicious insider.
* Negligent insider.
* Compromised insider account.

### Defensive controls

* Least privilege.
* PAM.
* UEBA.
* DLP.
* Access reviews.
* Segregation of duties.
* Monitoring and auditing.
* Strong offboarding procedures.

---

## 24. Watering Hole Attack

A **watering hole attack** compromises websites commonly visited by a specific target group.

The attacker uses the trusted website as a delivery mechanism for malicious content or exploitation.

### Defensive controls

* Web filtering.
* Browser isolation.
* Endpoint protection.
* Vulnerability management.
* Threat intelligence.
* Application and browser patching.

---

## 25. Advanced Persistent Threat (APT)

An **Advanced Persistent Threat (APT)** is a prolonged, targeted intrusion in which an adversary maintains access to a target environment while pursuing strategic objectives.

APT campaigns commonly involve multiple stages:

1. Reconnaissance.
2. Initial access.
3. Execution.
4. Persistence.
5. Privilege escalation.
6. Defense evasion.
7. Credential access.
8. Discovery.
9. Lateral movement.
10. Collection.
11. Command and control.
12. Exfiltration.
13. Impact.

### Defensive controls

* EDR/XDR.
* SIEM.
* Threat intelligence.
* Network detection.
* Identity security.
* Segmentation.
* Continuous monitoring.
* Threat hunting.

---

## 26. File Inclusion Exploitation

**File inclusion vulnerabilities** occur when an application improperly allows user-controlled input to determine files that are loaded or processed.

### Common categories

* Local File Inclusion (LFI).
* Remote File Inclusion (RFI).

### Potential impact

* Sensitive-file disclosure.
* Code execution in vulnerable configurations.
* Application compromise.

### Defensive controls

* Input allowlisting.
* Secure file handling.
* Path canonicalization.
* Least privilege.
* Application security testing.
* WAF controls.

---

## 27. Click Fraud

**Click fraud** generates artificial or unauthorized interactions with online advertisements to manipulate advertising metrics or generate fraudulent revenue.

### Sources may include

* Bots.
* Malware.
* Fraudulent users.
* Automated systems.

### Defensive controls

* Bot detection.
* Traffic analytics.
* Fraud detection.
* Rate limiting.
* Behavioral analysis.
* Advertising-platform controls.

---

## 28. DNS Tunneling

**DNS tunneling** abuses DNS queries and responses to transport data or establish a covert communication channel.

It may be used for:

* Command and control.
* Data exfiltration.
* Bypassing poorly configured network controls.

### Defensive controls

* DNS logging.
* DNS traffic analytics.
* Domain reputation monitoring.
* Query-length and frequency analysis.
* DNS filtering.
* EDR/XDR.
* Restricting unauthorized DNS resolvers.

---

## 29. Smishing

**Smishing** is phishing conducted through SMS or messaging platforms.

Attackers may attempt to:

* Steal credentials.
* Deliver malicious links.
* Install malware.
* Conduct financial fraud.
* Impersonate banks, delivery companies, or organizations.

### Defensive controls

* Mobile security.
* URL filtering.
* Phishing-resistant MFA.
* User awareness.
* Message filtering.
* Transaction verification.

---

## 30. Vishing

**Vishing** is phishing conducted through voice calls or voice communication platforms.

Attackers commonly impersonate:

* Banks.
* IT support.
* Government organizations.
* Executives.
* Service providers.

### Defensive controls

* Caller verification.
* Strong identity-verification procedures.
* MFA.
* Help-desk controls.
* Security awareness.
* Out-of-band verification.

---

## 31. Cryptojacking

**Cryptojacking** is the unauthorized use of computing resources to mine cryptocurrency.

It can affect:

* End-user devices.
* Servers.
* Containers.
* Cloud workloads.
* Kubernetes environments.

### Defensive controls

* Resource monitoring.
* EDR/XDR.
* Cloud workload protection.
* Container security.
* Network monitoring.
* CPU utilization anomaly detection.
* Least privilege.

---

## 32. Trojan Horse

A **Trojan horse** is malicious software disguised as legitimate software, a document, installer, application, or utility.

Unlike a worm, a Trojan typically relies on the victim or another mechanism to execute or install it rather than automatically self-propagating.

### Defensive controls

* Application allowlisting.
* EDR/XDR.
* Code signing validation.
* Malware scanning.
* Email security.
* Software supply-chain controls.

---

## 33. Keystroke Injection

**Keystroke injection** involves injecting keyboard input into a target device or application to cause unintended commands or actions.

This can involve:

* Specialized USB devices.
* Malicious peripherals.
* Compromised firmware.
* Automated input mechanisms.

### Defensive controls

* USB device controls.
* Endpoint hardening.
* Device control policies.
* Physical security.
* Application restrictions.
* EDR monitoring.

---

## 34. Logic Bomb

A **logic bomb** is malicious code that remains dormant until specific conditions or events occur.

Possible triggers include:

* A specific date.
* A user account.
* A system state.
* A particular event.
* Removal of an employee's access.

### Defensive controls

* Code review.
* Change management.
* Separation of duties.
* Privileged access monitoring.
* Source-code integrity monitoring.
* File integrity monitoring.

---

## 35. Fileless Malware

**Fileless malware** operates primarily through legitimate system processes, memory, scripts, or other mechanisms rather than relying exclusively on traditional executable files stored on disk.

### Common characteristics

* Memory-resident execution.
* Abuse of legitimate administrative tools.
* Script-based execution.
* Reduced traditional file-based indicators.

### Defensive controls

* EDR/XDR.
* PowerShell and script logging.
* Application control.
* AMSI.
* Behavioral detection.
* Attack Surface Reduction (ASR) rules.
* Privileged access management.

---

## 36. DNS Amplification

**DNS amplification** is a reflection-based DDoS technique that abuses publicly accessible or improperly configured DNS services to generate traffic toward a victim.

The attacker typically abuses the difference between relatively small requests and larger responses.

### Defensive controls

* Prevent open DNS resolvers.
* Response Rate Limiting (RRL).
* DDoS protection.
* Source-address validation.
* Network filtering.
* DNS infrastructure hardening.

---

## 37. Password Spraying

**Password spraying** attempts a small number of commonly used passwords against many accounts rather than repeatedly attacking a single account.

This can help attackers avoid triggering traditional account lockout controls.

### Defensive controls

* MFA.
* Passwordless authentication.
* Smart lockout.
* Conditional Access.
* Risk-based authentication.
* Monitoring authentication patterns.
* Banned-password lists.

---

## 38. Session Replay

**Session replay** involves capturing and reusing valid authentication material or application interactions.

In web environments, this may involve replaying:

* Session tokens.
* Authentication artifacts.
* API tokens.
* Transaction requests.

### Defensive controls

* Short-lived tokens.
* Token binding where supported.
* Nonces.
* Replay detection.
* TLS.
* Session rotation.
* Transaction signing for high-risk operations.

---

## 39. USB-Based Attacks

**USB-based attacks** exploit removable media, USB devices, firmware, or human behavior to introduce malicious code or gain unauthorized access.

### Examples

* Malicious USB storage.
* BadUSB-style device attacks.
* Malware-infected removable media.
* Unauthorized data copying.
* HID-based attacks.

### Defensive controls

* USB device control.
* Endpoint protection.
* Removable-media policies.
* Device allowlisting.
* Disable unauthorized USB classes where practical.
* User awareness.
* Physical security.

---

## 40. Reverse Engineering

**Reverse engineering** is the analysis of software, firmware, binaries, or systems to understand their behavior, architecture, and implementation.

> Reverse engineering itself is not inherently an attack. It is a legitimate security research technique that can also be used by attackers to identify vulnerabilities, bypass protections, or analyze malware.

### Security uses

* Malware analysis.
* Vulnerability research.
* Binary analysis.
* Firmware analysis.
* Security testing.

### Defensive considerations

* Code obfuscation where appropriate.
* Secure software design.
* Secrets management.
* Code signing.
* Anti-tampering controls.
* Protection of proprietary algorithms and keys.

---

## 41. DNS Hijacking

**DNS hijacking** involves unauthorized modification or compromise of DNS configurations or infrastructure to redirect users or applications.

Potential targets include:

* DNS servers.
* Domain registrar accounts.
* Router configurations.
* DNS management platforms.
* Endpoint DNS settings.

### Defensive controls

* MFA for registrar accounts.
* DNSSEC.
* Registrar locks.
* DNS change monitoring.
* Privileged access controls.
* Configuration monitoring.

---

## 42. IoT Exploitation

**IoT exploitation** targets vulnerabilities in Internet of Things devices such as cameras, sensors, smart appliances, medical devices, industrial systems, and embedded devices.

### Common weaknesses

* Default credentials.
* Unpatched firmware.
* Exposed management interfaces.
* Weak encryption.
* Insecure APIs.
* Poor network segmentation.

### Defensive controls

* Asset inventory.
* Firmware management.
* Network segmentation.
* Strong authentication.
* Device identity.
* Secure configuration.
* Vulnerability management.
* IoT/OT monitoring.

---

## 43. Wireless/Bluetooth Eavesdropping

Wireless eavesdropping involves unauthorized interception of wireless communications, including Wi-Fi and Bluetooth traffic.

### Potential risks

* Credential exposure.
* Sensitive-data interception.
* Device tracking.
* Session compromise.
* Unauthorized device interaction.

### Defensive controls

* Modern wireless encryption.
* Secure pairing.
* Disable unnecessary wireless interfaces.
* Device management.
* Network segmentation.
* Encryption at the application layer.

---

## 44. Insider Data Theft

**Insider data theft** occurs when someone with legitimate access intentionally or improperly copies, removes, transfers, or exposes sensitive information.

### Potential targets

* Customer information.
* Intellectual property.
* Source code.
* Financial information.
* Credentials.
* Business documents.

### Defensive controls

* Data Loss Prevention (DLP).
* UEBA.
* Access reviews.
* Least privilege.
* Privileged Access Management.
* File access auditing.
* Data classification.
* Insider-risk monitoring.

---

## 45. Supply Chain Attacks

**Supply chain attacks** compromise software, hardware, dependencies, service providers, build systems, or trusted third-party components to reach downstream organizations.

### Common targets

* Open-source dependencies.
* Software vendors.
* CI/CD pipelines.
* Build environments.
* Package repositories.
* Managed service providers.
* Firmware.

### Defensive controls

* Software Bill of Materials (SBOM).
* Dependency scanning.
* Code signing.
* Secure CI/CD.
* Build provenance.
* Vendor risk management.
* Supply-chain security.
* Artifact integrity verification.

---

## 46. DNSSEC Attacks

**DNSSEC attacks** target weaknesses in DNSSEC deployment, configuration, key management, validation, or implementation.

> DNSSEC is specifically designed to provide authenticity and integrity for DNS data. Properly implemented DNSSEC significantly reduces several DNS spoofing risks, but incorrect configuration or weaknesses in supporting infrastructure can still create security problems.

### Defensive controls

* Correct DNSSEC deployment.
* Automated key rotation.
* Monitoring DNSSEC validation.
* Secure key management.
* Configuration auditing.
* Registrar security.

---

## 47. Side-Channel Attacks

**Side-channel attacks** infer sensitive information from unintended physical or operational characteristics of a system.

### Potential side channels

* Timing.
* Power consumption.
* Electromagnetic emissions.
* CPU/cache behavior.
* Memory access patterns.
* Acoustic emissions.

### Defensive controls

* Constant-time cryptographic implementations.
* Hardware security mechanisms.
* Secure cryptographic libraries.
* Isolation.
* Side-channel-resistant algorithms.
* Specialized testing.

---

## 48. Physical Attacks

**Physical attacks** involve unauthorized physical access, manipulation, theft, or destruction of computing equipment and infrastructure.

### Examples

* Device theft.
* Hardware tampering.
* Rogue USB devices.
* Unauthorized console access.
* Data-center intrusion.
* Hardware implant attacks.

### Defensive controls

* Physical access control.
* CCTV.
* Security guards.
* Secure racks.
* Tamper detection.
* Device encryption.
* Secure boot.
* Asset tracking.
* Environmental controls.

---

## 49. Voice Assistant Exploitation

**Voice assistant exploitation** targets vulnerabilities in voice-controlled devices and applications.

### Potential risks

* Unauthorized commands.
* Voice impersonation.
* Sensitive-information disclosure.
* Malicious integrations.
* Unauthorized purchases or actions.

### Defensive controls

* Voice authentication where appropriate.
* Device access controls.
* MFA for sensitive actions.
* Restrict third-party integrations.
* Regular firmware updates.
* Network segmentation.
* Privacy controls.

---

## 50. AI-Based Attacks

**AI-based attacks** use artificial intelligence and machine learning to improve the scale, speed, personalization, or effectiveness of cyberattacks.

### Examples

* AI-assisted phishing.
* Automated reconnaissance.
* Deepfake-enabled impersonation.
* Synthetic voice attacks.
* Automated social engineering.
* Malicious code generation.
* Adaptive malware.
* Automated vulnerability discovery.
* Evasion of security controls.
* Prompt injection against AI systems.
* Indirect prompt injection.
* Data poisoning.
* AI model abuse.

### AI-specific attack categories

For AI-enabled applications, security teams should additionally consider:

* Prompt injection.
* Jailbreaking.
* Sensitive information disclosure.
* Model extraction.
* Data poisoning.
* Excessive agency.
* Insecure tool use.
* Insecure plugin/API integrations.
* Retrieval-Augmented Generation (RAG) poisoning.
* Agentic-system abuse.

### Defensive controls

* AI security testing.
* Input/output filtering.
* Least-privilege tool access.
* Human approval for high-impact actions.
* Model and application monitoring.
* Data validation.
* Secure AI supply chain.
* Identity-aware AI access controls.
* Prompt and context isolation.
* Continuous red teaming.

---

# Attack Lifecycle and Defensive Controls

The 50 attack categories above can be mapped to a broader attack lifecycle.

| Attack Stage         | Typical Techniques                       | Key Defensive Controls                                  |
| -------------------- | ---------------------------------------- | ------------------------------------------------------- |
| Reconnaissance       | OSINT, scanning, enumeration             | Attack Surface Management, threat intelligence          |
| Initial Access       | Phishing, exploitation, exposed services | MFA, WAF, EDR, vulnerability management                 |
| Execution            | Malware, scripts, command execution      | EDR, application control, ASR                           |
| Persistence          | Trojans, logic bombs, account abuse      | PAM, identity monitoring, persistence detection         |
| Privilege Escalation | Exploitation, credential abuse           | Least privilege, PAM, patching                          |
| Defense Evasion      | Fileless malware, obfuscation            | EDR/XDR, behavioral analytics                           |
| Credential Access    | Keylogging, password attacks             | MFA, passwordless authentication, credential protection |
| Discovery            | Network/system enumeration               | Network monitoring, segmentation                        |
| Lateral Movement     | Credential reuse, remote services        | PAM, segmentation, identity analytics                   |
| Collection           | Data theft, session capture              | DLP, data classification, access monitoring             |
| Command and Control  | DNS tunneling, covert channels           | Network analytics, DNS monitoring                       |
| Exfiltration         | DNS tunneling, cloud storage abuse       | DLP, egress filtering, UEBA                             |
| Impact               | Ransomware, DoS/DDoS                     | Backups, DDoS protection, resilience planning           |

---

# Common Security Controls

A mature cybersecurity program should implement **defense in depth** rather than relying on a single security control.

## Identity and Access Management

* Multi-factor authentication (MFA).
* Phishing-resistant MFA.
* Passwordless authentication.
* Conditional Access.
* Privileged Identity Management (PIM).
* Privileged Access Management (PAM).
* Just-in-Time (JIT) access.
* Least privilege.
* Access reviews.
* Service identity management.

## Network Security

* Firewalls.
* Web Application Firewalls.
* Network segmentation.
* Microsegmentation.
* Private endpoints.
* Zero Trust architecture.
* IDS/IPS.
* DDoS protection.
* DNS security.
* Secure remote access.

## Endpoint Security

* EDR.
* XDR.
* Antivirus/anti-malware.
* Application control.
* Attack Surface Reduction.
* Device control.
* Patch management.
* Secure configuration.

## Data Security

* Data classification.
* Encryption at rest.
* Encryption in transit.
* Data Loss Prevention.
* Key management.
* Secrets management.
* Database security.
* Backup and recovery.

## Cloud Security

* Cloud Security Posture Management (CSPM).
* Cloud Workload Protection.
* Cloud Identity Security.
* Cloud Network Security.
* Cloud Detection and Response.
* Infrastructure-as-Code scanning.
* Container security.
* Kubernetes security.
* Cloud vulnerability management.

## Security Monitoring

* SIEM.
* SOAR.
* EDR/XDR.
* Threat intelligence.
* User and Entity Behavior Analytics (UEBA).
* Security analytics.
* Centralized logging.
* Threat hunting.
* Security dashboards.

---

# Detection and Response Considerations

Security teams should develop detections for behaviors associated with these attack categories rather than relying exclusively on known signatures.

### Important detection areas

* Multiple failed authentication attempts.
* Password spraying patterns.
* Impossible-travel or anomalous sign-ins.
* MFA abuse.
* Privilege escalation.
* Unusual administrative activity.
* New persistence mechanisms.
* Suspicious PowerShell or scripting activity.
* Unexpected DNS traffic.
* DNS tunneling indicators.
* Large outbound data transfers.
* Unusual cloud API activity.
* Abnormal resource consumption.
* Suspicious process trees.
* Unauthorized USB devices.
* Unexpected changes to DNS.
* Suspicious application consent.
* Unusual service-principal activity.
* Data-access anomalies.
* Ransomware-like file behavior.

---

# Cloud and Azure Security Considerations

For cloud environments, these attack categories should also be evaluated against:

* Microsoft Entra ID.
* Azure subscriptions and management groups.
* Azure Resource Manager.
* Azure Virtual Machines.
* Azure Storage.
* Azure Key Vault.
* Azure SQL.
* Azure Kubernetes Service (AKS).
* Azure Functions.
* App Services.
* Azure Container Registry.
* Azure Firewall.
* Azure Application Gateway/WAF.
* Private Endpoints.
* Network Security Groups.
* Microsoft Defender for Cloud.
* Microsoft Defender for Endpoint.
* Microsoft Sentinel.
* Microsoft Purview.
* Azure Policy.
* Microsoft Entra Conditional Access.
* Privileged Identity Management.
* Managed identities.
* Service principals.
* CI/CD pipelines.
* Infrastructure-as-Code deployments.

### Typical cloud attack paths

```text
Internet / External Threat
          |
          v
Reconnaissance
          |
          v
Initial Access
          |
          +--------------------+
          |                    |
          v                    v
Identity Compromise       Application Exploit
          |                    |
          +---------+----------+
                    |
                    v
             Privilege Escalation
                    |
                    v
             Cloud Resource Discovery
                    |
                    v
              Lateral Movement
                    |
                    v
          Data Access / Collection
                    |
                    v
             Exfiltration / Impact
```

---

# Security Framework Mapping

The attacks in this document can be mapped to established cybersecurity frameworks and standards, including:

* **MITRE ATT&CK** — adversary tactics and techniques.
* **NIST Cybersecurity Framework (CSF)** — Identify, Protect, Detect, Respond, Recover.
* **CIS Controls** — prioritized security safeguards.
* **OWASP Top 10** — common web application security risks.
* **OWASP API Security Top 10** — API-specific risks.
* **OWASP LLM/GenAI security guidance** — AI application risks.
* **ISO/IEC 27001** — information security management controls.
* **NIST SP 800-53** — security and privacy controls.
* **NIST SP 800-61** — incident response.
* **CIS Benchmarks** — secure configuration guidance.

---

# Recommended Security Assessment Approach

Organizations can use the following process to assess exposure to these attack categories:

1. **Identify assets**

   * Applications.
   * Users.
   * Endpoints.
   * Networks.
   * Cloud resources.
   * Data.
   * APIs.
   * Identities.

2. **Identify attack surfaces**

   * Internet-facing services.
   * Public IPs.
   * APIs.
   * Identity systems.
   * SaaS applications.
   * Third-party integrations.
   * Remote access services.

3. **Assess vulnerabilities**

   * Configuration weaknesses.
   * Missing patches.
   * Weak authentication.
   * Excessive privileges.
   * Application vulnerabilities.
   * Exposed secrets.

4. **Assess attack paths**

   * Initial access.
   * Privilege escalation.
   * Lateral movement.
   * Data access.
   * Exfiltration.
   * Impact.

5. **Validate security controls**

   * Preventive controls.
   * Detective controls.
   * Corrective controls.
   * Recovery controls.

6. **Prioritize risks**

   * Exploitability.
   * Business impact.
   * Asset criticality.
   * Exposure.
   * Existing compensating controls.
   * Threat intelligence.
   * Likelihood.

7. **Remediate**

   * Patch.
   * Harden.
   * Restrict access.
   * Segment networks.
   * Improve identity controls.
   * Deploy monitoring.
   * Remove unnecessary exposure.

8. **Validate**

   * Security testing.
   * Penetration testing.
   * Red teaming.
   * Threat hunting.
   * Configuration reviews.

9. **Monitor continuously**

   * SIEM.
   * EDR/XDR.
   * CSPM.
   * Threat intelligence.
   * Vulnerability management.
   * UEBA.
   * DLP.

---

# Summary

The 50 attack categories covered in this document represent a broad spectrum of cybersecurity threats, ranging from **social engineering and credential attacks** to **application vulnerabilities, network attacks, malware, cloud attacks, supply-chain attacks, physical attacks, and AI-enabled threats**.

A robust security architecture should not attempt to address these threats individually in isolation. Instead, organizations should implement a **defense-in-depth and Zero Trust security model** built around:

* Strong identity security.
* Least privilege.
* Phishing-resistant MFA.
* Secure application development.
* Continuous vulnerability management.
* Network segmentation.
* Endpoint protection.
* Cloud security posture management.
* Data protection and DLP.
* Centralized logging and SIEM.
* EDR/XDR.
* Threat intelligence.
* Security automation and SOAR.
* Immutable and tested backups.
* Incident response.
* Continuous threat hunting.
* Security awareness.
* Regular security assessments and penetration testing.

The most effective approach is to combine **preventive, detective, responsive, and recovery controls** and continuously validate their effectiveness against realistic attack paths.
