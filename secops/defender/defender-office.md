# Introduction

Defender for Office 365 safeguards your organization against malicious threats posed by email messages, links (URLs), and collaboration tools. Defender for Office 365 Threat Policies:

- Anti-spam

- Anti-malware

- Anti-phishing

- Safe links

- Safe attachments

>  

 

# Safe Attachments Policy

Enable Safe attachments for SharePoint, OneDrive and Teams

Safe Attachment policy:

Enable Safe attachment to ensure that users are not able to download any malicious content to their systems.

Using Exchange Online powershell module: \#Set-AtpPolicyForO365 -EnableATPForSPOTeamsODB \$true

Using SharePoint online: \#Set-SPOTenant -DisallowInfectedFileDownload \$true

Reference: <https://docs.microsoft.com/en-us/powershell/module/exchange/set-atppolicyforo365?view=exchange-ps>

Detect, investigate, respond, and remediate threats to Microsoft Teams, SharePoint, and OneDrive

 

**Enable Safe attachments for SharePoint, OneDrive, and Teams**

- Safe Attachment policy:

- Enable Safe attachment to ensure that users are not able to download any malicious content to their systems.

- Using Exchange Online powershell module: \#Set-AtpPolicyForO365 -EnableATPForSPOTeamsODB \$true

- Using SharePoint online: \#Set-SPOTenant -DisallowInfectedFileDownload \$true

- Reference: <https://docs.microsoft.com/en-us/powershell/module/exchange/set-atppolicyforo365?view=exchange-ps>

- Detect, investigate, respond, and remediate threats to Microsoft Teams, SharePoint, and OneDrive

Defender for Office 365 safeguards your organization against malicious threats posed by email messages, links (URLs), and collaboration tools. Defender for Office 365 Threat Policies:

# Anti-spam

# Anti-malware

# Anti-phishing

# Safe links

# Safe attachments

How to create Safe attachments policy that fulfils tracking requirement and send malicious email to admin for review?

- Click enable redirect

- Enter admins email address

- Select monitor option

To create a Safe attachments policy that fulfils the tracking requirement and sends malicious emails to the admin for review, you can follow these steps:

1.  Go to the Microsoft Defender XDR portal.

2.  Click Email & Collaboration \> Policies & Rules \> Threat policies \> Safe attachments.

3.  Click Create policy.

4.  Enter a name and description for the policy.

5.  Under Action, select Monitor.

6.  Under Redirect messages with detected attachments, select Enable redirect and enter the email address of the admin who will review the malicious emails.

7.  Click Create.

Once you have created the policy, you can assign it to users and groups of users. To do this:

1.  Go to the Microsoft Defender XDR portal.

2.  Click Email & Collaboration \> Policies & Rules \> Threat policies \> Safe attachments.

3.  Click the name of the policy that you want to assign.

4.  Under Assignments, click Add.

5.  Select the users and groups of users that you want to assign the policy to.

6.  Click Save.

Enable Safe attachments for SharePoint, OneDrive and Teams

- Safe Attachment policy:

  - Enable Safe attachment to ensure that users are not able to download any malicious content to their systems.

- Using Exchange Online powershell module: \#Set-AtpPolicyForO365 -EnableATPForSPOTeamsODB \$true

- Using SharePoint online: \#Set-SPOTenant -DisallowInfectedFileDownload \$true

- Reference: <https://docs.microsoft.com/en-us/powershell/module/exchange/set-atppolicyforo365?view=exchange-ps>

Detect, investigate, respond, and remediate threats to Microsoft Teams, SharePoint, and OneDrive

**Enable Safe attachments for SharePoint, OneDrive and Teams**

- Safe Attachment policy:

  - Enable Safe attachment to ensure that users are not able to download any malicious content to their systems.

- Using Exchange Online powershell module: \#Set-AtpPolicyForO365 -EnableATPForSPOTeamsODB \$true

- Using SharePoint online: \#Set-SPOTenant -DisallowInfectedFileDownload \$true

- Reference: <https://docs.microsoft.com/en-us/powershell/module/exchange/set-atppolicyforo365?view=exchange-ps>

**detect, investigate, respond, and remediate threats to Microsoft Teams, SharePoint, and OneDrive**

- Security engineering team implements an additional layer of security through Microsoft Defender for Office 365 for company's email using Safe attachment policies. Employee in account department report that they are having problems with emails from customers including attachments being delayed. Which configuration settings in Safe attachments done to mitigate it and send emails directly?

  - **Dynamic Delivery option**: allow to cancel delay of messages and protect employee from malicious files

  - **Monitor option**: Only monitor files and will not block

  - **Off option:** avoid canning of files

  - **Block option**: block receiving emails which having malicious files

Microsoft Defender for Office 365

- Defender for Office 365 safeguards your organization against malicious threats posed by email messages, links (URLs), and collaboration tools.

- Defender for Office 365 Threat Policies:

  - Anti-spam

  - Anti-malware

  - Anti-phishing

  - Safe links

  - Safe attachments

Actions and Submissions

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

>  
>
>  

Enable Safe attachments for SharePoint, OneDrive, and Teams

- Safe Attachment policy:

- Enable Safe attachment to ensure that users are not able to download any malicious content to their systems.

- Using Exchange Online powershell module: \#Set-AtpPolicyForO365 -EnableATPForSPOTeamsODB \$true

- Using SharePoint online: \#Set-SPOTenant -DisallowInfectedFileDownload \$true

- Reference: <https://docs.microsoft.com/en-us/powershell/module/exchange/set-atppolicyforo365?view=exchange-ps>

- Detect, investigate, respond, and remediate threats to Microsoft Teams, SharePoint, and OneDrive

MDO

MDO stands for Microsoft Defender for Office 365 safeguards your organization against malicious threats posed by email messages, links (URLs), and collaboration tools.

Threat Policies

- Anti-spam

- Anti-malware

- Anti-phishing

- Safe links

Safe attachments

 

**General Concepts:**

**Explain the core functionalities of Microsoft Defender for Office 365.**

**Compare and contrast Defender for Office 365 with traditional email security solutions.**

**What are the different protection layers offered by Defender for Office 365?**

**How does Defender for Office 365 leverage real-time threat intelligence?**

**Describe the role of machine learning in threat detection by Defender for Office 365.**

 

 

**Technical Deep Dive:**

**Explain the process of investigating a suspicious email flagged by Defender for Office 365.**

**How does Defender for Office 365 handle phishing attacks and spear phishing attempts?**

**Describe the sandboxing technology used by Defender for Office 365 and its benefits.**

**How does Defender for Office 365 integrate with Exchange Online and other Microsoft 365 services?**

**Discuss the reporting and alert functionalities available in Defender for Office 365.**

 

 

**Scenario-Based:**

**You receive an alert about a potential malware attack spreading through email. How would you utilize Defender for Office 365 to contain and remediate the threat?**

**An employee reports receiving a suspicious email that bypassed email filters. Explain your approach to analyse and handle the situation using Defender for Office 365.**

**You notice a significant increase in spam emails targeting your organization. Describe your steps to investigate and address the issue with Defender for Office 365.**

**How would you proactively use Defender for Office 365 to protect your organization from evolving phishing scams and social engineering attacks?**

**Share a specific example where you successfully leveraged Defender for Office 365 to prevent a security incident in your previous role.**

 

 

**Advanced**:

**Discuss the capabilities of Microsoft Defender for Endpoint (MDE) and its integration with Defender for Office 365 for extended protection.**

**Explain the role of Attack Simulation Training in raising employee awareness and reducing phishing susceptibility.**

**Compare and contrast Defender for Office 365 with other email security solutions like Proofpoint or Mimecast.**

**Share your thoughts on the future of email security and how Defender for Office 365 might evolve.**

**You are tasked with presenting Defender for Office 365 to a non-technical audience. How would you explain its value proposition in simple terms?**

 

Bonus:

 

Show your understanding of recent Microsoft announcements or updates related to Defender for Office 365.

Be prepared to discuss specific use cases relevant to the role you are applying for.

Demonstrate your experience with managing security settings and policies within Microsoft 365.

 

 

 

 

 

**Protocols used in email infrastructure**

- SMTP protocol – forwarding email to server

- POP/IMAP protocol – retrieve email from server

**Cyber attacks through email**

- Spam

- Malware

- Phishing

- **URL Hiding** - An attack that takes advantage of the ability to embed URLs in web pages and email

- **Secure/Multipurpose Internet Mail Extensions (S/MIME)** - A set of specifications for securing electronic mail that is based upon the widely-used MIME standard and describes a protocol for adding cryptographic security services through MIME encapsulation of digitally signed and encrypted objects. The basic security services offered are authentication, non-repudiation of origin, message integrity, and message privacy. Optional security services include signed receipts, security labels, secure mailing lists, and an extended method of identifying the signer’s certificate(s).

**Vishing**

- Just as phishing attempts to solicit information via email, vishing attempts to solicit information via voice. Most commonly, this comes in the form of a phone call. For example, when you receive a call “from the IRS” telling you that you owe back-taxes and there is a warrant for your arrest and all you have to do is send thousands of dollars’ worth of gift cards, and the arrest warrant will go away. Hint: The IRS does not call you and does not accept gift cards as payment of taxes—ever!!!

**Phishing**

- A phishing email is a form of social engineering and is now the single most common attack method in the world. It is also the most successful, resulting in billions of dollars per year in corporate and personal losses. Traditional phishing messages try to get you to click on a link purportedly taking you to your PayPal account, but taking you to a site that only looks like PayPal (called an Evil Twin site). Unfortunately, the sophistication of the hacking community has grown considerably in this area so recognizing a legitimate email from a phishing email is no longer a simple matter. (Note: Spear phishing is simply a highly targeted phishing email.)

**Social Engineering**

- Social Engineering is the use of manipulation, deception, and pretexting (AKA lying) to get an individual to divulge corporate or personal secrets. It is the most common attack category and has been used for centuries. Spear phishing is a form of social engineering used for decades. As such, social engineering now accounts for tens and even hundreds of billions of dollars per year in corporate and personal losses.

# Microsoft Defender for Office

Microsoft Defender for Office 365 (MDO) is a cloud-based email and collaboration security solution that protects organizations from malicious threats delivered via email, links (URLs), and collaboration tools. It safeguards Office 365 mailboxes (including Exchange Online, on-premises Exchange, and Outlook.com) using AI-powered threat detection and prevention.

Key MDO Threat Policies include:

- Anti-spam

- Anti-malware

- Anti-phishing

- Safe Links

- Safe Attachments

MDO offers advanced threat protection by identifying and blocking sophisticated attacks like phishing, malware, and zero-day exploits, which can evade traditional security. Benefits include comprehensive protection across Office 365, ease of use and management, and integration with other Microsoft security solutions like Microsoft Defender for Endpoint and Microsoft Defender for Identity. This integration provides a holistic view of security and facilitates automated workflows.

Examples of MDO's protective capabilities:

- Detecting and blocking phishing emails, even sophisticated ones.

- Detecting and removing malware from email attachments and links.

- Protecting against zero-day attacks by identifying and blocking unknown exploits.

MDO is a valuable tool for organizations seeking robust protection for their Office 365 environment, especially those with complex IT infrastructures or strict compliance requirements.

# Use Cases

Security engineering team implements an additional layer of security through Microsoft Defender for Office 365 for company's email using Safe attachment policies. Employee in account department report that they are having problems with emails from customers including attachments being delayed. Which configuration settings in Safe attachments done to mitigate it and send emails directly?

- **Dynamic Delivery option**: allow to cancel delay of messages and protect employee from malicious files

- **Monitor option**: Only monitor files and will not block

- **Off option:** avoid canning of files

- **Block option**: block receiving emails which having malicious files

To mitigate email delays caused by Safe attachments, the security engineering team can configure the following settings:

**1. Enable the Dynamic Delivery feature.** This feature allows Microsoft Defender for Office 365 to deliver the body of the email message to the recipient with a placeholder for each attachment. The placeholder remains until the attachment is found to be safe, and then the attachment becomes available to open or download. This allows the recipient to start reading the email before the attachments are processed, which can reduce the overall delay.

**2. Set the Attachment processing timeout to a higher value.** This setting controls how long Microsoft Defender for Office 365 will wait for an attachment to be processed before delivering the email message. By setting the timeout to a higher value, you can reduce the risk of emails being delayed if an attachment is taking a long time to process.

**3. Exempt known safe senders from Safe attachments scanning.** You can exempt known safe senders from Safe attachments scanning to reduce the delay for emails from these senders. To do this, you can create a list of allowed senders and exempt them from Safe attachments scanning using the **Safe senders** policy.

**4. Disable Safe attachments for specific message types.** You can disable Safe attachments for specific message types, such as internal emails or emails from trusted partners. This can reduce the delay for these emails. To do this, you can create a **Safe attachments exclusions** policy and specify the message types that you want to exclude from Safe attachments scanning.

**5. Use the Bypass Safe attachments for specific users policy.** You can use the **Bypass Safe attachments for specific users** policy to bypass Safe attachments scanning for specific users. This can be useful for users who need to receive emails with attachments promptly, such as sales representatives or customer support representatives.

**To send emails directly without any delay, you can disable Safe attachments altogether.** However, this is not recommended, as it would reduce the security of your organization's email system.

**The security engineering team should work with the account department to identify the root cause of the email delays.** This may involve reviewing the Safe attachments policies, investigating the specific emails that are being delayed, and analyzing the performance of the Microsoft Defender for Office 365 service. Once the root cause has been identified, the team can take the appropriate steps to mitigate the issue.

**Here are some additional tips for mitigating email delays caused by Safe attachments:**

- Keep your Safe attachments policies up to date. Microsoft regularly releases updates for Safe attachments policies, which can improve the performance of the service and reduce the risk of email delays.

- Monitor the performance of the Microsoft Defender for Office 365 service. You can use the **Service health** dashboard in the Microsoft Defender XDR portal to monitor the performance of the service and identify any potential issues.

- Work with Microsoft support if you are experiencing significant email delays caused by Safe attachments. Microsoft support can help you to troubleshoot the issue and recommend solutions.

Alert has triggered and automated investigation has initiated, on analysing the progress its status shows that "Terminated by System" what 2 reasons causes this issue?

- Pending actions timed out after one week (When no action taken)

- Actions are too numerous to run all analysers

There are two main reasons why an automated investigation in Microsoft Defender XDR might be terminated by the system:

**1. The investigation's pending actions expired.** Pending actions in Microsoft Defender XDR investigations time out after awaiting approval for one week. This is to ensure that investigations do not remain in a pending state for an extended period of time. **2. There are too many actions in the investigation.** If an investigation has too many actions, such as a large number of entities to investigate or a large number of remediations to perform, the system may terminate the investigation to prevent it from consuming too many resources.

Other reasons why an automated investigation might be terminated by the system include:

- The investigation is no longer relevant.

- The investigation is taking too long to complete.

- The investigation is unable to make progress.

- The investigation is encountering unexpected errors.

If you see that an automated investigation has been terminated by the system, you can review the investigation details to determine the reason for the termination. You can also try to mitigate the issue by taking the following steps:

- Reduce the number of pending actions in the investigation.

- Split the investigation into multiple investigations.

- Increase the resources available to the investigation.

- Contact Microsoft support for assistance.

Here are some tips for preventing automated investigations from being terminated by the system:

- **Keep your Microsoft Defender XDR tenant up to date.** Microsoft regularly releases updates for Microsoft Defender XDR, which can improve the performance and reliability of the service.

- **Monitor the status of your automated investigations.** You can use the **Investigations** dashboard in the Microsoft Defender XDR portal to monitor the status of your automated investigations.

- **Address pending actions promptly.** If you have any pending actions in your automated investigations, address them as soon as possible to prevent them from expiring.

- **Split large investigations into multiple investigations.** If you have an automated investigation with a large number of actions, consider splitting it into multiple investigations. This will help to improve the performance of the investigations and reduce the risk of them being terminated by the system.

By following these tips, you can help to ensure that your automated investigations are successful and that you are able to identify and respond to threats in your environment.

Once the policy is assigned to users and groups of users, any emails that contain malicious attachments will be sent to the admin for review. The admin can then review the emails and decide whether to release them to the recipients or not.

In addition to the above steps, you can also enable the Dynamic Delivery feature for your Safe attachments policy. This feature will allow Microsoft Defender for Office 365 to deliver the body of the email message to the recipient with a placeholder for each attachment. The placeholder will remain until the attachment is found to be safe, and then the attachment will become available to open or download. This can help to reduce the impact of Safe attachments processing on email delivery times.

To enable Dynamic Delivery for your Safe attachments policy:

1.  Go to the Microsoft Defender XDR portal.

2.  Click Email & Collaboration \> Policies & Rules \> Threat policies \> Safe attachments.

3.  Click the name of the policy that you want to enable Dynamic Delivery for.

4.  Under Dynamic Delivery, select Enable.

5.  Click Save.

By following these steps, you can create a Safe attachments policy that fulfills the tracking requirement and sends malicious emails to the admin for review.

Roles required to configure data loss prevention policy (DLP):

- **Compliance data administrator:** it can manage settings related to DLP, device management and report.

- **Communication compliance analyst:** Investigate when policy is matched and take remediation actions when suspicious content is detected.

- **Communication compliance viewer**:

Insider Risk management Role Group:

- **Insider risk management (IRM):** All

- **IRM Admin:** Policies/Settings, Analytics insights

- **IRM Analysts**: Analytics insights, Investigate Alerts/Cases, Notice Templates,

- **IRM Investigators**: Investigate Alerts/Cases, Content Explorer, Notice Templates

- **IRM Auditors**: Only able to View & export audit logs

- Alert is triggered on IRM portal, now we need to escalate it to Advanced eDiscovery, but before escalating what step we need to do? **--\> Create Case in Insider Risk Management portal.**

- One of the employees accidently runs executable from email, which steals employee credentials, what solution can be used to respond to these types of threats? **-\> Microsoft Secure Score - used to configure security features.**

- How to identify un-sanctioned apps being used in company? **-\> Cloud discovery in Microsoft Defender for Cloud App - which used to gain insights of network and cloud apps used in company.**

- Which policy needs to be defined in Microsoft Defender for Cloud app, if credentials of employee are stolen and those are used by attacker from difference country? **-\> Impossible travel policy.**

- What steps we need to follow for enforcing information protection, with Microsoft Defender for Cloud App?

  - **Make sure applications in company are connected to Microsoft Defender for Cloud App**

  - **Classify sensitive information in company through Microsoft Defender for Cloud App**

  <!-- -->

  - User in accounting department violates policy related to risk IP address by accessing it, task is assigned to you to resolve issue, you access MDCA portal's alert page. What remediation you will perform?

    - **Send notification to user and ask if violation was intentional**

    - **Suspend user until decision is made concerning case.**

  - How to detect number of employees using new cloud app. We decided to use Cloud discovery in MDCA, what prerequires should be followed to use these policy?

    - **Enable integration of MDCA with MDE**

    - **Establish automatic log upload for reports of cloud discovery**

  - How to implement Information Protection policy in MDCA to detect employee share confidential files with external cloud service?

    - **Select file policy**

    - **Modify access level filter to public (internet) / public / external**

    - **Select Data classification service option in inspection method field**

    - **Access select type field on policies page**

    - **Create governance action**

  - Employee sends email outside organization with sensitive information. Manager wants incident should be identified as Red Incident by Microsoft Defender XDR. What 2 action you will perform?

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

  - In Microsoft Defender XDR, automated investigation has quarantined a file believed to be malicious on 12 devices. We completed further research and found out that file is not malicious. How to remove this file from quarantine?

    - **Navigate to Action center**

    - **Select History tab and then select file**

    - **Select apply to 11 more instances of this file then click Undo.**

**Enable safe attachment policy for SharePoint, OneDrive, and Teams**

- Enable safe attachment policy to ensure that users are not able to download any malicious content to their systems.

- Using Exchange Online powershell module: \#Set-AtpPolicyForO365 -EnableATPForSPOTeamsODB \$true

- Using SharePoint online: \#Set-SPOTenant -DisallowInfectedFileDownload \$true

- Reference: <https://docs.microsoft.com/en-us/powershell/module/exchange/set-atppolicyforo365?view=exchange-ps>

- Detect, investigate, respond, and remediate threats to Microsoft Teams, SharePoint, and OneDrive

> **<span class="mark">Microsoft Defender for Office 365</span>**

- Defender for Office 365 safeguards your organization against malicious threats posed by email messages, links (URLs), and collaboration tools.

- Defender for Office 365 Threat Policies:

  - Anti-spam

  - Anti-malware

  - Anti-phishing

  - Safe links

  - Safe attachments

Security engineering team implements an additional layer of security through Microsoft Defender for Office 365 for company's email using Safe attachment policies. Employee in account department report that they are having problems with emails from customers including attachments being delayed. Which configuration settings in Safe attachments done to mitigate it and send emails directly?

- **Dynamic Delivery option**: allow to cancel delay of messages and protect employee from malicious files

- **Monitor option**: Only monitor files and will not block

- **Off option:** avoid canning of files

- **Block option**: block receiving emails which having malicious files

**Microsoft Defender for Office 365**

- Defender for Office 365 safeguards your organization against malicious threats posed by email messages, links (URLs), and collaboration tools.

- Defender for Office 365 Threat Policies:

  - Anti-spam

  - Anti-malware

  - Anti-phishing

  - Safe links

  - Safe attachments

- **Enable Safe attachments for SharePoint, OneDrive and Teams**

- Safe Attachment policy:

- Enable Safe attachment to ensure that users are not able to download any malicious content to their systems.

- Using Exchange Online powershell module: \#Set-AtpPolicyForO365 -EnableATPForSPOTeamsODB \$true

- Using SharePoint online: \#Set-SPOTenant -DisallowInfectedFileDownload \$true

- Reference: <https://docs.microsoft.com/en-us/powershell/module/exchange/set-atppolicyforo365?view=exchange-ps>

- Detect, investigate, respond, and remediate threats to Microsoft Teams, SharePoint, and OneDrive

<!-- -->

- **How does a CASB work?** 🡪 CASBs work by ensuring that network traffic between on-premises devices and the cloud provider complies with an organization's security policies. The value of cloud access security brokers stems from their ability to give insight into cloud application use across cloud platforms and identify unsanctioned use. This is especially important in regulated industries. CASBs use auto-discovery to identify cloud applications in use and identify high-risk applications, high-risk users, and other key risk factors. Cloud access security brokers may enforce several different security access controls, including encryption and device profiling. They may also provide other services such as credential mapping when single sign-on is not available.

> **Enable Safe attachments for SharePoint, OneDrive and Teams**

- Safe Attachment policy:

- Enable Safe attachment to ensure that users are not able to download any malicious content to their systems.

- Using Exchange Online powershell module: \#Set-AtpPolicyForO365 -EnableATPForSPOTeamsODB \$true

- Using SharePoint online: \#Set-SPOTenant -DisallowInfectedFileDownload \$true

- Reference: [<u>https://docs.microsoft.com/en-us/powershell/module/exchange/set-atppolicyforo365?view=exchange-ps</u>](https://docs.microsoft.com/en-us/powershell/module/exchange/set-atppolicyforo365?view=exchange-ps)

- Detect, investigate, respond, and remediate threats to Microsoft Teams, SharePoint, and OneDrive

**Defender for Office**

Microsoft Defender for Office 365 offers robust email security with the following key benefits:

- **Industry-leading protection:** It analyses massive amounts of data to identify and block advanced threats like phishing and zero-day malware.

- **Actionable insights:** It provides security admins with clear recommendations to address potential security issues.

- **Automated response:** It automates investigation and remediation tasks, saving time and resources during security incidents.

- **Training and awareness:** It helps train users to identify suspicious emails and report them, reducing the risk of social engineering attacks.

- Defender for Office 365 can be deployed in various configurations to protect email in on-premises, cloud, or hybrid environments.

>  

 

## Microsoft Defender for Office 365

Microsoft Defender for Office 365 (formerly Office 365 ATP) is a cloud-based email security solution that helps organizations protect their Office 365 mailboxes from phishing attacks, malware, and other threats. It uses machine learning and artificial intelligence (AI) to identify and block sophisticated threats that may evade traditional email security solutions.

Defender for Office 365 provides a number of key benefits, including:

- Advanced threat protection: Defender for Office 365 uses AI to identify and block sophisticated threats, such as phishing emails, malware, and zero-day attacks. This helps to protect your organization from even the most advanced threats.

- Comprehensive protection: Defender for Office 365 protects all of your Office 365 mailboxes, including Exchange Online, Exchange on-premises, and Outlook.com. This helps to ensure that all of your email is protected, regardless of where it is stored or accessed.

- Easy to use and manage: Defender for Office 365 is easy to use and manage. You can configure it to meet the specific needs of your organization, and you can easily monitor its performance and effectiveness.

- Integrated with other Microsoft security solutions: Defender for Office 365 is integrated with other Microsoft security solutions, such as Microsoft Defender for Endpoint and Microsoft Defender for Identity. This helps to provide a more comprehensive view of your security posture and to automate security workflows.

Defender for Office 365 is a valuable tool for any organization that wants to protect its Office 365 mailboxes from advanced threats. It is especially well-suited for organizations with complex IT environments or that are subject to strict compliance requirements.

Here are some specific examples of how Defender for Office 365 can be used to protect your organization from threats:

- Detect and block phishing emails: Defender for Office 365 uses AI to detect phishing emails, even those that are well-crafted and difficult to distinguish from legitimate emails. It can also block phishing emails from reaching your users' inboxes.

- Detect and remove malware: Defender for Office 365 uses AI to detect malware in attachments and links in emails. It can also remove malware from emails before they reach your users' inboxes.

- Protect against zero-day attacks: Defender for Office 365 uses AI to identify and block zero-day attacks, which are attacks that exploit vulnerabilities that are not yet known to security vendors. This helps to protect your organization from even the most recent and unknown threats.

Overall, Defender for Office 365 is a powerful email security solution that can help organizations protect their Office 365 mailboxes from advanced threats. It is easy to use and manage, and it offers a wide range of features and benefits.

Security engineering team implements an additional layer of security through Microsoft Defender for Office 365 for company's email using Safe attachment policies. Employee in account department report that they are having problems with emails from customers including attachments being delayed. Which configuration settings in Safe attachments done to mitigate it and send emails directly?

- **Dynamic Delivery option**: allow to cancel delay of messages and protect employee from malicious files

- **Monitor option**: Only monitor files and will not block

- **Off option:** avoid canning of files

- **Block option**: block receiving emails which having malicious files

To mitigate email delays caused by Safe attachments, the security engineering team can configure the following settings:

**1. Enable the Dynamic Delivery feature.** This feature allows Microsoft Defender for Office 365 to deliver the body of the email message to the recipient with a placeholder for each attachment. The placeholder remains until the attachment is found to be safe, and then the attachment becomes available to open or download. This allows the recipient to start reading the email before the attachments are processed, which can reduce the overall delay.

**2. Set the Attachment processing timeout to a higher value.** This setting controls how long Microsoft Defender for Office 365 will wait for an attachment to be processed before delivering the email message. By setting the timeout to a higher value, you can reduce the risk of emails being delayed if an attachment is taking a long time to process.

**3. Exempt known safe senders from Safe attachments scanning.** You can exempt known safe senders from Safe attachments scanning to reduce the delay for emails from these senders. To do this, you can create a list of allowed senders and exempt them from Safe attachments scanning using the **Safe senders** policy.

**4. Disable Safe attachments for specific message types.** You can disable Safe attachments for specific message types, such as internal emails or emails from trusted partners. This can reduce the delay for these emails. To do this, you can create a **Safe attachments exclusions** policy and specify the message types that you want to exclude from Safe attachments scanning.

**5. Use the Bypass Safe attachments for specific users policy.** You can use the **Bypass Safe attachments for specific users** policy to bypass Safe attachments scanning for specific users. This can be useful for users who need to receive emails with attachments promptly, such as sales representatives or customer support representatives.

**To send emails directly without any delay, you can disable Safe attachments altogether.** However, this is not recommended, as it would reduce the security of your organization's email system.

**The security engineering team should work with the account department to identify the root cause of the email delays.** This may involve reviewing the Safe attachments policies, investigating the specific emails that are being delayed, and analyzing the performance of the Microsoft Defender for Office 365 service. Once the root cause has been identified, the team can take the appropriate steps to mitigate the issue.

**Here are some additional tips for mitigating email delays caused by Safe attachments:**

- Keep your Safe attachments policies up to date. Microsoft regularly releases updates for Safe attachments policies, which can improve the performance of the service and reduce the risk of email delays.

- Monitor the performance of the Microsoft Defender for Office 365 service. You can use the **Service health** dashboard in the Microsoft 365 Defender portal to monitor the performance of the service and identify any potential issues.

- Work with Microsoft support if you are experiencing significant email delays caused by Safe attachments. Microsoft support can help you to troubleshoot the issue and recommend solutions.

Alert has triggered and automated investigation has initiated, on analysing the progress its status shows that "Terminated by System" what 2 reasons causes this issue?

- Pending actions timed out after one week (When no action taken)

- Actions are too numerous to run all analysers

There are two main reasons why an automated investigation in Microsoft 365 Defender might be terminated by the system:

**1. The investigation's pending actions expired.** Pending actions in Microsoft 365 Defender investigations time out after awaiting approval for one week. This is to ensure that investigations do not remain in a pending state for an extended period of time. **2. There are too many actions in the investigation.** If an investigation has too many actions, such as a large number of entities to investigate or a large number of remediations to perform, the system may terminate the investigation to prevent it from consuming too many resources.

Other reasons why an automated investigation might be terminated by the system include:

- The investigation is no longer relevant.

- The investigation is taking too long to complete.

- The investigation is unable to make progress.

- The investigation is encountering unexpected errors.

If you see that an automated investigation has been terminated by the system, you can review the investigation details to determine the reason for the termination. You can also try to mitigate the issue by taking the following steps:

- Reduce the number of pending actions in the investigation.

- Split the investigation into multiple investigations.

- Increase the resources available to the investigation.

- Contact Microsoft support for assistance.

Here are some tips for preventing automated investigations from being terminated by the system:

- **Keep your Microsoft 365 Defender tenant up to date.** Microsoft regularly releases updates for Microsoft 365 Defender, which can improve the performance and reliability of the service.

- **Monitor the status of your automated investigations.** You can use the **Investigations** dashboard in the Microsoft 365 Defender portal to monitor the status of your automated investigations.

- **Address pending actions promptly.** If you have any pending actions in your automated investigations, address them as soon as possible to prevent them from expiring.

- **Split large investigations into multiple investigations.** If you have an automated investigation with a large number of actions, consider splitting it into multiple investigations. This will help to improve the performance of the investigations and reduce the risk of them being terminated by the system.

By following these tips, you can help to ensure that your automated investigations are successful and that you are able to identify and respond to threats in your environment.

How to create Safe attachments policy that fulfils tracking requirement and send malicious email to admin for review?

- Click enable redirect

- Enter admins email address

- Select monitor option

To create a Safe attachments policy that fulfils the tracking requirement and sends malicious emails to the admin for review, you can follow these steps:

8.  Go to the Microsoft 365 Defender portal.

9.  Click Email & Collaboration \> Policies & Rules \> Threat policies \> Safe attachments.

10. Click Create policy.

11. Enter a name and description for the policy.

12. Under Action, select Monitor.

13. Under Redirect messages with detected attachments, select Enable redirect and enter the email address of the admin who will review the malicious emails.

14. Click Create.

Once you have created the policy, you can assign it to users and groups of users. To do this:

7.  Go to the Microsoft 365 Defender portal.

8.  Click Email & Collaboration \> Policies & Rules \> Threat policies \> Safe attachments.

9.  Click the name of the policy that you want to assign.

10. Under Assignments, click Add.

11. Select the users and groups of users that you want to assign the policy to.

12. Click Save.

Once the policy is assigned to users and groups of users, any emails that contain malicious attachments will be sent to the admin for review. The admin can then review the emails and decide whether to release them to the recipients or not.

In addition to the above steps, you can also enable the Dynamic Delivery feature for your Safe attachments policy. This feature will allow Microsoft Defender for Office 365 to deliver the body of the email message to the recipient with a placeholder for each attachment. The placeholder will remain until the attachment is found to be safe, and then the attachment will become available to open or download. This can help to reduce the impact of Safe attachments processing on email delivery times.

To enable Dynamic Delivery for your Safe attachments policy:

6.  Go to the Microsoft 365 Defender portal.

7.  Click Email & Collaboration \> Policies & Rules \> Threat policies \> Safe attachments.

8.  Click the name of the policy that you want to enable Dynamic Delivery for.

9.  Under Dynamic Delivery, select Enable.

10. Click Save.

By following these steps, you can create a Safe attachments policy that fulfills the tracking requirement and sends malicious emails to the admin for review.

Roles required to configure data loss prevention policy (DLP):

- **Compliance data administrator:** it can manage settings related to DLP, device management and report.

- **Communication compliance analyst:** Investigate when policy is matched and take remediation actions when suspicious content is detected.

- **Communication compliance viewer**:

Insider Risk management Role Group:

- **Insider risk management (IRM):** All

- **IRM Admin:** Policies/Settings, Analytics insights

- **IRM Analysts**: Analytics insights, Investigate Alerts/Cases, Notice Templates,

- **IRM Investigators**: Investigate Alerts/Cases, Content Explorer, Notice Templates

- **IRM Auditors**: Only able to View & export audit logs

- Alert is triggered on IRM portal, now we need to escalate it to Advanced eDiscovery, but before escalating what step we need to do? **--\> Create Case in Insider Risk Management portal.**

- One of the employees accidently runs executable from email, which steals employee credentials, what solution can be used to respond to these types of threats? **-\> Microsoft Secure Score - used to configure security features.**

- How to identify un-sanctioned apps being used in company? **-\> Cloud discovery in Microsoft Defender for Cloud App - which used to gain insights of network and cloud apps used in company.**

- Which policy needs to be defined in Microsoft Defender for Cloud app, if credentials of employee are stolen and those are used by attacker from difference country? **-\> Impossible travel policy.**

- What steps we need to follow for enforcing information protection, with Microsoft Defender for Cloud App?

  - **Make sure applications in company are connected to Microsoft Defender for Cloud App**

  - **Classify sensitive information in company through Microsoft Defender for Cloud App**

  <!-- -->

  - User in accounting department violates policy related to risk IP address by accessing it, task is assigned to you to resolve issue, you access MDCA portal's alert page. What remediation you will perform?

    - **Send notification to user and ask if violation was intentional**

    - **Suspend user until decision is made concerning case.**

  - How to detect number of employees using new cloud app. We decided to use Cloud discovery in MDCA, what prerequires should be followed to use these policy?

    - **Enable integration of MDCA with MDE**

    - **Establish automatic log upload for reports of cloud discovery**

  - How to implement Information Protection policy in MDCA to detect employee share confidential files with external cloud service?

    - **Select file policy**

    - **Modify access level filter to public (internet) / public / external**

    - **Select Data classification service option in inspection method field**

    - **Access select type field on policies page**

    - **Create governance action**

  - Employee sends email outside organization with sensitive information. Manager wants incident should be identified as Red Incident by Microsoft 365 Defender. What 2 action you will perform?

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

  - In Microsoft 365 Defender, automated investigation has quarantined a file believed to be malicious on 12 devices. We completed further research and found out that file is not malicious. How to remove this file from quarantine?

    - **Navigate to Action center**

    - **Select History tab and then select file**

    - **Select apply to 11 more instances of this file then click Undo.**

Creating a Safe Attachments Policy for Tracking and Admin Review:

To create a Safe Attachments policy that tracks attachments and sends potentially malicious emails to an admin for review:

1.  Enable redirection.

2.  Enter the admin's email address for redirection.

3.  Select the "Monitor" option (or the appropriate action for handling potentially malicious attachments, which might include blocking or replacing). Note: Simply redirecting without an action on the attachment itself might not be sufficient for security. Clarify what "Monitor" does in the context of the specific policy settings you are using.

Microsoft Defender for Office

11. **Safe Attachments Delays:** Use the *Dynamic Delivery* option in Safe Attachments policies to minimize delays. This delivers the email immediately while scanning the attachment in the background. "Monitor" only tracks; "Block" blocks and can cause delays; "Off" disables scanning.

Safe Attachments Policy:

To create a Safe Attachments policy that fulfils tracking requirements and sends potentially malicious emails to an administrator for review:

1.  **Enable Redirection:** Enable the redirect option in the policy.

2.  **Admin Email:** Enter the administrator's email address in the designated field.

3.  **Monitoring:** Select the "Monitor" action. This allows for tracking and review without immediately blocking legitimate emails. (Note: The "Block" action would prevent delivery entirely).

Microsoft Defender for Office

- Security engineering team implements an additional layer of security through Microsoft Defender for Office 365 for company's email using Safe attachment policies. Employee in account department report that they are having problems with emails from customers including attachments being delayed. Which configuration settings in Safe attachments done to mitigate it and send emails directly?

  - Dynamic Delivery option: allow to cancel delay of messages and protect employee from malicious files

  - Monitor option: Only monitor files and will not block

  - Off option: avoid canning of files

  - Block option: block receiving emails which having malicious files

- How to create Safe attachments policy that’s fulfils tracking requirement and send malicious email to admin for review?

  - Click enable redirect

  - Enter admins email address

  - Select monitor option
