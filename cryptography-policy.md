# Cryptography Policy

## 1. Purpose

This Cryptography Policy establishes the principles, standards, and requirements for the use of cryptographic controls within the organization. Its purpose is to ensure the confidentiality, integrity, and authenticity of sensitive information, while maintaining compliance with applicable legal, regulatory, and contractual obligations.

## 2. Scope

This policy applies to:
• All employees, contractors, and third-party service providers
• All information systems, applications, and infrastructure
• All data classified as sensitive, confidential, or regulated

________________________________________

## 3. Policy Statement

The organization mandates the use of strong, industry-approved cryptographic mechanisms to protect data at rest, in transit, and during processing where applicable. Only approved algorithms, key management practices, and cryptographic libraries shall be used.

## 4. Approved Cryptographic Algorithms

### 4.1 Symmetric Encryption

AES (Advanced Encryption Standard)
o Minimum: AES-128
o Recommended: AES-256

### 4.2 Asymmetric Encryption

• RSA
o Minimum key length: 2048 bits
o Recommended: 3072 bits or higher

• Elliptic Curve Cryptography (ECC)
o Approved curves: secp256r1, secp384r1

### 4.3 Hashing Algorithms

• SHA-256 or higher (SHA-384, SHA-512)
• SHA-1 and MD5 are strictly prohibited

### 4.4 Key Exchange & Digital Signatures

• ECDHE (Elliptic Curve Diffie-Hellman Ephemeral)
• RSA-PSS for signatures
• Ed25519 (where supported)

## 5. Minimum Key Length Requirements

## 6. Approved Cryptographic Libraries and Tools

Only vetted and regularly updated cryptographic libraries are permitted, including:
• OpenSSL (latest stable version)
• BoringSSL
• Libsodium
• Java Cryptography Architecture (JCA/JCE)
• Microsoft Cryptography APIs
Use of custom or proprietary cryptographic implementations is strictly prohibited unless formally reviewed and approved by the security team.

## 7. Key Management Requirements

Cryptographic keys must be generated using secure random number generators. Keys must be stored securely using:

- Hardware Security Modules (HSMs), or
- Secure key vaults (e.g., cloud KMS)

Key rotation must occur:

- At least annually, or
- Immediately upon suspected compromise

• Keys must never be hardcoded in source code or stored in plaintext.
• Access to keys must follow the principle of least privilege.

## 8. Data Classification and Encryption Requirements

### 8.1 Data at Rest

• Must be encrypted using approved algorithms.
• Full disk encryption or database-level encryption required for sensitive data.

### 8.2 Data in Transit

• Must use secure protocols such as TLS 1.2 or higher (TLS 1.3 preferred).
• Insecure protocols (e.g., HTTP, FTP, SSL) are prohibited.

### 8.3 Data in Use

• Sensitive operations should use secure enclaves or memory protection where feasible.

## 9. Regulatory and Compliance Requirements

The organization must ensure compliance with applicable regulations, including but not limited to:
• PCI-DSS (Payment Card Industry Data Security Standard)
• GDPR (General Data Protection Regulation)
• ISO/IEC 27001
• Local data protection laws and industry-specific standards
Cryptographic controls must align with regulatory expectations for data protection and privacy.

## 10. Prohibited Practices

• Use of deprecated or weak algorithms (e.g., DES, 3DES, RC4, MD5, SHA-1)
• Hardcoding encryption keys or secrets
• Reuse of cryptographic keys across different systems or environments
• Use of self-developed cryptographic algorithms without approval
• Disabling certificate validation in production systems

________________________________________

## 11. Roles and Responsibilities

• Security Team
o Define and maintain cryptographic standards
o Approve tools and implementations
o Conduct audits and reviews
• Developers
o Use approved cryptographic libraries and configurations
o Ensure secure implementation of encryption
• IT Operations
o Manage key storage systems and infrastructure
o Ensure secure deployment and configuration

________________________________________

## 12. Policy Enforcement

Violations of this policy may result in disciplinary action, up to and including termination of employment or contracts. Non-compliance may also expose the organization to legal and regulatory penalties.

________________________________________

## 13. Review and Updates

This policy must be reviewed at least annually or upon significant changes in:
• Threat landscape
• Regulatory requirements
• Technology standards
________________________________________

## 14. Exceptions

Any exception to this policy must:
• Be formally documented
• Include risk assessment and justification
• Be approved by the Information Security team

________________________________________

## 15. Effective Date

This policy is effective as of the date of approval and supersedes any previous cryptography-related policies.
