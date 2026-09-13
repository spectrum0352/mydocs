# Remote Access with Azure Bastion Host

Azure Bastion is a fully managed Platform-as-a-Service (PaaS) that provides secure and seamless RDP (Remote Desktop Protocol) and SSH (Secure Shell) connectivity to virtual machines (VMs) directly through the Azure portal. Unlike traditional remote access methods, Bastion eliminates the need for public IP addresses on VMs, reducing exposure to threats and simplifying secure administration.

Security Ranking of Remote Access Methods

From most secure and feature-rich to least secure and flexible:

Azure Bastion Host (Best Practice)
No public IPs required
TLS-encrypted connections via Azure portal
Managed service with automatic patching
Integrated with Azure RBAC and NSGs
Supports auditing and monitoring through Azure Monitor/Defender
Just-in-Time (JIT) VM Access with NSGs
Temporarily opens RDP/SSH ports only when needed
Reduces exposure but still requires public IPs
More operational overhead compared to Bastion
VPN Gateway + Private IP Access
Secure tunnel into VNet
Requires client configuration and VPN infrastructure
Strong security but less seamless than Bastion
Direct Public IP + NSG Rules (Least Secure)
VM exposed to internet with restricted ports
High attack surface, vulnerable to brute force and scanning
Not recommended for production workloads
Key Features of Azure Bastion

🔒 Secure Connectivity: SSL-encrypted RDP/SSH sessions without exposing VMs to the internet.
🌐 Portal Integration: Connect directly from the Azure portal, no client software required.
⚙️ Simplified Management: Azure handles patching, scaling, and availability.
🚫 No Public IPs: Eliminates attack vectors tied to exposed endpoints.
📊 Monitoring & Logging: Integrates with Azure Monitor, Defender for Cloud, and Activity Logs.
🔄 High Availability Options: Zone-redundant deployment supported.
🔑 RBAC Integration: Enforce least privilege access via Azure AD roles.
Prerequisites

Active Azure subscription
Existing Virtual Network (VNet)
Dedicated AzureBastionSubnet (minimum /27 CIDR)
Properly configured Network Security Group (NSG)
Role-based access control (RBAC) permissions for administrators
Design Considerations

Subnet Sizing: Plan for concurrent sessions; minimum /27 recommended.
Network Security: Restrict NSG rules to Bastion management traffic only.
Availability: Deploy zone-redundant Bastion for resilience.
Performance: Ensure low latency between Bastion and target VMs.
Integration: Combine with JIT access and Conditional Access for layered defense.
Deployment Steps

Navigate to your VNet in the Azure portal.
Select Bastion under Settings.
Create a new Bastion resource.
Assign the AzureBastionSubnet.
Configure size, redundancy, and monitoring options.
Deploy and validate connectivity.
Limits

Regional Availability: Check Azure region support.
Concurrent Connections: Depends on SKU size.
VM Support: Works with Windows and Linux VMs.
Scaling: Auto-scaling supported for enterprise workloads.
Security Best Practices

Apply least privilege via RBAC and Conditional Access.
Enable logging and monitoring with Azure Monitor and Defender for Cloud.
Regularly review Bastion usage and audit logs.
Use network segmentation to isolate Bastion from sensitive workloads.
Combine with JIT access for layered security.
Summary

Azure Bastion is the most secure and flexible remote access solution for Azure VMs. It eliminates public IP exposure, simplifies management, and integrates with Azure’s security ecosystem. Compared to VPNs or direct public IP access, Bastion offers superior protection, operational efficiency, and scalability. For enterprise environments, Bastion combined with JIT and Conditional Access represents the gold standard for secure remote administration.

 

 

 

Comparison of Remote Access Methods for Azure VMs

 

Method

Security Level 🔒

Features ⚙️

Flexibility 🔄

Operational Overhead 📊

Notes

Azure Bastion Host

⭐⭐⭐⭐⭐ (Highest)

Rich (portal integration, SSL, RBAC, monitoring)

High (works with Windows/Linux, seamless portal access)

Low (managed PaaS, auto-patching)

Best practice; eliminates public IPs; integrates with Azure AD & Defender

JIT VM Access + NSGs

⭐⭐⭐⭐

Moderate (time-bound access, NSG rules)

Medium (requires public IPs, manual approval)

Medium (policy management needed)

Good for layered defense; still exposes VM temporarily

VPN Gateway + Private IP

⭐⭐⭐

Moderate (secure tunnel, private IP access)

Medium (requires VPN client setup)

Medium-High (VPN infra + client mgmt)

Strong security but less seamless; adds infra complexity

Direct Public IP + NSG Rules

⭐

Basic (direct RDP/SSH)

High (simple, flexible)

Low (easy setup, but insecure)

Not recommended; high attack surface, vulnerable to brute force

Key Takeaways

Azure Bastion Host is the gold standard: secure, feature-rich, and low overhead.
JIT + NSGs adds a strong layer but still requires public IPs.
VPN Gateway is secure but operationally heavier.
Direct Public IP should be avoided in production due to high risk.
 

 

Risk Mitigation Matrix – Remote Access to Azure VMs
 

Threat / Risk 🚨

Azure Bastion Host (Best)

JIT + NSGs

VPN Gateway + Private IP

Direct Public IP (Worst)

Brute Force Attacks

Eliminated (no public IP exposure; SSL via portal)

Reduced (ports open only temporarily)

Reduced (private IP access via tunnel)

High risk (ports exposed to internet)

Port Scanning / Recon

Eliminated (no open ports externally)

Reduced (limited exposure during JIT window)

Reduced (VPN tunnel hides VM ports)

High risk (open ports discoverable)

Credential Theft / Replay

Mitigated (Azure AD RBAC, MFA, Conditional Access)

Partially mitigated (requires strong identity policies)

Mitigated (VPN + MFA)

Weak (depends on VM local accounts)

Man-in-the-Middle (MITM)

Mitigated (TLS-encrypted portal sessions)

Possible (if attacker intercepts public IP traffic)

Mitigated (IPSec tunnel encryption)

High risk (unencrypted RDP/SSH if misconfigured)

Patch / Config Drift

Mitigated (PaaS auto-patching by Azure)

Admin responsibility

Admin responsibility

Admin responsibility

Operational Complexity

Low (managed service, seamless portal access)

Medium (policy setup, approvals)

High (VPN infra + client mgmt)

Low (simple setup, insecure)

Audit & Monitoring

Strong (Azure Monitor, Defender integration)

Moderate (requires NSG + JIT logs)

Moderate (VPN logs, NSG logs)

Weak (limited visibility, manual log collection)

Availability / Resilience

High (zone-redundant Bastion supported)

Medium (depends on VM infra)

Medium (VPN infra redundancy required)

Low (single point of failure)

Attack Surface

Minimal (no external exposure)

Reduced (temporary exposure)

Moderate (VPN infra exposed)

Maximum (VM directly exposed)

Key Insights

Azure Bastion Host: Eliminates external exposure, integrates with Azure AD, and provides the strongest audit trail.
JIT + NSGs: Good layered defense but still relies on public IPs.
VPN Gateway: Secure but adds operational overhead and infrastructure complexity.
Direct Public IP: High risk, minimal controls — should be avoided in production.
 

 

 

Hardened Configuration Checklist – Azure Bastion & Remote Access
1. Planning & Prerequisites

✅ Azure Subscription: Ensure billing and compliance alignment.
✅ Virtual Network (VNet): Pre‑created with proper IP ranges.
✅ Dedicated Subnet: AzureBastionSubnet (minimum /27 CIDR).
✅ Role Assignments: Define RBAC roles for admins, operators, auditors.
RACI

Responsible: Cloud Architect
Accountable: Security Lead
Consulted: Network Engineer
Informed: Compliance Officer
2. Secure Deployment

🔒 Deploy Bastion in zone‑redundant mode for high availability.
🔒 Configure NSG rules: allow only Bastion management traffic (TCP 443).
🔒 Disable public IPs on all VMs.
🔒 Enforce Azure AD MFA for Bastion access.
RACI

Responsible: Cloud Engineer
Accountable: Security Lead
Consulted: Identity Admin
Informed: Operations Manager
3. Identity & Access Controls

🔑 Apply least privilege via RBAC (e.g., Reader vs. VM Contributor).
🔑 Use Conditional Access policies (location, device compliance).
🔑 Rotate admin accounts; enforce passwordless (FIDO2, Azure AD).
RACI

Responsible: Identity Admin
Accountable: Security Lead
Consulted: Cloud Architect
Informed: Audit Team
4. Monitoring & Logging

📊 Enable Azure Monitor and Defender for Cloud integration.
📊 Collect Bastion session logs in Log Analytics Workspace.
📊 Configure alerts for suspicious activity (failed logins, unusual access).
RACI

Responsible: SOC Analyst
Accountable: Security Lead
Consulted: Cloud Engineer
Informed: Compliance Officer
5. Ongoing Maintenance

🔄 Apply patches automatically (Bastion is PaaS, but monitor dependencies).
🔄 Review NSG rules quarterly.
🔄 Conduct penetration tests annually.
🔄 Validate audit evidence for compliance frameworks (ISO, SOC2, PCI).
RACI

Responsible: Security Engineer
Accountable: Compliance Officer
Consulted: Cloud Architect
Informed: Executive Leadership
6. Risk Mitigation Add‑Ons

🛡️ Combine Bastion with JIT VM Access for layered defense.
🛡️ Use Privileged Identity Management (PIM) for admin role elevation.
🛡️ Segment Bastion subnet from production workloads.
🛡️ Enforce network isolation with private endpoints.
Quick Summary

Azure Bastion Host = most secure, lowest overhead.
Harden with RBAC, MFA, NSGs, monitoring, and segmentation.
Use RACI roles to ensure accountability and audit readiness.
Combine with JIT + PIM for defense‑in‑depth.
 

 

 