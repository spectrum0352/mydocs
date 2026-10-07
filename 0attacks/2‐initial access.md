Initial access attacks – entra


2. Initial Access Attacks
•	Exploiting:
o	Enterprise apps with excessive privileges
o	Misconfigured Azure App Registrations (Client Secrets/Certificates)
o	Logic Apps, Function Apps with weak security
o	Unsecured Storage Accounts (public blobs, files)
o	Phishing for credential theft or consent grant abuse
•	Example Attack: OAuth Consent Grant Abuse—tricking users/admins into granting elevated permissions to malicious apps.


Module 2: Initial Access Attacks
Step 1: Find Apps with Excessive Permissions
Get-AzureADServicePrincipal | ForEach-Object {
    $app = $_
    $roles = Get-AzureADServiceAppRoleAssignment -ObjectId $app.ObjectId
    if ($roles.Count -gt 5) { # threshold for "excessive"
        Write-Output "$($app.DisplayName) has $($roles.Count) roles assigned"
    }
}
Step 2: Exploit OAuth Consent Grant (Manual Step)
•	Create a malicious app registration (requires manual portal interaction or admin privileges).
•	Send OAuth consent request link to target user to approve overprivileged permissions.
