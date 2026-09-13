# Remote Access to Azure Linux VMs

Secure remote access to Azure Linux virtual machines (VMs) requires proper identity and access management, network prerequisites, and the right authentication method. This guide covers best practices, limitations, and flexible options for connecting to Azure Linux VMs.

1. Identity and Access Management

a. Azure Identity Services

Microsoft Entra: Used for identity management (formerly Azure AD).
Azure Role-Based Access Control (RBAC): Controls access to VMs.
Users must have one of the following roles assigned in Azure RBAC:
Virtual Machine Administrator Login
Virtual Machine User Login
b. Prerequisites

i. Network Requirements

https://enterpriseregistration.windows.net – Device registration
http://169.254.169.254 – Azure Instance Metadata Service
https://login.microsoftonline.com – Authentication flows
https://pas.windows.net – Azure RBAC flows
ii. Azure VM OS Requirements

Windows 10 version 20H2 or later
Windows 11
Windows Server 2022
iii. Client/Local Machine Requirements

Remote access is supported only from Windows 10 or later devices that are registered, hybrid-joined, or joined to the same Entra ID tenant as the VM.
RDP from unsupported clients (like the Windows Store RDP client) is not allowed for Azure AD-joined VMs.
2. Limitations

Guest accounts cannot use Entra authentication to connect to Azure VMs.
Entra authentication fails if per-user MFA is enabled.
Only the built-in Windows RDP client supports Azure AD authentication for Windows VMs.
3. Logging in to Windows VMs

Format: AzureAD\username@domain.com
Steps:
Add the Entra user to the local group:
net localgroup "Remote Desktop Users" /add "AzureAD\username@domain.com"
Verify VM is Azure AD (Entra) joined:
dsregcmd /status
Output should show:

AzureAdJoined : YES
AzureAdPrt : YES
4. Remote Access to Linux VMs

a. Authentication Types

Default: Username/password
Recommended (secure & flexible): SSH key-based authentication
b. Methods to Access Linux VMs

Azure CLI
Install Azure CLI on Windows (PowerShell does not include it by default):
winget install --exact --id Microsoft.AzureCLI
Login to Azure tenant:
az login --use-device-code
Cloud Shell
Directly access Linux VM via Azure Cloud Shell in the portal.
SSH Clients (OpenSSH-supported)
Export SSH configuration for use with OpenSSH clients:
az ssh config --name <vm-name> --resource-group <rg-name> --file ./ssh_config
Connect using:
az ssh vm -n linuxvm12052025 -g rg-demo
5. Recommended Secure & Flexible Approach

For Linux VMs, the most secure and flexible method is:

SSH key-based authentication over username/password.
Azure CLI + az ssh workflow for integration with Entra/Azure AD.
Optionally, Cloud Shell for temporary access without local configuration.
For Windows VMs, the best practice is:

Use Azure AD/Entra authentication with RBAC roles via the built-in RDP client.
Avoid MFA per-user policies on accounts used for VM login, or configure Conditional Access policies.
✅ Summary Comparison

Feature / Method

Security

Flexibility

Ease of Use

Notes

Azure CLI + SSH

High

High

Medium

Supports key-based auth and scripting

Cloud Shell

Medium

High

High

No local setup needed

RDP with Entra (Windows)

High

Medium

Medium

Only built-in client supported; MFA limitations

Username/password Linux

Low

Medium

High

Less secure; not recommended for production

 

Tasks and Best Practices
Best Practice Recommendation: For Linux VMs, the most secure, flexible, and feature-rich method is SSH via Azure CLI (az ssh) using Azure AD/Entra authentication combined with system-assigned managed identities. Username/password is less secure and not recommended for production.

Task

Description

Responsible

Status

Commands / Notes

Enable System-Assigned Managed Identity

Ensure the Linux VM has a system-assigned managed identity enabled for secure authentication and access control.

Azure Admin

Not Started

az vm identity assign --name <vm-name> --resource-group <rg-name>

Install Microsoft Entra Login Extension (AADLoginForLinux)

Install the AAD login extension on the Linux VM for Entra/Azure AD authentication.

Azure Admin

Not Started

az vm extension set --publisher Microsoft.Azure.ActiveDirectory --name AADLoginForLinux --vm-name <vm-name> --resource-group <rg-name>

Configure Entra ID Role Assignment

Assign Virtual Machine Administrator Login or Virtual Machine User Login role to users for RBAC-based access.

IAM Admin

Not Started

az role assignment create --assignee <user> --role "Virtual Machine User Login" --scope <vm-id>

Ensure Outbound HTTPS to Microsoft Identity Endpoints

Allow outbound HTTPS (443) traffic to: login.microsoftonline.com, pas.windows.net, enterpriseregistration.windows.net, and 169.254.169.254 (Azure Instance Metadata Service).

Network Admin

Not Started

Configure firewall/NAT rules; no static IPs required

Client Requirements (Windows)

Ensure client devices are Windows 10/11+ and Entra registered / joined / hybrid-joined to the same tenant as the VM.

IT Support

Not Started

Verify device registration status with dsregcmd /status

Azure VM OS Requirements

Supported OS: Windows 10 20H2+, Windows 11, Server 2022.

Azure Admin

Not Started

Check with winver or System Info

Configure RDP Username Format (Windows)

Users must log in using: AzureAD\username@domain.com via built-in RDP client.

User / Helpdesk

Not Started

Enter credentials in mstsc

Add Entra ID User to Local Group (Windows)

Add user to Remote Desktop Users group for login access.

Azure Admin

Not Started

net localgroup "Remote Desktop Users" /add "AzureAD\user@domain.com"

Verify AzureAdJoin and AzureAdPrt

Confirm the VM/client is Azure AD joined and has a valid Primary Refresh Token (PRT).

User / Support

Not Started

dsregcmd /status → AzureAdJoined : YES, AzureAdPrt : YES

Install Azure CLI on Client

Install Azure CLI on the local PowerShell for SSH access.

User

Not Started

winget install --exact --id Microsoft.AzureCLI

Login to Azure/Entra Tenant

Authenticate to Azure using device code for CLI access.

User

Not Started

az login --use-device-code

Use az ssh to Access Linux VM

Connect securely to Entra-enabled Linux VM using Azure CLI SSH.

User

Not Started

az ssh vm -n <linux-vm-name> -g <resource-group>

Export SSH Config (Optional)

Optionally export SSH config for OpenSSH clients (may be unreliable).

User

Optional

az ssh config --resource-group <rg> --vm-name <vm>

Enable Logging (Optional)

Enable audit logging, Defender for Servers, or Azure Monitor for monitoring access and events.

SecOps

Optional

Configure Azure Monitor / Defender logging

Document Configuration

Maintain detailed documentation of Entra configuration, login attempts, and access control.

IT Compliance

Not Started

Store in SharePoint, Confluence, or internal IT system

✅ Key Recommendations

Most Secure & Flexible Access:
Azure CLI + az ssh with Azure AD/Entra login is highly secure, supports RBAC, integrates with managed identities, and is scriptable for automation.
Windows VM Access:
Use built-in RDP client with AzureAD login for controlled access. Avoid using MFA-per-user accounts for VM login unless using Conditional Access policies.
Linux VM Access:
SSH key + Azure CLI is preferred over username/password. Ensures auditability and Entra integration.
 


Entra for Linux VM
 

Identity, Authentication, and Access Management for Azure Virtual Machines

1. Overview

Microsoft Entra ID (formerly Azure AD) enables secure, centralized authentication for Azure Virtual Machines.

Linux VMs: Users can log in with Entra ID credentials instead of local accounts or SSH keys.
Windows VMs: Users can log in via RDP using Entra ID credentials, provided the client and VM are properly joined to the tenant.
This approach improves security, simplifies access management, and supports audit‑ready role assignments.

2. Supported Operating Systems

Linux Distros

Ubuntu 18.04 / 20.04 / 22.04 LTS
CentOS 7 / 8
RHEL 7 / 8
Debian 10 / 11
Oracle Linux 7 / 8
SUSE Linux Enterprise Server (SLES) 12 / 15
⚠️ Older or unsupported distros may require manual PAM configuration or custom workarounds.

Windows OS

Windows 10 (20H2 or later)
Windows 11
Windows Server 2022
3. High-Level Implementation Steps

Prerequisites
Assign Entra ID Roles
Enable Entra ID login on VMs
Install dependencies / extensions
Configure PAM (Linux) or Local Groups (Windows)
Validate user login
Monitoring & troubleshooting
Automation for scale (80+ VMs)
4. Step-by-Step Guide (Linux VMs)

4.1 Prerequisites

Azure subscription with Owner or User Access Administrator rights
Microsoft Entra ID tenant configured
Deployed Linux VMs with network connectivity
Azure CLI installed (or access via Azure Portal)
SSH access to VMs
OS versions compatible with Entra ID login
4.2 Role Assignment

Assign Entra ID roles to users/groups:

Virtual Machine Administrator Login
Virtual Machine User Login
Example (PowerShell):

$vmResourceId = "/subscriptions/<subID>/resourceGroups/<rg>/providers/Microsoft.Compute/virtualMachines/<vmName>"

New-AzRoleAssignment -ObjectId "<user-object-id>" -RoleDefinitionName "Virtual Machine User Login" -Scope $vmResourceId

Roles can be scoped at VM or resource group level for easier management.

4.3 Enable Entra ID Login Extension

Install the AADLoginForLinux extension:

az vm extension set \

  --publisher Microsoft.Azure.ActiveDirectory.LinuxSSH \

  --name AADLoginForLinux \

  --resource-group <resource-group> \

  --vm-name <vm-name>

Script or automate this for all 80 VMs using loops, Azure Automation, or DevOps pipelines.

4.4 Dependencies

Verify required packages:

libnss-azure
libpam-azure
curl, openssl, jq
azure-cli (optional)
4.5 Configure PAM & SSHD

The extension modifies:

/etc/ssh/sshd_config → ChallengeResponseAuthentication yes, UsePAM yes
/etc/pam.d/sshd → includes Azure AD login module
Restart SSH:

sudo systemctl restart sshd

4.6 User Login Validation

Test with an Entra ID user assigned the proper role.
SSH format:
ssh <AzureADUsername>@<TenantDomain>@<vm-ip>

or

ssh <AzureADUsername>@<vm-ip>

(depends on PAM config)

4.7 Monitoring & Troubleshooting

Extension logs:
sudo cat /var/log/azure/Microsoft.Azure.ActiveDirectory.LinuxSSH/*.log
SSH logs:
journalctl -u sshd
Validate role assignments in Azure Portal
Check PAM configs
5. Automation for 80+ Linux VMs

Approach

Maintain a CSV with VM details (Name, Resource Group, OS Type).
Use PowerShell or Bash to iterate:
Assign roles
Install extension
Run OS‑specific dependency installs
Example Bash:

#!/bin/bash

while IFS=, read -r vmname rg os; do

  echo "Processing $vmname in $rg ($os)"

 

  az vm extension set --publisher Microsoft.Azure.ActiveDirectory.LinuxSSH \

    --name AADLoginForLinux --resource-group "$rg" --vm-name "$vmname"

 

  if [[ "$os" == "ubuntu"* ]]; then

    az vm run-command invoke --command-id RunShellScript --name "$vmname" --resource-group "$rg" \

      --scripts "sudo apt-get update && sudo apt-get install -y libnss-azure libpam-azure && sudo systemctl restart sshd"

  elif [[ "$os" == "centos"* || "$os" == "rhel"* ]]; then

    az vm run-command invoke --command-id RunShellScript --name "$vmname" --resource-group "$rg" \

      --scripts "sudo yum install -y nss-pam-ldapd && sudo systemctl restart sshd"

  fi

done < vms.csv

6. Windows VM Authentication with Entra ID

Network Requirements

https://enterpriseregistration.windows.net → Device registration
http://169.254.169.254 → Azure Instance Metadata Service
https://login.microsoftonline.com → Authentication flows
https://pas.windows.net → RBAC flows
Client Requirements

Windows 10 (20H2+) or Windows 11 client
Must be Entra registered / joined / hybrid joined to same tenant
Access Requirements

Roles: Virtual Machine Administrator Login or Virtual Machine User Login
Limitations

Guest accounts not supported
Per‑user MFA blocks login
Windows Store RDP client not supported
Login Procedure

Use built‑in RDP client:

AzureAD\username@domain.com

Add user to local group:

net localgroup "Remote Desktop Users" /add "AzureAD\user@domain.com"

Validate join status:

dsregcmd /status

Check: AzureAdJoined : YES, AzureAdPrt : YES

7. Post-Implementation Checklist

Step

Responsible Team

Status

Inventory 80 VMs & OS types

Infra

Assign Entra ID login roles

Admin

Deploy AAD login extension

Automation

Verify dependencies & config

Infra

Test user login

Security

Monitor & troubleshoot logs

Support

8. Best Practices

Educate users on login formats and MFA requirements
Document rollback steps (remove extension, revert PAM/SSHD changes)
Audit role assignments regularly
Use Azure Monitor or Microsoft Sentinel for login event tracking and alerts
 

