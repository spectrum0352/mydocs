# Password Salting Attacks

Password salting is a defensive technique used to strengthen password storage. A **salt** is a unique, randomly generated value that is added to a password before it is hashed. This ensures that identical passwords produce different hash values, making password cracking significantly more difficult.

## How Password Salting Works

1. A random salt is generated for each password.
2. The salt is combined with the user's password.
3. The combined value is hashed using a secure password hashing algorithm.
4. Both the salt and the resulting hash are stored in the authentication database.

> **Example:**
> Instead of hashing `Password123`, the system hashes something similar to:
>
> ```text
> Password123 + X7f$9LmQ
> ```

## Benefits of Password Salting

* Prevents identical passwords from generating identical hashes.
* Protects against **rainbow table** and other precomputed hash attacks.
* Increases the computational effort required for offline password-cracking attacks.
* Ensures each password hash is unique, even when users choose the same password.

## Important Notes

* Modern operating systems and applications should use **salted password hashes** with strong password hashing algorithms such as **Argon2**, **bcrypt**, **scrypt**, or **PBKDF2**.
* Legacy Windows **LM** and **NTLM** password hashes do **not** use per-password salts, making them more susceptible to offline password-cracking attacks if the hashes are compromised.
* Salting improves password security but does **not** replace the need for strong passwords, secure hashing algorithms, and multi-factor authentication (MFA).

## Password Hash Extraction Utilities (Legacy Security Assessment)

The following legacy utilities have historically been used during authorized security assessments to extract password hashes from Windows systems.

| Tool       | Description                                                                                                                      |
| ---------- | -------------------------------------------------------------------------------------------------------------------------------- |
| **pwdump** | Extracts LM and NTLM password hashes from the Windows Security Account Manager (SAM) database.                                   |
| **fgdump** | Extends the functionality of pwdump by extracting cached credentials and supporting remote execution in authorized environments. |

> **Note:** These tools require **Administrator** or equivalent privileges and should only be used during authorized security testing or digital forensics. Modern Windows security controls, such as Microsoft Defender, Credential Guard, and antivirus solutions, typically detect or block these utilities.

## Security Recommendations

* Use modern password hashing algorithms (Argon2, bcrypt, scrypt, or PBKDF2).
* Disable LM hash storage whenever possible.
* Enforce strong password policies and MFA.
* Protect systems against unauthorized access to the SAM database.
* Monitor for credential dumping attempts using endpoint detection and response (EDR) solutions.
