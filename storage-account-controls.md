# Storage Account

Security Ranking (Most Secure → Least Secure)

Private Link (Best, Most Secure)
Provides private connectivity from your VNet to the Storage Account.
Eliminates exposure to the public internet.
Supports granular access control and integration with Azure AD.
Flexible for enterprise-grade workloads requiring compliance and isolation.
Service Endpoints with Network Rules
Restricts access to trusted VNets and IP ranges.
Still uses the public endpoint but enforces firewall rules.
Easier to configure than Private Link, but less isolated.
Public Endpoint with Restricted Access (Conditional)
Public endpoint enabled but restricted via firewall/IP rules.
Useful for scenarios where global access is required but must be tightly controlled.
Higher risk compared to Private Link or Service Endpoints.
Unrestricted Public Access (Least Secure, Avoid)
Anyone can access blobs if anonymous/public access is enabled.
Susceptible to reconnaissance, brute force, and exploitation.
Should be disabled in all production environments.
Cyber Kill Chain: Azure Storage Account Attack (Without Private Link)

Reconnaissance
Attacker scans for exposed storage endpoints (Shodan, Censys).
Enumerates DNS subdomains (<storage-account>.blob.core.windows.net).
Searches for leaked credentials or keys in public sources.
Weaponization
Brute-forces storage account names.
Crafts phishing campaigns to steal credentials.
Builds automated enumeration scripts (Azure CLI, Storage Explorer).
Delivery
Attempts anonymous access if public blobs are enabled.
Uses stolen credentials to access containers, tables, queues.
Uploads malware into blob containers for execution by linked services.
Exploitation
Exfiltrates sensitive data (logs, backups, customer records).
Injects malicious scripts into hosted files.
Uploads ransomware payloads.
Installation
Creates SAS tokens or regenerates keys for persistence.
Deploys exfiltration scripts for continuous data theft.
Installs web shells if linked to applications.
Command & Control (C2)
Uses blobs as communication channels with compromised hosts.
Uploads command files for infected systems to poll.
Actions on Objectives
Data Theft: Extracts sensitive files.
Data Corruption: Deletes or modifies blobs.
Ransomware: Encrypts blobs and demands payment.
Pivoting: Uses logs to identify further internal targets.
Prevention & Best Practices

✅ Use Private Link – Enforce VNet-only access, removing public exposure.
✅ Disable Public Access – Block anonymous/public access at the account level.
✅ Implement Managed Identities – Replace keys with Azure AD authentication.
✅ Enforce Network Rules – Apply firewalls, trusted IP ranges, and service endpoints.
✅ Monitor & Alert – Enable Azure Monitor, Defender for Storage, and Sentinel.
✅ Rotate Keys & Tokens – Regularly update SAS tokens and access keys.
✅ Least Privilege Access – Apply RBAC roles instead of shared keys.
✅ Data Encryption – Ensure encryption at rest (Azure-managed keys or CMK).
✅ Threat Detection – Enable advanced threat protection for anomaly detection.

Final Takeaway

Best Practice: Always use Private Link + Managed Identities + Network Rules.
Avoid: Public endpoints with anonymous access.
Balance: Service Endpoints can be acceptable for less sensitive workloads but still require strict firewall rules.
 

 