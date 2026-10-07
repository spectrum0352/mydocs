# Contents

[Introduction [2](#introduction)](#introduction)

[Benefits [2](#benefits)](#benefits)

[Features [2](#features)](#features)

[Vulnerability management [2](#_Toc189303137)](#_Toc189303137)

[Attack Surface Reduction [3](#_Toc189303138)](#_Toc189303138)

[Microsoft Defender Antivirus [3](#_Toc189303139)](#_Toc189303139)

[MDE [4](#_Toc189303140)](#_Toc189303140)

[MDE [4](#_Toc189303141)](#_Toc189303141)

[MDE [5](#_Toc189303142)](#_Toc189303142)

[MDE [5](#_Toc189303143)](#_Toc189303143)

[Deploy MD-XDR [6](#_Toc189303144)](#_Toc189303144)

[Planning [7](#_Toc189303145)](#_Toc189303145)

[Communication Plan [8](#_Toc189303146)](#_Toc189303146)

[Architecture assessment [8](#_Toc189303147)](#_Toc189303147)

[Identify your architecture [8](#_Toc189303148)](#_Toc189303148)

[Prepare asset inventory [8](#_Toc189303149)](#_Toc189303149)

[Pre-requisites [8](#_Toc189303150)](#_Toc189303150)

[Access requirement [9](#_Toc189303151)](#_Toc189303151)

[System requirements [9](#_Toc189303152)](#_Toc189303152)

[Network requirements [9](#_Toc189303153)](#_Toc189303153)

[Licensing and Pricing [10](#_Toc189303154)](#_Toc189303154)

[Pilot project planning [11](#_Toc189303155)](#_Toc189303155)

[Data Storage and Retention [11](#_Toc189303156)](#_Toc189303156)

[First time configuration [12](#_Toc189303157)](#_Toc189303157)

[Setup alerts and reports [12](#_Toc189303158)](#_Toc189303158)

[Advanced feature configuration [12](#_Toc189303159)](#_Toc189303159)

[Choose method to onboard devices [13](#_Toc189303160)](#_Toc189303160)

[Configure sample file collection for deep analysis [13](#_Toc189303161)](#_Toc189303161)

[Network requirements [14](#_Toc189303162)](#_Toc189303162)

[Data storage requirements [15](#_Toc189303163)](#_Toc189303163)

[OS requirement: [15](#_Toc189303164)](#_Toc189303164)

[Data storage configuration [15](#_Toc189303165)](#_Toc189303165)

[Device management [16](#_Toc189303166)](#_Toc189303166)

[Device Discovery [16](#_Toc189303167)](#_Toc189303167)

[Onboarding [17](#_Toc189303168)](#_Toc189303168)

[Onboarding methods [19](#_Toc189303169)](#_Toc189303169)

[Onboard Windows [21](#_Toc189303170)](#_Toc189303170)

[Onboard Linux [21](#_Toc189303171)](#_Toc189303171)

[Onboard Network appliances [22](#_Toc189303172)](#_Toc189303172)

[Offboarding [22](#_Toc189303173)](#_Toc189303173)

[Threat Prevention [22](#_Toc189303174)](#_Toc189303174)

[Endpoint protection policies [22](#_Toc189303175)](#_Toc189303175)

[Configuration of security policies for onboarded devices [22](#_Toc189303176)](#_Toc189303176)

[Threat Detection [22](#_Toc189303177)](#_Toc189303177)

[Threat investigation [23](#threat-investigation)](#threat-investigation)

[Threat Response [23](#_Toc189303161)](#_Toc189303161)

[Actions and Submissions [24](#_Toc189303180)](#_Toc189303180)

[Testing [24](#_Toc189303181)](#_Toc189303181)

[Maintenance [24](#threat-response)](#threat-response)

[Post-Deployment Activities [24](#_Toc189303183)](#_Toc189303183)

[Troubleshooting MDE [24](#troubleshooting-mde)](#troubleshooting-mde)

[MDE [27](#mde)](#mde)

[Scenarios [28](#scenarios)](#scenarios)

[Use Cases (MDE): [29](#use-cases-mde)](#use-cases-mde)

# Introduction

- **Endpoint behavioural sensors** used to collect and process behavioural signals from OS and send it to MDEs isolated cloud instance.

- Cloud security analytics

- Threat intelligence

- **EDR** provide enhanced attack detections that are near real-time and actionable.

- **Microsoft Defender for Vulnerability Management (MDVM)** provides Real-time insights correlated with endpoint vulnerabilities. MDVM provides device vulnerability context during incident investigations. MDVM provides built-in remediation processes through Microsoft Intune and Microsoft System Center Configuration Manager. MDVM uses modern risk-based approach to discovery, assessment, prioritization, and remediation of misconfig/vulnerabilities.

- **Attack surface reduction (ASR)** is the first line of defense in the stack. Ensures proper config settings, resist attacks and exploitation. Provides web and network protection by regulating IP addresses, URLs and domains.

- Automated investigation and response (AIR

- Microsoft Threat Experts

MDE is a comprehensive endpoint protection platform that provides a unified view of your security posture and helps you to detect, investigate, and respond to threats across your environment. MDE is a powerful endpoint protection platform that can help you to protect your organization from a wide range of threats. Overall, MDE is a comprehensive and affordable endpoint protection platform that can help you to protect your organization from a wide range of threats.

## Benefits 

- **Centralized management:** MDE provides a centralized management console that allows you to manage your security posture across your entire environment.

- **Integration with other Microsoft security solutions:** MDE integrates with other Microsoft security solutions, such as Microsoft Defender XDR and Microsoft Azure Security Center. This integration provides a unified view of your security posture and helps you to respond to threats more effectively.

- **Scalability:** MDE is scalable to meet the needs of organizations of all sizes.

- **Affordability:** MDE is an affordable endpoint protection platform that offers a wide range of features and functionality.

## Features

**Threat and vulnerability management:** MDE helps you to identify and remediate vulnerabilities in your environment. It also provides visibility into your threat landscape and helps you to prioritize your remediation efforts.

**Attack surface reduction:** MDE helps you to reduce your attack surface by hardening your endpoints and reducing the number of potential entry points for attackers.

**Next-generation protection:** MDE uses artificial intelligence and machine learning to detect and block threats, even if they are new or unknown.

**Endpoint detection and response (EDR):** MDE provides EDR capabilities that help you to investigate and respond to threats more effectively.

**Automated investigation and remediation:** MDE can automatically investigate and remediate threats, which can help you to reduce the workload on your security team.

**Microsoft Secure Score for devices:** MDE provides a Microsoft Secure Score for devices, which helps you to assess the security posture of your endpoints and identify areas for improvement.

**Microsoft Threat Experts:** MDE includes access to Microsoft Threat Experts, who can provide you with assistance with investigating and responding to threats.

Attack surface reduction

Next generation protection

Endpoint detection and response

Automated investigation and response

Vulnerability management

<span id="_Toc189303137" class="anchor"></span> 

## Key MDE Concepts

- **Attack Surface Reduction (ASR):** Proactive protection that limits potential attack vectors. ASR rules prevent specific actions (like suspicious script execution) even if the program itself seems legitimate. Think of it as setting up roadblocks to stop malicious activity before it can cause damage.

- **MDE Threat Analytics Dashboard:** Provides a centralized view of your security posture, categorizing threats by status (active, resolved, no alerts). Remember, "no alerts" doesn't equal "no threats" – it just means MDE hasn't detected any active threats *right now*.

- **API for Vulnerability Information:** You can use the MDE API to get details about vulnerabilities and affected devices. The example you provided (GET /api/vulnerabilities/{cveId}/machineReferences) is on the right track. Always check the official Microsoft documentation for the most up-to-date API endpoints.

## Troubleshooting and Incident Response

- **Alert Delivery Issues:** Check spam folders, alert configurations in MDE, and ensure the correct groups are targeted for notifications.

- **Automated Machine Collection:** For investigations, create *temporary* device groups. Don't modify existing custom groups unless absolutely necessary.

- **False Positives (Excel Macros):** Use suppression rules to quiet down false positives, especially if you have a general policy against macros.

- **Suspicious Script Behavior:** ASR rules are your friend here! Restrict script execution and potentially harmful actions.

- **Detection Rule Creation Role:** "Security Administrator" is the role that typically has the permissions to create custom detection rules.

- **Replacing IoC Policies:** "Block" rules take priority. Delete the existing "Block and Remediate" policy *before* creating the new "Allow" policy.

- **Removing a Device from Isolation:** In the MDE portal, go to the device's "History" tab and "Undo" the isolation action.

- **Terminated Automated Investigations:** Investigations can terminate if pending actions time out (after one week) or if there are too many actions for the analyzers to handle.

- **Responding to Credential Theft:** MDE is crucial for detecting and responding to threats like credential theft. It provides endpoint protection, detection, and response capabilities. Consider using features like:

  - **Endpoint Detection and Response (EDR):** Real-time monitoring and response to threats on endpoints.

  - **Automated Investigation and Remediation:** MDE can automatically investigate and contain threats.

- **Categorizing and Associating Alerts:** You can link alerts to incidents and set their status (e.g., "in progress") to keep your investigations organized.

- **Manual Risk Detection Resolution:** If a user's sign-in was blocked due to MFA issues, but the credentials were correct, and you've confirmed it wasn't the user, "Dismiss user risk" is the appropriate resolution after the user completes Self-Service Password Reset (SSPR).

- **Removing Files from Quarantine:** Use the Action center in MDE to locate the quarantined file in the "History" tab and "Undo" the quarantine action. You can apply this action to multiple instances of the file.

 

# Threat investigation

Onboard Devices

Manage Access

Device Groups:

Investigate entities with MDE

<span id="_Toc189303161" class="anchor"></span>Configure sample file collection for deep analysis

The configuration is set through the following registry key entry:

- Path: "HKLM\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection"

- Name: "AllowSampleCollection"

- Value: 0 or 1

Where Name type is a D-WORD. Possible values are:

- 0 - does not allow sample sharing from this device

- 1 - allows sharing of all file types from this device

The default value in case the registry key does not exist is 1.

# Threat Response

Removing a Device from Isolation:

- **Problem:** A device was automatically isolated, investigated, and deemed safe. How to remove it from isolation?

- **Solution:** On the MICROSOFT DEFENDER XDR portal, go to the History tab and select the "Undo" option for the isolation action.

> **Actions and Submissions**
>
> **Actions**: It lists pending and completed remediation actions for your devices, email & collaboration content, and identities in one location. Following actions are tracked:

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

> **Pending:** Displays a list of actions that require attention. You can approve or reject actions one at a time, or select multiple actions if they have the same type of action (such as Quarantine file).
>
>  
>
> **History:**

- Serves as an audit log for actions that were taken and also provides way to undo it.

- Remediation actions that were taken as a result of automated investigations

- Remediation actions that were taken on suspicious or malicious email messages, files, or URLs

- Remediation actions that were approved by your security operations team

- Commands that were run and remediation actions that were applied during Live Response sessions

- Remediation actions that were taken by your antivirus protection

- Required Roles: Security Administrator, Active remediation actions, Search and Purge

<span id="_Toc189303180" class="anchor"></span>Actions and Submissions

- **Actions**: It lists pending and completed remediation actions for your devices, email & collaboration content, and identities in one location. Following actions are tracked:

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

- **Pending:** Displays a list of actions that require attention. You can approve or reject actions one at a time, or select multiple actions if they have the same type of action (such as Quarantine file).

<!-- -->

- **History:**

- Serves as an audit log for actions that were taken and also provides way to undo it.

- Remediation actions that were taken as a result of automated investigations

- Remediation actions that were taken on suspicious or malicious email messages, files, or URLs

- Remediation actions that were approved by your security operations team

- Commands that were run and remediation actions that were applied during Live Response sessions

- Remediation actions that were taken by your antivirus protection

- Required Roles: Security Administrator, Active remediation actions, Search and Purge

Response

Actions on device with MDE

 

# Maintenance

- Regularly review and update the configuration as needed.

- Monitor alerts and reports for any potential security incidents.

 

# Troubleshooting MDE

 

Troubleshoot MDE device onboarding issues

 

Troubleshoot security configuration management onboarding issues

 

Troubleshoot problems with tamper protection

 

Troubleshoot migration issues

 

 

Troubleshoot Sensor issues

 

Troubleshoot MDE on Linux issues

 

Troubleshoot MDE services issues

 

 

 

 

Troubleshoot ASR (Attack Surface Reduction) issues

 

 

 

 

 

 

Deep OS visibility such as process communications etc.

Real time monitoring and detection of attacks

Active ability to enforce policies, prevent, respond, and remediate attacks

 

Agentless scanning

- At-scale and instantaneous visibility on posture and threat detection issues

- No performance impact on workloads

- Security team do not depend on workload owners

 

Transition of MMA to AMA.

Security baseline recommendations will be powered by MDE

File integrity monitoring will be powered by MDE

Endpoint protection recommendations will be powered by MDE

Azure Arc - it is not required but highly recommended for management and other purposes.

 

 

 

 

 

 

 

 

 

 

 

 

How to find in MDE when particular file is first detected in environment?

 

There is one field "<span class="mark">cveFirstSeenTimestamp</span>" only available via API.

 

 

Write a KQL query to identify which machines are isolated through MDE?

 

Isolated device would be found under "<span class="mark">DeviceInfo</span>" table, Mitigation Status operator

OR

Navigate to "Microsoft Defender XDR - Actions & Submissions - Action Center - History" here you can see the isolated devices and able to undo isolation.

 

<https://techcommunity.microsoft.com/t5/microsoft-defender-xdr-blog/the-action-center-in-microsoft-threat-protection-your-one-stop/ba-p/1550178>

 

<https://github.com/cyb3rmik3/KQL-threat-hunting-queries/blob/main/03.SecOps/identify-endpoints-where-mitigationstatus-is-isolated.md>

 

 

Endpoint configuration policies are not under "Microsoft Defender XDR - Endpoints - Configuration management". I have MDE P2 license.

 

 

How would you troubleshoot if EDR agent goes missing from server?

Information Gathering

Check EDR management console to find if server shows offline or missing. This will confirm agent is not just disconnected temporarily.

Identify EDR agent: Check current version of EDR agent and OS version. To check compatibility.

Review logs: Check EDR agent logs on server, if any error messages that might indicate agent stopped running. Also check server system logs for clues and crashes or permissions issues.

Remote checks and actions:

Remote connectivity: Try to connect server using RDP/SSH.

Service status:

 

**Exhaustive Troubleshooting Steps for Missing EDR Agent on a Virtual Machine (VM)**

> **1. Verification and Information Gathering:**

- **EDR Console:**

  - Check the EDR console to confirm the agent is missing from the specific VM.

  - Look for any error messages or alerts associated with the missing agent.

  - Gather details like the last reported time, agent version, and any historical data.

- **VM Information:**

  - Identify the VM name, operating system version, and any recent configuration changes (e.g., updates, security patches).

  - Determine the deployment method used to install the EDR agent on the VM (e.g., manual installation, group policy, configuration management tool).

> **2. Checking Agent Status on the VM:**

- **Process and Service Management:**

  - Log in to the VM and use task manager or service manager tools to identify the EDR agent process or service name.

  - Refer to your specific EDR vendor's documentation.

  - Check if the process is running. If not, attempt to start it manually.

- **Agent Logs:**

  - Locate the EDR agent log files on the VM (again, refer to your vendor's documentation for specific file locations).

  - Review the logs for any errors or messages that might indicate why the agent stopped functioning or went missing.

> **3. Redeployment and Restart:**

- **Redeployment:** If the agent process is not found or fails to start manually, attempt to redeploy the agent to the VM using the original deployment method (e.g., EDR console, group policy, configuration management tool).

- **Service Restart:** If the process exists but isn't running, try restarting the EDR agent service on the VM using the service management tool.

> **4. Virtual Machine Management and Health Checks:**

- **VM Guest Tools:** Ensure the VM guest tools are up-to-date for proper communication between the VM and the underlying hypervisor. Outdated tools can sometimes cause issues with agent functionality.

- **Resource Availability:** Verify that the VM has sufficient resources (CPU, memory, disk space) to run the EDR agent smoothly. Resource limitations can lead to agent crashes or unexpected behaviour.

- **Hypervisor Health:** Check the health of the hypervisor platform hosting the VM (e.g., vCenter for VMware, Hyper-V Manager for Microsoft Hyper-V). Look for any errors or warnings that might impact the VM's functionality.

> **5. Advanced Troubleshooting:**

- **Network Connectivity:**

  - Verify network connectivity between the VM and the EDR management server.

  - Issues with network connectivity can prevent the agent from communicating and reporting its status.

  - Check firewall rules on both the VM and the EDR management server to ensure communication is allowed.

- **Security Software Conflicts:**

  - Investigate if any other security software installed on the VM might be interfering with the EDR agent.

  - Consider temporarily disabling other security software to see if the agent starts functioning properly.

- **EDR Management Tools:**

  - Some EDR vendors offer additional tools for managing and troubleshooting agents.

  - Explore these tools (if available) to identify the missing agent and diagnose potential causes.

  - Tools like runZero (third-party) can be used to scan the network and identify missing agents through API connections.

> **6. Vendor Support:**

- If none of the above steps resolve the issue, contact your EDR vendor's support team. Provide them with the information gathered in the previous steps (EDR console details, VM information, agent logs, troubleshooting attempts) for further assistance.

 

 

 

 

How would you troubleshoot if CrowdStrike Falcon EDR agent goes missing from server?

Here's a summary of troubleshooting steps for a missing CrowdStrike Falcon Agent on a server:

- 1\. Verification: Check the CrowdStrike Falcon console to confirm the agent is missing.

- 2\. Manual Check: Log in to the server and look for the Falcon Sensor process running. You can use system tools like task manager or service manager.

- 3\. Restart Service: If the process exists but isn't running, try restarting the Falcon Sensor service on the server.

- 4\. Redeployment: If restarting fails, use the CrowdStrike Falcon console to redeploy the sensor to the server.

- 5\. Advanced Troubleshooting: Check Falcon logs on the server for error messages that might indicate the cause of the issue. Consider using third-party tools like run Zero to identify missing agents through network scans and API connections.

 

\*\*Additional Tips:\*\*

\- Refer to CrowdStrike documentation for detailed troubleshooting steps specific to your environment.

\- Contact CrowdStrike support for further assistance if the issue persists.

 

 

What information you will provide the Azure Admin team for remediating the azure security recommendation? What actions you take before sending it to Azure Admin team for remediation? What assessment you perform?

Here's a breakdown of what you should do before involving the Azure Admin team for remediating an Azure security recommendation:

**Information Gathering and Assessment:**

1.  **Review the Recommendation:**

    - **Thoroughly understand the security recommendation details in Azure Defender for Cloud.**

    - **Identify the specific security risk or vulnerability it addresses.**

2.  **Impact Assessment:**

    - **Evaluate the potential impact of remediating the recommendation. This might involve understanding how it affects system functionality or user workflows.**

3.  **Review Remediation Steps:**

    - **Carefully examine the recommended remediation steps provided by Azure Defender for Cloud.**

    - **Assess the complexity and potential downtime associated with implementing the fix.**

4.  **Log Collection (Optional):**

    - **In some cases, collecting relevant logs from the affected resources might be helpful for further analysis.**

 

**Actions Before Escalating:**

1.  **Initial Troubleshooting:** Attempt basic troubleshooting steps suggested by Azure Defender for Cloud or your internal knowledge base. This might involve restarting services or reconfiguring specific settings.

2.  **Testing in a Non-Production Environment (Optional):** If applicable, consider testing the remediation steps in a non-production environment to minimize risks in production.

3.  **Documentation:** Document your findings, assessment, and any troubleshooting steps taken. This will be helpful for the Azure Admin team.

>  

**Information for Azure Admin Team:**

- **Specific Security Recommendation:** Clearly identify the recommendation by title or ID.

- **Affected Resources:** List the Azure resources impacted by the recommendation.

- **Security Risk:** Explain the security risk or vulnerability the recommendation addresses.

- **Impact Assessment:** Briefly summarize your assessment of the potential impact of remediation.

- **Attempted Troubleshooting (Optional):** If applicable, outline the troubleshooting steps you took and the results.

- **Documentation:** Share any relevant documentation you created during your assessment.

 

By providing this information, you'll equip the Azure Admin team to effectively understand the issue and determine the best course of action for remediation. Remember, they might have additional security considerations or resource constraints to factor in.

 

 

 

 

 

 

 

## MDE

MDE is a comprehensive endpoint protection platform that provides a unified view of your security posture and helps you to detect, investigate, and respond to threats across your environment.

Here are the key features of MDE:

- **Threat and vulnerability management:** MDE helps you to identify and remediate vulnerabilities in your environment. It also provides visibility into your threat landscape and helps you to prioritize your remediation efforts.

- **Attack surface reduction:** MDE helps you to reduce your attack surface by hardening your endpoints and reducing the number of potential entry points for attackers.

- **Next-generation protection:** MDE uses artificial intelligence and machine learning to detect and block threats, even if they are new or unknown.

- **Endpoint detection and response (EDR):** MDE provides EDR capabilities that help you to investigate and respond to threats more effectively.

- **Automated investigation and remediation:** MDE can automatically investigate and remediate threats, which can help you to reduce the workload on your security team.

- **Microsoft Secure Score for devices:** MDE provides a Microsoft Secure Score for devices, which helps you to assess the security posture of your endpoints and identify areas for improvement.

- **Microsoft Threat Experts:** MDE includes access to Microsoft Threat Experts, who can provide you with assistance with investigating and responding to threats.

MDE is a powerful endpoint protection platform that can help you to protect your organization from a wide range of threats.

Here are some additional benefits of using MDE:

- **Centralized management:** MDE provides a centralized management console that allows you to manage your security posture across your entire environment.

- **Integration with other Microsoft security solutions:** MDE integrates with other Microsoft security solutions, such as Microsoft 365 Defender and Microsoft Azure Security Center. This integration provides a unified view of your security posture and helps you to respond to threats more effectively.

- **Scalability:** MDE is scalable to meet the needs of organizations of all sizes.

- **Affordability:** MDE is an affordable endpoint protection platform that offers a wide range of features and functionality.

Overall, MDE is a comprehensive and affordable endpoint protection platform that can help you to protect your organization from a wide range of threats.

Endpoint Behavioural Sensors

Sensors collect following attack behaviour signals from Operating systems

- **File access**

  - Rapid access to large number of files which indicate malware searching for vulnerabilities

  - Access to system files which indicate malware searching for vulnerabilities

  - 

- **Process creation**

  - Unusual names of newly created processes

  - Spawning many child-processes

  - Accessing sensitive locations

- **Network connections**

  - Attempts to connect known malicious servers.

  - Sudden increase in outbound network traffic can be sign of data exfiltration

- **Registry modifications**

  - Malware often modifies registry settings to gain persistence or temper security settings

# Scenarios

<span class="mark">Scenario: 1 week ago, azure vm was having the MDE agent installed and running. On MDE also it was showing VM is onboarded successfully and sending logs to MDE. Now after 1 week we can see there is not MDE agent present on that azure VM. Now how do you respond to this situation as Security engineer?</span>

**1. Investigate the Cause:**

- **Check Azure VM Logs / Events** that might indicate why the agent is missing. This could include events related to security software removal, system restarts, or unexpected errors.

- **Review MDE Logs:** Analyze the MDE logs for any errors or warnings related to the specific VM. This might provide clues about the agent's disappearance.

- **Check Defender for Cloud Settings:** Ensure the "Enable Defender for Endpoint" integration is still active in the Defender for Cloud settings for the VM's subscription. <span class="mark">A disabled setting could explain the agent's absence.</span>

**2. Verify Onboarding Status:**

- **MDE Portal:** Double-check the MDE portal to confirm the VM's onboarding status. It might show as "Disconnected" or missing entirely if the agent is truly gone.

**3. Remediate the Issue:**

- **Re-onboard the VM:** If investigation reveals the agent was accidentally removed, use the Defender for Cloud settings or MDE portal to re-onboard the VM and reinstall the agent.

- **Investigate Further:** If the cause remains unclear, consider deeper investigation. This might involve using Azure Monitor logs for more detailed insights or contacting Microsoft support for assistance.

**4. Secure the VM:**

- **Mitigate Immediate Risk:** Regardless of the root cause, prioritize securing the VM. Consider manually deploying a fresh MDE agent or another endpoint protection solution until the cause is identified and addressed permanently.

**5. Preventative Measures:**

- **Update Security Policies:** Review and update security policies to prevent unauthorized removal of security software on Azure VMs. This could involve implementing configuration management tools or leveraging Azure Security Center recommendations.

- **Monitor for Changes:** Enable monitoring solutions to track changes made to Azure VMs, including security software installations and removals. This can help detect future incidents and identify potential causes early.

By following these steps, you can effectively respond to the missing MDE agent situation, restore endpoint protection for the VM, and take preventative measures to prevent similar occurrences in the future.

<span class="mark">Find the root cause of the missing MDE agent on your Azure VM:</span>

**1. Leverage Azure VM Logs:**

- **Timeframe Analysis:** Focus on the Azure VM logs from the one-week period between when the agent was confirmed working and when it went missing.

- **Search for Security Events:** Look for events related to security software removal. Common keywords include "uninstall," "defender," "antivirus," or names of specific removal tools.

- **System Restarts:** Identify any system restarts that might have triggered issues with the agent. Check for unexpected reboots or planned maintenance windows.

- **Error Events:** Look for any error events around the timeframe the agent disappeared. These might indicate problems during agent operation or conflicts with other software.

**2. Analyze MDE Logs:**

- **Error Messages:** Pay close attention to error messages within the MDE logs related to the specific VM. These might provide specific details about why the agent communication stopped.

- **Disconnection Events:** Look for any events indicating the VM disconnected from MDE. This could be due to network connectivity issues or agent malfunction.

**3. Additional Resources:**

- **Azure Monitor Logs:** If the information from Azure VM logs and MDE logs proves insufficient, consider using Azure Monitor logs. These logs offer a broader view of VM activity and might provide additional context to the issue.

**4. Consider Third-Party Tools:**

- **Configuration Management Tools:** If you are using configuration management tools on the VM, check their logs for any recent changes related to security software or agent management.

**Correlating the Evidence:**

By combining the findings from these sources, you can build a timeline of events and identify potential causes. For example, you might find a security event indicating antivirus removal followed by a system restart, suggesting a manual uninstall.

**Further Investigation:**

- **Unclear Cause:** If the cause remains unclear after reviewing logs and configuration management tools, consider:

  - Checking VM access logs to see if there was unauthorized access around the time the agent disappeared.

  - Consulting Microsoft support for further assistance. They might have access to additional logs or insights that can help pinpoint the issue.

By following these steps, you should be able to identify the root cause of the missing MDE agent and take appropriate action to prevent similar occurrences in the future.

## Use Cases (MDE):

- **Excel Macro False Positives:** To suppress false positive alerts for Excel macros in MDE, create a suppression rule that targets the specific alert ID or criteria associated with the legitimate macro activity. Ensure the rule is scoped appropriately to avoid suppressing genuine malicious macro activity. Applying the rule to "any device" might be overly broad; consider refining the scope if possible.

- **IoC Policy Conflict:** To change an IoC policy from "Block and Remediate" to "Allow" for the same MD5 hash, you must *delete* the existing "Block and Remediate" policy. Policies with a "Block" action take precedence. Simply creating a new "Allow" policy won't override the existing one.

- **Azure AD Identity Protection Licensing:** Azure AD Premium P2 is the minimum license required to activate User Risk and Sign-in Risk features in Azure AD Identity Protection.

- **MDE Role Configuration for Email Notifications:** The permission to manage email notifications within the Azure AD portal, specifically for security-related alerts, is typically tied to roles with permissions to manage Security Center (Microsoft 365 Defender portal) settings. The *Security Administrator* or *Global Administrator* roles are likely to have the necessary permissions. "Manage security settings in Security Center" is the correct general area, but the exact role might have a slightly different name depending on the specific portal version.
