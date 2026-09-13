Yes, **most of these queries are still relevant in 2026** for organizations using **Microsoft Configuration Manager (formerly SCCM/MECM)** and forwarding **Configuration Manager Status Messages** into Microsoft Sentinel or Log Analytics.

However, there are several important considerations:

### Relevance Assessment

| Area                            | Status in 2026        | Notes                                                                                |
| ------------------------------- | --------------------- | ------------------------------------------------------------------------------------ |
| Software Update Groups          | ✅ Relevant            | Still widely used in MECM environments.                                              |
| Software Update Deployments     | ✅ Relevant            | Common administrative activity requiring monitoring.                                 |
| Package Creation                | ⚠️ Partially Relevant | Traditional Packages are declining; Applications and Task Sequences are more common. |
| Collections                     | ✅ Relevant            | High-value monitoring target.                                                        |
| Scripts (Run Scripts)           | ✅ Highly Relevant     | One of the most abused MECM features during attacks.                                 |
| Security Roles & Administrators | ✅ Critical            | Important for privilege escalation monitoring.                                       |
| Application Deployments         | ✅ Relevant            | Useful for change auditing and threat hunting.                                       |
| Task Sequences                  | ✅ Relevant            | Critical because they can deploy OS images or execute code at scale.                 |
| Remote Control Sessions         | ✅ Highly Relevant     | Valuable for insider threat and unauthorized admin activity detection.               |
| Client Settings Changes         | ✅ Relevant            | Can weaken security controls.                                                        |
| Site Configuration Changes      | ✅ Relevant            | Important for governance and auditing.                                               |

---

# Major Issues with the Original Queries

## 1. XML Parsing Method is Outdated

Most older SCCM audit queries use:

```kql
extractjson()
```

against:

```kql
parse_xml(EventData)
```

This still works, but is fragile because:

* XML structures can vary between MECM versions.
* Index-based extraction (`Data[1]`, `Data[2]`, etc.) can break after upgrades.
* Named XML fields are preferable whenever available.

---

## 2. Missing Type Conversions

Most extracted fields are returned as strings.

For example:

```kql
extend DeploymentStartTime =
extractjson("$['DataItem']['EventData']['Data'][5]", MyData)
```

should ideally be:

```kql
extend DeploymentStartTime =
todatetime(
extractjson("$['DataItem']['EventData']['Data'][5]", MyData)
)
```

---

## 3. Missing Integrity Checks

Many events can generate null values.

Add:

```kql
| where isnotempty(Administrator)
```

or

```kql
| where isnotempty(CollectionID)
```

to improve data quality.

---

## 4. Missing Threat-Hunting Context

The original queries are mostly audit-focused.

Modern Sentinel deployments should add:

* Rare administrator detection
* After-hours activity
* Mass deployments
* Large collection targeting
* New privileged role assignments
* Script execution against many devices

---

# Recommended Modernized Queries

---

## Software Update Group Deleted

**Event ID 30221**

```kql
Event
| where EventLog == "ConfigurationManager"
| where EventID == 30221
| extend EventXML = tostring(parse_xml(EventData))
| extend Administrator =
    tostring(extractjson("$['DataItem']['EventData']['Data'][1]", EventXML))
| extend SoftwareUpdateGroupID =
    tostring(extractjson("$['DataItem']['EventData']['Data'][2]", EventXML))
| where isnotempty(Administrator)
| project
    TimeGenerated,
    Administrator,
    SoftwareUpdateGroupID
```

### Security Value

Detect:

* Unauthorized update removals
* Ransomware preparation activity
* Patch-management tampering

---

## Software Update Deployment Created

**Event ID 30196**

```kql
Event
| where EventLog == "ConfigurationManager"
| where EventID == 30196
| extend EventXML = tostring(parse_xml(EventData))
| extend Administrator =
    tostring(extractjson("$['DataItem']['EventData']['Data'][1]", EventXML))
| extend SoftwareUpdateGroupID =
    tostring(extractjson("$['DataItem']['EventData']['Data'][2]", EventXML))
| extend SoftwareUpdateGroupName =
    tostring(extractjson("$['DataItem']['EventData']['Data'][3]", EventXML))
| extend DeploymentName =
    tostring(extractjson("$['DataItem']['EventData']['Data'][4]", EventXML))
| extend DeploymentStartTime =
    todatetime(extractjson("$['DataItem']['EventData']['Data'][5]", EventXML))
| extend DeploymentDeadline =
    todatetime(extractjson("$['DataItem']['EventData']['Data'][6]", EventXML))
| extend CollectionID =
    tostring(extractjson("$['DataItem']['EventData']['Data'][7]", EventXML))
| extend FeatureType =
    tostring(extractjson("$['DataItem']['EventData']['Data'][8]", EventXML))
| where FeatureType == "Software Update"
| project
    TimeGenerated,
    Administrator,
    SoftwareUpdateGroupID,
    SoftwareUpdateGroupName,
    DeploymentName,
    DeploymentStartTime,
    DeploymentDeadline,
    CollectionID
```

### Security Value

Detect:

* Emergency deployments
* Unauthorized patch deployments
* Large-scale update rollouts

---

## New Script Created

**Event ID 52500**

```kql
Event
| where EventLog == "ConfigurationManager"
| where EventID == 52500
| extend EventXML = tostring(parse_xml(EventData))
| extend Administrator =
    tostring(extractjson("$['DataItem']['EventData']['Data'][1]", EventXML))
| extend ScriptGUID =
    tostring(extractjson("$['DataItem']['EventData']['Data'][2]", EventXML))
| extend ScriptName =
    tostring(extractjson("$['DataItem']['EventData']['Data'][5]", EventXML))
| project
    TimeGenerated,
    Administrator,
    ScriptGUID,
    ScriptName
```

### Security Value

Extremely important.

Threat actors frequently abuse:

* Run Scripts
* CMPivot
* Client Notification

for lateral movement.

---

## Script Executed Against Collection

**Event ID 40805**

```kql
Event
| where EventLog == "ConfigurationManager"
| where EventID == 40805
| extend EventXML = tostring(parse_xml(EventData))
| extend Administrator =
    tostring(extractjson("$['DataItem']['EventData']['Data'][1]", EventXML))
| extend ScriptGUID =
    tostring(extractjson("$['DataItem']['EventData']['Data'][2]", EventXML))
| extend ScriptName =
    tostring(extractjson("$['DataItem']['EventData']['Data'][5]", EventXML))
| extend CollectionName =
    tostring(extractjson("$['DataItem']['EventData']['Data'][6]", EventXML))
| extend CollectionID =
    tostring(extractjson("$['DataItem']['EventData']['Data'][7]", EventXML))
| project
    TimeGenerated,
    Administrator,
    ScriptGUID,
    ScriptName,
    CollectionName,
    CollectionID
```

### Security Value

One of the highest-value MECM detections.

Monitor for:

* Execution against server collections
* Execution against domain controllers
* Execution outside maintenance windows

---

## New Administrator Added

**Event ID 31240**

```kql
Event
| where EventLog == "ConfigurationManager"
| where EventID == 31240
| extend EventXML = tostring(parse_xml(EventData))
| extend Administrator =
    tostring(extractjson("$['DataItem']['EventData']['Data'][1]", EventXML))
| extend UserOrGroup =
    tostring(extractjson("$['DataItem']['EventData']['Data'][2]", EventXML))
| extend Roles =
    tostring(extractjson("$['DataItem']['EventData']['Data'][3]", EventXML))
| extend Scopes =
    tostring(extractjson("$['DataItem']['EventData']['Data'][4]", EventXML))
| extend Collections =
    tostring(extractjson("$['DataItem']['EventData']['Data'][5]", EventXML))
| project
    TimeGenerated,
    Administrator,
    UserOrGroup,
    Roles,
    Scopes,
    Collections
```

### Security Value

Critical.

Equivalent to:

* New Global Administrator
* New Domain Admin
* New Tier-0 management access

---

# Queries That Are Most Valuable for Modern Threat Hunting

If you are building a Sentinel detection pack in 2026, prioritize:

### Critical Priority

* Event ID 31240 – New Administrator Added
* Event ID 31242 – Administrator Removed
* Event ID 52500 – Script Created
* Event ID 52506 – Script Modified
* Event ID 40805 – Script Executed Against Collection
* Event ID 40806 – Script Executed Against Devices

### High Priority

* Event ID 30076 – Remote Control Session Started
* Event ID 30226 – Application Deployment
* Event ID 30001 – Task Sequence Modified
* Event ID 30043 – Client Settings Modified

### Medium Priority

* Event ID 30015 – Collection Created
* Event ID 30016 – Collection Modified
* Event ID 30017 – Collection Deleted
* Event ID 30196 – Software Update Deployment
* Event ID 30221 – Software Update Group Deleted

### Lower Priority

* Event ID 30000 – Package Creation
* Event ID 30031 – Site Configuration Changes

This prioritization aligns better with current attacker tradecraft, where adversaries increasingly abuse MECM/SCCM administrative capabilities for lateral movement, persistence, mass software deployment, and privilege escalation.

# Event ID 30219 – Attempt to Access a File or Folder Protected by ACLs

### Overview

**Event ID 30219** indicates that Windows has detected an attempt to access a file or folder protected by **Access Control Lists (ACLs)**.

#### Event Behavior

* **Informational** – The access attempt was **successful**.
* **Warning** – The access attempt was **blocked or unsuccessful**.

### Common Triggers

This event may be generated when:

* A user attempts to open a file or folder without sufficient permissions.
* A user attempts to modify or delete a protected file or folder.
* A process attempts to access a restricted system location.
* Malware attempts to access sensitive files or directories.
* An application attempts to access resources protected by incorrectly configured ACLs.
* Files or folders have been moved or deleted, resulting in invalid ACL references.

---

## Security Significance

Event ID 30219 can indicate:

### Legitimate Activity

* Users attempting to access restricted resources.
* Applications accessing protected files as part of normal operations.

### Suspicious Activity

* Unauthorized access attempts.
* Privilege abuse.
* Malware attempting to read, modify, or delete protected files.
* Reconnaissance activities targeting sensitive directories.

---

## Investigation Guidance

When analyzing Event ID 30219:

### Review Event Details

Identify:

* Target file or folder.
* User account involved.
* Process initiating the request.
* Access type requested (Read, Write, Delete, Modify, etc.).
* Success or failure status.

### Validate ACL Configuration

* Verify permissions on the affected file or folder.
* Ensure only authorized users and processes have access.

### Correlate Related Events

Use SIEM correlation to identify:

* Multiple access attempts.
* Privilege escalation activity.
* Malware execution.
* Lateral movement patterns.

### Perform Endpoint Analysis

If malicious activity is suspected:

* Scan the endpoint for malware.
* Review recently executed processes.
* Investigate persistence mechanisms.

---

## KQL Queries

### 1. Retrieve Event ID 30219 Events

```kql
SecurityEvent
| where EventID == 30219
```

---

### 2. Configuration Manager Event Analysis

```kql
Event
| where EventID == 30219
| where EventLog == "ConfigurationManager"
| extend EventDataXml = tostring(parse_xml(EventData))
| extend Administrator =
    extractjson("$['DataItem']['EventData']['Data'][1]", EventDataXml)
| extend SoftwareUpdateGroupID =
    extractjson("$['DataItem']['EventData']['Data'][2]", EventDataXml)
| extend SoftwareUpdateGroupName =
    extractjson("$['DataItem']['EventData']['Data'][3]", EventDataXml)
| project
    TimeGenerated,
    Administrator,
    SoftwareUpdateGroupID,
    SoftwareUpdateGroupName
```

---

### 3. Identify Protected Files Accessed by a Specific User

```kql
SecurityEvent
| where EventID == 30219
| where AccountName == "UserAccount"
| project
    TimeGenerated,
    AccountName,
    FileName
```

---

### 4. Detect Access Attempts from Specific Remote IP Addresses

```kql
SecurityEvent
| where EventID == 30219
| where RemoteIP in ("RemoteIPAddress1", "RemoteIPAddress2")
| project
    TimeGenerated,
    RemoteIP,
    FileName
```

---

### 5. Detect Repeated Unauthorized Access Attempts

```kql
SecurityEvent
| where EventID == 30219
| summarize AccessAttempts = count()
    by AccountName, Computer
| where AccessAttempts > 10
| sort by AccessAttempts desc
```

---

### 6. Detect Access to Sensitive System Locations

```kql
SecurityEvent
| where EventID == 30219
| where FileName has_any (
    "System32",
    "SAM",
    "SECURITY",
    "NTDS.dit"
)
| project
    TimeGenerated,
    AccountName,
    FileName,
    Computer
```

---

## Event ID 30221 – Attempt to Exploit a Vulnerability in the Windows Graphics Component

### Overview

**Event ID 30221** indicates that Windows has detected an attempt to exploit a vulnerability within the **Windows Graphics Component**.

Successful exploitation could allow an attacker to:

* Execute arbitrary code.
* Escalate privileges.
* Install malware.
* Gain unauthorized system access.

This event should be treated as **high severity** and investigated immediately.

---

## Incident Response Actions

### 1. Apply Security Updates

* Install the latest Microsoft security patches.
* Verify operating systems are fully updated.

### 2. Scan for Malware

* Perform a full antivirus or EDR scan.
* Investigate active malicious processes.

### 3. Review Security Controls

* Validate endpoint protection policies.
* Review application control policies.

### 4. Enable Windows Defender Application Control (WDAC)

WDAC can reduce exploitation opportunities by restricting unauthorized code execution.

### 5. Monitor Through SIEM

Correlate Event ID 30221 with:

* Process creation events.
* Network connections.
* Privilege escalation activity.
* Malware detections.

### 6. User Security Awareness

Educate users on:

* Phishing attacks.
* Malicious attachments.
* Suspicious links.
* Password hygiene.
* Multi-factor authentication (MFA).

---

## Additional Preventive Measures

### Maintain Software Updates

Regularly patch:

* Operating systems.
* Browsers.
* Office applications.
* Third-party software.

### Deploy Network Security Controls

* Firewalls.
* Intrusion Detection Systems (IDS).
* Intrusion Prevention Systems (IPS).

### Enforce Strong Authentication

* Strong passwords.
* Multi-factor authentication (MFA).

### Reduce User Risk

Train users to:

* Avoid unknown attachments.
* Verify email senders.
* Report suspicious activity.

---

# KQL Queries

## 1. List Machines Reporting Windows Graphics Component Exploitation Attempts

```kql
SecurityEvent
| where EventID == 30221
| summarize by DeviceName
```

---

## 2. Detect Exploitation Attempts from a Specific IP Address

```kql
SecurityEvent
| where EventID == 30221
| where RemoteIP == "192.168.1.100"
| project
    TimeGenerated,
    DeviceName,
    RemoteIP
```

---

## 3. Identify Potentially Vulnerable Systems Based on GDI+ Version

```kql
DeviceProcessEvents
| where ProcessName =~ "gdiplus.dll"
| where ProcessVersion in (
    "10.0.17763.1503",
    "10.0.17763.165"
)
| project
    DeviceName,
    ProcessVersion
```

---

## Threat Hunting Recommendations

### Hunt for ACL Abuse (Event ID 30219)

Focus on:

* Repeated denied access attempts.
* Access to sensitive files and directories.
* Access attempts from unusual accounts.
* Access originating from remote systems.

### Hunt for Graphics Component Exploitation (Event ID 30221)

Focus on:

* Systems generating multiple 30221 events.
* Correlated malware detections.
* Suspicious child processes spawned shortly after exploitation attempts.
* Network connections established immediately following the event.
* Systems running known vulnerable versions of `gdiplus.dll`.

### Correlation Opportunities

Correlate Event IDs **30219** and **30221** with:

* Process creation events (4688).
* Logon events (4624, 4625).
* Privilege assignment events (4672).
* Defender or EDR alerts.
* Network connection telemetry.
* File modification activity.

These detections can help identify unauthorized access attempts, privilege abuse, malware activity, and exploitation of Windows Graphics Component vulnerabilities before they result in a successful compromise.
