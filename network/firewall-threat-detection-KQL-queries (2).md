Azure Firewall IDS Logs with KQL
Azure Diagnostics 
| where ResourceType == “AZUREFIREWALLS” 
| where OperationName == “AzureFirewallIDSLog”
