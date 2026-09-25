# Log collection in Azure

Azure Per-Service Logging Toggle Checklist
Scope: Azure IaaS, PaaS, Azure-native SaaS
Rule: Toggle by service, not by team

Azure Subscription (Global)
Azure Activity Logs

✅ ON – All environments

🔧 Export to Log Analytics + Storage

❌ Never disable

Virtual Machines / VM Scale Sets
Guest OS Logs

Prod

✅ Windows Security logs

✅ Linux auth / syslog

🔧 System logs optional

Non-Prod

✅ Security only

❌ Application logs (unless debugging)

Boot Diagnostics

Prod: ✅ ON

Non-Prod: ✅ ON

Network Security Groups
NSG Flow Logs v2

Prod

✅ ON for ingress / egress subnets

🔧 5-minute aggregation

Non-Prod

🔧 ON only for shared or exposed subnets

❌ Disable for isolated dev subnets

Azure Firewall
Firewall Logs

Prod

✅ Network rules

✅ Application rules

✅ Threat intelligence

Non-Prod

✅ Threat + deny logs

🔧 Reduce allow logs

Application Gateway / Front Door
WAF Logs

Prod: ✅ ON (always)

Non-Prod: ✅ ON (always)

Access Logs

Prod: 🔧 ON if internet-facing

Non-Prod: ❌ OFF by default

Load Balancer
Health Probe Logs

Prod: 🔧 Optional

Non-Prod: ❌ OFF

VPN Gateway / ExpressRoute
Gateway Logs

Prod: ✅ ON

Non-Prod: 🔧 ON if used

Azure Bastion
Bastion Logs

Prod: ✅ ON

Non-Prod: 🔧 Optional

Azure Kubernetes Service (AKS)
Control Plane Logs

Prod

✅ kube-audit

✅ kube-apiserver

Non-Prod

✅ kube-audit

❌ verbose controller logs

Container stdout / stderr

Prod: 🔧 Enable selectively

Non-Prod: ❌ OFF by default

Azure SQL Database / MI
SQL Auditing

Prod: ✅ ON

Non-Prod: ✅ ON

Threat Detection

Prod: ✅ ON

Non-Prod: 🔧 Optional

Azure Storage Accounts
Storage Analytics

Prod

✅ Delete operations

🔧 Read / Write (data-sensitive only)

Non-Prod

❌ Read logs

🔧 Delete only

Azure Key Vault
Audit Logs

Prod: ✅ ON (no exceptions)

Non-Prod: ✅ ON

Cosmos DB
Diagnostic Logs

Prod: ✅ ON

Non-Prod: 🔧 Control plane only

App Service
HTTP Access Logs

Prod: 🔧 ON if public

Non-Prod: ❌ OFF

Application Logs

Prod: 🔧 Optional

Non-Prod: ❌ OFF

Function Apps
Execution Logs

Prod: 🔧 ON for critical functions

Non-Prod: ❌ OFF

API Management
Gateway Logs

Prod: ✅ ON

Non-Prod: 🔧 Optional

Event Hub / Service Bus
Diagnostic Logs

Prod: 🔧 Errors + throttling

Non-Prod: ❌ OFF

Microsoft Defender for Cloud
Security Logs

Prod: ✅ ON

Non-Prod: ✅ ON

Azure Policy
Policy Evaluation Logs

Prod: ✅ ON

Non-Prod: ✅ ON

Logic Apps / Automation
Execution Logs

Prod: 🔧 Errors only

Non-Prod: ❌ OFF

SAFE DISABLE SUMMARY (VERY LITTLE)
❌ Container stdout / stderr (unless needed)

❌ App Service HTTP logs (if behind WAF/APIM)

❌ Load Balancer probe logs

❌ Verbose AKS controller logs

❌ Storage read logs in non-prod

NEVER DISABLE (ANY ENVIRONMENT)
Azure Activity Logs

Key Vault Audit Logs

Azure Policy Logs

Defender for Cloud Logs

SQL Auditing

NSG Flow Logs on prod ingress/egress

ONE-LINE RULE
Disable DEBUG logs.
Never disable CONTROL, SECURITY, or GOVERNANCE logs.
If you want next:

Azure Policy deny rules for these toggles

CSV / Excel checklist

Terraform / Bicep logging module

Log Analytics cost guardrails


# Azure Logs – Retention, Mandatory vs Optional, Cost Impact
Scope: Azure IaaS / PaaS / Azure-native SaaS only
Excluded: Entra ID / Azure AD

1. Azure Activity Logs (Subscription)
Retention (Hot – Log Analytics): 90 days

Retention (Archive – Storage): 1–7 years

Mandatory: YES (all subscriptions)

Cost Impact: LOW

2. Resource Diagnostic Logs (Generic – All Resources)
Retention (Hot): 30–90 days

Retention (Archive): 1–3 years

Mandatory: YES (where supported)

Cost Impact: MEDIUM

3. Guest OS Logs (VM / VMSS)
Windows Event Logs

Retention (Hot): 30–60 days

Archive: 1–3 years

Mandatory: YES (security workloads)

Cost Impact: HIGH

Linux Syslog

Retention (Hot): 30–60 days

Archive: 1–3 years

Mandatory: YES (security workloads)

Cost Impact: HIGH

4. Boot Diagnostics Logs (VM / VMSS)
Retention (Hot): 14–30 days

Retention (Archive): Optional

Mandatory: YES

Cost Impact: LOW

5. Network Flow Logs
NSG Flow Logs v2

Retention (Hot): 30–90 days

Archive: 1–3 years

Mandatory: YES (networked workloads)

Cost Impact: VERY HIGH

6. Network Security / Device Logs
Azure Firewall Logs

Retention (Hot): 30–90 days

Archive: 1–3 years

Mandatory: YES (if deployed)

Cost Impact: VERY HIGH

Application Gateway / Front Door WAF Logs

Retention (Hot): 30–90 days

Archive: 1–3 years

Mandatory: YES (if internet-facing)

Cost Impact: HIGH

VPN / ExpressRoute / Bastion Logs

Retention (Hot): 30–90 days

Archive: 1–3 years

Mandatory: YES (if used)

Cost Impact: MEDIUM

Load Balancer Health Probe Logs

Retention (Hot): 14–30 days

Archive: Optional

Mandatory: OPTIONAL

Cost Impact: LOW

7. AKS Logs
Control Plane Logs

Retention (Hot): 30–90 days

Archive: 1–3 years

Mandatory: YES

Cost Impact: VERY HIGH

Container Runtime Logs (stdout / stderr)

Retention (Hot): 7–30 days

Archive: Optional

Mandatory: OPTIONAL

Cost Impact: VERY HIGH

8. Data Service Logs
Azure SQL Auditing

Retention (Hot): 90 days

Archive: 1–7 years

Mandatory: YES

Cost Impact: MEDIUM

Azure SQL Threat Detection

Retention (Hot): 90 days

Archive: 1–7 years

Mandatory: YES (regulated workloads)

Cost Impact: LOW

Storage Analytics (Read / Write / Delete)

Retention (Hot): 30–90 days

Archive: 1–3 years

Mandatory: YES (data-sensitive workloads)

Cost Impact: VERY HIGH

Key Vault Audit Logs

Retention (Hot): 90 days

Archive: 1–7 years

Mandatory: YES (always)

Cost Impact: LOW

Cosmos DB Diagnostic Logs

Retention (Hot): 30–90 days

Archive: 1–3 years

Mandatory: YES (if used)

Cost Impact: MEDIUM

9. PaaS / Platform Logs
App Service HTTP Logs

Retention (Hot): 14–30 days

Archive: Optional

Mandatory: OPTIONAL

Cost Impact: HIGH

Function App Execution Logs

Retention (Hot): 14–30 days

Archive: Optional

Mandatory: OPTIONAL

Cost Impact: HIGH

API Management Gateway Logs

Retention (Hot): 30–90 days

Archive: 1–3 years

Mandatory: YES (external APIs)

Cost Impact: HIGH

Event Hub / Service Bus Logs

Retention (Hot): 30–90 days

Archive: Optional

Mandatory: OPTIONAL

Cost Impact: MEDIUM

10. Security Logs
Microsoft Defender for Cloud Logs

Retention (Hot): 90 days

Archive: 1–3 years

Mandatory: YES

Cost Impact: LOW

11. Governance Logs
Azure Policy Logs

Retention (Hot): 90 days

Archive: 1–7 years

Mandatory: YES

Cost Impact: LOW

12. Automation Logs
Logic Apps Execution Logs

Retention (Hot): 30–90 days

Archive: Optional

Mandatory: OPTIONAL

Cost Impact: LOW

Automation Runbook Logs

Retention (Hot): 30–90 days

Archive: Optional

Mandatory: OPTIONAL

Cost Impact: LOW

Cost-Heavy Log Types (Reality Check)
VERY HIGH COST

NSG Flow Logs v2

Azure Firewall Logs

AKS Control Plane Logs

Container stdout / stderr

Storage Analytics

HIGH COST

VM Guest OS Logs

WAF Logs

App Service HTTP Logs

API Management Gateway Logs

LOW COST (Never Disable)

Activity Logs

Key Vault Audit Logs

Defender for Cloud Logs

Azure Policy Logs

One-Line Rule (Keep This)
Never reduce CONTROL, SECURITY, or GOVERNANCE logs for cost.
Tune VOLUME, not COVERAGE.
If you want next, I can give:

Exact Azure Policy deny list for mandatory logs

Cost-optimized profiles (Prod vs Non-Prod)

CSV / Excel-ready matrix

What to disable safely (very little)