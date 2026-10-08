## Cloud Breach Case Studies: Architecture, Attack Vectors \& Defenses

A breakdown of three landmark enterprise breaches analyzed through the lens of a cloud security architect: root causes, detailed attack progression, blast radius, and compensating engineering controls.



### 1\. Capital One (2019): SSRF to S3 Data Exfiltration

A former AWS systems engineer exploited an open-source Web Application Firewall (ModSecurity running on EC2) to compromise AWS Identity and Access Management (IAM) credentials and exfiltrate customer records.

* **Primary Root Cause:** A Server-Side Request Forgery (SSRF) flaw in an open-source WAF reverse proxy, compounded by AWS Instance Metadata Service version 1 (IMDSv1) and an excessively permissive IAM role.
* **Secondary Weakness:** Lack of granular S3 data-access policies and absence of rate-based egress detection on object storage.

```
\[Attacker] 
   │
   ▼ (1. Exploit SSRF via WAF reverse proxy)
\[EC2 Instance hosting WAF]
   │
   ▼ (2. Query 169.254.169.254 via IMDSv1)
\[EC2 Metadata Service]
   │
   ▼ (3. Extract temporary STS credentials for IAM Role)
\[Over-Permissive IAM Role (\*:ListBucket, \*:GetObject)]
   │
   ▼ (4. Issue AWS CLI commands to target buckets)
\[Amazon S3 Buckets] ──► Exfiltration of 100M+ Customer Records

```

**Detailed Attack Path:**

1. **Reconnaissance \& SSRF Discovery:** The adversary scanned Capital One's external perimeter and identified a misconfigured WAF instance proxying requests without sanitizing internal host targets.
2. **Metadata Harvest via IMDSv1:** By abusing SSRF, the attacker forced the EC2 instance to send an HTTP GET request to `\[http://169.254.169.254/latest/meta-data/iam/security-credentials/](http://169.254.169.254/latest/meta-data/iam/security-credentials/)`. Because IMDSv1 does not require request tokens, the instance returned temporary STS credentials assigned to the EC2 instance profile.
3. **Privilege Exploitation:** The assigned IAM role had broad read permissions across the AWS environment (`s3:ListAllMyBuckets`, `s3:Sync`, `s3:GetObject`).
4. **Data Exfiltration:** Using standard AWS CLI commands, the attacker synced and exfiltrated over 700 S3 buckets containing credit applications, Social Security numbers, and bank account details.
* **Impact:** 106 million customer records compromised; $80M OCC civil penalty, $190M class-action settlement; major executive reorganization.

#### Architecture \& Prevention Controls

|Control Domain|Architectural Mitigation|Technical Implementation|
|-|-|-|
|**Metadata Protection**|Enforce IMDSv2 globally|Set `HttpTokens=required` via AWS CLI / SCP to force session-oriented, PUT-token header checks that defeat SSRF.|
|**IAM Hardening**|Enforce Least Privilege|Scope instance profiles strictly to required operational actions; eliminate wildcards (`s3:\*`).|
|**Network Boundary**|VPC Endpoints \& Service Controls|Route S3 traffic through VPC Gateway Endpoints with strict Endpoint Policies; use Service Control Policies (SCPs) to deny access outside the organization network.|
|**Data Protection**|KMS Key Policies \& Macie|Enforce customer-managed KMS keys with dedicated decrypt policies; deploy Amazon Macie to detect sensitive data exposure.|
|**Detection Engineering**|CloudTrail \& GuardDuty|Ingest CloudTrail into SIEM/SOAR; alert on anomalous `s3:ListBuckets` or high-volume `GetObject` calls from compute roles.|

\---

### 2\. SolarWinds (2020): Supply Chain Build-Pipeline Compromise

Nation-state threat actors (APT29 / Nobelium) compromised the SolarWinds build environment to inject a backdoor (`SUNBURST`) into legitimate, digitally signed updates of the Orion network management platform.

* **Primary Root Cause:** Long-term stealth compromise of internal development infrastructure and automated build pipelines; inadequate build verification and artifact integrity checks.
* **Secondary Weakness:** Over-reliance on trusted, code-signed binaries without runtime behavioral inspection or strict egress filtering on network appliances.

```
\[Threat Actor (APT29)]
   │
   ▼ (1. Lateral movement into SolarWinds Build Environment)
\[Orion Build System (MSBuild)]
   │
   ▼ (2. Dynamic code injection during compilation: SUNBURST)
\[Digitally Signed Orion Update (.dll)]
   │
   ▼ (3. Distributed via legitimate update channel to 18,000+ orgs)
\[Victim Enterprise / Cloud Hybrid Infrastructure]
   │
   ▼ (4. C2 beaconing via DNS DGA \& lateral movement via ADFS/SAML)
\[Compromised Identity Provider / Microsoft 365 Tenant]

```

**Detailed Attack Path:**

1. **Build Environment Compromise:** Attackers secured access to SolarWinds' internal network and deployed specialized tooling (`GoldMax` / `Sunspot`) that monitored build servers for Orion compilation tasks.
2. **Dynamic Code Injection:** During the build process, the malware swapped clean source files with trojanized files on the fly, embedding the `SUNBURST` backdoor without altering source control repositories.
3. **Trusted Distribution:** The resulting `.dll` was signed using SolarWinds' valid digital certificate and pushed as an official software update to approximately 18,000 customers.
4. **C2 \& Lateral Identity Pivot:** Upon deployment in victim environments, the backdoor remained dormant for up to two weeks before generating DNS domain generation algorithm (DGA) beacons to attacker-controlled C2 servers.
5. **Golden SAML Exploitation:** In target environments (including US federal agencies and Microsoft), attackers stole Active Directory Federation Services (ADFS) token-signing keys to forge valid SAML assertions, bypassing MFA and gaining cloud administrative rights across hybrid Azure AD/Entra ID tenants.
* **Impact:** 18,000+ public and private organizations trojanized; deep infiltration into US Treasury, DHS, DoJ, and Fortune 500 networks; historic systemic supply-chain disruption.

#### Architecture \& Prevention Controls

|Control Domain|Architectural Mitigation|Technical Implementation|
|-|-|-|
|**Build Pipeline Integrity**|Deterministic / Hermetic Builds|Implement SLSA (Supply-chain Levels for Software Artifacts) Level 3/4; enforce isolated, ephemeral build workers.|
|**Artifact Verification**|Software Bill of Materials (SBOM)|Generate cryptographic SBOMs (SPDX/CycloneDX); sign artifacts with Sigstore/Cosign; verify signatures prior to deployment.|
|**Identity Architecture**|Cloud Identity Isolation|Decouple on-prem identity from cloud admin roles; migrate from federated ADFS to cloud-native Entra ID authentication with Phishing-Resistant MFA.|
|**Network Egress Controls**|Zero Trust Network Access (ZTNA)|Block arbitrary outbound DNS and HTTP/S from management appliances; inspect all traffic with next-gen firewalls (NGFW).|
|**Runtime Detection**|EDR / XDR Behavior Profiling|Monitor processes spawned by management tools; detect unauthorized child processes executing PowerShell or invoking WMI.|

\---

### 3\. Uber (2022): Social Engineering to PAM/Cloud Takeover

An attacker affiliated with the Lapsus$ group breached an external contractor's credentials, bypassed MFA via notification fatigue, discovered plaintext privileged credentials on internal network shares, and achieved full infrastructure takeover.

* **Primary Root Cause:** Weak MFA validation (susceptible to push fatigue) combined with poor secrets hygiene (plaintext administrative credentials stored in automation scripts on internal network shares).
* **Secondary Weakness:** Over-permissive network access for contractor identities; flat internal network permissions enabling unrestricted lateral movement to Privileged Access Management (PAM) keys.

```
\[Attacker (Lapsus$)]
   │
   ▼ (1. Credential stuffing + WhatsApp social engineering / MFA Push Fatigue)
\[Contractor Identity]
   │
   ▼ (2. Establish Corporate VPN Session)
\[Internal Corporate Intranet]
   │
   ▼ (3. Network share reconnaissance: discovers PowerShell script)
\[Hardcoded Hard-Admin Creds for Thycotic PAM]
   │
   ▼ (4. Authenticate directly into Privileged Access Management Vault)
\[Thycotic PAM Vault]
   │
   ▼ (5. Extract master secrets: AWS IAM, Google Workspace, Slack, SentinelOne)
\[Complete Cloud Infrastructure \& SaaS Takeover]

```

**Detailed Attack Path:**

1. **Initial Access via MFA Fatigue:** The threat actor acquired contractor credentials likely via dark-web infostealer logs. They initiated repeated MFA push requests while impersonating Uber IT support over WhatsApp, convincing the contractor to approve the request.
2. **Intranet Discovery:** Connected via internal VPN, the attacker mapped out network shares without triggering network access restrictions.
3. **Secrets Extraction:** Within a network drive, the attacker found a PowerShell maintenance script containing hardcoded credentials for Uber's Thycotic Privileged Access Management (PAM) solution.
4. **Privilege Escalation:** Using the extracted PAM credentials, the attacker gained administrative access to the vault, exposing root-level keys for:
* AWS production environments
* Google Workspace (admin console)
* Slack (company-wide broadcast access)
* HackerOne vulnerability reports
* SentinelOne administrative console



* **Impact:** Near-total compromise of internal cloud environments, development repositories, employee communication platforms, and security ticketing systems.

#### Architecture \& Prevention Controls

|Control Domain|Architectural Mitigation|Technical Implementation|
|-|-|-|
|**Authentication Security**|Phishing-Resistant MFA|Mandate FIDO2/WebAuthn hardware keys (e.g., YubiKeys) or enforce MFA number matching to eliminate prompt bombing.|
|**Secrets Governance**|Centralized Secrets Vaulting|Remove all static credentials from code/scripts; enforce dynamic, short-lived tokens via HashiCorp Vault, AWS Secrets Manager, or Azure Key Vault.|
|**Code \& Repository Scanning**|Automated Secret Detection|Deploy pre-commit hooks (TruffleHog, Gitleaks) and continuous CI/CD pipeline scans to block commits containing credentials.|
|**Access Segmentation**|Micro-segmentation \& ZTNA|Restrict contractor VPN access using context-aware, least-privilege Zero Trust policies; segment PAM console access to dedicated Privileged Access Workstations (PAWs).|
|**Behavioral Monitoring**|Identity Threat Detection (ITDR / UEBA)|Flag geographic anomalies, velocity violations, and atypical volume of secrets access in PAM systems.|

\---

## Unified Enterprise Defensive Blueprint

To mitigate these recurring attack patterns, modern cloud architectures standardize on three foundational pillars:

```
┌────────────────────────────────────────────────────────────────────────┐
│                        ZERO TRUST CONTROL PLANE                        │
│   • Phishing-Resistant MFA (FIDO2)      • Context-Aware Conditional Access │
│   • Ephemeral JIT Privileges (No static keys) • Strict Least-Privilege IAM  │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
       ┌────────────────────────────┴───────────────────────────┐
       ▼                                                        ▼
┌──────────────────────────────┐        ┌──────────────────────────────┐
│  WORKLOAD \& DATA SECURITY    │        │  DETECTION \& VISIBILITY      │
│ • IMDSv2 mandatory           │        │ • CSPM + CNAPP posture checks│
│ • Hermetic SLSA CI/CD        │        │ • ITDR / UEBA behavioral logs│
│ • Dynamic Vault Secrets      │        │ • CloudTrail / VPC Flow Logs │
│ • S3 Private VPC Endpoints   │        │ • Automated SOAR Quarantine  │
└──────────────────────────────┘        └──────────────────────────────┘

```

\---

## Executive \& Interview Response Blueprint

When asked: *"How do you approach cloud security architecture given historical breach trends like Capital One, SolarWinds, and Uber?"*

> "Analyzing major incidents like Capital One, SolarWinds, and Uber demonstrates that catastrophic cloud breaches rarely stem from exotic, unpatched zero-days. Instead, they exploit identity misconfigurations, static secrets, and lateral trust assumptions.
> My architectural framework focuses on three non-negotiables:
> 1. \*\*Identity as the Primary Perimeter:\*\* Eliminate static keys entirely through short-lived STS tokens, mandate FIDO2 phishing-resistant authentication to neutralize MFA fatigue, and isolate administrative functions behind dedicated Privileged Access Workstations (PAWs).
> 2. \*\*Continuous Posture \& Metadata Enforcement:\*\* Enforce baseline system configurations via code—such as mandatory IMDSv2 to defeat SSRF attacks, private service endpoints to contain data plane exposure, and automated CI/CD secret scanning.
> 3. \*\*Defensive Depth in the Software Supply Chain:\*\* Shift from implicit trust to cryptographic verification using deterministic builds, automated SBOM generation, and runtime behavioral monitoring rather than relying solely on binary signatures."
> 
> 

\---

