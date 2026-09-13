# Contents

[Introduction [1](#introduction)](#introduction)

[Concept [1](#concept)](#concept)

[Features [1](#features)](#features)

[1. Cloud Security Tools Overview
[2](#cloud-security-tools-overview)](#cloud-security-tools-overview)

[2. Cloud Security Posture Management (CSPM)
[2](#cloud-security-posture-management-cspm)](#cloud-security-posture-management-cspm)

[3. Cloud Workload Protection Platform (CWPP)
[2](#cloud-workload-protection-platform-cwpp)](#cloud-workload-protection-platform-cwpp)

[4. Cloud-Native Application Protection Platform (CNAPP)
[2](#cloud-native-application-protection-platform-cnapp)](#cloud-native-application-protection-platform-cnapp)

[5. Comparison: CSPM vs. CWPP vs. CNAPP
[3](#comparison-cspm-vs.-cwpp-vs.-cnapp)](#comparison-cspm-vs.-cwpp-vs.-cnapp)

[6. Microsoft Defender for Cloud
[3](#microsoft-defender-for-cloud)](#microsoft-defender-for-cloud)

[Cloud Workload protection
[3](#cloud-workload-protection)](#cloud-workload-protection)

[CNAPP Selection criteria
[4](#cnapp-selection-criteria)](#cnapp-selection-criteria)

[How to assess CSPM solution?
[4](#how-to-assess-cspm-solution)](#how-to-assess-cspm-solution)

[Benefits [4](#benefits)](#benefits)

[Architecture [4](#architecture)](#architecture)

[Workflow automation [6](#workflow-automation)](#workflow-automation)

[Cloud Security Engineer
[7](#cloud-security-engineer)](#cloud-security-engineer)

[Scenarios [8](#scenarios)](#scenarios)

# Introduction

**Microsoft Defender for Cloud (MDC)** is a security service that helps
you secure your Azure, hybrid, and multi-cloud environments. MDC uses
advanced detections to identify threats and generate security alerts.
Microsoft Defender for Cloud is a robust security solution designed to
safeguard Azure and hybrid cloud environments. It offers a suite of
features to continuously assess, secure, and defend cloud workloads.

 

<span class="mark">Planned, designed, and implemented Microsoft Defender
for cloud.</span>

<span class="mark">Assessed and configured the cloud security posture
management (CSPM) solution.</span>

## Concept

## Features

Continuously Assess

- **Secure Score:** Provides a numerical rating of overall security
  posture.

- **Vulnerability Assessment:** Identifies and tracks vulnerabilities.

- **Asset Inventory:** Tracks and manages all assets.

- **Regulatory Compliance:** Assesses compliance with industry
  standards.

- **File Integrity Monitoring:** Detects unauthorized file changes.

Secure

- **Security Recommendations:** Provides actionable recommendations for
  improvement.

- **Just-In-Time VM Access:** Restricts VM access to specific time
  periods and users.

- **Adaptive Network Hardening:** Automatically adjusts network security
  policies.

- **Adaptive Application Control:** Enforces application whitelisting
  and blacklisting.

Defend

- **Microsoft Defender:** Provides advanced threat protection.

- **Security Alerts:** Generates alerts for suspicious activities.

- **Integration with SIEM, SOAR, and IT Solutions:** Integrates with
  existing security tools.

- **Threat Detection and Protection:** Protects Azure and non-Azure VMs,
  as well as Azure PaaS services.

## 1. Cloud Security Tools Overview

Cloud security tools help organizations secure their cloud environments
by identifying risks, enforcing compliance, and mitigating threats. The
key categories include:

- **Cloud Security Posture Management (CSPM)**

- **Cloud Workload Protection Platform (CWPP)**

- **Cloud-Native Application Protection Platform (CNAPP)**

## 2. Cloud Security Posture Management (CSPM)

**What is CSPM?**

Cloud Security Posture Management (CSPM) is a set of security tools and
practices that continuously monitor and manage cloud security risks,
misconfigurations, and compliance issues.

**Key Features:**

- **Continuous Monitoring:** Evaluates cloud environments against best
  practices and security benchmarks.

- **Risk Assessment:** Identifies security risks based on configuration
  and usage.

- **Misconfiguration Detection & Remediation:** Identifies and fixes
  cloud misconfigurations.

- **Compliance Validation:** Monitors compliance with industry standards
  and regulatory requirements.

- **Asset Inventory:** Provides full visibility of cloud resources.

- **Threat Identification:** Detects existing, new, and potential
  threats.

- **Secure Score:** Assesses security posture and provides
  recommendations for improvement.

**How CSPM Works:**

- Continuously compares cloud configurations with security frameworks.

- Provides alerts for misconfigurations and non-compliance.

- Suggests remediation actions to improve security posture.

**Benefits:**

- Reduces the risk of security breaches.

- Improves compliance with regulations.

- Enhances security visibility and management.

## 3. Cloud Workload Protection Platform (CWPP)

**What is CWPP?**

A Cloud Workload Protection Platform (CWPP) provides security for cloud
workloads, including virtual machines, containers, databases, and
serverless functions.

**Key Features:**

- **Threat Detection:** Identifies and mitigates security threats across
  cloud workloads.

- **Adaptive Application Control:** Restricts execution to approved
  applications.

- **Just-in-Time (JIT) VM Access:** Reduces attack surfaces by limiting
  VM exposure.

- **Adaptive Network Hardening:** Provides dynamic network security
  configurations.

- **Regulatory Compliance:** Ensures security policies align with
  industry standards.

- **File Integrity Monitoring:** Detects unauthorized changes to
  critical files.

**How CWPP Works:**

- Monitors cloud workloads for vulnerabilities and threats.

- Implements security policies to mitigate risks.

- Provides workload-specific security recommendations.

**Benefits:**

- Enhanced protection for cloud workloads.

- Improved compliance and security visibility.

- Real-time detection and response to threats.

## 4. Cloud-Native Application Protection Platform (CNAPP)

**What is CNAPP?**

Cloud-Native Application Protection Platform (CNAPP) is a comprehensive
security solution that combines multiple cloud security functionalities
to protect cloud-native applications throughout their lifecycle.

**Components of CNAPP:**

- **Cloud Security Posture Management (CSPM)**

- **Cloud Workload Protection Platform (CWPP)**

- **Cloud Infrastructure Entitlement Management (CIEM)**

- **Cloud Service Network Security (CSNS)**

- **DevSecOps Security for CI/CD Pipelines**

**Key Features:**

- **Unified Cloud Security:** Integrates multiple security capabilities
  into a single platform.

- **Threat Protection:** Detects and mitigates security threats across
  cloud-native applications.

- **Security for DevSecOps:** Protects code and infrastructure within
  CI/CD pipelines.

- **Continuous Compliance:** Ensures applications adhere to security
  policies and regulations.

- **Runtime Protection:** Monitors and secures applications in
  production.

**How CNAPP Works:**

- Provides a centralized view of security across cloud-native
  applications.

- Detects and remediates risks at all stages of the application
  lifecycle.

- Integrates security into DevSecOps workflows.

**Benefits:**

- Comprehensive protection for cloud-native applications.

- Improved visibility and control over cloud security.

- Simplified security management for DevSecOps teams.

## 5. Comparison: CSPM vs. CWPP vs. CNAPP

| **Feature** | **CSPM** | **CWPP** | **CNAPP** |
|----|----|----|----|
| **Focus** | Cloud security posture & compliance | Cloud workload security | Comprehensive cloud-native security |
| **Risk Monitoring** | Yes | Yes | Yes |
| **Threat Detection** | Limited | Yes | Yes |
| **Compliance & Misconfiguration Fixing** | Yes | Limited | Yes |
| **Workload Security** | No | Yes | Yes |
| **CI/CD Pipeline Security** | No | No | Yes |
| **DevSecOps Integration** | No | No | Yes |
| **Security Automation** | Yes | Yes | Yes |

------------------------------------------------------------------------

## 6. Microsoft Defender for Cloud

Microsoft Defender for Cloud is a native Azure security solution that
combines CSPM and CWPP capabilities. It provides:

**CSPM Features:**

- Free Secure Score assessment.

- Continuous assessment and recommendations.

- Cloud resource inventory management.

**CWPP Features:**

- Threat detection for Azure and non-Azure workloads.

- Just-in-Time (JIT) VM access.

- Adaptive application and network hardening.

- Regulatory compliance dashboards and reports.

**Why Defender for Cloud?**

- Provides unified security for Azure, hybrid, and multi-cloud
  environments.

- Offers built-in compliance management.

- Enhances security posture with automated remediation.

------------------------------------------------------------------------

**Conclusion**

- **CSPM** focuses on cloud security posture, identifying risks and
  compliance gaps.

- **CWPP** protects cloud workloads by detecting and mitigating threats.

- **CNAPP** is a comprehensive solution combining CSPM, CWPP, and
  additional security measures to protect cloud-native applications.

- **Microsoft Defender for Cloud** integrates CSPM and CWPP capabilities
  for a unified cloud security approach.

## Cloud Workload protection

 

Cloud workload protections (CWP) surface workload-specific
recommendations that lead you to the right security controls to protect
your workloads.

Correlate alerts to identify attack patterns and integrate with Security
Information and Event Management (SIEM), Security Orchestration
Automated Response (SOAR), and IT Service Management (ITSM) solutions to
respond to threats and limit the risk to your resources.

**Protect Containers:** Secure your containers so you can improve,
monitor, and maintain the security of your clusters, containers, and
their applications with environment hardening, vulnerability
assessments, and run-time protection. Protects containers from malicious
images, runtime attacks, and network threats, provides vulnerability
assessment, and application control.),

**Protect Databases**: Protect your entire database estate with attack
detection and threat response for the most popular database types in
Azure to protect the database engines and data types, according to their
attack surface and security risks. Protects DBs from SQL injection, data
leakage, and data classification

**Protect servers** - Provide server protections through Microsoft
Defender for Endpoint or extended protection with just-in-time network
access, file integrity monitoring, vulnerability assessment, and more.
Protects servers from malwares, provides vulnerability assessment, file
integrity monitoring

**Protect Storage -** Detect unusual and potentially harmful attempts to
access or exploit your storage accounts using advanced threat detection
capabilities and Microsoft Threat Intelligence data to provide
contextual security alerts. Protects storage services from unauthorized
access, data exfiltration, and ransomware attacks

Provides security recommendations and alerts for as Azure App Service,
Azure Functions, Azure Key Vault, and Azure Monitor

**Security alerts:** Get informed of real-time events that threaten the
security of your environment. Alerts are categorized and assigned
severity levels to indicate proper responses.

## CNAPP Selection criteria

- Evaluate your needs considering the company’s priorities and identify
  the most pressing issues.

- Check if it offers automated remediation and can discover underlying
  services.

- Does it provide instant alerts on discovering issues?

- CSPM activity logging is available or not?

- What are the cloud services types present in our cloud infrastructure?
  **IaaS, PaaS, and SaaS**

- What are the cloud service providers we are using? **AWS and GCP**

- Do we have on-prem servers to monitor in our MDC? **Yes, we want to
  monitor on-prem servers**

- Are we using on-prem or cloud native key management solution? **Cloud
  Key vault**

- Are we using Containers and Kubernetes? **Yes**

- Are we using Database services? **Yes**

- Are we using App services? **Yes**

## How to assess CSPM solution?

- Define security requirements of your organization, including
  compliance with internal security policies, industry standards and
  regulations.

- Evaluate CSPM capabilities to ensure that it meets your security
  requirements, including ability to monitor and enforce security
  policies, identify and remediate vulnerabilities, and provide
  visibility into your cloud security posture.

- Test CSPM in a controlled environment to ensure that it is effectively
  identifying and remediating security risks and compliance issues.

- Review CSPM reports to gain insights into its effectiveness and
  identify any areas for improvement.

- Compare with other CSPM solutions in market to ensure that it is the
  best fit for your organization's needs.

 

## Benefits

- **Enhanced Security Posture:** Strengthens security by identifying and
  addressing vulnerabilities.

- **Threat Protection:** Protects against a wide range of cyber threats.

- **Improved Compliance:** Helps organizations comply with industry
  regulations.

- **Reduced Risk:** Minimizes the risk of data breaches and security
  incidents.

- **Simplified Management:** Provides a centralized platform for
  security management.

## Architecture

<img src="media/image1.png" style="width:6.11936in;height:2.83083in" />

<img src="media/image2.png" style="width:6.7774in;height:1.08376in" />

Here’s a categorized, corrected, and summarized version of your
Microsoft Defender for Cloud (MDC) documentation for better clarity and
structure.

------------------------------------------------------------------------

**Microsoft Defender for Cloud (MDC) - Corrected & Summarized Guide**

**Core Functionality & Setup**

- **Enabling MDC:** Enabled at the **subscription level**.

  - Path: MDC -\> Environment -\> Subscription -\> Defender plans -\>
    Enable plans -\> Save.

- **Auto-Provisioning Log Analytics Agent:**

  - Path: MDC -\> Environment -\> Auto-provisioning -\> Set Log
    Analytics agent to ON -\> Select workspace -\> Configure event data
    -\> Save.

- **Secure Score:**

  - MDC provides a **security posture metric**, helping users improve
    security.

**Security Recommendations & Remediation**

- **Viewing Recommendations:** Available in the **MDC portal**.

- **Remediation Approaches:**

  1.  **Automated Remediation:**

      - Some recommendations allow direct remediation within MDC.

      - **Azure Playbooks (Logic Apps)** enable automated remediation
        for complex cases.

  2.  **Manual Remediation:**

      - Users must follow prescribed steps in MDC for resolution.

      - **Quick Fix:** Select resource → Click "Remediate".

- **Fine-Tuning Recommendations:** Use **exemption rules** to customize
  security recommendations.

**Protecting Virtual Machines & Cloud Workloads**

- **Azure VMs:**

  - **Enable Defender for the specific subscription** to protect Azure
    VMs.

- **AWS & GCP VMs:**

  - **Onboard machines using Azure Arc.**

  - **Install Log Analytics Agent** for visibility and security
    insights.

- **Protecting Web Applications:**

  - **Azure Web Application Firewall (WAF)** (integrated with App
    Gateway or Front Door).

  - **MDC provides additional protection** for web apps.

**Custom Security Alerts & Threat Detection**

- **Creating Custom Security Alerts:**

  - Develop a **KQL query** in Log Analytics.

  - Configure an **alert rule** to trigger **email notifications**.

- **Anomaly Detection:**

  - Tools: **MDC, KQL queries (LAW), Azure Sentinel analytics rules,
    Workbooks, Azure Monitor dashboards**.

  - These tools **complement each other** but serve different purposes.

- **Threat Reports in MDC:**

  - **Activity Group Report:** Deep dive into attackers.

  - **Campaign Report:** Details on attack campaigns.

  - **Threat Summary Report:** Combined analysis from both above.

  - **Download Threat Reports:** MDC -\> Alerts -\> Select alert -\>
    "View full details" -\> Alert details -\> Threat intelligence
    report.

**Agent Deployment & Connectivity**

- **Auto-Provisioning Log Analytics Agent:**

  - Path: Defender for Cloud -\> Environment settings -\>
    Auto-provisioning -\> Enable Log Analytics Agent -\> Select
    workspace -\> Configure Windows security event data -\> Save.

- **Checking Agent Deployment Status (PowerShell):**

- Get-AzVMExtension -ResourceGroupName \<RG_Name\> -VMName \<VM_Name\>
  -Name MicrosoftMonitoringAgent

- **Firewall Endpoints for Azure Monitor Agent:**

  - ingest.monitor.azure.com

  - control.monitor.azure.com

  - ods.opinsights.azure.com

**Defender for Cloud - AWS & GCP Integration**

- **Connecting AWS to MDC:**

  1.  Create an **IAM role** for Security Center in AWS.

  2.  Create an **AWS user** for authentication.

  3.  Enable **AWS Config** and **AWS Security Hub**.

  4.  Verify data flow into Security Hub.

- **Connecting GCP to MDC:**

  1.  Configure **GCP Security Command Center**.

  2.  Enable **Security Health Analytics API**.

  3.  Add **cloud connectors** from MDC.

  4.  Create **service accounts** with private keys in GCP.

- **GCP Data Transfer via Security Command Center API:**

  - Enable **Google Security Command Center API** in the GCP Console.

**MDC Alerts & Suppression Rules**

- **MDC Alert Suppression:**

  - Suppression **expires after 6 months**.

  - **Changes in rule criteria** may cause suppression to stop working.

- **Roles for Suppression Rules:**

  - **Security Admin & Owner** have permissions.

- **Security Alert Severity Levels:**

  - **High, Medium, Low, Informational**.

**Simulating & Testing Defender for Cloud**

- **Simulating Alerts on a Linux VM:**

  - Copy an **executable to the VM and execute it**.

  - Ensure the action is flagged as suspicious.

 

## Workflow automation

This document covers automating responses to security alerts and
recommendations within Microsoft Defender for Cloud.

**Key Points:**

- **Workflow automation:** This feature allows triggering automated
  actions based on security alerts and recommendations.

- **Benefits:** Automating security workflows can improve response time,
  reduce human error, and streamline security processes.

- **Components:**

  - **Triggers:** Events that initiate the workflow, such as a new
    security alert or recommendation.

  - **Data types:** Alerts, recommendations, or regulatory compliance
    standards.

  - **Actions:** Steps taken in response to the trigger, like notifying
    stakeholders or running remediation scripts.

  - **Logic Apps:** Azure service for creating automated workflows.

**Automating Remediation of MDC Recommendations:**

- Utilize workflow automation with pre-built remediation scripts from
  Microsoft
  (<https://github.com/Azure/Microsoft-Defender-for-Cloud/blob/master/Remediation%20scripts/README.md>).

- Leverage Azure Logic Apps to build custom workflows for specific
  remediation tasks.

**Additional Considerations:**

- **Least privilege principles:** Apply access controls and minimize
  user privileges to reduce attack impact.

- **Strong password practices:** Enforce strong passwords and consider
  two-factor authentication (2FA).

- **Account lockout policies:** Implement account lockout policies to
  prevent brute-force attacks.

- 

**Note:** The document includes a section on least privilege principles,
which is not directly related to workflow automation but is a valuable
security best practice.

## Cloud Security Engineer

<span class="mark">Tell us about the last problem you solved as a Cloud
Security Engineer?</span> 

As a Cloud Security Engineer, it was being a good listener count. It
would be best if you answered this question in a solid compact way. a)
The problem in line. b) The turning point which helped overcome the
crisis (max two lines).

<span class="mark">What will your priorities be as a Cloud security
engineer at the organization after the previous guy was fired for
incompetence?</span>

Note: Imagine you start on day-one with no knowledge of the
environment**.**

Note: Interviewer do not want list here; they are looking for basics.

My priorities would be to assess the current state of the company’s
cloud security posture and identify any gaps or vulnerabilities that
need to be addressed.

**Immediate Priorities (First 30-60 Days):**

- Understand the Environment: Conduct a thorough security posture
  assessment to understand the existing cloud infrastructure, security
  controls in place, and potential vulnerabilities. Network diagrams.
  Infrastructure documentation, Process documentation, Visibility touch
  points. Ingress and egress filtering. Where is the important data? Who
  interacts with it? What are the tools we are using? Which tools are
  used for ITSM, SIEM? Which teams are working on what tasks, their
  contact details?

- Review Security Policies & Procedures: Analyze existing security
  policies and procedures for effectiveness and identify any gaps or
  outdated practices. I will go through process and infrastructure
  documentation, what regulatory compliance we follow.

- Inventory and Secure Cloud Resources: Create a complete inventory of
  all cloud resources and ensure they are properly configured with
  security best practices in mind.

**Mid-Term Priorities (Next 3-6 Months):**

- Address Immediate Security Gaps: Focus on fixing the most critical
  security vulnerabilities identified during the initial assessment.
  Previous vulnerability assessments. What is being logged an audited?
  Etc. The key is to see that they could quickly prioritize, in just a
  few seconds, what would be the most important things to learn in an
  unknown situation.

- Implement Continuous Monitoring: Set up continuous security monitoring
  for cloud resources to detect potential threats and misconfigurations
  in real-time. I will work with other teams within the organization to
  develop and implement a comprehensive security strategy that addresses
  these gaps and vulnerabilities.

**Long-Term Priorities (Ongoing):**

- Refine Security Policies & Procedures: Regularly review and improve
  security policies and procedures based on identified risks and
  industry best practices.

- Proactive Security Posture Management: Move beyond reactive measures
  and focus on proactive security strategies to prevent future
  vulnerabilities and attacks.

<span class="mark">What will be your priorities if you were to start a
job as Cloud security engineer at company due to previous guy being
fired for incompetence?</span>

- Imagine you start on day one with no knowledge of the environment**.**
  Interviewer do not want list here; they are looking for basics. Where
  is the important data? Who interacts with it? Network diagrams.
  Infrastructure documentation, Process documentation, Visibility touch
  points. Ingress and egress filtering. Previous vulnerability
  assessments. What is being logged an audited? Etc. The key is to see
  that they could quickly prioritize, in just a few seconds, what would
  be the most important things to learn in an unknown situation**.**

- My priorities would be to assess the current state of the company’s
  cloud security posture and identify any gaps or vulnerabilities that
  need to be addressed.

  - What are the tools we are using? Which tools are used for ITSM,
    SIEM?

  - Which teams are working on what tasks, their contact details?

  - I will go through process and infrastructure documentation, what
    regulatory compliance we follow.

  - I will work with other teams within the organization to develop and
    implement a comprehensive security strategy that addresses these
    gaps and vulnerabilities.

<span class="mark">Tell us about the last 3 problems you solved as a
Cloud Security Engineer? </span>

As a Cloud Security Engineer, it was being a good listener count. It
would be best if you answered this question in a solid compact way. a)
The problem in line. b) The turning point which helped overcome the
crisis (max two lines).

**Problem 1: Insecure Azure Blob Storage Configuration**

- Scenario: A development team deployed a new web application to Azure.
  They inadvertently left a development storage container publicly
  accessible. This container contained unencrypted source code and
  potentially sensitive configuration files.

- Solution: I leveraged Azure Security Center's recommendations to
  identify the public blob storage container. After collaborating with
  the development team:

  - Restricted public access to the storage container.

  - Implemented Azure Active Directory (AAD) authentication for
    authorized access.

  - Encrypted the data at rest using Azure Storage Service Encryption
    (SSE).

**Problem 2: Insufficient Network Security for Azure Virtual Machines
(VMs)**

- Scenario: A security audit revealed overly permissive inbound security
  rules on a group of Azure VMs hosting a critical business application.
  This increased the attack surface and exposed the VMs to potential
  exploits.

- Solution: I analysed network traffic logs and identified unnecessary
  inbound rules. Following security best practices, I:

  - Restricted inbound traffic to only the allowed ports and protocols
    required by the application.

  - Implemented Network Security Groups (NSGs) to isolate the VMs within
    the virtual network.

  - Enabled Azure Monitor for continuous security monitoring and threat
    detection.

**Problem 3: Azure AD Phishing Attempt and Potential Account
Compromise**

- Scenario: Azure Security Center alerted me to suspicious login
  activity for an administrator account. The attempt originated from an
  unrecognized IP address outside the usual access location.

- Solution: I immediately:

  - Investigated the login attempt and confirmed it was unauthorized.

  - Implemented Azure Conditional Access to block access attempts from
    unrecognized locations.

  - Enforced multi-factor authentication (MFA) for all privileged
    accounts to prevent unauthorized access even with stolen
    credentials.

  - Reset the compromised administrator account credentials and
    initiated security awareness training to prevent future phishing
    attempts.

## Scenarios

 

<span class="mark">You have an Azure subscription that contains 50
virtual machines that run Windows Server. The virtual machines are
onboarded to Microsoft Defender for Cloud. You need to identify the
virtual machines that are missing updates and have Windows firewall
disabled. What should you configure?</span>

**Data collection** is required to provide visibility into missing
updates, misconfigured operating system security settings, endpoint
protection status, and health and threat protection. Data collection is
only needed for compute resources such as virtual machines, virtual
machine scale sets, IaaS containers, and non-Azure computers. Defender
for Cloud includes a range of advanced intelligent protections for your
workloads. The workload protections are provided through Defender plans
specific to the types of resources in your subscriptions. When you
enable auto provisioning of any of the supported extensions, the
extensions are installed on existing and future machines in the
subscription. When you disable auto provisioning for an extension, the
extension is not installed on future machines, but it is also not
uninstalled from existing machines. Workflow automation triggers Logic
Apps on security alerts, recommendations, and changes to regulatory
compliance. For example, you might want Defender for Cloud to email a
specific user when an alert occurs.

<https://learn.microsoft.com/en-us/training/modules/what-is-azure-defender/>

<https://learn.microsoft.com/en-us/training/modules/connect-non-azure-machines-to-azure-defender/>

<https://learn.microsoft.com/en-us/azure/defender-for-cloud/quickstart-onboard-aws?pivots=env-settings>


To secure cloud environments, consider these key categories and tools:

- Digital Workspace Security:

  - Secure collaboration platforms (Microsoft 365, Google Suite, Teams,
    Zoom) using native controls and potentially CASB solutions.

- Cloud Access Security Broker (CASB):

  - Gain visibility and control over SaaS applications (sanctioned and
    unsanctioned).

  - Tools: Skyhigh Security, Microsoft Defender for Cloud Apps.

- Cloud Workload Protection Platform (CWPP):

  - Secure cloud data centers and workloads without hindering agility.

  - Tools: Microsoft Defender for Cloud, Prisma Cloud, Aqua Security,
    CrowdStrike Falcon.

- Cloud Security Posture Management (CSPM):

  - Assess and improve the overall security posture of cloud
    environments.

  - Tools: CloudGuard (Check Point), Azure Security Center, AWS Security
    Hub, Google Cloud Security Command Center, Lacework.

- Cloud Data Security:

  - Control data access, location, and encryption keys.

  - Tools: Azure Key Vault, AWS KMS, Entrust, Thales.

- Cloud Identity and Access Management (IAM) and Identity Entitlement
  Management (IEM):

  - Manage user access and permissions.

  - Tools: Microsoft Entra, Saviynt, CyberArk, SailPoint, Orca.

- Cloud Application Security:

  - Secure the DevOps pipeline.

  - tools: Azure Devops, Github, Atlassian.

- Monitoring and Threat Detection:

  - End to end visibility of infrastructure and applications, and threat
    detection.

  - Tools: Dynatrace, Datadog, New Relic.

<!-- -->

- Cloud Access Security Broker (CASB)

- Cloud Identity and Entitlement Management (CIEM)

- Cloud Native Application Protection Platform (CNAPP)

- Cloud Security Posture Management (CSPM)

- Cloud Workload Protect Platform (CWPP)

- SaaS Security Posture Management (SSPM)

- Secure Web Gateway (SWG)

- Security Service Edge (SSE)

- Zero Trust Network Access (ZTNA)

**Security in the Cloud**

- **Focus:** Primarily concerned with safeguarding data and applications
  within the cloud environment.

- **Responsibilities:** Shared between the cloud provider and the
  organization using the cloud.

- **Examples of measures:**

  - Encryption of data at rest and in transit

  - Strong authentication and access controls

  - Vulnerability management and patching

  - Network security measures

## CSPM

- Security posture is a reference to the cybersecurity strength of an
  organization, which includes an assessment of its ability to detect
  and respond to security threats. Security posture encompasses
  readiness for both external and internal threats, as well as response
  and remediation capabilities.

- **Cloud Governance & Compliance**

  - Framework and regulatory compliance packs

  - Automatic and scheduled reporting

- **Asset Discovery & Identification**

  - Asset discovery

  - Risk assessment, prioritization, and remediation support

  - Automatic remediation

- **Cloud Threat Protection**

  - Applying a single, unified policy across all public clouds

  - Continuous behaviour monitoring

  - Implementing guardrails while maintaining speed and flexibility of
    Cloud

- **Cloud Data Protection**

  - Security & Privacy by Design

  - Cloud encryption

  - DLP

- **DevSecOps**

  - Support for CI/CD integration by shifting security left

  - API enablement

  - Ensuring that IaC templates are not vulnerable

<img src="media/image1.png" style="width:5.78814in;height:3.89167in" />

## CWPP

CWPP stands for Cloud Workload Protect Platform

- Cloud Workload Protection Platform (CWPP) is a workload-centric
  security product that protect server workloads in hybrid, multi-cloud,
  and data center environments.

- Provide consistent visibility and control for physical machines,
  virtual machines (VMs), containers and serverless workloads,
  regardless of location.

- Protect workloads using a combination of system integrity protection,
  application control, behavioural monitoring, intrusion prevention and
  optional anti-malware protection at runtime.

- CWPP offerings should also include scanning for workload risk
  proactively in the development pipeline.

<img src="media/image2.png" style="width:9.70906in;height:1.475in" />

<img src="media/image3.png" style="width:6.71698in;height:2.96667in" />

CWPP Risk Based Hierarchy

<img src="media/image4.png" style="width:8.68954in;height:4.09167in" />

## CIEM

- Cloud Infrastructure Entitlement Management (CIEM) is a cloud security
  solution used to manage identities and cloud permissions through the
  principle of least privilege (POLP).

- CIEM uses machine learning and analytics to detect anomalies in
  account permissions within multi-cloud environments. This visibility
  enables organizations to apply consistent identity access management
  (IAM) across their cloud services to mitigate cyber threats, such as
  data breaches and data exfiltration

- CIEM solutions are delivered through a software-as-a-service (SaaS)
  model, alongside other cloud security solutions, such as Cloud
  Security Posture Management (CSPM) and Cloud Access Service Brokers
  (CASBs).

**CIEM Benefits**

- Granular Cross Cloud Visibility of cloud entitlements from a Single
  Dashboard

- Stronger Overall Security Posture

- Enforce principle of least privilege

- Uncover the unused permission risk

- Monitor, detect & remediate anomalies

- Empower your DevOps team with the needed speed & agility

<img src="media/image5.png" style="width:9.69306in;height:2.11597in" />

**CIEM Lifecycle**

- **Discovery**: Provide granular visibility of cloud identities and
  their entitlements, in line with cloud-based activity on a continuous
  basis:

  - Non-Human /workloads Identity (services, compute instances, data
    stores, secrets)

  - Cloud policies (IAM policies, resource policies, permissions
    boundaries, ACLs)

  - Native and federated identities (On-Prem AD, Okta, Ping)

- **Correlation**: As cloud providers uses different mechanisms and
  terminology to address permissions, CIEM should have ability to
  correlate entitlements across CSPs

- **Visualization**: Provide ability to visualize and understand the
  access available to a given identity in tabular or visual format, to
  filter and search, and to view metrics and scores that help quantify
  the risk

  - visualize all identities that have access to a confidential
    resource/data

  - all permissions assigned to a given role

- **Entitlement Optimization:** Provide ability to continuously remove
  excessive permissions and reduce the attack surface of cloud
  environment.

  - Enforces strict access control via principle of least privileges.

  - Uses advanced analytics to understand which permissions are being
    used, and to assess the risk level of unused permissions and ensures
    identities have just enough entitlements to do their job and nothing
    more

- **Protection**: Detect when privileges are changed and alert the
  changes

  - Changes to entitlement/privilege could indicate a threat (e.g.
    privilege escalation).

  - Provide configurable rulesets that enable you to define the
    entitlement guardrails to be enforced.

  - Ensures IAM compliance with CIS, GDPR, SOC2, NIST, PCI DSS, ISO

- **Detection**: Provide continuous monitoring of resources and policies
  to detect suspicious activity

  - Indicates an external threat or an internal human error.

  - Configure rules to stream data to a SIEM or UEBA platform as per
    organization policy

- **Remediation**: CIEM solutions support multiple means of remediation.
  Organizations have different processes for managing entitlements

  - A new remediation policy can be sent directly to the cloud provider
    via API, or to a ticketing system or IGA system for fulfilment.

<!-- -->

- For DevOps teams, remediation can be handled as part of the pipeline
  using IaC platforms.

## CNAPP

CNAPP stands for Cloud Native Application Protection Platform

**Hybrid/Multi-Cloud Security Challenges**

- **Decentralized Administration & Lack of Visibility:**

  - No CMDB, real-time asset inventory or network topology diagrams
    exist for public cloud

  - Large number of privileged users with little governance

  - Traditional security is focused on Infrastructure built in house

  <!-- -->

  - **Complexity of Compliance Management in the Cloud:**

    - Hundreds of unique cloud services, with more added daily

    - Proving compliance to auditors challenging in dynamic environments

    - People and companies move to a greater and greater use of Cloud
      they need to be more fluid and rapid to reduce risk

  - **Inability to Rapidly Detect & Respond to Threats**

    - Data that is created natively in the cloud is invisible to
      traditional security measures

    - Traditional SIEMs do not have cloud context, and are unable to
      adapt to large data volumes and speed of change in cloud

    - Network security fails to protect data in the cloud and mobile era

-  

  - Are my Apps & Data Secure?

  - Am I compliant?

  - What do I have in the cloud?

  - What was historical behaviour seen?

  - Are my hosts & containers secure?

  - What is happening?

  - Who is making changes & why?

  - Are my apps & data secure?

## CASB

**CASB stands for Cloud Access Security Broker**

CASB is an on-premises, or cloud-based security policy enforcement
points, placed between cloud service consumers and cloud service
providers to combine and interject enterprise security policies as the
cloud-based resources are accessed. CASBs consolidate multiple types of
security policy enforcement.

CASB Security Policies include:

- Authentication

- Single sign-on

- Authorization

- Credential mapping

- Device profiling

- Encryption

- Tokenization

- Logging & alerting

- Malware detection/prevention

- Primarily aimed at protecting Software as a Service (SaaS) application
  in the cloud

- Have limited capability to support PaaS & IaaS

CASB Features

- **Visibility:**

  - Shadow IT detection

  - SaaS Usage Tracking

  - Risk Visibility

- **Compliance**:

  - Regulatory requirements

  - Compliance & Risk Assessment

  - Reporting & Orchestration

- **Threat Protection:**

  - User & Entity Behaviour Analytics

  - Malware Detection

  - Activity Monitoring

  - Block unsanctioned cloud apps

  - Define adaptive access policies.

- **Data Security**

  - Encryption

  - Tokenization

  - Data Loss Prevention

  - Configuration Audit

  - Access Control

Shadow IT use cases:

- Discover cloud services in use Regular report such as TOP 10 risky
  services in use

- Assess cloud service risk Continuous tuning to mark reliable services

- Detect data exfiltration and proxy leakage Detection of malware
  operating on the enterprise network

- Applying Cloud governance policies Automatically block selected Shadow
  IT cloud based on agreed Criteria

Sanctioned cloud use cases:

- Forensic Investigation Capture an audit trail of user activity

- Detect threats Compromised accounts, insiders, and privileged users

- Enforce collaboration policies Data shared from cloud services

- Set up the same security policies Enforce on-premises DLP solution
  policies

- Prevent cloud data mis usage Detect and remediate malware

- Higher security for supported apps Encrypt data stored in the cloud

<img src="media/image6.png" style="width:6.89591in;height:4.48466in" />

## SSPM

SSPM (SaaS Security Posture Management)

Definition: SSPM is an automated, continuous process for monitoring
cloud-based SaaS applications. It aims to minimize security risks by
identifying and correcting misconfigurations, preventing configuration
drift, and ensuring compliance.

- Key Functions:

  - Visibility: Provides a centralized view of all SaaS applications
    used within an organization.

  - Policy Enforcement: Detects risky configurations by comparing them
    to security best practices and industry standards.

  - Alerting: Generates security alerts for misconfigurations and policy
    deviations.

  - Remediation: Offers automated workflows and recommendations to
    address security risks and misconfigurations.

- Benefits:

  - Simplifies compliance management.

  - Prevents cloud misconfigurations.

  - Detects and manages excessive permissions.

## SASE

SASE stands for Security Access Service Edge.

Secure Access Service Edge (SASE) consists of two distinct components
given below

Security Service Edge that provides network security as a service

WAN edge that provides network as a service

<img src="media/image7.png" style="width:5in;height:1.88333in" />

## Secure Web Gateway (SWG)

A secure web gateway (SWG) is a security solution that prevents
unsecured internet traffic from entering an organization’s internal
network. It is used by organizations globally to protect employees and
users from accessing or being infected by malicious websites. It also
helps to ensure regulatory compliance.

According to Gartner, a secure web gateway must, at a minimum, include
URL filtering, malicious code detection and filtering, and application
controls for popular cloud applications such as Microsoft 365. An SWG is
designed to block access to or from malicious websites and links. It
enforces granular use policies and stops threats from accessing web
applications by acting as a security gateway, and it does so by
filtering web and internet traffic at the application level.

<img src="media/image8.png" style="width:5.90347in;height:3.16356in" />

## SASE vs SWG vs Firewall vs WAF

| Feature | SASE | SWG | Firewall | WAF |
|----|----|----|----|----|
| Purpose | Combines network and security functions (SWG, FWaaS, CASB, ZTNA, SD-WAN) into a cloud-delivered service, providing secure access to applications and data from anywhere. | Filters unwanted software and internet traffic, enforcing corporate and regulatory policies for web traffic. | Monitors and controls network traffic based on security rules, acting as a barrier between trusted and untrusted networks. | Protects web applications by filtering and monitoring HTTP/HTTPS traffic, defending against application-layer attacks. |
| Scope | Broad: Encompasses network and security. | Web traffic. | Network traffic. | Web application traffic (HTTP/HTTPS). |
| Layer | Cloud-delivered; encompasses multiple layers. | Application layer (Layer 7). | Network layers (Layers 3, 4, and 7 in NGFWs). | Application layer (Layer 7). |
| Focus | Secure and optimized access to applications and data, regardless of location. | Web security, policy enforcement, and threat prevention. | Network perimeter security and traffic control. | Web application vulnerability protection. |
| Key Functions | Cloud-delivered security, SD-WAN integration, Zero Trust, global reach. | URL filtering, malware scanning, application control, DLP. | Network traffic filtering, access control, NAT. | Application-layer traffic filtering, protection against web application vulnerabilities. |
| Deployment | Cloud-based. | Cloud-based or on-premises. | On-premises, cloud-based, or hybrid. | Cloud-based, on-premises, or as a service. |
| Integration | Integrates many network security functions. | Often a part of a SASE architecture. | Can be a part of the SASE architecture via FWaaS. | Can work alongside SASE, and SWG solutions. |
