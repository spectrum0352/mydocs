# Configuration Manager & Threat Detection KQL Queries

This document contains a structured collection of Kusto Query Language (KQL) detection queries designed for Microsoft Configuration Manager (SCCM/MECM) audit logs and endpoint threat hunting.

---

## 1. Software Updates & Packages

### Software Update Group Removed

Detects when a Software Update Group is removed from Configuration Manager.

```kql
Event 
| where EventLog == "ConfigurationManager" and EventID == 30221 
| extend MyData = tostring(parse_xml(EventData)) 
| extend Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", MyData),
         SoftwareUpdateGroupID = extractjson("$['DataItem']['EventData']['Data'][2]", MyData)  
| project TimeGenerated, Administrator, SoftwareUpdateGroupID

```

### Software Update Deployment

Tracks software update deployments across the infrastructure.

```kql
Event 
| where EventLog == "ConfigurationManager" and EventID == 30196 
| extend MyData = tostring(parse_xml(EventData)) 
| extend Featuretype = extractjson("$['DataItem']['EventData']['Data'][8]", MyData)
| where Featuretype == "Software Update" 
| extend Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", MyData),
         SoftwareUpdateGroupID = extractjson("$['DataItem']['EventData']['Data'][2]", MyData),
         SoftwareUpdateGroupName = extractjson("$['DataItem']['EventData']['Data'][3]", MyData),
         DeploymentName = extractjson("$['DataItem']['EventData']['Data'][4]", MyData),
         DeploymentStartTime = extractjson("$['DataItem']['EventData']['Data'][5]", MyData),
         DeploymentDeadLine = extractjson("$['DataItem']['EventData']['Data'][6]", MyData),
         CollectionID = extractjson("$['DataItem']['EventData']['Data'][7]", MyData)
| project TimeGenerated, Administrator, SoftwareUpdateGroupID, SoftwareUpdateGroupName, DeploymentName, DeploymentStartTime, DeploymentDeadLine, CollectionID

```

### Package Creation

Audits the creation of classic software packages, update packages, and task sequences.

```kql
Event 
| where EventLog == "ConfigurationManager" and EventID == 30000 
| extend MyData = tostring(parse_xml(EventData)) 
| extend ContentType = extractjson("$['DataItem']['EventData']['Data'][3]", MyData)
| extend Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", MyData),
         PackageID = extractjson("$['DataItem']['EventData']['Data'][2]", MyData),
         ContentType = ContentType,
         ContentTypeConversion = case(
            ContentType == 0, "Package",
            ContentType == 4, "Task Sequence",
            ContentType == 5, "Software Update Deployment Package",
            "Unknown"
         ),
         Name = extractjson("$['DataItem']['EventData']['Data'][4]", MyData) 
| project TimeGenerated, Administrator, PackageID, ContentType, ContentTypeConversion, Name

```

---

## 2. Collection Management

### Collection Actions (Created, Modified, Removed)

Consolidated query monitoring all creation, edit, and deletion actions on collections.

```kql
Event 
| where EventLog == "ConfigurationManager" and EventID in (30015, 30016, 30017) 
| extend MyData = tostring(parse_xml(EventData)) 
| extend Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", MyData),
         CollectionID = extractjson("$['DataItem']['EventData']['Data'][2]", MyData),
         CollectionName = extractjson("$['DataItem']['EventData']['Data'][3]", MyData),
         Action = case(
            EventID == 30015, "Created",
            EventID == 30016, "Modified",
            EventID == 30017, "Removed",
            "Unknown"
         )
| project TimeGenerated, Action, Administrator, CollectionName, CollectionID

```

---

## 3. CMPivot & Script Management

### Script Modifications & Approval

Audits when CMPivot/PowerShell scripts are created, modified, or approved in SCCM.

```kql
Event 
| where EventLog == "ConfigurationManager" and EventID in (52500, 52501, 52506) 
| extend MyData = tostring(parse_xml(EventData)) 
| extend Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", MyData),
         ScriptGUID = extractjson("$['DataItem']['EventData']['Data'][2]", MyData),
         ScriptContent = extractjson("$['DataItem']['EventData']['Data'][4]", MyData),
         Name = extractjson("$['DataItem']['EventData']['Data'][5]", MyData),
         Action = case(
            EventID == 52500, "Created",
            EventID == 52501, "Approved",
            EventID == 52506, "Edited",
            "Unknown"
         )
| project TimeGenerated, Action, Administrator, Name, ScriptGUID, ScriptContent

```

### Script Execution Against Devices or Collections

Tracks execution of scripts against individual targets or entire device collections.

```kql
Event 
| where EventLog == "ConfigurationManager" and EventID in (40805, 40806) 
| extend MyData = tostring(parse_xml(EventData)) 
| extend Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", MyData),
         ScriptGUID = extractjson("$['DataItem']['EventData']['Data'][2]", MyData),
         ScriptContent = extractjson("$['DataItem']['EventData']['Data'][4]", MyData),
         Name = extractjson("$['DataItem']['EventData']['Data'][5]", MyData),
         TargetType = case(EventID == 40805, "Collection", EventID == 40806, "Device Batch", "Unknown"),
         TargetDetail = extractjson("$['DataItem']['EventData']['Data'][6]", MyData),
         CollectionID = extractjson("$['DataItem']['EventData']['Data'][7]", MyData)
| project TimeGenerated, TargetType, Administrator, Name, ScriptGUID, TargetDetail, CollectionID, ScriptContent

```

---

## 4. Security & Administration

### Administrative Role Changes (User/Group Added or Removed)

Tracks assignment and revocation of administrator permissions in Configuration Manager.

```kql
Event 
| where EventLog == "ConfigurationManager" and EventID in (31240, 31242) 
| extend MyData = tostring(parse_xml(EventData)) 
| extend Action = case(EventID == 31240, "Added", EventID == 31242, "Removed", "Unknown"),
         Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", MyData),
         UserOrGroup = extractjson("$['DataItem']['EventData']['Data'][2]", MyData),
         Roles = extractjson("$['DataItem']['EventData']['Data'][3]", MyData),
         Scopes = extractjson("$['DataItem']['EventData']['Data'][4]", MyData),
         Collections = extractjson("$['DataItem']['EventData']['Data'][5]", MyData) 
| project TimeGenerated, Action, Administrator, UserOrGroup, Roles, Scopes, Collections

```

### New Security Role Created

Detects creation of custom security roles.

```kql
Event 
| where EventLog == "ConfigurationManager" and EventID == 31200 
| extend MyData = tostring(parse_xml(EventData)) 
| extend Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", MyData),
         SecurityRoleName = extractjson("$['DataItem']['EventData']['Data'][2]", MyData) 
| project TimeGenerated, Administrator, SecurityRoleName

```

---

## 5. Applications, Task Sequences & Remote Control

### Application Deployment

Detects application deployment creation.

```kql
Event 
| where EventLog == "ConfigurationManager" and EventID == 30226 
| extend MyData = tostring(parse_xml(EventData)) 
| extend Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", MyData),
         Application = extractjson("$['DataItem']['EventData']['Data'][2]", MyData),
         Collection = extractjson("$['DataItem']['EventData']['Data'][3]", MyData)  
| project TimeGenerated, Administrator, Application, Collection

```

### Task Sequence Changes

Monitors modifications to OS Deployment Task Sequences.

```kql
Event 
| where EventLog == "ConfigurationManager" and EventID == 30001 
| extend MyData = tostring(parse_xml(EventData)) 
| extend Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", MyData),
         TaskSequenceID = extractjson("$['DataItem']['EventData']['Data'][2]", MyData),
         TaskSequence = extractjson("$['DataItem']['EventData']['Data'][3]", MyData)  
| project TimeGenerated, Administrator, TaskSequenceID, TaskSequence

```

### Remote Control Sessions (Start / End)

Tracks remote control activity across systems.

```kql
Event 
| where EventLog == "ConfigurationManager" and EventID in (30076, 30077) 
| extend MyData = tostring(parse_xml(EventData)) 
| extend Action = case(EventID == 30076, "Start Session", EventID == 30077, "End Session", "Unknown"),
         Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", MyData),
         SourceComputer = extractjson("$['DataItem']['EventData']['Data'][2]", MyData),
         TargetComputer = extractjson("$['DataItem']['EventData']['Data'][3]", MyData),
         ProcessID = extractjson("$['DataItem']['EventData']['Data'][4]", MyData),
         ThreadID = extractjson("$['DataItem']['EventData']['Data'][5]", MyData)  
| project TimeGenerated, Action, Administrator, SourceComputer, TargetComputer, ProcessID, ThreadID

```

---

## 6. Site Configuration Changes

### Client Settings & Hierarchy Modifications

Monitors modifications to global client settings or primary site infrastructure settings.

```kql
Event 
| where EventLog == "ConfigurationManager" and EventID in (30031, 30043) 
| extend MyData = tostring(parse_xml(EventData)) 
| extend Administrator = extractjson("$['DataItem']['EventData']['Data'][1]", MyData),
         ChangeType = case(
            EventID == 30043, "Client Setting Change",
            EventID == 30031, "Primary Site Setting Change",
            "Unknown"
         ),
         Details = extractjson("$['DataItem']['EventData']['Data'][2]", MyData) 
| project TimeGenerated, ChangeType, Administrator, Details

```

---

## 7. Endpoint Threat Hunting

### PowerShell Execution Involving Web Requests / Downloads

Hunts for PowerShell execution events across Defender for Endpoint tables that contain common download or payload delivery strings.

```kql
union DeviceProcessEvents, DeviceNetworkEvents
| where Timestamp > ago(7d) 
| where FileName in~ ("powershell.exe", "powershell_ise.exe") 
| where ProcessCommandLine has_any (
    "WebClient", 
    "DownloadFile", 
    "DownloadData", 
    "DownloadString", 
    "WebRequest", 
    "Shellcode", 
    "http", 
    "https"
) 
| project Timestamp, DeviceName, InitiatingProcessFileName, InitiatingProcessCommandLine, FileName, ProcessCommandLine, RemoteIP, RemoteUrl, RemotePort, RemoteIPType 
| top 100 by Timestamp desc

```
