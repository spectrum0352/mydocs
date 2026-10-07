Investigation

# Goal

- Who is threat actor?

- What is the technical impact?

- What is the technical risk?

- What are the techniques, tactics, and procedures?

- What is the threat?

- What is the potential business impact of the incident?

- What is the scope of the problem, what areas of the organisation are affected?

- What is the business impact?

- What is the business risk?

- What is the Anomaly? Baseline system Behaviour and Degree of deviation of baseline

- Is the analyst report well structured, formatted, actionable and easy to read analyst report?

# Investigation Workflow

- Detect the incident, determine its scope, and involve the appropriate parties.

- Information coming from several sources should be gathered and analysed

- The first step in dealing effectively with an incident involves identifying it

<!-- -->

- **Challenges in incident detection**

Most challenging factor in Cyber Security is accurately detecting and assessing possible incidents.

- Manually through problems reported by users.

- High False Positives

- Deep and specialized knowledge and experience is required for efficient incident analysis.

<!-- -->

- **Indicators of compromise**

  - IoC for Identity and Access

  - IoC for Network

  - IoC for Endpoints

  - IoC for Applications

  - IoC for Cryptography

<!-- -->

- Detect the incident, determine its scope, and involve the appropriate parties.

- Information coming from several sources should be gathered and analysed

- The first step in dealing effectively with an incident involves identifying it

<!-- -->

- **Challenges in incident detection**

Most challenging factor in Cyber Security is accurately detecting and assessing possible incidents.

- Manually through problems reported by users.

- High False Positives

- Deep and specialized knowledge and experience is required for efficient incident analysis.

<!-- -->

- **Indicators of compromise**

  - IoC for Identity and Access

  - IoC for Network

  - IoC for Endpoints

  - IoC for Applications

  - IoC for Cryptography

**Threat Investigation Checklist**

***Security Incident Survey Cheat Sheet for Server Administrators***

**Purpose**: Use this checklist to perform a quick but careful assessment of a potentially compromised system to determine whether to escalate to formal incident response.

**1. Assessing the Suspicious Situation**

**⚠️ Important:** To preserve evidence and attacker footprints, avoid installing new tools or performing actions that access or modify large numbers of files.

**🔍 Investigative Steps:**

- **Review system, security, and application logs** for:

  - Unusual logins or failed login attempts.

  - Unexpected changes to system configurations or software.

  - Irregularities in service behavior or application crashes.

- **Inspect network configuration and activity:**

  - Check current **network connections**, routing tables, and **active sessions**.

  - Identify any **anomalous ports**, **open listeners**, or **foreign IP connections**.

- **Audit user accounts:**

  - Identify **accounts that should not exist**, are **suspicious**, or were **not recently created by admins**.

  - Look for **accounts that should have been disabled** but are still active.

- **Review running processes and scheduled jobs:**

  - Flag **processes or tasks** that are not part of the standard system configuration.

  - Look for **malicious or unexpected scripts**, binaries, or background jobs.

- **Check for persistence mechanisms:**

  - Investigate programs or services **set to auto-start** on boot that do not belong.

  - Review contents of system startup folders, cron jobs, registry Run keys (on Windows), or launch agents (on macOS/Linux).

- **Evaluate ARP, DNS, and hosts file entries:**

  - Look for **suspicious ARP table entries** or **malicious DNS configurations**.

  - Open the hosts file and **check for unauthorized or redirected domains**.

- **Verify integrity of system and application files:**

  - Look for **unusual, recently modified, or hidden files**.

  - If baseline hashes are available, **compare file checksums** for critical binaries and config files.

- **Use a network sniffer or packet analyzer** (e.g., tcpdump, Wireshark):

  - Monitor for **outbound connections**, especially to **unexpected IP addresses or ports**.

  - Watch for **data exfiltration, beaconing, or reverse shells**.

- **Check for rootkits or signs of stealth:**

  - Be aware that **some tools may be hidden** or give **false outputs** due to rootkit interference.

  - **Trust your instincts** if the system feels off or responds abnormally.

- **Review related alerts and tickets:**

  - Examine any **recently reported system issues**, user complaints, or **intrusion detection alerts**.

  - Cross-reference with **centralized SIEM data**, if available.

**2. If You Believe a Compromise is Likely...**

**🚨 Immediate Actions:**

- **Escalate immediately**:

  - Involve your **incident response team or specialist** for the next steps.

  - **Notify your manager or security leadership** about the potential incident.

- **Do not panic.**

  - Stay calm and **do not let others rush you** into actions that could damage evidence.

  - Avoid careless mistakes caused by stress or urgency.

- **If the system is under active attack**:

  - **Disconnect it from the network** to halt ongoing malicious activity.

  - **Do NOT reboot or power off** the system, as this may destroy volatile evidence (e.g., RAM data, network connections).

- **Start documentation immediately**:

  - **Take detailed notes** including:

    - What you observed.

    - When it was observed (timestamps).

    - The exact conditions under which it was observed.

    - Any actions taken and by whom.

- **Preserve the scene**:

  - Treat the system as a **crime scene**.

  - Avoid altering or tampering with files unless authorized by the incident response lead.

This checklist helps ensure a structured, cautious approach to investigating potentially compromised systems, minimizing data loss and enabling proper escalation and forensic investigation.

## Analyze alert in XDR

To analyse alerts in XDR, you can follow these steps:

1.  **Gather context**. Before you start analysing an alert, it is important to gather as much context as possible. This may include information about the alert itself, such as the time it was triggered, the severity, and the source. You should also gather information about the environment in which the alert was triggered, such as the affected systems and networks.

2.  **Correlate data.** XDR solutions can correlate data from a variety of sources, such as endpoints, networks, and security appliances. This allows you to get a complete picture of the threat and to identify the root cause of the alert.

3.  **Identify the threat.** Once you have gathered context and correlated data, you can begin to identify the threat. This may involve using threat intelligence feeds or machine learning algorithms.

4.  **Assess the impact.** Once you have identified the threat, you need to assess the impact. This may involve determining the scope of the attack, the systems and data that have been affected, and the potential damage to the organization.

5.  **Act.** Once you have assessed the impact, you need to take action to remediate the threat and prevent future attacks. This may involve isolating affected systems, removing malware, or patching vulnerabilities.

6.  **Use filters**. XDR solutions allow you to filter alerts based on a variety of criteria, such as the severity, source, and type of alert. This can help you to quickly identify the most important alerts and to prioritize your investigations.

7.  **Use threat intelligence feeds**. Threat intelligence feeds can provide information about known threats, such as indicators of compromise (IOCs) and attack patterns. This information can help you to identify and investigate threats more effectively.

8.  **Use machine learning algorithms**. Machine learning algorithms can be used to identify patterns and trends in alert data. This can help you to identify threats that may be difficult or impossible to identify manually.

9.  **Collaborate with other teams**. XDR solutions can help you to collaborate with other teams, such as security operations and incident response. This can help you to investigate and respond to threats more effectively.

# 1. Initial Triage and Validation

The first step is to filter out "noise" and false positives to ensure the team is focusing on real threats.

- **Verification:** Comparing the alert against known baseline behavior to confirm an anomaly exists.

- **Prioritization:** Assigning a severity level based on the business impact, the sensitivity of the data involved, and the effort required for recovery.

- **Categorization:** Labeling the incident (e.g., DDoS, Malware, Unauthorized Access) to trigger the correct response playbook.

## First steps after attack detection

> **If you Believe a Compromise is Likely...**

- Do not panic or let others rush you; concentrate to avoid making careless mistakes.

- If stopping an on-going attack, unplug the system from the network; do not reboot or power down.

- Involve an incident response specialist for next steps and notify your manager.

- Take thorough notes to track what you observed, when, and under what circumstances.

 

>  
>
> **After alert is detected, generate incident. Incident declaration:**

- Categorize the incident

- Designate incident coordination lead,

- If applicable notify CISA and law enforcement.

>  
>
> **Investigation scope:**

- Identify the type and extent of the incident

- Assess operational or informational impact on organization’s mission.

- IR specialist initiates pre-defined response plan specific to the severity and type of the incident.

- Complete initial scoping assessment to determine systems and data affected by the incident.

- Tips for examining a suspect system to decide whether to escalate for formal incident response.

>  
>
> **Collect and preserve data necessary for:**

- Incident verification,

- Incident categorization

- Incident prioritization

- Incident mitigation

- Incident reporting and attribution

- Evidence collection: Log all evidence and note how, when and who acquired evidence.

>  
>
> **Perform Technical Analysis:**

- Develop a technical and contextual understanding of the incident.

- Update scope as investigation progresses and information evolves.

- Report most recent findings and incident status to CISA.

- Incident verification

- Incident scope identification

- Identification of methods of persistent access to the network.

- Impact assessment

- Goal of Cyber-attack: A hypothesis for the narrative of exploitation has been cultivated (TTPs and IOCs). Prepare a hypothesis of what the adversary was attempting to access/accomplish as per analysis and CTI.

- All stakeholders are proceeding with a common operating picture.

>  
>
> **Incident Analysis:**

- Advanced analytics

- Incident Aggregation

- Forensic Analysis through log search

>  
>
> **Identify anomalous activity:**

- Assess affected systems and networks for subtleties of adversary behavior which often may look legitimate.

- Identify deviations from established baseline activity - particularly important to identify attempts to leverage legitimate credentials and native capabilities and tools (i.e., living off the land techniques).

>  
>
> **Identify root cause and enabling conditions:**

- Identify the root cause of the incident and collect threat information that can be used in further searches and inform subsequent response efforts. Identify and document the conditions that enabled the adversary to access and operate within the environment. Assess networks and systems for changes that may have been made to either evade defenses or facilitate persistent access Identify attack vector. This includes how the adversary accessing the environment (e.g., malware, RDP, VPN). Assess access (depth and breadth). This includes All compromised systems, users, services, and networks.

>  
>
> **Gather Incident Indicators:**

- Review available CTI for precedent of similar activity.

- Analyze adversary tools.

- Assess tools to extract IOCs for short-term containment.

- Identify and document indicators that can be used for correlative analysis on the network.

- Share extracted threat information (atomic, computed, and behavioral indicators, context, and countermeasures) with internal response teams and CISA

>  
>
> **Analyze for Common Adversary TTPs:**

- Identify initial access techniques (e.g., spear phishing, supply chain compromise) if access is facilitated by malware, identify associated command and control (e.g., identify port, protocol, profile, domain, IP address).

- Identify the techniques used by the adversary to achieve code execution

>  
>
> **Validate and Refine Investigation Scope:**

- Identify new potentially impacted systems, devices, and associated accounts.

- Feed new IOCs and TTPs into detection tools.

- Continue to update the scope and communicate updated scope to all stakeholders to ensure a common operating picture.

>  
>
> **Adjust/Finetune Tools:**

- Tune tools to slow the pace of advance and decrease dwell time by incorporating IOCs to protect/detect specific activity.

- Introduce higher-fidelity modifications to tools.

- Tune tools to focus on tactics that must be used by the adversary to obtain operational objectives (e.g., execution, credential access, and lateral movement).

>  
>
> **------------------------------------------------------------------------**
>
>  

- **The employee who encounters the threat first needs to alert the it and management teams.** When an employee encounters something irregular with their computer, they need to notify the IT team immediately. It doesn’t matter if it’s a false alarm, but if something is out of the ordinary, the techs need to know. There are times hackers and threat actors keep their attacks under the radar so they can steal data without issue. No one should take any irregularity for granted.

- **IT staff must disconnect the computer from the network and start documentation of the infection.** Once the tech team identifies the compromised computer, they need to remove it from the network immediately. They should start unplugging the LAN cables and move to contain the threat inside the unit. Aside from containing the threat, they will need to check nearby units for infection.

- **The company should check their backups in the cloud.** A member of the IT team needs to go to their existing backups and make sure they are not compromised in any way. The integrity of the backups will ensure the continuity of business operations after the attack is over and the team contains the bad actors.

- **The IT team on-site should start implementing cyber security protocols.** If a company creates a cyber security response plan, there should be rules and procedures for how to treat the first minutes of the discovery of a cyber-attack. If the incident response team is not yet on site, the first responders should start implementing what’s stated in the plan. If the plan calls for the scene of the cybercrime to be cordoned off, the IT team should preserve the integrity of that particular part of the network.

- **The IT team should call the attention of the employees and educate them about the attack or infection.** The company should immediately inform their affected employees about the cyber-attack. Human error can serve as the root cause of a breach and it can also definitely worsen a crisis. Employees need to learn how to act during such a situation in order to minimize and prevent further damage. For example, if the source of the threat is a phishing email, IT staff should immediately inform employees not to click or open a particular message to avoid any malware from spilling onto more computers.

- **Use security systems to track potential malicious assets.** Companies with security operations centers or blended solutions like Comodo Endpoint Security should definitely use their resources to make sure the threat is controlled. As we have previously mentioned, re-infection can still happen and it’s best that all trace of malware or security vulnerability be controlled as soon as the issue stabilizes.

- **How To Handle The Aftermath Of A Cyber Attack?** Once a breach or an attack happens, the company should try to resolve the issue in 30 days or less. During that time, the team should follow these steps in order to mitigate against all forms of damage:

>  
>
>  
>
> **Convene The Incident Response Team**

- The incident response team should be composed of an incident response manager, who may or may not be your CISO, several cybersecurity analysts and threat researchers.

- They’ll be at the heart of the investigation and also the ones coordinating with the representatives of the company’s various stakeholders. These representatives should hail from management, human resources, risk assessors, lawyers, and public relations experts.

- The internal tech team will investigate the cyber-attack while the other representatives will be there to support the work and to mitigate the kinds of damage that the company will encounter.

>  
>
> **Cordon Off Assets and Ensure Cyber Security Integrity**

- The team should immediately control the scene and cut off part of the network that had been compromised. They also need to make sure that the root cause or causes of the attack or the breach aren’t still lingering in the system.

- Once they ascertain everything is safe and that first responders or themselves have properly documented the incident, they’ll have to look at all of the assets within the company and check for damage. They should start consulting their detection technologies to make sure there are no additional threats within the network.

- After the network has been secured, the team will need to help ensure that systems critical to business operations could be restored immediately. This step is crucial since stopping operations will only hurt the company more.

>  
>
> **Document and Investigate**

- The investigating team will need to walk back through the incident to establish the facts. They’ll have to check what happened during the discovery of the attack and how the attack unfolded later on. These investigators also need to establish the kind of attack and its root causes. Aside from reconstructing the narrative behind the cybercrime, the team should also document every step of the investigation.

- The investigation should always follow the steps prescribed by the cybersecurity plan and work in alignment with existing company policies every step of the way. This is important since auditors and investigators from the government will verify and check the extent of actions the company has taken to investigate and remediate the issue. The team will also have to be sensitive about whom they share the information with. Attacks and breaches can occur because of malicious insiders within the company.

- Once the team identifies who the culprit is behind the attack and who the accomplices are, the team should work with HR to ensure that the people are held accountable in accordance to company policy and the law.

> ** **
>
> **Inform Law Enforcement and the Authorities**

- When a cyber-attack occurs, law enforcement must enter the picture as soon as possible. The problem with delaying this particular step is that it could be taken as a sign of culpability in the attack. Companies don’t report to the law following an attack because they think investigations can put a halt to operations. Agencies like the FBI will work in a non-disruptive way and cooperate with the victims of an attack.

>  
>
> **Notify the Public Regarding the Attack and Engage with Media**

- There are some breaches that your company will be able to resolve in time before they blow up and no consumers get affected. When that’s the case, these breaches and attacks could be resolved without notifying the public. However, when customers will be affected by a breach, like in service businesses which actively engage with their clients, the company must make a disclosure.

- When this happens, the company should own and control the narrative. The incident response team, together with the managers and people from human resources, should have a meeting before the disclosure to talk about every angle of the incident. The team should also stay in contact with a public relations expert who will help them manage how the company is portrayed in the media.

>  
>
> **Follow Compliance Requirements After an Attack**

- Governments and states have become more sensitive to issues of breaches and attacks. Lawmakers have started making laws and policies which make companies accountable for any lack of preparation for the attacks carried out against their systems.

- In light of these regulations, companies need to make sure they conform to every letter of these requirements to avoid extensive penalties.

- A major part of these regulations are the notification requirements. Certain laws like the European Union’s General Data Protection Regulation require companies to report to their clients about the breach within a 72-hour window.

>  
>
> **Prep For Legal Consequences**

- The cold hard reality about a cyber-attack is that a company will never be fully prepared for one and all an organization can do in the aftermath of an attack is to do damage control.

- After your incident response team concludes its investigation, manages the story, and repairs the damage to structures within the company, they’ll have to work with the company’s legal team. The government or an individual will hold the company liable and there will be legal ramifications to what transpired.

- The steps above should help you and your company weather the storm immediately after and within a month of a cyberattack. This 30-day timeline is actually shorter than the actual period that a threat statistically lies dormant within a system which is around 180 days.

- That’s half a year that companies could actually have spent in mounting credible and proactive defenses against these threats

>  
>
>  
>
> **Invest in Advanced Detection and Remediation Tools**

- The Ponemon Institute’s research showed that the faster a breach is identified and contained, the lower the costs the company incurs. A company that identifies a data breach saves \$1 million if they see the issue within 100 days. Containing the cause of the breach is another matter.

- An organization that contains a breach within 30 days manages to save \$1 million more in expenses than those that took longer. In order to meet those timetables or even avoid encountering a breach altogether, companies need to invest in advanced network and endpoint security. Advanced scanning tools found in such blended solutions have a much higher chance of catching the root cause of breaches.

>  
>
> **Form an Incident Response Team**

- The Ponemon Institute saw a \$14 per record cost reduction during a breach for companies that had incident response teams during the crisis.

- According to the study, the average cost a company pays per member record compromised is \$148. This is substantial if you think about the Equifax breach which affected at least 145.5 million users in the US.

- Based on the \$148 cost per compromised record figure, Equifax should be spending around \$21 billion. If Equifax had an incident response team during the time of the breach, they would have saved \$2.3 billion.

>  
>
> **Use Strong Encryption for Assets**

Extensive use of encryption also saves companies \$13 per member record compromised and possibly even more.

A single cyber-attack can also lead to another since the threat actors can plant their assets into the system.

These assets, like malware, can re-infect the system and open backdoors for another attack against the network.

 

>  

Here's a summary of the guide on how to handle the aftermath of a cyber attack:

**The First Few Minutes**

1.  **Employee reports threat:** If an employee sees something suspicious on their computer, they should immediately notify IT.

2.  **IT disconnects & documents:** IT isolates the compromised computer and documents the infection.

3.  **Implement security protocols:** If a cybersecurity plan exists, follow its protocol to contain the attack.

4.  **Educate employees:** Inform employees about the attack to prevent further damage (e.g., not clicking on phishing emails).

5.  **Use security systems:** Utilize security tools to track and eliminate any remaining malware.

**Convene the Incident Response Team**

This team investigates the attack and coordinates with different departments to mitigate damage.

**Within 30 Days**

1.  **Cordon off assets & ensure security:** Isolate compromised parts of the network and ensure the attack's root cause is gone.

2.  **Document and investigate:** Investigate the attack, document everything, and identify the culprit(s).

3.  **Inform law enforcement:** Report the attack to law enforcement as soon as possible.

4.  **Notify the public (if necessary):** If customers are affected, disclose the breach publicly and manage media relations.

5.  **Follow compliance requirements:** Comply with all relevant laws and regulations regarding data breaches.

6.  **Prepare for legal consequences:** The company's legal team may need to address potential lawsuits.

**Additional Tips**

- Invest in advanced security tools for better detection and remediation.

- Form an incident response team to minimize costs during a breach.

- Use strong encryption to protect your assets.

By following these steps, companies can recover from a cyber attack more effectively and minimize the damage.

# 2. Evidence Gathering and Correlation

Once an event is validated, analysts must pull data from various sources to build a full picture of the activity.

- **Log Analysis:** Examining SIEM alerts, firewall logs, DNS logs, and web server logs.

- **Network Analysis:** Reviewing NetFlow data or packet captures (PCAPs) to see where data was sent and received.

- **Endpoint Analysis:** Inspecting running processes, registry changes, and file system modifications on affected hosts.

# 3. Scope and Impact Assessment

This step determines how far the "infection" has spread and what the consequences are.

- **Identifying "Patient Zero":** Finding the initial point of entry.

- **Lateral Movement Tracking:** Determining if the attacker moved from the initial compromised host to other servers or databases.

- **Data Exfiltration Check:** Assessing if sensitive data (PII, intellectual property) was accessed or moved off network.

## Desing Scope of investigation

**Validate and Refine Investigation Scope**

- Identify new potentially impacted systems, devices, and associated accounts.

- Feed new IOCs and TTPs into detection tools

- Continue to update the scope and communicate updated scope to all stakeholders to ensure a common operating picture.

**Investigation scope**

- Assess operational or informational impact on organization’s mission.

- Complete initial scoping assessment to determine systems and data affected by the incident.

- Identify the type and extent of the incident

- IR specialist initiates pre-defined response plan specific to the severity and type of the incident.

- Tips for examining a suspect system to decide whether to escalate for formal incident response.

<!-- -->

- Complete initial scoping assessment to determine systems and data affected by the incident.

- Notify appropriate personnel if scoping assessment determines that the sensitive data was affected by the incident.

- What is the scope of the problem, what areas of the organisation are affected?

- What is the scope of the problem, what areas of the organization are affected?

**Tasks after incident detection:**

- Determine scope of incident

  - Identify affected system endpoints: servers, clients, routers etc.

  - Identify affected user accounts, credentials

  - Identify affected applications

  - Identify affected databases, storages

  - Identify affected networks.

# 4. Identifying the Threat Actor and Methodology

Understanding the *how* and *who* helps in effectively containing the threat.

- **TTP Identification:** Mapping the attacker's Tactics, Techniques, and Procedures (often using frameworks like MITRE ATT&CK).

- **Indicators of Compromise (IoCs):** Extracting specific file hashes, IP addresses, or domain names associated with the attack.

- **Motivation Assessment:** Determining if the attack appears targeted (APT) or opportunistic (automated botnets).

## Gather Incident Indicators

- Review available CTI for precedent of similar activity

- Analyze adversary tools. Assess tools to extract IOCs for short-term containment.

- Identify and document indicators that can be used for correlative analysis on the network.

- Share extracted threat information (atomic, computed, and behavioral indicators, context, and countermeasures) with internal response teams and CISA

- Identify IoC's (Indicators of Compromise) during investigation

- Implement SIEM and sensor rules to search for IOCs

 

# 5. Documentation and Notification

Analysis is not complete until the findings are documented and stakeholders are informed.

- **Timeline Creation:** Building a chronological account of the incident from initial entry to detection.

- **Chain of Custody:** Ensuring that any evidence collected is handled in a way that preserves its integrity for potential legal action.

- **Stakeholder Reporting:** Communicating the technical findings to management, legal, and (if necessary) law enforcement.

# Threat Investigation 

## Detection vs Investigation

<table>
<colgroup>
<col style="width: 11%" />
<col style="width: 26%" />
<col style="width: 62%" />
</colgroup>
<thead>
<tr>
<th>Category</th>
<th>Detection</th>
<th>Investigation</th>
</tr>
</thead>
<tbody>
<tr>
<td>Focus</td>
<td>Identifying potential incidents</td>
<td>Understanding the details of a confirmed incident</td>
</tr>
<tr>
<td>Timeframe</td>
<td>Faster-paced</td>
<td>More methodical (takes longer depending on complexity)</td>
</tr>
<tr>
<td>Activities</td>
<td><ul>
<li><p>Monitoring</p></li>
<li><p>Logging</p></li>
<li><p>Alerting</p></li>
</ul></td>
<td><ul>
<li><p>Analysis</p></li>
<li><p>Initial containment</p></li>
<li><p>Verification</p></li>
<li><p>Root cause analysis</p></li>
<li><p>Timeline reconstruction</p></li>
<li><p>Impact assessment</p></li>
<li><p>Evidence preservation</p></li>
<li><p>Containment and Eradication</p></li>
<li><p>Incident reporting</p></li>
<li><p>Recovery</p></li>
</ul></td>
</tr>
<tr>
<td>Skills</td>
<td><p>Monitoring tools</p>
<p>Alert analysis</p>
<p>Incident prioritization</p></td>
<td><ul>
<li><p>Forensics</p></li>
<li><p>Analysis</p></li>
<li><p>Reporting</p></li>
</ul>
<ul>
<li><p>Incident response procedures</p></li>
</ul></td>
</tr>
<tr>
<td>Goals</td>
<td>Identify potential threats before significant damage</td>
<td>Understand who, what, when, where, and why of an incident</td>
</tr>
<tr>
<td>Automation</td>
<td>Relies heavily on automated tools and processes</td>
<td>More human-centric approach with deeper analysis</td>
</tr>
<tr>
<td>Decision Making</td>
<td>Trigger alerts and initiate pre-defined response plans</td>
<td>Requires nuanced analysis of evidence for complex decisions</td>
</tr>
</tbody>
</table>

- 

 

# Alerts

**How to group alerts in incident with respect to severity or entity in analytics rules?**

Select grouping alerts in to single incident if selected entities match

**Improve Incident Response with Alerting on Azure**

<https://docs.microsoft.com/en-us/learn/modules/incident-response-with-alerting-on-azure/7-exercise-activity-log-alerts>

<https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service/3-enable-and-configure-app-service-application-logging-using-the-azure-portal>

<https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service/5-view-live-application-logging-activity-with-the-log-streaming-service-using-azure-cli>

<https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service/7-retrieve-application-log-files-from-an-application-using-azure-cli-and-kudu>

<https://docs.microsoft.com/en-us/learn/modules/secure-aspnet-core-identity/4-customize-identity?pivots=sql>

<https://docs.microsoft.com/en-us/learn/modules/control-authentication-with-apim/3-exercise-create-subscriptions-in-apim> ** **

# Strategy

- **Identify the type of attack:** The first step in analysing a cyber-attack is to identify the type of attack that has occurred. This will help you understand the nature of the attack and the potential impact on your organization.

- **Gather information**: Once you have identified the type of attack, you should gather as much information as possible about the attack. This may include information about the attacker, the target, the method of attack, and any other relevant details.

- **Analyse the attack**: Once you have gathered all the relevant information, you should analyse the attack to determine how it was carried out and what vulnerabilities were exploited.

- **Contain the attack**: After analysing the attack, you should take steps to contain the attack and prevent further damage.

- **Assess the damage**: Once the attack has been contained, you should assess the damage that has been done and determine what data or systems have been compromised.

- **Report the attack**: Organizations should report the attack to the appropriate authorities and stakeholders.

# Tactics

- Check if malicious internal/external sites/connections still active?

- What are the DNS entries on an infected system?

- Is it possible to detect the first infected system(s)?

- Has the first systems hard drive been preserved?

- Do any scripts need to be ran on live infected systems?

- Does client have desktop management tool? If so, what reports are available to inventory all systems and statuses?

- List of all infected systems?

- Identify any patching missing with current and/or previous vulnerability scan.

- Look for systems that have stopped reporting into antimalware servers/vendors for updates?

- Look for systems that have stopped going to Update server or directly to Microsoft for updates.

- Assess compromised hosts to identify persistence mechanisms.

- If symptoms are spotted, then peoples/resources defined in “preparation” step will get in touch.

- Detect the incident, determine its scope, and involve the appropriate parties.

- Identify lateral movement techniques.

- Determine the techniques used by the adversary to access remote hosts.

- Identify the adversary’s level of credential access and/or privilege escalation.

- Identify the method of remote access, credentials used to authenticate, and level of privilege.

- If access is by legitimate but compromised application (e.g., RDP, VPN), identifies the method.

- Identify mechanism used for data exfiltration

- When did the problem occur or first come to your attention?

- What problem has been reported, and by whom?

- Have you received ransom requests?

- Have your customers noticed any problems? Can they use your services?

- Examine recently reported problems, intrusion detection alerts for system.

- A rootkit might hide the compromise from tools; trust your instincts if the system just does not feel right.

- Have there been any signs as to whether the problem has occurred internally within organisation or externally through supply chain?

- **False Positive**: Generated alarm is False. IDS shows alarm for legitimate network traffic.

- **False Negative:** Alarm not generated for malicious network traffic. IDS fails to identify malicious network traffic.

- Identify infected resources such as machine, network, credentials, keys, and secrets.

- Identify infected machine: Windows (Clients and servers), Linux (Distros), MacOS, Android and iPhone.

- Identify infected network: infected network devices (Routers, switches, etc), VPN, Cloud network, etc.

- Identify infected credentials: Users, groups, keys, secrets.

- Advanced analytics

- Incident Aggregation

- Forensic Analysis through log search

>  

**Tips: If you believe a compromise**

- Involve an incident response specialist for next steps and notify your manager.

- Do not panic or let others rush you.

- concentrate to avoid making careless mistakes.

- If stopping an on-going attack, unplug the system from the network

- Do not reboot or power down.

- Take thorough notes to track what you observed, when, and under what circumstances.

- After alert is detected, generate incident. Incident declaration:

  - Categorize the incident

  - Designate incident coordination lead,

  - If applicable notify CISA and law enforcement.

  <!-- -->

  - Investigation scope:

    - Identify the type and extent of the incident

    - Assess operational or informational impact on organization’s mission.

    - IR specialist initiates pre-defined response plan specific to the severity and type of the incident.

    - Complete initial scoping assessment to determine systems and data affected by the incident.

    - Tips for examining a suspect system to decide whether to escalate for formal incident response.

  - **Collect and preserve data necessary for:**

    - Incident verification,

    - Incident categorization

    - Incident prioritization

    - Incident mitigation

    - Incident reporting and attribution

    - Evidence collection: Log all evidence and note how, when and who acquired evidence.

  - **Perform Technical Analysis:**

    - Develop a technical and contextual understanding of the incident.

    - Update scope as investigation progresses and information evolves.

    - Report most recent findings and incident status to CISA.

    - Incident verification

    - Incident scope identification

    - Identification of methods of persistent access to the network.

    - Impact assessment

    - Goal of Cyber-attack: A hypothesis for the narrative of exploitation has been cultivated (TTPs and IOCs). Prepare a hypothesis of what the adversary was attempting to access/accomplish as per analysis and CTI.

    - All stakeholders are proceeding with a common operating picture.

  - **Incident Analysis:**

    - Advanced analytics

    - Incident Aggregation

    - Forensic Analysis through log search

  - **Identify anomalous activity**:

    - Assess affected systems and networks for subtleties of adversary behavior which often may look legitimate.

    - Identify deviations from established baseline activity - particularly important to identify attempts to leverage legitimate credentials and native capabilities and tools (i.e., living off the land techniques).

  - **Identify root cause and enabling conditions**:

    - Identify the root cause of the incident and collect threat information that can be used in further searches and inform subsequent response efforts. Identify and document the conditions that enabled the adversary to access and operate within the environment. Assess networks and systems for changes that may have been made to either evade defenses or facilitate persistent access Identify attack vector. This includes how the adversary accessing the environment (e.g., malware, RDP, VPN). Assess access (depth and breadth). This includes All compromised systems, users, services, and networks.

  - **Gather Incident Indicators:**

    - Review available CTI for precedent of similar activity.

    - Analyze adversary tools.

    - Assess tools to extract IOCs for short-term containment.

    - Identify and document indicators that can be used for correlative analysis on the network.

    - Share extracted threat information (atomic, computed, and behavioral indicators, context, and countermeasures) with internal response teams and CISA

  - **Analyze for Common Adversary TTPs:**

    - Identify initial access techniques (e.g., spear phishing, supply chain compromise) if access is facilitated by malware, identify associated command and control (e.g., identify port, protocol, profile, domain, IP address).

    - Identify the techniques used by the adversary to achieve code execution

  - **Validate and Refine Investigation Scope:**

    - Identify new potentially impacted systems, devices, and associated accounts.

    - Feed new IOCs and TTPs into detection tools.

    - Continue to update the scope and communicate updated scope to all stakeholders to ensure a common operating picture.

  - **Adjust/Finetune Tools:**

    - Tune tools to slow the pace of advance and decrease dwell time by incorporating IOCs to protect/detect specific activity.

    - Introduce higher-fidelity modifications to tools.

    - Tune tools to focus on tactics that must be used by the adversary to obtain operational objectives (e.g., execution, credential access, and lateral movement).

>  

## Cyber-attack analysis tactics:

- Are there any signs that data has been lost? Such as Ransom request or Data posted on internet.

<!-- -->

- Assess compromised hosts to identify persistence mechanisms.

<!-- -->

- Check if malicious internal/external sites/connections still active?

<!-- -->

- Determine the techniques used by the adversary to access remote hosts.

- Do any scripts need to be executed on live infected systems?

- Does client have desktop management tool? If so, what reports are available to inventory all systems and statuses?

- Examine recently reported problems, intrusion detection alerts for system.

- Forensic Analysis through log search

<!-- -->

- Has the first systems hard drive been preserved?

<!-- -->

- Have there been any signs as to whether the problem has occurred internally within organisation or externally through supply chain?

- Have you received ransom requests?

- Have your customers noticed any problems? Can they use your services?

<!-- -->

- Identify any patching missing with current and/or previous vulnerability scan.

<!-- -->

- Identify infected credentials: Users, groups, keys, secrets.

- Identify infected machine: Windows (Clients and servers), Linux (Distros), MacOS, Android and iPhone.

- Identify infected network: infected network devices (Routers, switches, etc), VPN, Cloud network, etc.

- Identify infected resources such as machine, network, credentials, keys, and secrets.

- Identify lateral movement techniques.

- Identify mechanism used for data exfiltration

- Identify the adversary’s level of credential access and/or privilege escalation.

- Identify the method of remote access, credentials used to authenticate, and level of privilege.

- If access is by legitimate but compromised application (e.g., RDP, VPN), identifies the method.

- If symptoms are spotted, then peoples/resources defined in “preparation” step will get in touch.

- Incident response specialists initiate pre-defined response plan specific to the severity and type of the incident.

<!-- -->

- Is it possible to detect the first infected system(s)?

<!-- -->

- Is the analyst report well structured, formatted, actionable and easy to read analyst report?

<!-- -->

- List of all infected systems?

<!-- -->

- Look at a listing of running processes or scheduled jobs for those that do not belong there.

- Look at contents of the hosts file for entries that do not belong there.

- Look at network configuration details and connections, note anomalous settings, sessions, or ports.

- Look at the list of users for accounts that do not belong or should have been disabled.

<!-- -->

- Look for systems that have stopped going to Update server or directly to Microsoft for updates.

- Look for systems that have stopped reporting into antimalware servers/vendors for updates?

<!-- -->

- Look for unusual files and verify integrity of OS and application files.

- Look for unusual programs configured to run automatically at system’s start time.

- Notify relevant stakeholders when the incident has been successfully remediated.

- Prepare after-action report documenting response process and distribute to appropriate personnel.

- Tips for examining a suspect system to decide whether to escalate for formal incident response.

- To retain attacker’s footprints, avoid taking actions that access many files or installing tools. Look at system, security, and application logs for unusual events.

- Use a network sniffer, if present on the system or available externally, to observe for unusual activity.

<!-- -->

- What are the DNS entries on an infected system?

<!-- -->

- What are the recommended detective countermeasures?

- What are the recommended most effective and low-cost countermeasures in relations to business risk? à

- What are the recommended preventative countermeasures?

- What are the recommended recovery countermeasures?

- What are the techniques, tactics, and procedures?

<!-- -->

- What information (if any) has been disclosed to unauthorised parties, deleted or corrupted?

<!-- -->

- What information has been deleted or corrupted by unauthorized parties?

<!-- -->

- What information has been disclosed to unauthorised parties, deleted, or corrupted?

<!-- -->

- What information has been disclosed to unauthorized parties?

- What is the alert/event context? IP/domain and File Hash

- What is the alert/event? Data Queries and message

- What is the Anomaly? Baseline system Behaviour and Degree of deviation of baseline

- What is the Application context? Business application function, app architecture

- What is the business impact?

- What is the business risk?

- What is the Data context? App data content, data classification

- What is the Network context? Network subnet, Virtual Network, Network architecture

<!-- -->

- **What is the potential business impact of the incident?** Stop the incident getting any worse, take a look at your security software (such as antivirus alerts and server/audit logs) to see if you are able to identify the specifics of the attack, and subsequently the cause of the incident. If you are unable to do this (but you know which device has been affected) run your antivirus program to complete a full scan9, and take notes of the results it gives you. If nothing is found, consider using an alternative antivirus program. Use the information you have gathered to look for advice online from trusted sources such as police or security websites. You may be able to find instructions there on how to fix the problem, although care should be taken before acting on unverified advice. In the case of internet outage, contact your ISP (using the details you have already identified in your incident plan) in the first instance; most will have pages that relate to service availability. You might learn that the outage is due to a fallen tree, rather than a DDoS attack. In addition, ensure that you understand your provider’s escalation process, and know what data they need to act on, and what type of SLA/support you have paid for.

<!-- -->

- What is the technical impact?

- What is the technical risk?

- What is the threat?

<!-- -->

- What problem has been reported, and by who?

- What services, programs or hardware are not working?

- When did the problem occur or first come to your attention?

- Who designed the affected system, and who maintains it?

<!-- -->

- Who is the user? User account

- Who is threat actor?

 

 

# Techniques

# Tools

## Incident Response Communications

**Objective**: Ensure secure, controlled communication during a security incident to prevent information leaks and maintain operational integrity.

**Secure Communication Guidelines**

1.  **Restrict Information Sharing**

    - **Do not disclose** incident details to anyone outside the authorized incident response team.

    - Share information **strictly on a need-to-know basis**.

2.  **Use Encrypted Channels**

    - Avoid sending **sensitive data** (logs, credentials, findings) over:

      - Unencrypted email

      - Instant messaging platforms (e.g., Slack, Teams) unless encryption is confirmed.

    - Prefer secure channels such as:

      - Encrypted email (e.g., PGP, S/MIME)

      - Enterprise collaboration tools with verified encryption.

3.  **Use Out-of-Band Communication When Needed**

    - If you suspect the **network is compromised** or monitored:

      - Use **out-of-band communication**, such as:

        - Non-VoIP (analog) phone calls

        - Secure mobile messaging with end-to-end encryption (e.g., Signal)

        - Physical in-person updates if necessary

**✅ Best Practices**

- Assume attackers may monitor compromised systems and internal networks.

- Avoid discussing incident details in channels that may be logged, monitored, or unsecured.

- Log all official communications related to the incident for audit and legal purposes—**in a secure system**.

# IAM 

- Look at IAM logs for unusual events.

- Look at user accounts that do not belong or should have been disabled.

- Who is the compromised user? User account

- Look at the list of users for accounts that do not belong or should have been disabled.

>  

## Investigating IAM attacks

 

**Verify suspicious accounts and their activities**

- Look for new or unexpected accounts in the Administrators group: \#lusrmgr.msc OR \#net user, \#net localgroup administrators

 

 

# Network

- Look at network configuration details and connections, note anomalous settings, sessions, or ports.

- Look at network logs for unusual events.

- Use network sniffer to observe for unusual activity.

- Check ARP and DNS settings

- What is the Network context? Network subnet, Virtual Network, Network architecture

- What is the alert/event context? IP/domain and File Hash

- Look at network configuration details and connections, note anomalous settings, sessions, or ports.

## Investigate Network Attacks

**How to decide if IP address is malicious?**

Determining if an IP address is malicious can be tricky, but there are some red flags to watch for and resources that can help

- **Signs of a Malicious IP:**

  - History of Malicious Activity: This is a key indicator. If the IP has been linked to malware distribution, phishing attempts, or denial-of-service attacks in the past, it's more likely to be malicious again.

  - Suspicious Location: Some regions are known for harbouring malicious actors. While location alone isn't definitive, it can be a factor.

  - Association with Malicious Domains: If the IP is linked to websites with bad reputations, that's a warning sign.

- **Resources to check IP reputation:**

  - IP Reputation Databases: Several online services track IP addresses and assign them reputation scores based on past activity. These are a good starting point. Some examples include AbuseIPDB and ThreatCrowd.

  - Security Software: Many firewalls and security suites incorporate IP reputation checking to identify and block suspicious connections.

- **Important to consider:**

  - IP Reputation Can Change: An IP address might be benign today but malicious tomorrow.

  - False Positives Exist: Not all flagged IPs are truly malicious. Use caution and look for multiple indicators.

- **If you're unsure:**

  - Err on the side of caution and avoid interacting with the IP address.

  - Report suspicious activity to the relevant authorities.

 

 

**Network traffic analysis**

- What operating system and type of device is on given IP addresses?

- Find MAC address from IP addresses, through MAC address find vendors or manufacturers of device.

- Find version of Operating system.

- Find user accounts used to login these devices. (Windows/Linux etc)

- What is the IP of machine that downloaded the executable file from internet over HTTP?

- What is the URL that returned the Windows executable file?

- What is the SHA256 file hash for that Windows executable file?

- What is the detection rate for that SHA256 hash on VirusTotal?

- What public IP addresses did that Windows host attempt to connect over TCP after the executable file was downloaded?

- What is the host name and Windows user account name used on that IP address

 

 

Test TLS versions

Test-TlsProtocols use this module, install on windows through \#Install-module Test-TlsProtocols

 

 

# Endpoint 

- Look at endpoint logs for unusual events.

- Look for unusual files and verify integrity of OS and application files.

- Look at contents of the hosts file for entries that do not belong there.

- Look for unusual programs configured to run automatically at system’s start time.

- Look for running processes or scheduled jobs for those that do not belong there.

- What services and programs are not working?

- Look for unusual files and verify integrity of OS and application files.

- Look for unusual programs configured to run automatically at system’s start time.

- Look at a listing of running processes or scheduled jobs for those that do not belong there.

- look at contents of the hosts file for entries that do not belong there.

## Windows

**Objective**: Conduct a safe and effective initial review of a potentially compromised Windows system. Avoid using tools or interfaces that modify metadata (e.g., Windows Explorer). Use the command-line wherever possible to preserve file access timestamps and forensic details.

**🔍 Examination Checklist**

**1. Event Logs**

- Open **Event Viewer** to examine system, application, and security logs:

  - Command: eventvwr.msc

  - Look for:

    - Failed logins or privilege escalation attempts.

    - Unexpected reboots or shutdowns.

    - Service start/stop anomalies.

    - Errors or warnings tied to core Windows components.

**2. Network Configuration and Activity**

**🧭 View Network Configuration**

- Command: ipconfig /all

- Review:

  - DNS servers.

  - DHCP vs. static configurations.

  - Gateway and subnet settings.

**🧷 Check ARP Table**

- Command: arp -a

- Look for:

  - Unexpected or static ARP entries.

  - Signs of ARP spoofing.

**📊 Routing Table**

- Command: netstat -nr

- Verify routes and look for unusual network paths.

**🔌 List Active Network Connections**

- Commands:

  - netstat -nao – Lists all connections with associated PIDs.

  - netstat -vb – Shows connections and the binaries that initiated them.

  - net session – Displays active sessions.

  - net use – Lists network shares in use.

- Analyze:

  - Outbound/inbound IPs and ports.

  - Connections to suspicious external hosts.

  - Connections tied to unusual processes.

**3. Users and Groups**

**👥 List Local Users and Groups**

- Commands:

  - lusrmgr.msc – GUI for managing users and groups.

  - net user – Lists local users.

  - net localgroup administrators – Lists local administrators.

  - net group administrators /domain – Lists domain admins (if joined to a domain).

- Investigate:

  - Unauthorized user accounts.

  - Unexpected users with elevated privileges.

**4. Persistence Mechanisms**

**⏰ Scheduled Tasks**

- Command: schtasks

- Look for:

  - Tasks that run suspicious executables or scripts.

  - Tasks set to run at logon or on idle.

**🚀 Auto-Start Programs**

- Command: msconfig or use Autoruns from Sysinternals.

- Check:

  - Startup items under "Startup" and "Services" tabs.

  - Registry Run keys and startup folders.

**5. Running Processes and Services**

**⚙️ List Running Processes**

- Commands:

  - taskmgr – GUI for processes.

  - wmic process list full – Full details via CLI.

- Review:

  - Process paths, command-line arguments.

  - Parent/child relationships.

  - Suspicious or unsigned executables.

**🛠️ List Running Services**

- Commands:

  - net start – Lists running services.

  - tasklist /svc – Shows services linked to each process.

- Check for:

  - Unexpected or rogue services.

  - Services running under unusual accounts.

**6. DNS Configuration and Host File Inspection**

**🌐 DNS Settings and Cache**

- Commands:

  - ipconfig /all – Check DNS server assignments.

  - ipconfig /displaydns – View current DNS resolver cache.

**📄 Inspect Hosts File**

- Command:

  - more %SystemRoot%\System32\Drivers\etc\hosts

- Look for:

  - Malicious redirections.

  - Unauthorized entries spoofing legitimate domains.

**7. File Integrity and Recent Changes**

**🔍 Verify Integrity of OS Files**

- Command: sigverif

- Purpose:

  - Checks integrity and digital signatures of critical system files.

  - Useful for detecting tampered or replaced binaries.

**🕵️‍♂️ Search for Recently Modified Files**

- Command:

- dir /a /o-d /p %SystemRoot%\System32

- Review:

  - Unusual or recently changed files in System32.

  - Rogue DLLs or executables.

⚠️ **Important**: Avoid using Windows Explorer, as it may update file access timestamps and obscure forensic evidence. Use **command-line tools only** for file system navigation and inspection.

**✅ Final Notes:**

- Document everything you observe (including output).

- Cross-reference findings with logs, threat intel, or known IOCs.

- Do not make changes unless authorized by incident response leadership.

- This checklist is meant for **initial triage only**—if compromise is likely, escalate immediately.

## Linux

**Objective**: Perform a safe, effective triage of a potentially compromised Unix/Linux system. Avoid making system changes or using tools that could alter file metadata or destroy evidence. Use command-line tools for investigation and document findings thoroughly.

**🔍 Examination Checklist**

**1. Event and System Logs**

**📁 Review Log File Directories**

- Common locations:

  - /var/log – Standard location for system, kernel, and application logs.

  - /var/adm – Legacy logging directory (used in older Unix systems like Solaris).

  - /var/spool – May contain queued jobs, email logs, or print queues.

- Look for:

  - Security violations.

  - Login/logout attempts.

  - Kernel and system errors.

  - Application-level alerts.

**🧑‍💻 List Recent Security and Login Events**

- Commands:

  - wtmp – Binary login record file; read using last.

  - who – Shows currently logged-in users.

  - last – Displays login history from wtmp.

  - lastlog – Shows last login for all users.

- Use to detect:

  - Unauthorized logins.

  - Suspicious user activity.

  - Unexpected remote sessions.

**2. Network Configuration and Activity**

**🧭 Examine Network Configuration**

- Commands:

  - arp -an – Displays current ARP cache (check for spoofed MAC/IP mappings).

  - route print or netstat -rn – Show routing table and gateway information.

**🔌 List Network Connections**

- Commands:

  - netstat -nap *(Linux)* – Active connections with PID and program info.

  - netstat -na *(Solaris)* – List all network connections.

  - lsof -i – Shows open files tied to network sockets (TCP/UDP).

- Look for:

  - Unusual open ports or IP connections.

  - Unknown services binding to interfaces.

  - Suspicious external connections.

**3. User Accounts and Access**

**👤 List User Accounts**

- Command:

  - more /etc/passwd

- Check for:

  - Suspicious or unauthorized accounts.

  - Shell access on system or service accounts.

**4. Persistence and Scheduled Jobs**

**⏰ Examine Scheduled Jobs**

- Commands:

  - more /etc/crontab – System-wide cron jobs.

  - ls /etc/cron.\* – Check cron.daily, cron.hourly, etc.

  - ls /var/at/jobs – View one-time at jobs.

- Look for:

  - Unexpected scripts or commands.

  - Jobs that invoke unknown binaries or contact external systems.

**🚀 Inspect Auto-Start Services**

- Commands:

  - chkconfig --list *(Linux)* – Lists services and runlevel configuration.

  - ls /etc/rc\*.d *(Solaris and SysV)* – Shows service start/stop scripts.

  - svcs -a *(Solaris 10+, SMF)* – Lists service management facility services.

- Investigate:

  - Non-standard or unauthorized services.

  - Services running under non-root users.

**5. Processes and Open Files**

**🧬 List Running Processes**

- Commands:

  - ps aux *(Linux, BSD)* – Detailed process list with user, CPU, memory.

  - ps -ef *(Solaris)* – Full process listing.

  - lsof +L1 – Lists deleted files still open by processes (possible covert persistence).

- Look for:

  - Rogue or unfamiliar processes.

  - Processes running from unusual directories (e.g., /tmp, /dev/shm).

  - High resource usage by unknown applications.

**6. DNS and Host Configuration**

**🌐 Check DNS Settings and Hosts File**

- Commands:

  - more /etc/resolv.conf – Shows configured DNS servers.

  - more /etc/hosts – Local name resolution entries.

- Look for:

  - Malicious DNS redirections.

  - Unauthorized domain overrides.

**7. File Integrity and Recent Changes**

**✅ Verify Package Integrity**

- Commands:

  - rpm -Va *(Linux – RPM-based distros)* – Verifies file integrity against installed RPMs.

  - pkgchk *(Solaris)* – Checks package integrity and file status.

- Purpose:

  - Detects modified or tampered files.

  - Useful for identifying replaced system binaries.

**🕵️‍♂️ Find Recently Modified Files**

- Commands:

  - ls -lat / – Lists top-level files sorted by most recent modification.

  - find / -mtime -2 -ls – Lists all files modified in the last 2 days.

- Be cautious:

  - This operation touches many files; avoid altering timestamps or attributes during inspection.

**✅ Final Notes:**

- Always use **command-line tools** to avoid modifying access times or metadata.

- Take thorough notes and timestamps for all observations.

- Preserve the system state — **do not reboot, kill processes, or modify files**.

- Escalate to the incident response team if compromise is suspected.

# Application 

- Look at application logs for unusual events.

- What is the Application context? Business application function, app architecture

# Data 

- What is the alert/event? Data Queries and message

- What information has been deleted or corrupted by unauthorised parties?

- What information has been disclosed to unauthorised parties?

- Look at data logs for unusual events.

- Are there any signs that data has been lost? (E.g., Ransom request or Data posted on internet)

- Has your data been posted on the internet?

- What is the Data context? App data content, data classification

## Investigating Data Breach

**How do I investigate data exfiltration alerts?**

I regularly get alerts in Microsoft Defender (not Sentinel) for data exfiltration to an app that has not been sanctioned.

In the alert get a date, the local IP address, the place the data ended up (as in AWS, or Azure Blob Storage etc), and the username. The most recent alert was for data exfiltration to Facebook. The end user said she was hungover Instagram surfing on her mobile phone, which does not explain the activity being on her laptop. Previously, it seems that long Teams calls may have been the culprit (if the end user is to be believed!). However, I would like to know WHAT was uploaded, WHERE from, HOW it was uploaded (e.g., using Teams, OneDrive, etc.) and HOW MUCH data was uploaded. Does anyone have any ideas on the best way to do this?

I am looking at a KQL query that maybe ties together DeviceNetworkEvents and DeviceEvents. Does that sound right?

I tried looking at the device timeline for the end user’s laptop and I can find the RemoteIP but I can’t clearly see what the upload activity was. Or would I be better using the Cloud Apps search queries?

 

**Device Timeline**: The device timeline is a good starting point. It provides a chronological view of activities on a device. Look for any unusual activity around the time of the alert. Look for any network connections made to the IP address or domain listed in the alert. This could indicate the application or process used for the data transfer.

**Advanced Hunting (Use KQL)** You can create a query that joins DeviceNetworkEvents and DeviceEvents to get more detailed information.

This query returns file creation events on devices that have network events with the specified remote IP address. Here’s a simple example:

> DeviceNetworkEvents
>
> \| join kind=inner (
>
> DeviceEvents
>
> \| where ActionType == "FileCreated"
>
> ) on DeviceId
>
> \| where RemoteIP == "\<IP Address\>"

**Or use more specific query to extract Remote IP/URL.**

DeviceNetworkEvents

> \| where RemoteIP == "\<IP Address\>" or RemoteUrl contains "\<Domain\>"
>
> \| join kind=inner (
>
> DeviceFileEvents
>
> \| where ActionType in ("FileCreated", "FileModified")
>
> ) on DeviceId, Timestamp
>
> \| project Timestamp, DeviceName, FileName, RemoteIP, RemoteUrl, ActionType

 

- **Cloud App Security**: If the data is being exfiltrated to a cloud service, Microsoft Cloud App Security can provide more insight. It can show you details about the data that was uploaded, including the user who uploaded it, the device they used, and the app they used to upload it. If the data is being exfiltrated to a cloud service like Facebook, you can use MCAS to investigate further. Look for any ‘sanctioned’ or ‘unsanctioned’ apps that the user has accessed. You can also check the ‘File’ and ‘Activity’ logs in MCAS for any unusual upload activity.

- **Alert Details**: Review the details of the alert. It should provide information about the user, device, and app involved in the potential data exfiltration. In the alert details, look for the ‘Evidence’ section. This will list the specific events that triggered the alert. You can also check the ‘Process tree’ visualization in the alert page to see the chain of events leading up to the alert.

 

 

# Social engineering

**How to decide if email id is malicious?**

Here are some red flags to watch out for that can help you decide if an email ID is malicious:

- **Sender's Email Address:**

  - **Mismatched Name and Address:** Does the sender name seem like a legitimate business or person, but the email address doesn't match (e.g., \[email address removed\] instead of @\[invalid URL removed\])? This is a classic spoofing tactic.

  - **Generic Email Domains:** Reputable companies typically use their own domain name for emails (e.g., \[email address removed\]). Be wary of addresses ending in @gmail.com, @yahoo.com, etc., especially if they claim to be from a bank or other official source.

  - **Typos and Misspellings:** Legitimate companies usually have professional email addresses. Typos and strange spellings in the email address can be a sign of a scam.

- **Content of the Email:**

  - **Urgency and Threats:** Phishing emails often create a sense of urgency or pressure you to act quickly. They might threaten to close your account, suspend service, or take legal action if you don't respond immediately.

  - **Generic Greetings:** Does the email address you by name, or use generic greetings like "Dear Customer" or "Dear User"? Legitimate companies often have access to your name for personalized greetings.

  - **Poor Grammar and Spelling:** Many phishing emails contain grammatical errors, typos, and awkward phrasing.

  - **Suspicious Links and Attachments:** Refrain from clicking on links or opening attachments in emails from unknown senders. Hover over the link to see if the actual URL matches what's displayed in the text. Don't download attachments you weren't expecting.

> **Additional Tips:**

- **Be Wary of Unexpected Emails:** If you receive an email from a seemingly legitimate source you don't normally interact with, be cautious.

- **Verify Sender Through Separate Channel:** If the email claims to be from a bank or other company, contact them directly through a phone number or website you know is genuine, don't use the information provided in the email.

- **Don't Give Out Personal Information:** Legitimate companies won't ask for sensitive information like passwords or social security numbers through email.

>  
>
> By following these tips, you can significantly reduce the risk of falling victim to a malicious email. If you're ever unsure, it's always best to err on the side of caution and delete the email.

# New

**Cyber Threat Investigations – Strategy, Tactics, Techniques, and Tools**

Related alerts are aggregated together to form **incidents**.\
Incidents provide the broader operational context of an attack, while individual alerts remain valuable for deep technical analysis, root-cause identification, and hypothesis validation.

Cyber-threat investigations aim to understand **what happened, how it happened, who or what was responsible, what was affected, and how to prevent recurrence**.

## Investigating a Suspicious Activity Alert

### 1. Access the Alert

- Log in to the **Microsoft Defender portal**.

- Navigate to the **Incidents & Alerts** section.

### 2. Analyze the Alert Details

a\. Identify the specific alert to investigate.\
b. Understand the alert’s description and triggering detection logic.\
c. Review the **timeline of events** and any related alerts leading up to the suspicious activity.\
d. Examine the **summary section**, including:

- Severity and confidence level

- Impacted devices

- Involved users or service accounts

- Timestamp and duration of activity

- MITRE ATT&CK mappings (if available)

### 3. Investigate Further

a\. **Evidence and Response Section**:

- Review suspicious entities such as:

  - Files and hashes

  - Processes and command lines

  - Registry modifications

  - IP addresses, domains, and URLs

  - Network connections

  - User accounts and authentication events

- Check remediation actions already taken by Defender.

- Validate automated responses and rollback if required.

## Investigation Objectives

**Primary Objective:**\
Determine the root cause of a confirmed security incident, gather defensible evidence, and develop a mitigation and prevention plan.

**Core Investigation Phases**

1.  **Verification**

    - Confirm whether the activity represents a true incident.

    - Determine the scope.

    - Analyze logs, telemetry, and alerts.

    - Collect forensic data.

    - Interview users or administrators when necessary.

2.  **Root Cause Analysis**

    - Identify vulnerabilities exploited.

    - Determine the attacker’s **tactics, techniques, and procedures (TTPs)**.

    - Identify the initial point of entry.

3.  **Timeline Reconstruction**

    - Build a detailed sequence of events.

    - Trace attacker actions from initial access through impact.

    - Correlate logs across endpoints, identity systems, networks, and cloud workloads.

4.  **Impact Assessment**

    - Identify compromised systems, data, users, and services.

    - Determine business and regulatory impact.

    - Assess operational disruption.

5.  **Evidence Preservation**

    - Secure logs, disk images, memory captures, and network traces.

    - Maintain chain of custody.

    - Store evidence in a forensically sound repository.

6.  **Containment and Eradication**

    - Isolate affected systems.

    - Disable compromised accounts.

    - Block malicious IPs/domains.

    - Remove malware and persistence mechanisms.

    - Patch exploited vulnerabilities.

7.  **Incident Reporting and Documentation**

    - Record:

      - Detection method

      - Timeline

      - Scope

      - Root cause

      - Actions taken

      - Lessons learned

    - Prepare reports for leadership, regulators, and auditors.

8.  **Recovery**

    - Restore systems from clean backups.

    - Rebuild compromised hosts when necessary.

    - Harden configurations.

    - Deploy additional monitoring controls.

    - Validate environment integrity before returning to production.

# Accountability in Incident Resolution

- **Automatic alert assignment:** Assign incidents based on predefined rules to ensure ownership and accountability.

- **Incident status tracking:** Track open, closed, and on-hold incidents to monitor progress and identify bottlenecks.

- **Detailed note taking:** Maintain comprehensive notes to preserve investigative context and support hand-offs between analysts.

- **Streamlined integration:** Integrate incident management with ITSM/help-desk platforms for coordinated remediation.

- **Categorize the incident** by type, severity, and business impact.

- **Designate an incident coordination lead.**

- **If applicable, notify CISA and law-enforcement authorities** according to regulatory and contractual obligations.

# Resources Required for Incident Investigation

The following resources are essential and complement each other:

**Port Lists**

- Common ports used for legitimate applications.

- Common ports used by Trojans and malware families to identify suspicious traffic.

**Documentation**

- Operating system references.

- Application documentation.

- Security tool documentation (firewalls, antivirus, IDS/IPS, EDR).

- Cloud-provider security architecture.

**Network Diagrams and Critical Asset Lists**

- Visualize network topology.

- Identify trust boundaries.

- Locate sensitive systems such as domain controllers and databases.

**Baseline Activity**

- Normal authentication patterns.

- Typical network throughput.

- Standard application behaviour.

- Helps detect anomalies and deviations.

**Cryptographic Hashes**

- Known-good hashes of critical files.

- Enable rapid integrity verification.

- Support malware identification.

**Security Logs**

- Endpoint logs.

- Firewall and proxy logs.

- Identity and authentication logs.

- Cloud activity logs.

- SIEM telemetry.

**Forensic Tools**

- Disk imaging tools.

- Memory acquisition tools.

- Malware analysis sandboxes.

- Timeline analysis utilities.

**Threat Intelligence Feeds**

- Indicators of compromise (IOCs).

- Malware campaigns.

- Adversary infrastructure.

- Known TTPs and actor profiles.

**Incident Response Plan**

- Roles and responsibilities.

- Escalation paths.

- Communication templates.

- Regulatory notification procedures.

- Recovery workflows.

# Investigation Strategy

- **Identify the type of attack:** Malware, ransomware, credential compromise, insider threat, web exploitation, supply-chain compromise, cloud abuse, etc.

- **Gather information:** Collect telemetry about the attacker, targets, methods, tools, infrastructure, and timeline.

- **Analyze the attack:** Determine how it was executed and what weaknesses were exploited.

- **Contain the attack:** Prevent further spread or damage.

- **Assess the damage:** Identify impacted data, systems, and users.

- **Report the attack:** Notify leadership, legal, compliance, customers, regulators, and authorities as required.

## Collect and Preserve Data

- Collect and preserve data for:

  - Verification

  - Categorization

  - Prioritization

  - Mitigation

  - Reporting

  - Legal or regulatory evidence

- Log:

  - What evidence was collected

  - When it was collected

  - Who collected it

  - How it was acquired

  - Storage location and integrity controls

## Identify Root Cause and Vulnerabilities

- Determine the root cause.

- Collect threat intelligence for follow-on hunting.

- Identify environmental weaknesses.

- Document conditions that enabled access.

- Assess systems for:

  - Defense evasion

  - Persistence

  - Backdoors

  - Configuration changes

- Identify the attack vector:

  - Malware

  - RDP abuse

  - VPN compromise

  - Phishing

  - Web vulnerabilities

- Assess access depth and breadth:

  - All compromised hosts

  - Users

  - Service accounts

  - Networks

  - Cloud resources

## Analyze for Common Adversary TTPs

- Identify **initial access** techniques:

  - Spear phishing

  - Exploits

  - Supply-chain compromise

- If malware is involved:

  - Identify command-and-control channels:

    - Ports

    - Protocols

    - Domains

    - IP addresses

    - Profiles

- Identify techniques used for:

  - Code execution

  - Persistence

  - Privilege escalation

  - Credential dumping

- Identify lateral movement methods:

  - SMB

  - RDP

  - PsExec

  - WinRM

  - SSH

- Determine:

  - Credential theft methods

  - Privilege level obtained

  - Authentication methods used

- Identify:

  - Remote access tools

  - Abuse of legitimate applications

- Identify **data exfiltration mechanisms**:

  - Cloud storage abuse

  - HTTPS uploads

  - DNS tunneling

  - SFTP

  - API abuse

## Adjust and Tune Security Tools

- Incorporate new IOCs into:

  - SIEM

  - EDR

  - Firewalls

  - Email security

  - DNS filtering

- Tune detections to:

  - Reduce dwell time

  - Detect pre-impact activity

  - Focus on high-fidelity adversary behaviors

- Create detections around:

  - Execution

  - Credential access

  - Lateral movement

  - Persistence

  - Command-and-control

## Practical Tips

- Trust your instincts—if a system does not feel right, investigate further.

- Avoid prematurely closing incidents.

- Preserve evidence before making changes.

- Communicate clearly with stakeholders.

- Document every action taken.

- Conduct post-incident reviews and tabletop exercises.

- Feed lessons learned back into security architecture, monitoring, and training.

------------------------------------------------------------------------

# Cyber Threat Investigations – Categorized Framework

------------------------------------------------------------------------

**1. Alerts, Incidents, and Context**

- Related alerts are aggregated together to form **incidents**.

- Incidents provide the broader context of an attack.

- Individual alerts remain valuable for deep technical analysis and root-cause identification.

------------------------------------------------------------------------

**2. Suspicious Activity Alert Investigation Process**

**Accessing the Alert**

- Log in to the Microsoft Defender portal.

- Navigate to **Incidents & Alerts**.

**Analyzing Alert Details**

- Identify the specific alert.

- Understand the alert context.

- Review the timeline of events and related alerts.

- Check the summary section:

  - Severity

  - Impacted devices

  - Users

  - Time of activity

  - MITRE ATT&CK mappings (if available)

**Deep Investigation**

- Review the **Evidence and Response** section:

  - Files and hashes

  - Processes and command lines

  - Registry changes

  - IP addresses, domains, URLs

  - Network connections

  - Accounts involved

- Validate automated remediation.

------------------------------------------------------------------------

**3. Investigation Objectives**

- Determine the root cause.

- Gather defensible evidence.

- Develop mitigation and prevention plans.

------------------------------------------------------------------------

**4. Core Incident Investigation Phases**

**Verification**

- Confirm the incident.

- Analyze logs and telemetry.

- Collect forensic artifacts.

- Interview witnesses.

**Root Cause Analysis**

- Identify vulnerabilities.

- Determine attacker TTPs.

- Identify initial access.

**Timeline Reconstruction**

- Establish sequence of events.

- Correlate telemetry across platforms.

**Impact Assessment**

- Determine business, regulatory, and operational impact.

**Evidence Preservation**

- Maintain chain of custody.

- Secure artifacts.

**Containment and Eradication**

- Isolate systems.

- Disable accounts.

- Remove persistence.

- Patch vulnerabilities.

**Incident Reporting & Documentation**

- Document findings and actions.

- Produce executive and regulatory reports.

**Recovery**

- Restore systems.

- Harden defenses.

- Deploy monitoring.

------------------------------------------------------------------------

**5. Accountability and Governance**

- Automatic alert assignment.

- Incident status tracking.

- Detailed notes.

- ITSM integration.

- Incident categorization.

- Incident lead designation.

- Regulatory notifications (CISA/law enforcement when applicable).

------------------------------------------------------------------------

**6. Resources Required for Investigation**

**Reference Materials**

- OS, application, and security-tool documentation.

**Port Intelligence**

- Legitimate application ports.

- Trojan and malware ports.

**Architecture Assets**

- Network diagrams.

- Critical asset lists.

**Operational Baselines**

- Normal system and network behavior.

**File Integrity Controls**

- Cryptographic hashes.

**Security Logs**

- Endpoint, identity, firewall, proxy, cloud logs.

**Forensic Capabilities**

- Disk and memory acquisition.

- Malware analysis tools.

**Threat Intelligence**

- IOC feeds.

- Actor profiles.

**Incident Response Plan**

- Escalation paths.

- Communication templates.

------------------------------------------------------------------------

**7. Investigation Strategy**

- Identify attack type.

- Gather intelligence.

- Analyze attacker methods.

- Contain activity.

- Assess damage.

- Report incident.

------------------------------------------------------------------------

**8. Data Collection and Preservation**

- Collect for verification, mitigation, and legal use.

- Log:

  - Who collected

  - What

  - When

  - How

  - Storage method

------------------------------------------------------------------------

**9. Root Cause and Vulnerability Identification**

- Identify conditions enabling access.

- Document weaknesses.

- Assess evasion and persistence.

- Identify attack vectors:

  - Malware

  - RDP

  - VPN

- Assess depth and breadth:

  - Hosts

  - Accounts

  - Networks

  - Cloud workloads

------------------------------------------------------------------------

**10. Adversary TTP Analysis**

- Initial access techniques.

- Malware C2 profiling.

- Execution techniques.

- Persistence mechanisms.

- Privilege escalation.

- Lateral movement.

- Remote-access abuse.

- Data-exfiltration methods.

------------------------------------------------------------------------

**11. Security Tool Tuning and Improvement**

- IOC ingestion.

- Detection engineering.

- Behavior-based tuning.

- Dwell-time reduction.

- ATT&CK-focused analytics.

------------------------------------------------------------------------

**12. Operational Tips and Best Practices**

- Trust instincts.

- Preserve before remediation.

- Communicate clearly.

- Document actions.

- Conduct lessons-learned reviews.

- Feed findings back into security controls.

------------------------------------------------------------------------
