# Password Cracking Tools

> **Disclaimer:** The following tools are commonly used for **authorized security assessments, password auditing, penetration testing, and cybersecurity training**. They should only be used on systems for which you have explicit permission.

## Password Auditing and Cracking Tools

| Tool                                      | Description                                                                                                                                                                                 |
| ----------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Aircrack-ng**                           | A suite of tools for auditing the security of Wi-Fi networks. Supports WEP/WPA/WPA2 password recovery through authorized wireless security testing.                                         |
| **Brutus**                                | A legacy password auditing tool capable of performing dictionary and brute-force login testing against various network services.                                                            |
| **Cain & Abel**                           | A Windows password recovery and auditing tool capable of recovering passwords through network sniffing, dictionary attacks, brute-force attacks, cryptanalysis, and password hash analysis. |
| **CeWL**                                  | Generates custom wordlists by crawling websites and collecting words that can be used in password auditing.                                                                                 |
| **Crunch**                                | Creates custom wordlists based on specified character sets, patterns, and password lengths.                                                                                                 |
| **CUPP (Common User Passwords Profiler)** | Generates targeted password wordlists using publicly available information about a specific organization or user for authorized security testing.                                           |
| **DIRB Wordlists**                        | Commonly used wordlists for web content discovery and directory/file brute-force testing.                                                                                                   |
| **Hashcat**                               | A high-performance password recovery tool supporting numerous hashing algorithms and GPU acceleration. Supports dictionary, rule-based, mask, combinator, and brute-force attack modes.     |
| **Hashcat Rules**                         | Rule files used by Hashcat to mutate dictionary words into more realistic password candidates.                                                                                              |
| **John the Ripper (JtR)**                 | An open-source password auditing and recovery tool supporting dictionary, rule-based, hybrid, incremental, and brute-force attacks. Widely used for password strength assessments.          |
| **L0phtCrack**                            | A Windows password auditing and recovery tool that extracts password hashes and performs password strength analysis for security assessments.                                               |
| **Medusa**                                | A fast, parallelized network login brute-force testing tool supporting numerous authentication protocols.                                                                                   |
| **Ophcrack**                              | A Windows password recovery tool that uses rainbow tables to recover LM and NTLM passwords. Includes a graphical user interface and supports multiple operating systems.                    |
| **RainbowCrack**                          | A password recovery tool that uses precomputed rainbow tables and a time-memory trade-off algorithm to recover password hashes.                                                             |
| **RockYou Wordlist**                      | One of the most widely used password dictionaries for password auditing and security testing.                                                                                               |
| **THC Hydra**                             | A parallelized network login testing tool supporting dozens of protocols for authorized password auditing.                                                                                  |
| **Wfuzz Wordlists**                       | Wordlists used for web application fuzzing, directory enumeration, parameter discovery, and security testing.                                                                               |

## Common Categories

### Password Recovery Tools

* Cain & Abel
* Hashcat
* John the Ripper
* L0phtCrack
* Ophcrack
* RainbowCrack

### Wordlist Generation

* CeWL
* Crunch
* CUPP

### Common Wordlists

* RockYou
* DIRB Wordlists
* Wfuzz Wordlists
* Hashcat Rules

### Network Login Auditing

* Brutus
* Medusa
* THC Hydra

### Wireless Security Testing

* Aircrack-ng

## Notes

* Modern password auditing tools primarily target **password hashes**, not plaintext passwords.
* GPU-accelerated tools such as **Hashcat** provide significantly faster password recovery than CPU-only tools.
* Rainbow tables are less effective against properly **salted password hashes**.
* Strong passwords, unique credentials, password managers, MFA, and account lockout policies significantly reduce the effectiveness of password-cracking attacks.
* Always perform password auditing only with explicit authorization and within the scope of an approved security assessment.
