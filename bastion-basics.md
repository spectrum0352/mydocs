# Azure Bastion

Not entirely. The title **"SFTP over Azure Bastion"** is potentially misleading and may be technically incorrect depending on the architecture.

### Why?

Microsoft Azure Bastion is primarily designed for:

* Browser-based SSH access to Linux VMs
* Browser-based RDP access to Windows VMs
* Native client tunneling for SSH/RDP sessions

Azure Bastion is **not a managed SFTP service** and does not natively function as an SFTP gateway for bulk file transfers in the same way that an SSH server does.

### What is actually happening?

#### Scenario 1: Direct SFTP to VM (Most Common)

```
On-Prem Server
       |
       | TCP 22
       |
Azure Firewall
       |
Linux/Windows VM (OpenSSH/SFTP)
```

In this scenario:

* SFTP is provided by the VM's OpenSSH server.
* Azure Bastion is not involved.
* This is typically the preferred architecture for automated file transfers.

The section should be renamed:

> **🔒 SFTP over SSH (Direct to Azure VM)**

or

> **🔒 SFTP to Azure VM via Azure Firewall**

---

#### Scenario 2: SFTP Through Bastion Tunnel

```
On-Prem Server
       |
Azure Bastion Tunnel
       |
Linux/Windows VM
```

This is possible only when using Azure Bastion's native client tunneling capabilities, but:

* It requires establishing a Bastion tunnel first.
* It is not commonly used for automated server-to-server file transfers.
* It introduces additional complexity.
* Throughput may be lower.

For enterprise file transfer workloads, Microsoft generally recommends VPN, ExpressRoute, or controlled SSH access rather than routing automated SFTP traffic through Bastion.

---

### Recommended Ranking

For an on-premises server transferring files to an Azure VM:

#### 1. 🔒 SFTP over SSH to Azure VM

* Most secure
* Simple architecture
* Automation friendly
* Supports Windows and Linux

#### 2. 🐧 Rsync over SSH

* Best for synchronization workloads
* Bandwidth efficient

#### 3. 📂 SMB over VPN/ExpressRoute

* Highest throughput
* Private connectivity required

#### 4. 🖥️ RDP File Transfer

* Manual transfers only
* Lowest flexibility

### Recommended Replacement Heading

Instead of:

> **🔒 SFTP over Azure Bastion (Most Secure and Flexible)**

Use:

> **🔒 SFTP over SSH to Azure VM (Most Secure and Flexible)**

or

> **🔒 SFTP to Azure VM via Azure Firewall (Most Secure and Flexible)**

These descriptions are technically accurate and better aligned with how Azure environments are typically implemented in production.

# 1. 🔒 SFTP over SSH to Azure VM (Most Secure and Flexible)

### Best For

* Secure file transfers from on-premises environments to Azure VMs
* Cross-platform environments (Windows and Linux)
* Automated file transfer workflows

### Advantages

* End-to-end encryption using SSH/SFTP
* Simpler firewall configuration compared to SMB (TCP 445)
* Cross-platform support:

  * Windows (OpenSSH)
  * Linux (native support)
* Supports automation through scripts, scheduled tasks, and CI/CD pipelines
* Works with Azure Firewall when access is restricted to trusted source IP addresses
* Supports both password and SSH key-based authentication

### Considerations

* Higher CPU utilization due to encryption
* Lower throughput than SMB-based file sharing

  * Typical transfer speeds: approximately 100–500 Mbps depending on network conditions, VM sizing, and encryption overhead
* Requires an SSH/SFTP service to be enabled on the target VM

### Implementation Steps

#### Enable SSH/SFTP on the Azure VM

**Windows Server**

```powershell
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType Automatic
```

**Linux**

```bash
sudo systemctl enable sshd
sudo systemctl start sshd
```

#### Configure Azure Firewall

Allow inbound TCP port 22 only from trusted on-premises public IP addresses or private network ranges connected through VPN or ExpressRoute.

#### Transfer Files

**Linux/macOS**

```bash
scp file.txt user@AzureVM_IP:/destination/
```

**Windows PowerShell**

```powershell
scp C:\localfile user@AzureVM_IP:/destination/
```

### Reference Architecture

```text
On-Premises Server
        │
        │ TCP 22 (SSH/SFTP)
        ▼
Azure Firewall
        │
        ▼
Azure VM (OpenSSH/SFTP Server)
```

### Security Recommendations

* Prefer SSH key-based authentication over passwords.
* Restrict TCP 22 access to trusted source IP ranges.
* Enable Microsoft Defender for Cloud recommendations and alerts.
* Log SSH authentication events using Azure Monitor and Log Analytics.
* Consider VPN or ExpressRoute for highly regulated environments.

### When to Use Azure Bastion

Azure Bastion should be used for secure administrative SSH or RDP access to Azure VMs. It is not typically used as the primary mechanism for automated server-to-server SFTP file transfers.
