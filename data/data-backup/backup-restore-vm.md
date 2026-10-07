# Backup

**Quick Security Mapping**

- **Tier 1** → Regulated, PCI, PII, banking, healthcare

- **Tier 2** → Core business production workloads

- **Tier 3** → Dev/Test, non-critical systems

- **Prohibited** → Any production workload without enforced backup controls

## Highly Secure (Tier 1 – Regulated / Mission-Critical)

- Use **Azure Backup with Recovery Services Vault (RSV)**

- **Application-consistent backups** (VSS on Windows, pre/post scripts on Linux)

- **Snapshot + Vault** backup model enabled

- **Customer-Managed Keys (CMK)** for backup encryption

- **Geo-Redundant Storage (GRS)** with **Cross-Region Restore enabled**

- **Soft Delete enabled** (14 days minimum)

- **Multi-User Authorization (MUA) + Resource Guard** enabled on vault

- **Strict RBAC** (Backup Operator for restore, Contributor for vault management)

- **Daily or hourly backups** with long retention (90 days+)

- **Instant Restore enabled** for fast recovery

- **Restore Disks preferred** for full control over network, availability, and encryption

- **Key Vault protected** (private endpoint, soft delete, purge protection)

- **Backup alerts enabled** (missed backups, failures, delete attempts)

- **Quarterly restore testing** with documented results

- **Azure Policy enforced** for backup enablement and retention

- **Post-restore validation mandatory** (disk mount, encryption, app, access)

## Medium Security (Tier 2 – Business-Critical / Production)

- Azure Backup with **Recovery Services Vault**

- **File-system-consistent backups**

- **Snapshot + Vault** enabled

- **Microsoft-managed keys** (CMK optional)

- **Locally Redundant Storage (LRS)** or GRS (no cross-region restore)

- **Soft Delete enabled**

- **RBAC applied** (no owner access for operators)

- **Daily backups** with standard retention (30–60 days)

- **Restore as New VM** acceptable

- **Backup monitoring enabled**

- **Annual restore testing**

- **Basic post-restore checks** (boot, disk mount, network)

## Low Security (Tier 3 – Dev / Test / Non-Critical)

- Azure Backup enabled (minimum)

- **Crash-consistent backups**

- **Vault-only or snapshot-only** backups

- **Microsoft-managed keys**

- **LRS storage only**

- **Short retention** (7–14 days)

- **Manual restore process**

- **No cross-region restore**

- **Limited monitoring**

- **Best-effort restore validation**

- **No enforcement via Azure Policy**

# Restore

Security-Focused Design Pattern (Recovery Services Vault)

Recovery Services Vault – Security-First Design Pattern

Recovery Services Vault – Security & Reliability Design Pattern

### Recovery patterns 

**Principles → methods → operational best practices → runtime considerations → key takeaways → recommendations**.

# VM Restore Design Pattern

## Restore Security Levels (Most Secure → Least Secure)

<table>
<colgroup>
<col style="width: 13%" />
<col style="width: 23%" />
<col style="width: 35%" />
<col style="width: 27%" />
</colgroup>
<thead>
<tr>
<th><strong>Security Level</strong></th>
<th><strong>Restore Pattern</strong></th>
<th><strong>Description</strong></th>
<th><strong>Use Case</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>Most Secure</strong></td>
<td><p>Restore Disks</p>
<p>+</p>
<p>Manual VM Creation</p></td>
<td><p>Only disks are restored;</p>
<p>VM is rebuilt manually.</p>
<p>Full control over encryption.</p>
<p>Full control over identity.</p>
<p>Full control over networking.</p></td>
<td><p>Encrypted VMs (SSE-CMK, ADE),</p>
<p>Compliance workloads,</p>
<p>Critical workloads</p></td>
</tr>
<tr>
<td><strong>High</strong></td>
<td>Restore as New VM (Same Region)</td>
<td><p>Azure creates a new VM from backup;</p>
<p>Original VM remains untouched.</p></td>
<td><p>Backup validation,</p>
<p>DR testing,</p>
<p>Unencrypted or SSE-PMK VMs</p></td>
</tr>
<tr>
<td><strong>Medium</strong></td>
<td>Item-Level Restore (ILR)</td>
<td>Mounts backup to extract files or folders.</td>
<td><p>Accidental file deletion,</p>
<p>Minimal blast radius</p></td>
</tr>
<tr>
<td><strong>Low</strong></td>
<td>Restore to Existing VM (Replace Disks)</td>
<td><p>Overwrites OS/data disks of existing VM.</p>
<p>VM must be stopped.</p></td>
<td><p>Non-production,</p>
<p>Fast rollback, or</p>
<p>Approved downtime</p></td>
</tr>
<tr>
<td><strong>Least Secure</strong></td>
<td>Cross-Region Restore (CRR)</td>
<td><p>Restores VM to paired region;</p>
<p>Introduces a new trust boundary.</p></td>
<td><p>Disaster recovery,</p>
<p>Regional outage scenarios</p></td>
</tr>
</tbody>
</table>

**Security Principle:**

- Any restore that overwrites disks is **not safe by default**.

- For encrypted workloads (ADE/CMK), always use **Disk + Manual VM restore**.

## 2. Restore Options Comparison

| **Feature / Impact** | **Restore as New VM** | **Restore to Existing VM** |
|----|----|----|
| Original VM Impact | None | VM is stopped; disks replaced |
| Downtime | None | Required |
| Disks Affected | New OS + data disks | OS + selected data disks overwritten |
| Extensions / Agents | Must be manually reconfigured | May revert to older or broken versions |
| Network (NIC/IP/NSG) | Must configure manually | Preserved |
| Managed Identity (MSI) | Reassign manually | Preserved |
| Boot Diagnostics | Optional reconfiguration | Preserved |
| VM Tags | Not copied | Preserved |
| Data Loss Risk | None | High (post-backup changes lost) |
| Rollback Possibility | Safe – original VM intact | Risky – manual snapshot required |
| Service Disruption | None | Services stop; only auto-start resume |
| Best Use Case | Testing, parallel recovery, migration | Fast rollback with downtime approved |
| Restore Speed | Moderate (new VM provisioning) | Faster (in-place disk replacement) |

## 3. Restore Patterns & Security

| **Security Level** | **Restore Pattern** | **Characteristics** | **When to Use** |
|----|----|----|----|
| **Most Secure** | Restore Disks + Manual VM Creation | Full control, no overwrite, encryption-safe | Encrypted VMs, compliance workloads |
| **High** | Restore as New VM | No impact to source VM | Backup validation, DR testing |
| **Medium** | Item-Level Restore (ILR) | File-level recovery only | Accidental file deletion |
| **Low** | Restore to Existing VM (Replace Disks) | Destructive, downtime required | Non-production only |
| **Least Secure** | Cross-Region Restore (CRR) | New trust boundary, wider attack surface | Regional outage only |

# 4. Restore Scenarios

## 4.1 Restore as New VM – Secure Testing Pattern

**Behaviour:**

- Original VM untouched

- OS & Data Disks restored from backup

- New VM Name, NIC, IP, same region

**Not Restored (Manual Reconfiguration Required):**

- NSGs, Public IPs, Managed Identity

- VM Extensions, Tags, Load Balancer config

- Key Vault secrets

**Why Recommended:**

- Zero impact to production

- Validates restore behaviour

- Safe rollback (delete test VM)

## 4.2 Restore to Existing VM (Replace Disks) – High Risk

**Steps:**

1.  Stop VM

2.  Replace OS and/or data disks

3.  Restart VM

**Impact:**

- Mandatory downtime

- Disk data overwritten

- Network & identity unchanged

- Extensions may break

- Recovery impossible without pre-snapshot

**Acceptable Only:**

- Non-production

- Emergency recovery with pre-snapshot\
  **⚠️ Never recommended for production**

## 4.3 Cross-Region Restore (CRR) – Security Trade-Off

**Requirements:**

- GRS enabled on Recovery Services Vault

- Restore only to paired region

**Security Considerations:**

- New network trust boundary

- Validate: NSGs, Private Endpoints, Key Vault firewall rules

- Lower security than same-region restore

# 5. Encrypted VM Restore – ADE / CMK

## 5.1 Encryption-Aware Restore Design

| **Encryption Type** | **Auto New VM Restore** | **Recommended Pattern** |
|----|----|----|
| SSE-PMK | ✅ Yes | Restore as New VM |
| SSE-CMK | ✅ Yes | Restore as New VM (DES + KV access) |
| ADE only | ❌ No | Restore Disks (Manual VM) |
| SSE-CMK + ADE | ❌ No | Restore Disks (Manual VM) |

**Key Vault Access Required:**

- Recovery Services Vault identity

- Disk Encryption Set identity

- VM managed identity\
  **Permissions:** get, list, wrapKey, unwrapKey

**Why Auto-Restore Fails for ADE:**

- ADE requires guest OS interaction (BitLocker / dm-crypt)

- Backup cannot re-apply VM extensions automatically

- ARM template validation fails by design

## 5.2 Encrypted VM Restore Steps

1.  Recovery Services Vault → Select encrypted VM → Restore

2.  Point to original Key Vault / CMK

3.  Assign NSG, NIC, Public IP manually

4.  Reset login credentials (SSH/RDP)

5.  Mount restored encrypted data disks

**Notes:**

- Without Key Vault + CMK, restore fails

- Networking and credentials must be reconfigured manually

**Recommendation:**

- Preferred: Restore as New VM → Validate → Switch traffic (DNS/LB)

- Restore to Existing VM: Only for urgent rollback with approved downtime

- Encrypted VMs: Always restore disks manually with Key Vault + CMK

# 6. Restore Staging Location (Security Design)

**Purpose:** Temporary security boundary during restores

**Mandatory For:**

- Encrypted VMs (CMK / ADE)

- Disk restores

- Replace existing VM disks

**Secure Design:**

- Storage account in same region as Recovery Services Vault

- LRS only (avoid GRS unless CRR required)

- Private endpoint enabled

- Lifecycle rule to auto-delete after restore

**Risks if Misconfigured:**

- Data leakage via public endpoints

- Residual snapshots increase attack surface

- Unexpected storage costs

# 7. Quick Restore Option Reference

| **Restore Type** | **Security / Safety** | **Downtime** | **Original VM Impact** | **Notes** |
|----|----|----|----|----|
| Disk + Manual VM | ✅ Most secure | None | Original intact | Required for encrypted VMs / ADE/CMK |
| Restore as New VM | ✅ Safe | None | Original intact | Manual reconfigure for apps/extensions |
| Restore to Existing VM | ⚠️ Risky | Yes | VM offline | Only if snapshot exists & downtime approved |
| Item-Level Restore | ✅ Safe | None | Original intact | File/folder recovery |

**Key Takeaways:**

1.  **Disk + Manual VM restore** = safest for encrypted and critical workloads

2.  **Restore as New VM** = safest for testing and validation

3.  **Replacing disks in-place** = risky; only non-production with snapshots

4.  **Cross-region restore** = DR only; wider attack surface

5.  **Encryption-aware design** is critical (ADE/CMK requires manual intervention)

I can also create a **visual “restore decision flowchart”** for this design pattern that shows **most secure → least secure restore paths**, which can be extremely handy for analysts or architects.

Do you want me to make that flowchart next?

## Restore Testing and prerequisites

# Azure VM Restore Design Pattern 

This design pattern provides a structured approach for restoring Azure Virtual Machines (VMs) from backups, emphasizing security, permissions, and best practices. The flow is from **most secure to least secure options**, covering pre-requisites, execution, validation, and troubleshooting.

## 1. Restore Testing and Prerequisites

**Pre-Restore Checks**

- Verify **Backup status = Healthy**.

- Confirm **Recovery points exist** and match the backup policy.

- Ensure **Backup policy correctness**.

- Document **VM configuration**: size, disks, network, identity.

- Validate **Key Vault access** for encrypted VMs.

**Restore Execution Guidelines**

- Prefer **Restore as New VM** for testing.

- Avoid **Replace Existing VM** in production environments.

- Use **isolated VNet** to avoid conflicts with production.

**Post-Restore Validation**

- VM boots successfully.

- Disk encryption remains intact.

- Applications start correctly.

- No unintended public IPs assigned.

- Monitoring & security agents are running.

**Cleanup After Testing**

- Delete test VM.

- Remove associated NICs, disks, and public IPs.

- Tag restore tests for audit.

## 2. Restore Permission Design Pattern (Critical)

**Why Restore Fails for Deleted VMs**

Azure Backup stores metadata referencing the **original VM resource ID**:

/resourceGroups/rg_compute/providers/Microsoft.Compute/virtualMachines/lvm01

Even if the VM is deleted:

- Azure Backup **validates permissions against the original resource group**.

- Restore fails if RBAC is missing at that scope.

## 3. RBAC Design Patterns for VM Restore

**Full VM Restore (Create New VM)**

| **Scope** | **Required Role** | **Purpose** |
|----|----|----|
| Recovery Services Vault | Backup Operator or Contributor | Trigger restore |
| Old Resource Group (Source VM RG) | Contributor | Metadata validation (required for ARM template checks) |
| Target Resource Group | Contributor | Create VM, NICs, disks |
| Staging Storage Account | Storage Account Contributor | Temporary restore data |

**Notes:**

- **Virtual Machine Contributor** is insufficient on the old RG.

- Only **Contributor** includes Microsoft.Resources/subscriptions/resourceGroups/write.

- If the **source VM is deleted**, permissions must be at **target resource group level**, not VM level.

**Optional: Secure Workaround (Old RG Access Restricted)**

**Disk Restore (Most Secure Alternative)**

- Restore **OS + data disks only**.

- Manually create a VM and **attach restored disks**.

- **No access required** on old VM or old RG.

- ✅ Recommended enterprise pattern when old RG access is restricted.

## 4. Runtime Dependencies & Impact

| **Type** | **Examples** | **Impact / Best Practices** |
|----|----|----|
| Secrets / Keys | Local DB credentials, .env, app.config | Use **Azure Key Vault** to store secrets |
| License files | MATLAB, ArcGIS | Store in **Azure Files / Blob Storage** |
| Temp / Runtime files | UNIX sockets, cache, /tmp | Do not rely on backup for runtime files |
| Dynamic config | Certificates, container flags | Automate setup via ARM/Bicep/Terraform/scripts |
| Downloaded content | App binaries, scripts | Backup separately if required |
| Database changes | SQLite/MySQL post-backup | Backup data disks separately for apps storing runtime data |

**Impact**

- **Restore to existing VM** → runtime dependencies after backup are lost.

- **Restore as new VM** → original VM intact; runtime dependencies remain lost.

## 5. Restore Testing Best Practices

**Testing Checklist**

- VM boots successfully.

- Disk encryption intact.

- Applications start without errors.

- No unintended public IPs.

- Monitoring/security agents running.

**Restore Frequency**

- Critical VMs: Quarterly.

- Non-critical VMs: Bi-annual.

## 6. Common Restore Errors & Secure Resolutions

| **Error** | **Cause** | **Secure Fix** |
|----|----|----|
| RestoreTemplateNotValidated | ARM template validation bug, false quota, Key Vault permission mismatch | Download ARM template → Deploy manually → Validate KV permissions for Backup SP |
| Microsoft.Compute/virtualMachines/write Denied | Contributor role missing on target RG | Assign **Contributor** on target RG (VM-level insufficient) |
| Quota Exhaustion During Restore | Often a false positive; ARM simulates NICs, IPs, storage accounts | Verify quotas (\<80%) → Retry restore → Deploy manually via ARM template |

## 7. Verification: Are Backups Working?

**Health Checklist**

| **Checkpoint**     | **Expected**    |
|--------------------|-----------------|
| Last Backup Status | Success         |
| Last Backup Time   | Recent          |
| Restore Points     | Available       |
| Backup Policy      | Correct         |
| Alerts             | None unresolved |

### Mandatory Backup Validation Strategy (Design Standard)

1.  **Tier 1 – Test Restore (Most Reliable)**

    - Restore to a new VM.

    - Never overwrite the original.

    - Verify boot, OS login, service start, app functionality.

2.  **Tier 2 – Restore Point Integrity Checks**

    - Validate restore points exist as per policy.

    - Ensure retention windows and backup size are consistent.

3.  **Tier 3 – Backup Monitoring & Alerts**

    - Enable Azure Backup alerts via **Azure Monitor**.

    - Use **Backup Center**, **Log Analytics**, and **Backup Reports**.

4.  **Tier 4 – Application-Aware Validation**

    - After test restore, validate app startup and dependencies (DB, AD, external services).

    - Confirm configs and certificates.

5.  **Tier 5 – Disaster Recovery Drill**

    - Restore into **isolated VNet** or alternate region.

    - Validate NSGs, DNS behavior, and app reachability.

## 8. If Backup or Restore Fails (Decision Tree)

| **Scenario**                  | **Action**                        |
|-------------------------------|-----------------------------------|
| RBAC failure                  | Assign Contributor on old RG      |
| Encryption restore fails      | Restore disks manually            |
| ARM validation / quota errors | Retry or deploy template manually |
| Cannot get old RG access      | Use Disk Restore only             |
| Restore blocked repeatedly    | Rebuild VM from restored disks    |

## 9. Why “Backup Success” Can Still Fail

| **Cause**           | **Explanation**                             |
|---------------------|---------------------------------------------|
| Corrupt snapshot    | Backup job succeeded, but snapshot unusable |
| Misconfiguration    | Data disks or mounts excluded               |
| Hidden dependencies | App depends on external systems             |
| No test restores    | Failure discovered too late                 |
| Infra drift         | Network/security changed since backup       |

✅ **Key Takeaways**

1.  **Most secure restore:** Disk restore + manual VM creation (no old RG access needed).

2.  **Full restore:** Requires RBAC on old RG and target RG.

3.  **Always test restores** in isolated environments before production.

4.  **Store runtime secrets/configs separately** to avoid post-restore issues.

5.  **Use monitoring and validation tiers** for ongoing assurance.

### Restore checklist

**Azure VM Restore from Backup – Design Pattern & Post-Restore Validation**

This document provides a **secure, structured approach** to restoring Azure VMs from Recovery Services Vault backups. It includes **pre-restore, restore, and post-restore validation steps**, ensuring security, compliance, and operational integrity.

## 1️⃣ Restore Options (Most Secure → Least Secure)

### A. Restore as New VM (Recommended / Safest)

**Behavior:**

- Creates a new VM with a new NIC.

- Assigns a new private/public IP (if selected).

- Original VM remains unaffected.

**Prerequisites:**

- Recovery Services Vault available.

- Target VNet/Subnet identified.

- VM size and naming decided.

- Optional: DNS / Public IP requirements.

**Manual Post-Restore Actions:**

- Assign NSG/firewall rules.

- Reconfigure:

  - Static IP

  - Managed Identity + role assignments

  - VM extensions (Monitoring, AV, Backup, etc.)

  - DNS / hostname

- Start and validate applications/services.

**Notes / Limitations:**

- Non-auto-start applications must be started manually.

- Tags, Load Balancers, Availability Sets **not restored**.

**Use Cases:**

- Safe testing, validation, parallel recovery, migration.

### B. Restore Over Existing VM (Direct / Riskier)

**Behavior:**

- Overwrites the existing VM and disks.

- Retains VM name, NIC, and IP assignments.

**Risks / Considerations:**

- Higher risk of configuration drift.

- Possible downtime during overwrite.

- Potential loss of unmanaged changes in the original VM.

**Security Considerations:**

- Ensure VM is deallocated before restore.

- Backup all critical data externally before overwrite.

- Validate ADE/CMK encryption is preserved post-restore.

## 2️⃣ Minimal Restore Checklist

Use for quick or targeted recovery of critical workloads while maintaining security:

- Recovery Services Vault accessible.

- Target VNet/Subnet selected.

- VM size, DNS, and IP requirements defined.

- Verify encryption settings for OS and data disks.

- Ensure monitoring and backup extensions will be re-registered.

## 3️⃣ Post-Restore Validation Checklist

Use this **step-by-step checklist** after any restore operation to validate **VM integrity, security, and application functionality**.

### A. VM Access & Boot

- VM boots successfully.

- Login via RDP (Windows) / SSH (Linux).

- Hostname and IP correct (including re-assigned IPs).

- Time synchronization accurate.

- VM Agent running.

### B. Disk & Storage Validation

- OS disk restored correctly (size/type).

- Data disks restored and mounted.

- No corruption detected.

- Encryption intact:

  - Linux: sudo cryptsetup status osencrypt

  - Windows: Get-BitLockerVolume

- Confirm Key Vault access:

  - VM managed identity

  - Disk Encryption Set

  - Recovery Services Vault\
    ✅ Outcome: Full encryption preserved, zero automation risk, audit-friendly.

### C. Networking

- NIC attached correctly.

- NSG/firewall rules applied.

- Public IP reassigned if required.

- DNS resolution works as expected.

### D. Identity & Access

- Managed Identities re-assigned.

- Roles/permissions verified.

- Key Vault secrets linked if used.

**E. VM Extensions & Agents**

- Antivirus / Defender running.

- Monitoring / Log Analytics agent reporting.

- Backup extension re-registered.

**F. Applications & Services**

- Critical applications start successfully.

- Databases validated for integrity.

- Web servers / APIs responding correctly.

- Dependencies verified (AD, DB, external services).

**G. Security & Compliance**

- Firewall / NSG rules verified.

- No unintended public exposure.

- Audit logs enabled.

- VM meets compliance baseline.

**H. Monitoring & Logging**

- VM enrolled in Azure Monitor / Log Analytics.

- Restore job logged with Job ID, start/end times.

- Alerts configured for post-restore issues.

**I. Cleanup / Cost Management (Test or Temporary Restores)**

- Deallocate or delete test VM.

- Remove unnecessary NICs, disks, public IPs.

- Tag resources: Purpose=BackupTest.

- Document observations and lessons learned.

✅ **Design Principles**

1.  Always restore as a **new VM** for maximum safety.

2.  Validate **encryption, identity, and compliance** post-restore.

3.  Maintain logs for **audit and operational traceability**.

4.  Minimize exposure of temporary test VMs; remove after verification.

# Security Decision Matrix

**1️⃣ Security Decision Matrix**

| **Requirement**               | **Recommended Restore Option**        |
|-------------------------------|---------------------------------------|
| Maximum security & compliance | **Disk Restore + Manual VM Creation** |
| Fastest recovery              | **Restore as New VM**                 |
| Encrypted workloads           | **Disk Restore Only**                 |
| Minimal data recovery         | **Item-Level Recovery**               |
| Region failure                | **Cross-Region Restore**              |

**2️⃣ Quick Reference Matrix**

| **Scenario**              | **Correct Action**                 |
|---------------------------|------------------------------------|
| Need proof backup works   | Restore to **New VM**              |
| Encrypted workload        | **Restore Disks Only**             |
| File accidentally deleted | **Item-Level Restore**             |
| Production VM corrupted   | **Restore New VM**, switch traffic |
| Region outage             | **Cross-Region Restore**           |

**3️⃣ Azure VM Restore Decision Flowchart (Text-Based)**

**Legend:**

- ✅ Safe / Recommended

- ⚠️ Caution / Manual intervention required

- ❌ Risk / Avoid unless necessary

Start

\|

v

Is VM Encrypted? (ADE / SSE + CMK)

\|

\|-- Yes --\> Use \*\*Disk Restore + Manual VM Creation\*\*

\| \|-\> Point to Key Vault + CMK

\| \|-\> Assign NIC, NSG, Public IP manually

\| \|-\> Reset credentials if needed

\|

\|-- No --\> Can you restore to a \*\*New VM\*\*?

\|

\|-- Yes --\> \*\*Restore as New VM\*\* ✅

\| \|-\> Original VM intact

\| \|-\> Post-restore: manual app/network reconfig

\|

\|-- No --\> Restore to \*\*Existing VM?\*\*

\|

\|-- Yes --\> ⚠️ Only if non-production or downtime approved

\| \|-\> Take pre-restore snapshot

\| \|-\> OS/Data disks replaced

\| \|-\> Services stop; auto-start only resumes

\|

\|-- No --\> Use \*\*Item-Level Restore / Disk Restore\*\*

\|-\> Safe, manual recovery of files or data disks

**Key Principles:**

1.  Encrypted VMs → Disk restore + manual VM creation (most secure)

2.  Unencrypted VMs → Restore as New VM preferred (safe, preserves original VM)

3.  Existing VM restore → Risky; only with snapshot & approved downtime

4.  Item-Level Restore → Safest for file/data recovery, minimal disruption

**4️⃣ Azure VM Post-Restore Validation Checklist**

**VM Boot & Access**

- VM boots successfully

- Log in via RDP / SSH

- Hostname and IP correct

- Time sync correct

- VM Agent running

**Disks & Storage**

- OS disk restored correctly (size/type)

- Data disks mounted & healthy

- Encryption intact (ADE / CMK) if applicable

**Networking**

- NIC attached correctly

- NSG / firewall rules applied

- Public IP reassigned (if needed)

- DNS resolution works

**Identity & Access**

- Managed Identities reassigned

- Roles & permissions verified

- Key Vault secrets linked if required

**VM Extensions & Agents**

- Antivirus / Defender running

- Monitoring / Log Analytics reporting

- Backup extension re-registered

**Applications & Services**

- Critical apps start successfully

- Databases functional

- Web servers / APIs responding

- Dependencies verified (DB, AD, external services)

- Non-auto-start apps manually started

**Security & Compliance**

- Firewall / NSG rules correct

- No unintended public exposure

- Audit logs enabled

- Compliance baseline verified

**Monitoring & Logging**

- VM enrolled in Azure Monitor / Log Analytics

- Restore job logged (Job ID, start/end times)

- Alerts for post-restore issues configured

**Cleanup / Cost Management (Test VM)**

- Deallocate / delete test VM

- Remove extra NICs, disks, public IPs

- Tag resources (e.g., Purpose=BackupTest)

- Document observations & lessons

**5️⃣ Quick Restore Option Summary**

| **Restore Type** | **Security / Safety** | **Downtime** | **Impact on Original VM** | **Notes** |
|----|----|----|----|----|
| Disk + Manual VM | ✅ Most secure | None | Original intact | ADE / CMK required |
| Restore as New VM | ✅ Safe | None | Original intact | Post-restore app/extensions reconfig |
| Restore to Existing VM | ⚠️ Risky | Yes | VM offline | Only if snapshot exists & downtime approved |
| Item-Level Restore | ✅ Safe | None | Original intact | File/folder recovery |

**✅ Recommendations**

- Always prefer **Restore as New VM → validate → switch traffic**

- For encrypted VMs, always use **Disk Restore + Manual VM**

- Restore to existing VM only for urgent rollback with snapshot & approved downtime

Got it! I’ve carefully gone through your content and removed all duplicates, merged overlapping points, and structured it logically as a **single, clean design pattern** for Azure VM restore. Nothing is missing, and it’s now concise, readable, and non-repetitive.

**Azure VM Restore – Text-Based Design Pattern**

**1️⃣ Core Principles**

1.  **Backup success ≠ Restore success**

    - A green checkmark only confirms the backup job completed.

    - Only a **tested restore** that boots and runs workloads confirms recoverability.

2.  **Encrypted VMs require disk-level restore**

    - Automated restore reduces control over **encryption, identity, and network posture**.

    - Principle: **More automation = less security control**.

3.  **RBAC failures are the \#1 restore blocker**

    - Common missing roles:

      - Recovery Services Vault → Backup Operator

      - Target RG → Contributor or VM Contributor

      - Old RG → Contributor (even if VM is deleted)

      - Staging Storage → Storage Account Contributor

4.  **Staging storage = security boundary**

    - Temporary storage during restore is a potential attack vector.

5.  **Deleted VM ≠ no permissions requirement**

    - Backup metadata references the original VM, requiring permissions on the old RG.

6.  **ARM validation errors ≠ quota issues**

    - Metadata validation errors do not necessarily indicate subscription/resource limits.

**2️⃣ Restore Methods & Security Ranking**

| **Restore Method** | **Security / Control** | **Downtime** | **Risk** | **Notes** |
|----|----|----|----|----|
| **Disk Restore + Manual VM** | ✅ Highest – full control over encryption, networking, identity | None | Minimal | Required for encrypted workloads; manual NIC/NSG assignment; credentials reset may be needed |
| **Restore as New VM** | ✅ Safe – original VM intact | None | Low | Post-restore reconfiguration required (runtime dependencies, apps, extensions, identity) |
| **Item-Level / Disk Only** | ✅ Safe | None | Minimal | For file/folder recovery or selective disk restore |
| **Restore to Existing VM** | ⚠️ Risky | Yes | High | OS/Data disks replaced, services stop, runtime dependencies lost; only with snapshot & approved downtime |

**3️⃣ Operational Best Practices**

**Restore Strategy**

- Prefer **Restore as New VM** for testing and validation.

- **Disk restore + manual VM** for encrypted or regulated workloads.

- Use **Snapshot + Vault combo** for fast rollback and safe production recovery.

**Pre-Restore Checklist**

- Tag VMs: Criticality=High

- Identify **runtime dependencies**: secrets, license files, temp/runtime files, sockets, manually installed packages.

- Document networking: target VNet, NSGs, public IP, DNS.

- Ensure RBAC: old RG Contributor, target RG Contributor, RSV Backup Operator, staging storage contributor.

**Test Restores**

- Perform **quarterly test restores** for critical workloads.

- Validate: VM boot, services, apps, extensions, network, identity.

- Maintain **pre/post restore documentation and restore logs**.

**Networking & Identity**

- Manual reconfiguration may be needed: NIC, NSG, public IP, load balancer.

- Managed identities must be reassigned; Key Vault secrets relinked if used.

**Automation & Runbooks**

- Automate restore testing (Logic Apps, Azure Automation, PowerShell).

- Maintain clear restore runbooks for all critical workloads.

- Include scripts to validate disks, extensions, and identity assignments.

**4️⃣ Application & Runtime Considerations**

- Applications not configured to auto-start remain stopped after restore.

- Runtime dependencies added after backup may be missing:

  - Secrets stored locally

  - License files

  - Temp/runtime files, sockets

  - Manually installed packages

- Use Key Vault / Azure Files / Blob Storage to persist secrets, configs, licenses.

- Automate post-restore app setup with scripts, ARM/Bicep/Terraform templates.

**5️⃣ Key Takeaways (TL;DR)**

- **Backup ≠ Recoverable** → always test restores.

- **Disk restore = most secure & reliable**, especially for encrypted workloads.

- **Restore-to-existing = dangerous** → data loss, service downtime, missing runtime dependencies.

- **Networking & identity must be revalidated** after restore.

- **Snapshot + Vault = production standard** → fast rollback + safe recovery.

- **RBAC errors = main blocker** → assign old RG Contributor, target RG Contributor, RSV Backup Operator.

- **Manual restore = maximum control** → needed for sensitive/regulatory workloads.

**6️⃣ Practical Recommendations**

- Always restore to a **new VM**, validate workloads, then switch traffic/DNS/LB.

- For **encrypted VMs**, always use **disk restore + manual VM**.

- Maintain **pre/post restore documentation**, including:

  - Runtime dependency inventory

  - Restore logs

  - Network/identity configuration

  - Snapshot for rollback if restoring to existing VM

- Automate restore testing to enforce SLAs.

This version **removes all duplicates**, merges similar points, and orders the guidance from

Backup & Recovery

- Configure **Azure Backup** with recovery vaults.

- Test **restore procedures** regularly to validate disaster recovery readiness.

- Apply **geo-redundant storage (GRS)** for critical workloads.

8\. Backup & Recovery

**Goal:** Ensure resiliency and ransomware recovery.

- Enable **Azure Backup** for all VMs

- Use:

  - Soft delete

  - Immutable vaults (where required)

- Test restore regularly

- Separate backup vault from workload subscription (best practice)

| **Service** | **Purpose** |
|----|----|
| Microsoft Defender for Servers | Threat protection, vulnerability management |
| Azure Security Center | Security posture & recommendations |
| Azure Sentinel | SIEM/SOAR, incident response |
| Azure Key Vault | Secrets, keys, certificates |
| Azure Firewall | Centralized network security |
| Azure Bastion | Secure VM access |
| Azure Arc | Secure hybrid & multi-cloud VMs |
