# Microsoft Entra ID Hybrid Identity - End-to-End Guide

## 1. Overview

Hybrid identity enables organizations to integrate **on-premises identity (Active Directory Domain Services - AD DS)** with **Microsoft Entra ID**.

Benefits include:

* Identities are created and managed in on-premises AD DS.
* Identities are synchronized to Microsoft Entra ID.
* Users access both on-premises and cloud resources using a single identity.
* Centralized identity and access management.
* Improved user experience through Single Sign-On (SSO).

### Core Components

* Microsoft Entra Connect Sync
* Microsoft Entra Cloud Sync
* Microsoft Entra ID
* Active Directory Domain Services (AD DS)

---

## 2. Architecture and Authentication Models

### 2.1 Identity Flow

```text
Active Directory Domain Services (AD DS)
                 │
                 │  Synchronization
                 │  (Entra Connect / Cloud Sync)
                 ▼
        Microsoft Entra ID
```

---

### 2.2 Authentication Models

#### Managed Authentication

Authentication is handled directly by Microsoft Entra ID.

Supported methods:

* Password Hash Synchronization (PHS)
* Pass-through Authentication (PTA)

#### Federated Authentication

Authentication is redirected to an on-premises identity provider such as Active Directory Federation Services (AD FS).

Typical use cases:

* Legacy authentication requirements
* Smart card authentication
* Third-party identity provider integrations

---

### 2.3 Authentication Method Comparison

| Method                              | Description                               | Infrastructure Requirements | Smart Card Support | Complexity |
| ----------------------------------- | ----------------------------------------- | --------------------------- | ------------------ | ---------- |
| Password Hash Synchronization (PHS) | Password hash synchronized to Entra ID    | None                        | No                 | Low        |
| Pass-through Authentication (PTA)   | Password validated against on-premises AD | PTA Agents                  | No                 | Medium     |
| Federation (AD FS)                  | Authentication performed on-premises      | AD FS Farm                  | Yes                | High       |

### Key Considerations

* **PHS** is Microsoft's recommended authentication method for most organizations.
* **PTA** is useful when password validation must remain on-premises.
* **Federation** should only be used when specific business or regulatory requirements exist.
* Modern **Microsoft Entra Certificate-Based Authentication (CBA)** can reduce dependency on AD FS.

---

## 3. Planning and Design

### 3.1 Key Design Decisions

Determine:

* Identity source of authority
* Authentication method
* Forest topology (single forest vs. multi-forest)
* User sign-in experience
* Security requirements
* High availability requirements

### Typical Identity Authority

```text
On-Premises AD DS
        │
        ▼
Microsoft Entra ID
```

---

### 3.2 Authentication Method Selection

#### Choose Password Hash Synchronization (PHS) When:

* Simplicity is preferred.
* Cloud-first strategy is adopted.
* Minimal infrastructure is desired.
* Maximum resilience is required.

#### Choose Pass-through Authentication (PTA) When:

* Password validation must remain on-premises.
* Regulatory or compliance requirements prohibit cloud password hash storage.

#### Choose Federation (AD FS) When:

* Smart card authentication is required.
* Legacy applications require federated authentication.
* Existing federation infrastructure must be retained.

---

### 3.3 Recommended Modern Architecture

Microsoft generally recommends:

```text
AD DS
 │
 ▼
Cloud Sync or Entra Connect
 │
 ▼
Microsoft Entra ID
 │
 ├─ Conditional Access
 ├─ MFA
 ├─ Identity Protection
 └─ Seamless SSO
```

Recommended stack:

* Password Hash Synchronization (PHS)
* Seamless SSO
* Conditional Access
* Multi-Factor Authentication (MFA)
* Identity Protection

Avoid federation unless required.

---

## 4. Prerequisites

### 4.1 On-Premises Requirements

* Active Directory Domain Services (AD DS)
* Supported Windows Server version
* Domain-joined synchronization server or Cloud Sync agents
* Healthy AD replication

### 4.2 Cloud Requirements

* Microsoft Entra ID tenant
* Verified custom domains
* Appropriate licensing

Recommended licenses:

* Microsoft Entra ID P1
* Microsoft Entra ID P2

### 4.3 Network Requirements

* Outbound HTTPS (TCP 443) access
* DNS name resolution
* Reliable internet connectivity

For PHS and PTA:

* No inbound firewall ports are required.

### 4.4 Identity Readiness

Verify:

* Unique User Principal Names (UPNs)
* Valid SMTP addresses
* No duplicate identities
* Proper Organizational Unit (OU) structure
* Consistent naming conventions

---

## 5. Implementation

### 5.1 Synchronization Options

#### Option A: Microsoft Entra Connect Sync

Traditional synchronization solution installed on a Windows Server.

Supports:

* Password Hash Synchronization (PHS)
* Pass-through Authentication (PTA)
* Federation (AD FS)
* Device synchronization
* Hybrid Exchange

Advantages:

* Mature and feature-rich
* Extensive customization options

---

#### Option B: Microsoft Entra Cloud Sync

Modern cloud-managed synchronization solution.

Features:

* Lightweight agents
* Cloud-managed configuration
* Multi-agent high availability
* Multi-forest support
* Simplified deployment

Advantages:

* Easier administration
* Better scalability
* Reduced infrastructure footprint

---

### 5.2 Implementation Steps

1. Assess and clean identity data.
2. Verify domains in Microsoft Entra ID.
3. Deploy Entra Connect Sync or Cloud Sync.
4. Configure synchronization scope.
5. Configure attribute mappings.
6. Select authentication method:

   * PHS
   * PTA
   * Federation
7. Enable Seamless SSO.
8. Validate synchronization.
9. Test pilot users.
10. Roll out to production.

---

### 5.3 Staged Rollout (Recommended)

Benefits:

* Reduced deployment risk
* Easier troubleshooting
* Controlled user experience

Typical approach:

```text
Pilot Users
     │
     ▼
IT Department
     │
     ▼
Business Units
     │
     ▼
Entire Organization
```

---

## 6. Advanced Scenarios

### 6.1 Multi-Forest Environments

Supported through:

* Microsoft Entra Connect Sync
* Microsoft Entra Cloud Sync

Common scenarios:

* Resource forests
* Account forests
* Global enterprise environments

---

### 6.2 Mergers and Acquisitions

Cloud Sync supports:

* Multiple disconnected forests
* Independent synchronization agents
* Gradual identity consolidation

---

### 6.3 Secure Access to On-Premises Applications

Use:

* Microsoft Entra Application Proxy
* Single Sign-On (SSO)
* Conditional Access policies

Benefits:

* No VPN required
* Secure remote access
* Centralized authentication

---

## 7. Operations and Monitoring

### 7.1 Monitoring

Recommended monitoring solution:

* Microsoft Entra Connect Health

Monitor:

* Synchronization status
* Authentication health
* AD FS health (if applicable)
* Agent availability

---

### 7.2 Daily Operations

Routine tasks include:

* Reviewing synchronization errors
* Monitoring failed sign-ins
* Managing identity lifecycle processes
* Verifying agent health
* Reviewing alerts

---

### 7.3 Security Operations

Enable:

* Multi-Factor Authentication (MFA)
* Conditional Access
* Identity Protection
* Privileged Identity Management (PIM)

Monitor:

* Risky users
* Risky sign-ins
* Identity-based attacks
* Suspicious authentication activity

---

### 7.4 High Availability

#### Entra Connect Sync

* Secondary server in Staging Mode
* Backup and recovery procedures

#### PTA

* Multiple PTA agents

#### Cloud Sync

* Multiple Cloud Sync agents

---

## 8. Security Best Practices

### Identity Security

* Enable MFA for all users.
* Implement Conditional Access policies.
* Use Identity Protection.
* Enforce least-privilege access.
* Protect privileged accounts.

### Synchronization Security

* Synchronize only required OUs.
* Exclude service accounts when appropriate.
* Review synchronization scope regularly.

### Authentication Security

* Prefer PHS over Federation.
* Disable legacy authentication protocols.
* Use passwordless authentication where possible.

### Zero Trust Alignment

Follow Zero Trust principles:

* Verify explicitly.
* Use least privilege access.
* Assume breach.

---

## 9. Common Pitfalls

### Identity Issues

* Duplicate UPNs
* Duplicate proxy addresses
* Poor naming standards

### Synchronization Issues

* Synchronizing unnecessary objects
* Incorrect OU filtering
* Poor attribute mapping

### Authentication Issues

* Overcomplicated federation deployments
* Insufficient PTA agent redundancy
* Lack of disaster recovery planning

### Operational Issues

* No pilot testing
* No monitoring strategy
* Lack of change management

---

## 10. Summary

Microsoft Entra ID Hybrid Identity provides:

* Unified identities across on-premises and cloud environments
* Flexible authentication options
* Scalable synchronization capabilities
* Strong security integration
* Improved user experience through SSO

### Recommended Modern Architecture

```text
AD DS
 │
 ▼
Microsoft Entra Cloud Sync
 │
 ▼
Microsoft Entra ID
 │
 ├─ Password Hash Synchronization (PHS)
 ├─ Seamless SSO
 ├─ Conditional Access
 ├─ Multi-Factor Authentication (MFA)
 └─ Identity Protection
```

### Recommended Approach

* Use Password Hash Synchronization (PHS)
* Use Microsoft Entra Cloud Sync for new deployments
* Enable Seamless SSO
* Implement MFA and Conditional Access
* Adopt Zero Trust security principles
* Avoid federation unless a business requirement exists

---

## Additional Resources

Consider documenting:

* Enterprise architecture diagrams
* Deployment checklists
* Disaster recovery procedures
* Security hardening guidance
* Hybrid identity attack paths and mitigations
* Operational runbooks
* Troubleshooting procedures
