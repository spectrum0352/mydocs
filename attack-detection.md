# Azure Cloud Attack & Threat Detection Engineering Cheat Sheet

> **Purpose:** Defensive security assessment, threat hunting, detection engineering, purple-team exercises, and authorized penetration testing of Microsoft Azure environments.
>
> **Scope:** Microsoft Entra ID, Azure Resource Manager, Azure VMs, Storage, Key Vault, networking, Azure Firewall, Defender for Cloud, Defender XDR, Microsoft Sentinel, Azure Monitor, and Azure CLI/PowerShell.
>
> **Important:** Commands that create persistence, steal credentials, deploy malware, or establish unauthorized remote shells should only be simulated in an isolated, explicitly authorized lab. For production environments, prefer benign validation techniques and telemetry-based attack simulation.

---

## 1. Azure Attack Lifecycle

| Attack Phase         | Typical Azure Attack Activity                                          | Primary Azure Targets                  | Important Telemetry                                       | Detection Focus                             |
| -------------------- | ---------------------------------------------------------------------- | -------------------------------------- | --------------------------------------------------------- | ------------------------------------------- |
| Reconnaissance       | Discover tenants, domains, users, subscriptions, resources             | Entra ID, Azure Resource Manager       | Entra sign-in/audit logs, Activity Log                    | Unusual enumeration                         |
| Initial Access       | Password spray, phishing, token/session theft, compromised application | Entra ID, applications, VPN, Bastion   | Sign-in logs, Conditional Access, Identity Protection     | Risky sign-ins and authentication anomalies |
| Execution            | Run commands/scripts on VMs or cloud resources                         | VMs, Automation, Functions, Logic Apps | Activity Log, VM process telemetry, Defender for Endpoint | Suspicious command execution                |
| Persistence          | New credentials, service principals, role assignments, automation      | Entra ID, RBAC, Automation             | Audit logs, Activity Log                                  | Unauthorized identity/configuration changes |
| Privilege Escalation | Abuse RBAC, managed identities, excessive permissions                  | Entra ID, subscriptions, Key Vault     | Audit logs, Activity Log                                  | Privilege changes                           |
| Defense Evasion      | Disable logging/security controls or modify policies                   | Sentinel, Defender, Azure Policy       | Activity Log, audit logs                                  | Security-control changes                    |
| Credential Access    | Credential/token/key discovery                                         | Entra ID, Key Vault, VMs               | Sign-in/audit logs, Defender telemetry                    | Secret access anomalies                     |
| Discovery            | Enumerate subscriptions/resources/network/security configuration       | ARM, Resource Graph                    | Activity Log                                              | Large-scale enumeration                     |
| Lateral Movement     | Abuse RBAC, managed identities, VM/network access                      | VMs, Storage, Key Vault                | Sign-in, Activity, Defender                               | Cross-resource movement                     |
| Collection           | Access Storage, databases, Key Vault, files                            | Storage, SQL, Key Vault                | Resource logs, Defender                                   | Unusual data access                         |
| Exfiltration         | Copy data to external location                                         | Storage, databases, applications       | Storage logs, Firewall, Defender                          | Large/unusual transfers                     |
| Impact               | Delete resources, modify networking, encrypt/disrupt workloads         | ARM, VMs, Storage                      | Activity Log, Defender                                    | Destructive administrative activity         |

---

# 2. Azure CLI – Security Assessment Basics

| Objective                                   | Command / Technique                                 | Defensive Use                                          |
| ------------------------------------------- | --------------------------------------------------- | ------------------------------------------------------ |
| Authenticate                                | `az login`                                          | Validate identity and authentication flow              |
| Show current account                        | `az account show`                                   | Identify current tenant, subscription and user context |
| List subscriptions                          | `az account list -o table`                          | Detect excessive subscription enumeration              |
| Set subscription                            | `az account set --subscription "<subscription-id>"` | Validate subscription access boundaries                |
| Show tenant                                 | `az account tenant list -o table`                   | Identify accessible tenants                            |
| List resource groups                        | `az group list -o table`                            | Detect resource discovery                              |
| List resources                              | `az resource list -o table`                         | Detect broad resource enumeration                      |
| List VMs                                    | `az vm list -o table`                               | Identify VM discovery                                  |
| List storage accounts                       | `az storage account list -o table`                  | Identify storage discovery                             |
| List Key Vaults                             | `az keyvault list -o table`                         | Identify secret-store discovery                        |
| List role assignments                       | `az role assignment list --all -o table`            | Detect RBAC enumeration                                |
| Show current user/service principal context | `az account show`                                   | Establish identity context                             |
| Query resources with Resource Graph         | `az graph query -q "<KQL>"`                         | Detect large-scale resource enumeration                |

---

# 3. Azure Reconnaissance

| Technique                    | What an Attacker Attempts                                         | Detection Engineering                                       |
| ---------------------------- | ----------------------------------------------------------------- | ----------------------------------------------------------- |
| Tenant discovery             | Identify tenant ID, verified domains and authentication endpoints | Monitor unusual Entra discovery and authentication activity |
| Subscription discovery       | Identify accessible subscriptions                                 | Monitor Azure Resource Manager enumeration                  |
| Resource discovery           | Enumerate VMs, storage, databases, Key Vaults, VNets              | Correlate Activity Log with identity and source IP          |
| Role discovery               | Identify privileged identities and assignments                    | Monitor `Microsoft.Authorization/roleAssignments/*`         |
| Network discovery            | Identify VNets, subnets, NSGs, private endpoints                  | Monitor resource enumeration and configuration reads        |
| Storage discovery            | Identify storage accounts/containers                              | Monitor Storage control-plane and data-plane activity       |
| Key Vault discovery          | Identify vaults and accessible secrets/keys                       | Monitor Key Vault access and authorization failures         |
| Application discovery        | Identify app registrations/service principals                     | Monitor Entra application-management audit events           |
| Public exposure discovery    | Identify public IPs, public endpoints and exposed services        | Defender for Cloud, Azure Resource Graph, Azure Policy      |
| DNS/subdomain reconnaissance | Discover Azure-hosted application endpoints                       | Monitor WAF, DNS and application telemetry where available  |

---

# 4. Microsoft Entra ID Attack Techniques

| Technique                       | Attack Description                                              | Key Indicators                                         | Detection Sources                       |
| ------------------------------- | --------------------------------------------------------------- | ------------------------------------------------------ | --------------------------------------- |
| Password spraying               | Attempt a small number of common passwords across many accounts | Multiple failed sign-ins across users from same source | Entra Sign-in Logs                      |
| Credential stuffing             | Reuse credentials obtained from another breach                  | Successful authentication from unusual source/device   | Entra Sign-in Logs, Identity Protection |
| Phishing                        | Obtain credentials/session tokens through social engineering    | New device/location, risky sign-in                     | Defender for Office 365, Entra          |
| MFA abuse                       | Repeated MFA prompts or social engineering                      | Multiple MFA requests followed by successful login     | Entra authentication logs               |
| Token theft                     | Abuse stolen authentication tokens                              | Authentication inconsistent with normal device/session | Entra, Defender XDR                     |
| Consent abuse                   | User grants malicious application permissions                   | New OAuth consent or unusual permissions               | Entra Audit Logs                        |
| Application abuse               | Compromised application/service principal used for access       | Unusual application sign-ins                           | Service principal sign-in logs          |
| Service principal compromise    | Credentials/certificates of application identity compromised    | Unusual source or resource access                      | Entra service principal logs            |
| Privilege escalation            | Assign privileged directory or Azure roles                      | New privileged role assignment                         | Entra Audit Logs, Azure Activity Log    |
| Account manipulation            | Add authentication methods or modify account properties         | Unexpected authentication-method changes               | Entra Audit Logs                        |
| Conditional Access modification | Security policy weakened                                        | Policy modification followed by suspicious login       | Entra Audit Logs                        |
| Federation abuse                | Manipulation of federated authentication                        | Unexpected federation configuration changes            | Entra Audit Logs                        |

---

# 5. Azure RBAC Abuse

| Attack Technique                      | What to Monitor                                           | Important Activity Log Operations                |
| ------------------------------------- | --------------------------------------------------------- | ------------------------------------------------ |
| Privilege escalation                  | Assignment of Owner/Contributor/User Access Administrator | `Microsoft.Authorization/roleAssignments/write`  |
| Permission modification               | Changes to role assignments                               | `Microsoft.Authorization/roleAssignments/write`  |
| Permission removal                    | Removal of restrictive assignments                        | `Microsoft.Authorization/roleAssignments/delete` |
| Custom role abuse                     | Creation/modification of custom roles                     | `Microsoft.Authorization/roleDefinitions/write`  |
| Excessive access                      | Identity receives permissions beyond business need        | RBAC review and entitlement analysis             |
| Resource-level privilege escalation   | Role assigned at resource/resource-group scope            | Scope and principal correlation                  |
| Management-group privilege escalation | Privileged role at management-group level                 | Management-group Activity Logs                   |
| Managed Identity abuse                | Compromised workload identity accesses resources          | Entra workload identity + resource logs          |

### High-Priority Detection

Monitor:

```text
roleAssignments/write
roleAssignments/delete
roleDefinitions/write
roleDefinitions/delete
```

Prioritize events where:

```text
Caller != approved administrative identity
OR
NewRole IN ("Owner", "Contributor", "User Access Administrator")
OR
Scope is Management Group / Subscription
```

---

# 6. Managed Identity Abuse

| Attack Scenario                        | Description                                                 | Detection                                                   |
| -------------------------------------- | ----------------------------------------------------------- | ----------------------------------------------------------- |
| Compromised VM identity                | Attacker gains access to a VM and uses its managed identity | Correlate VM compromise with identity token/resource access |
| Excessive managed identity permissions | Workload identity has unnecessary roles                     | RBAC entitlement review                                     |
| Cross-resource access                  | Identity accesses resources unrelated to workload           | Baseline identity-to-resource relationships                 |
| Secret retrieval                       | Managed identity accesses Key Vault secrets                 | Key Vault logs + identity correlation                       |
| Storage access                         | Identity reads large quantities of Blob data                | Storage data-plane logs                                     |
| Privileged ARM access                  | Managed identity performs administrative operations         | Activity Log + identity correlation                         |

**Detection principle:** Do not treat managed identities as inherently trusted. Baseline which resources each identity normally accesses.

---

# 7. Azure VM Attack Surface

| Attack Technique      | Example Activity                               | Detection                                 |
| --------------------- | ---------------------------------------------- | ----------------------------------------- |
| Internet exposure     | VM has public IP or exposed management service | Azure Resource Graph, Defender for Cloud  |
| SSH exposure          | TCP/22 accessible from Internet                | NSG + Firewall + Defender                 |
| RDP exposure          | TCP/3389 accessible from Internet              | NSG + Firewall + Defender                 |
| Credential compromise | Compromised local/domain account               | Defender for Endpoint + sign-in telemetry |
| Command execution     | Unexpected shell/PowerShell commands           | Defender for Endpoint                     |
| Run Command abuse     | Azure VM Run Command used unexpectedly         | Azure Activity Log                        |
| Extension abuse       | Malicious/unapproved VM extension              | Activity Log                              |
| Custom Script abuse   | Unexpected script deployment                   | Activity Log + Defender                   |
| Startup persistence   | Changes to startup configuration               | Defender for Endpoint                     |
| Scheduled task abuse  | New suspicious scheduled task                  | Defender for Endpoint                     |
| Service abuse         | New/modified Windows service                   | Defender for Endpoint                     |
| Network pivoting      | VM connects to unexpected internal resources   | NSG Flow Logs / Firewall / Defender       |

---

# 8. Azure VM Run Command

Azure Run Command is particularly important because it provides control-plane-based command execution on VMs.

| Detection Scenario                           | Indicator                                                |
| -------------------------------------------- | -------------------------------------------------------- |
| Unexpected Run Command                       | `Microsoft.Compute/virtualMachines/runCommand/action`    |
| Privileged command execution                 | Run Command executed by non-standard administrator       |
| Cross-subscription activity                  | Identity executes commands against unusual subscriptions |
| Command execution outside maintenance window | Activity occurs outside approved change window           |
| Sensitive VM access                          | Run Command against production/security infrastructure   |
| Repeated execution                           | Multiple Run Command operations in short period          |

**Detection correlation:**

```text
Azure Activity Log
        +
Caller identity
        +
Target VM
        +
Defender for Endpoint process telemetry
        +
Change-management context
```

---

# 9. Azure Storage Attack Techniques

| Technique                  | Attack Objective                    | Detection                                      |
| -------------------------- | ----------------------------------- | ---------------------------------------------- |
| Storage enumeration        | Identify accounts/containers        | ARM + Storage logs                             |
| Unauthorized Blob access   | Read sensitive data                 | Storage data-plane logs                        |
| SAS abuse                  | Use leaked SAS token                | Unusual source/IP/volume                       |
| Excessive data download    | Exfiltrate data                     | Storage transaction/egress telemetry           |
| Public exposure            | Access anonymously                  | Defender for Cloud + Policy                    |
| Container permission abuse | Modify access level                 | Storage configuration logs                     |
| Key compromise             | Use storage account keys            | Authentication/activity telemetry              |
| Lifecycle modification     | Prevent deletion/retention controls | Configuration-change detection                 |
| Data deletion              | Delete blobs/containers             | Storage logs + Activity Log                    |
| Replication abuse          | Copy data to another location       | Storage configuration and data-plane telemetry |

### High-Priority Storage Controls

```text
Public network access: Disabled where possible
Shared Key access: Disabled where feasible
Microsoft Entra authentication: Preferred
Private Endpoint: Preferred
SAS: Short-lived and scoped
Soft Delete: Enabled
Versioning: Enabled where appropriate
Defender for Storage: Enabled
Diagnostic logging: Enabled
```

---

# 10. Azure Key Vault Attack Techniques

| Attack Technique       | What Happens                           | Detection                      |
| ---------------------- | -------------------------------------- | ------------------------------ |
| Vault enumeration      | Identify available Key Vaults          | Activity Log                   |
| Secret discovery       | Identify secrets/keys/certificates     | Key Vault logs                 |
| Secret retrieval       | Read sensitive secret values           | Data-plane logs                |
| Key abuse              | Use cryptographic keys unexpectedly    | Key Vault audit logs           |
| Permission escalation  | Grant identity Key Vault permissions   | RBAC/Activity Log              |
| Network bypass         | Access vault from unauthorized network | Firewall/private endpoint logs |
| Secret deletion        | Delete secrets                         | Key Vault logs                 |
| Purge protection abuse | Attempt permanent deletion             | Activity Log                   |

### Critical Detection Pattern

```text
New RBAC assignment
        ↓
Key Vault access
        ↓
Secret/Key retrieval
        ↓
New resource or authentication activity
```

This sequence should have a **high detection priority**.

---

# 11. Azure Network Attack Surface

| Attack Technique              | Azure Component                | Detection                |
| ----------------------------- | ------------------------------ | ------------------------ |
| Public IP exposure            | Public IP / VM / Load Balancer | Azure Policy + Defender  |
| NSG weakening                 | NSG rule modification          | Activity Log             |
| Firewall rule modification    | Azure Firewall                 | Activity Log             |
| Route manipulation            | Route Tables                   | Activity Log             |
| DNS manipulation              | DNS zones/resolvers            | Activity Log             |
| Private Endpoint modification | Private Link                   | Activity Log             |
| VNet peering abuse            | VNet Peering                   | Activity Log             |
| Network Watcher abuse         | Network diagnostic operations  | Activity Log             |
| Firewall bypass               | Direct public connectivity     | NSG/Firewall/Defender    |
| Lateral movement              | Internal VM-to-VM traffic      | NSG Flow Logs / Firewall |

---

# 12. Azure Firewall Detection

Monitor administrative changes to:

| Object                   | Detection                        |
| ------------------------ | -------------------------------- |
| Network rules            | Unauthorized allow rules         |
| Application rules        | Unauthorized FQDN access         |
| DNAT rules               | Unexpected inbound publishing    |
| Threat intelligence mode | Disabled/changed                 |
| Firewall policy          | Unexpected modification          |
| Rule collection groups   | Unauthorized changes             |
| IP Groups                | Addition of suspicious addresses |
| Diagnostic settings      | Logging disabled                 |

### High-Risk Pattern

```text
Firewall policy modification
        +
New allow rule
        +
New public endpoint / DNAT
        +
Inbound traffic
```

Treat this as a potential defense-evasion or initial-access chain.

---

# 13. Azure Network Discovery

| Technique                  | Defensive Validation               |
| -------------------------- | ---------------------------------- |
| Resource discovery         | `az resource list`                 |
| VNet enumeration           | `az network vnet list`             |
| Subnet discovery           | `az network vnet subnet list`      |
| NSG discovery              | `az network nsg list`              |
| Public IP discovery        | `az network public-ip list`        |
| Private endpoint discovery | `az network private-endpoint list` |
| Firewall discovery         | `az network firewall list`         |
| Route-table discovery      | `az network route-table list`      |

Detection should baseline:

```text
Identity
+
Source IP
+
Subscription
+
Resource count queried
+
Frequency
+
Time of day
```

---

# 14. Azure Activity Log – High-Value Security Events

| Operation Category                                            | Why It Matters                 |
| ------------------------------------------------------------- | ------------------------------ |
| `Microsoft.Authorization/*`                                   | RBAC and privilege changes     |
| `Microsoft.Compute/*`                                         | VM administration              |
| `Microsoft.Network/*`                                         | Network/security changes       |
| `Microsoft.KeyVault/*`                                        | Key Vault configuration/access |
| `Microsoft.Storage/*`                                         | Storage configuration          |
| `Microsoft.Insights/*`                                        | Monitoring configuration       |
| `Microsoft.Security/*`                                        | Security configuration         |
| `Microsoft.PolicyInsights/*`                                  | Policy changes                 |
| `Microsoft.Resources/*`                                       | Resource deployment/deletion   |
| `Microsoft.ManagedIdentity/*`                                 | Managed identity changes       |
| `Microsoft.Web/*`                                             | App Service changes            |
| `Microsoft.ContainerService/*`                                | AKS administration             |
| `Microsoft.ContainerRegistry/*`                               | Container registry activity    |
| `Microsoft.Sql/*`                                             | Azure SQL administration       |
| `Microsoft.Authorization/roleAssignments/write`               | Privilege assignment           |
| `Microsoft.Authorization/roleAssignments/delete`              | Privilege removal              |
| `Microsoft.Resources/subscriptions/resourceGroups/delete`     | Resource-group deletion        |
| `Microsoft.Compute/virtualMachines/delete`                    | VM deletion                    |
| `Microsoft.Network/networkSecurityGroups/securityRules/write` | NSG rule creation/modification |

---

# 15. Azure Policy Attack / Defense-Evasion Scenarios

| Technique                       | Detection                       |
| ------------------------------- | ------------------------------- |
| Disable security policy         | Policy assignment modification  |
| Exclude resource from policy    | Policy exemption creation       |
| Modify policy assignment        | Activity Log                    |
| Modify policy definition        | Activity Log                    |
| Create permissive custom policy | Policy definition change        |
| Bypass deny policy              | Exemption or scope manipulation |

### High-Risk Correlation

```text
Policy exemption created
        +
Public IP created
        +
NSG rule allows Internet
```

Generate a high-severity detection when these occur close together.

---

# 16. Defender for Cloud – Attack Surface

| Area                          | Security Value                              |
| ----------------------------- | ------------------------------------------- |
| Secure Score                  | Identify security posture degradation       |
| Recommendations               | Detect misconfigurations                    |
| Regulatory Compliance         | Monitor control compliance                  |
| Attack Path Analysis          | Identify exploitable resource relationships |
| Defender for Servers          | VM threat detection                         |
| Defender for Storage          | Storage threat detection                    |
| Defender for Key Vault        | Key Vault threat detection                  |
| Defender for SQL              | Database threat detection                   |
| Defender for Containers       | Container/AKS protection                    |
| Defender for Resource Manager | Suspicious ARM activity                     |
| Cloud Security Explorer       | Investigate attack paths                    |

---

# 17. Microsoft Sentinel Detection Engineering

| Attack Scenario            | Primary Data Source           | Detection Logic                      |
| -------------------------- | ----------------------------- | ------------------------------------ |
| Password spray             | Entra Sign-in Logs            | Many users + same source             |
| Impossible travel          | Entra Sign-in Logs            | Geographically inconsistent logins   |
| Privilege escalation       | AzureActivity                 | New privileged RBAC assignment       |
| Key Vault abuse            | KeyVault logs                 | Unusual secret/key access            |
| Storage exfiltration       | Storage logs                  | Abnormally high read/download volume |
| VM compromise              | Defender for Endpoint         | Suspicious process/network activity  |
| Firewall bypass            | AzureActivity + Firewall logs | Rule change followed by traffic      |
| Public exposure            | AzureActivity                 | Public IP/DNAT/NSG change            |
| Security control tampering | AzureActivity                 | Defender/logging/policy modification |
| Managed identity abuse     | Entra + AzureActivity         | Identity accesses unusual resources  |

---

# 18. Useful Sentinel Correlation Patterns

### Privilege Escalation

```text
RBAC assignment
→ privileged role
→ unusual resource access
```

### Account Compromise

```text
Multiple failed sign-ins
→ successful sign-in
→ new device/location
→ privilege/resource access
```

### Storage Exfiltration

```text
Unusual authentication
→ Storage access
→ high-volume Blob reads
→ external network activity
```

### Key Vault Compromise

```text
Identity authentication anomaly
→ Key Vault access
→ secret/key retrieval
→ subsequent resource access
```

### Defense Evasion

```text
Security configuration change
→ logging/monitoring reduction
→ suspicious administrative activity
```

---

# 19. Azure Resource Graph – Security Hunting

Useful resource-discovery queries should be used to identify exposure rather than to assume compromise.

| Objective              | Resource Graph Focus                           |
| ---------------------- | ---------------------------------------------- |
| Public IP inventory    | `publicIPAddresses`                            |
| Internet-facing VMs    | `virtualMachines` + network interfaces         |
| NSG inventory          | `networkSecurityGroups`                        |
| Storage exposure       | `storageAccounts`                              |
| Key Vault exposure     | `vaults`                                       |
| Private endpoints      | `privateEndpoints`                             |
| Managed identities     | `virtualMachines`, `web/sites`, etc.           |
| Defender configuration | Security resources                             |
| Policy compliance      | Policy resources                               |
| Resource changes       | Resource Graph change analysis where available |

---

# 20. Azure App Service Attack Surface

| Technique                      | Attack Surface             | Detection                   |
| ------------------------------ | -------------------------- | --------------------------- |
| Application compromise         | Web application            | App Service logs / Defender |
| Deployment credential abuse    | Deployment mechanisms      | Entra/app logs              |
| Managed identity abuse         | App Service identity       | Entra + resource logs       |
| Configuration manipulation     | App settings               | Activity Log                |
| Authentication bypass          | Application authentication | App/Auth logs               |
| Public exposure                | App Service endpoint       | Defender/Policy             |
| Custom domain abuse            | DNS/custom domain          | Activity Log                |
| TLS downgrade                  | TLS configuration          | Configuration monitoring    |
| Diagnostic logging disablement | App Service diagnostics    | Activity Log                |

---

# 21. Azure Functions / Logic Apps Attack Surface

| Technique                           | Detection                                |
| ----------------------------------- | ---------------------------------------- |
| Function configuration modification | Activity Log                             |
| Managed identity abuse              | Entra + resource logs                    |
| Trigger manipulation                | Resource configuration changes           |
| Secret/configuration exposure       | Key Vault/Application configuration logs |
| Logic App workflow modification     | Activity Log                             |
| Unauthorized connector access       | Connector/API authentication logs        |
| Excessive permissions               | RBAC review                              |
| Workflow-based persistence          | Unexpected workflow changes              |
| Malicious automation                | New/modified automation workflows        |

---

# 22. AKS Attack Surface

| Attack Technique             | Detection                                   |
| ---------------------------- | ------------------------------------------- |
| Kubernetes API exposure      | API server/network logs                     |
| Compromised workload         | Defender for Containers                     |
| Excessive RBAC               | Kubernetes/Azure RBAC review                |
| Privileged container         | Admission/security telemetry                |
| Container image compromise   | Defender for Containers / registry scanning |
| Service-account abuse        | Kubernetes audit logs                       |
| Secret access                | Kubernetes audit + Key Vault                |
| Network lateral movement     | Network policies / flow telemetry           |
| Malicious deployment         | Kubernetes audit logs                       |
| Registry compromise          | ACR logs                                    |
| Public LoadBalancer exposure | Azure Resource Graph / Policy               |

### High-Risk AKS Correlation

```text
New deployment
+
Privileged container
+
Unexpected external network connection
```

---

# 23. Azure Container Registry

| Attack Technique                  | Detection                    |
| --------------------------------- | ---------------------------- |
| Unauthorized image pull           | Registry logs                |
| Image push by unexpected identity | Registry logs                |
| Malicious image upload            | Defender for Containers      |
| Credential abuse                  | Entra/service principal logs |
| Registry permission escalation    | RBAC logs                    |
| Public registry exposure          | Defender/Policy              |
| Image deletion                    | Registry logs                |
| Repository enumeration            | Registry telemetry           |

---

# 24. Azure SQL / Database Attack Surface

| Attack Technique           | Detection                        |
| -------------------------- | -------------------------------- |
| Brute-force authentication | SQL authentication logs          |
| Credential compromise      | Sign-in/database logs            |
| Excessive query activity   | SQL auditing                     |
| Data discovery             | Query auditing                   |
| Bulk data extraction       | SQL auditing + network telemetry |
| Firewall modification      | Azure Activity Log               |
| Public access enablement   | Configuration change             |
| Privilege escalation       | Database role changes            |
| Credential rotation abuse  | Key Vault + SQL logs             |

---

# 25. Azure Automation Attack Surface

| Technique                      | Detection                           |
| ------------------------------ | ----------------------------------- |
| Runbook modification           | Activity Log                        |
| Malicious scheduled runbook    | Automation job logs                 |
| Credential abuse               | Key Vault/Automation logs           |
| Managed identity abuse         | Entra + Activity Log                |
| Schedule manipulation          | Automation logs                     |
| Hybrid Worker abuse            | Defender for Endpoint               |
| Persistence through automation | Unexpected runbook/schedule changes |

---

# 26. Azure DevOps / CI-CD Attack Surface

| Attack Technique                        | Detection               |
| --------------------------------------- | ----------------------- |
| Pipeline modification                   | Audit logs              |
| Repository compromise                   | Git audit/activity      |
| Service connection abuse                | DevOps audit logs       |
| Secret theft                            | Secret-access telemetry |
| Build agent compromise                  | Defender for Endpoint   |
| Malicious pipeline                      | Pipeline execution logs |
| Artifact poisoning                      | Registry/artifact logs  |
| Excessive service-principal permissions | Entra/RBAC review       |
| Deployment credential abuse             | Entra sign-in logs      |

---

# 27. SaaS / Application Identity Abuse

| Technique                           | Detection                      |
| ----------------------------------- | ------------------------------ |
| OAuth application consent           | Entra Audit Logs               |
| Service principal creation          | Entra Audit Logs               |
| Credential addition                 | Entra Audit Logs               |
| Certificate addition                | Entra Audit Logs               |
| Application permission escalation   | Entra Audit Logs               |
| Enterprise application modification | Entra Audit Logs               |
| Unusual application sign-in         | Service principal sign-in logs |

High-priority events include:

```text
Application created
Service principal created
Credential added
Application permission changed
OAuth consent granted
Privileged application role assigned
```

---

# 28. Azure Logging and Security-Control Tampering

| Attack Technique                    | Detection               |
| ----------------------------------- | ----------------------- |
| Diagnostic setting deleted          | Azure Activity Log      |
| Diagnostic setting modified         | Azure Activity Log      |
| Log Analytics configuration changed | Azure Activity Log      |
| Sentinel rule disabled              | Sentinel audit/activity |
| Analytics rule deleted              | Sentinel audit/activity |
| Automation rule modified            | Sentinel audit/activity |
| Data connector disabled             | Sentinel configuration  |
| Defender configuration changed      | Azure Activity Log      |
| Defender plan disabled              | Azure Activity Log      |
| Policy assignment removed           | Azure Activity Log      |

**Critical detection:** An administrative identity modifies security telemetry immediately before or after suspicious resource activity.

---

# 29. Network Traffic Analysis

For authorized defensive investigations:

| Tool                  | Purpose                      |
| --------------------- | ---------------------------- |
| `tcpdump`             | Packet capture               |
| Wireshark             | Packet analysis              |
| `tshark`              | CLI packet analysis          |
| `nslookup`            | DNS troubleshooting          |
| `dig`                 | DNS analysis                 |
| `curl`                | HTTP/API testing             |
| `openssl s_client`    | TLS validation               |
| `nmap`                | Authorized service discovery |
| Azure Network Watcher | Azure network diagnostics    |
| Azure Firewall logs   | Network security monitoring  |
| NSG Flow Logs         | Network flow analysis        |

### Example Safe Diagnostics

```bash
ip addr
ip route
ip neigh
dig example.com
curl -I https://example.com
openssl s_client -connect example.com:443
tcpdump -i any -n
```

---

# 30. TLS Security Validation

| Objective                  | Tool                             |
| -------------------------- | -------------------------------- |
| Inspect certificate        | `openssl s_client`               |
| Validate certificate chain | OpenSSL                          |
| Inspect TLS version        | OpenSSL                          |
| Inspect cipher negotiation | OpenSSL                          |
| Application TLS testing    | SSLyze                           |
| External TLS posture       | Approved TLS assessment services |

Example:

```bash
openssl s_client -connect example.com:443 -servername example.com
```

---

# 31. HTTP/API Security Validation

| Objective        | Example                                       |
| ---------------- | --------------------------------------------- |
| HTTP headers     | `curl -I https://example.com`                 |
| Follow redirects | `curl -IL https://example.com`                |
| API request      | `curl -H "Authorization: Bearer <token>" ...` |
| POST testing     | `curl -X POST ...`                            |
| Proxy testing    | `curl --proxy http://127.0.0.1:8080 ...`      |
| TLS testing      | `curl -v https://example.com`                 |

For Azure APIs, ensure the identity and authorization scope are explicitly authorized before testing.

---

# 32. Azure Bastion

| Attack Scenario              | Detection                  |
| ---------------------------- | -------------------------- |
| Unauthorized Bastion use     | Azure Activity/Entra logs  |
| Privileged user access       | Entra + Bastion telemetry  |
| Access outside normal hours  | Behavioral analytics       |
| Repeated connection attempts | Bastion/Defender telemetry |
| Credential compromise        | Entra Identity Protection  |
| Bastion configuration change | Activity Log               |

Bastion should generally be preferred over exposing RDP/SSH directly to the Internet.

---

# 33. Azure Private Endpoint / Private Link

| Attack Scenario               | Detection                 |
| ----------------------------- | ------------------------- |
| Private endpoint creation     | Activity Log              |
| Private endpoint deletion     | Activity Log              |
| Unexpected network connection | Network telemetry         |
| DNS manipulation              | DNS logs                  |
| Private DNS zone modification | Activity Log              |
| Unauthorized approval         | Private Link Activity Log |
| Cross-network access          | Firewall/NSG telemetry    |

---

# 34. Cloud Credential Exposure

| Credential Type        | Typical Risk                    | Detection / Control       |
| ---------------------- | ------------------------------- | ------------------------- |
| User password          | Account takeover                | Entra Protection/MFA      |
| Client secret          | Service-principal compromise    | Entra audit/sign-in logs  |
| Certificate            | Application identity compromise | Entra audit logs          |
| Storage key            | Storage compromise              | Storage logs              |
| SAS token              | Scoped data access              | Storage logs              |
| Key Vault secret       | Downstream compromise           | Key Vault logs            |
| Managed identity token | Workload compromise             | Entra/resource telemetry  |
| SSH private key        | VM compromise                   | Key management + Defender |
| API key                | Application compromise          | Secret scanning           |

---

# 35. Credential & Secret Exposure Detection

Monitor repositories, pipelines, endpoints and cloud resources for:

```text
Azure client secrets
Storage account keys
SAS tokens
Connection strings
Private keys
SSH keys
API keys
Database credentials
Access tokens
Certificates
```

Recommended controls:

```text
Microsoft Defender for Cloud
Microsoft Defender for DevOps
Microsoft Defender for Endpoint
Microsoft Purview
Microsoft Entra ID
Azure Key Vault
Git secret scanning
CI/CD secret scanning
```

---

# 36. High-Value Azure Attack Chains

| Attack Chain                                                   | Detection Priority |
| -------------------------------------------------------------- | ------------------ |
| Compromised Entra account → RBAC escalation → resource access  | Critical           |
| Service principal compromise → privileged role → data access   | Critical           |
| VM compromise → managed identity → Key Vault access            | Critical           |
| Credential compromise → Storage access → bulk download         | Critical           |
| Entra compromise → security-policy modification → persistence  | Critical           |
| RBAC change → public exposure → external access                | Critical           |
| VM Run Command → suspicious process → outbound connection      | High               |
| Firewall modification → new inbound access → VM activity       | Critical           |
| Key Vault secret access → application/service authentication   | High               |
| Storage permission change → large data access                  | High               |
| AKS deployment → privileged container → external communication | Critical           |

---

# 37. Recommended Sentinel Analytics Rules

| Rule                                     | Severity | Data Sources          |
| ---------------------------------------- | -------: | --------------------- |
| New Owner role assignment                |     High | AzureActivity         |
| New User Access Administrator assignment | Critical | AzureActivity         |
| New privileged Entra role assignment     |     High | Entra Audit           |
| Service principal credential added       |     High | Entra Audit           |
| OAuth consent to suspicious application  |     High | Entra Audit           |
| Conditional Access policy modified       |     High | Entra Audit           |
| MFA/authentication method changed        |     High | Entra Audit           |
| Key Vault secret access anomaly          |     High | KeyVault              |
| Storage bulk download anomaly            |     High | Storage               |
| Firewall rule changed                    |     High | AzureActivity         |
| NSG Internet allow rule created          |     High | AzureActivity         |
| Public IP assigned to VM                 |     High | AzureActivity         |
| Diagnostic settings disabled             | Critical | AzureActivity         |
| Defender plan disabled                   | Critical | AzureActivity         |
| Sentinel analytics rule disabled         | Critical | Sentinel              |
| VM Run Command by unusual identity       |     High | AzureActivity         |
| Managed identity unusual access          |     High | Entra + AzureActivity |
| Resource-group deletion                  | Critical | AzureActivity         |
| Subscription-level policy change         | Critical | AzureActivity         |

---

# 38. MITRE ATT&CK – Azure-Oriented Mapping

| ATT&CK Tactic        | Azure Example                                         |
| -------------------- | ----------------------------------------------------- |
| Reconnaissance       | Tenant/resource discovery                             |
| Resource Development | Malicious cloud application/service principal         |
| Initial Access       | Valid Accounts, phishing, compromised credentials     |
| Execution            | VM Run Command, Automation, Functions                 |
| Persistence          | Application credentials, role assignments, automation |
| Privilege Escalation | RBAC abuse, Entra privileged roles                    |
| Defense Evasion      | Logging/policy/security-control modification          |
| Credential Access    | Secrets, tokens, keys, credentials                    |
| Discovery            | Subscription/resource/RBAC enumeration                |
| Lateral Movement     | Managed identities, RBAC, VM access                   |
| Collection           | Storage/database/Key Vault access                     |
| Command & Control    | Suspicious outbound connections                       |
| Exfiltration         | Storage/database data transfer                        |
| Impact               | Resource deletion, service disruption                 |

---

# 39. Azure Security Monitoring Baseline

At minimum, collect and correlate:

| Telemetry                          |    Priority |
| ---------------------------------- | ----------: |
| Microsoft Entra Sign-in Logs       |    Critical |
| Microsoft Entra Audit Logs         |    Critical |
| Azure Activity Logs                |    Critical |
| Defender for Endpoint              |    Critical |
| Defender for Cloud                 |    Critical |
| Key Vault diagnostic logs          |    Critical |
| Storage diagnostic/data-plane logs |        High |
| Azure Firewall logs                |        High |
| NSG Flow Logs                      |        High |
| Azure SQL auditing                 |        High |
| AKS audit logs                     |        High |
| App Service logs                   |        High |
| Azure Automation logs              |        High |
| Sentinel audit/configuration logs  |        High |
| Microsoft Purview audit            |        High |
| Application/API logs               | Medium–High |

---

# 40. Detection Engineering Prioritization

Use the following priority model:

| Priority      | Condition                                                                                                         |
| ------------- | ----------------------------------------------------------------------------------------------------------------- |
| P1 – Critical | Privilege escalation, security-control tampering, destructive activity, credential compromise + privileged access |
| P2 – High     | Suspicious authentication, Key Vault access, Storage exfiltration, firewall/NSG changes                           |
| P3 – Medium   | Resource discovery, unusual administrative operations, configuration changes                                      |
| P4 – Low      | Expected enumeration or administrative activity without additional risk indicators                                |

Detection confidence should increase when multiple signals correlate:

```text
Identity
+
Source IP
+
Device
+
Authentication method
+
Resource
+
Operation
+
Privilege
+
Network activity
+
Historical baseline
```

---

# 41. Azure Attack Detection Investigation Workflow

```text
1. Identify affected identity
        ↓
2. Validate authentication activity
        ↓
3. Review Entra risk/sign-in telemetry
        ↓
4. Review Azure Activity Log
        ↓
5. Identify RBAC changes
        ↓
6. Identify affected resources
        ↓
7. Review Key Vault/Storage/SQL activity
        ↓
8. Review VM/Endpoint telemetry
        ↓
9. Review network connections
        ↓
10. Determine attack path
        ↓
11. Contain identity/resource
        ↓
12. Remove persistence
        ↓
13. Validate security controls
        ↓
14. Document incident and improve detection
```

---

# 42. Essential Azure Security Tools

| Tool                            | Primary Purpose                     |
| ------------------------------- | ----------------------------------- |
| Microsoft Sentinel              | SIEM/SOAR                           |
| Microsoft Defender for Cloud    | CNAPP/CSPM/CWPP                     |
| Microsoft Defender XDR          | Cross-domain detection and response |
| Microsoft Defender for Endpoint | Endpoint/VM detection               |
| Microsoft Defender for Identity | Identity threat detection           |
| Microsoft Entra ID Protection   | Identity risk detection             |
| Microsoft Entra ID              | Identity and access management      |
| Azure Activity Log              | Control-plane auditing              |
| Azure Monitor                   | Monitoring and telemetry            |
| Log Analytics                   | Centralized log analytics           |
| Azure Resource Graph            | Cloud asset discovery               |
| Azure Policy                    | Preventive governance               |
| Azure Firewall                  | Network security                    |
| Network Watcher                 | Network diagnostics                 |
| Microsoft Purview               | Data governance/audit               |
| Azure Key Vault                 | Secrets/keys/certificates           |
| Azure Bastion                   | Secure VM administration            |
| Defender for DevOps             | CI/CD security                      |
| Defender for Containers         | Container/AKS security              |

---

# 43. Core Defensive Controls

| Control               | Recommended Configuration                            |
| --------------------- | ---------------------------------------------------- |
| MFA                   | Enforce for privileged and user identities           |
| Conditional Access    | Risk/device/location-aware controls                  |
| PIM                   | Just-in-time privileged access                       |
| RBAC                  | Least privilege                                      |
| Managed Identity      | Prefer over stored credentials                       |
| Key Vault             | Centralize secrets and keys                          |
| Private Endpoints     | Use for sensitive PaaS services                      |
| Azure Firewall        | Centralize controlled network egress/ingress         |
| NSG                   | Segment workloads                                    |
| Azure Policy          | Prevent insecure configurations                      |
| Defender for Cloud    | Enable relevant workload protections                 |
| Defender for Endpoint | Protect supported VMs                                |
| Sentinel              | Centralize detection and response                    |
| Diagnostic Logs       | Enable critical resource logging                     |
| Storage security      | Disable unnecessary public/Shared Key access         |
| VM security           | Avoid public RDP/SSH                                 |
| Bastion               | Use for administrative VM access                     |
| Backup                | Enable protected, tested backups                     |
| Resource Locks        | Protect critical resources where appropriate         |
| Logging protection    | Restrict ability to modify/delete security telemetry |

---

# 44. Quick Azure Attack Detection Checklist

| Check                                      | Status |
| ------------------------------------------ | ------ |
| Entra MFA enabled                          | ☐      |
| Conditional Access configured              | ☐      |
| PIM enabled                                | ☐      |
| Privileged roles monitored                 | ☐      |
| Service principals monitored               | ☐      |
| Managed identities reviewed                | ☐      |
| Azure Activity Logs ingested into Sentinel | ☐      |
| Entra Sign-in Logs ingested                | ☐      |
| Entra Audit Logs ingested                  | ☐      |
| Defender for Endpoint enabled              | ☐      |
| Defender for Cloud enabled                 | ☐      |
| Key Vault logs enabled                     | ☐      |
| Storage logs enabled                       | ☐      |
| Firewall logs enabled                      | ☐      |
| NSG/network telemetry enabled              | ☐      |
| Public IP exposure monitored               | ☐      |
| NSG Internet-facing rules monitored        | ☐      |
| RBAC changes monitored                     | ☐      |
| Security-control changes monitored         | ☐      |
| Diagnostic-setting changes monitored       | ☐      |
| VM Run Command monitored                   | ☐      |
| Resource deletion monitored                | ☐      |
| Storage exfiltration monitored             | ☐      |
| Key Vault access anomalies monitored       | ☐      |
| Automated response playbooks implemented   | ☐      |

---

## 45. Recommended Threat Detection Engineering Correlation Model

For Azure cloud attacks, individual events should generally **not** be treated as proof of compromise. Build detections around correlated sequences:

```text
                   ┌──────────────────┐
                   │   Identity       │
                   │ User/SP/MI       │
                   └────────┬─────────┘
                            │
                            ▼
                  ┌───────────────────┐
                  │ Authentication    │
                  │ Sign-in / Token   │
                  └────────┬──────────┘
                           │
                           ▼
                 ┌────────────────────┐
                 │ Privilege Change   │
                 │ RBAC / Entra      │
                 └────────┬───────────┘
                          │
                          ▼
                ┌─────────────────────┐
                │ Resource Access     │
                │ VM/Storage/KV/SQL   │
                └────────┬────────────┘
                         │
                         ▼
                ┌─────────────────────┐
                │ Network Activity    │
                │ Firewall/NSG/Defender│
                └────────┬────────────┘
                         │
                         ▼
                ┌─────────────────────┐
                │ Data / Impact       │
                │ Exfil/Delete/Modify │
                └─────────────────────┘
```

### Detection Engineering Principle

The strongest Azure detections combine:

**Identity + Authentication + Privilege + Resource Activity + Network Activity + Endpoint Activity + Behavioural Baseline** rather than relying on a single Azure Activity Log event.
