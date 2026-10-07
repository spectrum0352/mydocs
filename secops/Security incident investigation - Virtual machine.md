# Security incident investigation - Virtual machine

How do you identify and prioritize Azure VM security alerts to ensure that the most critical incidents are investigated promptly?

To identify and prioritize Azure VM security alerts effectively—and ensure the most critical incidents are handled first—use a structured, risk-based triage process that combines telemetry, automation, and business context.

1. Centralize Alert Sources

Aggregate all VM-related security signals into a single SOC platform:

Microsoft Defender for Cloud / Defender for Endpoint
Microsoft Sentinel
Azure Activity Logs
NSG Flow Logs / Traffic Analytics
Azure Firewall logs
Entra ID (Azure AD) sign-in logs
Guest OS logs (Windows Event Logs / Syslog)
This avoids fragmented investigations and enables correlation across layers.

2. Classify Alert Severity

Use built-in and custom severity models:

Critical: Active exploitation, ransomware behavior, credential theft, C2 communication
High: Privilege escalation, suspicious PowerShell, malware detected
Medium: Port scans, suspicious login attempts
Low: Policy violations, baseline deviations
Enhance severity using:

MITRE ATT&CK tactic mapping
Confidence score from detection engine
Known malicious IP/domain intelligence
3. Add Asset & Business Context

Re-prioritize alerts based on the importance of the affected VM:

Tier-1 vs Tier-2 workloads
Production vs Non-Prod
Regulated systems (PCI, HIPAA, RBI, GDPR, etc.)
Internet-facing vs internal-only
Domain controllers or jump hosts
Example:
A medium-severity alert on a Tier-1 production VM becomes high priority.

4. Correlate Related Signals

Use SIEM analytics to link multiple low-level alerts into a high-confidence incident:

Repeated failed logins + suspicious process + outbound traffic spike
New admin account + NSG change + malware alert
VM extension install + PowerShell download + Defender alert
This reduces alert fatigue and surfaces true incidents faster.

5. Use Automation for Rapid Triage

Implement SOAR playbooks:

Enrich alerts with:
Geo-IP
Threat intelligence
VM tags (environment, owner, tier)
Auto-collect logs and snapshots
Auto-isolate VM network interfaces for critical detections
Notify on-call engineers
Automation shortens Mean Time to Detect (MTTD).

6. Define Investigation SLAs

Establish response targets based on severity:

Critical: 15–30 minutes
High: < 2 hours
Medium: < 8 hours
Low: Next business day
Track KPIs:

MTTD / MTTR
False-positive rate
Repeat incidents per workload
7. Maintain Alert Tuning & Suppression

Continuously reduce noise:

Whitelist approved admin tools
Suppress known benign extensions
Tune thresholds for scans or login attempts
Retire obsolete detections
Well-tuned alerts ensure analysts focus only on high-risk events.

8. Escalation & Incident Declaration

Escalate when:

Multiple kill-chain stages are detected
Data exfiltration is suspected
Privileged accounts are impacted
Lateral movement is observed
Convert alerts into formal security incidents with incident commanders and response teams.

Summary

Effective Azure VM alert prioritization relies on:

Centralized visibility (Sentinel + Defender)
Severity + asset criticality
Signal correlation
Automation & SOAR
Clear SLAs
Continuous tuning
  

✅ SOC Operating Model – Azure VM Security

🔵 Tier-1 SOC (L1 – Monitoring & Triage)

Primary role: Detect, validate, enrich, and escalate.

Alert Intake

Monitor Microsoft Sentinel incidents 24x7
Track Defender for Endpoint / Defender for Cloud alerts
Review Azure Activity Log security events
Watch NSG Flow Logs / Firewall anomalies
Monitor Entra ID risky sign-ins for VM access
Initial Validation

Confirm VM hostname, subscription, RG, owner
Check workload tier tag (Tier-1 / Tier-2)
Identify prod vs non-prod
Validate alert confidence score
Check if VM is internet-facing
Review recent changes (NSG, VM extension, RBAC)
Quick Investigation

Review process tree in Defender
Check suspicious command lines / scripts
Review login source IP and geography
Look for lateral movement attempts
Check outbound traffic spikes
Search Sentinel for correlated events
Enrichment

Add threat-intel reputation for IP/domain
Pull VM tags and business owner
Map to MITRE ATT&CK stage
Identify similar alerts in last 24–72 hrs
Automated Actions

Trigger SOAR playbooks for enrichment
Auto-collect logs
Notify on-call Tier-2
Auto-isolate NIC only for confirmed Critical alerts (if approved)
Escalation Criteria to Tier-2

Malware confirmed
Privileged account involved
C2 communication detected
Persistence mechanisms found
Data exfiltration suspected
Multiple alerts chained
Tier-1 workload impacted
SLA Targets

Critical → 15–30 min
High → <2 hrs
Medium → <8 hrs
 

🟣 Tier-2 SOC (L2 – Investigation & Containment)

Primary role: Deep investigation, containment, eradication, recovery.

Advanced Investigation

Memory / disk forensics (if required)
Defender advanced hunting queries
Timeline reconstruction
Identify root cause
Check lateral movement across VNets
Review service principal / managed identity abuse
Validate persistence mechanisms
Review backup integrity
Containment Actions

Network isolate VM
Disable compromised accounts
Revoke tokens / rotate secrets
Remove malicious extensions
Block IP/domain in Firewall
Apply emergency NSG rules
Snapshot disks before rebuild
Eradication & Recovery

Patch exploited vulnerabilities
Reimage from golden image if needed
Restore from clean backups
Re-onboard to Defender
Validate no reinfection
Remove unauthorized RBAC
Reset local admin credentials
Escalation to IR / Crisis Team

Regulatory impact suspected
Data breach confirmed
Ransomware
Domain compromise
Multi-subscription spread
Post-Incident

Write RCA
Update Sentinel analytics rules
Improve Defender policies
Tune alert thresholds
Update hardening baselines
Feed learnings to cloud security standards

 

1) SOC Checklist – Azure VM Security

 

Domain

Control Item

Tier-1 SOC

Tier-2 SOC

Tool

Tier-1 Workload Requirement

Logging

Defender for Endpoint onboarded

Monitor

Validate

MDE

Mandatory

Logging

Defender for Servers P2 enabled

Verify

Audit

Defender for Cloud

Mandatory

Logging

Sentinel ingestion enabled

Monitor

Tune

Sentinel

Mandatory

Logging

NSG Flow Logs v2

Check

Investigate

Azure Monitor

Mandatory

Logging

Firewall logs enabled

Monitor

Investigate

Azure Firewall

Mandatory

Identity

Entra ID logs streaming

Monitor

Correlate

Entra ID

Mandatory

Tagging

Tier / Owner / Env tags

Verify

Enforce

Azure Policy

Mandatory

Exposure

Public IP detection

Flag

Remove

Defender

Mandatory

Alerting

Severity auto-escalation

Validate

Tune

Sentinel

Mandatory

Automation

SOAR enrichment

Trigger

Maintain

Sentinel

Mandatory

Automation

Auto-isolation playbook

Execute

Approve

Sentinel

Mandatory

Response

SLA tracking

Track

Govern

ITSM

Mandatory

Forensics

Disk snapshot pre-rebuild

Request

Execute

Azure Backup

Mandatory

Hardening

JIT VM Access

Verify

Enforce

Defender

Mandatory

Hardening

MFA for admins

Verify

Enforce

Entra ID

Mandatory

Recovery

Golden image rebuild

Escalate

Execute

Azure Compute

Mandatory

Governance

RCA completed

Capture

Approve

SOC process

Mandatory

 

 

2) Tier-1 vs Tier-2 Responsibility Matrix

 

Activity

Tier-1 SOC (L1)

Tier-2 SOC (L2)

Alert monitoring

Primary

Backup

Incident creation

Yes

Yes

Severity re-classification

Initial

Final

Asset criticality check

Yes

Yes

MITRE mapping

Basic

Detailed

Threat-intel enrichment

Yes

Advanced

Log correlation

Basic

Advanced

Defender hunting

No

Yes

Memory / disk forensics

No

Yes

Network isolation

Trigger

Own

Account disablement

Trigger

Own

Secret rotation

Escalate

Own

Reimage VM

Escalate

Own

Backup restore

No

Yes

Crisis escalation

Trigger

Own

Regulatory notification prep

No

Yes

RCA writing

Draft

Final

Detection tuning

Suggest

Implement

Automation upkeep

No

Yes

Purple-team exercises

Participate

Lead

 

 

 