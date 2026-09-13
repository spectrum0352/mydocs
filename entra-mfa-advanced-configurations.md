# **Part 1: Advanced MFA Configurations in Azure AD**

**🔐 1. Enforcing MFA for All Users with Conditional Access**

One of the most effective ways to enforce MFA across your organization is using **Conditional Access Policies**. Here’s how to configure them with advanced settings:

**Step-by-Step Guide to Configuring Advanced MFA with Conditional Access:**

1.  **Login to Azure AD Portal**:

    - Navigate to **Azure Active Directory \> Security \> Conditional Access**.

2.  **Create a New Conditional Access Policy**:

    - Click on **New policy**.

3.  **Configure Policy Assignments**:

    - **Users and Groups**: Select all users or specific groups (like **Administrators** or **All users**).

    - **Cloud Apps or Actions**: Select **All cloud apps** or specify apps like **Office 365**, **Azure Portal**, or **Exchange Online**.

    - **Conditions**:

      - Under **Device Platforms**, select **All platforms** or specific ones (e.g., **Windows**, **iOS**, **Android**).

      - You can also enforce MFA based on **location**, for example, requiring MFA only for **non-corporate IPs** or specific **geolocations**.

4.  **Grant Controls**:

    - Set **Grant** to **Require multi-factor authentication**.

    - You can add **exceptions** to certain users or groups who don’t require MFA, such as service accounts or trusted IP ranges.

5.  **Enable the Policy**:

    - Ensure that **Enable policy** is set to **On** and click **Create**.

**Conditional Access Policy Example:**

- You can configure a policy to **require MFA for all users** except those in the **Corporate Network**.

- If users try to log in from an **untrusted network** (e.g., public IPs), MFA will trigger.

**Example PowerShell Command for Enforcing MFA:**

\# Example: Enforce MFA for all users except those on corporate network

\$policy = New-AzureADMSConditionalAccessPolicy -DisplayName "Require MFA for All" -State "Enabled" -Users @("All") -Applications @("All Cloud Apps") -GrantControls @("MFA")

------------------------------------------------------------------------

**🔐 2. Enforcing MFA on Specific Applications**

You might want to enforce MFA only for critical apps like the **Azure Portal** or **Office 365**. This can be done through **Conditional Access** targeting specific **Cloud Apps**.

1.  **Configure Conditional Access** for a specific app (e.g., **Office 365 Exchange Online**).

2.  Select **Cloud Apps or Actions** \> **Select Applications** \> **Office 365 Exchange Online**.

3.  Set **Grant Controls** \> **Require Multi-Factor Authentication**.

------------------------------------------------------------------------

**🔐 3. Enforcing MFA Based on Risk**

Azure AD offers **Risk-based Conditional Access** where MFA is triggered based on the **sign-in risk level** (e.g., risky sign-ins based on unfamiliar locations, devices, or suspicious behavior).

1.  **Navigate to Azure AD \> Security \> Conditional Access**.

2.  Create a new policy and select **Risk-based MFA**.

3.  Set to enforce MFA for **High Risk** or **Medium/High Risk** sign-ins.

4.  **Enable Risk Detection** for scenarios where MFA should be applied for risk detection, such as **Impossible Travel** or **Anonymous IP addresses**.

**Risk-based Conditional Access Example:**

\# Set Conditional Access to require MFA on high-risk sign-ins

Set-AzureADMSConditionalAccessPolicy -DisplayName "Require MFA on High Risk Sign-ins" -State "Enabled" -Conditions @("RiskLevel=High") -GrantControls @("MFA")

Absolutely! Here’s a **comprehensive guide** that covers **advanced MFA configurations** in **Azure AD** as well as detailed **analysis of MFA bypasses** during penetration testing. Let’s break it down into two parts:

## 1. Setting up Advanced MFA Configurations

**🔐 A. Enforcing MFA Based on User Risk (Risk-based Conditional Access)**

Incorporating **risk-based MFA** into your Conditional Access Policies allows you to enforce MFA based on factors like **user behavior**, **location**, or even **real-time risk detection**. This approach leverages Azure AD’s **Identity Protection** to trigger MFA when a **high-risk** sign-in is detected (e.g., unfamiliar locations or device anomalies).

**How to Set Up Risk-based MFA:**

1.  **Go to Azure AD Portal** \> **Security** \> **Identity Protection**.

2.  **Configure Risk Policies**:

    - Select **Sign-in risk policy** and create a **new policy** for your tenant.

    - Set the **risk level** (Low, Medium, High). For **high-risk** sign-ins, enforce **MFA**:

      - **Risk level**: High

      - **Grant control**: Require MFA

3.  **Configure User Risk Policy**:

    - Navigate to **Risk-based Conditional Access** to configure rules that apply when a user’s **risk level** is deemed **high**.

    - Define **actions** such as enforcing MFA or blocking access if the user’s sign-in is considered risky.

4.  **Example PowerShell Script for Risk-based Access**:

5.  \# Enforce MFA when risk level is high

6.  Set-AzureADMSConditionalAccessPolicy -DisplayName "Risk-based MFA Enforcement" \`

7.  -State "Enabled" -Conditions @{"RiskLevel"="High"} \`

8.  -GrantControls @("MFA")

9.  **Monitor and Fine-Tune Policies**: Use **Azure AD Sign-in Logs** to monitor sign-in events and **identify suspicious activities** that trigger MFA. Fine-tune the **risk thresholds** to balance security and user experience.

**🔐 B. Enforcing MFA Based on Device Compliance (Device-based Conditional Access)**

You can enforce MFA **only on non-compliant or unmanaged devices**, ensuring that trusted devices (e.g., company-issued laptops) don’t require MFA every time they log in. This strategy balances **security** with **user convenience**.

**How to Set Up Device-based MFA:**

1.  **Configure Device Compliance** via **Intune** (Mobile Device Management - MDM):

    - Go to **Azure AD** \> **Devices** \> **Device settings** \> **Configure compliance policies**.

    - Set the **compliance rules** to enforce policies like:

      - **Password strength**

      - **Encryption**

      - **Jailbreak detection**

2.  **Conditional Access Policy for Devices**:

    - In **Conditional Access**, create a new policy that requires MFA for **non-compliant devices**.

    - Select **Device state** and choose to enforce MFA when the device is **non-compliant**.

3.  **PowerShell to Enforce MFA on Non-Compliant Devices**:

4.  \# Enforce MFA on non-compliant devices

5.  Set-AzureADMSConditionalAccessPolicy -DisplayName "Require MFA on Non-Compliant Devices" \`

6.  -State "Enabled" -Conditions @{"DeviceState"="NonCompliant"} \`

7.  -GrantControls @("MFA")

8.  **Test Device Compliance**:

    - On a non-compliant device (e.g., not enrolled in Intune), try to access resources protected by MFA.

    - If the device is non-compliant, MFA will be triggered.
