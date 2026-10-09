# **MFASweep in Azure PenTest**

**MFASweep** is a tool used during an Azure penetration test to detect inconsistencies in **MFA enforcement** across various Microsoft services (including **Azure AD**, **Microsoft 365**, and **ADFS**). It is particularly useful for identifying **legacy authentication methods** and other gaps in MFA protection that can be exploited during an attack.

**How MFASweep Works in an Azure PenTest:**

1.  **Test MFA Configurations**: MFASweep automates the process of checking if MFA is enforced properly across different protocols and services. It can identify whether certain **services** (like **Exchange**, **ActiveSync**, or **ADFS**) are not triggering MFA as expected.

2.  **Credentials Testing**: The script runs multiple login attempts against an account using various methods to determine whether MFA is enforced or can be bypassed. It checks against different services (e.g., **Microsoft Graph API**, **Exchange Web Services**) to find weak spots.

**Running MFASweep:**

1.  **Pre-requisite**: You need a valid set of credentials to test against. **Warning**: Running MFASweep will attempt to log in to the target account multiple times, so **incorrect password entries** could lock the account.

2.  **Import the Script**:

    - Import **MFASweep** into your PowerShell session.

    - Import-Module MFASweep.ps1

3.  **Run the Script**:

    - Execute the Invoke-MFASweep command to begin the testing process for a target account.

    - Invoke-MFASweep-Username targetuser@targetdomain.com -Password Winter2020

This command will attempt to login to the account and check if MFA is triggered for each service. If any **legacy authentication protocols** or inconsistent MFA enforcement is found, it will report it.

4.  **ADFS Testing**: MFASweep can also check **ADFS**-based authentication, which is crucial since some environments may rely on ADFS to federate authentication to Azure AD.

**Key Use Cases in Azure PenTest:**

- **Identifying Legacy Authentication**: If legacy authentication methods (like **SMTP**, **IMAP**, or **EAS**) are in use, MFA will not trigger, leaving those accounts vulnerable. MFASweep can help identify these weak points.

- **Testing MFA Weaknesses**: If an attacker gains access to an account, they can use MFASweep to determine if MFA is required or can be bypassed through **legacy authentication** or **service-specific gaps**.

- **ADFS Vulnerability**: If ADFS is improperly configured, MFASweep can check whether **ADFS authentication** bypasses MFA. This is important when ADFS is part of a federated authentication setup.

**Important Considerations:**

- **Account Lockout Risk**: Since MFASweep tries to log in multiple times, entering the wrong password could lock out the target account. Ensure that you have explicit permission or accounts that won’t be locked during testing.

- **Check for MFA Inconsistencies**: Use the results of the MFASweep to pinpoint areas where MFA enforcement is weak or missing, which can be exploited during further stages of the penetration test.

**Further Resources:**

For more detailed insights into MFA bypass tactics and real-world examples, refer to the [Black Hills Information Security Blog on Exploiting MFA Inconsistencies](https://www.blackhillsinfosec.com/exploiting-mfa-inconsistencies-on-microsoft-services).

Would you like more details on **configuring MFASweep** or **exploiting specific MFA bypass scenarios** in Azure?

## Tool Walkthrough: MFASweep

**MFASweep** is a tool designed to automate the process of discovering and testing MFA bypass vulnerabilities across different **Microsoft 365** services and device platforms. It helps penetration testers identify inconsistencies in MFA enforcement, which could lead to potential exploitation.

**Step-by-Step Guide for Using MFASweep:**

1.  **Clone the MFASweep Repository**:

    - Clone the MFASweep GitHub repository to your local machine or server.

2.  git clone https://github.com/dafthack/MFASweep.git

3.  cd MFASweep

4.  **Install Dependencies**:

    - Before using MFASweep, ensure that you have the necessary dependencies installed. This may require installing **Python** (if it's not already installed) and running the following commands:

5.  pip install -r requirements.txt

6.  **Set Up Azure App Registration**:

    - MFASweep uses an **Azure App Registration** to interact with Microsoft 365 services via the **Microsoft Graph API**.

    - Follow the steps to create an **App Registration** in **Azure AD**:

      - Go to **Azure Portal** \> **Azure Active Directory** \> **App registrations** \> **New registration**.

      - After registration, grant the application the necessary API permissions:

        - **Directory.Read.All**

        - **User.Read.All**

        - **AuditLog.Read.All**

      - Generate a **Client Secret** and take note of the **Application (client) ID** and **Tenant ID**.

7.  **Configure MFASweep with Azure App Details**:

    - Open the config.json file in MFASweep and configure it with your **Tenant ID**, **Client ID**, and **Client Secret** (obtained from the Azure App Registration).

Example config.json:

{

"tenant_id": "YOUR_TENANT_ID",

"client_id": "YOUR_CLIENT_ID",

"client_secret": "YOUR_CLIENT_SECRET",

"graph_api_url": "https://graph.microsoft.com/v1.0"

}

8.  **Run MFASweep**:

    - To test different **Microsoft 365 services** and **device platforms**, execute the following command:

9.  python mfasweep.py --scan

This will trigger the tool to scan for inconsistencies in **MFA enforcement** across various authentication points like:

- **Microsoft Graph API**

- **Microsoft 365 Web Portal**

- **Exchange Web Services (EWS)**

- **ActiveSync**

- **ADFS**

The tool will generate results that highlight which services/platforms allow authentication without MFA or with weak enforcement.

10. **Review Results**:

    - The output will indicate **which device platforms** are vulnerable to **MFA bypass** or lack proper **MFA enforcement**.

    - You can then focus your **penetration testing efforts** on these platforms to attempt attacks like **password spraying**, **credential stuffing**, or **brute-force** against users that may not have MFA properly configured.

## Check MFA Status Across Device Platforms

If you prefer to use **PowerShell** for MFA status checks, here's a script to query your **Azure AD** environment for users' MFA status across different devices and protocols.

**PowerShell Script: Check MFA Status**

\# Connect to Azure AD

Connect-AzureAD

\# Fetch a list of users and their MFA status

\$users = Get-AzureADUser -All \$true

\# Initialize an empty array to store results

\$mfaStatusResults = @()

foreach (\$user in \$users) {

\# Check MFA status for each user

\$mfaStatus = Get-MsolUser -UserPrincipalName \$user.UserPrincipalName \| Select-Object UserPrincipalName, StrongAuthenticationRequirements

\# Add result to array

\$mfaStatusResults += \[PSCustomObject\]@{

UserPrincipalName = \$user.UserPrincipalName

MFAEnabled = if (\$mfaStatus.StrongAuthenticationRequirements.Count -gt 0) { "Enabled" } else { "Disabled" }

}

}

\# Output MFA status results

\$mfaStatusResults \| Format-Table -Property UserPrincipalName, MFAEnabled

**🔧 Explanation of the PowerShell Script:**

- **Step 1**: The script connects to Azure AD using the Connect-AzureAD cmdlet.

- **Step 2**: It retrieves a list of all users in the tenant using Get-AzureADUser.

- **Step 3**: It then checks the MFA status for each user by querying **StrongAuthenticationRequirements** via the Get-MsolUser cmdlet. This indicates whether the user has MFA enabled.

- **Step 4**: The results are stored and displayed in a table format showing whether MFA is **enabled** or **disabled** for each user.

------------------------------------------------------------------------

**What to Do with This Information in a PenTest**

- **Legacy and Mobile Clients**: If the results show users have **MFA disabled** for legacy protocols (e.g., **ActiveSync**, **IMAP**), it’s an immediate **attack vector** for exploitation. Pentesters can attempt **credential stuffing** or **password spraying**.

- **MFA Gaps**: Identify users who have **no MFA enabled** and focus efforts on those accounts for **initial access** via **brute-forcing** or **password spraying**.

- **Device-Specific Exemptions**: Look for mobile platforms or clients that might **bypass MFA** (e.g., older **Outlook for mobile** versions). These are **high-priority targets** for exploitation.

------------------------------------------------------------------------

**🔒 Mitigation (Blue Team):**

- **Enforce MFA on all platforms**: Use **Conditional Access Policies** to enforce MFA for **all devices**, including **legacy clients** and **mobile apps**.

- **Monitor MFA Logs**: Regularly review logs to ensure MFA is applied uniformly across the organization. Use **Azure AD Sign-in logs** to detect anomalies.

- **Use Modern Authentication for email and client apps**: Disable **legacy authentication protocols** (IMAP, SMTP, ActiveSync) and enforce **OAuth2** for all email clients.

------------------------------------------------------------------------

Would you like further customization of the PowerShell script for your environment, or need help with **advanced MFA configurations** or **detailed analysis of MFA bypasses**?
