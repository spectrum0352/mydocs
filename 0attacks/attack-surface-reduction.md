# Microsoft Defender for Endpoint Attack Surface Reduction (ASR)

Attack Surface Reduction (ASR) is a security capability in Microsoft Defender for Endpoint (MDE) that reduces an organization's exposure to cyberattacks by blocking common attack techniques before they can be exploited. ASR is a core component of Microsoft Defender XDR and helps prevent malware, ransomware, credential theft, and fileless attacks.

---

## Attack Surface Reduction Strategy

A comprehensive attack surface reduction strategy combines endpoint hardening, identity protection, application control, and network security.

| Security Control                       | Description                                                                                                                                                                       |
| -------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Endpoint Hardening**                 | Secure endpoints by applying security baselines, disabling unnecessary services, removing unused software, enabling firewalls, and enforcing secure configurations.               |
| **Patch and Vulnerability Management** | Regularly identify, prioritize, and remediate operating system and application vulnerabilities using Microsoft Defender Vulnerability Management or other vulnerability scanners. |
| **Identity and Access Management**     | Enforce Multi-Factor Authentication (MFA), Conditional Access, and the principle of least privilege to reduce credential-based attacks.                                           |
| **Network Segmentation**               | Segment networks to limit lateral movement if an endpoint becomes compromised.                                                                                                    |
| **Application Control**                | Allow only trusted and approved applications to execute, preventing unauthorized or malicious software from running.                                                              |
| **Exploit Protection**                 | Enable exploit mitigations to protect applications and the operating system against memory corruption and exploitation techniques.                                                |
| **Web and Network Protection**         | Block malicious websites, phishing pages, command-and-control (C2) servers, and unsafe network connections.                                                                       |
| **Controlled Folder Access**           | Protect sensitive folders from unauthorized modifications, helping defend against ransomware attacks.                                                                             |
| **Device Control**                     | Restrict or monitor the use of removable media such as USB storage devices to prevent malware introduction and data exfiltration.                                                 |
| **Security Awareness Training**        | Train users to recognize phishing, social engineering, malicious attachments, and other common attack methods.                                                                    |
| **Continuous Monitoring**              | Continuously monitor endpoint activity, investigate alerts, and automate incident response using Microsoft Defender XDR.                                                          |

---

## Core ASR Components

### 1. Attack Surface Reduction Rules

ASR Rules block common techniques used by malware and attackers before they can compromise a device.

Examples include:

* Block executable content from email and webmail clients
* Block Office applications from creating child processes
* Block Office applications from injecting code into other processes
* Block credential stealing from LSASS
* Block executable files unless they meet prevalence, age, or trusted list criteria
* Block process creation originating from PSExec and WMI commands
* Block JavaScript or VBScript from launching downloaded executable content
* Block persistence through WMI event subscriptions
* Block abuse of vulnerable signed drivers

> **Requirement:** Microsoft Defender Antivirus must be running in active mode.

---

### 2. Hardware-Based Isolation

Provides hardware-assisted security to protect the operating system from low-level attacks.

Examples include:

* Virtualization-Based Security (VBS)
* Hypervisor-Protected Code Integrity (HVCI)
* Secure Boot
* TPM-based attestation
* Microsoft Edge Application Guard for browser isolation

---

### 3. Application Control

Allows only trusted applications to execute on managed devices.

Technologies include:

* Windows Defender Application Control (WDAC)
* AppLocker

Benefits include:

* Prevents unauthorized software execution
* Blocks unsigned applications
* Reduces malware execution

---

### 4. Exploit Protection

Mitigates memory corruption and software exploitation techniques without requiring application changes.

Common protections include:

* Data Execution Prevention (DEP)
* Address Space Layout Randomization (ASLR)
* Control Flow Guard (CFG)
* Structured Exception Handler Overwrite Protection (SEHOP)

> Exploit Protection can work alongside third-party antivirus products.

---

### 5. Network Protection

Blocks outbound connections to malicious domains, phishing websites, and command-and-control infrastructure.

Capabilities include:

* URL reputation checks
* SmartScreen integration
* Protection against phishing websites
* Blocking known malicious IP addresses and domains

> **Requirement:** Microsoft Defender Antivirus.

---

### 6. Web Protection

Protects users while browsing the web by enforcing safe browsing policies.

Features include:

* Phishing protection
* Malware website blocking
* Web content filtering
* Custom URL indicators
* Browser protection across supported browsers

---

### 7. Controlled Folder Access

Protects critical folders from unauthorized modifications.

Benefits include:

* Prevents ransomware encryption
* Blocks unauthorized applications from modifying protected files
* Allows administrators to create trusted application allowlists

> **Requirement:** Microsoft Defender Antivirus.

---

### 8. Device Control

Controls access to removable storage devices and peripheral hardware.

Examples include:

* USB storage restrictions
* Read-only USB access
* Device allowlists and blocklists
* Printer restrictions
* Bluetooth device control

Benefits include:

* Prevents data exfiltration
* Reduces malware introduced via removable media

---

## Deploying ASR Policies

ASR policies can be deployed using:

* Microsoft Defender XDR portal
* Microsoft Intune
* Microsoft Configuration Manager (ConfigMgr)
* Group Policy
* PowerShell
* Microsoft Graph API

Typical deployment steps:

1. Open the Microsoft Defender XDR portal.
2. Navigate to **Endpoints** → **Attack Surface Reduction**.
3. Create a new policy or edit an existing policy.
4. Configure the required ASR rules.
5. Assign the policy to users or device groups.
6. Monitor deployment and review security events.

---

## ASR Rule Modes

### Audit Mode

* Logs events without blocking activity.
* Helps evaluate the impact of rules before enforcement.
* Recommended during initial deployment.

### Block Mode

* Actively blocks malicious behavior.
* Generates security alerts.
* Recommended after successful testing.

### Warn Mode *(supported by selected rules)*

* Displays a warning to users before allowing an action.
* Users may bypass the warning if permitted by policy.

---

## ASR Best Practices

* Deploy ASR rules in **Audit Mode** before switching to **Block Mode**.
* Test policies in a pilot environment before organization-wide deployment.
* Review Microsoft security recommendations regularly.
* Enable Microsoft Defender Antivirus in active mode for full ASR functionality.
* Keep Windows and Microsoft Defender security intelligence up to date.
* Monitor ASR events using Microsoft Defender XDR advanced hunting and security reports.
* Regularly review exclusions to ensure they remain necessary.
* Combine ASR with Endpoint Detection and Response (EDR), Microsoft Defender Vulnerability Management, and Microsoft Intune for layered endpoint protection.
* Use the principle of least privilege to reduce the effectiveness of malware and post-compromise attacks.

---

## Benefits of Attack Surface Reduction

* Reduces malware execution
* Prevents ransomware attacks
* Blocks common Office-based attack techniques
* Protects against credential theft
* Prevents fileless attacks
* Reduces attack opportunities before exploitation
* Limits lateral movement within the environment
* Improves overall endpoint security posture
* Enhances Zero Trust security implementation
* Strengthens defense-in-depth across the enterprise
