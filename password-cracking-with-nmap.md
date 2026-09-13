# Password Cracking with Nmap Scripting Engine (NSE)

> **Disclaimer:** Perform password auditing and brute-force testing only on systems you own or have explicit authorization to assess.

## Overview

The **Nmap Scripting Engine (NSE)** extends Nmap's capabilities through scripts written in **Lua**. NSE enables security professionals to automate network discovery, service enumeration, vulnerability detection, authentication testing, and authorized password auditing.

NSE consists of:

- **Lua Interpreter** – Executes NSE scripts.
- **NSE Libraries** – Provide APIs that integrate Lua with Nmap networking functions.
- **Script Database** – Hundreds of built-in scripts covering various security tasks.

---

# NSE Script Categories

NSE scripts are organized into several categories:

| Category | Description |
|----------|-------------|
| `auth` | Authentication-related testing |
| `broadcast` | Network broadcast discovery |
| `brute` | Password brute-force and credential auditing |
| `default` | Safe scripts executed during default scans |
| `discovery` | Host and service discovery |
| `dos` | Denial-of-Service testing |
| `exploit` | Exploitation scripts |
| `external` | Integrates with external services |
| `fuzzer` | Protocol fuzzing |
| `intrusive` | Potentially disruptive security tests |
| `malware` | Malware detection |
| `safe` | Low-impact security checks |
| `version` | Service version detection |
| `vuln` | Vulnerability detection |

---

# Listing Available Brute-Force Scripts

Locate installed brute-force NSE scripts:

```bash
locate *.nse | grep brute
```

Or use:

```bash
ls /usr/share/nmap/scripts/*brute*
```

---

# Password Auditing Using NSE

Nmap includes multiple scripts for testing authentication strength on supported services.

## FTP Password Audit

Example:

```bash
nmap -p21 \
--script ftp-brute \
--script-args userdb=users.txt,passdb=pass.txt \
192.168.1.150
```

### Required Files

- `users.txt` — Username wordlist
- `pass.txt` — Password wordlist

---

## SSH Password Audit

Example:

```bash
nmap -p22 \
--script ssh-brute \
--script-args userdb=users.txt,passdb=pass.txt \
192.168.1.150
```

---

# Common Password Attack Techniques

Password attacks are used during **authorized security assessments** to evaluate authentication strength and identify weak credentials.

| Technique | Description |
|-----------|-------------|
| Dictionary Attack | Attempts passwords from a predefined wordlist. |
| Brute-Force Attack | Tries every possible password combination. |
| Rule-Based Attack | Modifies dictionary words using predefined transformation rules. |
| Password Guessing | Uses predictable passwords based on user information or common patterns. |
| Kerberos Password Attacks | Targets Kerberos authentication in Active Directory environments (authorized testing only). |
| Internal Monologue Attack | Uses Windows authentication mechanisms to capture reusable credentials in specific environments. |

---

# Best Practices

- Obtain written authorization before performing password audits.
- Use rate limiting to avoid service disruption.
- Test only approved hosts and services.
- Use strong password policies and multi-factor authentication (MFA).
- Monitor authentication logs during testing.
- Document findings and recommend remediation for weak credentials.

---

# Related NSE Categories

- Authentication Testing
- Service Enumeration
- Vulnerability Assessment
- Network Discovery
- Security Auditing
- Credential Auditing

---

# References

- Nmap Scripting Engine (NSE)
- Nmap Script Documentation
- Nmap Reference Guide
