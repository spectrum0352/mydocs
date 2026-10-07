
## Threat Investigation

Identify tools for investigation
Identify what to investigate

- Every security program includes multiple workflows for incident response.
- These processes might include notifying relevant stakeholders, launching a change management process, and applying specific remediation steps.
- Security experts recommend that you automate as many steps of those procedures as you can.
- This feature can trigger Logic Apps on security alerts and recommendations
- Configure automated responses in Microsoft Defender for Cloud
- Design and configure workflow automation in Microsoft Defender for Cloud
- remediate incidents by using Microsoft Defender for Cloud recommendations
- create an automatic response using an Azure Resource Manager template
- Automate response using logic app
- Suppress security alerts:
- Evidence collection and handling (e.g., chain of custody, interviewing)
- Reporting and documentation
- Investigative techniques
- Digital forensics tools, tactics, and procedures

**Understand the requirements for different types of investigations:**

- Administrative
- Criminal
- Civil
- Regulatory
- Industry standards

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

**Incident management steps are**

- Investigate
- investigate multi-workspace incidents
- triage
- respond
- identify advanced threats with User and Entity Behaviour Analytics (UEBA)

## Investigation through XDR

How does XDR help security teams to investigate and respond to threats?

**What is XDR and How Does it Help?**

XDR is a security solution that enhances threat investigation and
response by collecting and correlating data from multiple sources like
endpoints, networks, and cloud environments. This gives security teams a
holistic view of threats and enables them to:

**Investigate effectively:**

- Identify the root cause of threats by connecting the dots between different security layers.
- Uncover suspicious activity that traditional tools might miss using analytics and machine learning.
- Automate evidence collection and analysis, speeding up investigations.

**Respond efficiently:**

- Automate responses like quarantining infected devices, blocking malicious traffic, and restoring data.
- Integrate with existing security tools (firewalls, intrusion detection systems) for a coordinated defense.

Here is a step-by-step guide for using XDR to investigate a security incident:

1. **Define the scope:** Identify affected systems, users, and data. Defenders correlated data provides a comprehensive overview.
2. **Pinpoint the root cause:** Leverage defenders analytics and machine learning to detect suspicious activities.
3. **Contain and remediate:** Isolate infected systems, block malicious traffic, and take other necessary actions, potentially automating these with XDR.
4. **Hunt for similar incidents:** Use XDR to proactively search for related threats across your environment.
5. **Document everything:** Record the incident details for future learning and security posture improvement.

**XDR in Action: Example Scenarios**

- **Phishing attack:** XDR can correlate email data, endpoint activity,
  and network traffic to identify the attack's origin, affected users,
  and suspicious behaviours.

- **Ransomware attack:** XDR can automatically isolate infected systems,
  block the ransomware's command-and-control communication, and initiate
  data restoration.

- **Advanced Persistent Threats (APTs):** XDR can detect subtle
  anomalies in network traffic or file activity that may indicate an
  APT, providing crucial information for investigation.

**Tips for Effective XDR Usage**

- **Phased approach:** Break down investigations into manageable stages.

- **Prioritize critical systems:** Start with your most valuable assets.

- **Automate tasks:** Use XDR to streamline data collection and response
  actions.

- **Collaborate:** Share XDR insights with other security teams for a
  coordinated response.

By using XDR effectively, security teams can significantly improve their
ability to detect, investigate, and respond to threats, ultimately
strengthening their organization's security posture.



## Investigation through MDE

Actions and Submissions

**Actions**

- It lists pending and completed remediation actions for your devices,
  email & collaboration content, and identities in one location.
  Following actions are tracked:

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

  - You can approve or reject actions one at a time, or select multiple
    actions if they have the same type of action (such as Quarantine
    file).

- **History:**

  - Serves as an audit log for actions that were taken and also provides
    way to undo it.

  - Remediation actions that were taken as a result of automated
    investigations

  - Remediation actions that were taken on suspicious or malicious email
    messages, files, or URLs

  - Remediation actions that were approved by your security operations
    team

  - Commands that were run and remediation actions that were applied
    during Live Response sessions

  - Remediation actions that were taken by your antivirus protection

<!-- -->

- Required Roles: Security Administrator, Active remediation actions,
  Search and Purge

**Actions** lists pending and completed remediation actions for your
devices, email & collaboration content, and identities in one location.
Following actions are tracked:

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

**Pending:** Displays a list of actions that require attention. You can
approve or reject actions one at a time, or select multiple actions if
they have the same type of action (such as Quarantine file).

## Investigation through Sentinel

See **Incident management steps** under ## Threat Investigation above.
