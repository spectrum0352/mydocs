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
