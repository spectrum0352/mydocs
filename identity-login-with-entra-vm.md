# Azure Windows VMs login through Entra will NOT Work when:

## Device & Configuration Issues

- **Azure VM is NOT Entra-joined or Entra Hybrid-joined**: The VM **must** be joined to Entra ID or Hybrid AD + Entra.

- **Azure VM does NOT have "Login with Entra ID" feature enabled**: Enabling Entra login on the VM is a mandatory configuration.

- **Local client machine is NOT Entra-joined or Entra-registered**: The connecting device must be Entra-joined or Entra-registered.

- **Azure VM is based on an unsupported OS/image**: Some custom or outdated OS images may lack Entra login support (e.g., missing agents).

- **Remote Desktop Protocol (RDP) is disabled or blocked by NSG/firewall**: Even if Entra login is correctly set up, RDP must be accessible.

- **Azure VM does not have outbound connectivity to Microsoft identity endpoints**: The VM needs to reach Entra ID endpoints (login.microsoftonline.com, etc.) to authenticate users.

## User & Permissions Issues

- **User is NOT assigned the correct RBAC role (Virtual Machine User Login or Administrator Login)**: The user needs RBAC permission at VM, RG, or subscription level.

- **User account is disabled, deleted, or unlicensed**: Disabled or non-licensed accounts cannot authenticate.

- **Incorrect username format used (e.g., not using UPN)**: Must use full Entra ID UPN (e.g., user@domain.com) — short names like user will fail.

## Token & Policy Issues

- **Conditional Access policies block login (e.g., device not compliant, MFA failure)**: Policies may block the session even if config is correct.

- **Trusted Platform Module (TPM) or Hello for Business setup issues (in some CA/MFA scenarios)**: If CA policies require specific credential types, these may block RDP Entra login.

- **Client-side cached credentials or session tokens are invalid/expired**: May result in unexpected login failures or credential prompts.

## Client App/Protocol Issues

Only supported on Windows classic Remote Desktop Connection app (mstsc.exe)

| **Client** | **Status** | **Reason** |
|----|----|----|
| **Microsoft Store Remote Desktop App (UWP)** | ❌ Not supported | Does not support Entra ID login tokens |
| **Microsoft Remote Desktop (macOS, iOS, Android)** | ❌ Not supported | No Entra token auth support |
| **Third-party clients (Remmina, FreeRDP, etc.)** | ❌ Not supported | Cannot process Entra token-based login |
| **Azure Bastion (Standard SKU)** | ❌ **Fails in practice** | Though **documented as supported**, it **does not work reliably** and often fails even in properly configured environments — this is a known issue internally at Microsoft and among cloud practitioners. |

## Summary Checklist

| **Requirement** | **If Missing → Entra Login Fails** |
|----|----|
| VM is Entra-joined or hybrid-joined | ✅ Required |
| VM has Entra login enabled | ✅ Required |
| Client machine is Entra-joined/registered | ✅ Required |
| User has proper RBAC (VM User Login) | ✅ Required |
| Supported RDP client (MSTSC.exe only) | ✅ Required |
| VM has access to Entra ID endpoints | ✅ Required |
| User account active & licensed | ✅ Required |

# Only working method for Azure Windows VM login through Entra Account

**✅ Only Working Method for Microsoft Entra ID Login to Azure Windows VMs**

| **Requirement** | **Description** |
|----|----|
| **Client** | mstsc.exe (classic Remote Desktop Connection) |
| **Client OS** | Windows 10 or 11 (modern versions) |
| **Client Device State** | Must be **Microsoft Entra-joined** or **Entra-registered** |
| **Azure VM** | Must be **Microsoft Entra-joined** or **Hybrid Entra-joined** |
| **VM Feature** | "Login with Entra ID" must be enabled |
| **User Identity** | Must use **UPN format** (e.g., user@domain.com) |
| **RBAC Role** | Must be assigned Virtual Machine User Login or Virtual Machine Administrator Login |
| **RDP Port (3389)** | Must be open and reachable |
| **Internet Access** | VM must reach Microsoft identity endpoints (e.g., login.microsoftonline.com) |

**✅ Final Validation:**

The only currently **reliable and supported way** to log in to Azure Windows VMs using **Microsoft Entra ID** is:

🔐 **mstsc.exe from a Windows 10/11 device that is Entra-joined or Entra-registered**, connecting to an **Azure VM that is Entra-joined**, with **Login with Entra ID** enabled and correct **RBAC** assigned.

# Not asking MFA while login

**Why is MFA not prompted when using Microsoft Entra ID login to Azure Windows VMs via RDP?**

**✅ <span class="mark">By default, RDP with Entra ID does *not* enforce MFA</span>**

Even though you're using a Microsoft Entra account, logging into an Azure Windows VM via RDP **does not automatically trigger MFA** — <span class="mark">**unless you explicitly enforce it via Conditional Access (CA)**.</span>

## How to Enforce MFA for Entra VM Logins

To require MFA during RDP login to Azure VMs using Entra accounts, you must **Create a Conditional Access Policy targeting Azure Windows VM sign-ins**

**Step-by-Step: Enforce MFA on Azure VM Entra Login**

1.  **Go to Microsoft Entra Admin Center (formerly Azure AD):**\
    https://entra.microsoft.com

2.  **Navigate to:**\
    Protection ➝ Conditional Access ➝ New policy

3.  **Configure the policy:**

    - **Name:** e.g., Require MFA for Entra VM login

    - **Assignments → Users:** Choose users or groups

    - **Assignments → Cloud apps or actions:**

      - Choose **"Microsoft Azure Windows VM Sign-In"**

    - **Conditions → Device platforms:** (Optional) Limit to Windows

    - **Grant controls:**

      - Select **"Require multi-factor authentication"**

4.  **Enable policy** and **save**

## Result:

Now, **MFA will be required** whenever a user tries to log in to an Entra-joined Azure VM using Entra credentials (e.g., via mstsc.exe), **as long as the Conditional Access policy applies**.

## Important Notes

- **No CA = No MFA**: Entra login **alone** does not prompt for MFA.

- CA policy must **target the special app** Microsoft Azure Windows VM Sign-In (not the generic “All cloud apps”).

- The **first login** may prompt for MFA if it's a **new device registration** — but not after that unless enforced.

# Windows login through RDP Connection

<span class="mark">It will only support the Windows OS builtin Remote Desktop Service feature. Microsoft/Windows Store Remote Desktop App will not support it.</span>

Requirements:

OS version: Windows Server 2022 Datacenter Azure Edition

<img src="media/image1.png" style="width:9.69306in;height:4.5875in" />

**<span class="mark">AADLoginforWindows extension installed</span>**

<img src="media/image2.png" style="width:7.58465in;height:1.72364in" />

**<span class="mark">Network settings</span>**

<img src="media/image3.png" style="width:7.17556in;height:1.62244in" />

<img src="media/image4.png" style="width:7.13154in;height:2.8985in" />

Entra domain joined

## When local device is not Entra joined?

<span class="mark">Here local device desktop2025 domain join is disabled.</span>

<img src="media/image5.png" style="width:9.69306in;height:2.68125in" />

Login with Public IP of VM: 4.213.90.211

Username: polaris-az@spectrum27.onmicrosoft.com

Let’s enter login details in RDP service

Note: the option “Use a web account to sign in to the remote computer” is not checked

<img src="media/image6.png" style="width:3.70648in;height:4.08752in" /> <img src="media/image7.png" style="width:3.60908in;height:4.04326in" />

Click on “Connect”, you will see below screen.

Enter password, then press OK.

It will show error: “<span class="mark">The logon attemot failed”</span>

<img src="media/image8.png" style="width:2.99451in;height:2.67764in" /> <img src="media/image9.png" style="width:3.09539in;height:2.77763in" /> <img src="media/image10.png" style="width:2.80208in;height:2.76748in" />

### Verify the config status on Azure VM

**<span class="mark">Loggedin through local account to verify the configuration status.</span>**

<span class="mark">AzureADJoined showing Yes.</span>

<img src="media/image11.png" style="width:6.47584in;height:4.28575in" />

<img src="media/image12.png" style="width:6.47118in;height:4.1196in" />

<span class="mark">AzureADPrt showing NO</span>

PRT stands for Primary Request Token

<img src="media/image13.png" style="width:4.12552in;height:3.06186in" /><img src="media/image14.png" style="width:3.48225in;height:3.76532in" />

**<span class="mark">Access Type showing Direct</span>**

<img src="media/image15.png" style="width:5.55881in;height:5.55881in" />

## When local device is Entra Joined?

**<span class="mark">Here local device desktop2025 domain join is enabled.</span>**

<img src="media/image16.png" style="width:7.06086in;height:2.18281in" />

Login with Public IP of VM: 4.213.90.211

Username: AzureAD\polaris-az@spectrum27.onmicrosoft.com

Let’s enter login details in RDP service

Note: the option “Use a web account to sign in to the remote computer” is not checked

<img src="media/image17.png" style="width:3.65719in;height:4.04in" /> <img src="media/image7.png" style="width:3.60908in;height:4.04326in" />

Click on “Connect”, you will see below screen.

Enter password, then press OK.

**<span class="mark">Login will successful</span>**

<img src="media/image8.png" style="width:2.99451in;height:2.67764in" /> <img src="media/image9.png" style="width:3.09539in;height:2.77763in" />

### Verify the config status on Azure VM

**<span class="mark">AzureADJoined showing Yes</span>**

<img src="media/image18.png" style="width:5.03618in;height:4.52036in" />

<img src="media/image19.png" style="width:6.5753in;height:5.41993in" />

<img src="media/image20.png" style="width:7.24944in;height:5.87722in" />

**<span class="mark">AzureADUser showing Yes</span>**

<img src="media/image21.png" style="width:4.01916in;height:5.03428in" />

# Windows login through Azure Bastion

URLs:

<https://learn.microsoft.com/azure/active-directory/devices/howto-vm-sign-in-azure-ad-windows#using-conditional-access>

# Azure Linux VM

 

 

**Network requirements**

- <https://enterpriseregistration.windows.net>: For device registration.

- <http://169.254.169.254>: Azure Instance Metadata Service endpoint.

- <https://login.microsoftonline.com>: For authentication flows.

- <https://pas.windows.net>: For Azure RBAC flows.

 

**Azure VM OS requirements**

- Windows 10 version 20H2 or later,

- Windows 11

- Windows Server 2022

 

**Client/Local machine requirement**

- Remote connection on Azure Windows VMs can be performed only from Windows 10 or later machines which are either registered/hybrid-joined/joined to same Microsoft Entra ID Tenant where VM is present.

- Windows client machine you're using for RDP should be Microsoft Entra registered, joined, or hybrid joined to the same directory as the VM.

 

**Access requirement**

User must have one of the two Azure roles assigned to respective Entra user account:

- Virtual Machine Administrator Login

- Virtual Machine User Login.

 

**Microsoft Entra Authentication for Azure Windows VMs will not work when:**

- Microsoft Entra Guest account can't connect to Azure VMs through Microsoft Entra authentication.

- Microsoft Entra authentication for Azure VMs will not work if MFA per user is enabled on Entra user account

- Windows Store RDP client (red icon) which is not supported Connecting to Azure AD-joined VMs.

 

How to login?

- During login user must enter credentials in format AzureAD\username@domain.com on Windows built-in RDP Client.

 

 

Add Entra user in local group.

 

net localgroup "Remote Desktop Users" /add "AzureAD\polaris-az@spectrum27.onmicrosoft.com"

 

AzureAD\polaris-az@spectrum27.onmicrosoft.com

Qoxo@7251

 

f0fe3a4b-923b-4ff5-953f-ea3e211c915b.centralindia.cloudapp.azure.com

 

*From \<<https://portal.azure.com/#@spectrum27.onmicrosoft.com/resource/subscriptions/0812c67f-1484-4670-acb5-78a844bb97e7/resourceGroups/rg-demo/providers/Microsoft.Network/publicIPAddresses/polariswindowsvm1001-ip/configuration>\>*

 

lwhttltqkc4uviv4owjc2vgcxh.rx.internal.cloudapp.net

 

winvm232578390203.centralindia.cloudapp.azure.com

Above yellow market section should match the VM Hostname

 

polatestwin12345.centralindia.cloudapp.azure.com

 

dsregcmd /status

AzureAdJoined : YES

AzureAdPrt : YES

 

Check Windows Version: Windows key + R --\> winver

 

 

<img src="media/image22.png" style="width:6.43333in;height:5.20833in" />

 

<img src="media/image23.png" style="width:6.125in;height:5.13333in" />

 

---------------------------------------------------------------------------------------------------------------------------------------------------

 

**Linux VM**

 

Choose default authentication type: Username/password

 

**Login to Linux VM using AZ CLI**

 

 

**Login to Linux VM using Cloud shell**

 

 

**Login with SSH clients that support OpenSSH**

- Export the SSH configuration for use with SSH clients that support OpenSSH

 

By default Windows powershell don’t have Azure CLI package, that needs to be installed.

<https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?view=azure-cli-latest&pivots=winget>

 

winget install --exact --id Microsoft.AzureCLI

 

<img src="media/image24.png" style="width:9.69306in;height:2.43125in" />

 

<img src="media/image25.png" style="width:9.69306in;height:2.09306in" />

 

Need to install \#az ssh

 

<img src="media/image26.png" style="width:9.69306in;height:0.68125in" />

 

<img src="media/image27.png" style="width:9.69306in;height:2.47917in" />

 

First need to login the Entra/Azure Tenant:

 

<img src="media/image28.png" style="width:9.05833in;height:0.925in" />

 

 

**Login to specific user through Terminal.**

 

<img src="media/image29.png" style="width:9.69306in;height:1.26597in" />

 

Login with device code

 

az login --use-device-code

 

<img src="media/image30.png" style="width:9.69306in;height:3.05694in" />

 

<img src="media/image31.png" style="width:6.225in;height:3.675in" />

 

 

When trying to export SSH config as mentioned in below link, but its not working.

<https://learn.microsoft.com/en-us/entra/identity/devices/howto-vm-sign-in-azure-ad-linux#export-the-ssh-configuration-for-use-with-ssh-clients-that-support-openssh>

 

<img src="media/image32.png" style="width:9.69306in;height:2.36944in" />

 

 

az ssh vm -n linuxvm12052025 -g rg-demo

 

<img src="media/image33.png" style="width:9.69306in;height:3.11667in" />

 
