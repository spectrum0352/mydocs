# Gaining Access -- Password Cracking

## Overview

Password cracking is the process of recovering or guessing passwords to
gain unauthorized access to systems. Attackers exploit weak, reused, or
easily guessed passwords using automated tools capable of testing
thousands of combinations per second.

### Common Sources of Passwords

-   Network sniffing
-   Social engineering
-   Password database compromise
-   Password guessing
-   Credential reuse

> **Note:** Physical password reset procedures (e.g., boot-time password
> resets) are legitimate administrative recovery techniques when
> performed by authorized personnel.

## Password Attack Categories

### Non-Technical Attacks

-   Shoulder surfing
-   Social engineering
-   Dumpster diving

### Active Online Attacks

-   Dictionary attacks
-   Brute-force attacks
-   Password spraying
-   Password guessing
-   Hash injection / Pass-the-Hash
-   LLMNR/NBT-NS poisoning
-   Kerberos password attacks
-   Internal Monologue attacks
-   Malware (Trojans, spyware, keyloggers)

### Passive Online Attacks

-   Packet sniffing
-   Man-in-the-Middle (MITM)
-   Replay attacks

### Offline Attacks

-   Rainbow table attacks
-   Distributed password-cracking attacks

## Brute-Force Attacks

A brute-force attack systematically tests password combinations until
the correct credential is found.

### Countermeasures

-   Enforce strong password policies
-   Limit failed login attempts
-   Enable Multi-Factor Authentication (MFA)
-   Monitor and alert on authentication anomalies

## Common Password Attack Types

-   Dictionary attack
-   Password spraying
-   Credential stuffing
-   Password interception
-   Pass-the-Hash (PtH)
-   Internal Monologue attack
-   Birthday attack

## Wordlists

Wordlists are text files containing candidate passwords used by
password-cracking tools.

Common sources: - SecLists - RockYou - DIRB - Assetnote - Packet Storm

Common generators: - CEWL - Crunch - CUPP

## Default Passwords

Many devices ship with default credentials. Failure to change them
significantly increases the risk of unauthorized access.

## Hash Injection

Hash injection enables an attacker to reuse a stolen password hash to
authenticate without knowing the plaintext password.

## Password Guessing

Password guessing relies on information gathered through reconnaissance
or social engineering to manually or automatically test likely
passwords.

## Malware-Based Credential Theft

Trojans, spyware, and keyloggers can capture usernames and passwords and
transmit them to an attacker.

## Network-Based Credential Attacks

### Packet Sniffing

Capturing unencrypted network traffic to obtain credentials.

### Man-in-the-Middle (MITM)

Intercepting communications between two parties to steal or modify data.

### Replay Attack

Reusing captured authentication data to impersonate a legitimate user.

## Distributed Password Cracking

Distributed password recovery uses the combined computing power of
multiple systems to accelerate password cracking.

## Windows Password Storage

Windows stores password hashes in the Security Accounts Manager (SAM)
database or Active Directory.

Authentication mechanisms: - NTLM - Kerberos (recommended) - LM (legacy
and disabled by default on modern Windows)

> **Note:** LM hashes are disabled by default on Windows Vista and later
> versions because of known security weaknesses.
