# Pass through Authentication

**🔐 Pass-Through Authentication (PTA) in Azure Penetration Testing**

**What It Is:**

- **Credentials are stored only on-premises.**

- An **on-prem agent** forwards authentication requests to the local
  Active Directory and **validates** them on behalf of Azure AD.

- Enables **Single Sign-On (SSO)** to Azure apps **without syncing or
  storing passwords** in the cloud.

------------------------------------------------------------------------

**🎯 How PTA Helps in Azure Penetration Testing**

**✅ 1. On-Prem Compromise = Cloud Access**

- If a pentester compromises on-prem credentials (e.g., via LSASS dump
  or password spray), they can **authenticate to Azure** services even
  though credentials aren’t stored in the cloud.

**✅ 2. Attack the PTA Agent**

- The **PTA agent** is a high-value target. If compromised, it may be
  abused to:

  - **Intercept authentication requests**

  - Impersonate users

  - Potentially relay credentials back to Azure

**✅ 3. Bypass Cloud-Side Logging**

- Since the password **never reaches Azure**, detection and logging on
  the cloud side are limited.

- Ideal for **stealthy authentication** during red team operations.

**✅ 4. Exploit SSO Behavior**

- PTA allows transparent access to services like Office 365.

- If MFA is not enforced, an attacker can achieve **seamless access**
  after credential compromise.

------------------------------------------------------------------------

**🧰 Pentester Workflow Example (PTA Abuse)**

1.  Compromise a domain-joined machine.

2.  Extract credentials using Mimikatz or similar tool.

3.  Attempt Azure login using those credentials.

4.  If PTA is in use and MFA is not enforced → access is granted to
    cloud services like Outlook, Teams, or SharePoint.

------------------------------------------------------------------------

Would you like a detection bypass and persistence technique for
PTA-enabled environments?

<img src="media/image1.png" style="width:8.39239in;height:3.842in" />

Here’s how you can **bypass detection** and establish **persistence** in
**Pass-Through Authentication (PTA)**-enabled Azure environments from a
red team or pentester perspective:

------------------------------------------------------------------------

**🛑 PTA Detection Bypass Techniques**

**🎭 1. Avoid Cloud-Side Logging**

- Since PTA **authenticates on-prem**, Azure AD **does not see the
  password**.

- Azure logs may only show a “PTA” login with minimal context—ideal for
  stealth.

- Use tools like AADInternals to simulate or script logins without
  triggering full cloud-side telemetry.

**🧪 2. Leverage Legacy Protocols (If Enabled)**

- Test older protocols (IMAP, SMTP, POP) via PTA if Conditional Access
  (CA) is not enforced.

- Can be used for exfiltration or silent data access (e.g., O365
  mailboxes).

**🧱 3. Blend into Normal Login Patterns**

- Use harvested credentials from **real users** with typical activity.

- Match user-agent strings, IP ranges (via cloud proxy/VPN), and login
  times to avoid anomaly-based detection.

------------------------------------------------------------------------

**🔁 Persistence Techniques in PTA Environments**

**🔐 1. Golden Ticket + PTA**

- If you have **KRBTGT** access from on-prem, create a **Golden Ticket**
  and impersonate any user—even synced accounts.

- Authenticate to cloud resources via PTA without MFA or cloud logging.

**🔗 2. Compromise and Control the PTA Agent**

- If you gain **local admin access** to the PTA server:

  - Replace or hook the agent code.

  - Redirect or manipulate auth requests.

  - Maintain access via **on-prem persistence** → continue
    authenticating to Azure without re-entering passwords.

**📜 3. Create Hidden Synced Backdoor Account**

- Create a **low-privileged on-prem AD user** that syncs to Azure AD.

- Exclude from Conditional Access or monitoring policies.

- Later escalate privileges in Azure using token abuse, app registration
  abuse, or misconfigured roles.

**🧬 4. Leverage Service Accounts**

- Service accounts using PTA often lack MFA and monitoring.

- Abusing these can give long-term access to Azure environments
  silently.

**🔧 Optional Script: Detecting PTA & MFA Status (Pentest Tool)**

Import-Module AzureAD

\$users = Get-AzureADUser -All \$true \| Where-Object
{\$\_.DirSyncEnabled -eq \$true}

foreach (\$user in \$users) {

\$mfa = (Get-MsolUser -UserPrincipalName
\$user.UserPrincipalName).StrongAuthenticationRequirements

Write-Host "\$(\$user.UserPrincipalName) \| MFA: \$(\$mfa.State)"

}

------------------------------------------------------------------------

Would you like a BloodHound-style graph or a PowerShell-based backdoor
user creation script tailored for PTA scenarios?
