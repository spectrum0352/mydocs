## **Spear-Phishing Targeting System Administrator**

**✅ Summary**

* Attacker socially engineered a **targeted phishing email** to the admin's personal account.
* Admin accessed personal webmail from a **privileged system** and downloaded a Trojanized document.
* Malware installed a **RAT** after social engineering the admin to bypass security prompts.
* The malware established persistence and began **data exfiltration** (screenshots, system info).
* Detection happened mid-stage; impact was limited but required expert forensics and support.



**⚙️ Technical Weaknesses**

|**Category**|**Description**|
|-|-|
|Security Awareness|Admin fell victim to phishing and social engineering|
|Misuse of Privileged Workstation|Admin accessed personal email from privileged device|
|Poor Execution Control|User was able to run downloaded executables|
|Lack of Secure Configuration|No restrictions on running code from temp folders or using personal webmail|
|Weak Egress Controls|Malware beaconed and downloaded second-stage payloads|



**🔐 Azure-Aligned Mapping**

|**Phase**|**Original Attack**|**Azure Environment Equivalent**|
|-|-|-|
|Recon|Identify sysadmin using public info|Harvest Azure Admins using Entra ID enumeration, LinkedIn scraping|
|Delivery|Phishing email with Trojanized attachment|Phishing Azure Global Admin using OAuth consent phishing or malicious Logic App invite|
|Execution|Executable unpacked and persisted in temp folder|Drop payload onto Azure VM or hybrid-joined workstation; register malicious Azure Runbook|
|Persistence|Auto-start on reboot, hidden files|Create persistent scheduled tasks or leverage Managed Identity to schedule PowerShell jobs|
|C2 / Exfiltration|Screenshots, configs exfiltrated to attacker domains|Screenshot Azure Portal sessions via compromised browser, access Key Vault secrets, or Graph API|



**🛡️ Azure Mitigations \& Controls**

|**Control Area**|**Azure-Specific Mitigations**|
|-|-|
|**User Education**|- Implement [Microsoft Attack Simulator](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/attack-simulation-training) - Train admins to separate personal/work accounts|
|**Privileged Access**|- Use [Privileged Access Workstations (PAWs)](https://learn.microsoft.com/en-us/security/compass/privileged-access-workstations) - Enforce JIT via [Microsoft Entra PIM](https://learn.microsoft.com/en-us/azure/active-directory/privileged-identity-management/)|
|**Execution Control**|- Disable script execution from user profile directories - Apply [App Control Policies](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/application-control) via Intune|
|**Egress \& DNS Control**|- Use Azure Firewall DNS filtering or restrict via Private DNS Zones|
|**Monitoring**|- Correlate logs via Microsoft Sentinel, especially unusual script execution from admins|
|**Secure Configuration**|- Harden Azure VMs using [Azure Security Benchmark](https://learn.microsoft.com/en-us/azure/security/fundamentals/azure-security-benchmark) and Baselines|



**🧩 Common Themes Across Both Attacks**

|**Weakness**|**Real-world Impact**|**Azure Equivalent**|
|-|-|-|
|**Third-Party Trust**|Infected website from external provider|Compromised App Service, Function App, Logic App from third-party|
|**End-User Vulnerabilities**|RAT infection through known flaws|Outdated Azure VMs, unmanaged endpoints, or BYOD devices|
|**Execution Control Gaps**|Malware ran from temp/personal folders|No script/application whitelisting on Azure VMs or Intune-managed endpoints|
|**Insufficient Egress Policy**|C2 traffic enabled persistence and exfiltration|Lack of Azure NSG or Firewall outbound rules; no DNS exfiltration detection|
|**Inadequate Admin Hygiene**|Admin ran unknown file, no browser control|Azure Admins using browser without hardening or conditional access segmentation|



