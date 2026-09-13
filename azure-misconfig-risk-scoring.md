# Azure Cloud Misconfiguration & Vulnerability Security Scoring Framework
For Azure, the scoring model should be broader than the example because a cloud vulnerability is rarely only a “patching” problem. It should evaluate **exposure, identity, network controls, configuration, workload security, logging/detection, data protection, vulnerability management, resilience, and incident response**.

This is the enterprise-oriented scoring framework that can be used for **Azure cloud misconfiguration/vulnerability assessments, Microsoft Defender for Cloud posture reviews, Sentinel/SOC assessments, and vulnerability-specific exposure assessments**.

## 1. Purpose

This framework provides a standardized method for assessing the security posture of Azure subscriptions, management groups, workloads, identities, networks, applications, and data against:

* Azure security misconfigurations
* Known vulnerabilities and CVEs
* Cloud attack techniques
* Identity compromise
* Privilege escalation
* Lateral movement
* Data exposure
* Persistence mechanisms
* Defense evasion
* Command execution
* Cloud control-plane abuse
* Inadequate monitoring and response

The framework can be applied to a specific vulnerability such as a critical CVE or to the **overall Azure security posture**.

The scoring model uses a **1–5 maturity/control effectiveness scale**, supplemented by an **exposure and exploitability assessment**.

---

# 2. Recommended Azure Security Scoring Model

A single control score is not sufficient.

For each control or security capability, calculate:

> **Control Effectiveness Score × Exposure Factor × Exploitability Factor**

The resulting score can then be used to prioritize remediation.

### Primary scoring dimensions

| Dimension             | What it measures                         | Score |
| --------------------- | ---------------------------------------- | ----: |
| Preventive Control    | Ability to prevent exploitation          |   1–5 |
| Detective Control     | Ability to detect malicious activity     |   1–5 |
| Response Capability   | Ability to contain/remediate             |   1–5 |
| Asset Exposure        | How exposed the affected asset is        |   1–5 |
| Exploitability        | Likelihood the weakness can be exploited |   1–5 |
| Business Criticality  | Importance of affected asset/data        |   1–5 |
| Compensating Controls | Additional controls reducing risk        |   1–5 |

For executive reporting, however, a simpler **100-point Azure Security Posture Score** is easier to understand.

---

# 3. Azure Cloud Security Posture Score

| Security Domain                         |   Weight | Maximum Points |
| --------------------------------------- | -------: | -------------: |
| Identity & Access Management            |      15% |             15 |
| Network Security & Exposure             |      15% |             15 |
| Vulnerability & Patch Management        |      15% |             15 |
| Cloud Configuration & Governance        |      10% |             10 |
| Workload/VM Security                    |      10% |             10 |
| Data & Key Security                     |      10% |             10 |
| Logging, Monitoring & Detection         |      10% |             10 |
| Application/API Security                |       5% |              5 |
| Backup & Recovery                       |       5% |              5 |
| Incident Response & Security Operations |       5% |              5 |
| **Total**                               | **100%** |        **100** |

### Overall interpretation

|  Score | Security Posture | Interpretation                                     |
| -----: | ---------------- | -------------------------------------------------- |
| 90–100 | 🟢 Excellent     | Strong preventive, detective and response controls |
|  80–89 | 🟢 Good          | Generally secure; limited gaps                     |
|  70–79 | 🟡 Moderate      | Material weaknesses requiring remediation          |
|  60–69 | 🟠 Weak          | Significant security exposure                      |
|    <60 | 🔴 Critical      | High likelihood of successful compromise           |

**Important:** A high overall score must not hide a critical individual weakness. A publicly exposed, exploitable management interface, compromised privileged identity, or unprotected sensitive data store should be treated as a **critical exception** regardless of the aggregate score.

---

# 4. Detailed Azure Control Scoring

## A. Identity & Access Management — 15 Points

| Control             | Azure/NIST Alignment | Score 5                                                      | Score 4                 | Score 3                            | Score 2                       | Score 1                             |
| ------------------- | -------------------- | ------------------------------------------------------------ | ----------------------- | ---------------------------------- | ----------------------------- | ----------------------------------- |
| MFA                 | IA-2                 | MFA enforced for all interactive users                       | >98% coverage           | 90–98%                             | Partial coverage              | No effective MFA                    |
| Conditional Access  | AC-2, AC-3           | Risk/location/device-based policies comprehensively enforced | Mostly enforced         | Basic policies                     | Limited policies              | No meaningful CA                    |
| Privileged access   | AC-6                 | PIM/JIT + approval + MFA                                     | Mostly PIM              | Some privileged accounts protected | Many standing privileges      | Permanent privileged access         |
| Least privilege     | AC-6                 | RBAC least privilege validated regularly                     | Minor excessive access  | Moderate excessive permissions     | Broad permissions             | Global Admin/Owner broadly assigned |
| Service principals  | AC-6, IA-4           | Managed identities preferred; secrets eliminated             | Mostly managed identity | Some application secrets           | Many long-lived credentials   | Uncontrolled credentials            |
| Workload identities | AC-6                 | Federated/managed identities with scoped permissions         | Strong controls         | Moderate                           | Broad permissions             | Unrestricted identity permissions   |
| Privileged accounts | AC-6                 | Dedicated admin identities + PIM                             | Mostly controlled       | Some shared/admin accounts         | Excessive privileged accounts | Shared permanent admin accounts     |
| Access reviews      | AC-2                 | Automated periodic review                                    | Regular review          | Inconsistent                       | Rare                          | None                                |

### Critical Azure identity indicators

Immediate escalation should occur when:

* Global Administrator assigned permanently
* Owner assigned at management-group/subscription scope without business justification
* Service principal has excessive privileges
* Long-lived client secrets are used unnecessarily
* MFA is absent for privileged accounts
* PIM is not used for highly privileged roles
* Managed identities have broad subscription/resource-group permissions

---

# 5. Network Security & Exposure — 15 Points

| Control              | Azure/NIST Alignment | Score 5                                     | Score 4                 | Score 3               | Score 2             | Score 1                         |
| -------------------- | -------------------- | ------------------------------------------- | ----------------------- | --------------------- | ------------------- | ------------------------------- |
| Public IP exposure   | SC-7                 | No unnecessary public IPs                   | Very limited exceptions | Some exposure         | Numerous public IPs | Extensive uncontrolled exposure |
| NSG                  | SC-7                 | Least-privilege rules                       | Minor gaps              | Moderate gaps         | Broad rules         | Any-to-any rules                |
| Azure Firewall       | SC-7                 | Centralized filtering + threat intelligence | Mostly enforced         | Partial deployment    | Limited filtering   | No central firewall             |
| Inbound access       | SC-7                 | Private access only                         | Controlled exceptions   | Moderate restrictions | Broad exposure      | Internet unrestricted           |
| Outbound access      | SC-7                 | Controlled egress                           | Mostly controlled       | Partial               | Broad outbound      | unrestricted outbound           |
| Network segmentation | SC-7                 | Strong workload segmentation                | Mostly segmented        | Moderate              | Limited             | Flat network                    |
| Private Endpoints    | SC-7                 | Sensitive PaaS uses private connectivity    | Mostly implemented      | Partial               | Limited             | Public endpoints                |
| Bastion/JIT          | AC-17                | Bastion/JIT/PIM controlled access           | Mostly implemented      | Partial               | Direct admin access | Public RDP/SSH                  |
| DNS security         | SC-20                | Controlled DNS architecture                 | Strong                  | Moderate              | Weak                | Uncontrolled DNS                |

### High-risk network configurations

| Finding                                           | Risk     |
| ------------------------------------------------- | -------- |
| Internet → RDP 3389                               | Critical |
| Internet → SSH 22                                 | Critical |
| `0.0.0.0/0` administrative access                 | Critical |
| Public VM IP without strong justification         | High     |
| Any-to-any NSG rule                               | Critical |
| Public storage endpoint containing sensitive data | Critical |
| Unrestricted outbound traffic                     | High     |
| Flat production network                           | High     |

---

# 6. Vulnerability & Patch Management — 15 Points

**NIST:** SI-2 — Flaw Remediation

| Control                            | Score 5                | Score 4        | Score 3  | Score 2 | Score 1 |
| ---------------------------------- | ---------------------- | -------------- | -------- | ------- | ------- |
| Critical vulnerability remediation | ≥99% within SLA        | 95–98%         | 90–94%   | 75–89%  | <75%    |
| High vulnerability remediation     | ≥98%                   | 95–97%         | 90–94%   | 75–89%  | <75%    |
| Internet-facing critical CVEs      | 100% within SLA        | ≥98%           | 90–97%   | 75–89%  | <75%    |
| VM patch compliance                | ≥99%                   | 95–98%         | 90–94%   | 75–89%  | <75%    |
| Container image scanning           | 100%                   | >95%           | 80–95%   | 50–79%  | <50%    |
| Vulnerability exception management | Formal risk acceptance | Strong process | Moderate | Weak    | None    |

### Vulnerability priority

| Condition                                           | Priority |
| --------------------------------------------------- | -------- |
| Critical CVE + Internet exposed + exploit available | 🔴 P0    |
| Critical CVE + Internet exposed                     | 🔴 P1    |
| Critical CVE + privileged workload                  | 🔴 P1    |
| High CVE + Internet exposed                         | 🔴 P1    |
| Critical CVE + internal-only workload               | 🟠 P2    |
| High CVE + internal workload                        | 🟠 P2    |
| Medium vulnerability                                | 🟡 P3    |
| Low vulnerability                                   | 🟢 P4    |

---

# 7. Azure Configuration & Governance — 10 Points

**NIST:** CM-2, CM-6, CM-7

| Control                       | Score 5                           | Score 4            | Score 3 | Score 2 | Score 1 |
| ----------------------------- | --------------------------------- | ------------------ | ------- | ------- | ------- |
| Azure Policy                  | Comprehensive deny/audit policies | Mostly enforced    | Partial | Limited | None    |
| Secure configuration baseline | 100% compliant                    | >95%               | 90–95%  | 75–89%  | <75%    |
| Resource locks                | Critical resources protected      | Mostly protected   | Partial | Limited | None    |
| Defender for Cloud            | All critical workloads covered    | >95%               | 80–95%  | 50–79%  | <50%    |
| Management-group governance   | Centralized                       | Strong             | Partial | Weak    | None    |
| Resource tagging              | >98% compliant                    | 95–98%             | 85–94%  | 70–84%  | <70%    |
| Diagnostic settings           | Centralized                       | Mostly centralized | Partial | Limited | None    |

### Recommended Azure Policy controls

At minimum consider policies preventing:

* Public IP assignment to VMs
* Public storage access
* Public Key Vault access
* Unrestricted NSG rules
* HTTP-only communication
* Missing disk encryption
* Missing diagnostic settings
* Missing Defender protection
* Unsupported OS versions
* Unapproved regions
* Unapproved SKUs
* Missing private endpoints
* Excessive RBAC permissions

---

# 8. Workload / VM Security — 10 Points

**NIST:** SI-3, CM-6

| Control               | Score 5                 | Score 4           | Score 3  | Score 2 | Score 1      |
| --------------------- | ----------------------- | ----------------- | -------- | ------- | ------------ |
| Defender for Endpoint | 100% protected          | >98%              | 90–98%   | 70–89%  | <70%         |
| EDR telemetry         | Complete                | Mostly complete   | Partial  | Limited | None         |
| Local admin           | No unnecessary admin    | Highly restricted | Moderate | Broad   | Uncontrolled |
| OS hardening          | CIS/Microsoft baseline  | Mostly compliant  | Moderate | Weak    | None         |
| Application control   | WDAC/App Control        | Strong            | Partial  | Weak    | None         |
| Endpoint firewall     | Enforced                | Mostly            | Partial  | Weak    | Disabled     |
| Secure boot/TPM       | Enabled where supported | Mostly            | Partial  | Limited | Disabled     |

---

# 9. Data Protection & Key Management — 10 Points

**NIST:** SC-12, SC-13, SC-28

| Control                  | Score 5                                    | Score 4 | Score 3  | Score 2      | Score 1             |
| ------------------------ | ------------------------------------------ | ------- | -------- | ------------ | ------------------- |
| Encryption at rest       | Comprehensive                              | Mostly  | Partial  | Limited      | None                |
| Encryption in transit    | TLS enforced                               | Mostly  | Partial  | Weak         | None                |
| Key Vault protection     | Private endpoint + RBAC + purge protection | Strong  | Moderate | Weak         | Public/uncontrolled |
| Secret management        | Managed identities/Key Vault               | Mostly  | Partial  | Many secrets | Hard-coded secrets  |
| Storage access           | Private + RBAC                             | Strong  | Moderate | Broad        | Public              |
| Sensitive data discovery | Comprehensive                              | Strong  | Partial  | Limited      | None                |
| Key rotation             | Automated                                  | Regular | Manual   | Irregular    | None                |

### Critical findings

* Public blob/container containing sensitive information
* Key Vault accessible from the public Internet without appropriate controls
* Secrets stored in source code
* Client secrets with excessive lifetime
* Storage account shared-key access unnecessarily enabled
* No purge protection for critical Key Vaults
* Excessive Key Vault RBAC

---

# 10. Logging, Monitoring & Detection — 10 Points

**NIST:** AU-2, AU-6, SI-4

| Control             | Score 5                       | Score 4 | Score 3  | Score 2       | Score 1        |
| ------------------- | ----------------------------- | ------- | -------- | ------------- | -------------- |
| Azure Activity Logs | 100% centralized              | >98%    | 90–98%   | Partial       | None           |
| Entra ID logs       | Fully ingested                | Mostly  | Partial  | Limited       | None           |
| NSG/Firewall logs   | Centralized                   | Mostly  | Partial  | Limited       | None           |
| Defender telemetry  | Comprehensive                 | Strong  | Moderate | Limited       | None           |
| Sentinel            | Fully operational SOC         | Mature  | Basic    | Limited       | None           |
| Detection rules     | Comprehensive ATT&CK coverage | Strong  | Moderate | Limited       | None           |
| Alert response      | <15 min critical alerts       | <30 min | <1 hour  | Several hours | No defined SLA |
| Threat hunting      | Continuous                    | Regular | Periodic | Ad hoc        | None           |

---

# 11. Application & API Security — 5 Points

**NIST:** SA-11, SI-10

| Control               | Score 5                        | Score 4 | Score 3  | Score 2 | Score 1 |
| --------------------- | ------------------------------ | ------- | -------- | ------- | ------- |
| API authentication    | Strong identity-based auth     | Strong  | Moderate | Weak    | None    |
| API authorization     | Fine-grained RBAC/ABAC         | Strong  | Moderate | Weak    | None    |
| WAF                   | Fully deployed                 | Mostly  | Partial  | Limited | None    |
| Secure SDLC           | SAST/DAST/SCA/secrets scanning | Strong  | Moderate | Limited | None    |
| Dependency management | Continuous scanning            | Regular | Partial  | Manual  | None    |

---

# 12. Backup & Recovery — 5 Points

**NIST:** CP-9, CP-10

| Control             | Score 5                    | Score 4 | Score 3  | Score 2 | Score 1 |
| ------------------- | -------------------------- | ------- | -------- | ------- | ------- |
| Backup coverage     | 100% critical assets       | >98%    | 90–98%   | 75–89%  | <75%    |
| Backup encryption   | CMK/strong encryption      | Strong  | Moderate | Weak    | None    |
| Immutable backup    | Enabled                    | Mostly  | Partial  | Limited | None    |
| Restore testing     | Regularly tested           | Annual  | Partial  | Rare    | Never   |
| Ransomware recovery | Proven recovery capability | Strong  | Moderate | Weak    | None    |

---

# 13. Incident Response & Security Operations — 5 Points

**NIST:** IR-4, IR-5

| Control                | Score 5                      | Score 4        | Score 3    | Score 2 | Score 1 |
| ---------------------- | ---------------------------- | -------------- | ---------- | ------- | ------- |
| Incident response plan | Tested and automated         | Mature         | Basic      | Weak    | None    |
| Sentinel automation    | Extensive SOAR               | Strong         | Moderate   | Limited | None    |
| Containment            | Automated isolation/blocking | Rapid manual   | Moderate   | Slow    | None    |
| Playbooks              | Comprehensive                | Most scenarios | Some       | Few     | None    |
| Incident exercises     | Regular                      | Annual         | Occasional | Rare    | None    |

---

# 14. Vulnerability-Specific Azure Risk Score

For a specific CVE, use the following assessment.

| Factor                | Score 1   | Score 2    | Score 3      | Score 4   | Score 5           |
| --------------------- | --------- | ---------- | ------------ | --------- | ----------------- |
| Internet exposure     | None      | Private    | Restricted   | Indirect  | Direct            |
| Exploitability        | Difficult | Low        | Moderate     | High      | Trivial/automated |
| Asset criticality     | Low       | Moderate   | Important    | High      | Mission-critical  |
| Privilege required    | High      | Moderate   | User         | Low       | None              |
| Authentication        | Strong    | MFA        | Standard     | Weak      | None              |
| Network reachability  | Isolated  | Restricted | Internal     | Broad     | Internet          |
| Data sensitivity      | Public    | Internal   | Confidential | Sensitive | Highly sensitive  |
| Detection capability  | Excellent | Strong     | Moderate     | Weak      | None              |
| Compensating controls | Multiple  | Strong     | Moderate     | Limited   | None              |

### Risk calculation

A practical calculation is:

**Risk Score = Exposure × Exploitability × Asset Criticality × Control Weakness**

Normalize the result to 100.

For operational simplicity:

|  Score | Risk             | Action                            |
| -----: | ---------------- | --------------------------------- |
| 90–100 | 🔴 Critical      | Immediate containment/remediation |
|  75–89 | 🔴 High          | Remediate urgently                |
|  60–74 | 🟠 Significant   | Remediation plan required         |
|  40–59 | 🟡 Moderate      | Remediate according to SLA        |
|  20–39 | 🟢 Low           | Track and improve                 |
|   0–19 | 🟢 Informational | Monitor                           |

---

# 15. Example: Azure VM With Critical CVE

Consider an Azure VM running a vulnerable application.

| Factor               | Assessment                                        | Score |
| -------------------- | ------------------------------------------------- | ----: |
| Internet exposure    | Public endpoint                                   |     5 |
| CVE exploitability   | Public exploit available                          |     5 |
| Asset criticality    | Production application                            |     5 |
| Authentication       | Application exposed without strong authentication |     5 |
| Network reachability | Internet → VM                                     |     5 |
| Data sensitivity     | Confidential business data                        |     4 |
| EDR                  | Defender for Endpoint enabled                     |    1* |
| Network controls     | Azure Firewall + NSG                              |    2* |
| Detection            | Sentinel analytics enabled                        |    2* |

*For controls, lower values here represent **higher weakness/exposure**, rather than maturity.

This should therefore be classified as:

> **Critical — immediate remediation/containment**

The organization should not wait for the aggregate Azure posture score to determine whether the CVE requires action.

---

# 16. Azure Attack-Path Scoring

This is particularly important for cloud security because individual misconfigurations frequently become dangerous only when chained together.

### Example attack path

**Internet → Public VM → Vulnerable Application → OS Execution → Managed Identity → Key Vault → Sensitive Data**

Score each stage:

| Attack Path Stage | Finding               | Risk |
| ----------------- | --------------------- | ---: |
| Internet exposure | Public IP             |    5 |
| Vulnerability     | Critical CVE          |    5 |
| Execution         | Remote code execution |    5 |
| Identity          | VM managed identity   |    4 |
| Privilege         | Excessive RBAC        |    5 |
| Key Vault         | Secret access         |    5 |
| Data              | Sensitive data        |    5 |

### Attack-path priority

| Condition                                                 | Priority    |
| --------------------------------------------------------- | ----------- |
| Internet → RCE → privileged identity → sensitive data     | 🔴 Critical |
| Internet → vulnerable workload → lateral movement         | 🔴 Critical |
| Compromised user → privileged role → subscription control | 🔴 Critical |
| Compromised VM → managed identity → Key Vault             | 🔴 Critical |
| Internal VM → medium vulnerability → limited access       | 🟠 Medium   |

---

# 17. Azure Misconfiguration Scoring Matrix

This can be used directly as an assessment worksheet.

| Misconfiguration                            | Azure Control            | Severity |
| ------------------------------------------- | ------------------------ | -------: |
| Public VM IP                                | Network Security         | Critical |
| Internet RDP/SSH                            | NSG/Firewall             | Critical |
| `0.0.0.0/0` administrative access           | NSG                      | Critical |
| Public Storage Blob                         | Storage Security         | Critical |
| Public Key Vault                            | Key Management           | Critical |
| Owner at subscription for unnecessary users | RBAC                     | Critical |
| Global Administrator without PIM            | Identity                 | Critical |
| MFA disabled for privileged account         | Identity                 | Critical |
| Excessive managed identity permissions      | IAM                      | Critical |
| Secrets in code                             | Secret Management        | Critical |
| Critical CVE on Internet-facing VM          | Vulnerability Management | Critical |
| Defender for Endpoint missing               | Endpoint Security        |     High |
| Diagnostic logging disabled                 | Monitoring               |     High |
| Sentinel not receiving Entra logs           | Detection                |     High |
| Azure Firewall absent where required        | Network                  |     High |
| Broad outbound Internet access              | Egress Security          |     High |
| No backup for production workload           | Resilience               | Critical |
| No restore testing                          | Resilience               |     High |
| Storage using shared keys unnecessarily     | Data Security            |     High |
| Weak TLS configuration                      | Encryption               |     High |
| Missing NSG                                 | Network                  |     High |
| Excessive NSG permissions                   | Network                  |     High |
| Unsupported OS                              | Vulnerability Management |     High |
| No vulnerability scanning                   | Vulnerability Management |     High |
| Missing resource tags                       | Governance               |      Low |
| Missing resource locks                      | Governance               |   Medium |

---

# 18. Azure Security Posture Assessment Template

For every finding, record:

| Field                | Example                              |
| -------------------- | ------------------------------------ |
| Finding ID           | AZ-SEC-001                           |
| Subscription         | Production-Subscription              |
| Management Group     | Production                           |
| Resource             | VM01                                 |
| Resource Type        | Azure VM                             |
| Finding              | Public RDP exposure                  |
| Control Domain       | Network Security                     |
| Azure Control        | NSG                                  |
| NIST Control         | SC-7                                 |
| MITRE ATT&CK         | T1133 / External Remote Services     |
| Exposure             | Internet                             |
| Vulnerability/CVE    | CVE-XXXX-XXXX                        |
| Asset Criticality    | Critical                             |
| Exploitability       | High                                 |
| Current Control      | NSG + Firewall                       |
| Detection            | Sentinel                             |
| Compensating Control | Bastion                              |
| Risk Score           | 92                                   |
| Severity             | Critical                             |
| Remediation          | Remove public IP and enforce Bastion |
| Owner                | Cloud Platform                       |
| SLA                  | 24 hours                             |
| Status               | Open                                 |
| Evidence             | Azure Resource Graph / Defender      |
| Validation           | Security retest                      |

---

# 19. Recommended Azure Security SLA

| Severity                      |                Target Remediation |
| ----------------------------- | --------------------------------: |
| Critical / actively exploited | 24 hours or immediate containment |
| Critical                      |                         ≤72 hours |
| High                          |                           ≤7 days |
| Medium                        |                          ≤30 days |
| Low                           |                          ≤90 days |
| Informational                 |                        Risk-based |

For **actively exploited vulnerabilities**, Internet-facing critical vulnerabilities, exposed credentials, or compromised privileged identities, use **containment first and remediation second**.

---

# 20. Security Analyst Decision Tree

A security analyst investigating an Azure finding should ask:

| Question                                                | Action                                                                    |
| ------------------------------------------------------- | ------------------------------------------------------------------------- |
| Is the resource Internet-facing?                        | Check Public IP, Front Door, Application Gateway, Load Balancer, Firewall |
| Is there a known CVE?                                   | Check Defender vulnerability data/CVE intelligence                        |
| Is exploitation possible remotely?                      | Determine attack vector and required privileges                           |
| Is authentication required?                             | Determine authentication strength                                         |
| What identity does the workload use?                    | Check managed identity/service principal                                  |
| What permissions does that identity have?               | Analyze Azure RBAC                                                        |
| Can the workload reach sensitive resources?             | Review network paths/private endpoints                                    |
| Can it access Key Vault?                                | Review Key Vault RBAC                                                     |
| Can it access Storage?                                  | Review Storage RBAC/data-plane permissions                                |
| Is EDR installed?                                       | Validate Defender for Endpoint                                            |
| Is telemetry available?                                 | Validate AMA/Sentinel/Defender logs                                       |
| Can SOC detect exploitation?                            | Run detection/hunting query                                               |
| Can the resource be isolated?                           | Test containment capability                                               |
| Is backup available?                                    | Validate recovery                                                         |
| Is the finding exploitable in the current architecture? | Perform attack-path analysis                                              |
| Are compensating controls sufficient?                   | Reduce residual risk accordingly                                          |

---

# 21. Recommended Final Risk Calculation

For an enterprise implementation, I recommend maintaining **three separate scores** instead of one:

### A. Security Control Score

> **How well is Azure protected?**

**0–100**

### B. Exposure Score

> **How exposed is the vulnerable resource?**

**0–100**

### C. Exploit Risk Score

> **How likely is successful exploitation and meaningful impact?**

**0–100**

Then calculate:

> **Residual Risk = Inherent Risk − Control Effectiveness**

This is more defensible than simply saying that an environment has an “80% security score.”

---

# 22. Executive Azure Security Scorecard

A monthly/quarterly dashboard can therefore look like this:

| KPI                            | Target | Current | Status |
| ------------------------------ | -----: | ------: | ------ |
| Overall Azure Security Score   |    ≥90 |      86 | 🟡     |
| Critical CVE compliance        |   ≥99% |     96% | 🟡     |
| High CVE compliance            |   ≥98% |     98% | 🟢     |
| Public VM exposure             |      0 |       2 | 🔴     |
| Internet RDP/SSH               |      0 |       0 | 🟢     |
| Privileged accounts under PIM  |   ≥99% |     97% | 🟡     |
| MFA coverage                   |   100% |    100% | 🟢     |
| Defender coverage              |   ≥99% |   99.5% | 🟢     |
| Sentinel log coverage          |   ≥98% |     95% | 🟡     |
| Critical resources with backup |   100% |    100% | 🟢     |
| Critical attack paths          |      0 |       3 | 🔴     |
| Public storage resources       |      0 |       1 | 🔴     |
| Excessive RBAC assignments     |      0 |       7 | 🟠     |

### Most important recommendation

For an **Azure Cloud Security/SOC program**, I would not use the original SentinelOne cheat-sheet-style approach as the primary scoring model. Use it as the **detection/hunting layer**, and combine it with this Azure posture model:

**Asset → Exposure → Vulnerability → Identity → Network Path → Privilege → Data Access → Detection → Response → Residual Risk**

That creates an actual **Azure Attack Exposure & Security Posture Management (AESPM)** methodology rather than a simple configuration checklist. It also fits naturally with **Defender for Cloud + Defender for Endpoint + Microsoft Entra + Azure Policy + Azure Firewall + Sentinel**, allowing each finding to be backed by evidence and mapped to an actionable SOC or cloud-security control.
