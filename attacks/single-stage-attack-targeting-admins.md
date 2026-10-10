## **🛠️ Case Study 3: Single-Stage Attack Targeting an Admin**

This attack involved compromising a **system administrator’s workstation** directly — no watering hole was used. The attacker likely
used spear-phishing or infected removable media to gain control over the admin’s computer. Since administrators typically have broad access, the
compromise enabled the attacker to access **high-value internal resources immediately**.



**Corrected Key Points**

* Attack was **single-staged and targeted** (not opportunistic).
* Initial compromise delivered full access due to **privileged user context**.
* Malware was likely tailored, and therefore **evaded traditional antivirus solutions**.
* The attacker escalated privileges **very quickly** due to the admin’s elevated role.



**Azure-Aligned Attack Flow**

|**Attack Phase**|**Real-World Case**|**Azure Equivalent**|
|-|-|-|
|Initial Access|Spear-phishing or USB drop targeting system administrator|Spear-phishing Azure AD Global Admin or injecting session token via browser attack|
|Privilege Escalation|Already privileged user|Compromised Azure AD PIM-enabled role, lateral movement to automation accounts|
|Persistence|Deploys malware persistently|Attacker deploys rogue automation (e.g., Azure Function, Logic App, Runbook)|
|Objectives|Broad access, domain-wide impact|Modify role assignments, access secrets, exfiltrate data from Key Vault, storage|



**Recommended Mitigations in Azure**

|**Category**|**Mitigation in Azure**|
|-|-|
|Privileged Access Control|- Use Microsoft Entra PIM for Just-in-Time (JIT) roles - Require MFA + approval for all role elevations|
|Endpoint Hardening|- Use Microsoft Defender for Endpoint EDR - Secure Admin Workstations (SAWs) with isolated networks|
|Session Protection|- Use Conditional Access to block risky sign-ins - Monitor token lifetimes and revoke stale sessions|
|Identity Hygiene|- Monitor changes in Azure role assignments - Alert on privilege escalation attempts in Microsoft Sentinel|
|Logging \& Monitoring|- Correlate Azure Activity Logs, Defender for Cloud, and Identity Protection alerts|



**🔐 Conclusion Across All 3 Case Studies**

Despite different delivery methods, the core theme is the **exploitation of poor basic security hygiene** using **commodity tools**:

|**Weakness**|**Common Across Case Studies**|**Azure Control**|
|-|-|-|
|Unpatched Software|Java/browser/Windows flaws exploited|Defender for Cloud + Azure Update Management|
|Poor Network Filtering|Unrestricted outbound traffic allowed malware C2|NSGs, Azure Firewall, DNS threat intelligence filtering|
|Lack of Execution Control|Malware installed freely on endpoints|AppLocker, Defender for Endpoint, Azure Policy on VM extensions|
|Overprivileged Accounts|Admin had too much unrestricted access|Microsoft Entra PIM, Role-Based Access Control (RBAC), Identity Protection|
|Weak User Awareness|Phishing/spear-phishing succeeded|Defender for Office 365 phishing protection, User Risk Policies, awareness training|
|Inadequate Monitoring|Detection came late or depended on luck|Microsoft Sentinel, Defender for Identity, Unified Security Operations Center|



