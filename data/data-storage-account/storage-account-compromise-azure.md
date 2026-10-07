# Azure Storage Account

## Why are so many Storage accounts breached?

Here are the key points about why Azure Storage accounts can be breached:

- **Human Errors**:
  - Unintentional public access: Misconfigured permissions or settings can expose data.
  - Incorrectly placed sensitive information: Storing sensitive data in public buckets.
  - Lack of security knowledge: Users may not fully understand security features.
- **Configuration Mistakes**:
  - Exposing data unintentionally: Incorrectly configuring access to storage objects.
  - Uploading sensitive content: Adding sensitive data to publicly accessible containers.

To mitigate risks, follow best practices, enable Microsoft Defender for storage, and regularly assess security.

------------------------------------------------------------------------

**🧨 Azure PenTest: Exploiting Blob Storage (S3 Equivalent)**

**📦 Azure Blob Storage Overview**

Azure Blob Storage is a scalable object storage system for unstructured
data, similar to AWS S3. It supports:

- **Containers** (like buckets)

- **Blobs** (like objects)

- **Public, Private, and SAS URL** access controls

- **Identity-based access via Azure AD** or **Access Keys**

------------------------------------------------------------------------

**Enumeration Techniques**

**🔹 List All Storage Accounts**

az storage account list --query '\[\].{name:name,
resourceGroup:resourceGroup}' -o table

**🔹 List Containers in a Storage Account**

az storage container list --account-name \<storage-account-name\>
--auth-mode login

You may need either Storage Blob Data Reader role or storage account
keys.

**🔹 List Blobs in a Container**

az storage blob list \\

--account-name \<storage-account\> \\

--container-name \<container\> \\

--auth-mode login \\

--output table

------------------------------------------------------------------------

**🔐 Access Control Enumeration**

**🔹 Check Public Access Level**

az storage container show-permission \\

--account-name \<account\> \\

--name \<container\>

**🔹 Get Stored Access Policies**

az storage container policy list \\

--account-name \<account\> \\

--container-name \<container\>

**🔹 Retrieve IAM Role Assignments (if RBAC is used)**

az role assignment list --scope
/subscriptions/\<sub\>/resourceGroups/\<rg\>/providers/Microsoft.Storage/storageAccounts/\<account\>

------------------------------------------------------------------------

**💥 Exploitation & Data Exfiltration**

**🔹 Public Blob Access**

Simply open in browser:

https://\<storage-account\>.blob.core.windows.net/\<container\>/\<blob\>

**🔹 Download Blob (Authenticated)**

az storage blob download \\

--account-name \<storage-account\> \\

--container-name \<container\> \\

--name \<blob-name\> \\

--file \<local-path\> \\

--auth-mode login

**🔹 Exploit Shared Access Signatures (SAS)**

If you obtain a SAS token, you can read/write blobs even without full
credentials:

https://\<account\>.blob.core.windows.net/\<container\>/\<blob\>?\<sas-token\>

SAS tokens may be time-limited or IP-bound.

**🔹 Brute Force Blobs (Misconfigured)**

If directory listing is enabled (rare), enumerate and download:

az storage blob list --account-name \<account\> --container-name
\<container\> --output table

------------------------------------------------------------------------

**🛡️ Key Takeaways**

| **Threat** | **Description** |
|----|----|
| Public Blob Access | Misconfigured containers expose sensitive files |
| Leaked SAS URLs | Allow unauthorized access if not scoped/expired properly |
| Key Exposure | Using storage account keys allows full access |
| IAM Misconfig | Overly permissive roles (Reader → Contributor → escalation) |

------------------------------------------------------------------------

Would you like this turned into a command reference sheet or integrated
into your Azure Pentest playbook?
