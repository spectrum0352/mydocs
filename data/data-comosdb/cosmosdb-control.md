# Azure Cosmos DB (PaaS) Security Controls

The following controls apply to **Azure Cosmos DB** (Core (SQL) API, MongoDB, Cassandra, Gremlin, PostgreSQL, and Table APIs where applicable). These controls align with Microsoft security baselines, CIS Microsoft Azure Foundations Benchmark, NIST SP 800-53, NIST SP 800-190 (for containerized workloads accessing Cosmos DB), ISO/IEC 27001, PCI DSS, and enterprise cloud security best practices.

---

# 1. Identity & Access Management

## Control Objectives

* Enforce least privilege
* Eliminate shared secrets
* Centralize identity management
* Protect privileged access

### Security Controls

* Enable Microsoft Entra ID authentication with Azure RBAC for the Cosmos DB control plane.
* Use Azure Cosmos DB native data-plane RBAC where supported instead of account keys.
* Use Managed Identities for Azure services accessing Cosmos DB.
* Avoid embedding account keys in applications.
* Assign least-privilege roles to users and applications.
* Separate administrative and application identities.
* Enable Privileged Identity Management (PIM) for privileged Azure roles.
* Require Multi-Factor Authentication (MFA) for administrators.
* Review RBAC assignments regularly.
* Remove inactive identities and unused service principals.
* Rotate credentials and tokens regularly.
* Audit privileged access periodically.

---

# 2. Authentication & Authorization

## Security Controls

* Prefer Microsoft Entra ID authentication over account keys.
* Disable local authentication (account keys) where supported and operationally feasible.
* Rotate Cosmos DB account keys regularly.
* Regenerate keys immediately after suspected compromise.
* Use read-only keys only where required.
* Use separate credentials for production and non-production environments.
* Restrict access using Azure RBAC and Cosmos DB data-plane RBAC.
* Implement application-level authorization for sensitive operations.

---

# 3. Network Security

## Security Controls

* Disable Public Network Access.
* Use Private Endpoints for all production Cosmos DB accounts.
* Restrict access to approved virtual networks using Virtual Network Service Endpoints or Private Link.
* Configure IP firewall rules when public access is temporarily required.
* Remove broad IP ranges such as `0.0.0.0/0`.
* Restrict access to approved Azure services only where necessary.
* Use Azure Firewall for controlled outbound access.
* Enable private DNS resolution for Private Endpoints.
* Monitor network access attempts.
* Separate production and non-production network connectivity.

---

# 4. Encryption

## Security Controls

* Ensure encryption at rest is enabled (default).
* Use Customer-Managed Keys (CMK) where regulatory or organizational requirements exist.
* Store encryption keys in Azure Key Vault.
* Rotate Customer-Managed Keys periodically.
* Enforce TLS 1.2 or later for all client connections.
* Disable legacy TLS versions.
* Validate server certificates.
* Encrypt sensitive application data before storage where required.
* Protect backup encryption keys.

---

# 5. Data Protection

## Security Controls

* Classify data stored in Cosmos DB.
* Minimize storage of sensitive data.
* Encrypt highly sensitive fields at the application layer.
* Apply data retention and deletion policies.
* Restrict bulk export operations.
* Restrict analytical workloads to approved identities.
* Monitor large data extraction events.
* Prevent unauthorized cross-region replication access.
* Enable point-in-time restore (where supported).

---

# 6. Secrets Management

## Security Controls

* Store connection strings and credentials in Azure Key Vault.
* Never hardcode account keys in source code.
* Use Managed Identity instead of connection strings where supported.
* Rotate secrets regularly.
* Restrict Key Vault access using Azure RBAC.
* Protect Key Vault using Private Endpoints.
* Audit secret access.

---

# 7. Logging & Auditing

## Security Controls

* Enable Azure Diagnostic Settings.
* Send logs to Azure Monitor Logs (Log Analytics).
* Forward logs to Microsoft Sentinel.
* Enable resource logs.
* Monitor authentication failures.
* Monitor authorization failures.
* Monitor account key usage.
* Monitor firewall changes.
* Monitor Private Endpoint changes.
* Monitor configuration changes.
* Audit RBAC changes.
* Retain logs according to compliance requirements.

---

# 8. Threat Protection

## Security Controls

* Enable Microsoft Defender for Cosmos DB.
* Monitor anomalous authentication attempts.
* Detect unusual data access patterns.
* Detect excessive query activity.
* Detect potential data exfiltration.
* Detect suspicious account key usage.
* Detect privilege escalation attempts.
* Investigate high-severity alerts promptly.
* Integrate alerts with Microsoft Sentinel or another SIEM.

---

# 9. Availability & Resilience

## Security Controls

* Enable multi-region replication for critical workloads.
* Configure automatic failover.
* Monitor replication health.
* Validate failover configuration.
* Test disaster recovery procedures regularly.
* Define Recovery Time Objectives (RTO).
* Define Recovery Point Objectives (RPO).
* Monitor regional availability.

---

# 10. Backup & Recovery

## Security Controls

* Enable continuous backup or periodic backup based on business requirements.
* Configure backup retention appropriately.
* Enable point-in-time restore where supported.
* Restrict backup management permissions.
* Test backup restoration regularly.
* Verify backup integrity.
* Document recovery procedures.

---

# 11. Monitoring

## Security Controls

* Monitor request units (RU/s) consumption.
* Monitor throttling events (HTTP 429).
* Monitor failed requests.
* Monitor latency.
* Monitor storage utilization.
* Monitor partition utilization.
* Monitor connection counts.
* Monitor replication status.
* Configure alerts for abnormal activity.
* Monitor availability metrics.

---

# 12. Operational Security

## Security Controls

* Deploy Cosmos DB using Infrastructure as Code (IaC).
* Enforce security standards using Azure Policy.
* Tag Cosmos DB resources consistently.
* Implement change management for configuration updates.
* Review firewall rules regularly.
* Review RBAC assignments regularly.
* Review network configuration periodically.
* Remove unused databases, containers, and accounts.
* Perform periodic security reviews.

---

# 13. Compliance & Governance

## Security Controls

* Enable Microsoft Defender for Cloud recommendations.
* Apply Azure Policy to enforce approved configurations.
* Monitor compliance continuously.
* Review Azure Advisor recommendations.
* Apply Resource Locks to production Cosmos DB accounts where appropriate.
* Maintain audit evidence.
* Conduct periodic compliance assessments.
* Align deployments with organizational security baselines.

---

# 14. Performance & Cost Governance

## Security Controls

* Configure autoscale where appropriate.
* Define maximum RU/s limits.
* Monitor unexpected spikes in throughput.
* Restrict unnecessary cross-region replication.
* Review partition strategy regularly.
* Optimize indexing policies.
* Remove unused indexes.
* Monitor excessive query costs.

---

# 15. Business Continuity

## Security Controls

* Document disaster recovery procedures.
* Define RTO and RPO requirements.
* Test regional failover periodically.
* Verify application connectivity after failover.
* Validate backup recovery procedures.
* Maintain secondary-region operational readiness.

---

# 16. Data Governance

## Security Controls

* Enforce data ownership.
* Apply data classification labels.
* Monitor data lifecycle.
* Implement secure data deletion procedures.
* Restrict data sharing.
* Review access permissions regularly.
* Monitor data exports.
* Protect sensitive datasets with additional encryption where required.

---

# Enterprise Baseline (Recommended)

For a production Azure Cosmos DB deployment, enable the following by default:

* Microsoft Entra ID authentication with Azure RBAC for the control plane
* Azure Cosmos DB native data-plane RBAC (where supported)
* Managed Identities for application access
* Public Network Access disabled
* Private Endpoints for all production accounts
* Private DNS integration
* IP firewall rules restricted to approved networks (if public access is required)
* TLS 1.2 or later enforced
* Encryption at rest enabled (Customer-Managed Keys where required)
* Azure Key Vault for secrets and key management
* Microsoft Defender for Cosmos DB enabled
* Diagnostic Settings configured to send logs to Log Analytics
* Microsoft Sentinel integration for security monitoring
* Continuous Backup with Point-in-Time Restore for critical workloads
* Multi-region replication with automatic failover
* Azure Policy enforcing approved configurations
* Resource Locks applied to production Cosmos DB accounts
* Continuous monitoring, alerting, and compliance assessment
* Regular review of RBAC assignments, network configuration, backup status, and overall security posture
