## Post Compromise

**Post-Compromise Recon in Azure Penetration Testing**

After successfully compromising an Azure environment, the
post-compromise recon phase is crucial for understanding the scope of
your access and identifying potential paths to escalate privileges or
exfiltrate data.

**1. Who Do We Have Access As?**

- **Roles and Permissions**: Determine the roles assigned to the
  compromised account. For example, are you a standard user, or do you
  have privileged access like a contributor or admin? Understanding the
  access control policies and group memberships is key to escalating
  privileges.

- **Multi-Factor Authentication (MFA)**: Verify if MFA is enabled for
  the compromised account. If it’s not, this could be an area of
  exploitation.

- **Accessible Resources**: Check what resources you can access within
  the Azure environment (web apps, databases, storage accounts, etc.).
  Identify if any sensitive data is stored within these resources.

- **Who Are the Admins?**: Identify users with administrative privileges
  (Global Admins, Privileged Role Administrators, etc.). Tools like
  BloodHound or AzureHound can help with this.

- **Privilege Escalation Path**: Develop a plan for escalating to admin
  privileges. Look for any vulnerabilities or misconfigurations that
  could be leveraged for this, such as unprotected roles or
  misconfigured identity management.

**2. Security Protections**

- **Azure Defender**: Check if Azure Defender or other advanced threat
  protection mechanisms (like ATP) are in place. These tools may detect
  malicious activity, making it harder to remain undetected.

- **GuardDuty and Sentinel**: Assess if GuardDuty or Sentinel are being
  used for threat detection, and try to understand what logs are being
  monitored. These might reveal any suspicious activity.

- **Logs and Alerts**: Check if there are any logs or monitoring alerts
  in place that might expose your activities.

**3. Azure Portal Access**

- **Standard User Access**: Even as a standard user, you may still have
  access to significant Azure domain information. Azure portal access is
  often not heavily restricted for non-admin users.

- **Portal.azure.com**: Authenticated users can access the Azure portal
  (portal.azure.com) to gather insights into the environment. A standard
  user can view Azure Active Directory information and other resources
  that might give you valuable intel for further exploitation.

- **Global Address List**: The O365 Global Address List contains
  valuable information about the organization’s users and structure,
  which could aid in phishing or targeting specific individuals.

- **PowerShell Cmdlets**: Even if the portal is locked down, PowerShell
  cmdlets can often bypass restrictions. Be aware that certain
  company-wide settings might restrict the use of PowerShell commands.
  For example:

- Set-MsolCompanySettings -UsersPermissionToReadOtherUsersEnabled
  \$false

This setting can be configured to block users from viewing other user
data, including administrative information, through the command line.

**4. PowerShell Modules for Azure Penetration Testing**

- **Az Module**: The Az PowerShell module is the primary tool for
  interacting with Azure resources. Familiarity with this module is
  essential for recon and exploitation tasks.

- **AzureAD & MSOnline**: These modules can be used to interact with
  Azure Active Directory and manage cloud identities and resources.

- **CLI Tools**: In addition to PowerShell, you can use Azure CLI
  (az cli) for cross-platform command-line interaction with Azure
  resources. This is useful for Linux and Windows environments.

- **CloudPentestCheatsheets**: A great resource for various cloud
  penetration testing techniques, including detailed PowerShell scripts
  and examples:

  - [CloudPentestCheatsheets](https://github.com/dafthack/CloudPentestCheatsheets)

------------------------------------------------------------------------

This framework helps you understand how to gain a foothold within Azure
after compromise and begin identifying further opportunities for
exploitation, privilege escalation, and persistence in the environment.
It also stresses the importance of knowing what tools and modules to use
for accessing Azure resources via the portal or command-line interfaces.
