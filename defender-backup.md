# Analytics Rules

Sentinel analytics rules are crucial for threat detection and dentifying anomalous behaviour. They leverage KQL (Kusto Query Language) to analyze data from various sources, correlate events, and pinpoint anomalies.

Key capabilities include:

- **Threat Detection:** The core function is identifying potential security threats.
- **KQL Queries:** Custom KQL queries form the basis of these rules, defining the logic for detecting suspicious activity.
- **Data Correlation:** Rules analyze data from multiple sources to identify correlations and patterns indicative of attacks.
- **Anomaly Detection:** Some rules specifically focus on identifying anomalous behaviour that deviates from established baselines.
- **Alerting:** Rules can trigger alerts based on detected attack techniques, providing real-time notifications of potential incidents.
- **Incident Insights:** Well-designed rules provide valuable insights into attack origin, compromised resources, data loss, and the incident timeline.

**Types of Analytics Rules:**

- **Built-in:** These include Anomaly, Fusion, Machine Learning (ML), and Microsoft security rules.
- **Custom:** These are typically scheduled rules created by users to address specific threats or monitoring needs.

**Analytics Rule Filters:**

- **Severity:** Allows filtering by the severity of the detected threat (e.g., High, Medium, Low).
- **Rule Type:** Filters by the type of rule (e.g., Anomaly, Fusion, Scheduled).
- **Tactics:** Filters by MITRE ATT&CK tactics, categorizing the attack stage (e.g., Initial Access, Lateral Movement).
- **Data Sources:** Filters by the data sources the rule analyzes (e.g., SecurityEvent, AzureActivity).

**Key Actions related to Analytics Rules:**

- **Design and Configuration:** Creating and customizing rules to meet specific requirements.
- **Custom Rule Creation:** Developing KQL queries to detect specific threats.
- **Activation of Microsoft Rules:** Enabling pre-built Microsoft security analytics rules.
- **Connector Configuration:** Setting up scheduled queries provided by connectors.
- **Custom Scheduled Query Configuration:** Defining custom scheduled queries for unique monitoring needs.
- **Incident Creation Logic:** Defining how and when incidents are generated based on rule triggers.

## Analytics Rules Types

Microsoft Sentinel offers several types of analytics rules for threat detection:

- **Scheduled Rules (Custom):**
  - These are the most common type and are created using Kusto Query Language (KQL).
  - They run on a schedule, querying data over a defined lookback period, and trigger alerts based on defined thresholds.
  - These rules can be created from templates stored in GitHub.
  - The process involves defining the KQL query, setting the schedule, and optionally automating responses by associating the rule with a Sentinel Playbook.

- **Near-Real-Time (NRT) Rules:**

  - These rules are designed for rapid threat detection, running queries
    every minute to analyze the previous minute's events.

  - They are suitable for identifying fast-moving threats.

- **Anomaly Rules:**

  - These rules use statistical analysis to identify unusual patterns
    and deviations from established baselines.

  - They are effective for detecting zero-day exploits and insider
    threats.

- **Microsoft Security Rules (Built-in):**

  - These are pre-built rules based on Microsoft's threat intelligence,
    offering out-of-the-box protection against known threats from
    Microsoft Defender platforms.

- **Fusion Rules (Built-in):**

  - These rules correlate multiple anomalies and alerts to detect
    complex, multi-stage attacks.

  - They help identify attack chains by combining information from
    various sources.

  - Common use cases include detecting data exfiltration, data
    destruction, denial-of-service attacks, lateral movement, and
    ransomware.

  - They align with the Cyber Kill Chain framework.

- **Machine Learning (ML) Rules (Built-in):**

  - These rules use machine learning to perform behavioural analytics,
    such as detecting anomalous SSH or RDP activity.

**Key Differences**

| Rule Type | Trigger | Use Case |
|----|----|----|
| Scheduled | Regular intervals / Custom | General threat detection, compliance monitoring |
| Near-Real-Time | Every minute / Custom | Rapid detection of fast-moving threats |
| Anomaly | Statistical analysis / Custom | Identifying unusual patterns |
| Microsoft Security | Pre-built queries / Built-in | Out-of-the-box threat protection |
| Fusion | Multiple alerts and behaviors / Custom | Detecting complex attack chains |


What are the common and valuable security analytics features?

- **User and Entity Behavior Analytics (UEBA):** Uses machine learning
  to detect anomalies in user and entity behavior, identifying insider
  threats and advanced persistent threats (APTs).

- **Network Traffic Analysis (NTA):** Identifies suspicious network
  patterns, such as unusual traffic spikes or communication with known
  malicious IPs.

- **Threat Intelligence Analytics:** Correlates security events with
  known threat data, enhancing the detection of sophisticated attacks.

- **Risk Analytics:** Assesses the risk posed by various security
  threats, enabling prioritization of security efforts.

Custom analytics can be created for specific needs, such as monitoring applications or tracking security team performance. Key considerations when developing analytics include data sources, the intended purpose, and the target audience.

**SIEM Analytics: Practical Examples and Rule Creation in Sentinel**

The document provides examples of implementing these analytics within Microsoft Sentinel, focusing on rule creation:

- **Grouping Alerts into Incidents:** Sentinel analytics rules can group alerts into a single incident based on matching entities (e.g., user, IP address) or severity, consolidating related events for efficient investigation. This is done by selecting the "grouping alerts into a single incident if selected entities match" option in the analytics rule wizard.

- **Scheduled Rules with Alert Suppression:** Rules can be scheduled (e.g., hourly) and configured to stop running after a single alert is generated to prevent alert fatigue. This is achieved by configuring "Query scheduling" to run every hour and enabling "Stop running query after alert is generated" (Suppression).

- **Identifying Cyberattack Origins and Potential Data Loss:** Sentinel analytic rules can investigate attack sources and assess potential data breaches by correlating security events.

- **Detecting Anomalous RDP Activity:** Sentinel's built-in "anomalous RDP login detection rules" identify unusual RDP connections. Prerequisites include enabling the rule, selecting an event set (other than "None"), and collecting Windows Security Events with Event ID 4624 (successful logon).

- **Alerting on Storage Account Creation:** An analytic rule can alert the IT coordinator when a user creates a storage account: 

```
AzureActivity \| where OperationName == "Create Storage account" \|
where ActivityStatus == "Succeeded"
```

- **Viewing Deleted Operations in Sentinel Workspace:**
```
AzureActivity \| where OperationNameValue contains "SecurityInsights" \|
where OperationName contains "Delete" \| where ActivityStatusValue
contains "Succeeded"
```

- **Tracking New Role Creation:** The original document incorrectly
  suggested using the SecurityIncident table. Role creation information
  is typically found in Azure Activity logs. Search for operations
  related to "Role" or "Assignment" within AzureActivity. Security
  Center can also provide insights into role assignments.

**Key Improvements and Corrections:**

- **Clarity and Structure:** Reorganized for better flow.

- **Kusto Queries:** Formatted for readability.

- **Accuracy:** Corrected the source for tracking role creation (Azure
  Activity logs or Security Center, not SecurityIncident).

- **Conciseness:** Removed redundant information.

This revised summary is more accurate and organized, emphasizing core
concepts, providing practical examples, and correcting inaccuracies. It
also clarifies how to achieve specific rule configurations within
Sentinel.

>
>
>
>
>

## Workbooks

Microsoft Sentinel Workbooks are a key feature for both **threat
detection** and **data visualization**. They analyze and interpret data
to identify threats, and they visualize data within the Sentinel
workspace using graphs, trends, charts, and dashboards built with KQL
(Kusto Query Language).

**Key Functions of Workbooks:**

- **Threat Detection:** Analyze and interpret data to identify potential
  security threats.

- **Data Visualization:** Present data in a user-friendly format using
  graphs, charts, trends, and summary dashboards.

**Workbook Features and Capabilities:**

- **KQL-Driven:** All dashboards are powered by KQL queries, enabling
  flexible data analysis.

- **Built-in Templates and Recommendations:** Microsoft provides
  pre-built workbooks and recommendations to get started quickly.

- **Customization:** Templates can be customized, and users can create
  their own workbooks.

- **Advanced Visualizations:** Support for creating sophisticated visual
  representations of data.

- **Data Analysis:** Facilitate the viewing and analysis of Sentinel
  data.

- **Incident Metric Tracking:** The Security Operations Efficiency
  workbook helps monitor and track incident metrics.

Data Normalization and ASIM (Advanced Security Information Model):

ASIM is crucial for consistent data handling. It acts as an intermediary
layer between users and data sources, normalizing data according to the
robustness principle: "Be strict in what you send and lenient in what
you accept." This ensures that data from various sources can be
interpreted consistently within workbooks, which is essential for
accurate threat detection and analysis.

Practical visualizations in SIEM Workbooks

- **Geolocation map of security events:** This visualization can be used
  to show the geographic location of security events, which can be
  helpful for identifying patterns and trends. For example, if you see a
  cluster of security events coming from a particular country, this may
  indicate a targeted attack.

- **Top 10 users generating security events:** This visualization can be
  used to identify the users who are generating the most security
  events. This information can be used to investigate potential security
  incidents or to target security awareness training to the users who
  need it most.

- **Top 10 source IP addresses for security events**: This visualization
  can be used to identify the source IP addresses that are generating
  the most security events. This information can be used to block
  malicious IP addresses or to investigate potential security incidents.

- **Heatmap of login activity by time of day:** This visualization can
  be used to identify unusual patterns in login activity. For example,
  if you see a spike in login activity at an unusual time of day, this
  may indicate a brute force attack.

- **Trend line of security events by type**: This visualization can be
  used to identify trends in the types of security events that are
  occurring. For example, if you see a sharp increase in the number of
  phishing attacks, this may indicate a new phishing campaign.

- **Network diagram showing the flow of traffic associated with a
  security event**: This visualization can be used to investigate
  security incidents by showing how the traffic associated with the
  incident flowed through your network. This information can be used to
  identify the source of the attack and to implement mitigation
  measures.

- **Timeline of security events associated with an incident:** This
  visualization can be used to investigate security incidents by showing
  the sequence of events that led to the incident. This information can
  be used to identify the root cause of the incident and to implement
  preventive measures.

These are just a few examples of real-life practical visualizations in
SIEM. There are many other types of visualizations that can be created,
depending on your specific needs and requirements.

## User Entity Behaviour

Identity behaviour of user entities like username, IP, device, through
data sources and ML analytics

- Use Cases – MITRE ATT&CK Framework, Tactics and Techniques.

- Data Sources

- Analytics – ML Algorithm

## Notebooks

Microsoft Sentinel notebooks enhance threat hunting by providing a
sandbox environment for complex investigations using machine learning,
visualizations, and data analysis. They allow for saving and sharing
investigations, which is helpful for complex hunts and retaining
queries/results.

**Key aspects of Sentinel Notebooks:**

- **Purpose:** Advanced threat hunting.

- **Libraries:**

  - KQLmagic: Simplifies KQL query API access.

  - msticpy: Microsoft Threat Intelligence Python Security tools for
    investigation and hunting.

**Key aspects of Sentinel Hunting:**

- **Testing Queries:** Use Livestream to continuously test queries
  against incoming data and trigger alerts on matches. Right-click a
  query in the Query tab and select "Add to Livestream."

- **Creating Queries:** Sentinel -\> Hunting -\> New Query -\> Fill name
  and Custom query fields -\> Create.

- **Bookmarking:** Use bookmarks to highlight key events (IoCs, root
  causes) within query results. Add tags and notes in the bookmark plane
  before saving. Select rows and click "Add bookmark."

- **Sentinel Roles:**

  - *Responder:* Manages incidents, views reports/workbooks, and updates
    threat intelligence indicator tags.

  - *Automation Contributor:* Adds playbooks to automation rules.

- **Querying Suspicious Activity:** Use the Hunting option and run all
  queries.

- **Workbook Elements:**

  - Time Range Label: {Timerange} or {Timerange:label}

  - Time Range KQL Query: {Timerange:query}

- **Workbook Drop-down Filters:** Add parameters -\> Select "resource
  picker" for parameter type -\> Save.

- **Cloning KQL Queries:** Sentinel -\> Threat management -\> Hunting
  -\> Select query -\> Click three dots -\> "Clone query" -\> Create.

- **Real-time Alerts (e.g., Storage Account Key Enumeration):** Use
  Hunting Livestream.

- **Querying Azure Defender Alerts:** SecurityAlert \| where ProductName
  == "Azure Security Center"



## Threat Hunting

Threat hunting means proactive identification of threats by analysing
the logs

KQL queries are used to analyse logs in Sentinel workspace.

Threat hunting means proactive identification of threats by analysing
the logs. KQL queries are used to analyse logs in Sentinel workspace.

create custom hunting queries

run hunting queries manually

monitor hunting queries by using Livestream

perform advanced hunting with notebooks

track query results with bookmarks

use hunting bookmarks for data investigations

convert a hunting query to an analytical

Threat Hunting stages

- Before incident

- During compromise/incident

- After compromise/incident



Threat Hunting before compromise

<span class="mark">What are the threat hunting techniques before
security incident takes place?</span>

Threat hunting is the proactive process of searching for and detecting
threats that may be lurking undetected in a network. It is a critical
part of any security program, as it can help organizations to identify
and respond to threats before they can cause damage.

There are a number of different threat hunting techniques that can be
used, but some of the most common include:

- Hypothesis-driven hunting: This type of hunting involves developing a
  hypothesis about a potential threat and then using data and tools to
  investigate the hypothesis. For example, a threat hunter might
  hypothesize that an attacker is using a specific malware strain to
  target the organization. The hunter would then use data and tools to
  search for evidence of this malware in the organization's network.

- Anomaly detection: This type of hunting involves using data and tools
  to identify anomalous activity in the network. For example, a threat
  hunter might use a SIEM solution to monitor for unusual spikes in
  traffic or login attempts.

- Indicators of compromise (IOCs): IOCs are specific artifacts or
  patterns of activity that can indicate the presence of a
  threat. Threat hunters can use IOCs to search for evidence of threats
  in the network. For example, a threat hunter might use a list of known
  malicious IP addresses to search for traffic to or from those
  addresses.

- Threat intelligence: Threat intelligence is information about known
  threats and vulnerabilities. Threat hunters can use threat
  intelligence to inform their hunting activities. For example, a threat
  hunter might use a threat intelligence feed to learn about new malware
  strains or attack techniques.

Threat hunting can be performed manually or using automated tools.
Manual threat hunting is often more effective at detecting sophisticated
threats, but it can be time-consuming and resource-intensive. Automated
threat hunting tools can help to scale threat hunting operations, but
they may not be as effective at detecting sophisticated threats.

Here are some specific examples of threat hunting techniques that can be
used to detect threats before a security incident takes place:

- Monitor for unusual login activity: Threat hunters can use SIEM
  solutions to monitor for unusual login activity, such as logins from
  unusual locations or times of day.

- Monitor for unusual network traffic: Threat hunters can use network
  monitoring tools to monitor for unusual network traffic, such as
  spikes in traffic or traffic to or from known malicious IP addresses.

- Monitor for suspicious file activity: Threat hunters can use file
  monitoring tools to monitor for suspicious file activity, such as
  changes to critical system files or the creation of new files with
  malicious signatures.

- Search for known IOCs: Threat hunters can use IOC feeds to search for
  known IOCs in the network.

- Analyze threat intelligence: Threat hunters can analyze threat
  intelligence to identify new threats and vulnerabilities that may be
  targeting the organization.

By using these and other threat hunting techniques, organizations can
detect threats before they can cause damage and improve their overall
security posture.

Threat hunting during compromise

Threat hunting after compromise



## Alerts Classification

- High: High probability that resource is compromised
- Medium: Probable suspicious activity that might indicate that a resource is compromised
- Low: This might be a benign positive or a blocked attack
- Informational: useful to understand the context of attack.

## Alert types

- The current alert reference list contains over 500 types of alerts.
- Each alert type has a description, severity, and MITRE ATT&CK tactic.

## MITRE ATT&CK tactics

- URL: <https://docs.microsoft.com/en-us/azure/defender-for-cloud/alerts-reference>

## Export MDC alerts:

Display all active MDC alerts

**KQL in Resource graph explorer:**

```
securityresources
\| where type =~ 'microsoft.security/locations/alerts'
\| where properties.Status in ('Active')
\| where properties.Severity in ('Low', 'Medium', 'High')
\| project alert_type = tostring(properties.AlertType), SystemAlertId =
tostring(properties.SystemAlertId), ResourceIdentifiers =
todynamic(properties.ResourceIdentifiers)
```

Azure CLI:

az graph query -q "securityresources \| where type =~
'microsoft.security/locations/alerts' \| where properties.Status in
('Active') \| where properties.Severity in ('Low', 'Medium', 'High') \|
project alert_type = tostring(properties AlertType), SystemAlertId =
tostring(properties.SystemAlertId), ResourceIdentifiers =
todynamic(properties ResourceIdentifiers)"



[How to isolate an Azure VM using Azure Security Center’s Workflow
automation - Microsoft Community
Hub](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/how-to-isolate-an-azure-vm-using-azure-security-center-s/ba-p/1250985)



<img src="media/image2.png" style="width:9.2425in;height:5.23375in" />


## Analysing and Isolating a Threat with Defender XDR

**Steps:**

1. **Detection:** Identify the endpoint exhibiting unusual activity.
2. **Investigation:** Analyze the suspicious activity using Defenders threat explorer, device timeline, and other investigative tools. Look for indicators of compromise (IOCs), processes, files, and network connections.
3. **Containment:** Isolate the affected endpoint to prevent lateral movement. This can be done through Defenders device isolation capabilities.
4. **Remediation:** Remove the threat. This might involve quarantining or deleting files, terminating processes, and cleaning up registry entries.
5. **Recovery:** Ensure the system is fully recovered and restore any affected files or data.
6. **Post-Incident Activity:** Analyze the incident to understand the attack vector and improve defenses.


# QnA
**How to test existing queries is matches are not happening when event occurs?**

On Query tab, write click on specific query and select add to livestream. Livestream used to test existing queries, continuous data and alerting when matches are found.

**How to create query quickly utilizing required field?**
Sentinel --\> Hunting--\> New Query--\>Fill name and Custom query
fields--\> Select Create

**After writing a query, how to find some results are marked and easy to reference alongside related data?**

- Add relevant tags and notes in bookmark plane before saving
- In query results, mark the checkboxes for any rows you want to preserve and select add bookmark
- Bookmarks are tool within threat hunting used to highlight key events.
- Key events to bookmark are IoC (Indicators of compromise) and root causes of incidents.

**How to query suspicious activities carried out by accounting department employees like uploading sensitive data on cloud?**
Select hunting option on Sentinel and run all queries option on hunting page.

**While editing workbook, if we wish to add static element to workbook that display label of current time range that is selected and add text control to workbook, which parameters to add?**

- {Timerange}: It is the basic time range picker parameter type that simply displays selected timerange label.
- {Timerange:label}: It is the basic time range picker parameter type that with label option appended to it.
- {Timerange: query}: It displays exact KQL text string that was used in parameters function.

**How to provide drop-down filter options in custom workbooks?**

Select add parameters
  --\> Click blue add parameters button from top banner
  --\>Select resource picker for  parameter type 
  --\>Click Save

**How to clone KQL query?**

Sentinel --\> Threat management--\>Hunting --\>Select query to clone--\>
Click 3 dots on query row--\>click on "Clone query"--\>on "Create Custom
Query" page click on "Create"

Configure Azure Sentinel solution which immediately alert you when
attack happens like storage account keys are enumerated without being
notified: Use Hunting Livestream

Write a query that identifies Azure Defender alerts?

SecurityAlert \| where ProductName == "Azure Security Center"



### Log Analysis: KQL

Ensure that access to sensitive data is logged. Retain logs for minimum
control requirements (often 1-7 years).

For PaaS services such as storage account or DB’s should have
diagnostics logs/activity log configured and threat detection and
prevention should be enabled. Use Rsyslog, Windows Event Log Forwarding,
third-party tool etc. for log shipping, and use a method to ship logs
securely for analysis, storage, and archiving.

### QnA For Data Connectors

- Use KQL queries to generate alerts and group them in to incidents, how
  to ensure incidents are created automatically? **Click "Create
  incidents -Recommended on Azure AD Identity protection" data
  connector**

- Implement solution that enables to view/stream creation of user
  account on any Windows cloud server linked with company's Sentinel
  workspace? **Windows security events connector**

- How to collect events from non-Azure Windows machine by installing log
  analytics agent? **Prerequisite: Azure Arc installed and enabled.
  Azure portal à Sentinel à Configuration management à Data Connector à
  Security Events via Legacy Agent à Open connector page à Instructions
  à Configuration à Install agent on non-azure windows machine à Select
  64 bit or 32-bit Windows agent**

- What are the prerequisites to ingest Azure AD Identity Protection data
  in to Sentinel and where to find this prerequisite? à**Azure portal à
  Sentinel à Configuration management à Data Connector à Azure AD
  Identity Protection à Instructions. The prerequisites are Workspace:
  read, write permissions, Tenant permissions: Global Administrator or
  security administrator on workspace tenant, License: Azure AD premium
  P2**

- How to connect Azure AD to Sentinel workspace to ingest sign-in logs
  and audit logs? **à Navigate to Azure Portal à Sentinel à
  Configuration à Data Connectors à Azure Active Directory à Open
  Connector page à Follow instructions to connect data source à Select
  both Azure AD sign-in logs and audit logs**

- How to integrate log data from Microsoft 365 and Non-Azure VMs?
  **Creating data connectors in Sentinel**

- What minimum role/permissions required to integrate Azure AD Identity
  protection logs to Sentinel ? **Security Administrator**

- How to collect the Microsoft 365 log data of Accounts department
  employee whose Microsoft 365 data is compromised? à **Use Sentinel
  Connectors.**



**How to group alerts in incident with respect to severity or entity in analytics rules?**

Select grouping alerts in to single incident if selected entities match



Improve Incident Response with Alerting on Azure

[<u>https://docs.microsoft.com/en-us/learn/modules/incident-response-with-alerting-on-azure/7-exercise-activity-log-alerts</u>](https://docs.microsoft.com/en-us/learn/modules/incident-response-with-alerting-on-azure/7-exercise-activity-log-alerts)

[<u>https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service/3-enable-and-configure-app-service-application-logging-using-the-azure-portal</u>](https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service/3-enable-and-configure-app-service-application-logging-using-the-azure-portal)

[<u>https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service/5-view-live-application-logging-activity-with-the-log-streaming-service-using-azure-cli</u>](https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service/5-view-live-application-logging-activity-with-the-log-streaming-service-using-azure-cli)

[<u>https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service/7-retrieve-application-log-files-from-an-application-using-azure-cli-and-kudu</u>](https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service/7-retrieve-application-log-files-from-an-application-using-azure-cli-and-kudu)

[<u>https://docs.microsoft.com/en-us/learn/modules/secure-aspnet-core-identity/4-customize-identity?pivots=sql</u>](https://docs.microsoft.com/en-us/learn/modules/secure-aspnet-core-identity/4-customize-identity?pivots=sql)

[<u>https://docs.microsoft.com/en-us/learn/modules/control-authentication-with-apim/3-exercise-create-subscriptions-in-apim</u>](https://docs.microsoft.com/en-us/learn/modules/control-authentication-with-apim/3-exercise-create-subscriptions-in-apim)
** **



## Investigation through MDCA

Identify the scope and impact of incident

- First step in IR is to identify scope and impact of incident.
- Identify which cloud services, users, devices, and data is affected.
- Identify how severe the damage is?
- CASB can help you with this by providing visibility and alerts on the cloud activity and anomalies.
- Use CASB to perform forensic analysis and collect evidence for further investigation.

- Using CASB to monitor cloud services usage detect anomalies identify
  security incidents such as unauthorized access, malware activity.

- Determine scope of incident by analysing impact.

- Conducting risk assessment to prioritize response effort.

- IR process involve correct classification of incident.

- Sending communications to stakeholders, escalating resolver teams

### Eradicate and restore the incident

- CASB can help you with backup and recovery options such as restoring
  files from previous versions or recovering data from other sources.

- Use CASB to audit and verify recovery processes and ensure no
  vulnerabilities or gaps remain.

### Learn and improve from incident

- CASB can help you by providing reports and dashboards that show
  incident timeline, impact, and response.

- Use CASB to implement and monitor action item and improve your
  security posture and readiness.

- CASB is valuable for managing security of cloud resources.

### Contain and isolate incident

- CASB can help you by enabling you to apply granular policies and
  controls on cloud services such as revoking permissions, quarantining
  files, encrypting data.

- CASB to coordinate with cloud service providers and other stakeholders
  to implement remediation measures.

- Use CASB automated response capabilities to contain threats quickly.
  These actions like blocking access to specific applications,
  quarantining suspicious files or forcing a logout of compromised
  accounts.

** **

## Malware infection

Investigating Malware infection with XDR

How to investigate malware infection incident in XDR and SIEM?

investigate a malware infection incident in XDR, you can follow these
steps:

1.  Identify the affected systems and users. Use your XDR solution to
    identify the systems and users that have been infected with
    malware. This may involve searching for known malware indicators of
    compromise (IOCs), such as file hashes, IP addresses, and URLs.

2.  Determine the scope of the infection. Use your XDR solution to
    determine the extent of the malware infection. This may involve
    investigating the network traffic associated with the infected
    systems, as well as the files that have been accessed or modified by
    the malware.

3.  Identify the root cause of the infection. Use your XDR solution to
    identify the root cause of the malware infection. This may involve
    investigating how the malware was initially introduced into your
    environment, as well as any vulnerabilities that may have been
    exploited.

4.  Remediate the infection. Once you have identified the infected
    systems and users, and determined the scope of the infection, you
    can begin to remediate the infection. This may involve removing the
    malware from infected systems, restoring data from backups, and
    patching vulnerabilities.

5.  Prevent future infections. Once you have remediated the
    infection, you need to take steps to prevent future infections. This
    may involve implementing additional security controls, such as email
    filtering, web filtering, and application control.

Here are some additional tips for investigating a malware infection
incident in XDR:

- Use all of the data sources available to you. XDR solutions collect
  data from a variety of sources, such as endpoints, networks, and
  security appliances. Use all of this data to get a complete picture of
  the infection.

- Correlate data from different sources. XDR solutions can correlate
  data from different sources to identify threats that would be
  difficult or impossible to detect using traditional security
  solutions. Use this capability to identify the root cause of the
  infection and to determine which systems and users have been affected.

- Use threat intelligence feeds. Threat intelligence feeds can provide
  information about known malware threats, such as IOCs and attack
  patterns. Use this information to help you identify and investigate
  malware infections.

- Automate tasks. XDR solutions can automate many of the tasks involved
  in investigating and responding to malware infections. This can save
  you time and help you to respond to incidents more quickly and
  effectively.

By following these steps and tips, you can use your XDR solution to
investigate and remediate malware infection incidents effectively.

**Investigating Malware infection with SIEM**

## Ransomware infection

Investigating Ransomware infection with XDR

How would you use XDR to detect and respond to a ransomware attack?

To use XDR to detect and respond to a ransomware attack, you can follow
these steps:

Detection

1.  Use XDR to correlate data from a variety of sources, such as
    endpoints, networks, and cloud environments. This will help you to
    identify suspicious activity that may be indicative of a ransomware
    attack.

2.  Look for the following signs of a ransomware attack:

    - Unusual network traffic patterns

    - Unusual file activity, such as a large number of files being
      encrypted or deleted

    - Unusual login attempts

    - Users reporting that their files are encrypted or that they are
      unable to access their systems

3.  Use XDR to investigate any suspicious activity and to determine
    whether it is a ransomware attack. If you determine that it is a
    ransomware attack, you can begin to respond to the attack.

Response

1.  Use XDR to isolate the affected systems from the rest of the
    network. This will help to prevent the ransomware from spreading to
    other systems.

2.  Identify the ransomware variant that is affecting your systems. This
    will help you to determine the best course of action for responding
    to the attack.

3.  If possible, restore the affected systems from backups.

4.  If you are unable to restore the affected systems from backups, you
    may need to pay the ransom to get the decryption key. However, it is
    important to note that paying the ransom does not guarantee that you
    will get your files back.

5.  After you have responded to the attack, take steps to improve your
    security posture and to prevent future ransomware attacks. This may
    involve implementing security awareness training for your
    employees, deploying security patches, and updating your security
    solutions.

Here are some additional tips for using XDR to detect and respond to a
ransomware attack:

- Use XDR to automate tasks such as data collection, threat
  detection, and incident response. This will help you to respond to the
  attack more quickly and effectively.

- Use XDR to collaborate with other security teams, such as your
  incident response team and your security operations center. This will
  help you to share information and to coordinate your response to the
  attack.

- Use XDR to monitor the attack after you have responded. This will help
  you to identify any new threats and to ensure that the attack has been
  fully remediated.

By following these tips, you can use XDR to detect and respond to a
ransomware attack more effectively and to protect your organization from
further damage.

Additional safety guidelines:

- Do not disclose any sensitive information about your organization's
  security posture or the ransomware attack.

- Do not encourage other people to pay the ransom.

- Do not provide any personal information about yourself or your
  organization.

- Do not share any links or attachments that could be malicious.

If you have any questions or concerns about how to use XDR to detect and
respond to a ransomware attack, please contact your security team or a
security expert.

# Threat Response

Microsoft Defender XDR's Threat Response feature provides a centralized
location to manage remediation actions across devices, email &
collaboration content, and identities. The "Actions and Submissions"
section tracks these actions, offering both a "Pending" queue and a
"History" log.

**Actions Tracked:** Defender XDR tracks a variety of actions,
including:

- Collect investigation package

- Isolate device (can be undone)

- Offboard machine

- Release code execution

- Release from quarantine

- Request sample

- Restrict code execution (can be undone)

- Run antivirus scan

- Stop and quarantine

- Contain devices from the network

- Initiate automated investigation

- Block URL (time-of-click)

- Soft delete email messages or clusters

- Quarantine email

- Quarantine<sup>1</sup> email attachment

- Turn off external mail forwarding

- Disable user

- Reset user password

- Confirm user as compromised

**Pending Actions:** This section displays actions requiring attention.
Users can approve or reject actions individually or in bulk (for similar
action types like "Quarantine file").

**Action History:** This serves as an audit log, recording all actions
taken and providing a way to undo them. It includes:

- Remediation actions from automated investigations

- Actions taken on suspicious/malicious emails, files, or URLs

- Actions approved by security operations teams

- Commands and remediation actions from Live Response sessions

- Actions taken by antivirus protection

**Required Roles:** Managing actions requires specific roles: Security
Administrator, Active remediation actions, and Search and Purge.

These actions can be triggered manually or automatically through
Automated Investigation and Response (AIR).

**Taking Remediation Actions:** To perform an action on a device:

1.  Navigate to the "Devices" page in the Defender XDR portal.

2.  Select the target device.

3.  Go to the "Remediation" tab.

4.  Choose the desired action.

5.  Click "Act."

For further assistance, users are advised to contact their Microsoft
security administrator.



## Automate Remediations through playbooks

[Automate Azure Security Center actions with Playbooks and ServiceNow -
Microsoft Community
Hub](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/automate-azure-security-center-actions-with-playbooks-and/ba-p/264843)

[Microsoft-Defender-for-Cloud/Remediation scripts at main ·
Azure/Microsoft-Defender-for-Cloud ·
GitHub](https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Remediation%20scripts)

## SOAR in Defender

**What are the different ways to use XDR to automate security tasks?**



- Automatic Sample Submission: MDE can automatically submit suspicious
  files for further analysis in the cloud, speeding up threat
  identification.

- Limited Built-in Remediation: MDE offers some built-in remediation
  options for specific threats, such as quarantining infected devices or
  blocking malicious URLs.



Integration with Microsoft Defender XDR: MDE integrates with XDR, which
offers more robust automation capabilities through:



- Automated Investigation and Response (AIR) Playbooks: While you can't
  directly configure AIR in MDE itself, XDR allows you to create
  playbooks that define automated actions triggered by security alerts
  from MDE or other security products. These actions can involve
  investigation, remediation, and notification.



**Alternative Approaches for Automation:**

- Microsoft Endpoint Management (MEM) Policies: MEM policies can be used
  to configure some automated actions on endpoints, such as blocking
  risky applications or enforcing device configuration settings. These
  policies can complement MDE's automation capabilities.

- Third-Party Endpoint Detection and Response (EDR) Solutions: Some EDR
  solutions offer more advanced automation features compared to MDE's
  built-in capabilities. These might be an option if your organization
  requires a higher degree of automation.



**Automated investigation and response workflow**

- When alert is triggered, then security playbook initiates.

- Depending alert respective playbook starts investigation immediately
  or security analyst can start security playbook manually.

- While automated investigation runs, its scope could increase depending
  on related alerts triggered.

- Result of automated investigation include recommendations that can be
  taken to respond any threats that were found.

- SOC team can review recommendations and approve/reject remediations .



## Use cases

Sure. Here are some real-life and practical use cases of the Automated
Investigation and Response (AIR) feature in Microsoft Defender XDR:

<span class="mark">**Use case 1:** Detecting and responding to phishing
attacks</span>

Phishing attacks are one of the most common types of cyberattacks. They
involve sending fraudulent emails or messages to users in an attempt to
trick them into revealing sensitive information, such as passwords or
credit card numbers.

Microsoft Defender XDR's AIR feature can be used to automate the
detection and response to phishing attacks. For example, AIR can be
configured to automatically investigate any emails that are reported as
phishing by users. AIR can then gather data about the email, such as the
sender address, subject line, and body content. AIR can also analyze the
email for any known phishing indicators of compromise (IOCs).

If AIR determines that the email is a phishing attack, it can take a
number of actions, such as quarantining the email, marking it as spam,
or notifying the user. AIR can also be configured to automatically block
the sender's email address.

<span class="mark">**Use case 2:** Investigating and responding to
malware infections</span>

Malware infections can have a significant impact on organizations,
causing damage to systems and data, and disrupting operations.

Microsoft Defender XDR's AIR feature can be used to automate the
investigation and response to malware infections. For example, AIR can
be configured to automatically investigate any devices that are flagged
as infected with malware. AIR can then gather data about the device,
such as the operating system, installed applications, and recent
activity. AIR can also analyze the device for any known malware hashes
or other IOCs.

If AIR determines that the device is infected with malware, it can take
a number of actions, such as removing the malware, isolating the device
from the network, or notifying the user. AIR can also be configured to
automatically deploy patches for any known vulnerabilities that were
exploited by the malware.

<span class="mark">**Use case 3:** Responding to ransomware
attacks</span>

Ransomware attacks involve encrypting an organization's data and
demanding a ransom payment in exchange for the decryption key.
Ransomware attacks can be very costly and disruptive for organizations.

Microsoft Defender XDR's AIR feature can be used to automate the
response to ransomware attacks. For example, AIR can be configured to
automatically isolate any devices that are infected with ransomware from
the network. This can help to prevent the ransomware from spreading to
other devices.

AIR can also be used to restore data from backups in the event that the
ransomware attack is successful. AIR can also be configured to
automatically notify law enforcement and other relevant authorities of
the ransomware attack.

<span class="mark">**Use case 4:** Conducting proactive security
investigations</span>

Microsoft Defender XDR's AIR feature can also be used to conduct
proactive security investigations. For example, AIR can be used to
investigate security incidents that have not yet triggered any alerts.
AIR can also be used to investigate specific threats, such as advanced
persistent threats (APTs).

By using AIR to conduct proactive security investigations, organizations
can identify and respond to threats before they cause any damage.

These are just a few examples of the many ways that Microsoft Defender
XDR's AIR feature can be used to improve security posture and protect
organizations from threats.

How automated response works in Defender?\
Automated investigation in Microsoft Defender XDR uses a combination of
machine learning, analytics, and threat intelligence to automate the
investigation of security alerts and incidents. This can help security
teams to save time and respond to incidents more quickly and
effectively.

When an alert or incident is triggered, Microsoft Defender XDR gathers
data from a variety of sources, including endpoints, networks, security
appliances, and Microsoft 365 services. This data is then analyzed using
machine learning and analytics to identify the root cause of the alert
or incident, the scope of the impact, and the potential remediation
steps.

Microsoft Defender XDR also uses threat intelligence to enrich its
investigation results. Threat intelligence provides information about
known malware threats, such as indicators of compromise (IOCs) and
attack patterns. This information can help Microsoft Defender XDR to
identify and investigate threats more effectively.

Once the investigation is complete, Microsoft Defender XDR provides a
report that summarizes the findings and recommends remediation steps.
The report also includes links to additional resources, such as
Microsoft security documentation and threat intelligence feeds.

Here are some of the benefits of using automated investigation in
Microsoft Defender XDR:

- **Reduced workload for security teams:** Automated investigation can
  help security teams to save time by automating many of the tasks
  involved in investigating security alerts and incidents. This allows
  security teams to focus on more complex tasks, such as strategic
  planning and incident response.

- **Improved response times:** Automated investigation can help security
  teams to respond to incidents more quickly by automating the initial
  stages of the investigation process. This can help to mitigate the
  damage caused by the incident and reduce the risk of further attacks.

- **Increased accuracy:** Automated investigation can help to improve
  the accuracy of incident investigations by using machine learning and
  analytics to identify patterns and trends that may be difficult or
  impossible for humans to identify.

- **Reduced costs:** Automated investigation can help to reduce the
  costs associated with incident response by reducing the workload for
  security teams and improving response times.

Overall, automated investigation in Microsoft Defender XDR is a powerful
tool that can help security teams to improve their security posture and
protect their organizations from threats.

## SOAR in MDC

SOAR stands for Security Orchestration and Automated Response.

SOAR system takes alerts from many sources, such as a SIEM system then
triggers action-driven automated workflows and processes to run security
tasks that mitigate the issue.

**<span class="mark">SOAR Components</span>**

Security Orchestration

Security Automation

Security Response

## Automated Response through Sentinel

[Create example Consumption logic app workflow in the Azure portal -
Azure Logic Apps \| Microsoft
Learn](https://learn.microsoft.com/en-us/azure/logic-apps/quickstart-create-example-consumption-workflow)

Tutorial: Use playbooks with automation rules in Microsoft Sentinel

[Use playbooks with automation rules in Microsoft Sentinel \| Microsoft
Learn](https://learn.microsoft.com/en-us/azure/sentinel/tutorial-respond-threats-playbook?tabs=LAC%2Cincidents)

Automation playbooks use logics apps for SOAR function in Sentinel



**Automation Playbooks**

- Copy exiting playbook: clone

- Changes to playbook: edit

- Run playbook manually on alert in incident: Incident page - Select
  incident - View full details - Alerts - view playbooks and select
  playbook.

<!-- -->

- If automation playbook is not running, while troubleshooting you
  notice that playbook has trigger kind of not initialized, what to do?
  **Add triggers or actions to play book**

-

- Create playbook that uses logic app to communicate with other systems
  and services via API calls to a known, commonly used products or
  services. Which connector we should configure? 🡪 **Managed connector:
  A set of actions and triggers that wrap around API calls to a
  particular product or service.**

- Your manager wants to send messages to Security channel whenever
  intended sign-in from suspicious IP address occurs. What solution
  needs to be used? 🡪 **Create Playbook and assign it to incident, do
  not use workbook, Do not use Microsoft Graph**



Configure rules and incidents to trigger playbooks

Create Sentinel playbooks

Use playbooks across Microsoft Defender solutions

Use playbooks to manage incidents

Use playbooks to remediate threats

Automation Rules: solution that runs playbooks as a response of incidents.

- **How to make copy of existing playbooks?** : Use logic app action "clone"

- **How to make changes to playbooks?** : Use logic app action "edit"

- **If automation playbook is not running, while troubleshooting you
  notice that playbook has trigger kind of not initialized, what to
  do?**: Add triggers or actions to play book

- **How to run playbook manually on alert in incident?**

  - Incident page--\>Select incident --\> View full details

  - In alerts tab --\> Click on alert on which you want to run playbook

  - Click view playbooks and select playbook to run from list of
    available playbooks on subscription

- **Create playbook that uses logic app to communicate with other
  systems and services via API calls to a known, commonly used products
  or services. Which connector we should configure?**

  - **Managed connector**: A set of actions and triggers that wrap
    around API calls to a particular product or service.

- **Your manager wants to send messages to Security channel whenever
  intended sign-in from suspicious IP address occurs. What solution
  needs to be used?**

  - Create Playbook and assign it to incident

  - Do not use workbook

  - Do not use Microsoft Graph

# Threat Mitigation

MICROSOFT DEFENDER XDR is a comprehensive, unified security suite from
Microsoft that provides end-to-end protection against cyber threats.
Here's what makes it stand out:

- **Unified Defense:** MICROSOFT DEFENDER XDR offers a single platform
  for pre-breach protection (preventing attacks) and post-breach
  response (dealing with successful attacks).

- **Cross-product Integration:** It seamlessly integrates various
  Microsoft security products like Defender for Endpoint, Defender for
  Identity, Defender for Cloud Apps, and others, enabling them to work
  together and share information.

- **Extended Visibility:** Gain a holistic view of your security
  landscape across endpoints (devices), identities (users), email, and
  cloud applications.

- **Enhanced Threat Detection:** By correlating signals from different
  security products, MICROSOFT DEFENDER XDR provides a complete picture
  of an attack, including its scope, impact, and entry point.

- **Simplified Investigation:** The Microsoft Defender portal offers a
  centralized view of security incidents and related information,
  streamlining investigation and response efforts.

**Mitigating Cyberattacks with MICROSOFT DEFENDER XDR**

MICROSOFT DEFENDER XDR empowers you to effectively respond to
cyberattacks. Here's a breakdown of the mitigation process:

1.  **Identify Affected Systems and Users:** Use MICROSOFT DEFENDER
    XDR's detection capabilities and threat intelligence to pinpoint
    compromised systems and user accounts. This often involves searching
    for Indicators of Compromise (IOCs) like malicious file hashes,
    suspicious IP addresses, or known bad URLs.

2.  **Determine the Scope of the Infection:** Investigate the extent of
    the attack. Analyze network traffic associated with affected
    systems, examine files accessed or modified by malware, and identify
    any lateral movement within your network.

3.  **Identify the Root Cause:** Uncover how the attack originated. This
    may involve tracing the initial infection vector (phishing email,
    vulnerable application, etc.) and identifying exploited
    vulnerabilities.

4.  **Remediate the Infection:** Take action to contain and eradicate
    the threat. This can include isolating infected systems, removing
    malware, restoring data from backups, and patching vulnerabilities.

5.  **Prevent Future Infections:** Strengthen your defenses to prevent
    similar attacks. Implement security measures like email filtering,
    web filtering, strong authentication, application control, and
    regular security awareness training.

**Key MICROSOFT DEFENDER XDR Features for Mitigation**

- **Security Score:** Provides a comprehensive assessment of your
  security posture, highlighting areas for improvement and allowing you
  to track your progress.

- **Threat Hunting Tools:** Enable proactive searching for suspicious
  activities and threats that may evade traditional security solutions.

- **Automated Investigation and Response (AIR):** Automates
  investigation and response actions for malicious or suspicious
  activities, speeding up mitigation.

- **Microsoft Security Experts:** Leverage Microsoft's expertise for
  tailored security guidance and support.

By effectively utilizing MICROSOFT DEFENDER XDR's capabilities and
following these mitigation steps, you can significantly strengthen your
organization's security posture and protect against evolving cyber
threats.

# Use Cases

XDR Use Cases:

- **Phishing Attack:** XDR can detect and respond to phishing by
  correlating email activity (sender reputation, link analysis),
  endpoint activity (malicious file execution, process behavior), and
  identity activity (suspicious logins). Automated response actions
  could include isolating affected endpoints, resetting compromised
  passwords, and blocking malicious senders.

- **Cloud Application Attack:** XDR monitors cloud application logs,
  user activity, and API calls to detect anomalies indicative of an
  attack. It can integrate with Cloud App Security to identify
  unauthorized access, data exfiltration, or malicious application
  usage. Responses can include revoking access tokens, blocking
  malicious IP addresses, and alerting security teams.

- **Supply Chain Attack:** XDR can help detect supply chain attacks by
  monitoring communication and data flow between organizations. By
  correlating endpoint activity at your organization with threat
  intelligence about known supply chain vulnerabilities, XDR can
  identify potentially compromised systems or software. Response
  involves isolating affected systems, investigating the source of the
  compromise, and collaborating with the supply chain partner.

- **Insider Threat:** XDR analyzes user behavior, file access patterns,
  and communication patterns to identify deviations from normal activity
  that could indicate an insider threat. It can detect unusual data
  access, exfiltration attempts, or communication with external parties.
  Responses can include escalating alerts to HR, restricting access to
  sensitive data, and conducting further investigation.

XDR Automation & Use Cases:

4.  **XDR Automation:** How can XDR be used to automate security tasks,
    improving efficiency and response times? Provide specific examples.

# Troubleshoot issues

How do you troubleshoot XDR issues?

To troubleshoot XDR issues, you can follow these steps:

- Gather information about the issues or errors or steps taken to
  resolve issue.

- Check the XDR logs.

- Search for known issues on the XDR vendor's website or support portal
  or community forums and other online resources.

- Contact the XDR vendor for assistance.

<!-- -->

- Check the XDR configuration. Make sure that the XDR solution is
  configured correctly. You can find information about how to configure
  the XDR solution in the vendor documentation.

- Restart the XDR services. Restarting the XDR services may resolve some
  issues.

- Update the XDR software. Make sure that you are using the latest
  version of the XDR software. The XDR vendor may release updates to fix
  known issues and improve the performance of the XDR solution.

- Collect XDR diagnostic data. The XDR vendor may ask you to collect XDR
  diagnostic data when you contact them for assistance. This data can
  help the vendor to troubleshoot the issue.

XDR agent is not reporting data to the XDR console.

- Troubleshooting steps:

  - Verify that the XDR agent is installed correctly.

  - Verify that the XDR agent is configured correctly.

  - Restart the XDR agent service.

  - Check the XDR agent logs for errors.

XDR console is not responding.

- Troubleshooting steps:

  - Restart the XDR console service.

  - Clear the XDR console cache and cookies.

  - Try accessing the XDR console from a different browser.

  - Contact the XDR vendor for assistance.

XDR alerts are not being generated.

- Troubleshooting steps:

  - Verify that XDR alerts are configured correctly.

  - Check the XDR logs for errors.

  - Contact the XDR vendor for assistance.

If you are experiencing other XDR issues, you can search for known
issues on the XDR vendor's website or support portal, or you can contact
the XDR vendor for assistance.

# MDI

Microsoft Defender for Identity (MDI) strengthens on-premises Active
Directory security by:

- **Detecting malicious activity:** MDI identifies suspicious behaviours
  like reconnaissance, lateral movement, and privilege escalation.

- **Providing security insights:** It offers visibility into user and
  entity behaviour, revealing potential vulnerabilities.

- **Recommending improvements:** MDI suggests actions to bolster
  security and reduce the attack surface.

MDI sensors can be directly installed on **Active Directory Federation
Services (ADFS) servers and Domain Controllers** to collect data about
Active Directory activity. MDI is specifically designed for protecting
on-premises Active Directory environments.

## Safe Attachments Policy

**Scenario:** Creating a Safe Attachments policy for tracking and admin review of malicious emails.

- `Enable redirect`
- `Enter admin's email address`: Specify the address for malicious email redirection.
- `Select "Block" or "Replace" (not "Monitor")`: 'Monitor' is for observation only. To ensure malicious attachments are handled, use "Block" to prevent delivery or "Replace" to remove the attachment and deliver the email body.
- Category: Safe Attachments, Email Security

**III. Data Loss Prevention (DLP) Roles**

  - **Compliance Data Administrator:** Manages DLP policies, settings,
    device management, and reporting.

  - **Communication Compliance Analyst:** Investigates policy matches
    and takes remediation actions.

  - **Communication Compliance Viewer:** Has read-only access to
    communication compliance data.

- **Category:** DLP, Role-Based Access Control (RBAC)

**IV. Insider Risk Management (IRM) Roles**

  - **Insider Risk Management (IRM):** Encompasses all permissions.

  - **IRM Admin:** Manages policies, settings, and analytics insights.

  - **IRM Analyst:** Views analytics insights, investigates
    alerts/cases, and manages notice templates.

  - **IRM Investigator:** Investigates alerts/cases, uses Content
    Explorer, and manages notice templates.

  - **IRM Auditor:** Views and exports audit logs.

- **Category:** IRM, RBAC

**V. IRM Escalation to Advanced eDiscovery**
 **Create a case in the IRM portal.** This is the
  necessary first step before escalating to Advanced eDiscovery.

- **Category:** IRM, eDiscovery Integration

**VI. Credential Theft Response**

- **Scenario:** Employee runs executable from email, credentials stolen.

- **Solution:** **Microsoft Defender for Office 365**. This is the
  correct solution to protect against email-borne threats, including
  those that lead to credential theft.

- **Category:** Threat Protection, Email Security

**VII. Risk IP Address Violation**

- **Scenario:** User accesses a risky IP address.
  - **Investigate:** Before taking action, investigate to understand the
    context. Is it a false positive? Was the access intentional (and
    perhaps authorized)?

  - **Communicate:** Contact the user to understand the situation.

  - **Take action based on investigation:** Options include:

    - **Block the IP address:** Prevent further access.

    - **Suspend the user account:** If the violation is severe.

    - **Revoke access to specific resources:** If the risk is limited to
      certain data.

    - **Educate the user:** If the violation was unintentional.

- **Category:** Threat Response, User Behavior

**VIII. Cloud App Discovery**

- **Scenario:** Detecting employees using new cloud apps with Cloud
  Discovery.

- **Prerequisites:**

  - **Enable integration of MCAS (Microsoft Cloud App Security, formerly
    MDCA) with Microsoft Defender for Endpoint (MDE).**

  - **Establish automatic log upload for Cloud Discovery reports.** This
    involves configuring log collection from firewalls and other network
    devices.

- **Category:** Cloud App Security, Cloud Discovery

**IX. Information Protection in MCAS**

- **Scenario:** Detecting employees sharing confidential files with
  external cloud services.
  1.  **Create a File policy.**

  2.  **Set the "Access level" filter to "Public" or "External."**

  3.  **Select a Data Classification method (e.g., "Data Classification
      Service," "Built-in DLP types").**

  4.  **Define Governance actions (e.g., "Apply sensitivity label,"
      "Block download," "Send alert").**

- **Category:** Cloud App Security, Information Protection

**X. Incident Tagging**

- **Scenario:** Manager wants incidents with sensitive information
  shared externally to be marked as "Red."

- **Corrected Actions:**

  1.  **Edit the incident:** Open the incident details.

  2.  **Add a tag:** Create a tag named "Red" (or similar) and apply it
      to the incident. This allows for easy filtering and
      identification.

- **Category:** Incident Management

**XI. Associating Alerts with Incidents**

- **Corrected Steps:**

  1.  **Open the incident:** Go to the incident details page.

  2.  **Link alerts:** There should be an option to link related alerts
      to the incident. This helps consolidate information and provides a
      comprehensive view of the attack. The specific steps might vary
      slightly depending on the MICROSOFT DEFENDER XDR interface
      version.

- **Category:** Incident Management

**XII. Advanced Hunting Query (Failed Sign-ins)**

- **Corrected Query:**

Code snippet

DeviceLogonEvents

\| where DeviceName in ("device1", "device2")

\| where ActionType == "LogonFailed" // Or similar, check schema for
exact value

\| summarize LogonFailureCount = count() by DeviceName

- **Category:** Advanced Hunting, KQL

**XIII. User Risk Remediation**

- **Scenario:** Risky sign-in blocked due to MFA failure (but valid
  credentials). User performed SSPR.

- **Corrected Resolution:** **Dismiss user risk.** Since the user
  performed SSPR and the sign-in attempt was legitimate (though MFA
  failed), dismissing the user risk is the appropriate action.

- **Category:** Identity Protection, Risk Remediation

**XIV. KQL Query (Last 2 Weeks, Top 50)**

- **Corrected Query:**

Code snippet

YourTable

\| where Timestamp \> ago(14d)

\| top 50 by Timestamp desc // Add "desc" for the latest 50

- **Category:** Advanced Hunting, KQL

**XV. Removing File from Quarantine**

- **Corrected Steps:**

  1.  **Go to the Action center.**

  2.  **Select the History tab.**

  3.  **Locate the quarantined file.**

  4.  **Select the file and choose the "Undo" or "Restore" option.**
      This will remove the file from quarantine on all affected devices.

- **Category:** AIR, Quarantine Management

**XVI. Alert Configuration for Accounts Department**

- **Scenario:** Accounts department members not receiving vulnerability
  alerts.

- **Troubleshooting:**

  1.  **Verify alert rules:** Ensure the alert rules are configured
      correctly and target the relevant devices or user groups.

  2.  **Check notification settings:** Confirm that email notifications
      are enabled for the alert rules.

  3.  **Check email delivery:** Ask users to check their junk/spam
      folders and ensure that security-related emails are whitelisted.

  4.  **Test email delivery:** Send a test email to the affected users
      to verify delivery.

- **Category:** Alerting, Email Notifications

**XVII. Temporary Device Group for Malware Collection**

- **Scenario:** Automating malware collection from machines with
  sensitive data.

- **Corrected Approach:** Instead of creating a temporary group, use
  **device tagging**. Tag the machines with sensitive data. Then, you
  can use the tag in your scripts or automated actions to target only
  those devices. This is more flexible and doesn't require creating and
  managing groups.

- **Category:** Device Management, Automation

**XVIII. Suppressing False Positive Alerts (Macros)**

- **Scenario:** False positive alerts on Excel with macros.

- **Corrected Approach:** Create a **suppression rule** in Microsoft
  Defender for Endpoint. Configure the rule to exclude alerts based on
  the specific criteria that trigger the false positives (e.g., file
  path, process name, specific detection ID). This is much better than
  suppressing all alerts for any device.

- **Category:** Alert Management, Suppression Rules

**XIX. Constraining Suspicious Script Behaviour**

- **Solution:** **Attack Surface Reduction (ASR)** rules. ASR rules can
  be configured to block or audit suspicious script behavior, helping to
  contain potential threats.

- **Category:** Attack Surface Reduction, Threat Protection

**XX. Detection Rule Creation Role**

- **Role:** **Security Administrator** (or a role with equivalent
  permissions).

- **Category:** Role-Based Access Control

**XXI. MDE Threat Analytics Dashboard Overview**

- **Key areas:**

  - **Active alerts:** Threats currently being investigated.

  - **Resolved alerts:** Threats that have been addressed.

# XDR

Comparing Defender XDR with Competitors
This requires a detailed feature-by-feature comparison. Key areas to consider:

- Detection Capabilities: EDR, network traffic analysis, user and entity behavior analytics (UEBA).
- Investigation and Response: Automation, threat hunting tools, integration with other security tools.
- Platform Integration: How well it integrates with other security products in your ecosystem.
- Deployment Options: Cloud, on-premises, or hybrid.
- Pricing and Licensing.
- Vendor Support.

Microsoft Security Ecosystem and Integration:

- Demonstrate knowledge of how Microsoft Defender for Endpoint, Defender
  for Office 365, Defender for Identity, Defender for Cloud Apps, and
  Azure Sentinel work together. Explain how they share threat
  intelligence and coordinate responses.

Sentinel Integration with Defender

- Sentinel acts as a SIEM and SOAR, ingesting Defender XDR alerts and
  logs. This provides a centralized view of security events, enables
  advanced threat analytics, and facilitates automated incident
  response.

Benefits

- Comprehensive Threat Protection: Integrates multiple security
  components to provide holistic protection across endpoints, email,
  identities, and cloud apps.

- Advanced Threat Detection: Uses AI and machine learning to identify
  sophisticated attacks.

- Automated Investigation and Response: Streamlines incident response
  and reduces the time to contain threats.

- Improved Visibility: Provides a unified view of security events and
  helps security teams understand the attack landscape.

Defender Experts for XDR

- A managed threat hunting and response service that complements
  Defender XDR. Experts proactively search for and respond to advanced
  threats, augmenting an organization's security team. Benefits include
  faster threat detection, improved incident response, and reduced
  burden on internal security resources.

Potential Limitations

- Complexity: Can be challenging to configure and manage effectively,
  especially for organizations with limited security expertise.

- Integration Challenges: While integration with the Microsoft ecosystem
  is strong, integrating with third-party tools can sometimes be
  complex.

- Cost: Can be expensive, especially for larger organizations.

- Dependence on Microsoft Ecosystem: Best performance is achieved when
  used within the broader Microsoft security ecosystem.

<!-- -->

- Training and Certification: Invest in training for security personnel
  to effectively manage Defender XDR.

- Managed Security Services: Consider engaging a managed security
  service provider (MSSP) to help with deployment, configuration, and
  ongoing management.

- Prioritization and Focus: Focus on the most critical threats and use
  cases to maximize the value of Defender XDR.

- Regular Evaluation: Periodically evaluate the effectiveness of
  Defender XDR and identify areas for improvement.

Let us summarize and refine these questions about Microsoft Defender XDR
(Extended Detection and Response):

**Core Functionalities of MICROSOFT DEFENDER XDR:** What are the key
capabilities of Microsoft Defender XDR, including its ability to detect,
investigate, and respond to threats across multiple domains (endpoints,
email, identities, cloud apps)?

**Microsoft Intelligence's Role:** How does Microsoft's threat
intelligence feed into Defender XDR, enhancing its ability to identify
sophisticated and emerging threats? Specifically, how does this
intelligence improve detection accuracy and reduce false positives?

**XDR and Threat Intelligence Sharing:** How can Defender XDR facilitate
or improve the sharing of threat intelligence with other security tools
and organizations, contributing to a broader defense ecosystem?

**XDR and Zero Trust:** How does Defender XDR support a Zero Trust
security model by providing visibility and control across various access
points and enforcing the principle of least privilege?

**Defender XDR vs. Traditional EDR:** What are the fundamental
differences between Defender XDR and traditional Endpoint Detection and
Response (EDR) solutions? Focus on the expanded scope of XDR beyond just
endpoints.

**Automated Response & Remediation:** How does Defender XDR automate
response and remediation actions to contain threats quickly and minimize
their impact? What are the different levels of automation available, and
how are they configured?

**Integration with M365 Security:** How does Defender XDR integrate with
other Microsoft 365 security products (e.g., Defender for Office 365,
Azure AD Identity Protection) to provide a holistic view of the security
landscape and correlate events across different domains?<sup>1</sup>

**Machine Learning & Behavioural Analysis:** How does Defender XDR use
machine learning and behavioural analysis to detect anomalies, identify
malicious activity, and proactively hunt for threats? What types of
behavioural analysis are employed?

Proactively Hunting

Proactive threat hunting in Defender XDR involves using advanced hunting
queries and other tools to search for suspicious activity that might not
have triggered alerts. This includes:

- **Leveraging Kusto Query Language (KQL):** Writing custom queries to
  search across endpoint, identity, email, and other data sources.

- **Using threat intelligence:** Incorporating known attacker techniques
  and indicators of compromise (IOCs) into hunting queries.

- **Exploring behavioural anomalies:** Identifying unusual patterns of
  activity that could indicate a threat.

- **Correlating data across domains:** Connecting events across
  different security domains (endpoints, identities, email) to uncover
  complex attacks.

Interview-Style Questions:

- **XDR Incident Resolution Example:** Be prepared to share a *specific*
  example of how you used XDR to investigate and resolve a security
  incident. Focus on the steps you took, the data you analyzed, and the
  outcome. Quantify your results if possible (e.g., "reduced dwell time
  by X%").

- **Future of XDR:** Discuss your thoughts on the evolution of XDR,
  including advancements in AI/ML, integration with other security
  tools, and the growing importance of threat intelligence. For Defender
  XDR specifically, mention potential improvements like enhanced
  automation, better cloud integration, or improved user experience.

- **Recent Microsoft Announcements:** Stay up-to-date with recent
  Microsoft security announcements and updates related to Defender XDR.
  Refer to the Microsoft Security blog, Ignite announcements, and other
  official resources.

This set of questions focuses on Extended Detection and Response (XDR)
security, particularly within the Microsoft ecosystem. Here's a
summarized and slightly reorganized version for clarity:

XDR Fundamentals & Microsoft:

1.  **XDR Onboarding:** What advice would you give to someone new to
    XDR, especially regarding initial setup, configuration, and getting
    value quickly?

2.  **Microsoft Defender XDR Data Sources:** What are the various data
    sources integrated into Microsoft Defender XDR (formerly Microsoft
    Threat Protection)? This is crucial for understanding its detection
    capabilities.

3.  **Microsoft Defender XDR Features:** What are the key features and
    capabilities of Microsoft Defender XDR? This explores what the
    platform offers.

Security Risks & Ethical Considerations:

**Microsoft Teams Security Risks:** What are the potential security
risks organizations face when using Microsoft Teams, and how can XDR
help mitigate them?

**XDR Ethical Considerations:** What are the ethical implications of
using XDR, particularly concerning data privacy, surveillance, and
potential misuse? This is an important, often overlooked, aspect.

Most Challenging XDR Implementation:

This is a subjective question that depends on the specific context.
Challenges might include:

- **Integration with Existing Security Infrastructure:** Integrating the
  XDR platform with diverse existing security tools and data sources can
  be complex.

- **Data Overload:** XDR platforms generate a large amount of data.
  Effectively analyzing and prioritizing this data can be challenging.

- **Talent Shortage:** Skilled security analysts are needed to
  effectively operate and manage XDR platforms.

- **Customization and Tuning:** Tuning the XDR platform to the specific
  environment and threat landscape can be complex.

- **Incident Response:** Developing and implementing effective incident
  response plans to leverage the XDR platform's capabilities.

- **Organizational Silos:** Breaking down organizational silos between
  different security teams is often necessary for effective XDR
  implementation.


# XDR Concepts

1. **Favourite XDR Feature:** This is subjective. Good answers might focus on automation, integrated threat intelligence, or cross-domain correlation.
2. **Role for Detection Rule Creation:** Security Administrator
3. **App Compliance Solution:** Microsoft Defender for Cloud Apps
4. **XDR Learning Resources:** This is open-ended. Good answers would include vendor documentation (Microsoft, CrowdStrike, Palo Alto Networks, etc.), SANS courses, industry blogs, and analyst reports (Gartner, Forrester).
5. **User Account Risk Monitoring:** Azure AD Identity Protection
6. **Automating Malware Investigation on Sensitive Data Machines:** The suggestion to "Create an admin role that gives users access to tagged machines" is *partially* correct but needs refinement. It's better to say: "Create a *role-based access control (RBAC)* role with *least privilege* that grants necessary permissions (e.g. isolate machine, collect files) *only* to the specific machines tagged as containing sensitive data. This role should be assigned *temporarily* to the analyst or automated system performing the investigation. Avoid granting broad admin rights." Creating a *temporary group* is also a good idea, but the focus should be on the *permissions* granted, not just the group membership.
7. **SaaS/IaaS Data and User Security Responsibility:** Shared Responsibility Model. The cloud provider secures the *infrastructure* (the "cloud" itself), while the customer is responsible for securing *data within the cloud*, *user access*, and *applications* they deploy.
8. **Challenges of Cloud Migration:** This is a broad question. Good answers might include: Complexity of migrating legacy systems, security concerns, compliance requirements, lack of skilled cloud personnel, cost management, application dependencies, and organizational change management.
9. **Explaining Defender XDR to Non-Technical Audience:** Focus on the benefits in simple terms: "Defender XDR is like a security guard for your computer systems. It helps find and stop cyberattacks before they can cause damage. It connects all the different security tools together so they can work as a team to protect you better." Use analogies and avoid jargon.


8. Microsoft Defender XDR

- **Automated Investigation Termination:**
  - Pending actions timed out (after one week).
  - Actions are too numerous.
- **Marking Incidents as "Red":** Add a tag to the incident (e.g. "Red Incident").
- **Associating Alerts with Incidents:** Select the alert and use the "Link to existing incident" or "Create new incident" option.
- **Manual Risk Detection Resolution (SSPR):** "Dismiss user risk" after the user completes SSPR.
- **Removing Quarantined File:** Action center -\> History tab -\> select the file -\> Undo. Apply to all instances.

# Scenario based QnA

1. One of the employee accidently runs executable from email, which steals employee credentials, what solution can be used to respond to these type of threats?
2. User in accounting department violates policy related to risk IP address by accessing it, task is assigned to you to resolve issue, you access MDCA portal's alert page. What remediation you will perform?
3. Employee sends email outside organization with sensitive information. Manager wants incident should be identified as Red Incident by Defender, what 2 action you will perform?
4. How to write advanced hunting query that counts failed sign-in authentications on 2 devices named device1 and device2?
5. While investigating incident, how to categories and associate alerts with incidents?
6. Incident involved risk user sign-in was blocked because of MFA not completed, but credentials was correct. You contacted user and sign-in was not user in question. User completed SSPR and updated the password. Now what manual risk detection resolution we should select?
7. In KQL query results, how to include only last 2 weeks and only 50 results, sorted by TimeRange column?
8. The automated investigation has quarantined a file believed to be malicious on 12 devices. We completed further research and found out that file is not malicious. How to remove this file from quarantine?
9. What permissions are roles required to configure data loss prevention policy (DLP)?
10. What permissions are roles required to configure insider risk management policy?
11. Alert has triggered and automated investigation has initiated, on analysing the progress its status shows that "Terminated by System" what 2 reasons causes this issue?
12. How to create Safe attachments policy that’s fulfils tracking requirement and send malicious email to admin for review?
13. What is mean by secure score? Secure Score helps *assess* and *improve* an organization's security posture, but it's not a direct solution for specific threats like credential theft.
