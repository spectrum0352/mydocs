# Azure Policies for VMSS with 'Deny' effect

## 1. Security Hardening

| Policy | Purpose |
|---|---|
| **Deny public IP configuration on VMSS NIC/IP config** | Prevents scale set instances from being directly internet-facing |
| **Deny VMSS without NSG on subnet/NIC** | Ensures traffic filtering applies to every instance |
| **Deny inbound RDP (3389)/SSH (22) from Internet (0.0.0.0/0) in VMSS NSG rules** | Blocks unrestricted management port exposure across all instances |
| **Deny VMSS without Trusted Launch / Secure Boot / vTPM enabled** | Enforces secure boot and integrity monitoring at scale |
| **Deny VMSS without Microsoft Defender for Cloud extension** | Ensures every instance is monitored, not just some |
| **Deny password-based auth for Linux VMSS (enforce SSH keys)** | Reduces brute-force risk across the fleet |
| **Deny VMSS extensions from unapproved publishers** | Prevents unauthorized extensions being pushed fleet-wide |
| **Deny VMSS without Azure AD login extension (for centralized identity)** | Enforces centralized identity/access control instead of local accounts |

## 2. Data Protection

| Policy | Purpose |
|---|---|
| **Deny unencrypted OS/data disks on VMSS instances** | Enforces encryption at rest across all instances |
| **Deny VMSS disks without Customer-Managed Keys (CMK)** *(if required)* | Ensures key ownership/control for regulated workloads |
| **Deny VMSS without diagnostic settings/boot diagnostics configured** | Ensures logging/audit trail exists for every instance |
| **Deny VMSS with public network access enabled on associated storage/diagnostics** | Prevents data leakage through diagnostic storage |
| **Deny VMSS snapshots/images with public access enabled** | Prevents exposure of golden images used for scaling |

## 3. Availability & Resilience

| Policy | Purpose |
|---|---|
| **Deny VMSS deployment outside approved regions** | Enforces data residency and DR alignment |
| **Deny VMSS without zone redundancy (single-zone only) for production tier** | Enforces high availability across Availability Zones |
| **Deny VMSS with instance count below minimum threshold (e.g., <2)** | Prevents under-provisioned, non-resilient deployments |
| **Deny VMSS without health probes/Application Health extension configured** | Ensures automatic instance repair/replacement works correctly |
| **Deny VMSS with upgrade policy set to "Manual" for production workloads** | Enforces automatic or rolling upgrades to avoid drift/staleness |
| **Deny VMSS without overprovisioning disabled where strict cost/capacity control is required** *(context-dependent — sometimes the opposite is desired)* | Controls billing/capacity behavior intentionally rather than by default |
| **Deny VMSS SKUs not on approved list** | Prevents use of unsupported, non-resilient, or unauthorized VM sizes |

## 4. Integrity & Configuration Compliance

| Policy | Purpose |
|---|---|
| **Deny VMSS not using approved images from Azure Compute Gallery** | Ensures only hardened, patched golden images are used at scale |
| **Deny VMSS without Guest Configuration/Azure Automanage enabled** | Ensures continuous drift detection across all instances |
| **Deny VMSS using Uniform orchestration mode where Flexible is mandated (or vice versa)** | Enforces standardized orchestration mode per organizational policy |
| **Deny VMSS without required tags (Owner, Environment, CostCenter, DataClassification)** | Ensures governance metadata consistency |
| **Deny VMSS with unmanaged disks (require managed disks only)** | Ensures consistency, encryption, backup compatibility |
| **Deny custom script extensions from unapproved sources on VMSS** | Prevents fleet-wide compromise via malicious scripts |
| **Deny VMSS without automatic OS image upgrade enabled (for platform-managed images)** | Prevents fleet from running outdated/vulnerable OS images |

## 5. Identity & Access

| Policy | Purpose |
|---|---|
| **Deny VMSS without Managed Identity (System or User-Assigned) enabled** | Forces managed identity use over embedded credentials |
| **Deny VMSS NSG rules allowing "Any" source/destination on management ports** | Reinforces least-privilege network access at scale |
| **Deny local admin account creation with default/weak usernames on VMSS instances** | Reduces predictable attack surface across the fleet |

## VMSS-Specific Considerations (beyond standalone VM policies)

1. **Orchestration Mode** — Decide organizational standard (Flexible is now recommended by Microsoft for most new workloads; Uniform is legacy-oriented). Enforce via policy to prevent mixed-mode sprawl.
2. **Scale-in Policy** — While not typically a "deny" policy, consider governance around which scale-in policy (Default, OldestVM, NewestVM) is permitted, especially for stateful workloads.
3. **Rolling Upgrades** — Deny configurations that skip health-check-based rolling upgrades, since a bad image pushed to a scale set without health probes can take down the entire fleet simultaneously.
4. **Autoscale Rules** — While Azure Policy doesn't directly "deny" autoscale misconfigurations well, pair policy with **Azure Monitor autoscale governance** to prevent unbounded scale-out (cost/DoS risk) or zero-instance scale-in on critical services.

## Implementation Notes
- Bundle into the same **Initiative** as your standalone VM policies where definitions overlap (NSG, encryption, tags, extensions) — VMSS-specific ones (orchestration mode, upgrade policy, zone redundancy) can be added as supplementary.
- Cross-check against **Microsoft Cloud Security Benchmark** and **CIS Azure Foundations Benchmark**, which include several VMSS-specific built-ins already available under Policy > Definitions (avoids custom JSON authoring).
- As before, run in **Audit mode** first, especially for orchestration mode and upgrade policy changes, since these can affect live scaling behavior and cause outages if misapplied in Deny mode without validation.

Want me to draft a **combined Initiative (policy set) definition in JSON/Bicep** that covers both standalone VMs and VMSS in one governance package, or focus on just the VMSS-unique ones first?