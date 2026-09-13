**Audit & Evidence Collection Guide – Vulnerability Management**

**Document Type:** Audit Support & Evidence Standard\
**Domain:** Vulnerability Management / GRC / Audit\
**Version:** 1.0\
**Owner:** CISO Office / Governance, Risk & Compliance (GRC)\
**Effective Date:** \[Insert Date\]

**1. Purpose**

This document defines the standardized approach for **collecting,
maintaining, and presenting audit evidence** for the Vulnerability
Management (VM) program to ensure compliance with regulatory and
industry standards.

**2. Scope**

This guide applies to:

- Infrastructure vulnerability management

- Cloud and container environments

- Application vulnerability management (where applicable)

- All business units and asset owners

**3. Objectives**

- Ensure audit readiness at all times

- Standardize evidence collection and storage

- Provide traceability between controls and evidence

- Reduce audit preparation effort and time

**4. Compliance Alignment**

This guide supports audit requirements for:

- NIST

- ISO 27001

- PCI Security Standards Council PCI DSS

**5. Evidence Categories**

| **Category**         | **Description**                       |
|----------------------|---------------------------------------|
| Detection Evidence   | Proof of vulnerability identification |
| Tracking Evidence    | Proof of ticketing and ownership      |
| Remediation Evidence | Proof of vulnerability resolution     |
| Validation Evidence  | Proof of successful closure           |
| Governance Evidence  | Policies, standards, and procedures   |

**6. Evidence Collection Requirements**

**6.1 Scan Reports**

**Purpose**

Demonstrate that **regular vulnerability scanning is performed** and
vulnerabilities are identified.

**Evidence to Collect**

- Full scan reports (authenticated and unauthenticated)

- Scan schedules and frequency records

- Scan configurations (policies, credentials)

- Coverage reports (assets scanned vs total assets)

**Required Attributes**

- Scan date and time

- Scanner name (e.g., Qualys, Tenable, Defender VM)

- Asset scope

- Vulnerability severity breakdown

- Scan type (internal/external)

**Frequency**

- Weekly (critical systems)

- Monthly (full enterprise scan)

**Storage Location**

- Centralized repository (e.g., SharePoint / GRC tool)

**6.2 Tickets (Tracking Evidence)**

**Purpose**

Demonstrate that vulnerabilities are **tracked, assigned, and managed
through remediation lifecycle**.

**Evidence to Collect**

- ITSM tickets (e.g., ServiceNow, Jira)

- Ticket creation timestamps

- Assigned owner details

- SLA tracking data

- Status updates and closure records

**Required Attributes**

- Vulnerability ID (CVE)

- Asset owner

- Severity level

- SLA deadline

- Current status (Open/In Progress/Closed)

**Frequency**

- Continuous (real-time updates)

**Validation**

- Ticket must map to corresponding vulnerability

- SLA compliance must be verifiable

**6.3 Remediation Proof**

**Purpose**

Demonstrate that vulnerabilities have been **effectively remediated**.

**Evidence to Collect**

- Patch deployment logs

- Configuration change records

- System screenshots (before/after)

- Command outputs (e.g., version updates)

- Change management records

**Required Attributes**

- Patch version applied

- Date of remediation

- System affected

- Change approval reference

**Validation**

- Must align with ticket closure

- Must be verified via re-scan

**6.4 Validation Evidence (Re-Scan)**

**Purpose**

Demonstrate that vulnerabilities are **no longer present after
remediation**.

**Evidence to Collect**

- Re-scan reports showing vulnerability closure

- Delta reports (before vs after remediation)

**Required Attributes**

- Scan ID

- Asset details

- Vulnerability status (closed/resolved)

**7. Evidence Mapping to Controls**

| **Control Area**        | **Evidence Type** | **Example**             |
|-------------------------|-------------------|-------------------------|
| Vulnerability Detection | Scan Reports      | Weekly scan report      |
| Tracking                | Tickets           | ServiceNow ticket       |
| Remediation             | Patch Logs        | Patch deployment report |
| Validation              | Re-scan Reports   | Closure confirmation    |
| Governance              | Policies          | VM Policy document      |

**8. Evidence Storage & Retention**

**8.1 Storage Requirements**

- Centralized repository

- Role-based access control

- Version control enabled

**8.2 Retention Policy**

| **Evidence Type** | **Retention Period** |
|-------------------|----------------------|
| Scan Reports      | ≥ 1 year             |
| Tickets           | ≥ 1 year             |
| Remediation Proof | ≥ 1 year             |
| Audit Reports     | ≥ 3 years            |

**9. Audit Readiness Checklist**

**9.1 Pre-Audit Preparation**

- VM Policy and SOPs are approved and updated

- Latest scan reports available

- Sample tickets mapped to vulnerabilities

- Remediation proof documented

- Re-scan validation available

- SLA compliance reports generated

**9.2 During Audit**

- Provide requested evidence within SLA

- Demonstrate end-to-end lifecycle:\
  Detection → Ticket → Remediation → Validation

- Show control mapping alignment

- Answer auditor queries with documented proof

**9.3 Post-Audit**

- Address audit findings

- Update controls and processes

- Improve evidence collection gaps

**10. Roles & Responsibilities**

| **Role**      | **Responsibility**                      |
|---------------|-----------------------------------------|
| GRC Team      | Audit coordination, evidence validation |
| VM Team       | Scan reports, vulnerability data        |
| IT Operations | Remediation proof                       |
| SOC Team      | Detection and monitoring evidence       |
| Asset Owners  | System-level validation                 |

**11. Automation & Tooling**

- Automated evidence collection via APIs

- Integration with GRC tools (ServiceNow GRC, Archer)

- SIEM integration for detection logs

- Dashboard for audit readiness tracking

**12. Common Audit Findings & Mitigation**

| **Finding**                | **Mitigation**                  |
|----------------------------|---------------------------------|
| Missing scan coverage      | Improve asset inventory         |
| No remediation proof       | Enforce documentation standards |
| SLA breaches               | Strengthen patching process     |
| Lack of re-scan validation | Automate validation scans       |

**13. Governance**

- Reviewed annually or upon regulatory updates

- Approved by CISO and Audit Committee

- Maintained by GRC function

**14. Continuous Improvement**

- Enhance automation of evidence collection

- Improve data quality and traceability

- Align with new compliance requirements

**15. Appendices**

**Appendix A – Evidence Collection Templates**

**Appendix B – Sample Audit Requests & Responses**

**Appendix C – Evidence Repository Structure**

**End of Document**
