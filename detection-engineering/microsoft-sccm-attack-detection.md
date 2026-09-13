# Microsoft Configuration Manager (SCCM/MECM) Threat Detection KQL Queries for Azure Monitor / Microsoft Sentinel

The following Kusto Query Language (KQL) queries can be used to monitor administrative activities performed within Microsoft Configuration Manager (ConfigMgr/SCCM). These events help detect unauthorized administrative changes, suspicious deployments, privilege escalation, and remote administration activities.

---

# 1. Security → New Security Role Created

**Purpose**

Detects when a new Configuration Manager security role is created.

```kql
// New Security Role Created

Event
| where EventLog == "ConfigurationManager"
| where EventID == 31200
| extend ParsedData = tostring(parse_xml(EventData))
| extend Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", ParsedData)
| extend SecurityRoleName = extractjson("$['DataItem']['EventData']['Data'][2]", ParsedData)
| project
    TimeGenerated,
    Administrator,
    SecurityRoleName,
    Computer
```

---

# 2. Applications → New Application Deployment

**Purpose**

Detects deployment of a new application to a collection.

```kql
// New Application Deployment

Event
| where EventLog == "ConfigurationManager"
| where EventID == 30226
| extend ParsedData = tostring(parse_xml(EventData))
| extend Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", ParsedData)
| extend Application = extractjson("$['DataItem']['EventData']['Data'][2]", ParsedData)
| extend Collection = extractjson("$['DataItem']['EventData']['Data'][3]", ParsedData)
| project
    TimeGenerated,
    Administrator,
    Application,
    Collection,
    Computer
```

---

# 3. Operating System Deployment → Task Sequence Modified

**Purpose**

Detects modifications to an Operating System Deployment (OSD) task sequence.

```kql
// Task Sequence Modified

Event
| where EventLog == "ConfigurationManager"
| where EventID == 30001
| extend ParsedData = tostring(parse_xml(EventData))
| extend Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", ParsedData)
| extend TaskSequenceID = extractjson("$['DataItem']['EventData']['Data'][2]", ParsedData)
| extend TaskSequenceName = extractjson("$['DataItem']['EventData']['Data'][3]", ParsedData)
| project
    TimeGenerated,
    Administrator,
    TaskSequenceID,
    TaskSequenceName,
    Computer
```

---

# 4. Remote Control → Session Started

**Purpose**

Detects when a Remote Control session is initiated.

```kql
// Remote Control Session Started

Event
| where EventLog == "ConfigurationManager"
| where EventID == 30076
| extend ParsedData = tostring(parse_xml(EventData))
| extend Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", ParsedData)
| extend SourceComputer = extractjson("$['DataItem']['EventData']['Data'][2]", ParsedData)
| extend TargetComputer = extractjson("$['DataItem']['EventData']['Data'][3]", ParsedData)
| extend ProcessID = extractjson("$['DataItem']['EventData']['Data'][4]", ParsedData)
| extend ThreadID = extractjson("$['DataItem']['EventData']['Data'][5]", ParsedData)
| project
    TimeGenerated,
    Administrator,
    SourceComputer,
    TargetComputer,
    ProcessID,
    ThreadID,
    Computer
```

---

# 5. Remote Control → Session Ended

**Purpose**

Detects when a Remote Control session ends.

```kql
// Remote Control Session Ended

Event
| where EventLog == "ConfigurationManager"
| where EventID == 30077
| extend ParsedData = tostring(parse_xml(EventData))
| extend Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", ParsedData)
| extend SourceComputer = extractjson("$['DataItem']['EventData']['Data'][2]", ParsedData)
| extend TargetComputer = extractjson("$['DataItem']['EventData']['Data'][3]", ParsedData)
| extend ProcessID = extractjson("$['DataItem']['EventData']['Data'][4]", ParsedData)
| extend ThreadID = extractjson("$['DataItem']['EventData']['Data'][5]", ParsedData)
| project
    TimeGenerated,
    Administrator,
    SourceComputer,
    TargetComputer,
    ProcessID,
    ThreadID,
    Computer
```

---

# 6. Site Configuration → Client Settings Modified

**Purpose**

Detects changes made to Configuration Manager Client Settings.

```kql
// Client Settings Modified

Event
| where EventLog == "ConfigurationManager"
| where EventID == 30043
| extend ParsedData = tostring(parse_xml(EventData))
| extend Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", ParsedData)
| extend ClientSettingName = extractjson("$['DataItem']['EventData']['Data'][2]", ParsedData)
| project
    TimeGenerated,
    Administrator,
    ClientSettingName,
    Computer
```

---

# 7. Site Configuration → Primary Site Settings Modified

**Purpose**

Detects changes to Primary Site configuration.

```kql
// Primary Site Settings Modified

Event
| where EventLog == "ConfigurationManager"
| where EventID == 30031
| extend ParsedData = tostring(parse_xml(EventData))
| extend Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", ParsedData)
| extend SiteName = extractjson("$['DataItem']['EventData']['Data'][2]", ParsedData)
| project
    TimeGenerated,
    Administrator,
    SiteName,
    Computer
```

---

# Security Monitoring Recommendations

These detections should be configured as Microsoft Sentinel analytics rules with the following settings:

| Detection | Severity | MITRE ATT&CK |
|-----------|----------|--------------|
| New Security Role Created | High | T1098 – Account Manipulation |
| Application Deployment | Medium | T1608 – Stage Capabilities |
| Task Sequence Modified | High | T1562 – Impair Defenses |
| Remote Control Session Started | High | T1021 – Remote Services |
| Remote Control Session Ended | Informational | Audit Trail |
| Client Settings Modified | High | T1562 – Modify Security Controls |
| Primary Site Settings Modified | High | T1484 – Domain or Trust Modification |

## Best Practices

- Enable Microsoft Sentinel analytics rules for each query.
- Generate incidents only for successful administrative actions.
- Create automation rules to notify the SOC team.
- Correlate Configuration Manager events with Microsoft Entra ID sign-in logs.
- Correlate administrator identities with Privileged Identity Management (PIM) activation events.
- Enrich alerts with device information from Microsoft Defender for Endpoint.
- Maintain a baseline of approved administrators and approved maintenance windows to reduce false positives.
- Configure alert suppression for planned maintenance activities while preserving audit logs.

## Configuration Manager (SCCM / MECM) Administrative Activity Monitoring

This document contains a collection of Microsoft Sentinel and Azure Monitor Kusto Query Language (KQL) queries for monitoring Microsoft Configuration Manager (SCCM/MECM) administrative activities. These queries can be used as the basis for Microsoft Sentinel Analytic Rules, Threat Hunting, SOC monitoring, and security investigations.

---

# 1. View Security Tables

Displays all Security-related tables available in the Log Analytics workspace.

```kusto
// Display all Security-related tables and record counts

union Security*
| summarize RecordCount = count() by Type
| order by RecordCount desc
```

---

# Software Update Groups

## 2. New Software Update Group Created

**Purpose**

Detects the creation of a new Software Update Group.

**Event ID**

30219

```kusto
Event
| where EventLog == "ConfigurationManager"
| where EventID == 30219
| extend XmlData = tostring(parse_xml(EventData))
| extend
    Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", XmlData),
    SoftwareUpdateGroupID = extractjson("$['DataItem']['EventData']['Data'][2]", XmlData),
    SoftwareUpdateGroupName = extractjson("$['DataItem']['EventData']['Data'][3]", XmlData)
| project
    TimeGenerated,
    Administrator,
    SoftwareUpdateGroupID,
    SoftwareUpdateGroupName
```

---

## 3. Software Update Group Deleted

**Purpose**

Detects the deletion of a Software Update Group.

**Event ID**

30221

```kusto
Event
| where EventLog == "ConfigurationManager"
| where EventID == 30221
| extend XmlData = tostring(parse_xml(EventData))
| extend
    Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", XmlData),
    SoftwareUpdateGroupID = extractjson("$['DataItem']['EventData']['Data'][2]", XmlData)
| project
    TimeGenerated,
    Administrator,
    SoftwareUpdateGroupID
```

---

## 4. Software Update Deployment Created

**Purpose**

Detects new software update deployments.

**Event ID**

30196

```kusto
Event
| where EventLog == "ConfigurationManager"
| where EventID == 30196
| extend XmlData = tostring(parse_xml(EventData))
| extend
    Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", XmlData),
    SoftwareUpdateGroupID = extractjson("$['DataItem']['EventData']['Data'][2]", XmlData),
    SoftwareUpdateGroupName = extractjson("$['DataItem']['EventData']['Data'][3]", XmlData),
    DeploymentName = extractjson("$['DataItem']['EventData']['Data'][4]", XmlData),
    DeploymentStartTime = extractjson("$['DataItem']['EventData']['Data'][5]", XmlData),
    DeploymentDeadline = extractjson("$['DataItem']['EventData']['Data'][6]", XmlData),
    CollectionID = extractjson("$['DataItem']['EventData']['Data'][7]", XmlData),
    FeatureType = extractjson("$['DataItem']['EventData']['Data'][8]", XmlData)
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

---

# Package Monitoring

## 5. New Package Created

**Purpose**

Detects creation of Configuration Manager packages.

**Event ID**

30000

**Package Types**

| Value | Description                        |
| ----: | ---------------------------------- |
|     0 | Package                            |
|     4 | Task Sequence                      |
|     5 | Software Update Deployment Package |

```kusto
Event
| where EventLog == "ConfigurationManager"
| where EventID == 30000
| extend XmlData = tostring(parse_xml(EventData))
| extend
    Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", XmlData),
    PackageID = extractjson("$['DataItem']['EventData']['Data'][2]", XmlData),
    ContentType = toint(extractjson("$['DataItem']['EventData']['Data'][3]", XmlData)),
    PackageName = extractjson("$['DataItem']['EventData']['Data'][4]", XmlData)
| extend PackageType =
    case(
        ContentType == 0, "Package",
        ContentType == 4, "Task Sequence",
        ContentType == 5, "Software Update Deployment Package",
        "Unknown"
    )
| project
    TimeGenerated,
    Administrator,
    PackageID,
    PackageName,
    ContentType,
    PackageType
```

---

# Collection Monitoring

## 6. Collection Created

**Event ID**

30015

```kusto
Event
| where EventLog == "ConfigurationManager"
| where EventID == 30015
| extend XmlData = tostring(parse_xml(EventData))
| extend
    Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", XmlData),
    CollectionID = extractjson("$['DataItem']['EventData']['Data'][2]", XmlData),
    CollectionName = extractjson("$['DataItem']['EventData']['Data'][3]", XmlData)
| project
    TimeGenerated,
    Administrator,
    CollectionID,
    CollectionName
```

---

## 7. Collection Modified

**Event ID**

30016

```kusto
Event
| where EventLog == "ConfigurationManager"
| where EventID == 30016
| extend XmlData = tostring(parse_xml(EventData))
| extend
    Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", XmlData),
    CollectionID = extractjson("$['DataItem']['EventData']['Data'][2]", XmlData),
    CollectionName = extractjson("$['DataItem']['EventData']['Data'][3]", XmlData)
| project
    TimeGenerated,
    Administrator,
    CollectionID,
    CollectionName
```

---

## 8. Collection Deleted

**Event ID**

30017

```kusto
Event
| where EventLog == "ConfigurationManager"
| where EventID == 30017
| extend XmlData = tostring(parse_xml(EventData))
| extend
    Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", XmlData),
    CollectionID = extractjson("$['DataItem']['EventData']['Data'][2]", XmlData),
    CollectionName = extractjson("$['DataItem']['EventData']['Data'][3]", XmlData)
| project
    TimeGenerated,
    Administrator,
    CollectionID,
    CollectionName
```

---

# Script Monitoring

## 9. Script Created

**Event ID**

52500

```kusto
Event
| where EventLog == "ConfigurationManager"
| where EventID == 52500
| extend XmlData = tostring(parse_xml(EventData))
| extend
    Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", XmlData),
    ScriptGUID = extractjson("$['DataItem']['EventData']['Data'][2]", XmlData),
    ScriptContent = extractjson("$['DataItem']['EventData']['Data'][4]", XmlData),
    ScriptName = extractjson("$['DataItem']['EventData']['Data'][5]", XmlData)
| project
    TimeGenerated,
    Administrator,
    ScriptGUID,
    ScriptName,
    ScriptContent
```

---

## 10. Script Approved

**Event ID**

52501

```kusto
Event
| where EventLog == "ConfigurationManager"
| where EventID == 52501
| extend XmlData = tostring(parse_xml(EventData))
| extend
    Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", XmlData),
    ScriptGUID = extractjson("$['DataItem']['EventData']['Data'][2]", XmlData),
    ScriptContent = extractjson("$['DataItem']['EventData']['Data'][4]", XmlData),
    ScriptName = extractjson("$['DataItem']['EventData']['Data'][5]", XmlData)
| project
    TimeGenerated,
    Administrator,
    ScriptGUID,
    ScriptName,
    ScriptContent
```

---

## 11. Script Executed Against Devices

**Event ID**

40806

```kusto
Event
| where EventLog == "ConfigurationManager"
| where EventID == 40806
| extend XmlData = tostring(parse_xml(EventData))
| extend
    Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", XmlData),
    ScriptGUID = extractjson("$['DataItem']['EventData']['Data'][2]", XmlData),
    ScriptContent = extractjson("$['DataItem']['EventData']['Data'][4]", XmlData),
    ScriptName = extractjson("$['DataItem']['EventData']['Data'][5]", XmlData),
    DeviceCount = toint(extractjson("$['DataItem']['EventData']['Data'][6]", XmlData))
| project
    TimeGenerated,
    Administrator,
    ScriptGUID,
    ScriptName,
    DeviceCount,
    ScriptContent
```

---

## 12. Script Executed Against Collection

**Event ID**

40805

```kusto
Event
| where EventLog == "ConfigurationManager"
| where EventID == 40805
| extend XmlData = tostring(parse_xml(EventData))
| extend
    Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", XmlData),
    ScriptGUID = extractjson("$['DataItem']['EventData']['Data'][2]", XmlData),
    ScriptContent = extractjson("$['DataItem']['EventData']['Data'][4]", XmlData),
    ScriptName = extractjson("$['DataItem']['EventData']['Data'][5]", XmlData),
    CollectionName = extractjson("$['DataItem']['EventData']['Data'][6]", XmlData),
    CollectionID = extractjson("$['DataItem']['EventData']['Data'][7]", XmlData)
| project
    TimeGenerated,
    Administrator,
    ScriptGUID,
    ScriptName,
    CollectionName,
    CollectionID,
    ScriptContent
```

---

## 13. Script Modified

**Event ID**

52506

```kusto
Event
| where EventLog == "ConfigurationManager"
| where EventID == 52506
| extend XmlData = tostring(parse_xml(EventData))
| extend
    Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", XmlData),
    ScriptGUID = extractjson("$['DataItem']['EventData']['Data'][2]", XmlData),
    ScriptContent = extractjson("$['DataItem']['EventData']['Data'][4]", XmlData),
    ScriptName = extractjson("$['DataItem']['EventData']['Data'][5]", XmlData)
| project
    TimeGenerated,
    Administrator,
    ScriptGUID,
    ScriptName,
    ScriptContent
```

---

# Administrative Security Monitoring

## 14. Administrator Added

**Purpose**

Detects newly assigned Configuration Manager administrators.

**Event ID**

31240

```kusto
Event
| where EventLog == "ConfigurationManager"
| where EventID == 31240
| extend XmlData = tostring(parse_xml(EventData))
| extend
    Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", XmlData),
    UserOrGroup = extractjson("$['DataItem']['EventData']['Data'][2]", XmlData),
    Roles = extractjson("$['DataItem']['EventData']['Data'][3]", XmlData),
    Scopes = extractjson("$['DataItem']['EventData']['Data'][4]", XmlData),
    Collections = extractjson("$['DataItem']['EventData']['Data'][5]", XmlData)
| project
    TimeGenerated,
    Administrator,
    UserOrGroup,
    Roles,
    Scopes,
    Collections
```

---

## 15. Administrator Removed

**Purpose**

Detects removal of Configuration Manager administrators.

**Event ID**

31242

```kusto
Event
| where EventLog == "ConfigurationManager"
| where EventID == 31242
| extend XmlData = tostring(parse_xml(EventData))
| extend
    Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", XmlData),
    UserOrGroup = extractjson("$['DataItem']['EventData']['Data'][2]", XmlData),
    Roles = extractjson("$['DataItem']['EventData']['Data'][3]", XmlData),
    Scopes = extractjson("$['DataItem']['EventData']['Data'][4]", XmlData),
    Collections = extractjson("$['DataItem']['EventData']['Data'][5]", XmlData)
| project
    TimeGenerated,
    Administrator,
    UserOrGroup,
    Roles,
    Scopes,
    Collections
```

---

# Microsoft Sentinel Best Practices

For production deployments, consider implementing the following enhancements:

* Create reusable KQL functions to eliminate repetitive XML parsing logic.
* Apply configurable lookback periods (for example, `TimeGenerated > ago(24h)`) for scheduled analytics.
* Use explicit data type conversions such as `tostring()`, `toint()`, and `todatetime()` to improve consistency.
* Map Microsoft Sentinel entities such as **Account**, **Host**, **IP Address**, and **Cloud Application** to enrich incidents.
* Associate each analytic rule with relevant **MITRE ATT&CK** techniques.
* Configure alert suppression, thresholds, and grouping to reduce false positives.
* Enable automation using Microsoft Sentinel Automation Rules and Logic Apps.
* Build workbooks for trend analysis, administrator activity monitoring, script execution, and software deployment auditing.
* Store these queries in a Git repository with version control and change management.
* Schedule periodic validation to ensure Event IDs and XML schemas remain compatible with Configuration Manager updates.

---

# MITRE ATT&CK Coverage

| Activity                      | Suggested MITRE ATT&CK Technique          |
| ----------------------------- | ----------------------------------------- |
| Administrator creation        | T1078 – Valid Accounts                    |
| Administrator removal         | T1078 – Valid Accounts                    |
| Script creation               | T1059 – Command and Scripting Interpreter |
| Script execution              | T1059 – Command and Scripting Interpreter |
| Software deployment           | T1105 – Ingress Tool Transfer             |
| Package creation              | T1587 – Develop Capabilities              |
| Collection modification       | T1484 – Domain or Policy Modification     |
| Software Update Group changes | T1562 – Impair Defenses                   |

---

## References

* Microsoft Sentinel
* Azure Monitor Logs
* Kusto Query Language (KQL)
* Microsoft Configuration Manager (MECM/SCCM)
* Microsoft Defender XDR
* MITRE ATT&CK Framework
