# Security Baseline



Cloud Security Baseline
How to define Cloud Security Baseline?
Defining an Azure Cloud Security Baseline involves several key steps:

Asset Inventory and Classification:
Identify all your Azure resources (VMs, databases, etc.) and their owners.
Classify these assets based on their criticality and the sensitivity of the data they store. This helps prioritize security efforts.
Risk Assessment:
Analyze each asset class to identify potential security threats and vulnerabilities.
Consider factors like data breaches, unauthorized access, and denial-of-service attacks.
Prioritize risks based on likelihood and impact.
Compliance Requirements:
Identify any industry standards or regulations your organization needs to comply with (e.g., HIPAA, PCI DSS).
Include controls in your baseline that address these compliance requirements.
Security Configuration Standards:
Define specific security configurations for each asset type based on Microsoft's recommendations and industry best practices.
This might involve settings for access control, encryption, logging, and monitoring.
Consider using tools like Azure Policy to enforce these configurations automatically.
Identity and Access Management:
Implement strong identity and access controls (IAM) using Azure Active Directory (AAD).
Utilize features like multi-factor authentication (MFA) and least privilege (just enough access) to minimize access risks.
Patch Management:
Establish a process for regularly patching all azure resources to address known vulnerabilities.
Leverage Azure Security Center or automated tools for vulnerability scanning and patching.
Documentation and Communication:
Document your Azure Cloud Security Baseline clearly, outlining configurations, policies, and procedures.
Communicate these security guidelines to all relevant stakeholders within your organization.
Enforcement and Monitoring:
Implement tools and processes to enforce your security baseline. This could involve Azure Policy, Azure Monitor, and security alerts.
Continuously monitor your Azure environment for security threats and misconfigurations.
Continuous Improvement:
Regularly review and update your security baseline as new threats emerge and Microsoft releases security updates.
Stay informed about the latest cybersecurity best practices and industry standards.
Remember, this is a general process, and specific steps may vary depending on your organization's unique needs and security posture



# Cloud Security Baseline



Cloud Security Baseline
How to define Cloud Security Baseline?
Defining an Azure Cloud Security Baseline involves several key steps:

Asset Inventory and Classification:
Identify all your Azure resources (VMs, databases, etc.) and their owners.
Classify these assets based on their criticality and the sensitivity of the data they store. This helps prioritize security efforts.
Risk Assessment:
Analyze each asset class to identify potential security threats and vulnerabilities.
Consider factors like data breaches, unauthorized access, and denial-of-service attacks.
Prioritize risks based on likelihood and impact.
Compliance Requirements:
Identify any industry standards or regulations your organization needs to comply with (e.g., HIPAA, PCI DSS).
Include controls in your baseline that address these compliance requirements.
Security Configuration Standards:
Define specific security configurations for each asset type based on Microsoft's recommendations and industry best practices.
This might involve settings for access control, encryption, logging, and monitoring.
Consider using tools like Azure Policy to enforce these configurations automatically.
Identity and Access Management:
Implement strong identity and access controls (IAM) using Azure Active Directory (AAD).
Utilize features like multi-factor authentication (MFA) and least privilege (just enough access) to minimize access risks.
Patch Management:
Establish a process for regularly patching all azure resources to address known vulnerabilities.
Leverage Azure Security Center or automated tools for vulnerability scanning and patching.
Documentation and Communication:
Document your Azure Cloud Security Baseline clearly, outlining configurations, policies, and procedures.
Communicate these security guidelines to all relevant stakeholders within your organization.
Enforcement and Monitoring:
Implement tools and processes to enforce your security baseline. This could involve Azure Policy, Azure Monitor, and security alerts.
Continuously monitor your Azure environment for security threats and misconfigurations.
Continuous Improvement:
Regularly review and update your security baseline as new threats emerge and Microsoft releases security updates.
Stay informed about the latest cybersecurity best practices and industry standards.
Remember, this is a general process, and specific steps may vary depending on your organization's unique needs and security posture



# \# Common Cloud Misconfigurations



\## Identity and Access Management



\### ASB-IAM-001: Azure Identity Protection Disabled



\*\*Control Objective:\*\* Detect and remediate identity-based threats using risk-based Conditional Access and automated remediation.



\*\*Baseline Requirement:\*\*



\* Enable Microsoft Entra ID Identity Protection.

\* Configure user risk and sign-in risk policies.

\* Integrate Identity Protection alerts with Microsoft Defender and Sentinel.

\* Enable automated remediation for medium and high-risk sign-ins.



\*\*Severity:\*\* High



\---



\### ASB-IAM-002: Insecure Guest User Settings



\*\*Control Objective:\*\* Prevent excessive access by external identities.



\*\*Baseline Requirement:\*\*



\* Restrict guest users from viewing directory information.

\* Limit guest invitations to approved administrators.

\* Enable guest access reviews.

\* Apply Conditional Access policies to guest users.

\* Block legacy authentication for guests.



\*\*Severity:\*\* High



\---



\### ASB-IAM-003: Excessive Guest Accounts



\*\*Control Objective:\*\* Reduce risks from unmanaged external identities.



\*\*Baseline Requirement:\*\*



\* Review guest accounts quarterly.

\* Remove inactive guest users.

\* Enable lifecycle governance and access reviews.

\* Require business justification and sponsorship for guest access.



\*\*Severity:\*\* Medium



\---



\### ASB-IAM-004: Lack of MFA for Privileged Accounts



\*\*Control Objective:\*\* Protect administrative accounts against credential compromise.



\*\*Baseline Requirement:\*\*



\* Require MFA for all privileged roles.

\* Implement Privileged Identity Management (PIM).

\* Require phishing-resistant MFA where possible.

\* Enforce Conditional Access policies.



\*\*Severity:\*\* Critical



\---



\### ASB-IAM-005: Lack of MFA for Device Registration



\*\*Control Objective:\*\* Prevent unauthorized device enrollment.



\*\*Baseline Requirement:\*\*



\* Require MFA for device registration and join operations.

\* Restrict device enrollment to trusted users.

\* Monitor suspicious device registration activity.



\*\*Severity:\*\* High



\---



\### ASB-IAM-006: Unrestricted Azure Administration Portal Access



\*\*Control Objective:\*\* Limit administrative portal access.



\*\*Baseline Requirement:\*\*



\* Restrict Azure portal access using Conditional Access.

\* Require compliant devices.

\* Restrict access from approved locations.

\* Enforce MFA and risk-based authentication.



\*\*Severity:\*\* High



\---



\## Network Security



\### ASB-NET-001: Azure Network Watcher Disabled



\*\*Control Objective:\*\* Enable network visibility and diagnostics.



\*\*Baseline Requirement:\*\*



\* Enable Network Watcher in all Azure regions.

\* Enable NSG Flow Logs.

\* Enable Connection Monitor.

\* Integrate logs with Log Analytics.



\*\*Severity:\*\* Medium



\---



\### ASB-NET-002: Virtual Network Using Basic DDoS Protection



\*\*Control Objective:\*\* Protect internet-facing workloads from volumetric attacks.



\*\*Baseline Requirement:\*\*



\* Enable Azure DDoS Protection Standard on production VNets.

\* Configure DDoS telemetry and alerting.

\* Integrate DDoS alerts with Microsoft Sentinel.



\*\*Severity:\*\* High



\---



\### ASB-NET-003: Network Security Groups Using Any/Any Rules



\*\*Control Objective:\*\* Enforce least privilege network access.



\*\*Baseline Requirement:\*\*



\* Remove inbound and outbound Any/Any rules.

\* Restrict access to required ports and source ranges.

\* Periodically review NSG rules.

\* Implement Azure Firewall where appropriate.



\*\*Severity:\*\* Critical



\---



\### ASB-NET-004: Public IP Address Using Basic SKU



\*\*Control Objective:\*\* Improve network resiliency and security.



\*\*Baseline Requirement:\*\*



\* Use Standard SKU Public IPs.

\* Enable zone redundancy where supported.

\* Associate with NSGs.



\*\*Severity:\*\* Medium



\---



\### ASB-NET-005: Dynamic Public IP Addresses on Internet-Facing Systems



\*\*Control Objective:\*\* Maintain consistent security controls and monitoring.



\*\*Baseline Requirement:\*\*



\* Use Static Public IP addresses for production services.

\* Implement DNS management controls.

\* Monitor public exposure continuously.



\*\*Severity:\*\* Medium



\---



\## Storage Security



\### ASB-STG-001: Blob Storage Anonymous Access Enabled



\*\*Control Objective:\*\* Prevent unauthorized access to storage data.



\*\*Baseline Requirement:\*\*



\* Disable anonymous blob access.

\* Disable public access at account level.

\* Use Microsoft Entra authentication.

\* Review container permissions regularly.



\*\*Severity:\*\* Critical



\---



\### ASB-STG-002: Storage Account Accessible from Internet



\*\*Control Objective:\*\* Restrict storage access to trusted networks.



\*\*Baseline Requirement:\*\*



\* Disable public network access where possible.

\* Implement Private Endpoints.

\* Restrict access using firewall rules.

\* Use trusted Microsoft services exceptions only when required.



\*\*Severity:\*\* High



\---



\### ASB-STG-003: Secure Transfer Not Enforced



\*\*Control Objective:\*\* Protect data in transit.



\*\*Baseline Requirement:\*\*



\* Enable "Secure Transfer Required".

\* Enforce HTTPS-only access.

\* Disable insecure protocols.



\*\*Severity:\*\* High



\---



\## Compute Security



\### ASB-CMP-001: Unencrypted OS and Data Disks



\*\*Control Objective:\*\* Protect data at rest.



\*\*Baseline Requirement:\*\*



\* Enable Azure Disk Encryption or Server-Side Encryption.

\* Use Customer Managed Keys (CMK) where required.

\* Encrypt OS, data, temporary disks, and snapshots.



\*\*Severity:\*\* Critical



\---



\## Application Security



\### ASB-APP-001: HTTPS Only Not Enabled on Web Applications



\*\*Control Objective:\*\* Protect application traffic in transit.



\*\*Baseline Requirement:\*\*



\* Enable HTTPS Only.

\* Enforce TLS 1.2 or higher.

\* Redirect HTTP requests to HTTPS.

\* Disable weak SSL/TLS protocols.



\*\*Severity:\*\* High



\---



\## Security Monitoring and Logging



\### ASB-MON-001: Missing Email Notifications in Microsoft Defender for Cloud



\*\*Control Objective:\*\* Ensure timely security alert notification.



\*\*Baseline Requirement:\*\*



\* Configure security contact information.

\* Enable email notifications for High and Critical alerts.

\* Configure escalation procedures.



\*\*Severity:\*\* Medium



\---



\### ASB-MON-002: Activity Log Monitoring Not Configured



\*\*Control Objective:\*\* Detect unauthorized administrative activity.



\*\*Baseline Requirement:\*\*



\* Export Activity Logs to Log Analytics.

\* Create alerts for:



&#x20; \* RBAC changes

&#x20; \* Policy modifications

&#x20; \* Resource deletions

&#x20; \* Security configuration changes

\* Retain logs according to compliance requirements.



\*\*Severity:\*\* High



\---



\### ASB-MON-003: Metrics Monitoring Not Configured



\*\*Control Objective:\*\* Detect operational and security anomalies.



\*\*Baseline Requirement:\*\*



\* Configure Azure Monitor metrics.

\* Monitor:



&#x20; \* CPU utilization

&#x20; \* Memory utilization

&#x20; \* Network throughput

&#x20; \* Storage utilization

&#x20; \* Availability metrics

\* Configure alert thresholds.



\*\*Severity:\*\* Medium



\---



\### ASB-MON-004: Azure Monitor Alert Rules Missing



\*\*Control Objective:\*\* Provide proactive detection and response.



\*\*Baseline Requirement:\*\*



\* Configure alert rules for:



&#x20; \* Security incidents

&#x20; \* Service outages

&#x20; \* Resource health issues

&#x20; \* Cost anomalies

&#x20; \* Capacity thresholds

\* Route alerts to SOC and incident management systems.



\*\*Severity:\*\* High



\---



\## Microsoft Defender for Cloud



\### ASB-MDC-001: Microsoft Defender for Cloud Using Basic Plan



\*\*Control Objective:\*\* Enable advanced threat detection and posture management.



\*\*Baseline Requirement:\*\*



\* Upgrade to Microsoft Defender for Cloud enhanced plans.

\* Enable Defender for:



&#x20; \* Servers

&#x20; \* Storage

&#x20; \* SQL

&#x20; \* Containers

&#x20; \* Key Vault

&#x20; \* Resource Manager

&#x20; \* DNS

&#x20; \* App Services

\* Enable attack path analysis and CSPM capabilities.



\*\*Severity:\*\* High



\---



\## Compliance Mapping



This baseline aligns with:



\* Center for Internet Security Azure Foundations Benchmark

\* Microsoft (ASB)

\* National Institute of Standards and Technology

\* National Institute of Standards and Technology

\* International Organization for Standardization

\* Cloud Security Alliance



\## Baseline Severity Summary



| Severity | Count |

| -------- | ----- |

| Critical | 4     |

| High     | 12    |

| Medium   | 5     |

| Low      | 0     |



\*\*Critical Priority Remediation:\*\*



1\. Lack of MFA for privileged accounts.

2\. NSG Any/Any rules.

3\. Anonymous Blob Storage access.

4\. Unencrypted OS and Data Disks.



These controls should be enforced through Azure Policy initiatives, Microsoft Defender for Cloud recommendations, and continuous compliance monitoring.





# \# Azure Security Benchmark (ASB) Assessment Template



\## Document Information



| Field             | Value                               |

| ----------------- | ----------------------------------- |

| Assessment Name   | Azure Security Benchmark Assessment |

| Organization      |                                     |

| Azure Tenant      |                                     |

| Assessment Date   |                                     |

| Assessor          |                                     |

| Environment       | Production / Non-Production         |

| Benchmark Version | Azure Security Benchmark v3         |

| Review Period     |                                     |



\---



\# Executive Summary



\## Overall Security Score



| Domain                             | Score (%) |

| ---------------------------------- | --------- |

| Network Security                   |           |

| Identity Management                |           |

| Privileged Access                  |           |

| Data Protection                    |           |

| Posture \& Vulnerability Management |           |

| Logging \& Threat Detection         |           |

| Asset Management                   |           |

| Governance \& Strategy              |           |

| Backup \& Recovery                  |           |

| Overall Score                      |           |



\---



\# Assessment Status Legend



| Status                 | Description                   |

| ---------------------- | ----------------------------- |

| ✅ Compliant            | Control fully implemented     |

| ⚠️ Partially Compliant | Control partially implemented |

| ❌ Non-Compliant        | Control not implemented       |

| N/A                    | Not applicable                |



\---



\# NS - Network Security



\## NS-1 Establish Network Segmentation Boundaries



\*\*Security Principle\*\*



Implement network segmentation aligned with enterprise security architecture.



\*\*Assessment\*\*



| Item                                   | Status | Evidence | Comments |

| -------------------------------------- | ------ | -------- | -------- |

| Virtual Networks segmented by workload |        |          |          |

| Production and Non-Production isolated |        |          |          |

| Sensitive workloads isolated           |        |          |          |

| NSGs configured                        |        |          |          |

| Application Security Groups used       |        |          |          |



\*\*Azure Services\*\*



\* Virtual Network

\* Network Security Groups

\* Application Security Groups

\* Azure Firewall



\---



\## NS-2 Secure Cloud Services with Network Controls



| Item                                  | Status | Evidence | Comments |

| ------------------------------------- | ------ | -------- | -------- |

| Private Endpoints deployed            |        |          |          |

| Public Access disabled where possible |        |          |          |

| Storage Accounts protected            |        |          |          |

| SQL Private Link enabled              |        |          |          |

| Key Vault Private Endpoint enabled    |        |          |          |



\---



\## NS-3 Deploy Firewall at Enterprise Edge



| Item                                   | Status | Evidence | Comments |

| -------------------------------------- | ------ | -------- | -------- |

| Azure Firewall deployed                |        |          |          |

| Hub-and-Spoke architecture implemented |        |          |          |

| UDRs configured                        |        |          |          |

| Egress filtering enabled               |        |          |          |

| Threat intelligence mode enabled       |        |          |          |



\---



\## NS-4 Deploy IDS/IPS



| Item                                 | Status | Evidence | Comments |

| ------------------------------------ | ------ | -------- | -------- |

| Azure Firewall Premium IDPS enabled  |        |          |          |

| Defender for Endpoint deployed       |        |          |          |

| Security alerts integrated with SIEM |        |          |          |



\---



\## NS-5 Deploy DDoS Protection



| Item                                   | Status | Evidence | Comments |

| -------------------------------------- | ------ | -------- | -------- |

| DDoS Standard enabled                  |        |          |          |

| Internet-facing applications protected |        |          |          |



\---



\## NS-6 Deploy Web Application Firewall



| Item                            | Status | Evidence | Comments |

| ------------------------------- | ------ | -------- | -------- |

| Application Gateway WAF enabled |        |          |          |

| Front Door WAF enabled          |        |          |          |

| OWASP rules active              |        |          |          |

| Prevention mode enabled         |        |          |          |



\---



\# IM - Identity Management



\## IM-1 Centralized Identity Management



| Item                                      | Status | Evidence | Comments |

| ----------------------------------------- | ------ | -------- | -------- |

| Entra ID used as authoritative IdP        |        |          |          |

| On-prem AD synchronized securely          |        |          |          |

| Third-party apps integrated with Entra ID |        |          |          |



\---



\## IM-2 Protect Identity Systems



| Item                           | Status | Evidence | Comments |

| ------------------------------ | ------ | -------- | -------- |

| Identity Secure Score reviewed |        |          |          |

| Legacy authentication blocked  |        |          |          |

| Risk-based policies enabled    |        |          |          |



\---



\## IM-3 Managed Identities



| Item                          | Status | Evidence | Comments |

| ----------------------------- | ------ | -------- | -------- |

| Managed Identities used       |        |          |          |

| Service Principals reviewed   |        |          |          |

| Credential rotation automated |        |          |          |



\---



\## IM-6 Strong Authentication



| Item                      | Status | Evidence | Comments |

| ------------------------- | ------ | -------- | -------- |

| MFA enabled for all users |        |          |          |

| MFA enabled for admins    |        |          |          |

| Passwordless enabled      |        |          |          |

| FIDO2 supported           |        |          |          |



\---



\## IM-7 Conditional Access



| Item                           | Status | Evidence | Comments |

| ------------------------------ | ------ | -------- | -------- |

| Conditional Access implemented |        |          |          |

| Block legacy authentication    |        |          |          |

| Require MFA for admins         |        |          |          |

| Device compliance required     |        |          |          |

| Risk-based policies configured |        |          |          |



\---



\# PA - Privileged Access



\## PA-1 Limit Administrative Accounts



| Item                              | Status | Evidence | Comments |

| --------------------------------- | ------ | -------- | -------- |

| Number of Global Admins minimized |        |          |          |

| Subscription Owners limited       |        |          |          |

| Emergency accounts separated      |        |          |          |



\---



\## PA-2 Just-In-Time Access



| Item                      | Status | Evidence | Comments |

| ------------------------- | ------ | -------- | -------- |

| PIM enabled               |        |          |          |

| Eligible assignments used |        |          |          |

| JIT VM Access enabled     |        |          |          |



\---



\## PA-4 Access Reviews



| Item                     | Status | Evidence | Comments |

| ------------------------ | ------ | -------- | -------- |

| Quarterly access reviews |        |          |          |

| Stale accounts removed   |        |          |          |

| Guest accounts reviewed  |        |          |          |



\---



\## PA-5 Emergency Access Accounts



| Item                       | Status | Evidence | Comments |

| -------------------------- | ------ | -------- | -------- |

| Break-glass accounts exist |        |          |          |

| MFA excluded appropriately |        |          |          |

| Monitoring enabled         |        |          |          |



\---



\# DP - Data Protection



\## DP-1 Data Discovery \& Classification



| Item                          | Status | Evidence | Comments |

| ----------------------------- | ------ | -------- | -------- |

| Microsoft Purview deployed    |        |          |          |

| Data classification performed |        |          |          |

| Sensitive data labeled        |        |          |          |



\---



\## DP-2 Data Threat Monitoring



| Item                           | Status | Evidence | Comments |

| ------------------------------ | ------ | -------- | -------- |

| Defender for Storage enabled   |        |          |          |

| Defender for SQL enabled       |        |          |          |

| Exfiltration monitoring active |        |          |          |



\---



\## DP-3 Data In Transit Encryption



| Item                             | Status | Evidence | Comments |

| -------------------------------- | ------ | -------- | -------- |

| TLS 1.2+ enforced                |        |          |          |

| HTTPS-only enabled               |        |          |          |

| Secure Transfer Required enabled |        |          |          |



\---



\## DP-4 Data At Rest Encryption



| Item                       | Status | Evidence | Comments |

| -------------------------- | ------ | -------- | -------- |

| Storage encryption enabled |        |          |          |

| SQL TDE enabled            |        |          |          |

| Disk encryption enabled    |        |          |          |



\---



\## DP-5 Customer Managed Keys



| Item                           | Status | Evidence | Comments |

| ------------------------------ | ------ | -------- | -------- |

| CMK implemented where required |        |          |          |

| Key rotation documented        |        |          |          |



\---



\## DP-6 Key Management



| Item                      | Status | Evidence | Comments |

| ------------------------- | ------ | -------- | -------- |

| Azure Key Vault used      |        |          |          |

| Key rotation enabled      |        |          |          |

| Key expiration configured |        |          |          |



\---



\## DP-8 Key Vault Security



| Item                     | Status | Evidence | Comments |

| ------------------------ | ------ | -------- | -------- |

| Soft Delete enabled      |        |          |          |

| Purge Protection enabled |        |          |          |

| Private Endpoint enabled |        |          |          |

| Logging enabled          |        |          |          |



\---



\# PV - Posture \& Vulnerability Management



\## PV-1 Secure Configuration Baselines



| Item                              | Status | Evidence | Comments |

| --------------------------------- | ------ | -------- | -------- |

| Security baselines defined        |        |          |          |

| Azure Policies assigned           |        |          |          |

| Landing Zone controls implemented |        |          |          |



\---



\## PV-2 Secure Configuration Enforcement



| Item                               | Status | Evidence | Comments |

| ---------------------------------- | ------ | -------- | -------- |

| Azure Policy enforcement enabled   |        |          |          |

| Non-compliant resources remediated |        |          |          |

| Compliance dashboard reviewed      |        |          |          |



\---



\## PV-3 Compute Security Baselines



| Item                     | Status | Evidence | Comments |

| ------------------------ | ------ | -------- | -------- |

| Windows baseline applied |        |          |          |

| Linux baseline applied   |        |          |          |

| Secure VM templates used |        |          |          |



\---



\## PV-4 Compute Configuration Monitoring



| Item                        | Status | Evidence | Comments |

| --------------------------- | ------ | -------- | -------- |

| Guest Configuration enabled |        |          |          |

| Secure Boot enabled         |        |          |          |

| vTPM enabled                |        |          |          |

| Attestation enabled         |        |          |          |



\---



\## PV-5 Vulnerability Assessment



| Item                                      | Status | Evidence | Comments |

| ----------------------------------------- | ------ | -------- | -------- |

| Defender Vulnerability Assessment enabled |        |          |          |

| Container image scanning enabled          |        |          |          |

| SQL Vulnerability Assessment enabled      |        |          |          |

| Remediation tracked                       |        |          |          |



\---



\# Logging \& Monitoring



\## Microsoft Defender for Cloud



| Control                 | Status | Evidence | Comments |

| ----------------------- | ------ | -------- | -------- |

| Defender CSPM Enabled   |        |          |          |

| Defender for Servers    |        |          |          |

| Defender for Storage    |        |          |          |

| Defender for SQL        |        |          |          |

| Defender for Containers |        |          |          |

| Defender for Key Vault  |        |          |          |



\---



\## Microsoft Sentinel



| Control                        | Status | Evidence | Comments |

| ------------------------------ | ------ | -------- | -------- |

| Sentinel Enabled               |        |          |          |

| Data Connectors Configured     |        |          |          |

| Analytics Rules Enabled        |        |          |          |

| Incident Automation Configured |        |          |          |



\---



\# Compliance Mapping



| Framework                                 | Applicable  |

| ----------------------------------------- | ----------- |

| Azure Security Benchmark v3               | Yes         |

| CIS Microsoft Azure Foundations Benchmark | Yes         |

| NIST CSF 2.0                              | Yes         |

| NIST SP 800-53                            | Yes         |

| ISO 27001:2022                            | Yes         |

| SOC 2                                     | Yes         |

| PCI DSS                                   | As Required |

| HIPAA                                     | As Required |



\---



\# Findings Register



| Finding ID | ASB Control | Severity | Description | Remediation | Owner | Due Date | Status |

| ---------- | ----------- | -------- | ----------- | ----------- | ----- | -------- | ------ |

|            |             | Critical |             |             |       |          |        |

|            |             | High     |             |             |       |          |        |

|            |             | Medium   |             |             |       |          |        |

|            |             | Low      |             |             |       |          |        |



\---



\# Sign-Off



| Role                   | Name | Signature | Date |

| ---------------------- | ---- | --------- | ---- |

| Security Assessor      |      |           |      |

| Azure Platform Owner   |      |           |      |

| Cloud Security Manager |      |           |      |

| CISO                   |      |           |      |



\---

