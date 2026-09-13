# Microsoft Infra & Azure Ransomware Defense Framework

This framework provides a structured mapping of ransomware attack vectors, MITRE ATT&CK tactics, Microsoft Security mitigations, and Incident Response protocols across Microsoft 365, Entra ID (formerly Azure AD), and Azure Cloud environments.

---

## Strategic Goals & CISA Performance Goals Mapping

| Defense Pillar | Objective | Target CISA CPG Baseline |
| --- | --- | --- |
| **Pillar 1: Entry Prevention** | Prevent initial access across email, endpoints, identity, and remote services. | CPG 2.M (Email Security), CPG 2.I (MFA) |
| **Pillar 2: Privilege Boundary Protection** | Block lateral movement, privilege escalation, and domain dominance. | CPG 2.E (Separation of Admin Duties), CPG 2.W (Asset Inventory) |
| **Pillar 3: Blast Radius Containment** | Prevent exfiltration, bulk encryption, and unauthorized remote access. | CPG 2.L (Secure Sensitive Data), CPG 2.T (Log Collection) |
| **Pillar 4: System Resiliency & Recovery** | Guard against backup deletion, security tool tampering, and data destruction. | CPG 2.R (System Backups), CPG 2.S (Incident Response) |

---

## Threat Matrix: MITRE ATT&CK Mapping & Azure/M365 Defenses

### 1. Reconnaissance & Initial Access

```
[Attacker] ──> (Phishing / Exploits / Password Spray) ──> [Initial Foothold]

```

* **Attacker Objective:** Gain an initial entry point into the local or cloud infrastructure.

#### MITRE ATT&CK Techniques

* **T1598 (Spearphishing):** .001 (Service), .002 (Attachment), .003 (Link), .004 (Vishing)
* **T1190:** Exploit Public-Facing Application
* **T1133:** External Remote Services (RDP, VPNs)
* **T1078:** Valid Accounts
* **T1189:** Drive-by Compromise
* **T1195.001:** Supply Chain Compromise (Software Dependencies)

#### Microsoft Azure & M365 Defenses

* **Identity:** Enforce Conditional Access policies with phishing-resistant MFA (FIDO2, Windows Hello for Business). Enable Entra ID Password Protection and Smart Lockout.
* **Email & Collaboration:** Implement Defender for Office 365 Plan 2 (Safe Attachments, Safe Links, Anti-Phishing policies). Enable AMSI for Office VBA macros.
* **Endpoints:** Apply Defender for Endpoint Attack Surface Reduction (ASR) rules:
* Block executable content from email client and webmail.
* Block Office applications from creating child processes.
* Block Adobe Reader from creating child processes.


* **Network & Perimeter:** Publish on-premises applications via **Entra ID Application Proxy** or **Azure Front Door** instead of exposing direct RDP/SSH. Restrict access via Azure Network Security Groups (NSGs) and Azure Firewall.

---

### 2. Defense Evasion, Privilege Escalation & Lateral Movement

```
[Initial Foothold] ──> (Process Injection / Token Theft) ──> [Privilege Escalation] ──> (Lateral Movement)

```

* **Attacker Objective:** Disable security controls, elevate rights to Domain/Tenant Admin, and pivot across cloud and on-premises resources.

#### MITRE ATT&CK Techniques

* **T1055:** Process Injection
* **T1134:** Access Token Manipulation
* **T1548.002:** Bypass User Account Control (UAC)
* **T1027:** Obfuscated Files or Information
* **T1550:** Use Alternate Authentication Material (.002 Pass the Hash, .003 Pass the Ticket)
* **T1021:** Remote Services (.001 RDP, .002 SMB/Windows Admin Shares)

#### Microsoft Azure & M365 Defenses

* **Privileged Access Strategy:** Implement Enterprise Access Model. Use **Entra ID Privileged Identity Management (PIM)** for Just-In-Time (JIT) and Just-Enough-Access (JEA) role activation with mandatory MFA and approval workflows.
* **Credential Protection:** Deploy **Windows Defender Credential Guard** to isolate LSA secrets. Block LSASS memory dumping using Defender for Endpoint ASR rules.
* **Security Control Integrity:** Enable **Tamper Protection** in Microsoft Defender to prevent malware or threat actors from turning off real-time antivirus protection, cloud-delivered protection, or engine updates.
* **Session & Management Security:** Enforce Conditional Access authentication strength and session controls (e.g., sign-in frequency, persistent browser session controls) for all Azure Portal and M365 admin interfaces.

---

### 3. Collection, Exfiltration, Impact & Destruction

```
[Compromised Admin] ──> (Data Staging) ──> [Exfiltration] ──> [Inhibit Recovery & Encrypt]

```

* **Attacker Objective:** Extract sensitive intellectual property/PII and destroy volume shadow copies, cloud backups, and live storage to force ransom payments.

#### MITRE ATT&CK Techniques

* **T1039 / T1005 / T1213:** Data Collection (Network Shares, Local Systems, Repositories like SharePoint/Teams)
* **T1114:** Email Collection
* **T1041 / T1048:** Exfiltration Over C2 Channel / Alternate Protocol
* **T1486:** Data Encrypted for Impact
* **T1490:** Inhibit System Recovery (Deleting VSS snapshots, disabling cloud backup vaults)
* **T1657:** Financial Theft

#### Microsoft Azure & M365 Defenses

* **Data Security & Governance:** Implement **Microsoft Purview Information Protection** to automatically label and encrypt sensitive data (DLP policies). Audit and restrict broad write/delete permissions on SharePoint, OneDrive, and Azure SMB/NFS file shares.
* **Immutable Backups:** Store system backups using **Azure Backup** with **Soft Delete**, **Enhanced Security** (requiring PIN/MFA for security operations), and immutable storage policies (WORM - Write Once, Read Many). Maintain offline or air-gapped recovery options.
* **Cloud Storage Hardening:** Enable versioning and point-in-time restore on Azure Blob Storage and Azure Files.

---

## Integrated Detection, SOC Monitoring & Response Protocol

### SIEM/XDR Unified Detection Strategy

| Log Source | Critical Detection Events / Signals | Automated Action |
| --- | --- | --- |
| **Entra ID Security** | High-risk sign-ins, anomalous PIM activations, MFA fatigue patterns | Automatically block user via Risk-Based Conditional Access |
| **Defender for Endpoint** | Tamper protection alerts, LSASS access attempts, `vssadmin delete shadows`, mass file modification | Automatically isolate device from the network |
| **Defender for Identity** | Pass-the-Hash, Pass-the-Ticket, Golden Ticket attacks, unexpected LDAP queries | Flag compromised accounts and trigger automated SOC investigation |
| **M365 Defender / Purview** | Mass file download/deletion on SharePoint/OneDrive, anomalous mail forwarding rules | Terminate active user sessions and disable external sharing |
| **Azure Activity / Sentinel** | Mass deletion of Azure Recovery Services Vaults, NSG modification, deletion of storage snapshots | Lock subscription via Azure Resource Manager (ARM) lock / alert Incident Response |

### Tactical Incident Response Playbook

```
[1. Detect & Trigger] ──> [2. Contain] ──> [3. Eradicate] ──> [4. Recover] ──> [5. Post-Incident]

```

1. **Detection & Triage:**
* Correlation of high-severity alerts in **Microsoft Sentinel** and Defender XDR.
* Monitor specialized operational logs: Windows Event ID 1102 (Audit log cleared), PowerShell Event ID 4104 (Script block logging), and Microsoft Defender Operational Logs.


2. **Containment:**
* Execute **Device Isolation** via Defender for Endpoint on all infected or pivoting endpoints.
* Revoke active user refresh tokens via Entra ID (`Revoke-AzureADUserAllRefreshToken` / Entra ID Admin Center).
* Disable compromised user accounts and PIM roles immediately.
* Implement temporary NSG rules in Azure to isolate compromised virtual networks (VNets).


3. **Eradication:**
* Terminate malicious C2 connections identified by Defender for Endpoint.
* Remove persistence mechanisms (scheduled tasks, registry run keys, malicious Azure Enterprise Applications/Service Principals).
* Conduct root-cause investigation using Microsoft Sentinel KQL queries to trace the full attack chain.


4. **Recovery:**
* Validate integrity of **Azure Backup Recovery Services Vaults**.
* Perform staged restoration of critical infrastructure to an isolated sandbox environment prior to reconnecting to the production network.
* Reset passwords and credentials for all impacted domain and cloud accounts using a secure out-of-band workstation.


5. **Post-Incident Activities:**
* Perform gap analysis against MITRE ATT&CK coverage.
* Update ASR rules, Conditional Access policies, and SIEM detections based on lessons learned.
* Re-evaluate and refine Business Continuity / Disaster Recovery (BC/DR) documentation and CMDBs.



---

## Defensive Configuration Checklist

Use this actionable operational checklist to verify your Microsoft environment's resilience against ransomware:

* [ ] **Identity & Access**
* [ ] Phishing-resistant MFA enforced for 100% of users.
* [ ] Emergency access ("Break Glass") accounts secured with hard tokens and monitored by Sentinel.
* [ ] Entra ID PIM configured with JIT and required approvals for key administrative roles (Global Admin, Security Admin, Cloud Application Admin).


* [ ] **Endpoint & Server Protection**
* [ ] Defender for Endpoint deployed in Block mode across all Windows, macOS, and Linux endpoints.
* [ ] Tamper Protection enabled globally across all client and server onboarding policies.
* [ ] Attack Surface Reduction (ASR) rules set to `Block` mode.


* [ ] **Cloud & Infrastructure Safety**
* [ ] Azure Backup Soft Delete and Immutable Storage enabled for all Recovery Services Vaults.
* [ ] Multi-party authorization (Resource Guard) enabled for critical backup modification operations.
* [ ] Public management ports (RDP 3389 / SSH 22) blocked at the Azure Network Security Group (NSG) level.


* [ ] **Data Protection & SOC Readiness**
* [ ] Automated file restoration and version history enabled on SharePoint and OneDrive.
* [ ] Unified SOC logging pipeline sending audit, identity, cloud, and endpoint logs into Microsoft Sentinel.
* [ ] Automated containment playbooks (Logic Apps) deployed and validated through table-top exercises.
