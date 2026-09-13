**Vulnerability Management – Exception Management Procedure**

**(Enterprise / Fortune-500 Grade – Risk Acceptance & Exception
Governance)**

**1. Purpose**

This document defines the **Exception Management Procedure** for
vulnerabilities that cannot be remediated within defined SLAs.

It ensures:

- Formal **risk acceptance** aligned with business objectives

- Controlled and documented deviations from policy

- Continuous monitoring and periodic review of accepted risks

- Audit-ready governance and traceability

**2. Scope**

This procedure applies to:

- All vulnerabilities identified across infrastructure, applications,
  cloud, and containers

- All business units and technology teams

- Exceptions related to patching, configuration, or compensating
  controls

**3. Definitions**

| **Term** | **Definition** |
|----|----|
| Exception | Approved deviation from vulnerability remediation SLA |
| Risk Acceptance | Formal acknowledgment of risk by authorized stakeholders |
| Compensating Control | Alternative security control to reduce risk |
| Expiry Date | Date after which exception must be re-evaluated |

**4. Exception Criteria**

Exceptions may be requested under the following conditions:

- No vendor patch or fix available

- Legacy systems with compatibility constraints

- High operational impact or downtime risk

- Business-critical service cannot be interrupted

- Temporary delay due to planned change window

**5. Risk Acceptance Workflow**

**5.1 Workflow Overview**

\[Vulnerability Identified\]

│

▼

\[Remediation Not Feasible\]

│

▼

\[Exception Request Submission\]

│

▼

\[Risk Assessment & Justification\]

│

▼

\[Approval Process\]

│

▼

\[Compensating Controls Applied\]

│

▼

\[Tracking & Monitoring\]

│

▼

\[Expiry & Review\]

│

▼

\[Closure or Renewal\]

**5.2 Step-by-Step Procedure**

**Step 1: Identify Exception Need**

- Vulnerability cannot be remediated within SLA

- Document reason for delay

**Step 2: Submit Exception Request**

- Raise request via ServiceNow or approved GRC tool

**Step 3: Perform Risk Assessment**

- Evaluate:

  - CVSS score

  - Asset criticality

  - Exposure level

  - Threat intelligence (active exploitation)

**Step 4: Define Compensating Controls**\
Examples:

- Network segmentation

- Firewall rule restrictions

- Endpoint isolation

- Monitoring and alerting enhancements

**Step 5: Approval Process**

| **Severity** | **Approval Authority** |
|--------------|------------------------|
| Low          | IT Manager             |
| Medium       | IT + Security Manager  |
| High         | Security Leadership    |
| Critical     | CISO / Risk Committee  |

**Step 6: Record & Track Exception**

- Assign unique exception ID

- Link to vulnerability and asset

- Track in centralized system

**6. Business Justification Requirements**

Each exception request must include:

**6.1 Mandatory Fields**

- Business impact of remediation (downtime, revenue loss, etc.)

- Technical reason remediation is not feasible

- Affected systems and scope

- Risk impact statement

- Proposed compensating controls

- Requested exception duration

**6.2 Justification Quality Criteria**

- Clear and measurable impact

- Evidence-based reasoning

- Alignment with business priorities

- Approved by asset owner

**7. Expiry & Review Cycle**

**7.1 Expiry Rules**

| **Severity** | **Maximum Duration** |
|--------------|----------------------|
| Critical     | ≤ 30 days            |
| High         | ≤ 60 days            |
| Medium       | ≤ 90 days            |
| Low          | ≤ 180 days           |

**7.2 Review Process**

- Exceptions must be reviewed before expiry

- Automated notifications sent 7–14 days prior

- Re-assess risk based on:

  - New patches available

  - Changes in threat landscape

  - Asset exposure changes

**7.3 Renewal or Closure**

| **Condition**         | **Action**                      |
|-----------------------|---------------------------------|
| Remediation completed | Close exception                 |
| Risk still valid      | Renew with approval             |
| Increased risk        | Escalate for urgent remediation |

**8. Monitoring & Reporting**

**8.1 Monitoring Controls**

- Continuous tracking of active exceptions

- Alert on nearing expiry

- Monitor compensating control effectiveness

**8.2 Reporting Metrics**

- Number of active exceptions by severity

- Exception aging

- % of expired exceptions

- SLA breaches due to exceptions

- High-risk exceptions without compensating controls

**9. Governance & Compliance**

**9.1 Governance Controls**

- Centralized exception register

- Periodic audit reviews

- Segregation of duties (request vs approval)

**9.2 Compliance Alignment**

Supports:

- ISO 27001 (Risk acceptance and treatment)

- NIST CSF (Risk management processes)

- NIST SP 800-53 (RA, PL controls)

- PCI DSS (Compensating control documentation)

**10. Risks & Mitigations**

| **Risk**                   | **Mitigation**            |
|----------------------------|---------------------------|
| Excessive risk acceptance  | Strong approval controls  |
| Long-lived exceptions      | Strict expiry enforcement |
| Lack of visibility         | Centralized tracking      |
| Weak compensating controls | Mandatory validation      |

**11. Key Principles**

- Exceptions are **temporary, not permanent**

- Risk must be **explicitly accepted, not ignored**

- Compensating controls must **reduce risk effectively**

- Continuous monitoring is mandatory

**12. Document Control**

| **Version** | **Date**        | **Owner**         | **Approval** |
|-------------|-----------------|-------------------|--------------|
| 1.0         | \[Insert Date\] | Risk & Compliance | CISO         |

**End of Document**
