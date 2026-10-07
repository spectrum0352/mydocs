# **Threat Detection Engineering (TDE)**

## **1. Overview**

Threat Detection Engineering focuses on designing, implementing, and continuously improving detection capabilities across enterprise environments, including **cloud, endpoint, identity, network, and AI ecosystems**.

It combines:

* Detection rules (SIEM/XDR)
* Threat intelligence (CTI)
* Behavioral analytics
* Automation (SOAR)
* AI/ML-driven detections

---

## **2. Detection of Social Engineering Attacks**

* Monitor phishing indicators (email headers, malicious URLs, spoofed domains)
* Detect anomalous user behavior (impossible travel, unusual access patterns)
* Correlate identity signals (failed logins, MFA fatigue attacks)
* Analyze user-reported incidents (phishing reporting tools)
* Identify:

  * Suspicious OAuth app consent
  * Token theft / session hijacking
  * AI-generated phishing (deepfake voice, synthetic emails)

---

## **3. Detection Challenges**

* High false positives due to noisy telemetry
* Increasing use of **legitimate tools (Living-off-the-Land attacks)**
* Fragmented telemetry across tools (SIEM, XDR, CASB, CSPM)
* Advanced adversaries using:

  * Fileless malware
  * Identity-based attacks
  * AI-assisted evasion techniques
* Need for deep expertise in:

  * Threat hunting
  * Log analysis
  * Adversary TTPs (MITRE ATT&CK)

---

## **4. Detection in AI Ecosystems (New-Age Threats)**

### **4.1 AI Infrastructure Threats**

* Unauthorized access to ML pipelines or GPU resources
* Model poisoning attacks
* Data pipeline manipulation
* Exposure of training datasets
* Abuse of APIs hosting models

**Detection Techniques:**

* Monitor abnormal API usage patterns
* Detect privilege escalation in ML platforms
* Audit access to training datasets
* Identify unusual compute consumption spikes

---

### **4.2 AI Application Threats**

* Prompt injection attacks
* Data exfiltration via LLM responses
* Malicious plugin/API integrations
* Abuse of AI-generated outputs

**Detection Techniques:**

* Monitor prompt/response anomalies
* Detect sensitive data leakage patterns
* Inspect API integrations and plugins
* Log and analyze LLM interaction trails

---

### **4.3 AI Agent Threats**

* Autonomous agents performing unintended actions
* Privilege misuse by AI agents
* Command chaining leading to exploitation

**Detection Techniques:**

* Track agent decision logs and actions
* Detect abnormal automation sequences
* Apply behavioral baselines for agent activities
* Enforce policy-based execution boundaries

---

### **4.4 AI-Driven Threats**

* Deepfake-based impersonation attacks
* AI-generated phishing campaigns
* Automated vulnerability discovery by attackers

**Detection Techniques:**

* Behavioral anomaly detection
* Voice/video verification systems
* Email content anomaly detection using NLP
* Threat intelligence enrichment

---

## **5. Detection Engineering Lifecycle**

### **5.1 Preparation**

* Define detection use cases
* Establish logging and telemetry sources:

  * SIEM, XDR, EDR
  * Identity logs
  * Cloud logs
  * AI system logs
* Create baselines for normal behavior
* Integrate threat intelligence feeds

---

### **5.2 Detection**

* Analyze:

  * Logs
  * Alerts
  * Network traffic
  * Endpoint activity
* Implement detection rules:

  * IOC-based (known threats)
  * Behavioral (anomaly detection)
  * TTP-based (MITRE ATT&CK)

---

### **5.3 Initial Scoping**

* Identify:

  * Affected systems
  * Impacted users/data
* Determine severity
* Notify incident response teams

---

### **5.4 Technical Analysis**

* Develop hypothesis of attacker intent
* Identify:

  * Persistence mechanisms
  * Lateral movement
  * Data exfiltration paths
* Validate against threat intelligence
* Maintain a common operating picture across stakeholders

---

### **5.5 Event Correlation & Timeline**

* Correlate logs across:

  * Identity
  * Network
  * Endpoint
  * Cloud
* Build incident timeline:

  * Events
  * Timestamps (UTC)
  * Impact
  * Data sources

---

### **5.6 Anomaly Detection**

* Identify deviations from baseline:

  * Unusual login behavior
  * Abnormal network traffic
  * Suspicious process execution
* Detect:

  * Credential misuse
  * Privilege escalation
  * Living-off-the-land techniques

---

## **6. Detection Techniques**

### **6.1 Identity-Based Detection**

* Multiple failed login attempts
* MFA bypass or fatigue
* Impossible travel
* Suspicious privilege assignments

**Example Control:**

* Lock account after repeated failed attempts
* Alert on 5 failed logins within 2 minutes

---

### **6.2 Network Detection**

* Suspicious outbound connections
* Command-and-control traffic
* Port scanning and lateral movement
* DDoS patterns

---

### **6.3 Endpoint Detection**

* File integrity monitoring (FIM)
* Suspicious process execution
* Malware signatures and heuristics
* Unauthorized file changes

---

### **6.4 Cloud Detection**

* Unauthorized resource creation
* Misconfigurations
* Suspicious API calls
* Data exfiltration from storage services

---

### **6.5 AI-Specific Detection**

* Prompt injection patterns
* Model misuse
* Data leakage via AI outputs
* Abnormal agent actions

---

## **7. Investigation Techniques**

* Log correlation across multiple sources
* Threat hunting using hypotheses
* Memory and disk forensics
* IOC enrichment using CTI feeds
* Behavioral analysis

---

## **8. Response Techniques**

* Trigger SOAR playbooks
* Isolate affected systems
* Block malicious indicators (IP/domain/hash)
* Disable compromised accounts
* Notify stakeholders
* Perform remediation and recovery

---

## **9. Sample Detection Use Cases (SIEM – Sentinel)**

### **9.1 Failed Login Detection**

* Alert on multiple failed login attempts
* Auto-lock account after threshold

---

### **9.2 Anomalous RDP Detection**

**Prerequisites:**

* Collect Windows Security Logs (Event ID 4624)

---

### **9.3 Suspicious Azure Activity**

```kusto
AzureActivity
| where OperationName == "Create Storage account"
| where ActivityStatus == "Succeeded"
```

---

### **9.4 Deleted Security Resources**

```kusto
AzureActivity
| where OperationNameValue contains "SecurityInsights"
| where OperationName contains "Delete"
| where ActivityStatusValue contains "Succeeded"
```

---

### **9.5 Rule Scheduling**

* Run query every 1 hour
* Enable suppression: stop after alert triggers

---

## **10. Best Practices**

* Reduce false positives via tuning
* Use MITRE ATT&CK mapping
* Continuously improve detection rules
* Automate response using SOAR
* Integrate AI-driven analytics responsibly
* Monitor AI systems as first-class attack surfaces
* Maintain updated incident response plans

---

## **11. Key Metrics**

* Mean Time to Detect (MTTD)
* Mean Time to Respond (MTTR)
* Detection coverage
* False positive rate
* Alert-to-incident ratio

---

## **12. Post-Incident Activities**

* Conduct root cause analysis
* Prepare after-action report
* Update detection rules
* Share lessons learned
* Improve playbooks and controls

---

If you want, I can convert this into:

* **SOC runbook format**
* **Detection engineering playbook library**
* **Sentinel + Defender rule pack**
* **AI threat detection framework (very advanced, architecture-level)**



<img width="509" height="282" alt="attack detection vs investigation" src="https://github.com/user-attachments/assets/5d95e4c5-db78-4658-a464-25145d759efd" />

## user-account-created-and-deleted-windows

## user-login-activity-monitoring
Track user logon/logoff events (SOC2 CC6.1 - Logical Access).

Query
index=windows EventCode=4624 OR EventCode=4634 | stats count by Account_Name, Logon_Type

Outcome
Provides insight into user login and logout patterns. Helps detect unauthorized or suspicious login behavior.

## Detecting Unencrypted Web Communications
Purpose
Find unencrypted web communications that could lead to a data breach.
Query
index=__your_sysmon_index__ sourcetype=firewall_data dest_port!=443 app=workday* | table _time user app bytes* src_ip dest_ip dest_port

Outcome

## Detection of system time changes (Boot time)
Purpose
Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes

## Detection of use of default product vendor accounts
Purpose - Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome - Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes

## Detection of user account added
Purpose
Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes

## Detection of user account addedremoved in admin group
Purpose
Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes

## dns-anomaly-detection
DNS Anomaly Detection: Flags suspicious DNS queries and performs domain reputation lookups

Purpose
Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes

## dns-spoofing
DNS spoofing/ Cashe Poisoning

Types
DNS Spoofing, DNS Cache Poisoning. 

Security Solution
Security Solution: DNS Security Extensions (DNSSEC), DNS Filtering, Regular DNS Monitoring. 

Detection
Detection in SIEM: Unusual DNS responses, and unexpected changes in DNS records. - SIEM Solution Features: DNS log analysis, real-time monitoring, and integration with DNS security 
solutions. 

Mitigation
Implement DNS Security Extensions (DNSSEC) to authenticate DNS responses. 
Regularly monitor and audit DNS configurations. 
Use DNS filtering services to detect and block malicious domains.

## eavesdropping
Eavesdropping: 
• Definition: is the unauthorized act of secretly listening to or intercepting private conversations or communications 
without consent, often for gathering information. It can involve physical proximity, wiretapping, or electronic 
surveillance 

Types: 
Passive Eavesdropping, Active Eavesdropping. 

Security Solution: - 
Security Solution: Encryption (SSL/TLS, VPNs), Secure Wi-Fi Protocols (WPA3), Network Monitoring Tools. 

Detection: - - 
Detection in SIEM: Monitoring for unauthorized interception, and analysing network traffic for signs of 
eavesdropping. 
SIEM Solution Features: Network traffic analysis, intrusion detection, and monitoring for unusual network 
behaviour.
 
Mitigation: - - - 
Use encryption (SSL/TLS, VPNs) to secure sensitive communication. 
Regularly monitor and audit network traffic for unusual patterns. 
Implement secure Wi-Fi protocols and strong access controls. 

Unauthorized Wi-Fi Interception: 
Example: Capturing unencrypted Wi-Fi traffic using tools like Wireshark to eavesdrop on sensitive data, such as login 
credentials.

## excessive-failed-logins

Purpose
Detect potential account lockout scenarios (SOC2 CC6.1 Logical Access)
Query
index=windows EventCode=4625 | stats count by Account_Name | where count > 5
Outcome
Identifies accounts with repeated failed login attempts that could lead to lockout. Helps detect potential password guessing or brute-force attacks.

## external-account-compromise
External Account Compromise: Detects unusual activity on accounts accessed from external locations and blocks access

## Failed Login to Multiple Destination from Same Source
Purpose
Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes

## failed-access-attempts-to-critical-systems
Purpose
Detect failed login attempts to critical servers (SOC2 CC6.1- Logical Access).

Query
index=linux sourcetype=linux_secure "authentication failure" | stats count by user

Outcome
Tracks failed login attempts on critical Linux servers. Enables quick response to potential unauthorized access attempts.

## fil-integrity-monitoring
Purpose
Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes

## Finding Interactive Logins From Service Accounts
Purpose
Most service accounts should never interactively log into servers.
Query
index=systems sourcetype=audit_logs user=svc_* | stats earliest(_time) as earliest latest(_time) as latest by user, dest | eval isOutlier=if(earliest >= relative_time(now(), "-1d@d"), 1, 0) | convert ctime(earliest) ctime(Latest)


## Finding Large Web Uploads
Purpose
Find large file uploads that could point to data exfiltration in your network.
Query
index=__your_sysmon_index__ sourcetype=websense* | where bytes_out > 35000000 | table _time src_ip bytes* uri

## Finding New Local Admin Accounts
Purpose
Often an attack will include the creation of a new user, followed by permissions being elevated to an admin level.

Query
index=win_servers sourcetype=windows:security EventCode=4720 OR (EventCode=4732 Administrators) | transaction Security_ID maxspan=180m | search EventCode=4720 EventCode=4732 | table _time, EventCode, Recurity_ID, SamAccountName

## firewall-policy-changes

Purpose
Identify unauthorized firewall changes (SOC2 CC6.7 System Operations)

Query
index=paloalto sourcetype=pan_config | stats count by user

Outcome
Provides a list of users making firewall policy changes. Detects unauthorized or unexpected modifications to firewall configurations.

## honeypot-alerting
Honeypot Alerting: Triggers alerts when interactions with honeypots are detected

## Identifying Slow Web Content
A slow loading web site can not only frustrate users, but can also hurt search rankings.
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes

Query
index=web sourcetype=ms:iis:auto OR sourcetype=apache: access | stats avg(response_time) as art by uri_path | eval "Average Response Time" = round(art,2) | sort -"Average Response Time" | table uri_path, "Average Response Time"

## Identifying Web Users By Country
Use IPs in your data to report and visualize user locations.
Query
index=web sourcetype=access_combined | iplocation clientip | geostats dc(clientip) by Country

## inactive-user-accounts
Purpose
Detect and disable inactive user accounts (SOC2 CC6.1 Logical Access)
Query
index=windows EventCode=4624 | stats count by Account_Name | where count < 1

Outcome
Identifies inactive accounts that haven't been used for a specific time period. Helps reduce attack surface by deactivating dormant accounts

## Interactive use of service account
Purpose
Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes

## lateral-movement-detections
Lateral Movement Detection: Detects lateral movement attempts and isolates compromised accounts or systems

## lateral-movement-entra
•	Use stolen tokens or credentials to access other resources (Azure subscriptions, VMs, SharePoint)
•	Abuse Azure Run Command or Azure Automation for remote code execution
•	Use compromised app secrets to request access tokens for other services

Step 1: Use Compromised App Secret to Request Token
Use client credentials flow with compromised app secret to get token:
curl -X POST -H "Content-Type: application/x-www-form-urlencoded" \
-d "client_id=<appId>&scope=https://graph.microsoft.com/.default&client_secret=<secret>&grant_type=client_credentials" \
"https://login.microsoftonline.com/<tenantId>/oauth2/v2.0/token"
Step 2: Use token to access other resources (Graph API example)
curl -H "Authorization: Bearer <access_token>" "https://graph.microsoft.com/v1.0/users"

## Log Volume Trending
Purpose
Visualizing the number of events being logged by an application can provide a simple, yet powerful indicator of the state of your application, or changes in the behavior of your code or environment
Query
|tstats prestats=t count WHERE index=apps by host _time span=1m |timechart partial=f span=1m count by host limit=0

Outcome

## Login attempts from same account from different source desktops
Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes

## Logins outside normal business hours
Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes

## Logins to multiple user accounts from the same source
Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes

## malware-detection
Detect malware infections across endpoints (SOC2 CC6.8 Risk Mitigation).
Detects instances of malware across systems with relevant details. Enables quick identification of infected endpoints for remediation.

Query
index=windows EventCode=1116 | stats count by VirusName, ComputerName

Malware Attack
Look for infection count of malware attack.

| from datamodel:"Malware"."Malware_Attacks" | stats dc("signature") as "infection_count" by "dest" | where 'infection_count'>1


## Windows Security Log is full
Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes

## Windows Service Stop-Restart
Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes


## man-in-the-middle-attack
Types:
ARP Spoofing, DNS Spoofing, SSL Stripping.


ARP Spoofing: 
Example: An attacker sends falsified Address Resolution Protocol (ARP) messages to associate their MAC 
address with the IP address of a target, intercepting and manipulating the traffic. 

DNS Spoofing: 
Example: Manipulating DNS responses to redirect users from a legitimate website to a malicious one by 
providing false IP address information. 

SSL Stripping: 
Example: Downgrading a secure HTTPS connection to an unencrypted HTTP connection, allowing the attacker 
to intercept sensitive data.
Security Solution: - 
Security Solution: SSL/TLS Encryption, Certificate Pinning, Network Monitoring Tools, Intrusion 
Detection/Prevention Systems (IDS/IPS).

Detection: - 
Detection in SIEM: Unexpected changes in network traffic or ARP/DNS discrepancies. - SIEM Solution Features: Network traffic analysis, log analysis, and anomaly detection for unexpected 
changes in communication patterns.

Mitigation: - - - 
Use encryption (SSL/TLS) to secure communication channels. 
Implement secure Wi-Fi protocols (WPA3) for wireless networks. 
Regularly monitor and update network configurations to detect unauthorized changes.

## Measuring Memory Utilization by Host
Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes

## Measuring Storage IO Latency
Quickly find I/O bottlenecks across your systems.
Query
index=main sourcetype=iostat | timechart avg(latency) by host

## Measuring Storage Speed IO Utilization by Host
It simple to track disk I/O, helping you quickly discover storage issues on your servers.
Query
index=main sourcetype=iostat | eval hostdevice=host+":"+Device | timechart avg(total_ops) by hostdevice

## Multiple Password Changes in Short time
Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes

## Multiple Windows Account Locked out
Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes

## Multiple Windows Logins by Same User
Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes

## multiple-failed-logins
Multiple Failed Logins: Detects multiple failed login attempts and disables compromised accounts

## privileged-user-account-activity

Privileged Access Monitoring: Tracks admin account activities and flags suspicious privilege escalations

Purpose
Monitor actions by privileged accounts (SOC2 CC6.1 Logical Access).

Query
index=windows EventCode=4728 OR EventCode=4732 | stats count by Account_Name

Outcome
Tracks changes in user group membership by privileged accounts. Helps detect misuse or escalation of privileges.

## Remote access login – success & failure
Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes

## Removable media detected
Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes

## resource-creation-by-unusual-user
Resource Creation/Deletion Alerting: Monitors for unusual resource creation or deletion in Azure and generates alerts

## Rogue DNS detection
Look for DNS requests that are not destined for the dedicated DNS server.
Query
index=security sourcetype=cp_log src_ip!=192.168.14.10 dest_ip!=192.168.14.10 protocol=53 action!=Drop | where dest_ip="192.168.0.0/16" AND src_ip="192.168.0.0/16" | stats count, values(dest_ip) by src_ip

## security-patch-installation
Monitor installation of security patches (SOC2 CC6.7 
System Operations)
Query
index=windows EventCode=19 | stats count by ComputerName
Outcome
Tracks systems where security patches have been installed. Ensures that all systems are up to date with the latest security patches.

## security-policy-modifications
Detect changes to security policies (SOC2 CC6.7 - System Operations).
Query
index=windows EventCode=4907 | stats count by Group_Name

Outcome
Detects changes to security policies across systems. Ensures that any unauthorized changes are quickly identified and investigated.

## software-vulnerability-scanning
Ensure regular vulnerability scanning of systems (SOC2 CC6.6 - Change Management).
Query
index=linux sourcetype=vulnerability_scan
Outcome
Provides a list of detected vulnerabilities from regular scans. Helps ensure timely patching of identified security risks

## suspicious-dns-requests
Identify DNS queries to malicious or suspicious domains (SOC2 CC6.8 - Risk Mitigation).
Query
index=dns sourcetype=dns_request | stats count by domain_name | where domain_name IN [malicious domains list]

Outcome
Detects requests to known malicious domains. Helps block further access to risky websites and mitigate threats

## suspicious-download-detection
Suspicious Download Detection: Tracks unusual downloads and isolates affected machines or blocks URLs

## suspicious-processes
Suspicious Process Detection: Flags and isolates machines running known malicious processes

Purpose
Detect suspicious process executions (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "process started"

Outcome
Monitors for unusual or unauthorized process startups on Linux systems. Enables detection of potential malware or rogue processes.

## suspicious-user-behaviour
Suspicious User Behavior: Analyzes user activity patterns for anomalies and sends alerts.

## tracking-service-account-usage
Monitor the use of service accounts (SOC2 CC6.1 - Logical Access)
Query
index=windows EventCode=4624 Logon_Type=5
Outcome
Tracks logins of service accounts across Windows environments. Helps prevent misuse of these critical accounts.

## Unauthorized Default Account Logins


## unauthorized-access-attempts
Purpose
Detect brute-force or unauthorized access attempts (SOC2 CC6.1 - Logical Access)

Example query Example query.
index=windows EventCode=4625 | stats count by Account_Name, Source_Network_Address

Outcome 
Identifies failed login attempts to accounts from various IP addresses. Helps detect potential brute-force attempts and prevent unauthorized access.

## unauthorized-software-installation
Track installation of unauthorized software (SOC2 CC6.7 System Operations).
Query
index=windows EventCode=4688 CommandLine=*install*

Outcome
Identifies unauthorized software installation commands on systems. Helps prevent installation of unapproved or malicious software

## Unusual Access
Look for count of multiple failed login attempts where successful login is true.
Query
| from datamodel:"Authentication"."Authentication" | where like(app,"ssh") | stats list(action) as Attempts, count(eval(match(action,"failure"))) as Failed, count(eval(match(action,"success"))) as Success by user,src,dest,app | where mvcount(Attempts)>=6 AND Success>0 AND Failed>=5


## usb-device-detection
Monitor USB device activity (SOC2 CC6.1 - Logical Access)

Query
index=windows EventCode=4663 | search "USB" | stats count by Device_Name, Account_Name

Outcome
Detects and tracks the use of USB storage devices on systems. Helps identify potential data leakage through external devices.

## User Deleted Within 24hrs of Being Created


## user-account-created-and-deleted-entra
User account creation and deletion by in Entra
Attackers often create a temporary account for persistence or privilege escalation and then delete it to reduce traces. In Microsoft Sentinel, you can detect this using audit logs from Microsoft Entra ID.


Detection goal
Detect when:
•	A user account is created 
•	And then deleted within a short time window (e.g., 5–15 minutes)


Data Source
Use:
•	AuditLogs table (Entra ID logs in Sentinel)

Key operations:
•	"Add user"
•	"Delete user"

KQL Query for Analytics Rule

let TimeWindow = 15m;
let CreatedUsers = AuditLogs
| where OperationName == "Add user"
| extend CreatedUser = tostring(TargetResources[0].userPrincipalName)
| extend CreatedTime = TimeGenerated
| project CreatedUser, CreatedTime, CorrelationId;

let DeletedUsers = AuditLogs
| where OperationName == "Delete user"
| extend DeletedUser = tostring(TargetResources[0].userPrincipalName)
| extend DeletedTime = TimeGenerated
| project DeletedUser, DeletedTime, CorrelationId;

CreatedUsers
| join kind=inner (
    DeletedUsers
) on $left.CreatedUser == $right.DeletedUser
| where DeletedTime between (CreatedTime .. CreatedTime + TimeWindow)
| project 
    User = CreatedUser,
    CreatedTime,
    DeletedTime,
    TimeDifference = datetime_diff("minute", DeletedTime, CreatedTime),
    CorrelationId
| order by CreatedTime desc

⚙️ Analytics Rule Configuration
Rule Type: Scheduled
Query Frequency: 5 minutes
Lookup Period: 30 minutes
Trigger Threshold: > 0
________________________________________
🚨 Entity Mapping
Map entities for investigation:
•	Account → User
•	IP Address (if available in InitiatedBy)
________________________________________
🔎 Enhancements (Highly Recommended)
1. Add Actor Context (Who did it)
| extend InitiatedByUser = tostring(InitiatedBy.user.userPrincipalName)
________________________________________
2. Filter Suspicious Behavior
Exclude legitimate automation/service accounts:
| where InitiatedByUser !contains "svc"
________________________________________
3. Detect Burst Activity (Multiple Accounts)
| summarize count() by InitiatedByUser, bin(CreatedTime, 15m)
| where count_ > 3
________________________________________
4. Add Risk Scoring
•	Assign High severity if:
o	Privileged role assigned before deletion
o	Multiple accounts created/deleted
________________________________________
🧪 Realistic Attack Mapping
This maps to:
•	MITRE ATT&CK
o	T1136 Create Account
o	T1078 Valid Accounts
________________________________________
🚀 Advanced Variant (Better Detection Logic)
Use union + summarize to correlate more efficiently:
AuditLogs
| where OperationName in ("Add user", "Delete user")
| extend User = tostring(TargetResources[0].userPrincipalName)
| extend Action = OperationName
| summarize 
    CreatedTime = minif(TimeGenerated, Action == "Add user"),
    DeletedTime = minif(TimeGenerated, Action == "Delete user"),
    Actions = make_set(Action)
    by User
| where "Add user" in Actions and "Delete user" in Actions
| where DeletedTime <= CreatedTime + 15m
| project User, CreatedTime, DeletedTime
________________________________________
⚠️ Tuning Considerations
•	False Positives
o	Test/dev environments
o	HR automation workflows
•	Noise Reduction
o	Exclude known admin accounts
o	Exclude provisioning tools (e.g., SCIM, scripts)
________________________________________
🧩 Optional Add-On Detections
You can chain this with:
•	User created → Role assigned → Deleted
•	User created → Login from unusual location → Deleted
•	User created → Mailbox access / data exfil → Deleted
________________________________________
If you want, I can help you build a full attack chain detection (multi-stage correlation rule) combining:
•	Account creation
•	Privilege escalation
•	Suspicious sign-in
•	Deletion
That would make it much closer to a real SOC use case.

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes


Purpose
Use firewall data to find TOR traffic on your network.
Query
index=network sourcetype=firewall_data app=tor src_ip=* | table _time src_ip src_port dest_ip dest_port bytes app

Outcome


Purpose
A brute-force attack consists of a multiple login attempts using many passwords by an unauthorized user/attacker with the hope of eventually guessing the correct password.
Query
index=__your_sysmon_index__ sourcetype=winxsecurity user=* user!"" | stats count(eval(action="success")) as successes count(eval(action="failure")) as failures by user, ComputerName | where successes>0 AND failures>100


windows.
index=windows source="WinEventLog:Security" EventCode=4625 | bin _time span=5m | stats count by _time,user,host,src,action | where count >= 5

Linux
index=linux source="/var/log/auth.log" "Failed password" | bin _time span=5m | stats count by _time,user,host,src,action | where count >= 5


Outcome

Detecting Network and Port Scanning

Purpose
Look for distinct count of destination ports within a short span of time.

Query
| from datamodel:"Network_Traffic"."All_Traffic" | stats dc(dest_port) as dc_dest_port by src, dest | where dc_dest_port > 10

Or

index=__your_sysmon_index__ sourcetype=firewall* | stats dc(dest_port) as num_dest_port dc(dest_ip) as num_dest_ip by src_ip | where num_dest_port >500 OR num_dest_ip >500

Outcome

Detecting Recurring Malware on Host
Purpose
Using anti-virus logs to detect if malware is recurring on a host after being removed.
Query
index=__your_sysmon_index__ sourcetype=symantec:* | stats count range(_time) as TimeRange by Risk_Name, Computer_Name | where TimeRange>1800 | eval TimeRange_In_Hours = round(TimeRange/3600,2), TimeRange_In_Days = round(TimeRange/3600/24,2)
Outcome


# Detection engineering processes

### Predict and Prioritize Security Weakness
* Gather threat intelligence information
* Manage vulnerabilities and risk
* Augment vulnerability scan data with context for optimized prioritization
* Manage device configurations (Firewalls, switches, routers, IPS/IDS)
### Detect deviations to identify malicious activity
* Establish baseline behaviors
* Monitor and investigate anomalies
* Monitor network flows
### React in real time to exploits
* Correlate logs, events, network flows, identities, assets, vulnerabilities and configurations and add context.
* Use automated and cognitive solutions to make data accessible by existing staff.

Threat detection involves a combination of strategies to identify and respond to potential security threats. 

### 1. Prediction and Prioritization:
•	Gather Threat Intelligence: Collect information about current threats and attacker behaviours.
•	Vulnerability Management: Identify and prioritize vulnerabilities in your systems.
•	Contextualize Vulnerability Scans: Analyze scan data alongside threat intelligence to focus on the most critical weaknesses.
•	Device Configuration Management: Ensure firewalls, switches, and other security devices are properly configured.

### 2. Anomaly Detection:
•	Baseline Behaviour Establishment: Set benchmarks for normal network activity.
•	Monitoring and Investigation: Identify and investigate deviations from established baselines that might indicate suspicious activity.
•	Network Flow Monitoring: Track and analyse network traffic for signs of malicious behaviour.

### 3. Real-Time Response:
•	Log Correlation: Combine data from logs, events, network flows, and other sources to gain a comprehensive picture of potential threats.
•	Automated and Cognitive Solutions: Utilize tools that streamline data analysis and response, allowing existing staff to handle threats effectively.

By implementing these steps, organizations can proactively identify and address security threats before they cause damage.



## Threat Detection approaches
### By Assets:
•	Focus on protecting your most valuable assets, like data, infrastructure, and intellectual property.
•	Identify vulnerabilities that could expose these assets to attack.

### By Attackers:
•	Consider what attackers might target (data, systems, reputation).
•	Analyze their motivations (financial gain, espionage, disruption) and methods (malware, hacking) to predict their actions.

### By Software:
•	Focus on identifying and patching vulnerabilities in software used by your organization.

## Proactive vs. Reactive Approaches:
•	Proactive (SDLC): This approach identifies threats early in the development process (Security Development Lifecycle).
o	Benefits: fewer coding errors, more effective defenses, lower overall cost.
•	Reactive (Penetration Testing): This approach identifies threats after the system is built.
o	Examples: penetration testing, code review.
o	Benefits: less expensive than redesigning systems, but may not be as effective.
o	Techniques: fuzz testing (feeding random invalid data to find flaws).

By combining these approaches, you can develop a comprehensive threat identification strategy that helps you proactively protect your organization.

# Detection techniques


**Signature-Based Detection**
* This is a traditional approach that relies on identifying malicious activity based on known patterns or signatures of cyberattacks. 
* Security software is programmed to detect these patterns in network traffic, emails, or files. 
* This method is effective for known threats but can miss zero-day attacks or novel variants.
 
**Anomaly-Based Detection**
* This technique analyses network traffic, system activity, or user behaviour for deviations from the established baseline. 
* It identifies activities that fall outside the usual patterns, which might indicate suspicious or malicious behaviours. 
* This can be useful for catching new or unknown threats, but it can also generate a high number of false positives.
* Bundles of Data in the Wrong Place 
 
**Threat Intelligence**
* This involves collecting and analysing information about current and emerging cyber threats. 
* Security professionals use this information to update their security systems and identify potential IOCs associated with these threats. 
* IOCs can include malicious URLs, IP addresses, email addresses, or file hashes.
* Security systems can be configured to monitor for these IOCs in network traffic or system activity, helping to identify ongoing attacks that use these specific tactics.  
* Threat intelligence can include Indicators of Behaviour (IOBs) which describe suspicious patterns of attacker activity.  Security systems can be programmed to recognize these behavioural patterns and raise alerts.
 
**Traffic Analysis or Behavioural Analysis**
* This involves examining network traffic patterns to identify suspicious activities. 
* Techniques include looking for unusual data volumes, unauthorized access attempts, or communication with known malicious domains or Ips.
* This technique focuses on user and entity behaviour. 
* By monitoring login attempts, data access patterns, and other user activities, anomalies that might indicate compromised accounts or insider threats can be identified.
* Examples: Detection of unsuccessful login attempts
 
 
**Log Analysis (Real-time Analysis)**
* Security logs contain a wealth of information about system activity and user actions. 
* Security professionals can analyse these logs in real-time to identify suspicious entries, failed login attempts exceeding a threshold within a short timeframe, or unauthorized access attempts to critical systems.
 
**Deception Techniques (Honeypot Monitoring)**
* Deception involves deploying decoy systems or honeypots that mimic real systems. 
* When attackers target honeypots, their activity is monitored in real-time, revealing their tactics and techniques used during the ongoing attack. 
* This allows security teams to understand the attacker's goals and take appropriate countermeasures.
 
**Packet Inspection (Deep Packet Inspection)**
* Security professionals can capture and analyse network packets for suspicious activity in real-time. 
* This deeper inspection can reveal ongoing attempts to exploit vulnerabilities, transfer stolen data, or establish command and control channels.
 
**Statistical Analysis (Real-time Analytics)**
* Statistical techniques can be applied to analyse network traffic or system activity for anomalies in real-time. 
* Deviations from normal patterns, such as a sudden increase in failed login attempts or a surge in network traffic to a specific location, can indicate ongoing malicious activity.
 
**Indicators of compromise**
Anomalies in Privileged User Account Activity
Geographical Irregularities 
HTML Response Sizes 
Increases in Database Read Volume
Large Numbers of Requests for the Same File 
Log-In Red Flags 
Mismatched Port-Application Traffic 
Mobile Device Profile Changes 
Signs of DDoS Activity 
Suspicious Registry or System File Changes 
Unexpected Patching of Systems 
Unusual DNS Requests 
Unusual Outbound Network Traffic 
Web Traffic with Unhuman Behaviour 

# Endpoint attack indicators

* Signs of Compromised Endpoints (Beyond the Basics)
* Antimalware alert: Detection of malware on Endpoint.
* Antimalware solution disabled
* EDR sensors uninstalled
* Antimalware signature updates stopped
* Detected connection with command and control IP or URL from endpoint
* Sudden increase in memory usage
* Use of local accounts locked
* Sudden increase in CPU usage
* Unwanted process detected
* Unwanted service detected
* Unwanted software installation detected
* Data upload on third party cloud storage solutions detected
* Command and Control Access monitoring
* Command and Control Access/Termination monitoring
* Computers running slowly
* Cryptographic hashes of critical files to speed incident analysis, verification, and eradication.
* Endpoint records audit configuration change in its logs
* High load or system freeze
* If nothing is found, consider using an alternative antivirus program. 
* Look for File integrity monitoring alerts and logs: FIM can detect changes made during incident to files.
* Look for OS and Application alerts and logs.
* Malware beacon monitoring
* Malware propagation monitoring
* Malware signal monitoring
* Malware/Worm propagation monitoring
* Mobile device profile changes
* Run antivirus program to complete a full scan, and take notes of the results it gives you.
* Suspicious system file or registry changes
* Tampered registry configuration 
* Unexpected patching of systems
* Unwanted system changes
* Violation of organizations acceptable usage policy
* Web server log entries that show usage of vulnerability scanners
* Worm/malware propagation monitoring
* System Behaviour:
* Unexpected System Restarts: Frequent reboots without user initiation.
* Slow System Performance: Unusual sluggishness or delays in program execution.
* Unexplained Network Activity: Unidentified programs or services sending/receiving excessive data.
* Unusual System Pop-Ups: Unexpected messages or alerts appearing on the screen.
* Modified System Settings: Changes in language, time zone, or desktop configuration.
* Disabled Security Software: Disabled antivirus, firewall, or intrusion detection systems (IDS).
* Hidden Processes: Unidentified processes running in the background.
* Corrupted Files: System files or program executables suddenly become damaged.
* Missing System Files: Critical system files inexplicably disappear.
* New or Unknown User Accounts: Unfamiliar user accounts appearing on the system.
* Network Activity:
* Connections to Known Malicious IPs: Communication with known command-and-control (C&C) servers.
* Unusual DNS Requests: Sudden spikes in DNS queries to suspicious domains.
* Data Exfiltration Attempts: Signs of data being transferred out of the network.
* Lateral Movement: Attempts to connect to other internal network devices.
* Tunnelling Activity: Encrypted connections suggesting data obfuscation.
* Anomalous Port Scans: Scans for vulnerabilities on other network devices.
* Unusual Traffic Patterns: Deviations from typical network usage patterns.
* High Bandwidth Usage by Unknown Processes: Unidentified applications consuming excessive bandwidth.
* Failed Login Attempts: Repeated login attempts from unrecognized locations.
* Brute-Force Attacks: Attempts to crack passwords through automated guessing.
* Communication with suspicious random domain name
* Sudden increase in network traffic coinciding with unusual login attempts from a new IP address could indicate a coordinated attack.
* Endpoint Security:
* Security Software Alerts: Antivirus or IDS notifications indicating suspicious activity.
* EDR Sensor Issues: Endpoint detection and response (EDR) sensors disabled or malfunctioning.
* Anti-malware Signature Update Failures: Inability to update anti-malware definitions.
* Security Software Tampering: Attempts to disable or modify security software settings.
* Bypassed Security Controls: Indicators of security measures being evaded.
* Digital currency mining activity
* File System Activity:
* Unusual File Creation: Unexpected files appearing on the system.
* Modified System Files: System files showing signs of tampering.
* Deleted Logs: Missing system or application logs.
* Hidden Files or Directories: Unexplained hidden folders or files.
* Suspicious File Names: Files with obfuscated names or unusual extensions.
* User Activity:
* Unusual User Login Times: Login attempts outside the user's typical timeframe.
* Access Attempts from Unknown Locations: Login attempts originating from unfamiliar geographical locations.
* Increased Privileged Account Activity: Unusual activity on accounts with elevated access.
* Access to Sensitive Data: Unauthorized access attempts to sensitive files or folders.
* Downloaded Unknown Files: Downloads from untrusted sources or unknown websites.
* Indicators of Persistence:
* Autoruns Modified: Changes to startup programs allowing for persistence.
* Scheduled Tasks Altered: Modifications to scheduled tasks used for malicious activity.
* Registry Changes: Suspicious entries added to the system registry.
* Rootkit Detection: Signs of a program designed to hide malicious processes.
* Hidden Services or Backdoors: Unexplained services or backdoors allowing remote access.
* Web Browsing Activity:
* Unexpected Browser Extensions: Unfamiliar extensions installed in the user's web browser.
* Bookmarked Malicious Websites: Bookmarks to known phishing or malware distribution sites.
* Browser History Changes: Deletion or modification of browsing history.
* Email Activity:
* Sending Spam Emails: The endpoint sending unsolicited emails.
* Unusual Email Activity: Increased email sending/receiving from the compromised account.
* Other Indicators:
* Unexplained Peripheral Device Activity: Unexpected activity on external devices.
* Microphone or Webcam Activation: Unexpected activation of audio or video recording devices.
* Changes in File Permissions: Modification of access rights for files and folders.
* System Resource Exhaustion: High CPU, memory, or disk usage without apparent cause.
* User Reports: Users reporting unusual system behavior or suspicious activity. 
* Look for OS and Application alerts and logs.
* Look for File integrity monitoring alerts and logs: FIM can detect changes made during incident to files.
* Cryptographic hashes of critical files to speed incident analysis, verification, and eradication.
* If nothing is found, consider using an alternative antivirus program. 
* Run antivirus program to complete a full scan, and take notes of the results it gives you. 
* Intrusion detections on OS: On a periodic basis run through these quick steps to look for anomalous behavior caused by a computer intrusion. Each of these commands runs locally on a system.
* Detect compromised processes and services
* Be familiar with normal processes and services.
* Strange programs referred to registry keys associated with system start up
* Sudden increase/decrease in File space usage in C drive
* Unusual Files and Registry Keys
* Unusually big files
* Detect suspicious log entries
* Check your logs for suspicious events, such as ‘Event log service was stopped’, ‘Windows File Protection is not active on this system’, ‘The protected System file [file name] was not restored to its original, valid version because the Windows File Protection’, and ‘The MS Telnet Service has started successfully’.
* Look for large number of failed logons attempts or locked out accounts. 
* Detect compromised scheduled tasks or cronjobs
* Look at scheduled tasks on the local host by running
* Check the scheduled tasks using the Task Manager
* Look for unusual scheduled tasks, especially those that run as with root or admin privileges. 
* Look for unexpected entries in user autostart directories
* Suspicious system file or registry changes
* Unexpected patching of systems
* Mobile device profile changes
* Tampered registry configuration 
* Unwanted system changes
* Antimalware alerts when it detects Endpoint is infected with malware
* Endpoint records audit configuration change in its logs
* Computers running slowly
* Web server log entries that show usage of vulnerability scanners
* Violation of organizations acceptable usage policy
* High load or system freeze
* Worm/malware propagation monitoring:
* Malware beacon monitoring
* Command and Control Access monitoring
* CnC Termination monitoring
* Malware/Worm propagation monitoring
* Anti-virus status/infection trends

Endpoint IOCs are signals indicating a potential compromise of a device. They can be categorized as follows:

Security Product Alerts
•	Anti-malware detections: Indicates active malware infection.
•	Anti-virus status changes: Unusual changes in antivirus protection.
•	Anti-spyware alerts


Performance and Behaviour Anomalies
•	System performance issues: Slowdowns, freezes, or high resource utilization.
•	Unexpected system changes: Unauthorized modifications to system configuration.
•	Policy violations: User actions contradicting organizational guidelines.

Malware and Threat Activity
•	Malware communication: Indicators of malware contacting command-and-control servers.
•	Malware propagation: Spread of malware within the network.
•	Vulnerability exploitation: Signs of attempts to exploit system vulnerabilities.

Configuration Changes
•	Audit log changes: Modifications to system audit configuration, Violation of organizations acceptable usage policy
•	Registry modifications: Unauthorized alterations to system registry.
•	Patching anomalies: Unusual or forced system updates.
•	Device profile changes

Additional Indicators
•	Mobile device profile changes: Unauthorized modifications to mobile device settings.
•	Web server logs: Evidence of vulnerability scanning activities.

Note: These IOCs can be used to detect and respond to endpoint attacks, but they often require additional context and analysis to determine the severity of a threat.

•	Antimalware 
•	AV alerts
•	Malware signal monitoring
•	Malware/Worm propagation monitoring
•	Antivirus infection trends
•	Worm/malware propagation monitoring
•	CnC Termination monitoring
•	Command and Control Access monitoring
•	Computers running slowly
•	Endpoint records audit configuration change in its logs
•	High load or system freeze
•	Mobile device profile changes
•	Suspicious system file or registry changes
•	Tampered registry configuration 
•	Unexpected patching of systems
•	Unwanted system changes
•	Violation of organizations acceptable usage policy
•	Web server log entries that show usage of vulnerability scanners



## Endpoint IoC
* •	Anti-malware and AV alerts: Detection of malware, viruses, or other malicious software.
* •	Antivirus infection trends: Analysing patterns and trends in malware infections.
* •	CnC termination: Identifying and blocking communication with malicious command and control servers.
* •	Command and control access monitoring
* •	Endpoint records audit configuration changes: Tracking changes to endpoint configurations.
* •	Malware signal monitoring: Identifying and tracking indicators of malware activity.
* •	Malware/worm propagation monitoring: Detecting the spread of malware or worms within the network.
* •	Performance issues: Slow performance, high load, or system freezes.
* •	Suspicious system file or registry changes: Modifications to critical system files or registry settings.
* •	Tampered registry configuration: Unauthorized alterations to registry settings.
* •	Unexpected patching of systems: Unplanned or unauthorized updates to systems.
* •	Unwanted system changes: Modifications to systems that are not authorized or expected.
* •	Violation of organization's acceptable usage policy: Non-compliance with established rules and guidelines.
* •	Web server log entries showing vulnerability scanners: Detection of attempts to scan for vulnerabilities.
Antimalware alerts when it detects Endpoint is infected with malware
Antimalware/Antivirus alerts
Antivirus alerts
Antivirus infection trends
Anti-virus status/infection trends
AV alerts
CnC Termination monitoring
Command and Control Access monitoring
Command and Control Access/Termination monitoring
Computers running slowly
Cryptographic hashes of critical files to speed incident analysis, verification, and eradication.
Endpoint records audit configuration change in its logs
High load or system freeze
If nothing is found, consider using an alternative antivirus program. 
Look for File integrity monitoring alerts and logs: FIM can detect changes made during incident to files.
Look for OS and Application alerts and logs.
Malware beacon monitoring
Malware propagation monitoring
Malware signal monitoring
Malware/Worm propagation monitoring
Mobile device profile changes
Run antivirus program to complete a full scan, and take notes of the results it gives you.
Suspicious system file or registry changes
Tampered registry configuration 
Unexpected patching of systems
Unwanted system changes
Violation of organizations acceptable usage policy
Web server log entries that show usage of vulnerability scanners
Worm propagation monitoring
Worm/malware propagation monitoring

# IAM attack indicators



* Access successful from non-trusted or foreign country.
* Activity from terminated accounts
* Anomalies in privileged user account activity
* High amounts of accounts locked
* High risk user access monitoring
* Login failure for disabled/expired accounts of previous employees.
* Login failures followed by success for same Username
* Login failures followed by success from same Source IP 
* Login failures followed by success from same Source IP located in foreign country
* Login failures followed by success to same Destination IP
* Login failures followed by success to same Username: Multiple login failures by same user
* Login success from accounts of Terminated employees. 
* Login successful after nmap or other reconnaissance scan attempt from same source
* Login successful after nmap or other reconnaissance scan attempt to same destination IP 
* Multiple failed logins attempt from unfamiliar remote system
* Multiple login attempts from same source IP address by using multiple accounts with multiple passwords - Brute force attack.
* Multiple login failures for single username
* Multiple login failures from same Source IP for 10 times to same destination within 1 or 5 minutes.
* Multiple login failures from same Source IP for 3 times, to 3 destination IP's within 10 minutes.
* Multiple login failures from multiple Source IP for 3 times, to 3 destination IP's within 10 minutes.
* Multiple login failures from multiple Source IP for 3 times, to same destination IPs within 10 mins.
* Multiple login failures to same destination IP for more than 10 times, from more than 10 source IP addresses within 10 minutes.
* Multiple login failures to same destination IP from same source IP for more than 10 times in 5 mins. 
* Multiple login failures to same destination IP such as for more than 10 times, from more than 10 source IP in 10 mins.
* No activity for 60 Days from user account 
* Privileged user account activity anomalies.
* Privileged user monitoring
* Unauthorized application access
* Unusual account activity. Which systems have suspicious access/application activity?
* Users being locked out of their accounts 
* Users being unable to access documents. Which accounts are being used from suspicious locations?
* Track login attempts: Monitor successful and failed login attempts, paying attention to unusual times, locations, or IP addresses.
* Analyze user behaviour: Look for deviations from normal activity patterns, such as accessing unusual resources or performing actions at odd times.
* Use SIEM tools: These tools can aggregate and analyse logs from various sources to identify suspicious activity.
*  Use Microsoft Entra / Azure Monitor / similar tools: Track changes made to IAM policies, users, and roles.
* Set up alerts for critical changes: Be notified immediately of any suspicious modifications.
* Investigate unauthorized changes: Carefully investigate any unauthorized changes to identify and mitigate potential threats.
* Consider using specialized security solutions designed to detect and respond to IAM attacks.
* Detect suspicious accounts and their activities

* Anomalies in privileged user account activity
* Geographical irregularities
* Log in red flags
* Unusual account activity
* Users being locked out of their accounts 
* Users being unable to access documents 
* Multiple failed logins attempt from unfamiliar remote system
* High amounts of accounts locked
* Authentication: Login Failures Followed by Success to the same Destination IP OR Source IP
* Authentication: Login Failures Followed By Success to the same Username - Reports multiple log in failure followed by a successful login from the same user
* Authentication: Login Failure to Disabled Account - Reports a host login message from a disabled user account. If the user is no longer a member of the organization, we recommend that you investigate any other received authentication messages from the same user.
* Authentication: Login Failure to Expired Account - Reports a host login failure message from an expired user account known. If the user is no longer a member of the organization, we recommend that you investigate any other received authentication messages.
* Authentication: Login Successful After Scan Attempt - Reports a successful log in to a host after recon has been performed against the network.
* Authentication: Multiple Login Failures for Single Username - Reports authentication failures for the same username.
* Authentication: Multiple Login Failures from the Same Source - Reports authentication failures on the same source IP address more than three times, across more than three destination IP addresses within 10 minutes.
* Authentication: Multiple Login Failures to the Same Destination - Reports authentication failures on the same destination IP address more than ten times, from more than 10 source IP addresses within 10 minutes.
* Authentication: Multiple VoIP Login Failures - Reports multiple login failures to a VoIP PBX.
* Authentication: No Activity for 60 Days - This account has not logged in for over 60 days.
* Authentication: Possible Shared Accounts - Detection of Shared Accounts. You will need to add in additional false positive system accounts to the and NOT when the event username matches the following ...". "
* Authentication: Repeat Non-Windows Login Failures - Reports when a source IP address causes an authentication failure event at least 7 times to a single destination within 5 minutes.
* Authentication: Repeat Windows Login Failures - Reports when a source IP address causes an authentication failure event at least 9 times to a single Windows host within 1 minute.
* Brute Force Attack - Check for attempts to gain access to a system by using multiple accounts with multiple passwords.
* Privileged user abuse - Monitor misuse of access of privileged user access such as admin or root access to perform malicious activities.

* Privileged user account activity anomalies.
* Login Failure to Disabled/Expired Account - Reports a host login message from a disabled/expired user account
* Login Failures followed by success from same source IP 
* Login Failures followed by success to same destination IP 
* Login Failures followed by success to the same Username 
* Login successful after scan attempt from same source IP 
* Login successful after scan attempt to same destination IP 
* Multiple login failures for single username
* Multiple login failures from same source IP (more than 3 times, to more than 3 destination IPs within 10 mins) 
* Multiple login failures to same destination IP (more than 10 times, from more than 10 source IP in 10 mins) 
* Multiple VoIP PBX login failures  
* No activity for 60 Days from user account 
* Detection of possible shared accounts.  
* Repeat non-windows login failures to same destination IP from same source IP for more than 7 times in 5mins
* Repeat windows login failures to same destination host/IP from same source IP for more than 9 times in 1mins 
* Brute-Force attack: Attempts to gain access by using multiple accounts with multiple passwords.
* Geographical irregularities
* High amounts of accounts locked
* Log in red flags
* Multiple failed logins attempt from unfamiliar remote system
* Privileged user abuse - Monitor misuse of access of privileged user access such as admin or root access to perform malicious activities. 
* Unusual account activity
* Users being locked out of their accounts 
* Users being unable to access documents 

* •	Multiple Login Failures:
* o	Same Source: Over 3 failures from the same IP to different destinations within 10 minutes.
* o	Same Destination: Over 10 failures to the same IP from different sources within 10 minutes.
* o	Single Username: Repeated failures for the same username.
* o	VoIP: Multiple failures to a VoIP PBX.
* o	Unfamiliar remote system: multiple failed login attempts.
* •	Login Failures Followed by Success:
* o	Same IP: Unsuccessful logins followed by successful ones from the same IP or destination.
* o	Same Username: Multiple failed attempts before successful login for the same user.
* •	Disabled or Expired Accounts / No activity
* o	Login failures for accounts that are disabled or expired. 
* o	Investigate if other services accounts received authentication messages.
* o	Accounts with no logins for over 60 days.
* •	Successful Login After Reconnaissance Scan
* o	Login success following network reconnaissance in to a destination.
* •	Repeat Login Failures
* o	Non-Windows: 7+ failures from the same IP to a single destination within 5 minutes.
* o	Windows: 9+ failures from the same IP to a single Windows host within 1 minute.
* •	Shared Accounts Detection
* o	Detection of multiple users accessing the same account.
* •	Privileged User Abuse
* o	Misuse of admin or root access for malicious activities.
* o	Monitor misuse of privileged user access such as admin or root access to perform malicious activities.
* o	Anomalies in privileged user account activity
* •	Brute Force Attack: 
* o	Multiple attempts to gain access using multiple accounts and multiple passwords.
* •	High number of accounts lockout
* o	High number of accounts locked due to failed login attempts.
* •	Users Locked Out or unable to access documents.
* o	Users unable to access their accounts.
* o	Users unable to access documents.
* •	Unusual Account Activity: 
* o	Unexpected actions or patterns from user accounts.
* •	Geographical Irregularities: 
* o	Logins from unexpected locations.

Login Anomalies

• Login Failures:
o To disabled/expired accounts
o Followed by success from same source IP
o Followed by success to same destination IP
o Followed by success to same username
o After scan attempt from same source IP
o After scan attempt to same destination IP
• Multiple Login Failures:
o For single username
o From same source IP (more than 3 times, to more than 3 destination IPs within 10 mins)
o To same destination IP (more than 10 times, from more than 10 source IP in 10 mins)
• VoIP PBX Login Failures
• No activity for 60 Days from user account
• Detection of possible shared accounts
• Repeat login failures:
o Non-Windows to same destination IP from same source IP (more than 7 times in 5 mins)
o Windows to same destination host/IP from same source IP (more than 9 times in 1 min)
Other Anomalies

• Brute-Force attack: Attempts to gain access by using multiple accounts with multiple passwords
• Geographical irregularities
• High amounts of accounts locked
• Log in red flags
• Multiple failed logins attempt from unfamiliar remote system
• Privileged user abuse
• Unusual account activity
• Users being locked out of their accounts
• Users being unable to access documents
Anomalies in privileged user account activity
Are terminated accounts still being used?
Authentication: Login Failure to Disabled Account - Reports a host login message from a disabled user account. If the user is no longer a member of the organization, we recommend that you investigate any other received authentication messages from the same user.
Authentication: Login Failures Followed by Success to the same Destination IP OR Source IP
Authentication: Login Failures Followed by Success to the same Username - Reports multiple logs in failure followed by a successful login from the same user
Authentication: Login Successful After Scan Attempt - Reports a successful log in to a host after recon has been performed against the network.
Authentication: Multiple Login Failures for Single Username - Reports authentication failures for the same username.
Authentication: Multiple Login Failures from the Same Source - Reports authentication failures on the same source IP address more than three times, across more than three destination IP addresses within 10 minutes.
Authentication: Multiple Login Failures to the Same Destination - Reports authentication failures on the same destination IP address more than ten times, from more than 10 source IP addresses within 10 minutes.
Authentication: Multiple VoIP Login Failures - Reports multiple login failures to a VoIP PBX.
Authentication: No Activity for 60 Days - This account has not logged in for over 60 days.
Authentication: Possible Shared Accounts - Detection of Shared Accounts. You will need to add in additional false positive system accounts to the and NOT when the event username matches the following ...". "
Authentication: Repeat Non-Windows Login Failures - Reports when a source IP address causes an authentication failure event at least 7 times to a single destination within 5 minutes.
Authentication: Repeat Windows Login Failures - Reports when a source IP address causes an authentication failure event at least 9 times to a single Windows host within 1 minute.
Brute Force Attack - Check for attempts to gain access to a system by using multiple accounts with multiple passwords.
Brute-Force attack: Attempts to gain access by using multiple accounts with multiple passwords.
Detection of possible shared accounts.  
Detection of possible shared accounts. 
Geographical irregularities
High amounts of accounts locked
High risk user access monitoring
Log in red flags
Login Failure to Disabled Account - Reports a host login message from a disabled user account. If the user is no longer a member of the organization, we recommend that you investigate any other received authentication messages from the same user.
Login Failure to Disabled/Expired Account - Reports a host login message from a disabled/expired user account
Login Failure to Expired Account - Reports a host login failure message from an expired user account known. If the user is no longer a member of the organization, we recommend that you investigate any other received authentication messages.
Login Failures followed by success from same source IP 
Login Failures followed by success to same destination IP 
Login Failures Followed by Success to same Source/Destination IP. 
Login Failures Followed by Success to same Username - Reports multiple log in failure followed by a successful login from the same user
Login Failures followed by success to the same Username 
Login successful after scan attempt - Successful log in to a host after recon has been performed. 
Login successful after scan attempt from same source IP 
Login successful after scan attempt to same destination IP 
Login successful after scan attempt to/from same destination and source IP.
Multiple failed logins attempt from unfamiliar remote system
Multiple login failures for single username
Multiple Login Failures for Single Username - Reports authentication failures for the same username.
Multiple login failures from same source IP (more than 3 times, to more than 3 destination IPs within 10 mins) 
Multiple login failures to same destination IP (more than 10 times, from more than 10 source IP in 10 mins) 
Multiple VoIP PBX login failures  
No activity for 60 Days from user account 
Privileged user abuse - Monitor misuse of access of privileged user access such as admin or root access to perform malicious activities. 
Privileged user abuse - Monitor misuse of access of privileged user access such as admin or root access to perform malicious activities.
Privileged user account activity anomalies.
Privileged user monitoring
Repeat non-windows login failures to same destination IP from same source IP for more than 7 times in 5mins
Repeat windows login failures to same destination host/IP from same source IP for more than 9 times in 1mins 
Unauthorized application access
Unusual account activity
Users being locked out of their accounts 
Users being unable to access documents
Users being unable to access documents 
Which accounts are being used from suspicious locations?
Which systems have suspicious access/application activity?

# Network attack indicators

* Signs of Network compromise
* Anomalous Ports, Services and Unpatched Hosts or Network Devices - Unusual traffic is identified as a potential intrusion; no signatures are involved in the process, so it is more likely to detect new attacks for which signatures are yet to be developed. 
* DNS activity: Tampered domain name servers DNS and Unusual DNS request
* DNS malicious activity such as Tampered domain name servers DNS and Unusual DNS request
* Excessive Firewall Accepts from Multiple Sources to a Single Destination - Reports excessive Firewall Accepts to the same destination from at least 100 unique source IP addresses in 5 minutes.
* Excessive Database Connections
* Excessive Firewall Accepts Across Multiple Hosts - Reports excessive Firewall Accepts across multiple hosts. More than 100 events were detected across at least 100 unique destination IP addresses in 5 minutes
* Excessive Firewall Accepts from Multiple Sources to a Single Destination - Reports excessive Firewall Accepts to the same destination from at least 100 unique source IP addresses in 5 minutes.
* Excessive Firewall Denies from Single Source - Detects more than 400 firewall deny attempts from a single source to a single destination within 5 minutes.
* Excessive Firewall Denies from Single Source - Reports excessive firewall denies from a single host. Detects more than 400 firewall deny attempts from a single source to a single destination within 5 minutes.
* Firewall accepts excessive traffic from multiple sources to single destination - Firewall accepts traffic from 100 source IP to single destination in 5 mins.
* Firewall accepts excessive traffic on multiple hosts - More than 100 events are detected on at least 100 destination IPs in 5 minutes
* Firewall denies excessive traffic from single source - Firewall denies 400 attempts from a single source to a single destination within 5 minutes.
* IDP: IDPs use signatures to identify malicious activity, signatures must be kept up to date to detect newest attacks. IDPs often produce false positives, so analyst should manually validate IDPs alerts either by closely reviewing recorded supporting data or by getting related data from other sources. On a periodic basis run through these quick steps to look for anomalous behavior caused by a computer intrusion. Each of these commands runs locally on a system.
* Long Duration Flow Involving a Remote Host - Reports a flow for communicating to or from the Internet with a sustained duration of more than 48 hours. This is not typical behaviour for most applications. We recommend that you investigate the host for potential malware infections.
* Long Duration ICMP Flows - Detection of ICMP packets between hosts that last a long time. This is rare and should not ever occur.
* Look for Network alerts and logs for Suspicious connection attempts on server, High increase of support calls, Suspicious network traffic, Suspicious connection attempts in firewalls. 
* Mismatched port application traffic
* Network admin notices unusual deviation in network traffic flows
* Network Intrusion Detection Sensor alerts when buffer overflow attempt occurs against DB server.
* Network traffic: Unusual outbound network traffic
* Outbound Connection to a Foreign Country - Reports successful logins or access from an IP address known to be in a country that does not have remote access right. Before you enable this rule, we recommend that you configure the active list: Countries with no Remote Access building block.
* Port lists including commonly used ports and trojan horses’ ports
* Potential Honeypot Access - Reports an event that was targeting or sourced from a honeypot or tarpit defined address. Before enabling this rule, you must configure the Active list: Honeypot like addresses building block and create the appropriate sentry from the Network Surveillance interface.
* Redirected internet searches 
* Remote Access from Foreign Country - Reports successful logins or access from an IP address known to be in a country that does not have remote access right. Before you enable this rule, we recommend that you configure the Active list: Countries with no Remote Access building block
* Remote Inbound Communication from a Foreign Country - Reports traffic from an IP address known to be in a country that does not have remote access right. Before you enable this rule, we recommend that you configure the Active list: Countries with no Remote Access building block. SMTP and DNS have been removed from this test as you have little control over that activity. You may also have to remove Webservers in the DMZ that are often probed by remote hosts with web scanners
* Requests for unauthorised payments 
* Signs of DDoS activity
* Single IP with Multiple MAC Addresses - This rule will fire when a single IP's MAC address changes multiple times over a period.
* Systems using many different protocols - Local system connecting to the internet on more than 50 DST ports in one hour. Connections must be successful. This rule can be edited to also detect failed communications which may also be useful.
* Tampered domain name servers DNS
* Unusual DNS request
* Unusual outbound network traffic
* Unusual traffic is identified as a potential intrusion; no signatures are involved in the process, so it is more likely to detect new attacks for which signatures are yet to be developed.
* VPN Sneak Attack - Check from where remote users are connecting, and what they are accessing. A VPN connection access can be misused to gain access to the intranet.
* Web traffic with unhuman behaviour
* Look for Network alerts and logs for Suspicious connection attempts on server, High increase of support calls, Suspicious network traffic, Suspicious connection attempts in firewalls. 
* IDP: IDPs use signatures to identify malicious activity, signatures must be kept up to date to detect newest attacks. IDPs often produce false positives, so analyst should manually validate IDPs alerts either by closely reviewing recorded supporting data or by getting related data from other sources. On a periodic basis run through these quick steps to look for anomalous behaviour caused by a computer intrusion. Each of these commands runs locally on a system.
* Port lists including commonly used ports and trojan horses’ ports
* Again, you need to understand normal port usage for the system and look for deviations.
* For continuously updated and scrolling output of this command every 5 seconds.
* Identify the dll or executable file linked with suspicious or malicious connections or processes. 
* Look at file shares, and make sure each has a defined business purpose. 
* Look at NetBIOS over TCP/IP activity. 
* Look at which sessions this machine has opened with other system. 
* Look at who has an open session with the machine.
* Look for unusual listening TCP and UDP ports.
* Verify the OS Firewall configuration
* Unusual outbound network traffic
* Mismatched port application traffic
* Unusual DNS request
* Web traffic with unhuman behaviour
* Signs of DDoS activity
* Tampered domain name servers DNS
* Network Intrusion Detection Sensor alerts when buffer overflow attempt occurs against DB server.
* Redirected internet searches 
* Requests for unauthorised payments 
* Network admin notices unusual deviation in network traffic flows
* Excessive Database Connections
* Excessive Firewall Accepts Across Multiple Hosts - Reports excessive Firewall Accepts across multiple hosts. More than 100 events were detected across at least 100 unique destination IP addresses in 5 minutes

* Unusual outbound network traffic
* Mismatched port application traffic
* Unusual DNS request
* Web traffic with unhuman behaviour
* Signs of DDoS activity
* Tampered domain name servers DNS
* Network Intrusion Detection Sensor alerts when buffer overflow attempt occurs against DB server.
* Redirected internet searches 
* Requests for unauthorised payments 
* Network admin notices unusual deviation in network traffic flows
* Excessive Database Connections
* Excessive Firewall Accepts Across Multiple Hosts - Reports excessive Firewall Accepts across multiple hosts. More than 100 events were detected across at least 100 unique destination IP addresses in 5 minutes
* Excessive Firewall Accepts from Multiple Sources to a Single Destination - Reports excessive Firewall Accepts to the same destination from at least 100 unique source IP addresses in 5 minutes.
* Excessive Firewall Denies from Single Source - Reports excessive firewall denies from a single host. Detects more than 400 firewall deny attempts from a single source to a single destination within 5 minutes.
* Long Duration Flow Involving a Remote Host - Reports a flow for communicating to or from the Internet with a sustained duration of more than 48 hours. This is not typical behaviour for most applications. We recommend that you investigate the host for potential malware infections.
* Long Duration ICMP Flows - Detection of ICMP packets between hosts that last a long time. This is rare and shouldn't ever occur.
* Outbound Connection to a Foreign Country - Reports successful logins or access from an IP address known to be in a country that does not have remote access right. Before you enable this rule, we recommend that you configure the active list: Countries with no Remote Access building block.
* Potential Honeypot Access - Reports an event that was targeting or sourced from a honeypot or tarpit defined address. Before enabling this rule, you must configure the Active list: Honeypot like addresses building block and create the appropriate sentry from the Network Surveillance interface.
* Remote Access from Foreign Country - Reports successful logins or access from an IP address known to be in a country that does not have remote access right. Before you enable this rule, we recommend that you configure the Active list: Countries with no Remote Access building block
* Remote Inbound Communication from a Foreign Country - Reports traffic from an IP address known to be in a country that does not have remote access right. Before you enable this rule, we recommend that you configure the Activelist: Countries with no Remote Access building block. SMTP and DNS have been removed from this test as you have little control over that activity. You may also have to remove WebServers in the DMZ that are often probed by remote hosts with web scanners
* Single IP with Multiple MAC Addresses - This rule will fire when a single IP's MAC address changes multiple times over a period of time.
* Systems using many different protocols - Local system connecting to the internet on more than 50 DST ports in one hour. Connections must be successful. This rule can be edited to also detect failed communications which may also be useful.
* VPN Sneak Attack - Check from where remote users are connecting, and what they are accessing. A VPN connection access can be misused to gain access to the intranet.
* Anomalous Ports, Services and Unpatched Hosts or Network Devices - Unusual traffic is identified as a potential intrusion; no signatures are involved in the process, so it is more likely to detect new attacks for which signatures are yet to be developed.

* Excessive Firewall Accepts from Multiple Sources to a Single Destination - Reports excessive Firewall Accepts to the same destination from at least 100 unique source IP addresses in 5 minutes.
* Excessive Firewall Denies from Single Source - Reports excessive firewall denies from a single host. Detects more than 400 firewall deny attempts from a single source to a single destination within 5 minutes.
* Long Duration Flow Involving a Remote Host - Reports a flow for communicating to or from the Internet with a sustained duration of more than 48 hours. This is not typical behaviour for most applications. We recommend that you investigate the host for potential malware infections.
* Long Duration ICMP Flows - Detection of ICMP packets between hosts that last a long time. This is rare and shouldn't ever occur.
* Outbound Connection to a Foreign Country - Reports successful logins or access from an IP address known to be in a country that does not have remote access right. Before you enable this rule, we recommend that you configure the active list: Countries with no Remote Access building block.
* Potential Honeypot Access - Reports an event that was targeting or sourced from a honeypot or tarpit defined address. Before enabling this rule, you must configure the Active list: Honeypot like addresses building block and create the appropriate sentry from the Network Surveillance interface.
* Remote Access from Foreign Country - Reports successful logins or access from an IP address known to be in a country that does not have remote access right. Before you enable this rule, we recommend that you configure the Active list: Countries with no Remote Access building block
* Remote Inbound Communication from a Foreign Country - Reports traffic from an IP address known to be in a country that does not have remote access right. Before you enable this rule, we recommend that you configure the Activelist: Countries with no Remote Access building block. SMTP and DNS have been removed from this test as you have little control over that activity. You may also have to remove WebServers in the DMZ that are often probed by remote hosts with web scanners
* Single IP with Multiple MAC Addresses - This rule will fire when a single IP's MAC address changes multiple times over a period of time.
* Systems using many different protocols - Local system connecting to the internet on more than 50 DST ports in one hour. Connections must be successful. This rule can be edited to also detect failed communications which may also be useful.
* VPN Sneak Attack - Check from where remote users are connecting, and what they are accessing. A VPN connection access can be misused to gain access to the intranet.
* Anomalous Ports, Services and Unpatched Hosts or Network Devices - Unusual traffic is identified as a potential intrusion; no signatures are involved in the process, so it is more likely to detect new attacks for which signatures are yet to be developed.

* Anomalous Ports, Services and Unpatched Hosts or Network Devices - Unusual traffic is identified as a potential intrusion; no signatures are involved in the process, so it is more likely to detect new attacks for which signatures are yet to be developed.
* Excessive database connections
* Firewall accepts excessive traffic on multiple hosts - More than 100 events are detected on at least 100 destination IPs in 5 minutes
* Firewall accepts excessive traffic from multiple sources to single destination - Firewall accepts traffic from 100 source IP to single destination in 5 mins.
* Firewall denies excessive traffic from single source - Firewall denies 400 attempts from a single source to a single destination within 5 minutes.
* Long Duration Flow Involving a Remote Host - Reports a flow for communicating to or from the Internet with a sustained duration of more than 48 hours. This is not typical behaviour for most applications. We recommend that you investigate the host for potential malware infections.
* Long Duration ICMP Flows - Detection of ICMP packets between hosts that last a long time. This is rare and should not ever occur.
* Mismatched port application traffic
* Network admin notices unusual deviation in network traffic flows
* Network Intrusion Detection Sensor alerts when buffer overflow attempt occurs against DB server.
* Outbound Connection to a Foreign Country - Reports successful logins or access from an IP address known to be in a country that does not have remote access right. Before you enable this rule, we recommend that you configure the active list: Countries with no Remote Access building block.
* Potential Honeypot Access - Reports an event that was targeting or sourced from a honeypot or tarpit defined address. Before enabling this rule, you must configure the Active list: Honeypot like addresses building block and create the appropriate sentry from the Network Surveillance interface.
* Redirected internet searches 
* Remote Access from Foreign Country - Reports successful logins or access from an IP address known to be in a country that does not have remote access right. Before you enable this rule, we recommend that you configure the Active list: Countries with no Remote Access building block
* Remote Inbound Communication from a Foreign Country - Reports traffic from an IP address known to be in a country that does not have remote access right. Before you enable this rule, we recommend that you configure the Active list: Countries with no Remote Access building block. SMTP and DNS have been removed from this test as you have little control over that activity. You may also have to remove Webservers in the DMZ that are often probed by remote hosts with web scanners
* Requests for unauthorised payments 
* Signs of DDoS activity
* Single IP with Multiple MAC Addresses - This rule will fire when a single IP's MAC address changes multiple times over a period.
* Systems using many different protocols - Local system connecting to the internet on more than 50 DST ports in one hour. Connections must be successful. This rule can be edited to also detect failed communications which may also be useful.
* DNS activity:
* Tampered domain name servers DNS
* Unusual DNS request
* Network traffic:
* Unusual outbound network traffic
* VPN Sneak Attack - Check from where remote users are connecting, and what they are accessing. A VPN connection access can be misused to gain access to the intranet.
* Web traffic with unhuman behaviour

* Anomalous Ports, Services and Unpatched Hosts or Network Devices - Unusual traffic is identified as a potential intrusion; no signatures are involved in the process, so it is more likely to detect new attacks for which signatures are yet to be developed.
* Excessive Database Connections
* Excessive Firewall Accepts Across Multiple Hosts - Reports excessive Firewall Accepts across multiple hosts. More than 100 events were detected across at least 100 unique destination IP addresses in 5 minutes
* Excessive Firewall Accepts from Multiple Sources to a Single Destination - Reports excessive Firewall Accepts to the same destination from at least 100 unique source IP addresses in 5 minutes.
* Excessive Firewall Denies from Single Source - Reports excessive firewall denies from a single host. Detects more than 400 firewall deny attempts from a single source to a single destination within 5 minutes.
* Long Duration Flow Involving a Remote Host - Reports a flow for communicating to or from the Internet with a sustained duration of more than 48 hours. This is not typical behaviour for most applications. We recommend that you investigate the host for potential malware infections.
* Long Duration ICMP Flows - Detection of ICMP packets between hosts that last a long time. This is rare and shouldn't ever occur.
* Mismatched port application traffic
* Network admin notices unusual deviation in network traffic flows
* Network Intrusion Detection Sensor alerts when buffer overflow attempt occurs against DB server.
* Outbound Connection to a Foreign Country - Reports successful logins or access from an IP address known to be in a country that does not have remote access right. Before you enable this rule, we recommend that you configure the active list: Countries with no Remote Access building block.
* Potential Honeypot Access - Reports an event that was targeting or sourced from a honeypot or tarpit defined address. Before enabling this rule, you must configure the Active list: Honeypot like addresses building block and create the appropriate sentry from the Network Surveillance interface.
* Redirected internet searches 
* Remote Access from Foreign Country - Reports successful logins or access from an IP address known to be in a country that does not have remote access right. Before you enable this rule, we recommend that you configure the Active list: Countries with no Remote Access building block
* Remote Inbound Communication from a Foreign Country - Reports traffic from an IP address known to be in a country that does not have remote access right. Before you enable this rule, we recommend that you configure the Activelist: Countries with no Remote Access building block. SMTP and DNS have been removed from this test as you have little control over that activity. You may also have to remove Web Servers in the DMZ that are often probed by remote hosts with web scanners
* Requests for unauthorised payments 
* Signs of DDoS activity
* Single IP with Multiple MAC Addresses - This rule will fire when a single IP's MAC address changes multiple times over a period.
* Systems using many different protocols - Local system connecting to the internet on more than 50 DST ports in one hour. Connections must be successful. This rule can be edited to also detect failed communications which may also be useful.
* Tampered domain name servers DNS
* Unusual DNS request
* Unusual outbound network traffic
* VPN Sneak Attack - Check from where remote users are connecting, and what they are accessing. A VPN connection access can be misused to gain access to the intranet.
* Web traffic with unhuman behaviour

* Network Traffic Anomalies
* •	Unexpected Network Activity: 
* o	Unusual traffic patterns, ports, or services indicating potential intrusion.
* o	Abnormal Ports, Services and Unpatched Hosts or Network Devices.
* o	Unusual outbound network traffic
* •	Database Overload: 
* o	Excessive database connections suggesting abnormal activity.
* o	Excessive Database Connections
* •	Firewall Alert Spikes: 
* o	Abnormally high number of firewalls accepts or denies across multiple hosts or from a single source.
* o	Excessive Firewall Accepts Across Multiple Hosts
* o	Excessive Firewall Accepts from Multiple Sources to a Single Destination
* o	Excessive Firewall Denies from Single Source
* •	Prolonged Connections: 
* o	Unusually long-lived network connections to external hosts or within the network.
* o	Long Duration Flow Involving a Remote Host
* •	ICMP Abuse: 
* o	Excessive or irregular ICMP traffic, often indicative of network scanning or attacks.
* o	Long Duration ICMP Flows
* •	Protocol Mismatch: 
* o	Inconsistent application protocols used on specific ports.
* o	Mismatched port application traffic.
* o	Systems using many different protocols
* •	Traffic Deviation: 
* o	Significant changes in network traffic patterns or volumes.
* o	Network admin notices unusual deviation in network traffic flows
* •	Unusual Remote Connections from Foreign Country
* o	Outbound Connection to a Foreign Country
* o	Remote Inbound Communication from a Foreign Country
* •	Unusual Web traffic
* o	Web traffic with unhuman behaviour



* Intrusion Attempts
* •	Intrusion Detection Sensor Alerts: IDS detection of suspicious activities like buffer overflows against DB servers.
* •	Honeypot Interaction: Activity targeting or originating from honeypot systems.
* •	Unauthorized VPN Access: 
* o	VPN connections from unexpected locations or accessing restricted resources.
* o	VPN Sneak attack


* Exploitation
* •	Redirected internet searches: Malicious modification of search engine results.
* •	DNS Tampering: 
* o	Changes to DNS records indicating potential compromise.
* o	Unusual DNS request
* •	

* Other
* •	Fraudulent Activity: Requests for unauthorized payments or financial transactions.
* •	Distributed Denial of Service (DDoS): Signs of a DDoS attack, such as overwhelming network traffic.
* •	Network Device Anomalies: Multiple MAC addresses associated with a single IP address or unusual protocol usage.
* •	Requests for unauthorized payments

* Domain-based IOCs: 
* Malicious domains, typosquatting, DNS tunnelling

* File-based IOCs: 
* Malicious file hashes, file names, file paths

* User Behaviour Anomalies: 
* Unusual login attempts, privileged account misuse, data exfiltration

* Log Analysis: 
* Security log anomalies, authentication failures, system errors

* Note: These IOCs are examples and might require further refinement based on specific network environments and threat landscapes.

The key indicators of compromise that organizations should monitor are listed below: 
* Anomalies in Privileged User Account Activity 
* Bundles of Data in the Wrong Place 
* Geographical Irregularities, 
* HTML Response Sizes
* Increases in Database Read Volume,
* Large Numbers of Requests for the Same File 
* Log-In Red Flags, 
* Mismatched Port-Application Traffic 
* Mobile Device Profile Changes 
* Signs of DDoS Activity 
* Suspicious Registry or System File Changes 
* Unexpected Patching of Systems, 
* Unusual DNS Requests 
* Unusual Outbound Network Traffic, 
* Web Traffic with Unhuman Behaviour 



## Network IoC
* •	Anomalous network traffic: Unusual patterns, such as excessive connections, unexpected protocols, or traffic to/from unusual ports or hosts.
* •	DDoS activity: Distributed denial-of-service attacks targeting network resources.
* •	DNS anomalies: Tampered DNS servers or unusual requests.
* •	Excessive protocol usage: A system connecting to many different ports in a short period.
* •	Firewall alerts: Excessive traffic, denied attempts, or unusual patterns.
* •	Long-duration flows: Sustained connections to remote hosts or unusual ICMP traffic.
* •	Mismatched port-application traffic: Inconsistent pairings between ports and applications.
* •	Network intrusion detection system (NIDS) alerts: Buffer overflow attempts or other malicious activity.
* •	Redirected internet searches: Unusual routing or manipulation of search queries.
* •	Requests for unauthorized payments: Indications of financial fraud.
* •	Single IP with multiple MAC addresses: Potential spoofing or masking.
* •	Unauthorized access: Attempts from foreign countries or honeypots.
* •	Unusual network traffic: Outbound traffic to unexpected destinations or unusual patterns.
* •	VPN misuse: Unauthorized access or data exfiltration through VPN connections.
* •	Web traffic anomalies: Unusual patterns or behaviours that indicate malicious activity.



What are the several indicators of compromise (IOC) that organizations should monitor? 
The key indicators of compromise that organizations should monitor are listed below: 
* •	Anomalies in Privileged User Account Activity 
* •	Bundles of Data in the Wrong Place 
* •	Geographical Irregularities, 
* •	HTML Response Sizes, 
* •	Increases in Database Read Volume,
* •	Large Numbers of Requests for the Same File 
* •	Log-In Red Flags, 
* •	Mismatched Port-Application Traffic 
* •	Mobile Device Profile Changes 
* •	Signs of DDoS Activity 
* •	Suspicious Registry or System File Changes 
* •	Unexpected Patching of Systems, 
* •	Unusual DNS Requests 
* •	Unusual Outbound Network Traffic, 
* •	Web Traffic with Unhuman Behaviour 
Anomalous Ports, Services and Unpatched Hosts or Network Devices - Unusual traffic is identified as a potential intrusion; no signatures are involved in the process, so it is more likely to detect new attacks for which signatures are yet to be developed. 
Anomalous Ports, Services and Unpatched Hosts or Network Devices - Unusual traffic is identified as a potential intrusion; no signatures are involved in the process, so it is more likely to detect new attacks for which signatures are yet to be developed.
DNS activity: Tampered domain name servers DNS and Unusual DNS request
DNS malicious activity such as Tampered domain name servers DNS and Unusual DNS request
Excessive Database Connections
Excessive Firewall Accepts Across Multiple Hosts - Reports excessive Firewall Accepts across multiple hosts. More than 100 events were detected across at least 100 unique destination IP addresses in 5 minutes
Excessive Firewall Accepts from Multiple Sources to a Single Destination - Reports excessive Firewall Accepts to the same destination from at least 100 unique source IP addresses in 5 minutes.
Excessive Firewall Denies from Single Source - Detects more than 400 firewall deny attempts from a single source to a single destination within 5 minutes.
Excessive Firewall Denies from Single Source - Reports excessive firewall denies from a single host. Detects more than 400 firewall deny attempts from a single source to a single destination within 5 minutes.
Firewall accepts excessive traffic from multiple sources to single destination - Firewall accepts traffic from 100 source IP to single destination in 5 mins.
Firewall accepts excessive traffic on multiple hosts - More than 100 events are detected on at least 100 destination IPs in 5 minutes
Firewall denies excessive traffic from single source - Firewall denies 400 attempts from a single source to a single destination within 5 minutes.
IDP: IDPs use signatures to identify malicious activity, signatures must be kept up to date to detect newest attacks. IDPs often produce false positives, so analyst should manually validate IDPs alerts either by closely reviewing recorded supporting data or by getting related data from other sources. On a periodic basis run through these quick steps to look for anomalous behavior caused by a computer intrusion. Each of these commands runs locally on a system.
Long Duration Flow Involving a Remote Host - Reports a flow for communicating to or from the Internet with a sustained duration of more than 48 hours. This is not typical behaviour for most applications. We recommend that you investigate the host for potential malware infections.
Long Duration ICMP Flows - Detection of ICMP packets between hosts that last a long time. This is rare and should not ever occur.
Look for Network alerts and logs for Suspicious connection attempts on server, High increase of support calls, Suspicious network traffic, Suspicious connection attempts in firewalls. 
Mismatched port application traffic
Network admin notices unusual deviation in network traffic flows
Network Intrusion Detection Sensor alerts when buffer overflow attempt occurs against DB server.
Network Intrusion Detection Sensor alerts when buffer overflow attempt occurs against DB server. 
Network traffic: Unusual outbound network traffic
Outbound Connection to a Foreign Country - Reports successful logins or access from an IP address known to be in a country that does not have remote access right. Before you enable this rule, we recommend that you configure the active list: Countries with no Remote Access building block.
Port lists including commonly used ports and trojan horses’ ports
Potential Honeypot Access - Reports an event that was targeting or sourced from a honeypot or tarpit defined address. Before enabling this rule, you must configure the Active list: Honeypot like addresses building block and create the appropriate sentry from the Network Surveillance interface.
Redirected internet searches 
Redirected internet searches. 
Remote Access from Foreign Country - Reports successful logins or access from an IP address known to be in a country that does not have remote access right. Before you enable this rule, we recommend that you configure the Active list: Countries with no Remote Access building block
Remote Inbound Communication from a Foreign Country - Reports traffic from an IP address known to be in a country that does not have remote access right. Before you enable this rule, we recommend that you configure the Active list: Countries with no Remote Access building block. SMTP and DNS have been removed from this test as you have little control over that activity. You may also have to remove Webservers in the DMZ that are often probed by remote hosts with web scanners
Requests for unauthorised payments 
Signs of DDoS activity
Single IP with Multiple MAC Addresses - This rule will fire when a single IP's MAC address changes multiple times over a period.
Single IP with Multiple MAC Addresses - this rule will fire when single IP's MAC address changes multiple times over time.
Systems using many different protocols - Local system connecting to the internet on more than 50 DST ports in one hour. Connections must be successful. This rule can be edited to also detect failed communications which may also be useful.
Tampered domain name servers DNS
Unusual DNS request
Unusual outbound network traffic
Unusual traffic is identified as a potential intrusion; no signatures are involved in the process, so it is more likely to detect new attacks for which signatures are yet to be developed.
VPN Sneak Attack - Check from where remote users are connecting, and what they are accessing. A VPN connection access can be misused to gain access to the intranet.
Web traffic with unhuman behaviour


## Use cases:

* Detection of Server shutdown-reboot after office hours (abnormal vm shutdown)
Query: index=linux sourcetype=linux_secure | search "chmod" OR "chown"
Outcome: Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes






