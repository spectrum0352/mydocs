**1. Purpose**

This document defines the **end-to-end data flow** of the Vulnerability
Management lifecycle, from vulnerability discovery to remediation and
closure.

It ensures:

- Clear visibility of data movement across systems

- Secure handling of sensitive information (including PII)

- Alignment with compliance and data protection requirements

**2. High-Level Data Flow Overview**

The Vulnerability Management lifecycle follows a structured flow:

**Scan → Findings → Risk Scoring → Ticketing → Remediation → Closure**

**3. Logical Data Flow Diagram (Textual Representation)**

\[Assets / Systems\]

│

▼

\[Vulnerability Scanners / Agents\]

│

▼

\[Raw Scan Data / Findings Repository\]

│

▼

\[Risk Scoring Engine\]

(CVSS + EPSS + Threat Intel + Asset Context)

│

▼

\[Central Vulnerability Management Platform\]

│

├──────────────► \[SIEM (Microsoft Sentinel)\]

│ │

│ ▼

│ \[Security Correlation / Alerts\]

│

▼

\[Ticketing System (ServiceNow)\]

│

▼

\[IT Ops / DevSecOps Remediation\]

│

▼

\[Re-Scan / Validation\]

│

▼

\[Closure & Reporting\]

**4. Detailed Data Flow Stages**

**4.1 Stage 1: Vulnerability Scanning**

**Sources:**

- Network scanners

- Endpoint agents

- Cloud security tools

- Application scanners

**Data Collected:**

- Asset identifiers (IP, hostname, resource ID)

- OS and software versions

- Detected vulnerabilities (CVEs)

- Configuration weaknesses

**4.2 Stage 2: Findings Aggregation**

**Destination:** Central Vulnerability Management Platform

**Processing:**

- Deduplication of findings

- Normalization of vulnerability data

- Mapping to assets (via CMDB)

**4.3 Stage 3: Risk Scoring**

**Inputs:**

- CVSS scores

- EPSS scores

- Threat intelligence feeds

- Asset criticality (from CMDB)

- Exposure level (internet/internal)

**Output:**

- Composite Risk Score

- Risk tier (Critical, High, Medium, Low)

**4.4 Stage 4: Integration & Correlation**

**SIEM Integration**

Platform Example: Microsoft Sentinel

**Data Sent:**

- Vulnerability details

- Asset risk context

**Purpose:**

- Correlate vulnerabilities with active threats

- Prioritize alerts and incidents

**4.5 Stage 5: Ticket Creation**

**Ticketing Platform**

Example: ServiceNow

**Data Sent:**

- Vulnerability details

- Asset owner

- SLA timelines

- Remediation guidance

**Processing:**

- Auto-assignment to responsible teams

- SLA tracking

- Workflow automation

**4.6 Stage 6: Remediation**

**Actors:**

- IT Operations

- DevSecOps teams

**Actions:**

- Patch deployment

- Configuration changes

- Code fixes (for applications)

- Compensating controls (if required)

**4.7 Stage 7: Validation & Closure**

**Process:**

- Re-scan affected assets

- Verify vulnerability resolution

- Update ticket status to “Closed”

**Output:**

- Audit trail

- Compliance evidence

- Updated risk posture

**5. Data Classification & Handling**

**5.1 Data Classification Levels**

| **Data Type** | **Classification** | **Examples** |
|----|----|----|
| Vulnerability data | Internal / Confidential | CVEs, scan results |
| Asset metadata | Confidential | Hostnames, IPs, system roles |
| User-related data | Sensitive (PII possible) | Usernames, ownership info |
| Security telemetry | Restricted | Risk scores, threat correlations |

**5.2 PII Considerations**

Vulnerability management systems may process limited **Personally
Identifiable Information (PII)**, such as:

- System owner names

- Email addresses

- User accounts linked to assets

**Control Requirements:**

- Minimize PII collection (data minimization principle)

- Mask or pseudonymize user identifiers where possible

- Restrict access based on roles (RBAC)

- Log and audit access to sensitive data

**5.3 Data Protection Controls**

- Encryption in transit (TLS 1.2+)

- Encryption at rest (AES-256 or equivalent)

- Secure API authentication (OAuth / tokens)

- Data loss prevention (DLP) controls

**6. Data Storage Architecture**

**6.1 Storage Locations**

- Vulnerability management platform database

- SIEM (for correlation and analytics)

- Ticketing system (for workflow tracking)

- Backup and archival storage

**6.2 Retention Policy**

| **Data Type**                 | **Retention Period**          |
|-------------------------------|-------------------------------|
| Scan results                  | ≥ 12 months                   |
| Tickets & remediation records | ≥ 12–24 months                |
| Audit logs                    | As per regulatory requirement |

**6.3 Data Residency**

- Ensure compliance with regional data protection laws

- Store sensitive data within approved geographic boundaries

**7. Security Controls in Data Flow**

- Role-Based Access Control (RBAC)

- Network segmentation between components

- Secure communication channels

- Continuous monitoring of data access

**8. Audit & Compliance**

This DFD supports:

- ISO 27001 (A.12, A.18 – data protection & logging)

- NIST SP 800-53 (AU, RA, SI controls)

- PCI DSS (logging, vulnerability tracking, data protection)

**9. Risks & Mitigations**

| **Risk**                        | **Mitigation**                 |
|---------------------------------|--------------------------------|
| Data leakage                    | Encryption and access controls |
| Excessive PII collection        | Data minimization              |
| Incomplete data flow visibility | Centralized logging            |
| Integration failures            | Monitoring and alerting        |

**10. Key Outcomes**

- Transparent and auditable vulnerability lifecycle

- Secure handling of sensitive and PII data

- Efficient remediation tracking and closure

- Compliance-ready data management

**11. Document Control**

| **Version** | **Date**        | **Owner**             | **Approval** |
|-------------|-----------------|-----------------------|--------------|
| 1.0         | \[Insert Date\] | Security Architecture | CISO         |

**End of Document**
