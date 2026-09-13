# Azure Policies for VMs with "Deny" effect

We should consider for VM governance, organized by objective. These are typically built-in policies (with policy definition IDs where useful) that you can assign via Azure Policy, ideally bundled into an Initiative (policy set) scoped to a management group or subscription.

## 1. Security Hardening

| Policy | Purpose |
|---|---|
| **Deny public IP association on VM NICs** | Prevents VMs from being directly exposed to the internet |
| **Deny VMs without a Network Security Group (NSG) on NIC/subnet** | Ensures traffic filtering is always in place |
| **Deny inbound RDP (3389) / SSH (22) from Internet (0.0.0.0/0)** | Blocks unrestricted management port exposure |
| **Deny VM creation without Azure Disk Encryption / Trusted Launch enabled** | Enforces encryption-at-rest and secure boot |
| **Deny VMs without Microsoft Defender for Cloud agent/extension** | Ensures endpoint visibility and threat detection |
| **Deny password-based authentication for Linux VMs (enforce SSH keys only)** | Reduces brute-force attack surface |
| **Deny VM extensions from untrusted publishers** | Prevents arbitrary/unapproved extension installation |
| **Deny VMs without Just-In-Time (JIT) access configured** (via initiative, not pure deny) | Reduces standing access to management ports |

## 2. Data Protection

| Policy | Purpose |
|---|---|
| **Deny unencrypted managed disks** | Enforces encryption at rest (platform-managed or CMK) |
| **Deny disks without Customer-Managed Keys (CMK)** *(if regulatory requirement)* | Ensures organization controls encryption keys |
| **Deny VM creation without diagnostic settings sending logs to Log Analytics/Storage** | Ensures audit trail exists for data access/changes |
| **Deny public access on storage accounts linked to VM diagnostics/boot diagnostics** | Prevents data exposure via misconfigured storage |
| **Deny snapshots/disks with public network access enabled** | Prevents exfiltration via exposed disk snapshots |

## 3. Availability & Resilience

| Policy | Purpose |
|---|---|
| **Deny VM deployment outside approved/allowed regions** | Ensures compliance with data residency and DR strategy |
| **Deny VMs without Availability Zone or Availability Set configuration** (for production tier) | Enforces HA design for critical workloads |
| **Deny VM SKUs not on the approved list** | Prevents unsupported or non-resilient SKUs |
| **Deny deletion of VMs/disks without a resource lock** *(via lock, not policy deny directly)* | Prevents accidental deletion of production resources |
| **Deny VMs without a backup policy/Recovery Services Vault association** | Ensures backup coverage (often enforced via "Deploy if not exists" + deny on missing tag) |

## 4. Integrity & Configuration Compliance

| Policy | Purpose |
|---|---|
| **Deny VMs not using approved/golden images (Azure Compute Gallery only)** | Prevents drift from hardened, patched base images |
| **Deny VMs without Guest Configuration/Azure Automanage enabled** | Ensures continuous configuration drift detection |
| **Deny VMs without required tags (Owner, CostCenter, Environment, DataClassification)** | Ensures accountability and governance metadata |
| **Deny VM creation from unmanaged disks (require managed disks only)** | Ensures consistency, encryption, and backup compatibility |
| **Deny custom script extensions from unapproved sources** | Prevents integrity compromise via arbitrary script execution |

## 5. Identity & Access

| Policy | Purpose |
|---|---|
| **Deny local admin/root account creation with weak/default names** | Reduces predictable attack surface |
| **Deny VMs without Managed Identity enabled** | Forces use of Managed Identity over embedded credentials/secrets |
| **Deny VM access via NSG rules allowing "Any" source/destination on management ports** | Reinforces least-privilege network access |

## Implementation Notes
- Group these into a **custom Initiative** (e.g., "VM Security Baseline") for easier assignment and compliance reporting.
- Use **Azure Policy Deny effect** for hard blocks; use **Audit/DeployIfNotExists** where enforcement isn't feasible at creation time (e.g., backup, monitoring agents) — deny alone can't retroactively fix existing resources.
- Consider aligning definitions with **CIS Azure Foundations Benchmark** and **Microsoft Cloud Security Benchmark**, both of which map closely to Azure Policy built-ins (search these two in Policy > Definitions to import ready-made ones instead of writing custom JSON).
- Test policies in **Audit mode** first before switching to **Deny**, to avoid breaking legitimate deployment pipelines.

Want me to draft the actual **Azure Policy JSON definitions** for any of these (e.g., deny public IP, deny unencrypted disks), or put together a **sample Initiative structure** you could deploy via ARM/Bicep/Terraform?