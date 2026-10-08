# Security audit on SAP on Azure



2️⃣ What are the findings from security assessment of SAP systems on Azure Cloud?
Q1: What are common Identity \& Access findings?
SAP admin accounts without MFA

Excessive global admin privileges

No Just-In-Time access (PIM not enabled)

Shared service accounts

No password rotation for SAP technical users

Q2: What are network security findings?
SAP application servers exposed to internet

Missing NSGs on DB tier

No micro-segmentation

Lack of Azure Firewall

No Private Endpoint for storage

No DDoS Standard protection

Q3: What are data protection findings?
SAP HANA without encryption at rest

No TDE enabled

Backup not encrypted

No integration with Key Vault

Weak TLS versions

Q4: What OS \& infrastructure findings are common?
Unpatched Linux VMs

No Defender for Servers enabled

No vulnerability assessment

No endpoint detection

No disk encryption

Q5: Monitoring \& logging gaps?
No integration with Microsoft Sentinel

No alerting on privilege escalation

No UEBA analytics

No SAP audit logs centralized



