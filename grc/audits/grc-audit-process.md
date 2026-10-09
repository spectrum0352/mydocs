# Azure Security Audit Playbook

## Identity & Access Management (IAM)

- Ensure no use of the Azure subscription root account
- Enforce MFA on all users with portal access
- Rotate access keys (App Registrations, Service Principals) every 90 days
- Set strong password policies:
  - Minimum length: 14+
  - Require uppercase, lowercase, number, and symbol
- Avoid excessive privilege via role assignments (e.g., use PIM)
- Use managed identities for VM/app resource access

Inspired by AWS Zeus audit principles, these Azure-specific checks focus
on misconfigurations and weak identity practices that red teams should
target or defenders should harden.

**🛡️ Identity & Access Management (Azure AD)**

| **🔒 Check** | **Recommended Practice** |
|----|----|
| **Avoid Global Administrator Overuse** | Ensure the Global Admin role is only assigned to break-glass accounts. |
| **MFA for All Users** | Enforce MFA via Conditional Access, especially for admins and users with portal access. |
| **Remove Stale Accounts** | Disable accounts that haven't logged in within 90 days (SignInActivity). |
| **Rotate Azure AD App Secrets** | Ensure app/client secrets are rotated every 90 days or less. |
| **Strong Password Policy** | Enforce at least 14-character passwords, including uppercase, lowercase, number, and symbol. |
| **Disable Legacy Auth** | Block legacy protocols (IMAP, POP3, SMTP) to prevent bypassing MFA. |
| **No Default Access Keys** | Ensure there are no leftover shared keys or default credentials (e.g., Logic Apps or Function Apps). |
| **Use Role-Based Access Control (RBAC)** | Assign permissions through groups or roles, not directly to users. |
| **Monitor Directory Role Changes** | Alert on additions to high-privilege roles (Global Admin, Privileged Auth Admin, etc.). |
| **Register Security Contact Info** | Ensure securityContact and notification emails are defined in the tenant properties. |

### Access Control to Azure Resources

| **🔐 Check** | **Recommended Practice** |
|----|----|
| **Use Managed Identities** | Use system-assigned or user-assigned managed identities for services like VMs, Functions, and Logic Apps. |
| **Avoid Access Keys for Storage** | Use RBAC + Azure AD auth instead of access keys for storage account access. |
| **Audit Service Principals** | Review permissions assigned to Azure AD applications and automation accounts. |

## Networking

- Deny inbound traffic on ports 22/3389 from 0.0.0.0/0 in all NSGs
- Enable NSG Flow Logs across all Network Security Groups
- Restrict default NSGs and Subnets to least privilege
- Review Public IP usage — avoid assigning directly to critical VMs
- Confirm no overly permissive route tables or peering links

## Logging & Diagnostic Settings

- Enable diagnostic logs on all critical services (Key Vault, SQL, Storage, etc.)
- Ensure logs are sent to Log Analytics / Event Hub / Storage
- Use customer-managed keys (CMKs) and enable key rotation
- Enable Azure Policy to enforce diagnostic settings
- Block removal of diagnostic settings using policy

## Monitoring & Alerting

- Configure alerts on:
  - Unauthorized API calls (403/401)
  - Non-MFA sign-ins to portal
  - Role assignment or permission changes
  - Key Vault key delete/disable attempts
  - NSG/Route Table/VNet configuration changes
  - Sign-in failures and brute-force attempts
- Enable Azure Defender / Microsoft Defender for Cloud
- Use Azure Monitor Activity Log alerts + Log Analytics queries

## Billing & Contact Integrity

| **📤 Check** | **Recommended Practice** |
|----|----|
| **Enable Cost Management Alerts** | Set up budgets and alerts for cost spikes. |
| **Maintain Updated Contact Info** | Ensure organization’s billing and technical contacts are current. |



**🧪 Suggested Azure Pentest Tests Based on This:**

- Attempt login with legacy protocols (MFA bypass).

- Abuse stale service principals with overprivileged roles.

- Exploit shared keys (e.g., AzureWebJobsStorage) found in config files.

- Enumerate users missing MFA using Microsoft Graph or AzureHound.


## Network Security

These checks are inspired by AWS best practices but rewritten in the context of Azure environments. They help identify overly permissive networking configurations and logging gaps commonly targeted in lateral movement or external exposure.

| **Check** | **Tool** | **Command** | **Expected Result** |
|----|----|----|----|
| **Ensure no Network Security Group (NSG) allows inbound access from 0.0.0.0/0 on port 22 (SSH)** | Azure CLI | az network nsg rule list --resource-group \<rg\> --nsg-name \<nsg\> | No rules should allow \* source with destination port 22 |
| **Ensure no NSG allows inbound access from 0.0.0.0/0 on port 3389 (RDP)** | Azure CLI | az network nsg rule list --resource-group \<rg\> --nsg-name \<nsg\> | No rules should allow \* source with destination port 3389 |
| **Ensure Network Watcher Flow Logs are enabled for all NSGs** | Azure CLI | az network watcher flow-log show --nsg \<nsg-name\> --resource-group \<rg\> | Flow logs should be enabled and pointing to a storage account |
| **Ensure default NSGs (or unassociated ones) deny all inbound traffic by default** | Azure CLI | az network nsg rule list --resource-group \<rg\> --nsg-name \<nsg\> | Default NSGs should not have allow-all inbound rules |
| **Ensure Subnet NSG association is correct and restricts public traffic** | Azure CLI | az network vnet subnet show --vnet-name \<vnet\> --name \<subnet\> | NSG should be associated and configured for least privilege |
| **Ensure Public IP addresses are not assigned directly to critical VMs unless required** | Azure CLI | az vm list-ip-addresses --output table | Critical VMs should not expose public IPs unnecessarily |

## Logging and Monitoring

These checks ensure that monitoring and alerting are in place to detect malicious or suspicious activity across the Azure environment. They can be used during offensive testing to evaluate detection coverage.

| **Check** | **💻 Tool** | **Command / Insight** | **Expected Result** |
|----|----|----|----|
| **Alert exists for unauthorized Azure API calls (401/403 events)** | Azure Monitor / Log Analytics | Query: \`AzureDiagnostics | where ResultType == "403"\` |
| **Alert exists for portal sign-in without MFA** | Azure AD Sign-In Logs | Query: \`SigninLogs | where ConditionalAccessStatus == "notApplied"\` |
| **Alert exists for use of Privileged (e.g., Global Admin) accounts** | Azure AD Roles | Monitor specific roles (e.g., Global Admin, Privileged Role Admin) | Alerts triggered on sign-in or role usage |
| **Alert exists for IAM (RBAC) role assignment changes** | Activity Logs | Monitor: Microsoft.Authorization/roleAssignments/write | Alert rule triggers on role modifications |
| **Alert exists for changes to Azure Diagnostic settings** | Activity Logs | Monitor: Microsoft.Insights/diagnosticSettings/write | Alert when logging is changed or disabled |
| **Alert exists for Azure AD sign-in failures** | Azure AD Sign-In Logs | Query: \`SigninLogs | where Status.errorCode != 0\` |
| **Alert exists for Key Vault key disable or deletion attempts** | Activity Logs | Monitor: Microsoft.KeyVault/vaults/keys/delete or \*/\*disable | Trigger alerts on sensitive key tampering |
| **Alert exists for Storage Account (SAS/token) or policy changes** | Activity Logs | Monitor: Microsoft.Storage/storageAccounts/\* | Alert when access policies are modified |
| **Alert exists for Azure Policy configuration or assignment changes** | Activity Logs | Monitor: Microsoft.Authorization/policyAssignments/\* | Changes should trigger an alert |
| **Alert exists for NSG rule modifications** | Activity Logs | Monitor: Microsoft.Network/networkSecurityGroups/securityRules/write | Alert when security group rules are modified |
| **Alert exists for Network Watcher flow log disablement** | Activity Logs | Monitor: Microsoft.Network/networkWatchers/flowLogs/delete | Alert on log deletion attempts |
| **Alert exists for VNet or Subnet changes** | Activity Logs | Monitor: Microsoft.Network/virtualNetworks/write | Alert on VNet modifications |
| **Alert exists for Route Table updates** | Activity Logs | Monitor: Microsoft.Network/routeTables/write | Alert triggered when routes are modified |

| **Check** | **Tool** | **Command** | **Expected Result** |
|----|----|----|----|
| Ensure Activity Logs are enabled for all subscriptions | Azure CLI | az monitor activity-log list --max-events 1 | Recent activity logs are returned |
| Ensure Diagnostic Settings are configured on key resources | Azure CLI | az monitor diagnostic-settings list --resource \<resource-id\> | Log destinations like Log Analytics or Storage are set |
| Ensure log Storage Accounts are private | Azure CLI | az storage account show --name \<storage-name\> --query networkRuleSet | Public access disabled and firewall or private endpoint used |
| Enable immutable storage (WORM) on log storage | Azure CLI | az storage container immutability-policy show --account-name \<name\> --container-name \<log-container\> | Immutability policy is set and locked |
| Use CMKs to encrypt logs | Azure CLI | az monitor log-analytics workspace show --workspace-name \<name\> --query encryption | Customer-managed keys (CMKs) are enabled |
| Enable key rotation for all logging-related keys | Azure CLI | az keyvault key rotation-policy show --vault-name \<vault-name\> --name \<key-name\> | Valid key rotation policy in place (e.g., 90 days) |
| Enable logging for critical services (VMs, Key Vault, etc.) | Azure CLI | az monitor diagnostic-settings list --resource \<resource-id\> | Diagnostic settings exist for key services |
| Enforce diagnostic settings via Azure Policy | Azure CLI | az policy assignment list --query "\[?contains(name, 'diagnostic')\]" | Diagnostic enforcement policies are listed |

# Azure Logging & Auditing Security Checks

These checks identify common misconfigurations in Azure's logging
infrastructure that red teams can exploit or blue teams should harden.

**📜 Audit and Logging Configuration**

| **Check** | **🔐 Azure Equivalent** |
|----|----|
| **Ensure logging is enabled across all subscriptions** | Verify **Azure Activity Logs** and **Diagnostic Settings** are enabled for each subscription. |
| **Ensure audit logs are sent to a secure Log Analytics workspace** | Confirm Activity Logs, Azure AD logs, and resource logs (e.g., for VMs, Key Vaults) are routed to **Log Analytics**, **Storage Account**, or **Event Hub** using **Diagnostic Settings**. |
| **Ensure logs are not publicly accessible** | Check that any **Storage Account** used for logging is private and behind **private endpoints or firewall rules**. |
| **Ensure log integrity** | Enable **immutable storage (WORM)** on log storage and configure **Azure Defender for Storage**. |
| **Ensure log encryption** | Use **customer-managed keys (CMKs)** with **Azure Key Vault** to encrypt log storage accounts and Log Analytics workspaces. |
| **Enable key rotation for CMKs** | Ensure **key rotation** is enabled for all CMKs used to encrypt logs via Key Vault. |
| **Enable logging on critical services** | Enable resource-specific logs (e.g., for **Key Vault**, **Storage**, **VMs**, **App Services**, **Cosmos DB**) via Diagnostic Settings. |
| **Enable Azure Policy enforcement** | Use built-in **Azure Policy definitions** to enforce diagnostic logging across services. |

**🧪 Pentesting Angle**

Red teams should:

- Check if logging is disabled or misconfigured across services.
- Attempt deletion of logs from improperly secured storage.
- Test if sensitive operations (e.g., role assignments, key access) are logged.
- Try to identify gaps in log coverage (e.g., no logs for VMs or SQL).
