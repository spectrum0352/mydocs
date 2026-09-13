 Identity & Guest Configuration

Enable system-assigned managed identity on all VMs
Ensure Guest Configuration assignments use system-assigned managed identity
Add system-assigned managed identity even when a user-assigned identity exists
Deploy Guest Configuration extension on all VMs
Deploy:
Linux Guest Configuration extension on Linux VMs
Windows Guest Configuration extension on Windows VMs
Install Guest Attestation extension on:
Supported Linux VMs
Supported Linux VM Scale Sets
Supported Windows VMs
Supported Windows VM Scale Sets
 

Vulnerability & Threat Protection

Enable Vulnerability Assessment on all virtual machines
Enable Microsoft Defender for Servers
Resolve all secret findings
Ensure machines meet Azure Compute Security Baseline:
Linux VMs
Windows VMs
 

OS Authentication & Hardening

Linux

Require SSH key-based authentication
Disable password-based remote access
Ensure no Linux accounts exist without passwords
Set /etc/passwd file permissions to 0644
Use only signed and trusted boot components
Periodically check for missing system updates
Windows

Enforce password complexity
Enforce minimum password length
Enforce minimum password age
Enforce maximum password age
Prevent password reuse (password history)
Disable reversible password encryption
Enable Windows Defender Exploit Guard
Enforce secure communication protocols
Enable Secure Boot on supported VMs
 

Disk & Encryption

Enable Encryption at Host for VMs and VM Scale Sets
Enable Azure Disk Encryption or EncryptionAtHost:
Linux VMs
Windows VMs
Use double encryption for managed disks:
Platform-managed keys
Customer-managed keys (CMK)
Enable vTPM on supported virtual machines
 

Network Security

Restrict all network ports via NSGs
Apply NSGs to:
Internet-facing VMs
Non-internet-facing VMs
Disable IP forwarding on all VMs
Close all management ports by default
Protect management ports using Just-In-Time (JIT) access
Ensure no unrestricted inbound rules exist
 

Monitoring & Telemetry

Install Network Traffic Data Collection Agent on:
Linux VMs
Windows VMs
Ensure system updates are installed via Azure Update Center
Configure machines to periodically check for missing updates
 

Backup & Resilience

Enable Azure Backup for all virtual machines
Audit and remediate VMs without disaster recovery configured
 

VM Platform & Lifecycle

Migrate legacy VMs to Azure Resource Manager
Ensure VM Image Builder templates use Private Link
Avoid legacy or classic VM resources
 

Summary – Mandatory Baseline

No public access without NSGs
No password-based SSH
No unencrypted disks
No unmanaged identities
No VMs without monitoring, backup, or Defender
No deviation from Azure Compute Security Baseline


