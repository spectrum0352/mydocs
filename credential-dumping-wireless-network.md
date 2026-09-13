Credential dumping with wireless network

# Credential Dumping through Wireless

Sure! Here’s a clean, detailed, and structured summary and correction of the provided content, focused on how to perform credential dumping during penetration testing on Azure Windows/Linux VMs, covering local accounts, AD accounts, and Microsoft Entra ID accounts — with all key steps, commands, and vulnerabilities included, duplicates removed, and explained clearly:

------------------------------------------------------------------------

**Credential Dumping on Azure Windows/Linux VMs**

**Targeting Local Accounts, Active Directory (AD) Accounts, and Microsoft Entra ID Accounts**

------------------------------------------------------------------------

**What is Credential Dumping?**

Credential dumping is a technique used to extract stored credentials (usernames and passwords) from a compromised system. This enables an attacker or pentester to gather credentials for multiple accounts by exploiting a single target. These credentials can belong to local Windows/Linux accounts, domain accounts (Active Directory), or even cloud identity providers like Microsoft Entra ID (formerly Azure AD).

------------------------------------------------------------------------

**Why Credential Dumping Matters in Azure VMs**

- **Azure Windows/Linux VMs** often have local accounts and may be joined to Azure AD or traditional AD domains.

- Compromise of one VM may yield credentials allowing lateral movement or privilege escalation.

- Credentials can be stored in various forms—memory, config files, network profiles—depending on OS and configuration.

- Credential dumping can be leveraged to escalate from local VM access to broader Azure tenant access.

------------------------------------------------------------------------

**Methods of Credential Dumping (with Azure VM focus)**

**1. Manual Credential Dumping**

- Useful for quick checks or minimal footprint enumeration.

- Requires access to the VM shell (PowerShell, CMD, Linux shell).

**Windows Commands:**

- net user — List local users.

- net localgroup administrators — List local admins.

- whoami /all — View token privileges.

- cmdkey /list — Show cached credentials.

- netsh wlan show profiles — List saved Wi-Fi profiles.

**Linux Commands:**

- cat /etc/passwd — List users.

- sudo cat /etc/shadow — Show password hashes (requires privilege).

- last or who — Show recent logins.

------------------------------------------------------------------------

**2. Credential Dumping for Wireless Networks**

Wireless profiles often store saved Wi-Fi passwords that can be extracted for lateral movement or network access.

**Windows: Using netsh**

- **List saved wireless profiles:**

- netsh wlan show profiles

- **Dump the password for each profile:**

- netsh wlan show profile name="PROFILE_NAME" key=clear

- Look under **Key Content** for the plaintext Wi-Fi password.

**Using WirelessKeyView (third-party tool)**

- Download and run [WirelessKeyView](https://www.nirsoft.net/utils/wireless_key.html) to extract saved Wi-Fi keys from the registry.

**Using Wifi Network Properties GUI (Manual)**

- Navigate to Wireless Network settings \> Wireless Properties \> Security tab \> Show characters (requires admin).

------------------------------------------------------------------------

**3. Credential Dumping Using LaZagne (Automated)**

- LaZagne is an open-source tool to extract credentials stored by many applications, including Windows wireless profiles.

lazagne wifi

- This dumps Wi-Fi and other saved credentials in clear text.

------------------------------------------------------------------------

**4. Credential Dumping Using Mimikatz (Windows)**

- Mimikatz is a powerful post-exploitation tool to dump credentials from memory, Windows Vault, Kerberos tickets, etc.

**Basic usage to dump credentials:**

privilege::debug

sekurlsa::logonpasswords

- Extracts cleartext passwords, NTLM hashes, Kerberos tickets from LSASS process.

- Requires Administrator privileges.

- Can be run directly on the VM or through a remote session.

------------------------------------------------------------------------

**5. Credential Dumping Using Metasploit Framework**

- Use Metasploit's post/windows/gather/credentials/wlan_key module to dump Wi-Fi keys remotely after gaining a session.

use post/windows/gather/credentials/wlan_key

set SESSION \<session_id\>

run

------------------------------------------------------------------------

**Azure VM Specific Vulnerabilities Exploited During Credential Dumping**

- **Weak Local Account Passwords**: Easily brute forced or dumped.

- **Excessive Privileges**: Over-permissioned accounts allow tools like Mimikatz.

- **Cached Credentials**: Saved Wi-Fi passwords, stored credentials in Windows Vault.

- **Insecure Remote Access**: Using tools like Metasploit or remote PowerShell with improper security.

- **Azure AD Join Misconfigurations**: Weak synchronization or token theft enabling further escalation.

- **Inadequate Endpoint Protection**: Lack of Microsoft Defender for Endpoint or similar allows post-exploitation.

------------------------------------------------------------------------

**Detailed Step-by-Step Pentesting Workflow (Credential Dumping)**

**Step 1: Initial Access to Azure VM**

- Gain shell access (RDP, SSH, Azure Run Command, exploitation).

**Step 2: Enumerate Users & Groups (Windows Example)**

net user

net localgroup administrators

whoami /all

cmdkey /list

**Step 3: Enumerate Saved Wireless Profiles and Dump Wi-Fi Keys (Windows)**

netsh wlan show profiles

netsh wlan show profile name="PROFILE_NAME" key=clear

**Step 4: Run Automated Tools for Credential Extraction**

- Run LaZagne:

lazagne wifi

- Run Mimikatz (as Admin):

privilege::debug

sekurlsa::logonpasswords

**Step 5: Use Metasploit Post Module (if remote session established)**

use post/windows/gather/credentials/wlan_key

set SESSION \<session_id\>

run

**Step 6: Dump Credentials from LSASS Process (Advanced)**

- Use ProcDump or direct Mimikatz to extract LSASS memory dump for offline analysis.

**Step 7: Check Azure AD Tokens and Cached Credentials (if Azure AD joined)**

- Dump cached Azure AD tokens or Kerberos tickets for reuse.

------------------------------------------------------------------------

**Mitigation Recommendations**

- Use **strong, unique passwords** and enforce least privilege.

- Disable unnecessary **cached credentials and saved Wi-Fi profiles**.

- Enable **Microsoft Defender for Endpoint** with credential dumping detection.

- Harden Azure VM access with **Just-In-Time VM Access**, **Conditional Access**, and **Multi-Factor Authentication (MFA)**.

- Monitor and alert on unusual usage of tools like Mimikatz or netsh.

- Regularly audit and rotate local and AD credentials.

- Enforce **Azure AD password protection policies** and **Windows Credential Guard** where possible.

------------------------------------------------------------------------

If you want, I can also help prepare detailed command scripts or an automated toolset for this workflow. Just let me know!

Here is a **summarized and corrected version** of your text titled **"Wireless Network Credential Dumping"**:

------------------------------------------------------------------------

**Wireless Network Credential Dumping**

**Overview**

Credential dumping is a technique attackers use to extract stored credentials from a target system after gaining access. One common target is the credentials (SSIDs and passwords) of wireless networks previously connected to the system. These credentials can be useful for lateral movement or external access to secure environments.

Wireless credential dumping can be part of both internal and external penetration testing, depending on how the attacker accesses the system (locally or remotely).

------------------------------------------------------------------------

**1. Manual Credential Dumping**

Windows stores Wi-Fi profiles, including SSIDs and passwords, in XML files located at:

C:\ProgramData\Microsoft\Wlansvc\Profiles\Interfaces\\

- **SSIDs** are stored in **cleartext**.

- **Passwords** are saved as **encrypted keys**, but may be decrypted depending on user privileges.

------------------------------------------------------------------------

**2. Credential Dumping Using Netsh**

**Netsh** ("Network Shell") is a built-in Windows command-line utility that can be used in both Command Prompt and PowerShell to manage and inspect network configurations.

**Steps:**

- **List all saved Wi-Fi profiles (SSIDs):**

- netsh wlan show profiles

- **Retrieve the password for a specific profile (SSID):**

- netsh wlan show profile name="\<SSID Name\>" key=clear

The output will display the Wi-Fi password in clear text under the Key Content field.

⚠️ *Note: This method requires administrative privileges to retrieve passwords.*

------------------------------------------------------------------------

**Use in Penetration Testing**

- **Internal Testing:** Direct access allows easier dumping via Netsh or file parsing.

- **External Testing:** If RDP, remote shell, or malware is used to gain access, these methods remain viable.

------------------------------------------------------------------------

Let me know if you'd like this turned into a professional PDF report or lab exercise version.

Here is a **corrected and summarized version** of your content titled **"Wireless Network Credential Dumping – Tools and Techniques"**:

------------------------------------------------------------------------

**Wireless Network Credential Dumping**

Credential dumping of wireless networks involves extracting saved Wi-Fi SSIDs and passwords from a Windows system. This is commonly performed during **internal** or **external penetration testing** to gain further access or lateral movement within a network.

------------------------------------------------------------------------

**1. Using WirelessKeyView**

- **WirelessKeyView** is a lightweight tool by NirSoft that retrieves saved Wi-Fi passwords from XML configuration files.

- Ideal for **internal pentesting**.

- Usage: Download and run the tool—Wi-Fi names and passwords will be displayed in cleartext.

- No installation required; portable executable.

------------------------------------------------------------------------

**2. Using Network Properties (Manual GUI Method)**

- Useful when you are on a system connected to a Wi-Fi network but don’t know the password.

- Navigate to:

- Control Panel \> Network and Internet \> Network and Sharing Center \> \[SSID\] \> Wireless Properties \> Security Tab

- Check the **“Show characters”** box to view the saved password.

------------------------------------------------------------------------

**3. Using LaZagne**

- **LaZagne** is an open-source post-exploitation tool that extracts saved credentials from various applications, including Wi-Fi.

- Ideal for **external testing** via remote access.

- Command to retrieve Wi-Fi credentials:

- lazagne.exe wifi

- The tool will list all stored SSIDs and their corresponding passwords.

------------------------------------------------------------------------

**4. Using Mimikatz**

- Mimikatz is a powerful post-exploitation tool that can retrieve plaintext passwords from memory.

- After obtaining a session (e.g., via remote shell), use the following commands:

- getsystem

- load kiwi

- wifi_list_shared

- Suitable for **external pentesting** if elevated privileges are available.

------------------------------------------------------------------------

**5. Using Metasploit Framework**

- Metasploit contains a **post-exploitation module** specifically for retrieving saved Wi-Fi profiles.

- Usage steps:

- msfconsole

- use post/windows/wlan/wlan_profile

- set session \<session_id\>

- exploit

- Useful in internal and external pentesting scenarios after a session has been established.

------------------------------------------------------------------------

**Mitigation Strategies**

To protect against wireless credential dumping:

- Educate employees on wireless security.

- Avoid using default SSIDs.

- Don’t allow systems to auto-save Wi-Fi passwords.

- Require manual Wi-Fi reconnections.

- Segment guest networks from internal networks.

- Use VPNs for secure traffic.

- Change Wi-Fi passwords regularly.

- Avoid using default router IP addresses.

- Physically secure routers—disable or protect reset buttons to prevent factory resets.

------------------------------------------------------------------------

**Conclusion**

Several tools and manual methods can be used to dump Wi-Fi credentials from Windows systems. While powerful for attackers, awareness and preventive configuration can significantly reduce risk. Apply the listed mitigations to strengthen your wireless network security posture.

Let me know if you’d like a formatted PDF, lab setup guide, or command cheat sheet based on this content.
