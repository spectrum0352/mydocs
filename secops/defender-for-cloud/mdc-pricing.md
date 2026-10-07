# Pricing

**Azure Defender:**

- **Enabling Azure Defender:** MDC -\> Environment -\> Select
  Subscription -\> Pricing -\> Select Azure Defender "On" -\> Save.

- **Protecting Azure VMs:** Enable Azure Defender. MDC must be enabled
  first.

- **Protecting AWS/GCP VMs:**

  1.  Onboard machines as Azure resources in MDC using Azure Arc on
      Servers.

  2.  Install the Log Analytics agent on the servers.

## Foundational CSPM 

Core posture management capabilities are available for free, covering
multi-cloud and hybrid environments with continuous assessments of
security configuration, security recommendations to fix
misconfigurations and weakness, and a unified Secure Score to summarize
current security situation.

- Pricing: Free

- Enabled by default

- Provides Core posture management capabilities are available for free

- Covers multi-cloud and hybrid environments.

- Continuous assessment of the security configuration of your cloud
  resources

- Security recommendations to fix misconfigurations and weaknesses

- Secure score summarizing your current security situation

## Defender CSPM 

💰 **Pricing:** \$5/resource/month\
🔹 **Scope:** Compute, Database, and Storage resources (VMs, Storage
Accounts, OSS DBs, SQL PaaS, Servers on Machines)

**Key Capabilities:**

- **Enhanced Posture Management:** Intelligent cloud security graph to
  identify, prioritize, and reduce risk.

- **Risk Discovery & Assessment:**

  - Identity and role assignments discovery

  - Network exposure detection

  - Attack path analysis

  - Cloud security explorer for proactive risk hunting

- **Agentless Security Features:**

  - **Agentless vulnerability scanning** (Azure, AWS) – Scans installed
    software and vulnerabilities without impacting machine performance
    (every 24 hours)

  - **Agentless discovery for Kubernetes** *(Coming mid-April)*

  - **Agentless container vulnerability assessments**, including
    registry scanning *(Coming mid-April)*

  - **Agentless secrets scanning**

- **Governance & Compliance:**

  - Governance rules for timely remediation and accountability

  - Regulatory compliance and industry best practices

  - Data-aware security posture (sensitive data discovery)

- **Sensitive Data Discovery:**

  - Automatically detects cloud data resources containing sensitive data

  - Uses **agentless, smart sampling scanning**

  - Integrates with **Microsoft Purview** for sensitivity labels

**Permissions Required:**

- **Azure:** Subscription Owner

- **AWS:** Permissions added via CloudFormation stack in AWS Connector

## Cloud workload protection (CWP)

Enable MDC premium plans:

Navigate to MDC – Management – Environment settings – Subscription –
Defender plans:

## Defender for servers

Microsoft Defender for Servers, part of Microsoft Defender for Cloud,
protects servers across Azure, AWS, GCP, and on-premises environments.
It integrates with Microsoft Defender and offers the following core
features:

- Endpoint detection and response (EDR)

- Vulnerability assessment and mitigation

- Attack surface reduction

- Next-generation protection (real-time scanning and malware protection)

- 

**Plans:**

- **Plan 1:** Basic threat protection (vulnerability scanning,
  antimalware, limited EDR).

- **Plan 2:** All Plan 1 features plus enhanced EDR capabilities.

**Key Features and Capabilities:**

- **Integrated License with MDE (Windows Only):** Streamlined licensing
  for Windows servers already using Microsoft Defender for Endpoint.

- **Vulnerability Assessment:** Scans VMs for vulnerabilities using
  Qualys.

- **Just-in-Time (JIT) VM Access:** Controls and limits administrative
  access to VMs.

- **File Integrity Monitoring (FIM):** Tracks changes to critical files
  and registries.

- **Adaptive Application Controls (AAC):** Restricts the execution of
  unauthorized applications.

- **Adaptive Network Hardening:** Improves network security by
  dynamically adjusting firewall rules.

- **Docker Host Hardening:** Secures Docker container environments.

- **Fileless Attack Detection (Windows Only):** Detects malicious
  activity that doesn't involve traditional malware files.

- **Linux Auditd Alerts and Log Analytics Agent Integration (Linux
  Only):** Integrates with Linux auditing tools and centralizes log
  collection.

- **Agentless and Agent-based Scanning:** Offers both agentless (using
  Cloud APIs and snapshots) and agent-based (using OS APIs) scanning for
  VMs.

- **Agentless Secrets Scanning:** Detects secrets (tokens, passwords,
  keys) in VM disks and cloud deployments using snapshots and Cloud
  APIs.

- **Agentless Malware Scanning (Plan 2):** Uses Microsoft Defender
  Antivirus and cloud protection intelligence to scan VMs, even without
  an installed antimalware solution. Scans all files, including those
  excluded from agent-based scans.

**Billing:**

- Defender for Servers is billed hourly per protected server,
  *regardless of its state* (running, stopped, paused). This covers
  continuous security checks, threat assessments, and vulnerability
  scanning.

- **Cost Optimization:**

  - Temporarily disable Defender for Servers when not needed (remember
    to re-enable).

  - Consider Plan 1 for primarily stopped servers to reduce costs.

- If Azure servers are in stopped state then also Microsoft will still
  charge for Microsoft defender for server plans.

- Defender for server charges per hour for each protected server
  regardless of its state (running/stopped/paused).

- This charge covers ongoing security checks, threat assessments, and
  vulnerability scanning, even when the server isn't running.

- While some users might feel it's unfair to pay for security on a
  stopped server, the rationale behind this billing model is that
  Defender for Servers still needs to maintain continuous monitoring and
  readiness to respond to potential threats, even when the server isn't
  active.

- To optimize cost consider following:

  - Stopping Defender for Servers temporarily: If you know you won't be
    using a specific server for a long period, you can temporarily
    disable Defender for Servers to avoid charges. However, remember to
    re-enable it before restarting the server.

  - Migrating to different Defender for Servers plan: If you primarily
    use stopped servers, you might benefit from choosing a different
    Defender for Servers plan, like Plan 1, which offers a cheaper
    hourly rate but fewer features compared to Plan 2.

 

Agentless machine scanning:

- Agentless scanning for VM uses Cloud APIs to collect security data.

- MDC takes snapshot of VM disks and stores in same region of VM.

- MDC performs scanning and deep analysis of OS configuration and file
  systems.

- After acquiring necessary metadata MDC deletes that snapshot.

- MDC sends metadata to MDVM engine for vulnerability assessment.

- Scanning environment where disks are analysed is regional, volatile,
  isolated, and highly secure.

Agent based machine scanning:

Agent based scanning for VMs uses OS APIs to collect security data.

 

> <img src="media/image1.png" style="width:5.03333in;height:1.83333in" />

 

Agentless secrets scanning for VM secrets:

Machines should have secrets finding resolved

- It can identify wide range of tokens, passwords, keys, connection
  strings, etc on OS file systems, scans plain text secrets.

- MDC captures disk snapshot and analyses them with no impact on VM.

- Microsoft secrets scanning engine collects secrets metadata and sends
  them to MDC.

- Secrets scanning engine verifies whether SSH private keys can be used
  for lateral movement in network.

Agentless secrets scanning of Cloud deployments:

Azure Resource Manager deployments should have secrets findings
resolved.

- Scanning helps you to quickly detect plaintext secrets in cloud
  deployments.

- Secrets scanning for cloud deployment resources is agentless and uses
  the cloud control plane API.

Agentless Malware scanning:

Defender for server plan-2

- Its uses Microsoft defender antivirus and Cloud protection signature
  feed that enriched with Microsoft Intelligence.

- Performs quick and full scans that uses heuristics and signature-based
  threat detection.

- If VM do not have Antimalware solution installed/enabled then
  agentless detector scans that machine to detect malicious activity.

- The agentless scanner scans all files and folders including any files
  or folders that are excluded from the agent-based antivirus scans,
  without influencing the performance of the machine.

### Disable Defender for Servers

When to Consider Disabling Defender for Servers?

While Defender for Servers is a critical security component, there are
specific scenarios where temporarily disabling it might be necessary.
These include:

**1. Maintenance and Updates**

- **Temporary Suspension for Maintenance or Updates**: Prevents
  conflicts during critical system updates or extensive maintenance
  processes.

**2. Security Solution Conflicts**

- **Conflicting Endpoint Protection Solutions**: If another security
  solution is incompatible with Defender for Servers, disabling it can
  prevent performance issues or overlapping protection mechanisms.

- **Custom Security Management Solutions**: Organizations with in-house
  security tools may prefer to disable Defender for Servers to maintain
  centralized security control.

**3. Testing and Development**

- **Low-Risk Testing/Development Environments**: In controlled
  environments where security risks are minimal, disabling Defender can
  optimize performance and reduce costs.

- **Security Testing and Penetration Assessments**: Security
  professionals may disable Defender to conduct penetration testing or
  vulnerability assessments without interference.

**4. Isolated or Specialized Server Configurations**

- **Fully Isolated Servers**: Servers with no external network
  connectivity may not benefit from Defender's protection, making it
  unnecessary.

- **Application Compatibility Issues**: Legacy or custom applications
  that conflict with Defender may require temporary disabling for
  troubleshooting.

**5. Performance Optimization**

- **Resource-Intensive Workloads**: High-performance computing,
  real-time applications, or other demanding workloads may require
  freeing up system resources by disabling Defender.

**6. Cost Considerations**

- **Cost-Saving Measures**: Organizations looking to reduce expenses may
  disable Defender on low-risk servers or those already covered by
  alternative security solutions.

**7. Temporary Workarounds**

- **Bug Fixes and Compatibility Issues**: In cases where Defender
  introduces known issues, temporarily disabling it can serve as a
  workaround until a permanent fix is available.

**Key Considerations Before Disabling Defender for Servers**

- Always assess the security risks associated with disabling Defender.

- Ensure alternative security measures are in place if Defender is
  disabled.

- Monitor and re-enable Defender as soon as possible after resolving
  conflicts or completing necessary tasks.

### Defender for server plan-1

5 USD/server/month

- Microsoft Defender for Endpoint

- Microsoft Defender vulnerability management

- Automatic agent onboarding, alert, and data integration

- Generates detailed, context-based, security alerts easily integrated
  with any SIEM

- Alerts include guidelines to help investigate and mitigate identified
  threats

  - MDE, Microsoft Defender vulnerability management, Automatic agent
    onboarding, alert, and data integration

  - Pricing: <span class="mark">5\$/server/month</span>

### Defender for server plan-2: 

15 USD/server/month

- Foundational CSPM Free, and Defender for server plan-1 plus following
  features

- Provides guidelines to help investigate and mitigate identified
  threats

- Agentless vulnerability scanning

- Agentless secrets scanning

- Agentless malware detection (preview)

- Control plane security alerts

- Resolve missing software updates gaps with Azure Update Manager (Free
  for Plan 2 Arc machines)

- Regulatory compliance and industry best practices

- Just-in-time VM access for management ports

- Network layer threat detection

- Adaptive application controls -deprecating from MDC

- File integrity monitoring-deprecating from MDC

- Adaptive network hardening

- Log Analytics 500MB free data ingestion

- Defender for server’s plan-1 plus following features.

  - Agentless vulnerability scanning, Integrated vulnerability
    assessment powered by Qualys, JIT VM access for management ports

  - Network layer threat detection, Adaptive application controls, File
    integrity monitoring, and Adaptive network hardening

  - Log Analytics 500MB free data ingestion

**1. Protecting Azure VMs**

- Enable **Microsoft Defender for Cloud** (formerly Azure Security
  Center) at the **subscription level** to protect Azure Virtual
  Machines (VMs).

- Use **Azure Defender for Servers** (a part of Microsoft Defender for
  Cloud) for enhanced VM protection.

>  

## Defender for app service

15\$ /Instance/month

- Alerts include guidelines to help investigate and mitigate identified
  threats

- Assesses resources covered by your App Service plan and generates
  security recommendations

- Defender for Cloud analyzes App Service internal logs to identify
  attack methodology on multiple targets

- Generates detailed, context-based, security alerts easily integrated
  with any SIEM

- Identifies attack methodologies applying to multiple targets

- Monitors App Service internal logs

- Monitors requests and responses sent between App Service apps

- Monitors the underlying sandboxes and VMs

- Monitors the VM host of your App Service and its management interface

- Protects applications running over Azure App Service

- Provides guidelines to help investigate and mitigate identified
  threats

- Regulatory compliance and industry best practices

**9. Web Application Protection**

- **Primary Solutions**:

  - **Azure Web Application Firewall (WAF)** integrated with **Azure
    Application Gateway** or **Azure Front Door**.

  - **Defender for Cloud** provides additional protection for web
    applications.

## Defender for storage

Continuously analyses data plane and control plane logs on Azure Blobs,
Azure Data Lake Storage, and Azure Files

Detects data exposure events with Sensitive Data Discovery (preview)
Configurable

Detects malicious files uploaded to Blob Storage with near real-time
Malware Scanning (preview) Configurable.

Generates context-based security alerts easily integrated with any SIEM

Leverages Microsoft Threat Intelligence and behavioural models

Microsoft Defender for Storage detects threats on your storage workloads
and data, including malicious access, data exfiltration of sensitive
data and malware upload.

Pricing: 10\$ / storage account/month, On-upload malware scanning
(\$0.15/GB)

Simple, one-click setup; no need to enable logs, agents, or rewiring

>  

## Defender for SQL

Provides advanced threat protection and vulnerability assessment for
various SQL environments, including **PaaS, hybrid, and open-source
databases**.

### 1. Defender for SQL Database Servers (PaaS)

**Covers:**

- **Azure SQL Database**

- **Azure SQL Managed Instance**

- **Dedicated SQL pool in Azure Synapse**

**Features:**

- **Vulnerability Assessment**

- **Advanced Threat Protection**

- **Security Alerts for:**

  - SQL injection attacks

  - Anomalous database access/query patterns

  - Suspicious database activity

**Pricing:** \$15/server/month

### 2. Defender for SQL Servers on Machines (Hybrid & On-Premises)

**Covers:**

- **SQL Servers on Virtual Machines**

- **On-Premises SQL Servers:**

  - **Azure Arc-enabled SQL servers**

  - **SQL Server running on Windows (without Azure Arc)**

**Features:**

- **Vulnerability Assessment**

- **Advanced Threat Protection**

- **Security Alerts for:**

  - SQL injection attacks

  - Anomalous database access/query patterns

  - Suspicious database activity

**Pricing:** \$15/server/month

### 3. Defender for Open-Source Relational Databases (PaaS)

**Covers:**

- **Azure Database for PostgreSQL**

- **Azure Database for MySQL**

- **Azure Database for MariaDB**

**Features:**

- **Threat Protection for:**

  - Brute-force attacks

  - Anomalous database access/query patterns

  - Suspicious database activity

**Pricing:** \$15/server/month

**Additional Notes:**

- **Azure Cosmos DB**: Covered under Defender for SQL, but pricing is
  **per 100 RU/s per hour** instead of a flat monthly fee.

- **Hybrid Protection** extends to SQL instances on **Windows
  machines**, whether **Azure Arc-enabled or not**.

This structure ensures clarity in **categorization, coverage, features,
and pricing**. Let me know if you need any modifications!

## Defender for containers

Microsoft Defender for Containers offers security features for
containerized environments. It includes two main components:

- **Defender for Container Registries:** Performs vulnerability
  assessments for container images stored in Azure Container Registry
  (ACR) and images running in Azure Kubernetes Service (AKS).

- **Defender for Containers (Kubernetes):**

  - Identifies misconfigurations in Kubernetes clusters (both on AKS and
    on-premises/IaaS).

  - Provides runtime threat protection for nodes and clusters.

  - Offers guidelines for investigating and mitigating identified
    threats.

Pricing for Defender for Containers (Kubernetes) is \$7 per VM core per
month. Note that the provided text incorrectly lists the pricing twice
and does not specify if this pricing applies to *all* Defender for
Containers features or just the Kubernetes protection part. It's also
important to verify the latest pricing details from Microsoft directly.

## Defender for key vault

**Microsoft Defender for Key Vault**

- Detects unusual and potentially harmful attempts to access or exploit
  Key Vault accounts

<!-- -->

- **Protection:** Microsoft Defender for Key Vault safeguards Azure Key
  Vault accounts.

- **Threat Detection:** It detects unusual and potentially harmful
  attempts to access or exploit these accounts.

- **Unauthorized Access:** Specifically identifies unauthorized access
  and exploitation attempts.

- **Security Alerts:** Provides detailed security alerts containing
  information about suspicious activity.

- **Investigation & Mitigation:** Offers guidelines to help investigate
  and mitigate identified threats.

- **Pricing:** Costs \$1 per 500,000 transactions.

What Indicators of compromise can we gather from Defender for Key Vault
alert?

- Object ID of attacker which helps to track Azure resources

- IP address to verify if suspicious app trying to access resource.

- User principal name (UPN) to verify If suspicious user trying to
  access resource.

How to create suppression rules in Microsoft defender for cloud?

- Microsoft Defender for Cloud – Alerts – Suppression rules – Create
  suppression rule

- Select subscription

- Select type of alert - such as “User accessed high volume of key
  vaults”

- Select entities: User account/Azure resource/IP, Name/AAD id/UPN
  suffix, in/contains, cloud1309@outlook.com

## Defender for Resource Manager

Defender for Resource Manager helps secure your cloud resources by
monitoring resource management operations and providing threat
mitigation guidelines. It protects against suspicious activities like
unauthorized operations, exploit toolkits, and lateral movement from the
management layer to the data plane.

The service costs \$4 per 1 million operations.

Because it covers \*all\* connected resources, every alert should be
investigated, even if the triggering user or application seems familiar.
Defender for Resource Manager specifically addresses threats such as
suspicious operations from unusual IP addresses, disabling antimalware,
and suspicious scripts within VM extensions.

**Microsoft Defender for Resource Manager**

- Defender for Resource Manager protects against issues including

- Suspicious resource management operations, such as operations from
  suspicious IP addresses, disabling antimalware and suspicious scripts
  running in VM extensions

## Defender for DNS

- Continuously monitoring all DNS queries from your Azure resources

- Running advanced security analytics to alert you about suspicious
  activity

- Defender for DNS protects against issues including:

  - Data exfiltration from your Azure resources using DNS tunneling

  - Malware communicating with C&C server

  - Communication with malicious domains as phishing and crypto mining

  - DNS attacks - communication with malicious DNS resolvers

Key Features and Benefits:

- **Agentless Protection:** Leverages Azure DNS for seamless security
  without additional agents.

- **Proactive Threat Detection:** Continuously monitors DNS queries from
  Azure resources to identify potential threats.

- **Advanced Threat Detection:** Detects a wide range of threats,
  including DNS tunnelling, malware communication, malicious resolver
  interactions, and anomalous activity.

- **Security Alert Response Guidelines:** Provides clear steps to
  investigate and mitigate identified threats.

Protected Against:

- **DNS Attacks:** Malicious DNS resolver communications.

- **Data Exfiltration:** DNS tunnelling.

- **Malware Communication:** C&C server interactions.

How to Respond to DNS Security Alerts:

1.  **Assess the Alert:**

    - **Expected Behaviour:** Dismiss the alert.

    - **Unexpected Behaviour:** Treat the resource as potentially
      compromised.

2.  **Mitigate the Threat:**

    - **Isolate the Resource:** Prevent lateral movement.

    - **Remediate Security Issues:** Address Defender for Cloud
      recommendations.

    - **Clean the Resource:**

      - Revert to a known good state.

      - Reinstall the operating system if necessary.

      - Restore software from a verified source.

      - Remove unknown or unwanted packages.

      - Run a full antimalware scan.

**Additional Considerations:**

- **Pricing:** 7\$ for 10 million DNS queries.

- **Advanced Security Analytics:** Proactive monitoring for suspicious
  activity.

By effectively utilizing Defender for DNS and following the recommended
response procedures, organizations can significantly enhance the
security posture of their Azure resources and mitigate potential risks.
