
# Email notifications

- incident/threat analytics
- Preview features


## Plan to Deploy

### Coverage

#### Broad Environment Coverage
Protects diverse environments, including:
- Cloud (Microsoft Azure, AWS, GCP)
- On-premises (Windows, Linux servers, network devices)
- Hybrid (combining cloud and on-premises resources)

#### Comprehensive Asset Monitoring
Monitors a wide range of enterprise assets across different technology generations:
- Network
- Infrastructure and applications
- Platform as a Service (PaaS)
- Operational Technology/Internet of Things (OT/IoT)
- Identity and Access Management (IAM)
- Endpoints
- Software as a Service (SaaS) applications
- Information and data

### Configuration

#### Email Notifications
Configure email notifications for:
- Incident/threat analytics
- Preview features

#### MDC Recommendations
Microsoft Defender for Cloud provides remediation scripts available at:
https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Remediation%20scripts


# Configure XDR policies and alerts

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

The steps to configure XDR policies and alerts may vary depending on the specific XDR solution you are using. However, the general process is as follows:

1. Identify the types of alerts that you want to receive. This may
    include alerts for specific threats, such as malware infections and
    ransomware attacks, or alerts for general security events, such as
    suspicious login attempts and network traffic anomalies.

2. Configure the severity of each alert. The severity of an alert
    indicates the importance of the alert and the recommended response
    action. For example, you may want to configure alerts for
    high-severity threats to be automatically escalated to a security
    team member for immediate investigation.

3. Configure the notification channels for each alert. This may include
    sending notifications via email, SMS, or Slack. You can also
    configure notifications to be sent to specific individuals or groups
    of people.

4. Create alert policies. Alert policies allow you to group alerts
    together and to configure common settings for the alerts in the
    group. For example, you may want to create an alert policy for all
    high-severity alerts and configure the policy to automatically send
    notifications to a security team member.

5. Apply alert policies to your XDR environment. Once you have created
    alert policies, you need to apply them to your XDR environment. This
    will ensure that the alerts are generated and sent according to the
    policies that you have configured.

Here are some additional tips for configuring XDR policies and alerts:

- Use a risk-based approach. When configuring XDR policies and
  alerts, it is important to use a risk-based approach. This means that
  you should prioritize the alerts that are most likely to pose a risk
  to your organization.

- Use a layered approach. You should use a layered approach to
  alerting. This means that you should configure alerts to be generated
  at different levels of severity, and you should configure different
  notification channels for each level of severity. This will help you
  to ensure that you are alerted to the most important threats in a
  timely manner.

- Test your alerts. Once you have configured XDR policies and
  alerts, you should test them to make sure that they are working
  properly. You can do this by generating test events in your XDR
  environment and verifying that the alerts are generated and sent
  according to the policies that you have configured.

- Monitor your alerts. Once you have configured XDR policies and
  alerts, you should monitor the alerts to identify any trends or
  patterns. This can help you to identify new threats and to improve
  your security posture.

By following these steps and tips, you can configure XDR policies and
alerts to improve your security posture and to protect your organization
from threats.

## Configure Attack Surface Reduction Rules

- Block abuse of exploited vulnerable signed drivers
- Block Adobe Reader from creating child processes
- Block all Office applications from creating child processes
- Block credential stealing from the Windows local security authority subsystem (lsass.exe)
- Block executable content from email client and webmail
- Block executable files from running unless they meet a prevalence, age, or trusted list criterion
- Block execution of potentially obfuscated scripts
- Block JavaScript or VBScript from launching downloaded executable content
- Block Office applications from creating executable content
- Block Office applications from injecting code into other processes
- Block Office communication application from creating child processes
- Block persistence through WMI event subscription
- Block process creations originating from PSExec and WMI commands
- Block rebooting machine in Safe Mode (preview)
- Block untrusted and unsigned processes that run from USB
- Block use of copied or impersonated system tools (preview)
- Block Webshell creation for Servers
- Block Win32 API calls from Office macros
- Use advanced protection against ransomware

## Visualization in XDR (Real life)

- **Geolocation map of security events:** This visualization can be used to show the geographic location of security events, which can be helpful for identifying patterns and trends. For example, if you see a cluster of security events coming from a particular country, this may indicate a targeted attack.
- **Top 10 users generating security events:** This visualization can be used to identify the users who are generating the most security events. This information can be used to investigate potential security incidents or to target security awareness training to the users who need it most.
- **Top 10 source IP addresses for security events**: This visualization can be used to identify the source IP addresses that are generating the most security events. This information can be used to block malicious IP addresses or to investigate potential security incidents.
- **Heatmap of login activity by time of day:** This visualization can be used to identify unusual patterns in login activity. For example, if you see a spike in login activity at an unusual time of day, this may indicate a brute force attack.
- **Trend line of security events by type**: This visualization can be used to identify trends in the types of security events that are occurring. For example, if you see a sharp increase in the number of phishing attacks, this may indicate a new phishing campaign.
- **Network diagram showing the flow of traffic associated with a security event**: This visualization can be used to investigate security incidents by showing how the traffic associated with the incident flowed through your network. This information can be used to identify the source of the attack and to implement mitigation measures.
- **Timeline of security events associated with an incident:** This visualization can be used to investigate security incidents by showing the sequence of events that led to the incident. This information can be used to identify the root cause of the incident and to implement preventive measures.

## Dashboards

The type of dashboards to be created in XDR will depend on your specific needs and requirements.

### Executive Dashboard

An **Executive Dashboard** provides a high-level overview of the organization's security posture for executives and other non-technical stakeholders. It should include metrics such as:

- Number of security events
- Number of open security incidents
- Top threats detected

This dashboard enables executives to make informed decisions regarding security investments and track the overall security posture of the organization.

### Compliance Dashboard

A **Compliance Dashboard** tracks compliance with security policies and regulatory requirements. It should include metrics such as:

- Number of policy violations
- Number of open security findings
- Number of outstanding compliance tasks

This dashboard should be used by security managers and compliance officers to ensure that the organization remains compliant with all relevant security policies and regulations.

### Security Overview Dashboard

A **Security Overview Dashboard** provides a high-level summary of the organization's security posture. It is used by security analysts and managers to quickly assess the security environment and identify areas of concern.

Typical metrics include:

- Number of security events by type
- Number of security events by severity level
- Top source IP addresses for security events
- Top users generating security events
- Top applications being targeted by attacks
- Top threats detected

### Incident Response Dashboard

An **Incident Response Dashboard** provides a centralized view of all open security incidents. It should include:

- Incident status
- Incident owner
- Estimated time to resolution
- Impacted assets
- Root cause of the incident
- Actions taken to mitigate the incident

This dashboard should be used by security analysts and managers to monitor incident response activities and ensure incidents are resolved quickly and effectively.

### Threat Hunting Dashboard

A **Threat Hunting Dashboard** provides the tools and data required by analysts to proactively identify threats that may not be detected by traditional security solutions.

It should include:

- Visualizations of network traffic
- User activity monitoring
- Security event analysis
- Information on known threats
- Vulnerability intelligence

This dashboard should be used by security analysts to identify suspicious activities and emerging threats.

### Patching Compliance Dashboard

Key metrics include:

- Overall patching compliance
- Windows patching compliance
- Linux patching compliance

### Vulnerability Tracking Dashboard

Key metrics include:

- Total number of vulnerabilities
- Number of vulnerabilities by severity
- Number of vulnerabilities with known malware kits and exploits
- Number of vulnerabilities by environment
- Number of vulnerabilities by product type
- Top zero-day vulnerabilities

### Cloud Security Dashboard

Key metrics include:

- Secure Score over time
- Security control implementation by domain
- Cloud security recommendations by severity

### Firewall Monitoring Dashboard

Key metrics include:

- Total allowed and denied traffic
- Allowed and denied traffic by region
- Resources receiving the highest volume of traffic
- Source IP addresses generating the highest inbound traffic

### Dashboard Design Considerations

When creating dashboards, consider the following factors:

**Audience**:

- Who will be using the dashboard?
- What is their level of technical expertise?

**Purpose**:

- What is the purpose of the dashboard?
- What information should it convey?

**Data**:

- What data sources will be used?
- How will the data be prepared and maintained?

**Design**:

- How will the dashboard be designed to be effective and easy to understand?

**Best Practices**:

- Use a variety of visualization types to represent different types of information.
- Use color coding to highlight important information and trends.
- Implement drill-down capabilities to allow users to explore data in greater detail.
- Ensure the dashboard is easy to navigate and understand.
- Test the dashboard with end users and incorporate their feedback.

Planning

Review architecture requirements
•	Device onboarding through Microsoft endpoint manager (Intune), SCCM, Group policy, and Script
•	On-boarded devices provide and respond to MDE signal data.
•	Managed devices are joined and/or enrolled in Azure Active Directory.
•	Domain-joined Windows devices are synchronized to Azure Active Directory using Azure Active Directory Connect.
•	MDE alerts, investigations, and responses are managed in Microsoft 365 Defender.

Enable in PoC environment

•	Define security requirements and objectives: Collaborate with stakeholders to identify and prioritize security requirements for endpoint protection. Establish clear objectives for the implementation of MDE.
•	Assess current endpoint security posture: Conduct a thorough assessment of the existing endpoint security environment, including hardware, software, and network configurations. Identify any vulnerabilities or gaps in the current protection measures.
•	Design MDE deployment strategy: Develop a comprehensive plan for deploying MDE across the organization. Consider factors such as device compatibility, network topology, and user impact.
•	Configure MDE settings: Configure MDE settings to align with the organization's security requirements and risk tolerance. Adjust detection thresholds, enable relevant features, and define remediation actions.
•	Integrate MDE with other security tools: Integrate MDE with existing security tools, such as SIEM and SOAR solutions, to streamline threat detection and response workflows. Establish data sharing mechanisms and automated incident response procedures.
•	Monitor and analyse MDE data: Continuously monitor MDE alerts and reports to identify potential threats and security incidents. Analyze data to gain insights into attack patterns and trends.
•	Train users: Provide training to end users on MDE and its capabilities. 
•	Onboarded On-prem and Azure VMs on MDE.
•	Performed testing of insider risk policies and communicate findings.
•	Supported team for implementation of MDE.
•	Device Discovery Configuration settings
•	Setting up MDE Tenant environment
•	Provided training to users to educate on MDE capabilities.
•	Develop a communication plan to inform users about the MDE deployment and potential impacts.

Pilot project planning 
•	Consider a pilot deployment on a smaller group of devices to test functionality and configuration before full rollout. 
•	Define the pilot scope (e.g., specific departments or locations).
•	 Start with a pilot deployment to a limited number of devices to validate the design and settings.
•	Gradually increase the scope of the deployment to all devices.

Deploy using Ring based approach
•	Evaluate (Ring-1): Identify 50 devices to onboard to the service for testing.
•	Pilot (Ring-2): 
o	Identify and onboard the next 50-100 endpoints in a production environment. 
o	MDE supports various endpoints that you can onboard to the service.
•	Full deployment (Ring-3): Roll out service to the rest of environment in larger increments.

Architecture assessment
Identify types of environments you have: on-premises, Azure, AWS, GCP, Hybrid, Multi-cloud
o	Identify the different environments (on-premises, cloud platforms) 
o	Identify number of endpoints in each environment
•	Identify Your Architecture and Choose Your Deployment Method: Identify your architecture and the deployment method that best suits your organization2.
•	Design the deployment structure considering the location of endpoints (on-premises, Azure, AWS, GCP).

<img width="484" height="99" alt="image" src="https://github.com/user-attachments/assets/c6035c3b-225c-4408-9f2c-3593f3fee175" />

•	Identify the types and numbers of endpoints (servers, clients).
o	Servers: 8000
o	Clients: 6000
•	Identify the operating systems used (Windows, Linux).
o	Servers: Windows 2012 and later servers
o	Clients: Windows 10/11
•	Identify the locations of these endpoints (on-premises, Azure, AWS, GCP).
o	On-premises: 1500 servers, 6000 clients
o	Azure: 5500
o	AWS: 500
o	GCP: 500



Identify your architecture 
Identify your architecture best represents your enterprise
•	Cloud-native - recommended to use Microsoft Intune
•	Co-management (Hybrid on-prem + cloud) - recommended to use Microsoft Intune and Microsoft Configuration manager
•	On-premises - recommended to use Microsoft Configuration manager and ADDS Group policy
•	Evaluation and local onboarding - recommended to use Local scripts for SOC pilot project.
 
 
Prepare asset inventory
•	Create Inventory of all your endpoints: desktops, servers, mobile devices
•	Identify Operating system types: Windows, Linux, MacOS, Android, etc.


Deploying Microsoft Defender for Endpoint (MDE)
This document outlines the steps for deploying and initially configuring Microsoft Defender for Endpoint (MDE).

Deployment:
1.	Environment Preparation: 
o	Verify devices and networks meet MDE system requirements.
o	Choose a deployment method: 
	Microsoft Endpoint Configuration Manager (MECM/ConfigMgr)
	Microsoft Intune
	Standalone Installer
2.	Deployment Package Creation (MECM/Intune): Create the MDE agent deployment package.
3.	Agent Download (Standalone): Download the MDE agent from the Microsoft Download Center.
4.	Agent Installation: Install the MDE agent on each target device.

Onboarding Devices:
1.	MDE Portal Access: Access the Microsoft 365 Defender portal (formerly MD-XDR).
2.	Onboarding Section: Navigate to "Endpoints" > "Onboarding."
3.	OS Selection: Choose the target device operating system.
4.	Deployment Method Selection: Select the chosen deployment method.
5.	Onboarding Instructions: Follow the provided instructions to deploy the agent.

Configuration:
1.	MDE Portal Access: Access the Microsoft 365 Defender portal.
2.	Feature Configuration: Configure desired MDE features and settings.
3.	Policy Assignment: Create and assign policies to devices or device groups.

Usage:
After deployment and configuration, MDE is ready to protect your organization. Microsoft recommends starting with a small test group before wider deployment. Using MECM or Intune simplifies deployment management. For standalone installations, ensure appropriate installation permissions. Monitor the deployment process to ensure all devices are successfully onboarded.

Initial Configuration Best Practices:
These steps are crucial for maximizing MDE effectiveness:
1.	Enable Recommended ASR Rules: Enable all recommended Attack Surface Reduction (ASR) rules to minimize attack vectors. Review and customize as needed.
2.	Configure Alerts and Reports: Configure alerts for suspicious activity and reports for security posture monitoring and trend identification.
3.	Assign Policies: Assign MDE policies to devices and groups for comprehensive protection.
4.	Configure Data Connectors (Optional): Integrate data from other security tools (SIEM, cloud security platforms) to enhance detection and response.
5.	Enable Threat Hunting: Enable and utilize threat hunting tools to proactively identify and investigate potential threats.
6.	Keep MDE Updated: Regularly update MDE to benefit from new features, security fixes, and performance improvements.
By following these deployment and configuration steps, you can effectively leverage MDE to protect your organization from cyberattacks.


