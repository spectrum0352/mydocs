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
