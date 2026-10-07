# Introduction

**Extended Detection and Response (XDR)**

XDR system is designed to deliver an intelligent, automated, and integrated security across an organization’s different domains.

It helps prevent, detect, and respond to threats across identities, endpoints, applications, email, IoT, infrastructure, and cloud platforms.

**Microsoft Defender XDR** is integrated threat protection suite with solutions that detect malicious activity across email, endpoints, applications, and identity. Provide a complete attack chain compromise story that enables a complete understanding of the threat.

 

**Microsoft Defender XDR: A Unified Security Platform**

Microsoft Defender XDR provides a comprehensive solution for managing and responding to security threats. Here's a breakdown of its key features:

- **Dashboard:** Offers a centralized view of your security posture, including key metrics, alerts, and Secure Score.

- **Incident Management:** Streamlines the process of managing and responding to security alerts and incidents.

- **Threat Hunting:** Enables proactive searching for threats and vulnerabilities.

- **Automated Response:** Allows for automated responses to threats, such as quarantining devices.

- **Threat Analytics:** Provides insights into threat trends and patterns.

- **Asset Management:** Offers a detailed view of devices, including their security status, vulnerabilities, and compliance.

- **Email & Collaboration Security:** Allows for configuration of security policies for email and collaboration tools like Microsoft 365.

- **Reporting:** Provides access to various security reports for analysis and compliance.

Essentially, Microsoft Defender XDR combines elements of SIEM and XDR to offer a holistic approach to security. It's designed to simplify security management, improve threat detection, and accelerate response times.

What is most important SIEM or XDR for organizations?

Both SIEM and XDR are important security solutions for organizations, but they have different strengths and weaknesses.

SIEM solutions are better at collecting and analysing large volumes of data, while XDR solutions are better at detecting and responding to threats across multiple security silos.

<table>
<colgroup>
<col style="width: 10%" />
<col style="width: 43%" />
<col style="width: 45%" />
</colgroup>
<thead>
<tr>
<th></th>
<th>SIEM</th>
<th>XDR</th>
</tr>
</thead>
<tbody>
<tr>
<td>Strengths</td>
<td><ul>
<li><p>Collects and analyses large volumes of data from a variety of sources</p></li>
<li><p>Provides a central view of security posture</p></li>
<li><p>Can be used to generate reports for compliance purposes</p></li>
</ul></td>
<td><ul>
<li><p>Detects and responds to threats across multiple security silos</p></li>
<li><p>Uses advanced analytics to detect threats that may not be visible to traditional SIEM systems</p></li>
<li><p>Can automate many of the tasks involved in threat detection and response</p></li>
</ul></td>
</tr>
<tr>
<td>Weaknesses</td>
<td><ul>
<li><p>Can be complex and expensive to implement and maintain</p></li>
<li><p>Can generate many false positives</p></li>
<li><p>May not be able to detect and respond to threats that span multiple security silos</p></li>
</ul></td>
<td><ul>
<li><p>May not be as good at collecting and analysing large volumes of data as SIEM systems</p></li>
<li><p>Can be expensive to implement and maintain</p></li>
<li><p>May not be as mature as SIEM systems</p></li>
</ul></td>
</tr>
<tr>
<td></td>
<td>Focuses on collecting and analysing large volumes of security data for compliance and threat detection. It's great for organizations needing strong auditing and log management capabilities.</td>
<td>Prioritizes threat detection and response across multiple security layers (email, endpoints, cloud, etc.). It excels at correlating data from different sources to identify and respond to sophisticated attacks.</td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

# Benefits

- **Integrated threat protection:** MICROSOFT DEFENDER XDR integrates all of your threat protection tools into a single platform, providing a unified view of your security posture and making it easier to identify and respond to threats.

- **AI-powered insights:** MICROSOFT DEFENDER XDR uses AI to identify threats and anomalies that may be missed by traditional security solutions. This helps you to focus your security resources on the most important threats.

- **Automated security workflows:** MICROSOFT DEFENDER XDR can automate common security workflows, such as incident response and threat hunting. This frees up your security team to focus on more strategic tasks.

- **Scalability and performance:** MICROSOFT DEFENDER XDR is a cloud-native platform that can scale to meet the needs of even the largest organizations. It also offers high performance and reliability.

<!-- -->

- **Unified Incident View:** Correlates alerts from different security products (e.g., Defender for Office 365, Defender for Endpoint, Defender for Cloud Apps) into a single incident, providing a holistic view of the threat. This simplifies threat analysis and response.

- **Integrated Threat Detection and Response (XDR):** Combines signals from identity, endpoints, email, and applications for comprehensive threat detection and mitigation.

- **Automated Remediation and Containment:** Provides automated threat remediation and containment capabilities, including:

  - Automated or analyst-approved remediation of detected threats.

  - Sharing threat intelligence across Microsoft security tools.

  - Integration with Intune and Conditional Access in Microsoft Entra ID to restrict access to corporate resources from infected devices.

  - Automated restoration of access upon threat remediation.

- **Improved Security Posture:** Helps mitigate risk by preventing attackers from accessing corporate resources while minimizing disruption to user productivity.

# Coverage

Here is a summarized and corrected version of the Microsoft Defender XDR coverage information:

**Microsoft Defender XDR Coverage:**

- **Broad Environment Coverage:** Protects diverse environments, including:

  - Cloud (Microsoft Azure, AWS, GCP)

  - On-premises (Windows, Linux servers, network devices)

  - Hybrid (combining cloud and on-premises resources)

- **Comprehensive Asset Monitoring:** Monitors a wide range of enterprise assets across different technology generations:

  - Network

  - Infrastructure and applications

  - Platform as a Service (PaaS)

  - Operational Technology/Internet of Things (OT/IoT)

  - Identity and Access Management (IAM)

  - Endpoints

  - Software as a Service (SaaS) applications

  - Information and data

# Pre-requisites

To implement Microsoft Defender XDR, you need:

1.  **A qualifying Microsoft 365 subscription:** This includes Microsoft 365 E5, E5 Security, Business Premium, or Defender XDR for Business.

2.  **Supported operating systems and platforms:** Windows 10/11, Windows Server 2012+, macOS, Linux, Android, and iOS.

3.  **Supported devices:** Computers, laptops, mobile devices, and servers.

4.  **The latest Defender XDR agent:** Installed on all supported devices to collect and transmit data.

5.  **Network connectivity:** A connection to the Microsoft 365 cloud for data transfer, updates, and security intelligence.

Meeting these requirements enables Defender XDR implementation. Further details can be found in the official documentation: <https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/?view=o365-worldwide>

# Subscriptions and Pricing

| License | Cost per license per month (₹) |
|----|:--:|
| Microsoft 365 E3 | ₹850‎ ‎ |
| Microsoft Enterprise Mobility + Security E5 | ₹1,370‎ |
| Microsoft Defender for Endpoint Plan 1 | ₹250‎ |
| Microsoft Defender for Endpoint Plan 2 | ₹435 |
| Microsoft Defender for Identity | ₹460 |
| Microsoft Defender for Cloud Apps | ₹290 |
| Microsoft Defender Vulnerability Management | ₹250 |
| Microsoft Defender for Business | ₹250 |
| Microsoft Defender for Threat Intelligence | ₹346,645 |
| Microsoft Entra P1 | ₹500 |
| Microsoft Entra P2 | ₹750 |

 

 

| License | Cost per month (\$) |
|:--:|:--:|
| Microsoft Defender for server’s plan 2 | \$15 |
| Microsoft Defender for server’s plan 1 | \$5 |
| Microsoft Defender for app service | \$15 |
| Microsoft Defender for Database | \$15 |
| Microsoft Defender for Storage | \$10 per storage account |
| Microsoft Defender for Containers | \$7 per vm core |
| Microsoft Defender for Key Vault | \$0.25 per key vault |
| Microsoft Defender for Resource manager | \$5 per subscription |
| Microsoft Defender for APIs | \$200 up to 1million API calls in month |

 

# RBAC and Permissions

global administrator or security administrator

To manage Microsoft Defender for Endpoint within Microsoft Defender XDR, you need to assign appropriate roles and permissions. This is done via Role-Based Access Control (RBAC).

**Enabling Roles:**

1.  In the Microsoft Defender XDR portal, navigate to *Settings \> Endpoints \> Permissions \> Roles*.

2.  Turn on roles if they are not already enabled.

**Assigning Roles:**

1.  Click "Add item" to create a new role.

2.  Give the role a name and select the appropriate permissions.

3.  Assign the role to users or groups. Changes to device group configuration require applying the changes.

**Built-in Azure AD Roles (for managing access to Microsoft Defender XDR):**

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
<li><p><strong>Email and Collaboration quarantine (manage):</strong> View and release emails and messages from quarantine</p></li>
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

  

# Data Storage

Microsoft Defender XDR data storage and retention are configured within the Microsoft 365 Defender portal ([https://security.microsoft.com](https://security.microsoft.com/)) under Settings -\> Endpoints -\> General -\> Data Retention -\> Data Storage.

- **Data Residency:** Data is stored in either the US, UK, or EU. The initial region selected during setup *cannot* be changed after configuration. Data cannot be moved between these regions.

- **Data Retention:** The default retention period is 6 months.

- **Storage Details:** Microsoft Defender XDR uses its own internal storage for logs. Specific details about this storage are not publicly disclosed for security reasons.

# Email notifications

- incident/threat analytics

- Preview features

# Threat Prevention

How to perform threat protection in Microsoft Defender XDR?

Microsoft Defender XDR is a unified XDR (extended detection and response) platform that provides integrated threat protection across endpoints, identities, email, and applications. It uses machine learning and artificial intelligence (AI) to identify and respond to sophisticated attacks.

Microsoft Defender XDR includes the following products and solutions:

- **Microsoft Defender for Endpoint:** Protects devices from malware, viruses, and other threats.

- **Microsoft Defender for Office 365:** Protects email and collaboration tools from phishing attacks, spam, and other threats.

- **Microsoft Defender for Identity:** Protects identities from unauthorized access and malicious activity.

- **Microsoft Defender for Cloud Apps:** Protects cloud applications from data breaches and other threats.

Microsoft Defender XDR provides several key benefits, including:

- **Integrated threat protection:** Microsoft Defender XDR integrates all your threat protection tools into a single platform, providing a unified view of your security posture and making it easier to identify and respond to threats.

- **AI-powered insights:** Microsoft Defender XDR uses AI to identify threats and anomalies that may be missed by traditional security solutions. This helps you to focus your security resources on the most important threats.

- **Automated security workflows:** Microsoft Defender XDR can automate common security workflows, such as incident response and threat hunting. This frees up your security team to focus on more strategic tasks.

- **Scalability and performance:** Microsoft Defender XDR is a cloud-native platform that can scale to meet the needs of even the largest organizations. It also offers high performance and reliability.

Microsoft Defender XDR can be used to protect a wide range of environments, including:

- **Cloud environments**: Microsoft Defender XDR can monitor and protect cloud environments such as Microsoft Azure, Amazon Web Services (AWS), and Google Cloud Platform (GCP).

- **On-premises environments:** Microsoft Defender XDR can also monitor and protect on-premises environments, such as Windows and Linux servers, as well as network devices.

- **Hybrid environments:** Microsoft Defender XDR can monitor and protect hybrid environments that combine cloud and on-premises resources.

Here are some specific examples of how Microsoft Defender XDR can be used to protect your organization from threats:

- **Prevent malware infections**: Microsoft Defender for Endpoint uses machine learning to identify and block malware before it can infect your devices. It also provides real-time protection against malware and viruses.

- **Protect against phishing attacks**: Microsoft Defender for Office 365 uses AI to identify and block phishing emails. It also provides real-time protection against spam and other email threats.

- **Detect and respond to identity attacks**: Microsoft Defender for Identity uses AI to detect unauthorized access to user accounts and other suspicious activity. It can also generate alerts and automate remediation steps, such as resetting passwords or locking out accounts.

- **Prevent data breaches in cloud applications**: Microsoft Defender for Cloud Apps uses AI to detect suspicious activity in cloud applications and to identify and protect sensitive data. It can also generate alerts and automate remediation steps, such as blocking access to unauthorized users or encrypting sensitive data.

Overall, Microsoft Defender XDR is a powerful integrated threat protection platform that can help organizations of all sizes to improve their security posture and protect themselves from sophisticated attacks.

How to perform threat protection in MICROSOFT DEFENDER XDR?

MICROSOFT DEFENDER XDR is a unified XDR (extended detection and response) platform that provides integrated threat protection across endpoints, identities, email, and applications. It uses machine learning and artificial intelligence (AI) to identify and respond to sophisticated attacks.

How do you configure XDR policies and alerts?

- **Define Your Scope:**

  - **Prioritize Assets:** Identify your most critical assets (servers, databases, user accounts) to prioritize protection.

  - **Threat Modelling:** Analyze potential threats and attack vectors relevant to your organization. This helps you focus on the most likely and impactful alerts.

- **Configure Alert Rules:**

  - **Granular Conditions:** Define specific conditions for triggering alerts. Examples:

    - File activity in sensitive directories

    - Suspicious login attempts from unusual locations

    - Network connections to known malicious IPs

  - **Severity Levels:** Assign severity levels (e.g., low, medium, high, critical) to each alert based on potential impact.

- **Establish Alerting Workflow:**

  - **Notification Channels:** Set up notifications via email, SMS, SIEM, or SOAR platforms.

  - **Recipient Groups:** Create groups (e.g., security team, IT administrators) to receive alerts based on severity and type.

  - **Escalation Procedures:** Define how alerts are escalated for investigation and response (e.g., automatic escalation for critical alerts).

- **Policy Optimization:**

  - **Alert Grouping:** Create policies to group related alerts for easier management and response.

  - **Suppression Rules:** Configure rules to suppress false positives or known benign events.

  - **Tuning:** Regularly review and adjust alert thresholds and rules to reduce noise and improve accuracy.

- **Testing and Monitoring:**

  - **Simulate Attacks:** Conduct regular tests to validate alert rules and response procedures.

  - **Continuous Monitoring:** Monitor alert activity, investigate trends, and fine-tune your XDR configuration to adapt to new threats.

**Key Considerations:**

- **Risk-Based Approach:** Focus on the most critical assets and threats to your organization.

- **Layered Approach:** Use a combination of preventative measures, detection rules, and response actions.

- **Automation:** Automate responses to common threats to improve efficiency and reduce response times.

**Important Note:** The specific steps and options for configuring XDR policies and alerts will vary depending on the XDR solution you are using (e.g., Microsoft Defender XDR, SentinelOne, CrowdStrike). Consult the documentation for your specific XDR product for detailed instructions.

## Vulnerability Management

- Discovers vulnerable and misconfigured devices based on known attack vectors and software vulnerabilities.

- **Exposure Score:** Current exposure associated with machines in organization (Less is good)

- Secure Score: Shows collective security configuration posture of machines (High is good)

  - OS

  - Application

  - Network

  - Account

  - Security Controls

- **Exposure Distribution**: Exposed machines are easy targets for attacks, High Medium and Low.

- **Top Security Recommendations**: Based on highest organizational exposure impact.

**How to download vulnerability scan report from Microsoft Defender XDR?**

To download a vulnerability scan report from Microsoft Defender XDR, you can follow these steps:

1.  Go to the Microsoft Defender XDR portal.

2.  Click Endpoints \> Vulnerabilities.

3.  In the Vulnerabilities table, click the Export button.

4.  In the Export Vulnerabilities dialog box, select the CSV or JSON format for the report.

5.  Click the Export button to download the report.

The report will contain information about the vulnerabilities that were found, including the vulnerability identifier, the severity of the vulnerability, and the affected devices.

Here are some additional tips for downloading vulnerability scan reports from Microsoft Defender XDR:

- You can filter the Vulnerabilities table before exporting the report to include only the vulnerabilities that you are interested in.

- You can also export the report to a specific date range.

- You can schedule the report to be exported on a regular basis.

Once you have downloaded the report, you can use it to identify and prioritize vulnerabilities to be remediated.

## Attack Surface Reductions

**Attack surface reduction (ASR)** rules in Microsoft Defender focus on mitigating vulnerabilities by restricting software behaviors that could be exploited by attackers. These rules target specific actions or functionalities that might be risky but are sometimes used in legitimate scenarios.

- **Application contro**l: Use application control so that your applications must earn trust in order to run.

- Attack Surface Reduction is hardening the places where a threat is likely to attack.

- **Attack surface reduction rules** reduce attack surface in apps with intelligent rules (Need Microsoft Defender Antivirus)

<!-- -->

- **Block malicious activity:** Some ASR rules can directly block suspicious activities that are commonly used in malware attacks

<!-- -->

- **Controlled folder access:** Help prevent malicious or suspicious apps (including file-encrypting ransomware malware) from making changes to files in your key system folders (Requires Microsoft Defender Antivirus)

- **Device control:** Protects against data loss by monitoring and controlling media used on devices, such as removable storage and USB drives, in your organization.

- **Exploit protection:** Help protect operating systems and apps your organization uses from being exploited. Exploit protection also works with third-party antivirus solutions.

- **Hardware-based isolation**: Protects integrity of system during start and running, validate system integrity with local and remote attestation, and Use container isolation for Microsoft Edge to help guard against malicious websites.

<!-- -->

- **Mitigate vulnerabilities:** ASR rules can address vulnerabilities in software or misconfigurations that attackers might try to leverage.

<!-- -->

- **Network protection:** Extend protection to your network traffic and connectivity on your organization's devices. (Requires Microsoft Defender Antivirus)

<!-- -->

- **Reduce the attack surface:** By limiting potentially risky behaviours, ASR makes it harder for attackers to gain a foothold in your system.

<!-- -->

- **Web protection:** Secure your devices against web threats and help you regulate unwanted content.

  - **Attack Surface Reduction**

    - Attack Surface Reduction is hardening the places where a threat is likely to attack.

    - Components of attack surface reduction:

      - **Attack surface reduction rules**: Reduce attack surface in apps with intelligent rules (Need Microsoft Defender Antivirus)

      - **Hardware-based isolation**:

        - Protects integrity of system during start and running.

        - Validate system integrity with local and remote attestation.

        - Use container isolation for Microsoft Edge to help guard against malicious websites.

      - **Application contro**l: Use application control so that your applications must earn trust in order to run.

      - **Exploit protection:** Help protect operating systems and apps your organization uses from being exploited. Exploit protection also works with third-party antivirus solutions.

      - **Network protection:** Extend protection to your network traffic and connectivity on your organization's devices. (Requires Microsoft Defender Antivirus)

      - **Web protection:** Secure your devices against web threats and help you regulate unwanted content.

      - **Controlled folder access:** Help prevent malicious or suspicious apps (including file-encrypting ransomware malware) from making changes to files in your key system folders (Requires Microsoft Defender Antivirus)

      - **Device control:** Protects against data loss by monitoring and controlling media used on devices, such as removable storage and USB drives, in your organization.

Components of attack surface reduction:

- **Attack surface reduction rules (**Need Microsoft Defender Antivirus)

- **Enable Hardware-based isolation for Microsoft Edge:**

  - Protects integrity of system during start and running.

  - Validate system integrity with local and remote attestation.

  - Use container isolation for Microsoft Edge to help guard against malicious websites.

- **Application control:**

  - Use application control so that your applications must earn trust in order to run,

- **Exploit protection**

  - Help protect operating systems and apps your organization uses from being exploited.

  - Exploit protection also works with third-party antivirus solutions.

- **Network protection:**

  - Extend protection to your network traffic and connectivity on your organization's devices. (Requires Microsoft Defender Antivirus)

- **Web protection:**

  - Secure your devices against web threats and help you regulate unwanted content.

- **Controlled folder access**

  - Help prevent malicious or suspicious apps (including file-encrypting ransomware malware) from making changes to files in your key system folders (Requires Microsoft Defender Antivirus)

- **Device control**

  - Protects against data loss by monitoring and controlling media used on devices, such as removable storage and USB drives, in your organization.

The steps to configure XDR policies and alerts may vary depending on the specific XDR solution you are using. However, the general process is as follows:

1.  Identify the types of alerts that you want to receive. This may include alerts for specific threats, such as malware infections and ransomware attacks, or alerts for general security events, such as suspicious login attempts and network traffic anomalies.

2.  Configure the severity of each alert. The severity of an alert indicates the importance of the alert and the recommended response action. For example, you may want to configure alerts for high-severity threats to be automatically escalated to a security team member for immediate investigation.

3.  Configure the notification channels for each alert. This may include sending notifications via email, SMS, or Slack. You can also configure notifications to be sent to specific individuals or groups of people.

4.  Create alert policies. Alert policies allow you to group alerts together and to configure common settings for the alerts in the group. For example, you may want to create an alert policy for all high-severity alerts and configure the policy to automatically send notifications to a security team member.

5.  Apply alert policies to your XDR environment. Once you have created alert policies, you need to apply them to your XDR environment. This will ensure that the alerts are generated and sent according to the policies that you have configured.

Here are some additional tips for configuring XDR policies and alerts:

- Use a risk-based approach. When configuring XDR policies and alerts, it is important to use a risk-based approach. This means that you should prioritize the alerts that are most likely to pose a risk to your organization.

- Use a layered approach. You should use a layered approach to alerting. This means that you should configure alerts to be generated at different levels of severity, and you should configure different notification channels for each level of severity. This will help you to ensure that you are alerted to the most important threats in a timely manner.

- Test your alerts. Once you have configured XDR policies and alerts, you should test them to make sure that they are working properly. You can do this by generating test events in your XDR environment and verifying that the alerts are generated and sent according to the policies that you have configured.

- Monitor your alerts. Once you have configured XDR policies and alerts, you should monitor the alerts to identify any trends or patterns. This can help you to identify new threats and to improve your security posture.

By following these steps and tips, you can configure XDR policies and alerts to improve your security posture and to protect your organization from threats.

**Attack Surface Reduction**

- Attack Surface Reduction is hardening the places where a threat is likely to attack.

- Components of attack surface reduction:

- **Attack surface reduction rules**: Reduce attack surface in apps with intelligent rules (Need Microsoft Defender Antivirus)

- **Hardware-based isolation:**

  - Protects integrity of system during start and running.

  - Validate system integrity with local and remote attestation.

  - Use container isolation for Microsoft Edge to help guard against malicious websites.

- **Application control**: Use application control so that your applications must earn trust in order to run.

- **Exploit protection:** Help protect operating systems and apps your organization uses from being exploited. Exploit protection also works with third-party antivirus solutions.

- **Network protection:** Extend protection to your network traffic and connectivity on your organization's devices. (Requires Microsoft Defender Antivirus)

- **Web protection:** Secure your devices against web threats and help you regulate unwanted content.

- **Controlled folder access:** Help prevent malicious or suspicious apps (including file-encrypting ransomware malware) from making changes to files in your key system folders (Requires Microsoft Defender Antivirus)

- **Device control:** Protects against data loss by monitoring and controlling media used on devices, such as removable storage and USB drives, in your organization.

ASR Rules

Block abuse of exploited vulnerable signed drivers

Block Adobe Reader from creating child processes

Block all Office applications from creating child processes

Block credential stealing from the Windows local security authority subsystem (lsass.exe)

Block executable content from email client and webmail

Block executable files from running unless they meet a prevalence, age, or trusted list criterion

Block execution of potentially obfuscated scripts

Block JavaScript or VBScript from launching downloaded executable content

Block Office applications from creating executable content

Block Office applications from injecting code into other processes

Block Office communication application from creating child processes

Block persistence through WMI event subscription

Block process creations originating from PSExec and WMI commands

Block rebooting machine in Safe Mode (preview)

Block untrusted and unsigned processes that run from USB

Block use of copied or impersonated system tools (preview)

Block Webshell creation for Servers

Block Win32 API calls from Office macros

Use advanced protection against ransomware

## MDC Recommendations

[Microsoft-Defender-for-Cloud/Remediation scripts at main · Azure/Microsoft-Defender-for-Cloud · GitHub](https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Remediation%20scripts)

## Endpoint security 

Endpoint protection should be installed on your machines

Endpoint protection health issues should be resolved on your machines

Check status of Microsoft Defender Antivirus: \>Get-MpComputerStatus

List of Antivirus health issues:

- Any of the following properties are false:

  - AMServiceEnabled

  - AntispywareEnabled

  - RealTimeProtectionEnabled

  - BehaviorMonitorEnabled

  - IoavProtectionEnabled

  - OnAccessProtectionEnabled

Update settings of Microsoft Defender Antivirus: \>Add-MpPreference

Get the history of detected threat: \>Get-MpThreat

Get the known threats from definition catalog: \>Get-MpThreat

Remove active threats from machine: \>Remove-MpThreat

Configure the Windows defender scan and updates: \>Set-MpPreference

Start Antimalware scan: \>Start-MpScan

Start offline Antimalware scan: \>Start-MpWDOScan

Update Signature: \>Update-MpSignature

Reference URL: https://learn.microsoft.com/en-us/azure/defender-for-cloud/endpoint-protection-recommendations-technical

Windows Defender Exploit Guard should be enabled on your machines

**Windows Defender exploit guard components:**

- Attack surface reduction

- Controlled folder access

- Exploit protection

- Network protection

**Exploit protection**

Azure Defender for servers should be enabled

Endpoint protection should be installed on your machines

Endpoint protection solution should be installed on VMs scale sets

Endpoint protection health issues should be resolved on your machines

Windows Defender Exploit Guard should be enabled on your machines

## Network security 

Adaptive network hardening on internet facing VMs

Adaptive Network Hardening provides a more granular recommendation based on the traffic it has analysed. This is add-on feature to NSG. For instance, we have VM in azure we use as Jump Box to administer Azure assets. We can access jump box on RDP/3389, we allowed traffic from 10.0.0.0/24 subnet. Adaptive network hardening will analyse this traffic and make recommendations to reduce the scope of subnet.

MDC needs to collect data for at least 30 days to provide recommendations for adaptive network hardening.

Adaptive network hardening provides recommendations to further harden the NSG rules.

While remediating the recommendation for Adaptive network hardening, we need to enforce rules, those enforced rules are added in NSG (may be attached to subnet/NIC) which is protecting the VM.

All Internet traffic should be routed via your deployed Azure Firewall

All network ports should be restricted on network security groups associated to your VMs

API Management services should use a VNET

App Configuration should use private link

Authorized IP ranges should be defined on Kubernetes Services

Azure Cache for Redis should reside within a VNET

Azure Cosmos DB accounts should have firewall rules

Azure DDoS Protection Standard should be enabled

Azure Event Grid domains should use private link

Azure Event Grid topics should use private link

Azure Key Vault should disable public network access

Azure Machine Learning workspaces should use private link

Azure SignalR Service should use private link

Azure Spring Cloud should use network injection

Cognitive Services accounts should disable public network access

Cognitive Services accounts should restrict network access

Container registries should not allow unrestricted network access

Container registries should use private link

Internet-facing VMss should be protected with Network Security Groups"

IP Forwarding on your VMs should be disabled

Latest TLS version should be used in your API App

Latest TLS version should be used in your Function App

Latest TLS version should be used in your Web App

Management ports of VMss should be protected with just-in-time network access control

Management ports should be closed on your VMss

Non-internet-facing VMss should be protected with network security groups

Private endpoint connections on Azure SQL Database should be enabled

Private endpoint should be configured for Key Vault

Private endpoint should be enabled for MariaDB servers

Private endpoint should be enabled for MySQL servers

Private endpoint should be enabled for PostgreSQL servers

Public network access on Azure SQL Database should be disabled

Public network access should be disabled for MariaDB servers"

Public network access should be disabled for MySQL servers

Public network access should be disabled for PostgreSQL servers

Storage account public access should be disallowed

Storage accounts should restrict network access

Storage accounts should restrict network access using VNET rules

Storage accounts should use private link

Subnets should be associated with a Network Security Group

VM Image Builder templates should use private link

Web Application Firewall (WAF) should be enabled for Application Gateway

Web Application Firewall (WAF) should be enabled for Azure Front Door Service

Adaptive network hardening on internet facing VMs

All Internet traffic should be routed via your deployed Azure Firewall

All network ports should be restricted on network security groups associated to your VMs

API Management services should use a VNET

App Configuration should use private link

Authorized IP ranges should be defined on Kubernetes Services

Azure Cache for Redis should reside within a VNET

Azure Cosmos DB accounts should have firewall rules

Azure DDoS Protection Standard should be enabled

Azure Defender for DNS should be enabled

Azure Event Grid domains should use private link

Azure Event Grid topics should use private link

Azure Key Vault should disable public network access

Azure Machine Learning workspaces should use private link

Azure SignalR Service should use private link

Azure Spring Cloud should use network injection

Cognitive Services accounts should disable public network access

Cognitive Services accounts should restrict network access

Container registries should not allow unrestricted network access

Container registries should use private link

Internet-facing VMss should be protected with Network Security Groups"

IP Forwarding on your VMs should be disabled

Latest TLS version should be used in your API App

Latest TLS version should be used in your Function App

Latest TLS version should be used in your Web App

Management ports of VMSS should be protected with just-in-time network access control

Management ports should be closed on your VMSS

Non-internet-facing VMSS should be protected with network security groups

Private endpoint connections on Azure SQL Database should be enabled

Private endpoint should be configured for Key Vault

Private endpoint should be enabled for MariaDB servers

Private endpoint should be enabled for MySQL servers

Private endpoint should be enabled for PostgreSQL servers

Public network access on Azure SQL Database should be disabled

Public network access should be disabled for MariaDB servers"

Public network access should be disabled for MySQL servers

Public network access should be disabled for PostgreSQL servers

Storage account public access should be disallowed

Storage accounts should restrict network access

Storage accounts should restrict network access using VNET rules

Storage accounts should use private link

Subnets should be associated with a Network Security Group

VM Image Builder templates should use private link

Web Application Firewall (WAF) should be enabled for Application Gateway

Web Application Firewall (WAF) should be enabled for Azure Front Door Service

# Threat Detection

**How to create rule that runs every hour and stops running if single alert is generated?**

On Analytics rule wizard select - Run query every 1 hour (Query scheduling), Enable Stop running query after alert is generated. (Suppression)

** **

**How to identify origin of cyber-attack and potential data loss?**

Use analytic rule in sentinel

** **

**Identify malicious RDP connection activity through Sentinel**

"Enable anomalous RDP login detection rules" Pre-requisites for this rule are: Select event set other than "None" and Collect security events or Windows security events with Event ID-4624

**Detect newly created Storage Accounts**

AzureActivity \| where OperationName == "Create Storage account" \| where ActivityStatus == "Succeeded"

**Detect all deleted operations through Sentinel**

AzureActivity \| where OperationNameValue contains "SecurityInsights" \| where OperationName contains "Delete" \| where ActivityStatusValue contains "Succeeded"

**Which solution provides data for manager about creation of new roles?**

Use SecurityIncident table in sentinel.

**How to group alerts in incident with respect to severity or entity in analytics rules?**

Select grouping alerts in to single incident if selected entities match.

How Microsoft Defender detects threats?

- **Data Collection & Correlation:** XDR solutions gather data from various sources (endpoints, networks, cloud) and correlate it to identify threat patterns and relationships. For example, linking endpoint activity with network traffic to detect communication with malicious IPs.

- **Statistical Anomaly Detection:** XDR uses statistical analysis to identify deviations from normal behavior, such as sudden network traffic spikes or unusual user account activity, which may indicate a threat.

- **Threat Intelligence Integration:** XDR incorporates threat intelligence feeds to identify known threats and their indicators of compromise (IOCs), like new malware variants or phishing campaigns.

- **Machine Learning for Threat Identification:** XDR employs machine learning models, trained on historical security data (both malicious and benign), to accurately detect new, unseen threats. For example, a model trained to identify malware samples can scan new files for malicious code, even if the files are previously unknown.

- **Automated Investigation & Response:** Machine learning in XDR can automate threat investigation, helping determine root cause, and suggesting remediation actions, speeding up response times.

- **Enhanced Visibility:** By collecting data from diverse sources, XDR provides a comprehensive view of the security landscape, revealing threats that traditional solutions might miss.

- **Reduced False Positives:** Analytics and machine learning help minimize false positives, allowing security teams to focus on genuine threats and reducing wasted time.

- **Accelerated Detection & Response:** Automation through XDR enables faster threat detection and response, improving overall security effectiveness.

 

Indicators of Attack

please share the list of "Patterns of behaviour" that confirms cyber-attack is happened?

Here is a list of patterns of behaviour that can confirm that a cyber-attack has happened:

- Unusual network activity: This can include a sudden increase in network traffic, spikes in bandwidth usage, or unusual patterns of traffic to and from known malicious IP addresses.

- Unexpected login attempts: This can include failed login attempts from unusual locations, login attempts from known compromised accounts, or successful login attempts followed by unusual activity.

- Changes to system or security configurations: This can include disabling security software, changing system permissions, or installing new software, especially software from untrusted sources.

- Data exfiltration: This can include attempts to transfer large amounts of data out of the network, or the presence of unusual files or folders on the network.

- Ransomware demands: This can include the appearance of ransom notes on systems or the encryption of critical files.

- Performance issues: This can include slow system performance, unexpected reboots, or the unavailability of applications or services.

- User complaints: This can include complaints about unusual activity on systems, problems logging in, or missing files.

It is important to note that no single pattern of behavior is conclusive. However, the presence of multiple patterns of behavior can indicate a high probability that a cyber-attack has occurred.

Here are some additional tips for identifying patterns of behavior that confirm a cyber-attack:

- Look for changes in behavior over time. For example, a sudden increase in network traffic may not be suspicious on its own, but if it is sustained over a period of time, it may be indicative of a cyber-attack.

- Correlate data from multiple sources. For example, you can correlate network traffic data with endpoint logs to identify unusual activity.

- Use threat intelligence feeds. Threat intelligence feeds can provide information about known patterns of behavior associated with cyber-attacks.

By following these tips, you can identify patterns of behavior that confirm a cyber-attack has occurred and take steps to remediate the attack and prevent future attacks.

 

Adding IoC's in Microsoft Defender:

- You can add up to 15000 indicators (Files Hashes, IP addresses, URLs/Domains, Certificates)

- Navigate to Settings - Endpoints - Rules - Indicators

 

**How to add File Hash?**

- **Indicator**: Add File Hash, Title, and Description of Hash, Expiry date for File Hash.

- **Actions:**

  - Response action whenever this file hash is found.

    - Allow

    - Audit

    - Warn

    - Block execution

    - Block and Remediate

  - Alert details: Select Generate alerts

    - Severity: Informational, Low, Medium, High

    - Category: Select Alert category as per MITRE ATT&CK Framework

    - Technique: Select MITRE ATT&CK technique

- **Organizational scope:** All devices in organization

 

 

 

 

 

 

## Visualization in SIEM and XDR

Could you please share real life practical visualizations in SIEM?

Sure. Here are some real-life practical visualizations in SIEM:

- **Geolocation map of security events:** This visualization can be used to show the geographic location of security events, which can be helpful for identifying patterns and trends. For example, if you see a cluster of security events coming from a particular country, this may indicate a targeted attack.

- **Top 10 users generating security events:** This visualization can be used to identify the users who are generating the most security events. This information can be used to investigate potential security incidents or to target security awareness training to the users who need it most.

- **Top 10 source IP addresses for security events**: This visualization can be used to identify the source IP addresses that are generating the most security events. This information can be used to block malicious IP addresses or to investigate potential security incidents.

- **Heatmap of login activity by time of day:** This visualization can be used to identify unusual patterns in login activity. For example, if you see a spike in login activity at an unusual time of day, this may indicate a brute force attack.

- **Trend line of security events by type**: This visualization can be used to identify trends in the types of security events that are occurring. For example, if you see a sharp increase in the number of phishing attacks, this may indicate a new phishing campaign.

- **Network diagram showing the flow of traffic associated with a security event**: This visualization can be used to investigate security incidents by showing how the traffic associated with the incident flowed through your network. This information can be used to identify the source of the attack and to implement mitigation measures.

- **Timeline of security events associated with an incident:** This visualization can be used to investigate security incidents by showing the sequence of events that led to the incident. This information can be used to identify the root cause of the incident and to implement preventive measures.

These are just a few examples of real-life practical visualizations in SIEM. There are many other types of visualizations that can be created, depending on your specific needs and requirements.

## Dashboards 

Type of dashboard

The type of dashboards you need to create in SIEM will depend on your specific needs and requirements.

However, some common dashboards that can be useful include:

- **Executive dashboard** provides a high-level overview of your security posture for executives and other non-technical stakeholders. It should include metrics such as the number of security events, the number of open security incidents, and the top threats detected. This dashboard should be used by executives to make informed decisions about security investments and to track the overall security posture of the organization.

<!-- -->

- **Compliance dashboard** tracks compliance with security policies and regulations. Compliance dashboard should track compliance with security policies and regulations. It should include metrics such as the number of policy violations, the number of open security findings, and the number of outstanding compliance tasks. This dashboard should be used by security managers and compliance officers to ensure that the organization is compliant with all relevant security policies and regulations.

<!-- -->

- **Security overview dashboard** provides a high-level overview of your security posture, used by security analysts and managers to get a quick overview of the security posture of the organization and identify any areas of concern, having metrics such as:

  - Number of security events by type

  - Number of security events by severity level

  - Top source IP addresses for security events

  - Top users generating security events

  - The top applications being targeted by attacks

  - The top threats detected

<!-- -->

- **Incident response dashboard:** Incident response dashboard should provide a single view of all open security incidents, including the status of each incident, the assigned analyst, and the estimated time to resolution. It should also include information about the impacted assets, the root cause of the incident, and the actions taken to mitigate the incident. This dashboard should be used by security analysts and managers to track the progress of incident response activities and ensure that incidents are resolved quickly and effectively. This dashboard should provide a single view of all open security incidents such as:

  - Incident status

  - Incident Owner

  - Estimated time to resolution

<!-- -->

- **Threat hunting dashboard:** This dashboard should provide the tools and data that analysts need to hunt for threats, such as visualizations of network traffic, user activity, and security events. Threat hunting dashboard should provide the tools and data that analysts need to hunt for threats, such as visualizations of network traffic, user activity, and security events. It should also include information about known threats and vulnerabilities. This dashboard should be used by security analysts to proactively identify threats that may not be detected by traditional security solutions.

- **Patching compliance dashboard**

  - Overall patching compliance

  - Windows patching compliance

  - Linux patching compliance

- **Vulnerability tracking dashboard**

  - Total number of vulnerabilities

  - Number of vulnerabilities by severity

  - Number of vulnerabilities having malware kits and exploits

  - Number of vulnerabilities by environment

  - Number of vulnerabilities by product type

  - Top Zero-day vulnerabilities

- **Cloud Security dashboard**

  - Secure score over time

  - Security control implementation by domain

  - Cloud security recommendations by severity

- **Firewall monitoring dashboard**

  - Total Allow/deny traffic

  - Allow/deny traffic by region

  - List resources receiving high number of traffic

  - List of Source Ips of highest inbound traffic

When creating dashboards, it is important to consider the following factors:

- **Audience**: 

  - Who will be using the dashboard? 

  - What is their level of technical expertise?

- **Purpose**: 

  - What is the purpose of the dashboard? 

  - What information do you want to convey?

- **Data**: 

  - What data will you be using to create the dashboard? 

  - How will you prepare the data?

- **Design**: 

  - How will you design the dashboard to be effective and easy to understand?

Tips

- Use a variety of visualization types to convey different types of information.

- Use color coding to highlight important information.

- Use drill-down capabilities to allow users to explore data in more detail.

- Make sure the dashboard is easy to navigate and understand.

- Test the dashboard with users to get feedback.

## Reports 

What reports we need to create in SIEM?

The type of reports you need to create in SIEM will depend on your specific needs and requirements.

- **Security events report:** This report should provide a detailed overview of all security events that have occurred during a specified period. It should include information such as the

  - Type of event

  - Severity level

  - Source IP address

  - Destination IP address.

- **Incident response report:** This report should provide a summary of all open security incidents. It should include information such as:

  - Incident ID

  - Incident Status

  - Assigned analyst

  - Estimated time to resolution.

- **Threat hunting report:** This report should provide a summary of all threat hunting activities. It should include information such as the date and time of the activity, the analyst who performed the activity, and the findings of the activity.

- **Compliance report:** This report should provide a summary of the organization's compliance with security policies and regulations. It should include information such as the policy or regulation that was audited, the findings of the audit, and the actions taken to address any compliance gaps.

- **Executive report:** This report should provide a high-level overview of the organization's security posture for executives and other non-technical stakeholders. It should include metrics such as the number of security events, the number of open security incidents, and the top threats detected.

When creating reports, it is important to consider the following factors:

- **Audience**: Who will be reading the report? What is their level of technical expertise?

- **Purpose**: What is the purpose of the report? What information do you want to convey?

- **Data**: What data will you be using to create the report? How will you prepare the data?

- **Format**: How will you format the report? What sections will it include?

Tips:

- Use a clear and concise writing style.

- Avoid using technical jargon that your audience may not understand.

- Use visuals to illustrate your findings.

- Organize the report in a logical way.

- Proofread the report carefully before distributing it.

## Analytics Rules

Sentinel analytics rules are crucial for threat detection and identifying anomalous behaviour.

They leverage KQL (Kusto Query Language) to analyze data from various sources, correlate events, and pinpoint anomalies.

Key capabilities include:

- **Threat Detection:** The core function is identifying potential security threats.

- **KQL Queries:** Custom KQL queries form the basis of these rules, defining the logic for detecting suspicious activity.

- **Data Correlation:** Rules analyze data from multiple sources to identify correlations and patterns indicative of attacks.

- **Anomaly Detection:** Some rules specifically focus on identifying anomalous behaviour that deviates from established baselines.

- **Alerting:** Rules can trigger alerts based on detected attack techniques, providing real-time notifications of potential incidents.

- **Incident Insights:** Well-designed rules provide valuable insights into attack origin, compromised resources, data loss, and the incident timeline.

**Types of Analytics Rules:**

- **Built-in:** These include Anomaly, Fusion, Machine Learning (ML), and Microsoft security rules.

- **Custom:** These are typically scheduled rules created by users to address specific threats or monitoring needs.

**Analytics Rule Filters:**

- **Severity:** Allows filtering by the severity of the detected threat (e.g., High, Medium, Low).

- **Rule Type:** Filters by the type of rule (e.g., Anomaly, Fusion, Scheduled).

- **Tactics:** Filters by MITRE ATT&CK tactics, categorizing the attack stage (e.g., Initial Access, Lateral Movement).

- **Data Sources:** Filters by the data sources the rule analyzes (e.g., SecurityEvent, AzureActivity).

**Key Actions related to Analytics Rules:**

- **Design and Configuration:** Creating and customizing rules to meet specific requirements.

- **Custom Rule Creation:** Developing KQL queries to detect specific threats.

- **Activation of Microsoft Rules:** Enabling pre-built Microsoft security analytics rules.

- **Connector Configuration:** Setting up scheduled queries provided by connectors.

- **Custom Scheduled Query Configuration:** Defining custom scheduled queries for unique monitoring needs.

- **Incident Creation Logic:** Defining how and when incidents are generated based on rule triggers.

### Analytics Rules Types

Microsoft Sentinel offers several types of analytics rules for threat detection:

- **Scheduled Rules (Custom):**

  - These are the most common type and are created using Kusto Query Language (KQL).

  - They run on a schedule, querying data over a defined lookback period, and trigger alerts based on defined thresholds.

  - These rules can be created from templates stored in GitHub.

  - The process involves defining the KQL query, setting the schedule, and optionally automating responses by associating the rule with a Sentinel Playbook.

- **Near-Real-Time (NRT) Rules:**

  - These rules are designed for rapid threat detection, running queries every minute to analyze the previous minute's events.

  - They are suitable for identifying fast-moving threats.

- **Anomaly Rules:**

  - These rules use statistical analysis to identify unusual patterns and deviations from established baselines.

  - They are effective for detecting zero-day exploits and insider threats.

- **Microsoft Security Rules (Built-in):**

  - These are pre-built rules based on Microsoft's threat intelligence, offering out-of-the-box protection against known threats from Microsoft Defender platforms.

- **Fusion Rules (Built-in):**

  - These rules correlate multiple anomalies and alerts to detect complex, multi-stage attacks.

  - They help identify attack chains by combining information from various sources.

  - Common use cases include detecting data exfiltration, data destruction, denial-of-service attacks, lateral movement, and ransomware.

  - They align with the Cyber Kill Chain framework.

- **Machine Learning (ML) Rules (Built-in):**

  - These rules use machine learning to perform behavioural analytics, such as detecting anomalous SSH or RDP activity.

**Key Differences**

| Rule Type | Trigger | Use Case |
|----|----|----|
| Scheduled | Regular intervals / Custom | General threat detection, compliance monitoring |
| Near-Real-Time | Every minute / Custom | Rapid detection of fast-moving threats |
| Anomaly | Statistical analysis / Custom | Identifying unusual patterns |
| Microsoft Security | Pre-built queries / Built-in | Out-of-the-box threat protection |
| Fusion | Multiple alerts and behaviors / Custom | Detecting complex attack chains |

### QnA

Common and valuable analytics include:

- **User and Entity Behavior Analytics (UEBA):** Uses machine learning to detect anomalies in user and entity behavior, identifying insider threats and advanced persistent threats (APTs).

- **Network Traffic Analysis (NTA):** Identifies suspicious network patterns, such as unusual traffic spikes or communication with known malicious IPs.

- **Threat Intelligence Analytics:** Correlates security events with known threat data, enhancing the detection of sophisticated attacks.

- **Risk Analytics:** Assesses the risk posed by various security threats, enabling prioritization of security efforts.

Custom analytics can be created for specific needs, such as monitoring applications or tracking security team performance. Key considerations when developing analytics include data sources, the intended purpose, and the target audience.

**SIEM Analytics: Practical Examples and Rule Creation in Sentinel**

The document provides examples of implementing these analytics within Microsoft Sentinel, focusing on rule creation:

- **Grouping Alerts into Incidents:** Sentinel analytics rules can group alerts into a single incident based on matching entities (e.g., user, IP address) or severity, consolidating related events for efficient investigation. This is done by selecting the "grouping alerts into a single incident if selected entities match" option in the analytics rule wizard.

- **Scheduled Rules with Alert Suppression:** Rules can be scheduled (e.g., hourly) and configured to stop running after a single alert is generated to prevent alert fatigue. This is achieved by configuring "Query scheduling" to run every hour and enabling "Stop running query after alert is generated" (Suppression).

- **Identifying Cyberattack Origins and Potential Data Loss:** Sentinel analytic rules can investigate attack sources and assess potential data breaches by correlating security events.

- **Detecting Anomalous RDP Activity:** Sentinel's built-in "anomalous RDP login detection rules" identify unusual RDP connections. Prerequisites include enabling the rule, selecting an event set (other than "None"), and collecting Windows Security Events with Event ID 4624 (successful logon).

- **Alerting on Storage Account Creation:** An analytic rule can alert the IT coordinator when a user creates a storage account:

Code snippet

AzureActivity \| where OperationName == "Create Storage account" \| where ActivityStatus == "Succeeded"

- **Viewing Deleted Operations in Sentinel Workspace:**

Code snippet

AzureActivity \| where OperationNameValue contains "SecurityInsights" \| where OperationName contains "Delete" \| where ActivityStatusValue contains "Succeeded"

- **Tracking New Role Creation:** The original document incorrectly suggested using the SecurityIncident table. Role creation information is typically found in Azure Activity logs. Search for operations related to "Role" or "Assignment" within AzureActivity. Security Center can also provide insights into role assignments.

**Key Improvements and Corrections:**

- **Clarity and Structure:** Reorganized for better flow.

- **Kusto Queries:** Formatted for readability.

- **Accuracy:** Corrected the source for tracking role creation (Azure Activity logs or Security Center, not SecurityIncident).

- **Conciseness:** Removed redundant information.

This revised summary is more accurate and organized, emphasizing core concepts, providing practical examples, and correcting inaccuracies. It also clarifies how to achieve specific rule configurations within Sentinel.

>  
>
>  
>
>  

## Workbooks

Microsoft Sentinel Workbooks are a key feature for both **threat detection** and **data visualization**. They analyze and interpret data to identify threats, and they visualize data within the Sentinel workspace using graphs, trends, charts, and dashboards built with KQL (Kusto Query Language).

**Key Functions of Workbooks:**

- **Threat Detection:** Analyze and interpret data to identify potential security threats.

- **Data Visualization:** Present data in a user-friendly format using graphs, charts, trends, and summary dashboards.

**Workbook Features and Capabilities:**

- **KQL-Driven:** All dashboards are powered by KQL queries, enabling flexible data analysis.

- **Built-in Templates and Recommendations:** Microsoft provides pre-built workbooks and recommendations to get started quickly.

- **Customization:** Templates can be customized, and users can create their own workbooks.

- **Advanced Visualizations:** Support for creating sophisticated visual representations of data.

- **Data Analysis:** Facilitate the viewing and analysis of Sentinel data.

- **Incident Metric Tracking:** The Security Operations Efficiency workbook helps monitor and track incident metrics.

Data Normalization and ASIM (Advanced Security Information Model):

ASIM is crucial for consistent data handling. It acts as an intermediary layer between users and data sources, normalizing data according to the robustness principle: "Be strict in what you send and lenient in what you accept." This ensures that data from various sources can be interpreted consistently within workbooks, which is essential for accurate threat detection and analysis.

Practical visualizations in SIEM Workbooks

- **Geolocation map of security events:** This visualization can be used to show the geographic location of security events, which can be helpful for identifying patterns and trends. For example, if you see a cluster of security events coming from a particular country, this may indicate a targeted attack.

- **Top 10 users generating security events:** This visualization can be used to identify the users who are generating the most security events. This information can be used to investigate potential security incidents or to target security awareness training to the users who need it most.

- **Top 10 source IP addresses for security events**: This visualization can be used to identify the source IP addresses that are generating the most security events. This information can be used to block malicious IP addresses or to investigate potential security incidents.

- **Heatmap of login activity by time of day:** This visualization can be used to identify unusual patterns in login activity. For example, if you see a spike in login activity at an unusual time of day, this may indicate a brute force attack.

- **Trend line of security events by type**: This visualization can be used to identify trends in the types of security events that are occurring. For example, if you see a sharp increase in the number of phishing attacks, this may indicate a new phishing campaign.

- **Network diagram showing the flow of traffic associated with a security event**: This visualization can be used to investigate security incidents by showing how the traffic associated with the incident flowed through your network. This information can be used to identify the source of the attack and to implement mitigation measures.

- **Timeline of security events associated with an incident:** This visualization can be used to investigate security incidents by showing the sequence of events that led to the incident. This information can be used to identify the root cause of the incident and to implement preventive measures.

These are just a few examples of real-life practical visualizations in SIEM. There are many other types of visualizations that can be created, depending on your specific needs and requirements.

## User Entity Behaviour 

Identity behaviour of user entities like username, IP, device, through data sources and ML analytics

- Use Cases – MITRE ATT&CK Framework, Tactics and Techniques.

- Data Sources

- Analytics – ML Algorithm

## Notebooks

Microsoft Sentinel notebooks enhance threat hunting by providing a sandbox environment for complex investigations using machine learning, visualizations, and data analysis. They allow for saving and sharing investigations, which is helpful for complex hunts and retaining queries/results.

**Key aspects of Sentinel Notebooks:**

- **Purpose:** Advanced threat hunting.

- **Libraries:**

  - KQLmagic: Simplifies KQL query API access.

  - msticpy: Microsoft Threat Intelligence Python Security tools for investigation and hunting.

**Key aspects of Sentinel Hunting:**

- **Testing Queries:** Use Livestream to continuously test queries against incoming data and trigger alerts on matches. Right-click a query in the Query tab and select "Add to Livestream."

- **Creating Queries:** Sentinel -\> Hunting -\> New Query -\> Fill name and Custom query fields -\> Create.

- **Bookmarking:** Use bookmarks to highlight key events (IoCs, root causes) within query results. Add tags and notes in the bookmark plane before saving. Select rows and click "Add bookmark."

- **Sentinel Roles:**

  - *Responder:* Manages incidents, views reports/workbooks, and updates threat intelligence indicator tags.

  - *Automation Contributor:* Adds playbooks to automation rules.

- **Querying Suspicious Activity:** Use the Hunting option and run all queries.

- **Workbook Elements:**

  - Time Range Label: {Timerange} or {Timerange:label}

  - Time Range KQL Query: {Timerange:query}

- **Workbook Drop-down Filters:** Add parameters -\> Select "resource picker" for parameter type -\> Save.

- **Cloning KQL Queries:** Sentinel -\> Threat management -\> Hunting -\> Select query -\> Click three dots -\> "Clone query" -\> Create.

- **Real-time Alerts (e.g., Storage Account Key Enumeration):** Use Hunting Livestream.

- **Querying Azure Defender Alerts:** SecurityAlert \| where ProductName == "Azure Security Center"

## KQL Queries

Best practices

- Use indexes on your tables to improve the performance of your queries.

- Filter your data as early as possible in your query.

- Use appropriate data types for your columns.

- Avoid using nested queries.

- Use the explain statement to understand the execution plan of your query.

What are some best practices for writing efficient KQL queries?

What are some of the most common KQL functions?

What are the different types of KQL queries?

What is KQL and what is it used for?

How can you use KQL to create dashboards and reports?

How can you use KQL to filter and aggregate data?

How can you use KQL to join and merge data from multiple tables?

Write a KQL query to create a dashboard that shows the number of security events logged by device type, operating system, and severity level.

Write a KQL query to find all devices that have installed a specific software program.

Write a KQL query to find all processes that are running on a specific device and are consuming more than a certain amount of CPU.

Write a KQL query to find all security events that have been logged in the last hour that are related to a specific vulnerability.

Write a KQL query to find all users who have logged in from a specific IP address in the last 24 hours.

What is KQL and what is it used for?

What are the different types of KQL queries?

What are some of the most common KQL functions?

How can you use KQL to filter and aggregate data?

How can you use KQL to join and merge data from multiple tables?

How can you use KQL to create dashboards and reports?

What are some best practices for writing efficient KQL queries?

What are the different types of KQL operators?

What are the different types of KQL data types?

What is the difference between a scalar function and a table function?

What are the different types of KQL aggregates?

What is the difference between a left join and a right join?

What is a subquery and how do you use it in KQL?

What is the difference between a calculated column and a materialized view?

What is a KQL table alias and how do you use it?

What is a KQL union and how do you use it?

What is a KQL common table expression (CTE) and how do you use it?

What is a KQL window function and how do you use it?

What is a KQL pattern matching function and how do you use it?

What is a KQL anomaly detection function and how do you use it?

What are some of the new features in KQL that you are most excited about?

How do you think KQL will be used in the future?

What are some of the challenges of using KQL and how can you overcome them?

What are some of the best resources for learning more about KQL?

What are some of the best practices for using KQL in a production environment?

How can you use KQL to automate your security and compliance tasks?

**Security KQL Questions**

Write a KQL query to find all users who have logged in from a specific IP address in the last 24 hours.

Write a KQL query to find all devices that have installed a specific software program.

Write a KQL query to find all processes that are running on a specific device and are consuming more than a certain amount of CPU.

Write a KQL query to find all security events that have been logged in the last hour that are related to a specific vulnerability.

Write a KQL query to create a dashboard that shows the number of security events logged by device type, operating system, and severity level.

**Compliance KQL Questions**

Write a KQL query to find all users who have access to a specific file or folder.

Write a KQL query to find all devices that have not been patched within the last 30 days.

Write a KQL query to find all security events that are related to a specific compliance requirement.

Write a KQL query to create a report that shows the compliance status of all devices in the organization.

**Performance KQL Questions**

Write a KQL query to identify the top 10 most active users in the organization.

Write a KQL query to identify the top 10 most resource-intensive applications running in the organization.

Write a KQL query to identify the top 10 most common network traffic destinations in the organization.

Write a KQL query to create a dashboard that shows the real-time performance of the organization's network

**Troubleshooting KQL Questions**

What are some common KQL errors and how do you troubleshoot them?

How can you use the KQL explain statement to troubleshoot your queries?

How can you use the KQL trace statement to troubleshoot your queries?

What are some best practices for writing KQL queries that are robust and error-tolerant?

**Advanced KQL Questions**

Write a KQL query to detect anomalous behaviour in user activity.

Write a KQL query to correlate security events from multiple sources.

Write a KQL query to identify malicious traffic patterns.

Write a KQL query to create a machine learning model to predict future security events.

Write a KQL query to create a dashboard that shows the real-time security posture of the organization.

How to test KQL query?

Livestream used to test queries in Sentinel. There are a few different ways to test KQL queries:

- **Use the KQL explain statement** shows execution plan for your query helps to identify any potential bottlenecks.

- **Use the KQL trace statement** shows step-by-step execution of your query, which can help you to debug complex queries.

- **Use a KQL testing tool** such as **KQL Query Analyzer** in Azure Monitor and the **KQL Console** in Azure Data Explorer.

**Tips**

- Start by testing your queries on a small sample of data.

- Test your queries with different types of data and different filters, helps to ensure that queries are robust and can handle a variety of different scenarios.

- Test your queries on a variety of different devices and operating systems, helps to ensure that your queries are compatible with a wide range of environments.

- Sentinel uses a distributed architecture, so queries may take longer to run than they would on a single machine.

- Sentinel queries are executed against a large volume of data, so it is important to optimize your queries for performance.

- Sentinel queries can be used to generate dashboards and reports, so it is important to test your queries with the data that you plan to use in your dashboards and reports.

How to use explain statement to test a KQL query?

explain

DeviceProcessEvents

\| where ProcessName == "explorer.exe"

\| project DeviceName, ProcessName

How to use trace statement to test a KQL query?

trace

DeviceProcessEvents

\| where ProcessName == "explorer.exe"

\| project DeviceName, ProcessName

**Declare and reuse KQL variables**

let timeOffset = 7d;

let discardEventId = 4688;

SecurityEvent

\| where TimeGenerated \> ago(timeOffset\*2) and TimeGenerated \< ago(timeOffset)

\| where EventID != discardEventId

>  

"ago()" is a function that will take the current Date/Time and subtract it with value provided.

**Declare dynamic tables or lists:**

let suspiciousAccounts = datatable(account: string) \[

@"\administrator",

@"NT AUTHORITY\SYSTEM"

\];

SecurityEvent \| where Account in (suspiciousAccounts)

 

let LowActivityAccounts = SecurityEvent

\| summarize cnt = count() by Account \| where cnt \< 1000;

LowActivityAccounts \| where Account contains "SQL"

**Search in multi-table and multi-column**

**Search** operator provides a multi-table/multi-column search experience. Although the search operator is easy to use, when compared to the where operator it's inefficient. Even with this inefficiency, you can use search to find data when unsure which table or column to filter.

The first statement will search for "err" across all tables. The second statement will search for "err" in tables SecurityEvent, SecurityAlert, and tables starting with A. Try each of these queries separately to see the results.

> search "err"
>
> search in (SecurityEvent,SecurityAlert,A\*) "err"

**Filter data through KQL Queries**

The **Where** operator filters a table to the subset of rows that satisfy a predicate.

SecurityEvent \| where TimeGenerated \> ago(1d)

SecurityEvent \| where TimeGenerated \> ago(1h) and EventID == "4624"

SecurityEvent \| where TimeGenerated \> ago(1h) \| where EventID == 4624 \| where AccountType =~ "user"

SecurityEvent \| where EventID in (4624, 4625)

Extend

The extend operator will create calculated columns and append the new columns to the result set. The KQL example below uses the extend operator to create a new column, *StartDir* containing the directory a process was started in. The *StartDir* column is a calculated column containing the results of a substring function.

SecurityEvent

\| where ProcessName != "" and Process != ""

\| extend StartDir = substring(ProcessName,0, string_size(ProcessName)-string_size(Process))

Order operator

Sort the rows of the input table by one or more columns. The order by operator can utilize any column or multiple columns by using a comma separator. Each column can be ascending or descending. The default order for a column is descending.

Project

The project operators control what columns to include, add, remove, or rename in the result set of a statement. There are multiple types of project operators.

The following table is a list of the variations.

Project Select the columns to add, rename or drop, and insert new computed columns.

project-away Select what columns from the input to exclude from the output.

project-keep Select what columns from the input to keep in the output.

project-rename Select the columns to rename in the resulting output.

project-reorder Set the column order in the resulting output.

Render

The render operator generates a visualization of the query results. The supported visualizations are:

- areachart

- barchart

- columnchart

- piechart

- scatterchart

- timechart

**<span class="mark">Use the summarize operator to create time series</span>**

The bin() function rounds values down to an integer multiple of the given bin size. Used frequently in combination with summarize by .... If you have a scattered set of values, the values are grouped into a smaller set of specific values. Combining the generated time series and pipe to a render operator with a type of timechart provides a time-series visualization.

SecurityEvent \| summarize count () by Account \| render barchart

SecurityEvent \| summarize count () by bin (TimeGenerated, 1d) \| render timechart

Union

It takes 2 or more tables and returns rows of all of them.

// Query 1 return all rows of SecurityEvent and all rows of SigninLogs

SecurityEvent \| union SigninLogs

// Query 2 return one row and column, which is the count of all rows of SecurityEvent and all rows of SigninLogs

SecurityEvent \| union SigninLogs \| summarize count() \| project count\_

// Query 3 return all rows of SecurityEvent and one row for SigninLogs.

SecurityEvent \| union (SigninLogs \| summarize count()\| project count\_)

The union operator supports wildcards to union multiple tables. The following KQL will create a count for the rows in all tables with names that start with Security.

// Query 1 return all rows of SecurityEvent and all rows of SigninLogs

union Security\* \| summarize count() by Type

 

Join

The join operator merges the rows of two tables to form a new table by matching the specified columns' values from each table.

- <img src="media/image1.png" style="width:4.03333in;height:1.95in" />

 

SecurityEvent

\| where EventID == "4624"

\| summarize LogOnCount=count() by EventID, Account

\| project LogOnCount, Account

\| join kind = inner (

SecurityEvent

\| where EventID == "4634"

\| summarize LogOffCount=count() by EventID, Account

\| project LogOffCount, Account

) on Account

Extract

**<span class="mark">Extract data from unstructured string fields</span>**

Security log data is often contained in unstructured string fields and requires parsing to extract data.

There are multiple ways of pulling information from string fields in KQL. The two primary operators used are extract and parse. Extract gets a match for a regular expression from a text string. You may optionally convert the extracted substring to the indicated type. The union operator supports wildcards to union multiple tables. The following KQL will create a count for the rows in all tables with names that start with Security.

// Query 1 return all rows of SecurityEvent and all rows of SigninLogs

union Security\* \| summarize count() by Type

Parse

Parse evaluates a string expression and parses its value into one or more calculated columns. The computed columns will have nulls for unsuccessfully parsed strings. The union operator supports wildcards to union multiple tables. The following KQL will create a count for the rows in all tables with names that start with Security.

// Query 1 return all rows of SecurityEvent and all rows of SigninLogs

union Security\* \| summarize count() by Type

Detect CrowdStrike logs reporting

CrowdStrikeFalconEventStream

\| where EventType == "DetectionSummaryEvent"

\| summarize count() by DstHostName

\| top 10 by count\_

### List MDC alerts

SecurityAlert

\| where ProductName == "Azure Security Center"

### Powershell execution events that could involve download

Union DeviceProcessEvents, DeviceNetworkEvents

\| where Timestamp \> ago(7d)

\| where FileName in~ ("powershell.exe", "powershell_ise.exe")

\| where ProcessCommandLine has_any ("WebClient", "DownloadFile", "DownloadData", "DownloadString", "WebRequest", "Shellcode", "http", "https", "Invoke-Expression", "IEX", "bitsadmin", "certutil", "ftp", "tftp", "curl", "wget") // Added more download-related keywords

\| extend DownloadMethod = case(

ProcessCommandLine has "WebClient", "WebClient",

ProcessCommandLine has "DownloadFile", "DownloadFile",

ProcessCommandLine has "DownloadData", "DownloadData",

ProcessCommandLine has "DownloadString", "DownloadString",

ProcessCommandLine has "WebRequest", "WebRequest",

ProcessCommandLine has "Shellcode", "Shellcode",

ProcessCommandLine has "Invoke-Expression" or ProcessCommandLine has "IEX", "Invoke-Expression/IEX",

ProcessCommandLine has "bitsadmin", "bitsadmin",

ProcessCommandLine has "certutil", "certutil",

ProcessCommandLine has "ftp", "ftp",

ProcessCommandLine has "tftp", "tftp",

ProcessCommandLine has "curl", "curl",

ProcessCommandLine has "wget", "wget",

ProcessCommandLine has "http", "http/https", //Catch-all for http/https without other keywords

ProcessCommandLine has "https", "http/https",

"Other" //If none of the above match.

)

\| project Timestamp, DeviceName, InitiatingProcessFileName, InitiatingProcessCommandLine,

FileName, ProcessCommandLine, RemoteIP, RemoteUrl, RemotePort, RemoteIPType, DownloadMethod // Include the DownloadMethod

\| top 100 by Timestamp

### Credential Access/Private Key Files.txt

// Private Key Files: This query identifies file operation with files having one of the extensions commonly used to save a private key. The risk is that if an attacker were to obtain the file, they could brute force any password on it and potentially obtain a powerful certificate. To do this, they would only need to obtain read access to the file. The risk associated with these files is heavily determined by the value of the certificate. For example, loss of a self-signed certificate created by Adobe Acrobat is significantly less impactful than loss of a website SSL certificate. Recommendation: Know where these files are, and if possible, back them up and remove them. You might also consider creating an informational alert. //

DeviceFileEvents

\| where Timestamp \> ago(7d)

\| where FileName endswith '.pfx' or FileName endswith '.pfn' or FileName endswith '.p12'

### Detect mass secret retrieval from Azure Key Vault by a single user

~~AzureDiagnostics~~

~~\| where ResourceType == "VAULTS"~~

~~\| where OperationName == "SecretGet"~~

~~\| summarize SecretGetCount=count() by Caller, bin(TimeGenerated, 1h)~~

~~\| where SecretGetCount \> 100~~

<span class="mark">New Query</span>

AzureDiagnostics

\| where ResourceType == "VAULTS"

\| where OperationName == "SecretGet"

\| where ResultSignature == "Success" // Or StatusCode == 200 or similar - VERY IMPORTANT

\| summarize SecretGetCount=count() by Caller, bin(TimeGenerated, 10m) // Shorter window

\| where SecretGetCount \> 50 // Adjust threshold based on your environment. Consider dynamic thresholding.

// Optional: Add Application ID if available and relevant

// \| join AppIds on Caller // Example join if AppIds table exists

// \| where SecretGetCount \> 50 and AppId != "LegitimateServicePrincipal"

### List of machines having connections with malicious IP address

DeviceProcessEvents

\| where RemoteIP in (maliciousIPAddresses)

\| project DeviceName, RemoteIP

The maliciousIPAddresses list can be populated with known malicious IP addresses from a variety of sources, such as threat intelligence feeds or internal security databases.

// Get a list of all malicious IP addresses from a threat intelligence feed

let maliciousIPAddresses = threatIntelligenceFeed \| project IPAddress;

// Search for machines which have connections with malicious IP addresses

let machinesWithMaliciousConnections = DeviceProcessEvents

\| where RemoteIP in (maliciousIPAddresses)

\| project DeviceName, RemoteIP

The machinesWithMaliciousConnections list can then be used to investigate further and take appropriate actions, such as isolating the affected machines or blocking the malicious IP addresses.

### Machines having unwanted software

DeviceProcessEvents

\| where ProcessName in (unwantedSoftwareList)

\| project DeviceName

This query will return a list of all machines that have any of the processes in the unwantedSoftwareList list running. The unwantedSoftwareList can be populated with a list of known unwanted software processes, such as malware or cryptocurrency miners.

Here is an example of how to use the query:

// Get a list of all known unwanted software processes

let unwantedSoftwareList = securityDatabase \| project ProcessName;

// Search for machines that have unwanted software installed

let machinesWithUnwantedSoftware = DeviceProcessEvents

\| where ProcessName in (unwantedSoftwareList)

\| project DeviceName

The machinesWithUnwantedSoftware list can then be used to investigate further and take appropriate actions, such as removing the unwanted software from the affected machines.

Please note: The effectiveness of this query will depend on the accuracy of the unwantedSoftwareList. If the list is incomplete or inaccurate, then the query may miss some machines that have unwanted software installed.

In addition to the above query, you can also use the following KQL queries to identify machines that may have unwanted software installed:

- **Monitor for unusual process activity:** You can use KQL to monitor for unusual process activity, such as processes that are consuming a lot of CPU or memory, or processes that are running from unusual locations. This can help you to identify machines that may have malware installed.

- **Search for known IOCs:** You can use KQL to search for known IOCs, such as malicious file hashes or IP addresses. This can help you to identify machines that may have been compromised.

- **Analyze threat intelligence:** You can use KQL to analyze threat intelligence to identify new threats and vulnerabilities that may be targeting the organization. This can help you to identify machines that may be at risk of being infected with unwanted software.

By using these and other KQL queries, you can identify machines that may have unwanted software installed and take appropriate actions to protect your organization.

Attempt to access file or folder that is protected by ACL – Event ID 30219

If attempt to access file/folder is successful then EventID-30219 logged is informational

If attempt to access file/folder is unsuccessful then EventID-30219 logged as Warning.

Event ID 30219 in Windows is a security event that indicates that the <span class="mark">system has detected an attempt to access a file or folder that is protected by Access Control Lists (ACLs</span>). This event can be triggered by a variety of actions, such as:

- Trying to open a file or folder that is protected by an ACL that does not grant the user access.

- Trying to delete or modify a file or folder that is protected by an ACL that does not grant the user access.

- Trying to access a file or folder that is located in a protected area of the file system, such as the system root directory.

Event ID 30219 can be either informational or warning, depending on the specific circumstances. If the attempt to access the file or folder is successful, then the event will be informational. <span class="mark">If the attempt to access the file or folder is unsuccessful, then the event will be a warning.</span>

Here are some possible reasons why you might see Event ID 30219 in your Windows event logs:

- A user or process is trying to access a file or folder that they do not have permission to access.

- A malware program is trying to access a file or folder in order to steal data or install malware.

- A legitimate program is trying to access a file or folder that is protected by an ACL, but the ACL is configured incorrectly.

- A file or folder has been moved or deleted, and the ACL that protected it is no longer valid.

If you see Event ID 30219 in your Windows event logs, you should investigate the event to determine the cause of the attempt to access the protected file or folder. If the attempt is legitimate, you may need to adjust the ACLs to grant the user or process the necessary permissions. If the attempt is malicious, you may need to take steps to remove the malware or fix the misconfigured ACL.

Here are some tips for investigating Event ID 30219 events:

- Look at the details of the event to determine the name of the file or folder that was accessed, the user or process that attempted to access it, and the type of access that was attempted.

- Check the ACLs on the file or folder to make sure that they are configured correctly.

- Use a security information and event management (SIEM) solution to correlate Event ID 30219 events with other security events to identify patterns and trends.

- If you suspect that the attempt to access the file or folder was malicious, you can use an antivirus or anti-malware program to scan your system for malware.

By following these tips, you can investigate Event ID 30219 events and take steps to protect your system from unauthorized access and malware infection.

Event

\| where EventID == 30219 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend SoftwareUpdateGroupID = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| extend SoftwareUpdateGroupName = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[3\]", MyData)

\| project Administrator, SoftwareUpdateGroupID, SoftwareUpdateGroupName, TimeGenerated

The following KQL query can be used to detect if the system has detected an attempt to access a file or folder that is protected by Access Control Lists (ACLs):

SecurityEvent

\| where EventID == 30219

This query will return a list of all security events that have been logged with Event ID 30219. You can then use the details of the events to investigate further and take appropriate actions. For example, you can use the following KQL query to get a list of all files or folders that have been accessed by a particular user account:

SecurityEvent

\| where EventID == 30219

\| where AccountName == "UserAccount"

\| project FileName

This query will return a list of all files or folders that have been accessed by the user account UserAccount. You can then use this information to investigate further and determine if the access was authorized.

You can also use KQL to create more complex queries to detect specific types of attempts to access protected files or folders. For example, the following query can be used to detect attempts to access protected files or folders from a remote IP address:

SecurityEvent

\| where EventID == 30219

\| where RemoteIP in ("RemoteIPAddress1", "RemoteIPAddress2")

\| project FileName

This query will return a list of all files or folders that have been accessed from the remote IP addresses RemoteIPAddress1 and RemoteIPAddress2. You can then use this information to investigate further and determine if the access was authorized.

By using KQL, you can create powerful queries to detect attempts to access protected files or folders. This can help you to protect your system from unauthorized access and malware infection.

EventID-30221: Attempt to exploit a vulnerability in the Windows Graphics Component

Windows Event ID 30221 is a security event that indicates that the system has detected an attempt to exploit a vulnerability in the Windows Graphics Component. This vulnerability can be exploited by an attacker to execute arbitrary code on the affected system.

Windows Event ID 30221 is a critical event, and it should be investigated immediately. If you see this event in your Windows event logs, you should take the following steps:

1.  **Update your Windows system to the latest security patches.** Microsoft has released a security patch for this vulnerability, and it is important to install the patch as soon as possible.

2.  **Scan your system for malware**. It is possible that your system has been infected with malware that is exploiting this vulnerability. You should use an antivirus or anti-malware program to scan your system for malware.

3.  **Review your security policies and procedures**. Make sure that your security policies and procedures are designed to protect your system from this type of attack.

In addition to the above steps, you may also want to consider the following:

- **Enable Windows Defender Application Control (WDAC)**. WDAC can help to protect your system from attacks that exploit vulnerabilities in applications.

- **Use a security information and event management (SIEM)** solution to monitor your Windows event logs for signs of attacks.

- Educate your employees about security best practices, such as phishing awareness and password hygiene.

By taking these steps, you can help to protect your system from attacks that exploit Windows Event ID 30221.

Here are some additional tips for preventing attacks that exploit Windows Event ID 30221:

- Keep your software up to date. Software vendors regularly release security updates to patch vulnerabilities. By installing security updates promptly, you can help to protect your system from known vulnerabilities.

- Use a firewall and intrusion detection system (IDS). A firewall can help to block unauthorized traffic from reaching your system, and an IDS can help to detect and respond to suspicious activity.

- Use strong passwords and multi-factor authentication (MFA). Strong passwords and MFA can help to protect your accounts from being compromised.

- Be careful about what links you click on and what attachments you open. Phishing emails and malicious attachments are a common way for attackers to gain access to systems.

By following these tips, you can help to protect your system from attacks that exploit Windows Event ID 30221 and other vulnerabilities.

Write a kql query to get list of machines exploited with vulnerability in Windows Graphics Component

SecurityEvent

\| where EventID == 30221

\| project DeviceName

See if machine is exploited by specific IP address.

SecurityEvent

\| where EventID == 30221

\| where RemoteIP == "192.168.1.100"

\| project DeviceName

Get list of machines which are vulnerable to Windows Graphics Component

DeviceProcessEvents

\| where ProcessName == "gdiplus.dll"

\| where ProcessVersion in ("10.0.17763.1503","10.0.17763.165")

\| project DeviceName

//Someone removed the Software Update Group //

Event

\| where EventID == 30221 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend SoftwareUpdateGroupID = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| project Administrator, SoftwareUpdateGroupID, TimeGenerated

//Software Updates deployment //

Event

\| where EventID == 30196 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend SoftwareUpdateGroupID = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| extend SoftwareUpdateGroupName = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[3\]", MyData)

\| extend DeploymentName = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[4\]", MyData)

\| extend DeploymentStartTime = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[5\]", MyData)

\| extend DeploymentDeadLine = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[6\]", MyData)

\| extend CollectionID = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[7\]", MyData)

\| extend Featuretype = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[8\]", MyData)

\| where Featuretype == "Software Update"

\| project Administrator, SoftwareUpdateGroupID, SoftwareUpdateGroupName, DeploymentName, DeploymentStartTime, DeploymentDeadLine, CollectionID, TimeGenerated

>  

Packages

//New package creation - generic ID for different package types //

// Package ids: 0 - classic software package, 5 - Software Update Deployment Package, 4 - Task Sequence//

Event

\| where EventID == 30000 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend PackageID = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| extend ContentType = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[3\]", MyData)

\| extend ContentTypeConversion = case(ContentType == 0, "Package",ContentType == 5,

"Software Update Deployment Package",ContentType == 4, "Task Sequence","unknown")

\| extend Name = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[4\]", MyData)

\| project Administrator, PackageID, ContentType, ContentTypeConversion, Name, TimeGenerated

//Collections - Collection creation - New Collection in Configuration Manager//

Event

\| where EventID == 30015 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend CollectionName = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[3\]", MyData)

\| extend CollectionID = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| project Administrator, CollectionName, CollectionID, TimeGenerated

//Collections Collection removed //

Event

\| where EventID == 30017 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend CollectionName = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[3\]", MyData)

\| extend CollectionID = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| project Administrator, CollectionName, CollectionID, TimeGenerated

//Collections Collection Change in Configuration Manager//

Event

\| where EventID == 30016 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend CollectionName = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[3\]", MyData)

\| extend CollectionID = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| project Administrator, CollectionName, CollectionID, TimeGenerated

//Scripts New Script-New Script in Configuration Manager//

// ScriptContent holds the actual script from the Configuration Manager. You can decode the script//

Event

\| where EventID == 52500 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend ScriptGUID = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| extend ScriptContent = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[4\]", MyData)

\| extend Name = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[5\]", MyData)

\| project Administrator, ScriptGUID, ScriptContent, Name, TimeGenerated

//Scripts Script approved in Configuration Manager//

Event

\| where EventID == 52501 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend ScriptGUID = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| extend ScriptContent = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[4\]", MyData)

\| extend Name = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[5\]", MyData)

\| project Administrator, ScriptGUID, ScriptContent, Name, TimeGenerated

>  

//Scripts execution against devices //

Event

\| where EventID == 40806 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend ScriptGUID = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| extend ScriptContent = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[4\]", MyData)

\| extend Name = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[5\]", MyData)

\| extend DeviceCount = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[6\]", MyData)

\| project Administrator, ScriptGUID, ScriptContent, Name, DeviceCount, TimeGenerated

//Scripts execution against Collection//

Event

\| where EventID == 40805 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend ScriptGUID = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| extend ScriptContent = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[4\]", MyData)

\| extend Name = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[5\]", MyData)

\| extend Collection = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[6\]", MyData)

\| extend CollectionID = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[7\]", MyData)

\| project Administrator, ScriptGUID, ScriptContent, Name, Collection, CollectionID, TimeGenerated

<span class="mark">//Scripts change-Edit Script in Configuration Manager//</span>

Event

\| where EventID == 52506 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend ScriptGUID = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| extend ScriptContent = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[4\]", MyData)

\| extend Name = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[5\]", MyData)

\| project Administrator, ScriptGUID, ScriptContent, Name, TimeGenerated

<span class="mark">//Security - New Administrator - Somebody added a new user / group - EventID 31240//</span>

Event

\| where EventID == 31240 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend UserOrGroup = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| extend Roles = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[3\]", MyData)

\| extend Scopes = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[4\]", MyData)

\| extend Collections = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[5\]", MyData)

\| project Administrator, UserOrGroup, Roles, Scopes, Collections, TimeGenerated

>  

<span class="mark">//Security - Administrator removed - Somebody removed a user or security group//</span>

Event

\| where EventID == 31242 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend UserOrGroup = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| extend Roles = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[3\]", MyData)

\| extend Scopes = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[4\]", MyData)

\| extend Collections = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[5\]", MyData)

\| project Administrator, UserOrGroup, Roles, Scopes, Collections, TimeGenerated

<span class="mark">//Security - New Security Role//</span>

Event

\| where EventID == 31200 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend SecurityRoleName = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| project Administrator, SecurityRoleName, TimeGenerated

<span class="mark">//Applications - New Application deployment - EventID 30226 //</span>

Event

\| where EventID == 30226 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend Application = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| extend Collection = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[3\]", MyData)

\| project Administrator, Application, Collection, TimeGenerated

<span class="mark">//Applications - OS deployment - Change in Task Sequence//</span>

Event

\| where EventID == 30001 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend TaskSequenceID = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| extend TaskSequence = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[3\]", MyData)

\| project Administrator, TaskSequenceID, TaskSequence, TimeGenerated

>  

<span class="mark">//Applications - Remote Control Start Session//</span>

Event

\| where EventID == 30076 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend SourceComputer = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| extend TargetComputer = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[3\]", MyData)

\| extend ProcessID = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[4\]", MyData)

\| extend ThreadID = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[5\]", MyData)

\| project Administrator, SourceComputer, TargetComputer, ProcessID, ThreadID, TimeGenerated

<span class="mark">//Applications - Remote Control end session //</span>

Event

\| where EventID == 30077 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend SourceComputer = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| extend TargetComputer = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[3\]", MyData)

\| extend ProcessID = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[4\]", MyData)

\| extend ThreadID = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[5\]", MyData)

\| project Administrator, SourceComputer, TargetComputer, ProcessID, ThreadID, TimeGenerated

<span class="mark">//Site Configuration - Somebody changed the Client Settings //</span>

Event

\| where EventID == 30043 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend ClientSettingName = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| project Administrator, ClientSettingName, TimeGenerated

>  

<span class="mark">//Site Configuration - Hierarchy changes - Change in Primary Site Settings //</span>

Event

\| where EventID == 30031 and EventLog == "ConfigurationManager"

\| extend MyData = tostring(parse_xml(EventData))

\| extend Administrator = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[1\]", MyData)

\| extend SiteName = extractjson("\$\['DataItem'\]\['EventData'\]\['Data'\]\[2\]", MyData)

\| project Administrator, SiteName, TimeGenerated

<span class="mark">Find powershell execution events that could involve download</span>

Union DeviceProcessEvents, DeviceNetworkEvents

\| where Timestamp \> ago(7d)

\| where FileName in~ (“powershell.exe”, ”powershell_ise.exe”)

\| where ProcessCommandLine has_any(“WebClient”,

"DownloadFile",

"DownloadData",

"DownloadString",

"WebRequest",

"Shellcode",

"http",

"https")

\| project Timestamp, DeviceName, InitiatingProcessFileName, InitiatingProcessCommandLine,

FileName, ProcessCommandLine, RemoteIP, RemoteUrl, RemotePort, RemoteIPType

\| top 100 by Timestamp

<span class="mark">//Credential Access/Private Key Files.txt - This query identifies file operation with files having one of the extensions commonly used to save a private key. The risk is that if an attacker were to obtain the file, they could brute force any password on it and potentially obtain a powerful certificate. To do this, they would only need to obtain read access to the file. The risk associated with these files is heavily determined by the value of the certificate. For example, loss of a self-signed certificate created by Adobe Acrobat is significantly less impactful than loss of a website SSL certificate. Recommendation: Know where these files are, and if possible, back them up and remove them. You might also consider creating an informational alert//</span>

DeviceFileEvents

\| where Timestamp \> ago(7d)

\| where FileName endswith '.pfx' or FileName endswith '.pfn' or FileName endswith '.p12'

## Threat Hunting 

Threat hunting means proactive identification of threats by analysing the logs

KQL queries are used to analyse logs in Sentinel workspace.

Threat hunting means proactive identification of threats by analysing the logs. KQL queries are used to analyse logs in Sentinel workspace.

create custom hunting queries

run hunting queries manually

monitor hunting queries by using Livestream

perform advanced hunting with notebooks

track query results with bookmarks

use hunting bookmarks for data investigations

convert a hunting query to an analytical

Threat Hunting stages

- Before incident

- During compromise/incident

- After compromise/incident

 

Threat Hunting before compromise

<span class="mark">What are the threat hunting techniques before security incident takes place?</span>

Threat hunting is the proactive process of searching for and detecting threats that may be lurking undetected in a network. It is a critical part of any security program, as it can help organizations to identify and respond to threats before they can cause damage.

There are a number of different threat hunting techniques that can be used, but some of the most common include:

- Hypothesis-driven hunting: This type of hunting involves developing a hypothesis about a potential threat and then using data and tools to investigate the hypothesis. For example, a threat hunter might hypothesize that an attacker is using a specific malware strain to target the organization. The hunter would then use data and tools to search for evidence of this malware in the organization's network.

- Anomaly detection: This type of hunting involves using data and tools to identify anomalous activity in the network. For example, a threat hunter might use a SIEM solution to monitor for unusual spikes in traffic or login attempts.

- Indicators of compromise (IOCs): IOCs are specific artifacts or patterns of activity that can indicate the presence of a threat. Threat hunters can use IOCs to search for evidence of threats in the network. For example, a threat hunter might use a list of known malicious IP addresses to search for traffic to or from those addresses.

- Threat intelligence: Threat intelligence is information about known threats and vulnerabilities. Threat hunters can use threat intelligence to inform their hunting activities. For example, a threat hunter might use a threat intelligence feed to learn about new malware strains or attack techniques.

Threat hunting can be performed manually or using automated tools. Manual threat hunting is often more effective at detecting sophisticated threats, but it can be time-consuming and resource-intensive. Automated threat hunting tools can help to scale threat hunting operations, but they may not be as effective at detecting sophisticated threats.

Here are some specific examples of threat hunting techniques that can be used to detect threats before a security incident takes place:

- Monitor for unusual login activity: Threat hunters can use SIEM solutions to monitor for unusual login activity, such as logins from unusual locations or times of day.

- Monitor for unusual network traffic: Threat hunters can use network monitoring tools to monitor for unusual network traffic, such as spikes in traffic or traffic to or from known malicious IP addresses.

- Monitor for suspicious file activity: Threat hunters can use file monitoring tools to monitor for suspicious file activity, such as changes to critical system files or the creation of new files with malicious signatures.

- Search for known IOCs: Threat hunters can use IOC feeds to search for known IOCs in the network.

- Analyze threat intelligence: Threat hunters can analyze threat intelligence to identify new threats and vulnerabilities that may be targeting the organization.

By using these and other threat hunting techniques, organizations can detect threats before they can cause damage and improve their overall security posture.

Threat hunting during compromise

Threat hunting after compromise

Use Cases

- Convert a hunting query to an analytical

- Create custom hunting queries

- Detection of data exfiltration by attackers

- Detection of insider’s threats

- Identification of compromised accounts

- Investigation incidents

- Monitor hunting queries by using Livestream

- Network traffic analysis locate trends indicating potential attacks

- Perform advanced hunting with notebooks

- Run hunting queries manually

- There are 150 inbuilt templates from Microsoft Github repository.

- Track query results with bookmarks

- Use hunting bookmarks for data investigations

- User behaviour to detect suspicious patterns

## Alerts Classification

- High: High probability that resource is compromised

- Medium: Probable suspicious activity that might indicate that a resource is compromised

- Low: This might be a benign positive or a blocked attack

- Informational: useful to understand the context of attack.

** **

**Understand alert types**

- The current alert reference list contains over 500 types of alerts.

- Each alert type has a description, severity, and MITRE ATT&CK tactic.

**MITRE ATT&CK tactics**

- URL: <https://docs.microsoft.com/en-us/azure/defender-for-cloud/alerts-reference>

## Export MDC alerts:

Display all active MDC alerts

**KQL in Resource graph explorer:**

securityresources

\| where type =~ 'microsoft.security/locations/alerts'

\| where properties.Status in ('Active')

\| where properties.Severity in ('Low', 'Medium', 'High')

\| project alert_type = tostring(properties.AlertType), SystemAlertId = tostring(properties.SystemAlertId), ResourceIdentifiers = todynamic(properties.ResourceIdentifiers)

Azure CLI:

az graph query -q "securityresources \| where type =~ 'microsoft.security/locations/alerts' \| where properties.Status in ('Active') \| where properties.Severity in ('Low', 'Medium', 'High') \| project alert_type = tostring(properties AlertType), SystemAlertId = tostring(properties.SystemAlertId), ResourceIdentifiers = todynamic(properties ResourceIdentifiers)"

## Threat reports

Microsoft Defender for Cloud has three types of threat reports, which can vary according to attack:

- **Activity Group Report**: provides deep dives into attackers, their objectives, and tactics.

- **Campaign Report**: focuses on details of specific attack campaigns.

- **Threat Summary Report**: covers all the items in the previous two reports.

Download threat report: MDC - Alerts - Select alert - View full details - Alert details -Threat intelligence report

**How to download generate threat intelligence reports from microsoft defender for cloud?**

You can download the threat intelligence reports from specific security alerts.

**Generate threat intelligence reports**

- Defender for Cloud uses analytics to connect the information between distinct security alerts.

- Using these connections, Defender for Cloud can provide a single view of an attack campaign and its related alerts to help you understand the attacker's actions and the affected resources.

- General threat intelligence reports include:

  - Attacker’s identity or associations (if this information is available)

  - Attackers’ objectives

  - Current and historical attack campaigns (if this information is available)

  - Attackers’ tactics, tools, and procedures

  - Associated indicators of compromise (IoC) such as URLs and file hashes

  - Victimology, which is the industry and geographic prevalence to assist you in determining if your Azure resources are at risk

  - Mitigation and remediation information

- Defender for Cloud has three types of threat reports, which can vary according to the attack:

  - Activity Group Report: provides deep dives into attackers, their objectives, and tactics.

  - Campaign Report: focuses on details of specific attack campaigns.

  - Threat Summary Report: covers all the items in the previous two reports.

- Respond to alerts from Azure resources

[How to isolate an Azure VM using Azure Security Center’s Workflow automation - Microsoft Community Hub](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/how-to-isolate-an-azure-vm-using-azure-security-center-s/ba-p/1250985)

## QnA

- After writing a query, how to find some results are marked and easy to reference alongside related data? à **Use Bookmarks feature, select log rows and add relevant tags. Bookmark are used to mark Indicators of compromise (IoC) and root causes of incidents.**

- Configure Sentinel solution which immediately alert you when attack happens like storage account keys are enumerated without being notified à **Use Hunting Livestream**.

- How to clone KQL query? **Sentinel - Hunting - Select query to clone - Click 3 dots on Query - Clone query - Create Custom Query**

- How to create query quickly utilizing required field? **Sentinel - Hunting - New Query - Name and Query fields - Create**

- How to provide drop-down filter options in custom workbooks? à **Select add parameters - Click add parameters button - Select resource picker for parameter type - Click Save**

- How to query suspicious activities carried out by accounting department employees like uploading sensitive data on cloud? à **Hunting – Run all queries option.**

- How to test KQL query? à **Livestream used to test queries. Query tab – right click on specific query - select add to Livestream.**

- While editing workbook, if we wish to add static element to workbook that display label of current time range that is selected and add text control to workbook, which parameters to add? **{Timerange}: Displays selected timerange label. {Timerange: label}: Label option appended to it. {Timerange: query}: Displays KQL text string that was used in parameters function.**

- Write a query that identifies Azure Defender alerts? **SecurityAlert \| where ProductName == "Azure Security Center"**

# Threat Investigation

Automated investigation and Response (AIR) with MDE

Alerts are the starting point for AIR.

How to perform device investigation on MICROSOFT DEFENDER XDR?\
To perform device investigation on MICROSOFT DEFENDER XDR, you can follow these steps:

1.  Identify the device to investigate. You can identify the device to investigate by reviewing the alerts or incidents in the MICROSOFT DEFENDER XDR portal. You can also search for devices by name, IP address, or other criteria.

2.  View the device details. Once you have identified the device to investigate, you can view its details in the MICROSOFT DEFENDER XDR portal. The device details include information such as the device name, operating system, hardware configuration, and security status.

3.  Investigate the device's activity. You can investigate the device's activity by reviewing its event logs, network traffic, and file system activity. You can also use the MICROSOFT DEFENDER XDR threat hunting tools to search for suspicious activity on the device.

4.  Collect evidence. If you find evidence of a threat on the device, you can collect evidence to support your investigation. You can collect evidence such as system logs, network traffic logs, and malware samples.

5.  Remediate the threat. Once you have completed your investigation, you can remediate the threat by removing the malware, patching vulnerabilities, and hardening the device's security configuration.

Here are some additional tips for performing device investigation on MICROSOFT DEFENDER XDR:

- Use the device timeline. The device timeline in the MICROSOFT DEFENDER XDR portal provides a chronological view of the device's activity. You can use the device timeline to identify suspicious activity and to track the progress of your investigation.

- Use the device inventory. The device inventory in the MICROSOFT DEFENDER XDR portal provides a list of all devices that are managed by MICROSOFT DEFENDER XDR. You can use the device inventory to search for devices by name, IP address, or other criteria.

- Use the device groups. Device groups in the MICROSOFT DEFENDER XDR portal allow you to group devices together based on criteria such as operating system, location, or security status. You can use device groups to filter alerts and incidents, and to target remediation actions to specific groups of devices.

- Use the threat hunting tools. The threat hunting tools in the MICROSOFT DEFENDER XDR portal allow you to search for suspicious activity across your environment. You can use the threat hunting tools to identify threats that may be difficult or impossible to detect using traditional security solutions.

By following these tips, you can use MICROSOFT DEFENDER XDR to perform device investigations effectively and protect your organization from threats.

How to perform security investigation on MICROSOFT DEFENDER XDR?

To perform a security investigation on MICROSOFT DEFENDER XDR, you can follow these steps:

1.  **Identify the security alert or incident.** This may involve reviewing the alerts and notifications in the MICROSOFT DEFENDER XDR console, or searching for specific events or activities.

2.  **Gather data.** Once you have identified the security alert or incident, gather as much data as possible about it. This may include data from the following sources:

    - **Endpoints:** Logs, event data, and system information from the affected systems

    - **Networks:** Network traffic logs and firewall logs

    - **Security appliances:** Logs and events from security appliances, such as firewalls and intrusion detection systems

    - **MICROSOFT DEFENDER XDR alerts and notifications:** Details about the security alert or incident, such as the time it occurred, the affected systems, and the type of threat

    - **Threat intelligence feeds:** Information about known malware threats, such as IOCs and attack patterns

3.  **Analyze the data.** Once you have gathered data about the security alert or incident, analyze it to identify the following:

    - **The root cause of the alert or incident:** How did the threat enter your environment? What vulnerabilities were exploited?

    - **The scope of the alert or incident:** Which systems and users have been affected?

    - **The impact of the alert or incident:** What damage has been done to your organization?

4.  **Act.** Once you have analyzed the data, you can take action to remediate the threat and prevent future incidents. This may involve the following:

    - **Removing the threat from infected systems:** This may involve using antivirus software, removing malicious files, or restoring data from backups

    - **Patching vulnerabilities:** Patching vulnerabilities that were exploited by the threat

    - **Implementing additional security controls:** Implementing additional security controls, such as email filtering, web filtering, and application control

MICROSOFT DEFENDER XDR provides a number of tools to help you with your security investigation. For example, the Threat Explorer tool allows you to investigate threats across endpoints, identities, email, and applications. The Incidents tab in the MICROSOFT DEFENDER XDR console provides a list of all security incidents that have occurred in your environment.

Here are some additional tips for performing a security investigation on MICROSOFT DEFENDER XDR:

- **Start with the basics.** Before you start investigating a security alert or incident, it is important to understand the basics, such as the time it occurred, the affected systems, and the type of threat.

- **Use all of the data sources available to you.** MICROSOFT DEFENDER XDR collects data from a variety of sources. Use all of this data to get a complete picture of the alert or incident.

- **Correlate data from different sources.** MICROSOFT DEFENDER XDR can correlate data from different sources to identify threats that would be difficult or impossible to detect using traditional security solutions. Use this capability to identify the root cause of the alert or incident and to determine which systems and users have been affected.

- **Use threat intelligence feeds.** Threat intelligence feeds can provide information about known malware threats, such as IOCs and attack patterns. Use this information to help you identify and investigate security alerts and incidents.

- **Automate tasks.** MICROSOFT DEFENDER XDR can automate many of the tasks involved in investigating and responding to security alerts and incidents. This can save you time and help you to respond to incidents more quickly and effectively.

By following these steps and tips, you can use MICROSOFT DEFENDER XDR to perform security investigations effectively and protect your organization from threats.

During security investigation how to decide that cyber-attack is happened?

To decide that a cyber-attack has happened during a security investigation, you should look for the following evidence:

- **Indicators of compromise (IOCs)**: IOCs are artifacts or events that indicate that a cyber-attack has occurred. Examples of IOCs include malicious IP addresses, file hashes, and URLs.

- **Patterns of behaviour:** Cyber-attacks often follow a predictable pattern of behaviour. For example, attackers may first try to gain access to your network, then try to elevate their privileges, and then try to steal data or launch a ransomware attack. By looking for patterns of behaviour, you can identify cyber-attacks that may not be immediately apparent.

- **Anomalies:** Anomalies are unusual events or activities that may indicate a cyber-attack. For example, a sudden increase in network traffic or a failed login attempt from an unusual location may be an indication of a cyber-attack.

If you find evidence of IOCs, patterns of behaviour, or anomalies during your security investigation, it is likely that a cyber-attack has occurred. In this case, you should take steps to remediate the attack and prevent future attacks.

Here are some additional tips for deciding if a cyber-attack has happened during a security investigation:

- **Consider the context.** When evaluating the evidence, it is important to consider the context of the situation. For example, a failed login attempt from an unusual location may be suspicious, but it may also be a legitimate attempt by an employee who is traveling.

- **Use multiple sources of evidence.** No single piece of evidence is conclusive. To decide, you should consider evidence from multiple sources, such as endpoints, networks, and security appliances.

- **Consult with experts.** If you are unsure whether a cyber-attack has happened, consult with experts in security forensics and incident response.

By following these tips, you can make informed decisions about whether a cyber-attack has happened during a security investigation.

Incident Investigation

Incident overpage provides

<img src="media/image2.png" style="width:9.2425in;height:5.23375in" />

MICROSOFT DEFENDER XDR is Extended detection and response (XDR) solution helps protect your computer and data from threats like viruses and hackers. It does this by working with other Microsoft security products to detect and respond to threats across your endpoint devices, email, identities, and apps.

2\. "Terminated by System" Investigation Status:

- **Problem:** An automated investigation shows a "Terminated by System" status.

- **Reasons:** Two primary reasons:

  - Pending actions timed out (typically after one week of inactivity).

  - The number of actions required exceeded the system's processing capacity.

3\. Analysing and Isolating a Threat with Defender XDR:

- **Steps:**

  1.  **Detection:** Identify the endpoint exhibiting unusual activity.

  2.  **Investigation:** Analyze the suspicious activity using Defender XDR's threat explorer, device timeline, and other investigative tools. Look for indicators of compromise (IOCs), processes, files, and network connections.

  3.  **Containment:** Isolate the affected endpoint to prevent lateral movement. This can be done through Defender XDR's device isolation capabilities.

  4.  **Remediation:** Remove the threat. This might involve quarantining or deleting files, terminating processes, and cleaning up registry entries.

  5.  **Recovery:** Ensure the system is fully recovered and restore any affected files or data.

  6.  **Post-Incident Activity:** Analyze the incident to understand the attack vector and improve defenses.

3\. Performing Incident Investigation on Microsoft Defender XDR

Incident investigation in Microsoft Defender XDR involves a multi-faceted approach:

1.  **Triage:** Review alerts and incidents in the queue, prioritizing based on severity and potential impact.

2.  **Analysis:** Investigate the root cause of the incident, including affected entities (endpoints, users, mailboxes), attack timeline, and attacker techniques. Use the incident graph and related entities to understand the scope.

3.  **Containment:** Take immediate action to stop the attack's spread, such as isolating endpoints, disabling user accounts, or blocking malicious files.

4.  **Eradication:** Remove the threat entirely, including malware, persistence mechanisms, and attacker infrastructure access.

5.  **Recovery:** Restore affected systems and data to their pre-incident state.

6.  **Post-Incident Activity:** Document the incident, review lessons learned, and implement preventative measures to avoid future occurrences.

## Threat Investigation 

Identify tools for investigation

Identify what to investigate

- Every security program includes multiple workflows for incident response.

- These processes might include notifying relevant stakeholders, launching a change management process, and applying specific remediation steps.

- Security experts recommend that you automate as many steps of those procedures as you can.

- This feature can trigger Logic Apps on security alerts and recommendations

- configure automated responses in Microsoft Defender for Cloud

- design and configure workflow automation in Microsoft Defender for Cloud

- remediate incidents by using Microsoft Defender for Cloud recommendations

- create an automatic response using an Azure Resource Manager template

- Automate response using logic app

- Suppress security alerts:

<!-- -->

- Evidence collection and handling (e.g., chain of custody, interviewing)

- Reporting and documentation

- Investigative techniques

- Digital forensics tools, tactics, and procedures

**Understand the requirements for different types of investigations:** Administrative, Criminal, Civil, Regulatory, Industry standards

**Conduct logging and monitoring activities**

- Intrusion detection and prevention (IDS/IPS)

- Security information and event management (SIEM)

- Continuous monitoring

- Egress monitoring: Data loss prevention (DLP), Steganography, Watermarking

**Securely provision resources**

- Asset inventory

- Asset management and Inventory

- Configuration management.

**Understand and apply foundational security operations concepts**

- Need-to-know and least privilege -Aggregation, Transitive trust

- Separation of duties and responsibilities

**Understand and support investigations**

- Evidence collection and handling (e.g., chain of custody, interviewing)

- Reporting and documentation

- Investigative techniques

- Digital forensics tools, tactics, and procedures

 

**Incident management steps are**

- Investigate

- investigate multi-workspace incidents

- triage

- respond

- identify advanced threats with User and Entity Behaviour Analytics (UEBA)

 

## Investigation through XDR

How does XDR help security teams to investigate and respond to threats?

**What is XDR and How Does it Help?**

XDR is a security solution that enhances threat investigation and response by collecting and correlating data from multiple sources like endpoints, networks, and cloud environments. This gives security teams a holistic view of threats and enables them to:

- **Investigate effectively:**

  - Identify the root cause of threats by connecting the dots between different security layers.

  - Uncover suspicious activity that traditional tools might miss using analytics and machine learning.

  - Automate evidence collection and analysis, speeding up investigations.

- **Respond efficiently:**

  - Automate responses like quarantining infected devices, blocking malicious traffic, and restoring data.

  - Integrate with existing security tools (firewalls, intrusion detection systems) for a coordinated defense.

**Using XDR for Incident Investigation**

Here is a step-by-step guide for using XDR to investigate a security incident:

1.  **Define the scope:** Identify affected systems, users, and data. XDR's correlated data provides a comprehensive overview.

2.  **Pinpoint the root cause:** Leverage XDR's analytics and machine learning to detect suspicious activities.

3.  **Contain and remediate:** Isolate infected systems, block malicious traffic, and take other necessary actions, potentially automating these with XDR.

4.  **Hunt for similar incidents:** Use XDR to proactively search for related threats across your environment.

5.  **Document everything:** Record the incident details for future learning and security posture improvement.

**XDR in Action: Example Scenarios**

- **Phishing attack:** XDR can correlate email data, endpoint activity, and network traffic to identify the attack's origin, affected users, and suspicious behaviours.

- **Ransomware attack:** XDR can automatically isolate infected systems, block the ransomware's command-and-control communication, and initiate data restoration.

- **Advanced Persistent Threats (APTs):** XDR can detect subtle anomalies in network traffic or file activity that may indicate an APT, providing crucial information for investigation.

**Tips for Effective XDR Usage**

- **Phased approach:** Break down investigations into manageable stages.

- **Prioritize critical systems:** Start with your most valuable assets.

- **Automate tasks:** Use XDR to streamline data collection and response actions.

- **Collaborate:** Share XDR insights with other security teams for a coordinated response.

By using XDR effectively, security teams can significantly improve their ability to detect, investigate, and respond to threats, ultimately strengthening their organization's security posture.

 

## Investigation through MDE

Actions and Submissions

**Actions**

- It lists pending and completed remediation actions for your devices, email & collaboration content, and identities in one location. Following actions are tracked:

  - Collect investigation package

  - Isolate device (this action can be undone)

  - Offboard machine

  - Release code execution

  - Release from quarantine

  - Request sample

  - Restrict code execution (this action can be undone)

  - Run antivirus scan

  - Stop and quarantine

  - Contain devices from the network

- **Pending:**

  - Displays a list of actions that require attention.

  - You can approve or reject actions one at a time, or select multiple actions if they have the same type of action (such as Quarantine file).

- **History:**

  - Serves as an audit log for actions that were taken and also provides way to undo it.

  - Remediation actions that were taken as a result of automated investigations

  - Remediation actions that were taken on suspicious or malicious email messages, files, or URLs

  - Remediation actions that were approved by your security operations team

  - Commands that were run and remediation actions that were applied during Live Response sessions

  - Remediation actions that were taken by your antivirus protection

<!-- -->

- Required Roles: Security Administrator, Active remediation actions, Search and Purge

**Actions** lists pending and completed remediation actions for your devices, email & collaboration content, and identities in one location. Following actions are tracked:

- Collect investigation package

- Isolate device (this action can be undone)

- Offboard machine

- Release code execution

- Release from quarantine

- Request sample

- Restrict code execution (this action can be undone)

- Run antivirus scan

- Stop and quarantine

- Contain devices from the network

**Pending:** Displays a list of actions that require attention. You can approve or reject actions one at a time, or select multiple actions if they have the same type of action (such as Quarantine file).

## Investigation through Sentinel

Incident management steps are

- Investigate

- investigate multi-workspace incidents

- triage

- respond

- identify advanced threats with User and Entity Behaviour Analytics (UEBA)

 

### Notebooks

Notebooks in Sentinel are used for Advanced Hunting.

When your hunting and investigations become more complex, use Sentinel notebooks to enhance your activity with machine learning, visualizations, and data analysis.

Notebooks provide a kind of virtual sandbox, complete with its own kernel, where you can carry out a complete investigation.

Your notebook can include the raw data, the code you run on that data, the results, and their visualizations.

Save your notebooks so that you can share it with others to reuse in your organization.

Notebooks may be helpful when you are hunting or investigation becomes too large to remember easily, view details, or when you need to save queries and results.

Two libraries are used to simplify API access:

- KQLmagic – It provides easy to implement API wrapper to run KQL queries

- MSTIcpy – Microsoft Threat Intelligence Python Security tools is set of tools used for investigation and hunting.

How to test existing queries is matches are not happening when event occurs?

On Query tab, write click on specific query and select add to Livestream. Livestream used to test existing queries, continuous data and alerting when matches are found.

How to create query quickly utilizing required field?

Sentinel --\> Hunting--\> New Query--\>Fill name and Custom query fields--\> Select Create

After writing a query, how to find some results are marked and easy to reference alongside related data?

- Add relevant tags and notes in bookmark plane before saving

- In query results, mark the checkboxes for any rows you want to preserve and select add bookmark

- Bookmarks are tool within threat hunting used to highlight key events.

- Key events to bookmark are IoC (Indicators of compromise) and root causes of incidents.

How to query suspicious activities carried out by accounting department employees like uploading sensitive data on cloud?

Select hunting option on Sentinel and run all queries option on hunting page.

While editing workbook, if we wish to add static element to workbook that display label of current time range that is selected and add text control to workbook, which parameters to add?

- {Timerange}: It is the basic time range picker parameter type that simply displays selected timerange label.

- {Timerange:label}: It is the basic time range picker parameter type that with label option appended to it.

- {Timerange: query}: It displays exact KQL text string that was used in parameters function.

How to provide drop-down filter options in custom workbooks? 4 actions in sequence

Select add parameters--\>Click blue add parameters button from top banner--\>Select resource picker for parameter type --\>Click Save

How to clone KQL query?

Sentinel --\> Threat management--\>Hunting --\>Select query to clone--\> Click 3 dots on query row--\>click on "Clone query"--\>on "Create Custom Query" page click on "Create"

Configure Azure Sentinel solution which immediately alert you when attack happens like storage account keys are enumerated without being notified: Use Hunting Livestream

Write a query that identifies Azure Defender alerts?

SecurityAlert \| where ProductName == "Azure Security Center"

### Bookmarks

- During the hunting and investigation process, you may come across query results that may look unusual or suspicious.

- Bookmark these items to refer to them in the future, such as when creating or enriching an incident for investigation.

- Hunting bookmarks enable Sentinel users to save, tag, annotate, share and investigate results from a Log Analytics query.

- Select a hunting query from the Sentinel hunting page and click "View query results".

- Use the checkboxes to select one or more rows that contain the information you find interesting and click "Add bookmark". This preserves the data in the row for future reference.

### Log Analysis: KQL

Ensure that access to sensitive data is logged. Retain logs for minimum control requirements (often 1-7 years).

For PaaS services such as storage account or DB’s should have diagnostics logs/activity log configured and threat detection and prevention should be enabled. Use Rsyslog, Windows Event Log Forwarding, third-party tool etc. for log shipping, and use a method to ship logs securely for analysis, storage, and archiving.

### QnA For Data Connectors

- Use KQL queries to generate alerts and group them in to incidents, how to ensure incidents are created automatically? **Click "Create incidents -Recommended on Azure AD Identity protection" data connector**

- Implement solution that enables to view/stream creation of user account on any Windows cloud server linked with company's Sentinel workspace? **Windows security events connector**

- How to collect events from non-Azure Windows machine by installing log analytics agent? **Prerequisite: Azure Arc installed and enabled. Azure portal à Sentinel à Configuration management à Data Connector à Security Events via Legacy Agent à Open connector page à Instructions à Configuration à Install agent on non-azure windows machine à Select 64 bit or 32-bit Windows agent**

- What are the prerequisites to ingest Azure AD Identity Protection data in to Sentinel and where to find this prerequisite? à**Azure portal à Sentinel à Configuration management à Data Connector à Azure AD Identity Protection à Instructions. The prerequisites are Workspace: read, write permissions, Tenant permissions: Global Administrator or security administrator on workspace tenant, License: Azure AD premium P2**

- How to connect Azure AD to Sentinel workspace to ingest sign-in logs and audit logs? **à Navigate to Azure Portal à Sentinel à Configuration à Data Connectors à Azure Active Directory à Open Connector page à Follow instructions to connect data source à Select both Azure AD sign-in logs and audit logs**

- How to integrate log data from Microsoft 365 and Non-Azure VMs? **Creating data connectors in Sentinel**

- What minimum role/permissions required to integrate Azure AD Identity protection logs to Sentinel ? **Security Administrator**

- How to collect the Microsoft 365 log data of Accounts department employee whose Microsoft 365 data is compromised? à **Use Sentinel Connectors.**

## Investigation through MDC

Key Concepts:

- **Real-time Security Events:** MDC alerts notify you of potential risks in your Azure environment.

- **Severity Levels:** Alerts are categorized by severity (High, Medium, Low, Informational) to prioritize response.

- **Indicators of Compromise (IoCs):** Alerts provide IoCs like affected resource IDs, attacker IP addresses, and user UPNs.

- **Email Notifications:** You can configure email alerts for notifications.

- **Alert Suppression:** Reduces noise from false positives. Rules expire after six months or if criteria change.

- **Automated Response:** Triggers Logic Apps for incident response workflows (stakeholder notification, change management, remediation).

- **Threat Intelligence Reports:** MDC analyses alerts to provide a comprehensive view of attack campaigns, including attacker info, objectives, tactics, IoCs, and mitigation.

- **Security Analytics:** MDC uses integrated threat intelligence, behavioural analytics, and anomaly detection.

Workflow Automation:

- Create Logic Apps to automate responses to MDC alerts and recommendations.

- Configure triggers based on Defender for Cloud data type (Security Alert, Recommendation, Regulatory Compliance), alert/recommendation name, severity, or state.

- Define actions to be taken by the Logic App.

Alert Suppression:

- Create rules to automatically dismiss specific alerts based on criteria.

- Useful for frequent alerts, false positives, or known non-critical issues.

Threat Intelligence Reports:

- **Activity Group Report:** Deep dives into attackers, objectives, and tactics.

- **Campaign Report:** Focuses on specific attack campaigns.

- **Threat Summary Report:** Comprehensive overview of both activity groups and campaigns.

MDC Alert Investigation:

- Investigate alerts and incidents.

- Understand alert types for Azure workloads.

- Manage security alerts and incidents.

- Analyze threat intelligence.

- Respond to Key Vault alerts.

- Manage user data discovered during investigations.

Suggestions for Improvement:

- **Clarity on "Incidents":** The document mentions "incidents" alongside alerts. Clarify the distinction between an alert (a single event) and an incident (a collection of related alerts).

- **Practical Examples:** Include examples of specific alert types and how to respond to them.

- **Logic App Details:** Provide more detail on creating and configuring Logic Apps for automated response.

- **Step-by-Step Guides:** Add step-by-step instructions for tasks like configuring email notifications, creating suppression rules, and generating threat intelligence reports.

- **Integration with Other Tools:** Mention how MDC integrates with other security tools like SIEM solutions.

- **Best Practices:** Include security best practices for responding to MDC alerts and incidents.

By incorporating these suggestions, the document can become a more comprehensive and user-friendly guide for investigating security alerts using Microsoft Defender for Cloud.

<img src="media/image3.png" style="width:9.69306in;height:1.54056in" />

** **

### Respond to Alerts

**Configure MDC alerts:**

- Setup email notifications

- Create and manage alert suppression rules

**MDC Alerts Investigation**

- Investigate Microsoft Defender for Cloud alerts and incidents

<!-- -->

- describe alert types for Azure workloads

- manage security alerts

- manage security incidents

- analyses Microsoft Defender for Cloud threat intelligence

- respond to Microsoft Defender Cloud for Key Vault alerts

- manage user data discovered during an investigation

**What could be the criteria to suppress security alerts in Microsoft defender for cloud?**

Suppressing security alerts in Microsoft Defender for Cloud should be done with caution, as it can potentially hide legitimate security threats. Here is a breakdown of criteria you can consider when deciding whether to suppress an alert:

- False positives: If you have identified an alert that consistently triggers due to harmless activity, suppression can be appropriate. This could be a specific application or process known to be safe but flagged by Defender for Cloud.

- Low severity alerts: For alerts with a low severity level, indicating a low potential risk, suppression might be considered. However, carefully evaluate the context before suppressing.

- Understood activity: If you understand the activity triggering the alert and know it is legitimate (e.g., planned maintenance), temporary suppression might be an option.

<u>Important considerations before suppressing:</u>

- Impact on security posture: Suppressing alerts can reduce your visibility into potential threats. Ensure you understand the implications before doing so.

- Exhaustion of other options: Have you tried mitigating the alert through other means, such as configuring Defender for Cloud to exclude specific resources or applications?

- Temporary vs permanent suppression: Unless the alert is definitively a false positive, consider temporary suppression for investigation purposes.

### IR for resource manager alerts

> Defender for Resource Manager protects all connected resources, so even if you are familiar with the application or user that triggered the alert, it's important to verify the situation surrounding every alert.
>
>  
>
> **Contact**

- Contact the resource owner to determine whether the behavior was expected or intentional.

- If the activity is expected, dismiss the alert.

- If the activity is unexpected, treat the related user accounts, subscriptions, and virtual machines as compromised and mitigate as described in the following step.

>  
>
> **Immediate mitigation**

- Remediate compromised user accounts:

  - If they are unfamiliar, delete them as they may have been created by a threat actor

  - If they are familiar, change their authentication credentials

  - Use Azure Activity Logs to review all activities performed by the user and identify any that are suspicious

- Remediate compromised subscriptions:

  - Remove any unfamiliar Runbooks from the compromised automation account

  - Review IAM permissions for the subscription and remove permissions for any unfamiliar user account

  - Review all Azure resources in the subscription and delete any that are unfamiliar

  - Review and investigate any security alerts for the subscription in Defender for Cloud

  - Use Azure Activity Logs to review all activities performed in the subscription and identify any that are suspicious

- Remediate the compromised virtual machines

  - Change the passwords for all users

  - Run a full antimalware scan on the machine

  - Reimage the machines from a malware-free source

 

Defender for Resource Manager alerts require investigation even if the triggering user or application is known. The response process involves:

1.  **Contact:** Check with the resource owner to determine if the activity was expected. If so, dismiss the alert. If not, proceed with mitigation assuming compromise.

2.  **Immediate Mitigation:** Address potential compromises in user accounts, subscriptions, and virtual machines:

    - **User Accounts:** Delete unfamiliar accounts. For familiar accounts, change credentials and review Azure Activity Logs for suspicious activities.

    - **Subscriptions:** Remove unfamiliar Runbooks, review and correct IAM permissions (removing unfamiliar users), delete unfamiliar Azure resources, investigate related Defender for Cloud alerts, and review subscription activity logs.

    - **Virtual Machines:** Change all user passwords, run a full antimalware scan, and reimage from a clean source.

### IR to DNS alerts

Defender for DNS protects all connected resources, so even if you are familiar with the application or user that triggered the alert, it's important to verify the situation surrounding every alert.

>  

Contact

- Contact the resource owner to determine whether the behavior was expected or intentional.

- If the activity is expected, dismiss the alert.

- If the activity is unexpected, treat the resource as potentially compromised and mitigate as described in the next step.

Immediate mitigation

Isolate the resource from the network to prevent lateral movement.

- Run a full antimalware scan on the resource, following any resulting remediation advice.

- Review installed and running software on the resource, removing any unknown or unwanted packages.

- Revert the machine to a known good state, reinstalling the operating system if necessary, and restore software from a verified malware-free source.

- Resolve any Defender for Cloud recommendations for the machine, remediating highlighted security issues to prevent future breaches.

 

**How to respond to MDC alerts for DNS?**

- Investigation

  - Contact the resource owner to determine whether the behavior was expected or intentional.

  - If the activity is expected, dismiss the alert.

  - If the activity is unexpected, treat resource as compromised and mitigate as described in the next step.

- Immediate mitigation

  - Isolate the resource from the network to prevent lateral movement.

  - Run a full antimalware scan on resource, following any resulting remediation advice.

  - Review installed and running software on resource, removing any unknown or unwanted packages.

  - Revert machine to healthy state, if necessary, reimage VM, restore software from trusted source.

  - Resolve MDC recommendations for machine, remediating security issues to prevent future breaches.

  - Respond to alerts from Azure resources

### IR to Key vault alerts

> Defender for Key Vault protects applications and credentials, so even if you are familiar with the application or user that triggered the alert, it is important to verify the situation surrounding every alert
>
>  
>
> Defender for Key Vault security alert includes the following elements:

- Object ID

- User Principal Name

- IP Address of the suspicious resource

>  
>
> **Verify the traffic source:** internal or external to tenant
>
> ** **
>
> **Immediate mitigation**
>
> If source of traffic identified then contact user or application owner.
>
>  
>
> <span class="mark">If source of traffic is not identified then:</span>
>
>  
>
> If the traffic came from an unrecognized IP Address:

- Enable the Azure Key Vault firewall as described in Configure Azure Key Vault firewalls and virtual networks.

- Configure the firewall with trusted resources and virtual networks.

>  
>
> If the source of the alert was an unauthorized application or suspicious user:

- Open the key vault's access policy settings.

- Remove the corresponding security principal, or restrict the operations the security principal can perform.

>  
>
> If the source of the alert has an Azure Active Directory role in your tenant:

- Contact your administrator.

- Determine whether there is a need to reduce or revoke Azure Active Directory permissions.

>  
>
> **Identify Impact**

- When the impact has been mitigated, investigate the secrets in your key vault that were affected:

  - Open the “Security” page on your Azure Key Vault and view the triggered alert.

  - Select the specific alert that was triggered. Review the list of the secrets that were accessed and the timestamp.

  - Optionally, if you have key vault diagnostic logs enabled, review the previous operations for the corresponding caller IP, user principal, or object ID.

- Respond to alerts from Azure resources

> **Take-action**

- When you have compiled your list of the secrets, keys, and certificates that the suspicious user or application accessed, you should immediately rotate those objects.

- Affected secrets should be disabled or deleted from your key vault.

- If the credentials were used for a specific application:

  - Contact the administrator of the application and ask them to audit their environment for any uses of the compromised credentials since they were compromised.

  - If the compromised credentials were used, the application owner should identify the information that was accessed and mitigate the impact.

 

 

 

 

 

How to group alerts in incident with respect to severity or entity in analytics rules?

Select grouping alerts in to single incident if selected entities match

 

Improve Incident Response with Alerting on Azure

[<u>https://docs.microsoft.com/en-us/learn/modules/incident-response-with-alerting-on-azure/7-exercise-activity-log-alerts</u>](https://docs.microsoft.com/en-us/learn/modules/incident-response-with-alerting-on-azure/7-exercise-activity-log-alerts)

[<u>https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service/3-enable-and-configure-app-service-application-logging-using-the-azure-portal</u>](https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service/3-enable-and-configure-app-service-application-logging-using-the-azure-portal)

[<u>https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service/5-view-live-application-logging-activity-with-the-log-streaming-service-using-azure-cli</u>](https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service/5-view-live-application-logging-activity-with-the-log-streaming-service-using-azure-cli)

[<u>https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service/7-retrieve-application-log-files-from-an-application-using-azure-cli-and-kudu</u>](https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service/7-retrieve-application-log-files-from-an-application-using-azure-cli-and-kudu)

[<u>https://docs.microsoft.com/en-us/learn/modules/secure-aspnet-core-identity/4-customize-identity?pivots=sql</u>](https://docs.microsoft.com/en-us/learn/modules/secure-aspnet-core-identity/4-customize-identity?pivots=sql)

[<u>https://docs.microsoft.com/en-us/learn/modules/control-authentication-with-apim/3-exercise-create-subscriptions-in-apim</u>](https://docs.microsoft.com/en-us/learn/modules/control-authentication-with-apim/3-exercise-create-subscriptions-in-apim) ** **

 

Analyze alert in XDR

> To analyse alerts in XDR, you can follow these steps:

- **Gather context**. Before you start analysing an alert, it is important to gather as much context as possible. This may include information about the alert itself, such as the time it was triggered, the severity, and the source. You should also gather information about the environment in which the alert was triggered, such as the affected systems and networks.

- **Correlate data.** XDR solutions can correlate data from a variety of sources, such as endpoints, networks, and security appliances. This allows you to get a complete picture of the threat and to identify the root cause of the alert.

- **Identify the threat.** Once you have gathered context and correlated data, you can begin to identify the threat. This may involve using threat intelligence feeds or machine learning algorithms.

- **Assess the impact.** Once you have identified the threat, you need to assess the impact. This may involve determining the scope of the attack, the systems and data that have been affected, and the potential damage to the organization.

- **Act.** Once you have assessed the impact, you need to take action to remediate the threat and prevent future attacks. This may involve isolating affected systems, removing malware, or patching vulnerabilities.

- **Use filters**. XDR solutions allow you to filter alerts based on a variety of criteria, such as the severity, source, and type of alert. This can help you to quickly identify the most important alerts and to prioritize your investigations.

- **Use threat intelligence feeds**. Threat intelligence feeds can provide information about known threats, such as indicators of compromise (IOCs) and attack patterns. This information can help you to identify and investigate threats more effectively.

- **Use machine learning algorithms**. Machine learning algorithms can be used to identify patterns and trends in alert data. This can help you to identify threats that may be difficult or impossible to identify manually.

- **Collaborate with other teams**. XDR solutions can help you to collaborate with other teams, such as security operations and incident response. This can help you to investigate and respond to threats more effectively.

>  
>
>  

 

MDC Alerts

- **MDC security alert**

  - **severity levels:** High, Medium, Low, Informational (Context of activity)

  - **MDC Security alerts** are triggered by advanced detections and are available only with MDC.

  - Alerts are the notifications that MDC generates when it detects threats on resources.

  - A security incident is a collection of related alerts instead of listing each alert individually.

  - Using incidents, MDC provides you with a single view of an attack campaign and all the related alerts.

<!-- -->

- MDC uses many detection capabilities to alert customers about potential attacks targeting their environments.

- MDC uses following security analytics

  - **Integrated threat intelligence**: looks for known bad actors by using global threat intelligence from Microsoft products and services, the Microsoft Digital Crimes Unit (DCU), the Microsoft Security Response Center (MSRC), and external feeds.

  - **Behavioral analytics**: applies known patterns to discover malicious behavior.

  - **Anomaly detection:** uses statistical profiling to build an historical baseline. It alerts on deviations from established baselines that conform to a potential attack vector.

- Using these analytics, MDC can help to disrupt the cyber kill chain by adding **detections** in different phase of the cyber kill chain as shown in the diagram below:

**MDC Configuration**

**MDC Integration with Splunk**

**Remediations of MDC recommendations**

https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Remediation scripts

**MDC integration with ServiceNow through Workflow Automation (Logic apps)**

- <https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/azure-security-center-automating-change-requests-in-servicenow/ba-p/1285670>

- [https://github.com/Azure/Microsoft-Defender-for-Cloud/blob/main/Workflow automation/Create-SNOWCRfromASCRec/azuredeploy.json](https://github.com/Azure/Microsoft-Defender-for-Cloud/blob/main/Workflow%20automation/Create-SNOWCRfromASCRec/azuredeploy.json)

IR MDC alerts recommendations?

- Every security program includes multiple workflows for incident response.

- These processes might include notifying relevant stakeholders, launching a change management process, and applying specific remediation steps.

- Security experts recommend that you automate as many steps of those procedures as you can.

- This feature can trigger Logic Apps on security alerts and recommendations

- configure automated responses in Microsoft Defender for Cloud

- design and configure workflow automation in Microsoft Defender for Cloud

- remediate incidents by using Microsoft Defender for Cloud recommendations

- create an automatic response using an Azure Resource Manager template

**Create a logic app and define when it should automatically run**

- Microsoft Defender for Cloud 🡪 Management 🡪 Workflow automation 🡪 Add Workflow automation

- General: Provide Name and description for workflow, Select subscriptions, resource groups

- Select Trigger conditions:

- Defender for cloud data type: Security Alert, MDC Recommendations, Regulatory compliance standards

- Alert/Recommendation Name contains, Compliance standard, Severity or State

- Actions: Select subscription and Logic App

**Suppress security alerts:**

- Your suppression rules define the criteria for which alerts should be automatically dismissed.

- Suppression rules can only dismiss alerts that have already been triggered on the selected subscriptions.

- Suppress alert Alert suppression conditions:

  - Suppress alerts that are being triggered too often to be useful

  - Suppress alerts that you have identified as false positives

Configuration

- Setup email notifications

- Create and manage alert suppression rules

Investigation

- Investigate Microsoft Defender for Cloud alerts and incidents

- describe alert types for Azure workloads

- manage security alerts

- manage security incidents

- analyse Microsoft Defender for Cloud threat intelligence

- respond to Microsoft Defender Cloud for Key Vault alerts

- manage user data discovered during an investigation

**I. MDC Alert Configuration and Automation:**

- **Alert Setup:** Configure email notifications for MDC alerts.

- **Suppression Rules:** Create and manage rules to automatically dismiss alerts based on defined criteria (e.g., frequency, false positives). Suppression rules apply *after* an alert has been triggered.

- **Automation:**

  - Automate incident response workflows by triggering Logic Apps on security alerts and recommendations.

  - Configure automated responses within MDC, designing and configuring workflow automation.

  - Remediate incidents using MDC recommendations.

  - Create automated responses using Azure Resource Manager templates.

  - **Logic App Creation:** Navigate to MDC -\> Management -\> Workflow automation -\> Add Workflow automation. Define the workflow with a name, description, target subscriptions/resource groups, trigger conditions (Defender for Cloud data type: Security Alert, MDC Recommendations, Regulatory compliance standards; specific alert/recommendation name, compliance standard, severity, or state), and actions (select subscription and the target Logic App).

**II. MDC Alert Investigation and Management:**

- Investigate MDC alerts and security incidents.

- Understand Azure workload alert types.

- Manage security alerts and incidents within MDC.

- Analyze MDC threat intelligence.

- Manage user data discovered during investigations.

**III. MDC Alert Suppression:**

- Suppress alerts that are too frequent or identified as false positives.

- Create suppression rules in MDC -\> Alerts -\> Suppression rules -\> Create suppression rule.

- Define suppression conditions based on alert type (e.g., "User accessed high volume of key vaults"), entities (user account, Azure resource, IP, name/AAD ID/UPN suffix), and matching criteria (contains, in).

**IV. Threat Intelligence Reports:**

- MDC correlates security alerts to provide a comprehensive view of attack campaigns, including attacker information (if available), objectives, tactics, tools, procedures, indicators of compromise (IoCs), victimology, and mitigation information.

- MDC offers three types of threat reports: Activity Group Report, Campaign Report, and Threat Summary Report.

**V. Responding to Specific MDC Alerts:**

- **Key Vault Alerts:**

  - Alerts include Object ID, User Principal Name, and IP Address.

  - **Investigation:** Determine if the traffic source is internal or external.

  - **Mitigation:**

    - Contact the user or application owner if the behavior is expected.

    - If the source is unknown, enable the Key Vault firewall and configure trusted resources/VNETs.

    - If unauthorized, adjust Key Vault access policies, removing or restricting permissions.

    - If the source is an Azure AD role, contact an administrator to review permissions.

  - **Impact Assessment:** Review accessed secrets and timestamps in the alert details. If diagnostic logs are enabled, review previous operations.

  - **Action:** Rotate accessed secrets, keys, and certificates. Disable or delete affected secrets. Contact application owners to audit their environments for compromised credential usage.

- **DNS Alerts:**

  - **Investigation:** Contact the resource owner to determine if the behavior is expected.

  - **Mitigation:**

    - Isolate the resource from the network.

    - Perform a full antimalware scan.

    - Review installed and running software.

    - Revert to a healthy state (reimage if necessary).

    - Address MDC recommendations.

- **Resource Manager Alerts:**

  - **Investigation:** Contact the resource owner to determine if the behavior is expected.

  - **Mitigation:**

    - **Compromised User Accounts:** Delete unfamiliar accounts, change credentials for familiar ones, and review Azure Activity Logs.

    - **Compromised Subscriptions:** Remove unfamiliar Runbooks, review IAM permissions, delete unfamiliar resources, review security alerts, and review Azure Activity Logs.

    - **Compromised VMs:** Change user passwords, perform a full antimalware scan, and reimage from a trusted source.

This revised summary provides a more structured and accurate representation of the original document, clarifying key concepts and correcting some minor inaccuracies. It emphasizes the importance of automation, suppression rules, and specific response procedures for different alert types.

## Investigation through MDCA

Identify the scope and impact of incident

- First step in IR is to identify scope and impact of incident.

- Identify which cloud services, users, devices, and data is affected.

- Identify how severe the damage is?

- CASB can help you with this by providing visibility and alerts on the cloud activity and anomalies.

- Use CASB to perform forensic analysis and collect evidence for further investigation.

- Using CASB to monitor cloud services usage detect anomalies identify security incidents such as unauthorized access, malware activity.

- Determine scope of incident by analysing impact.

- Conducting risk assessment to prioritize response effort.

- IR process involve correct classification of incident.

- Sending communications to stakeholders, escalating resolver teams

### Eradicate and restore the incident

- CASB can help you with backup and recovery options such as restoring files from previous versions or recovering data from other sources.

- Use CASB to audit and verify recovery processes and ensure no vulnerabilities or gaps remain.

### Learn and improve from incident

- CASB can help you by providing reports and dashboards that show incident timeline, impact, and response.

- Use CASB to implement and monitor action item and improve your security posture and readiness.

- CASB is valuable for managing security of cloud resources.

### Contain and isolate incident

- CASB can help you by enabling you to apply granular policies and controls on cloud services such as revoking permissions, quarantining files, encrypting data.

- CASB to coordinate with cloud service providers and other stakeholders to implement remediation measures.

- Use CASB automated response capabilities to contain threats quickly. These actions like blocking access to specific applications, quarantining suspicious files or forcing a logout of compromised accounts.

** **

## Malware infection 

Investigating Malware infection with XDR

How to investigate malware infection incident in XDR and SIEM?

investigate a malware infection incident in XDR, you can follow these steps:

1.  Identify the affected systems and users. Use your XDR solution to identify the systems and users that have been infected with malware. This may involve searching for known malware indicators of compromise (IOCs), such as file hashes, IP addresses, and URLs.

2.  Determine the scope of the infection. Use your XDR solution to determine the extent of the malware infection. This may involve investigating the network traffic associated with the infected systems, as well as the files that have been accessed or modified by the malware.

3.  Identify the root cause of the infection. Use your XDR solution to identify the root cause of the malware infection. This may involve investigating how the malware was initially introduced into your environment, as well as any vulnerabilities that may have been exploited.

4.  Remediate the infection. Once you have identified the infected systems and users, and determined the scope of the infection, you can begin to remediate the infection. This may involve removing the malware from infected systems, restoring data from backups, and patching vulnerabilities.

5.  Prevent future infections. Once you have remediated the infection, you need to take steps to prevent future infections. This may involve implementing additional security controls, such as email filtering, web filtering, and application control.

Here are some additional tips for investigating a malware infection incident in XDR:

- Use all of the data sources available to you. XDR solutions collect data from a variety of sources, such as endpoints, networks, and security appliances. Use all of this data to get a complete picture of the infection.

- Correlate data from different sources. XDR solutions can correlate data from different sources to identify threats that would be difficult or impossible to detect using traditional security solutions. Use this capability to identify the root cause of the infection and to determine which systems and users have been affected.

- Use threat intelligence feeds. Threat intelligence feeds can provide information about known malware threats, such as IOCs and attack patterns. Use this information to help you identify and investigate malware infections.

- Automate tasks. XDR solutions can automate many of the tasks involved in investigating and responding to malware infections. This can save you time and help you to respond to incidents more quickly and effectively.

By following these steps and tips, you can use your XDR solution to investigate and remediate malware infection incidents effectively.

**Investigating Malware infection with SIEM**

## Malware Infection 

**Investigating Malware infection with XDR**

**How to investigate malware infection incident in XDR and SIEM?**

investigate a malware infection incident in XDR, you can follow these steps:

6.  Identify the affected systems and users. Use your XDR solution to identify the systems and users that have been infected with malware. This may involve searching for known malware indicators of compromise (IOCs), such as file hashes, IP addresses, and URLs.

7.  Determine the scope of the infection. Use your XDR solution to determine the extent of the malware infection. This may involve investigating the network traffic associated with the infected systems, as well as the files that have been accessed or modified by the malware.

8.  Identify the root cause of the infection. Use your XDR solution to identify the root cause of the malware infection. This may involve investigating how the malware was initially introduced into your environment, as well as any vulnerabilities that may have been exploited.

9.  Remediate the infection. Once you have identified the infected systems and users, and determined the scope of the infection, you can begin to remediate the infection. This may involve removing the malware from infected systems, restoring data from backups, and patching vulnerabilities.

10. Prevent future infections. Once you have remediated the infection, you need to take steps to prevent future infections. This may involve implementing additional security controls, such as email filtering, web filtering, and application control.

Here are some additional tips for investigating a malware infection incident in XDR:

- Use all of the data sources available to you. XDR solutions collect data from a variety of sources, such as endpoints, networks, and security appliances. Use all of this data to get a complete picture of the infection.

- Correlate data from different sources. XDR solutions can correlate data from different sources to identify threats that would be difficult or impossible to detect using traditional security solutions. Use this capability to identify the root cause of the infection and to determine which systems and users have been affected.

- Use threat intelligence feeds. Threat intelligence feeds can provide information about known malware threats, such as IOCs and attack patterns. Use this information to help you identify and investigate malware infections.

- Automate tasks. XDR solutions can automate many of the tasks involved in investigating and responding to malware infections. This can save you time and help you to respond to incidents more quickly and effectively.

By following these steps and tips, you can use your XDR solution to investigate and remediate malware infection incidents effectively.

**Investigating Malware infection with SIEM**

## Ransomware infection

Investigating Ransomware infection with XDR

How would you use XDR to detect and respond to a ransomware attack?

To use XDR to detect and respond to a ransomware attack, you can follow these steps:

Detection

1.  Use XDR to correlate data from a variety of sources, such as endpoints, networks, and cloud environments. This will help you to identify suspicious activity that may be indicative of a ransomware attack.

2.  Look for the following signs of a ransomware attack:

    - Unusual network traffic patterns

    - Unusual file activity, such as a large number of files being encrypted or deleted

    - Unusual login attempts

    - Users reporting that their files are encrypted or that they are unable to access their systems

3.  Use XDR to investigate any suspicious activity and to determine whether it is a ransomware attack. If you determine that it is a ransomware attack, you can begin to respond to the attack.

Response

1.  Use XDR to isolate the affected systems from the rest of the network. This will help to prevent the ransomware from spreading to other systems.

2.  Identify the ransomware variant that is affecting your systems. This will help you to determine the best course of action for responding to the attack.

3.  If possible, restore the affected systems from backups.

4.  If you are unable to restore the affected systems from backups, you may need to pay the ransom to get the decryption key. However, it is important to note that paying the ransom does not guarantee that you will get your files back.

5.  After you have responded to the attack, take steps to improve your security posture and to prevent future ransomware attacks. This may involve implementing security awareness training for your employees, deploying security patches, and updating your security solutions.

Here are some additional tips for using XDR to detect and respond to a ransomware attack:

- Use XDR to automate tasks such as data collection, threat detection, and incident response. This will help you to respond to the attack more quickly and effectively.

- Use XDR to collaborate with other security teams, such as your incident response team and your security operations center. This will help you to share information and to coordinate your response to the attack.

- Use XDR to monitor the attack after you have responded. This will help you to identify any new threats and to ensure that the attack has been fully remediated.

By following these tips, you can use XDR to detect and respond to a ransomware attack more effectively and to protect your organization from further damage.

Additional safety guidelines:

- Do not disclose any sensitive information about your organization's security posture or the ransomware attack.

- Do not encourage other people to pay the ransom.

- Do not provide any personal information about yourself or your organization.

- Do not share any links or attachments that could be malicious.

If you have any questions or concerns about how to use XDR to detect and respond to a ransomware attack, please contact your security team or a security expert.

## Ransomware infection

**Investigating Ransomware infection with XDR**

**How would you use XDR to detect and respond to a ransomware attack?**

To use XDR to detect and respond to a ransomware attack, you can follow these steps:

Detection

4.  Use XDR to correlate data from a variety of sources, such as endpoints, networks, and cloud environments. This will help you to identify suspicious activity that may be indicative of a ransomware attack.

5.  Look for the following signs of a ransomware attack:

    - Unusual network traffic patterns

    - Unusual file activity, such as a large number of files being encrypted or deleted

    - Unusual login attempts

    - Users reporting that their files are encrypted or that they are unable to access their systems

6.  Use XDR to investigate any suspicious activity and to determine whether it is a ransomware attack. If you determine that it is a ransomware attack, you can begin to respond to the attack.

Response

6.  Use XDR to isolate the affected systems from the rest of the network. This will help to prevent the ransomware from spreading to other systems.

7.  Identify the ransomware variant that is affecting your systems. This will help you to determine the best course of action for responding to the attack.

8.  If possible, restore the affected systems from backups.

9.  If you are unable to restore the affected systems from backups, you may need to pay the ransom to get the decryption key. However, it is important to note that paying the ransom does not guarantee that you will get your files back.

10. After you have responded to the attack, take steps to improve your security posture and to prevent future ransomware attacks. This may involve implementing security awareness training for your employees, deploying security patches, and updating your security solutions.

Here are some additional tips for using XDR to detect and respond to a ransomware attack:

- Use XDR to automate tasks such as data collection, threat detection, and incident response. This will help you to respond to the attack more quickly and effectively.

- Use XDR to collaborate with other security teams, such as your incident response team and your security operations center. This will help you to share information and to coordinate your response to the attack.

- Use XDR to monitor the attack after you have responded. This will help you to identify any new threats and to ensure that the attack has been fully remediated.

By following these tips, you can use XDR to detect and respond to a ransomware attack more effectively and to protect your organization from further damage.

Additional safety guidelines:

- Do not disclose any sensitive information about your organization's security posture or the ransomware attack.

- Do not encourage other people to pay the ransom.

- Do not provide any personal information about yourself or your organization.

- Do not share any links or attachments that could be malicious.

If you have any questions or concerns about how to use XDR to detect and respond to a ransomware attack, please contact your security team or a security expert.

 

# Threat Response

Microsoft Defender XDR's Threat Response feature provides a centralized location to manage remediation actions across devices, email & collaboration content, and identities. The "Actions and Submissions" section tracks these actions, offering both a "Pending" queue and a "History" log.

**Actions Tracked:** Defender XDR tracks a variety of actions, including:

- Collect investigation package

- Isolate device (can be undone)

- Offboard machine

- Release code execution

- Release from quarantine

- Request sample

- Restrict code execution (can be undone)

- Run antivirus scan

- Stop and quarantine

- Contain devices from the network

**Pending Actions:** This section displays actions requiring attention. Users can approve or reject actions individually or in bulk (for similar action types like "Quarantine file").

**Action History:** This serves as an audit log, recording all actions taken and providing a way to undo them. It includes:

- Remediation actions from automated investigations

- Actions taken on suspicious/malicious emails, files, or URLs

- Actions approved by security operations teams

- Commands and remediation actions from Live Response sessions

- Actions taken by antivirus protection

**Required Roles:** Managing actions requires specific roles: Security Administrator, Active remediation actions, and Search and Purge.

**Remediation Actions on Devices:** Defender XDR offers a comprehensive set of remediation actions for devices:

- Isolate device

- Restrict code execution

- Run antivirus scan

- Collect investigation package

- Initiate automated investigation

- Release code execution

- Release from quarantine

- Request sample

- Stop and quarantine

- Contain devices from the network

- Block URL (time-of-click)

- Soft delete email messages or clusters

- Quarantine email

- Quarantine<sup>1</sup> email attachment

- Turn off external mail forwarding

- Disable user

- Reset user password

- Confirm user as compromised

These actions can be triggered manually or automatically through Automated Investigation and Response (AIR).

**Taking Remediation Actions:** To perform an action on a device:

1.  Navigate to the "Devices" page in the Defender XDR portal.

2.  Select the target device.

3.  Go to the "Remediation" tab.

4.  Choose the desired action.

5.  Click "Act."

For further assistance, users are advised to contact their Microsoft security administrator.

 

## Automate Remediations through playbooks

[Automate Azure Security Center actions with Playbooks and ServiceNow - Microsoft Community Hub](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/automate-azure-security-center-actions-with-playbooks-and/ba-p/264843)

[Microsoft-Defender-for-Cloud/Remediation scripts at main · Azure/Microsoft-Defender-for-Cloud · GitHub](https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Remediation%20scripts)

## SOAR in Defender

**What are the different ways to use XDR to automate security tasks?**

 

- Automatic Sample Submission: MDE can automatically submit suspicious files for further analysis in the cloud, speeding up threat identification.

- Limited Built-in Remediation: MDE offers some built-in remediation options for specific threats, such as quarantining infected devices or blocking malicious URLs.

 

Integration with Microsoft Defender XDR: MDE integrates with XDR, which offers more robust automation capabilities through:

 

- Automated Investigation and Response (AIR) Playbooks: While you can't directly configure AIR in MDE itself, XDR allows you to create playbooks that define automated actions triggered by security alerts from MDE or other security products. These actions can involve investigation, remediation, and notification.

 

**Alternative Approaches for Automation:**

- Microsoft Endpoint Management (MEM) Policies: MEM policies can be used to configure some automated actions on endpoints, such as blocking risky applications or enforcing device configuration settings. These policies can complement MDE's automation capabilities.

- Third-Party Endpoint Detection and Response (EDR) Solutions: Some EDR solutions offer more advanced automation features compared to MDE's built-in capabilities. These might be an option if your organization requires a higher degree of automation.

 

**Automated investigation and response workflow**

- When alert is triggered, then security playbook initiates.

- Depending alert respective playbook starts investigation immediately or security analyst can start security playbook manually.

- While automated investigation runs, its scope could increase depending on related alerts triggered.

- Result of automated investigation include recommendations that can be taken to respond any threats that were found.

- SOC team can review recommendations and approve/reject remediations .

 

## Use cases

Sure. Here are some real-life and practical use cases of the Automated Investigation and Response (AIR) feature in Microsoft Defender XDR:

<span class="mark">**Use case 1:** Detecting and responding to phishing attacks</span>

Phishing attacks are one of the most common types of cyberattacks. They involve sending fraudulent emails or messages to users in an attempt to trick them into revealing sensitive information, such as passwords or credit card numbers.

Microsoft Defender XDR's AIR feature can be used to automate the detection and response to phishing attacks. For example, AIR can be configured to automatically investigate any emails that are reported as phishing by users. AIR can then gather data about the email, such as the sender address, subject line, and body content. AIR can also analyze the email for any known phishing indicators of compromise (IOCs).

If AIR determines that the email is a phishing attack, it can take a number of actions, such as quarantining the email, marking it as spam, or notifying the user. AIR can also be configured to automatically block the sender's email address.

<span class="mark">**Use case 2:** Investigating and responding to malware infections</span>

Malware infections can have a significant impact on organizations, causing damage to systems and data, and disrupting operations.

Microsoft Defender XDR's AIR feature can be used to automate the investigation and response to malware infections. For example, AIR can be configured to automatically investigate any devices that are flagged as infected with malware. AIR can then gather data about the device, such as the operating system, installed applications, and recent activity. AIR can also analyze the device for any known malware hashes or other IOCs.

If AIR determines that the device is infected with malware, it can take a number of actions, such as removing the malware, isolating the device from the network, or notifying the user. AIR can also be configured to automatically deploy patches for any known vulnerabilities that were exploited by the malware.

<span class="mark">**Use case 3:** Responding to ransomware attacks</span>

Ransomware attacks involve encrypting an organization's data and demanding a ransom payment in exchange for the decryption key. Ransomware attacks can be very costly and disruptive for organizations.

Microsoft Defender XDR's AIR feature can be used to automate the response to ransomware attacks. For example, AIR can be configured to automatically isolate any devices that are infected with ransomware from the network. This can help to prevent the ransomware from spreading to other devices.

AIR can also be used to restore data from backups in the event that the ransomware attack is successful. AIR can also be configured to automatically notify law enforcement and other relevant authorities of the ransomware attack.

<span class="mark">**Use case 4:** Conducting proactive security investigations</span>

Microsoft Defender XDR's AIR feature can also be used to conduct proactive security investigations. For example, AIR can be used to investigate security incidents that have not yet triggered any alerts. AIR can also be used to investigate specific threats, such as advanced persistent threats (APTs).

By using AIR to conduct proactive security investigations, organizations can identify and respond to threats before they cause any damage.

These are just a few examples of the many ways that Microsoft Defender XDR's AIR feature can be used to improve security posture and protect organizations from threats.

How automated response works in Defender?\
Automated investigation in Microsoft Defender XDR uses a combination of machine learning, analytics, and threat intelligence to automate the investigation of security alerts and incidents. This can help security teams to save time and respond to incidents more quickly and effectively.

When an alert or incident is triggered, Microsoft Defender XDR gathers data from a variety of sources, including endpoints, networks, security appliances, and Microsoft 365 services. This data is then analyzed using machine learning and analytics to identify the root cause of the alert or incident, the scope of the impact, and the potential remediation steps.

Microsoft Defender XDR also uses threat intelligence to enrich its investigation results. Threat intelligence provides information about known malware threats, such as indicators of compromise (IOCs) and attack patterns. This information can help Microsoft Defender XDR to identify and investigate threats more effectively.

Once the investigation is complete, Microsoft Defender XDR provides a report that summarizes the findings and recommends remediation steps. The report also includes links to additional resources, such as Microsoft security documentation and threat intelligence feeds.

Here are some of the benefits of using automated investigation in Microsoft Defender XDR:

- **Reduced workload for security teams:** Automated investigation can help security teams to save time by automating many of the tasks involved in investigating security alerts and incidents. This allows security teams to focus on more complex tasks, such as strategic planning and incident response.

- **Improved response times:** Automated investigation can help security teams to respond to incidents more quickly by automating the initial stages of the investigation process. This can help to mitigate the damage caused by the incident and reduce the risk of further attacks.

- **Increased accuracy:** Automated investigation can help to improve the accuracy of incident investigations by using machine learning and analytics to identify patterns and trends that may be difficult or impossible for humans to identify.

- **Reduced costs:** Automated investigation can help to reduce the costs associated with incident response by reducing the workload for security teams and improving response times.

Overall, automated investigation in Microsoft Defender XDR is a powerful tool that can help security teams to improve their security posture and protect their organizations from threats.

## SOAR in MDC

SOAR stands for Security Orchestration and Automated Response.

SOAR system takes alerts from many sources, such as a SIEM system then triggers action-driven automated workflows and processes to run security tasks that mitigate the issue.

**<span class="mark">SOAR Components</span>**

Security Orchestration 

Security Automation

Security Response

## Automated Response through Sentinel

[Create example Consumption logic app workflow in the Azure portal - Azure Logic Apps \| Microsoft Learn](https://learn.microsoft.com/en-us/azure/logic-apps/quickstart-create-example-consumption-workflow)

Tutorial: Use playbooks with automation rules in Microsoft Sentinel

[Use playbooks with automation rules in Microsoft Sentinel \| Microsoft Learn](https://learn.microsoft.com/en-us/azure/sentinel/tutorial-respond-threats-playbook?tabs=LAC%2Cincidents)

Automation playbooks use logics apps for SOAR function in Sentinel

 

**Automation Playbooks**

- Copy exiting playbook: clone

- Changes to playbook: edit

- Run playbook manually on alert in incident: Incident page - Select incident - View full details - Alerts - view playbooks and select playbook.

<!-- -->

- If automation playbook is not running, while troubleshooting you notice that playbook has trigger kind of not initialized, what to do? **Add triggers or actions to play book**

-  

- Create playbook that uses logic app to communicate with other systems and services via API calls to a known, commonly used products or services. Which connector we should configure? 🡪 **Managed connector: A set of actions and triggers that wrap around API calls to a particular product or service.**

- Your manager wants to send messages to Security channel whenever intended sign-in from suspicious IP address occurs. What solution needs to be used? 🡪 **Create Playbook and assign it to incident, do not use workbook, Do not use Microsoft Graph**

 

Configure rules and incidents to trigger playbooks

Create Sentinel playbooks

Use playbooks across Microsoft Defender solutions

Use playbooks to manage incidents

Use playbooks to remediate threats

[Create example Consumption logic app workflow in the Azure portal - Azure Logic Apps \| Microsoft Learn](https://learn.microsoft.com/en-us/azure/logic-apps/quickstart-create-example-consumption-workflow)

[Use playbooks with automation rules in Sentinel \| Microsoft Learn](https://learn.microsoft.com/en-us/azure/sentinel/tutorial-respond-threats-playbook?tabs=LAC%2Cincidents)

Automation playbooks use logics apps for SOAR function in Sentinel

 

**Automation Playbooks**

- Copy exiting playbook: clone

- Changes to playbook: edit

- Run playbook manually on alert in incident: Incident page - Select incident - View full details - Alerts - view playbooks and select playbook.

<!-- -->

- If automation playbook is not running, while troubleshooting you notice that playbook has trigger kind of not initialized, what to do? **Add triggers or actions to play book**

-  

- Create playbook that uses logic app to communicate with other systems and services via API calls to a known, commonly used products or services. Which connector we should configure? à **Managed connector: A set of actions and triggers that wrap around API calls to a particular product or service.**

- Your manager wants to send messages to Security channel whenever intended sign-in from suspicious IP address occurs. What solution needs to be used? à **Create Playbook and assign it to incident, do not use workbook, Do not use Microsoft Graph**

 

**Configure rules and incidents to trigger playbooks**

**Create Sentinel playbooks**

**Use playbooks across Microsoft Defender solutions**

**Use playbooks to manage incidents**

**Use playbooks to remediate threats**

*create Sentinel playbooks*

- *configure rules and incidents to trigger playbooks*

- *use playbooks to remediate threats*

- *use playbooks to manage incidents*

- *use playbooks across Microsoft Defender solutions*

<!-- -->

- ***Automation Rules:** It is solution that runs playbooks as a response of incidents.*

- ***How to make copy of existing playbooks?** : Use logic app action "clone"*

- ***How to make changes to playbooks?** : Use logic app action "edit"*

- ***If automation playbook is not running, while troubleshooting you notice that playbook has trigger kind of not initialized, what to do?**: Add triggers or actions to play book*

- ***How to run playbook manually on alert in incident?***

  - *Incident page--\>Select incident --\> View full details*

  - *In alerts tab --\> Click on alert on which you want to run playbook*

  - *Click view playbooks and select playbook to run from list of available playbooks on subscription*

- ***Create playbook that uses logic app to communicate with other systems and services via API calls to a known, commonly used products or services. Which connector we should configure?***

  - ***Managed connector**: A set of actions and triggers that wrap around API calls to a particular product or service.*

- ***Your manager wants to send messages to Security channel whenever intended sign-in from suspicious IP address occurs. What solution needs to be used?***

  - *Create Playbook and assign it to incident*

  - *Do not use workbook*

  - *Do not use Microsoft Graph*

Automation playbooks are used to runs as a response of incidents.

- **How to make copy of existing playbooks?** : Use logic app action "clone"

- **How to make changes to playbooks?** : Use logic app action "edit"

- **If automation playbook is not running, while troubleshooting you notice that playbook has trigger kind of not initialized, what to do?**: Add triggers or actions to play book

- **How to run playbook manually on alert in incident?**

  - Incident page--\>Select incident --\> View full details

  - In alerts tab --\> Click on alert on which you want to run playbook

  - Click view playbooks and select playbook to run from list of available playbooks on subscription

- **Create playbook that uses logic app to communicate with other systems and services via API calls to a known, commonly used products or services. Which connector we should configure?**

  - **Managed connector**: A set of actions and triggers that wrap around API calls to a particular product or service.

- **Your manager wants to send messages to Security channel whenever intended sign-in from suspicious IP address occurs. What solution needs to be used?**

  - Create Playbook and assign it to incident

  - Do not use workbook

  - Do not use Microsoft Graph

<!-- -->

- create Sentinel playbooks

- configure rules and incidents to trigger playbooks

- use playbooks to remediate threats

- use playbooks to manage incidents

- use playbooks across Microsoft Defender solutions

Automation playbooks use logics apps for SOAR function in Sentinel . Automation Rules is solution that runs playbooks as a response of incidents.

- Configure rules and incidents to trigger playbooks

- Create Sentinel playbooks

- Use playbooks across Microsoft Defender solutions

- Use playbooks to manage incidents

- Use playbooks to remediate threats

[**https://learn.microsoft.com/en-us/azure/logic-apps/quickstart-create-example-consumption-workflow**](https://learn.microsoft.com/en-us/azure/logic-apps/quickstart-create-example-consumption-workflow)

[**https://learn.microsoft.com/en-us/azure/Sentinel /tutorial-respond-threats-playbook?tabs=LAC%2Cincidents**](https://learn.microsoft.com/en-us/azure/sentinel/tutorial-respond-threats-playbook?tabs=LAC%2Cincidents)

<span class="mark">How to run playbook manually on alert in incident?</span>

- Incident page--\>Select incident --\> View full details

- In alerts tab --\> Click on alert on which you want to run playbook

- Click view playbooks and select playbook to run from list of available playbooks on subscription

<span class="mark">Create playbook that uses logic app to communicate with other systems and services via API calls to a known, commonly used products or services. Which connector we should configure?</span>

**Managed connector**: A set of actions and triggers that wrap around API calls to a particular product or service.

<span class="mark">Your manager wants to send messages to Security channel whenever intended sign-in from suspicious IP address occurs. What solution needs to be used?</span>

- Create Playbook and assign it to incident

- Do not use workbook

- Do not use Microsoft Graph

**How to copy exiting playbook?**

Clone

**How to update or make changes to playbook?**

Edit

**If automation playbook is not running, while troubleshooting you notice that playbook has trigger kind of not initialized, what to do?**

Add triggers or actions to play book

Automation playbooks use logics apps for SOAR function in Sentinel . Automation Rules is solution that runs playbooks as a response of incidents.

>  

- Configure rules and incidents to trigger playbooks

- Create Sentinel playbooks

- Use playbooks across Microsoft Defender solutions

- Use playbooks to manage incidents

- Use playbooks to remediate threats

>  
>
>  
>
> [**https://learn.microsoft.com/en-us/azure/logic-apps/quickstart-create-example-consumption-workflow**](https://learn.microsoft.com/en-us/azure/logic-apps/quickstart-create-example-consumption-workflow)
>
> [**https://learn.microsoft.com/en-us/azure/Sentinel /tutorial-respond-threats-playbook?tabs=LAC%2Cincidents**](https://learn.microsoft.com/en-us/azure/sentinel/tutorial-respond-threats-playbook?tabs=LAC%2Cincidents)
>
>  
>
>  
>
> <span class="mark">How to run playbook manually on alert in incident?</span>

- Incident page--\>Select incident --\> View full details

- In alerts tab --\> Click on alert on which you want to run playbook

- Click view playbooks and select playbook to run from list of available playbooks on subscription

>  
>
> <span class="mark">Create playbook that uses logic app to communicate with other systems and services via API calls to a known, commonly used products or services. Which connector we should configure?</span>
>
> **Managed connector**: A set of actions and triggers that wrap around API calls to a particular product or service.
>
>  
>
> <span class="mark">Your manager wants to send messages to Security channel whenever intended sign-in from suspicious IP address occurs. What solution needs to be used?</span>

- Create Playbook and assign it to incident

- Do not use workbook

- Do not use Microsoft Graph

>  
>
> <span class="mark">How to copy exiting playbook?</span> Clone
>
>  
>
> <span class="mark">How to update or make changes to playbook?</span> Edit
>
>  
>
> <span class="mark">If automation playbook is not running, while troubleshooting you notice that playbook has trigger kind of not initialized, what to do?</span> Add triggers or actions to play book
>
>  

Automation (playbooks = logic apps) SOAR

Automation Playbooks

create Sentinel playbooks

configure rules and incidents to trigger playbooks

use playbooks to remediate threats

use playbooks to manage incidents

use playbooks across Microsoft Defender solutions

Automation Rules: It is solution that runs playbooks as a response of incidents.

How to make copy of existing playbooks? : Use logic app action "clone"

How to make changes to playbooks? : Use logic app action "edit"

If automation playbook is not running, while troubleshooting you notice that playbook has trigger kind of not initialized, what to do?: Add triggers or actions to play book

How to run playbook manually on alert in incident?

Incident page--\>Select incident --\> View full details

In alerts tab --\> Click on alert on which you want to run playbook

Click view playbooks and select playbook to run from list of available playbooks on subscription

Create playbook that uses logic app to communicate with other systems and services via API calls to a known, commonly used products or services. Which connector we should configure?

Managed connector: A set of actions and triggers that wrap around API calls to a particular product or service.

Your manager wants to send messages to Security channel whenever intended sign-in from suspicious IP address occurs. What solution needs to be used?

Create Playbook and assign it to incident

Do not use workbook

Do not use Microsoft Graph

# Threat Mitigation 

MICROSOFT DEFENDER XDR is a comprehensive, unified security suite from Microsoft that provides end-to-end protection against cyber threats. Here's what makes it stand out:

- **Unified Defense:** MICROSOFT DEFENDER XDR offers a single platform for pre-breach protection (preventing attacks) and post-breach response (dealing with successful attacks).

- **Cross-product Integration:** It seamlessly integrates various Microsoft security products like Defender for Endpoint, Defender for Identity, Defender for Cloud Apps, and others, enabling them to work together and share information.

- **Extended Visibility:** Gain a holistic view of your security landscape across endpoints (devices), identities (users), email, and cloud applications.

- **Enhanced Threat Detection:** By correlating signals from different security products, MICROSOFT DEFENDER XDR provides a complete picture of an attack, including its scope, impact, and entry point.

- **Simplified Investigation:** The Microsoft Defender portal offers a centralized view of security incidents and related information, streamlining investigation and response efforts.

**Mitigating Cyberattacks with MICROSOFT DEFENDER XDR**

MICROSOFT DEFENDER XDR empowers you to effectively respond to cyberattacks. Here's a breakdown of the mitigation process:

1.  **Identify Affected Systems and Users:** Use MICROSOFT DEFENDER XDR's detection capabilities and threat intelligence to pinpoint compromised systems and user accounts. This often involves searching for Indicators of Compromise (IOCs) like malicious file hashes, suspicious IP addresses, or known bad URLs.

2.  **Determine the Scope of the Infection:** Investigate the extent of the attack. Analyze network traffic associated with affected systems, examine files accessed or modified by malware, and identify any lateral movement within your network.

3.  **Identify the Root Cause:** Uncover how the attack originated. This may involve tracing the initial infection vector (phishing email, vulnerable application, etc.) and identifying exploited vulnerabilities.

4.  **Remediate the Infection:** Take action to contain and eradicate the threat. This can include isolating infected systems, removing malware, restoring data from backups, and patching vulnerabilities.

5.  **Prevent Future Infections:** Strengthen your defenses to prevent similar attacks. Implement security measures like email filtering, web filtering, strong authentication, application control, and regular security awareness training.

**Key MICROSOFT DEFENDER XDR Features for Mitigation**

- **Security Score:** Provides a comprehensive assessment of your security posture, highlighting areas for improvement and allowing you to track your progress.

- **Threat Hunting Tools:** Enable proactive searching for suspicious activities and threats that may evade traditional security solutions.

- **Automated Investigation and Response (AIR):** Automates investigation and response actions for malicious or suspicious activities, speeding up mitigation.

- **Microsoft Security Experts:** Leverage Microsoft's expertise for tailored security guidance and support.

By effectively utilizing MICROSOFT DEFENDER XDR's capabilities and following these mitigation steps, you can significantly strengthen your organization's security posture and protect against evolving cyber threats.

# Use Cases

Here are some specific examples of how MICROSOFT DEFENDER XDR can be used to protect your organization from threats:

- **Prevent malware infections**: Microsoft Defender for Endpoint uses machine learning to identify and block malware before it can infect your devices. It also provides real-time protection against malware and viruses.

- **Protect against phishing attacks**: Microsoft Defender for Office 365 uses AI to identify and block phishing emails. It also provides real-time protection against spam and other email threats.

- **Detect and respond to identity attacks**: Microsoft Defender for Identity uses AI to detect unauthorized access to user accounts and other suspicious activity. It can also generate alerts and automate remediation steps, such as resetting passwords or locking out accounts.

- **Prevent data breaches in cloud applications**: Microsoft Defender for Cloud Apps uses AI to detect suspicious activity in cloud applications and to identify and protect sensitive data. It can also generate alerts and automate remediation steps, such as blocking access to unauthorized users or encrypting sensitive data.

Overall, MICROSOFT DEFENDER XDR is a powerful integrated threat protection platform that can help organizations of all sizes to improve their security posture and protect themselves from sophisticated attacks.

XDR Use Cases:

- **Phishing Attack:** XDR can detect and respond to phishing by correlating email activity (sender reputation, link analysis), endpoint activity (malicious file execution, process behavior), and identity activity (suspicious logins). Automated response actions could include isolating affected endpoints, resetting compromised passwords, and blocking malicious senders.

- **Cloud Application Attack:** XDR monitors cloud application logs, user activity, and API calls to detect anomalies indicative of an attack. It can integrate with Cloud App Security to identify unauthorized access, data exfiltration, or malicious application usage. Responses can include revoking access tokens, blocking malicious IP addresses, and alerting security teams.

- **Supply Chain Attack:** XDR can help detect supply chain attacks by monitoring communication and data flow between organizations. By correlating endpoint activity at your organization with threat intelligence about known supply chain vulnerabilities, XDR can identify potentially compromised systems or software. Response involves isolating affected systems, investigating the source of the compromise, and collaborating with the supply chain partner.

- **Insider Threat:** XDR analyzes user behavior, file access patterns, and communication patterns to identify deviations from normal activity that could indicate an insider threat. It can detect unusual data access, exfiltration attempts, or communication with external parties. Responses can include escalating alerts to HR, restricting access to sensitive data, and conducting further investigation.

XDR Automation & Use Cases:

4.  **XDR Automation:** How can XDR be used to automate security tasks, improving efficiency and response times? Provide specific examples.

# Troubleshoot issues

How do you troubleshoot XDR issues?

To troubleshoot XDR issues, you can follow these steps:

- Gather information about the issues or errors or steps taken to resolve issue.

- Check the XDR logs.

- Search for known issues on the XDR vendor's website or support portal or community forums and other online resources.

- Contact the XDR vendor for assistance. 

<!-- -->

- Check the XDR configuration. Make sure that the XDR solution is configured correctly. You can find information about how to configure the XDR solution in the vendor documentation.

- Restart the XDR services. Restarting the XDR services may resolve some issues.

- Update the XDR software. Make sure that you are using the latest version of the XDR software. The XDR vendor may release updates to fix known issues and improve the performance of the XDR solution.

- Collect XDR diagnostic data. The XDR vendor may ask you to collect XDR diagnostic data when you contact them for assistance. This data can help the vendor to troubleshoot the issue.

XDR agent is not reporting data to the XDR console.

- Troubleshooting steps:

  - Verify that the XDR agent is installed correctly.

  - Verify that the XDR agent is configured correctly.

  - Restart the XDR agent service.

  - Check the XDR agent logs for errors.

XDR console is not responding.

- Troubleshooting steps:

  - Restart the XDR console service.

  - Clear the XDR console cache and cookies.

  - Try accessing the XDR console from a different browser.

  - Contact the XDR vendor for assistance.

XDR alerts are not being generated.

- Troubleshooting steps:

  - Verify that XDR alerts are configured correctly.

  - Check the XDR logs for errors.

  - Contact the XDR vendor for assistance.

If you are experiencing other XDR issues, you can search for known issues on the XDR vendor's website or support portal, or you can contact the XDR vendor for assistance.

# MDI

Microsoft Defender for Identity (MDI) strengthens on-premises Active Directory security by:

- **Detecting malicious activity:** MDI identifies suspicious behaviours like reconnaissance, lateral movement, and privilege escalation.

- **Providing security insights:** It offers visibility into user and entity behaviour, revealing potential vulnerabilities.

- **Recommending improvements:** MDI suggests actions to bolster security and reduce the attack surface.

MDI sensors can be directly installed on **Active Directory Federation Services (ADFS) servers and Domain Controllers** to collect data about Active Directory activity. MDI is specifically designed for protecting on-premises Active Directory environments.

# MDCA

Responding to Credential Theft:

If an employee accidentally runs an executable from an email, leading to credential theft, solutions like **Microsoft Secure Score** can help. Secure Score provides recommendations and helps configure security features to mitigate such threats. (Note: Secure Score itself doesn't *respond* directly; it guides configuration for *prevention* and *detection*.)

**Identifying Unsanctioned Apps:**

**Cloud Discovery** in **Microsoft Defender for Cloud Apps (MDCA)** is used to identify unsanctioned applications (shadow IT) being used within a company. It provides insights into network and cloud app usage.

**Remediating Risk IP Address Violations:**

If an accounting department user violates a risk IP address policy, accessing the MDCA alert page allows for remediation. Appropriate actions include:

1.  **Notification:** Send a notification to the user to inquire about the violation (intentional or accidental).

2.  **Suspension (Conditional):** Suspend the user's account *only if necessary*, pending further investigation or if the violation is confirmed and serious. Avoid immediate suspension without understanding the context.

**Detecting New Cloud App Usage:**

To detect the number of employees using a new cloud app via Cloud Discovery in MDCA, the following prerequisites are needed:

1.  **MDE Integration:** Enable integration between MDCA and Microsoft Defender for Endpoint (MDE).

2.  **Log Upload:** Establish automatic log uploads for Cloud Discovery reports.

**Implementing Information Protection Policy in MDCA:**

To detect employees sharing confidential files with external cloud services using an Information Protection policy in MDCA:

1.  **File Policy:** Select "File policy."

2.  **Access Level Filter:** Modify the access level filter to "Public (internet)," "Public," or "External." (The specific choice depends on the desired scope.)

3.  **Data Classification:** Select the "Data classification service" option in the inspection method field.

4.  **Access Type:** Select the appropriate access type on the policies page.

5.  **Governance Action:** Create a governance action (e.g., alert, block, quarantine).

**Marking Incidents as "Red" in MICROSOFT DEFENDER XDR:**

To mark an incident as "Red" in Microsoft Defender for XDR (MICROSOFT DEFENDER XDR) when an employee sends sensitive information externally:

1.  **Incident Tagging:** Add a tag to the incident (e.g., "Red," "Critical," "High"). This is the preferred method for categorization.

2.  **Incident Naming (Optional):** While you can edit the incident name, tagging is the primary way to categorize incidents for severity.

**Advanced Hunting Query for Failed Sign-ins:**

Code snippet

DeviceLogonEvents

\| where DeviceName in ("device1", "device2")

\| where ActionType == "LogonFailed" // Correct ActionType

\| summarize LogonFailureCount = count() by DeviceName

**Categorizing and Associating Alerts with Incidents:**

To categorize and associate alerts with incidents during an investigation:

1.  **Link Alerts:** Use the option to "Link alert to another incident."

2.  **Incident Status:** Set the incident status to "In progress."

**Resolving Risk User Sign-in After SSPR:**

If a risky user sign-in was blocked due to MFA not being completed (despite correct credentials), and the user has since completed Self-Service Password Reset (SSPR), the appropriate manual risk detection resolution is:

"**Dismiss user's risk**" - The sign-in risk detection was likely accurate initially, but the SSPR and password update have remediated the risk.

**KQL Query for Last 2 Weeks and Top 50 Results:**

Code snippet

\| where TimeGenerated \> ago(14d) // Corrected Timestamp field name

\| top 50 by TimeGenerated desc // Added descending sort for "top"

**Removing Quarantined File in Microsoft Defender XDR:**

To remove a non-malicious file from quarantine in MICROSOFT DEFENDER XDR after automated investigation:

1.  **Action Center:** Navigate to the "Action center."

2.  **History Tab:** Select the "History" tab.

3.  **Select File:** Select the quarantined file.

4.  **Undo:** Choose the option to "Undo" the quarantine action. You can apply this to multiple instances of the file if needed. (The specific wording might vary slightly in the interface).

**Microsoft Defender XDR Solutions Summary, Corrections, and Categorization**

Here's a summarized, corrected, and categorized version of your provided scenarios and questions related to Microsoft Defender XDR solutions:

**I. Automated Investigation & Response (AIR)**

- **Scenario:** Alert triggered, automated investigation initiated, status shows "Terminated by System."

- **Corrected Reasons:**

  - **Pending actions timed out:** Investigations can time out if required manual actions (like approving pending actions) are not taken within a specific timeframe (typically 7 days).

  - **Resource exhaustion:** The investigation might be terminated if it's too complex or resource-intensive, potentially due to a very large number of involved entities (files, processes, users, etc.) or system constraints. It's *not* simply about the number of *analyzers*.

- **Category:** AIR, Investigation Status

**II. Safe Attachments Policy**

- **Scenario:** Creating a Safe Attachments policy for tracking and admin review of malicious emails.

- **Corrected Steps:**

  1.  **Enable redirect:** This is the correct option.

  2.  **Enter admin's email address:** Specify the address for malicious email redirection.

  3.  **Select "Block" or "Replace" (not "Monitor"):** "Monitor" is for observation only. To ensure malicious attachments are handled, use "Block" to prevent delivery or "Replace" to remove the attachment and deliver the email body.

- **Category:** Safe Attachments, Email Security

**III. Data Loss Prevention (DLP) Roles**

- **Corrected Roles:**

  - **Compliance Data Administrator:** Manages DLP policies, settings, device management, and reporting.

  - **Communication Compliance Analyst:** Investigates policy matches and takes remediation actions.

  - **Communication Compliance Viewer:** Has read-only access to communication compliance data.

- **Category:** DLP, Role-Based Access Control (RBAC)

**IV. Insider Risk Management (IRM) Roles**

- **Corrected Role Groups:**

  - **Insider Risk Management (IRM):** Encompasses all permissions.

  - **IRM Admin:** Manages policies, settings, and analytics insights.

  - **IRM Analyst:** Views analytics insights, investigates alerts/cases, and manages notice templates.

  - **IRM Investigator:** Investigates alerts/cases, uses Content Explorer, and manages notice templates.

  - **IRM Auditor:** Views and exports audit logs.

- **Category:** IRM, RBAC

**V. IRM Escalation to Advanced eDiscovery**

- **Corrected Step:** **Create a case in the IRM portal.** This is the necessary first step before escalating to Advanced eDiscovery.

- **Category:** IRM, eDiscovery Integration

**VI. Credential Theft Response**

- **Scenario:** Employee runs executable from email, credentials stolen.

- **Solution:** **Microsoft Defender for Office 365**. This is the correct solution to protect against email-borne threats, including those that lead to credential theft.

- **Category:** Threat Protection, Email Security

**VII. Risk IP Address Violation**

- **Scenario:** User accesses a risky IP address.

- **Corrected Remediation:**

  - **Investigate:** Before taking action, investigate to understand the context. Is it a false positive? Was the access intentional (and perhaps authorized)?

  - **Communicate:** Contact the user to understand the situation.

  - **Take action based on investigation:** Options include:

    - **Block the IP address:** Prevent further access.

    - **Suspend the user account:** If the violation is severe.

    - **Revoke access to specific resources:** If the risk is limited to certain data.

    - **Educate the user:** If the violation was unintentional.

- **Category:** Threat Response, User Behavior

**VIII. Cloud App Discovery**

- **Scenario:** Detecting employees using new cloud apps with Cloud Discovery.

- **Corrected Prerequisites:**

  - **Enable integration of MCAS (Microsoft Cloud App Security, formerly MDCA) with Microsoft Defender for Endpoint (MDE).**

  - **Establish automatic log upload for Cloud Discovery reports.** This involves configuring log collection from firewalls and other network devices.

- **Category:** Cloud App Security, Cloud Discovery

**IX. Information Protection in MCAS**

- **Scenario:** Detecting employees sharing confidential files with external cloud services.

- **Corrected Steps:**

  1.  **Create a File policy.**

  2.  **Set the "Access level" filter to "Public" or "External."**

  3.  **Select a Data Classification method (e.g., "Data Classification Service," "Built-in DLP types").**

  4.  **Define Governance actions (e.g., "Apply sensitivity label," "Block download," "Send alert").**

- **Category:** Cloud App Security, Information Protection

**X. Incident Tagging**

- **Scenario:** Manager wants incidents with sensitive information shared externally to be marked as "Red."

- **Corrected Actions:**

  1.  **Edit the incident:** Open the incident details.

  2.  **Add a tag:** Create a tag named "Red" (or similar) and apply it to the incident. This allows for easy filtering and identification.

- **Category:** Incident Management

**XI. Associating Alerts with Incidents**

- **Corrected Steps:**

  1.  **Open the incident:** Go to the incident details page.

  2.  **Link alerts:** There should be an option to link related alerts to the incident. This helps consolidate information and provides a comprehensive view of the attack. The specific steps might vary slightly depending on the MICROSOFT DEFENDER XDR interface version.

- **Category:** Incident Management

**XII. Advanced Hunting Query (Failed Sign-ins)**

- **Corrected Query:**

Code snippet

DeviceLogonEvents

\| where DeviceName in ("device1", "device2")

\| where ActionType == "LogonFailed" // Or similar, check schema for exact value

\| summarize LogonFailureCount = count() by DeviceName

- **Category:** Advanced Hunting, KQL

**XIII. User Risk Remediation**

- **Scenario:** Risky sign-in blocked due to MFA failure (but valid credentials). User performed SSPR.

- **Corrected Resolution:** **Dismiss user risk.** Since the user performed SSPR and the sign-in attempt was legitimate (though MFA failed), dismissing the user risk is the appropriate action.

- **Category:** Identity Protection, Risk Remediation

**XIV. KQL Query (Last 2 Weeks, Top 50)**

- **Corrected Query:**

Code snippet

YourTable

\| where Timestamp \> ago(14d)

\| top 50 by Timestamp desc // Add "desc" for the latest 50

- **Category:** Advanced Hunting, KQL

**XV. Removing File from Quarantine**

- **Corrected Steps:**

  1.  **Go to the Action center.**

  2.  **Select the History tab.**

  3.  **Locate the quarantined file.**

  4.  **Select the file and choose the "Undo" or "Restore" option.** This will remove the file from quarantine on all affected devices.

- **Category:** AIR, Quarantine Management

**XVI. Alert Configuration for Accounts Department**

- **Scenario:** Accounts department members not receiving vulnerability alerts.

- **Troubleshooting:**

  1.  **Verify alert rules:** Ensure the alert rules are configured correctly and target the relevant devices or user groups.

  2.  **Check notification settings:** Confirm that email notifications are enabled for the alert rules.

  3.  **Check email delivery:** Ask users to check their junk/spam folders and ensure that security-related emails are whitelisted.

  4.  **Test email delivery:** Send a test email to the affected users to verify delivery.

- **Category:** Alerting, Email Notifications

**XVII. Temporary Device Group for Malware Collection**

- **Scenario:** Automating malware collection from machines with sensitive data.

- **Corrected Approach:** Instead of creating a temporary group, use **device tagging**. Tag the machines with sensitive data. Then, you can use the tag in your scripts or automated actions to target only those devices. This is more flexible and doesn't require creating and managing groups.

- **Category:** Device Management, Automation

**XVIII. Suppressing False Positive Alerts (Macros)**

- **Scenario:** False positive alerts on Excel with macros.

- **Corrected Approach:** Create a **suppression rule** in Microsoft Defender for Endpoint. Configure the rule to exclude alerts based on the specific criteria that trigger the false positives (e.g., file path, process name, specific detection ID). This is much better than suppressing all alerts for any device.

- **Category:** Alert Management, Suppression Rules

**XIX. Constraining Suspicious Script Behaviour**

- **Solution:** **Attack Surface Reduction (ASR)** rules. ASR rules can be configured to block or audit suspicious script behavior, helping to contain potential threats.

- **Category:** Attack Surface Reduction, Threat Protection

**XX. Detection Rule Creation Role**

- **Role:** **Security Administrator** (or a role with equivalent permissions).

- **Category:** Role-Based Access Control

**XXI. MDE Threat Analytics Dashboard Overview**

- **Key areas:**

  - **Active alerts:** Threats currently being investigated.

  - **Resolved alerts:** Threats that have been addressed.

  - \*\*No

# XDR

Comparing Defender XDR with Competitors

This requires a detailed feature-by-feature comparison. Key areas to consider:

- Detection Capabilities: EDR, network traffic analysis, user and entity behavior analytics (UEBA).

- Investigation and Response: Automation, threat hunting tools, integration with other security tools.

- Platform Integration: How well it integrates with other security products in your ecosystem.

- Deployment Options: Cloud, on-premises, or hybrid.

- Pricing and Licensing.

- Vendor Support.

Alert Delivery Issues:

- **Problem:** Accounts department members aren't receiving vulnerability alerts.

- **Troubleshooting:**

  1.  **Check Spam/Junk Folders:** Advise users to check their spam or junk email folders and mark security-related emails as "Not Junk" or add the sender to their safe senders list.

  2.  **Verify Alert Rules:** Confirm that the alert rules are correctly configured and that the accounts department's distribution list or individual email addresses are included in the notification settings.

  3.  **Check Notification Channels:** Ensure the chosen notification channel (email, SMS, etc.) is functioning correctly.

  4.  **Test Alert Delivery:** Send a test alert to the affected users to verify delivery.

  5.  **Check Mail Server/Filtering:** Investigate if any mail server rules or filters are blocking these alerts.

Microsoft Security Ecosystem and Integration:

- Demonstrate knowledge of how Microsoft Defender for Endpoint, Defender for Office 365, Defender for Identity, Defender for Cloud Apps, and Azure Sentinel work together. Explain how they share threat intelligence and coordinate responses.

Sentinel Integration with Defender

- Sentinel acts as a SIEM and SOAR, ingesting Defender XDR alerts and logs. This provides a centralized view of security events, enables advanced threat analytics, and facilitates automated incident response.

Benefits

- Comprehensive Threat Protection: Integrates multiple security components to provide holistic protection across endpoints, email, identities, and cloud apps.

- Advanced Threat Detection: Uses AI and machine learning to identify sophisticated attacks.

- Automated Investigation and Response: Streamlines incident response and reduces the time to contain threats.

- Improved Visibility: Provides a unified view of security events and helps security teams understand the attack landscape.

Defender Experts for XDR

- A managed threat hunting and response service that complements Defender XDR. Experts proactively search for and respond to advanced threats, augmenting an organization's security team. Benefits include faster threat detection, improved incident response, and reduced burden on internal security resources.

Potential Limitations

- Complexity: Can be challenging to configure and manage effectively, especially for organizations with limited security expertise.

- Integration Challenges: While integration with the Microsoft ecosystem is strong, integrating with third-party tools can sometimes be complex.

- Cost: Can be expensive, especially for larger organizations.

- Dependence on Microsoft Ecosystem: Best performance is achieved when used within the broader Microsoft security ecosystem.

<!-- -->

- Training and Certification: Invest in training for security personnel to effectively manage Defender XDR.

- Managed Security Services: Consider engaging a managed security service provider (MSSP) to help with deployment, configuration, and ongoing management.

- Prioritization and Focus: Focus on the most critical threats and use cases to maximize the value of Defender XDR.

- Regular Evaluation: Periodically evaluate the effectiveness of Defender XDR and identify areas for improvement.

Let us summarize and refine these questions about Microsoft Defender XDR (Extended Detection and Response):

**Core Functionalities of MICROSOFT DEFENDER XDR:** What are the key capabilities of Microsoft Defender XDR, including its ability to detect, investigate, and respond to threats across multiple domains (endpoints, email, identities, cloud apps)?

**Microsoft Intelligence's Role:** How does Microsoft's threat intelligence feed into Defender XDR, enhancing its ability to identify sophisticated and emerging threats? Specifically, how does this intelligence improve detection accuracy and reduce false positives?

**XDR and Threat Intelligence Sharing:** How can Defender XDR facilitate or improve the sharing of threat intelligence with other security tools and organizations, contributing to a broader defense ecosystem?

**XDR and Zero Trust:** How does Defender XDR support a Zero Trust security model by providing visibility and control across various access points and enforcing the principle of least privilege?

**Defender XDR vs. Traditional EDR:** What are the fundamental differences between Defender XDR and traditional Endpoint Detection and Response (EDR) solutions? Focus on the expanded scope of XDR beyond just endpoints.

**Automated Response & Remediation:** How does Defender XDR automate response and remediation actions to contain threats quickly and minimize their impact? What are the different levels of automation available, and how are they configured?

**Integration with M365 Security:** How does Defender XDR integrate with other Microsoft 365 security products (e.g., Defender for Office 365, Azure AD Identity Protection) to provide a holistic view of the security landscape and correlate events across different domains?<sup>1</sup>

**Machine Learning & Behavioural Analysis:** How does Defender XDR use machine learning and behavioural analysis to detect anomalies, identify malicious activity, and proactively hunt for threats? What types of behavioural analysis are employed?

Proactively Hunting

Proactive threat hunting in Defender XDR involves using advanced hunting queries and other tools to search for suspicious activity that might not have triggered alerts. This includes:

- **Leveraging Kusto Query Language (KQL):** Writing custom queries to search across endpoint, identity, email, and other data sources.

- **Using threat intelligence:** Incorporating known attacker techniques and indicators of compromise (IOCs) into hunting queries.

- **Exploring behavioural anomalies:** Identifying unusual patterns of activity that could indicate a threat.

- **Correlating data across domains:** Connecting events across different security domains (endpoints, identities, email) to uncover complex attacks.

Interview-Style Questions:

- **XDR Incident Resolution Example:** Be prepared to share a *specific* example of how you used XDR to investigate and resolve a security incident. Focus on the steps you took, the data you analyzed, and the outcome. Quantify your results if possible (e.g., "reduced dwell time by X%").

- **Future of XDR:** Discuss your thoughts on the evolution of XDR, including advancements in AI/ML, integration with other security tools, and the growing importance of threat intelligence. For Defender XDR specifically, mention potential improvements like enhanced automation, better cloud integration, or improved user experience.

- **Recent Microsoft Announcements:** Stay up-to-date with recent Microsoft security announcements and updates related to Defender XDR. Refer to the Microsoft Security blog, Ignite announcements, and other official resources.

This set of questions focuses on Extended Detection and Response (XDR) security, particularly within the Microsoft ecosystem. Here's a summarized and slightly reorganized version for clarity:

XDR Fundamentals & Microsoft:

1.  **XDR Onboarding:** What advice would you give to someone new to XDR, especially regarding initial setup, configuration, and getting value quickly?

2.  **Microsoft Defender XDR Data Sources:** What are the various data sources integrated into Microsoft Defender XDR (formerly Microsoft Threat Protection)? This is crucial for understanding its detection capabilities.

3.  **Microsoft Defender XDR Features:** What are the key features and capabilities of Microsoft Defender XDR? This explores what the platform offers.

Security Risks & Ethical Considerations:

**Microsoft Teams Security Risks:** What are the potential security risks organizations face when using Microsoft Teams, and how can XDR help mitigate them?

**XDR Ethical Considerations:** What are the ethical implications of using XDR, particularly concerning data privacy, surveillance, and potential misuse? This is an important, often overlooked, aspect.

Most Challenging XDR Implementation:

This is a subjective question that depends on the specific context. Challenges might include:

- **Integration with Existing Security Infrastructure:** Integrating the XDR platform with diverse existing security tools and data sources can be complex.

- **Data Overload:** XDR platforms generate a large amount of data. Effectively analyzing and prioritizing this data can be challenging.

- **Talent Shortage:** Skilled security analysts are needed to effectively operate and manage XDR platforms.

- **Customization and Tuning:** Tuning the XDR platform to the specific environment and threat landscape can be complex.

- **Incident Response:** Developing and implementing effective incident response plans to leverage the XDR platform's capabilities.

- **Organizational Silos:** Breaking down organizational silos between different security teams is often necessary for effective XDR implementation.

When answering this question in an interview, focus on the *specific* challenges *you* faced and how you overcame them. Quantify your accomplishments whenever possible.

XDR Concepts:

1.  **Favourite XDR Feature:** This is subjective. Good answers might focus on automation, integrated threat intelligence, or cross-domain correlation.

2.  **Role for Detection Rule Creation:** Security Administrator (Correct)

3.  **App Compliance Solution:** Microsoft Defender for Cloud Apps (Correct)

4.  **XDR Learning Resources:** This is open-ended. Good answers would include vendor documentation (Microsoft, CrowdStrike, Palo Alto Networks, etc.), SANS courses, industry blogs, and analyst reports (Gartner, Forrester).

5.  **User Account Risk Monitoring:** Azure AD Identity Protection (Correct)

6.  **Automating Malware Investigation on Sensitive Data Machines:** The suggestion to "Create an admin role that gives users access to tagged machines" is *partially* correct but needs refinement. It's better to say: "Create a *role-based access control (RBAC)* role with *least privilege* that grants necessary permissions (e.g., isolate machine, collect files) *only* to the specific machines tagged as containing sensitive data. This role should be assigned *temporarily* to the analyst or automated system performing the investigation. Avoid granting broad admin rights." Creating a *temporary group* is also a good idea, but the focus should be on the *permissions* granted, not just the group membership.

7.  **SaaS/IaaS Data and User Security Responsibility:** Shared Responsibility Model. The cloud provider secures the *infrastructure* (the "cloud" itself), while the customer is responsible for securing *data within the cloud*, *user access*, and *applications* they deploy.

8.  **Challenges of Cloud Migration:** This is a broad question. Good answers might include: Complexity of migrating legacy systems, security concerns, compliance requirements, lack of skilled cloud personnel, cost management, application dependencies, and organizational change management.

9.  **Explaining Defender XDR to Non-Technical Audience:** Focus on the benefits in simple terms: "Defender XDR is like a security guard for your computer systems. It helps find and stop cyberattacks before they can cause damage. It connects all the different security tools together so they can work as a team to protect you better." Use analogies and avoid jargon.

10. **Responding to a Phishing Attack with Defender XDR:** This requires a multi-step answer:

    - **Investigate:** Analyze the alert details (sender, links, attachments). Use Defender XDR to see who else received the email and if anyone clicked links or opened attachments. Check for indicators of compromise (IOCs) related to the phishing campaign.

    - **Contain:** Isolate affected machines to prevent malware spread. Block malicious senders and URLs. Disable compromised user accounts.

    - **Eradicate:** Remove any malware or malicious files. Reset passwords for compromised accounts.

    - **Recover:** Restore any data that may have been affected.

    - **Learn:** Analyze the attack to understand how it happened and improve defenses. Consider user training on phishing awareness.

11. **Remediating a Compromised User Account:**

    - **Identify:** Use Defender XDR to pinpoint suspicious activity (unusual logins, access to sensitive data, etc.).

    - **Contain:** Immediately disable the compromised account.

    - **Investigate:** Review audit logs to understand the extent of the compromise. Identify any data accessed or exfiltrated.

    - **Eradicate:** Remove any persistent threats or backdoors.

    - **Recover:** Restore any data that may have been affected.

    - **Learn:** Analyze the attack vector and implement measures to prevent future compromises (e.g., MFA, stronger password policies).

VII\. Microsoft Secure Score

25. **Responding to Credential Theft:** Microsoft Secure Score helps improve security posture but doesn't directly respond to active credential theft. Use tools like MDE to isolate the machine, reset the password, and investigate.

VIII\. Microsoft Defender XDR

26. **Automated Investigation Termination:**

    - Pending actions timed out (after one week).

    - Actions are too numerous.

27. **Marking Incidents as "Red":** Add a tag to the incident (e.g., "Red Incident").

28. **Associating Alerts with Incidents:** Select the alert and use the "Link to existing incident" or "Create new incident" option.

29. **Manual Risk Detection Resolution (SSPR):** "Dismiss user risk" after the user completes SSPR.

30. **Removing Quarantined File:**

    1.  Action center -\> History tab -\> select the file -\> Undo. Apply to all instances.

Automated Investigation Termination:

Automated investigations in security platforms can be terminated by the system for two main reasons:

1.  **Timeout:** Pending actions within the investigation timed out, typically due to a lack of response or input within a specified timeframe (e.g., one week).

2.  **Resource Limits:** The investigation requires too many actions or analyzers, exceeding system resources or thresholds. This prevents the investigation from completing.

Microsoft Defender XDR (Extended Detection and Response):

- **Incident Classification:** MICROSOFT DEFENDER XDR allows for incident severity to be set (and tagging for custom organization).

- **Incident Investigation:** MICROSOFT DEFENDER XDR provides tools and features for incident investigation, including alert linking and status management.

- **Quarantine Removal:** MICROSOFT DEFENDER XDR allows for the removal of files from quarantine.

- **Automated Investigation:** MICROSOFT DEFENDER XDR includes automated investigation capabilities.

- **Features:** MICROSOFT DEFENDER XDR integrates threat protection across various domains (endpoints, email, identities, cloud apps).

- **Incident Response:** MICROSOFT DEFENDER XDR enables incident response actions across the integrated domains.

Microsoft Secure Score:

- **Security Posture:** Secure Score helps *assess* and *improve* an organization's security posture, but it's not a direct solution for specific threats like credential theft.

Microsoft 365 Defender portal (Security Center):

- **Email Notifications:** Permissions to manage email notifications are configured in the Security Center.

**General Concepts:**

- **Data Loss Prevention (DLP):** Roles and functionalities related to DLP.

- **Insider Risk Management (IRM):** Roles, workflows, and escalation processes.

- **KQL (Kusto Query Language):** Used for advanced hunting in MDE and other Microsoft security solutions.

- **Role-Based Access Control (RBAC):** Used to grant appropriate permissions for security tasks, including access to tagged devices.

# Entra

Azure AD Identity Protection

20. **Monitoring User Account Risk:** Azure AD Identity Protection.

21. **Minimum License:** Azure AD Premium P2.

22. **Email Notifications for Azure AD Groups in MDE:** Requires permissions to manage security settings in Security Center or Microsoft 365 Defender. It's not a standalone permission.

Azure AD Identity Protection:

- **User Account Risk Monitoring:** Azure AD Identity Protection monitors and notifies about user account risk.

- **Licensing:** Azure AD Premium P2 is required for user risk and sign-in risk features.

# Purview

Insider Risk Management (IRM)

**IRM Roles:**

- **IRM Admin:** Policies/Settings, Analytics insights.

- **IRM Analyst:** Analytics insights, Investigate Alerts/Cases, Notice Templates.

- **IRM Investigator:** Investigate Alerts/Cases, Content Explorer, Notice Templates.

- **IRM Auditor:** View & export audit logs only.

**Escalating to Advanced eDiscovery:** Create a case in the IRM portal *first*.

Data Loss Prevention (DLP) Roles:

- **Compliance Data Administrator:** Manages DLP settings, device management, and reporting.

- **Communication Compliance Analyst:** Investigates policy matches and takes remediation actions on suspicious content.

- **Communication Compliance Viewer:** Has read-only access to communication compliance data.

Insider Risk Management (IRM) Roles:

- **IRM (All):** Full access to all IRM features.

- **IRM Admin:** Manages policies, settings, and analytics insights.

- **IRM Analyst:** Access to analytics insights, investigates alerts/cases, and manages notice templates.

- **IRM Investigator:** Investigates alerts/cases, uses Content Explorer, and manages notice templates.

- **IRM Auditor:** Can view and export audit logs only.

Escalating IRM Alerts to Advanced eDiscovery:

Before escalating an alert from the IRM portal to Advanced eDiscovery, you must **create a case** within the Insider Risk Management portal.

Microsoft Purview (Includes DLP and Insider Risk Management)

- Roles required to configure data loss prevention policy (DLP):

  - Compliance data administrator: it can manage settings related to DLP, device management and report.

  - Communication compliance analyst: Investigate when policy is matched and take remediation actions when suspicious content is detected.

  - Communication compliance viewer:

- Insider Risk management Role Group:

  - Insider risk management (IRM): All

  - IRM Admin: Policies/Settings, Analytics insights

  - IRM Analysts: Analytics insights, Investigate Alerts/Cases, Notice Templates,

  - IRM Investigators: Investigate Alerts/Cases, Content Explorer, Notice Templates

  - IRM Auditors: Only able to View & export audit logs

- Alert is triggered on IRM portal, now we need to escalate it to Advanced eDiscovery, but before escalating what step we need to do? --\> Create Case in Insider Risk Management portal.

- Employee sends email outside organization with sensitive information. Manager wants incident should be identified as Red Incident by Microsoft Defender XDR. What 2 action you will perform?

  - Edit name of incident

  - Add tag to the incident

This breakdown should help you organize and understand the different Microsoft Defender solutions and their functionalities. Remember that some scenarios might involve multiple Defender products working together.

- Alert has triggered and automated investigation has initiated, on analysing the progress its status shows that "Terminated by System" what 2 reasons causes this issue?

  - **Pending actions timed out after one week (When no action taken)**

  - **Actions are too numerous to run all analysers**

- How to create Safe attachments policy that’s fulfils tracking requirement and send malicious email to admin for review?

  - **Click enable redirect**

  - **Enter admins email address**

  - **Select monitor option**

- Roles required to configure data loss prevention policy (DLP):

  - **Compliance data administrator**: it can manage settings related to DLP, device management and report.

  - **Communication compliance analys**t: Investigate when policy is matched and take remediation actions when suspicious content is detected.

  - **Communication compliance viewe**r:

- Insider Risk management Role Group:

  - **Insider risk management (IRM):** All

  - **IRM Admin:** Policies/Settings, Analytics insights

  - **IRM Analysts**: Analytics insights, Investigate Alerts/Cases, Notice Templates,

  - **IRM Investigators**: Investigate Alerts/Cases, Content Explorer, Notice Templates

  - **IRM Auditors**: Only able to View & export audit logs

- Alert is triggered on IRM portal, now we need to escalate it to Advanced eDiscovery, but before escalating what step we need to do? **--\> Create Case in Insider Risk Management portal.**

- One of the employee accidently runs executable from email, which steals employee credentials, what solution can be used to respond to these type of threats? **-\> Microsoft Secure Score - used to configure security features.**

- User in accounting department violates policy related to risk IP address by accessing it, task is assigned to you to resolve issue, you access MDCA portal's alert page. What remediation you will perform?

  - **Send notification to user and ask if violation was intentional**

  - **Suspend user until decision is made concerning case.**

- Employee sends email outside organization with sensitive information. Manager wants incident should be identified as Red Incident by MICROSOFT DEFENDER XDR. What 2 action you will perform?

  - **Edit name of incident**

  - **Add tag to the incident**

- How to write advanced hunting query that counts failed sign-in authentications on 2 devices named device1 and device2?

  - **DeviceLogonEvents**

  - **\| where DeviceName in (device1, device2) and**

  - **ActionType == FailureReason**

  - **\| summarize LogonFailure = count() by DeviceName, LogonType**

- While investigating incident, how to categories and associate alerts with incidents?

  - **Select link alert to another incident**

  - **Set status to inprogress**

- Incident involved risk user sign-in was blocked because of MFA not completed, but credentials was correct. You contacted user and sign-in was not user in question. User completed SSPR and updated the password. Now what manual risk detection resolution we should select?

  - **Select Dismiss users risk - Sign-in risk detection was accurate, after doing SSPR both user and sign in risk remediated.**

- In KQL query results, how to include only last 2 weeks and only 50 results, sorted by TimeRange column?

  - **\| where Timestamp \> ago(14d)**

  - **\| top 50 by Timestamp**

- In MICROSOFT DEFENDER XDR, automated investigation has quarantined a file believed to be malicious on 12 devices. We completed further research and found out that file is not malicious. How to remove this file from quarantine?

  - **Navigate to Action center**

  - **Select History tab and then select file**

  - **Select apply to 11 more instances of this file then click Undo.**

# KQL

31. **Failed Sign-in Authentications (2 Devices):**

Code snippet

DeviceLogonEvents

\| where DeviceName in ("device1", "device2") and ActionType == "LogonFailure"

\| summarize LogonFailureCount = count() by DeviceName

32. **Last 2 Weeks and Top 50 Results:**

Code snippet

SecurityEvent // Replace with your table name

\| where TimeGenerated \> ago(14d)

\| top 50 by TimeGenerated desc

This revised version is more structured and easier to navigate. It also corrects some minor inaccuracies and clarifies some of the explanations. Remember to replace placeholder table names and CVE IDs with actual values when using these queries and API calls.

# QnA 
