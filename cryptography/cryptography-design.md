# Cryptography Design

## 1. Purpose

This document defines how cryptographic controls are designed and implemented within systems across the organization. It translates cryptographic policies and standards into system-level architecture, ensuring secure handling of sensitive data and proper integration with cryptographic services.

## 2. Scope

This document applies to:

• All applications and systems handling sensitive or regulated data
• System architects, developers, and security engineers
• Cloud and on-premise deployments

## 3. Architectural Principles

• Cryptography must be applied consistently across all layers (application, transport, storage)
• Keys must never be stored alongside encrypted data
• All cryptographic operations must use approved libraries and services
• Minimize exposure of plaintext data
• Enforce least privilege access to cryptographic material

## 4. Encryption Flows

### 4.1 Data at Rest Flow

Typical Flow:

1. Application generates or receives sensitive data
2. Data is sent to encryption service/library
3. Encryption key is retrieved securely from KMS/HSM
4. Data is encrypted using AES-256
5. Encrypted data is stored in database/storage
6. Key reference (not the key itself) is stored alongside metadata

Controls:
• Envelope encryption must be used where possible
• Master keys must remain within KMS/HSM
• Data Encryption Keys (DEKs) must be rotated periodically

### 4.2 Data in Transit Flow

Typical Flow:

1. Client initiates connection to server
2. TLS handshake establishes secure session
3. Server presents certificate
4. Client validates certificate chain
5. Session key established using ECDHE
6. Encrypted communication begins

Controls:
• Enforce TLS 1.2+ (TLS 1.3 preferred)
• Enable Perfect Forward Secrecy
• Reject invalid or expired certificates

### 4.3 Data in Use Flow (Optional)

• Sensitive data decrypted only in memory
• Access restricted to authorized processes
• Use secure enclaves where applicable
• Data cleared from memory immediately after use

## 5. Key Usage by System

### 5.1 Key Types

Key Type Purpose
Master Key (KEK) Encrypts Data Encryption Keys
Data Encryption Key (DEK) Encrypts application data
TLS Private Key Secures communication channels
Signing Key Digital signatures & integrity

### 5.2 Key Usage Guidelines

• Each system must use unique keys (no sharing across environments)
• Separate keys for:
o Production vs non-production
o Different applications/services
• Keys must have defined:
o Owner
o Purpose
o Rotation schedule

## 6. Trust Boundaries

### 6.1 Definition

Trust boundaries define where data transitions between different security domains or levels of trust.

### 6.2 Common Trust Boundaries

• Client ↔ Application Server
• Application ↔ Database
• Application ↔ External APIs
• Internal service-to-service communication

### 6.3 Controls at Trust Boundaries

• Enforce TLS/mTLS for all communications
• Authenticate and authorize all requests
• Validate input/output data
• Encrypt sensitive payloads crossing boundaries

## 7. Integration with Cryptographic Services

### 7.1 Key Management Services (KMS)

• All key storage and management must use centralized KMS
• Responsibilities:
o Key generation
o Key rotation
o Access control
o Audit logging

Implementation Guidelines:
• Use envelope encryption via KMS APIs
• Restrict key usage via IAM policies
• Enable logging for all key operations

### 7.2 Hardware Security Modules (HSM)

• Use HSMs for:
o Root keys
o High-value cryptographic operations
o Regulatory requirements (e.g., financial systems)

Requirements:
• Keys must never leave HSM in plaintext
• Use FIPS 140-2/3 compliant devices where required

### 7.3 Application Integration

• Applications must NOT:
o Store cryptographic keys locally
o Implement custom key management
• Use SDKs/APIs provided by KMS/HSM vendors
• Handle failures securely (e.g., deny access if encryption fails)

## 8. Threat Modelling for Cryptography

### 8.1 Objectives

Identify and mitigate risks related to cryptographic implementations.

### 8.2 Common Threats

• Key compromise or leakage
• Weak or deprecated algorithms
• Improper certificate validation
• Man-in-the-middle (MITM) attacks
• Replay attacks
• Side-channel attacks

### 8.3 Mitigation Strategies

Threat Mitigation Strategy
Key compromise Key rotation, HSM usage, strict access control
Weak algorithms Enforce approved cryptographic standards
MITM attacks TLS/mTLS, certificate validation
Replay attacks Nonces, timestamps, session tokens
Data exposure Encryption at rest and in transit

### 8.4 Threat Modeling Process

• Identify sensitive data flows
• Define trust boundaries
• Enumerate threats (e.g., STRIDE methodology)
• Apply mitigations and controls
• Document residual risks

## 9. Logging and Monitoring

• Log:
    o Key usage events
    o Encryption/decryption failures
    o Certificate validation failures
• Monitor for:
    o Unauthorized key access
    o Unusual cryptographic activity
    • Integrate logs with SIEM systems

## 10. Diagram Requirements

Each system must maintain up-to-date diagrams including:
• Data flow diagrams (DFD)
• Encryption points (at rest, in transit)
• Key management interactions
• Trust boundaries clearly marked

Minimum Diagram Elements:
• Actors (users, systems)
• Data stores
• Encryption/decryption points
• KMS/HSM integration
• Secure communication channels

## 11. Compliance and Audit Considerations

• Maintain documentation for:
o Key usage
o Encryption mechanisms
o Architecture diagrams
• Ensure traceability for audits (PCI-DSS, GDPR, ISO 27001)
• Provide evidence of:
o Key rotation
o Secure configurations
o Access controls

## 12. Roles and Responsibilities

• Architects
o Design secure cryptographic architecture
• Developers
o Implement encryption as per design
• Security Team
o Review and approve architecture
o Conduct threat modeling
• Operations Team
o Maintain KMS/HSM infrastructure

## 13. Review and Updates

• Review architecture documents:
o During system design
o After major changes
o Annually at minimum

## 14. Exceptions

• Must be:
o Documented with justification
o Risk assessed
o Approved by Information Security

## 15. Appendix

A. Sample Encryption Flow (Textual)
User → HTTPS (TLS) → Application → Encrypt (DEK) → Store in DB
DEK → Encrypted by KEK → Stored in KMS

B. Sample Trust Boundary Illustration (Textual)
[User Browser] ⇄ (TLS) ⇄ [Web Server] ⇄ (mTLS) ⇄ [Internal API] ⇄ [Database (Encrypted)]
