# Azure Security Benchmark (ASB) Assessment Template

## Document Information

| Field             | Value                               |
| ----------------- | ----------------------------------- |
| Assessment Name   | Azure Security Benchmark Assessment |
| Organization      |                                     |
| Azure Tenant      |                                     |
| Assessment Date   |                                     |
| Assessor          |                                     |
| Environment       | Production / Non-Production         |
| Benchmark Version | Azure Security Benchmark v3         |
| Review Period     |                                     |

---

# Executive Summary

## Overall Security Score

| Domain                             | Score (%) |
| ---------------------------------- | --------- |
| Network Security                   |           |
| Identity Management                |           |
| Privileged Access                  |           |
| Data Protection                    |           |
| Posture & Vulnerability Management |           |
| Logging & Threat Detection         |           |
| Asset Management                   |           |
| Governance & Strategy              |           |
| Backup & Recovery                  |           |
| Overall Score                      |           |

---

# Assessment Status Legend

| Status                 | Description                   |
| ---------------------- | ----------------------------- |
| ✅ Compliant            | Control fully implemented     |
| ⚠️ Partially Compliant | Control partially implemented |
| ❌ Non-Compliant        | Control not implemented       |
| N/A                    | Not applicable                |

---

# NS - Network Security

## NS-1 Establish Network Segmentation Boundaries

**Security Principle**

Implement network segmentation aligned with enterprise security architecture.

**Assessment**

| Item                                   | Status | Evidence | Comments |
| -------------------------------------- | ------ | -------- | -------- |
| Virtual Networks segmented by workload |        |          |          |
| Production and Non-Production isolated |        |          |          |
| Sensitive workloads isolated           |        |          |          |
| NSGs configured                        |        |          |          |
| Application Security Groups used       |        |          |          |

**Azure Services**

* Virtual Network
* Network Security Groups
* Application Security Groups
* Azure Firewall

---

## NS-2 Secure Cloud Services with Network Controls

| Item                                  | Status | Evidence | Comments |
| ------------------------------------- | ------ | -------- | -------- |
| Private Endpoints deployed            |        |          |          |
| Public Access disabled where possible |        |          |          |
| Storage Accounts protected            |        |          |          |
| SQL Private Link enabled              |        |          |          |
| Key Vault Private Endpoint enabled    |        |          |          |

---

## NS-3 Deploy Firewall at Enterprise Edge

| Item                                   | Status | Evidence | Comments |
| -------------------------------------- | ------ | -------- | -------- |
| Azure Firewall deployed                |        |          |          |
| Hub-and-Spoke architecture implemented |        |          |          |
| UDRs configured                        |        |          |          |
| Egress filtering enabled               |        |          |          |
| Threat intelligence mode enabled       |        |          |          |

---

## NS-4 Deploy IDS/IPS

| Item                                 | Status | Evidence | Comments |
| ------------------------------------ | ------ | -------- | -------- |
| Azure Firewall Premium IDPS enabled  |        |          |          |
| Defender for Endpoint deployed       |        |          |          |
| Security alerts integrated with SIEM |        |          |          |

---

## NS-5 Deploy DDoS Protection

| Item                                   | Status | Evidence | Comments |
| -------------------------------------- | ------ | -------- | -------- |
| DDoS Standard enabled                  |        |          |          |
| Internet-facing applications protected |        |          |          |

---

## NS-6 Deploy Web Application Firewall

| Item                            | Status | Evidence | Comments |
| ------------------------------- | ------ | -------- | -------- |
| Application Gateway WAF enabled |        |          |          |
| Front Door WAF enabled          |        |          |          |
| OWASP rules active              |        |          |          |
| Prevention mode enabled         |        |          |          |

---

# IM - Identity Management

## IM-1 Centralized Identity Management

| Item                                      | Status | Evidence | Comments |
| ----------------------------------------- | ------ | -------- | -------- |
| Entra ID used as authoritative IdP        |        |          |          |
| On-prem AD synchronized securely          |        |          |          |
| Third-party apps integrated with Entra ID |        |          |          |

---

## IM-2 Protect Identity Systems

| Item                           | Status | Evidence | Comments |
| ------------------------------ | ------ | -------- | -------- |
| Identity Secure Score reviewed |        |          |          |
| Legacy authentication blocked  |        |          |          |
| Risk-based policies enabled    |        |          |          |

---

## IM-3 Managed Identities

| Item                          | Status | Evidence | Comments |
| ----------------------------- | ------ | -------- | -------- |
| Managed Identities used       |        |          |          |
| Service Principals reviewed   |        |          |          |
| Credential rotation automated |        |          |          |

---

## IM-6 Strong Authentication

| Item                      | Status | Evidence | Comments |
| ------------------------- | ------ | -------- | -------- |
| MFA enabled for all users |        |          |          |
| MFA enabled for admins    |        |          |          |
| Passwordless enabled      |        |          |          |
| FIDO2 supported           |        |          |          |

---

## IM-7 Conditional Access

| Item                           | Status | Evidence | Comments |
| ------------------------------ | ------ | -------- | -------- |
| Conditional Access implemented |        |          |          |
| Block legacy authentication    |        |          |          |
| Require MFA for admins         |        |          |          |
| Device compliance required     |        |          |          |
| Risk-based policies configured |        |          |          |

---

# PA - Privileged Access

## PA-1 Limit Administrative Accounts

| Item                              | Status | Evidence | Comments |
| --------------------------------- | ------ | -------- | -------- |
| Number of Global Admins minimized |        |          |          |
| Subscription Owners limited       |        |          |          |
| Emergency accounts separated      |        |          |          |

---

## PA-2 Just-In-Time Access

| Item                      | Status | Evidence | Comments |
| ------------------------- | ------ | -------- | -------- |
| PIM enabled               |        |          |          |
| Eligible assignments used |        |          |          |
| JIT VM Access enabled     |        |          |          |

---

## PA-4 Access Reviews

| Item                     | Status | Evidence | Comments |
| ------------------------ | ------ | -------- | -------- |
| Quarterly access reviews |        |          |          |
| Stale accounts removed   |        |          |          |
| Guest accounts reviewed  |        |          |          |

---

## PA-5 Emergency Access Accounts

| Item                       | Status | Evidence | Comments |
| -------------------------- | ------ | -------- | -------- |
| Break-glass accounts exist |        |          |          |
| MFA excluded appropriately |        |          |          |
| Monitoring enabled         |        |          |          |

---

# DP - Data Protection

## DP-1 Data Discovery & Classification

| Item                          | Status | Evidence | Comments |
| ----------------------------- | ------ | -------- | -------- |
| Microsoft Purview deployed    |        |          |          |
| Data classification performed |        |          |          |
| Sensitive data labeled        |        |          |          |

---

## DP-2 Data Threat Monitoring

| Item                           | Status | Evidence | Comments |
| ------------------------------ | ------ | -------- | -------- |
| Defender for Storage enabled   |        |          |          |
| Defender for SQL enabled       |        |          |          |
| Exfiltration monitoring active |        |          |          |

---

## DP-3 Data In Transit Encryption

| Item                             | Status | Evidence | Comments |
| -------------------------------- | ------ | -------- | -------- |
| TLS 1.2+ enforced                |        |          |          |
| HTTPS-only enabled               |        |          |          |
| Secure Transfer Required enabled |        |          |          |

---

## DP-4 Data At Rest Encryption

| Item                       | Status | Evidence | Comments |
| -------------------------- | ------ | -------- | -------- |
| Storage encryption enabled |        |          |          |
| SQL TDE enabled            |        |          |          |
| Disk encryption enabled    |        |          |          |

---

## DP-5 Customer Managed Keys

| Item                           | Status | Evidence | Comments |
| ------------------------------ | ------ | -------- | -------- |
| CMK implemented where required |        |          |          |
| Key rotation documented        |        |          |          |

---

## DP-6 Key Management

| Item                      | Status | Evidence | Comments |
| ------------------------- | ------ | -------- | -------- |
| Azure Key Vault used      |        |          |          |
| Key rotation enabled      |        |          |          |
| Key expiration configured |        |          |          |

---

## DP-8 Key Vault Security

| Item                     | Status | Evidence | Comments |
| ------------------------ | ------ | -------- | -------- |
| Soft Delete enabled      |        |          |          |
| Purge Protection enabled |        |          |          |
| Private Endpoint enabled |        |          |          |
| Logging enabled          |        |          |          |

---

# PV - Posture & Vulnerability Management

## PV-1 Secure Configuration Baselines

| Item                              | Status | Evidence | Comments |
| --------------------------------- | ------ | -------- | -------- |
| Security baselines defined        |        |          |          |
| Azure Policies assigned           |        |          |          |
| Landing Zone controls implemented |        |          |          |

---

## PV-2 Secure Configuration Enforcement

| Item                               | Status | Evidence | Comments |
| ---------------------------------- | ------ | -------- | -------- |
| Azure Policy enforcement enabled   |        |          |          |
| Non-compliant resources remediated |        |          |          |
| Compliance dashboard reviewed      |        |          |          |

---

## PV-3 Compute Security Baselines

| Item                     | Status | Evidence | Comments |
| ------------------------ | ------ | -------- | -------- |
| Windows baseline applied |        |          |          |
| Linux baseline applied   |        |          |          |
| Secure VM templates used |        |          |          |

---

## PV-4 Compute Configuration Monitoring

| Item                        | Status | Evidence | Comments |
| --------------------------- | ------ | -------- | -------- |
| Guest Configuration enabled |        |          |          |
| Secure Boot enabled         |        |          |          |
| vTPM enabled                |        |          |          |
| Attestation enabled         |        |          |          |

---

## PV-5 Vulnerability Assessment

| Item                                      | Status | Evidence | Comments |
| ----------------------------------------- | ------ | -------- | -------- |
| Defender Vulnerability Assessment enabled |        |          |          |
| Container image scanning enabled          |        |          |          |
| SQL Vulnerability Assessment enabled      |        |          |          |
| Remediation tracked                       |        |          |          |

---

# Logging & Monitoring

## Microsoft Defender for Cloud

| Control                 | Status | Evidence | Comments |
| ----------------------- | ------ | -------- | -------- |
| Defender CSPM Enabled   |        |          |          |
| Defender for Servers    |        |          |          |
| Defender for Storage    |        |          |          |
| Defender for SQL        |        |          |          |
| Defender for Containers |        |          |          |
| Defender for Key Vault  |        |          |          |

---

## Microsoft Sentinel

| Control                        | Status | Evidence | Comments |
| ------------------------------ | ------ | -------- | -------- |
| Sentinel Enabled               |        |          |          |
| Data Connectors Configured     |        |          |          |
| Analytics Rules Enabled        |        |          |          |
| Incident Automation Configured |        |          |          |

---

# Compliance Mapping

| Framework                                 | Applicable  |
| ----------------------------------------- | ----------- |
| Azure Security Benchmark v3               | Yes         |
| CIS Microsoft Azure Foundations Benchmark | Yes         |
| NIST CSF 2.0                              | Yes         |
| NIST SP 800-53                            | Yes         |
| ISO 27001:2022                            | Yes         |
| SOC 2                                     | Yes         |
| PCI DSS                                   | As Required |
| HIPAA                                     | As Required |

---

# Findings Register

| Finding ID | ASB Control | Severity | Description | Remediation | Owner | Due Date | Status |
| ---------- | ----------- | -------- | ----------- | ----------- | ----- | -------- | ------ |
|            |             | Critical |             |             |       |          |        |
|            |             | High     |             |             |       |          |        |
|            |             | Medium   |             |             |       |          |        |
|            |             | Low      |             |             |       |          |        |

---

# Sign-Off

| Role                   | Name | Signature | Date |
| ---------------------- | ---- | --------- | ---- |
| Security Assessor      |      |           |      |
| Azure Platform Owner   |      |           |      |
| Cloud Security Manager |      |           |      |
| CISO                   |      |           |      |

---
