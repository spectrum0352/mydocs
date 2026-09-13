Ingest threat intelligence with Sentinel, Defender

Microsoft Sentinel + Threat Intelligence Playbooks

Microsoft Sentinel + Threat Intelligence (TI) Playbook

Below is a real-world, step-by-step Guide used in enterprise SOCs. This goes beyond theory—includes actual configurations, logic, and deployment steps.
________________________________________
Microsoft Sentinel + Threat Intelligence Playbooks
(Enterprise SOC Implementation Guide – Step-by-Step)
________________________________________

1. Architecture Overview
Threat Feeds → TI Platform → Microsoft Sentinel → Analytics Rules → SOAR Playbooks → Response (Defender, Firewall, Email)
Key components:
• Microsoft Sentinel
• Microsoft Defender for Endpoint
• Microsoft Defender for Office 365
• Azure Logic Apps
________________________________________

2. Prerequisites
Licensing
• Microsoft Sentinel enabled (Log Analytics workspace)
• Defender (Endpoint / O365)
Permissions
• Sentinel Contributor
• Logic App Contributor
• Security Admin
________________________________________
3. Threat Intelligence Integration Setup
________________________________________
Step 1: Enable TI in Sentinel
1. Go to Sentinel → Threat Intelligence
2. Enable:
o Threat Intelligence blade
o Data connectors
________________________________________
Step 2: Configure TI Data Connectors
Option A: Built-in
• Threat Intelligence Platforms (TIP)
• TAXII connector
Option B: Custom API (Logic Apps)
Example Logic App flow:
HTTP → Parse JSON → Add to Sentinel TI
________________________________________
Step 3: Validate Data
Run KQL:
ThreatIntelligenceIndicator
| take 10
________________________________________
4. Analytics Rule Creation (IOC Matching)
________________________________________
Step 4: Create Analytics Rule
Example: Malicious IP Detection
let TI_IPs = ThreatIntelligenceIndicator
| where Active == true
| where isnotempty(NetworkIP)
| project NetworkIP;

SecurityEvent
| where EventID == 4624
| where IpAddress in (TI_IPs)
________________________________________
Configuration
• Rule Type: Scheduled
• Run Frequency: 5 minutes
• Lookup Data: Last 1 hour
________________________________________
5. Playbook 1: Malicious IP Auto-Block
________________________________________
Objective
Automatically block high-confidence malicious IPs.
________________________________________
Step 5: Create Playbook
1. Go to Sentinel → Automation → Playbooks
2. Create new using Azure Logic Apps
________________________________________
Step 6: Define Workflow
Trigger
• When incident is created
Steps
1. Get incident entities
2. Extract IP
3. Condition:
o Confidence Score > 80
4. Actions:
o Block IP in Defender
o Add to firewall block list
________________________________________
Logic App Flow
Trigger → Get Entities → Condition → Block IP → Notify SOC
________________________________________
Sample Logic (Pseudo)
IF TI_Confidence > 80:
   Block IP (Defender API)
   Update Incident Status = Resolved
ELSE:
   Assign to Analyst
________________________________________
6. Playbook 2: Phishing Email Response
________________________________________
Objective
Automate phishing investigation and remediation.
________________________________________
Step 7: Workflow
Trigger
• Incident from email alert
Steps
1. Extract:
o Sender email
o URL
2. Enrich via TI
3. Check reputation
4. If malicious:
o Quarantine email
o Block sender domain
o Search & purge similar emails
________________________________________
Integration
• Microsoft Defender for Office 365
________________________________________
7. Playbook 3: Malware Hash Containment
________________________________________
Objective
Contain endpoints infected with known malware.
________________________________________
Workflow
1. Extract file hash
2. Check TI reputation
3. If malicious:
o Isolate endpoint
o Trigger AV scan
o Kill process
________________________________________
Integration
• Microsoft Defender for Endpoint
________________________________________
8. Playbook 4: Threat Hunting Automation
________________________________________
Objective
Use TI to trigger proactive hunts
________________________________________
Steps
1. Extract TTP from TI
2. Map to MITRE
3. Run KQL queries
4. Create incidents if matches found
________________________________________
Example Query
DeviceProcessEvents
| where ProcessCommandLine contains "powershell"
| where InitiatingProcessAccountName != "SYSTEM"
________________________________________
9. Playbook 5: Vulnerability Exploitation Detection
________________________________________
Objective
Detect active exploitation of CVEs
________________________________________
Steps
1. Import CVE feed into TI
2. Map CVE → affected systems
3. Detect exploit behavior
4. Trigger alert
________________________________________
10. Automation Rules in Sentinel
________________________________________
Step 8: Configure Automation Rule
Example:
• When Incident Created
→ Run Playbook
→ Assign severity
→ Auto-close low-risk alerts
________________________________________
11. Incident Enrichment Workflow
________________________________________
Step 9: Enrichment Playbook
Steps:
1. Extract entity
2. Query TI
3. Add:
o Threat actor
o Campaign
o Risk score
________________________________________
12. Advanced Enhancements
________________________________________
1. Confidence-Based Automation
Score Action
90+ Auto-block
70–89 Analyst review
<70 Monitor
________________________________________
2. TTL Handling
• Expire IOCs automatically after X days
• Avoid stale intelligence
________________________________________
3. Deduplication Logic
• Prevent duplicate alerts
________________________________________
13. Monitoring & KPIs
• % alerts enriched
• Auto-response rate
• False positive reduction
• MTTD / MTTR improvement
________________________________________
14. Security Best Practices
• Validate TI before ingestion
• Avoid blind auto-blocking
• Use confidence scoring
• Implement RBAC
________________________________________
15. Common Pitfalls
• Overloading Sentinel with IOCs
• Poor playbook error handling
• No TTL → stale indicators
________________________________________
16. End-to-End Flow
TI Feed → Sentinel → Analytics Rule → Incident → Playbook → Response → Feedback
________________________________________
17. Real Enterprise Tip
Top SOCs implement:
• Layered automation
o L1: Enrichment
o L2: Semi-auto response
o L3: Full automation
________________________________________
If you want next-level (real architect level)
I can build:
• Actual Logic App JSON templates (deployable)
• Sentinel ARM templates (one-click deployment)
• Advanced KQL detection library (50+ queries)
• Purple team attack simulation mapped to playbooks
Just tell me:
👉 “Give deployable templates”


