# Backup and DR

## 1. Cloud Security 

**Primary Focus:** Governance, compliance, access control, and risk
mitigation.

**Duties:**

- **Policy & Compliance**

  - Define and enforce **data backup and DR policies** (e.g., retention,
    encryption, geo-redundancy).

  - Ensure compliance with **regulatory requirements** (GDPR, HIPAA, ISO
    27001).

  - Participate in **BC/DR planning and audits**.

- **Security Controls**

  - Ensure **encryption-at-rest and in-transit** for backup data.

  - Apply **RBAC and least privilege** access to backup storage and DR
    tools.

  - Validate **immutability settings** for backups (e.g., to prevent
    ransomware rollback attacks).

- **Monitoring & Alerting**

  - Monitor for **unauthorized access** or anomaly detection in backup
    operations.

  - Review **SIEM alerts/logs** related to backup operations or DR event
    execution.

- **Risk Assessment**

  - Evaluate **business impact and risk** if backup or DR fails.

  - Participate in **tabletop exercises** simulating DR events.

## 2. IT Administrator / System Administrator

**Primary Focus:** On-prem and hybrid system management.

**Duties:**

- Schedule and verify **on-prem data/VM/SQL backups** using third-party
  or native tools.

- Manage **backup agents, software updates**, and patching of backup
  tools.

- Ensure **connectivity and authentication** between systems and backup
  infrastructure.

- Participate in **test restores** and DR drills.

- Coordinate with security team to apply **access controls** and audit
  trails.

## 3. Cloud Administrator

**Primary Focus:** Cloud infrastructure and service management.

**Duties:**

- Configure **cloud-native backup services** (e.g., Azure Backup, AWS
  Backup).

- Manage **backup vaults**, **retention policies**, and **resource
  tags**.

- Ensure VMs, disks, databases, and file shares are **registered for
  backup**.

- Perform **restores or snapshots** during outages or corruption events.

- Set up **geo-redundant storage** and regional failover support.

## 4. Cloud Operations / Site Reliability Engineer (SRE)

**Primary Focus:** Reliability, uptime, and incident response.

**Duties:**

- Ensure **scheduled backups run successfully** (monitoring for job
  failures).

- Create **automation scripts** to handle routine backup validation or
  alerting.

- Participate in **DR runbooks** and verify that recovery time
  objectives (RTO) and recovery point objectives (RPO) are met.

- Manage **infrastructure as code (IaC)** to ensure consistent backup
  configurations.

- Work with security teams to patch vulnerabilities in backup
  toolchains.

## 5. DevOps / Platform Engineering

**Primary Focus:** CI/CD pipelines, automation, and infrastructure
provisioning.

**Duties:**

- Integrate **backup validation** into CI/CD pipelines for critical
  stateful components.

- Use **Terraform/Ansible/Bicep** to automate backup configuration and
  DR infrastructure.

- Ensure **stateless vs. stateful workloads** are appropriately handled
  in DR plans.

- Provide **version control and traceability** of backup/DR
  configuration as code.

- Implement **DR automation** using scripts and orchestration tools
  (e.g., Azure Site Recovery, AWS CloudFormation).

## Summary Matrix

✅ = Primary responsibility \| ⚪️ = Support/Assist role

| **Responsibility Area** | **Cloud Security** | **IT/Admin** | **Cloud Admin** | **Cloud Ops** | **DevOps** |
|----|----|----|----|----|----|
| Define backup policies | ✅ | ⚪️ | ⚪️ | ⚪️ | ⚪️ |
| Implement backups | ⚪️ | ✅ | ✅ | ✅ | ✅ |
| Monitor backups | ✅ | ✅ | ✅ | ✅ | ⚪️ |
| Restore & test recovery | ⚪️ | ✅ | ✅ | ✅ | ⚪️ |
| DR planning & execution | ✅ | ✅ | ✅ | ✅ | ✅ |
| Automation & IaC | ⚪️ | ⚪️ | ⚪️ | ✅ | ✅ |
| Compliance auditing | ✅ | ⚪️ | ⚪️ | ⚪️ | ⚪️ |

# Azure Backup and Recovery

**1. Key Components**

- **Azure Backup Service**\
  Provides backup and restore capabilities for Azure resources such as
  virtual machines (VMs), files, and disks. It allows recovery at
  different granularity levels:

  - **Individual Files** – Restore specific files.

  - **VM Recovery** – Restore a full virtual machine (optionally as a
    new VM).

  - **Disk Recovery** – Restore a complete disk separately.

- **Recovery Services Vault**

  - A dedicated Azure resource to store backup data.

  - Must be in the **same region** as the VM.

  - The **first backup** is full; subsequent backups are **incremental**
    (only changed data is backed up).

- **Backup Vault**

  - An alternative vault used for newer backup scenarios (especially in
    modern RBAC and ARM-based deployments).

- **Backup Policy**

  - Defines backup schedule and retention rules.

  - Can be assigned during VM creation or later.

**2. Backup Implementation Tasks**

- Create a **Recovery Services Vault** or **Backup Vault**.

- Configure a **backup policy** (schedule, retention).

- Enable backup for VMs and apply the policy.

- **Perform backup and restore operations** using Azure Backup.

- Configure **site-to-site recovery** using **Azure Site Recovery**.

- Review and monitor **backup reports** from Azure.

**3. Notes on Backup Process**

- Backups are **non-intrusive** – the VM continues running and is
  unaffected during backup or restore.

- Backup data is securely stored in the **Recovery Services Vault**.

- Recovery points are generated periodically and used for different
  restore scenarios (e.g., daily, weekly).

# Azure Backup Service

Azure Backup is a cloud-based service that protects Azure Virtual
Machines (VMs) by creating recovery points. These recovery points allow
you to restore:

- **Individual Files** – Select specific files for recovery.

- **Full VM** – Restore the entire virtual machine, optionally as a
  duplicate.

- **Disks** – Recover individual virtual hard disks (VHDs).

**Note:** During the recovery process, the original VM remains
unaffected and fully operational.

You can enable backup during VM creation and associate it with a
**backup policy**. The backup data is stored in a separate Azure
resource called the **Recovery Services Vault**.

**Key Components**

- **Recovery Services Vault**\
  Stores backup data and metadata. Must be in the **same region** as the
  VM.

- **Backup Policy**\
  Defines the backup frequency and retention period.

## Instant Recovery Feature

- Snapshots are taken during the backup job and stored **locally with
  the VM's disk**.

- These snapshots enable **instant restore** operations without waiting
  for full backup processing.

- Useful for quick rollbacks, e.g., after a bad patch.

## Restore Options

1.  **Individual File Recovery**

    - An executable (.exe) file is downloaded.

    - This mounts a drive on the local system from the restore point
      using PowerShell.

    - After file retrieval, the drive can be unmounted from the Azure
      portal.

2.  **Full VM or Disk Recovery**

    - Restore the entire VM or selected disk as a new resource.

## Soft Delete Feature

- Protects backup data from accidental or malicious deletion.

- Keeps deleted backup data for **14 days** by default, even after
  stopping backup.

- To **permanently delete** backups:

  1.  Stop VM backup.

  2.  Go to **Recovery Services Vault \> Properties \> Security
      Settings**.

  3.  Disable **Soft Delete**.

  4.  Delete backup data for all VMs.

  5.  Finally, delete the Recovery Services Vault.

Without disabling Soft Delete, you **cannot delete the Recovery Services
Vault**.

# Backup Monitoring

**Monitor resources by using Azure Monitor**

- Metrics: Configuration and Interpretation

- Azure Monitor logs Configuration

- Query and Analyse logs

- Alerts and Actions: Set up

- Application Insights Configuration

Here’s a **corrected and summarized** version of your content, organized
by topic for clarity:

**1. Recovery Services Agent (MARS Agent)**

- The **Microsoft Azure Recovery Services (MARS) agent** enables backup
  of **on-premises files, folders, and system state**.

- On-premises machines must be **registered to the Recovery Services
  Vault** using the MARS agent.

- Backups from one machine can be restored to another on-premises or
  Azure VM.

**2. Azure Site Recovery (ASR) – Azure to Azure**

- Provides **disaster recovery** by replicating Azure resources to
  another region.

- During failover, resources are **recovered in a new Azure region**.

- A **cache storage account** is used to hold replicated data before
  failover is triggered.

**3. Azure VM Redeploy**

- Redeploying a VM **moves it to a new physical host** in Azure's
  infrastructure.

- All VM configurations and resources remain intact.

- **Temporary disk is lost**, and **dynamic IPs may change** after
  redeploy.

**4. Availability Set**

- A logical grouping that spreads VMs across **fault domains** and
  **update domains** to ensure high availability.

- Required to meet Azure’s **99.95% SLA** (unless using premium
  storage).

- Helps prevent single points of failure within a datacenter.

**Key Concepts:**

- **Fault Domain**:

  - Group of VMs that share the **same power source and network
    switch**.

  - If a fault domain fails, all VMs in that domain may become
    unavailable.

  - Ensures hardware-level isolation.

- **Update Domain**:

  - Group of VMs that can be **rebooted together during maintenance**.

  - Azure updates one update domain at a time to reduce downtime.

  - Assigned automatically when VMs are placed in an availability set.

**5. Availability Zones**

- **Physically separate locations** within an Azure region.

- Each zone has **independent power, cooling, and networking**.

- VMs deployed across zones offer **99.99% SLA**.

- Protects workloads against full **datacenter failures**.

**6. Virtual Machine Image**

- A **reusable template** used to deploy new VMs.

- Contains metadata and **pointers to VHDs** stored as page blobs.

- Useful for creating **identical VM deployments**.

- Source VM must be **stopped** before capturing the image.

**7. Proximity Placement Groups (PPG)**

- Ensures Azure compute resources (VMs, scale sets) are **physically
  close** in the same datacenter.

- Ideal for **low-latency** workloads.

- Not compatible with **dedicated hosts**.

- To optimize performance, enable **accelerated networking** on VMs in a
  PPG.
