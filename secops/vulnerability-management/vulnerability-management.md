# Enterprise Vulnerability Management Framework

**Version:** 1.0  
**Document Owner:** Security Engineering / CISO Office  
**Document Type:** Enterprise Security Standard  
**Status:** Approved  
**Review Cycle:** Annual

---

# 1. Purpose

This document establishes the organization's enterprise Vulnerability Management (VM) framework for identifying, assessing, prioritizing, remediating, validating, and reporting security vulnerabilities across the enterprise.

The framework provides a consistent, risk-based approach that:

- Reduces organizational attack surface
- Protects critical business assets
- Improves cyber resilience
- Supports regulatory and audit compliance
- Enables continuous security improvement

---

# 2. Scope

This framework applies to:

- On-premises infrastructure
- Cloud environments (Azure, AWS, GCP)
- Servers
- Endpoints
- Network devices
- Web applications
- APIs
- Databases
- Containers and Kubernetes
- DevSecOps pipelines
- SaaS platforms
- Operational Technology (where applicable)

---

# 3. Objectives

The Vulnerability Management Program aims to:

- Discover vulnerabilities continuously
- Prioritize remediation based on business risk
- Reduce Mean Time to Remediate (MTTR)
- Achieve comprehensive asset visibility
- Integrate vulnerability management into security operations
- Automate remediation wherever practical
- Provide measurable security metrics

---

# 4. Guiding Principles

The program shall be:

- Risk-based
- Threat-informed
- Automated
- Continuously monitored
- Business aligned
- Audit ready

---

# 5. Roles and Responsibilities

| Role | Responsibilities |
|-------|------------------|
| CISO | Owns VM program, approves policy, reviews enterprise risk |
| Security Engineering | Tool administration, architecture, integrations |
| SOC | Monitor scans, triage findings, zero-day response |
| IT Operations | Infrastructure remediation and patching |
| DevSecOps | Application remediation, SAST/DAST integration |
| Asset Owners | Remediate vulnerabilities within SLA |
| Risk & Compliance | Exception management, audits, governance |

---

# 6. Vulnerability Management Lifecycle

```text
Asset Discovery
        │
        ▼
Asset Inventory (CMDB)
        │
        ▼
Continuous Vulnerability Scanning
        │
        ▼
Risk Assessment
(CVSS + Asset Criticality + Threat Intelligence + Exposure)
        │
        ▼
Prioritization
        │
        ▼
Ticket Creation
        │
        ▼
Remediation
        │
        ▼
Validation Scan
        │
        ▼
Closure
        │
        ▼
Reporting & Metrics
```

---

# 7. Asset Discovery

Assets shall be automatically discovered from:

- CMDB
- Active Directory / Entra ID
- Cloud APIs
- Endpoint management platforms
- Vulnerability scanners
- Network discovery

All discovered assets must have:

- Owner
- Business unit
- Criticality
- Environment
- Location
- Classification

---

# 8. Vulnerability Discovery

Sources include:

- Infrastructure vulnerability scanning
- Authenticated scanning
- External attack surface scanning
- Web application scanning
- SAST
- DAST
- Software Composition Analysis (SCA)
- Container image scanning
- Kubernetes security assessment
- Cloud security posture management
- Threat intelligence
- Vendor advisories
- Penetration testing
- Bug bounty reports

---

# 9. Risk-Based Prioritization

Risk shall be determined using multiple factors:

- CVSS Base Score
- EPSS
- Known Exploited Vulnerability (KEV)
- Threat Intelligence
- Asset Criticality
- Internet Exposure
- Business Impact
- Data Sensitivity

## Risk Classification

| Severity | Criteria |
|----------|----------|
| Critical | CVSS ≥ 9.0, KEV, actively exploited, crown jewel asset |
| High | CVSS 7.0–8.9 |
| Medium | CVSS 4.0–6.9 |
| Low | CVSS <4.0 |

---

# 10. Vulnerability Scanning Standard

## Authenticated Scanning

Preferred for:

- Servers
- Endpoints
- Databases

Requirements:

- Least privilege accounts
- Secure credential storage
- Credential rotation
- Patch verification
- Configuration assessment

Target:

- ≥95% authenticated coverage

---

## Unauthenticated Scanning

Used for:

- Internet-facing assets
- DMZ
- External attack surface

Objectives:

- Identify exposed services
- Detect shadow IT
- Simulate attacker visibility

---

# 11. Scan Frequency

| Asset | Frequency |
|--------|-----------|
| Internet-facing systems | Weekly |
| Internal servers | Monthly |
| Endpoints | Continuous (agent-based) |
| Network devices | Monthly |
| Web applications | Weekly or after major release |
| APIs | Monthly / Deployment |
| Containers | Every build |
| Kubernetes | Continuous |
| Cloud workloads | Continuous |

Additional scans shall occur following:

- Zero-day vulnerabilities
- Major infrastructure changes
- Security incidents
- New asset onboarding

---

# 12. Remediation SLAs

| Severity | SLA |
|----------|-----|
| Critical | ≤7 days |
| High | ≤15 days |
| Medium | ≤30 days |
| Low | ≤90 days |

SLA begins upon validated detection.

---

# 13. Exception Management

Exceptions require:

- Business justification
- Risk assessment
- Compensating controls
- Expiration date
- Formal approval

Approval authority:

| Severity | Approver |
|----------|----------|
| Low | IT Manager |
| Medium | IT Manager |
| High | Security Management |
| Critical | CISO |

---

# 14. Integration Architecture

## Core Components

- Vulnerability Scanner
- Central VM Platform
- CMDB
- SIEM
- SOAR
- Patch Management
- ITSM
- EDR
- Threat Intelligence

---

## Data Flow

```text
Scanner
   │
   ▼
VM Platform
   │
   ├────────► SIEM
   │              │
   │              ▼
   │          SOAR
   │              │
   │              ▼
   │     Automated Response
   │
   ├────────► Patch Management
   │
   ├────────► ITSM
   │
   ├────────► CMDB
   │
   └────────► Dashboards
```

---

# 15. Automation

Automated workflows include:

- Ticket creation
- Risk enrichment
- Patch deployment
- Notification
- Validation scans
- Ticket closure
- Executive alerts

---

# 16. Operational Procedures

## Weekly Activities

- Execute scheduled scans
- Validate failed scans
- Review Critical findings
- Review SLA compliance

## Monthly Activities

- Coverage review
- Credential validation
- Tool health review
- Exception review

## Quarterly Activities

- Program review
- Architecture assessment
- Metrics review
- Strategy update

---

# 17. Zero-Day Response

When a critical vulnerability is disclosed:

1. Validate advisory
2. Identify affected assets
3. Launch emergency scan
4. Prioritize findings
5. Notify stakeholders
6. Apply mitigations
7. Deploy patches
8. Validate remediation
9. Report status

---

# 18. Re-Scan Validation

Every remediation must be validated.

Possible outcomes:

| Result | Action |
|----------|---------|
| Fixed | Close ticket |
| Still vulnerable | Reopen |
| Partial fix | Continue remediation |

---

# 19. Reporting & Metrics

## Operational Metrics

- Open vulnerabilities
- New vulnerabilities
- Closed vulnerabilities
- MTTR
- SLA compliance
- Aging
- Patch compliance
- Reopened findings

---

## Executive Metrics

- Enterprise Exposure Score
- Secure Score
- Risk reduction trend
- Critical vulnerability trend
- Internet-facing exposure
- Asset coverage
- Business unit comparison

---

# 20. Microsoft Defender Vulnerability Management Metrics

Microsoft Defender Vulnerability Management provides several key indicators to measure organizational security posture.

## Exposure Score

Measures the organization's current exposure to vulnerabilities.

- Lower score indicates lower risk.
- Used to prioritize remediation efforts.

## Secure Score

Measures the organization's security configuration posture.

Categories include:

- Operating System
- Applications
- Network
- Accounts
- Security Controls

Higher scores indicate stronger security posture.

## Exposure Distribution

Assets are categorized as:

- High Risk
- Medium Risk
- Low Risk

This enables prioritization of remediation activities.

## Security Recommendations

Microsoft Defender provides prioritized remediation guidance, including:

- Missing security updates
- Misconfigurations
- Weak security controls
- Vulnerable software
- Recommended hardening actions

---

# 21. Key Performance Indicators (KPIs)

| KPI | Target |
|------|--------|
| Asset Coverage | ≥98% |
| Authenticated Scan Coverage | ≥95% |
| Critical SLA Compliance | ≥95% |
| Overall SLA Compliance | ≥90% |
| Critical MTTR | ≤7 days |
| High MTTR | ≤15 days |
| Medium MTTR | ≤30 days |

---

# 22. Governance

The Vulnerability Management Program shall be reviewed:

- Weekly by Security Operations
- Monthly by Security Leadership
- Quarterly by Executive Management
- Annually by Governance Board

---

# 23. Compliance Mapping

This framework supports:

- ISO/IEC 27001
- NIST Cybersecurity Framework
- NIST SP 800-53 (RA-5, SI-2)
- CIS Controls
- PCI DSS v4.0
- Microsoft Security Best Practices

---

# 24. Continuous Improvement

The organization shall continuously improve the program by:

- Integrating new threat intelligence
- Expanding automation
- Improving asset visibility
- Reducing remediation times
- Reviewing lessons learned
- Measuring KPI trends
- Performing annual maturity assessments

---

# 25. Document Control

| Version | Owner | Review |
|----------|-------|--------|
| 1.0 | Security Engineering / CISO | Annual |

---

# Vulnerability management

 For an Azure VM vulnerability—whether in OS configuration or installed software—a mature remediation approach follows a detect → contain → fix → validate → prevent recurrence cycle.

Below is a practical enterprise-grade incident response + remediation flow aligned to Microsoft Defender for Cloud, Azure security operations, and regulated environments.

1. Confirm & Triage the Vulnerability
Actions

Validate alert in:

Microsoft Defender for Cloud

Defender for Endpoint

Qualys / Nessus / Rapid7 (if integrated)

Identify:

CVE ID and severity (CVSS)

Affected VM(s)

Exploitability and active exploitation

Public exposure (Internet-facing?)

Business criticality

Decisions

Tier-1 / Internet-facing / exploited → emergency patch

Internal / low risk → scheduled remediation window

2. Contain Risk Immediately (If Needed)
If the vulnerability is high-risk or actively exploited:

Network Controls

Apply NSG rules to block inbound traffic

Restrict source IPs

Enable / tighten Azure Firewall or WAF

Remove public IP if possible

Move VM behind Load Balancer / Private Endpoint

Host Controls

Isolate via Microsoft Defender for Endpoint

Stop vulnerable service

Disable affected ports

Snapshot disk for forensics if compromised

Identity

Rotate credentials / keys / certificates

Review VM Managed Identity permissions

Audit recent sign-ins and commands

3. Remediate the Vulnerability
A) OS / Configuration Issues
Examples: weak SSH config, open RDP, insecure TLS, missing hardening.

Fix

Apply security baseline:

Azure Policy Guest Configuration

CIS benchmark via Defender for Cloud

Harden:

Disable password login, enforce SSH keys

Restrict RDP via Just-in-Time (JIT)

Enable TLS 1.2+

Remove unused accounts/services

Update local firewall rules

Enforce disk encryption (Azure Disk Encryption or SSE)

B) Software / CVE Patching
Fix

Patch via:

Azure Update Manager

OS package manager (apt/yum/dnf)

SCCM / WSUS

Upgrade vulnerable application versions

Remove unused software

Rebuild VM from hardened image if drifted heavily

C) Platform Controls
Enable:

Microsoft Defender for Cloud workload protections

Defender for Endpoint on VM

Turn on:

Vulnerability Assessment extensions

Endpoint protection

Apply latest VM extensions

4. Validate the Fix
Verification

Rescan VM with Defender for Cloud

Re-run vulnerability scanner

Confirm CVE closed

Check service health

Review logs:

Syslog / Windows Event Logs

Sign-in logs

Network flow logs

Document

Incident ticket

Root cause

Timeline

Resolution

Lessons learned

5. Prevent Recurrence (Most Important)
Governance & Automation
Azure Policy:

Deny public IPs

Require Defender plans

Require disk encryption

Require vulnerability scanning

Enforce NSG baselines

Use Initiative (policy sets)

Secure Build Pipeline
Golden images in Azure Image Gallery

CIS-hardened base OS

Pre-patched images

IaC scanning:

Terraform + tfsec / Checkov

ARM/Bicep validation

CI/CD security gates

Continuous Protection
Enable:

Just-in-Time VM access

Update Manager schedules

Auto OS patching

Centralize logs to Sentinel

Create detection rules for exploitation attempts

Access Hardening
Use Azure Bastion instead of public RDP/SSH

Enforce MFA on admins

Use Privileged Identity Management (PIM)

Remove standing admin rights

6. Enterprise-Style Summary Flow
Detect → Isolate → Patch → Harden → Validate → Govern → Automate

Here is a concise, one-page SOC runbook for responding to vulnerabilities on Azure VMs—optimized for Tier-1/Tier-2 enterprise environments and SOC operations.

SOC RUNBOOK — Azure VM Vulnerability Response
1. Trigger Events
Initiate this runbook when any of the following occur:

Defender for Cloud vulnerability alert

Defender for Endpoint exploit detection

Sentinel analytics rule fires

Third-party scanner alert (Qualys/Nessus)

Threat intel indicates active exploitation

Public-facing VM exposure discovered

2. Initial Triage (≤ 15 Minutes)
Collect

VM name / resource group / subscription

IP exposure (public/private)

OS and version

CVE ID + CVSS score

Affected service/process

Exploit activity present? (Y/N)

Workload tier (Tier-1 / Tier-2 / Tier-3)

Classify Severity

Critical – exploited OR Internet-facing Tier-1

High – exploitable, no active attack

Medium/Low – internal, compensating controls

Open Incident Ticket

Assign owner

Link alert IDs

Start timeline

3. Immediate Containment (If Critical/High)
Network

Remove public IP or restrict NSG

Block vulnerable ports

Enable WAF / Firewall rules

Enable JIT access

Host

Stop vulnerable service

Isolate VM via Defender for Endpoint

Take disk snapshot (forensics)

Identity

Rotate credentials/keys

Review managed identity permissions

Check recent sign-ins

4. Remediation Actions
OS / Configuration
Apply CIS baseline via Defender for Cloud

Enforce SSH key auth / disable weak ciphers

Restrict RDP

Enable disk encryption

Remove unused users/services

Software / CVE
Patch via Update Manager / package manager

Upgrade application

Remove vulnerable components

Reboot if required

Rebuild from golden image if drifted

Platform Security
Enable Defender for Endpoint

Enable Defender for Cloud plans

Install vulnerability assessment extension

Enable diagnostic logging

5. Validation & Closure
Confirm

Rescan VM

CVE resolved

No new exploit alerts

Service healthy

Evidence

Screenshots of remediation

Scan results

Patch IDs

Update Ticket

Root cause

Fix applied

Time to remediate

Preventive control added

6. Post-Incident Prevention
Governance

Azure Policy: deny public IP, require Defender

Enforce NSG baselines

Require encryption

Automation

Golden images

Auto-patch schedules

IaC scanning

Access

Bastion + MFA

PIM roles

Remove standing admin

Detection

Sentinel rule tuning

Exploit hunting queries

7. Escalation Matrix
Severity	Escalate To	SLA
Critical	IR Team + Cloud Sec + App Owner	Immediate
High	Cloud Sec	4 hrs
Medium	Ops	48 hrs
Low	Patch Cycle	Next window
8. Quick Command Checklist
☐ Public IP removed

☐ NSG tightened

☐ VM isolated

☐ Snapshot taken

☐ Patch applied

☐ Reboot done

☐ Rescan clean

☐ Policy added

