

⚡ How to Use These in Sentinel
	• Go to Analytics → Create Rule
	• Paste KQL query
	• Set:
		○ Frequency: 5–15 minutes
		○ Threshold: Based on environment
		○ Severity: Medium–High
	• Map entities:
		○ User, Host, IP
	• Attach playbooks for automation

🎯 Pro Tips (Real SOC Usage)
	• Always tune thresholds (avoid alert fatigue)
	• Combine multiple signals → better detection (correlation)
	• Use MITRE ATT&CK mapping for each rule
	• Test with:
		○ Attack simulation
		○ Red team exercises

🚀 High-Impact Rules for Interviews
If you remember just a few, prioritize:
	• PowerShell encoded command
	• LSASS access
	• Brute force login
	• Impossible travel
	• Ransomware behaviour

If you want next level, I can give:
	• Mapped MITRE ATT&CK version of these rules
	• NRT (Near Real-Time) optimized queries
	• Detection engineering framework (very strong for architect interviews)


✅ Microsoft Sentinel Analytics Rules – Overview
Analytics Rules in Microsoft Sentinel are used to detect threats and generate alerts/incidents based on:
	• Logs (from endpoints, network, identity, cloud)
	• Built-in templates
	• Custom queries (KQL)

🧩 Core Components of Analytics Rules
1. Data Sources
	• Connected logs such as:
		○ Microsoft Defender for Endpoint
		○ Azure Activity Logs
		○ Microsoft Entra ID (Azure AD) Sign-in logs
		○ Firewall / Network logs

2. Analytics Rule Types
	• Scheduled Rules (Most common) → Run KQL queries at intervals
	• Near Real-Time (NRT) → Low-latency detection
	• Fusion Rules → Correlates multiple signals using ML
	• Microsoft Security Rules → Prebuilt from Defender products

3. KQL Query (Detection Logic)
	• Core of detection
	• Example:
DeviceProcessEvents
| where FileName == "powershell.exe"
| where ProcessCommandLine contains "EncodedCommand"

4. Alert & Incident Settings
	• Alert creation logic
	• Incident grouping (reduce alert fatigue)
	• Severity mapping (Low/Medium/High/Critical)

5. Entity Mapping
	• Maps entities like:
		○ User
		○ Host
		○ IP address
	• Helps in investigation graph

6. Automation
	• Playbooks (Logic Apps) for auto-response:
		○ Isolate machine
		○ Disable user
		○ Send alerts

⚙️ Step-by-Step Process to Configure Analytics Rules
Step 1: Connect Data Sources
	• Go to Sentinel → Data Connectors
	• Connect:
		○ MDE
		○ Entra ID
		○ Firewall logs

Step 2: Choose Rule Type
	• Go to Analytics → Create Rule
	• Select:
		○ Template (recommended) OR
		○ Custom scheduled query

Step 3: Define Detection Logic (KQL)
	• Write or customize query:
SigninLogs
| where ResultType != 0
| summarize FailedAttempts = count() by UserPrincipalName, bin(TimeGenerated, 5m)
| where FailedAttempts > 5

Step 4: Configure Rule Settings
	• Name, description
	• Severity (High for brute force, etc.)
	• MITRE ATT&CK mapping

Step 5: Set Query Scheduling
	• Run query every 5–15 minutes
	• Lookup period (e.g., last 1 hour)

Step 6: Configure Alert Logic
	• Trigger alert when:
		○ Results > threshold
	• Group alerts into incidents:
		○ By user / host

Step 7: Entity Mapping
	• Map:
		○ Account → UserPrincipalName
		○ Host → DeviceName
		○ IP → IPAddress

Step 8: Enable Automation
	• Attach playbooks:
		○ Auto-isolate endpoint
		○ Send Teams/Email alert

Step 9: Validate & Enable
	• Test rule using historical data
	• Enable rule
	• Monitor alerts in Incidents tab

🔍 Real-Life Practical Example
Use Case: Detect Suspicious PowerShell Execution
Data Source: MDE
KQL Query:
DeviceProcessEvents
| where FileName == "powershell.exe"
| where ProcessCommandLine contains "EncodedCommand"
Configuration:
	• Frequency: Every 5 mins
	• Severity: High
	• Entity mapping: Device + User
	• Automation:
		○ Trigger playbook → isolate device
Outcome:
	• Detects fileless attacks
	• Generates actionable alerts
	• Enables rapid response

⚡ Best Practices (Enterprise Level)
	• Start with built-in templates, then customize
	• Use NRT rules for critical detections
	• Avoid noisy alerts → fine-tune thresholds
	• Use incident grouping to reduce alert fatigue
	• Map to MITRE ATT&CK framework
	• Integrate with:
		○ SOAR (playbooks)
		○ Threat intelligence feeds

🚨 Common Mistakes to Avoid
	• Writing overly broad KQL → too many alerts
	• Not configuring entity mapping → poor investigation
	• No automation → slow response
	• Running queries too frequently → high cost

🎯 Key Takeaway
Configuring Sentinel analytics rules is about:
👉 Data + Detection Logic (KQL) + Context (Entities) + Response (Automation)
A well-designed rule should:
	• Detect real threats
	• Minimize noise
	• Enable fast response

If you want, I can also provide:
	• Top 20 real-world Sentinel detection rules (ready-to-use KQL)
	• Advanced hunting-to-analytics conversion examples
	• Cost-optimized analytics rule strategy (very useful in interviews)





