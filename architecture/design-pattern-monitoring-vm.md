Design Pattern - VM Monitoring

Below is an **enterprise-grade Design Pattern for Azure Virtual Machine Monitoring**, written in the style typically used by **large enterprises, Cloud COEs, and auditors**.\
You can directly convert this into **Word / PPT / Architecture Review Board (ARB)** material.

**Azure Virtual Machine Monitoring – Design Pattern**

**(Windows & Linux \| Enterprise Reference Architecture)**

**1. Purpose & Scope**

This design pattern defines **how Azure Virtual Machines (Windows & Linux)** must be monitored across an enterprise Azure landing zone to achieve:

- Operational health monitoring

- Security detection and investigation

- Performance and capacity visibility

- Compliance and audit readiness

- Central SOC / NOC observability

**In Scope**

- Azure IaaS VMs (Windows & Linux)

- Azure Monitor, Log Analytics, VM Insights

- Data Collection Rules (DCR)

- Alerting & escalation

**Out of Scope**

- Application-level APM (App Insights)

- Kubernetes (AKS)

- PaaS services (covered separately)

**2. Monitoring Design Principles (Enterprise)**

| **Principle**             | **Description**                               |
|---------------------------|-----------------------------------------------|
| Centralized Observability | Logs and metrics flow to central workspaces   |
| Least Data Required       | Collect only logs that add security/ops value |
| Policy-driven             | Monitoring enforced via Azure Policy          |
| Agent-based + Native      | AMA + Azure native metrics                    |
| Region-aligned            | Workspace per region for data residency       |
| Cost-aware                | Avoid noisy/low-value logs                    |

**3. Reference Architecture – VM Monitoring**

**3.1 High-Level Architecture (Text Diagram)**

Azure Virtual Machines (Windows / Linux)

\|

\| Azure Monitor Agent (AMA)

\|

v

Data Collection Rules (DCR)

\|

\|--- Metrics

\|--- Performance Counters

\|--- Windows Event Logs

\|--- Linux Syslog

\|--- Dependency Map (VM Insights)

\|

v

Central Log Analytics Workspace

\|

\|--- Azure Monitor Alerts

\|--- Workbooks / Dashboards

\|--- Microsoft Sentinel (Optional)

\|

v

SOC / NOC / IT Ops Teams

**3.2 Enterprise Landing Zone Alignment**

| **Layer**        | **Design**                          |
|------------------|-------------------------------------|
| Management Group | Policies enforce AMA + DCR          |
| Subscription     | No local workspaces allowed         |
| Region           | 1–2 shared Log Analytics Workspaces |
| Network          | Private Link for Log Analytics      |
| Security         | Defender for Cloud enabled          |

**4. Core Monitoring Components**

**4.1 Azure Monitor Agent (AMA)**

**Mandatory agent for all VMs**

- Replaces Log Analytics Agent

- Supports DCR-based granular control

- Installed via:

  - Azure Policy

  - VM Image baseline

  - ARM/Bicep/Terraform

**4.2 Data Collection Rules (DCR)**

DCRs define **WHAT** data is collected and **WHERE** it is sent.

**Enterprise Pattern**

- Multiple DCRs by purpose

- Assigned via Azure Policy

**Recommended DCR Structure**

| **DCR Name**           | **Purpose**                |
|------------------------|----------------------------|
| DCR-VM-Baseline        | Mandatory logs for all VMs |
| DCR-VM-Security        | Security and audit logs    |
| DCR-VM-Performance     | Performance counters       |
| DCR-VM-Troubleshooting | Optional / temporary       |

**5. Logs & Metrics Collection Strategy**

**5.1 Metrics (Always Enabled)**

| **Metric**        | **Importance** |
|-------------------|----------------|
| CPU Percentage    | High           |
| Available Memory  | High           |
| Disk IOPS         | High           |
| Disk Queue Length | Medium         |
| Network In/Out    | Medium         |
| VM Availability   | Critical       |

**Source**: Azure platform metrics (no agent dependency)

**6. Windows VM – Logs to Collect**

**6.1 Windows Event Logs (Recommended)**

**High Importance (Mandatory)**

| **Log**          | **Reason**                    |
|------------------|-------------------------------|
| Security         | Authentication, privilege use |
| System           | OS stability, reboots         |
| Application      | App crashes                   |
| Windows Defender | Malware detection             |

**Medium Importance**

| **Log**          | **Reason**            |
|------------------|-----------------------|
| PowerShell       | Suspicious scripting  |
| Windows Firewall | Network security      |
| Task Scheduler   | Persistence detection |

**Low Importance (Avoid by Default)**

| **Log**      | **Reason**             |
|--------------|------------------------|
| Setup        | Rare operational value |
| PrintService | Very noisy             |
| Debug        | High cost              |

**6.2 Windows Performance Counters**

| **Counter**            | **Importance** |
|------------------------|----------------|
| Processor %            | High           |
| Available Memory       | High           |
| Disk Queue Length      | High           |
| LogicalDisk Free Space | Critical       |
| TCP Connections        | Medium         |

**8. VM Insights (Recommended)**

Enable **VM Insights** for:

- Dependency Map (process-to-process)

- Memory utilization (not available in metrics)

- Performance trends

**Use Case**

- Incident troubleshooting

- Capacity planning

- Root cause analysis

**10. Alert Routing & Response**

| **Severity** | **Response**        |
|--------------|---------------------|
| Sev 0        | PagerDuty / On-call |
| Sev 1        | SOC / NOC           |
| Sev 2        | Service Desk        |
| Sev 3        | Email / Dashboard   |

**Integrations**

- ITSM (ServiceNow)

- Email

- Teams

- Sentinel Incidents

**11. Governance & Policy Enforcement**

**Mandatory Azure Policies**

| **Policy**                 | **Purpose**        |
|----------------------------|--------------------|
| Deploy AMA                 | Auto-install agent |
| Assign DCR                 | Enforce logging    |
| Deny VM without monitoring | Compliance         |
| Require VM Insights        | Visibility         |

**12. Cost Optimization Guidance**

| **Control**        | **Action**          |
|--------------------|---------------------|
| Log volume         | Filter event levels |
| Retention          | 30–90 days (hot)    |
| Archive            | Storage Account     |
| Disable debug logs | Default             |

**13. Auditor / Compliance Appendix**

**Control-to-Log Mapping**

| **Control**        | **Logs**            |
|--------------------|---------------------|
| Access Monitoring  | Security Event Logs |
| Malware Protection | Defender Logs       |
| Availability       | Metrics + Heartbeat |
| Change Tracking    | Event Logs          |
| Incident Detection | Sentinel            |

**14. Summary – Enterprise Recommendation**

**Preferred Model**

- Centralized Log Analytics

- AMA + DCR-based collection

- Policy-enforced

- VM Insights enabled

- Tiered alerting

<!-- -->

- **This design is:**

  - Scalable

  - Secure

  - Cost-efficient

  - Auditor-friendly
