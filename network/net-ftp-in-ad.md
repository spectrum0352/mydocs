# Configuring an FTP Server with Active Directory Integration on Windows

Steps:

Install IIS and FTP Role
Use PowerShell to install Internet Information Services (IIS) with the FTP Server role:
Install-WindowsFeature Web-Server, Web-FTP-Server, Web-Mgmt-Console
Create a New FTP Site
Open IIS Manager.
Create a new FTP site, assign an IP address, and specify the root directory.
Bind the site to the appropriate hostname if needed.
Configure Authentication and Authorization
Enable Basic Authentication or Windows Authentication.
Grant access to specific Active Directory users or groups.
Configure authorization rules (Read/Write permissions as required).
Set Firewall Rules
Allow port 21 (control channel).
Allow port 20 (data channel for active mode).
Define and open a passive port range in both IIS and firewall settings.
Ensure the Windows Firewall or external firewall reflects these rules.
Enable FTPS (Secure FTP)
Install or configure an SSL/TLS certificate (self-signed or from a trusted CA).
Require SSL for connections to secure data transfer.
Configure User Isolation (Optional but Recommended)
Set up user isolation so each AD user/group only sees their own directory.
This prevents unauthorized browsing of other users’ folders.
Start and Test the FTP Service
Start the FTP service.
Test connectivity using an FTP client (e.g., FileZilla or Windows Explorer).
Verify authentication, authorization, and encryption are working correctly.
Removed/Adjusted:

No need to mention “assign IP & root directory” separately — it’s part of creating the FTP site.
Clarified firewall rules with passive mode configuration.
Added Management Console installation (needed for IIS GUI).
Added User Isolation (important for AD-integrated FTP).
Emphasized SSL/TLS certificate setup for FTPS.
 