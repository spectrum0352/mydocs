## Key Azure Pentest Tools

[**MicroBurst**](https://github.com/NetSPI/MicroBurst)

PowerShell tools for enumeration & exploitation in Azure.

- **Blob Enumeration:**

- Invoke-EnumerateAzureBlobs -Base \<storage_account_name\>

- **Certificate Export (from Key Vaults):**

- Get-AzPasswords -ExportCerts Y

[**PowerZure**](https://github.com/hausec/PowerZure)

Enumerate Azure AD, abuse permissions, token replay.

[**ROADTools**](https://github.com/dirkjanm/ROADtools)

Offline Azure AD analysis framework.

[**Stormspotter**](https://github.com/Azure/Stormspotter)

Graph-based tool to visualize attack paths in Azure.

[**MSOLSpray**](https://github.com/dafthack/MSOLSpray)

Password spray tool for Azure AD / Office365.

Import-Module .\MSOLSpray.ps1

Invoke-MSOLSpray -UserList .\users.txt -Password Winter2024

# Azure Penetration Testing Tools Overview

## 1. Azure Privilege Discovery

**SkyArk (Azure version)**

- Discover highly privileged Azure AD users, roles, and shadow admins.

- Modules: AzureStealth, AzureHound

- Requires read access to Azure AD Graph or MS Graph.

git clone https://github.com/cyberark/SkyArk.git

cd SkyArk/AzureStealth

Import-Module .\AzureStealth.ps1 -Force

Start-AzureStealth

## 2. Misconfiguration Exploitation & Enumeration

**Pacu (No Azure equivalent; use multiple tools below)**\
Instead of a single framework like Pacu, Azure PenTesting typically
combines several tools:

**MicroBurst** – Enumeration & exploitation of misconfigurations

- git clone https://github.com/NetSPI/MicroBurst.git

- Import-Module .\MicroBurst.psm1

- Invoke-EnumerateAzureSubDomains -Base example.com

**Stormspotter** – Visualize and map Azure resources for attack paths

- git clone https://github.com/Azure/Stormspotter.git

- pip install -r requirements.txt

- stormspotter --help

**ROADTools** – Token & identity analysis in Azure AD

- pip install roadrecon

- roadrecon auth

- roadrecon gather

- roadrecon gui

## 3. Public Resource Discovery

**Bucket Finder (S3)** → Use Azure Blob Storage enumeration tools:

- **BlobHunter / MicroBurst's blob enumeration**

- Invoke-EnumerateAzureBlobs -UseTorProxy \$true

- **Azurite** – For local storage emulation (testing only)

## 4. SDK & Scripted Access

**Boto3 (AWS)** → **Azure SDK for Python / CLI / PowerShell**

Example: List Azure storage accounts

from azure.identity import DefaultAzureCredential

from azure.mgmt.storage import StorageManagementClient

credential = DefaultAzureCredential()

client = StorageManagementClient(credential, "\<subscription_id\>")

for account in client.storage_accounts.list():

print(account.name)

## 5. Security Auditing & Benchmarking

**Prowler (CIS AWS)** → **AzSecPack / AzGovViz / PSRule for Azure**

- **PSRule for Azure**

- Install-Module -Name PSRule.Rules.Azure

- Invoke-PSRule -Path .\ARMTemplates\\

- **AzSecPack** (Custom rules and baselines)

- **Azure Security Benchmark** (Microsoft baseline mapping)

## 6. IAM Analysis & Privilege Escalation

**Principal Mapper / PMapper (AWS)** → **AzureHound (BloodHound for
Azure)**

- **AzureHound** – Collect and analyze Azure role relationships and
  lateral movement paths

- azurehound collect --client-id ... --tenant-id ...

- **GraphRunner (BloodHound queries for Azure)**

## 7. Multi-Cloud Auditing

**ScoutSuite (AWS & Azure)**

- Static analysis of cloud configurations and permissions

git clone https://github.com/nccgroup/ScoutSuite

python3 scout.py azure --cli

## 8. S3 Object Permission Checker → Blob Storage Checker

Use AzCopy to list blobs or attempt to access public resources:

azcopy list
"https://\<account\>.blob.core.windows.net/\<container\>?\<SAS\>"

## 9. IAM Least Privilege Review

**cloudsplaining (AWS)** → **AzADAssess / PermissionAnalysis.ps1**

- **AzADAssess** (BloodHound-style analysis of Azure RBAC paths)

- **PermissionAnalysis.ps1** – From MicroBurst for enumerating privilege
  escalation

## 10. Offensive Toolkit

**weirdAAL (AWS)** → Combine tools like:

- **MicroBurst** for command execution via automation accounts, function
  apps, etc.

- **Azure Function Abuse** – Upload malicious code via Function App zip
  deploys

## 11. Visualization & Reporting

**CloudMapper (AWS)** → **AzGovViz + Stormspotter**

- **AzGovViz** – Generate governance reports and diagrams

- **Stormspotter** – Attack graph visualizer for Azure

## 12. Secret Discovery

**Dufflebag (AWS EBS)** → **Azure Disk Snapshot / VHD Extraction**

- Mount VHDs from snapshots in a new VM to extract secrets

- Check for exposed VHD blobs (if set to public)

## 13. Console Access Tools

**NetSPI AWS Consoler** → No direct Azure equivalent

- Azure requires either a token + refresh or delegated app access.

- Use **ROADTools + Azure tokens** to simulate portal access via browser
  extension or MSAL automation.

## 2. Tools

- Azure CLI / PowerShell

- BloodHound for Azure (AzureHound)

- MicroBurst

- Stormspotter

- AzurePrivChecker

- ROADTools (for AAD exploitation)

## Leveraging Scanning Tools

**Leveraging Scanning Tools in Azure Penetration Testing**

Automating the scanning of cloud environments is crucial for efficiently
identifying security issues, especially as cloud resources can be
dynamic and large in scale. Below are key points on how scanning tools
can be effectively leveraged in an Azure Penetration Test.

**1. Why Automation Helps**

- **Manual Inspection**: Manual inspection of cloud resources is an
  important first step, especially for minimizing noise and avoiding
  detection. However, automation significantly speeds up the
  vulnerability discovery process.

- **Quick Vulnerability Discovery**: Scanning tools can rapidly identify
  common security issues that would otherwise take a long time to
  discover manually. These tools can be configured to look for specific
  vulnerabilities across a wide range of cloud services.

**2. Common Vulnerabilities to Scan For**

- **IAM Permissions**: Automating the assessment of Identity and Access
  Management (IAM) permissions helps identify users, roles, and policies
  that may be overly permissive or misconfigured.

- **Public Accessibility**: Identifying cloud resources (e.g., storage
  buckets, databases, VMs) that are publicly accessible is crucial for
  preventing unauthorized access.

- **VM and Instance Storage Encryption**: Ensuring that sensitive data
  is encrypted at rest, especially for virtual machines and storage
  instances, is vital for protecting cloud data.

- **Network Configuration**: Scanning for insecure ingress/egress rules
  helps identify misconfigured network security settings, which could
  allow malicious actors to move freely within the environment.

- **Serverless Resources**: Serverless resources like Azure Functions
  can also have misconfigurations, such as exposing sensitive data in
  environment variables or allowing unintended access.

- **VM Metadata**: Scanning for metadata endpoints that are improperly
  exposed can provide access to sensitive information, like instance
  metadata or OAuth tokens.

**3. Using ScoutSuite for Multi-Cloud Auditing**

- **ScoutSuite Overview**: ScoutSuite is an open-source multi-cloud
  auditing tool developed by NCC Group. It supports auditing across
  multiple cloud providers, including **Azure**, **AWS**, **GCP**,
  **Alibaba Cloud**, and **Oracle Cloud Infrastructure**.

- **Azure Support**: For Azure penetration testing, ScoutSuite can help
  identify misconfigurations and vulnerabilities across your Azure
  subscriptions, such as unprotected storage accounts, excessive IAM
  permissions, and exposed network ports.

- **Link**: [ScoutSuite GitHub](https://github.com/nccgroup/ScoutSuite)

**4. Additional Tools for Automating Post-Compromise Actions**

- **ROADTools**: A suite of tools for post-compromise enumeration and
  enumeration of roles in Azure AD.

  - [ROADTools GitHub](https://github.com/dirkjanm/ROADtools)

- **PowerZure**: A PowerShell-based tool for leveraging Azure PowerShell
  to perform reconnaissance and post-exploitation activities.

  - [PowerZure GitHub](https://github.com/hausec/PowerZure)

- **MicroBurst**: A tool designed for Azure AD enumeration and privilege
  escalation.

  - [MicroBurst GitHub](https://github.com/NetSPI/MicroBurst)

- **Stormspotter**: A tool to help identify exposed Azure resources and
  security misconfigurations.

  - [Stormspotter GitHub](https://github.com/Azure/Stormspotter)

- **AzureHound**: A tool by BloodHound for Azure-specific Active
  Directory enumeration and privilege escalation.

  - [AzureHound GitHub](https://github.com/BloodHoundAD/AzureHound)

**5. Key Takeaways for Azure Penetration Testing**

- **Reconnaissance is Critical**: The first step is to thoroughly map
  out the cloud environment, as understanding the assets and
  configurations will guide the attack strategy.

- **Multiple Attack Vectors**: The cloud’s attack surface is vast and
  can be exploited in various ways, including through misconfigured IAM,
  exposed resources, weak password policies, and other vulnerabilities.

- **Dynamic Cloud Resources**: Cloud configurations change frequently,
  so keeping up with changes and automating scans regularly is necessary
  to stay on top of potential vulnerabilities.

- **Key Methods for Gaining a Foothold**:

  1.  **Key Disclosure in Repositories**: Misconfigured repositories or
      exposed API keys are common attack vectors.

  2.  **Password Attacks**: Exploiting weak credentials or poor password
      management policies.

  3.  **Phishing**: Targeting users with social engineering techniques
      to gain access to credentials or tokens.

  4.  **Remote Code Execution**: Exploiting vulnerable web apps or
      serverless functions to execute code remotely.

- **Situational Awareness Post-Compromise**: Once access is gained,
  situational awareness is crucial to understanding the best path
  forward, whether it’s lateral movement, privilege escalation, or
  exfiltrating sensitive data.

------------------------------------------------------------------------

By leveraging these scanning tools and techniques, a penetration tester
can quickly assess Azure environments for common security issues,
automate repetitive tasks, and streamline the overall testing process.
This approach allows for faster identification of vulnerabilities and a
more comprehensive understanding of the cloud environment’s security
posture.
