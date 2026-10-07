# Azure Cloud Network Security Audit Checklist

> **Version:** 1.0
> **Document Type:** Enterprise Security Audit Checklist
> **Platform:** Microsoft Azure
> **Target Audience:** Cloud Security Architects, Security Engineers, Internal Audit, Risk & Compliance, SOC, Infrastructure Teams
> **Repository:** GitHub Documentation
> **Document Format:** Markdown (.md)

---

## Purpose

This document provides a comprehensive audit checklist for assessing the security posture of Microsoft Azure network infrastructure.

The checklist aligns with:

* Microsoft Cloud Security Benchmark (MCSB)
* Azure Well-Architected Framework
* CIS Microsoft Azure Foundations Benchmark
* NIST Cybersecurity Framework (CSF)
* NIST SP 800-53 Rev.5
* ISO/IEC 27001:2022
* Zero Trust Architecture
* Microsoft Enterprise Landing Zone Guidance

The checklist is intended for:

* Security Architecture Reviews
* Internal Security Audits
* External Compliance Assessments
* Cloud Security Baseline Validation
* Azure Landing Zone Reviews
* Security Design Reviews
* Production Readiness Assessments

---

# Audit Columns

| Column                  | Description                      |
| ----------------------- | -------------------------------- |
| Control Domain          | Security domain                  |
| Control ID              | Unique control identifier        |
| Control Description     | Security control being validated |
| Azure Service / Feature | Applicable Azure service         |
| Audit Question          | Validation question              |
| Expected Configuration  | Secure expected configuration    |
| Current State           | Yes / No / Partial / N/A         |
| Risk Level              | High / Medium / Low              |
| Evidence / Notes        | Supporting evidence              |
| Remediation Required    | Yes / No                         |
| Owner                   | Responsible team                 |
| Target Remediation Date | Due date                         |
| Status                  | Open / In Progress / Closed      |

---

# Control Domains

| Domain                            | Approximate Controls |
| --------------------------------- | -------------------: |
| Governance & Network Architecture |                   15 |
| Virtual Network Security          |                   15 |
| Hub-Spoke / Virtual WAN           |                   15 |
| Azure Firewall                    |                   30 |
| Network Security Groups           |                   25 |
| Application Security Groups       |                   10 |
| User Defined Routes               |                   10 |
| Azure Bastion                     |                   10 |
| DDoS Protection                   |                   12 |
| Azure Load Balancer               |                   10 |
| Application Gateway & WAF         |                   20 |
| Azure Front Door                  |                   15 |
| Private Link & Private Endpoints  |                   25 |
| Service Endpoints                 |                   10 |
| DNS Security                      |                   15 |
| VPN & ExpressRoute                |                   20 |
| Internet & Outbound Security      |                   15 |
| Monitoring & Logging              |                   25 |
| AKS Network Security              |                   20 |
| Azure Policy & Governance         |                   20 |
| Business Continuity & Resilience  |                   15 |
| Incident Response & Validation    |                   15 |

**Total Controls:** ~350

---

# Audit Checklist

| Control Domain | Control ID | Control Description | Azure Service / Feature | Audit Question | Expected Configuration | Current State | Risk | Evidence | Remediation | Owner | Due Date | Status |
| -------------- | ---------- | ------------------- | ----------------------- | -------------- | ---------------------- | ------------- | ---- | -------- | ----------- | ----- | -------- | ------ |

---

# 1. Governance & Network Architecture

| ID      | Control                                 |
| ------- | --------------------------------------- |
| GOV-001 | Landing Zone architecture implemented   |
| GOV-002 | Management Groups configured            |
| GOV-003 | Subscription segregation implemented    |
| GOV-004 | Production isolated from non-production |
| GOV-005 | Hub-and-spoke architecture implemented  |
| GOV-006 | Network architecture documented         |
| GOV-007 | Resource tagging standards enforced     |
| GOV-008 | Naming standards enforced               |
| GOV-009 | Resource inventory maintained           |
| GOV-010 | Azure Policy assigned                   |
| GOV-011 | Resource Locks configured               |
| GOV-012 | Network architecture approved           |
| GOV-013 | Change management followed              |
| GOV-014 | Infrastructure as Code enforced         |
| GOV-015 | Secure baseline documented              |

---

# 2. Virtual Network Security

* Address spaces documented
* CIDR overlap avoided
* Subnets properly segmented
* Reserved subnets protected
* VNet Peering secured
* Private DNS linked
* Public IP inventory maintained
* NSGs applied
* Route tables applied
* Service endpoints reviewed
* Private endpoints preferred
* IPv6 reviewed
* Azure Policy enforced
* Network encryption validated
* Network topology documented

---

# 3. Azure Firewall

### Firewall Deployment

* Azure Firewall Premium deployed
* Firewall Policy used
* Availability Zones enabled
* Threat Intelligence enabled
* DNS Proxy enabled
* IDPS enabled
* TLS Inspection configured
* Forced tunneling configured
* Secure SNAT configuration
* Secure DNAT configuration

### Firewall Rules

* Rule Collection Groups documented
* Network rules reviewed
* Application rules reviewed
* NAT rules reviewed
* Least privilege enforced
* Rule priorities reviewed
* Unused rules removed
* Duplicate rules removed
* Temporary rules expired
* Wildcard FQDN approvals documented

### Monitoring

* Diagnostic logs enabled
* Log Analytics integrated
* Microsoft Sentinel connected
* Alert rules configured
* Firewall metrics monitored
* Backup exported
* Configuration version controlled
* Rule recertification performed
* Firewall Policy protected by RBAC
* Resource Locks enabled

---

# 4. Network Security Groups

* NSG applied to every subnet
* NSG attached to NIC only when required
* Default rules reviewed
* No Any-Any inbound rules
* No Any-Any outbound rules
* RDP blocked from Internet
* SSH blocked from Internet
* SMB restricted
* SQL restricted
* WinRM restricted
* Explicit deny rules configured
* Application Security Groups used
* Rule naming standard followed
* Priority conflicts reviewed
* Diagnostic logs enabled
* Flow Logs enabled
* Traffic Analytics enabled
* Unused NSGs removed
* Unused rules removed
* Temporary rules expired
* Just-in-Time VM access enabled
* Azure Policy compliance validated
* Least privilege enforced
* Rule review performed
* Quarterly recertification completed

---

# 5. Private Link & Private Endpoints

Validate Private Endpoints for:

* Storage Account
* Azure SQL
* Cosmos DB
* Key Vault
* Azure Backup
* Recovery Services Vault
* Container Registry
* Azure OpenAI
* Azure AI Services
* App Service
* Event Hub
* Service Bus
* Synapse
* Purview
* PostgreSQL
* MySQL
* MariaDB

Also validate:

* Public access disabled
* Private DNS configured
* DNS links validated
* Endpoint approvals documented
* Split DNS configured
* ExpressRoute name resolution validated
* Connectivity tested
* Azure Policy enforced

---

# 6. Application Gateway & Web Application Firewall

* WAF enabled
* Prevention mode configured
* Latest OWASP CRS deployed
* Custom rules implemented
* Geo-blocking configured
* Rate limiting configured
* Bot protection enabled
* TLS 1.2 or later enforced
* Weak ciphers disabled
* SSL certificates managed securely
* HTTP to HTTPS redirect enabled
* Logging enabled
* Microsoft Sentinel integrated
* Availability Zones enabled
* Health probes configured
* Backend pools secured
* Rewrite rules reviewed
* Listener configuration validated
* Autoscaling configured
* Backup configuration documented

---

# 7. DDoS Protection

* DDoS Protection Standard enabled
* Protection Plan shared where appropriate
* Internet-facing VNets protected
* Alerts configured
* Metrics monitored
* Mitigation reports reviewed
* Public IP inventory maintained
* Critical applications identified
* Simulation performed
* Incident procedures documented
* Cost optimization reviewed
* Resource coverage validated

---

# 8. Azure Bastion

* Bastion Standard or Premium deployed
* Native client enabled where required
* Session recording configured (Premium)
* IP-based access restricted
* RBAC enforced
* MFA required
* JIT integrated
* Diagnostic logs enabled
* Sentinel integrated
* Public RDP/SSH disabled

---

# 9. VPN & ExpressRoute

* IPSec/IKEv2 enforced
* AES-256 encryption
* SHA-256 integrity
* Perfect Forward Secrecy enabled
* BGP configured
* Redundant tunnels implemented
* Route filtering reviewed
* Gateway SKU appropriate
* ExpressRoute FastPath reviewed
* Monitoring enabled
* Logs collected
* Failover tested
* SLA validated
* Certificate lifecycle managed
* Network documentation updated

---

# 10. DNS Security

* Azure Private DNS used
* Azure DNS Private Resolver deployed
* DNS Proxy enabled
* Conditional Forwarders configured
* Split-brain DNS configured
* Auto-registration enabled
* Resolver redundancy configured
* Name resolution validated
* Logging enabled
* Monitoring enabled
* No hardcoded IPs
* Secure forwarding configured
* Private zone links validated
* Disaster recovery tested
* Documentation maintained

---

# 11. Monitoring & Logging

Verify diagnostics are enabled for:

* Azure Firewall
* NSG Flow Logs
* Virtual Network Flow Logs
* WAF Logs
* Front Door Logs
* Bastion Logs
* VPN Gateway Logs
* ExpressRoute Metrics
* Load Balancer Logs
* DDoS Logs
* Azure Monitor
* Network Watcher
* Connection Monitor
* Packet Capture
* Traffic Analytics

Also verify:

* Log Analytics configured
* Microsoft Sentinel integrated
* Alert rules implemented
* Retention configured
* Time synchronization validated
* Workbooks configured
* Playbooks tested
* Incident rules reviewed
* Secure storage enabled
* Audit logs retained

---

# 12. AKS Network Security

* Private AKS cluster
* Azure CNI configured
* Network Policies enabled
* Pod-to-Pod isolation
* API server private
* Private Container Registry
* Defender for Containers enabled
* Workload Identity configured
* Ingress Controller secured
* TLS enforced
* Egress restrictions configured
* Secrets protected
* RBAC reviewed
* Logging enabled
* Sentinel integrated
* Policy enforcement enabled
* Admission controllers enabled
* Image scanning enabled
* Runtime protection enabled
* Kubernetes version supported

---

# 13. Azure Policy & Governance

* Deny Public IP Policy
* Deny Public Storage
* Deny Public SQL
* Mandatory Tags
* Allowed Locations
* Approved SKUs
* Secure Transfer Required
* TLS minimum version enforced
* Defender recommendations remediated
* Policy initiatives assigned
* Exemptions documented
* Compliance dashboard reviewed
* Drift detection performed
* Secure Score monitored
* Blueprint compliance (if applicable)
* IaC validation
* Change approval process
* Quarterly policy review
* Resource compliance reporting
* Continuous compliance monitoring

---

# 14. Business Continuity & Resilience

* Availability Zones used
* Region redundancy implemented
* Multi-region architecture reviewed
* Backup validated
* Restore tested
* DR plans documented
* Failover tested
* Recovery objectives defined
* Health probes validated
* Load balancing configured
* Monitoring during failover
* Critical dependencies documented
* Resource capacity reviewed
* Service limits monitored
* Periodic resilience testing performed

---

# 15. Incident Response & Validation

* Security monitoring operational
* Microsoft Sentinel deployed
* Defender for Cloud integrated
* Incident severity defined
* Playbooks tested
* SOC runbooks documented
* Threat hunting performed
* Firewall rule review completed
* NSG review completed
* Vulnerability assessments completed
* Penetration testing approved
* Audit evidence retained
* Compliance reports generated
* Executive dashboards available
* Annual security review completed

---

# References

* Microsoft Cloud Security Benchmark
* Azure Well-Architected Framework
* Azure Landing Zone Accelerator
* CIS Microsoft Azure Foundations Benchmark
* NIST Cybersecurity Framework (CSF)
* NIST SP 800-53 Rev.5
* ISO/IEC 27001:2022
* Microsoft Defender for Cloud Security Recommendations
* Microsoft Azure Networking Security Best Practices

---

# Document Summary

| Item                   | Value                                  |
| ---------------------- | -------------------------------------- |
| Total Security Domains | 22                                     |
| Approximate Controls   | 350                                    |
| Audit Scope            | Azure Network Security                 |
| Target Audience        | Enterprise Cloud Security Teams        |
| Alignment              | MCSB, CIS, NIST, ISO 27001, Zero Trust |
| Repository Format      | GitHub Markdown                        |
| Version                | 1.0                                    |
| Status                 | Enterprise Ready                       |
