# Introduction

**Security Operations Center (SOC):** A team responsible for monitoring, detecting, and responding to cyber threats.

**Core Components:**

- **People:** Security analysts, incident responders, and other security professionals.

- **Processes:** Incident response plans, threat hunting methodologies, and security operations procedures.

- **Tools:** SIEM, XDR, SOAR, CSPM, and CASB.

- **Intelligence:** Threat intelligence to understand the threat landscape.

- **Real-World Experience:** Practical knowledge of cyber threats.

**SOC Responsibilities:**

- Monitoring IT resources for threats.

- Detecting and containing incidents.

- Remediating threats.

- Utilizing threat intelligence for analysis and response.

**SOC Challenges:**

- **People:** Lack of qualified personnel, limited access to decision-makers.

- **Processes:** Insufficient incident response plans, unclear procedures.

- **Technology:** Outdated or inadequate tools, insufficient network visibility.

- **Information:** Limited access to critical business information, dependencies.

**SOC Essential Elements:**

- **Roles and Responsibilities:** Clearly defined roles for SOC team members.

- **Incident Response Plan:** Detailed plan for handling security incidents.

- **Documentation:** Comprehensive documentation of processes and procedures.

- **Timeline:** Defined recovery time objectives (RTOs).

- **Communication:** Effective communication channels for internal and external stakeholders.

- **SOC Engineer Kit:** Essential tools and resources for SOC team members.

- **Incident Analysis Resources:** Tools and techniques for analysing security incidents.

- **Incident Prevention:** Strategies for preventing future incidents.

**Key Points:**

- SOCs are crucial for protecting organizations from cyber threats.

- A well-functioning SOC requires a combination of people, processes, tools, intelligence, and real-world experience.

- Addressing challenges related to people, processes, technology, and information is essential for effective SOC operations.

- A comprehensive incident response plan and clear communication strategies are crucial for successful incident management.

 

## Concepts

- **Antimalware/Antivirus:** Protects systems from malware and spam.

- **Blue Team:** Defensive cybersecurity team.

- **Clipping Levels/Thresholds:** Determines when events are logged based on frequency.

- **Countermeasure:** Actions to reduce system vulnerability.

- **Cyber Security Event:** Any change in a system that might impact operations.

- **Cyber Security Incident:** A harmful cyber security event.

- **Data Backups:** Regular backups are crucial for recovery.

- **Employee Awareness:** Educating employees is key to preventing attacks.

- **Event Aggregation:** Combining similar log entries for analysis.

- **Exfiltration:** Unauthorized data transfer.

- **Incident Response Management:** Overseeing the incident response process.

- **Incident Response Plan:** A documented procedure for handling incidents. Outlines procedures for responding to incidents.

- **Incident Response:** A structured approach to handling security incidents. IR is the process of detecting, containing, and recovering from an incident.

- **Incident:** Any event that threatens system integrity or security policies.

- **Indicator of Compromise (IOC):** Evidence of a potential compromise.

- **Intrusion Detection and Prevention System (IDPS):** Protects against network attacks.

- **Log Analysis:** Examining logs for suspicious activity.

- **Log Clearing:** Removing old log entries.

- **Log Management:** The overall process of handling logs.

- **Log Normalization:** Standardizing log formats for analysis.

- **Log:** A record of system events.

- **Maximum Tolerable Downtime (MTD):** Acceptable system downtime without significant impact.

- **Sanitization:** Permanently erasing data from storage media.

- **Security Engineering:** Implements technical security controls.

- **Security Incident:** A significant security event requiring further investigation.

- **Security Software:** Anti-malware, anti-spam, and IDPS are essential tools for protection.

- **SIEM** is a program that provides centralized logging capabilities for a variety of log types.

**You see a user logging in as root to perform basic functions. Is this a problem?**

**What is the triad of security operations?** People (Training, and on job experience), Process (Preparation, Identification, Containment, Eradication, Recovery, and Lessons Learned), and Technology (Endpoint, NetFlow, Network monitoring, threat intel, Forensics, and Incident management).

**What should you do after you suspect a network has been hacked?**

# Components

An SOC is a dedicated team that monitors an organization's IT infrastructure for security threats.

Here is a breakdown of its essential components:

**People:** The human element, including analysts, responders, and management.

**Processes:** The defined steps and workflows for incident handling.

**Tools:** The technology used for monitoring, detection, analysis, and response.

**Intelligence:** Threat information used to understand and counter threats.

People

- **IR Team (Incident Response):** Handles security incidents, investigating and remediating them.

- **Technical Experts:** Possess deep knowledge of security tools and technologies for analysis and response.

- **Decision-Makers:** Provide quick approvals during security incidents.

- **Key Management Personnel:** Involved in critical decisions and communication during incidents.

Processes

- Defined procedures for handling various security situations.

- Outlines the steps to take (what), how to perform them (how), when each step occurs (when), and who is responsible (who).

Tools

- Network security tools for monitoring traffic and detecting suspicious activity.

- Security software for vulnerability scanning, malware detection, and endpoint protection.

- Forensic analysis tools for in-depth investigation of security incidents.

Intelligence

- Threat intelligence feeds that provide real-time information about current threats and vulnerabilities.

- Knowledge of attacker tactics, techniques, and procedures (TTPs).

**Additional points:**

- **Incident Response Plan:** A documented roadmap for responding to security incidents.

- **Documentation:** Clear instructions and procedures for SOC personnel.

- **Timeline - Recovery Time Objective (RTO):** Defines the acceptable time to restore critical systems after an incident.

- **SOC Communication/Notification:** Plans for internal and external communication during incidents.

- **SOC Engineer Kit:** Essential tools and resources readily available for SOC personnel.

- **Incident Analysis Resources:** Tools and techniques for investigation and analysis.

- **Incident Prevention:** Strategies and practices to minimize the likelihood of security incidents.

**SOC Components**

**Incident Response**

- **Core Activities:** Detection, containment, eradication, recovery, and lessons learned.

- **Preparation:** Building the foundation for effective incident response.

- **Process Development:** Creating detailed procedures for incident handling.

- **Tool Utilization:** Leveraging technology for incident investigation and response.

In essence, a SOC relies on a combination of people, processes, and technology to effectively manage and respond to cyber security incidents.

# People

**SOC Manager:**

- Oversees the overall operations and leadership of the SOC.

- Manages the SOC team and ensures efficient workflow.

**Security Analyst Tier 1:**

- Triages and prioritizes alerts received from the SIEM or other security tools.

- Escalates critical incidents to Tier 2 analysts.

**Security Analyst Tier 2:**

- Investigates and responds to escalated incidents.

- Identifies affected systems and the scope of the attack.

- Uses threat intelligence to understand the adversary.

**Security Analyst Tier 3:**

- Proactively hunts for advanced threats and vulnerabilities.

- Conducts security assessments and penetration testing.

- Identifies areas of weakness in the organization's security posture.

**Security Architect:**

- Designs the overall security architecture of the organization.

- Integrates various security technologies and processes.

- Ensures alignment with business objectives and compliance requirements.

**Compliance Auditor:**

- Monitors adherence to internal and external security regulations.

- Conducts audits and assessments to identify compliance gaps.

- Provides recommendations for improving compliance posture.

**SIEM Engineer:**

- Manages and maintains the Security Information and Event Management (SIEM) system.

- Configures rules and alerts to detect security threats.

- Analyzes SIEM data to identify trends and anomalies.

VAPT Engineer

**Core Responsibilities:**

- **Vulnerability Management:**

  - Identify, assess, and remediate vulnerabilities.

  - Maintain vulnerability databases and tracking systems.

  - Create remediation scripts and patches.

- **Penetration Testing:**

  - Conduct penetration tests on various systems (Windows, Linux, containers, Azure).

  - Utilize tools like NMAP, Wireshark, BurpSuite, PowerShell, and Metasploit.

  - Assess security posture and identify weaknesses.

- **Security Posture Maintenance:**

  - Monitor and improve the security of Azure platforms.

  - Identify and remediate vulnerabilities using security tools.

  - Interact with third-party MSSPs for enhanced security.

**Required Skills and Experience:**

- **Technical Proficiency:**

  - Experience with vulnerability scanners, management systems, and security tools.

  - Knowledge of Windows, Unix, and malware security.

  - Familiarity with patch management and host-based security.

- **Intelligence and Research:**

  - Ability to use open-source intelligence for vulnerability research.

  - Understanding of the cyber kill chain.

- **Communication and Collaboration:**

  - Effective communication with stakeholders and third-party providers.

  - Ability to work collaboratively in a team environment.

**Note:** The list above is a comprehensive summary of the roles and responsibilities of a VAPT engineer. Specific requirements may vary depending on the organization and the scope of the role.

 

Security Researcher (Microsoft Defender)

 

Malware Analyst 

**Technical Skills and Experience**

- **Malware Analysis:** Proficiency in malware detonation engines, analysis tools, and techniques.

- **Lab Management:** Experience in managing and maintaining isolated malware analysis labs.

- **Static and Dynamic Analysis:** Ability to build and implement static and dynamic analysis services for malware detection.

- **Cross-Discipline Collaboration:** Effective communication and collaboration with other security teams.

- **Programming Languages:** Strong proficiency in Python, x86/x64 Assembly Language, and C/C++ constructs.

- **Reverse Engineering:** Expertise in reverse engineering techniques, tools (Debugger, IDA PRO), and file formats (PE, OLE).

- **Network Protocols and File Formats:** Understanding of network protocols, file formats, sandboxes, and hardware/firmware internals.

- **Code Review and Vulnerability Identification:** Ability to review code for abuse patterns and identify vulnerabilities.

- **Research and Innovation:** Conduct research to advance malware protection and develop new detection strategies.

- **Threat Intelligence:** Investigate and analyze security incidents and attacker techniques.

- **Partner Collaboration:** Foster and maintain partnerships with internal and external teams.

- **Teamwork:** Collaborate with researchers, coordinators, and developers to improve product protection.

**Specific Requirements**

- **Experience:** At least 3+ years of experience in computer security, with a focus on reverse engineering and Linux security.

- **Linux Expertise:** Knowledge of Linux OS internals, security problems, and offensive security research.

- **Malware Analysis:** Experience in Windows malware analysis and a keen interest in threats on other platforms.

- **Reverse Engineering:** Proficiency in reverse engineering techniques on Linux, including debuggers, disassemblers, network protocols, file formats, sandboxes, and hardware/firmware internals.

- **Development:** Skills in C, C++, and scripting languages (e.g., Python, bash).

- **MITRE Framework:** Knowledge of the MITRE framework, test methodology, and data analytics for security.

- **Communication:** Ability to present research findings in public settings and contribute to the security ecosystem through papers, presentations, and blogs.

- **Digital Forensics:** Practical experience analyzing Windows and Linux artifacts from digital forensics and incident response.

- **Obfuscation Techniques:** Knowledge of packers and obfuscation techniques and experience in defeating anti-analysis techniques.

- **Cloud Security:** Understanding of cloud security events, forensic isolation, and mitigation processes.

**Additional Notes**

- **Duplicate information** has been removed from the list.

- **Missing information** related to cloud security and forensic investigation has been added.

- The provided summary is concise and comprehensive, covering the key roles and responsibilities of a malware analyst.

SOC Analyst

**Core Responsibilities:**

- **Incident Response:** Manage the entire lifecycle of incident response and investigation.

- **Threat Detection:** Implement threat protection and respond to security incident escalations for Azure Cloud.

- **SIEM/SOAR:** Manage SIEM alerts and dashboards using tools like Microsoft Sentinel and Splunk.

- **XDR:** Utilize Microsoft 365 Defender for XDR capabilities.

- **Compliance:** Understand and adhere to Microsoft Purview Compliance requirements.

- **Azure Monitoring:** Utilize Azure Monitor for cloud monitoring.

**Technical Skills:**

- **Tools:** Proficiency in SIEM tools (Microsoft Sentinel, Splunk), SOAR platforms, XDR solutions, and Azure monitoring tools.

- **Technologies:** Understanding of cloud security (Azure), endpoint data collection, and network security concepts.

- **Frameworks:** Knowledge of NIST Incident Response, Cyber Kill Chain, MITRE ATT&CK, and IOCs.

- **Analytics:** Experience in data analytics, pattern analysis, and threat hunting.

**Additional Skills:**

- **Problem-solving:** Ability to investigate security incidents and find patterns to improve detection.

- **Communication:** Effective communication skills to coordinate investigations and report incidents.

- **Collaboration:** Ability to work with teams and provide escalation support.

- **Continuous learning:** Stay updated on tools, best practices, and threat actor TTPs.

**Key Areas of Focus:**

- **Proactive Security:** Implement threat hunting and threat modeling.

- **Data Analysis:** Develop and enhance data analytics pipelines.

- **Metrics:** Assess detection quality and improve in real time.

- **Threat Understanding:** Understand attacker mindset and apply defensive tactics.

By combining these responsibilities, skills, and areas of focus, a SOC Analyst can effectively contribute to an organization's security posture.

 

Threat Hunter / Intelligence

**Core Responsibilities:**

- **Threat Hunting:** Conduct proactive searches for threats using advanced analytics and detection techniques.

- **Intelligence Analysis:** Gather, analyze, and interpret threat intelligence to identify emerging threats and trends.

- **Detection Development:** Design and implement automated detection and hunting analytics to identify suspicious activity.

- **Dashboard Creation:** Develop dashboards and reports to visualize potential threats and anomalous behavior.

**Required Skills and Knowledge:**

- **Cybersecurity Expertise:** Deep understanding of cybersecurity trends, hacking techniques, attack vectors, and exploitation methods.

- **Technical Skills:** Proficiency in Kusto Query Language, threat detection tools, and data analysis techniques.

- **Analytical Thinking:** Ability to identify patterns, trends, and anomalies in large datasets.

- **Problem-Solving:** Strong problem-solving skills to address complex security challenges.

- **Collaboration:** Ability to work effectively with teams and collaborate with partners.

**Additional Responsibilities:**

- **Threat Modeling:** Assess security implications and requirements for new technologies.

- **Research:** Conduct research on emerging threats and develop new detection mechanisms.

- **Tool Development:** Build hunting tools and automations to enhance threat detection.

**Key Competencies:**

- **Curiosity:** A strong desire to learn and explore new threats.

- **Adaptability:** Ability to adapt to rapidly changing threat landscapes.

- **Attention to Detail:** Meticulous approach to data analysis and investigation.

- **Communication:** Effective communication skills to convey findings and recommendations.

**Note:** This summary incorporates the key responsibilities, skills, and knowledge required for a Threat Hunter / Intelligence role. It is essential to tailor the specific requirements based on the organization's needs and the candidate's experience level.

 

 

GRC Consultant / Information Security Analyst

- **Security Assessments and Compliance:**

  - Conduct vulnerability scanning, penetration testing, and risk assessments.

  - Ensure compliance with regulations like SOX, CCPA, PCI DSS, GDPR, and relevant standards.

  - Participate in cybersecurity assessments using frameworks like NIST, ISO 27000, and CIS.

  - Monitor system compliance with cloud security frameworks.

  - Review IT General Controls (ITGC) in Azure Cloud environments.

  - Advise on Business Continuity Planning (BCP) and Disaster Recovery (DR) planning.

- **Information Security Management:**

  - Implement and maintain ISO 27001-based Information Security Management System (ISMS).

  - Develop and implement information classification frameworks.

  - Conduct vendor risk assessments.

  - Assist clients with information security controls, including change management, incident management, backup, user access, antivirus, and physical security.

  - Develop information assets inventory and classification.

- **Cybersecurity Strategy and Awareness:**

  - Develop and implement cyber risk culture and educate employees on threat awareness.

  - Assist organizations in determining risk tolerance and identifying key business risks.

  - Address third-party and regulatory compliance risks related to distributed networks.

  - Provide cybersecurity expertise in analyzing, assessing, and developing security solutions.

- **Technical Expertise:**

  - Stay updated on IT risk and compliance.

  - Have knowledge of eGRC tools like Archer and ZenGRC.

  - Understand cybersecurity trends, hacking techniques, and insider risk management.

  - Have experience with rapid prototyping, evaluation, and iterative improvement.

  - Research and report on current trends in cybercrime and cybersecurity.

- **Information Security Analyst Specific:**

  - Ensure data confidentiality, integrity, and availability.

  - Implement security controls to protect endpoints, networks, and applications.

  - Plan, design, and implement BCP and DR plans.

  - Ensure governance, risk assessment, and compliance of information systems.

  - Recommend security enhancements.

  - Conduct information security awareness training.

  - Have experience working in a client-servicing model.

  - Configure and operate Microsoft 365 Defender and Compliance solutions.

  - Understand phishing, social engineering, CASB, and DLP programs.

  - Have knowledge of leading compliance standards like PCI, HIPAA, NIST, GDPR, CIS, and SOC 2.

  - Provide cybersecurity expertise for Azure platform security.

**In summary, a GRC Consultant / Information Security Analyst is responsible for ensuring an organization's information security, compliance with regulations, and effective risk management.** They play a crucial role in protecting sensitive data, preventing security breaches, and mitigating risks.

 

 

# Processes

An SOC is responsible for the ongoing security of an organization's IT infrastructure.

Here is a breakdown of its key processes:

**Incident Management:**

- Defines a structured approach for identifying, containing, eradicating, and recovering from security incidents.

- Involves activities like investigation, threat analysis, containment, and remediation.

**2. Threat Hunting:**

- Proactively searches for hidden threats within the network.

- Utilizes techniques like security tools, threat intelligence, and manual analysis to identify potential threats.

**3. Risk Management (Threat & Vulnerability):**

- Focuses on identifying, analysing, and prioritizing security vulnerabilities within the IT environment.

- Aims to mitigate potential risks before they can be exploited by attackers.

**4. Security Engineering:**

- Involves designing, implementing, and maintaining security controls to protect the organization's IT infrastructure.

- Includes tasks like system hardening, vulnerability scanning, and security device configuration.

**Additional Processes:**

- **Incident Response Timeline:** Defines the expected timeframe for responding to security incidents based on severity.

- **Business Impact Analysis (BIA):** Identifies critical business processes and systems and assesses the impact of a security incident on them.

- **Disaster Recovery (DR):** Ensures the organization can recover from a disaster or major outage through backups and restoration procedures.

- **Patch Management:** Defines a process for timely deployment of security patches to address vulnerabilities in systems and software.

- **Security Device Management:** Manages and monitors security devices like firewalls and intrusion detection/prevention systems (IDS/IPS).

- **Out-of-Band Management:** Establishes a separate communication channel for managing security devices in case the primary network is compromised.

- **User Notification:** Defines a method for notifying users about security incidents, considering the risk of alerting attackers (e.g., phone instead of email).

- **Hardened Workstations:** Utilizes secure workstations for SOC activities to minimize the risk of compromise.

- **Change Management:** Defines a process for managing changes to the IT environment to minimize security risks.

**Overall:**

These processes work together to provide a comprehensive security posture for the organization. By implementing and maintaining these processes, SOCs can effectively detect, respond to, and recover from security threats.

> **SOC processes:**

- Incident management:

- Threat hunting:

- Disaster Recovery:

- Risk management (threat and vulnerability):

- Security engineering:

>  
>
> **Incident management workflow:**

- Incident identification

- Logging

- Categorization

- Prioritization (Low, medium, or high priority)

- Response

- Diagnosis

- Escalation (L1/L2/L3 support)

- Resolution and recovery

- Closure

>  
>
>  
>
> **NIST Recommendations to develop incident response process.**

- Establish formal incident response capability

- Create incident response policy

- Develop incident response plan based on incident response policy

- Develop incident response procedure

- Establish policies and procedures regarding incident related information sharing

- Consider the relevant factors when selecting incident response team model.

>  
>
> **NIST incident response framework:**

- Preparation: Organizational preparation that is needed to be able to respond, including tools, processes, competencies, and readiness.

- Detection: Activity to detect a security incident in a production environment

- Analysis: Analyse all events to confirm the authenticity of the security incident.

- Containment: The actions required to prevent the incident or event from spreading across the network.

- Eradication: The actions that are required to completely wipe the threat from the network or system.

- Recovery: The actions required to bring back the network or system to its former functionality and use.

- Post Incident Activity:

>  
>
> **Processes**

- Incident response timeline

- Next, identify what business processes and systems are critical to keep your organisation running. For example, the website where your customers place orders, or the computer-controlled manufacturing equipment you use. If you have not already done so, identify these key systems and processes as soon as possible, and record where they are stored (or how they are accessed).

- Manage SOC systems separately from broader enterprise IT systems.

- Manage sensors and security devices via out-of-band means (network, etc.).

- Develop method to notify users of compromised systems via phone rather than email.

- Use hardened workstations to conduct monitoring and response activities.

- Ensure defensive systems have robust backup and recovery processes.

- Implement processes to avoid “tipping off” an attacker to reduce likelihood of detection of IR-sensitive information such as do not submit malware samples to public analysis service or notify users of compromised systems via email.

- Change management process

- Patching process

>  
>
>  
>
>  

- Identify what electronic information is essential to keep your organisation running, such as contact details, emails, calendars, and essential documents. Find out where this information is stored. Is it on single machine in your office? Is it on a remote server? Is it stored in the cloud, by a third party?

# Challenges

**A Comprehensive Summary of Security Operations Center Challenges**

**Security Operations Centers (SOCs)** face a myriad of challenges in detecting, investigating, and responding to cybersecurity incidents. Here's a detailed breakdown:

**Incident Identification**

- **Data Overload:** Analyzing vast amounts of data from various sources to identify potential incidents can be overwhelming.

- **False Positives:** Distinguishing between actual threats and normal system activity can be challenging, leading to wasted resources.

- **Limited Visibility:** SOCs might not have complete visibility into all IT systems, allowing attackers to remain undetected.

**Investigation**

- **Lack of Expertise:** SOC teams may lack the specialized skills required for efficient investigation, such as forensic analysis and threat intelligence.

- **Manual Reporting:** Relying solely on user-reported issues can be slow and incomplete, hindering timely investigation.

- **Root Cause Analysis:** Understanding the exact method of attack can be difficult, making it harder to prevent future incidents.

- **Attribution:** Identifying the responsible threat actor can be challenging, especially for sophisticated attacks.

**Impact Assessment**

- **Determining Business Consequences:** Assessing the potential impact of a cyber incident on operations, reputation, and financial losses can be complex.

**Other Challenges**

- **Resource Constraints:** Limited personnel, technology, and information can hamper SOC effectiveness.

- **Incident Response Planning:** Inadequate preparation for handling incidents can lead to delayed or ineffective responses.

- **Threat Landscape:** The ever-evolving and complex nature of cyber threats makes it difficult to stay ahead of attackers.

**Overcoming these challenges is crucial for SOCs to effectively detect, investigate, and respond to cybersecurity incidents.** By investing in advanced technologies, training personnel, and establishing robust incident response plans, organizations can improve their security posture and protect against cyber threats.

# Best Practices

Key Takeaways for Effective Cyber Security Incident Response.

**Documentation is Crucial**

- **Detailed Incident Documentation:** Document every step of a cyber security incident to facilitate investigation and learning.

- **Time Machine Analogy:** Documentation serves as a reference point for understanding the incident's timeline and causes.

- **Knowledge Preservation:** Prevents loss of critical information due to staff turnover or memory lapses.

**Backup Best Practices**

- **Independent Backups:** Ensure backups are isolated from the main system to prevent contamination.

- **Backup Verification:** Regularly test backups to verify their integrity and functionality.

By following these guidelines, organizations can improve their ability to respond to cyber incidents and minimize their impact.

- **Employee Involvement:** Foster a security-conscious culture by involving all staff in incident response.

- **Offline Documentation:** Maintain physical copies of essential incident response materials.

- **Plan Maintenance:** Keep the incident response plan up-to-date.

- **Log Management:** Utilize logs for incident investigation and analysis.

- **Legal Compliance:** Adhere to legal requirements during incident handling.

- **Organizational Commitment:** Secure top management support for incident response initiatives.

- **Customizable Approach:** Tailor incident response strategies to specific organizational needs.

By implementing these principles, organizations can improve their ability to detect, respond to, and recover from cyber security incidents.

# Best practices for SIEM Admins 

- Pre-deployment activities and prerequisites for deploying Microsoft Sentinel

- Determine needed data sources and data size requirements to help accurately project budget and timeline.

- Identify which data source provides most value.

- Point of contact: Nominate an engineer or architect lead the deployment, based on requirements and timelines. This individual should lead the deployment and be the main point of contact on your team.

- Azure AD subscription, license, and permissions: Need active subscription, need Subscription contributor/owner role, or Sentinel contributor role on resource group in which Sentinel will be created. Sentinel does not support Log Analytics workspaces with a resource lock applied.

- Sentinel workspace architecture best practices: single or multi-tenant, compliance, control access to data, bill split.

- Design your Sentinel workspace architecture

- Sentinel sample workspace designs

- Data collection best practices

- Sentinel costs and billing

- Permissions in Microsoft Sentinel

- Protecting MSSP intellectual property in Microsoft Sentinel

- Threat intelligence integration in Microsoft Sentinel

- Audit Sentinel queries and activities

- Consider cost implication of each use case: make sure budget covers cost of data ingestion for both Sentinel , LAW and playbooks.

 

# Best practices for Analysts

- Recommended playbooks

- Handle false positives in Microsoft Sentinel

- Hunt for threats with Microsoft Sentinel

- Commonly used Sentinel workbooks

- Detect threats out-of-the-box

- Create custom analytics rules to detect threats

- Use Jupyter Notebook to hunt for security threats

 

 

**Cyber Threat Management**

 

Cyber threat management is a multi-layered approach to protecting organizations from cyberattacks. It's essentially a continuous process of identifying potential threats, preventing them from happening if possible, and then responding to them if they do occur.

Here is a breakdown of the key aspects of cyber threat management:

- **Identification:** This involves figuring out what threats exist and what vulnerabilities your organization has that could be exploited. Security professionals use various tools and techniques to assess risks, such as penetration testing and vulnerability scanning.

- **Prevention:** Once you know the threats, you can put safeguards in place to make it harder for attackers to be successful. This could involve things like firewalls, intrusion detection systems, and security awareness training for employees.

- **Detection:** Even with the best defenses, some attacks might get through. So, it's important to have systems in place to identify suspicious activity as soon as possible. This might involve Security Information and Event Management (SIEM) tools that collect data from various security sources and analyse it for potential threats.

- **Response:** If a security incident does occur, you need a plan for how to contain the damage, eradicate the threat, and recover your systems. This includes things like incident response procedures, data recovery plans, and communication protocols.

By having a comprehensive cyber threat management strategy in place, organizations can significantly reduce their risk of being hacked and improve their overall cybersecurity posture.

# Documentation

 

**Essential Documentation**

- **Asset Inventory:** A comprehensive list of all assets, including endpoints, networks, applications, ranked by importance.

- **IT Infrastructure:** List of hardware assets (desktops, servers, routers, switches) and software installed on machines.

- **Security Policies and Procedures:** Organization's security policies, standard operating procedures, and communication plans for cyber-attacks, data breaches, and incidents.

- **Network and Security Architecture:** Diagrams and documentation of network and security architectures.

- **Critical Assets:** List of critical assets, such as database servers and storage accounts.

- **Incident Response Plans:** Generic and specific incident response plans for various attack scenarios (e.g., Windows, Linux, IAM, network, data compromise, malware, ransomware).

- **Response Actions and Playbooks:** Detailed response actions and playbooks for a wide range of eventualities.

- **Incident Response Roles and Responsibilities:** Clear documentation of roles and responsibilities for incident response team members.

- **Incident Coordination:** Procedures for designating an agency incident coordination lead and notifying relevant stakeholders.

**Additional Considerations**

- **Offline Copies:** Maintain offline copies of essential documents for use during incidents.

- **Incident Documentation:** Document every step of a cyber security incident, including reporting, evidence collection, and conversations with stakeholders. This documentation serves as a timeline for evaluating the incident.

- **Knowledge Sharing:** Ensure that incident response knowledge is not confined to a few individuals. Documenting processes and procedures helps in knowledge sharing and continuity.

**By addressing these areas, organizations can establish a solid foundation for their Security Operations Center (SOC) and effectively respond to cyber security threats.**

# SOC Workflow

 

<img src="media/image1.png" style="width:6.57361in;height:3.25907in" />

 

 

>  

## Cyber threat intelligence

- Analyze suspicious activity reports from users, contractors/ICT service providers; or incident reports from other internal or external organizational components.

- Collect incident data (indicators, TTPs, countermeasures) and share with CISA (law enforcement, etc.).

- Integrate threat feeds into SIEM and other defensive capabilities to identify and block known malicious behavior.

- Monitor intelligence feeds for threat or vulnerability advisories from a variety of sources: government, trusted partners, open source, and commercial entities.

- Set up CISA Automated Indicator Sharing (AIS) or share via Cyber Threat Indicator and Defensive Measures Submission System.

>  

## Active Defense 

- For those with advanced capabilities and staff, establish active defense mechanisms, to create tripwires to detect adversary intrusions and to study the adversary behaviour to understand more about their TTPs.

- Active defense mechanisms: Honeypots, Honeynets, Honeytokens, Fake accounts

>  
>
>  
>
>  

 

 

 

 

# SOC

How to compare files that might have changed since the last time you looked at them? (Partially relevant - identifies changes)

**What are the benefits of a SOC?** By relying on threat intelligence, SOCs offer assurance that threats will be detected and prevented in real time. Looking at a big-picture perspective, SOCs can: Respond faster: The SOC provides a centralized, complete, real-time view of how the entire infrastructure is performing from a security standpoint, even if you have several locations and thousands of endpoints. You can detect, identify, prevent, and resolve issues before they cause too much trouble for the business. Protect consumer and customer trust: Consumers, already sceptical of most companies, are worried about their privacy. Creating a SOC to protect consumer and customer data can help build trust in your organization, which also includes preventing breaches. Minimize costs: While many organizations think establishing a SOC is cost prohibitive, the cost associated with a breach — including the loss and corruption of data or customer defection — are much higher. Additionally, SOC personnel will ensure that you are using the right tools for your business to their full potential, so you will not waste money on ineffective tools. These benefits are hard to put a price on because they quite literally keep your business running. But do you absolutely need a SOC? If you are subject to government or industry regulations, have suffered a security breach or are in the business of storing sensitive data — like customer information — the answer is yes.

Security Alerts

<img src="media/image2.png" style="width:7.85068in;height:3.93367in" />

**What are some of the drawbacks of threat hunting as compared to similar processes?**

Of course, threat hunting has its flip side as well. This is very important in communicating to the client, as they should not be given the impression that each potential threat will be detected. The recruiter who is interviewing you wants to make sure that you fully understand this. A good answer here would be to state that (once again, citing a few stats will show your expertise): From the same survey as mentioned previously, % of the clients polled felt that their threat hunting processes needed some serious improvement. % of the respondents felt that their threat-hunting processes were too transparent to the outside world. % of the respondents felt that the threat-hunting process takes too long, and is still very cumbersome.

## Incident Response

INCIDENT MEANING

Refers to an adverse security event that harms or threatens to harm the confidentiality, integrity, or availability of information systems or the information they store, process, or transmit

**INDICATORS OF SECURITY INCIDENTS**

- New unauthorized administrator accounts or privilege escalations

- Signs of malware infections like unexpected pop-ups, slower system performance, or unusual outbound network activity

- Loss events like missing laptops/devices or inability to account for records

- Alerts from security tools like anti-virus, IDS/IPS, firewalls denoting suspicious traffic or detections

- Unexplained alterations, deletions, or access of sensitive files or databases

- Suspicious emails with mismatched sender name and addresses or containing links to bad domains

- Multiple failed logins attempts or large number of locked out user accounts

- Unavailability of systems, servers, or networks denying user or customer access

Incident Response Process

**Detection & Analysis**

Monitor for and detect potential security incidents through tools, user reports, etc. Analyze suspected events to confirm malicious or unauthorized activity.

CONTAINMENT & ERADICATION

Isolate and stabilize the incident to limit its impact by disconnecting affected systems/users. Remove components or factors allowing the incident to occur including cleaning up infections.

RECOVERY & RECONNECT

Restore regular operations in a safe manner by reconnecting validated systems/users as needed. Monitor for potential complications or follow-on incidents.

POST INCIDENT REVIEW

Document lessons learned from the incident through a blameless assessment and adjust policies including new safeguards against similar incidents recurring.

Consider a scenario: the network has become extremely slow, and there are many escalations coming to the service desk, what would you do as a security professional? Do you see the possibility of any security threat in this? How would you face this situation?

## Open-Source Intelligence

What do you think of social networking sites such as Facebook and LinkedIn, how cyber criminals exploit it?

This is a doozy, and there are an enormous number of opinions for this question. Many think they are the worst thing that ever happened to the world, while others praise their existence. In the realm of security, they can be the source of extreme data leaks if handled in their default configurations. It is possible to lock down permissions on social networking sites, but in some cases, this is not enough since the backend is not sufficiently secured. This also does not help if somebody else’s profile you have on your list gets compromised. Keeping important data away from these kinds of sites is a top priority, and only connecting with those you trust is also extremely helpful.

# QnA

Why IT analyst need skills of proxy and EDR at same time?

IT analysts need skills in both proxy and EDR because they play different but complementary roles in cybersecurity. Here's a breakdown:

Proxy:

- A gateway that sits between internal networks and the internet to filter and monitor traffic.

- Analyze traffic for malicious activity, such as malware, phishing attempts, and data exfiltration.

- Provides visibility into user activity and internet usage.

>  

EDR (Endpoint Detection and Response):

- Software installed on endpoints (laptops, servers, etc.) that continuously monitors for suspicious activity.

- Detects and blocks malware, zero-day attacks, and other threats.

- Investigates and responds to security incidents.

>  

Why both are needed:

- Proxies provide a broader view of network traffic, but they may not be able to detect sophisticated threats that target specific endpoints.

- EDRs excel at endpoint protection, but they may not have the same visibility into overall network traffic patterns.

>  

An IT analyst with skills in both proxy and EDR can:

- Correlate data from both sources to get a more complete picture of the security landscape.

- Identify threats that might be missed by either proxy or EDR alone.

- Respond to incidents more effectively by using data from both tools.

>  

Here is an analogy:

- Imagine a bank. A proxy is like a security guard at the front door, checking everyone who enters. An EDR is like a security camera that monitors the bank's interior. Both are needed to keep the bank safe.

>  

In addition to the above, here are some specific benefits of having IT analysts with proxy and EDR skills:

- Improved threat detection and prevention: By combining the insights from both tools, analysts can identify and stop threats more quickly and effectively.

- Reduced risk of data breaches: Early detection of threats can help prevent attackers from stealing sensitive data.

- Faster incident response: With a clear understanding of the attack and its impact, analysts can respond to incidents more quickly and efficiently.

- Improved security posture: By using both proxy and EDR, organizations can take a more proactive approach to cybersecurity.

 

 

At what stage of development lifecycle, you should do the security testing?

Security Testing shall be incorporated in to every stage of software development lifecycle (SDLC).

Here is a breakdown of when security testing should be conducted:

**Early Stages**

- **Requirement Gathering:** Identifying potential security risks and incorporating them into requirements.

- **Design:** Analysing the system architecture for vulnerabilities and implementing security controls.  

**Development Stage**

- **Code Review:** Examining code for security flaws.

- **Static Analysis:** Analysing code without executing it to find vulnerabilities.  

- **Dynamic Analysis:** Testing the application while it is running to identify vulnerabilities.  

**Testing and Deployment**

- **Penetration Testing:** Simulating real-world attacks to identify weaknesses.  

- **Vulnerability Scanning:** Identifying vulnerabilities in the software and infrastructure.

- **Security Audits:** Assessing overall security posture.

**Post-Deployment**

- **Continuous Monitoring:** Tracking for new vulnerabilities and threats.

- **Incident Response:** Having a plan in place to respond to security incidents.

By integrating security testing throughout the SDLC, organizations can significantly reduce the risk of security breaches and build more resilient software.  

As a security engineer, I typically engage with developers early in the software development lifecycle (SDLC).

Here is a breakdown of when and how I interact with developers:

- **Requirements Gathering:**

  - Collaborate with developers to identify potential security risks and requirements.

  - Provide input on secure coding practices and standards.

- **Design Phase:**

  - Review system architecture and design for security vulnerabilities.

  - Suggest security controls and countermeasures.

  - Conduct threat modelling to identify potential threats.

- **Development Phase:**

  - Conduct code reviews to identify security weaknesses.

  - Provide guidance on secure coding practices.

  - Collaborate on security testing strategies.

- **Testing Phase:**

  - Participate in security testing activities (penetration testing, vulnerability scanning).

  - Analyze test results and provide recommendations.

By engaging early and continuously, security engineers can effectively help developers build secure software.

**Would you like to discuss specific security testing methodologies or challenges in collaborating with developers?**

# IR

**Incident Response Cycle**

**1. Preparation**

The phase for building the capability to respond to incidents before they happen.

- **People:** Roles, contact lists.

- **Policies:** Procedures, response plan.

- **Tools:** Jump bag, IR kits.

- **Training:** Exercises, mentoring.

**2. Identification**

The phase for detecting, verifying, and determining the scope of an incident.

- **Awareness:** Need-to-know, unusual complaints.

- **Alert Clarity:** Log/DNS analysis, netflows, SIEMs.

- **Analysis:** Monitor host traffic, validate findings.

- **Scope:** Identify affected hosts, users, and networks.

**3. Containment**

The phase for limiting the damage and preventing further spread.

- **Short-term:** Isolation, firewall logs, system take-on.

- **Long-term:** Patching, rebuilding systems.

- **Strategy:** Impact vs. risk, business downtime.

- **Evidence:** Disk images, memory snapshots, hashes.

**4. Eradication**

The phase for removing the cause of the incident and eliminating artifacts.

- **Cleanup:** Remove malware, disable breached accounts.

- **Hardening:** Update ACLs, patch vulnerabilities.

- **Verification:** Ensure threats are gone, scan for artifacts.

- **Remediation:** Root cause removal.

**5. Recovery**

The phase for restoring systems to normal operation and monitoring for reinfection.

- **Restore:** From clean backups, rebuild from scratch.

- **Validation:** Test functionality, verify security.

- **Monitoring:** Enhanced logging, watch for re-entry.

- **Communication:** Notify stakeholders of service restoration.

**6. Lessons Learned**

The phase for improving future responses based on the current experience.

- **Review:** What went well? What went wrong?

- **Documentation:** Incident report, timeline of events.

- **Updates:** Improve policies, procedures, and training.

- **Retention:** Archive evidence and documentation.
