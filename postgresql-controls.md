# Azure Database for PostgreSQL (PaaS) Security Controls

The following controls apply to **Azure Database for PostgreSQL – Flexible Server (recommended)** and, where applicable, Single Server (legacy). They align with Microsoft security baselines, CIS Microsoft Azure Foundations Benchmark, NIST SP 800-53, NIST Cybersecurity Framework (CSF), ISO/IEC 27001, and enterprise cloud security best practices.

---

# 1. Identity & Access Management

## Control Objectives

* Enforce least privilege
* Centralize authentication
* Protect privileged accounts
* Eliminate shared credentials

### Security Controls

* Integrate Azure Database for PostgreSQL with Microsoft Entra ID authentication.
* Disable password authentication where Microsoft Entra-only authentication is supported and operationally feasible.
* Use individual user accounts; prohibit shared administrator accounts.
* Apply least-privilege database roles.
* Separate administrative and application accounts.
* Use Managed Identities for Azure services connecting to PostgreSQL where supported.
* Require Multi-Factor Authentication (MFA) for database administrators through Microsoft Entra ID.
* Enable Privileged Identity Management (PIM) for privileged Azure roles.
* Review privileged access regularly.
* Remove inactive users and unused accounts.
* Rotate administrative credentials regularly.
* Monitor failed authentication attempts.

---

# 2. Network Security

## Security Controls

* Deploy PostgreSQL using Private Access (VNet Integration).
* Disable Public Network Access.
* Use Private Endpoints for client connectivity where applicable.
* Restrict inbound access using firewall rules if public access is temporarily required.
* Allow only approved source IP addresses.
* Remove broad firewall rules (e.g., `0.0.0.0/0`).
* Enable Network Security Groups (NSGs) to restrict subnet traffic.
* Route outbound traffic through Azure Firewall where required.
* Enable DNS resolution for private endpoints.
* Restrict cross-region network connectivity unless required.
* Monitor network access attempts.

---

# 3. Encryption

## Security Controls

* Enable encryption at rest (enabled by default).
* Use Customer-Managed Keys (CMK) where regulatory or organizational requirements exist.
* Store encryption keys in Azure Key Vault.
* Rotate Customer-Managed Keys periodically.
* Enable encryption in transit using TLS.
* Enforce TLS 1.2 or later.
* Disable legacy TLS versions.
* Prevent unencrypted client connections.
* Validate server certificates.

---

# 4. Authentication & Authorization

## Security Controls

* Use Microsoft Entra authentication for administrators and users where supported.
* Avoid using the default PostgreSQL administrator account for routine operations.
* Grant permissions using database roles.
* Revoke unnecessary privileges.
* Restrict SUPERUSER-equivalent capabilities.
* Separate application, reporting, and administrative accounts.
* Audit role assignments regularly.
* Enforce strong password policies for local accounts (if used).

---

# 5. Database Configuration

## Security Controls

* Configure secure server parameters.
* Disable unnecessary extensions.
* Allow only approved PostgreSQL extensions.
* Restrict creation of untrusted extensions.
* Review configuration changes regularly.
* Enable automatic minor version updates where supported.
* Upgrade PostgreSQL major versions within the supported lifecycle.
* Remove unused databases.
* Remove unused schemas.
* Remove unused roles.

---

# 6. Secrets Management

## Security Controls

* Store database credentials in Azure Key Vault.
* Never hardcode credentials in application code.
* Use Managed Identity instead of stored passwords where possible.
* Rotate database passwords regularly.
* Rotate secrets automatically.
* Audit secret access.
* Restrict Key Vault access using RBAC and Private Endpoints.

---

# 7. Logging & Auditing

## Security Controls

* Enable PostgreSQL server logs.
* Enable Azure Diagnostic Settings.
* Send logs to Log Analytics.
* Forward logs to Microsoft Sentinel.
* Monitor authentication failures.
* Monitor administrative actions.
* Monitor configuration changes.
* Monitor failed connections.
* Monitor long-running queries.
* Monitor privilege escalation attempts.
* Monitor database object changes.
* Enable query performance insights where appropriate.

---

# 8. Threat Protection

## Security Controls

* Enable Microsoft Defender for Open-Source Relational Databases (PostgreSQL).
* Monitor anomalous login activity.
* Detect SQL injection attempts.
* Detect brute-force attacks.
* Detect suspicious data access patterns.
* Detect unusual administrative operations.
* Detect privilege escalation.
* Investigate high-severity security alerts promptly.
* Integrate alerts with Microsoft Sentinel or another SIEM.

---

# 9. Backup & Recovery

## Security Controls

* Enable automatic backups.
* Configure backup retention according to business requirements.
* Enable geo-redundant backups where required.
* Protect backup data using encryption.
* Test database restoration regularly.
* Document disaster recovery procedures.
* Verify backup integrity.
* Restrict access to backup operations.

---

# 10. High Availability

## Security Controls

* Enable Zone-Redundant High Availability where supported.
* Use regional redundancy for critical workloads.
* Monitor replication health.
* Monitor failover events.
* Test failover procedures periodically.
* Document recovery time objectives (RTO) and recovery point objectives (RPO).

---

# 11. Monitoring

## Security Controls

* Monitor CPU utilization.
* Monitor memory utilization.
* Monitor storage usage.
* Monitor connection counts.
* Monitor query performance.
* Monitor replication lag.
* Monitor failed logins.
* Monitor configuration changes.
* Monitor firewall changes.
* Monitor service availability.
* Configure alert rules for critical metrics.

---

# 12. Data Protection

## Security Controls

* Classify sensitive data.
* Encrypt sensitive application data where required.
* Implement data masking at the application layer where appropriate.
* Apply least-privilege data access.
* Restrict export operations.
* Restrict bulk data extraction.
* Monitor large data exports.
* Monitor unusual query volumes.
* Implement data retention policies.

---

# 13. Operational Security

## Security Controls

* Apply Infrastructure as Code (IaC) for deployments.
* Use Azure Policy to enforce configuration standards.
* Tag database resources consistently.
* Implement change management for configuration updates.
* Review firewall rules regularly.
* Review role assignments regularly.
* Review configuration baselines regularly.
* Perform periodic vulnerability assessments.
* Remove unused resources promptly.
* Document administrative procedures.

---

# 14. Compliance & Governance

## Security Controls

* Enable Microsoft Defender for Cloud recommendations.
* Apply Azure Policy for PostgreSQL resources.
* Monitor compliance continuously.
* Review Azure Advisor recommendations.
* Enable resource locks for production servers where appropriate.
* Maintain audit evidence.
* Perform periodic security assessments.
* Align configurations with organizational security baselines.

---

# 15. Business Continuity

## Security Controls

* Document disaster recovery plans.
* Define Recovery Time Objectives (RTO).
* Define Recovery Point Objectives (RPO).
* Perform regular recovery testing.
* Maintain secondary-region recovery procedures.
* Validate application connectivity after recovery.
* Monitor backup success and failures.

---

# Enterprise Baseline (Recommended)

For a production Azure Database for PostgreSQL (Flexible Server) deployment, enable the following by default:

* Private Access (VNet Integration) or Private Endpoint connectivity
* Public Network Access disabled
* Microsoft Entra ID authentication enabled
* Least-privilege RBAC and database roles
* TLS 1.2 or later enforced
* Encryption at rest enabled (Customer-Managed Keys where required)
* Credentials stored in Azure Key Vault
* Microsoft Defender for Open-Source Relational Databases enabled
* Diagnostic Settings configured to send logs to Log Analytics
* Microsoft Sentinel integration for security monitoring
* Automatic backups enabled with appropriate retention
* Geo-redundant backups for critical workloads
* Zone-Redundant High Availability for production databases
* Azure Policy enforcing approved configurations
* Continuous monitoring, alerting, and compliance assessment
* Regular review of firewall rules, role assignments, and security posture
