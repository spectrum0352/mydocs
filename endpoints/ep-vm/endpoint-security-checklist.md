# Endpoint Security Checklist for Small and Medium Businesses

---

## 1. Preventing Initial Compromise

The best defense against cyber attacks is to prevent attackers from gaining initial access to a machine in the first place.

### Vulnerable Software

* [ ] **Patch What You Can:** When vulnerabilities are disclosed, it’s only a matter of time before attackers begin exploiting them. Having a system in place to assess, test, and roll out patches is a vital first defense against attacks.
* [ ] **Isolate What You Can’t:** Patching is vital, but not easy. Isolate systems you can’t patch quickly by restricting network access.
* [ ] **Establish Automated Vulnerability Scanning:** Set up routine automated scans across all network endpoints to detect unpatched software and missing security definitions in real time. *(Comprehensive Addition)*

### Exposed Ports & Services

* [ ] **Secure Remote Desktop (RDP):** Open ports with RDP exposed to the Internet are beacons for attackers. Restrict access to RDP listening ports by placing them behind a firewall and using an RDP Gateway. Enabling network-level authentication (NLA) and changing the default listening port (TCP 3389) is also recommended.
* [ ] **Secure Server Message Block (SMB):** Disable SMBv1 and use firewalls to restrict SMB network activity. WannaCry and other attacks leveraging the EternalBlue exploit have shown just how vulnerable organizations become when exposing SMB.
* [ ] **Disable Unused Services and Ports:** Turn off unused protocol listeners, remote management interfaces, and unused legacy services to minimize the external attack surface. *(Comprehensive Addition)*

### Email

* [ ] **Block Common Malicious File Attachments:** In addition to the obvious executable files (`.EXE`, `.BAT`), consider blocking script files (`.JS`, `.VBS`, etc.), archive files (`.ZIP`, `.SFX`, `.7z`), and even Office files (`.DOC`, `.DOCX`, etc.) and PDFs.
* [ ] **Conduct User Awareness Training:** Many attacks still initially require users clicking something they shouldn’t. Train and inform end-users about attacks that rely on deception, phishing, and social engineering.
* [ ] **Implement Email Authentication Protocols:** Deploy SPF (Sender Policy Framework), DKIM (DomainKeys Identified Mail), and DMARC (Domain-based Message Authentication, Reporting, and Conformance) to prevent email spoofing. *(Comprehensive Addition)*

### Browsers

* [ ] **Utilize Ad-Blockers:** Even legitimate websites can serve as infection points thanks to malvertising.
* [ ] **Enforce Web Content Filtering:** Restrict access to known malicious domains, high-risk categories, and unverified web destinations at the DNS or proxy level. *(Comprehensive Addition)*

### Microsoft Office

* [ ] **Enforce Stricter Macro Controls:** Block macros in Office files downloaded from the Internet. Macros are abused to download malware and launch malicious scripts.
* [ ] **Disable "Update Automatic Links At Open" in Microsoft Word:** This will prevent abuse of the Dynamic Data Exchange (DDE) feature (now disabled by default) and similar threats.
* [ ] **Disable OLE Packages:** Considering the long history of attackers abusing Microsoft’s Object Linking and Embedding (OLE) feature, it’s best disabled when possible.

### General Defense

* [ ] **Deploy Endpoint Protection / EDR Platforms:** Implement centralized Endpoint Protection Platforms (EPP) or Endpoint Detection and Response (EDR) solutions to prevent, detect, and block malicious execution vectors across all endpoints.

---

## 2. Mitigating Post-Exploitation Techniques

Once attackers have access to a machine, they can evade detection by using fileless techniques and legitimate system administration tools to perform unauthorized actions.

### When PowerShell Isn’t Necessary

* [ ] **Disable It:** PowerShell is a powerful scripting framework that can provide attackers with a wide variety of dangerous functionality.

### When PowerShell Is Necessary

* [ ] **Update to the Latest Version of PowerShell:** Newer versions provide additional logging and updates to security features that can otherwise be bypassed on older versions (specifically Version 2).
* [ ] **Block Unsigned PowerShell Scripts:** While attackers can bypass execution policies, enforcing script signing requirements makes malicious attempts more visible and harder to execute cleanly.
* [ ] **Consider Using PowerShell Constrained Language Mode:** Limits PowerShell to basic functionality, rendering many fileless attack techniques unusable.
* [ ] **Enable and Monitor Extended PowerShell Logging:** Enable Script Block Logging, Module Logging, and Transcription Logging. Be prepared for this to generate a high volume of events; centralized log management tools can help process them.

### Secure & Utilize Windows Management Instrumentation (WMI)

* [ ] **Create Defensive Permanent WMI Event Subscriptions:** WMI's wide range of powerful administrative capabilities makes it a popular target for abuse, but also makes it an effective tool for logging and responding to malicious activity.
* [ ] **If There’s No Need for Remote WMI:** Set up a fixed port for WMI and block remote access via firewall rules.

### Apply Application Controls

* [ ] **Limit Execution of Executables, DLLs, and Scripts via AppLocker / WDAC:** Restrict execution to trusted locations and signed applications. Whitelisting stringency depends on organizational requirements.
* [ ] **Harden Application Whitelisting Rules:** Take extra steps to mitigate known AppLocker and Application Control bypass techniques by maintaining updated rule sets.

### Apply Least Privileges & Access Controls

* [ ] **Exercise Least Privilege:** Provide users with the minimum access and privileges necessary to perform job duties, limiting potential damage if credentials are compromised. Tools like Microsoft Just Enough Administration (JEA) can assist.
* [ ] **Use the Highest UAC Enforcement Level:** Set User Account Control (UAC) to "Always Notify" to trigger prompts whenever programs attempt to make changes to Windows settings or system files.
* [ ] **Enable Admin Approval Mode:** Enforces UAC for the built-in Administrator account to help thwart privilege escalation and lateral movement attempts.
* [ ] **Remove Standard Users from the Local Administrators Group:** Prevents unauthorized system modifications and mitigates privilege escalation opportunities.
* [ ] **Disable Credential Caching:** Prohibit storage of cached network credentials. Stored credentials present attackers with opportunities for credential harvesting (e.g., via LSASS dumping).
* [ ] **Avoid Credential Overlap Across Systems:** Ensure local administrator passwords differ per machine (e.g., using LAPS) to block lateral movement.
* [ ] **Avoid Staying Logged In On Remote Systems:** Prevent session hijacking and unauthorized privilege exploitation by logging off inactive administrative sessions.
* [ ] **Disable Anonymous Login for Network File Shares (NFS/SMB):** Open shares provide pivot points for lateral movement and network-wide malware propagation.
* [ ] **Disable Anonymous Login for File Transfer Protocol (FTP):** Restrict unauthenticated read/write access to mitigate unauthorized data exposure and movement.
* [ ] **Enforce Strong Password Policies:** Implement complex passphrases and enforce checks against known breached password lists.
* [ ] **Utilize Multi-Factor Authentication (MFA) Everywhere:** Require multi-factor authentication across all critical systems, remote access points, and user accounts to protect against stolen credentials.
* [ ] **Apply Account Lockout Policies and Progressive Delays:** Mitigate brute-force and password-spraying attempts with threshold locks and login delays.

---

## 3. Active Monitoring & Detection

Continuous monitoring is critical for detecting evasion tactics, persistence mechanisms, and unauthorized administrative activity.

* [ ] **Monitor Changes in the Registry:** Track registry modifications (e.g., Run keys, Startup folders) where attackers commonly hide scripts to achieve persistence. Use WMI subscription events, Sysinternals Autoruns, or EDR telemetry.
* [ ] **Monitor Suspicious WMI Activity:** Set up event monitoring for dynamic WMI queries, unexpected namespace creations, and persistence bindings.
* [ ] **Track Scheduled Task Creation:** Monitor the creation of unexpected scheduled tasks used for persistence and privilege escalation.
* [ ] **Monitor Suspicious Processes and API Calls:** Track process creation logs and operational event logs for anomalous behaviors. Tools like Sysinternals Process Explorer, Process Monitor, and specialized thread inspection utilities help spot process injection.
* [ ] **Detect Processes Spawned with `CREATE_SUSPENDED` Flags:** Monitor process creation flags for indicators of process hollowing and code injection techniques.
* [ ] **Centralize System and Security Logs (SIEM / Log Aggregation):** Aggregate endpoint, firewall, and authentication logs into a central SIEM system for correlated alert detection and auditing. *(Comprehensive Addition)*
* [ ] **Maintain Isolated Offline Backups:** Perform regular, encrypted backups of critical data and maintain offline or immutable copies to ensure recovery against ransomware attacks. *(Comprehensive Addition)*