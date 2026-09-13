# Reconnaissance

Reconnaissance is the initial phase of an Azure cloud penetration test. It focuses on collecting publicly accessible information about the target environment to prepare for attack surface analysis and exploitation. This includes both passive and active techniques.

## 1. Passive Reconnaissance

These techniques do not directly interact with the target infrastructure
but gather information from public sources.

### 1.1. Open Source Intelligence (OSINT) via Web Browsing

- **Description**: Observing publicly available content related to the target, such as documentation, login portals, company websites, and employee info.
- **Example**: Visiting the victim’s Azure-hosted website or subdomains to gather data.
- **MITRE ATT&CK**:
  - **T1593.002** – *Search Open Websites/Domains: Search Engines*
  - **T1594** – *Search Victim-Owned Websites*
- **Use Case**:
  - Google/Bing advanced queries for site-specific Azure domains (site:\*.azurewebsites.net)
  - Identifying Azure App Services, Blob Storage URLs, or exposed Azure APIs
  - Browsing LinkedIn or other platforms for employee roles tied to Azure usage

## 2. Active Reconnaissance

Involves interaction with the target, potentially leaving logs or alerts.

### 2.1. Spearphishing for Reconnaissance

- **Description**: Sending targeted emails with links to gather information from users about the environment.
- **Threat Actor Example**: APT31 has used the GMASS service since 2018 for spearphishing activities.
- **MITRE ATT&CK**:
  - **T1598.003** – *Phishing for Information: Spearphishing Link*
- **Use Case**:
  - Using Azure-themed phishing pages (e.g., fake Azure login portals) to capture credentials or MFA tokens
  - Monitoring user interaction to infer the use of Azure AD, MFA providers, or conditional access policies

## Summary Table: Azure Cloud Reconnaissance Techniques

| **Category** | **Technique** | **MITRE ID** | **Description/Use Case** |
| ---- | ---- | ---- | ---- |
| Web Browsing (OSINT) | Search via Search Engines | T1593.002 | Use search engines to discover Azure resources, domains, employee info |
| Web Browsing (OSINT) | Search Victim-Owned Websites | T1594 | Inspect Azure-hosted websites and apps for clues and technologies used |
| Email-based Phishing | Spearphishing for Information (Links) | T1598.003 | Send phishing emails to gather Azure usage details or credential capture |

## 1. Reconnaissance

**Goal:** Map the tenant's external footprint and internal resource inventory without touching production data.

**External / passive recon**

- Identify cloud provider via DNS (MX, SPF, CNAME patterns) — e.g. Office 365 tenants resolve MX to `*.mail.protection.outlook.com`.
- Enumerate exposed endpoints associated with the tenant: `*.blob.core.windows.net`, `*.azurewebsites.net`, `login.microsoftonline.com` (tenant/user enumeration only, no credential submission).
- Note that risk lives in *misconfiguration* (public containers, leaked SAS tokens, exposed connection strings), not in the URL pattern itself — flag these as areas to test, not as findings yet.

**Internal / authenticated recon (post-access)**
- Subscriptions & resource inventory: `Get-AzContext`, `Get-AzSubscription`, `Get-AzResourceGroup`, `Get-AzResource`
- Service-specific inventory: `Get-AzStorageAccount`, `Get-AzWebApp`, `Get-AzSQLServer`, `Get-AzSqlDatabase`, `Get-AzSqlServerFirewallRule`, `Get-AzSqlServerActiveDirectoryAdministrator`
- Automation assets: `Get-AzAutomationAccount`, `Get-AzAutomationRunbook` (flag for later `Export-AzAutomationRunbook` review — runbooks often embed secrets)
- Network topology: `Get-AzVM`, `Get-AzVirtualNetwork`, `Get-AzPublicIpAddress`, `Get-AzExpressRouteCircuit`, `Get-AzVpnConnection`
- Identity/tenant recon: `Get-MSolCompanyInformation`, `Get-MSolUser`, `Get-MSolGroup`

**Tools:** Nessus, nmap, hping3, curl (external surface); Nessus/Defender for Cloud (internal surface)


# Post Compromise Reconnaissance

After successfully compromising an Azure environment, the post-compromise recon phase is crucial for understanding the scope of your access and identifying potential paths to escalate privileges or
exfiltrate data.

This framework helps you understand how to gain a foothold within Azure after compromise and begin identifying further opportunities for exploitation, privilege escalation, and persistence in the environment. It also stresses the importance of knowing what tools and modules to use for accessing Azure resources via the portal or command-line interfaces.

## 1. Who do we have access as?

- **Roles and Permissions**: Determine the roles assigned to the compromised account. For example, are you a standard user, or do you have privileged access like a contributor or admin? Understanding the access control policies and group memberships is key to escalating privileges.

- **Multi-Factor Authentication (MFA)**: Verify if MFA is enabled for the compromised account. If it’s not, this could be an area of exploitation.

- **Accessible Resources**: Check what resources you can access within
  the Azure environment (web apps, databases, storage accounts, etc.).
  Identify if any sensitive data is stored within these resources.

- **Who Are the Admins?**: Identify users with administrative privileges
  (Global Admins, Privileged Role Administrators, etc.). Tools like
  BloodHound or AzureHound can help with this.

- **Privilege Escalation Path**: Develop a plan for escalating to admin
  privileges. Look for any vulnerabilities or misconfigurations that
  could be leveraged for this, such as unprotected roles or
  misconfigured identity management.

## 2. Security Controls

- **Microsoft Defender for Cloud**: Check if Microsoft Defender for Cloud or other advanced threat protection mechanisms (like ATP) are in place. These tools may detect malicious activity, making it harder to remain undetected.

- **GuardDuty and Sentinel**: Assess if GuardDuty or Sentinel are being used for threat detection, and try to understand what logs are being monitored. These might reveal any suspicious activity.

- **Logs and Alerts**: Check if there are any logs or monitoring alerts in place that might expose your activities.

## 3. Azure Portal Access

- **Standard User Access**: Even as a standard user, you may still have access to significant Azure domain information. Azure portal access is often not heavily restricted for non-admin users.

- **Portal.azure.com**: Authenticated users can access the Azure portal (portal.azure.com) to gather insights into the environment. A standard user can view Microsoft Entra information and other resources that might give you valuable intel for further exploitation.

- **Global Address List**: The O365 Global Address List contains valuable information about the organization’s users and structure, which could aid in phishing or targeting specific individuals.

- **PowerShell Cmdlets**: Even if the portal is locked down, PowerShell cmdlets can often bypass restrictions. Be aware that certain company-wide settings might restrict the use of PowerShell commands.
  For example:
  `Set-MsolCompanySettings -UsersPermissionToReadOtherUsersEnabled`
  \$false

This setting can be configured to block users from viewing other user data, including administrative information, through the command line.

## 4. PowerShell Modules for Azure Penetration Testing

- **Az Module**: The Az PowerShell module is the primary tool for interacting with Azure resources. Familiarity with this module is essential for recon and exploitation tasks.

- **AzureAD & MSOnline**: These modules can be used to interact with Microsoft Entra and manage cloud identities and resources.

- **CLI Tools**: In addition to PowerShell, you can use Azure CLI (az cli) for cross-platform command-line interaction with Azure resources. This is useful for Linux and Windows environments.

- **CloudPentestCheatsheets**: A great resource for various cloud penetration testing techniques, including detailed PowerShell scripts and examples: [CloudPentestCheatsheets](https://github.com/dafthack/CloudPentestCheatsheets)

## 1. Scan for Open Ports on Azure-Hosted Services (using cloudhunter.py)**

File: `azure_port_scan.sh`

```bash
\#!/bin/bash
TARGET=\$1
if \[ -z "\$TARGET" \]; then
echo "Usage: \$0 http://target-url"
exit 1
fi
python3 cloudhunter.py --write-test --open-only "\$TARGET"
```

**Usage**: ./azure_port_scan.sh http://myapp.azurewebsites.net

## 2. Azure Subdomain & Endpoint Enumeration (using cf enum)

File: `azure_cf_enum.sh`

```bash
\#!/bin/bash
DOMAIN=\$1
if \[ -z "\$DOMAIN" \]; then
echo "Usage: \$0 \<domain\>"
exit 1
fi
cf enum "\$DOMAIN" \> "\${DOMAIN}\_cf_enum.txt"
echo "\[+\] Results saved to \${DOMAIN}\_cf_enum.txt"
```

**Usage**: ./azure_cf_enum.sh contoso.com

## 3. Fuzz Azure API Endpoints (using ffuf)

**File: azure_api_fuzzer.sh**

```bash
\#!/bin/bash
TARGET=\$1
WORDLIST="/usr/share/seclists/Discovery/Web-Content/api.txt"
if \[ -z "\$TARGET" \]; then
echo "Usage: \$0 https://target-url"
exit 1
fi
ffuf -w "\$WORDLIST" -u "\$TARGET/FUZZ" -mc all -o ffuf_api_results.json
echo "\[+\] Fuzzing complete. Output saved to ffuf_api_results.json"
```

**Usage**: ./azure_api_fuzzer.sh https://api.contoso.com

## 4. Brute-Force Azure Blob Containers (Modified AWS S3 Script)

File: `azure_blob_enum.py`

```bash
\#!/usr/bin/env python3
import requests
account_name = "contoso" \# Customize this
wordlist = "containers.txt" \# Each line: e.g., public, backup, logs
with open(wordlist) as f:
for container in f:
container = container.strip()
url =
f"https://{account_name}.blob.core.windows.net/{container}?restype=container&comp=list"
r = requests.get(url)
if "PublicAccess" in r.text or r.status_code == 200:
print(f"\[+\] Found public container: {container}")
```

**Usage**: python3 azure_blob_enum.py (requires a containers.txt wordlist)

### Azure Environment Discovery and Enumeration Flow

1. Authenticate to Azure Tenant
2. Validate Session Context
3. Retrieve Current Context
4. Enumerate Subscriptions
5. Switch Between Accessible Subscriptions

→ Enumerate Resource Groups
→ Enumerate All Resources
→ Classify Resources by Type
→ Identify Critical Assets
→ Map Resource Relationships
→ Build Initial Cloud Architecture Map
→ Identify High-Value Targets

Commands Mapping Flow:

Connect- AzAccount  
Get-AzContext
Get-AzSubscription
Select-AzSubscription
Get-AzResourceGroup
Get-AzResource

## Service Enumeration and Asset Identification Flow

Identify Storage Services
→ Enumerate Storage Accounts
→ Analyze Storage Exposure
→ Identify Web Applications
→ Enumerate App Services Configuration
→ Discover SQL Servers
→ Enumerate SQL Databases
→ Review Firewall Rules
→ Identify Directory Administrators
→ Detect Access Misconfigurations
→ Flag Public Exposure Risks
→ Document Service Attack Surface

Commands Mapping Flow:

Get- AzStorageAccount  
Get- AzWebApp  
Get- AzSQLServer  
Get- AzSqlDatabase  
Get- AzSqlServerFirewallRule  
Get- AzSqlServerActiveDirectoryAdministrator

## Automation and Operational Asset Enumeration Flow

Discover Automation Accounts
→ Enumerate Runbooks
→ Identify Embedded Credentials or Secrets
→ Export Runbook Content for Analysis
→ Review Automation Permissions
→ Identify Privileged Automation Identities
→ Evaluate Execution Capabilities
→ Detect Potential Abuse Paths

Commands Mapping Flow:

Get- AzAutomationAccount  
Get- AzAutomationRunbook  
Export- AzAutomationRunbook

## Network Infrastructure Mapping Flow

Enumerate Virtual Machines
→ Identify Network Interfaces
→ Enumerate Virtual Networks
→ Map Subnets and Segmentation
→ Identify Public IP Addresses
→ Detect Internet-Exposed Assets
→ Enumerate VPN Connections
→ Enumerate ExpressRoute Circuits
→ Identify Hybrid Connectivity Paths
→ Build Network Attack Surface Map
→ Identify Entry Points

Commands Mapping Flow:

Get- AzVM  
→ Get- AzVirtualNetwork  
→ Get- AzPublicIpAddress  
→ Get- AzExpressRouteCircuit  
→ Get- AzVpnConnection

## Identity and Tenant Enumeration Flow (Azure AD / O365)

Authenticate to Tenant Directory
→ Retrieve Organization Information
→ Enumerate Users
→ Enumerate Groups
→ Identify Privileged Accounts
→ Map Group Membership
→ Identify Administrative Roles
→ Detect Over-Privileged Users
→ Build Identity Attack Surface Map

Commands Mapping Flow:

Connect- MsolService  
→ Get- MSolCompanyInformation  
→ Get-MSolUser  
→ Get- MSolGroup