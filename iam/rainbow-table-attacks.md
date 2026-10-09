# Rainbow Table Attack

A **Rainbow Table Attack** is a password cracking technique that uses **precomputed hash values** to recover plaintext passwords from their cryptographic hashes. Instead of calculating hashes for every password attempt (as in brute-force attacks), the attacker searches a precomputed lookup table, significantly reducing cracking time.

> **Note:** Rainbow table attacks are largely ineffective against properly **salted passwords** and modern password hashing algorithms such as **bcrypt**, **scrypt**, **Argon2**, and **PBKDF2**.

---

## How Rainbow Tables Work

1. Generate a large list of possible passwords.
2. Compute the hash for each password using a specific hashing algorithm (e.g., MD5, SHA-1).
3. Store the password-hash mappings in a rainbow table.
4. Capture the target password hash.
5. Compare the captured hash with the precomputed table.
6. If a matching hash is found, the corresponding plaintext password is recovered.

---

## Example

| Plaintext Password | Hash (MD5 Example)                 |
| ------------------ | ---------------------------------- |
| `1qazwed`          | `21c40e47dba72e77518ee3ef88ad0cc8` |
| `hh021da`          | `2ce80b192cfa47a0d6c8a2446314810b` |
| `9da8dasf`         | `eb0f5690164ffabbed1744087a4d6761` |
| `sodifo8sf`        | `2c749bf3fff89778efc50af7e4f8d6a8` |

> These hashes are provided only as examples to demonstrate how rainbow tables map plaintext passwords to their hash values.

---

## Advantages

* Faster than brute-force attacks because hashes are precomputed.
* Requires minimal CPU resources during the cracking phase.
* Effective against **unsalted** password hashes.

---

## Limitations

* Requires significant storage space for large tables.
* Must be generated separately for each hashing algorithm.
* Ineffective against:

  * Salted password hashes
  * Strong password hashing algorithms (bcrypt, Argon2, scrypt, PBKDF2)
  * Long, random, and complex passwords

---

## Rainbow Table Generation Tools

* **RTGEN** – Command-line tool used to generate rainbow tables with configurable parameters.
* **WinRTGEN** – Graphical interface for generating rainbow tables on Windows.

---

## Related Password Attacks

### Keylogging Attack

A keylogger records keystrokes to capture usernames and passwords as users type them.

**Mitigation**

* Enable Multi-Factor Authentication (MFA)
* Use endpoint protection/EDR solutions
* Keep systems updated
* Avoid installing untrusted software

---

### Manual Password Guessing

Attackers attempt to guess passwords using publicly available information such as:

* Name
* Date of birth
* Family members
* Company name
* Common password patterns

**Mitigation**

* Enforce strong password policies
* Block common passwords
* Monitor failed login attempts
* Enable account lockout policies
* Train users on password security

---

### Non-Electronic Password Attacks

These attacks rely on human interaction rather than technical exploitation.

Examples include:

* Shoulder surfing
* Social engineering
* Dumpster diving

**Mitigation**

* User security awareness training
* Physical security controls
* Clean desk policy
* Secure disposal of sensitive documents

---

### Offline Password Attacks

The attacker obtains a copy of the password database and attempts to crack passwords without interacting with the target system.

Examples include:

* Rainbow table attacks
* Dictionary attacks
* Brute-force attacks
* Distributed password cracking

**Mitigation**

* Salt all passwords
* Use modern password hashing algorithms
* Enforce strong passwords
* Protect password databases

---

### Passive Online Attacks

The attacker captures authentication data without directly interacting with the authentication service.

Examples include:

* Packet sniffing
* Man-in-the-Middle (MITM) attacks
* Replay attacks

**Mitigation**

* Use encrypted protocols (TLS/HTTPS)
* Implement MFA
* Use secure session management
* Enable network monitoring and intrusion detection

---

## Best Practices to Prevent Rainbow Table Attacks

* Use unique salts for every password.
* Use modern password hashing algorithms:

  * Argon2 (recommended)
  * bcrypt
  * scrypt
  * PBKDF2
* Enforce long and complex passwords.
* Enable Multi-Factor Authentication (MFA).
* Monitor authentication logs for suspicious activity.
* Protect password databases from unauthorized access.

---

## Key Takeaways

* Rainbow tables are **precomputed hash lookup tables** used to recover plaintext passwords.
* They represent a **space-time trade-off**, sacrificing storage space to reduce password cracking time.
* They are highly effective only against **unsalted** password hashes.
* Proper salting and modern password hashing algorithms make rainbow table attacks impractical.

---

## References

* [https://en.wikipedia.org/wiki/Rainbow_table](https://en.wikipedia.org/wiki/Rainbow_table)
* [https://owasp.org/www-community/Password_Storage_Cheat_Sheet](https://owasp.org/www-community/Password_Storage_Cheat_Sheet)
* [https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html](https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html)
