**Spyware** is a type of malicious software that secretly collects user data without their knowledge.

**Important Considerations**

- **Legal and Ethical Implications:** The use of spyware should always be within legal boundaries and with proper consent. Unauthorized monitoring can lead to serious legal consequences.

- **Security Risks:** Spyware can compromise system security, allowing attackers to gain access to sensitive information.

- **Privacy Concerns:** The misuse of spyware can violate privacy rights and lead to identity theft or other cybercrimes.

## Deployment

It can be installed through various methods, including:

- **Drive-by downloads:** Exploiting vulnerabilities in web browsers to install malware automatically.

- **Bundled with free software:** Hidden within legitimate software installations.

- **Phishing attacks:** Deceiving users into clicking malicious links or downloading infected files.

## Activities

- **Monitor user activity:** Tracking browsing history, keystrokes, and sensitive information like passwords and credit card numbers.

- **Steal personal data:** Collecting information such as email addresses, bank details, and online login credentials.

- **Compromise system security:** Opening backdoors for further attacks or using the infected device as part of a botnet.

## Types

1.  **Computer Spyware:**

    - **Keyloggers:** Record keystrokes to capture passwords, sensitive information, and chat conversations.

    - **Screen Recorders:** Capture screenshots or record video of on-screen activity.

    - **File Transfer Monitors:** Track file transfers, including emails and documents.

2.  **Audio Spyware:**

    - **Voice Recorders:** Record ambient sounds, including conversations and meetings.

    - **Voice Chat Recorders:** Capture voice chats on platforms like Skype and Discord.

3.  **Mobile Spyware:**

    - **GPS Trackers:** Monitor the real-time location of a device.

    - **Call Loggers:** Record incoming and outgoing calls, including numbers and durations.

    - **SMS Interceptors:** Intercept and read SMS messages.

## Countermeasures

To protect against spyware, follow these guidelines:

- **Software and System Updates:** Regularly update your operating system, software applications, and security software (antivirus, anti-spyware) to patch vulnerabilities.

- **Security Software:** Install and maintain reputable antivirus, anti-spyware, and anti-keylogging software. Scan your system regularly for infections.

- **Safe Browsing and Downloads:** Practice safe browsing habits. Only download files and browser extensions from trusted sources. Scan all downloaded files before opening or installing them. Use a pop-up blocker.

- **Email and Phishing:** Be cautious of suspicious emails, links, and attachments. Do not click on links in unsolicited emails. Be wary of phishing attacks.

- **Passwords and Authentication:** Use strong, unique passwords for all online accounts. Enable two-factor authentication whenever possible. Use auto-fillers or virtual keyboards for logins when practical.

- **Public Computers:** Avoid using public computers for sensitive tasks like online banking or shopping.

- **Device Control:** Avoid using computers you do not fully control.

- **System Monitoring:** Regularly check your system for unusual activity. Monitor system and network changes if possible.

- **Physical Security:** Implement physical security measures for your computers. Secure physical access and check for hardware keyloggers.

- **Browser Security:** Adjust browser security settings to a medium or higher level.

- **Administrative Privileges:** Limit the use of administrative privileges unless necessary.

- **Firewall:** Use a firewall with outbound protection.

- **Keystroke Protection (Advanced):** Consider using keystroke interference software, on-screen keyboards for sensitive input, or encryption between the keyboard and its driver for enhanced protection against keyloggers. Use software to monitor system and network changes.

By understanding the risks and taking these proactive measures, you can significantly reduce the likelihood of spyware infections.

## Tools 

- **Spyware Threat:** Spyware secretly monitors computer and mobile device activity, creating privacy and security risks. While it has some legitimate uses (e.g., parental controls), misuse is common.

- **Anti-Spyware Solution:** Anti-spyware software is a key countermeasure.

- **SuperAntiSpyware:** This tool protects against a broad range of threats, including:

  - Spyware

  - Adware

  - Malware

  - Trojans

  - Dialers

  - Worms

  - Keyloggers

  - Hijackers

  - Parasites

  - Rootkits

  - Rogue security products

- **Functionality:** SuperAntiSpyware identifies and removes potentially unwanted programs and other malicious software.

- **Zemana AntiLogger:** Specifically targets keyloggers, banking Trojans, and other threats.

Certainly! Here’s a rewritten version of the original text, adapted to focus specifically on **spyware malware in an Azure environment**, preserving all the key points:

------------------------------------------------------------------------

**PseudoManuscrypt:**

**A Mass-Scale Spyware Malware Campaign in Azure Environments**

In June 2021, cybersecurity experts specializing in industrial control systems (ICS) security identified a sophisticated spyware malware campaign impacting organizations worldwide, including those running workloads on Azure cloud environments. This malware’s loader shares technical similarities with Manuscrypt — a known malware tool used by the Lazarus APT group, which targeted defense enterprises globally in 2020. These past attacks are documented in the report titled “Lazarus Targets Defense Industry with ThreatNeedle.”

Interestingly, the data exfiltration mechanism used by this spyware incorporates the KCP protocol implementation, previously attributed only to the APT41 threat actor toolkit. This unusual crossover suggests a blend of tactics and toolsets from multiple advanced threat groups.

We have designated this newly-discovered malware **PseudoManuscrypt**.

**Infection and Distribution in Azure Context**

The PseudoManuscrypt loader infiltrates systems predominantly via Malware-as-a-Service (MaaS) platforms distributing malware bundled within pirated software installer archives—a tactic that also compromises Azure virtual machines when users deploy unauthorized or compromised software. One notable infection vector involves the Glupteba botnet, whose installers are likewise disseminated through these pirated software channels.

This distribution method indicates the attackers are not pursuing targeted victims within Azure but rather adopting a mass-spreading approach affecting cloud workloads indiscriminately.

Between January 20 and November 10, 2021, Kaspersky’s security products intercepted and blocked PseudoManuscrypt infections on over 35,000 endpoints across 195 countries. This volume of compromised systems is highly unusual for the Lazarus group or typical APT campaigns, suggesting a widespread malware outbreak impacting Azure-hosted services and hybrid environments alike.

**Targets within Azure and Industrial Control Systems**

Among the infected systems, a substantial portion comprises industrial and government organizations, including Azure-hosted military-industrial enterprises and research laboratories. Kaspersky’s telemetry indicates at least 7.2% of these compromised systems belong to industrial control systems (ICS) environments operating on or connected with Azure resources. These affected sectors include engineering, building automation, energy, manufacturing, construction, utilities, and water management.

**Spyware Capabilities on Azure Systems**

The core module of PseudoManuscrypt offers extensive spying features that threaten the confidentiality and integrity of Azure workloads and associated infrastructure. Capabilities include:

- Stealing VPN connection credentials used to access Azure virtual networks and on-premises linked resources.

- Logging user keystrokes to capture sensitive information, including Azure portal credentials.

- Taking screenshots and recording screen video from infected VMs and containers.

- Recording audio via compromised microphone-enabled devices connected through Azure.

- Extracting clipboard data to intercept copied secrets or tokens.

- Accessing operating system event logs, facilitating the theft of Remote Desktop Protocol (RDP) authentication data commonly used in Azure virtual machine access.

In essence, PseudoManuscrypt provides attackers with near-complete control over infected Azure-hosted systems, allowing stealthy data exfiltration and surveillance.

------------------------------------------------------------------------

**Identifying the PseudoManuscrypt Loader in Azure Environments**

Kaspersky ICS CERT’s investigation into this campaign uncovered a series of malware infections affecting Azure-hosted organizations globally, including government and industrial enterprises.

The malware was initially detected by antivirus engines trained to identify Lazarus APT activity. However, the unusually large infection footprint—over 35,000 systems—did not align with typical Lazarus targeted operations. Further analysis revealed the malware loads its payload from a unique location in the system registry, decrypting it at runtime. This registry location varies per infected machine, complicating detection.

The loader shares architectural traits with Manuscrypt, particularly the use of a CLSID-format registry value to locate the encrypted payload. Both malware families feature nearly identical export tables in their executables, underscoring a close resemblance in design.

Additionally, the naming conventions of the loader binaries follow similar patterns in both PseudoManuscrypt and Manuscrypt infections.

Given these parallels but without conclusive ties to Lazarus, the malware was named **PseudoManuscrypt** to reflect its resemblance to Manuscrypt while acknowledging the distinct and wide-reaching nature of this campaign.

------------------------------------------------------------------------

This rewrite contextualizes the original technical report specifically for **spyware malware threats within Azure cloud environments**, emphasizing infection methods, targets, and spying capabilities relevant to Azure workloads and hybrid ICS scenarios. Let me know if you want it adjusted to a more technical or executive summary style!

<img src="media/image1.png" style="width:7.08395in;height:4.01701in" />

<img src="media/image2.png" style="width:5.90051in;height:4.75875in" />

Certainly! Here’s a rewritten version adapted to the context of **spyware malware in an Azure environment**, preserving all key details:

------------------------------------------------------------------------

**PseudoManuscrypt:**

**A Mass-Scale Spyware Malware Campaign in Azure Environments**

**System Infection in Azure Workloads**

The PseudoManuscrypt loader infiltrates Azure-hosted systems through complex chains involving the installation of numerous malicious files and the spawning of multiple processes. These infection chains vary widely but invariably begin with fake pirated software installer archives—often deployed by users or attackers within Azure virtual machines or hybrid cloud endpoints.

Examples of archive names observed in the campaign include:

- microsoft_office_365_july_keygen_by_keygensumo.zip

- windows_10_pro_full_keygen_by_keygensumo.zip

- adobe_acrobat_v8_0_keygen_by_keygensumo.zip

- garmin_1_serial_keygen.zip

- call_of_duty_black_ops_keygen_by_keygensumo.zip

- kaspersky_antivirus_keys_july_keygen_by_keygensumo.zip

- solarwinds_broadband_engineers_keymaker.zip

- modscan32_v8_a00_crack.zip

Notably, these archives include fake installers for industrial control system (ICS)-specific software, such as applications designed to create MODBUS Master Devices for PLC data collection, as well as general-purpose software used in operational technology (OT) networks. For example, a SolarWinds tool key generator, relevant to network engineers and system administrators managing Azure hybrid networks, is among the fakes.

**Distribution via Malicious Web Resources in Azure**

These malicious installer resources are found highly ranked on search engine results, indicating that threat actors actively optimize their web presence through search engine optimization (SEO) to lure users into downloading the infected archives. Azure users searching for software downloads or tools may inadvertently encounter and execute these malicious installers.

**Execution Flow in Azure Systems**

The infection process involves multiple variants of execution flows, each comprising sequences of malicious programs leading to the installation of PseudoManuscrypt on Azure VMs or endpoints. These installers often download and execute additional malware components such as spyware, backdoors, cryptocurrency miners, and adware.

At every infection stage, numerous droppers and modules are installed, each equipped with data theft capabilities and connecting to unique command-and-control (C2) servers. This modular approach suggests the malware is distributed through a Malware-as-a-Service (MaaS) platform, enabling various threat actors to operate distinct campaigns, one of which is PseudoManuscrypt’s widespread distribution.

Below are examples of infection chains observed in Azure environments:

**Variant One**

- A fake installer archive extracts key.bat.

- key.bat executes Keygen-step-4.exe (e41826b342686c7f879474c49c7eed98).

- Keygen-step-4.exe installs and runs flash player.exe (2aab0ec738374db4e872812a84a0bc11).

- flash player.exe installs and executes 2.exe (8b9f6b0c98c0afdd75c2322f1ca4d0e8).

- 2.exe downloads the main PseudoManuscrypt payload (game.exe, 0001759655eacb4e57bdf5e49c6e7585) from the URL:\
  hxxps://google\[.\]diragame\[.\]com/userf/3002/gogonami.exe.

**Variant Two (Glupteba Botnet Infrastructure)**

- Fake installer extracts main_setup_x86x64.exe (1fecb6eb98e8ee72bb5f006dd79c6f2f).

- main_setup_x86x64.exe installs and runs setup_installer.exe (5de2818ced29a1fedb9b24c1044ebd45).

- setup_installer.exe installs and executes setup_install.exe (58efaf6fa04a8d7201ab19170785ce85).

- setup_install.exe installs and runs metina_8.exe (839e9e4d6289eba53e40916283f73ca6).

- metina_8.exe extracts and executes the PseudoManuscrypt main payload (crack.exe, 89c8e5a1e24f05ede53b1cab721c53d8).

This infection chain involves the notorious Glupteba botnet, which has been observed since 2011. Glupteba is a multi-module platform capable of downloading and executing adware, spyware, crypto miners, ransomware, spam modules, and exploits. In Azure systems infected via Glupteba, rootkits and EternalBlue exploit modules have been detected, highlighting the sophisticated and persistent nature of this botnet.

**Additional Variant**

According to telemetry, on May 17, 2021, a PseudoManuscrypt installer (8acd95006ac6d1eabf37683d7ce31052) was downloaded from:\
hxxps://jom\[.\]diregame\[.\]live/userf/2201/google-game.exe. This URL has been used intermittently to distribute different malware families, underscoring the dynamic nature of the attacker infrastructure.

------------------------------------------------------------------------

This detailed infection overview highlights the complex multi-stage infection vectors and distribution methods impacting Azure environments, emphasizing the risks of downloading pirated or unauthorized software and the extensive spyware capabilities embedded in the PseudoManuscrypt malware.

------------------------------------------------------------------------

If you want, I can also provide remediation or detection recommendations tailored for Azure environments based on this information!

Certainly! Here is the rewritten version of your detailed report **in the context of spyware malware operating within an Azure environment**, preserving every point and technical detail:

------------------------------------------------------------------------

**Spyware Malware in Azure Environment: Detailed Analysis of PseudoManuscrypt Campaign**

**Searching for Additional Malware Components**

During our investigation for further components and variants of the spyware malware, we discovered **over 100 distinct versions of the PseudoManuscrypt loader**. Telemetry indicates that the **mass distribution of the loader variant analyzed in this report began on May 10, 2021**, although earlier variants appeared as early as **March 27, 2021**, well before the widespread attack phase.

The majority of early files found in March were **test builds**. The malware developer systematically stripped out parts of the malicious code, likely attempting to identify which segments triggered detection by Azure Defender or other antivirus tools integrated within the Azure environment.

Around the same time, the malware author implemented **dynamic importing of the VirtualAlloc function**, which is essential for allocating memory space to store the spyware payload. This payload is then loaded from the Azure VM’s system registry, making detection and removal more difficult.

Interestingly, some test build loaders contain **comments embedded in the executable’s metadata fields written in Chinese**, suggesting the developer’s linguistic background.

------------------------------------------------------------------------

**Main Component of the Malware**

The primary module of PseudoManuscrypt was identified as the payload responsible for installing the malware persistently on infected Azure VMs or endpoints. It reveals what type of data the threat actors target within the compromised Azure environment.

------------------------------------------------------------------------

**Installation Process in Azure VMs**

- The malware writes its code into a **special registry value under** HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID on the infected Azure VM.

- The **registry value name (CLSID)** is unique per system, generated from the system’s unique Machine GUID stored in HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography\MachineGuid.

- The malicious code is stored in the registry **in encrypted form** to evade detection.

- Next, the malware extracts a **loader DLL to either %TEMP% or %WinDir% folders** depending on the variant. The file name is randomized, matching the pattern \[0-Z\]{10}.tmp (e.g., I59RFRLY9J.tmp).

- To maintain persistence, the malware creates a **Windows service** configured to launch the loader DLL automatically upon system startup. Early samples used the service name **AppService**.

- To evade Azure Defender Antivirus and Windows Defender, the malware **adds itself to the antivirus exclusion list** by modifying the registry key:\
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths.

- After reboot, the loader executes, using the **MachineGuid value to locate and decrypt the payload in the registry**, and then executes the main malware module.

------------------------------------------------------------------------

**Malicious Activities — Version 1**

The initial PseudoManuscrypt version contained several modules focused on **stealing confidential information** from the infected Azure VM:

1.  **Keylogger**: Captures keystrokes including the active application window name and timestamp. The keylogger code was borrowed from another malware called Fabookie (Trojan.Win32.Fabookie), but PseudoManuscrypt only uses the keylogger component, not Fabookie’s banking credential theft modules — indicating a specific intelligence gathering focus rather than immediate monetization.

2.  **Clipboard Data Theft**: Intercepts any information copied by the user to the clipboard on the compromised VM.

3.  **VPN Credentials Theft**: Extracts VPN connection details from Windows service files used to configure VPN connections on the Azure VM, including:

    - %UserProfile%\Application Data\Microsoft\Network\Connections\pbk\rasphone.pbk

    - %ProgramData%\Microsoft\Network\Connections\pbk\rasphone.pbk\
      The malware attempts to obtain the VPN server address and any saved login credentials.

4.  **Event Logs Collection**: Reads Windows Application, System, and Security event logs. Though the exact use is uncertain, these logs may assist in stealing Remote Desktop Protocol (RDP) authentication data or in reconnaissance.

5.  **Microphone Audio Recording**: Can activate and record audio from microphones connected to the Azure VM upon receiving commands from its command-and-control (C2) server.

Notably, these modules operate concurrently, enabling attackers to correlate different data sources — for example, capturing VPN addresses from configuration files while harvesting login credentials via keylogging and clipboard interception.

------------------------------------------------------------------------

**Malicious Activities — Version 2 (Discovered July 2021)**

A more advanced variant added extended spying capabilities:

1.  **Screen Video Capture**: Records videos of the Azure VM’s screen, synchronized with other data such as keystrokes and clipboard content. This lets attackers observe precisely which fields are filled, window focus, mouse movements, and clicks. The module supports transparent windows (via Aero Peek) and uses the XviD 1.3.0 codec for video compression.

2.  **Credential Theft from QQ and WeChat**: Targets authentication data from these popular Asian messaging apps, indicating a possible geographical focus or victim profile.

3.  **Detailed System Profiling**: Gathers comprehensive system info, including Windows version/build, service pack, installed updates, Windows edition, and system role (e.g., domain controller status).

4.  **Network Connection Data Collection**: Extracts network adapter names and connection types (wired, Wi-Fi, fiber-optic, etc.).

5.  **Disabling Security Solutions**: Attempts to obtain **SeDebugPrivilege** and terminates processes related to numerous antivirus and security products commonly deployed in Azure environments, including but not limited to:\
    MsMpEng.exe (Windows Defender), sepWscSvc.exe, f-secure.exe, avgwdsvc.exe, BaiduSdSvc.exe, Mcshield.exe, etc.\
    It also deletes registry keys tied to security services named with substrings like "Symantec," "Defender," "QuickHeal," etc.

6.  **Network Process Enumeration**: Collects information on processes accepting TCP/UDP connections, aiding lateral movement or data exfiltration.

7.  **Self-Modification and Persistence Mechanisms**: Removes a file named “TestDown” in its directory, clears cached URLs in browsers, downloads a replacement executable from a remote URL, and sets it as hidden/system to evade detection.

8.  **Clearing Windows Event Logs**: Deletes logs from Application, Security, and System event logs to cover tracks.

9.  **Hosts File Manipulation**: Writes data from the C2 server to %System32%\drivers\etc\hosts to redirect or block user access to certain websites.

10. **C2 Text Message Exchange**: Can open an interactive chat window controlled by the attacker for real-time communication.

The new malware service runs under the name **"iexplore"** with a display name **"System Remote Data Simulation Layeerr"**, enhancing stealth by masquerading as a legitimate system process.

------------------------------------------------------------------------

**Additional Notable Behaviors**

- The malware supports **updating its executable and self-removal** upon command from the C2 server.

- One sample used **IP address 192.168.1.2 as a proxy**, suggesting malware customization based on the victim’s specific Azure network architecture.

- The latest version logs keystroke data to a local file at %System32%\9cda11af69ab0a2b6a9167f7131e7b93.key.

- When communicating with the C2 server, the malware sends HTTP headers indicating a **preferred language of Chinese**, e.g.:

- Accept-Language: zh-cn

- User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)

This may reflect the origin or linguistic preference of the threat actors.

------------------------------------------------------------------------

**Summary**

This comprehensive analysis of PseudoManuscrypt reveals a sophisticated spyware malware campaign targeting **Azure environments**. The malware uses advanced persistence techniques leveraging system registry and Windows services, evades detection by manipulating Defender exclusions, and steals a broad spectrum of sensitive information including keystrokes, VPN credentials, system logs, and multimedia data.

Attackers demonstrate strong operational security and modular development, adapting malware capabilities over time and customizing it to specific network architectures typical in Azure deployments.

------------------------------------------------------------------------

If you want, I can help format this into a formal report or prepare a mitigation plan focused on Azure Defender, Sentinel detection rules, and best practices for Azure VM hardening. Would that be useful?

Certainly! Here's a rewritten version of the provided text, adapted specifically to describe **Spyware malware targeting an Azure environment**, preserving all key points:

------------------------------------------------------------------------

**Spyware Malware Activity in Azure Environments**

**Exfiltration of Data to the Threat Actor**

In Azure environments infected by the spyware malware, data collected by the malicious software is transmitted back to the attacker-controlled command-and-control (C2) infrastructure. Our investigation identified four primary C2 servers actively receiving stolen information:

- email.yg9\[.\]me

- google.vrthcobj\[.\]com

- toa.mygametoa\[.\]com

- tob.mygametob\[.\]com

The malware leverages the **KCP protocol** to establish communication with these servers. KCP is a reliable UDP-based transport protocol that, according to its creators, achieves performance gains of approximately 10–20% compared to TCP. The threat actor uses a custom implementation of KCP within the malware.

Interestingly, as reported by FireEye, the particular KCP library used in this spyware has previously been linked only to malware attributed to the Chinese APT41 group, which targeted various industrial sectors such as engineering and defense. Our analysis of malware samples revealed no other known uses of this KCP implementation beyond these two contexts.

Some samples also communicate infection statistics to a dedicated server at d.diragame.com, which we assess to be part of a Malware-as-a-Service (MaaS) platform’s telemetry system.

------------------------------------------------------------------------

**Scope of Infection in Azure**

From **January 20 to November 10, 2021**, Kaspersky’s telemetry detected and blocked this spyware on over **35,000 virtual machines and endpoints in Azure environments** spanning **195 countries** worldwide.

Two notable spikes in detections correspond to the release dates of new malware versions on **March 27** and **May 15**.

Approximately **7.2% of all infected Azure systems are Industrial Control Systems (ICS)** deployed in critical infrastructure.

------------------------------------------------------------------------

**Geographic and Industrial Distribution of Infections**

Among non-ICS Azure systems compromised by the spyware, **29.4% are located in Russia (10.1%), India (10%), and Brazil (9.3%)**.

The distribution of ICS infections follows a similar pattern, with Asian and Middle Eastern countries showing significantly higher proportions (1.5 to 2 times more) of ICS infections relative to non-ICS.

Within the ICS subset:

- **31.5%** of infected machines support engineering workflows critical to industrial production, including defense and energy sectors.

- This includes systems used for **3D modeling, physical simulations, and digital twin creation**.

- Other affected ICS machines belong to building automation (12.5%), energy sector (1.8%), manufacturing (2.1%), construction (0.7%), public utilities (0.1%), and water treatment (0.1%).

- The majority (**51.2%**) of ICS infections are on general-purpose industrial control systems with no specific industry attribution.

------------------------------------------------------------------------

**High-Profile Targets and Connections**

Among the victims are enterprises linked to the **military-industrial complex** such as research laboratories. Notably, some targeted organizations have documented ties with groups previously hit by other high-profile attacks (e.g., the “Lazarus Targets Defense Industry with ThreatNeedle” campaign).

------------------------------------------------------------------------

**Attribution Clues Suggesting Chinese-Speaking Actors**

Several indicators point toward a possible Chinese-speaking threat actor:

1.  Malware binaries contain comments in **Chinese** within executable metadata.

2.  The unique KCP library used has only been seen in malware from the **APT41 Chinese group**.

3.  Malware explicitly sets **Chinese as the preferred language** during C2 communication.

4.  Embedded code connects to **Baidu**, a popular Chinese cloud storage service.

5.  New malware versions are uploaded between **11 AM and 7 PM GMT+8** (typical working hours in East Asia).

------------------------------------------------------------------------

**Conclusion and Risk Assessment**

While many aspects of this campaign remain unexplained, the presence of high-profile targets across multiple countries elevates the threat level. The sheer volume of infected Azure-hosted systems—especially critical ICS workloads—demands urgent attention from security teams responsible for cloud infrastructure and operational technology environments.

The targeting of engineering and digital twin environments raises the possibility of **industrial espionage** as a key objective.

Investigations are ongoing, and additional findings will be shared as they become available.

------------------------------------------------------------------------

**Recommendations for Azure Environments**

1.  **Deploy comprehensive endpoint protection** across all Azure VMs and workstations, with centralized management and regularly updated databases.

2.  Ensure all endpoint protection components remain active and require admin credentials to disable.

3.  Implement **Active Directory policies** restricting user logins to necessary systems only.

4.  **Restrict network connectivity** between Azure virtual networks, especially OT subnets; block unused ports.

5.  Use **multi-factor authentication (MFA)** with smart cards or tokens for VPN access and limit VPN initiation to specific IPs.

6.  Train employees on secure usage of cloud services, emails, and file downloads.

7.  Limit local and domain administrator privileges to essential use cases only.

8.  Restrict program ability to obtain sensitive privileges such as **SeDebugPrivilege**.

9.  Enforce strong password policies with complexity and regular rotation.

10. Consider **Managed Detection and Response (MDR)** services for expert security monitoring.

11. Use dedicated security solutions for OT systems, such as **Kaspersky Industrial CyberSecurity**, which protects industrial endpoints and monitors OT network traffic for malicious behavior.

------------------------------------------------------------------------

**Indicators of Compromise (IOCs) for Azure Defense Teams**

**Malware file hashes (MD5):**

- 1fecb6eb98e8ee72bb5f006dd79c6f2f

- 4da2c2abcf1df9749b64b34160bd3ebf

- 5dc7fbf2141f7dfe5215c94895bf959c

- 70e9416833b2f933b765042f8e1ea0bc

- 8074f73f7742309b033676cd03eb0928

- 8ae40c8418b2c36b58d2a43153544ddd

**File locations used by malware:**

- %WinDir%\System32\\0-Z\]{10}.tmp (e.g., I59RFRLY9J.tmp)

- %TEMP%\\0-Z\]{10}.tmp (e.g., I59RFRLY9J.tmp)

- %WinDir%\System32\9cda11af69ab0a2b6a9167f7131e7b93.key

**Security product detection names:**

- Trojan.Win64.Manuscrypt.do

**Command and Control URLs:**

- hxxp://email.yg9\[.\]me

- hxxp://google.vrthcobj\[.\]com

- hxxp://d.diragame\[.\]com

- hxxp://toa.mygametoa\[.\]com

- hxxp://tob.mygametob\[.\]com
