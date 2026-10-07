# Password Cracking Defense & Credential Dumping

> **Disclaimer:** The following content is intended for **authorized security assessments, defensive security, incident response, and cybersecurity training only**.

---

# Password Cracking Tools

## Mobile Password Recovery and Monitoring Tools

### FlexiSPY Password Grabber

**FlexiSPY Password Grabber** is a commercial mobile monitoring application that claims to capture authentication information from supported devices. Features advertised by the vendor include:

* Capturing device unlock credentials (where supported)
* Recording passwords used in supported applications
* Monitoring activity on selected messaging and social media applications
* Collecting authentication data for authorized monitoring purposes

> **Note:** Use of monitoring software without the device owner's explicit authorization may violate privacy laws and organizational policies. Deploy such software only with proper legal authorization.

---

# Password Cracking Prevention

Organizations can significantly reduce password-related attacks by implementing strong authentication controls and security best practices.

## Password Policy

* Use strong passwords containing **8–12 or more characters**.
* Combine:

  * Uppercase letters (`A-Z`)
  * Lowercase letters (`a-z`)
  * Numbers (`0-9`)
  * Special characters (`!@#$%^&*`)
* Avoid dictionary words and common phrases.
* Never reuse previous passwords.
* Avoid predictable passwords such as:

  * Date of birth
  * Family member names
  * Pet names
  * Phone numbers
  * Company names

## Password Management

* Never share passwords with others.
* Do not store passwords in unsecured locations.
* Remove or change all default passwords immediately after installation.
* Ensure applications never store passwords in plaintext (memory or disk).
* Store passwords using strong salted password hashing algorithms (for example, **Argon2**, **bcrypt**, **scrypt**, or **PBKDF2**).

## Authentication Security

* Enable account lockout after multiple failed login attempts.
* Implement Multi-Factor Authentication (MFA) wherever possible.
* Use secure authentication protocols.
* Avoid transmitting credentials using cleartext protocols.
* Disable insecure authentication mechanisms.

## Monitoring and Auditing

* Enable security auditing for authentication events.
* Monitor authentication logs for:

  * Brute-force attacks
  * Password spraying
  * Credential stuffing
  * Suspicious login attempts
* Configure automated alerting for repeated authentication failures.

---

# Credential Dumping

## What is Credential Dumping?

Credential dumping is the process of extracting authentication material from an operating system or applications. Attackers typically attempt to obtain:

* Usernames
* Password hashes
* Plaintext passwords
* Authentication tokens
* Kerberos tickets
* Cached credentials

Compromised credentials may then be used for:

* Privilege escalation
* Lateral movement
* Unauthorized access
* Persistence
* Data theft

---

# Common Credential Access Techniques

Attackers commonly attempt to obtain credentials through:

* Credentials stored in password managers or digital vaults
* Operating system credential stores
* Forced authentication attacks
* Network credential capture (sniffing)
* Cached credentials
* Browser credential storage
* Application configuration files

---

# Windows AutoLogon

Windows AutoLogon allows a system to automatically sign in using stored credentials.

If AutoLogon is enabled, credentials may become accessible to attackers with sufficient privileges, making it important to disable the feature on sensitive systems unless it is specifically required.

**Microsoft Sysinternals AutoLogon**

[https://learn.microsoft.com/sysinternals/downloads/autologon](https://learn.microsoft.com/sysinternals/downloads/autologon)

---

# OS Credential Dumping

Attackers frequently target operating system credential stores to obtain authentication material such as:

* Password hashes
* Plaintext passwords
* Kerberos tickets
* Cached domain credentials

Stolen credentials are often used to:

* Move laterally within a network
* Escalate privileges
* Access sensitive systems
* Maintain persistence

This technique is documented in the **MITRE ATT&CK** framework as **OS Credential Dumping (T1003)**.

---

# Credential Dumping Tool

## Mimikatz

**Mimikatz** is a well-known post-exploitation security tool widely used by penetration testers, red teams, and incident responders to evaluate Windows credential protections.

Common capabilities include:

* Extracting authentication material from memory
* Working with Kerberos authentication tickets
* Token manipulation
* Security testing of Windows authentication mechanisms

> Mimikatz should only be used in environments where explicit authorization has been granted.

---

# Malware Families Known to Use Credential Dumping

Several malware families have incorporated credential dumping capabilities, including:

* Carbanak
* Axiom
* Homefry
* OnionDuke
* Empire

---

# Defensive Recommendations

* Enable Microsoft Defender Credential Guard.
* Enable Local Security Authority (LSA) Protection.
* Restrict administrative privileges.
* Disable Windows AutoLogon where unnecessary.
* Protect LSASS from unauthorized access.
* Use Endpoint Detection and Response (EDR) solutions.
* Enable Microsoft Defender for Endpoint or equivalent endpoint protection.
* Keep operating systems fully patched.
* Monitor for credential access behaviors.
* Implement least-privilege access.
* Enable Multi-Factor Authentication (MFA).
* Regularly audit privileged accounts.
* Rotate privileged credentials on a scheduled basis.

---

# References

* Microsoft Sysinternals AutoLogon
  [https://learn.microsoft.com/sysinternals/downloads/autologon](https://learn.microsoft.com/sysinternals/downloads/autologon)

* MITRE ATT&CK – OS Credential Dumping (T1003)
  [https://attack.mitre.org/techniques/T1003/](https://attack.mitre.org/techniques/T1003/)

* Microsoft Defender Credential Guard
  [https://learn.microsoft.com/windows/security/identity-protection/credential-guard/](https://learn.microsoft.com/windows/security/identity-protection/credential-guard/)
