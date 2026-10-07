# Part 2: Detailed Analysis of MFA Bypasses

When pentesting Azure environments, **MFA bypasses** are one of the top vectors to investigate. Let’s dive into common **MFA bypass techniques** and how you can **test** and **exploit** them.

**1. Exploiting MFA via Legacy Authentication**

Legacy authentication protocols like **SMTP**, **IMAP**, **ActiveSync**, and **POP3** are often **not protected by MFA**. **Legacy apps** or clients (e.g., old Outlook clients) may not trigger MFA.

**Steps to Exploit Legacy Authentication:**

1.  **Check for Disabled Legacy Authentication**:

    - Run the following **PowerShell** command to see if legacy protocols are disabled:

2.  Get-AzureADMSConditionalAccessPolicy -Filter "state eq 'enabled'" \| Where-Object { \$\_.Conditions.ClientAppTypes -contains "Other"}

3.  **Scan for Legacy Authentication**:

    - **Use tools like MFASweep** to scan for vulnerable legacy authentication points (e.g., **Exchange ActiveSync**, **IMAP**, etc.).

    - Run **MFASweep** and test different **user agents** to identify gaps in MFA enforcement for legacy clients.

4.  **Exploit Legacy Authentication**:

    - If legacy authentication is **not blocked**, attackers can **brute-force** or **password spray** to bypass MFA.

**2. MFA Bypass via Inconsistent MFA Settings**

Sometimes, MFA is **only partially enforced**, such as on **some apps** or **specific users**. **MFASweep** can help you discover inconsistencies in these settings.

**Steps to Exploit Inconsistent MFA:**

1.  **Run MFASweep**:

    - Use **MFASweep** to scan different services like **Exchange Web Services (EWS)**, **Microsoft Graph API**, and the **Web Portal**.

    - This tool can identify which platforms allow **MFA bypass** for specific users or devices.

2.  **Test MFA Bypass**:

    - If a user is **exempt** from MFA or using a **legacy client**, attempt **credential stuffing** or **brute-forcing** to gain access to the target account.

**3. MFA Bypass via Phishing or Social Engineering**

- **MFA phishing** involves **tricking users** into providing **MFA verification codes** via fake login pages or **reverse proxy tools**.

- **Tools like Evilginx2** are used to **capture MFA codes** as users authenticate.

**Steps to Exploit MFA via Phishing:**

1.  **Create a Fake Login Page**:

    - Use **Evilginx2** or **Modlishka** to create a phishing page that mimics the **Azure AD login page**.

2.  **Harvest Credentials and MFA Codes**:

    - Once the user enters their credentials, **Evilginx2** will capture both their **password** and the **MFA verification code**.

3.  **Authenticate with Stolen Credentials**:

    - Use the captured credentials and MFA code to authenticate as the victim.

**4. Exploiting Device-Based MFA Exemptions**

Some Conditional Access Policies may **exempt certain devices** from MFA enforcement, such as **trusted corporate devices** or devices with **compliant security settings**.

**Steps to Test Device-Based Exemptions:**

1.  **Check Device Compliance Policies**:

    - Review any **Intune** or **MDM policies** that might allow **corporate devices** to bypass MFA.

    - Use **PowerShell** or **Azure AD Graph API** to query for compliant and exempt devices.

2.  **Test MFA on Non-Compliant Devices**:

    - Use a **non-compliant device** (e.g., an unmanaged device) to test if MFA is being triggered.

3.  **Exploit Device Exemptions**:

    - If device-based exemptions exist, test **single sign-on (SSO)** or **authenticated sessions** on devices that should be excluded.

**🛡️ Mitigation (Blue Team):**

- **Block legacy authentication protocols** via **Conditional Access**.

- Enforce **device-based MFA** for all corporate devices and use **Microsoft Intune** for device compliance.

- **Regularly review MFA bypass vulnerabilities** and **improve phishing defenses** using security tools like **Microsoft Defender for Identity**.

------------------------------------------------------------------------

Would you like further assistance with setting up specific **MFA bypass tests** or exploring advanced ways to **mitigate MFA weaknesses** in Azure AD?

## 2. Detailed Analysis of MFA Bypasses During Penetration Testing

**A. MFA Bypass via Legacy Authentication**

Legacy protocols (e.g., **IMAP**, **SMTP**, **ActiveSync**) do **not support MFA**. If these protocols are **enabled**, attackers can bypass MFA and attempt to brute-force passwords.

**How to Check for Legacy Authentication:**

1.  **Use Azure AD Sign-in Logs**:

    - Go to **Azure AD** \> **Sign-ins**.

    - Filter for legacy authentication protocols by looking at the **Client App** column. Look for entries such as **IMAP**, **POP3**, **Exchange ActiveSync**, and **SMTP**.

2.  **Block Legacy Authentication**:

    - In **Conditional Access**, create a policy to **block legacy authentication** for all apps.

    - Go to **Security** \> **Conditional Access** \> **New Policy**.

    - Select **Client Apps** \> **Legacy Authentication Clients** and set **Access** to **Block**.

3.  **Use MFASweep**:

    - **MFASweep** scans your tenant for legacy authentication points where MFA might be bypassed. It can also test which **legacy clients** are still being used.

4.  python mfasweep.py --scan

5.  **Exploit Legacy Authentication**:

    - If legacy authentication is not disabled, attempt **password spraying** or **brute-forcing** against weak passwords, knowing that MFA won’t be triggered for these protocols.

------------------------------------------------------------------------

**B. Exploiting Inconsistent MFA Configurations**

Sometimes MFA may be **inconsistent** across apps or users. This can occur if Conditional Access policies aren’t properly configured for all users or if certain apps aren’t covered.

**How to Identify Inconsistent MFA Configurations:**

1.  **Use MFASweep**:

    - Run **MFASweep** to detect inconsistent MFA enforcement across various Microsoft 365 apps like **Microsoft Graph**, **Exchange**, **ADFS**, and **ActiveSync**.

2.  python mfasweep.py --scan

3.  **Check User MFA Settings**:

    - Query your Azure AD environment using PowerShell to identify users without MFA enforced.

4.  Get-MsolUser \| Where-Object { \$\_.StrongAuthenticationMethods.Count -eq 0 }

5.  **Exploit Inconsistencies**:

    - Target **users without MFA** or services with **weak MFA enforcement**. For example, if only **SSO apps** enforce MFA, attackers could try to exploit **legacy apps**.

------------------------------------------------------------------------

**C. MFA Bypass via Phishing (Evilginx2, Modlishka)**

Attackers often **phish** for MFA codes by setting up a **reverse proxy** to capture **MFA codes** from users who authenticate via **SMS**, **Authenticator app**, or **Push notifications**.

**How to Set Up Phishing for MFA Bypass:**

1.  **Set Up Evilginx2**:

    - **Evilginx2** is a **man-in-the-middle** attack tool that intercepts MFA codes during authentication. You can use this to capture login credentials along with MFA codes.

Steps:

- **Install Evilginx2** on a **VPS** (or local server).

- Configure it to act as a **proxy** between the victim and Azure AD login page.

- When the victim logs in, Evilginx2 will **capture credentials and MFA tokens**.

2.  **Phishing via Evilginx2**:

    - Create a **phishing page** that mimics the **Azure AD login page**.

    - Once the victim logs in, Evilginx2 forwards the credentials and MFA code to the attacker’s server.

3.  **Use Phishing for Full Authentication**:

    - With captured credentials and MFA code, attackers can fully authenticate into the target Azure AD account.

4.  **Phishing with Modlishka**:

    - **Modlishka** is another advanced reverse proxy tool that mimics login pages, capturing both **credentials** and **MFA codes**.

------------------------------------------------------------------------

**D. Exploiting Device-based MFA Exemptions**

If Conditional Access policies allow trusted devices to bypass MFA, attackers can exploit this to **use unmanaged devices** or bypass MFA for **trusted devices**.

**Steps to Exploit Device Exemptions:**

1.  **Check for Device Exemptions**:

    - Review **Device Compliance Policies** in **Intune** to see if any **trusted devices** are exempt from MFA.

2.  **Exploit Device Exemptions**:

    - If your target’s **device** is exempt from MFA (e.g., it’s enrolled in **Intune** or marked as **compliant**), test the login flow with a **non-compliant device** to trigger MFA.

3.  **Bypass MFA via Device**:

    - Once you have identified exempt devices, attempt to access the **Azure Portal** or other apps with that device and verify that MFA is bypassed.

------------------------------------------------------------------------

**🛡️ Mitigations:**

- **Disable legacy authentication** for all users and apps via **Conditional Access**.

- **Monitor and block phishing attempts** with **Microsoft Defender for Identity**.

- **Regularly review Conditional Access Policies** to ensure **MFA** is consistently applied.

- **Use Intune** and **MDM** to enforce **device compliance**.

------------------------------------------------------------------------

Would you like me to walk you through any specific tool configurations, or need further assistance with **phishing simulations**, **advanced attack techniques**, or **MFA testing**?

<img src="media/image1.png" style="width:7.04436in;height:3.09017in" />

<img src="media/image2.png" style="width:6.98439in;height:2.12914in" />
