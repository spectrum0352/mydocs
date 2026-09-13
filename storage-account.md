# Introduction

Azure Storage Account is an **object storage service** used to store **files, messages, tables, and other types of information**. All stored data is automatically **encrypted** by the service.

## Types of Azure Storage

1.  **Blob (Container) Storage** - A **scalable object store** for text and binary data (e.g., images, videos, backups).

2.  **File Storage** - Cloud-based **managed file shares**, accessible like a traditional file server.

3.  **Queue Storage** - A **messaging store** for reliable message delivery between applications.

4.  **Table Storage** - A **NoSQL data store** for structured data with **key/attribute storage**.

5.  **Azure Disk Storage** - Provides **high-performance SSD or HDD** storage for virtual machines.

## Storage Account Tiers

1.  **Standard Tier** - Backed by **HDD**, provides the lowest cost per GB, ideal for **infrequently accessed** data and bulk storage.

2.  **Premium Tier** - Backed by **SSD**, offers **low latency**, optimized for **high-performance workloads** (e.g., VM disks).

## Storage Management Tasks

- Configure **Azure AD authentication** for Azure Storage and Azure Files.

- Manage **access keys** and enforce **delegated access**.

- Use **Azure Storage Explorer** and **AZCopy** for data transfer.

- Implement **Azure Storage replication and Blob object replication**.

- Configure **storage tiers and Blob lifecycle management**.

- Set up **Azure File Sync** to synchronize on-premises and cloud file shares.

**Big Data & Analytics Integration**

- **Azure Synapse Analytics** - Enterprise data warehouse for large-scale analytics.

- **Azure HDInsight** - Managed **Hadoop clusters** for processing massive data.

- **Azure Databricks** - Apache Spark-based analytics platform for **big data workloads**.

## Summary

Azure Storage Accounts provide a **secure, scalable, and flexible** storage solution for different data types. By implementing **strong security controls, access management, and monitoring**, you can ensure **data protection, compliance, and high availability**.

# Zero-trust and Defense in Depth

To secure an **Azure Storage Account**, you must implement **Zero Trust** principles alongside a **Defense in Depth** approach. These strategies **complement** each other by enforcing **least privilege access**, **strong network security**, **robust encryption**, and **continuous monitoring** to mitigate risks.

## Identity & Access Management (IAM)

✅ **Use Microsoft Entra ID** RBAC to enforce **least privilege access** for users and applications.\
✅ **Disable Shared Key Authorization** to enforce **identity-based authentication** via Azure AD.\
✅ **Use Multi-Factor Authentication (MFA)** to add an additional security layer for privileged users.\
✅ **Implement Conditional Access Policies** to restrict storage access based on risk level, device, or geographic location.\
✅ **Use Just-in-Time (JIT) access** for temporary privileged access to storage resources.

## Network Security & Access Restrictions

✅ **Disable Public Network Access** to prevent unauthorized external access.\
✅ **Use Private Endpoints (Azure Private Link)** to limit access to trusted virtual networks.\
✅ **Restrict access using Network Security Groups (NSGs)** to allow traffic only from specific subnets or IP ranges.\
✅ **Use Azure Firewall** to filter and inspect inbound and outbound traffic to the storage account.\
✅ **Leverage Virtual Network (VNet) Integration** to enable **service endpoints** for secure data transfer.

## Data Protection & Encryption

✅ **Enable Storage Service Encryption (SSE) with Customer-Managed Keys (CMK)** using **Azure Key Vault**.\
✅ **Enforce Double Encryption** to add an additional layer of security for highly sensitive data.\
✅ **Use Immutable Storage & Soft Delete** to prevent accidental or malicious data deletion.\
✅ **Enable Secure Transfer (HTTPS-only)** to encrypt data in transit and block unsecured connections.\
✅ **Restrict storage account SKUs** to align with security and compliance policies.

## Threat Detection & Continuous Monitoring

✅ **Enable Microsoft Defender for Storage** to detect **malware, unauthorized access, and data exfiltration**.\
✅ **Use Azure Monitor & Log Analytics** to track storage activity and detect anomalies.\
✅ **Implement Azure Sentinel for SIEM** to **correlate threats** and respond to security incidents.\
✅ **Configure Audit Logs** to capture **read, write, and delete operations** for compliance and forensic analysis.

## Secure Access for Applications & Temporary Access

✅ **Use Managed Identities** instead of storing credentials in code for application authentication.\
✅ **Use Shared Access Signatures (SAS) with strict expiration times** for temporary access to storage resources.\
✅ **Implement User Delegation SAS** (instead of Account SAS) to enforce **Azure AD authentication** for Blob Storage.

## Summary

By combining **Zero Trust principles** and **Defense in Depth**, you ensure **multi-layered protection** for Azure Storage Accounts. These best practices help **prevent unauthorized access, encrypt data, and detect threats proactively** while ensuring **compliance and governance**.

This **single approach** integrates **identity management, network security, encryption, threat monitoring, and access controls** to **minimize attack surfaces and secure your Azure Storage environment**.

# IAM

## Access Keys

- Access keys authenticate application requests to the storage account.

- Two keys are always present: **Key1** and **Key2**.

- Storage account access keys function like **root passwords**.

- Avoid distributing access keys to unauthorized users, hardcoding them, or storing them in plaintext.

- Microsoft recommends using **Azure AD** to authorize requests against Blob and Queue data instead of access keys.

- Key rotation should be managed via **Azure Key Vault** instead of manual rotation.

- **Key expiration policy** allows setting reminders for key rotation.

### Managing Access Keys Securely

1\. Using Azure Key Vault for Access Key Management

**Set required variables:**

\$resourcegroup = "cloud-shell-storage-centralindia"

\$storageaccountname = "csg1003200198c243a8"

\$storageaccountkey = "key1"

\$keyvault = "demokv25022022"

\$kvserviceprincipalappid = "cfa8b339-82a2-471a-a3c9-0fc0be7a4093"

\$userid = (Get-AzContext).Account.Id

\$storageaccount = Get-AzStorageAccount –ResourceGroupName \$resourcegroup –StorageAccountName \$storageaccountname

2\. Provide Key Vault Access to Storage Account Using Azure RBAC

New-AzRoleAssignment -ApplicationId \$kvserviceprincipalappid -RoleDefinitionName 'Storage Account Key Operator Service Role' -Scope \$storageaccount.Id

3\. Configure Key Vault Access Policy

Grant necessary permissions to the user account:

Set-AzKeyVaultAccessPolicy -VaultName \$keyvault -UserPrincipalName \$userid -PermissionsToStorage get, list, delete, set, update, regeneratekey, getsas, listsas, deletesas, setsas, recover, backup, restore, purge

4\. Add Managed Storage Account to Key Vault

Add-AzKeyVaultManagedStorageAccount -VaultName \$keyvault -AccountName \$storageaccountname -AccountResourceId \$storageaccount.Id -ActiveKeyName \$storageaccountkey –DisableAutoRegenerateKey

5\. Regenerate Access Keys Automatically

Define a regeneration period (e.g., 3 days):

\$regenPeriod = \[System.Timespan\]::FromDays(3)

Add-AzKeyVaultManagedStorageAccount -VaultName 'demokv25022022' -AccountName 'csg1003200198c243a8' -AccountResourceId /subscriptions/b992b49c-4532-41fc-977e-4f1e3d551c74/resourceGroups/cloud-shell-storage-centralindia/providers/Microsoft.Storage/storageAccounts/csg1003200198c243a8 -ActiveKeyName 'key1' -RegenerationPeriod \$regenPeriod

Key Expiration Policy Configuration

Enable key expiration reminder using the following command:

Set-AzStorageAccount -ResourceGroupName cloud-shell-storage-centralindia -StorageAccountName csg1003200198c243a8 -KeyExpirationPeriodInDay 1

### Permissions Required to View Access Keys

Roles required to view access keys:

- **Service Administrator**

- **Owner**

- **Contributor**

- **Storage Account Key Operator Service Role**

- Must be assigned to a role that includes **Microsoft.Storage/storageAccounts/listkeys/action**.

### Best Practices

1.  **Use Azure AD for authentication** instead of access keys when possible.

2.  **Store and rotate access keys securely** using Azure Key Vault.

3.  **Limit access to storage account keys** by assigning only necessary permissions.

4.  **Monitor and audit key usage** using Azure Security Center and logs.

5.  **Enforce key expiration policies** to ensure regular rotation.

**References**

- Microsoft Documentation: [Manage Storage Account Keys](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-keys-manage?tabs=azure-portal#regenerate-access-keys)

### Securing Storage Accounts: Prevent Shared Key Access

To improve security, **Shared Key authorization should be disabled** where possible.

**Steps to Disable Shared Key Access:**

1.  Detect access keys used by client applications before making changes.

2.  Navigate to **Azure Portal** → Storage Account → **Settings** → **Configuration**.

3.  Set **"Allow storage account key access"** to **Disabled**.

4.  Click **Save**.

Reference: [Microsoft Docs](https://docs.microsoft.com/en-us/azure/key-vault/secrets/overview-storage-keys-powershell)

## Manage life cycle for access keys of storage accounts

- Azure provides two access keys for your storage account.

- Access keys are used for Shared Key authorization or creating SAS tokens.

- Use Azure Key Vault for key management and rotation. Do not store access keys in plain text.

- Rotate keys regularly to minimize security risks. Key Vault simplifies rotation without app interruptions

- Use SAS tokens for controlled access when Microsoft Entra authorization isn't feasible.

 

**What permissions required to read access keys?**

Need roles which have permission Microsoft.Storage/storageAccounts/listkeys/action

 

**What built-in azure roles have permission to read access keys?**

- Reader and Data Access role

- Storage Account Contributor

- Storage Account Key Operator Service Role

 

 

**Rotate Access keys**

Microsoft recommends periodically rotating access keys for storage accounts to enhance security. Azure Key Vault is the preferred method for managing access keys, but if not using Key Vault, manual rotation is required. Two access keys are provided to ensure uninterrupted access during rotation. To manually rotate access keys in the Azure portal:

1.  Update application code to use the secondary access key.

2.  Navigate to the storage account in the Azure portal.

3.  Under Security + networking, select Access keys.

4.  Regenerate the primary access key and update application code accordingly.

5.  Repeat the process to regenerate and update the secondary access key.

 

**What permission is required to rotate access keys?**

Microsoft.Storage/storageAccounts/regeneratekey/action

 

**What azure roles are required to regenerate access keys of storage account?**

Owner

Contributor

Storage account key operator service

 

## Access key expiry policy

- Key rotation frequency: 90 days

- Key management practices: use key vault to store and manage keys, avoid hard coding of access keys in code or configuration.

- Access key expiry notification: 7 days before expiry

- Key regeneration process: Update app code with secondary access key, rotate primary key, update app code with primary key then rotate secondary access key.

- Audit and monitoring:

  - enable azure monitor logs for storage accounts.

  - Regularly review audit logs to detect unauthorized access attempts or key usage anomalies.

  - Implement alerting mechanisms for key-related security events.

- Key revocation: In case if key is compromised then revoke compromised access key, and update application with new key.

 

 

## Shared Access Signatures

A Shared Access Signature (SAS) provides a secure way to share Azure Storage resources without compromising your account keys. It is a URI that grants restricted access rights to Azure Storage resources for a defined period.

**Key Features:**

- Allows secure access delegation to storage resources without exposing account keys.

- Grants temporary, restricted access to Azure Storage resources (blob, file, queue, table).

- Can be account-level SAS or service-level SAS.

- Stored access policies are **not** supported for account-level SAS.

- Supports granular permissions to control access.

SAS Management with Azure Key Vault

- SAS tokens can be managed via **Azure Key Vault**.

- Microsoft recommends using **Azure AD authentication** instead of account keys or SAS where possible.

- Reference: [Microsoft Docs](https://docs.microsoft.com/en-us/azure/storage/common/authorize-data-access?toc=/azure/storage/blobs/toc.json)

Summary

- **SAS ensures secure access to storage resources** without exposing sensitive credentials.

- **Use Azure Key Vault** to manage SAS securely.

- **Disable Shared Key Access** to enhance security and prevent unauthorized use of account keys.

## Microsoft Entra

Microsoft Entra ID provides secure authentication and access control for **Azure Storage Accounts**, eliminating the need for **Shared Keys** or **SAS tokens**.

How to Use Microsoft Entra ID for Storage Access?

1.  **Assign RBAC Roles**:

    - Grant users **built-in or custom roles** with the required permissions to access blob, queue, file, or table storage.

    - Example roles:

      - **Storage Blob Data Reader** (Read-only access to blobs)

      - **Storage Blob Data Contributor** (Read/write access to blobs)

      - **Storage Blob Data Owner** (Full control over blobs)

2.  **Access Blob Data Using Microsoft Entra**:

    - Users authenticate via **Microsoft Entra ID** instead of using **storage account keys**.

    - Authentication works with **Azure CLI, PowerShell, Azure Portal, and SDKs**.

3.  **Enable Microsoft Entra Authentication for Storage Account**:

    - Navigate to **Azure Portal** → **Storage Account** → **Access Control (IAM)**.

    - Assign roles to **users, groups, or managed identities**.

4.  **Use Managed Identities for Workloads**:

    - Enable **system-assigned or user-assigned managed identities** for VMs, Logic Apps, and applications.

    - Managed identities allow services to access storage **without storing credentials**.

Security Benefits of Microsoft Entra vs. Other Methods

<table style="width:86%;">
<colgroup>
<col style="width: 26%" />
<col style="width: 59%" />
</colgroup>
<thead>
<tr>
<th><strong>Authentication Method</strong></th>
<th><strong>Security Considerations</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>Microsoft Entra ID</strong></td>
<td><p>✅ No access keys needed, reducing credential exposure.</p>
<p>✅ Supports <strong>RBAC</strong> for fine-grained control.</p>
<p>✅ Works with <strong>Conditional Access &amp; MFA</strong>.</p>
<p>✅ Can be integrated with <strong>Managed Identities</strong>.</p>
<p>✅ Logs access via <strong>Microsoft Entra logs</strong>.</p></td>
</tr>
<tr>
<td><strong>Storage Account Keys</strong></td>
<td><p>❌ Full control if compromised.</p>
<p>❌ Hard to manage securely.</p>
<p>❌ Cannot restrict access to specific operations.</p></td>
</tr>
<tr>
<td><strong>Shared Access Signatures (SAS)</strong></td>
<td><p>✅ Provides temporary, restricted access.</p>
<p>❌ Can be misconfigured for <strong>overly broad permissions</strong>.</p>
<p>❌ Needs to be <strong>explicitly revoked</strong> if leaked.</p></td>
</tr>
<tr>
<td><strong>Anonymous Access</strong></td>
<td><p>❌ Major security risk.</p>
<p>❌ Anyone with the link can access the data.</p></td>
</tr>
</tbody>
</table>

**Summary**

- **Microsoft Entra ID (Azure AD) improves security** by removing **static credentials** like storage keys and SAS tokens.

- **RBAC ensures least-privilege access** to storage resources.

- **Conditional Access, MFA, and Managed Identities** enhance security.

- **Audit logs and monitoring help track access attempts**.

## Anonymous Public Read Access

**Risk of Anonymous Public Read Access**

- Allows **unauthenticated** users to access blobs and containers.

- Convenient for public sharing but introduces **data exposure risks**.

- Misconfigurations may lead to **data leaks or unauthorized access**.

**How to Disable Anonymous Public Read Access**

1.  Go to **Azure Portal** → **Storage Account**

2.  Navigate to **Settings** → **Configuration**

3.  Set **"Allow Blob public access"** to **Disabled**

4.  Click **Save**

**Reference**

- [Microsoft Docs: Prevent Anonymous Read Access](https://docs.microsoft.com/en-us/azure/storage/blobs/anonymous-read-access-prevent)

## Methods to access data in blobs/containers

There are several methods to access data in blobs and containers of an Azure storage account:

1.  **Azure Portal:**

    - **Microsoft Entra Account (Recommended): This is the more secure approach and requires specific Azure RBAC roles for both file data access and storage account resource navigation.**

    - **Storage Account Access Key (Less Secure): This method requires an Azure RBAC role with permission to access the storage account access key.**

2.  **Azure SDKs:**

    - **Azure provides SDKs for various programming languages (.NET, Java, Python, etc.) that allow programmatic access to your storage account. These SDKs can be integrated with the Azure Identity client library to acquire OAuth 2.0 tokens for secure authorization through Microsoft Entra ID.**

3.  **Azure PowerShell or Azure CLI:**

    - **For command-line access, you can use Azure PowerShell or Azure CLI. These tools also leverage Azure RBAC for authorization.**

4.  **Shared Access Signatures (SAS):**

    - **SAS tokens grant temporary access to specific blobs or containers within your storage account. You can define the permissions (read, write, etc.) and expiry time for these tokens.**

5.  **Azure Storage REST API:**

    - **Developers can directly interact with the Azure Storage REST API for programmatic access. This method also requires proper authentication and authorization mechanisms.**

- **Additional Considerations:**

  - **Security:** It's highly recommended to prioritize using Microsoft Entra account access for improved security. Storage account access keys should be avoided unless absolutely necessary.

  - **Authorization:** Regardless of the access method, ensure you have the appropriate Azure RBAC roles assigned to grant you the necessary permissions for accessing data in your storage account.

  - **Development Tools:** The Azure Identity client library simplifies acquiring tokens for authorization within the Azure SDKs, making development easier.

 

## Methods to access Storage account files shares

Here are the methods to access data in Azure storage account file shares:

- **1. Azure Portal:**

  - Microsoft Entra Account (Recommended): More secure and requires specific Azure RBAC roles for both file data access and storage account resource navigation (e.g., Reader role).

  - Storage Account Access Key (Less Secure): Requires an Azure RBAC role with permission to access the storage account access key (provided by built-in roles like Storage Account Contributor).

- **2. Azure File Share REST API:**

  - Developers can directly interact with the REST API for programmatic access. This method requires proper authentication and authorization mechanisms.

- **3. Azure File Share SMB protocol:**

  - You can mount Azure file shares as network drives on Windows, Linux machines using the SMB protocol. This provides a familiar file system experience for accessing data. Windows/Linux: Use the built-in file explorer/client to connect to the share. Authentication for SMB access can be done through:

    - Azure Active Directory (AAD) authentication: This is the recommended method for improved security. It leverages Microsoft Entra credentials.

    - Storage Account Access Key: Less secure option, similar to the Azure portal access key approach.

- **4. Azure Storage Explorer:**

  - This free, standalone application by Microsoft allows you to browse and manage your Azure storage accounts, including file shares. It supports both Entra account and storage key authentication.

- **5. Azure SDKs:**

  - Programming languages like .NET, Java, Python, etc., have Azure SDKs that enable programmatic access to file shares. These SDKs can integrate with the Azure Identity client library to acquire tokens for secure authorization through Microsoft Entra ID.

- **Security Considerations:**

  - Prioritize using Microsoft Entra account access for enhanced security.

  - Avoid using storage account access keys unless absolutely necessary.

  - Manage Azure RBAC roles carefully to ensure users have only the necessary permissions for accessing data.

- **Choosing the Right Method:**

  - The Azure portal is a good starting point for basic management and exploration.

  - For programmatic access in applications, use Azure SDKs with the Identity library for secure authorization.

  - If you need a familiar file system experience, consider SMB access with AAD authentication.

  - Azure File Share REST API is suitable for advanced development scenarios requiring direct interaction with the service.

 

# Network Security

## Enable secure storage with HTTPS

Importance of Secure Transfer

- **Secure transfer is enabled by default** when creating a storage account.

- Ensures all requests to Azure Storage use **HTTPS**, rejecting insecure (HTTP) connections.

- Microsoft **recommends enabling secure transfer** for all storage accounts to **protect data in transit**.

Key Considerations

- Calls to **Azure Storage REST API** must be made over HTTPS.

- **SMB connections without encryption** will fail if secure transfer is required.

- **Custom domain names do not support HTTPS** in Azure Storage.

- The **secure transfer setting does not apply to TCP-based protocols**, such as NFS 3.0.

How to Enable Secure Transfer?

1.  **Azure Portal** → **Storage Account**

2.  Go to **Security + Networking** → **Configuration**

3.  Set **"Secure transfer required"** to **Enabled**

4.  Click **Save**

**Reference**

- [Microsoft Docs: Require Secure Transfer](https://docs.microsoft.com/en-us/azure/storage/common/storage-require-secure-transfer)

## Disable Public Network Access

Restricting Network Access

To enhance security, **public network access to storage accounts should be disabled**. Instead, use the following methods:

1.  **Virtual Network Rules**

    - Restrict storage account access by defining **virtual network rules**.

    - Only allow connections from **specific Azure Virtual Networks**.

2.  **Virtual Network Service Endpoints**

    - Extend the private network to **Azure Storage**, securing traffic within Azure.

    - Helps **bypass internet exposure** and ensures better security.

3.  **Private Link** (Recommended)

    - Use **Azure Private Link** to establish a **private connection** between the storage account and virtual network.

    - Traffic remains on **Microsoft’s backbone network**, reducing exposure.

**Additional Security Measures**

- **Azure Storage Firewalls**: Restrict access based on IP addresses or virtual networks.

- **Logging & Auditing**: Enable **Azure Monitor** and **Storage Analytics Logs** to track access attempts.

**How to Disable Public Network Access**

1.  **Azure Portal** → **Storage Account**

2.  Navigate to **Security + Networking** → **Networking**

3.  Set **"Public network access"** to **Disabled**

4.  Click **Save**

**Reference**

- [Microsoft Docs: Secure Storage Account Network Access](https://docs.microsoft.com/en-us/azure/storage/common/storage-network-security)

# Data Security

1\. Encryption & Security Controls

- **Storage Account Encryption:**

  - Storage accounts must be **encrypted with BYOK (Bring Your Own Key)** when containing sensitive data like **activity logs**.

  - Use **Customer-Managed Keys (CMK)** to control encryption keys instead of Microsoft-managed keys.

  - Enable **encryption scopes** for **granular encryption control** at the container or blob level.

  - **Double encryption** should be enabled for extra protection of data at rest.

  - Enable **infrastructure encryption** to provide **additional encryption at the physical layer**.

2\. Storage Account Security & Access Control

- **Restrict Storage Account SKUs:**

  - Storage accounts should be limited to **approved SKUs** to ensure compliance with security and performance requirements.

- **Ensure Data Protection Mechanisms:**

  - **Soft Delete:** Enables recovery of accidentally deleted blobs or file shares for a configured retention period.

  - **Blob Versioning:** Keeps track of all blob changes and allows recovery of previous versions.

  - **Immutable Blobs:** Prevents modification or deletion of critical data by enforcing retention policies.

3\. Threat Protection & Monitoring

- **Enable Azure Defender for Storage:**

  - Provides **continuous monitoring** and **threat detection** for **ransomware, malware, and unauthorized access attempts**.

  - Helps identify **anomalous access patterns** and mitigate potential security risks.

4\. Implementation Steps

1.  **Azure Portal** → **Storage Account**

2.  Navigate to **Security + Networking** → **Encryption**

3.  Select **Customer-Managed Keys (CMK)**

4.  Enable **Double Encryption** and **Infrastructure Encryption**

**Reference**

- [Microsoft Docs: Storage Account Encryption](https://docs.microsoft.com/en-us/azure/storage/common/storage-service-encryption)

 

## Data protection in storage account

 

**Recovery**

- Enable Backup: choose backup vault and backup policy

- Enable point in time restore (PITR) for containers: choose maximum restore point (example 30 days ago)

- Enable soft delete for blobs: Keep deleted blobs for (in days)

- Enable soft delete for containers: Keep deleted containers for (in days)

- Enable permanent delete for soft delete

**Tracking**

- Enable versioning of blobs: Use versioning to automatically maintain previous versions of your blobs.

  - Delete versions after (in days)

  - Keep all versions

- Enable blob change feed: Keep track of create, modification, and delete changes to blobs in your account.

  - Delete change feed logs after (in days)

  - Keep all logs

 

 

**Basic Protection for Your Azure Storage Account**

This guide outlines essential steps for safeguarding your Azure storage account data:

1.  **Azure Resource Manager Lock:**

    1.  Apply this lock to prevent accidental deletion or configuration changes to your entire storage account.

    2.  This protects the account itself, but not individual containers or blobs within it.

2.  **Container Soft Delete:**

    1.  Activate this feature for your storage account.

    2.  It allows recovery of accidentally deleted containers and their contents for a set period (configurable, usually 7 days).

3.  **Data Versioning:**

    1.  **Blob Storage:** Enable blob versioning to automatically save a copy of your data whenever a blob is overwritten.

    2.  **Azure Data Lake Storage Gen2 (ADLS Gen2):** Manually take snapshots of your data at specific points in time to capture its state. Versioning isn't available for ADLS Gen2, so snapshots become the alternative.

<!-- -->

4.  These initial steps provide a solid foundation for basic data protection in your Azure storage account.

 

## Double Encryption in Storage Account

- **What is it?**

  - Double encryption provides an extra layer of security for your data stored in Azure Storage.

  - By default, Azure encrypts your data at rest using service-level encryption with a strong algorithm (AES-256).

  - Double encryption adds another layer of encryption at the infrastructure level using a separate key.

- **Why use it?**

  - Double encryption offers additional protection if one of the encryption keys or algorithms is compromised.

  - Even in that scenario, your data remains encrypted with the other layer.

- **How to enable it?**

  - Double encryption can only be enabled during storage account creation or when defining an encryption scope within an existing account.

  - It cannot be enabled later.

- **Key points:**

  - Double encryption uses two different encryption algorithms and keys for stronger security.

  - You can choose between Microsoft-managed keys or customer-managed keys for service-level encryption.

  - Infrastructure-level encryption always uses Microsoft-managed keys.

- **Before you start:**

  - Ensure you create a new storage account or encryption scope configured for infrastructure encryption to enable double encryption.

 

# Threat Detection and Prevention

- **Storage accounts should be migrated to new Azure Resource Manager resources**

- **Deploy Advanced Threat Protection on storage accounts**

- **Microsoft Defender for Storage should be enabled**

# Logging and Monitoring

- **Configure diagnostic settings for storage accounts to Log Analytics workspace**

>  

# Backup and Disaster Recovery

- Configure backup for blobs on storage accounts with a given tag to an existing backup vault in the same region

- Configure blob backup for all storage accounts that do not contain a given tag to a backup vault in the same region

- Geo-redundant storage should be enabled for Storage Accounts

- Storage accounts should prevent cross tenant object replication

- Configure backup for blobs on storage accounts with a given tag to an existing backup vault in the same region

- Configure blob backup for all storage accounts that do not contain a given tag to a backup vault in the same region

- Geo-redundant storage should be enabled for Storage Accounts

- Storage accounts should prevent cross tenant object replication

# Storage Account Attacks

Attackers have exploited **Azure Storage Accounts** using multiple attack paths, primarily targeting **misconfigurations, excessive permissions, exposed access keys, and weak network controls**.

Below are common **attack paths** used by adversaries:

# Attack Paths

## Detailed Attack Paths

Here is a **detailed, step-by-step attack path** for each Azure Storage Account exploitation scenario. Each one follows the **attacker's progression**:

- **Reconnaissance** (Scanning & Discovery)

- **Initial Access** (Gaining Entry)

- **Exploitation** (Manipulating Resources)

- **Persistence & Lateral Movement** (Maintaining Access & Expanding)

- **Exfiltration or Impact** (Stealing Data or Causing Harm)

## Publicly Exposed Storage Accounts

### Attack Path

1.  **Misconfiguration:** Storage account is set to "public access" (Blob containers or File Shares).

2.  **Discovery:** Attackers scan Azure IP ranges or use tools like **Shodan** to find exposed endpoints.

3.  **Exfiltration:** Download sensitive data such as PII, financial records, or credentials.

4.  **Persistence:** Upload malicious payloads (e.g., scripts, malware) if write permissions exist.

### Example Case:

- **ChaosDB Attack (2021)**: Publicly exposed Jupyter Notebooks in Cosmos DB were exploited to gain full account access.

### Mitigation:

- Disable **public access** unless necessary.

- Implement **Azure Private Endpoints** for secure access.

- Use **Azure Storage Firewalls** and **VNET Integration**.

## Publicly Exposed Storage Accounts

**🔴 Attack Path**

**🔍 Step 1: Reconnaissance**

- The attacker scans **Azure Storage endpoints** using tools like **Shodan** or **Axiom** to find public access blobs.

- They identify storage accounts using **brute-force enumeration** or leaked names from repositories.

**🎯 Step 2: Initial Access**

- The attacker **directly accesses** the exposed blobs or file shares (if public access is enabled).

- They **list containers** (https://example.blob.core.windows.net/?comp=list) to check for sensitive files.

**💥 Step 3: Exploitation**

- If **write access** is enabled, the attacker **uploads malicious scripts, web shells, or phishing payloads**.

- If **read access** is allowed, they **download sensitive data** (e.g., credentials, source code, PII).

**🔁 Step 4: Persistence & Lateral Movement**

- The attacker **creates additional files** to maintain access or **poison legitimate files** for future execution.

- They may look for **authentication secrets** to pivot into Azure services (e.g., Managed Identity abuse).

**🚨 Step 5: Exfiltration & Impact**

- The attacker **downloads terabytes of sensitive data** (e.g., customer details, financial records).

- They may **sell the data** on dark web forums or **encrypt files** (ransomware attack).

**🛑 Mitigation**

✅ Disable **public access** unless absolutely necessary.\
✅ Use **Azure Private Endpoints** to restrict traffic.\
✅ Enable **Storage Firewalls & VNET Integration**.

## Stolen or Leaked Access Keys

### Attack Path

1.  **Exposed Secrets:** Attackers find Storage Account keys in **GitHub, logs, or exposed code repositories**.

2.  **Lateral Movement:** Use compromised keys to authenticate and access data.

3.  **Privilege Escalation:** If keys have **Owner permissions**, attackers can modify IAM settings, create SAS tokens, and delete logs.

### Example Case:

- **Tesla’s Kubernetes Hack (2018)**: Storage access keys were hardcoded in a public GitHub repository, allowing attackers to exfiltrate data and deploy crypto miners.

**Tesla’s Kubernetes Hack (2018): A Full Breakdown**

**Overview of the Incident**

In February 2018, security researchers from **RedLock** discovered that **Tesla’s Kubernetes console** was exposed to the internet without authentication. This exposed console contained **hardcoded AWS S3 access keys** in a publicly accessible GitHub repository, which attackers exploited to:

- **Access Tesla’s cloud storage** (AWS S3 buckets).

- **Exfiltrate sensitive data** related to Tesla’s internal operations.

- **Deploy cryptocurrency mining software** on Tesla’s AWS infrastructure.

**Discovery of the Breach**

The attack was identified by **RedLock’s Cloud Security Intelligence team**, who were scanning the internet for **misconfigured Kubernetes dashboards**. During this process, they discovered that **Tesla’s Kubernetes administration console** was accessible **without authentication**.

Upon further investigation, the team found that **AWS S3 storage credentials were hardcoded in Tesla’s Kubernetes container images**, which were publicly exposed in a GitHub repository. This gave attackers full access to Tesla’s AWS environment.

**How Attackers Exploited the Vulnerability**

1.  **Public Exposure of Tesla’s Kubernetes Dashboard**

    - Tesla's Kubernetes dashboard was left **unsecured and accessible to anyone** on the internet.

    - Attackers scanned for **open Kubernetes dashboards** and found Tesla’s instance.

2.  **Hardcoded AWS Access Keys Found**

    - Within the exposed Kubernetes environment, **AWS S3 storage credentials were hardcoded** inside one of the container images.

    - These credentials provided direct access to **Tesla’s S3 storage**, which may have contained sensitive internal data.

3.  **Deployment of Cryptocurrency Mining Software**

    - Instead of immediately exfiltrating large amounts of data, the attackers deployed **crypto mining malware** inside Tesla’s Kubernetes pods.

    - This allowed them to mine **Monero (XMR)** using Tesla’s cloud compute resources.

    - To evade detection, the miners connected to **non-standard mining pools** and used **custom scripts** to prevent monitoring tools from flagging excessive CPU usage.

**Impact of the Attack**

- **Financial Loss**: Tesla incurred costs from unauthorized compute usage due to the cryptocurrency mining operation.

- **Potential Data Exposure**: Attackers had access to Tesla’s AWS environment, increasing the risk of intellectual property theft.

- **Security Risks**: Misconfigurations in Tesla’s cloud infrastructure highlighted weaknesses in their **DevOps security practices**.

**Tesla’s Response**

- The issue was **quickly remediated** after RedLock disclosed it to Tesla.

- Tesla **revoked the exposed AWS credentials** and **secured their Kubernetes console**.

- The company stated that **no customer data was compromised** in the breach.

**Lessons Learned & Security Best Practices**

1.  **Secure Kubernetes Consoles**

    - Always enable **authentication & authorization** for Kubernetes dashboards.

    - Restrict public access to **internal Kubernetes services**.

2.  **Avoid Hardcoding Credentials**

    - Use **environment variables or secret management tools** (e.g., AWS Secrets Manager, HashiCorp Vault).

    - Scan code repositories for **exposed credentials** using tools like **TruffleHog** or **GitGuardian**.

3.  **Monitor Cloud Workloads for Anomalies**

    - Use **Cloud Security Posture Management (CSPM)** solutions like **Microsoft Defender for Cloud**.

    - Deploy **Intrusion Detection Systems (IDS)** to detect unauthorized crypto mining activity.

4.  **Implement Least Privilege Access**

    - Limit AWS access keys to **only necessary permissions**.

    - Rotate and expire credentials periodically.

**References & Sources**

- **RedLock’s Original Report**: [RedLock Blog](https://blog.redlock.io/) (Note: The original RedLock blog is now part of Palo Alto Networks)

- **News Coverage:**

  - [Wired](https://www.wired.com/story/tesla-cloud-hack-cryptojacking/)

  - [ZDNet](https://www.zdnet.com/article/tesla-cloud-account-hacked-to-run-cryptocurrency-mining-malware/)

  - [Bloomberg](https://www.bloomberg.com/news/articles/2018-02-20/tesla-cloud-was-used-by-hackers-to-mine-cryptocurrency)

Would you like insights on how Azure security tools (like Microsoft Defender for Cloud) can help prevent such attacks?

### Mitigation:

- Use **Azure Key Vault** to store secrets securely.

- Enable **Azure Storage Account Key Rotation**.

- Monitor access with **Azure Security Center & Defender for Storage**.

## Stolen or Leaked Access Keys

**🔴 Attack Path**

**🔍 Step 1: Reconnaissance**

- The attacker **scrapes GitHub, CI/CD logs, or code repositories** for **hardcoded storage account keys**.

- They search for .env, config.json, or PowerShell scripts containing access keys.

**🎯 Step 2: Initial Access**

- The attacker **authenticates using the stolen storage account key** via the Azure REST API.

- They check the **permissions of the key** (Read, Write, Delete, List, Full Control).

**💥 Step 3: Exploitation**

- If **Owner-level keys** are found, they **modify IAM roles**, create **new SAS tokens**, or change **storage configurations**.

- If **Write access** exists, they **delete or encrypt files** (ransomware attack).

**🔁 Step 4: Persistence & Lateral Movement**

- They generate a **new access key** or use an **Azure Function** to create backdoor storage containers.

- The attacker **spreads laterally** by enumerating **other linked Azure services** (e.g., virtual machines, databases).

**🚨 Step 5: Exfiltration & Impact**

- The attacker **downloads all sensitive files** before **wiping logs**.

- They **delete the entire storage account** (disrupting operations) or **exfiltrate terabytes of data**.

**🛑 Mitigation**

✅ Store access keys in **Azure Key Vault** (not hardcoded).\
✅ Rotate **storage account keys** frequently.\
✅ Enable **Azure Security Center** to detect leaked secrets.

## Exploiting Shared Access Signatures (SAS) Tokens

### Attack Path

1.  **Overly Permissive SAS:** SAS tokens are shared with excessive permissions (e.g., full write access).

2.  **Token Hijacking:** Attackers capture SAS tokens via logs, phishing, or exposed files.

3.  **Data Manipulation:** Malicious actors modify, delete, or upload malicious files.

### Example Case:

- Attackers hijacked **SAS tokens** embedded in web applications, allowing them to write data to victim storage accounts.

### Mitigation:

- Set **short-lived SAS tokens** with **least privilege** access.

- Restrict SAS tokens using **IP whitelisting and expiration policies**.

- Monitor SAS token usage with **Azure Storage Analytics**.

## Exploiting Shared Access Signatures (SAS) Tokens

**🔴 Attack Path**

**🔍 Step 1: Reconnaissance**

- The attacker **searches for SAS tokens in logs, application responses, and browser storage**.

- They **enumerate SAS tokens** from JavaScript files in web applications.

**🎯 Step 2: Initial Access**

- The attacker **uses a captured SAS token** to access the target storage account.

- If **the token has excessive privileges**, they list and modify files.

**💥 Step 3: Exploitation**

- If **Write permissions** exist, they upload malicious files (e.g., malware-infected PDFs).

- If **Delete permissions** exist, they remove critical data (DoS attack).

**🔁 Step 4: Persistence & Lateral Movement**

- Attackers use **long-lived SAS tokens** to retain access to the storage account.

- They may generate **new tokens** if they have **SAS management permissions**.

**🚨 Step 5: Exfiltration & Impact**

- The attacker downloads **sensitive files** and **sells them on dark web markets**.

- If **write access is available**, they deploy **ransomware or phishing payloads**.

**🛑 Mitigation**

✅ Set **short-lived SAS tokens** with minimal permissions.\
✅ Restrict SAS usage with **IP whitelisting**.\
✅ Monitor token usage with **Azure Monitor**.

## Misconfigured Cross-Origin Resource Sharing (CORS)

### Attack Path

1.  **Open CORS Policy:** Developers allow \* in CORS settings.

2.  **Malicious Web Page:** Attackers craft JavaScript code to exploit cross-site requests.

3.  **Data Theft:** If authentication cookies or tokens are stored in the browser, attackers can exfiltrate data.

### Example Case:

- Attackers used **open CORS policies** to extract authentication tokens via a victim’s browser session.

### Mitigation:

- Restrict CORS to **specific trusted domains**.

- Do not store **storage keys in the frontend**.

- Use **Azure AD Authentication** instead of **SAS tokens**.

## Exploiting Azure Storage Container Takeover

### Attack Path

1.  **Deleted Storage Account Names Reuse:** Attackers register a **deleted** storage account name.

2.  **DNS Hijacking:** If applications reference the old storage endpoint, attackers **intercept traffic**.

3.  **Data Injection:** Attackers serve malicious content or phishing pages using the hijacked name.

### Example Case:

- Attackers **reclaimed deleted storage account names** and injected malicious scripts into web applications.

### Mitigation:

- **Do not delete** storage accounts if the name is critical.

- Use **Azure Private DNS Zones** to resolve internal names securely.

- Monitor DNS activity for anomalies.

## Ransomware via Azure File Shares

### Attack Path

1.  **Compromised Credentials:** Attackers gain access via leaked **Azure AD accounts or access keys**.

2.  **Mounting File Shares:** Use compromised credentials to mount **Azure Files over SMB/NFS**.

3.  **Encrypting Data:** Deploy ransomware to **encrypt** stored data.

### Example Case:

- Attackers gained access to **Azure File Shares** using stolen **NTLM hashes** and encrypted corporate data.

### Mitigation:

- Enable **Azure Defender for Storage** to detect anomalies.

- Use **RBAC and conditional access** to restrict logins.

- Backup critical files using **Azure Backup**.

## Ransomware via Azure File Shares

**🔴 Attack Path**

**🔍 Step 1: Reconnaissance**

- The attacker gains access to **compromised Azure AD credentials** or **NTLM hashes**.

- They check for **mounted Azure Files over SMB/NFS**.

**🎯 Step 2: Initial Access**

- Using **stolen credentials**, they mount the **Azure File Share** on their system.

- They identify **writeable folders**.

**💥 Step 3: Exploitation**

- The attacker **encrypts all files** using a **custom ransomware script**.

- They delete backups and create a **ransom note** demanding payment.

**🔁 Step 4: Persistence & Lateral Movement**

- The attacker installs **scheduled tasks** or **malicious scripts** to reinfect the system.

- They move laterally to **other storage accounts** using the same compromised credentials.

**🚨 Step 5: Exfiltration & Impact**

- Files are **encrypted**, and **users are locked out** of their data.

- The attacker demands **Bitcoin ransom** in exchange for decryption.

**🛑 Mitigation**

✅ Enable **Azure Defender for Storage** to detect anomalies.\
✅ Implement **RBAC and conditional access** to restrict access.\
✅ Backup storage data using **Azure Backup**.

## Exploiting Managed Identity and Role Misconfigurations

### Attack Path

1.  **Overprivileged Managed Identity:** VM or App Service has excessive permissions to Storage.

2.  **Exploitation:** If an attacker compromises the identity, they gain **Storage Contributor** or **Owner** access.

3.  **Persistence:** Modify storage data, escalate privileges, or delete logs.

### Example Case:

- Attackers exploited **misconfigured Azure Managed Identity** to escalate from a VM to full Storage Account access.

### Mitigation:

- Use **least privilege RBAC roles** for Managed Identities.

- Monitor API calls using **Azure Monitor & Defender for Storage**.

### Conclusion: Key Security Recommendations

✅ **Disable public access** to storage accounts.\
✅ **Use Private Endpoints** to restrict external access.\
✅ **Rotate and store storage keys in Key Vault.**\
✅ **Monitor access logs for anomalies.**\
✅ **Limit SAS tokens** and use IP whitelisting.\
✅ **Enable Azure Defender for Storage** to detect threats.

## Final Security Checklist

☑ **Disable public access** to storage accounts.\
☑ **Use Azure AD Authentication** instead of access keys.\
☑ **Restrict SAS tokens** and use IP whitelisting.\
☑ **Enable logging and alerting** with Azure Monitor.\
☑ **Rotate secrets regularly** using Key Vault.
