# Legacy Authentication Attacks

## What is it?

- **Legacy Authentication** refers to outdated protocols used to access cloud resources, such as **SMTP**, **IMAP**, **EAS** (Exchange ActiveSync), **EWS** (Exchange Web Services), **POP3**, etc.
- These protocols are **less secure** than modern authentication methods (OAuth2, SAML) and are vulnerable to attacks such as **password spraying** and **brute-force**.

## Impact on Azure

1. **Easy to bypass MFA**: `Legacy protocols` bypass **Modern MFA** and Conditional Access Policies. For example, `IMAP/SMTP` logins with basic authentication are typically **not subject to MFA**. Pentesters can attempt **password spraying** or **brute-forcing** against these legacy protocols to gain initial access.
2. **Targeting Legacy Services:** Even if `MFA` is required for modern web apps (like O365), users might still be able to access their mail via **legacy protocols** that **don’t require MFA**. Many older client apps (e.g., **Outlook for Mac** or **legacy mobile apps**) may still use these protocols, offering an attack vector.
3. **Exploiting Misconfigured Policies:** The `Conditional Access Policies` can block legacy authentication protocols, but they need to be explicitly configured. If not blocked, legacy auth can **bypass security policies**. **Exploiting misconfigurations** like allowing legacy auth for specific users or groups can enable access to cloud services without MFA.

## Attack flow for Legacy Authentication methods

1. **Recon**:
  
    - Identify if legacy protocols like **IMAP**, **SMTP**, or **EAS** are enabled for users
    - Query Azure AD for users still using legacy protocols via PowerShell or MS Graph API.

2. **Exploit**:

    - If allowed, attempt **password spraying** or **brute-forcing** using credentials leaked from previous breaches.
    - Target the **non-MFA users** or **service accounts** that may not use legacy auth restrictions.

3. **Escalate**:

    - Once access is gained, perform lateral movement via mail client access or use stolen tokens to escalate privileges.

## Mitigation

- **Block Legacy Authentication**: Use **Conditional Access Policies** to block legacy protocols like SMTP, IMAP, POP3, etc.
- **Enable Modern Authentication**: Enforce **OAuth2** for all users and apps.
- **Monitor Logs**: Regularly audit for failed legacy auth attempts and unusual patterns.

------------------------------------------------------------------------

- Script to enumerate legacy authentication usage in Microsoft Entra.
- Script to list recommended Conditional Access policies for blocking legacy protocols?

## Script to Enumerate Legacy Authentication Usage in Entra

**Requirements:**

- **Permissions**: Directory.Read.All, AuditLog.Read.All
- **Admin consent** must be granted to run this script

Install the Required Module: `Install-Module Microsoft.Graph -Scope CurrentUser`

------------------------------------------------------------------------

**🔹 Connect to Microsoft Graph API**

\# Connect to Microsoft Graph

Connect-MgGraph -Scopes "AuditLog.Read.All", "Directory.Read.All"

------------------------------------------------------------------------

**🔹 Enumerate Legacy Authentication Usage**

This script queries **sign-in logs** for the use of legacy
authentication protocols such as **IMAP, SMTP, EAS**, etc.

\# Fetch the last 7 days of sign-ins to look for legacy authentication
use

\$startDate = (Get-Date).AddDays(-7)

\$endDate = Get-Date

\# Query the sign-ins log

\$signIns = Get-MgAuditLogSignIn -Filter "createdDateTime ge
\$(\$startDate.ToString('yyyy-MM-ddTHH:mm:ss')) and createdDateTime le
\$(\$endDate.ToString('yyyy-MM-ddTHH:mm:ss'))" -Top 1000

\# Filter for legacy authentication protocols

\$legacyAuthProtocols = @("IMAP", "SMTP", "POP3", "EAS", "EWS",
"ActiveSync")

\$legacySignIns = \$signIns \| Where-Object { \$\_.ClientAppUsed -in
\$legacyAuthProtocols }

\# Display legacy authentication usage

\$legacySignIns \| Select-Object UserPrincipalName, ClientAppUsed,
CreatedDateTime, IPAddress \| Format-Table

------------------------------------------------------------------------

**🔹 Explanation of Script Output**

| **Field** | **Description** |
|----|----|
| UserPrincipalName | The **user** that initiated the legacy authentication attempt. |
| ClientAppUsed | The legacy protocol used for authentication (e.g., IMAP, SMTP, EAS). |
| CreatedDateTime | The timestamp of the authentication attempt. |
| IPAddress | The IP address from which the legacy authentication attempt was made. |

------------------------------------------------------------------------

**🔹 Example Output**

UserPrincipalName ClientAppUsed CreatedDateTime IPAddress

------------------- -------------- ------------------- ------------

user1@tenant.onmicrosoft.com IMAP 2025-04-30T12:45:23Z 192.168.1.10

user2@tenant.onmicrosoft.com SMTP 2025-04-29T09:10:56Z 198.51.100.1

user3@tenant.onmicrosoft.com EAS 2025-04-28T17:00:15Z 203.0.113.5

------------------------------------------------------------------------

**🧠 What to Do with This Information:**

- **Target Legacy Protocols**: If legacy protocols are still in use, try
  **password spraying** or **brute-forcing** accounts that aren't
  protected by MFA.

- **Security Gaps**: Accounts using legacy authentication should be
  targeted for **MFA enforcement** or blocking through **Conditional
  Access Policies**.

- **IP and Device Monitoring**: Check for unusual IP addresses or
  devices accessing legacy protocols that could indicate an attacker.

**🔒 Mitigation (Blue Team):**

- **Block Legacy Authentication** using **Conditional Access Policies**
  to prevent legacy protocols.

- New-MgConditionalAccessPolicy -DisplayName "Block Legacy
  Authentication" \`

- -State "Enabled" \`

- -Conditions @{SignInRiskLevels=@("low","medium","high")} \`

- -GrantControls @{BuiltInControls=@("Block")} \`

- -Applications @{Include=@("All")} \`

- -Users @{Include=@("All")}

Would you like further details on how to **implement Conditional Access
policies** to block legacy authentication or **review logs** for unusual
patterns during pentesting?

Here’s how you can **implement Conditional Access policies** to **block
legacy authentication protocols** and **review sign-in logs** for
unusual activity, both of which are essential during Azure penetration
testing engagements.

------------------------------------------------------------------------

**🔒 Blocking Legacy Authentication via Conditional Access Policies**

**✅ Steps to Block Legacy Authentication**

1.  **Login to the Azure Portal**:

    - Go to **Azure Active Directory \> Security \> Conditional
      Access**.

2.  **Create a New Policy to Block Legacy Authentication**:

    - Click on **New policy**.

3.  **Configure the Policy**:

    - **Name**: Block Legacy Authentication

    - **Assignments**: Choose **Users and groups** (you can select all
      users or specific ones for testing).

    - **Cloud apps or actions**: Select **All cloud apps** or target
      specific apps (e.g., Exchange).

    - **Conditions**:

      - Under **Client apps (Preview)**, select **Other clients** (this
        targets legacy authentication protocols).

    - **Access controls**: Choose **Block access** to prevent legacy
      authentication attempts.

    - **Enable Policy**: Set the policy to **On**.

4.  **Review and Apply**:

    - Review all settings, then click **Create** to enable the policy.

------------------------------------------------------------------------

**✅ PowerShell Equivalent for Blocking Legacy Authentication**

If you're automating this as part of a red team engagement, you can
create the Conditional Access policy using **PowerShell** with the
**Microsoft Graph API**.

\# Create a Conditional Access policy to block legacy authentication

New-MgConditionalAccessPolicy -DisplayName "Block Legacy Authentication"
\`

-State "Enabled" \`

-Conditions @{

ClientAppTypes = @("Other") \# Target legacy clients

} \`

-GrantControls @{

BuiltInControls = @("Block")

} \`

-Applications @{

Include = @("All")

} \`

-Users @{

Include = @("All") \# Select specific users for testing

}

------------------------------------------------------------------------

**📊 Reviewing Sign-In Logs for Unusual Activity**

To identify signs of exploitation or misuse of legacy authentication,
reviewing **sign-in logs** is critical during Azure pentesting.

**✅ Steps to Review Sign-In Logs in Azure Portal**

1.  **Navigate to Sign-In Logs**:

    - In the **Azure Portal**, go to **Azure Active Directory \>
      Sign-ins**.

2.  **Filter for Legacy Authentication**:

    - Use the filter options to filter by **Client App** (e.g., IMAP,
      SMTP, EAS, etc.) and review the logs for any suspicious sign-ins.

3.  **Analyze Failed and Successful Attempts**:

    - Look for failed authentication attempts, especially from unusual
      locations or IP addresses.

    - Identify any **unusual login times** or **high-frequency login
      attempts** which could indicate a brute force or password spraying
      attack.

------------------------------------------------------------------------

**✅ PowerShell Script to Review Sign-In Logs**

You can also use **PowerShell** to automate log review for legacy
authentication attempts:

\# Fetch the last 30 days of sign-ins and filter for legacy
authentication

\$startDate = (Get-Date).AddDays(-30)

\$endDate = Get-Date

\# Query the sign-in logs for legacy authentication protocols

\$signIns = Get-MgAuditLogSignIn -Filter "createdDateTime ge
\$(\$startDate.ToString('yyyy-MM-ddTHH:mm:ss')) and createdDateTime le
\$(\$endDate.ToString('yyyy-MM-ddTHH:mm:ss'))" -Top 1000

\# Filter for legacy auth protocols

\$legacyAuthProtocols = @("IMAP", "SMTP", "POP3", "EAS", "EWS")

\$legacySignIns = \$signIns \| Where-Object { \$\_.ClientAppUsed -in
\$legacyAuthProtocols }

\# Display relevant sign-in log data

\$legacySignIns \| Select-Object UserPrincipalName, ClientAppUsed,
CreatedDateTime, IPAddress \| Format-Table

------------------------------------------------------------------------

**🔍 What to Look for in Logs:**

- **High volume of sign-ins from unexpected IP addresses** or
  **geolocations**.

- **Multiple failed sign-ins** with **IMAP/SMTP** or other legacy
  protocols.

- **Unusual times** of access or an increase in attempts (signaling
  **brute-force** or **password spraying**).

- **Successful logins from untrusted devices** or locations.

------------------------------------------------------------------------

**🧠 Pentesting Insights**

By blocking legacy authentication and analyzing logs:

- **Red teamers** can use this information to pivot or escalate
  privileges by **exploiting legacy auth bypass** or targeting
  **unprotected service accounts**.

- **Blue teams** can **mitigate** and **detect attacks** by ensuring
  that legacy authentication is disabled and scrutinizing logs for
  anomalous access patterns.

Would you like help with **automating log parsing** for more
comprehensive analysis or setting up **advanced alerting** for
suspicious legacy authentication events?
