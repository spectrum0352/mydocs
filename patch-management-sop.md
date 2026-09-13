**Patch Management Integration SOP**

**Document Type:** Standard Operating Procedure (SOP)\
**Domain:** Vulnerability Management / IT Operations\
**Version:** 1.0\
**Owner:** Head of Infrastructure Security / CISO Office\
**Effective Date:** \[Insert Date\]

**1. Purpose**

This SOP defines the standardized process for integrating **patch management activities** with the enterprise Vulnerability Management (VM) program to ensure timely remediation of vulnerabilities while minimizing operational disruption.

**2. Scope**

This SOP applies to:

- Servers (Windows, Linux, Unix)

- Endpoints (Corporate devices)

- Network devices (routers, firewalls, load balancers)

- Cloud resources (IaaS, PaaS)

- Applications and middleware

**3. Objectives**

- Align patch cycles with vulnerability remediation SLAs

- Enable risk-based prioritization of patching

- Ensure controlled execution of emergency (out-of-band) patches

- Minimize business impact via structured downtime coordination

**4. Roles & Responsibilities**

| **Role** | **Responsibility** |
|----|----|
| Vulnerability Management Team | Identify vulnerabilities, prioritize, track remediation |
| IT Operations / Infra Team | Execute patching activities |
| Application Owners | Validate application compatibility |
| Change Advisory Board (CAB) | Approve planned and emergency changes |
| SOC Team | Monitor exploitation attempts during patch delay |
| Business Stakeholders | Approve downtime windows |

**5. Patch Cycle Alignment**

**5.1 Standard Patch Cycle**

- Monthly patch cycle aligned with vendor releases (e.g., “Patch Tuesday”)

- Weekly validation cycle for critical systems

- Quarterly patching for low-risk or legacy systems

**5.2 SLA Alignment**

| **Severity** | **Patch SLA** | **Validation**    |
|--------------|---------------|-------------------|
| Critical     | ≤ 7 days      | Mandatory re-scan |
| High         | ≤ 15 days     | Re-scan required  |
| Medium       | ≤ 30 days     | Sample validation |
| Low          | ≤ 60–90 days  | Optional          |

**5.3 Process Flow**

1.  Vulnerability scan completed

2.  Findings ingested into VM platform

3.  Risk-based prioritization (CVSS + asset criticality + threat intel)

4.  Ticket creation in ITSM (e.g., ServiceNow)

5.  Mapping to patch cycle window

6.  Patch deployment

7.  Post-patch validation (re-scan)

8.  Closure or re-open

**5.4 Tool Integration**

- VM Tools: Qualys / Tenable / Microsoft Defender VM

- Patch Tools: WSUS / SCCM / Intune / Ansible / Satellite

- ITSM: ServiceNow / Jira

- SIEM: Microsoft Sentinel

**6. Emergency Patching (Out-of-Band)**

**6.1 Trigger Conditions**

Emergency patching is initiated when:

- Active exploitation detected in the wild

- Critical CVSS (≥ 9.0) with exploit availability

- Zero-day vulnerability (e.g., Log4Shell-type events)

- Regulatory or vendor advisory mandates immediate action

**6.2 Emergency Workflow**

1.  Threat Intelligence / VM Team identifies critical vulnerability

2.  Risk assessment performed within 24 hours

3.  Emergency Change Request raised

4.  CAB (or Emergency CAB) approval within defined SLA

5.  Patch testing (accelerated)

6.  Immediate deployment to critical assets

7.  Continuous monitoring by SOC

8.  Re-scan validation within 24–48 hours

**6.3 Risk Mitigation (If Patch Not Available)**

- Temporary controls:

  - Network segmentation

  - WAF rules

  - Endpoint protection policies

  - Service isolation / shutdown

- Exception approval required

**7. Downtime Coordination**

**7.1 Downtime Planning Principles**

- Minimize impact to business-critical services

- Align with approved maintenance windows

- Ensure rollback capability

**7.2 Downtime Scheduling Process**

1.  Identify systems requiring reboot or service interruption

2.  Notify stakeholders (minimum 5 business days for planned changes)

3.  Obtain approvals from:

    - Application owners

    - Business units

4.  Schedule downtime window

5.  Communicate outage details:

    - Start/end time

    - Impacted services

    - Contact details

**7.3 Downtime Categories**

| **Type**  | **Description**     | **Approval**  |
|-----------|---------------------|---------------|
| Planned   | Regular patch cycle | CAB           |
| Emergency | Zero-day patching   | Emergency CAB |
| Unplanned | Failure scenarios   | Incident Mgmt |

**7.4 Execution Controls**

- Backup validation before patching

- Pre-check health status

- Patch deployment

- System reboot (if required)

- Post-validation testing

- Rollback if failure detected

**7.5 Communication Plan**

- Pre-maintenance notification

- Real-time status updates

- Post-maintenance confirmation

- Incident escalation (if outage exceeds SLA)

**8. Validation & Closure**

- Mandatory re-scan for Critical/High vulnerabilities

- Validation of patch success (no regression issues)

- Ticket closure in ITSM

- Exception handling for failed remediation

**9. Metrics & KPIs**

- Patch SLA compliance %

- Mean Time to Patch (MTTP)

- Emergency patch turnaround time

- Downtime adherence %

- Patch success vs failure rate

**10. Compliance & Audit**

This SOP aligns with:

- NIST CSF (PR.IP, DE.CM)

- ISO 27001 (A.12.6.1)

- PCI Security Standards Council PCI DSS (Req. 6.2)

**11. Exception Management**

- Formal risk acceptance required for delayed patching

- Business justification mandatory

- Defined expiry and periodic review

**12. Continuous Improvement**

- Lessons learned from failed patches

- Automation of patch deployment

- Integration with threat intelligence

- Optimization of maintenance windows

**13. Appendices**

**Appendix A – Sample Patch Calendar**

**Appendix B – Emergency CAB Workflow**

**Appendix C – Communication Templates**

**End of Document**
