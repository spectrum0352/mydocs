# Microsoft Defender for Cloud (MDC) Enterprise Implementation & Configuration Guide

> **Audience:** Enterprise Cloud Security Architects, Azure Platform Teams, SOC Engineers
>
> **Scope:** Enterprise environments with **hundreds to thousands of Azure subscriptions**, multiple management groups, centralized SOC, Microsoft Sentinel integration, Azure Landing Zones, and Infrastructure as Code (IaC).

---

# Microsoft Defender for Cloud (MDC) Enterprise Implementation

## Enterprise Design Principles

For enterprise environments, Microsoft Defender for Cloud **should never be configured individually on subscriptions.**

Instead, configuration should follow the Azure hierarchy:

```
Tenant Root
    │
    ├── Platform Management Group
    ├── Landing Zone Management Group
    ├── Production Management Group
    ├── Non-Production Management Group
    ├── Sandbox Management Group
    └── Regulated Workloads Management Group
```

All Defender plans, policies, extensions, data collection rules, governance rules, and regulatory compliance standards should be assigned at the **Management Group** level.

This provides:

* Centralized governance
* Consistent security posture
* Reduced operational overhead
* Automatic onboarding of new subscriptions
* Easier compliance management

---

# Enterprise Deployment Architecture

```
Azure Tenant

Management Groups
        │
        ├── Azure Policy Initiatives
        ├── Defender for Cloud Plans
        ├── Auto Provisioning
        ├── Azure Policy DeployIfNotExists
        ├── Data Collection Rules
        ├── Defender Extensions
        ├── Regulatory Compliance
        ├── Continuous Export
        └── Governance Rules
                 │
      All Child Subscriptions
                 │
        Azure Resources
```

---

# 1. Initial Enterprise Deployment

## Step 1 – Assign Required RBAC

Recommended roles

| Role                      | Purpose                     |
| ------------------------- | --------------------------- |
| Security Admin            | Manage Defender settings    |
| Security Reader           | Read security posture       |
| Owner                     | Required during deployment  |
| Contributor               | Resource remediation        |
| Log Analytics Contributor | Workspace administration    |
| Monitoring Contributor    | Azure Monitor configuration |

---

## Step 2 – Enable Defender Plans

Navigate to

```
Microsoft Defender for Cloud

Environment Settings

Select Management Group

Defender Plans
```

Enable plans at the **Management Group**, not subscription level.

---

# Defender Plans

Typical enterprise configuration:

| Defender Plan                      | Enterprise Recommendation       |
| ---------------------------------- | ------------------------------- |
| Defender for Servers Plan 2        | Enable                          |
| Defender for SQL                   | Enable                          |
| Defender for Storage               | Enable                          |
| Defender for Key Vault             | Enable                          |
| Defender for Containers            | Enable                          |
| Defender for App Service           | Enable                          |
| Defender for Resource Manager      | Enable                          |
| Defender for DNS                   | Enable                          |
| Defender for Open-Source Databases | Enable where applicable         |
| Defender for APIs                  | Enable if API Management exists |
| Defender for AI Services           | Enable if Azure AI is used      |

---

# 2. Environment Settings

Navigate

```
Defender for Cloud

Environment Settings

Select Management Group
```

---

# Enterprise Configuration Matrix

---

## 2.1 Defender Plans

| Setting                 | Possible Values  | Enterprise Recommendation | Reason                        |
| ----------------------- | ---------------- | ------------------------- | ----------------------------- |
| Defender Plan           | On / Off         | On                        | Enables workload protection   |
| Monitoring Coverage     | Full / Selective | Full                      | Complete attack visibility    |
| Per Resource Enablement | Yes              | No                        | Avoid inconsistent deployment |

---

## 2.2 Auto Provisioning

### Possible values

| Setting                  | Values   | Enterprise Recommendation | Reason                            |
| ------------------------ | -------- | ------------------------- | --------------------------------- |
| Azure Monitor Agent      | On / Off | On                        | Required for telemetry collection |
| Vulnerability Assessment | On / Off | On                        | Continuous vulnerability scanning |
| MDE Integration          | On / Off | On                        | Advanced EDR capabilities         |
| Endpoint Protection      | On / Off | On                        | Threat detection                  |
| Guest Configuration      | On / Off | On                        | Azure Policy compliance           |
| Change Tracking          | On /Off  | On                        | File/service change monitoring    |

---

## Why Auto-Provisioning?

Without auto-provisioning:

* New VMs remain unprotected.
* Manual onboarding creates operational overhead.
* Security posture becomes inconsistent.
* Compliance scores decrease.

For environments with thousands of subscriptions, **Auto-Provisioning should always be enabled**.

---

# 3. Agent Deployment

## Modern Recommendation

The **Log Analytics Agent (MMA/OMS)** is **deprecated**.

Use:

* Azure Monitor Agent (AMA)
* Microsoft Defender for Endpoint (MDE)
* Azure Policy DeployIfNotExists
* Data Collection Rules (DCR)

Do **not** deploy the legacy Log Analytics Agent in new environments.

---

## Azure Monitor Agent

Recommended value

```
Enabled
```

Reason

* Supported by Microsoft
* Better scalability
* Uses Data Collection Rules
* Lower operational complexity

---

# 4. Data Collection Rules (DCR)

Navigate

```
Azure Monitor

Data Collection Rules
```

---

## Recommended Windows Event Collection

| Event       | Collect? | Reason                    |
| ----------- | -------- | ------------------------- |
| Security    | Yes      | Authentication monitoring |
| System      | Yes      | OS health                 |
| Application | Yes      | Application failures      |
| PowerShell  | Yes      | Threat hunting            |
| Sysmon      | Yes      | Advanced detection        |

---

## Linux Logs

Recommended

* Syslog
* Auth
* Secure
* Auditd
* Journald

---

# 5. Log Analytics Workspace Strategy

Large enterprises should avoid creating one workspace per subscription.

Recommended architecture

```
Regional Shared Workspace

OR

Business Unit Workspace

OR

Regulated Workspace
```

Example

```
Europe Workspace

US Workspace

APAC Workspace

PCI Workspace
```

---

## Possible Workspace Models

| Model                           | Recommended | Notes                     |
| ------------------------------- | ----------- | ------------------------- |
| One Workspace per Subscription  | No          | Difficult to manage       |
| One Workspace per Region        | Yes         | Most common               |
| One Workspace per Business Unit | Yes         | Good separation           |
| One Workspace per Environment   | Optional    | Production/Non-Production |
| Central Workspace               | Large SOCs  | Good for Sentinel         |

---

# 6. Security Recommendations

Recommendation states

* Healthy
* Unhealthy
* Exempt
* Not Applicable

---

## Remediation Options

| Option                   | When Used                            |
| ------------------------ | ------------------------------------ |
| Quick Fix                | Azure supports automatic remediation |
| Azure Policy Remediation | Recommended                          |
| Logic App                | Automated workflows                  |
| Manual                   | Last resort                          |

---

# Enterprise Recommendation

Always remediate using:

```
Azure Policy
DeployIfNotExists

or

Modify Policies
```

Avoid manual remediation whenever possible.

---

# 7. Recommendation Exemptions

Possible exemption types

| Type              | Use                    |
| ----------------- | ---------------------- |
| Waiver            | Accepted business risk |
| Mitigated         | Controlled elsewhere   |
| Alternate Control | Compensating control   |

Every exemption should include:

* Business justification
* Approval
* Expiration date
* Owner

Avoid permanent exemptions.

---

# 8. Continuous Export

Navigate

```
Defender for Cloud

Continuous Export
```

---

Recommended exports

| Destination        | Enable   |
| ------------------ | -------- |
| Log Analytics      | Yes      |
| Microsoft Sentinel | Yes      |
| Event Hub          | Optional |
| Storage Account    | Optional |
| Logic Apps         | Optional |

---

Reason

Centralized SOC monitoring.

---

# 9. Governance Rules

Governance Rules automate ownership assignment and remediation tracking.

---

## Recommended Settings

| Setting            | Enterprise Value | Reason               |
| ------------------ | ---------------- | -------------------- |
| Scope              | Management Group | Central governance   |
| Priority           | High             | Faster remediation   |
| Assignment         | Resource Tags    | Dynamic ownership    |
| Notifications      | Weekly           | Reduce email fatigue |
| Manager Escalation | Enabled          | SLA enforcement      |

---

## Remediation SLA

| Severity | Recommended SLA |
| -------- | --------------- |
| Critical | 7 Days          |
| High     | 14 Days         |
| Medium   | 30 Days         |
| Low      | 90 Days         |

---

# 10. Continuous Assessment

Assessment Frequency

```
Continuous
```

No manual scanning required.

---

# 11. Security Alerts

Alert severity

* Informational
* Low
* Medium
* High
* Critical

---

Enterprise recommendation

Forward all alerts to:

* Microsoft Sentinel
* SOC
* SIEM
* SOAR

---

# 12. Regulatory Compliance

Enable only frameworks applicable to the organization.

Examples

* Microsoft Cloud Security Benchmark (MCSB)
* CIS Azure Foundations Benchmark
* NIST SP 800-53
* ISO/IEC 27001
* PCI DSS
* HIPAA
* SOC 2
* FedRAMP (where applicable)

Avoid enabling unnecessary frameworks to reduce assessment noise.

---

# 13. Data Collection

## Enterprise Data Sources

Supported sources

* Azure Virtual Machines
* Azure Arc-enabled Servers
* AKS Clusters
* SQL Servers
* Storage Accounts
* App Services
* Key Vault
* Azure Firewall
* Microsoft Entra ID
* Microsoft Defender XDR
* AWS
* GCP
* On-premises Servers

---

## IP Address Data

Collected from:

* Azure Monitor Agent (AMA)
* Microsoft Defender for Endpoint (MDE)
* Azure Activity Logs
* Network Security Group Flow Logs
* Azure Firewall Logs
* Microsoft Sentinel
* Defender Sensors

The legacy Log Analytics Agent should not be used in new deployments.

---

# 14. Data Retention

Recommended retention

| Environment                 | Retention                         |
| --------------------------- | --------------------------------- |
| Security Events             | 180–365 days                      |
| Regulatory                  | 1–7 years (based on requirements) |
| Microsoft Sentinel Hot Data | 90–180 days                       |
| Archive                     | Up to 12 years if required        |

Choose retention based on compliance, legal, and cost considerations.

---

# 15. Enterprise Best Practices

| Configuration                   | Recommendation                      | Reason                                         |
| ------------------------------- | ----------------------------------- | ---------------------------------------------- |
| Scope                           | Management Group                    | Centralized governance                         |
| Defender Plans                  | Enable required plans               | Consistent workload protection                 |
| Azure Monitor Agent (AMA)       | Enabled                             | Microsoft-supported telemetry collection       |
| Microsoft Defender for Endpoint | Enabled                             | Advanced EDR and endpoint protection           |
| Azure Policy                    | DeployIfNotExists / Modify          | Automatic deployment and remediation           |
| Data Collection Rules           | Centralized                         | Standardized telemetry collection              |
| Log Analytics Workspace         | Shared by Region or Business Unit   | Scalability and cost optimization              |
| Continuous Export               | Enabled                             | Centralized monitoring in Microsoft Sentinel   |
| Governance Rules                | Enabled                             | Ownership assignment and SLA tracking          |
| Recommendation Exemptions       | Time-bound with justification       | Controlled risk acceptance                     |
| Regulatory Compliance           | Required frameworks only            | Reduced assessment noise                       |
| Security Alerts                 | Forward to SIEM/SOC                 | Centralized incident response                  |
| Auto-Provisioning               | Enabled                             | Protects newly created resources automatically |
| Infrastructure as Code          | Bicep/Terraform with Azure Policy   | Consistent, repeatable deployments             |
| Management Approach             | Configure at Management Group level | Scales across thousands of subscriptions       |

## Enterprise Deployment Considerations

For organizations managing **thousands of subscriptions**, all Microsoft Defender for Cloud settings should be deployed and maintained through **Azure Policy initiatives**, **Management Groups**, and **Infrastructure as Code (Terraform, Bicep, or ARM templates)**. Individual subscription-level configuration should be avoided except for approved exceptions. This approach ensures new subscriptions inherit the required security baseline automatically, minimizes configuration drift, simplifies compliance audits, and reduces operational overhead while maintaining a consistent security posture across the Azure estate.
