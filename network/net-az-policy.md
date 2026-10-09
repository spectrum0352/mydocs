# Azure Policies for Network security

Good question — this distinction matters because **not all Microsoft Defender for Cloud (MDC) recommendations map to Azure Policy definitions that support a "Deny" effect**. Many of these are built as **Audit** or **AuditIfNotExists** only (by design, since they check for the *presence* of a related resource/config, like DDoS Protection or JIT access, which "Deny" can't logically evaluate at deployment time). Others do support **Deny** natively because they check a boolean/property on the resource itself (e.g., a `publicNetworkAccess` flag).

Here's the breakdown of your list (excluding the private link ones as requested):

## ✅ Supports native "Deny" effect (can be set directly in the built-in policy)

| Policy | Notes |
|---|---|
| **Azure Key Vault should disable public network access** | Effect parameter allows Audit / **Deny** / Disabled |
| **Cognitive Services accounts should disable public network access** | Audit / **Deny** / Disabled |
| **Cognitive Services accounts should restrict network access** | Audit / **Deny** / Disabled |
| **Container registries should not allow unrestricted network access** | Audit / **Deny** / Disabled |
| **Public network access on Azure SQL Database should be disabled** | Audit / **Deny** / Disabled |
| **Public network access should be disabled for MariaDB servers** | Audit / **Deny** / Disabled |
| **Public network access should be disabled for MySQL servers** | Audit / **Deny** / Disabled |
| **Public network access should be disabled for PostgreSQL servers** | Audit / **Deny** / Disabled |
| **Storage account public access should be disallowed** | Audit / **Deny** / Disabled |
| **Storage accounts should restrict network access** | Audit / **Deny** / Disabled |
| **Latest TLS version should be used in your API App / Function App / Web App** | Audit / **Deny** / Disabled |

For these, you just change the assignment's **effect parameter from "Audit" to "Deny"** — no custom JSON needed.

## ⚠️ Audit / AuditIfNotExists only — no native Deny option

| Policy | Why Deny isn't available |
|---|---|
| **All Internet traffic should be routed via Azure Firewall** | Checks route tables/UDRs — evaluative, not a resource property |
| **All network ports should be restricted on NSGs associated to VMs** | Requires post-deployment NSG rule inspection |
| **API Management services should use a VNET** | AuditIfNotExists only |
| **Authorized IP ranges should be defined on Kubernetes Services** | AuditIfNotExists only |
| **Azure Cache for Redis should reside within a VNET** | AuditIfNotExists only |
| **Azure Cosmos DB accounts should have firewall rules** | AuditIfNotExists only |
| **Azure DDoS Protection Standard should be enabled** | AuditIfNotExists (checks VNet-level protection plan) |
| **Azure Defender for DNS should be enabled** | AuditIfNotExists (subscription-level plan enablement, not a resource property) |
| **Azure Spring Cloud should use network injection** | Audit only |
| **Internet-facing VMSS should be protected with NSGs** | Audit only |
| **IP Forwarding on your VMs should be disabled** | Audit only |
| **Management ports of VMSS should be protected with JIT** | Audit only (JIT is a control, not a static property) |
| **Management ports should be closed on your VMSS** | Audit only |
| **Non-internet-facing VMSS should be protected with NSGs** | Audit only |
| **Storage accounts should restrict network access using VNET rules** | Audit only (the definition file is literally named `..._Audit.json`) |
| **Subnets should be associated with a Network Security Group** | AuditIfNotExists only |
| **Web Application Firewall (WAF) should be enabled for Application Gateway** | AuditIfNotExists only |
| **Web Application Firewall (WAF) should be enabled for Azure Front Door Service** | AuditIfNotExists only |

## How to still enforce these (workarounds)

Since native Deny isn't available for the second group, you have three options:

1. **Custom Deny policy** — Write your own policy definition targeting the same resource property/condition (e.g., deny NSG rules with source `*` and destination port 3389/22, deny VM creation without `enableIPForwarding: false`). This is the most common approach for VM/VMSS/NSG-level checks.
2. **DeployIfNotExists (DINE)** — For things like DDoS Protection, JIT, WAF — auto-remediate by deploying the missing configuration rather than blocking creation.
3. **Azure Firewall / Front Door route enforcement** — For "All Internet traffic via Azure Firewall," enforce via **Azure Virtual WAN / Hub-Spoke UDR governance** rather than Azure Policy, since this is fundamentally a routing architecture, not a resource property.

## Important caveat
Azure periodically updates built-in policy definitions (Microsoft has been actively adding Deny support to more of these, especially the "public network access" family, over the last 12–18 months). Before finalizing your initiative, I'd recommend confirming current allowed effects directly in the **Azure Policy > Definitions** blade (check the `effect` parameter's `allowedValues` for each), since a few of these may have changed since my last verification.

Want me to draft the **custom Deny policy JSON** for any of the Audit-only ones — e.g., denying open RDP/SSH on NSGs, denying IP Forwarding, or denying VMSS without NSG — so you have a complete Deny-based initiative?
