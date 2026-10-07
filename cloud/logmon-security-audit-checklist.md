# Logging, monitoring and detection






MONITORING \& DETECTION

• Centralized logging enabled

• SIEM integrated

• UEBA enabled

• SOAR playbooks created

• Alert severity defined

• False positives reviewed

• Threat intelligence feeds integrated

• Cloud activity logs retained

• Storage logs enabled

• Key vault logs enabled

• SQL audit logs enabled

• Network flow logs enabled

• Incident triage process defined

• Incident SLA defined

• Forensic logging enabled

• Time synchronization configured

• Alert tuning conducted quarterly

• Insider threat monitoring enabled

• Privilege escalation alerts configured

• Suspicious API call alerts configured

• Impossible login alerts configured

• Threat hunting program implemented



MONITORING \& INCIDENT RESPONSE

• Microsoft Sentinel deployed

• Sentinel data connectors enabled

• UEBA enabled

• SOAR playbooks configured

• Incident SLA defined

• Alert tuning conducted

• Threat intelligence feeds integrated

• Insider threat detection enabled

• Azure activity logs monitored

• Defender alerts monitored

• Forensic data retention defined

• Time sync configured




\## Logging, Monitoring, Alerting \& Detection



\- Centralized logging enabled

\- SIEM integrated

\- UEBA enabled

\- SOAR playbooks created

\- Alert severity defined

\- False positives reviewed

\- Threat intelligence feeds integrated

\- Cloud activity logs retained

\- Storage logs enabled

\- Key vault logs enabled

\- SQL audit logs enabled

\- Network flow logs enabled

\- Incident triage process defined

\- Incident SLA defined

\- Forensic logging enabled

\- Time synchronization configured

\- Alert tuning conducted quarterly

\- Insider threat monitoring enabled

\- Privilege escalation alerts configured

\- Suspicious API call alerts configured

\- Impossible login alerts configured

\- Threat hunting program implemented

\- Enable diagnostic logs on all critical services (Key Vault, SQL, Storage, etc.)

\- Ensure logs are sent to Log Analytics / Event Hub / Storage

\- Use customer-managed keys (CMKs) and enable key rotation

\- Enable Azure Policy to enforce diagnostic settings

\- Block removal of diagnostic settings using policy

\- Ensure logging is enabled across all subscriptions: Verify Azure Activity Logs and Diagnostic Settings are enabled for each subscription.

\- Ensure audit logs are sent to a secure Log Analytics workspace: Confirm Activity Logs, Microsoft Entra logs, and resource logs (e.g., for VMs, Key Vaults) are routed to Log Analytics, Storage Account, or Event Hub using Diagnostic Settings.

\- Ensure logs are not publicly accessible: Check that any Storage Account used for logging is private and behind private endpoints or firewall rules.

\- Ensure log integrity: Enable immutable storage (WORM - Write Once Read Many) on log storage and configure Microsoft Defender for Storage.

\- Ensure log encryption: Use customer-managed keys (CMKs) with Azure Key Vault to encrypt log storage accounts and Log Analytics workspaces.

\- Enable key rotation for CMKs: Ensure key rotation is enabled for all CMKs used to encrypt logs via Key Vault.

\- Enable logging on critical services: Enable resource-specific logs (e.g., for Key Vault, Storage, VMs, App Services, Cosmos DB) via Diagnostic Settings.

\- Enable Azure Policy enforcement: Use built-in Azure Policy definitions to enforce diagnostic logging across services.

\- Check	Tool	Command	Expected Result

\- Ensure Activity Logs are enabled for all subscriptions	Azure CLI	az monitor activity-log list --max-events 1	Recent activity logs are returned

\- Ensure Diagnostic Settings are configured on key resources	Azure CLI	az monitor diagnostic-settings list --resource <resource-id>	Log destinations like Log Analytics or Storage are set

\- Ensure log Storage Accounts are private	Azure CLI	az storage account show --name <storage-name> --query networkRuleSet	Public access disabled and firewall or private endpoint used

\- Enable immutable storage (WORM) on log storage	Azure CLI	az storage container immutability-policy show --account-name <name> --container-name <log-container>Immutability policy is set and locked

\- Use CMKs to encrypt logs	Azure CLI	az monitor log-analytics workspace show --workspace-name <name> --query encryption	Customer-managed keys (CMKs) are enabled

\- Enable key rotation for all logging-related keys	Azure CLI	az keyvault key rotation-policy show --vault-name <vault-name> --name <key-name>	Valid key rotation policy in place (e.g., 90 days)

\- Enable logging for critical services (VMs, Key Vault, etc.)	Azure CLI	az monitor diagnostic-settings list --resource <resource-id>	Diagnostic settings exist for key services

\- Enforce diagnostic settings via Azure Policy	Azure CLI	az policy assignment list --query "\[?contains(name, 'diagnostic')]"	Diagnostic enforcement policies are listed

\- Check if logging is disabled or misconfigured across services.

\- Attempt deletion of logs from improperly secured storage.

\- Test if sensitive operations (e.g., role assignments, key access) are logged.

\- Try to identify gaps in log coverage (e.g., no logs for VMs or SQL).

\- Configure alerts on:

\- Unauthorized API calls (403/401)

\- Non-MFA sign-ins to portal

\- Role assignment or permission changes

\- Key Vault key delete/disable attempts

\- NSG/Route Table/VNet configuration changes

\- Sign-in failures and brute-force attempts

\- Enable Azure Defender / Microsoft Defender for Cloud

\- Use Azure Monitor Activity Log alerts + Log Analytics queries

\- These checks ensure that monitoring and alerting are in place to detect malicious or suspicious activity across the Azure environment. They can be used during offensive testing to evaluate detection coverage.

\- Check Tool	Command / Insight	Expected Result

\- Alert exists for unauthorized Azure API calls (401/403 events)	Azure Monitor / Log Analytics	Query: `AzureDiagnostics	where ResultType == "403"`

\- Alert exists for portal sign-in without MFA	Azure AD Sign-In Logs	Query: `SigninLogs	where ConditionalAccessStatus == "notApplied"`

\- Alert exists for use of Privileged (e.g., Global Admin) accounts	Azure AD Roles	Monitor specific roles (e.g., Global Admin, Privileged Role Admin)	Alerts triggered on sign-in or role usage

\- Alert exists for IAM (RBAC) role assignment changes	Activity Logs	Monitor: Microsoft.Authorization/roleAssignments/write	Alert rule triggers on role modifications

\- Alert exists for changes to Azure Diagnostic settings	Activity Logs	Monitor: Microsoft.Insights/diagnosticSettings/write	Alert when logging is changed or disabled

\- Alert exists for Azure AD sign-in failures	Azure AD Sign-In Logs	Query: `SigninLogs	where Status.errorCode != 0`

\- Alert exists for Key Vault key disable or deletion attempts	Activity Logs	Monitor: Microsoft.KeyVault/vaults/keys/delete or \*/\*disable	Trigger alerts on sensitive key tampering

\- Alert exists for Storage Account (SAS/token) or policy changes	Activity Logs	Monitor: Microsoft.Storage/storageAccounts/\*	Alert when access policies are modified

\- Alert exists for Azure Policy configuration or assignment changes	Activity Logs	Monitor: Microsoft.Authorization/policyAssignments/\*	Changes should trigger an alert

\- Alert exists for NSG rule modifications	Activity Logs	Monitor: Microsoft.Network/networkSecurityGroups/securityRules/write	Alert when security group rules are modified

\- Alert exists for Network Watcher flow log disablement	Activity Logs	Monitor: Microsoft.Network/networkWatchers/flowLogs/delete	Alert on log deletion attempts

\- Alert exists for VNet or Subnet changes	Activity Logs	Monitor: Microsoft.Network/virtualNetworks/write	Alert on VNet modifications

\- Alert exists for Route Table updates	Activity Logs	Monitor: Microsoft.Network/routeTables/write	Alert triggered when routes are modified

\- Billing and Contact integrity

\- Enable Cost Management Alerts: Set up budgets and alerts for cost spikes.

\- Maintain Updated Contact Info: Ensure organization’s billing and technical contacts are current.



\## MONITORING \& INCIDENT RESPONSE



• Microsoft Sentinel deployed

• Sentinel data connectors enabled

• UEBA enabled

• SOAR playbooks configured

• Incident SLA defined

• Alert tuning conducted

• Threat intelligence feeds integrated

• Insider threat detection enabled

• Azure activity logs monitored

• Defender alerts monitored

• Forensic data retention defined

• Time sync configured


## Logging and Monitoring



These checks ensure that monitoring and alerting are in place to detect malicious or suspicious activity across the Azure environment. They can be used during offensive testing to evaluate detection coverage.



| **Check** | **💻 Tool** | **Command / Insight** | **Expected Result** |

|----|----|----|----|

| **Alert exists for unauthorized Azure API calls (401/403 events)** | Azure Monitor / Log Analytics | Query: `AzureDiagnostics | where ResultType == "403"` |

| **Alert exists for portal sign-in without MFA** | Azure AD Sign-In Logs | Query: `SigninLogs | where ConditionalAccessStatus == "notApplied"` |

| **Alert exists for use of Privileged (e.g., Global Admin) accounts** | Azure AD Roles | Monitor specific roles (e.g., Global Admin, Privileged Role Admin) | Alerts triggered on sign-in or role usage |

| **Alert exists for IAM (RBAC) role assignment changes** | Activity Logs | Monitor: Microsoft.Authorization/roleAssignments/write | Alert rule triggers on role modifications |

| **Alert exists for changes to Azure Diagnostic settings** | Activity Logs | Monitor: Microsoft.Insights/diagnosticSettings/write | Alert when logging is changed or disabled |

| **Alert exists for Azure AD sign-in failures** | Azure AD Sign-In Logs | Query: `SigninLogs | where Status.errorCode != 0` |

| **Alert exists for Key Vault key disable or deletion attempts** | Activity Logs | Monitor: Microsoft.KeyVault/vaults/keys/delete or */*disable | Trigger alerts on sensitive key tampering |

| **Alert exists for Storage Account (SAS/token) or policy changes** | Activity Logs | Monitor: Microsoft.Storage/storageAccounts/* | Alert when access policies are modified |

| **Alert exists for Azure Policy configuration or assignment changes** | Activity Logs | Monitor: Microsoft.Authorization/policyAssignments/* | Changes should trigger an alert |

| **Alert exists for NSG rule modifications** | Activity Logs | Monitor: Microsoft.Network/networkSecurityGroups/securityRules/write | Alert when security group rules are modified |

| **Alert exists for Network Watcher flow log disablement** | Activity Logs | Monitor: Microsoft.Network/networkWatchers/flowLogs/delete | Alert on log deletion attempts |

| **Alert exists for VNet or Subnet changes** | Activity Logs | Monitor: Microsoft.Network/virtualNetworks/write | Alert on VNet modifications |

| **Alert exists for Route Table updates** | Activity Logs | Monitor: Microsoft.Network/routeTables/write | Alert triggered when routes are modified |



| **Check** | **Tool** | **Command** | **Expected Result** |

|----|----|----|----|

| Ensure Activity Logs are enabled for all subscriptions | Azure CLI | az monitor activity-log list --max-events 1 | Recent activity logs are returned |

| Ensure Diagnostic Settings are configured on key resources | Azure CLI | az monitor diagnostic-settings list --resource <resource-id> | Log destinations like Log Analytics or Storage are set |

| Ensure log Storage Accounts are private | Azure CLI | az storage account show --name <storage-name> --query networkRuleSet | Public access disabled and firewall or private endpoint used |

| Enable immutable storage (WORM) on log storage | Azure CLI | az storage container immutability-policy show --account-name <name> --container-name <log-container> | Immutability policy is set and locked |

| Use CMKs to encrypt logs | Azure CLI | az monitor log-analytics workspace show --workspace-name <name> --query encryption | Customer-managed keys (CMKs) are enabled |

| Enable key rotation for all logging-related keys | Azure CLI | az keyvault key rotation-policy show --vault-name <vault-name> --name <key-name> | Valid key rotation policy in place (e.g., 90 days) |

| Enable logging for critical services (VMs, Key Vault, etc.) | Azure CLI | az monitor diagnostic-settings list --resource <resource-id> | Diagnostic settings exist for key services |

| Enforce diagnostic settings via Azure Policy | Azure CLI | az policy assignment list --query "[?contains(name, 'diagnostic')]" | Diagnostic enforcement policies are listed |



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

## Monitoring & Alerting



- Configure alerts on:

&#x20; - Unauthorized API calls (403/401)

&#x20; - Non-MFA sign-ins to portal

&#x20; - Role assignment or permission changes

&#x20; - Key Vault key delete/disable attempts

&#x20; - NSG/Route Table/VNet configuration changes

&#x20; - Sign-in failures and brute-force attempts

- Enable Azure Defender / Microsoft Defender for Cloud

- Use Azure Monitor Activity Log alerts + Log Analytics queries


## Logging & Diagnostic Settings



- Enable diagnostic logs on all critical services (Key Vault, SQL, Storage, etc.)

- Ensure logs are sent to Log Analytics / Event Hub / Storage

- Use customer-managed keys (CMKs) and enable key rotation

- Enable Azure Policy to enforce diagnostic settings

- Block removal of diagnostic settings using policy


## 3. Logging & Diagnostic Settings



- Enable diagnostic logs on all critical services (Key Vault, SQL, Storage, etc.)

- Ensure logs are sent to Log Analytics / Event Hub / Storage

- Use customer-managed keys (CMKs) and enable key rotation

- Enable Azure Policy to enforce diagnostic settings

- Block removal of diagnostic settings using policy

- Ensure logging is enabled across all subscriptions: Verify Azure Activity Logs and Diagnostic Settings are enabled for each subscription.

- Ensure audit logs are sent to a secure Log Analytics workspace: Confirm Activity Logs, Microsoft Entra logs, and resource logs (e.g., for VMs, Key Vaults) are routed to Log Analytics, Storage Account, or Event Hub using Diagnostic Settings.

- Ensure logs are not publicly accessible: Check that any Storage Account used for logging is private and behind private endpoints or firewall rules.

- Ensure log integrity: Enable immutable storage (WORM - Write Once Read Many) on log storage and configure Microsoft Defender for Storage.

- Ensure log encryption: Use customer-managed keys (CMKs) with Azure Key Vault to encrypt log storage accounts and Log Analytics workspaces.

- Enable key rotation for CMKs: Ensure key rotation is enabled for all CMKs used to encrypt logs via Key Vault.

- Enable logging on critical services: Enable resource-specific logs (e.g., for Key Vault, Storage, VMs, App Services, Cosmos DB) via Diagnostic Settings.

- Enable Azure Policy enforcement: Use built-in Azure Policy definitions to enforce diagnostic logging across services.





| **Check** | **Tool** | **Command** | **Expected Result** |

|----|----|----|----|

| Ensure Activity Logs are enabled for all subscriptions | Azure CLI | az monitor activity-log list --max-events 1 | Recent activity logs are returned |

| Ensure Diagnostic Settings are configured on key resources | Azure CLI | az monitor diagnostic-settings list --resource <resource-id> | Log destinations like Log Analytics or Storage are set |

| Ensure log Storage Accounts are private | Azure CLI | az storage account show --name <storage-name> --query networkRuleSet | Public access disabled and firewall or private endpoint used |

| Enable immutable storage (WORM) on log storage | Azure CLI | az storage container immutability-policy show --account-name <name> --container-name <log-container> | Immutability policy is set and locked |

| Use CMKs to encrypt logs | Azure CLI | az monitor log-analytics workspace show --workspace-name <name> --query encryption | Customer-managed keys (CMKs) are enabled |

| Enable key rotation for all logging-related keys | Azure CLI | az keyvault key rotation-policy show --vault-name <vault-name> --name <key-name> | Valid key rotation policy in place (e.g., 90 days) |

| Enable logging for critical services (VMs, Key Vault, etc.) | Azure CLI | az monitor diagnostic-settings list --resource <resource-id> | Diagnostic settings exist for key services |

| Enforce diagnostic settings via Azure Policy | Azure CLI | az policy assignment list --query "[?contains(name, 'diagnostic')]" | Diagnostic enforcement policies are listed |





**Logging and Auditing Checks during Pentest**



- Check if logging is disabled or misconfigured across services.

- Attempt deletion of logs from improperly secured storage.

- Test if sensitive operations (e.g., role assignments, key access) are logged.

- Try to identify gaps in log coverage (e.g., no logs for VMs or SQL).



## 4. Monitoring & Alerting



- Configure alerts on:

&#x20; - Unauthorized API calls (403/401)

&#x20; - Non-MFA sign-ins to portal

&#x20; - Role assignment or permission changes

&#x20; - Key Vault key delete/disable attempts

&#x20; - NSG/Route Table/VNet configuration changes

&#x20; - Sign-in failures and brute-force attempts

- Enable Azure Defender / Microsoft Defender for Cloud

- Use Azure Monitor Activity Log alerts + Log Analytics queries



These checks ensure that monitoring and alerting are in place to detect malicious or suspicious activity across the Azure environment. They can be used during offensive testing to evaluate detection coverage.

| **Check** | **💻 Tool** | **Command / Insight** | **Expected Result** |

|----|----|----|----|

| **Alert exists for unauthorized Azure API calls (401/403 events)** | Azure Monitor / Log Analytics | Query: `AzureDiagnostics | where ResultType == "403"` |

| **Alert exists for portal sign-in without MFA** | Azure AD Sign-In Logs | Query: `SigninLogs | where ConditionalAccessStatus == "notApplied"` |

| **Alert exists for use of Privileged (e.g., Global Admin) accounts** | Azure AD Roles | Monitor specific roles (e.g., Global Admin, Privileged Role Admin) | Alerts triggered on sign-in or role usage |

| **Alert exists for IAM (RBAC) role assignment changes** | Activity Logs | Monitor: Microsoft.Authorization/roleAssignments/write | Alert rule triggers on role modifications |

| **Alert exists for changes to Azure Diagnostic settings** | Activity Logs | Monitor: Microsoft.Insights/diagnosticSettings/write | Alert when logging is changed or disabled |

| **Alert exists for Azure AD sign-in failures** | Azure AD Sign-In Logs | Query: `SigninLogs | where Status.errorCode != 0` |

| **Alert exists for Key Vault key disable or deletion attempts** | Activity Logs | Monitor: Microsoft.KeyVault/vaults/keys/delete or */*disable | Trigger alerts on sensitive key tampering |

| **Alert exists for Storage Account (SAS/token) or policy changes** | Activity Logs | Monitor: Microsoft.Storage/storageAccounts/* | Alert when access policies are modified |

| **Alert exists for Azure Policy configuration or assignment changes** | Activity Logs | Monitor: Microsoft.Authorization/policyAssignments/* | Changes should trigger an alert |

| **Alert exists for NSG rule modifications** | Activity Logs | Monitor: Microsoft.Network/networkSecurityGroups/securityRules/write | Alert when security group rules are modified |

| **Alert exists for Network Watcher flow log disablement** | Activity Logs | Monitor: Microsoft.Network/networkWatchers/flowLogs/delete | Alert on log deletion attempts |

| **Alert exists for VNet or Subnet changes** | Activity Logs | Monitor: Microsoft.Network/virtualNetworks/write | Alert on VNet modifications |

| **Alert exists for Route Table updates** | Activity Logs | Monitor: Microsoft.Network/routeTables/write | Alert triggered when routes are modified |

Check	💻 Tool	Command / Insight	Expected Result
Alert exists for unauthorized Azure API calls (401/403 events)	Azure Monitor / Log Analytics	Query: `AzureDiagnostics	where ResultType == "403"`
Alert exists for portal sign-in without MFA	Azure AD Sign-In Logs	Query: `SigninLogs	where ConditionalAccessStatus == "notApplied"`
Alert exists for use of Privileged (e.g., Global Admin) accounts	Azure AD Roles	Monitor specific roles (e.g., Global Admin, Privileged Role Admin)	Alerts triggered on sign-in or role usage
Alert exists for IAM (RBAC) role assignment changes	Activity Logs	Monitor: Microsoft.Authorization/roleAssignments/write	Alert rule triggers on role modifications
Alert exists for changes to Azure Diagnostic settings	Activity Logs	Monitor: Microsoft.Insights/diagnosticSettings/write	Alert when logging is changed or disabled
Alert exists for Azure AD sign-in failures	Azure AD Sign-In Logs	Query: `SigninLogs	where Status.errorCode != 0`
Alert exists for Key Vault key disable or deletion attempts	Activity Logs	Monitor: Microsoft.KeyVault/vaults/keys/delete or */*disable	Trigger alerts on sensitive key tampering
Alert exists for Storage Account (SAS/token) or policy changes	Activity Logs	Monitor: Microsoft.Storage/storageAccounts/*	Alert when access policies are modified
Alert exists for Azure Policy configuration or assignment changes	Activity Logs	Monitor: Microsoft.Authorization/policyAssignments/*	Changes should trigger an alert
Alert exists for NSG rule modifications	Activity Logs	Monitor: Microsoft.Network/networkSecurityGroups/securityRules/write	Alert when security group rules are modified
Alert exists for Network Watcher flow log disablement	Activity Logs	Monitor: Microsoft.Network/networkWatchers/flowLogs/delete	Alert on log deletion attempts
Alert exists for VNet or Subnet changes	Activity Logs	Monitor: Microsoft.Network/virtualNetworks/write	Alert on VNet modifications
Alert exists for Route Table updates	Activity Logs	Monitor: Microsoft.Network/routeTables/write	Alert triggered when routes are modified

Check	Tool	Command	Expected Result
Ensure Activity Logs are enabled for all subscriptions	Azure CLI	az monitor activity-log list --max-events 1	Recent activity logs are returned
Ensure Diagnostic Settings are configured on key resources	Azure CLI	az monitor diagnostic-settings list --resource <resource-id>	Log destinations like Log Analytics or Storage are set
Ensure log Storage Accounts are private	Azure CLI	az storage account show --name <storage-name> --query networkRuleSet	Public access disabled and firewall or private endpoint used
Enable immutable storage (WORM) on log storage	Azure CLI	az storage container immutability-policy show --account-name <name> --container-name <log-container>	Immutability policy is set and locked
Use CMKs to encrypt logs	Azure CLI	az monitor log-analytics workspace show --workspace-name <name> --query encryption	Customer-managed keys (CMKs) are enabled
Enable key rotation for all logging-related keys	Azure CLI	az keyvault key rotation-policy show --vault-name <vault-name> --name <key-name>	Valid key rotation policy in place (e.g., 90 days)
Enable logging for critical services (VMs, Key Vault, etc.)	Azure CLI	az monitor diagnostic-settings list --resource <resource-id>	Diagnostic settings exist for key services
Enforce diagnostic settings via Azure Policy	Azure CLI	az policy assignment list --query "[?contains(name, 'diagnostic')]"	Diagnostic enforcement policies are listed
Azure Logging & Auditing Security Checks
These checks identify common misconfigurations in Azure's logging
infrastructure that red teams can exploit or blue teams should harden.
📜 Audit and Logging Configuration
Check	🔐 Azure Equivalent
Ensure logging is enabled across all subscriptions	Verify Azure Activity Logs and Diagnostic Settings are enabled for each subscription.
Ensure audit logs are sent to a secure Log Analytics workspace	Confirm Activity Logs, Azure AD logs, and resource logs (e.g., for VMs, Key Vaults) are routed to Log Analytics, Storage Account, or Event Hub using Diagnostic Settings.
Ensure logs are not publicly accessible	Check that any Storage Account used for logging is private and behind private endpoints or firewall rules.
Ensure log integrity	Enable immutable storage (WORM) on log storage and configure Azure Defender for Storage.
Ensure log encryption	Use customer-managed keys (CMKs) with Azure Key Vault to encrypt log storage accounts and Log Analytics workspaces.
Enable key rotation for CMKs	Ensure key rotation is enabled for all CMKs used to encrypt logs via Key Vault.
Enable logging on critical services	Enable resource-specific logs (e.g., for Key Vault, Storage, VMs, App Services, Cosmos DB) via Diagnostic Settings.
Enable Azure Policy enforcement	Use built-in Azure Policy definitions to enforce diagnostic logging across services.
🧪 Pentesting Angle
Red teams should:
Check if logging is disabled or misconfigured across services.
Attempt deletion of logs from improperly secured storage.
Test if sensitive operations (e.g., role assignments, key access) are logged.
Try to identify gaps in log coverage (e.g., no logs for VMs or SQL).
Security Operations

Monitoring, Detection, and Response
Focus: Continuously monitor security posture, detect threats, and respond to incidents.
Zero Trust Principles: Continuous monitoring, threat intelligence, and automated response.
Defense in Depth: Security Information and Event Management (SIEM), threat intelligence, and incident response plans.
Azure Resources: Azure Security Center, Azure Sentinel, Microsoft Defender for Cloud.
Security Controls:
Security Information and Event Management (SIEM): Azure Sentinel for collecting and analysing security logs.
Threat Intelligence: Integrate threat intelligence feeds to identify known threats.
Security Monitoring: Azure Security Center, Azure Monitor for monitoring security events.
Incident Response: Develop and regularly test incident response plans.
Vulnerability Management: Regularly scan for vulnerabilities and prioritize remediation.
Security Audits: Perform regular security audits to assess the effectiveness of security controls.
Automation: Automate security tasks such as patching, vulnerability scanning, and incident response.
Alerts and Reporting: Configure alerts for critical security events and generate comprehensive reports.
Incident Response Plan: Develop a plan to respond effectively to security incidents.
Monitoring: Continuously monitor user activity and network traffic for suspicious behavior.
Vulnerability Management: Conduct regular vulnerability assessments and apply patches.
Patch Management: Keep systems and applications up-to-date with the latest security patches.

Threat Protection and Monitoring
Azure Security Center: Use Azure Security Center for continuous security monitoring and threat detection.
Azure Monitor: Implement logging and monitoring to detect and respond to security incidents.
Automated Responses: Set up automated responses to common threats using Azure Logic Apps and Azure Security Center.
Threat Detection and Response: Implement monitoring, detection, and response mechanisms.



**🧪 Pentesting Angle**



Red teams should:



- Check if logging is disabled or misconfigured across services.

- Attempt deletion of logs from improperly secured storage.

- Test if sensitive operations (e.g., role assignments, key access) are logged.

- Try to identify gaps in log coverage (e.g., no logs for VMs or SQL).
