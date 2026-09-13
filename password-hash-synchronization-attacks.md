# Password Hash Synchronization

**Password Hash Synchronization (PHS)** directly helps an **Azure
penetration tester** by creating a **bridge between on-prem Active
Directory and Azure AD**. Here's how it aids Azure pentesting:

------------------------------------------------------------------------

**🔧 How PHS Helps in Azure Penetration Testing**

**✅ 1. Expands Attack Surface**

- If the tester compromises **on-prem credentials**, those same
  credentials may **work in Azure** due to synchronization.

- Provides a clear **pivot point from on-prem to cloud**.

**✅ 2. Credential Reuse**

- Pentesters can use **harvested NTLM hashes** or cracked passwords from
  on-prem to **authenticate against Azure AD** (e.g., O365, Azure
  Portal, SharePoint).

- Useful for **password spraying** or **brute-force** attacks on known
  synced accounts.

**✅ 3. Bypass Azure-Only Defenses**

- Azure-based protections like **MFA or Conditional Access** may not be
  enforced properly on synced accounts or service accounts.

- Allows access to cloud without needing to directly compromise
  cloud-native accounts.

**✅ 4. Persistence and Escalation**

- A foothold on on-prem AD can lead to long-term Azure persistence if
  synced users have privileged roles (e.g., Global Administrator).

- If PHS is enabled, maintaining access to on-prem means maintaining
  access to Azure.

**✅ 5. Detection Evasion**

- Attacks via PHS accounts can appear as legitimate logins because Azure
  views them as standard user activity.

- Reduces chances of being flagged by basic anomaly detection tools.

**🎯 Real-World Pentest Example**

1.  **Compromise on-prem user** with netntlmv2 hash via Responder.

2.  Crack the hash → obtain user password.

3.  Attempt login to portal.azure.com or outlook.office365.com with the
    same credentials.

4.  If MFA is not enforced, access is successful—**cloud compromised**
    via on-prem attack.

Let me know if you want an automated script or checklist for exploiting
PHS in a hybrid Azure pentest.

<img src="media/image1.png" style="width:7.35064in;height:5.17545in" />

Here is an **automated exploitation checklist and script-assisted
workflow** for abusing **Password Hash Synchronization (PHS)** in a
**hybrid Azure Penetration Test**:

------------------------------------------------------------------------

**✅ Azure PHS Exploitation Checklist (Hybrid Pentest)**

**🔍 Phase 1 – Identify PHS Use**

- Confirm **Azure AD Connect** is in use.

  - Check for service Azure AD Connect on domain controllers or
    management servers.

  - Look for synced accounts in Azure (suffixes like @company.com,
    @domain.local).

- Use Get-AzureADUser or Azure portal to find DirSyncEnabled accounts.

**🧰 Phase 2 – Credential Harvesting (On-Prem)**

- Use one of the following to extract password hashes:

  - Mimikatz (e.g., lsadump::lsa)

  - DCSync (lsadump::dcsync /user:target)

  - LSASS memory dump + pypykatz

- Crack hashes with:

  - hashcat or JohnTheRipper

  - Wordlist + rules (rockyou, crackstation)

hashcat -m 1000 -a 0 hash.txt rockyou.txt --force

**🚪 Phase 3 – Azure Access with Cracked Credentials**

- Attempt login to Azure services:

  - https://portal.azure.com

  - https://outlook.office365.com

  - https://login.microsoftonline.com

💡 Use tools like
[**o365creeper**](https://github.com/LMGsec/o365creeper) or
[**aADInternals**](https://github.com/Gerenios/AADInternals) to validate
account access.

**🛑 Phase 4 – MFA & Conditional Access Testing**

- Check if MFA is enforced for the user.

  - Try login via browser or scripted tools (below).

- If login is successful → proceed with **post-exploitation**.

- If blocked → check if user is in **MFA-exempt** group or **legacy
  endpoint** still accessible.

------------------------------------------------------------------------

**💻 Automation Script – Azure Login Tester**

Here's a PowerShell snippet using **MSOnline** module to test PHS-based
Azure logins:

Install-Module MSOnline -Force

Import-Module MSOnline

\$cred = Get-Credential \# Enter cracked creds here

Connect-MsolService -Credential \$cred

if (\$?) {

Write-Host "✅ Login successful via PHS credentials!"

} else {

Write-Host "❌ Login failed. Possible MFA or wrong password."

}

------------------------------------------------------------------------

**🔄 Optional Tools for Automation**

| **Tool** | **Purpose** | **Link** |
|----|----|----|
| AADInternals | Azure login check, token abuse | <https://github.com/Gerenios/AADInternals> |
| o365creeper | Spray O365 logins, detect MFA | <https://github.com/LMGsec/o365creeper> |
| MailSniper | Harvest mail if O365 access works | <https://github.com/dafthack/MailSniper> |
| Roadtools | Token extraction & enumeration | <https://github.com/dirkjanm/roadtools> |
| Rubeus | Ticket extraction (if domain joined) | <https://github.com/GhostPack/Rubeus> |

------------------------------------------------------------------------

Would you like a companion BloodHound query or KQL (Sentinel detection)
to track usage of synced creds or detect post-exploitation behaviour?
