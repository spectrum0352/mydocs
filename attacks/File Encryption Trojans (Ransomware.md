File Encryption Trojans (Ransomware)
Malware that encrypts files and demands ransom to restore access.
Azure Context:  
Azure VMs, file shares (Azure Files, Azure NetApp Files), and storage accounts are potential targets.
Mitigations:
Enable Azure Backup and Azure Site Recovery for regular backups.
Use Azure Defender for Storage to detect suspicious activities.
Harden endpoint security on Azure VMs with Microsoft Defender for Endpoint.
Restrict access to storage with RBAC and virtual network service endpoints.