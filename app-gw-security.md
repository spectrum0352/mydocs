Here's a structured guide for **Azure Application Gateway configuration** (deployment and setup-focused, complementing the security controls list):

## 1. Pre-Deployment Planning
- Choose SKU tier: **Standard_v2** or **WAF_v2** (v2 recommended for autoscaling, zone redundancy)
- Decide **Public**, **Private**, or **Public + Private** frontend IP configuration
- Plan **dedicated subnet** sizing (minimum /24 recommended for v2 to allow scaling)
- Identify **backend targets**: VMs, VMSS, App Services, IP addresses, or NVAs

## 2. Core Components Setup
| Component | Configuration Notes |
|---|---|
| **Frontend IP** | Public IP (Standard SKU) or Private IP from gateway subnet |
| **Listeners** | Basic (single site) or Multi-site (host header based routing) |
| **Backend Pools** | Group targets by app; use FQDNs or IPs |
| **HTTP Settings** | Define port, protocol, cookie-based affinity, request timeout, custom probes |
| **Rules** | Basic or Path-based routing rules linking listener → backend pool → HTTP settings |
| **Health Probes** | Custom probes with proper path, interval, timeout, unhealthy threshold |

## 3. Listener Configuration
- Use **Multi-site listeners** for hosting multiple domains on one gateway
- Configure **SNI (Server Name Indication)** for multiple SSL certificates on same port
- Set up **HTTP to HTTPS redirection** at listener level
- Define **priority order** for routing rules when using multiple listeners

## 4. Routing Configuration
- **Path-based routing**: route `/api/*`, `/images/*` etc. to different backend pools
- **Basic routing**: single backend pool per listener
- Configure **URL rewrite sets** for path/header modifications
- Set up **redirection rules** (permanent/temporary) between listeners

## 5. SSL/TLS Configuration
- Upload/link certificates via **Key Vault reference** (recommended) or PFX upload
- Configure **SSL profiles** per listener if different policies needed per site
- Set **backend SSL settings** if using end-to-end encryption (backend certificate trust)

## 6. Autoscaling & Performance
- Set **minimum and maximum instance count** for autoscaling (v2 SKU)
- Enable **zone redundancy** across availability zones for HA
- Configure **connection draining timeout** for backend updates
- Set **idle timeout** values appropriately for long-lived connections

## 7. WAF Policy Configuration (if WAF_v2)
- Create **WAF policy** as a separate resource, associate with gateway or per-listener
- Set **rule set version** (OWASP 3.2/DRS 2.1 recommended)
- Configure **managed rule exclusions** for known false positives
- Define **custom rules** with match conditions (IP, geo, rate limiting)

## 8. Diagnostics Setup
- Enable diagnostic settings → send to **Log Analytics**, **Storage Account**, or **Event Hub**
- Configure log categories: `ApplicationGatewayAccessLog`, `ApplicationGatewayPerformanceLog`, `ApplicationGatewayFirewallLog`
- Set up **Azure Monitor Workbooks** for visualization

## 9. Deployment Methods
- **Azure Portal** – manual/GUI setup
- **ARM Template / Bicep** – recommended for repeatable, version-controlled deployments
- **Terraform** – for multi-cloud IaC consistency
- **Azure CLI/PowerShell** – scripted deployment

## 10. Post-Deployment Validation
- Test routing with **multiple host headers**
- Validate **health probe status** for all backend pool members
- Run **SSL Labs test** or `openssl s_client` to verify TLS configuration
- Simulate WAF triggers to confirm blocking behavior
- Load test to validate **autoscaling triggers**

---

Would you like me to generate a **sample Bicep/ARM template** for a WAF_v2 Application Gateway with path-based routing and SSL, or a **step-by-step Azure Portal walkthrough** instead?


Define policies and best practices for Application Gateway (WAF)

App gateway is the web traffic load balancer that enables us to manage traffic to web applications. 
It can make routing decisions based on attributes of HTTP requests for example URI path or host headers. 
App gateway has 2 sku’s: WAFv1 and WAFv2
Optimizes app server farm delivery while increasing application security.

Features

Pre-requisites

WAF Policies

Best practices

Configuration


Here's a comprehensive list of security controls for Azure Application Gateway, organized by category:

## 1. Web Application Firewall (WAF)
- Enable **WAF_v2 SKU** with OWASP Core Rule Set (CRS 3.1/3.2/3.3) or Microsoft Default Rule Set (DRS)
- Set WAF mode to **Prevention** (not just Detection) in production
- Configure **custom WAF rules** for app-specific threats (SQLi, XSS, RCE, etc.)
- Enable **bot protection rule set** to block malicious bots
- Tune **exclusion lists** to reduce false positives without disabling core protection
- Set appropriate **file upload limits** and **request body size limits**
- Enable **geo-filtering** via custom rules if regional restriction is needed

## 2. TLS/SSL Security
- Enforce **TLS 1.2 minimum** (disable TLS 1.0/1.1) via SSL policy
- Use a **custom SSL policy** with strong cipher suites only
- Enable **end-to-end SSL/TLS encryption** (frontend to backend, not just frontend termination)
- Store certificates in **Azure Key Vault** rather than uploading directly
- Enable **certificate auto-rotation** via Key Vault integration
- Configure **HSTS (HTTP Strict Transport Security)** headers via rewrite rules
- Disable weak/legacy cipher suites explicitly

## 3. Network Security
- Deploy Application Gateway in a **dedicated subnet** (no other resources)
- Apply **Network Security Groups (NSGs)** on the subnet with required rules only (allow GatewayManager, AzureLoadBalancer tags; restrict everything else)
- Use **Private Link/Private Frontend IP** for internal-only applications
- Restrict backend pool access so backends only accept traffic from the App Gateway's subnet/IP
- Integrate with **Azure Firewall** or **DDoS Protection Standard** for additional layers
- Use **Application Security Groups (ASGs)** to simplify backend access rules

## 4. Identity & Access Management
- Use **Azure RBAC** to restrict who can modify Application Gateway configuration
- Enable **Managed Identity** for Key Vault certificate access (avoid stored credentials)
- Apply **least privilege** roles (e.g., Network Contributor only where needed)
- Enable **Azure AD Conditional Access** for administrative access to the Azure portal/API

## 5. Monitoring & Logging
- Enable **diagnostic logs**: Access log, Performance log, Firewall log
- Send logs to **Log Analytics workspace** for centralized monitoring
- Integrate with **Microsoft Sentinel** for SIEM/threat detection
- Set up **Azure Monitor alerts** for WAF blocks, unhealthy backend hosts, high response times
- Enable **Application Gateway metrics** monitoring (throughput, failed requests, response status)
- Regularly review **WAF logs** for attack patterns and tune rules accordingly

## 6. Configuration Hardening
- Disable **response buffering** exposure of sensitive headers (remove server/version headers via rewrite rules)
- Implement **custom error pages** to avoid leaking stack traces or backend info
- Configure **health probes** with proper matching conditions (avoid exposing internal error details)
- Use **rewrite rules** to strip sensitive response headers (X-Powered-By, Server)
- Set **connection draining** for graceful backend removal
- Restrict **listener configurations** to only required ports/protocols

## 7. Backend Protection
- Restrict backend NSGs to accept traffic **only from Application Gateway's subnet**
- Use **mutual TLS (mTLS)** between App Gateway and backend where supported
- Validate backend health via **custom health probes** rather than defaults
- Isolate backend pools per application to limit blast radius

## 8. Governance & Compliance
- Apply **Azure Policy** to enforce WAF SKU usage and minimum TLS version across subscriptions
- Enable **Microsoft Defender for Cloud** recommendations for Application Gateway
- Conduct periodic **penetration testing** with Azure's pentest rules of engagement
- Maintain **infrastructure as code** (ARM/Bicep/Terraform) for auditable, repeatable configuration

---

Want me to turn this into a structured checklist document (e.g., Word or Excel) for audit/compliance tracking, or tailor it to a specific compliance framework like CIS, NIST, or ISO 27001?

Based on Microsoft's built-in Azure Policy definitions, here's a list of **Azure Policy "Deny" effect controls** applicable to Application Gateway:

## Built-in Policies Supporting Deny Effect

| Policy Name | Policy ID | What It Denies |
|---|---|---|
| **Web Application Firewall (WAF) should be enabled for Application Gateway** | `564feb30-bf6a-4854-b4bb-0d2d2d1e6c66` | Application Gateways are evaluated on if there's a WAF present on resource creation; Deny prevents any Application Gateway from being created if a WAF isn't attached |
| **Web Application Firewall (WAF) should use the specified mode for Application Gateway** | (built-in, search "WAF mode Application Gateway") | Mandates the use of 'Detection' or 'Prevention' mode to be active on all Web Application Firewall policies for Application Gateway; Deny prevents any WAF from being created if it isn't in the correct mode |

## Deny-Capable Policies Relevant to App Gateway (via networking/general controls)
These aren't App-Gateway-specific but commonly assigned with Deny at subscription/management-group level and directly affect how App Gateway can be deployed:

- **Deny public IP creation** (or restrict to approved SKUs) — blocks App Gateway from getting a public frontend IP outside policy
- **Deny resources without required tags** — blocks App Gateway deployment lacking governance tags
- **Allowed locations** — denies App Gateway deployment outside approved Azure regions
- **Allowed resource types** — can deny `Microsoft.Network/applicationGateways` entirely in restricted scopes
- **Deny subnets without NSG** — indirectly blocks App Gateway subnet creation without an NSG attached
- **Network interfaces should not have public IPs** (if misapplied to backend NICs)
- **TLS version enforcement policies** (custom — no native built-in Deny for App Gateway min TLS version; must be custom-authored)

## Custom Policy Needed (No Native Built-in)
Some important controls **require you to author a custom policy** since Microsoft doesn't provide a built-in:

- **Enforce minimum TLS 1.2 SSL policy** on listeners
- **Enforce OWASP managed rule sets remain enabled** (not disabled/excluded) — Azure Policy considers these "managed rules" and requires a specific alias for that property in the policy definition, since Microsoft provides hundreds of built-in Azure Policy definitions, but this specific one is not built-in and must be coded yourself
- **Deny App Gateway without Key Vault-linked certificates** (vs. direct PFX upload)
- **Deny listeners without HTTPS/SSL binding**

## Related Deny Policies (Audit/Deny/Disabled effect options)
- **Application Gateway should have Resource logs enabled** — note: this one only supports `AuditIfNotExists`/`Disabled`, **not Deny** — mandates the enabling of Resource logs and Metrics on all Application Gateways, including WAF

## Important Note on Effect Behavior
The net result of layering policy definitions is considered to be cumulative and most restrictive — if two policies both have a Deny effect, a resource would be blocked by the overlapping definitions, so when combining these, review scope carefully to avoid unintended blocks.

---

Since some of these built-in policy GUIDs and behaviors can shift between Azure Policy releases, I'd recommend verifying the exact current definitions in the **Azure Policy portal → Definitions → filter by "Application Gateway"** or via AzAdvertizer before finalizing.

Want me to draft the **JSON for the custom Deny policies** (TLS version enforcement + OWASP rule set enforcement) that aren't natively built-in?