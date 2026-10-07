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