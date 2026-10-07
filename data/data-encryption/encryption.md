# Virtual Machine

There are several methods to encrypt data in an Azure Virtual Machine
(VM). The main goal is to ensure the confidentiality and integrity of
the data stored on your VM. Here are some of the most common ways to
encrypt data in an Azure VM:

Azure Disk Encryption (ADE)

**Server-Side Encryption with Managed Disks**

## Azure Disk Encryption (ADE)

Azure Disk Encryption helps protect the operating system and data disks
of an Azure VM. It uses BitLocker (for Windows VMs) and DM-Crypt (for
Linux VMs) to provide volume encryption.

### How it works?

For **Windows**: BitLocker is used for OS disk encryption.

For **Linux**: DM-Crypt is used for OS disk encryption.

### How to use?

You can enable ADE on the Azure portal, through Azure PowerShell, or
using Azure CLI.

- **Enable BitLocker** for Windows VM:

- Set-AzureRmVMDiskEncryptionExtension -ResourceGroupName
  \<ResourceGroupName\> -VMName \<VMName\> -DiskEncryptionKeyVaultId
  \<KeyVaultId\> -VolumeType All

- **Enable DM-Crypt** for Linux VM:

- az vm encryption enable --name \<VMName\> --resource-group
  \<ResourceGroupName\> --keyvault \<KeyVaultName\> --volume-type ALL

<!-- -->

- **Key Vault Integration**: The encryption keys are managed in Azure
  Key Vault.

**2. Azure Key Vault**

- **Description**: Azure Key Vault is a service that securely stores and
  manages sensitive information such as encryption keys, secrets, and
  certificates. Key Vault can be used to manage the encryption keys used
  for encrypting disks, virtual machine data, and application data.

- **How it works**: Store encryption keys in Key Vault and use them to
  encrypt or decrypt data within your VM.

- **How to use**: You can integrate Azure Key Vault with Azure Disk
  Encryption, custom applications, or other services within your VM.

## Server-Side Encryption (SSE)

- **Description**: Azure Managed Disks automatically encrypt all data at
  rest using AES-256 encryption. This encryption is done on the server
  side, so you don't need to manually configure it. It works for both
  Standard and Premium disks.

- **How it works**: Data is encrypted automatically at rest without any
  extra configuration, but you can choose to use your own keys via Azure
  Key Vault if needed.

- **How to use**: This is enabled by default for all managed disks, but
  you can also opt for **Customer-Managed Keys (CMK)** for more control
  over key management.

# Storage Account

## Azure Storage Encryption

- **Description**: If you store data in Azure Storage (e.g., Blob
  Storage, File Storage), Azure provides built-in encryption for data at
  rest, using either Microsoft-managed keys or customer-managed keys.

- **How it works**: Azure Storage automatically encrypts data at rest
  using Microsoft-managed keys, and you can also use customer-managed
  keys stored in Azure Key Vault.

### How to use:

- Enable customer-managed keys for Azure Storage:

- az storage account update --name \<StorageAccountName\>
  --resource-group \<ResourceGroupName\> --encryption-key-source
  Microsoft.Keyvault --encryption-key-vault \<KeyVaultName\>
  --encryption-key-name \<KeyName\>

## Azure Data Encryption locations

- Encryption at Rest

  - Disks: Managed and Unmanaged Disks

  - Databases: SQL, MariaDB and Cosmos DB

  - Storage Accounts

- Encryption in Transit

- Encryption in Usage (Memory)

## Azure Managed Disk Encryption

- There are several types used for managed disk encryption

- There are several types used for managed disk encryption

- Azure Disk Encryption

- Server-Side Encryption

- Encryption at Host

> <img src="media/image1.png" style="width:7.41667in;height:2.21264in" />
>
> <img src="media/image2.png" style="width:7.13333in;height:3.32889in" />
>
>  
>
>   

## Check encryption status of Azure VMs

There are several types used for managed disk encryption

- Azure Disk Encryption

- Server-Side Encryption

- Encryption at Host

## Azure Disk Encryption for Linux VM

- It uses DM-Crypt feature of Linux to provide volume encryption for the
  OS and Data disks on Azure VMs.

- It is integrated with Azure Key Vault to help you control and manage
  the disk encryption keys and secrets

**ADE for Linux Prerequisites**

- ADE requires DM-Crypt and vFAT to be present on system

- Removing or disabling vFAT from the default image will prevent the
  system from reading the key volume and obtaining the key needed to
  unlock the disks on subsequent reboots.

- Before enabling encryption, the data disks to be encrypted must be
  properly listed in /etc/fstab.

- Before starting encryption, be sure to stop all services and processes
  that could be writing to mounted data disks and disable them, so that
  they do not restart automatically after a reboot. These could keep
  files open on these partitions, preventing the encryption procedure to
  remount them, causing failure of the encryption

 

### DM-Crypt

DM-Crypt is the Linux-based, transparent disk-encryption subsystem
that's used to enable disk encryption on Linux VMs.

**Network Requirements**

- To get a token to connect to your key vault, the Linux VM must be able
  to connect to an Azure Active Directory endpoint,
  \[login.microsoftonline.com\].

- To write the encryption keys to your key vault, the Linux VM must be
  able to connect to the key vault endpoint.

- The Linux VM must be able to connect to an Azure storage endpoint that
  hosts the Azure extension repository and an Azure storage account that
  hosts the VHD files.

- If your security policy limits access from Azure VMs to the Internet,
  you can resolve the preceding URI and configure a specific rule to
  allow outbound connectivity to the IPs.

>  
>
>  

### Azure Disk Encryption through Portal

Prerequisites: Key Vault and its access policy “Azure disk encryption
for volume encryption” should be enabled

**Steps to encrypt disks:**

- Azure Portal - Virtual Machine - Disks \> Additional Settings -
  Encryption settings - Disks to encrypt

- Select OS and Data disks - Select Key Vault \> Select Key for
  encryption if not available create new key.

### Azure Disk Encryption through Azure CLI

**Encrypt Azure VM**

- \#az vm encryption enable -g "MyResourceGroup" --name "myVM"
  --disk-encryption-keyvault "\<keyvault-name\>"

**Monitor encryption process**

- \#az vm encryption show --name "myVM" -g "MyResourceGroup"

### Azure Disk Encryption through PowerShell

- Encrypt VM with Set-AzVmDiskEncryptionExtension.

- Set-AzVmDiskEncryptionExtension requires some values from your Key
  Vault object

- You can obtain these values by passing the unique name of your key
  vault to Get-AzKeyvault.

\$KeyVault = Get-AzKeyVault -VaultName "\<your-unique-keyvault-name\>"
-ResourceGroupName "MyResourceGroup"

\#Set-AzVMDiskEncryptionExtension -ResourceGroupName MyResourceGroup
-VMName "MyVM" -DiskEncryptionKeyVaultUrl \$KeyVault.VaultUri
-DiskEncryptionKeyVaultId \$KeyVault.ResourceId -SkipVmBackup
-VolumeType All

You can verify the encryption process by running

\#Get-AzVmDiskEncryptionStatus -VMName MyVM -ResourceGroupName
MyResourceGroup

### Verify encryption status of Linux VM

Validate the encryption status during or after the encryption by
following ways:

- Checking the disks attached to VM

- Querying the encryption settings on each disk, whether the disk is
  attached or unattached.

**Verify disk encryption status through portal:**

- Navigate to Azure Portal - VM - Extension - Select “Azure Disk
  Encryption” extension

- Check status message and you can check in detailed status.

- Navigate to Azure Portal\> VM \> Disks \> Disk Settings \> check
  encryption status

**Verify disk encryption status through PowerShell:**

\>Get-AzVmDiskEncryptionStatus -ResourceGroupName MyResourceGroup
-VMName MyVM

**Verify encryption status for Managed disks:**

\>Get-AzDisk -ResourceGroupName \${RGNAME} -DiskName \${TARGETDISKNAME}

**Verify encryption status through Azure CLI:**

\>az vm encryption show --name \${VMNAME} --resource-group \${RGNAME}
--query "substatus “

**Operating System**

- When a partition or disk is encrypted, it is displayed as a crypt
  type.

- When it is not encrypted, it is displayed as a part/disk type.

- Enter “lsblk” command to check it.

>  
>
> **Azure Data Encryption Locations**
>
> Azure offers data encryption at various stages of its lifecycle:
>
> **Encryption at Rest:** Data is encrypted when stored on physical
> media.

- **Disks:** This includes both managed disks (provided by Azure) and
  unmanaged disks (customer-managed).

- **Databases:** Encryption applies to SQL Database, Azure Database for
  MariaDB, and Azure Cosmos DB.

- **Storage Accounts:** The data stored within these accounts can be
  encrypted.

> **Encryption in Transit:** Data is encrypted while moving between
> locations, such as between your device and Azure or between Azure
> services.
>
> **Encryption Not Covered:** The document mentions "Encryption in Usage
> (Memory)" but doesn't elaborate on Azure's specific functionalities in
> this area.
>
>  
>
> **Azure Managed Disk Encryption Options**
>
> There are three main options for encrypting Azure managed disks:

- **Azure Disk Encryption (ADE):** You manage the encryption keys and
  use them to encrypt and decrypt your disks. This offers greater
  control but requires more management overhead.

- **Server-Side Encryption (SSE):** Microsoft manages the encryption
  keys. This is the default option for most Azure managed disks and
  offers ease of use. There are two types of SSE:

  - **SSE with Microsoft-managed keys:** Microsoft manages the keys and
    protects them using robust security practices.

  - **SSE with customer-managed keys:** You provide and manage your own
    encryption keys for the disks.

- **Encryption at Host:** The encryption happens on the virtual machine
  itself before the data reaches the Azure storage layer. This offers
  additional security but requires specific configuration and may not be
  compatible with all scenarios.

>  
>
> **Checking Encryption Status of Azure VMs**
>
> To determine the encryption status of your Azure VMs, you can use
> various methods depending on the chosen encryption type:

- **Azure Disk Encryption:** Use the Azure portal, Azure CLI, or Azure
  PowerShell to check the encryption status of the VM disks.

- **Server-Side Encryption:** Encryption status is usually automatically
  reflected in the VM properties within the Azure portal.

- **Encryption at Host:** The specific method to check encryption status
  depends on the configuration used for host-based encryption.

> **Remember:** The document mentions "There are several types used for
> managed disk encryption" twice. This seems to be a repetitive
> statement.
>
>  
>
>  

<img src="media/image1.png" style="width:5in;height:1.49167in" />

>  
>
>  

<img src="media/image2.png" style="width:5in;height:2.33333in" />

>  
>
>  
>
>  
>
> **Azure Disk Encryption for Linux VM**
>
> ** **
>
> **What it does:** Encrypts the OS and data disks of your Azure VMs
> using DM-Crypt, a built-in Linux feature.
>
> ** **
>
> **Key Management:** Integrates with Azure Key Vault to securely store
> and manage the encryption keys.
>
> ** **
>
> **Prerequisites:**

- **DM-Crypt and vFAT:** Must be present on the system. Disabling vFAT
  can prevent the system from reading the key volume.

- **/etc/fstab:** Data disks to be encrypted must be listed here.

- **Stopped Services:** Stop all services writing to mounted data disks
  before encryption to avoid conflicts.

> ** **
>
> **Network Requirements:**

- Outbound connections to specific Azure endpoints are required for
  authentication, key storage, and extension/VM image access.

> ** **
>
> **Enabling Encryption:**

- **Azure Portal:**

  - Select the VM and navigate to Disks \> Encryption settings.

  - Choose disks to encrypt and select/create a Key Vault for the
    encryption key.

- **Azure CLI:** Use the az vm encryption enable command to enable
  encryption for a VM.

- **PowerShell:** Use the Set-AzVmDiskEncryptionExtension cmdlet to
  configure encryption.

> ** **
>
> **Verifying Encryption Status:**

- **Azure Portal:**

  - Go to VM Extensions and check the status of the "Azure Disk
    Encryption" extension.

  - Navigate to VM Disks and view the encryption status under Disk
    Settings.

- **PowerShell:** Use the Get-AzVmDiskEncryptionStatus cmdlet.

- **Azure CLI:** Use the az vm encryption show command.

- **OS Check:** Encrypted disks appear as crypt type using the lsblk
  command. Non-encrypted disks appear as part/disk.

> ** **
>
> **Additional Notes:**

- Ensure proper access policy is configured for your Key Vault.

- Booting an encrypted VM requires the encryption key to be unlocked.

>  
>
>  
>
>  
>
> **Encryption at Rest in Azure**
>
> Encryption at rest refers to the process of securing data while it's
> stored on a disk (HDD/SSD) or backup media. Azure utilizes symmetric
> encryption to achieve this:

- **Single Key for Encryption/Decryption:** A single key both encrypts
  data when written to storage and decrypts it for use.

- **Potential Key Partitioning:** Data can be divided, with different
  keys used for each section.

- **Secure Key Storage:** Encryption keys are stored in secure locations
  with access controls and audit logs. Additionally, if keys reside
  outside these secure locations, they are themselves encrypted with a
  separate key kept in a highly secure environment.

- Encryption at rest protects data stored on disks by scrambling it with
  a key.

- This makes the data unreadable if someone gains physical access to the
  storage device.

- It's a mandatory requirement for compliance with some regulations.

>  
>
> **Purpose of Encryption at Rest**
>
> Encryption at rest safeguards data stored on disks or backups from
> unauthorized access. Here are the key benefits:

- **Protection from Physical Breaches:** Prevents attackers who gain
  physical access to storage devices from easily accessing the data.
  Even if a hard drive is stolen, the data remains encrypted without the
  decryption key.

- **Regulatory Compliance:** Encryption at rest helps organizations meet
  industry and government regulations like HIPAA, PCI, and FedRAMP that
  mandate data protection through encryption.

- **Defense-in-Depth Security:** Provides an extra layer of security in
  case other security measures fail. Even with physical access or
  security vulnerabilities, attackers face a significant hurdle in
  decrypting the data.

- **Commitment from Microsoft:** Microsoft is actively working to
  encrypt all customer data at rest by default and offers control over
  encryption keys and access logs.

- Provides additional security for stored data.

- Helps organizations meet compliance requirements.

>  
>
> **How Encryption at Rest works?**

- Symmetric encryption keys are used to encrypt and decrypt data.

- Azure Key Vault used as a secure location to stores and manages these
  keys.

- Data Encryption Key (DEK) encrypts specific data partitions.

- Key Encryption Key (KEK) encrypts the DEKs for additional security.

>  
>
> **Encryption at Rest for Different Cloud Services**

- Azure offers Encryption at Rest for all cloud service models (SaaS,
  PaaS, IaaS).

- IaaS uses Azure Disk Encryption for virtual machines.

- Developers can leverage Azure Key Vault and managed identities for
  custom solutions.

>  
>
>  
>
> **Data encryption in Azure SQL Database**
>
> There are 2 ways to encrypt data in SQL DB

- **Transparent Data Encryption (TDE)** encrypts entire database, both
  data and log files at rest on server side. Recommended approach for
  most scenarios as its automatic and transparent apps. Configuration:
  Azure Portal - SQL Server - Security blade - Transparent data
  encryption - Click "On". Need to configure TDE protector key, which
  can be server master key or customer managed key in Key Vault.

- **Client Side encryption** involves encrypting data before its sent to
  database server and decrypting it before its retrieved. You have
  control over encryption process and encryption keys.

>  

| **Feature** | **TDE (Server-side encryption)** | **Client-side encryption** |
|----|----|----|
| **Encryption Location** | Encrypts data at rest on the server-side | Encrypts data on the client-side before sending and after receiving from the server |
| **Management Responsibility** | Managed by Microsoft | Managed by you (the application) |
| **Transparency to Applications** | Transparent, applications don't need to be modified | Applications need to be modified to handle encryption and decryption |
| **Key Management** | Uses a server-level master key or customer-managed key in Azure Key Vault | You manage the encryption keys |
| **Performance Impact** | Might cause slight performance overhead | Can have a larger performance impact depending on the implementation |

>  
>
>  
>
> **Data encryption in Azure VM**
>
> There are two main approaches to configure data encryption for Azure
> VMs:
>
> **1. Azure Disk Encryption (ADE):** This is the recommended approach
> for most scenarios and encrypts the entire Azure virtual machine disk
> (OS and data disks) at rest. Here's how to configure ADE:
>
> **Prerequisites:**

- An Azure Key Vault to store and manage your disk encryption keys. You
  can create a new Key Vault during the VM deployment process.

> **Configuration Methods:**

- **Azure portal:**

  1.  Go to the Azure portal and navigate to your virtual machine.

  2.  Select "Disks" under Settings.

  3.  Choose the disks you want to encrypt and click "Enable
      encryption".

  4.  Select a key vault and key for encryption, or create a new one if
      needed.

  5.  Review and confirm the configuration.

- **Azure CLI or PowerShell:**

  1.  Use Azure CLI or PowerShell cmdlets to configure ADE during VM
      deployment or for existing VMs. These tools offer more scripting
      flexibility.

  2.  Refer to Microsoft documentation for detailed command examples:

  - Azure CLI:
    [<u>https://learn.microsoft.com/en-us/azure/virtual-machines/windows/disk-encryption-cli-quickstart</u>](https://learn.microsoft.com/en-us/azure/virtual-machines/windows/disk-encryption-cli-quickstart)

  - Azure PowerShell:
    [<u>https://learn.microsoft.com/en-us/azure/virtual-machines/windows/disk-encryption-powershell-quickstart</u>](https://learn.microsoft.com/en-us/azure/virtual-machines/windows/disk-encryption-powershell-quickstart)

>  
>
> **2. Azure Disk Encryption with BitLocker:** This approach utilizes
> BitLocker Drive Encryption, a Windows security feature, to encrypt the
> OS disk of a Windows VM. It requires additional configuration steps
> compared to ADE. Here's a general overview:

- **Prerequisites:**

  - A Windows VM with BitLocker supported (Windows 10 Pro or later,
    Windows Server 2016 or later).

  - Azure Key Vault for key management (similar to ADE).

- **Configuration Steps:** (Involves manual configuration on the VM)

  - Enable BitLocker on the OS disk.

  - Configure BitLocker to use a key stored in Azure Key Vault.

  - Configure automatic unlocking of the OS disk during VM startup using
    a Key Encryption Key (KEK) stored in Azure Key Vault.

> **Important Considerations:**

- **Choose the right encryption method:** ADE is generally simpler and
  recommended for most cases. BitLocker with Azure Key Vault offers more
  granular control but requires additional configuration on the VM.

- **Key Management:** Ensure proper key management practices in Azure
  Key Vault.

- **Backups:** Backups of encrypted disks are also encrypted. Have a
  plan to restore backups if needed.

> **Additional Resources:**
>
> **Microsoft documentation on Azure Disk Encryption:
> [<u>https://learn.microsoft.com/en-us/azure/virtual-machines/windows/disk-encryption-overview</u>](https://learn.microsoft.com/en-us/azure/virtual-machines/windows/disk-encryption-overview)**

- Azure Key Vault for key management:
  [<u>https://learn.microsoft.com/en-us/azure/key-vault/</u>](https://learn.microsoft.com/en-us/azure/key-vault/)

>  
>
>  
>
> **How to configure data encryption for Azure Storage Account?**
>
> Azure Storage Accounts offer two primary data encryption methods:
>
> **1. Client-side encryption:** This approach involves encrypting your
> data before uploading it to Azure Storage and decrypting it after
> download. You have complete control over the encryption process and
> keys. Here's a breakdown:

- **Implementation:** Encryption and decryption are handled within your
  application code using libraries provided by Azure Storage client
  libraries for various programming languages (e.g., .NET, Java,
  Python).

- **Benefits:**

  - Granular control over encryption keys and algorithms.

  - Potentially better performance compared to server-side encryption
    (SSE).

- **Drawbacks:**

  - Requires development effort to implement encryption/decryption logic
    in your application.

  - Security depends on managing your own encryption keys.

>  
>
> **2. Server-side encryption (SSE):** Azure Storage offers two options
> for server-side encryption:

- **Storage Service Encryption (SSE):** (Currently in preview)

  - Encrypts your data at rest on the server-side using
    Microsoft-managed keys.

  - Offers a transparent encryption option with minimal configuration
    required.

  - Not yet generally available, so refer to Microsoft documentation for
    updates on its availability:
    [<u>https://learn.microsoft.com/en-us/azure/storage/common/storage-service-encryption</u>](https://learn.microsoft.com/en-us/azure/storage/common/storage-service-encryption)

- **Customer-managed keys with SSE:**

  - Encrypts your data at rest with keys you manage in Azure Key Vault.

  - Provides greater control over key management and access.

  - Requires configuring your storage account to use a specific key from
    Azure Key Vault.

> **Configuration for Customer-managed keys with SSE:**

1.  **Azure portal:**

    - **Navigate to your storage account in the Azure portal.**

    - **Go to "Security + networking" and select "Encryption".**

    - **Choose "Customer-managed key" and select an existing key or
      create a new one in Azure Key Vault.**

    - **Save the configuration.**

2.  **Azure CLI or PowerShell:**

    - **Use Azure CLI or PowerShell cmdlets to configure
      customer-managed keys with SSE for new or existing storage
      accounts.**

    - **Refer to Microsoft documentation for specific commands:**

    - **Azure CLI:
      [<u>https://learn.microsoft.com/en-us/azure/storage/common/customer-managed-keys-overview</u>](https://learn.microsoft.com/en-us/azure/storage/common/customer-managed-keys-overview)**

    - **Azure PowerShell:
      [<u>https://learn.microsoft.com/en-us/azure/storage/common/customer-managed-keys-overview</u>](https://learn.microsoft.com/en-us/azure/storage/common/customer-managed-keys-overview)**

> **Choosing the Right Option:**

- **Client-side encryption** is ideal if you need granular control over
  encryption keys and algorithms, or have specific compliance
  requirements.

- **Server-side encryption (SSE):**

  - **Storage Service Encryption (SSE) (preview):** Choose this for a
    transparent encryption option with minimal configuration (when
    generally available).

  - **Customer-managed keys with SSE:** This is a good option if you
    prefer Microsoft to handle data encryption but want to manage your
    own encryption keys for added control.

> **Additional Considerations:**

- **Key Management:** If using customer-managed keys, ensure proper key
  management practices in Azure Key Vault.

- **Data Backups:** Backups of encrypted data are also encrypted. Have a
  plan to restore encrypted backups if needed.

> **Remember:** Refer to Microsoft documentation for the latest
> information and detailed instructions on configuring data encryption
> for Azure Storage Accounts.
>
>  
>
>  
>
>  
>
> **How to configure data encryption for Azure Containers?**
>
>  
>
> **How to configure data encryption for Azure Cache for Redis?**
>
>  
>
> **How to configure data encryption for Azure Cosmos DB?**
>
>  
>
>  
>
> **How to configure data encryption for Azure SQL managed instance?**
>
>  
>
>  
>
>  
>
> **How to configure data encryption for Azure Backup?**
>
>  
>
>  
>
> **How to configure data encryption for Azure Data lake storage?**
>
>  
>
>  
>
>  
>
> You need to enable encryption at rest by using customer-managed keys
> (CMKs). Which two services support CMKs? Each correct answer presents
> a complete solution.
>
> **Azure Blob storage - support CMKs**
>
> Azure Disk Storage
>
> **Azure Files** - **support CMKs**
>
> Azure NetApp Files
>
> Log Analytics workspace
>
>  
>
> [<u>Azure Storage encryption for data at
> rest</u>](https://learn.microsoft.com/azure/storage/common/storage-service-encryption)
>
> [<u>Deploy and secure Azure Key
> Vault</u>](https://learn.microsoft.com/training/modules/azure-key-vault/)
>
>  
>
>  
>
> You have an application that runs on-premises and stores data in an
> Azure SQL database. You need to ensure that certain columns stored in
> the database can only be decrypted by the application and cannot be
> accessed by users managing Azure SQL. What should you enable for the
> database?
>
> **Always Encrypted - saves encrypted data and only client driver can
> decrypt it.**
>
> Dynamic data masking - do not encrypt data, it just masks data and
> still allows users to unmask it at database if have permissions.
>
> Symmetric key encryption - uses key stored in SQL database, and not
> the client application
>
> Transparent Data Encryption (TDE) - allows users managing database to
> see data.
>
>  
>
> [<u>Always Encrypted - SQL
> Server</u>](https://learn.microsoft.com/sql/relational-databases/security/encryption/always-encrypted-database-engine?view=sql-server-ver16)
>
> [<u>Plan and implement security for Azure SQL Database and Azure SQL
> Managed
> Instance</u>](https://learn.microsoft.com/training/modules/security-azure-sql-database-azure-sql-managed-instance/)
>
>  
>
> You have an Azure SQL database that contains sensitive information.
> You need to ensure that when sensitive information is queried by
> operators, the data is not fully displayed.
>
> What should you enable for the database?
>
> Always Encrypted - Always Encrypted saves the encrypted data and only
> the client driver can decrypt it
>
> **Dynamic data masking - Dynamic data masking masks the data from
> users.**
>
> Symmetric key encryption - uses keys stored in a SQL database, not the
> client application.
>
> Transparent Data Encryption (TDE) - TDE still allows users managing
> the database to see data.
>
>  
>
> [<u>Azure portal: Dynamic data masking - Azure SQL
> Database</u>](https://learn.microsoft.com/azure/azure-sql/database/dynamic-data-masking-configure-portal?view=azuresql)
>
> [<u>Plan and implement security for Azure SQL Database and Azure SQL
> Managed
> Instance</u>](https://learn.microsoft.com/training/modules/security-azure-sql-database-azure-sql-managed-instance/)
>
>  
>
> You need to provide public anonymous access to a file in an Azure
> Storage account. The solution must follow the principle of least
> privilege. Which two actions should you perform? Each correct answer
> presents part of the solution.
>
> For the container, set public access level to Blob.
>
> For the container, set public access level to Container.
>
> For the storage account, set Blob public access to Disabled.
>
> For the storage account, set Blob public access to Enabled.
>
>  
