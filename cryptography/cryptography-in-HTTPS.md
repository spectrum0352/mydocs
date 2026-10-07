# Cryptography in HTTPS

HTTPS (Hypertext Transfer Protocol Secure) protects communication between a client (typically a web browser) and a web server using **TLS (Transport Layer Security)**.

TLS combines multiple cryptographic techniques:

* Symmetric encryption
* Asymmetric cryptography
* Hash functions
* HMAC or AEAD authentication
* Digital certificates
* Digital signatures
* Key exchange algorithms

Each cryptographic technique performs a different role.

---

# Cryptographic Components

## Symmetric Encryption

Uses the **same key** for encryption and decryption.

Examples:

* AES-128
* AES-256
* ChaCha20

Advantages

* Very fast
* Suitable for encrypting large amounts of data

Used for

* Encrypting HTTP requests
* Encrypting HTTP responses
* Protecting cookies
* Protecting API traffic

---

## Asymmetric Cryptography

Uses a **public key** and a **private key**.

Examples

* RSA
* Elliptic Curve Cryptography (ECC)

Purpose

* Identity verification
* Digital signatures
* Secure key exchange

It is **not** used to encrypt all web traffic because it is computationally expensive.

---

## Hash Functions

A hash function converts data into a fixed-length value.

Examples

* SHA-256
* SHA-384

Properties

* One-way function
* Fixed-length output
* Detects data modification

Hashes are used for

* Certificate signatures
* Integrity checking
* Password storage (with additional protections)
* Digital signatures

---

## HMAC (Hash-Based Message Authentication Code)

HMAC combines:

* A hash function
* A shared secret key

Purpose

* Verify integrity
* Verify authenticity

TLS 1.2 commonly used HMAC.

Example

```
HMAC = SHA-256(Message + Secret Key)
```

---

## AEAD (Authenticated Encryption)

Modern TLS versions (especially TLS 1.3) typically use AEAD algorithms instead of separate encryption and HMAC.

Examples

* AES-GCM
* ChaCha20-Poly1305

AEAD provides

* Encryption
* Integrity
* Authentication

in a single operation.

---

# How HTTPS Works

HTTPS operates in three phases.

---

# Phase 1 — TCP Connection

Before encryption begins, TCP establishes a reliable connection.

```
Client                         Server
------                         ------

SYN ------------------------->

          <------------------ SYN-ACK

ACK ------------------------->

TCP Connection Established
```

No encryption occurs during the TCP handshake.

---

# Phase 2 — TLS Handshake

The TLS handshake establishes trust and creates shared encryption keys.

```
Client                              Server
------                              ------

ClientHello ----------------------->

                  <----------------- ServerHello

                  <----------------- Certificate

                  <----------------- Key Exchange Parameters

Client Key Exchange --------------->

Change Cipher Spec ---------------->

Finished -------------------------->

                  <----------------- Change Cipher Spec

                  <----------------- Finished
```

During this phase:

* The server sends its digital certificate.
* The client validates the certificate.
* Both parties perform a key exchange (typically using ECDHE in modern TLS).
* Both derive the same symmetric session keys.
* The handshake completes.

---

# Certificate Validation

The browser verifies that:

* The certificate is trusted.
* The certificate has not expired.
* The hostname matches.
* The certificate chain is valid.
* The certificate has not been revoked (where applicable).

If validation fails, the browser displays a certificate warning.

---

# Phase 3 — Encrypted Communication

Once the TLS handshake completes:

```
Client                    Server
------                    ------

Encrypted HTTP Request --->

             <------------ Encrypted HTTP Response

Encrypted HTTP Request --->

             <------------ Encrypted HTTP Response
```

All HTTP data is encrypted using the negotiated symmetric session keys.

---

# How the Session Key Is Created

Modern TLS (TLS 1.3)

```
Client
   │
   │
Ephemeral Key Pair
   │
   │
───────────────►
                 Server
                 Ephemeral Key Pair
                 │
                 │
◄───────────────

Both perform ECDHE

↓

Both independently derive

Shared Secret

↓

Session Keys

↓

AES-GCM or ChaCha20-Poly1305
```

The session key is **derived independently by both sides** and is **never transmitted across the network**.

---

# Cryptography Used During HTTPS

| Cryptographic Technique | Purpose                                          |
| ----------------------- | ------------------------------------------------ |
| Asymmetric Cryptography | Authenticate the server and perform key exchange |
| Digital Certificate     | Prove the server's identity                      |
| Digital Signature       | Verify certificate authenticity                  |
| Hash Function           | Ensure integrity and support signatures          |
| HMAC (TLS 1.2)          | Message authentication and integrity             |
| AEAD (TLS 1.3)          | Combined encryption and integrity                |
| Symmetric Encryption    | Encrypt all HTTP data after the handshake        |

---

# Simplified HTTPS Flow

```
1. TCP Connection

Client
   │
   ├── SYN ─────────────►
   │◄── SYN-ACK ─────────
   └── ACK ─────────────►

↓

2. TLS Handshake

ClientHello
        │
        ▼
ServerHello
Certificate
Key Exchange

↓

Certificate Validation

↓

Shared Session Keys Generated

↓

3. Secure Communication

HTTP Request
        │
AES-GCM Encryption
        │
Encrypted Data
        ▼
Server

↓

Encrypted HTTP Response
```

---

# Key Points

* TCP establishes the network connection.
* TLS provides security for the connection.
* HTTPS is HTTP running over TLS.
* Asymmetric cryptography is used only during the TLS handshake for authentication and key exchange.
* Symmetric encryption protects all application data because it is much faster.
* Modern TLS (TLS 1.3) derives session keys using ephemeral key exchange (typically ECDHE); the session key itself is never sent over the network.
* Each HTTPS session uses unique session keys, providing confidentiality and forward secrecy.
