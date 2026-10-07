# Azure Cloud Security Analyst Cheat Sheet

## Real-World Investigation Commands, KQL Queries & SOC Tasks

> **Purpose:** Practical reference for Azure Security Analysts, Cloud SOC Analysts, Threat Hunters, and Detection Engineers.
>
> **Primary platforms:** Microsoft Sentinel, Microsoft Defender XDR, Microsoft Defender for Endpoint, Microsoft Defender for Cloud, Microsoft Entra ID, Azure Activity Log, Azure Monitor, Log Analytics, Azure Firewall, Key Vault, Storage, Azure VMs and Azure Resource Graph.
>
> **Principle:** Start with the alert → identify the entity → establish timeline → investigate authentication → investigate process/resource activity → investigate network/data access → determine attack path → contain → document.

---

# 1. Analyst Investigation Workflow

| Step | Analyst Task                               | Primary Tool             |
| ---- | ------------------------------------------ | ------------------------ |
| 1    | Read alert and identify detection reason   | Sentinel / Defender XDR  |
| 2    | Identify affected user/device/IP/resource  | Sentinel                 |
| 3    | Determine first and last observed activity | KQL                      |
| 4    | Check Entra authentication                 | Entra Sign-in Logs       |
| 5    | Check identity changes                     | Entra Audit Logs         |
| 6    | Check Azure control-plane activity         | AzureActivity            |
| 7    | Check endpoint/process activity            | Defender for Endpoint    |
| 8    | Check network connections                  | Defender / Firewall      |
| 9    | Check RBAC changes                         | AzureActivity            |
| 10   | Check Key Vault/Storage access             | Resource logs            |
| 11   | Check persistence                          | Entra + endpoint + Azure |
| 12   | Determine lateral movement                 | Defender + Azure logs    |
| 13   | Determine data access/exfiltration         | Storage/SQL/Defender     |
| 14   | Contain affected identity/resource         | Entra/Defender/Azure     |
| 15   | Document findings and timeline             | Sentinel incident        |

---

# 2. Essential KQL Syntax

## Basic Query

```kusto
SigninLogs
| where TimeGenerated > ago(24h)
| project TimeGenerated, UserPrincipalName, IPAddress, ResultType, ResultDescription
```

## Filter

```kusto
SigninLogs
| where UserPrincipalName == "user@example.com"
```

## Multiple Conditions

```kusto
SigninLogs
| where UserPrincipalName == "user@example.com"
| where ResultType != 0
```

## Case-Insensitive Search

```kusto
SigninLogs
| where UserPrincipalName =~ "user@example.com"
```

## Contains

```kusto
SigninLogs
| where IPAddress contains "10."
```

## Starts With

```kusto
SigninLogs
| where UserPrincipalName startswith "admin"
```

## Regex

```kusto
DeviceProcessEvents
| where ProcessCommandLine matches regex @"(?i)(encodedcommand|invoke-expression|downloadstring)"
```

## Select Columns

```kusto
SigninLogs
| project TimeGenerated, UserPrincipalName, IPAddress, Location, ResultType
```

## Sort

```kusto
SigninLogs
| order by TimeGenerated desc
```

## Count

```kusto
SigninLogs
| summarize count()
```

## Count by User

```kusto
SigninLogs
| summarize Count=count() by UserPrincipalName
| order by Count desc
```

## Count by IP

```kusto
SigninLogs
| summarize Count=count() by IPAddress
| order by Count desc
```

## Distinct Values

```kusto
SigninLogs
| summarize make_set(IPAddress) by UserPrincipalName
```

## Timechart

```kusto
SigninLogs
| summarize Count=count() by bin(TimeGenerated, 1h)
| render timechart
```

---

# 3. Time Windows

| Requirement     | KQL                                       |
| --------------- | ----------------------------------------- |
| Last 15 minutes | `ago(15m)`                                |
| Last hour       | `ago(1h)`                                 |
| Last 24 hours   | `ago(24h)`                                |
| Last 7 days     | `ago(7d)`                                 |
| Last 30 days    | `ago(30d)`                                |
| Specific period | `between(datetime(...) .. datetime(...))` |

Example:

```kusto
SigninLogs
| where TimeGenerated between (datetime(2026-08-10 08:00:00) .. datetime(2026-08-10 10:00:00))
```

---

# 4. Microsoft Entra Sign-In Investigation

## User's Recent Sign-ins

```kusto
SigninLogs
| where UserPrincipalName =~ "user@example.com"
| where TimeGenerated > ago(24h)
| project
    TimeGenerated,
    UserPrincipalName,
    IPAddress,
    Location,
    AppDisplayName,
    ClientAppUsed,
    AuthenticationRequirement,
    ResultType,
    ResultDescription
| order by TimeGenerated desc
```

## Failed Sign-ins

```kusto
SigninLogs
| where TimeGenerated > ago(24h)
| where ResultType != 0
| summarize FailedAttempts=count()
    by UserPrincipalName, IPAddress
| order by FailedAttempts desc
```

## Successful Sign-ins

```kusto
SigninLogs
| where TimeGenerated > ago(24h)
| where ResultType == 0
| project TimeGenerated, UserPrincipalName, IPAddress, Location, AppDisplayName
| order by TimeGenerated desc
```

## Password Spray Detection

```kusto
SigninLogs
| where TimeGenerated > ago(1h)
| where ResultType != 0
| summarize
    FailedUsers=dcount(UserPrincipalName),
    Attempts=count()
    by IPAddress
| where FailedUsers >= 10
| order by FailedUsers desc
```

## One IP → Multiple Users

```kusto
SigninLogs
| where TimeGenerated > ago(24h)
| summarize
    Users=dcount(UserPrincipalName),
    UserList=make_set(UserPrincipalName, 20)
    by IPAddress
| where Users >= 10
```

## One User → Multiple Countries

```kusto
SigninLogs
| where TimeGenerated > ago(24h)
| summarize Countries=dcount(Location)
    by UserPrincipalName
| where Countries > 2
```

---

# 5. Risky Entra Sign-ins

```kusto
SigninLogs
| where TimeGenerated > ago(24h)
| where RiskLevelDuringSignIn in ("medium", "high")
| project
    TimeGenerated,
    UserPrincipalName,
    IPAddress,
    Location,
    RiskLevelDuringSignIn,
    RiskState,
    ResultType,
    AppDisplayName
| order by TimeGenerated desc
```

> Field availability can vary by the Entra/Sentinel connector configuration.

---

# 6. Unusual Country / Location

```kusto
SigninLogs
| where TimeGenerated > ago(7d)
| summarize
    Countries=make_set(LocationDetails.countryOrRegion),
    IPs=make_set(IPAddress)
    by UserPrincipalName
```

For investigation, compare the result with the user's historical baseline rather than automatically treating a new country as malicious.

---

# 7. MFA Investigation

```kusto
SigninLogs
| where TimeGenerated > ago(24h)
| project
    TimeGenerated,
    UserPrincipalName,
    IPAddress,
    AuthenticationRequirement,
    AuthenticationDetails,
    ConditionalAccessStatus,
    ResultType
| order by TimeGenerated desc
```

Investigate:

```text
Repeated MFA requests
        ↓
Successful authentication
        ↓
New device/location
        ↓
Privileged/resource activity
```

---

# 8. Entra Audit Logs

## Recent Identity Changes

```kusto
AuditLogs
| where TimeGenerated > ago(24h)
| project
    TimeGenerated,
    OperationName,
    InitiatedBy,
    TargetResources,
    Result
| order by TimeGenerated desc
```

## Role Changes

```kusto
AuditLogs
| where TimeGenerated > ago(24h)
| where OperationName contains "role"
| project TimeGenerated, OperationName, InitiatedBy, TargetResources
```

## Application Changes

```kusto
AuditLogs
| where TimeGenerated > ago(24h)
| where OperationName contains "application"
    or OperationName contains "service principal"
| project TimeGenerated, OperationName, InitiatedBy, TargetResources
```

## Credential Changes

```kusto
AuditLogs
| where TimeGenerated > ago(24h)
| where OperationName contains "credential"
    or OperationName contains "password"
    or OperationName contains "authentication"
| project TimeGenerated, OperationName, InitiatedBy, TargetResources
```

---

# 9. Detect New Service Principal Credentials

```kusto
AuditLogs
| where TimeGenerated > ago(24h)
| where OperationName has_any (
    "Add service principal credentials",
    "Update application",
    "Add application credentials"
)
| project
    TimeGenerated,
    OperationName,
    InitiatedBy,
    TargetResources
```

**Analyst question:**

> Was this credential addition expected, approved and performed by the application's legitimate owner?

---

# 10. OAuth / Application Consent

```kusto
AuditLogs
| where TimeGenerated > ago(7d)
| where OperationName contains "consent"
    or OperationName contains "permission"
| project
    TimeGenerated,
    OperationName,
    InitiatedBy,
    TargetResources
| order by TimeGenerated desc
```

Prioritize:

```text
New application
+
New OAuth consent
+
High-privilege API permissions
+
Unusual user
```

---

# 11. Azure Activity Log

## Recent Azure Administrative Activity

```kusto
AzureActivity
| where TimeGenerated > ago(24h)
| where ActivityStatusValue == "Success"
| project
    TimeGenerated,
    Caller,
    OperationNameValue,
    ResourceGroup,
    Resource,
    SubscriptionId,
    ActivityStatusValue
| order by TimeGenerated desc
```

---

# 12. RBAC Investigation

## Role Assignment Changes

```kusto
AzureActivity
| where TimeGenerated > ago(24h)
| where OperationNameValue contains "roleAssignments"
| project
    TimeGenerated,
    Caller,
    OperationNameValue,
    ResourceGroup,
    Resource,
    ActivityStatusValue,
    Properties
| order by TimeGenerated desc
```

## Privileged Role Assignment

```kusto
AzureActivity
| where TimeGenerated > ago(24h)
| where OperationNameValue =~ "Microsoft.Authorization/roleAssignments/write"
| project TimeGenerated, Caller, Resource, Properties
```

Prioritize assignments involving:

```text
Owner
Contributor
User Access Administrator
Role Based Access Control Administrator
Privileged Role Administrator
Global Administrator
```

---

# 13. Resource Deletion Investigation

```kusto
AzureActivity
| where TimeGenerated > ago(24h)
| where OperationNameValue contains "/delete"
| project
    TimeGenerated,
    Caller,
    OperationNameValue,
    ResourceGroup,
    Resource,
    SubscriptionId
| order by TimeGenerated desc
```

High-risk examples:

```text
Virtual machine deletion
Storage deletion
Key Vault deletion
Network security group deletion
Firewall policy deletion
Log Analytics workspace deletion
Diagnostic setting deletion
```

---

# 14. Public Exposure Investigation

## Public IP Creation

```kusto
AzureActivity
| where TimeGenerated > ago(24h)
| where OperationNameValue contains "publicIPAddresses"
| project TimeGenerated, Caller, OperationNameValue, Resource
```

## NSG Rule Changes

```kusto
AzureActivity
| where TimeGenerated > ago(24h)
| where OperationNameValue contains "networkSecurityGroups"
| where OperationNameValue contains "securityRules"
| project TimeGenerated, Caller, OperationNameValue, Resource, Properties
```

Look for:

```text
Source = Internet
Destination = Any
Action = Allow
```

especially for:

```text
22
3389
445
5985
5986
1433
3306
5432
```

---

# 15. Azure Firewall Investigation

```kusto
AzureDiagnostics
| where TimeGenerated > ago(24h)
| where Category contains "AzureFirewall"
| project TimeGenerated, msg_s, Resource
| order by TimeGenerated desc
```

For environments using resource-specific Azure Firewall tables, use the appropriate table exposed by the workspace.

Investigate:

```text
Unexpected allowed connection
Unexpected denied connection
New destination
New source
Rare external IP
Large outbound transfer
New DNAT traffic
```

---

# 16. Windows Endpoint – Process Investigation

For Defender for Endpoint:

```kusto
DeviceProcessEvents
| where TimeGenerated > ago(24h)
| project
    Timestamp,
    DeviceName,
    AccountName,
    FileName,
    ProcessCommandLine,
    InitiatingProcessFileName,
    InitiatingProcessCommandLine,
    SHA256
| order by Timestamp desc
```

---

# 17. PowerShell Investigation

```kusto
DeviceProcessEvents
| where TimeGenerated > ago(24h)
| where FileName in~ ("powershell.exe", "pwsh.exe")
| project
    Timestamp,
    DeviceName,
    AccountName,
    ProcessCommandLine,
    InitiatingProcessFileName,
    SHA256
| order by Timestamp desc
```

Prioritize command lines containing:

```text
-EncodedCommand
-ExecutionPolicy Bypass
-WindowStyle Hidden
-NonInteractive
-Command
Invoke-Expression
DownloadString
FromBase64String
Invoke-WebRequest
Start-BitsTransfer
```

---

# 18. Suspicious PowerShell Parent Processes

```kusto
DeviceProcessEvents
| where FileName in~ ("powershell.exe", "pwsh.exe")
| where InitiatingProcessFileName in~ (
    "winword.exe",
    "excel.exe",
    "outlook.exe",
    "powerpnt.exe",
    "wscript.exe",
    "cscript.exe",
    "mshta.exe"
)
| project
    Timestamp,
    DeviceName,
    AccountName,
    FileName,
    ProcessCommandLine,
    InitiatingProcessFileName
```

This is especially useful for detecting:

```text
Office document
      ↓
PowerShell
      ↓
Network connection
```

---

# 19. Windows LOLBins

Look for suspicious execution involving:

```text
powershell.exe
cmd.exe
wscript.exe
cscript.exe
mshta.exe
rundll32.exe
regsvr32.exe
certutil.exe
bitsadmin.exe
msiexec.exe
installutil.exe
reg.exe
schtasks.exe
sc.exe
wmic.exe
```

Example:

```kusto
DeviceProcessEvents
| where FileName in~ (
    "powershell.exe",
    "cmd.exe",
    "wscript.exe",
    "cscript.exe",
    "mshta.exe",
    "rundll32.exe",
    "regsvr32.exe",
    "certutil.exe",
    "bitsadmin.exe",
    "msiexec.exe",
    "schtasks.exe",
    "sc.exe",
    "wmic.exe"
)
| project Timestamp, DeviceName, AccountName, FileName, ProcessCommandLine, InitiatingProcessFileName
```

---

# 20. Scheduled Task Investigation

```kusto
DeviceProcessEvents
| where FileName =~ "schtasks.exe"
| where ProcessCommandLine contains "/create"
| project
    Timestamp,
    DeviceName,
    AccountName,
    ProcessCommandLine,
    InitiatingProcessFileName
```

Look for:

```text
schtasks /create
```

combined with:

```text
PowerShell
cmd
wscript
cscript
mshta
AppData
Temp
Downloads
unusual executable
```

---

# 21. Windows Service Creation

```kusto
DeviceProcessEvents
| where FileName =~ "sc.exe"
| where ProcessCommandLine contains "create"
| project
    Timestamp,
    DeviceName,
    AccountName,
    ProcessCommandLine,
    InitiatingProcessFileName
```

Investigate:

```text
sc.exe create
```

especially when initiated by:

```text
PowerShell
cmd
unknown executable
Office application
temporary directory
```

---

# 22. Local Administrator Group Changes

```kusto
DeviceProcessEvents
| where ProcessCommandLine contains "net localgroup"
| where ProcessCommandLine contains "administrators"
| project
    Timestamp,
    DeviceName,
    AccountName,
    ProcessCommandLine,
    InitiatingProcessFileName
```

---

# 23. Local User Creation

```kusto
DeviceProcessEvents
| where ProcessCommandLine has_any (
    "net user",
    "New-LocalUser"
)
| project
    Timestamp,
    DeviceName,
    AccountName,
    ProcessCommandLine,
    InitiatingProcessFileName
```

Correlate with Windows Security events:

```text
4720 – User account created
4732 – Member added to security-enabled local group
4728 – Member added to security-enabled global group
4672 – Special privileges assigned to new logon
```

---

# 24. Windows Security Event Investigation

| Event ID | Investigation Use               |
| -------: | ------------------------------- |
|     4624 | Successful logon                |
|     4625 | Failed logon                    |
|     4634 | Logoff                          |
|     4648 | Explicit credential use         |
|     4672 | Special privileges assigned     |
|     4688 | Process creation                |
|     4697 | Service installed               |
|     4698 | Scheduled task created          |
|     4699 | Scheduled task deleted          |
|     4700 | Scheduled task enabled          |
|     4701 | Scheduled task disabled         |
|     4719 | Audit policy changed            |
|     4720 | User account created            |
|     4722 | User account enabled            |
|     4724 | Password reset attempt          |
|     4728 | Member added to global group    |
|     4732 | Member added to local group     |
|     4738 | User account changed            |
|     4740 | Account locked out              |
|     4756 | Member added to universal group |
|     1102 | Security audit log cleared      |

---

# 25. Process Creation – Windows

```kusto
DeviceProcessEvents
| where TimeGenerated > ago(24h)
| project
    Timestamp,
    DeviceName,
    AccountName,
    FileName,
    ProcessCommandLine,
    InitiatingProcessFileName,
    InitiatingProcessCommandLine
| order by Timestamp desc
```

Look for suspicious chains:

```text
winword.exe → powershell.exe
excel.exe → cmd.exe
outlook.exe → powershell.exe
w3wp.exe → cmd.exe
sqlservr.exe → cmd.exe
svchost.exe → unusual executable
explorer.exe → encoded PowerShell
```

---

# 26. Suspicious Parent-Child Process Detection

```kusto
DeviceProcessEvents
| where
    (InitiatingProcessFileName in~ ("winword.exe","excel.exe","outlook.exe")
     and FileName in~ ("powershell.exe","cmd.exe","wscript.exe","cscript.exe","mshta.exe"))
    or
    (InitiatingProcessFileName =~ "w3wp.exe"
     and FileName in~ ("cmd.exe","powershell.exe"))
| project
    Timestamp,
    DeviceName,
    AccountName,
    InitiatingProcessFileName,
    FileName,
    ProcessCommandLine
```

---

# 27. File Creation Investigation

```kusto
DeviceFileEvents
| where TimeGenerated > ago(24h)
| where ActionType in ("FileCreated", "FileModified")
| project
    Timestamp,
    DeviceName,
    InitiatingProcessAccountName,
    FileName,
    FolderPath,
    SHA256,
    InitiatingProcessFileName
| order by Timestamp desc
```

Prioritize:

```text
C:\Users\<user>\AppData\
C:\Users\<user>\Downloads\
C:\Users\<user>\Temp\
C:\Windows\Temp\
C:\ProgramData\
Startup directories
```

---

# 28. File Hash Investigation

```kusto
DeviceFileEvents
| where SHA256 == "<SHA256>"
| project
    Timestamp,
    DeviceName,
    FileName,
    FolderPath,
    SHA256,
    InitiatingProcessFileName
```

For an identified malicious hash:

```text
1. Search enterprise-wide
2. Identify first occurrence
3. Identify affected devices
4. Identify creating process
5. Identify parent process
6. Identify network activity
7. Identify user
8. Determine execution
9. Contain affected endpoints
```

---

# 29. Network Connection Investigation

```kusto
DeviceNetworkEvents
| where TimeGenerated > ago(24h)
| project
    Timestamp,
    DeviceName,
    InitiatingProcessAccountName,
    InitiatingProcessFileName,
    RemoteIP,
    RemotePort,
    RemoteUrl,
    Protocol
| order by Timestamp desc
```

---

# 30. Suspicious PowerShell Network Connection

```kusto
DeviceNetworkEvents
| where InitiatingProcessFileName in~ ("powershell.exe", "pwsh.exe")
| project
    Timestamp,
    DeviceName,
    InitiatingProcessAccountName,
    RemoteIP,
    RemotePort,
    RemoteUrl,
    InitiatingProcessCommandLine
```

High-risk combinations:

```text
PowerShell
+
Internet connection
+
Encoded command
+
File download
```

---

# 31. DNS Investigation

```kusto
DeviceNetworkEvents
| where RemoteUrl != ""
| project
    Timestamp,
    DeviceName,
    InitiatingProcessFileName,
    RemoteUrl,
    RemoteIP
| order by Timestamp desc
```

Investigate:

```text
New domain
Rare domain
Newly observed domain
Dynamic DNS
Suspicious TLD
Domain unrelated to application purpose
High-frequency DNS requests
```

---

# 32. Command-Line Discovery

Search for:

```kusto
DeviceProcessEvents
| where ProcessCommandLine has_any (
    "whoami",
    "hostname",
    "systeminfo",
    "ipconfig",
    "netstat",
    "arp -a",
    "route print",
    "tasklist",
    "quser",
    "qwinsta",
    "net user",
    "net group",
    "net localgroup",
    "net share",
    "net view"
)
| project Timestamp, DeviceName, AccountName, FileName, ProcessCommandLine
```

These commands are legitimate administration tools, so detect them using **sequence, identity, frequency and context**, not as standalone malicious events.

---

# 33. System Discovery

```kusto
DeviceProcessEvents
| where ProcessCommandLine has_any (
    "systeminfo",
    "hostname",
    "whoami",
    "ipconfig",
    "route print"
)
| project Timestamp, DeviceName, AccountName, ProcessCommandLine
```

---

# 34. Network Discovery

```kusto
DeviceProcessEvents
| where ProcessCommandLine has_any (
    "ipconfig",
    "arp -a",
    "netstat",
    "route print",
    "net view",
    "nslookup"
)
| project Timestamp, DeviceName, AccountName, ProcessCommandLine
```

High confidence when:

```text
Multiple discovery commands
+
Newly compromised account
+
Short execution interval
```

---

# 35. Account Discovery

```kusto
DeviceProcessEvents
| where ProcessCommandLine has_any (
    "net user",
    "net localgroup",
    "whoami /groups",
    "wmic useraccount",
    "quser"
)
| project Timestamp, DeviceName, AccountName, ProcessCommandLine
```

---

# 36. Active Directory Discovery

```kusto
DeviceProcessEvents
| where ProcessCommandLine has_any (
    "dsquery",
    "net group",
    "net user /domain",
    "setspn",
    "nltest"
)
| project
    Timestamp,
    DeviceName,
    AccountName,
    ProcessCommandLine
```

Prioritize:

```text
Compromised endpoint
+
Domain enumeration
+
Privileged-group discovery
+
SPN enumeration
```

---

# 37. Windows Firewall Modification

```kusto
DeviceProcessEvents
| where ProcessCommandLine has_any (
    "netsh advfirewall",
    "Set-NetFirewallProfile",
    "Set-NetFirewallRule"
)
| project Timestamp, DeviceName, AccountName, ProcessCommandLine
```

High-risk if:

```text
Firewall disabled
+
Defender disabled
+
Suspicious process
```

---

# 38. Windows Event Log Clearing

```kusto
DeviceProcessEvents
| where ProcessCommandLine has_any (
    "wevtutil cl",
    "Clear-EventLog"
)
| project Timestamp, DeviceName, AccountName, ProcessCommandLine
```

Correlate with:

```text
Security Event ID 1102
```

Treat this as a high-priority defense-evasion signal.

---

# 39. Shadow Copy Investigation

```kusto
DeviceProcessEvents
| where ProcessCommandLine contains "vssadmin"
| project Timestamp, DeviceName, AccountName, ProcessCommandLine
```

Investigate:

```text
vssadmin
wmic shadowcopy
diskshadow
```

especially around ransomware incidents.

---

# 40. Windows Registry Investigation

```kusto
DeviceProcessEvents
| where ProcessCommandLine has_any (
    "reg add",
    "reg delete",
    "reg.exe"
)
| project
    Timestamp,
    DeviceName,
    AccountName,
    ProcessCommandLine,
    InitiatingProcessFileName
```

Prioritize modifications to:

```text
Run
RunOnce
Services
Winlogon
Image File Execution Options
AppInit_DLLs
Policies
Security configuration
```

---

# 41. Persistence Investigation

Search for:

```text
Scheduled Tasks
Windows Services
Run / RunOnce
Startup Folder
WMI Event Subscriptions
Registry modifications
New local accounts
New privileged group memberships
New service principal credentials
New Entra applications
New OAuth permissions
Automation runbooks
Logic Apps
Function configuration
VM extensions
```

---

# 42. Azure VM Run Command Investigation

```kusto
AzureActivity
| where TimeGenerated > ago(24h)
| where OperationNameValue contains "runCommand"
| project
    TimeGenerated,
    Caller,
    OperationNameValue,
    Resource,
    ResourceGroup,
    Properties
| order by TimeGenerated desc
```

Ask:

```text
Who executed it?
Which VM?
Was it approved?
What was the purpose?
Was the VM production?
What happened on the VM immediately afterward?
```

---

# 43. VM Extension Investigation

```kusto
AzureActivity
| where TimeGenerated > ago(24h)
| where OperationNameValue contains "extensions"
| project
    TimeGenerated,
    Caller,
    OperationNameValue,
    Resource,
    Properties
```

Investigate unexpected:

```text
Custom Script Extension
VMAccess Extension
Monitoring extension
Security extension
Third-party extension
```

---

# 44. Managed Identity Investigation

Start with Azure Activity:

```kusto
AzureActivity
| where TimeGenerated > ago(24h)
| where Caller contains "managedIdentity"
| project TimeGenerated, Caller, OperationNameValue, Resource
```

Then investigate:

```text
Managed identity
      ↓
Token acquisition
      ↓
Resource access
      ↓
Key Vault / Storage / SQL / ARM
```

The important question is:

> Is this resource access normal for this workload identity?

---

# 45. Key Vault Investigation

If resource logs are available:

```kusto
AzureDiagnostics
| where TimeGenerated > ago(24h)
| where ResourceProvider == "MICROSOFT.KEYVAULT"
| project TimeGenerated, OperationName, CallerIPAddress, identity_claim_appid_g, ResultType, Resource
```

Investigate:

```text
SecretGet
KeyGet
CertificateGet
SecretList
KeyList
CertificateList
Delete
Purge
```

Prioritize:

```text
New source IP
+
New identity
+
Multiple secrets
+
High-privilege workload
```

---

# 46. Storage Investigation

```kusto
StorageBlobLogs
| where TimeGenerated > ago(24h)
| project
    TimeGenerated,
    AccountName,
    AuthenticationType,
    CallerIpAddress,
    OperationName,
    Uri,
    StatusCode,
    ObjectKey
| order by TimeGenerated desc
```

Look for:

```text
Large number of reads
Large number of downloads
Unusual IP
Unexpected identity
Anonymous access
SAS authentication
Access outside normal hours
```

---

# 47. Storage Bulk-Read Hunting

```kusto
StorageBlobLogs
| where TimeGenerated > ago(1h)
| where OperationName contains "Read"
| summarize
    Reads=count(),
    Objects=dcount(Uri)
    by AccountName, CallerIpAddress
| order by Reads desc
```

This should be combined with normal business baselines before generating an alert.

---

# 48. Azure SQL Investigation

Where SQL auditing is ingested:

```kusto
AzureDiagnostics
| where TimeGenerated > ago(24h)
| where ResourceProvider contains "MICROSOFT.SQL"
| project TimeGenerated, Resource, OperationName, identity_s, client_ip_s, statement_s
```

Look for:

```text
Unusual login
New source IP
Privilege changes
Large SELECT activity
Schema discovery
Bulk extraction
Unexpected administrative operations
```

---

# 49. Azure Resource Discovery

Using Azure CLI for authorized investigation:

```bash
az account show
az account list -o table
az group list -o table
az resource list -o table
az vm list -o table
az storage account list -o table
az keyvault list -o table
az network vnet list -o table
az network nsg list -o table
```

Use these primarily to **validate what the identity in an alert could access**.

---

# 50. Azure RBAC Investigation Using CLI

```bash
az role assignment list --all -o table
```

For a specific identity:

```bash
az role assignment list \
  --assignee "<object-id>" \
  --all \
  -o table
```

Check role definitions:

```bash
az role definition list \
  --name "Owner" \
  -o json
```

---

# 51. Azure Resource Graph – Public IP Investigation

```bash
az graph query -q "
Resources
| where type =~ 'microsoft.network/publicipaddresses'
| project name, resourceGroup, subscriptionId, location, properties
"
```

---

# 52. Azure Resource Graph – VMs

```bash
az graph query -q "
Resources
| where type =~ 'microsoft.compute/virtualmachines'
| project name, resourceGroup, subscriptionId, location
"
```

---

# 53. Azure Resource Graph – Storage

```bash
az graph query -q "
Resources
| where type =~ 'microsoft.storage/storageaccounts'
| project name, resourceGroup, subscriptionId, location, properties
"
```

---

# 54. Azure Resource Graph – Key Vault

```bash
az graph query -q "
Resources
| where type =~ 'microsoft.keyvault/vaults'
| project name, resourceGroup, subscriptionId, location, properties
"
```

---

# 55. Azure CLI – Network Investigation

```bash
az network public-ip list -o table

az network nsg list -o table

az network vnet list -o table

az network route-table list -o table

az network private-endpoint list -o table
```

For a suspicious resource, identify:

```text
Public exposure
Private endpoint
Subnet
NSG
Route table
VNet
Peering
Firewall path
```

---

# 56. Defender for Endpoint – Device Investigation

## Device Process Activity

```kusto
DeviceProcessEvents
| where DeviceName =~ "HOSTNAME"
| where Timestamp > ago(24h)
| project
    Timestamp,
    FileName,
    ProcessCommandLine,
    AccountName,
    InitiatingProcessFileName,
    InitiatingProcessCommandLine,
    SHA256
| order by Timestamp desc
```

## Device Network Activity

```kusto
DeviceNetworkEvents
| where DeviceName =~ "HOSTNAME"
| where Timestamp > ago(24h)
| project
    Timestamp,
    InitiatingProcessFileName,
    InitiatingProcessCommandLine,
    RemoteIP,
    RemotePort,
    RemoteUrl
| order by Timestamp desc
```

---

# 57. Device Timeline

For a compromised device, build this timeline:

```text
Initial authentication
        ↓
User/process execution
        ↓
Suspicious file creation
        ↓
PowerShell/cmd execution
        ↓
Network connection
        ↓
Credential access
        ↓
Privilege escalation
        ↓
Persistence
        ↓
Lateral movement
        ↓
Data access
```

---

# 58. Hash → Device Investigation

```kusto
union DeviceFileEvents, DeviceProcessEvents
| where SHA256 =~ "<HASH>"
| project Timestamp, DeviceName, FileName, FolderPath, SHA256, ProcessCommandLine
| order by Timestamp asc
```

---

# 59. IP → Enterprise Investigation

```kusto
union
    SigninLogs,
    DeviceNetworkEvents,
    AzureActivity
| where IPAddress == "<IP>"
   or RemoteIP == "<IP>"
   or CallerIpAddress == "<IP>"
| project TimeGenerated, Type, IPAddress, RemoteIP, Caller, UserPrincipalName
| order by TimeGenerated desc
```

Field names differ by table, so validate the schema before using a union in production.

---

# 60. User → Enterprise Investigation

```kusto
union
    SigninLogs,
    AuditLogs,
    AzureActivity
| where UserPrincipalName =~ "user@example.com"
    or Caller contains "user@example.com"
| project TimeGenerated, Type, OperationName, UserPrincipalName, Caller, Resource
| order by TimeGenerated desc
```

---

# 61. SHA256 → Network Activity

```kusto
DeviceNetworkEvents
| where InitiatingProcessSHA256 =~ "<HASH>"
| project
    Timestamp,
    DeviceName,
    InitiatingProcessFileName,
    InitiatingProcessCommandLine,
    RemoteIP,
    RemotePort,
    RemoteUrl
```

---

# 62. Process → Network Correlation

```kusto
DeviceNetworkEvents
| where InitiatingProcessFileName in~ (
    "powershell.exe",
    "cmd.exe",
    "wscript.exe",
    "mshta.exe",
    "rundll32.exe",
    "regsvr32.exe"
)
| project
    Timestamp,
    DeviceName,
    AccountName=InitiatingProcessAccountName,
    InitiatingProcessFileName,
    InitiatingProcessCommandLine,
    RemoteIP,
    RemotePort,
    RemoteUrl
```

---

# 63. Common LOLBin Investigation Matrix

| Process       | Investigate When                                  |
| ------------- | ------------------------------------------------- |
| PowerShell    | Encoded/hidden/download/network activity          |
| cmd.exe       | Unusual parent or administrative command sequence |
| mshta.exe     | Script/URL execution                              |
| regsvr32.exe  | Scriptlet/remote registration behavior            |
| rundll32.exe  | DLL execution from unusual path                   |
| certutil.exe  | Unexpected encoding/download behavior             |
| bitsadmin.exe | Unexpected transfer                               |
| msiexec.exe   | Unexpected remote/package execution               |
| wscript.exe   | Script execution from user/temp locations         |
| cscript.exe   | Script execution                                  |
| schtasks.exe  | Persistence                                       |
| sc.exe        | Service creation/modification                     |
| reg.exe       | Persistence/security configuration changes        |

---

# 64. High-Value Windows Parent → Child Relationships

| Parent         | Child              |    Priority |
| -------------- | ------------------ | ----------: |
| `winword.exe`  | `powershell.exe`   |        High |
| `excel.exe`    | `cmd.exe`          |        High |
| `outlook.exe`  | `powershell.exe`   |        High |
| `w3wp.exe`     | `cmd.exe`          |        High |
| `w3wp.exe`     | `powershell.exe`   |        High |
| `sqlservr.exe` | `cmd.exe`          |        High |
| `svchost.exe`  | unusual executable |        High |
| `explorer.exe` | encoded PowerShell | Medium–High |
| `services.exe` | unusual executable |        High |

---

# 65. Azure Security Incident – Questions to Ask

## Identity

```text
Who authenticated?
Was MFA used?
Was authentication risky?
Was the device known?
Was the IP known?
Was the location expected?
Was a service principal involved?
Was a managed identity involved?
```

## Privilege

```text
Did the identity receive a new role?
Was Owner/Contributor assigned?
Was User Access Administrator assigned?
Was a custom role created?
Was an application permission changed?
```

## Resource

```text
Which subscription?
Which resource group?
Which resource?
Was it production?
Was it accessed before?
Was it modified?
Was it deleted?
```

## Endpoint

```text
What process executed?
Who launched it?
What was the parent process?
What command line was used?
What file was created?
What hash was involved?
```

## Network

```text
Which destination?
Which port?
Which domain?
Was the destination previously observed?
Was traffic allowed by Firewall?
Was DNAT involved?
Was data transferred?
```

## Persistence

```text
New account?
New role?
New service principal credential?
New application?
New scheduled task?
New service?
New Run key?
New VM extension?
New Automation runbook?
```

---

# 66. First 10 Queries an Analyst Should Know

### 1. User sign-ins

```kusto
SigninLogs
| where UserPrincipalName =~ "user@example.com"
| where TimeGenerated > ago(24h)
| order by TimeGenerated desc
```

### 2. Failed authentication

```kusto
SigninLogs
| where ResultType != 0
| summarize count() by UserPrincipalName, IPAddress
| order by count_ desc
```

### 3. Azure administrative activity

```kusto
AzureActivity
| where TimeGenerated > ago(24h)
| project TimeGenerated, Caller, OperationNameValue, Resource
| order by TimeGenerated desc
```

### 4. RBAC changes

```kusto
AzureActivity
| where OperationNameValue contains "roleAssignments"
```

### 5. PowerShell

```kusto
DeviceProcessEvents
| where FileName in~ ("powershell.exe","pwsh.exe")
| project Timestamp, DeviceName, AccountName, ProcessCommandLine
```

### 6. Suspicious parent-child process

```kusto
DeviceProcessEvents
| where InitiatingProcessFileName in~ ("winword.exe","excel.exe","outlook.exe")
| where FileName in~ ("powershell.exe","cmd.exe","mshta.exe")
```

### 7. Network connection

```kusto
DeviceNetworkEvents
| where TimeGenerated > ago(24h)
| project Timestamp, DeviceName, InitiatingProcessFileName, RemoteIP, RemotePort, RemoteUrl
```

### 8. Key Vault

```kusto
AzureDiagnostics
| where ResourceProvider =~ "MICROSOFT.KEYVAULT"
| where TimeGenerated > ago(24h)
```

### 9. Storage

```kusto
StorageBlobLogs
| where TimeGenerated > ago(24h)
| order by TimeGenerated desc
```

### 10. Security log clearing

```kusto
DeviceProcessEvents
| where ProcessCommandLine has_any ("wevtutil cl","Clear-EventLog")
```

---

# 67. Quick Severity Assessment

| Observation                                 | Suggested Priority |
| ------------------------------------------- | -----------------: |
| Single failed login                         |      Informational |
| Multiple failed logins                      |         Low–Medium |
| Password spray                              |               High |
| Successful login after password spray       |               High |
| Risky privileged login                      |               High |
| New service principal credential            |               High |
| New Owner assignment                        |           Critical |
| Security logging disabled                   |           Critical |
| Defender disabled                           |           Critical |
| Key Vault secret access by unusual identity |               High |
| Bulk Storage read                           |               High |
| Public RDP/SSH exposure                     |               High |
| Suspicious PowerShell                       |        Medium–High |
| Office → PowerShell                         |               High |
| New scheduled task + suspicious executable  |               High |
| New admin account                           |               High |
| Firewall rule weakening                     |      High–Critical |
| Resource deletion                           |           Critical |
| Multiple attack stages correlated           |           Critical |

---

# 68. Incident Containment Actions

## Compromised User

```text
1. Disable/block account if authorized
2. Revoke sessions/tokens where appropriate
3. Reset credentials
4. Review MFA/authentication methods
5. Review registered devices
6. Review OAuth/application consent
7. Review RBAC assignments
8. Review recent resource activity
```

## Compromised Service Principal

```text
1. Disable/contain application identity
2. Remove compromised credential
3. Rotate secret/certificate
4. Review API permissions
5. Review RBAC
6. Review all resource activity
7. Identify resources accessed using identity
```

## Compromised VM

```text
1. Isolate endpoint using Defender
2. Preserve evidence
3. Identify malicious process
4. Identify persistence
5. Identify credentials/tokens potentially exposed
6. Review managed identity activity
7. Review network connections
8. Rebuild VM if required
9. Rotate exposed credentials
```

---

# 69. Analyst Evidence Collection

Before remediation, capture:

```text
Alert ID
Incident ID
User
Device
IP
Hostname
Subscription
Resource Group
Resource
Timestamp
Process
Command line
Parent process
File hash
Destination IP
Destination domain
Destination port
RBAC changes
Authentication events
Persistence mechanisms
Data accessed
Actions taken
```

---

# 70. Incident Timeline Template

| Time  | Entity  | Activity            | Source            | Assessment             |
| ----- | ------- | ------------------- | ----------------- | ---------------------- |
| 09:01 | User    | Failed login        | Entra             | Suspicious             |
| 09:04 | User    | Successful login    | Entra             | Suspicious             |
| 09:06 | User    | RBAC assignment     | AzureActivity     | High risk              |
| 09:08 | VM      | Run Command         | AzureActivity     | High risk              |
| 09:09 | VM      | PowerShell          | Defender          | High risk              |
| 09:10 | VM      | External connection | Defender/Firewall | High risk              |
| 09:12 | Storage | Bulk reads          | Storage           | Potential exfiltration |

---

# 71. Detection Engineering Rule Structure

Every detection should document:

| Field           | Example                              |
| --------------- | ------------------------------------ |
| Detection Name  | New Privileged Azure RBAC Assignment |
| MITRE Technique | T1098 – Account Manipulation         |
| Data Source     | AzureActivity                        |
| Trigger         | `roleAssignments/write`              |
| Entity          | Caller + target principal            |
| Baseline        | Approved privileged administrators   |
| Severity        | High                                 |
| False Positives | Approved IAM changes                 |
| Enrichment      | User, IP, subscription, resource     |
| Correlation     | Subsequent resource access           |
| Response        | Validate/change/revoke               |
| Owner           | Cloud SOC                            |
| Tuning          | Exclusion/watchlist                  |
| SLA             | High-priority investigation          |

---

# 72. Golden Detection Pattern

Do not alert simply because:

```text
PowerShell executed
```

Prefer:

```text
PowerShell
+
Encoded command
+
Unusual parent
+
New external destination
+
New file
+
Rare user/device
```

Similarly, do not alert simply because:

```text
RBAC role assigned
```

Prefer:

```text
RBAC role assigned
+
Privileged role
+
Unexpected caller
+
Production subscription
+
Outside change window
+
Subsequent sensitive resource access
```

And:

```text
Key Vault secret accessed
```

becomes significantly stronger when:

```text
Unusual identity
+
Unusual source IP
+
Multiple secrets
+
Recent privilege escalation
+
Subsequent authentication using retrieved secret
```

---

# 73. Azure SOC Daily Checklist

| Task                             | Frequency  |
| -------------------------------- | ---------- |
| Review Sentinel incidents        | Continuous |
| Review high-risk Entra sign-ins  | Continuous |
| Review privileged RBAC changes   | Daily      |
| Review service-principal changes | Daily      |
| Review security-control changes  | Daily      |
| Review public exposure changes   | Daily      |
| Review Key Vault anomalies       | Daily      |
| Review Storage anomalies         | Daily      |
| Review Defender incidents        | Continuous |
| Review VM Run Command activity   | Daily      |
| Review Firewall anomalies        | Daily      |
| Review detection failures        | Daily      |
| Review false positives           | Daily      |
| Review threat-hunting hypotheses | Weekly     |
| Review detection coverage        | Weekly     |
| Review MITRE ATT&CK coverage     | Monthly    |
| Review privileged identities     | Monthly    |
| Review cloud attack paths        | Monthly    |

---

# 74. Analyst Mental Model

When investigating an Azure attack, always answer:

```text
WHO?
  ↓
authenticated?

FROM WHERE?
  ↓
IP / country / device?

HOW?
  ↓
password / MFA / token / service principal / managed identity?

WHAT PRIVILEGE?
  ↓
role / permission / token?

WHAT RESOURCE?
  ↓
VM / Storage / Key Vault / SQL / AKS?

WHAT ACTION?
  ↓
read / write / execute / delete?

WHAT PROCESS?
  ↓
PowerShell / CMD / application / service?

WHERE DID IT CONNECT?
  ↓
IP / domain / port?

WHAT DATA?
  ↓
secret / file / database / blob?

HOW DID IT PERSIST?
  ↓
account / RBAC / application / task / service / automation?

WHAT HAPPENED NEXT?
  ↓
lateral movement / collection / exfiltration / impact?
```

**The strongest Azure SOC investigations connect the identity plane, control plane, data  plane, endpoint plane and network plane into one timeline.**
