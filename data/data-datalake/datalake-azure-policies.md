# Azure Policy - Deny Policies for Azure Data Lake Storage Gen2 (ADLS Gen2)

The following **Deny** policies are recommended for **Azure Data Lake Storage Gen2 (ADLS Gen2)** in enterprise environments. These policies enforce security, compliance, and governance by preventing non-compliant storage accounts from being created or modified.

> **Scope:** Azure Storage Accounts with **Hierarchical Namespace (HNS)** enabled (`Microsoft.Storage/storageAccounts`).

---

# 1. Deny Storage Accounts Without Hierarchical Namespace

**Purpose:** Ensure all Data Lake Storage accounts use ADLS Gen2.

**Policy Effect:** `Deny`

### Condition

```text
IF

Microsoft.Storage/storageAccounts/isHnsEnabled == false

THEN

Deny
```

---

# 2. Deny Public Network Access

**Purpose:** Prevent Internet access to Data Lake Storage.

```text
IF

publicNetworkAccess == Enabled

THEN

Deny
```

---

# 3. Deny Storage Accounts Without Private Endpoint

**Purpose:** Require private connectivity.

```text
IF

Private Endpoint Count == 0

THEN

Deny
```

---

# 4. Deny Storage Firewall Disabled

**Purpose:** Require Storage Account firewall.

```text
IF

networkAcls.defaultAction != Deny

THEN

Deny
```

---

# 5. Deny Public Blob Access

**Purpose:** Prevent anonymous blob access.

```text
IF

allowBlobPublicAccess == true

THEN

Deny
```

---

# 6. Deny Shared Key Authorization

**Purpose:** Force Microsoft Entra ID authentication where supported.

```text
IF

allowSharedKeyAccess == true

THEN

Deny
```

---

# 7. Deny Minimum TLS Below 1.2

**Purpose:** Prevent insecure TLS protocols.

```text
IF

minimumTlsVersion != TLS1_2

THEN

Deny
```

---

# 8. Deny Secure Transfer Disabled

**Purpose:** Prevent HTTP access.

```text
IF

supportsHttpsTrafficOnly == false

THEN

Deny
```

---

# 9. Deny Customer-Managed Keys Not Enabled

**Purpose:** Require Customer-Managed Keys (CMK) for regulated workloads.

```text
IF

encryption.keySource != Microsoft.Keyvault

THEN

Deny
```

> Assign this policy only where CMKs are mandated.

---

# 10. Deny Cross-Tenant Replication

```text
IF

allowCrossTenantReplication == true

THEN

Deny
```

---

# 11. Deny Infrastructure Encryption Disabled

```text
IF

requireInfrastructureEncryption == false

THEN

Deny
```

---

# 12. Deny Storage Accounts Without Microsoft Defender Plan

Require Microsoft Defender for Storage to be enabled before production use.

---

# 13. Deny Missing Diagnostic Settings

Require Diagnostic Settings to send logs to:

* Log Analytics
* Event Hub
* Storage Account (if required)

---

# 14. Deny Missing Resource Locks

Require production Storage Accounts to have:

* CanNotDelete
* ReadOnly (where appropriate)

---

# 15. Deny Storage Accounts Outside Approved Regions

Example:

```text
IF

location NOT IN

East US
West Europe
Australia East

THEN

Deny
```

---

# 16. Deny Unsupported Replication Type

Allow only approved redundancy options such as:

* ZRS
* GRS
* RA-GRS
* GZRS
* RA-GZRS

Deny:

* LRS (if prohibited by organizational policy)

---

# 17. Deny Storage Accounts Without Mandatory Tags

Require tags such as:

* Owner
* CostCenter
* Environment
* BusinessUnit
* DataClassification
* Application

---

# 18. Deny Large Anonymous SAS Exposure

Prevent creation of overly permissive SAS policies by denying configurations that allow unrestricted access or excessively long validity periods (implemented through governance processes and Azure Policy where applicable).

---

# 19. Deny Shared Access Expiration Policy Not Configured

Require a Shared Access Signature (SAS) expiration policy to enforce maximum token lifetime.

---

# 20. Deny Local Users (SFTP) Unless Approved

```text
IF

isLocalUserEnabled == true

THEN

Deny
```

Use only if SFTP is not an approved service.

---

# 21. Deny SFTP Enabled

```text
IF

isSftpEnabled == true

THEN

Deny
```

If SFTP is required, scope an exception to approved storage accounts.

---

# 22. Deny NFS v3 Enabled

```text
IF

isNfsV3Enabled == true

THEN

Deny
```

Enable only where specifically approved.

---

# 23. Deny Blob Versioning Disabled

```text
IF

Blob Versioning == Disabled

THEN

Deny
```

---

# 24. Deny Blob Soft Delete Disabled

```text
IF

Blob Soft Delete == Disabled

THEN

Deny
```

---

# 25. Deny Container Soft Delete Disabled

```text
IF

Container Soft Delete == Disabled

THEN

Deny
```

---

# 26. Deny Change Feed Disabled

```text
IF

Change Feed == Disabled

THEN

Deny
```

---

# 27. Deny Immutable Storage Disabled

Require immutable storage (time-based retention or legal hold) for workloads subject to regulatory or ransomware resilience requirements.

---

# 28. Deny Storage Accounts Using HTTP

```text
IF

supportsHttpsTrafficOnly == false

THEN

Deny
```

---

# 29. Deny Default Network Rule = Allow

```text
IF

networkAcls.defaultAction == Allow

THEN

Deny
```

---

# 30. Deny Trusted Microsoft Services Exception

Prevent blanket bypasses by denying configurations where trusted Microsoft services are allowed unless explicitly approved.

```text
IF

networkAcls.bypass CONTAINS AzureServices

THEN

Deny
```

Use cautiously, as some Azure services require this exception.

---

# 31. Deny Shared Access Signature (SAS) Without Expiration Policy

Require a maximum expiration period for all SAS tokens.

---

# 32. Deny Lifecycle Management Not Configured

Require Lifecycle Management rules for production Data Lake Storage accounts.

---

# 33. Deny Production Storage Without Geo-Redundancy

Require one of:

* GRS
* RA-GRS
* GZRS
* RA-GZRS

for production environments where business continuity policies require regional resilience.

---

# 34. Deny Missing Azure Backup Strategy

Require an approved backup and recovery configuration (such as Soft Delete, Versioning, and documented recovery procedures) before production deployment.

---

# 35. Deny Storage Account Without Encryption

```text
IF

Encryption != Enabled

THEN

Deny
```

---

# Enterprise Recommended Deny Baseline

| Category         | Deny Controls                                                                                                                                            |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Identity         | Shared Key Access, Local Users (if not approved)                                                                                                         |
| Networking       | Public Network Access, Default Network Rule = Allow, Missing Private Endpoint, Firewall Disabled, Public Blob Access                                     |
| Encryption       | Secure Transfer Disabled, TLS < 1.2, Missing Encryption, Missing CMK (where required), Infrastructure Encryption Disabled                                |
| Storage Features | Hierarchical Namespace Disabled, Blob Versioning Disabled, Blob Soft Delete Disabled, Container Soft Delete Disabled, Change Feed Disabled               |
| Governance       | Missing Diagnostic Settings, Missing Tags, Missing Resource Locks, Unsupported Regions                                                                   |
| Availability     | Unsupported Replication SKU, Missing Lifecycle Management, Missing Geo-Redundancy (for production)                                                       |
| Data Protection  | Cross-Tenant Replication Enabled, SFTP/NFS Enabled (unless approved), Trusted Microsoft Services Bypass (unless approved), Missing SAS Expiration Policy |

> **Implementation note:** Some controls (for example, requiring Microsoft Defender for Storage, enforcing diagnostic settings, or validating the existence of Private Endpoints) are better implemented using Azure built-in policies with **DeployIfNotExists** or **AuditIfNotExists** effects rather than **Deny**, because Azure Policy cannot always evaluate related resources at creation time. A common enterprise approach is to use **Deny** for immutable security settings (TLS, public access, HNS, Shared Key access, tags, etc.) and **DeployIfNotExists** for dependent resources and configurations.
