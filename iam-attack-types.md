# Types of Cyber Attacks on Identity and Access Management (IAM) Infrastructure

## Overview

Identity and Access Management (IAM) systems are primary targets for cyber attackers because they protect user identities, authentication mechanisms, and privileged access. Compromising IAM infrastructure often provides attackers with unauthorized access to enterprise resources.

---

# Password-Based Attacks

Password attacks remain one of the most common techniques used to compromise user accounts.

## 1. Brute Force Attack

A brute-force attack is a trial-and-error method where an attacker repeatedly attempts different password combinations until the correct credentials are discovered.

### Characteristics

- Tries every possible password combination
- Can target a single account or multiple accounts
- May use automated tools
- Success depends on password complexity

### Common Tools

- Hydra
- Medusa
- Ncrack

### Countermeasures

- Enforce strong password policies
- Enable Multi-Factor Authentication (MFA)
- Implement account lockout policies
- Limit login attempts
- Monitor authentication logs
- Detect anomalous login behavior

---

## 2. Password Spraying Attack

Password spraying attempts a small number of commonly used passwords against many user accounts.

Unlike brute force attacks, password spraying avoids account lockouts by trying one password across multiple users.

### Examples

```
Password123
Welcome@123
Summer2025
Company@123
```

### Countermeasures

- Ban weak passwords
- Implement Azure AD Password Protection
- Enable MFA
- Monitor failed authentication events
- Configure smart lockout policies

---

## 3. Dictionary Attack

A dictionary attack uses a predefined list of commonly used passwords or words.

The attacker hashes dictionary words (or compares directly) until a matching password is found.

### Common Password Sources

- Public password leaks
- Common password dictionaries
- Organization-specific wordlists
- Customized employee information

### Countermeasures

- Use long passphrases
- Prevent common passwords
- Use salted password hashing
- Require MFA

---

## 4. Password Database Theft

Attackers steal password databases from compromised systems.

The stolen password hashes are then cracked offline using specialized tools.

### Common Techniques

- Hash cracking
- Rainbow tables
- GPU acceleration
- Dictionary attacks
- Brute-force attacks

---

## 5. Credential Stuffing

Credential stuffing uses usernames and passwords stolen from previous breaches.

Attackers automatically test these credentials against multiple services because users frequently reuse passwords.

### Countermeasures

- MFA
- Password uniqueness
- Compromised password detection
- Risk-based authentication

---

## 6. Password Sniffing

Passwords are captured while transmitted across a network.

### Methods

- Packet sniffing
- Man-in-the-Middle (MITM)
- Rogue Wi-Fi access points

### Countermeasures

- HTTPS
- TLS
- VPN
- Secure authentication protocols

---

## 7. Password Guessing

Attackers manually or automatically guess passwords based on publicly available information.

Examples include:

- Birth dates
- Family names
- Company names
- Pet names
- Sports teams

---

# Online Password Attacks

Online attacks attempt authentication directly against a live system.

Examples include:

- Brute force attacks
- Password spraying
- Credential stuffing
- Password guessing

---

# Password and Key Cracking Activities

Attackers often perform the following activities after obtaining credentials or password hashes:

- Password hash cracking
- Cryptographic key cracking
- Rainbow table generation
- CAPTCHA solving
- Exploiting existing vulnerabilities
- Establishing botnet Command and Control (C2)
- Hosting malicious payloads
- Launching attacks from compromised infrastructure

---

# Identity Theft

Identity theft involves stealing another person's personal information to commit fraud.

## Common Types of Identity Theft

- Credit card fraud
- Bank fraud
- Loan or lease fraud
- Employment fraud
- Tax-related fraud
- Government benefits fraud
- Identity document fraud
- Mobile phone or utility fraud

---

# Preventing Identity Theft

Organizations and users should follow security best practices to reduce identity theft risks.

## Best Practices

- Use strong, unique passwords
- Enable Multi-Factor Authentication (MFA)
- Never reuse passwords
- Avoid oversharing personal information on social media
- Shop only from trusted websites
- Keep browsers updated
- Install reputable anti-malware and anti-spyware software
- Keep operating systems and applications updated
- Protect sensitive personal information (e.g., Social Security Number, Aadhaar Number, PAN)
- Regularly monitor financial accounts
- Be cautious of phishing emails and SMS messages

---

# Common Password Attack Tools

The following tools are commonly used during penetration testing and password auditing.

| Tool | Purpose |
|-------|---------|
| Hydra | Parallelized network login cracker supporting numerous protocols |
| Medusa | Fast network login brute-force tool |
| CeWL | Generates custom password wordlists by crawling websites |
| Crunch | Creates custom password wordlists |
| CUPP | Common User Passwords Profiler for generating targeted wordlists |
| Ncrack | High-speed network authentication cracking tool |
| Hashcat | Advanced GPU-based password recovery tool |
| John the Ripper | Password hash cracking framework |

> **Note:** These tools should only be used in authorized penetration testing, security assessments, and cybersecurity training environments.

---

# Password Attack Lifecycle

```text
Information Gathering
        │
        ▼
User Enumeration
        │
        ▼
Password Wordlist Creation
        │
        ▼
Credential Attack
        │
        ├── Brute Force
        ├── Dictionary Attack
        ├── Password Spraying
        ├── Credential Stuffing
        └── Password Guessing
        │
        ▼
Successful Authentication
        │
        ▼
Privilege Escalation
        │
        ▼
Persistence
        │
        ▼
Lateral Movement
```

---

# Defensive Recommendations

- Enforce strong password policies
- Implement passwordless authentication where possible
- Enable Multi-Factor Authentication (MFA)
- Deploy Privileged Identity Management (PIM)
- Use Conditional Access policies
- Enable Smart Lockout
- Monitor authentication logs with SIEM
- Detect impossible travel and anomalous logins
- Use password breach detection
- Implement Zero Trust security principles
- Regularly rotate privileged credentials
- Conduct user security awareness training

---

# References

- Hydra
  - https://github.com/vanhauser-thc/thc-hydra
  - https://en.wikipedia.org/wiki/Hydra_(software)

- OWASP Authentication Cheat Sheet
  - https://cheatsheetseries.owasp.org/

- MITRE ATT&CK
  - https://attack.mitre.org/

- NIST Digital Identity Guidelines (SP 800-63)
  - https://pages.nist.gov/800-63-3/
