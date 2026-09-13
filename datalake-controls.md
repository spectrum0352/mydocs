# Azure Data Lake Storage Gen2 (ADLS Gen2) Security Controls

The following controls apply to **Azure Data Lake Storage Gen2 (ADLS Gen2)**, which is built on Azure Storage Accounts with the hierarchical namespace enabled. These controls align with Microsoft security baselines, CIS Microsoft Azure Foundations Benchmark, NIST SP 800-53, ISO/IEC 27001, PCI DSS, SOC 2, and enterprise cloud security best practices.

---

# 1. Identity & Access Management

## Control Objectives

* Enforce least privilege
* Eliminate shared credentials
* Centralize identity management
* Protect privileged access

### Security Controls

* Integrate Azure Data Lake with Microsoft Entra ID.
* Use Azure RBAC for management-plane access.
* Use Access Control Lists (ACLs) for data-plane authorization.
* Assign least-privilege roles to users, groups, and applications.
* Use security groups instead of assigning permissions directly to users.
* Separate administrative, operational, and application identities.
* Use Managed Identities for Azure services accessing Data Lake.
* Enable Privileged Identity Management (PIM) for privileged Azure roles.
* Require Multi-Factor Authentication (MFA) for administrators.
* Review RBAC and ACL assignments regularly.
* Remove inactive identities and unused service principals.
* Audit privileged access periodically.

---

# 2. Authentication & Authorization

## Security Controls

* Use Microsoft Entra ID authentication for all users and applications.
* Disable Shared Key authorization where supported.
* Disable anonymous access.
* Avoid using Storage Account access keys for applications.
* Use Azure AD OAuth tokens for authentication.
* Rotate Storage Account keys regularly if Shared Key access is required.
* Use Shared Access Signatures (SAS) only when necessary.
* Generate short-lived SAS tokens.
* Restrict SAS permissions to the minimum required.
* Use User Delegation SAS instead of Account SAS where possible.
* Monitor SAS token usage.

---

# 3. Network Security

## Security Controls

* Disable Public Network Access.
* Use Private Endpoints for all production Data Lake Storage accounts.
* Restrict access to approved virtual networks.
* Enable Storage Account firewall.
* Allow only approved IP addresses when public access is required.
* Remove broad IP ranges (e.g., `0.0.0.0/0`).
* Use Azure Firewall or a Network Virtual Appliance (NVA) to control outbound traffic.
* Enable Private DNS integration for Private Endpoints.
* Restrict cross-region access unless required.
* Monitor network access attempts.

---

# 4. Encryption

## Security Controls

* Ensure encryption at rest is enabled (default).
* Use Customer-Managed Keys (CMK) where regulatory or organizational requirements exist.
* Store encryption keys in Azure Key Vault.
* Rotate Customer-Managed Keys periodically.
* Enable Infrastructure Encryption (double encryption) for highly sensitive data where required.
* Enforce TLS 1.2 or later.
* Disable legacy TLS versions.
* Validate server certificates.
* Encrypt highly sensitive data at the application layer where required.

---

# 5. Data Protection

## Security Controls

* Classify data according to organizational data classification policies.
* Apply least-privilege access to files and directories.
* Implement folder-level ACL inheritance appropriately.
* Restrict write access to authorized users.
* Prevent unauthorized deletion of critical data.
* Enable Soft Delete for blobs.
* Enable Versioning where supported.
* Enable Blob Change Feed for auditability.
* Enable Point-in-Time Restore where applicable.
* Protect sensitive datasets using encryption and access controls.
* Monitor bulk download and upload operations.

---

# 6. Secrets Management

## Security Controls

* Store secrets in Azure Key Vault.
* Use Managed Identities instead of stored credentials.
* Never hardcode Storage Account keys or SAS tokens in source code.
* Rotate secrets regularly.
* Restrict Key Vault access using Azure RBAC.
* Protect Key Vault using Private Endpoints.
* Audit secret access.

---

# 7. Logging & Auditing

## Security Controls

* Enable Azure Storage diagnostic logs.
* Configure Diagnostic Settings.
* Send logs to Log Analytics.
* Forward logs to Microsoft Sentinel.
* Enable Storage Read, Write, and Delete logging.
* Monitor authentication failures.
* Monitor authorization failures.
* Monitor ACL changes.
* Monitor RBAC changes.
* Monitor Storage Account configuration changes.
* Monitor firewall and Private Endpoint changes.
* Retain logs according to compliance requirements.

---

# 8. Threat Protection

## Security Controls

* Enable Microsoft Defender for Storage.
* Detect anomalous access patterns.
* Detect suspicious authentication attempts.
* Detect malware uploaded to Storage (where malware scanning is enabled).
* Detect unusual data downloads.
* Detect potential ransomware activity.
* Detect suspicious Shared Access Signature (SAS) usage.
* Investigate high-severity security alerts promptly.
* Integrate alerts with Microsoft Sentinel or another SIEM.

---

# 9. Data Governance

## Security Controls

* Apply Microsoft Purview for data discovery and classification.
* Maintain a data catalog.
* Apply sensitivity labels where applicable.
* Implement data retention policies.
* Implement secure data deletion procedures.
* Restrict cross-business-unit data access.
* Monitor data sharing activities.
* Review data ownership periodically.
* Audit access to regulated datasets.

---

# 10. Backup & Recovery

## Security Controls

* Enable Soft Delete for blobs and containers.
* Enable Blob Versioning.
* Enable Point-in-Time Restore where supported.
* Configure Geo-Redundant Storage (GRS) or Read-Access Geo-Redundant Storage (RA-GRS) for critical workloads.
* Restrict backup management permissions.
* Test recovery procedures regularly.
* Verify backup integrity.
* Document disaster recovery procedures.

---

# 11. Monitoring

## Security Controls

* Monitor storage capacity.
* Monitor transaction volume.
* Monitor ingress and egress traffic.
* Monitor authentication failures.
* Monitor failed authorization attempts.
* Monitor unusual download activity.
* Monitor data deletion events.
* Monitor SAS token usage.
* Monitor replication status.
* Configure alerts for abnormal activity.

---

# 12. Operational Security

## Security Controls

* Deploy Data Lake resources using Infrastructure as Code (IaC).
* Enforce security standards using Azure Policy.
* Tag Storage Accounts consistently.
* Implement change management for configuration updates.
* Review firewall rules regularly.
* Review RBAC and ACL assignments regularly.
* Remove unused containers and directories.
* Remove unused identities.
* Perform periodic security reviews.

---

# 13. Compliance & Governance

## Security Controls

* Enable Microsoft Defender for Cloud recommendations.
* Apply Azure Policy to enforce approved Storage Account configurations.
* Monitor compliance continuously.
* Review Azure Advisor recommendations.
* Apply Resource Locks to production Storage Accounts where appropriate.
* Maintain audit evidence.
* Conduct periodic compliance assessments.
* Align configurations with organizational security baselines.

---

# 14. Availability & Business Continuity

## Security Controls

* Use Zone-Redundant Storage (ZRS) or Geo-Redundant Storage (GRS) based on business requirements.
* Monitor replication health.
* Define Recovery Time Objectives (RTO).
* Define Recovery Point Objectives (RPO).
* Test disaster recovery procedures periodically.
* Validate application connectivity after failover.
* Monitor storage service health.
* Document business continuity procedures.

---

# 15. Data Lifecycle Management

## Security Controls

* Configure Lifecycle Management policies for data retention and archival.
* Automatically transition infrequently accessed data to Cool or Archive tiers.
* Automatically delete expired data according to retention requirements.
* Review lifecycle policies periodically.
* Monitor lifecycle policy execution.
* Prevent accidental deletion of active datasets.

---

# Enterprise Baseline (Recommended)

For a production Azure Data Lake Storage Gen2 deployment, enable the following by default:

* Hierarchical Namespace enabled
* Microsoft Entra ID authentication
* Azure RBAC for management-plane access
* POSIX ACLs for data-plane authorization
* Managed Identities for application access
* Shared Key access disabled (where supported)
* Anonymous access disabled
* Public Network Access disabled
* Private Endpoints for all production Storage Accounts
* Storage Account firewall restricted to approved networks
* TLS 1.2 or later enforced
* Encryption at rest enabled (Customer-Managed Keys where required)
* Infrastructure Encryption enabled for highly sensitive workloads
* Azure Key Vault for key and secret management
* Microsoft Defender for Storage enabled
* Microsoft Defender for Cloud recommendations enabled
* Microsoft Purview for data discovery, classification, and governance
* Diagnostic Settings configured to send logs to Log Analytics
* Microsoft Sentinel integration for centralized security monitoring
* Soft Delete, Blob Versioning, and Change Feed enabled
* Geo-Redundant Storage (GRS/RA-GRS) or Zone-Redundant Storage (ZRS) configured based on business continuity requirements
* Azure Policy enforcing approved Storage Account configurations
* Resource Locks applied to production Storage Accounts
* Continuous monitoring, alerting, compliance assessment, and periodic review of RBAC, ACLs, networking, and data access patterns.
