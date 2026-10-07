# Investigate attempted unauthorized user access

Scenario: You receive an alert indicating that an unauthorized user has attempted to access a critical Azure VM. What steps would you take to investigate and remediate the situation?

Investigation Steps

Validate the alert source
Confirm whether the alert came from Azure Monitor, Sentinel, Defender for Cloud, or a custom Log Analytics query. This ensures you trust the detection pipeline.
Check Activity Logs
Review Azure Activity Logs for sign-in attempts, failed authentications, or unusual role assignments. Pay attention to Caller, IPAddress, and OperationName.
Examine Sign-in Logs
Use Azure AD Sign-in logs to identify the user, location, device, and authentication method. Look for anomalies like impossible travel or unfamiliar IP ranges.
Inspect VM Security Logs
If the VM is sending logs to Log Analytics, query Windows/Linux security logs for failed logons, privilege escalation attempts, or suspicious processes.
Correlate with Sentinel
Run KQL queries in Sentinel to correlate events across identity, network, and VM telemetry. For example, map failed RDP/SSH attempts with Azure AD sign-ins.
Check Network Security
Review NSG flow logs and firewall/WAF policies to see if traffic originated from known malicious IPs or bypassed expected controls.
Remediation Steps

Isolate the VM
Immediately remove the VM from production networks by updating NSG rules or moving it to a quarantine subnet.
Block the account
Disable or reset credentials of the suspected account in Azure AD. Enforce MFA if not already enabled.
Rotate secrets/keys
Reset local admin passwords, SSH keys, and any service principals associated with the VM.
Patch and harden
Apply OS and application updates. Ensure baseline security configurations (e.g., disabling RDP from internet, enforcing Just-In-Time VM access).
Enable advanced monitoring
Turn on Defender for Cloud endpoint protection, configure alerts for brute force attempts, and ensure logs are ingested into Sentinel.
Conduct forensic analysis
Snapshot the VM disk for offline investigation. Review for malware, persistence mechanisms, or data exfiltration attempts.
Document and report
Record findings, actions taken, and lessons learned. Feed improvements back into your alerting and incident response playbooks.
Best Practice Enhancements

Implement Just-In-Time VM Access to reduce exposure.
Use Privileged Identity Management (PIM) for admin accounts.
Configure Azure Policy to enforce secure configurations.
Automate alert-to-action workflows with Logic Apps or Sentinel playbooks.
 

 

KQL Cheat Sheet for Investigating Unauthorized VM Access

 

1. Identify Failed Sign-ins

SigninLogs

| where ResultType != 0

| project UserPrincipalName, IPAddress, Location, ResultType, ResultDescription, TimeGenerated

Purpose: Spot failed login attempts.
Key fields: UserPrincipalName, IPAddress, Location.
 

2. Detect Suspicious RDP/SSH Attempts

SecurityEvent

| where EventID in (4625, 4624)

| where AccountType == "User"

| project TimeGenerated, Computer, Account, EventID, LogonType, IpAddress

Purpose: Track RDP/SSH logon attempts.
Event IDs: 4625 (failed), 4624 (successful).
 

3. Correlate VM Activity with Sign-ins

AzureDiagnostics

| where ResourceType == "VIRTUALMACHINES"

| project TimeGenerated, Resource, OperationName, Caller, IPAddress

Purpose: Link VM operations with suspicious sign-ins.
Key fields: OperationName, Caller.
 

4. Check NSG Flow Logs for Malicious IPs

AzureDiagnostics

| where Category == "NetworkSecurityGroupFlowEvent"

| project TimeGenerated, srcIp_s, destIp_s, action_s, flowDirection_s

Purpose: Identify inbound traffic from suspicious IPs.
Key fields: srcIp_s, action_s.
 

5. Investigate Privilege Escalation Attempts

SecurityEvent

| where EventID == 4672

| project TimeGenerated, Account, Computer, Privileges

Purpose: Detect assignment of special privileges.
Event ID: 4672.
 

 

Playbook-Style Remediation Guide

 

Step 1: Contain

Isolate VM: Move to quarantine subnet or restrict NSG rules.
Block account: Disable suspected Azure AD account.
 

Step 2: Eradicate

Rotate credentials: Reset local admin passwords, SSH keys.
Patch system: Apply OS and application updates.
 

Step 3: Recover

Re-enable VM: After validation, restore VM to production.
Enable monitoring: Ensure Defender for Cloud and Sentinel alerts are active.
 

Step 4: Lessons Learned

Document incident: Record findings and actions.
Update playbooks: Improve detection and response workflows.
Train team: Share insights to prevent recurrence.
 

 