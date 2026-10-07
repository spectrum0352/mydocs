# Cryptographic Attacks

## 1. Purpose

This document provides detailed standards and implementation guidance to support the organization’s Cryptography Policy. It defines how cryptographic controls must be applied in practice to ensure secure, consistent, and compliant implementations across systems and applications.

## 2. Scope

These standards apply to:
• All software development teams
• IT infrastructure and operations
• Cloud and on-premise environments
• Third-party integrations handling organizational data

## 3. Encryption Standards

### 3.1 Data at Rest

Sensitive data must be encrypted using approved algorithms

- AES-256 (preferred)
- AES-128 (minimum acceptable where performance constraints exist)

Encryption must be applied at:

- Disk level (Full Disk Encryption)
- Database level (Transparent Data Encryption)
- File/object storage level (e.g., cloud storage encryption)

Implementation Guidelines:

- Use managed encryption services (e.g., cloud KMS) wherever possible
- Separate encryption keys from encrypted data
- Avoid storing sensitive data in plaintext, including logs and backups

### 3.2 Data in Transit

All data in transit must be protected using:

- TLS 1.2 (minimum)
- TLS 1.3 (preferred)

Approved Configurations:

- Use Strong cipher suites only (e.g., ECDHE with AES-GCM)
- Disable: SSL, TLS v1.0, TLS v1.1 and Weak ciphers such as RC4, DES, 3DES.

Additional Requirements:

- Enforce HTTPS for all web applications
- Use secure protocols such as SFTP instead of FTP and SSH instead of Telnet

### 3.3 Data in Use (Where Applicable)

• Use secure execution environments where feasible:
o Trusted Execution Environments (TEE)
o Memory protection techniques
• Avoid exposing sensitive data in memory dumps or debug logs

________________________________________

## 4. Hashing and Salting Practices

4.1 Approved Hash Functions
• SHA-256, SHA-384, SHA-512
• Avoid MD5 and SHA-1 (prohibited)

4.2 Password Storage Requirements
• Passwords must NEVER be stored in plaintext
• Use adaptive hashing algorithms:
o bcrypt
o scrypt
o Argon2 (preferred)

4.3 Salting Requirements
• Each password must have a unique, cryptographically secure salt
• Minimum salt length: 16 bytes
• Salts must be randomly generated

4.4 Additional Protections
• Use pepper (application-level secret) where feasible
• Implement rate limiting and account lockout controls

________________________________________

## 5. Key Derivation Functions (KDFs)

### 5.1 Approved KDFs

• PBKDF2 (minimum 100,000 iterations)
• bcrypt
• scrypt
• Argon2 (preferred)

### 5.2 Usage Guidelines

• Use KDFs for:
o Password-based key generation
o Deriving keys from passphrases
• Avoid using raw passwords directly as encryption keys

### 5.3 Configuration Requirements

• Configure work factor (iterations/cost) based on:
o Current hardware capabilities
o Security recommendations
• Periodically review and increase cost parameters
________________________________________

## 6. Secure Random Number Generation

### 6.1 Requirements

• All cryptographic operations must use Cryptographically Secure Pseudo-Random Number Generators (CSPRNGs)

### 6.2 Approved Sources

• /dev/urandom (Linux/Unix)
• CryptGenRandom / BCryptGenRandom (Windows)
• SecureRandom (Java)
• Language-specific secure APIs (e.g., Python secrets module)

### 6.3 Prohibited Practices

• Do NOT use:
o rand(), srand(), or similar non-secure functions
o Predictable seeds (e.g., timestamps)
________________________________________

## 7. Certificate and TLS Usage Guidelines

### 7.1 Certificate Requirements

• Certificates must be:
o Issued by trusted Certificate Authorities (CAs)
o Valid and not expired
o At least 2048-bit RSA or equivalent ECC strength

### 7.2 TLS Configuration

• Enforce TLS 1.2 or higher
• Prefer TLS 1.3 where supported
• Enable Perfect Forward Secrecy (PFS)

### 7.3 Certificate Validation

• Always validate:
o Certificate chain
o Expiry date
o Hostname matching
• Certificate validation must NOT be disabled in production

________________________________________

### 7.4 Mutual TLS (mTLS)

• mTLS must be used for:
o Service-to-service communication (especially in microservices)
o High-trust internal APIs

Requirements:
• Both client and server must authenticate using certificates
• Certificates must be rotated regularly
• Use automated certificate management tools where possible

________________________________________

### 7.5 Certificate Lifecycle Management

• Track all certificates in a centralized inventory
• Renew certificates before expiration (recommended: 30 days prior)
• Revoke compromised certificates immediately
• Use short-lived certificates where feasible
________________________________________

## 8. Implementation Best Practices

• Use only approved cryptographic libraries (as per policy)
• Keep libraries up to date with latest security patches
• Avoid implementing custom cryptographic algorithms
• Perform secure code reviews for cryptographic implementations
• Use automated tools for vulnerability scanning
________________________________________

## 9. Logging and Monitoring

• Do NOT log:
o Encryption keys
o Passwords
o Sensitive plaintext data
• Log security-relevant events:
o Key access attempts
o Certificate failures
o TLS handshake errors
________________________________________

## 10. Testing and Validation

• Conduct regular:
o Cryptographic configuration reviews
o Penetration testing
o TLS scans (e.g., for weak ciphers)
• Validate compliance with:
o Organizational policy
o Industry standards
________________________________________

## 11. Compliance Alignment

These standards support compliance with:
• PCI-DSS
• GDPR
• ISO/IEC 27001
• Industry best practices (e.g., NIST, OWASP)

________________________________________

## 12. Exceptions

• Any deviation must:
o Be formally documented
o Include risk justification
o Be approved by the Information Security team
________________________________________

## 13. Review Cycle

• Review this document annually or upon:
o Major security incidents
o Changes in cryptographic best practices
o Regulatory updates
