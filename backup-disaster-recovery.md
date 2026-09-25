# Monitor and back up Azure resources (10–15%)

## Monitor resources by using Azure Monitor

- Metrics: Configuration and Interpretation

- Azure Monitor logs Configuration

- Query and Analyse logs

- Alerts and Actions: Set up

- Application Insights Configuration

## Implement backup and recovery

- create a Recovery Services vault

- perform backup and restore operations by using Azure Backup

- perform site-to-site recovery by using Azure Site Recovery

- configure and review backup reports

>  

## Azure Backup Service

It is a service to take backup of your Azure virtual machines. You can
restore the virtual machine using the Azure backup service. There are
recovery points being created every time the backup happens, like today
recovery point, tmrw recovery point, last week recovery point, etc. When
you choose recovery point, you can decide what kind of data you want to
recover like:

- Individual Files – you can choose files which you want to recover

- VM Recovery – you can recover whole VM and create a duplicate VM

- Disk Recovery – you can recover a whole disk and save it separately

When you are recovering data, at no point in time you are connected to
the virtual machine, whose data got backed up. The VM will be running
separately without any impact on it. At the time of creation of virtual
machine, you can select if you want to enable backup for the virtual
machine and select and configure the backup policy as well. There are
two major separate services which are a part of Azure Backup service:

- Azure Recovery Services Vault

- Backup Policy

Note: When you take backup, the backup data is being stored in “Azure
Recovery Services Vault”. It is a separate resource in Azure.

**Backup policy Configuration**

**Backup Vault Creation**

## Azure Recovery Services Vault

- Azure Recovery Services Vault should be in the same region as the
  Azure VM.

- During the first backup, all the data from the underlying disk will be
  taken as backup onto “Recovery Services Vault”.

- Next backup will be subsequent in nature, and only the changes or new
  data will be backed up

## Backup Policy

- Backup policy is to configure to schedule the backup process

- You can mention the retention period of the backup data as well

- During the first backup, an extension gets installed on the virtual
  machine

- The type of extension depends upon the type of virtual machine
  operating system, like for Windows or for Linux

- This extension is used to take a snapshot of the disk attached to the
  virtual machine

- For Windows based VM’s, the backup service works with the “Windows
  Volume Shadow Copy Service” that can be used to take an application
  consistent snapshot of the virtual machine

- For Linux based VM’s, the service takes a file-consistent backup

**Backup Snapshot Types**

- Application Consistent:

<!-- -->

- It captures the memory content, pending I/O operations

- It ensures that whatever is the state of the application at that point
  in time when the backup is being taken is consistent when a restore is
  taken from the backup

<!-- -->

- File System Consistent • It takes a snapshot of all the files at the
  same time

- Crash Consistent • This happens when the virtual machine shuts down at
  the time of backup process

**Instant Recovery Feature**

- Snapshots taken as a part of the backup job are stored along with the
  disk and are available for recovery instantly. Once the snapshot phase
  is done, users can go ahead and use the local snapshot to restore if
  the patch goes bad.

- The instant recovery feature basically goes out and takes a snapshot
  of the VM itself and stores it locally within the virtual machine
  itself.

> **Restore Options**
>
> <img src="media/image1.png" style="width:5in;height:2.98333in" />
>
>  
>
>  

**Restore individual files**

- The drive gets created on your local machine, and from that you can
  take the files.

- The \*.exe file will be created, which will run PowerShell on local
  system to make new drives on your host from restore point.

- Once the activity done, you can unmount those drive on the Azure
  portal itself.

**Soft Delete**

- Soft delete protects backup data from accidental deletes

- Soft delete is a feature which keeps your backup files for 14 days.

- Even if you stop the backup of a VM, still the backup of a particular
  VM would be available for 14 days in the recovery services vault

- Soft delete option must be disabled to delete the saved backups in the
  recovery services vault

**Soft Delete Steps:**

- Stop the backup of the VM

- Go to \> Recovery Services Vault \> Properties \> Security Settings \>
  Soft Delete \> disable soft delete

- Even if you stop and delete the backup data, you still won’t be able
  to delete the recovery services vault for 14 days

- Then delete the backup of all the VM’s

- Then delete the recovery services vault, without disable of soft
  delete, you wouldn’t had been able to delete the recovery services
  vault.

>  
>
>  

# Azure backup and recovery

- create a Recovery Services vault

- create a Backup vault

- create and configure backup policy

- perform backup and restore operations by using Azure Backup

- perform site-to-site recovery by using Azure Site Recovery

- configure and review backup reports

 

## Azure Backup Service

- It is a service to take backup of your Azure virtual machines. You can
  restore the virtual machine using the Azure backup service.

- There are recovery points being created every time the backup happens,
  like today recovery point, tmrw recovery point, last week recovery
  point, etc.

- When you choose recovery point, you can decide what kind of data you
  want to recover like:

  - Individual Files – you can choose files which you want to recover

  - VM Recovery – you can recover whole VM and create a duplicate VM

  - Disk Recovery – you can recover a whole disk and save it separately

- When you are recovering data, at no point in time you are connected to
  the virtual machine, whose data got backed up.

- The VM will be running separately without any impact on it.

- At the time of creation of virtual machine, you can select if you want
  to enable backup for the virtual machine and select and configure the
  backup policy as well

- There are two major separate services which are a part of Azure Backup
  service:

  - Azure Recovery Services Vault

  - Backup Policy

- Note: When you take backup, the backup data is being stored in “Azure
  Recovery Services Vault”. It is a separate resource in Azure.

>  

## Azure Recovery Services Vault

- The “Azure Recovery Services Vault” should be in the same region as
  the Azure virtual machine

- During the first backup, all the data from the underlying disk will be
  taken as backup onto “Recovery Services Vault”

- The next backup will be subsequent in nature, and only the changes or
  new data will be backed up

## Backup Policy

- Backup policy is to configure to schedule the backup process

- • You can mention the retention period of the backup data as well

- During the first backup, an extension gets installed on the virtual
  machine

- The type of extension depends upon the type of virtual machine
  operating system, like for Windows or for Linux

- This extension is used to take a snapshot of the disk attached to the
  virtual machine

- For Windows based VM’s, the backup service works with the “Windows
  Volume Shadow Copy Service” that can be used to take an application
  consistent snapshot of the virtual machine

- For Linux based VM’s, the service takes a file-consistent backup

- Types of Snapshots are:

  - Application Consistent:

    - It captures the memory content, pending I/O operations

    - It ensures that whatever is the state of the application at that
      point in time when the backup is being taken is consistent when a
      restore is taken from the particular backup

  - File System Consistent • It takes a snapshot of all the files at the
    same time

  - Crash Consistent • This happens when the virtual machine shuts down
    at the time of backup process

- **Instant Recovery Feature**

- Snapshots taken as a part of the backup job are stored along with the
  disk and are available for recovery instantly. Once the snapshot phase
  is done, users can go ahead and use the local snapshot to restore if
  the patch goes bad.

- The instant recovery feature basically goes out and takes a snapshot
  of the VM itself and stores it locally within the virtual machine
  itself.

- **Restore Options**

> <img src="media/image1.png" style="width:5in;height:2.98333in" />
>
>  
>
>  

- **Restore individual files:**

  - The drive gets created on your local machine, and from that you can
    take the files.

  - The \*.exe file will be created, which will run on PowerShell on
    local system to make new drives on your host from the restore point

  - Once the activity done, you can unmount those drive on the Azure
    portal itself

- **Soft Delete**

  - Soft delete protects backup data from accidental deletes

  - Soft delete is a feature which keeps your backup files for 14 days.

  - Even if you stop the backup of a VM, still the backup of a
    particular VM would be available for 14 days in the recovery
    services vault

  - Soft delete option must be disabled to delete the saved backups in
    the recovery services vault

- **Soft delete steps:**

  1.  Stop the backup of the VM

  2.  Go to \> Recovery Services Vault \> Properties \> Security
      Settings \> Soft Delete \> disable soft delete

  3.  Even if you stop and delete the backup data, you still won’t be
      able to delete the recovery services vault for 14 days

  4.  Then delete the backup of all the VM’s

  5.  Then delete the recovery services vault, without disable of soft
      delete, you wouldn’t had been able to delete the recovery services
      vault.

## MARS Agent / Azure Backup Agent / Azure Recovery Services Agent

- This agent helps you to take backup of services/files/folders of
  on-premises host as well.

- You must register your on-prem machine with Azure Recovery Services
  vault by using a MARS agent.

- You can also use the 1st on-prem machine backup and restore it onto
  2nd on-prem/VM machine as well.

### Azure to Azure Site Recovery 

- This service recovers every resource which you choose to a new Azure
  location, in case of a primary site goes down.

- This requires a Cache storage for keeping all the recovery in it, and
  once you do a failover, then everything will be copied from Cache
  storage, and will be restored to a new Azure site

### Azure Redeploy VM

- Azure Redeploy When you redeploy a VM, it moves the VM to a new node
  within the Azure infrastructure and then powers it back on.

- All your configuration options and associated resources are retained.

- After you redeploy a VM, the temporary disk is lost, and dynamic IP
  addresses associated with virtual network interface are updated.

### Availability Set 

An availability set is a logical grouping of VMs that allows Azure to
understand how your application is built to provide for redundancy and
availability.

- We recommended that two or more VMs are created within an availability
  set to provide for a highly available application and to meet the
  99.95% Azure SLA.

- Availability Sets ensure that the Azure virtual machines are deployed
  across multiple isolated hardware nodes in a cluster.

- By deploying your VMs across multiple hardware nodes Azure ensures
  that if hardware or software failure happens within Azure, only a
  sub-set of your virtual machines are impacted, and your overall
  solution is safe and in working condition.

- Availability set provides redundancy for your virtual machines.

- Availability set spreads your virtual machines across multiple fault
  domains and update domains.

- If you want to leverage Microsoft’s 99.95% SLA from Microsoft, you
  must place your VMs inside availability set except your VMs are having
  premium storage.

 

**Update Domain**

- An update domain is a group of resources that can be updated and
  rebooted if required at the same time.

- Virtual machines get update domains automatically once they are put
  inside availability set.

- All virtual machines within that update domain will reboot together.

- Update domains are used for patching of the virtual machines.

- Only one update domain would be updated at the time

**Fault Domain**

- Fault domains define the group of virtual machines that share a common
  power source and network switch.

- Each fault domain contains some racks, and each rack contains virtual
  machine.

- Each of these Fault domain shares a power supply and a network switch.

- If there is a failure in the fault domain then all the resources in
  the fault domain become unavailable.

- You should place your VMs such a way that each fault domain gets one
  web server, one database server and like that.

### Availability Zones

- Availability Zones are unique physical locations within an Azure
  region.

- Each zone is made up of one or more datacenters equipped with
  independent power, cooling, and networking.

- Using Availability Zones, you can be guaranteed an availability of
  99.99% for your virtual machines.

- You need to ensure that you have 2 or more virtual machines running
  across multiple availability zones.

- These features help provides better availability for your application
  by protecting them from datacenter failures.

- Each Availability zone is a unique physical location in an Azure
  region.

- Each zone comprises of one or more data centers that has independent
  power, cooling, and networking Hence the physical separation of the
  Availability Zones helps protect applications against data center
  failures

### Virtual Machine Image

- It captures the disk properties (such as host caching) you need in
  order to deploy a VM in a reusable unit.

- Like OS Images, a VM Image is a collection of metadata and pointers to
  a set of VHDs (one VHD per disk) stored as page blobs in Azure
  Storage.

- This helps you to create an image of a virtual machine, which later
  can be used to create new virtual machines

- The virtual machine from which the image has been created, cannot be
  used and has to stopped.

>  

### Proximity Placement Groups

- A proximity placement group is a logical grouping used to make sure
  that Azure compute resources are physically located close to each
  other.

- Proximity placement groups are useful for workloads where low latency
  is a requirement. Proximity placement groups cannot be used with
  dedicated hosts.

- If you want to ensure that the virtual machine is placed closer to
  each other in the same data center, then make ensure the virtual
  machines are all part of the same proximity group.

- Placing the virtual machines as a part of a proximity group, the
  virtual machines will be physically located closed to each other

- While using proximity placement groups, ensure the virtual machine
  have accelerated networking enabled. This improves the network
  performance

# Backup Service

It is a service to take backup of your Azure virtual machines. You can
restore the virtual machine using the Azure backup service. There are
recovery points being created every time the backup happens, like today
recovery point, tmrw recovery point, last week recovery point, etc. When
you choose recovery point, you can decide what kind of data you want to
recover like:

- Individual Files – you can choose particular files which you want to
  recover

- VM Recovery – you can recover whole VM and create a duplicate VM

- Disk Recovery – you can recover a whole disk and save it separately

When you are recovering data, at no point in time you are actually
connected to the virtual machine, whose data got backed up. The VM will
be running separately without any impact on it. At the time of creation
of virtual machine, you can select if you want to enable backup for the
virtual machine and select and configure the backup policy as well.
There are two major separate services which are a part of Azure Backup
service:

- Azure Recovery Services Vault

- Backup Policy

Note: When you take backup, the backup data is being stored in “Azure
Recovery Services Vault”. It is a separate resource in Azure.

Configure backup and recovery

- create a Recovery Services vault

- create a Backup vault

- create and configure backup policy

- perform backup and restore operations by using Azure Backup

- perform site-to-site recovery by using Azure Site Recovery

- configure and review backup reports

Backup Policy

- Backup policy is to configure to schedule the backup process

- • You can mention the retention period of the backup data as well

- During the first backup, an extension gets installed on the virtual
  machine

- The type of extension depends upon the type of virtual machine
  operating system, like for Windows or for Linux

- This extension is used to take a snapshot of the disk attached to the
  virtual machine

- For Windows based VM’s, the backup service works with the “Windows
  Volume Shadow Copy Service” that can be used to take an application
  consistent snapshot of the virtual machine

- For Linux based VM’s, the service takes a file-consistent backup

- Types of Snapshots are:

  - Application Consistent:

    - It captures the memory content, pending I/O operations

    - It ensures that whatever is the state of the application at that
      point in time when the backup is being taken is consistent when a
      restore is taken from the particular backup

  - File System Consistent • It takes a snapshot of all the files at the
    same time

  - Crash Consistent • This happens when the virtual machine shuts down
    at the time of backup process

Instant Recovery Feature

- Snapshots taken as a part of the backup job are stored along with the
  disk and are available for recovery instantly. Once the snapshot phase
  is done, users can go ahead and use the local snapshot to restore if
  the patch goes bad.

- The instant recovery feature basically goes out and takes a snapshot
  of the VM itself and stores it locally within the virtual machine
  itself.

Restore Options

> <img src="media/image1.png" style="width:5in;height:2.98333in" />
>
>  
>
>  

Restore individual files:

- The drive gets created on your local machine, and from that you can
  take the files.

- The \*.exe file will be created, which will run on PowerShell on local
  system to make new drives on your host from the restore point

- Once the activity done, you can unmount those drive on the Azure
  portal itself

Soft Delete

- Soft delete protects backup data from accidental deletes

- Soft delete is a feature which keeps your backup files for 14 days.

- Even if you stop the backup of a VM, still the backup of a particular
  VM would be available for 14 days in the recovery services vault

- Soft delete option must be disabled to delete the saved backups in the
  recovery services vault

Soft delete steps:

- Stop the backup of the VM

- Go to \> Recovery Services Vault \> Properties \> Security Settings \>
  Soft Delete \> disable soft delete

- Even if you stop and delete the backup data, you still won’t be able
  to delete the recovery services vault for 14 days

- Then delete the backup of all the VM’s

- Then delete the recovery services vault, without disable of soft
  delete, you wouldn’t had been able to delete the recovery services
  vault.

>  
>
>  
>
>  

# Describe basic security capabilities in Azure

describe Azure Network Security groups

describe Azure DDoS protection

describe what Azure Firewall is

describe what Azure Bastion is

describe what Web Application Firewall is

describe ways Azure encrypts data

# Implement platform protection (15-20%)

## Implement advanced network security

secure the connectivity of hybrid networks

secure the connectivity of virtual networks

create and configure Azure Firewall

create and configure Azure Firewall Manager

create and configure Azure Application Gateway

create and configure Azure Front Door

create and configure Web Application Firewall (WAF)

configure a resource firewall, including storage account, Azure SQL,
Azure Key Vault, or Azure App Service

configure network isolation for Web Apps and Azure Functions

implement Azure Service Endpoints

implement Azure Private Endpoints, including integrating with other
services

implement Azure Private Links

implement Azure DDoS Protection

## Implement advanced network security

secure the connectivity of hybrid networks

secure the connectivity of virtual networks

create and configure Azure Firewall

create and configure Azure Firewall Manager

create and configure Azure Application Gateway

create and configure Azure Front Door

create and configure Web Application Firewall (WAF)

configure a resource firewall, including storage account, Azure SQL,
Azure Key Vault, or Azure App Service

configure network isolation for Web Apps and Azure Functions

implement Azure Service Endpoints

implement Azure Private Endpoints, including integrating with other
services

implement Azure Private Links

implement Azure DDoS Protection

 

# Monitor Backups using Azure Monitor

Metrics: Configuration and Interpretation

Azure Monitor logs Configuration

Query and Analyse logs

Alerts and Actions: Set up

Application Insights Configuration

 

# Recovery Services Vault

The “Azure Recovery Services Vault” should be in the same region as the
Azure virtual machine. During the first backup, all the data from the
underlying disk will be taken as backup onto “Recovery Services Vault”.
The next backup will be subsequent in nature, and only the changes or
new data will be backed up
