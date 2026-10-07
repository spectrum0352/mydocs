

## Pre-requisites

To implement Microsoft Defender XDR, we need to:

1. **A qualifying Microsoft 365 subscription:** This includes Microsoft 365 E5, E5 Security, Business Premium, or Defender XDR for Business.
2. **Supported operating systems and platforms:** Windows 10/11, Windows Server 2012+, macOS, Linux, Android, and iOS.
3. **Supported devices:** Computers, laptops, mobile devices, and servers.
4. **The latest Defender XDR agent:** Installed on all supported devices to collect and transmit data.
5. **Network connectivity:** A connection to the Microsoft 365 cloud for data transfer, updates, and security intelligence.

Meeting these requirements enables Defender XDR implementation. Further details can be found in the official documentation:
<https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/?view=o365-worldwide>


## Access management

global administrator or security administrator

To manage Microsoft Defender for Endpoint within Microsoft Defender XDR, you need to assign appropriate roles and permissions. This is done via Role-Based Access Control (RBAC).

**Enabling Roles:**

1. In the Microsoft Defender XDR portal, navigate to *Settings \> Endpoints \> Permissions \> Roles*.
2. Turn on roles if they are not already enabled.

**Assigning Roles:**

1. Click "Add item" to create a new role.
2. Give the role a name and select the appropriate permissions.
3. Assign the role to users or groups. Changes to device group configuration require applying the changes.

**Built-in Microsoft Entra Roles for managing access to Microsoft Defender XDR:**

- Global Administrator (full access)
- Global Reader (read-only access)
- Security Administrator (most permissions for security-related tasks)
- Security Operator (permissions for security operations tasks)
- Security Reader (read-only access to security data)

**Custom Roles (example configurations for a Security Operations Center):**

- **Security Analyst Level-1:** *Security Data/Alerts* (view alerts and related security data)
- **Security Analyst Level-2:** *Security Data/Alerts/Response/Basic Live Response* (adds response actions and basic live response capabilities)
- **Security Analyst Level-3:** *All read and manage permissions* (full access to security data, alerts, response, and advanced live response)
- **Security Engineer:** *Security Posture, Security Data Basics, Vulnerability Management, Exception Handling, Remediation Handling, Application Handling, Security Baseline Assessment* (focus on vulnerability management and security posture)
- **Security Admin:** *Authorization and Settings (Read and Manage All Permissions)* (manages roles, permissions, and settings)

**Permission Capabilities (grouped for clarity):**

- **Data & Analysis:** Security Data (alerts, incidents, investigations, hunting, devices, reports), Vulnerability Management (vulnerability data, software inventory, weaknesses, missing updates, baseline assessments)
- **Response & Remediation:** Alert (manage alerts, investigations, scans), Response (actions on devices, remediation approvals, allow/block lists), Basic Live Response (read-only remote actions), Advanced Live Response (upload files, run scripts remotely), Exception Handling, Remediation Handling
- **Security Posture & Configuration:** Application Handling, Security Baseline Assessment, Authorization (device groups, roles), Security Settings, System Settings

<table>
<colgroup>
<col style="width: 14%" />
<col style="width: 61%" />
<col style="width: 23%" />
</colgroup>
<thead>
<tr>
<th><strong>Role Group</strong></th>
<th><strong>Permissions</strong></th>
<th><strong>Function</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>Security operations</strong></td>
<td><p>All read-only permissions</p>
<p>All read and manage permissions</p>
<p>Select Custom permissions on Security Data</p>
<ul>
<li><p>Read-only</p></li>
<li><p>Select all permissions</p></li>
<li><p>Select custom permissions for security data</p>
<ul>
<li><p><strong>Security data basics:</strong> View info of incidents/alerts/investigations/advanced hunting (MDE)/devices/submissions/evaluation lab, and reports.</p></li>
<li><p><strong>Alerts</strong>: Manage alerts, start automated investigations, run scans, collect investigation packages, and manage device tags</p></li>
<li><p><strong>Response (manage):</strong> Take response actions, approve/dismiss pending remediation actions, and manage blocked and allowed lists for automation</p></li>
<li><p><strong>Email and Collaboration quarantine (manage):</strong>
View and release emails and messages from quarantine</p></li>
</ul></li>
</ul></td>
<td>manage day to day operations and respond to incident and adversaries</td>
</tr>
<tr>
<td><strong>Security posture</strong></td>
<td><p>All read-only permissions</p>
<p>All read and manage permissions</p>
<p>Select custom permissions of posture management</p>
<ul>
<li><p>Read only</p></li>
<li><p>Select all permissions</p></li>
<li><p>Select custom permissions</p>
<ul>
<li><p><strong>Secure score (read)</strong>: View Secure Score data including your current score, recommended actions, history, and metrics &amp; trends</p></li>
<li><p><strong>Secure score (manage)</strong>: Work to improve your Secure Score by editing status &amp; action plan, managing tags, and editing score zones</p></li>
</ul></li>
</ul></td>
<td>manage organizations security posture, use MDVM</td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

## Data Storage

Microsoft Defender XDR data storage and retention are configured within the Microsoft 365 Defender portal
([https://security.microsoft.com](https://security.microsoft.com/)) under Settings -\> Endpoints -\> General -\> Data Retention -\> Data Storage.

- **Data Residency:** Data is stored in either the US, UK, or EU. The initial region selected during setup *cannot* be changed after configuration. Data cannot be moved between these regions.
- **Data Retention:** The default retention period is 6 months.
- **Storage Details:** Microsoft Defender XDR uses its own internal storage for logs. Specific details about this storage are not publicly disclosed for security reasons.



### Access Management

To manage Microsoft Defender for Endpoint within Microsoft Defender XDR, you need to assign appropriate roles and permissions. This is done via Role-Based Access Control (RBAC).

#### Enabling Roles:
1. In the Microsoft Defender XDR portal, navigate to Settings > Endpoints > Permissions > Roles.
2. Turn on roles if they are not already enabled.

#### Assigning Roles:
1. Click "Add item" to create a new role.
2. Give the role a name and select the appropriate permissions.
3. Assign the role to users or groups. Changes to device group configuration require applying the changes.

#### Built-in Microsoft Entra Roles:
- Global Administrator (full access)
- Global Reader (read-only access)
- Security Administrator (most permissions for security-related tasks)
- Security Operator (permissions for security operations tasks)
- Security Reader (read-only access to security data)

#### Custom Roles (example configurations for a Security Operations Center):
- **Security Analyst Level-1:** Security Data/Alerts (view alerts and related security data)
- **Security Analyst Level-2:** Security Data/Alerts/Response/Basic Live Response (adds response actions and basic live response capabilities)
- **Security Analyst Level-3:** All read and manage permissions (full access to security data, alerts, response, and advanced live response)
- **Security Engineer:** Security Posture, Security Data Basics, Vulnerability Management, Exception Handling, Remediation Handling, Application Handling, Security Baseline Assessment (focus on vulnerability management and security posture)
- **Security Admin:** Authorization and Settings (Read and Manage All Permissions) (manages roles, permissions, and settings)

#### Permission Capabilities:
- **Data & Analysis:** Security Data (alerts, incidents, investigations, hunting, devices, reports), Vulnerability Management
- **Response & Remediation:** Alert, Response, Basic Live Response, Advanced Live Response, Exception Handling, Remediation Handling
- **Security Posture & Configuration:** Application Handling, Security Baseline Assessment, Authorization, Security Settings, System Settings

### Data Storage

Microsoft Defender XDR data storage and retention are configured within the Microsoft 365 Defender portal (https://security.microsoft.com/) under Settings > Endpoints > General > Data Retention > Data Storage.

- **Data Residency:** Data is stored in either the US, UK, or EU. The initial region selected during setup cannot be changed after configuration. Data cannot be moved between these regions.
- **Data Retention:** The default retention period is 6 months.
- **Storage Details:** Microsoft Defender XDR uses its own internal storage for logs. Specific details about this storage are not publicly disclosed for security reasons.

Pre-requisites

This document summarizes the prerequisites for deploying Microsoft Defender for Endpoint (MDE). Always refer to the official Microsoft documentation for the most up-to-date and detailed information.


System Requirements:
•	Operating Systems: Windows (Windows 7 SP1 and later, including Windows Virtual Desktop), Linux (most common distributions like RHEL, CentOS, Ubuntu, Debian, and Oracle Linux), macOS, Android, iOS. Note: Windows 7 and 2008 (and their server equivalents) are not supported. Older versions of Linux/macOS may also be unsupported; consult Microsoft documentation.
•	Browsers: Microsoft Edge, Google Chrome (for accessing the Defender for Endpoint portal).
•	Microsoft Defender Antivirus: MDE sensors rely on Microsoft Defender Antivirus. 
o	If Microsoft Defender Antivirus is the primary antimalware solution, onboarding is seamless.
o	If a third-party antimalware solution is used with Mobile Device Management (MDM) or Microsoft Endpoint Manager, the Microsoft Defender Antivirus Early-Launch Antimalware (ELAM) driver must be enabled. Server deployments with third-party antivirus require exclusions to prevent conflicts.
•	Network: MDE sensors require Microsoft Windows HTTP (WinHTTP) for communication, implying general internet connectivity to reach MDE cloud services.
•	Data Storage: MDE stores data in Microsoft's cloud.
•	Device Compatibility: Verify device/server compatibility against Microsoft's documentation.
•	Other: Ensure the account used for deployment (Global Administrator or Security Administrator) has the necessary permissions for data storage configuration and device onboarding.

Required Permissions:
•	Global Administrator or Security Administrator permissions are required for data storage configuration and device onboarding.



Network requirements

This document outlines the network requirements for Microsoft Defender for Endpoint (MDE), focusing on bandwidth, storage, network configurations (especially proxy settings), and URL whitelisting.

Bandwidth and Storage: 
Planning for necessary bandwidth and storage is crucial but specific details are not provided in the text. Consult official Microsoft documentation for up-to-date guidance on this.

Network Configuration (Proxy):
•	If endpoints do not require a proxy to access the internet, no further configuration is needed.
•	MDE sensors use Windows HTTP (WinHTTP) for communication with the MDE cloud portal. WinHTTP settings are independent of Windows Internet (WinINet) browsing proxy settings.
•	WinHTTP automatically discovers proxy settings via: 
o	Transparent proxy
o	Web Proxy Autodiscovery Protocol (WPAD)
•	If your network uses a transparent proxy or WPAD, no specific WinHTTP configuration is necessary. The MDE sensor runs under the LocalSystem account.
•	Key takeaway: Only if auto-discovery fails or a specific proxy configuration is required, manual configuration is necessary. The document links to further resources on proxy configuration for Windows, Linux, and macOS.

MDE URLs to Whitelist:
•	Devices must meet minimum component (app/antimalware platform, engine, EDR sensor) update versions and OS requirements for successful onboarding.
•	URLs are essential for core MDE functionality.
•	In disconnected environments (no internet access), web & network protection and SmartScreen connectivity are optional.

Connectivity Types and URL Whitelisting:
•	Standard Connectivity: Requires whitelisting a large number of URLs (around 106 originally).
•	Streamlined Connectivity: Reduces the number of URLs requiring whitelisting (around 93 currently).

Feedback and Suggestions for Improvement:
The document expresses concern that even "streamlined" connectivity still requires whitelisting too many URLs. A suggestion is made to consolidate URLs under more generic domains (e.g., *.endpoint.security.microsoft.com) to simplify management and reduce the number of required firewall rules. Specific examples are provided for consolidating URLs related to SmartScreen, Linux/macOS updates, security intelligence, Windows certificates, and vulnerability management. The goal is to reduce the number of required whitelisted URLs to a minimum (ideally around 6 based on the suggestions).

Notes
•	IPv6-only traffic is not supported.
•	Devices can be configured automatically using AutoDiscovery and AutoConfigFile.
•	The document provides links to Microsoft documentation for configuring proxy settings on Windows, Linux, and macOS.

Conclusion
MDE requires network connectivity for data reporting and communication with the cloud portal. While specific bandwidth and storage requirements are not detailed here, they should be planned. Proxy configuration is generally automatic if a transparent proxy or WPAD is in use. If not, manual configuration is required, and the document provides links to resources for different operating systems. A key challenge is the large number of URLs that need to be whitelisted. While "streamlined" connectivity has reduced this number, there is a strong push for further consolidation to simplify network management. The document provides concrete suggestions for reducing the number of required URLs by grouping them under broader, more manageable domains. Finally, IPv6 is not supported, and auto-configuration options are available.

**Data Storage and Retention**

Microsoft Defender for Endpoint (MDE) data storage and retention has the following key characteristics:
•	Storage Location: MDE data is stored in Azure data centers located in the US, UK, or EU. The region is selected during initial setup and cannot be changed afterwards. While some pseudonymized data might be stored in central US systems, the primary storage location is tied to the initial selection. MDE data storage location mirrors that of Microsoft Defender XDR.
•	Data Retention: The default retention period for most MDE data is 180 days (six months). Advanced hunting data is retained for only 30 days. Even after contract termination, data is retained for 180 days.
•	Access and Configuration: Settings are accessed via the Microsoft 365 Defender portal: https://security.microsoft.com > Settings > Endpoints > General > Data Retention > Data Storage.
•	Data Sharing: MDE shares data with other Microsoft services like Sentinel, Microsoft Defender for Cloud (MDC), and Microsoft Tunnel for Mobile Application Management (Android).
•	Cloud Storage: MDE utilizes cloud storage, so no on-premises configuration is required. While there are no on-premises settings, users should consider data storage tiers (standard/premium) and enabling data compression to optimize costs. Setting appropriate data retention policies is also crucial.


What data is collected by M365D?
Information collected includes 
1.	File data such as file names, sizes, and hashes
2.	Process data such as running processes, hashes 
3.	Registry data 
4.	Network connection data (host IPs and ports) 
5.	Device data such as device identifiers, names, and the operating system version
 
Data collected used for:
•	Proactively identify indicators of attack (IOAs) in your organization
•	Generate alerts if a possible attack was detected
•	Provide your security operations with a view into devices, files, and URLs related to threat signals from your network, enabling you to investigate and explore the presence of security threats on the network.
 
Microsoft does not use your data for advertising.
 
Data protection and encryption
•	M365D uses state of the art data protection technologies which are based on Microsoft Azure infrastructure.
•	In all scenarios, data is encrypted using 256-bit AES encryption at the minimum.
•	Azure Key vault is used to store the keys used for encryption. 
 
Is my data isolated from other customer data?
Yes, your data is isolated through access authentication and logical segregation based on customer identifier. Each customer can only access data collected from its own organization and generic data that Microsoft provides.
•	Required Permissions: global administrator or security administrator
•	Navigate to MDE portal: https://security.microsoft.com/ Settings Endpoints General  Data Retention  Data Storage US/UK/EU
•	We cannot change data location and cannot move data.
•	Data Retention: 6 Months Default
•	MDE data can be stored at US, UK EU.
•	We cannot change your data storage location after the first-time setup.
