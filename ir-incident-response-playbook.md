# Azure Incident Response Playbook
## Microsoft Azure | Microsoft Entra ID | Microsoft Defender XDR | Microsoft Sentinel

> **Purpose:**  
> This incident response (IR) playbook provides a structured, enterprise-grade approach for responding to cybersecurity incidents affecting Microsoft Azure, Microsoft Entra ID, Microsoft Defender XDR, Microsoft Sentinel, Microsoft 365, Azure resources, hybrid infrastructure, identities, workloads, and cloud-native applications.

---

# Incident Response Lifecycle

The incident response process follows industry standards such as:

- NIST SP 800-61 Rev.2
- Microsoft Security Operations Framework
- MITRE ATT&CK
- ISO/IEC 27035
- CIS Controls v8

```
Preparation
      │
      ▼
Detection & Analysis
      │
      ▼
Containment
      │
      ▼
Eradication
      │
      ▼
Recovery
      │
      ▼
Lessons Learned
```

---

# Critical Principles

Before taking any action:

- Stay calm and follow documented procedures.
- Avoid making changes without documenting them.
- Preserve forensic evidence.
- Do not delete logs.
- Do not reboot compromised systems unless required.
- Keep management informed.
- Maintain chain of custody.
- Follow legal and regulatory requirements.
- Assume attackers may still have access until proven otherwise.

---

# Severity Classification

| Severity | Description | Target Response |
|-----------|------------|----------------|
| Critical (P1) | Active ransomware, data exfiltration, domain compromise, Global Administrator compromise | Immediate (0–15 minutes) |
| High (P2) | Production service compromise, malware outbreak, privilege escalation | <30 minutes |
| Medium (P3) | Suspicious activity requiring investigation | <4 hours |
| Low (P4) | Informational alerts, policy violations | Business hours |

---

# Step 1 — Stay Calm

## DO NOT PANIC

A cyberattack is a business incident requiring an organized and methodical response.

Immediately:

- Confirm whether the alert is genuine.
- Determine the scope.
- Begin documenting actions.
- Notify the Security Operations Center (SOC).
- Assign an Incident Commander.

Avoid:

- Guessing the attack source.
- Deleting evidence.
- Making unapproved changes.
- Rebooting systems unnecessarily.

---

# Step 2 — Validate the Incident

Determine whether the alert is:

- True Positive
- False Positive
- Benign activity
- Security misconfiguration

Verify alerts from:

- Microsoft Sentinel
- Microsoft Defender XDR
- Microsoft Defender for Endpoint
- Microsoft Defender for Identity
- Microsoft Defender for Cloud
- Microsoft Defender for Office 365
- Microsoft Entra ID Identity Protection
- Azure Activity Logs
- Azure Firewall
- Application Gateway WAF
- Azure Monitor
- Azure NSG Flow Logs
- Azure Key Vault logs

---

# Step 3 — Activate the Incident Response Team

A successful incident response requires cross-functional coordination.

| Team | Responsibilities |
|---------|----------------|
| SOC Analysts | Detection, triage, investigation |
| Incident Commander | Overall coordination |
| Cloud Security Team | Azure containment |
| Identity Team | Entra ID investigation |
| Infrastructure Team | VM recovery |
| Network Team | Firewall and networking |
| Legal | Regulatory obligations |
| HR | Insider incidents |
| Public Relations | External communication |
| Compliance | Regulatory reporting |
| Executive Management | Business decisions |

---

# Step 4 — Classify the Incident

Identify the attack type.

Examples include:

- Ransomware
- Credential theft
- Phishing
- Business Email Compromise (BEC)
- Data exfiltration
- Azure subscription compromise
- Global Administrator compromise
- Service Principal compromise
- Managed Identity abuse
- Azure Key Vault compromise
- Storage Account exposure
- Kubernetes compromise
- AKS attack
- Insider threat
- Supply chain compromise
- Malware infection
- Command and Control (C2)
- Privilege escalation
- Persistence
- Lateral movement

---

# Step 5 — Assess Scope

Identify:

- Impacted users
- Impacted subscriptions
- Impacted tenants
- Impacted Azure resources
- Virtual Machines
- Azure Kubernetes Service (AKS)
- Storage Accounts
- SQL Databases
- Azure Functions
- App Services
- Logic Apps
- Key Vaults
- Managed Identities
- Service Principals
- Virtual Networks
- VPN Gateways
- Azure Firewall
- Microsoft 365 services

Determine:

- Is data stolen?
- Is malware spreading?
- Is production affected?
- Is identity compromised?
- Are backups safe?

---

# Step 6 — Contain the Threat

Containment should minimize business disruption while preventing attacker movement.

## Microsoft Entra ID

Possible actions:

- Block sign-in
- Disable compromised user
- Force password reset
- Revoke refresh tokens
- Revoke active sessions
- Disable compromised Service Principal
- Disable Managed Identity
- Remove Global Administrator role
- Enable Conditional Access emergency policy
- Require MFA
- Block risky users
- Block impossible travel sessions

---

## Microsoft Defender for Endpoint

Use device isolation.

Actions:

- Isolate device
- Collect investigation package
- Run antivirus scan
- Restrict application execution
- Kill malicious process
- Quarantine files
- Block indicators

---

## Azure

Contain Azure resources:

- Disable Public IP
- Block NSG rules
- Enable Just-In-Time VM access
- Lock storage account
- Rotate access keys
- Disable compromised VM
- Snapshot affected disks
- Disable App Service deployment
- Block exposed endpoints
- Disable compromised API

---

## Networking

Possible actions:

- Block attacker IPs
- Update Azure Firewall rules
- Update WAF policies
- Disable VPN access
- Disable ExpressRoute connectivity if necessary
- Restrict Virtual Network traffic
- Enable emergency segmentation

---

# Step 7 — Preserve Evidence

Collect evidence before remediation.

Sources include:

- Microsoft Sentinel logs
- Defender telemetry
- Azure Activity Logs
- Entra Sign-In Logs
- Audit Logs
- Azure Resource Graph
- Azure Monitor
- Key Vault diagnostics
- Azure Firewall logs
- NSG Flow Logs
- Packet captures
- VM memory dump (when appropriate)
- Disk snapshots
- Browser history
- Email headers
- Endpoint forensic artifacts

Maintain:

- Timeline
- Chain of custody
- Hashes
- Time synchronization
- Investigator notes

---

# Step 8 — Investigate

Determine:

- Initial access vector
- Attacker identity
- Timeline
- Privilege escalation
- Lateral movement
- Persistence techniques
- Data accessed
- Data exfiltrated
- Impacted systems
- Malware family
- Indicators of Compromise (IOCs)
- Indicators of Attack (IOAs)

Use:

- Microsoft Sentinel KQL
- Defender Advanced Hunting
- MITRE ATT&CK mapping
- Threat Intelligence feeds
- Microsoft Security Copilot (if available)

---

# Step 9 — Eradicate

Remove attacker persistence.

Examples:

- Remove malware
- Delete malicious scheduled tasks
- Remove malicious Service Principals
- Delete rogue applications
- Remove unauthorized API permissions
- Remove persistence scripts
- Disable malicious Logic Apps
- Remove unauthorized Azure roles
- Rotate credentials
- Rotate certificates
- Rotate secrets
- Rotate storage keys
- Rotate Key Vault secrets

---

# Step 10 — Recover

Restore business operations.

Activities:

- Restore from Azure Backup
- Restore Recovery Services Vault backups
- Validate clean snapshots
- Rebuild compromised VMs
- Restore AKS clusters
- Restore databases
- Restore storage
- Restore applications
- Verify functionality
- Monitor closely for reinfection

Recovery validation:

- Identity works correctly
- MFA enforced
- Monitoring operational
- Logging restored
- Defender healthy
- Sentinel collecting logs
- Applications functioning
- No malicious persistence remains

---

# Step 11 — Notify Stakeholders

Notify according to organizational policy.

Possible stakeholders:

- Executive Management
- SOC
- Security Leadership
- Legal Counsel
- Privacy Officer
- Compliance Team
- HR
- Customers
- Vendors
- Cyber Insurance Provider
- Regulatory Authorities
- Law Enforcement (where applicable)

Examples:

- GDPR reporting
- HIPAA
- PCI DSS
- ISO 27001
- Local data protection regulations

---

# Step 12 — Document Everything

Maintain a complete incident record.

Document:

- Timeline
- Incident ID
- Detection source
- Affected assets
- Attack path
- Root cause
- Containment actions
- Recovery actions
- Business impact
- Financial impact
- Lessons learned
- Evidence collected
- IOCs
- MITRE ATT&CK techniques
- Recommendations

---

# Step 13 — Lessons Learned

Conduct a post-incident review.

Questions:

- How was the attack detected?
- Could detection have occurred earlier?
- Were playbooks effective?
- Were backups successful?
- Were SLAs met?
- Were communications effective?
- Were policies followed?
- What should be automated?
- Which controls failed?

Create:

- Root Cause Analysis (RCA)
- Corrective Action Plan
- Improvement Plan

---

# Microsoft Security Tools Checklist

## Identity

- Microsoft Entra ID
- Identity Protection
- Conditional Access
- Privileged Identity Management (PIM)

---

## Endpoint

- Microsoft Defender for Endpoint
- Microsoft Intune

---

## Email

- Microsoft Defender for Office 365
- Exchange Online Protection

---

## Cloud

- Microsoft Defender for Cloud
- Azure Policy
- Azure Monitor

---

## SIEM & SOAR

- Microsoft Sentinel
- Logic Apps
- Automation Rules
- Playbooks
- Threat Intelligence

---

## Data Protection

- Microsoft Purview
- Microsoft Information Protection
- Microsoft Defender for Cloud Apps

---

# Ransomware Guidance

## DO NOT

- Pay ransom without executive, legal, and law enforcement involvement.
- Delete encrypted systems before forensic analysis.
- Assume attackers have left the environment.
- Trust restored credentials without rotation.

## DO

- Isolate infected devices immediately.
- Preserve forensic evidence.
- Validate offline or immutable backups.
- Restore only verified clean systems.
- Rotate all privileged credentials.
- Hunt for persistence before reconnecting systems.

---

# Incident Documentation Template

| Field | Details |
|---------|---------|
| Incident ID | |
| Date & Time Detected | |
| Detection Source | |
| Severity | |
| Incident Commander | |
| Reporter | |
| Affected Assets | |
| Affected Users | |
| Business Impact | |
| Root Cause | |
| MITRE ATT&CK Techniques | |
| Indicators of Compromise | |
| Containment Actions | |
| Eradication Actions | |
| Recovery Actions | |
| Evidence Collected | |
| Regulatory Notification Required | Yes / No |
| Customer Notification Required | Yes / No |
| Lessons Learned | |
| Status | Open / Contained / Eradicated / Closed |

---

# Azure Incident Response Quick Checklist

## Initial Response

- [ ] Confirm the alert.
- [ ] Assign an Incident Commander.
- [ ] Classify severity.
- [ ] Notify SOC.
- [ ] Start incident documentation.

## Containment

- [ ] Disable compromised accounts.
- [ ] Revoke active sessions.
- [ ] Isolate endpoints.
- [ ] Block attacker IPs.
- [ ] Disable malicious applications.
- [ ] Snapshot affected Azure resources.

## Investigation

- [ ] Collect logs.
- [ ] Preserve evidence.
- [ ] Identify attack vector.
- [ ] Determine affected assets.
- [ ] Identify persistence.

## Eradication

- [ ] Remove malware.
- [ ] Remove persistence.
- [ ] Rotate secrets and credentials.
- [ ] Patch vulnerabilities.

## Recovery

- [ ] Restore clean backups.
- [ ] Validate systems.
- [ ] Monitor for reinfection.
- [ ] Resume production operations.

## Post-Incident

- [ ] Conduct lessons learned meeting.
- [ ] Complete Root Cause Analysis.
- [ ] Update playbooks.
- [ ] Improve detections.
- [ ] Implement preventive controls.
- [ ] Close the incident.