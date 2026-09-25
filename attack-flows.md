# Attack Flows

After analyzing all incidents, most of them are variations of the same 10–12 attack patterns. Instead of repeating nearly identical kill chains hundreds of times, you can consolidate them into unique attack flow scenarios that cover every attack in the document while removing duplicates. The incidents primarily fall into espionage, ransomware, destructive attacks, DDoS, supply-chain compromise, OT/ICS attacks, credential attacks, web/database compromise, PKI compromise, disinformation, and blockchain attacks.  

## 1. Spear-Phishing → Espionage → Data Exfiltration

**Covers:**

* Government espionage campaigns
* Diplomat targeting
* Military targeting
* Telecom espionage
* Defense contractor breaches
* Spyware campaigns
* RAT deployments

```text
┌─────────────────┐
│ Reconnaissance  │
│ OSINT, Email    │
│ Collection      │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Spear Phishing  │
│ Malicious Link  │
│ Attachment      │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Initial Access  │
│ Credential      │
│ Theft / Malware │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Persistence     │
│ RAT / Backdoor  │
│ Scheduled Tasks │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Lateral Movement│
│ Credential Dump │
│ Internal Recon  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Data Collection │
│ Documents       │
│ Emails          │
│ Credentials     │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Exfiltration    │
│ HTTPS / DNS     │
│ C2 Channels     │
└─────────────────┘
```

---

## 2. Vulnerability Exploitation → APT Intrusion

**Covers:**

* Log4Shell attacks
* Exchange/VPN exploitation
* Zero-day campaigns
* Public-facing application compromise

```text
Recon
   │
   ▼
Internet Scanning
   │
   ▼
Exploit Public Vulnerability
(Log4Shell / VPN / Exchange)
   │
   ▼
Remote Code Execution
   │
   ▼
Web Shell / Backdoor
   │
   ▼
Privilege Escalation
   │
   ▼
Credential Dumping
   │
   ▼
Lateral Movement
   │
   ▼
Data Theft
```

---

## 3. Ransomware Attack Chain

**Covers:**

* Costa Rica
* Vanuatu
* Government ransomware
* Healthcare attacks
* Energy sector attacks
* Oil terminal attacks

```text
Recon
   │
   ▼
Phishing / VPN Compromise
   │
   ▼
Initial Foothold
   │
   ▼
Persistence
   │
   ▼
Credential Harvesting
   │
   ▼
Lateral Movement
   │
   ▼
Backup Destruction
   │
   ▼
Mass Encryption
   │
   ▼
Ransom Demand
   │
   ▼
Extortion / Leak Threat
```

---

## 4. Destructive Wiper Attack

**Covers:**

* WhisperGate
* HermeticWiper
* CaddyWiper
* Government system destruction
* Media disruption

```text
Recon
   │
   ▼
Initial Access
   │
   ▼
Deploy Wiper Malware
   │
   ▼
Disable Recovery
   │
   ▼
Delete Data
   │
   ▼
Corrupt Boot Records
   │
   ▼
Destroy Services
   │
   ▼
Operational Outage
```

---

## 5. DDoS Attack Campaign

**Covers:**

* Airports
* Government websites
* Ministries
* Telecom providers
* Railways
* Election-related attacks

```text
Target Selection
      │
      ▼
Botnet Preparation
      │
      ▼
Traffic Generation
      │
      ▼
UDP Flood
HTTP Flood
SYN Flood
Amplification
      │
      ▼
Service Saturation
      │
      ▼
Website / Service Outage
      │
      ▼
Repeat Attack Waves
```

This pattern appears dozens of times in the document.  

---

## 6. Supply Chain Compromise

**Covers:**

* Danish Railways subcontractor
* Software provider attacks
* Vendor compromise
* Trusted third-party breaches

```text
Target Vendor
      │
      ▼
Compromise Supplier
      │
      ▼
Access Development
Testing Environment
      │
      ▼
Malware Injection
      │
      ▼
Trusted Distribution
      │
      ▼
Customer Environment
Compromise
      │
      ▼
Privilege Expansion
      │
      ▼
Operational Impact
```

---

## 7. Critical Infrastructure / ICS / OT Attack

**Covers:**

* Energy agencies
* Steel companies
* Railways
* Dams
* Utilities
* Power systems

```text
OT Reconnaissance
      │
      ▼
Identify SCADA/ICS
      │
      ▼
IT Network Breach
      │
      ▼
Pivot to OT Network
      │
      ▼
ICS Discovery
      │
      ▼
Controller Manipulation
      │
      ▼
Operational Disruption
      │
      ▼
Production Shutdown
```

Appears repeatedly across energy, transportation, water, and industrial targets.  

---

## 8. Credential Theft / Account Takeover

**Covers:**

* Social media hijacking
* Email compromise
* OWA compromise
* Political account takeover

```text
Target Profiling
      │
      ▼
Password Spraying
Phishing
Credential Stuffing
      │
      ▼
Account Access
      │
      ▼
MFA Bypass
      │
      ▼
Persistence
      │
      ▼
Mailbox Rules
Session Theft
      │
      ▼
Data Theft
or
Account Abuse
```

---

## 9. Database / Web Application Breach

**Covers:**

* Shanghai Police leak
* Xinjiang files
* ICCO compromise
* Government database breaches

```text
Recon
      │
      ▼
Identify Web App
Database
      │
      ▼
SQL Injection
RCE
Credential Abuse
      │
      ▼
Database Access
      │
      ▼
Privilege Escalation
      │
      ▼
Bulk Data Extraction
      │
      ▼
Sale / Leak / Publication
```

---

## 10. Certificate Authority / Trust Infrastructure Compromise

**Covers:**

* CA compromise
* Rogue certificate issuance
* MITM espionage

```text
Recon PKI Systems
        │
        ▼
Compromise CA
        │
        ▼
Steal Signing Keys
        │
        ▼
Issue Rogue Certificates
        │
        ▼
Man-in-the-Middle
        │
        ▼
Intercept Traffic
        │
        ▼
Espionage
```

Unique scenario that appears separately from traditional APT attacks. 

---

## 11. USB / Removable Media Infection

**Covers:**

* Infected USB campaigns
* Air-gapped targeting
* Military espionage

```text
Prepare Malicious USB
          │
          ▼
Physical Delivery
          │
          ▼
User Inserts Device
          │
          ▼
Malware Execution
          │
          ▼
Persistence
          │
          ▼
Network Discovery
          │
          ▼
Data Theft
```

---

## 12. Blockchain / Cryptocurrency Theft

**Covers:**

* Horizon Bridge theft

```text
Smart Contract Review
         │
         ▼
Vulnerability Discovery
         │
         ▼
Exploit Development
         │
         ▼
Malicious Transaction
         │
         ▼
Asset Transfer
         │
         ▼
Fund Laundering
         │
         ▼
Chain Hopping
```

---

## 13. Information Operations / Disinformation Campaign

**Covers:**

* Influence campaigns
* False media broadcasts
* Social media manipulation
* SMS misinformation

```text
Target Population
        │
        ▼
Narrative Development
        │
        ▼
Fake Content Creation
        │
        ▼
Bot / Fake Account Setup
        │
        ▼
Mass Distribution
        │
        ▼
Amplification
        │
        ▼
Psychological Impact
```

---

## Master Cyber Attack Framework

Almost every incident in the document ultimately maps into one of these branches:

```text
                    CYBER ATTACKS
                           │
 ┌─────────────┬─────────────┬─────────────┬─────────────┐
 │             │             │             │
 ▼             ▼             ▼             ▼
Espionage   Ransomware     DDoS      Supply Chain
 │             │             │             │
 ▼             ▼             ▼             ▼
APT        Encryption     Botnets      Vendor
Campaigns  Extortion      Flooding     Compromise

 ┌─────────────┬─────────────┬─────────────┐
 │             │             │
 ▼             ▼             ▼
ICS/OT      Database      Account
Attacks     Breaches      Takeovers

 ┌─────────────┬─────────────┐
 │             │
 ▼             ▼
PKI/CA     Blockchain
Compromise Theft

             │
             ▼
      Information Ops
```

These 13 unique attack flows cover virtually all incidents in your source document without duplication while preserving every major attack scenario present across the 2022 timeline.