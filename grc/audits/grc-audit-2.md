# Concepts

- **Gap Analysis means i**dentifying the difference between the current security posture and the desired state. Focuses on prioritizing risk reduction efforts.

- **Security audit** verifies the existence and effectiveness of security controls. Assesses compliance with regulations and internal policies.

- **Threat audit** identifies potential threats and their likelihood of occurrence.

- **External audit**: Provides an independent evaluation but can be costly and resource-intensive.

- **Internal audit:** Requires in-depth knowledge of security requirements but can be more cost-effective.

- **Remediation**: Prioritizes vulnerabilities based on risk. Develops and implements countermeasures. Monitors for ongoing effectiveness.

# Security Posture Maturity Scale

A security posture maturity scale assesses an organization's cybersecurity capabilities and overall maturity level.

It typically includes the following stages:

- **Reactive:** No formal security processes or policies exist.

- **Early:** Basic security functions are implemented with some level of structure.

- **Mature:** Established security processes and policies are in place, with a focus on continuous improvement.

- **Role Model:** Demonstrates exceptional cybersecurity practices and serves as an industry leader.

By understanding an organization's security maturity level, it is possible to identify areas for improvement and develop a roadmap for enhancing security posture.

# Types of Security

 

## Internal Audit

If you choose to undertake an internal security audit, it is required to educate yourself in compliance requirements necessary to uphold security protocols. Once familiar, you will understand where you should be looking – and that means you are ready to begin your internal security audit.

## External Audit

In external security audit has incredible value for companies, but it is prohibitively expensive for smaller businesses and still relies heavily on the cooperation and coordination of internal IT and security teams. Those teams must first and foremost find a respected and affordable external audit partner, but they are also required to set goals/expectations for auditors, provide all the relevant and accurate data, and implement recommended changes.

## Cloud Security Audit

- **Comprehensive assessment:** Evaluate overall cloud infrastructure and security posture.

- **Access control:** Verify user and key management practices.

- **Incident response:** Assess readiness for handling cloud-related incidents.

- **Data protection:** Check data protection measures in transit and at rest.

- **Network security:** Evaluate network segmentation and firewall rules.

- **Risk management:** Review security policies and risk mitigation strategies.

# Audit Methods

- Explains methodology of the Audit in report.

- Document the methodology used to perform the Audit, analyze data, and prioritize findings.

- The methodology description needs to demonstrate a systemic and well-reasoned Audit approach.

- Clarify the type of the Audit performed: penetration test, vulnerability Audit, etc.

- Tools: If applicable, explain what security Audit tools were used and how they were configured.

- If applicable, describe what approach guided the questions you asked during interviews.

- Describe the criteria used to assign severity or criticality levels to the findings of the Audit.

- Refer to the relevant frameworks you used to guide the Audit efforts (PCI DSS, ISO 27001, etc.).

**Conduct security control testing:**

- Vulnerability Audit

- Penetration testing

- Log reviews

- synthetic transactions

- Code review and testing (example manual, dynamic static fuzz)

- Misuse case testing

**Test coverage analysis:**

- Black box testing

- White box testing

- Dynamic testing

- Static testing

- Manual testing

- Automated testing

- Structural testing

- Functional testing

- Negative testing

- Interface testing (API, UI, physical)

# Audit Process

- Define audit strategy

- Define audit scope

- Collect data and evidence

- Analyze data and evidence

- Reporting

- Remediation

# 1 - Define Audit Strategy

**Design Audit strategies**

- Internal

- External

- Third party

**Collect security process data**

- Account management - escalation, revocation

- Management review and approval

- Key performance and risk indicators

- back up verification data

- training and awareness

- disaster recovery and business continuity

**Conduct internal and third-party audits**

- Internal

- External

- Third-party

- Vulnerability Audit: Internal and External

- Penetration testing: Blackbox, Gray and Whitebox

- Application Security Testing: Static and Dynamic

- Code Reviews

>  

# 2 - Define Audit Scope

- **Purpose**: Defines goals of Security Audit.

- **List the Inventory:**

  - **In-scope resources**: List of what resources are included in Audit, explain why?

  - **Out-of-scope resources**: List of what resources are excluded from Audit, explain why?

  - It is unreasonable to expect that we can audit everything. Only choose most valuable assets, build security perimeter around them.

- List of people that needs to be interviewed.

- List of documents required from organization, department, migration documents to review:

<!-- -->

- Architecture diagrams

- Hardening documentation

- Access management policies and standards

- SOPs/playbooks

- Logging standards

<!-- -->

- Discuss legal, regulatory or contract obligations need to be accounted during Audit.

- Overall security posture: Conduct interviews and documentation review to evaluate your entire cloud infrastructure focusing on the cloud security lifecycle

# 3 - Collect Data and Evidence

- Collect security process data for examples documentation of Incident Response, Backup and Disaster Recover, BCM, Vulnerability/Patch Management, Threat Intelligence, Risk Management.

- Account management - escalation, revocation

- Management review and approval

- Key performance and risk indicators

- Back-up Verification data

- User training and awareness

- disaster recovery and business continuity

- External Audit: Data collected through Penetration Testing

# 4 - Analyze Data and Evidence 

In this phase find gap, its evidence and perform Risk Audit on that gap.

## Phase-1

- Initial Document Review of migration strategies

- Architecture diagrams

- Hardening documentation,

- Access management policies and standards,

- SOPs/playbooks

- Logging standards

## Phase-2

- Explore on-premises and cloud environment,

- Explore current security model

- Potential security concepts and controls to implement in the future to meet your business needs.

- Audit current security performance of organizations information security program.

- Analyze the data collected during the security Audit to identify relevant issues.

- When reviewing scanner output, think about using spreadsheets and pivot tables to explore the data.

- The usefulness of your analysis should go beyond reiterating (repeating data without investigation) already published data.

- Assume that whatever information you receive is incomplete, possibly false, or just partially true.

- 

## Phase-3

- Configuration Review from the cloud platform to ensure security controls are implemented effectively

- Identify potential weaknesses and confirm learnings from the onsite workshops to identify potential weaknesses that could be exploited by attackers.

<!-- -->

- **Identify Patterns**: Look for patterns that reveal the existence of underlying security-related issues.

- **Data Segregation**: Group preliminary findings based on the categories of issues, risks, and resources that were impacted

- Fill in any knowledge gaps with more scans, document requests, or interviews.

- Include co-workers in your analysis to get their opinions on the information and findings.

- **External Audit**: In this phase external audit can provide additional value, because it ensures that no internal biases are affecting the outcome of the audit.

- **Internal Audit:** It is critical to the legitimacy and efficacy of your internal security audit to try and block out any emotion or bias you have towards evaluating and assessing your performance to date, and the performance of your department at large.

- **Prioritize (Risk Scoring)**: Take list of threats and assess the potential damage of a threat occurrence versus the chances that it can occur (thus assigning a risk score to each). For example, a natural disaster can obliterate a business (high risk score), but if your assets exist in a place that has never been hit with a natural catastrophe, the risk score should be lowered accordingly. Do not forget to include the results of the current security performance Audit (step \#3) when scoring relevant threats. During your threat Audit, it is important to take a step back and look at additional factors:

- **Current cyber security trends:** What is the current method of choice for perpetrators? What threats are growing in popularity, and which are becoming less frequent? What new solutions are available to defend against certain threats?

- **History of your organization:** Has your business experienced a cyber-attack or breach in the past? Current cyber security trends: What is the current method of choice for perpetrators? What threats are growing in popularity, and which are becoming less frequent? What new solutions are available to defend against certain threats?

- **Industry-level trends**: Say you work in the financial industry, how does that affect not only your data, but the likelihood of a breach? What types of breaches are more prevalent in your industry?

- **Regulation and Compliance**: The answers to below questions will have implications on the risk score you are assigning to certain threats and the value you are placing on assets:

  - Are you a public or private company?

  - Does your organization store and/or transmit sensitive financial or personal information?

  - What kind of data do you handle?

  - Who has access to what systems?

- **Access control and management**: Review user accounts and key management, focusing on privileged account management and least privileged.

- **Incident management**: Review incident response policy related to cloud infrastructure including roles and processes related to an incident.

- **Data protection**: Assess technical implementation of data protection in transit and at-rest

- **Network security**: Review segmentation and firewall policies against common misconfigurations

- **Risk management and compliance**: Review security policy components focusing on patching, vulnerability analysis and related risk management areas

- **Cloud security audit:** Explore your cloud environment

  - Explore current security model

  - Potential security concepts and controls to implement in the future in order to meet your business needs.

  - Configuration Review from the cloud platform to ensure security controls are implemented effectively. Identify potential weaknesses and confirm learnings from the onsite workshops to identify potential weaknesses that could be exploited by attackers.

  - Reporting that details practical technical recommendations to harden the cloud environment, enhance visibility and detection and improve processes to reduce the risk of compromise.

# 5 - Reporting

Reporting that details practical technical recommendations to harden the cloud environment, enhance visibility and detection and improve processes to reduce the risk of compromise

**General Approach**

- Account for organizations industry, business model and compliance requirements where appropriate.

- Analyze the data collected during the security Audit to identify relevant issues.

- Attach relevant figures and raw data to support the main body of the report.

- Consider submitting the report’s draft to weed out false positives and confirm expectations.

- Create templates based on prior reports, so you do not have to write every document from scratch.

- Create the executive summary to highlight the key findings and recommendations.

- Discuss the reports content with recipient on the phone or in person

- Document the sections of the report describing your findings and recommendations.

- Document the sections of the report detailing the Audit methodology and scope.

- Include both positive and negative findings.

- Prioritize findings related to security risks.

- Prioritize your risks and observations; formulate remediation steps.

- Proof-read and edit the document.

- Provide practical remediation path, accounting for the organization’s strengths and weaknesses.

- Put effort into making the report as brief as possible without omitting important and relevant contents.

- Report should appear professional and is error-free, without typos.

- Report should be logically divided into sections to accommodate many audiences that will read and respond to it.

- Report should provide advice for fixing issues rather than just highlighting security flaws, provide remediation guidance.

- Safeguard (encrypt) the report when storing and sending it, since its contents are probably sensitive.

- Stay consistent with the methodology and scope.

- Submit the final report to the intended recipient using agreed-upon secure transfer mechanism.

- Use concrete statements; avoid passive voice.

**<span class="mark">Report Format</span>**

**Summary**:

- Begin report with **executive summary** that a reader who is not technically savvy can understand.

- Rather than only giving the results of evaluation instruments, provide some significant insight.

- Explain the **significance of the security finding**s in the context of current threats and events.

**Attach supporting data:**

- Please include supplementary data to bolster or support the analysis.

- Attach raw data and modified data like charts, dashboards.

**Audit Methodology:**

- Document the methodology used to perform the Audit, analyzed data, and prioritize findings in report.

- The methodology description needs to demonstrate a systemic and well-reasoned Audit approach.

- Clarify the type of the Audit performed: penetration test, vulnerability Audit, etc.

- Tools: If applicable, explain what security Audit tools were used and how they were configured.

- If applicable, describe what approach guided the questions you asked during interviews.

- Describe the criteria used to assign severity or criticality levels to the findings of the Audit. Or use organizations criteria.

- Refer to the relevant frameworks you used to guide the Audit efforts (PCI DSS, ISO 27001, etc.).

**Analysis of collected data and evidence**

- Analysis should provide value beyond repeating the data already in existence.

- Consider information provided to you is incomplete or might be a lie or half-truth.

- Group the initial findings based on affected resources, risk, issue category, etc. to look for patterns.

- Identify for trends that highlight the existence of underlying problems that affect security.

- If examining scanner output, consider exploring the data using spreadsheets and pivot tables.

- Fill in the gaps in your understanding with follow-up scans, document requests and/or interviews.

- Involve colleagues in your analysis to obtain other people’s perspective on data and conclusions.

<table style="width:68%;">
<colgroup>
<col style="width: 16%" />
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 11%" />
<col style="width: 13%" />
<col style="width: 7%" />
</colgroup>
<thead>
<tr>
<th>Security Control</th>
<th>Cost</th>
<th>Impact</th>
<th>Complexity</th>
<th>Audit</th>
<th>Notes</th>
</tr>
</thead>
<tbody>
<tr>
<td></td>
<td><p>Low</p>
<p>Medium</p>
<p>High</p></td>
<td><p>Low</p>
<p>Medium</p>
<p>High</p></td>
<td><p>Low</p>
<p>Medium</p>
<p>High</p></td>
<td><p>Implemented</p>
<p>Inprogress</p>
<p>Scoped</p>
<p>Not Started</p></td>
<td></td>
</tr>
</tbody>
</table>

**Document the Audit Method:**

- Document the methodology used to perform the Audit, analyze data and prioritize findings.

- The methodology description needs to demonstrate a systemic and well-reasoned Audit approach.

- Clarify the type of the Audit performed: penetration test, vulnerability Audit, etc.

- If applicable, explain what security Audit tools were used and how they were configured.

- If applicable, describe what approach guided the questions you asked during interviews.

- Describe the criteria used to assign severity or criticality levels to the findings of the Audit.

- Refer to the relevant frameworks you used to guide the Audit efforts (PCI DSS, ISO 27001, etc.).

**Document Audit Scope**

- Specify what systems, networks and/or applications were reviewed as part of the security Audit.

- State what documentation was reviewed if any.

- List the people whom you interviewed, if any.

- Clarify the primary goals of the Audit project.

- Discuss what contractual obligations or regulatory requirements were accounted for in the Audit.

- Document any items that were specifically excluded from the Audits scope and explain why?

**Add Conclusions**

- Include both negative and positive findings.

- Account for organizations industry, business model and compliance requirements where appropriate.

- Stay consistent with the methodology and scope.

- Prioritize findings related to security risks.

- Provide practical remediation path, accounting for the organization’s strengths and weaknesses.

**Qualities of Good Audit Report**

- Starts with a strong executive summary that a non-technical reader can understand

- Provides meaningful analysis, rather than merely presenting the output of Audit tools

- Include supporting figures to support the analysis

- Describes Audit methodology and scope

- Looks professional and is without typos

- Offers remediation guidance beyond merely pointing out security problems

- Is structured in logical sections to accommodate the different groups who will read and act upon it

**Tips**

- Create templates based on prior reports, so you don’t have to write every document from scratch.

- Safeguard (encrypt) the report when storing and sending it, since its contents are probably sensitive.

- Use concrete statements; avoid passive voice.

- Explain the significance of the security findings in the context of current threats and events.

- Put effort into making the report as brief as possible without omitting important and relevant contents.

# 6 - Remediation 

**Remediation** is the process of addressing vulnerabilities and weaknesses identified through a security audit. It involves taking corrective actions to reduce risks to an acceptable level.

**Key Steps in Remediation:**

1.  **Prioritization:** Identify and prioritize vulnerabilities based on their potential impact and likelihood of exploitation.

2.  **Risk Audit:** Evaluate the effectiveness of potential countermeasures against the identified risks.

3.  **Remediation Planning:** Develop a detailed plan outlining the steps to address each vulnerability.

4.  **Implementation:** Execute the remediation plan, including system changes, policy updates, and employee training.

5.  **Verification:** Test the effectiveness of the implemented countermeasures.

6.  **Monitoring:** Continuously monitor the system for residual risks and emerging threats.

**Common Remediation Strategies:**

- **Data Backup:** Protects data from loss or corruption.

- **Email Protection:** Implements measures to prevent phishing attacks and spam.

- **Employee Awareness Training:** Educates employees about security best practices.

- **Network Monitoring:** Detects suspicious network activity and potential threats.

- **Password Management:** Enforces strong password policies and promotes the use of password managers.

- **Software Updates:** Keeps systems and applications patched with the latest security fixes.

**Remember:** Remediation is an ongoing process. It is essential to prioritize based on risk, allocate resources effectively, and continually assess the security posture of the organization.

**Would you like to delve deeper into a specific remediation strategy or discuss challenges in implementing a remediation plan?**

# QnA

- **Before officially finishing an audit or presenting a report to the Board of Directors, what is the primary objective of meeting with auditees?** The primary purpose for meeting with auditees prior to formally closing a review is to gain agreement on the findings

- **During an audit of a production system's change control, you have finds that the change management process ‘;is not documented and that some of the migration procedures did not work. What will you do Next?** Before advising that the business take any further action, I will first examine all alternatives. I shall get reassurance that the reported occurrences are attributable to flaws in the change management process and were not caused by another process.

- **How does process audit go?** The first thing to do is to identify the scope of the audit followed by a document of the process. Study the document carefully and then identify the areas which you consider are weak. The company might have compensatory controls in place. Verify they are enough.

- **How to perform security audit from Azure Policy for ISO27001, HIPAA, PCI-DSS?**

- **List out the controls to test during the Audit?** Information gathering, Configuration and Deploy management testing, Identify Management testing, Authentication and Authorization Testing, Session Management Testing, Data Validation Testing, Error Handling, Cryptography, Business logic testing, and Client-side testing

- **What are the parts of the internal audit concept must be discussed prior to beginning the actual auditing process in the organization?** The audit charter, Audit independence, Assurance, and consulting services

- **What auditor looking for when they test control for implementation over entire offering with no gaps?** Completeness

- **What is a security auditing?** Security auditing is an internal inspection of applications and operating systems for security flaws. An audit can also be done via line-by-line inspection of code.

- **What is an IT security audit?**

- **What is the difference between security audit and penetration test?**

- **What is the main driver for security audits and pen tests?**

- **What is the most difficult part of auditing for you?**

- **What is the role of Information Security Auditor?**

- **What type of systems should be audited?**

- **Which is the most difficult auditing procedure you have implemented?**

- **Why Compliance testing is important in Internal Audit?** Compliance testing is important because it uncovers problems with poor adherence to control standards

- **You are responsible for conducting privacy audit in the organization. Which of the following steps you will consider? 1**) Understand the business requirement and check appropriate privacy law. 2) Check any privacy policy is existing. 3) Are policies and procedures for creating, storing, and managing privacy data applied and followed. 4) Check if any sop for privacy, 5) Are specific controls implemented, and are compliance tasks

- Describe the most difficult auditing procedure you have implemented.

- What type of systems should be audited?

- What is the main driver for security audits and pen tests?

- What is the most difficult part of auditing for you?

- What were some of the findings in one of your last times you tested an incident response plan?

- What is the difference between security audit and penetration test?

**How to assess effectiveness of software security?**

**How to assess security impact of third-party software?**

**How to perform security assessment?**

**What is a cybersecurity risk assessment?** A cybersecurity risk assessment refers to detecting the information assets that are prone to cyber-attacks(including customer data, hardware, laptop, etc.) and evaluates various risks that could affect those assets. It is mostly performed to identify, evaluate, and prioritize risks across organizations. The best way to perform cybersecurity risk assessment is to detect: Relevant threats in your organization, Internal and external vulnerabilities, evaluate vulnerabilities impact if they are exploited

What is information security scoping process look like?

Which is the most difficult auditing procedure you have implemented?

What type of systems should be audited?

What is the most difficult part of auditing for you?

## Security Baseline

**How would you decide what is security baseline?**

**What special security challenges do SOA present?**

**What auditor looking for when they test control for implementation over entire offering with no gaps?** Completeness

## Security Assessment 

Defined and implemented azure security assessment process for newly onboarded clients.

Azure security assessment is a crucial process to identify vulnerabilities and ensure the overall security posture of your cloud environment.

Define Scope: Identify the Azure resources and data critical for security evaluation. This could include virtual machines, storage accounts, databases, and applications.

Assessment Criteria: Determine the objectives of the assessment. Are you aiming for compliance, identifying vulnerabilities, or improving overall security posture?

Azure Security Assessment Process

An Azure security assessment is a crucial process to identify vulnerabilities and ensure the overall security posture of your cloud environment.

The Azure security validation process is a set of steps and procedures that organizations can follow to ensure that their Azure resources are secure and compliant with industry standards and regulations.

This process typically involves the following steps:

**Preparation:**

1.  **Define Scope:** Identify the Azure resources and data critical for security evaluation. This could include virtual machines, storage accounts, databases, and applications.

2.  **Assessment Goals:** Determine the objectives of the assessment. Are you aiming for compliance, identifying vulnerabilities, or improving overall security posture?

**Azure Security Assessment Process**

- **Assessment**:

- **Compliance**:

  - Compliance with industry standards and regulations is an important part of the Azure security assessment process.

  - Use Azure Policy to define and enforce compliance policies across your resources.

  - Use Azure Blueprints to implement pre-defined compliance architectures.

**Assessment Phases:**

1.  **Discovery & Inventory:**

    - List all Azure resources within the designated scope.

    - Identify data types and their sensitivity levels.

2.  **Perform Security Assessment:**

    - First step is to assess the current security posture of your Azure resources.

    - Use tools such as Azure Security Center (MDC), MDE, Microsoft Cloud Security Benchmark

    - **Gap Analysis:** Compare your current security posture against industry standards like the Cloud Security Alliance (CSA) Cloud Controls Matrix (CCM) or Microsoft Security Baselines. Identify gaps between your existing security measures and best practices.

    - **Security Posture Analysis:**

      - **Identity and Access Management (IAM):** Evaluate user access controls, roles, and permissions assigned. Assess multi-factor authentication (MFA) implementation.

      - **Platform Security:** Review security configurations for storage accounts, databases, and virtual networks. Analyze encryption practices for data at rest and in transit.

      - **Security Operations:** Assess log collection, monitoring, and incident response procedures. Evaluate vulnerability management practices for Azure services and resources.

      - **Application & Data Security:** Review security measures for deployed web applications. Analyze data classification and protection methods.

      - **Subscription Security:** Evaluate service principals and access permissions assigned. Review Azure resource manager (ARM) templates for security best practices.

    - **Vulnerability Scanning:**

      - Utilize Azure Security Center or third-party tools to scan for vulnerabilities in: Operating systems, Applications, Network configurations

      - Prioritize vulnerabilities based on severity and potential impact.

3.  **Reporting:**

    - Document the assessment findings, including identified vulnerabilities and security gaps.

4.  **Remediation**:

    - Based on the results of the assessment, you can take steps to remediate any identified vulnerabilities or misconfigurations.

    - This can involve implementing recommended security controls, such as enabling encryption, configuring firewalls, and patching.

    - Prioritize remediation steps based on severity and exploitability.

    - Develop an action plan for addressing the identified issues.

5.  **Monitoring**:

    - Ongoing monitoring is an important part of the Azure security assessment process.

    - Use Azure Monitor/MDC to collect and analyse log data from resources, and set up alerts to notify you of potential security issues.

6.  

**Tools and Resources:**

- Microsoft Azure Security Center

- Azure Security Benchmark: <https://learn.microsoft.com/en-us/security/benchmark/azure/security-control-vulnerability-management>

- Third-party cloud security assessment tools

**Additional Considerations:**

- **Frequency:** Regularly conduct security assessments (e.g., quarterly) to ensure ongoing security.

- **Expertise:** Consider involving security professionals with Azure expertise for a comprehensive assessment.

By following these steps, you can establish a robust Azure security assessment process that helps you proactively identify and address security risks in your cloud environment.

By following this process, organizations can ensure that their Azure resources are secure and compliant with industry standards and regulations.

> <span class="mark">Led the security validation of Azure Infrastructure for newly onboarded 20 clients 40 subscriptions before going live.</span>

- **<u>Performed security assessment of Azure cloud infrastructure of newly onboarded clients before going live in production.</u>**

> Performing a security assessment of Azure cloud infrastructure for newly onboarded clients before going live in production is an important step in ensuring the security and compliance of the infrastructure. Here are some steps you can follow to perform a security assessment:

- **Review the architecture**: Start by reviewing the architecture of the Azure cloud infrastructure to understand how the different components are connected and how data flows between them.

- **Assess the security controls**: Evaluate the security controls that are in place to protect the infrastructure, such as firewalls, encryption, and access controls. Ensure that these controls are properly configured and meet your organization's security requirements.

- **Check for vulnerabilities**: Use vulnerability scanning tools to check for vulnerabilities in the infrastructure. Prioritize and remediate any vulnerabilities that are identified.

- **Review compliance**: Ensure that the infrastructure is compliant with any relevant industry standards or regulations, such as PCI DSS or HIPAA.

- **Test incident response**: Test your incident response plan to ensure that you are prepared to respond to security incidents in a timely and effective manner.

>  
>
>  
>
>  
>
> <span class="mark">Improved cloud security posture by increasing secure score from 51% to 65% in Microsoft Defender for Cloud.</span>
>
>  
>
>  
>
> <span class="mark">Assisted the security architect to define Azure Security baseline.</span>

- **<u>What are the steps to define Azure cloud security baseline?</u>**

  - **Understand your compliance requirements**: The first step in evaluating and implementing a cloud security baseline is to understand your organization's compliance requirements. This can include industry standards, such as PCI DSS or HIPAA, as well as any internal security policies.

  - **Assess your current security posture**: Use tools such as Azure Security Center or AWS Security Hub to assess the current security posture of your cloud resources. These tools can provide recommendations for improving your security posture and help you identify any gaps in your compliance.

  - **Define a security baseline**: Based on your compliance requirements and the results of your security assessment, define a security baseline for your cloud resources. This should include a set of minimum security controls that must be implemented to meet your compliance requirements.

  - **Implement the baseline**: Implement the security controls defined in your baseline across your cloud resources. This can involve configuring security settings, enabling encryption, and applying security patches.

  - **Monitor and validate**: Regularly monitor your cloud resources to ensure that they remain compliant with your security baseline. Use tools such as Azure Policy or AWS Config to automate compliance checks and validate that your resources are meeting the requirements of your baseline.

>  
>
>  
>
>  
>
> <span class="mark">Assessed SAP on Azure design and defined the cloud security controls for Azure environment.</span>

- **<u>Performed initial security assessment for deployment of SAP systems on Azure Cloud.</u>**

> Performing an initial security assessment for the deployment of SAP systems on Azure Cloud is an important step in ensuring the security and compliance of the infrastructure. Here are some steps you can follow to perform a security assessment:

- **Review the architecture**: Start by reviewing the architecture of the SAP systems and their deployment on Azure Cloud to understand how the different components are connected and how data flows between them.

- **Assess the security controls**: Evaluate the security controls that are in place to protect the infrastructure, such as firewalls, encryption, and access controls. Ensure that these controls are properly configured and meet your organization's security requirements.

- **Check for vulnerabilities**: Use vulnerability scanning tools to check for vulnerabilities in the infrastructure. Prioritize and remediate any vulnerabilities that are identified.

- **Review compliance**: Ensure that the infrastructure is compliant with any relevant industry standards or regulations, such as PCI DSS or HIPAA.

- **Test incident response**: Test your incident response plan to ensure that you are prepared to respond to security incidents in a timely and effective manner.

>  
>
>  
>
>  
>
> <span class="mark">Developed and enforced security baseline for Azure infrastructure for compute, network, and storage services.</span>
>
> <span class="mark">Improved organizations security posture by remediating vulnerabilities and implementing security best practices.</span>

- **<u>How to remediate vulnerabilities?</u>**

  - Collaboration with IT and development teams is crucial for the effective remediation of vulnerabilities.

    - Create shared visibility: ensure that everybody has access to same data and using same data set for understanding and prioritization.

    - Use common Analytics: Ensure that teams are looking at same reports and analytics to ensure they are on the same page and can work together on shared goals.

    - Optimize developer experience: Make easy for developers to remediate vulnerabilities by providing them with tools and resources.

  - Create and Monitor ServiceNow tickets for vulnerability remediation with Patching, Windows, Network, Citrix, Development.

- **<u>How to extract the MDC Qualys vulnerability report?</u>**

  - Uses Azure resource graph explorer: *securityresources \| where type == "microsoft.security/assessments" \| where properties.displayName contains "Vulnerabilities in Azure Container Registry images should be remediated".*

  - Use Workbook in MDC:

- F

- F

>  
>
>  
>
>  
>
>  
>
>  
>
> <span class="mark">Analysed and remediated vulnerabilities data from Tenable and CrowdStrike vulnerability scan reports for on-prem and cloud.</span>

- **Review the findings of reports from the vulnerability scanner tools, CrowdStrike Spotlight, Tenable**

  - Access the reports: Log in to the respective vulnerability scanner tool and navigate to the reports section. From there, you can access the reports generated by the tool.

  - Review findings: Carefully review the findings of the reports, paying attention to the vulnerabilities identified, their severity, and the affected assets.

  - Prioritize remediation: Based on the severity of the vulnerabilities and their potential impact on your organization, prioritize their remediation.

  - Take action: Work with your IT and security teams to implement the recommended remediation actions to address the identified vulnerabilities.

- **How to priorities Vulnerabilities?**

  - <u>Severity of the Vulnerability:</u> Prioritize vulnerabilities based on their severity rating. This is usually provided by the vulnerability scanner and is often based on the Common Vulnerability Scoring System (CVSS). Vulnerabilities with a high severity rating should be prioritized for remediation.

  - <u>Asset Criticality:</u> The importance of the affected asset to your business or operation also plays a role in prioritization. A high-severity vulnerability on a critical server is often a higher priority than a similar vulnerability on a less critical system.

  - <u>Threat Intelligence</u>: Information about whether a vulnerability is being actively exploited in the wild can also help in prioritization. Vulnerabilities known to be exploited should be given higher priority.

  - <u>Mitigating Controls</u>: If there are mitigating controls in place that could block attack or reduce its impact, you might deprioritize some vulnerabilities.

  - <u>Patch Availability</u>: The availability of a patch or fix for the vulnerability should also be considered. If a patch is available, it's usually a good idea to apply it as soon as possible.

  - Note: Remember, the goal of prioritization is to reduce the risk to your organization as effectively and efficiently as possible.

- **How to analyse vulnerabilities?**

  - Analysed the vulnerabilities data of 100k to 700k vulnerabilities: Analysing a dataset of 200,000 vulnerabilities requires a systematic approach to extract meaningful insights and identify patterns or trends. Here's a step-by-step guide to effectively analyse vulnerability data:

    - **Data Preparation**: includes data cleaning and feature engineering. Data cleaning: Ensure data consistency and remove any duplicates/inconsistencies. This may involve handling missing values/correcting data errors, and standardizing formats. Feature Engineering: Create new features from existing data or combine existing ones to gain deeper insights. For example, combining vulnerability scores and exploit availability can indicate potential severity.

    - **Exploratory Data Analysis (EDA):** Descriptive Statistics: Summarize the data using measures like mean, median, mode, and standard deviation for numerical variables. Generate frequency distributions for categorical variables. Data Visualization: Create visualizations like histograms/bar charts/scatter plots to visualize the distribution of variables/identify trends/detect outliers.

    - **Vulnerability Assessment:** Vulnerability Classification: Classify vulnerabilities based on their impact (Critical/High/Medium/Low) and exploitability (Remote/Local/User interactive). Vulnerability Scoring: Calculate vulnerability scores using standardized scoring systems like CVSS (Common Vulnerability Scoring System) to prioritize remediation efforts.

    - **Pattern Recognition and Trend Analysis**: Vulnerability Trends: Analyze trends in vulnerability occurrence, severity, and exploitability over time to identify emerging threats or patterns. Vulnerability Clustering: Group vulnerabilities based on common characteristics, such as affected software/attack vectors/mitigation strategy.

    - **Risk Assessment and Prioritization:** Risk Assessment: Assess the risk associated with each vulnerability considering its impact, exploitability, and asset value. Prioritization: Prioritize vulnerabilities based on risk assessment, ensuring that the most critical vulnerabilities are addressed first.

    - **Communication and Reporting:** Vulnerability Reports: Generate comprehensive vulnerability reports that summarize the findings, highlight critical vulnerabilities, and provide remediation recommendations. Communication and Awareness: Communicate vulnerability findings to relevant stakeholders, including security, IT, and management.

    - **Continual Monitoring and Improvement:** Regular Monitoring: Continuously monitor vulnerability databases and update the analysis with the latest vulnerability information. Process Improvement: Regularly evaluate and improve the vulnerability analysis process to ensure its effectiveness and relevance.

- **How to remediate vulnerabilities?**

  - Collaboration with IT and development teams:

    - IT Teams: Patching, Windows, Citrix, VMware, Network

    - Development Teams: App, Infrastructure (Azure), DevOps.

    - In Citrix we need to patch only Gold server, then push Gold image to target servers (called VDA).

>  
>
>  
>
>  
>
> <span class="mark">Improved vulnerability monitoring dashboards by resolving the vulnerability scanning and remediation reporting issues.</span>

- **<u>How to create vulnerability report/dashboard?</u>**

  - Created vulnerability reports in excel and PowerBI dashboards for monitoring monthly vulnerabilities trend by Client Product, Environment, Citrix/Non-Citrix, VDA/Non-VDA, platform (Windows/Linux), by Datacentre (Azure/On-prem/3rd Party datacenter)

- **<u>Power BI dashboard creation, to skip excel dashboards</u>**

  - Generated excel and PowerBI dashboard for monitoring of vulnerabilities across environments and products:

  - Created PowerBI dashboards which shows the vulnerabilities for different Data Centers (On-prem/Private/Public Cloud).

  - PowerBI dashboard will provide vulnerabilities with respect to Data Center, Environment, Product, Product Class, Hosted OS, Severity, CVE ID and their trendline

- **<u>How to document the vulnerability management process?</u>**

  - Documenting the vulnerability management process is an important step in ensuring that your organization is effectively managing vulnerabilities. Here are some steps you can follow to document the vulnerability management process:

  - **Define the scope**: Clearly define the scope of your vulnerability management program, including the systems, applications, and data that will be covered.

  - **Identify roles and responsibilities**: Identify the roles and responsibilities of all parties involved in the vulnerability management process, including security teams, IT teams, and business units.

  - **Outline the process**: Outline the steps involved in the vulnerability management process, including vulnerability scanning, analysis, prioritization, remediation, and verification.

  - **Establish metrics**: Establish metrics to measure the effectiveness of your vulnerability management program, such as the number of vulnerabilities identified, the time taken to remediate vulnerabilities, and the reduction in risk.

  - **Review and update**: Regularly review and update your vulnerability management documentation to ensure that it remains accurate and up-to-date.

- **<u>Tell me some of your experience about CrowdStrike Spotlight vulnerability scanning</u>**

  - CrowdStrike Spotlight was reporting the duplicate entries of vulnerabilities, let's say CVE-2022-1234 present on server1, then if CrowdStrike Spotlight scan happened every weekend in month then when we take report of vulnerabilities reported in last 1 month then it will give report that there 4 vulnerabilities present on server1 for CVE-2022-1234. Originally there is only 1 vulnerability but while downloading report for 1 month it will give report of 4 vuln count.

  -  

>  
>
>  
>
>  
>
> <span class="mark">Performed on demand vulnerability scanning and made recommendations to IT teams for mitigation and remediation.</span>
>
>  
>
> <span class="mark">Identified risk and impact of third-party zero-day vulnerabilities and make recommendations to IT teams to mitigate risk.</span>

- **<u>Zero day Vulnerability response process</u>**

> A zero-day vulnerability is a software vulnerability that is unknown to the software vendor and the public, but is known to attackers who exploit it before the vendor can fix it. The response process to a zero-day vulnerability typically involves the following steps:

- **Detection**: The first step in responding to a zero-day vulnerability is detecting its existence. This can be done through various means, such as monitoring for unusual activity, analysing network traffic, or receiving reports from security researchers.

- **Analysis**: Once a potential zero-day vulnerability has been detected, it needs to be analysed to determine its severity, impact, and potential attack vectors.

- **Containment**: The next step is to contain the vulnerability to prevent it from being exploited. This can involve implementing temporary mitigations, such as blocking certain network traffic or disabling certain features.

- **Remediation**: The ultimate goal is to remediate the vulnerability by releasing a patch or update that fixes the underlying issue. This can take time, as the vendor needs to develop, test, and release the patch.

- **Notification**: It's important to notify affected parties, such as customers and partners, about the existence of the zero-day vulnerability and the steps being taken to address it.

> By following this process, organizations can effectively respond to zero-day vulnerabilities and minimize their impact.

- df

>  
>
>  
>
> Collaborated with stakeholders to review security exceptions, and streamlined process to enhance governance of exceptions.
>
>  
>
>  
>
>  
>
> <span class="mark">Tracked the compliance of EDR tool CrowdStrike Falcon and SIEM Splunk Forwarder.</span>

- **Monitored compliance of endpoint protection solution and SIEM data collection agent installation on servers**

  - How to check if Splunk universal forwarder is sending data to indexer?

    - <u>Check the connection:</u> You can check if the universal forwarder is connecting to the indexer by running the following search command on the indexer: index=\_internal source=\*metrics.log\* tcpin_connections \| stats count by sourceIp

    - <u>Check the distribution of data</u>: You can use the following search query to check the distribution of data sent to indexers: \| tstats count WHERE index=\* host=YourForwarderNameHere by splunk_server.

    - <u>Check the indexer queue</u>: You can check if the forwarders are sending data only to a specific indexer or not by checking the indexer queue.

  - How to check if multiple servers are sending data to Splunk indexer?

    - You can use the following query to check the distribution of data sent to indexers by a set of forwarders: \| tstats count WHERE index=\* \[\| inputlookup somehostlookup.csv \| table host \] by splunk_server. This query will show you the distribution of data sent to indexers by the forwarders listed in the somehostlookup.csv file. You can modify this file to include the list of forwarders you want to check.

- **On Crowdstrike, how to check Crowdstrike falcon agent is installed on specific and bulk servers?**

  - You can check if the CrowdStrike Falcon agent is installed on specific and bulk servers using the CrowdStrike Falcon management interface. Here are the steps you can follow to do this:

    - Log in to the CrowdStrike Falcon management interface.

    - Click on the Hosts tab.

    - Use the search bar to search for specific hosts or use filters to view a list of hosts.

    - The list of hosts will show you if the CrowdStrike Falcon agent is installed on each host.

>  
>
>  
>
> <span class="mark">Deployed the universal forwarder on more than 100 windows and linux servers to inject data.</span>
>
>  
>
> <span class="mark">Developed Splunk search processing language queries to parse data, create charts, reports and dashboards.</span>
>
>  
>
> <span class="mark">Developed Splunk dashboard to monitor more than 100 apps for their usage, errors and total installed applications</span>
>
>  
>
>  
>
>  
>
> **<span class="mark">Implemented the application monitoring dashboards on Splunk SIEM for Aerospace client for multiple versions of more than 100 apps.</span>**
>
> Implementing application monitoring dashboards on Splunk SIEM for an Aerospace client with multiple versions of more than 100 apps can be a complex task. Here are some general steps you can follow to get started:

- **Identify the data sources**: The first step is to identify the data sources that need to be monitored. This includes logs, events, and other data generated by the applications, as well as any relevant infrastructure components such as servers, network devices, and cloud services.

- **Configure data collection**: Once you have identified the data sources, you need to configure Splunk to collect the data. This can be done using Splunk Forwarders or other data collection methods supported by Splunk.

- **Create dashboards**: After the data is being collected, you can create dashboards to visualize and monitor the data. Splunk offers a wide range of visualization options, including charts, tables, and maps. You can use these visualizations to create custom dashboards that provide insights into the health and performance of your applications.

- **Set up alerts**: In addition to creating dashboards, you can also set up alerts to notify you when certain conditions are met. For example, you could set up an alert to notify you when an application generates an error or when a server's CPU usage exceeds a certain threshold.

- **Customize for your needs**: Finally, it's important to customize the monitoring solution to meet the specific needs of your Aerospace client. This may involve creating custom searches, reports, and dashboards to provide the insights and information that are most relevant to your client.

>  
>
> I hope this information helps you get started with implementing application monitoring dashboards on Splunk SIEM for your Aerospace client!
>
> \(1\) Citrix Analytics dashboards for Splunk. [<u>https://docs.citrix.com/en-us/security-analytics/siem-integration/splunk-dashboards.html</u>](https://docs.citrix.com/en-us/security-analytics/siem-integration/splunk-dashboards.html).
>
> \(2\) Dashboards and forms - Splunk Documentation. [<u>https://docs.splunk.com/Documentation/Splunk/latest/Viz/Overviewofdashboards</u>](https://docs.splunk.com/Documentation/Splunk/latest/Viz/Overviewofdashboards).
>
> \(3\) Microsoft Office 365 Monitoring Solutions \| Splunk. [<u>https://www.splunk.com/en_us/solutions/microsoft-office-365-monitoring.html</u>](https://www.splunk.com/en_us/solutions/microsoft-office-365-monitoring.html).
>
> \(4\) What is SIEM? Security Information and Event Management \| Splunk. [<u>https://www.splunk.com/en_us/data-insider/what-is-siem.html</u>](https://www.splunk.com/en_us/data-insider/what-is-siem.html).
>
>  
>
> **Splunk 2019**
>
> Data injection in Splunk
>
> Creation of monitoring dashboards
>
> Configuration of Forwarders
>
>  
>
>  
>
>  
>
>  
>
> <span class="mark">Having experience in scripting languages such as bash shell and Azure CLI scripting.</span>
>
> Bash is a Unix command line interface for interacting with the operating system, available for Linux and macOS. Bash scripts help group commands to create a program. All instructions that run from the terminal work in Bash scripts as well. Bash scripting is a crucial tool for system administrators and developers. Scripting helps automate repetitive tasks and interact with the OS through custom instruction combinations<sup>1</sup>.

- To start writing a Bash script, you need to create a new file using a text editor. The extension for Bash scripts is .sh, but it’s not necessary. Adding the .sh extension makes the file easy to identify and maintain<sup>1</sup>.

- The first line in Bash scripts is a character sequence known as the “shebang”. The shebang is the program loader’s first instruction when executing the file, and the characters indicate which interpreter to run when reading the script. Add the following line to the file to indicate the use of the Bash interpreter: \#!/bin/bash<sup>1</sup>.

- After adding a shebang, you can continue writing your script by adding comments and code. Comments are lines that do not execute but help with code readability. You can add comments by starting a line with \#. For example: \# This is a comment[<sup><u>1</u></sup>](https://www.bing.com/ck/a?!&&p=5759375d7f6d66d9JmltdHM9MTY5NDAzMjUwMA&ptn=3&hsh=3&fclid=d99ff8d1-4cf4-11ee-9d7a-af017d2d3d6a&u=a1aHR0cHM6Ly9waG9lbml4bmFwLmNvbS9rYi93cml0ZS1iYXNoLXNjcmlwdA&ntb=1&bc=1&key=psc-underside&usparams=cvid%3a51D%7cBingProd%7c66C8FD47C9E89D1FAED4F1D63F1B7571D1F1FC92E35BCFD062D9849D638817E2%5ertone%3aPrecise).

- You can then add code to your script by writing commands just like you would in the terminal. For example, to create a script that updates and upgrades the system, you could write something like this:

> \#!/bin/bash\
> \# A simple Bash script\
> sudo apt update -y\
> sudo apt upgrade -y\
> echo Done!
>
> **How to write Azure CLI Script?**
>
> Azure Command-Line Interface (CLI) is a powerful tool that allows you to interact with Azure services and resources using commands in your command-line shell. You can use Azure CLI to create, manage, and delete resources, as well as perform other tasks<sup>1</sup>.

- To write an Azure CLI script, you can use any text editor to create a new file. The file extension for Azure CLI scripts is .azcli, but it’s not necessary. Adding the .azcli extension makes the file easy to identify and maintain[<sup><u>2</u></sup>](https://www.bing.com/ck/a?!&&p=70152c92cd485d69JmltdHM9MTY5NDAzMjYzMQ&ptn=3&hsh=3&fclid=27ad6ffd-4cf5-11ee-88c6-fcce0d497430&u=a1aHR0cHM6Ly9zdGFja292ZXJmbG93LmNvbS9xdWVzdGlvbnMvNjE4ODU0MTAvaXMtdGhlcmUtc29tZS10b29sLWNvbW1hbmQtdG8tcnVuLWF6Y2xpLWZpbGVzLWZyb20tcG93ZXJzaGVsbA&ntb=1&bc=1&key=psc-underside&usparams=cvid%3a51D%7cBingProd%7c66C8FD47C9E89D1FAED4F1D63F1B7571D1F1FC92E35BCFD062D9849D638817E2%5ertone%3aPrecise).

- You can then add code to your script by writing commands just like you would in the terminal. For example, to create a script that creates a new resource group, you could write something like this:

> \#!/bin/bash\
> \# A simple Azure CLI script\
> az group create --name myResourceGroup --location eastus\
> echo Done!
>
>  
>
>  
>
> **<span class="mark">What worked on Azure cloud logging tools such as log analytics agent/workspace, diagnostics log and activity log settings?</span>**
>
>  
>
> Azure provides several cloud logging tools that can help you monitor and analyse your resources. Some of these tools include:

- **Log Analytics Agent**: The Log Analytics agent collects telemetry from your cloud and on-premises environments and sends it to a Log Analytics workspace for analysis. This agent can be installed on Windows and Linux servers, and can collect data from various sources, including event logs, performance counters, and custom logs.

- **Log Analytics Workspace**: A Log Analytics workspace is a unique environment for storing and analyzing log data collected by the Log Analytics agent. You can use the workspace to create custom queries, alerts, and dashboards to monitor your resources.

- **Diagnostics Logs**: Azure services generate diagnostics logs that provide detailed information about the operation of the service. These logs can be used to troubleshoot issues, monitor performance, and understand usage patterns.

- **Activity Logs:** The Azure Activity Log provides insight into subscription-level events that have occurred in your Azure account. This includes actions such as creating or deleting resources, starting or stopping virtual machines, and more.

## Internal Audit Interview

Scenario 1 Before officially finishing an audit or presenting a report to the Board of Directors, what is the PRIMARY objective of meeting with auditees?

Your Response The primary purpose for meeting with auditees prior to formally closing a review is to gain agreement on the findings

Scenario 2 During an audit of a production system's change control, You have finds that the change management process isn't documented and that some of the migration procedures didn't work. What will you do Next ?

Your Response Before advising that the business take any further action, I will first examine all alternatives. I shall get reassurance that the reported occurrences are attributable to flaws in the change management process and were not caused by another process.

Scenario 3 What are the parts of the internal audit concept must be discussed prior to beginning the actual auditing process in the organization.

Your Response ● The audit charter ● Audit independence ● Assurance and consulting services

Scenario 4 Why Compliance testing is important in Internal Audit ?

Your Response Compliance testing is important because it uncovers problems with poor adherence to control standards

Scenario 5 You are responsible for conducting privacy audit in the organization. Which of the following steps you will consider?

Your Response

Understand the business requirement and check appropriate privacy law

Check any privacy policy is exit

Are policies and procedures for creating, storing, and managing privacy data applied and followed

Check any sop for privacy

Are specific controls implemented, and are compliance tasks

>  

## Vulnerability management

 

Day to day activities

- **Update status of all vulnerabilities and findings.**

  - Managing process of identifying, tracking, and resolving security weaknesses.

  - Identify vulnerabilities through vulnerability scanners, pentest, or ongoing threat intelligence.

  - Analyze the vulnerabilities:

    - Type of vulnerability means software bug or configuration error.

    - Severity: Critical high, medium, low

    - Potential impact if exploited: Data breach or system outage

    - Source of finding : Security scan, pentest?

  - Tracking

    - New vulnerability identified

    - Assigned to security team member responsible for investigation

    - Inprogress: Team is working on solution ie patching or changing configurations.

    - Remediated: Vulnerability has been addressed

    - False positive: initial findings determined was mistake

    - Workaround implemented: temporary solution is in place while permanent fix is developed

  - Maintain records

    - Track and document all vulnerability findings

 

 

 

 

 

 

OWASP Top-10 2021

> OWASP Top 10 are the most critical web security risks
>
> OWASP is maintained by Open Web Application Security Project

- **A01: Broken Access Control** - Exploitable flaws in access control mechanisms that could allow unauthorized users to access sensitive data, functionality, or resources.

- **A02: Cryptographic Failures** - Inappropriate or weak use of cryptography, leading to breaches of confidentiality, integrity, or authenticity.

- **A03: Injection** - Security vulnerabilities where untrusted data is sent to an interpreter as code, potentially allowing attackers to inject malicious code and execute it.

- **A04: Insecure Design** - Security flaws stemming from fundamental design issues that leave applications vulnerable to attack.

- **A05: Security Misconfiguration** - Inadequate security settings or leaving defaults that expose vulnerabilities.

- **A06: Vulnerable and Outdated Components** - Using components with known security vulnerabilities that haven't been patched.

- **A07: Identification and Authentication Failures** - Flaws in how users are identified and authenticated, allowing unauthorized access or impersonation.

- **A08: Software and Data Integrity Failures** - Security weaknesses that could allow attackers to modify data or code in transit or at rest.

- **A09: Security Logging and Monitoring Failures** - Insufficient logging or monitoring of security events, making it difficult to detect and respond to attacks.

- **A10: Server-Side Request Forgery (SSRF)** - An attack technique that forces a server to make unauthorized requests to a different server.
