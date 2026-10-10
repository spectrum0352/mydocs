# **Attack stages in Azure**





## Common Cyber Attack Stages in Azure



|**Stage**|**Description**|**Azure Context Example**|
|-|-|-|
|**Survey**|Attacker scans and profiles assets|Scanning open ports on Azure VMs or enumerating Azure AD users|
|**Delivery**|Weaponization of initial access|Phishing emails with Azure AD login prompts or malicious Bicep/Terraform templates|
|**Breach**|Gaining a foothold|Exploiting JIT access or weak Azure Function authentication|
|**Affect**|Executing objectives (exfil, lateral movement, DoS)|Dumping Key Vault secrets, lateral movement via Azure Run Command, disabling Defender for Cloud|





### **Cyber Attacks in Azure: Stages and Patterns**

All cyberattacks-whether **targeted (APT)** or **opportunistic (commodity malware)**-generally follow a series of **common stages**. In Azure, understanding these attack phases helps security teams better **detect, prevent, and respond** to threats before damage occurs. The attack lifecycle into **four main stages**:



1. ##### **Survey (Reconnaissance)**

**Goal:** Identify exploitable weaknesses in Azure infrastructure.

**Attacker Actions:**

* Enumerate exposed Azure services using OSINT, DNS records, Shodan,
GitHub, etc.
* Gather employee info via LinkedIn or Microsoft Entra ID (Azure AD)
exposure.
* Scan for:

  * Open ports on Azure VMs or App Services
  * Exposed APIs or storage accounts (e.g., blob containers)
  * Metadata leaks in documents
  * Misconfigured Azure DNS or CDN endpoints

**💡 Azure Example:**

Attackers might identify a publicly accessible Azure Web App with debug
info enabled or a public Key Vault endpoint without access control.



##### **2. Delivery**

**Goal:** Deliver a malicious payload or gain access via a chosen path.

**📦 Common Delivery Vectors:**

* **Phishing emails** to Azure users with malicious links or
attachments.
* Uploading web shells to **vulnerable Azure Web Apps**.
* Exploiting **misconfigured Azure Functions**, **Logic Apps**, or **Run
Command** on VMs.
* Abusing shared resources like open Storage URLs or compromised Azure
DevOps pipelines.

**💡 Azure Example:**

A malicious Word doc with embedded macros is sent to a user, who logs
into Azure AD, giving attackers a session cookie or token.



##### **3. Breach (Initial Compromise)**

**Goal:** Exploit vulnerabilities to gain **unauthorized access**.

**🔓 Exploitation Methods:**

* Use known CVEs against unpatched Azure-hosted apps or VMs.
* Abuse default credentials or misconfigured identity roles (e.g., Owner
assigned to service principal).
* Exploit identity misconfigurations in **Entra ID** (e.g., no MFA,
excessive token lifetimes).

**💡 Azure Example:**

A vulnerable Azure container image is deployed in an AKS cluster, which
is then compromised using an RCE vulnerability.



##### **4. Affect (Post-Exploitation \& Impact)**

**Goal:** Achieve attacker objectives: persistence, theft, disruption,
or destruction.

**🎯 Attacker Activities:**

* Expand access using **stolen credentials** or tokens.
* Laterally move via Entra ID roles, Azure VM access, or peered
networks.
* Exfiltrate **data from Storage, SQL DBs, or Key Vaults**.
* Deploy cryptominers, ransomware, or tamper with Azure services (e.g.,
deleting diagnostic logs or triggering automation for fraud).
* Disable monitoring (e.g., Microsoft Defender for Cloud or Sentinel).

**💡 Azure Example:**

After gaining access to an Azure VM with Contributor rights, the
attacker uses az CLI to add backdoor users or create a new service
principal with persistent access.



##### **5. Persistence and Exit**

Skilled attackers often:

* Add new Azure AD users or modify RBAC roles.
* Create **malicious Azure Automation Accounts** to trigger backdoor
access on demand.
* Set up outbound tunnels (e.g., reverse shells over Azure Functions or
external DNS).
* Wipe logs and alerts (e.g., via Log Analytics or Azure Monitor API).
* Sell access to other groups (e.g., ransomware affiliates).



## Preparation \& Reconnaissance

### **Purpose:**

* Collect information to plan the attack.
* Identify cloud resources, identities, and vulnerabilities.

### **Functions:**

* Passive and active information gathering.
* Target selection and attack vector identification.

### **Techniques Used:**

* OSINT (Open-Source Intelligence) gathering.
* DNS enumeration, subdomain discovery.
* Cloud asset discovery (e.g., exposed buckets, endpoints).
* Public repo mining (e.g., leaked credentials).
* Scanning for open ports, vulnerable services.

### **Tools:**

* Shodan, Censys (cloud asset discovery)
* Nmap (network scanning)
* Amass, Sublist3r (DNS/subdomain enumeration)
* Recon-ng, SpiderFoot (OSINT frameworks)
* GitHub search for secrets

### **Cloud Attack Strategies:**

* Search for publicly exposed storage (S3 buckets, Azure blobs).
* Identify cloud IAM policies and role configurations.
* Use leaked or weak credentials found online.
* Check for unpatched or misconfigured cloud services.

## 1\. Reconnaissance (External and Internal)

* **Why it's common:** Attackers start by collecting publicly available
data (e.g., S3 buckets, GitHub secrets, Azure blob leaks, DNS
records).
* **Cloud-specific tools:**

  * Amass, Subfinder (domain enumeration)
  * MicroBurst, ScoutSuite, Pacu, CloudSploit

## Initial Compromise

**Purpose:**

* Gain foothold inside target cloud environment.

**Functions:**

* Deliver payload or exploit vulnerabilities.
* Trick users to provide credentials or install malware.

**Techniques Used:**

* Phishing (email, SMS) with malicious links or payloads.
* Exploiting cloud service vulnerabilities (e.g., API misconfig).
* Password spraying or credential stuffing.
* Using stolen or leaked API keys/tokens.

**Tools:**

* Phishing kits and frameworks (Gophish, Evilginx2 for AiTM)
* Metasploit (exploits)
* Cobalt Strike (initial beacon)
* Mimikatz (if Windows credentials are captured)
* Cloud-specific tools (Pacu for AWS, Azucar for Azure)

**Cloud Attack Strategies:**

* Use phishing to capture cloud login credentials.
* Exploit misconfigured identity providers or OAuth apps.
* Use leaked API keys or service principals to access resources.
* Exploit public-facing cloud endpoints or misconfigured permissions.

## 2\. Initial Access

* **Why it's common:** It's the entry point. In cloud, attackers often abuse:

  * Phishing (especially with AiTM kits for Microsoft Entra ID)
  * Exploiting exposed services (e.g., RDP, SSH, misconfigured storage or APIs)
  * Reuse of leaked API keys, tokens

## Post-Compromise Expansion

**Purpose:**

* Increase access, privileges, and scope within cloud environment.

**Functions:**

* Harvest credentials and secrets.
* Escalate privileges and move laterally.
* Establish persistence to maintain control.

**Techniques Used:**

* Credential dumping (e.g., tokens, secrets from key vaults).
* Privilege escalation via role or permission misconfig.
* Lateral movement using service principals, managed identities.
* Creating backdoor accounts, automation runbooks, or serverless functions.

**Tools:**

* BloodHound/AzureHound (AD \& Azure AD mapping)
* Pacu (AWS post-exploitation)
* Azucar (Azure post-exploitation)
* PowerShell Empire, Metasploit
* Custom scripts for token hijacking or role chaining

**Cloud Attack Strategies:**

* Abuse cloud identity federation and trust relationships.
* Extract secrets from cloud key vaults or metadata services.
* Exploit cloud automation and orchestration features for persistence.
* Chain permissions to gain owner/admin privileges.

## 3\. Persistence and Privilege Escalation

### Credential Access

* **Why it's common:** Attackers steal cloud IAM keys, access tokens, or service principal secrets.
* **Cloud-specific examples:**

  * Dumping .azure, .aws, or .config/gcloud folders
  * Harvesting tokens from browsers or Azure CLI
  * Stealing credentials from metadata services (e.g., http://169.254.169.254)

### Privilege Escalation

* **Why it's common:** Once inside, attackers escalate to admin or global roles.
* **Cloud-specific examples:**

  * Assigning themselves privileged roles via misconfigured role assignments (e.g., Azure Contributor to Owner)
  * Abuse of automation accounts or managed identities
  * Breaking out from containers or Function Apps with identity tokens

### Lateral Movement

* **Why it's common:** Attackers move from one compromised system or service to others.
* **Cloud-specific techniques:**

  * Using valid Azure credentials to move across subscriptions
  * SSH/WinRM to pivot inside a VNET
  * Accessing other resources via trust relationships (e.g., federated roles, peered networks)

### Persistence

* **Why it's common:** Attackers want to maintain access undetected.
* **Cloud-specific persistence methods:**

  * Creating backdoor users or service principals
  * Implanting scheduled automation jobs, Function triggers
  * Modifying startup scripts in VM scale sets or container orchestration tools

## Defense Evasion \& Control

**Purpose:**

* Avoid detection and maintain reliable access.

**Functions:**

* Evade security tools and monitoring.
* Set up command \& control (C2) infrastructure.

**Techniques Used:**

* Log clearing, event log manipulation.
* Disabling or bypassing cloud security services (e.g., Defender, GuardDuty).
* Using encrypted C2 channels or stealthy protocols.
* Using legitimate cloud APIs or tools for attacker activities (living off the land).

**Tools:**

* PowerShell obfuscators and AMSI bypass scripts.
* Cobalt Strike, Covenant, or custom C2 frameworks.
* Cloud-native CLI tools (AWS CLI, Azure CLI) for stealth.
* Proxychains, DNS tunnels for covert communication.

**Cloud Attack Strategies:**

* Use cloud audit logs to identify monitoring and evade.
* Modify IAM policies to suppress alerts or disable logging.
* Use trusted service principals to blend into normal traffic.
* Implement stealthy tunnels using cloud functions or proxies.

### 4\. Defense Evasion

* **Why it's common:** To avoid detection by tools like Defender for Cloud or SIEMs.
* **Cloud-specific techniques:**

  * Disabling logging (Azure Diagnostics, CloudTrail)
  * Deleting activity logs or using temporary sessions
  * Tampering with NSGs or firewall rules

## Target Interaction \& Collection

**Purpose:**

* Identify, locate, and gather valuable data for exfiltration.

**Functions:**

* Discover sensitive data and critical assets.
* Collect data systematically.

**Techniques Used:**

* Searching and downloading data from cloud storage.
* Dumping databases or snapshots.
* Accessing email, documents, credentials.
* Aggregating logs, backups, or secret stores.

### **Tools:**

* AWS S3 tools (AWS CLI, s3cmd)
* Azure Storage Explorer, AzCopy
* Database clients (e.g., SQLcmd, Mongo shell)
* Custom scripts for searching keys or secrets

### **Cloud Attack Strategies:**

* Query and copy entire buckets or containers.
* Access databases through misconfigured endpoints.
* Extract encryption keys or credentials stored in cloud vaults.
* Gather telemetry for later use or to cover tracks.

## Exfiltration \& Impact

### **Purpose:**

* Remove data or disrupt systems to fulfill attacker objectives.

### **Functions:**

* Steal data out of the environment.
* Deploy ransomware, delete data, or disrupt services.

### **Techniques Used:**

* Data exfiltration via HTTP(S), DNS tunneling, cloud storage.
* Encrypting data for ransom (ransomware).
* Destroying backups or logs.
* Service denial or resource hijacking (e.g., crypto mining).

### **Tools:**

* Secure copy tools (scp, rsync)
* Custom exfiltration scripts or malware.
* Ransomware toolkits.
* Cryptomining malware.

### **Cloud Attack Strategies:**

* Use cloud storage as exfiltration drop point.
* Encrypt cloud disks or blobs.
* Disable or delete snapshots and backups.
* Hijack compute resources for mining cryptocurrency.





# Introduction

Cyber-attacks pose an ever-growing threat to organizations of all sizes. In cloud environments like Microsoft Azure, these attacks can exploit both misconfigurations and vulnerabilities in services, user behaviours, or platform features. Understanding typical attack methods and implementing core security controls is essential to protecting Azure workloads.









**Overview**

This case study illustrates a **watering hole attack** targeting the UK energy sector. Legitimate websites frequented by energy sector employees were compromised to **silently deliver malware**. This campaign demonstrates how commodity tools (e.g., exploit kits, spear phishing, and unpatched software vulnerabilities) can be used effectively in cyber-espionage and highlights **how basic cyber hygiene could have prevented or limited the attack**.



**Attack Flow in Azure Context**



|**Phase**|**Details in Case Study**|**Azure-Specific Translation**|
|-|-|-|
|**Reconnaissance**|Attacker identified a shared web design company hosting several sector websites.|In Azure, attackers could enumerate shared service providers (e.g., through NSGs, public metadata) or use tools like AzureHound to find common infrastructure or identities.|
|**Initial Access**|Possibly via spear-phishing or unpatched web server vulnerability.|Access via compromised Azure App Service, exposed management ports, or spear-phished Azure AD credentials.|
|**Weaponization \& Delivery**|Script injection (iframe) redirected users to attacker’s site to deliver malware.|Could involve tampering with Azure-hosted website content (e.g., blob storage or app code) to insert JavaScript or redirects.|
|**Exploitation**|Exploited unpatched Java/browser to run malware.|Exploit unpatched Windows VMs or Azure Bastion client endpoints, or abuse misconfigured NSGs.|
|**Installation**|Remote Access Tool (RAT) disguised as web script.|RAT or agent installed on Azure VM or hybrid-joined device; could register persistence in Azure via automation accounts or Logic Apps.|
|**Command \& Control**|Malware beaconed to attacker-controlled domains.|Traffic could flow through Azure virtual networks, outbound NSGs, or even via Azure Function callbacks.|
|**Actions on Objectives**|Credential harvesting and system enumeration.|Enumeration of Azure resources via MSI abuse or PowerShell modules (Az, AzureAD) using stolen tokens or credentials.|



**Corrected and Clarified Technical Points**

* The attack used a **watering hole** tactic, not a direct attack on the target’s systems initially.
* Malware was distributed using **iframes** to silently redirect users to malicious sites.
* The malware leveraged **known and patchable vulnerabilities**, indicating poor patch hygiene.
* Remote Access Tool (RAT) functionality included **keystroke logging**, **clipboard monitoring**, and **system reconnaissance**.
* The **attack was detected by security monitoring**, specifically through **C2 traffic patterns**.



**Recommended Azure-Aligned Mitigations**

|**Mitigation Category**|**Controls in Azure**|
|-|-|
|**Perimeter Defence**|- Azure Firewall with FQDN filters <br />- Web Application Firewall (WAF) <br />- Azure Front Door with custom rules|
|**Malware Protection**|- MDE integration with Azure VMs <br />- Defender for Cloud agent-based scanning|
|**Patch Management**|- Azure Update Management or Azure Automanage to enforce updates <br />- VM guest patch compliance policies|
|**Application Control**|- Application whitelisting using AppLocker (Windows VMs) or Azure Policy for container registry/image control|
|**User Access Control**|- Enforce Just-In-Time (JIT) access via Defender for Cloud <br />- Privileged Identity Management (PIM)|
|**Security Monitoring**|- Microsoft Sentinel <br />- Defender for Cloud (attack path analysis, behavioral alerts) <br />- NSG Flow Logs|



**Takeaways for Azure Security Posture**

* Even **basic hygiene (patching, filtering, monitoring)** can prevent commodity threats.
* **Centralized control points** in Azure (e.g., NSGs, Azure Firewall, Defender for Cloud) can be leveraged to restrict movement and
communication of malware.
* Adopting **Zero Trust** principles in Azure (least privilege, verify
explicitly) helps contain lateral movement post-compromise.
* **Shared infrastructure** (like a web dev agency or 3rd-party SaaS) in
Azure should be risk-assessed and monitored using **Microsoft Entra ID
(formerly Azure AD)** and **conditional access**.







**📘 Final Azure Mitigation Checklist**

|**Category**|**Azure Control Recommendations**|
|-|-|
|**Identity Security**|Entra PIM, MFA, Conditional Access, Identity Protection|
|**Endpoint Security**|Defender for Endpoint, Secure Baseline Images, AppLocker|
|**Workload Security**|Defender for Cloud, Update Management, Azure Policy|
|**Network Security**|NSGs, Azure Firewall, DNS filtering|
|**Monitoring \& Logging**|Microsoft Sentinel, Defender for Identity, Unified Audit Logging|
|**User Awareness**|Attack Simulation Training, Admin Isolation Policies|
|**Third-Party Risk Mgmt**|Supplier assessment, App Registration governance, deploy minimal permissions for 3rd parties|





# Cyber Kill Chain

|**Phase**|**Name**|**Purpose \& Key Activities**|
|-|-|-|
|**1**|**Preparation \& Reconnaissance**|Identify targets, gather intel (domains, emails, cloud assets), choose attack vector. Examples: Whois lookup, GitHub leaks, OSINT, Shodan.|
|**2**|**Initial Compromise**|Gain first access via exploits, phishing, or credential stuffing. Examples: Phishing login page, RCE, stolen token login.|
|**3**|**Post-Compromise Expansion**|Establish control and move deeper. Activities: Credential theft, privilege escalation, lateral movement, persistence.|
|**4**|**Defense Evasion \& Control**|Evade detection and maintain C2 access. Examples: Obfuscation, log tampering, disabling AV, using hidden cloud roles.|
|**5**|**Target Interaction \& Collection**|Locate and gather valuable data. Examples: DB dumps, S3 buckets, SharePoint files, key vaults.|
|**6**|**Exfiltration \& Impact**|Steal data or cause damage. Examples: Data exfiltration, encryption (ransomware), service disruption.|

### **Visual Flow:**

1️⃣ Preparation \& Reconnaissance

↓

2️⃣ Initial Compromise

↓

3️⃣ Post-Compromise Expansion

↓

4️⃣ Defense Evasion \& Control

↓

5️⃣ Target Interaction \& Collection

↓

6️⃣ Exfiltration \& Impact

### **✅ Benefits of This Model:**

* **No overlaps**: Each phase is distinct and sequential.
* **Cloud \& traditional** attack techniques fit in naturally.
* **Red team \& blue team friendly**: Easy to align tooling and detections per phase.
* Reflects **actual threat actor workflows** like APTs, ransomware groups, and cloud-native attacks.



|**Phase**|**Purpose**|**Techniques**|**Tools**|**Cloud Attack Strategies**|
|-|-|-|-|-|
|Preparation \& Reconnaissance|Target research \& intel|OSINT, scanning|Shodan, Nmap, Amass|Discover exposed buckets, weak IAM|
|Initial Compromise|Gain initial access|Phishing, exploits, stolen keys|Gophish, Metasploit, Pacu|Phishing cloud creds, API key abuse|
|Post-Compromise Expansion|Escalate access \& move laterally|Credential theft, lateral movement|BloodHound, Azucar, PowerShell|Abuse federation, key vaults, automation|
|Defense Evasion \& Control|Avoid detection \& maintain control|Log clearing, stealth C2|Cobalt Strike, AMSI bypass|Disable logging, use legitimate APIs|
|Target Interaction \& Collection|Locate \& gather data|Data dumps, storage access|AWS CLI, Azure Storage Explorer|Extract sensitive data, DB dumps|
|Exfiltration \& Impact|Remove data or cause disruption|Data theft, ransomware, crypto mining|Custom exfil tools, ransomware|Encrypt data, destroy backups, mine crypto|

# 





