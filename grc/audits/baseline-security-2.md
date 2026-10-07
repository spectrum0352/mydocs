# Azure Security Baseline – Common Cloud Misconfigurations

## Identity and Access Management

### ASB-IAM-001: Azure Identity Protection Disabled

**Control Objective:** Detect and remediate identity-based threats using risk-based Conditional Access and automated remediation.

**Baseline Requirement:**

* Enable Microsoft Entra ID Identity Protection.
* Configure user risk and sign-in risk policies.
* Integrate Identity Protection alerts with Microsoft Defender and Sentinel.
* Enable automated remediation for medium and high-risk sign-ins.

**Severity:** High

---

### ASB-IAM-002: Insecure Guest User Settings

**Control Objective:** Prevent excessive access by external identities.

**Baseline Requirement:**

* Restrict guest users from viewing directory information.
* Limit guest invitations to approved administrators.
* Enable guest access reviews.
* Apply Conditional Access policies to guest users.
* Block legacy authentication for guests.

**Severity:** High

---

### ASB-IAM-003: Excessive Guest Accounts

**Control Objective:** Reduce risks from unmanaged external identities.

**Baseline Requirement:**

* Review guest accounts quarterly.
* Remove inactive guest users.
* Enable lifecycle governance and access reviews.
* Require business justification and sponsorship for guest access.

**Severity:** Medium

---

### ASB-IAM-004: Lack of MFA for Privileged Accounts

**Control Objective:** Protect administrative accounts against credential compromise.

**Baseline Requirement:**

* Require MFA for all privileged roles.
* Implement Privileged Identity Management (PIM).
* Require phishing-resistant MFA where possible.
* Enforce Conditional Access policies.

**Severity:** Critical

---

### ASB-IAM-005: Lack of MFA for Device Registration

**Control Objective:** Prevent unauthorized device enrollment.

**Baseline Requirement:**

* Require MFA for device registration and join operations.
* Restrict device enrollment to trusted users.
* Monitor suspicious device registration activity.

**Severity:** High

---

### ASB-IAM-006: Unrestricted Azure Administration Portal Access

**Control Objective:** Limit administrative portal access.

**Baseline Requirement:**

* Restrict Azure portal access using Conditional Access.
* Require compliant devices.
* Restrict access from approved locations.
* Enforce MFA and risk-based authentication.

**Severity:** High

---

## Network Security

### ASB-NET-001: Azure Network Watcher Disabled

**Control Objective:** Enable network visibility and diagnostics.

**Baseline Requirement:**

* Enable Network Watcher in all Azure regions.
* Enable NSG Flow Logs.
* Enable Connection Monitor.
* Integrate logs with Log Analytics.

**Severity:** Medium

---

### ASB-NET-002: Virtual Network Using Basic DDoS Protection

**Control Objective:** Protect internet-facing workloads from volumetric attacks.

**Baseline Requirement:**

* Enable Azure DDoS Protection Standard on production VNets.
* Configure DDoS telemetry and alerting.
* Integrate DDoS alerts with Microsoft Sentinel.

**Severity:** High

---

### ASB-NET-003: Network Security Groups Using Any/Any Rules

**Control Objective:** Enforce least privilege network access.

**Baseline Requirement:**

* Remove inbound and outbound Any/Any rules.
* Restrict access to required ports and source ranges.
* Periodically review NSG rules.
* Implement Azure Firewall where appropriate.

**Severity:** Critical

---

### ASB-NET-004: Public IP Address Using Basic SKU

**Control Objective:** Improve network resiliency and security.

**Baseline Requirement:**

* Use Standard SKU Public IPs.
* Enable zone redundancy where supported.
* Associate with NSGs.

**Severity:** Medium

---

### ASB-NET-005: Dynamic Public IP Addresses on Internet-Facing Systems

**Control Objective:** Maintain consistent security controls and monitoring.

**Baseline Requirement:**

* Use Static Public IP addresses for production services.
* Implement DNS management controls.
* Monitor public exposure continuously.

**Severity:** Medium

---

## Storage Security

### ASB-STG-001: Blob Storage Anonymous Access Enabled

**Control Objective:** Prevent unauthorized access to storage data.

**Baseline Requirement:**

* Disable anonymous blob access.
* Disable public access at account level.
* Use Microsoft Entra authentication.
* Review container permissions regularly.

**Severity:** Critical

---

### ASB-STG-002: Storage Account Accessible from Internet

**Control Objective:** Restrict storage access to trusted networks.

**Baseline Requirement:**

* Disable public network access where possible.
* Implement Private Endpoints.
* Restrict access using firewall rules.
* Use trusted Microsoft services exceptions only when required.

**Severity:** High

---

### ASB-STG-003: Secure Transfer Not Enforced

**Control Objective:** Protect data in transit.

**Baseline Requirement:**

* Enable "Secure Transfer Required".
* Enforce HTTPS-only access.
* Disable insecure protocols.

**Severity:** High

---

## Compute Security

### ASB-CMP-001: Unencrypted OS and Data Disks

**Control Objective:** Protect data at rest.

**Baseline Requirement:**

* Enable Azure Disk Encryption or Server-Side Encryption.
* Use Customer Managed Keys (CMK) where required.
* Encrypt OS, data, temporary disks, and snapshots.

**Severity:** Critical

---

## Application Security

### ASB-APP-001: HTTPS Only Not Enabled on Web Applications

**Control Objective:** Protect application traffic in transit.

**Baseline Requirement:**

* Enable HTTPS Only.
* Enforce TLS 1.2 or higher.
* Redirect HTTP requests to HTTPS.
* Disable weak SSL/TLS protocols.

**Severity:** High

---

## Security Monitoring and Logging

### ASB-MON-001: Missing Email Notifications in Microsoft Defender for Cloud

**Control Objective:** Ensure timely security alert notification.

**Baseline Requirement:**

* Configure security contact information.
* Enable email notifications for High and Critical alerts.
* Configure escalation procedures.

**Severity:** Medium

---

### ASB-MON-002: Activity Log Monitoring Not Configured

**Control Objective:** Detect unauthorized administrative activity.

**Baseline Requirement:**

* Export Activity Logs to Log Analytics.
* Create alerts for:

  * RBAC changes
  * Policy modifications
  * Resource deletions
  * Security configuration changes
* Retain logs according to compliance requirements.

**Severity:** High

---

### ASB-MON-003: Metrics Monitoring Not Configured

**Control Objective:** Detect operational and security anomalies.

**Baseline Requirement:**

* Configure Azure Monitor metrics.
* Monitor:

  * CPU utilization
  * Memory utilization
  * Network throughput
  * Storage utilization
  * Availability metrics
* Configure alert thresholds.

**Severity:** Medium

---

### ASB-MON-004: Azure Monitor Alert Rules Missing

**Control Objective:** Provide proactive detection and response.

**Baseline Requirement:**

* Configure alert rules for:

  * Security incidents
  * Service outages
  * Resource health issues
  * Cost anomalies
  * Capacity thresholds
* Route alerts to SOC and incident management systems.

**Severity:** High

---

## Microsoft Defender for Cloud

### ASB-MDC-001: Microsoft Defender for Cloud Using Basic Plan

**Control Objective:** Enable advanced threat detection and posture management.

**Baseline Requirement:**

* Upgrade to Microsoft Defender for Cloud enhanced plans.
* Enable Defender for:

  * Servers
  * Storage
  * SQL
  * Containers
  * Key Vault
  * Resource Manager
  * DNS
  * App Services
* Enable attack path analysis and CSPM capabilities.

**Severity:** High

---

## Compliance Mapping

This baseline aligns with:

* Center for Internet Security Azure Foundations Benchmark
* Microsoft (ASB)
* National Institute of Standards and Technology
* National Institute of Standards and Technology
* International Organization for Standardization
* Cloud Security Alliance

## Baseline Severity Summary

| Severity | Count |
| -------- | ----- |
| Critical | 4     |
| High     | 12    |
| Medium   | 5     |
| Low      | 0     |

**Critical Priority Remediation:**

1. Lack of MFA for privileged accounts.
2. NSG Any/Any rules.
3. Anonymous Blob Storage access.
4. Unencrypted OS and Data Disks.

These controls should be enforced through Azure Policy initiatives, Microsoft Defender for Cloud recommendations, and continuous compliance monitoring.
