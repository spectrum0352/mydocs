

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

**Configure MDC alerts:**
- Setup email notifications
- Create and manage alert suppression rules



## MDC Alerts Investigation

- Investigate Microsoft Defender for Cloud alerts and incidents
- describe alert types for Azure workloads
- manage security alerts
- manage security incidents
- analyses Microsoft Defender for Cloud threat intelligence
- respond to Microsoft Defender Cloud for Key Vault alerts
- manage user data discovered during an investigation

**What could be the criteria to suppress security alerts in Microsoft defender for cloud?**

Suppressing security alerts in Microsoft Defender for Cloud should be done with caution, as it can potentially hide legitimate security threats. Here is a breakdown of criteria you can consider when deciding
whether to suppress an alert:

- **False positives:** If you have identified an alert that consistently triggers due to harmless activity, suppression can be appropriate. This could be a specific application or process known to be safe but flagged by Defender for Cloud.
- **Low severity alerts:** For alerts with a low severity level, indicating a low potential risk, suppression might be considered. However, carefully evaluate the context before suppressing.
- **Understood activity:** If you understand the activity triggering the alert and know it is legitimate (e.g., planned maintenance), temporary suppression might be an option.

**Important considerations before suppressing:**

- Impact on security posture: Suppressing alerts can reduce your visibility into potential threats. Ensure you understand the implications before doing so.
- Exhaustion of other options: Have you tried mitigating the alert through other means, such as configuring Defender for Cloud to exclude specific resources or applications?
- Temporary vs permanent suppression: Unless the alert is definitively a false positive, consider temporary suppression for investigation purposes.


MDC Alerts

- **MDC security alert**

  - **severity levels:** High, Medium, Low, Informational (Context of
    activity)

  - **MDC Security alerts** are triggered by advanced detections and are
    available only with MDC.

  - Alerts are the notifications that MDC generates when it detects
    threats on resources.

  - A security incident is a collection of related alerts instead of
    listing each alert individually.

  - Using incidents, MDC provides you with a single view of an attack
    campaign and all the related alerts.

<!-- -->

- MDC uses many detection capabilities to alert customers about
  potential attacks targeting their environments.

- MDC uses following security analytics

  - **Integrated threat intelligence**: looks for known bad actors by
    using global threat intelligence from Microsoft products and
    services, the Microsoft Digital Crimes Unit (DCU), the Microsoft
    Security Response Center (MSRC), and external feeds.

  - **Behavioral analytics**: applies known patterns to discover
    malicious behavior.

  - **Anomaly detection:** uses statistical profiling to build an
    historical baseline. It alerts on deviations from established
    baselines that conform to a potential attack vector.

- Using these analytics, MDC can help to disrupt the cyber kill chain by
  adding **detections** in different phase of the cyber kill chain as
  shown in the diagram below:

**MDC Configuration**

**MDC Integration with Splunk**

**Remediations of MDC recommendations**

https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Remediation
scripts

**MDC integration with ServiceNow through Workflow Automation (Logic
apps)**

- <https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/azure-security-center-automating-change-requests-in-servicenow/ba-p/1285670>

- [https://github.com/Azure/Microsoft-Defender-for-Cloud/blob/main/Workflow
  automation/Create-SNOWCRfromASCRec/azuredeploy.json](https://github.com/Azure/Microsoft-Defender-for-Cloud/blob/main/Workflow%20automation/Create-SNOWCRfromASCRec/azuredeploy.json)

IR MDC alerts recommendations?

- Every security program includes multiple workflows for incident
  response.

- These processes might include notifying relevant stakeholders,
  launching a change management process, and applying specific
  remediation steps.

- Security experts recommend that you automate as many steps of those
  procedures as you can.

- This feature can trigger Logic Apps on security alerts and
  recommendations

- configure automated responses in Microsoft Defender for Cloud

- design and configure workflow automation in Microsoft Defender for
  Cloud

- remediate incidents by using Microsoft Defender for Cloud
  recommendations

- create an automatic response using an Azure Resource Manager template

**Create a logic app and define when it should automatically run**

- Microsoft Defender for Cloud 🡪 Management 🡪 Workflow automation 🡪 Add
  Workflow automation

- General: Provide Name and description for workflow, Select
  subscriptions, resource groups

- Select Trigger conditions:

- Defender for cloud data type: Security Alert, MDC Recommendations,
  Regulatory compliance standards

- Alert/Recommendation Name contains, Compliance standard, Severity or
  State

- Actions: Select subscription and Logic App

**Suppress security alerts:**

- Your suppression rules define the criteria for which alerts should be
  automatically dismissed.

- Suppression rules can only dismiss alerts that have already been
  triggered on the selected subscriptions.

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

- **Suppression Rules:** Create and manage rules to automatically
  dismiss alerts based on defined criteria (e.g., frequency, false
  positives). Suppression rules apply *after* an alert has been
  triggered.

- **Automation:**

  - Automate incident response workflows by triggering Logic Apps on
    security alerts and recommendations.

  - Configure automated responses within MDC, designing and configuring
    workflow automation.

  - Remediate incidents using MDC recommendations.

  - Create automated responses using Azure Resource Manager templates.

  - **Logic App Creation:** Navigate to MDC -\> Management -\> Workflow
    automation -\> Add Workflow automation. Define the workflow with a
    name, description, target subscriptions/resource groups, trigger
    conditions (Defender for Cloud data type: Security Alert, MDC
    Recommendations, Regulatory compliance standards; specific
    alert/recommendation name, compliance standard, severity, or state),
    and actions (select subscription and the target Logic App).

**II. MDC Alert Investigation and Management:**

- Investigate MDC alerts and security incidents.

- Understand Azure workload alert types.

- Manage security alerts and incidents within MDC.

- Analyze MDC threat intelligence.

- Manage user data discovered during investigations.

**III. MDC Alert Suppression:**

- Suppress alerts that are too frequent or identified as false
  positives.

- Create suppression rules in MDC -\> Alerts -\> Suppression rules -\>
  Create suppression rule.

- Define suppression conditions based on alert type (e.g., "User
  accessed high volume of key vaults"), entities (user account, Azure
  resource, IP, name/AAD ID/UPN suffix), and matching criteria
  (contains, in).

**IV. Threat Intelligence Reports:**

- MDC correlates security alerts to provide a comprehensive view of
  attack campaigns, including attacker information (if available),
  objectives, tactics, tools, procedures, indicators of compromise
  (IoCs), victimology, and mitigation information.

- MDC offers three types of threat reports: Activity Group Report,
  Campaign Report, and Threat Summary Report.

**V. Responding to Specific MDC Alerts:**

- **Key Vault Alerts:**

  - Alerts include Object ID, User Principal Name, and IP Address.

  - **Investigation:** Determine if the traffic source is internal or
    external.

  - **Mitigation:**

    - Contact the user or application owner if the behavior is expected.

    - If the source is unknown, enable the Key Vault firewall and
      configure trusted resources/VNETs.

    - If unauthorized, adjust Key Vault access policies, removing or
      restricting permissions.

    - If the source is an Azure AD role, contact an administrator to
      review permissions.

  - **Impact Assessment:** Review accessed secrets and timestamps in the
    alert details. If diagnostic logs are enabled, review previous
    operations.

  - **Action:** Rotate accessed secrets, keys, and certificates. Disable
    or delete affected secrets. Contact application owners to audit
    their environments for compromised credential usage.

- **DNS Alerts:**

  - **Investigation:** Contact the resource owner to determine if the
    behavior is expected.

  - **Mitigation:**

    - Isolate the resource from the network.

    - Perform a full antimalware scan.

    - Review installed and running software.

    - Revert to a healthy state (reimage if necessary).

    - Address MDC recommendations.

- **Resource Manager Alerts:**

  - **Investigation:** Contact the resource owner to determine if the
    behavior is expected.

  - **Mitigation:**

    - **Compromised User Accounts:** Delete unfamiliar accounts, change
      credentials for familiar ones, and review Azure Activity Logs.

    - **Compromised Subscriptions:** Remove unfamiliar Runbooks, review
      IAM permissions, delete unfamiliar resources, review security
      alerts, and review Azure Activity Logs.

    - **Compromised VMs:** Change user passwords, perform a full
      antimalware scan, and reimage from a trusted source.

This revised summary provides a more structured and accurate
representation of the original document, clarifying key concepts and
correcting some minor inaccuracies. It emphasizes the importance of
automation, suppression rules, and specific response procedures for
different alert types.