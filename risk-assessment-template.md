# Azure Cyber Risk Assessment Template

## Document Information

| Field              | Value                       |
| ------------------ | --------------------------- |
| Assessment Name    | Azure Cyber Risk Assessment |
| Organization       |                             |
| Azure Tenant ID    |                             |
| Assessment Date    |                             |
| Assessor(s)        |                             |
| Scope              |                             |
| Environment        | Production / Non-Production |
| Assessment Version | 1.0                         |

---

# Executive Summary

## Assessment Scope

Describe the Azure environment assessed:

* Azure Subscriptions:
* Management Groups:
* Entra ID Tenant:
* Resource Groups:
* Critical Applications:
* Business Units:

## Key Findings

| Severity | Count |
| -------- | ----- |
| Critical |       |
| High     |       |
| Medium   |       |
| Low      |       |

## Overall Risk Rating

| Risk Level | Assessment |
| ---------- | ---------- |
| Critical   | ☐          |
| High       | ☐          |
| Medium     | ☐          |
| Low        | ☐          |

## Major Risks Identified

1.
2.
3.
4.
5.

---

# Risk Scoring Methodology

## Likelihood Scale

| Score | Description    |
| ----- | -------------- |
| 1     | Rare           |
| 2     | Unlikely       |
| 3     | Possible       |
| 4     | Likely         |
| 5     | Almost Certain |

## Impact Scale

| Score | Description         |
| ----- | ------------------- |
| 1     | Negligible          |
| 2     | Minor               |
| 3     | Moderate            |
| 4     | Major               |
| 5     | Severe/Catastrophic |

## Risk Score

```text
Risk Score = Likelihood × Impact
```

| Score Range | Severity |
| ----------- | -------- |
| 1–4         | Low      |
| 5–9         | Medium   |
| 10–16       | High     |
| 17–25       | Critical |

---

# Azure Risk Register

| Control ID | Domain            | Control Description                   | Asset Name      | Subscription | Resource Group  | Risk Category       | Likelihood (1-5) | Impact (1-5) | Risk Score (L×I) | Severity | Compliance Mapping (CIS/NIST/ISO) | Evidence                | Current Status | Owner        | Target Remediation Date | Comments                 |
| ---------- | ----------------- | ------------------------------------- | --------------- | ------------ | --------------- | ------------------- | ---------------- | ------------ | ---------------- | -------- | --------------------------------- | ----------------------- | -------------- | ------------ | ----------------------- | ------------------------ |
| AZ-IAM-001 | Identity & Access | MFA not enforced for all users        | Entra ID Tenant | Prod-Sub     | N/A             | Identity Compromise | 4                | 5            | 20               | Critical | CIS 1.1 / NIST IA-2               | Screenshot of CA policy | Open           | IAM Team     | 2026-03-30              | High priority            |
| AZ-NET-002 | Network Security  | NSG allows 0.0.0.0/0 on port 3389     | VM-Prod-01      | Prod-Sub     | RG-Prod-Compute | External Exposure   | 5                | 5            | 25               | Critical | CIS 5.2 / NIST SC-7               | NSG rule export         | Open           | Cloud Ops    | 2026-03-15              | Immediate fix required   |
| AZ-STO-003 | Data Security     | Storage account public access enabled | stproddata01    | Prod-Sub     | RG-Prod-Data    | Data Exposure       | 4                | 5            | 20               | High     | CIS 3.1 / NIST AC-3               | Storage config export   | In Progress    | Storage Team | 2026-04-10              | Private endpoint planned |
|            |                   |                                       |                 |              |                 |                     |                  |              |                  |          |                                   |                         |                |              |                         |                          |

---

# Azure Security Control Assessment

## Governance

| Control ID | Domain     | Control Description                    | Implemented (Yes/No) | Evidence | Remarks |
| ---------- | ---------- | -------------------------------------- | -------------------- | -------- | ------- |
| AZ-GOV-001 | Governance | Management group hierarchy defined     |                      |          |         |
| AZ-GOV-002 | Governance | Azure landing zone implemented         |                      |          |         |
| AZ-GOV-003 | Governance | Resource tagging strategy enforced     |                      |          |         |
| AZ-GOV-004 | Governance | Azure Policy assignments configured    |                      |          |         |
| AZ-GOV-005 | Governance | Cost governance and budgets configured |                      |          |         |

---

## Identity & Access Management

| Control ID | Domain            | Control Description                    | Implemented (Yes/No) | Evidence | Remarks |
| ---------- | ----------------- | -------------------------------------- | -------------------- | -------- | ------- |
| AZ-IAM-001 | Identity & Access | MFA enforced for all users             |                      |          |         |
| AZ-IAM-002 | Identity & Access | Conditional Access policies configured |                      |          |         |
| AZ-IAM-003 | Identity & Access | Legacy authentication blocked          |                      |          |         |
| AZ-IAM-004 | Identity & Access | Passwordless authentication enabled    |                      |          |         |
| AZ-IAM-005 | Identity & Access | Break-glass accounts configured        |                      |          |         |
| AZ-IAM-006 | Identity & Access | Service principals reviewed regularly  |                      |          |         |
| AZ-IAM-007 | Identity & Access | Managed identities used where possible |                      |          |         |
| AZ-IAM-008 | Identity & Access | Access reviews implemented             |                      |          |         |
| AZ-IAM-009 | Identity & Access | RBAC follows least privilege           |                      |          |         |
| AZ-IAM-010 | Identity & Access | PIM enabled for privileged roles       |                      |          |         |

---

## Network Security

| Control ID | Domain           | Control Description                          | Implemented (Yes/No) | Evidence | Remarks |
| ---------- | ---------------- | -------------------------------------------- | -------------------- | -------- | ------- |
| AZ-NET-001 | Network Security | Network segmentation implemented             |                      |          |         |
| AZ-NET-002 | Network Security | NSGs configured securely                     |                      |          |         |
| AZ-NET-003 | Network Security | Azure Firewall deployed                      |                      |          |         |
| AZ-NET-004 | Network Security | DDoS Protection enabled                      |                      |          |         |
| AZ-NET-005 | Network Security | Private endpoints used for PaaS services     |                      |          |         |
| AZ-NET-006 | Network Security | Public IP exposure minimized                 |                      |          |         |
| AZ-NET-007 | Network Security | WAF enabled for internet-facing applications |                      |          |         |
| AZ-NET-008 | Network Security | JIT VM access enabled                        |                      |          |         |
| AZ-NET-009 | Network Security | Bastion used for administrative access       |                      |          |         |
| AZ-NET-010 | Network Security | ExpressRoute/VPN security reviewed           |                      |          |         |
| AZ-NET-015 | Network Security | Azure Firewall deployed                      |                      |          |         |

---

## Compute Security

| Control ID | Domain  | Control Description                 | Implemented (Yes/No) | Evidence | Remarks |
| ---------- | ------- | ----------------------------------- | -------------------- | -------- | ------- |
| AZ-CMP-001 | Compute | Endpoint protection installed       |                      |          |         |
| AZ-CMP-002 | Compute | Security patches current            |                      |          |         |
| AZ-CMP-003 | Compute | Secure baseline applied             |                      |          |         |
| AZ-CMP-004 | Compute | Defender for Servers enabled        |                      |          |         |
| AZ-CMP-005 | Compute | Disk encryption enabled for all VMs |                      |          |         |
| AZ-CMP-006 | Compute | VM backups configured               |                      |          |         |
| AZ-CMP-007 | Compute | Unused VMs identified and removed   |                      |          |         |

---

## Storage & Data Security

| Control ID | Domain        | Control Description               | Implemented (Yes/No) | Evidence | Remarks |
| ---------- | ------------- | --------------------------------- | -------------------- | -------- | ------- |
| AZ-STO-001 | Data Security | Public blob access disabled       |                      |          |         |
| AZ-STO-002 | Data Security | Private endpoints configured      |                      |          |         |
| AZ-STO-003 | Data Security | Storage encryption enabled        |                      |          |         |
| AZ-STO-004 | Data Security | Customer-managed keys implemented |                      |          |         |
| AZ-STO-005 | Data Security | Soft delete enabled               |                      |          |         |
| AZ-STO-006 | Data Security | Storage firewall configured       |                      |          |         |

---

## Monitoring & Detection

| Control ID | Domain     | Control Description         | Implemented (Yes/No) | Evidence | Remarks |
| ---------- | ---------- | --------------------------- | -------------------- | -------- | ------- |
| AZ-LOG-001 | Monitoring | Activity Logs retained      |                      |          |         |
| AZ-LOG-002 | Monitoring | Defender for Cloud enabled  |                      |          |         |
| AZ-LOG-003 | Monitoring | Log Analytics configured    |                      |          |         |
| AZ-LOG-004 | Monitoring | Sentinel deployed           |                      |          |         |
| AZ-LOG-005 | Monitoring | Security alerts monitored   |                      |          |         |
| AZ-LOG-006 | Monitoring | Diagnostic settings enabled |                      |          |         |

---

## Key Management

| Control ID | Domain         | Control Description                 | Implemented (Yes/No) | Evidence | Remarks |
| ---------- | -------------- | ----------------------------------- | -------------------- | -------- | ------- |
| AZ-KV-001  | Key Management | Azure Key Vault implemented         |                      |          |         |
| AZ-KV-002  | Key Management | Secrets rotated regularly           |                      |          |         |
| AZ-KV-003  | Key Management | RBAC enabled on Key Vault           |                      |          |         |
| AZ-KV-004  | Key Management | HSM-backed keys used where required |                      |          |         |

---

## Backup & Disaster Recovery

| Control ID | Domain     | Control Description                 | Implemented (Yes/No) | Evidence | Remarks |
| ---------- | ---------- | ----------------------------------- | -------------------- | -------- | ------- |
| AZ-BDR-001 | Resilience | Backup policies configured          |                      |          |         |
| AZ-BDR-002 | Resilience | Backup testing performed            |                      |          |         |
| AZ-BDR-003 | Resilience | Geo-redundancy enabled              |                      |          |         |
| AZ-BDR-004 | Resilience | Disaster recovery plan documented   |                      |          |         |
| AZ-BDR-005 | Resilience | Recovery testing performed annually |                      |          |         |

---

# Remediation Tracking

| Finding ID | Risk Description | Remediation Action | Owner | Status | Due Date | Completion Date |
| ---------- | ---------------- | ------------------ | ----- | ------ | -------- | --------------- |
|            |                  |                    |       |        |          |                 |
|            |                  |                    |       |        |          |                 |
|            |                  |                    |       |        |          |                 |

---

# Compliance Mapping Reference

## CIS Microsoft Azure Foundations Benchmark

* Identity and Access Management
* Logging and Monitoring
* Networking
* Storage
* Compute
* Security Center / Defender for Cloud

## NIST Cybersecurity Framework

* Identify
* Protect
* Detect
* Respond
* Recover

## ISO 27001

* A.5 Organizational Controls
* A.6 People Controls
* A.8 Technological Controls

---

# Sign-Off

| Role                   | Name | Signature | Date |
| ---------------------- | ---- | --------- | ---- |
| Assessor               |      |           |      |
| Cloud Security Manager |      |           |      |
| Azure Platform Owner   |      |           |      |
| CISO                   |      |           |      |
