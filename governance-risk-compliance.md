# Microsoft 365 Compliance

Assessed and configured the Insider Risk Management solution in Microsoft 365 Compliance (Purview).

- Configuration of Insider Risk Management
- Configuration of DLP
- Configuration of Communication Compliance

Configured the Insider Risk Management solution in Microsoft 365 Compliance.

Microsoft 365 offers an Insider Risk Management solution that helps minimize internal risks by enabling you to detect, investigate, and act on potentially malicious and inadvertent activities in your organization¹. The solution correlates various signals to identify potential insider risks, such as IP theft, data leakage, and security violations².

To configure the Insider Risk Management solution in Microsoft 365 Compliance, follow these steps:

- Confirm your Microsoft 365 subscription and any add-ons. To access and use Insider Risk Management, your organization must have supporting subscriptions or add-ons¹.
- Go to the Microsoft 365 compliance center and navigate to the **Solutions** tab.
- Select **Insider risk management**.
- Follow the on-screen instructions to set up the solution.

Planned, designed, and implemented Azure Sentinel.

Defined and implemented an Azure security validation process for newly onboarded clients.

## Azure Security Validation Process

The Azure security validation process is a set of steps and procedures organizations can follow to ensure that their Azure resources are secure and compliant with industry standards and regulations. This process typically involves the following steps:

- **Assessment**: Assess the current security posture of your Azure resources. Use tools such as Azure Security Center to obtain a centralized view of the security state of your resources and to identify actions that improve your security posture.
- **Remediation**: Based on the assessment results, remediate any identified vulnerabilities or misconfigurations. This can include enabling encryption, configuring firewalls, and applying security patches.
- **Monitoring**: Ongoing monitoring is an important part of the Azure security validation process. Use tools such as Azure Monitor to collect and analyze log data from your resources, and set up alerts to notify you of potential security issues.
- **Compliance**: Compliance with industry standards and regulations is an important part of the process. Use tools such as Azure Policy to define and enforce compliance policies across your resources, and use Azure Blueprints to implement pre-defined compliance architectures.

By following this process, organizations can ensure that their Azure resources are secure and compliant with industry standards and regulations.

Led the security validation of Azure infrastructure for 20 newly onboarded clients across 40 subscriptions before going live.

## Security Assessment of Azure Cloud Infrastructure

Performed a security assessment of Azure cloud infrastructure for newly onboarded clients before moving to production. This is an important step in ensuring the security and compliance of the infrastructure.

Steps to perform a security assessment:

- **Review the architecture**: Review the Azure cloud infrastructure architecture to understand how the different components are connected and how data flows between them.
- **Assess the security controls**: Evaluate the security controls in place, such as firewalls, encryption, and access controls. Ensure these controls are properly configured and meet your organization's security requirements.
- **Check for vulnerabilities**: Use vulnerability scanning tools to identify vulnerabilities in the infrastructure. Prioritize and remediate any identified vulnerabilities.
- **Review compliance**: Ensure the infrastructure is compliant with relevant industry standards or regulations, such as PCI DSS or HIPAA.
- **Test incident response**: Test the incident response plan to ensure preparedness for security incidents.

Improved cloud security posture by increasing Secure Score from 51% to 65% in Microsoft Defender for Cloud.

Assisted the security architect in defining an Azure security baseline.

## Steps to Define an Azure Cloud Security Baseline

- **Understand your compliance requirements**: Identify your organization's compliance requirements, including industry standards such as PCI DSS or HIPAA, as well as internal security policies.
- **Assess your current security posture**: Use tools such as Azure Security Center or AWS Security Hub to assess the current security posture of your cloud resources. These tools provide recommendations and help identify compliance gaps.
- **Define a security baseline**: Based on compliance requirements and assessment results, define a security baseline for your cloud resources. Include a set of minimum security controls needed to meet requirements.
- **Implement the baseline**: Implement the security controls defined in the baseline across your cloud resources. This can include configuring security settings, enabling encryption, and applying security patches.
- **Monitor and validate**: Regularly monitor your cloud resources to ensure they remain compliant with your security baseline. Use tools such as Azure Policy or AWS Config to automate compliance checks and validate baseline adherence.

Assessed SAP on Azure design and defined cloud security controls for the Azure environment.

## SAP on Azure Security Assessment

Performed an initial security assessment for deployment of SAP systems on Azure Cloud.

Steps to perform a security assessment:

- **Review the architecture**: Review the SAP systems architecture and Azure deployment to understand how components are connected and how data flows between them.
- **Assess the security controls**: Evaluate the security controls in place, such as firewalls, encryption, and access controls. Ensure these controls are properly configured and meet your organization's security requirements.
- **Check for vulnerabilities**: Use vulnerability scanning tools to identify vulnerabilities in the infrastructure. Prioritize and remediate identified vulnerabilities.
- **Review compliance**: Ensure the infrastructure is compliant with relevant industry standards or regulations, such as PCI DSS or HIPAA.
- **Test incident response**: Test the incident response plan to ensure preparedness for security incidents.

Developed and enforced a security baseline for Azure infrastructure covering compute, network, and storage services.

Improved organizational security posture by remediating vulnerabilities and implementing security best practices.

## Vulnerability Remediation

Effective remediation of vulnerabilities requires collaboration with IT and development teams.

- Create shared visibility: ensure that everyone has access to the same data and uses the same data set for understanding and prioritization.
- Use common analytics: ensure teams are looking at the same reports and analytics so they can work together on shared goals.
- Optimize developer experience: make it easy for developers to remediate vulnerabilities by providing tools and resources.
- Create and monitor ServiceNow tickets for vulnerability remediation, including patching, Windows, network, Citrix, and development.

## MDC Qualys Vulnerability Report Extraction

- Use Azure Resource Graph Explorer:
  - `securityresources | where type == "microsoft.security/assessments" | where properties.displayName contains "Vulnerabilities in Azure Container Registry images should be remediated".`
- Use a workbook in MDC.

Analyzed and remediated vulnerability data from Tenable and CrowdStrike scan reports for on-premises and cloud environments.

## Reviewing Vulnerability Findings

- Access the reports: log in to each vulnerability scanner and navigate to the reports section.
- Review findings: review identified vulnerabilities, their severity, and affected assets.
- Prioritize remediation: prioritize remediation based on severity and impact.
- Take action: work with IT and security teams to implement recommended remediation actions.

## Prioritizing Vulnerabilities

- **Severity of the vulnerability**: prioritize vulnerabilities based on severity ratings such as CVSS.
- **Asset criticality**: prioritize based on the importance of the affected asset.
- **Threat intelligence**: prioritize vulnerabilities actively exploited in the wild.
- **Mitigating controls**: consider existing controls that reduce risk or impact.
- **Patch availability**: if a patch is available, apply it as soon as possible.

Note: the goal of prioritization is to reduce risk to the organization as effectively and efficiently as possible.

## Analyzing Vulnerabilities

Analyzed vulnerability data sets of 100k to 700k records by applying a systematic approach to extract insights and identify trends.

- **Data preparation**: clean data, handle missing values, remove duplicates, and standardize formats. Create features from existing data to gain deeper insight.
- **Exploratory data analysis (EDA)**: summarize using descriptive statistics and create visualizations such as histograms, bar charts, and scatter plots.
- **Vulnerability assessment**: classify vulnerabilities by impact (Critical/High/Medium/Low) and exploitability (Remote/Local/User interactive). Use CVSS scoring for prioritization.
- **Pattern recognition and trend analysis**: analyze trends in vulnerability occurrence, severity, and exploitability over time. Group vulnerabilities by affected software, attack vector, or mitigation strategy.
- **Risk assessment and prioritization**: assess risk based on impact, exploitability, and asset value. Prioritize the most critical vulnerabilities first.
- **Communication and reporting**: generate reports summarizing findings, highlighting critical vulnerabilities, and recommending remediation.
- **Continual monitoring and improvement**: continuously monitor vulnerability databases and update the analysis with the latest information.

## Remediating Vulnerabilities

Collaboration with IT and development teams includes:

- IT teams: patching, Windows, Citrix, VMware, network.
- Development teams: app, infrastructure (Azure), DevOps.
- In Citrix, patch only the gold server, then push the gold image to target servers (called VDA).

Improved vulnerability monitoring dashboards by resolving vulnerability scanning and remediation reporting issues.

## Creating Vulnerability Reports and Dashboards

- Created vulnerability reports in Excel and Power BI dashboards for monitoring monthly vulnerability trends by client product, environment, Citrix/non-Citrix, VDA/non-VDA, platform (Windows/Linux), and datacenter (Azure/on-prem/3rd party).
- Created Power BI dashboards showing vulnerabilities across datacenters, environments, products, product classes, hosted OS, severity, CVE ID, and trend lines.

## Documenting the Vulnerability Management Process

- Define the scope: clearly define the systems, applications, and data covered by the vulnerability management program.
- Identify roles and responsibilities: assign roles for security teams, IT teams, and business units.
- Outline the process: document steps for scanning, analysis, prioritization, remediation, and verification.
- Establish metrics: measure effectiveness with metrics such as the number of vulnerabilities identified, remediation time, and risk reduction.
- Review and update: regularly review and update documentation to keep it accurate.

## CrowdStrike Spotlight Vulnerability Scanning Experience

CrowdStrike Spotlight reported duplicate entries for vulnerabilities. For example, CVE-2022-1234 on server1 could appear four times in a one-month report if the scanner ran every weekend, even though only one vulnerability instance existed.

Performed on-demand vulnerability scanning and made recommendations to IT teams for mitigation and remediation.

Identified the risk and impact of third-party zero-day vulnerabilities and made recommendations to IT teams to mitigate risk.

## Zero-day Vulnerability Response Process

A zero-day vulnerability is a software vulnerability that is unknown to the software vendor and the public, but known to attackers who exploit it before the vendor can fix it. The response process typically involves the following steps:

- **Detection**: Detect the vulnerability through monitoring for unusual activity, analyzing network traffic, or receiving reports from security researchers.
- **Analysis**: Analyze the potential zero-day vulnerability to determine its severity, impact, and attack vectors.
- **Containment**: Contain the vulnerability to prevent exploitation by implementing temporary mitigations, such as blocking network traffic or disabling features.
- **Remediation**: Remediate the vulnerability by releasing a patch or update that fixes the underlying issue.
- **Notification**: Notify affected parties, such as customers and partners, about the zero-day vulnerability and the steps taken to address it.

By following this process, organizations can effectively respond to zero-day vulnerabilities and minimize their impact.

Collaborated with stakeholders to review security exceptions and streamlined the process to enhance governance of exceptions.
