# Windows endpoint security policies

## Windows Security Experience Template

### Defender

- **Tamper Protection (Device):**

    This setting can be used to turn on controlled configuration or tamper protection to help protect important security features from unwanted changes and interference. If the setting is configured to Tamper Protection (On), this turns on tamper protection to enforce tamper protected settings to their secure defaults. This includes real-time protection, behavior monitoring, and more. Settings are configured with an MDM solution, such as Intune and is available in Windows 10 Enterprise E5 or equivalent subscriptions. If the setting is configured to Controlled Configuration (On), this turns on controlled configuration, which enforces the configuration coming from Intune exclusively and any non-configured settings to their secure defaults. Controlled configuration is applicable to Antivirus and Endpoint detection and response settings. If the setting is configured to OFF, this turns off Controlled Configuration and Tamper Protection.

    Settings:
    - Not configured
    - Off (Default)
    - Tamper Protection

### Windows Defender Security Center

1. **Disable Account Protection UI**: Use this policy setting to specify if to display the Account protection area in Windows Defender Security Center. If you disable or do not configure this setting, Windows defender Security Center will display this area.
2. **Disable App Browser UI**: Use this policy setting if you want to disable the display of the app and browser protection area in Windows Defender Security Center. If you disable or do not configure this setting, Windows defender Security Center will display this area. Value type is integer. Supported operations are Add, Get, Replace and Delete.
3. **Disable Clear Tpm Button**: Disable the Clear TPM button in Windows Security. Enabled:The Clear TPM button will be unavailable for use. Disabled:The Clear TPM button will be available for use on supported systems. Not configured:Same as Disabled. Supported values:0 - Disabled (default)1 - Enabled
4. **Disable Device Security UI**: Use this policy setting if you want to disable the display of the Device security area in the Windows Defender Security Center. If you disable or do not configure this setting, Windows defender Security Center will display this area.
5. **Disable Family UI**: Use this policy setting if you want to disable the display of the family options area in Windows Defender Security Center. If you disable or do not configure this setting, Windows defender Security Center will display this area. Value type is integer. Supported operations are Add, Get, Replace and Delete.
6. **Disable Health UI**: Use this policy setting if you want to disable the display of the device performance and health area in Windows Defender Security Center. If you disable or do not configure this setting, Windows defender Security Center will display this area. Value type is integer. Supported operations are Add, Get, Replace and Delete.
7. **Disable Network UI**: Use this policy setting if you want to disable the display of the firewall and network protection area in Windows Defender Security Center. If you disable or do not configure this setting, Windows defender Security Center will display this area. Value type is integer. Supported operations are Add, Get, Replace and Delete.
8. **Disable Enhanced Notifications**: Use this policy if you want Windows Defender Security Center to only display notifications which are considered critical. If you disable or do not configure this setting, Windows Defender Security Center will display critical and non-critical notifications to users. NoteIf Suppress notification is enabled then users will not see critical or non-critical messages. Value type is integer. Supported operations are Add, Get, Replace and Delete.
9. **Disable Tpm Firmware Update Warning**: Hide the recommendation to update TPM Firmware when a vulnerable firmware is detected. Enabled:Users will not be shown a recommendation to update their TPM Firmware. Disabled:Users will see a recommendation to update their TPM Firmware if Windows Security detects the system contains a TPM with vulnerable firmware. Not configured:Same as Disabled. Supported values:0 - Disabled (default)1 - Enabled
10. **Disable Virus UI**: Use this policy setting if you want to disable the display of the virus and threat protection area in Windows Defender Security Center. If you disable or do not configure this setting, Windows defender Security Center will display this area. Value type is integer. Supported operations are Add, Get, Replace and Delete.
11. **Hide Ransomware Data Recovery**: Use this policy setting to hide the Ransomware data recovery area in Windows Defender Security Center.
12. **Hide Windows Security Notification Area Control**: This policy setting hides the Windows Security notification area control. The user needs to either sign out and sign in or reboot the computer for this setting to take effect. Enabled:Windows Security notification area control will be hidden. Disabled:Windows Security notification area control will be shown. Not configured:Same as Disabled. Supported values:0 - Disabled (default)1 - Enabled
13. **Enable Customized Toasts**: Enable this policy to display your company name and contact options in the notifications. If you disable or do not configure this setting, or do not provide CompanyName and a minimum of one contact method (Phone using Skype, Email, Help portal URL) Windows Defender Security Center will display a default notification text. Value type is integer. Supported operations are Add, Get, Replace, and Delete.
14. **Enable In App Customization**: Enable this policy to have your company name and contact options displayed in a contact card fly out in Windows Defender Security Center. If you disable or do not configure this setting, or do not provide CompanyName and a minimum of one contact method (Phone using Skype, Email, Help portal URL) Windows Defender Security Center will not display the contact card fly out notification. Value type is integer. Supported operations are Add, Get, Replace, and Delete.

## Windows Defender Antivirus

Windows Defender Antivirus is the next-generation protection component of Microsoft Defender for Endpoint. Next-generation protection brings together machine learning, big-data analysis, in-depth threat resistance research, and cloud infrastructure to protect devices in your enterprise organization.

1. **Allow Archive Scanning**: Allows or disallows scanning of archives.
2. **Allow Behavior Monitoring**: Allows or disallows Windows Defender Behavior Monitoring functionality.
3. **Allow Cloud Protection**: To best protect your PC, Windows Defender will send information to Microsoft about any problems it finds. Microsoft will analyze that information, learn more about problems affecting you and other customers, and offer improved solutions.
4. **Allow Email Scanning**: Allows or disallows scanning of email.
5. **Allow Full Scan On Mapped Network Drives**: Allows or disallows a full scan of mapped network drives.
6. **[Deprecated] Allow Intrusion Prevention System**: Allows or disallows Windows Defender Intrusion Prevention functionality. This setting is deprecated and no longer has impact on devices.
7. **Allow scanning of all downloaded files and attachments**: Allows or disallows Windows Defender IOAVP Protection functionality.
8. **Allow Realtime Monitoring**: Allows or disallows Windows Defender Realtime Monitoring functionality.
9. **Allow Scanning Network Files**: Allows or disallows a scanning of network files.
10. **Allow Script Scanning**: Allows or disallows Windows Defender Script Scanning functionality.
11. **Allow User UI Access**: Allows or disallows user access to the Windows Defender UI. If disallowed, all Windows Defender notifications will also be suppressed.
12. **Avg CPU Load Factor**: Represents the average CPU load factor for the Windows Defender scan (in percent). The default value is 50.
13. **Archive Max Depth**: Specify the maximum folder depth to extract from archive files for scanning. If this configuration is off or not set, the default value (0) is applied, and all archives are extracted up to the deepest folder for scanning.
14. **Archive Max Size**: Specify the maximum size, in KB, of archive files to be extracted and scanned. If this configuration is off or not set, the default value (0) is applied, and all archives are extracted and scanned regardless of size.
15. **Check For Signatures Before Running Scan**: This policy setting allows you to manage whether a check for new virus and spyware definitions will occur before running a scan. This setting applies to scheduled scans as well as the command line mpcmdrun -SigUpdate, but it has no effect on scans initiated manually from the user interface. If you enable this setting, a check for new definitions will occur before running a scan. If you disable this setting or do not configure this setting, the scan will start using the existing definitions. Supported values:0 (default) - Disabled1 - EnabledOMA-URI Path: `. /Vendor/MSFT/Policy/Config/Defender/CheckForSignaturesBeforeRunningScan`
16. **Cloud Block Level**: This policy setting determines how aggressive Windows Defender Antivirus will be in blocking and scanning suspicious files. Value type is integer. If this setting is on, Windows Defender Antivirus will be more aggressive when identifying suspicious files to block and scan; otherwise, it will be less aggressive and therefore block and scan with less frequency. For more information about specific values that are supported, see the Windows Defender Antivirus documentation site. NoteThis feature requires the Join Microsoft MAPS setting enabled in order to function.
17. **Cloud Extended Timeout**: This feature allows Windows Defender Antivirus to block a suspicious file for up to 60 seconds, and scan it in the cloud to make sure it's safe. Value type is integer, range is 0 - 50. The typical cloud check timeout is 10 seconds. To enable the extended cloud check feature, specify the extended time in seconds, up to an additional 50 seconds. For example, if the desired timeout is 60 seconds, specify 50 seconds in this setting, which will enable the extended cloud check feature, and will raise the total time to 60 seconds. NoteThis feature depends on three other MAPS settings the must all be enabled- Configure the 'Block at First Sight' feature; Join Microsoft MAPS; Send file samples when further analysis is required.
18. **Days To Retain Cleaned Malware**: Time period (in days) that quarantine items will be stored on the system. The default value is 0, which keeps items in quarantine, and does not automatically remove them.
19. **Disable Catchup Full Scan**: This policy setting allows you to configure catch-up scans for scheduled full scans. A catch-up scan is a scan that is initiated because a regularly scheduled scan was missed. Usually these scheduled scans are missed because the computer was turned off at the scheduled time. If you disable or do not configure this setting, catch-up scans for scheduled full scans will be turned on. If a computer is offline for two consecutive scheduled scans, a catch-up scan is started the next time someone logs on to the computer. If there is no scheduled scan configured, there will be no catch-up scan run. If you enable this setting, catch-up scans for scheduled full scans will be disabled. Supported values:0 - Disabled1 - Enabled (default)OMA-URI Path: `. /Vendor/MSFT/Policy/Config/Defender/DisableCatchupFullScan`
20. **Disable Catchup Quick Scan**: This policy setting allows you to configure catch-up scans for scheduled quick scans. A catch-up scan is a scan that is initiated because a regularly scheduled scan was missed. Usually these scheduled scans are missed because the computer was turned off at the scheduled time. If you enable this setting, catch-up scans for scheduled quick scans will be turned on. If a computer is offline for two consecutive scheduled scans, a catch-up scan is started the next time someone logs on to the computer. If there is no scheduled scan configured, there will be no catch-up scan run. If you disable or do not configure this setting, catch-up scans for scheduled quick scans will be turned off. Supported values:0 - Disabled1 - Enabled (default)OMA-URI Path: `. /Vendor/MSFT/Policy/Config/Defender/DisableCatchupQuickScan`
21. **Enable Low CPU Priority**: This policy setting allows you to enable or disable low CPU priority for scheduled scans. If you enable this setting, low CPU priority will be used during scheduled scans. If you disable or do not configure this setting, not changes will be made to CPU priority for scheduled scans. Supported values:0 - Disabled (default)1 - Enabled
22. **Enable Network Protection**: This policy allows you to turn network protection on (block/audit) or off. Network protection protects employees using any app from accessing phishing scams, exploit-hosting sites, and malicious content on the Internet. This includes preventing third-party browsers from connecting to dangerous sites. Value type is integer. If you enable this setting, network protection is turned on and employees can't turn it off. Its behavior can be controlled by the following options: Block and Audit. If you enable this policy with the Block option, users/apps will be blocked from connecting to dangerous domains. You will be able to see this activity in Windows Defender Security Center. If you enable this policy with the Audit option, users/apps will not be blocked from connecting to dangerous domains. However, you will still see this activity in Windows Defender Security Center. If you disable this policy, users/apps will not be blocked from connecting to dangerous domains. You will not see any network activity in Windows Defender Security Center. If you do not configure this policy, network blocking will be disabled by default.
23. **Excluded Extensions**: Allows an administrator to specify a list of file type extensions to ignore during a scan. Each file type in the list must be separated by a |. For example, lib|obj.
24. **Excluded Paths**: Allows an administrator to specify a list of directory paths to ignore during a scan. Each path in the list must be in a new line.
25. **Excluded Processes**: Allows an administrator to specify a list of files opened by processes to ignore during a scan. ImportantThe process itself is not excluded from the scan, but can be by using the Defender/ExcludedPaths policy to exclude its path. Each file type must be separated by a |. For example, C:\Example. exe|C:\Example1. exe.
26. **PUA Protection**: Specifies the level of detection for potentially unwanted applications (PUAs). Windows Defender alerts you when potentially unwanted software is being downloaded or attempts to install itself on your computer.
27. **Real Time Scan Direction**: Controls which sets of files should be monitored. Note If AllowOnAccessProtection is not allowed, then this configuration can be used to monitor specific files.
28. **Scan Parameter**: Selects whether to perform a quick scan or full scan.
29. **Schedule Quick Scan Time**: Selects the time of day that the daily Windows Defender quick scan should run. For example, a value of 0=12:00AM, a value of 60=1:00AM, a value of 120=2:00, and so on, up to a value of 1380=11:00PM. The default value is 120
30. **Schedule Scan Day**: Selects the day that the Windows Defender scan should run. Note The scan type will depends on what scan type is selected in the Defender/ScanParameter setting.
31. **Schedule Scan Time**: Selects the time of day that the weekly Windows Defender scan should run. Note The scan type will depends on what scan type is selected in the Defender/ScanParameter setting. For example, a value of 0=12:00AM, a value of 60=1:00AM, a value of 120=2:00, and so on, up to a value of 1380=11:00PM. The default value is 120.
32. **Signature Update Fallback Order**: This policy setting allows you to define the order in which different definition update sources should be contacted. The value of this setting should be entered as a pipe-separated string enumerating the definition update sources in order. Possible values are:InternalDefinitionUpdateServerMicrosoftUpdateServerMMPCFileSharesFor example: InternalDefinitionUpdateServer | MicrosoftUpdateServer | MMPCIf you enable this setting, definition update sources will be contacted in the order specified. Once definition updates have been successfully downloaded from one specified source, the remaining sources in the list will not be contacted. If you disable or do not configure this setting, definition update sources will be contacted in a default order. OMA-URI Path: `. /Vendor/MSFT/Policy/Config/Defender/SignatureUpdateFallbackOrder`
33. **Signature Update File Shares Sources**: This policy setting allows you to configure UNC file share sources for downloading definition updates. Sources will be contacted in the order specified. The value of this setting should be entered as a pipe-separated string enumerating the definition update sources. For example: \unc1\Signatures | \unc2\SignaturesThe list is empty by default. If you enable this setting, the specified sources will be contacted for definition updates. Once definition updates have been successfully downloaded from one specified source, the remaining sources in the list will not be contacted. If you disable or do not configure this setting, the list will remain empty by default and no sources will be contacted. OMA-URI Path: . /Vendor/MSFT/Policy/Config/Defender/SignatureUpdateFileSharesSources
34. **Signature Update Interval**: Specifies the interval (in hours) that will be used to check for signatures, so instead of using the ScheduleDay and ScheduleTime the check for new signatures will be set according to the interval. A value of 0 means no check for new signatures, a value of 1 means to check every hour, a value of 2 means to check every two hours, and so on, up to a value of 24, which means to check every day. The default value is 8. OMA-URI Path: . /Vendor/MSFT/Policy/Config/Defender/SignatureUpdateInterval
35. **Submit Samples Consent**: Checks for the user consent level in Windows Defender to send data. If the required consent has already been granted, Windows Defender submits them. If not, (and if the user has specified never to ask), the UI is launched to ask for user consent (when Defender/AllowCloudProtection is allowed) before sending data.
36. **Disable Local Admin Merge**: When this value is set to false, it allows a local admin the ability to specify some settings for complex list type that will then merge /override the Preference settings with the Policy settings
37. **Allow On Access Protection**: Allows or disallows Windows Defender On Access Protection functionality.

### Threat Severity Default Action

01. **Remediation action for Severe threats**:

    - Clean - Service tries to recover files and try to disinfect.
    - Quarantine - Moves files to quarantine.
    - Remove - Remove files from system.
    - Allow - Allow file or do none of the above actions.
    - User defined - Requires user to make a decision on which action to take.
    - Block - Blocks file execution.

02. **Remediation action for Moderate severity threats**:

    - Clean - Service tries to recover files and try to disinfect.
    - Quarantine - Moves files to quarantine.
    - Remove - Remove files from system.
    - Allow - Allow file or do none of the above actions.
    - User defined - Requires user to make a decision on which action to take.
    - Block - Blocks file execution.

03. **Remediation action for Low severity threats**:

    - Clean - Service tries to recover files and try to disinfect.
    - Quarantine - Moves files to quarantine.
    - Remove - Remove files from system.
    - Allow - Allow file or do none of the above actions.
    - User defined - Requires user to make a decision on which action to take.
    - Block - Blocks file execution.

04. **Remediation action for High severity threats**:

    - Clean - Service tries to recover files and try to disinfect.
    - Quarantine - Moves files to quarantine.
    - Remove - Remove files from system.
    - Allow - Allow file or do none of the above actions.
    - User defined - Requires user to make a decision on which action to take.
    - Block - Blocks file execution.

05. **Allow Network Protection Down Level**: This settings controls whether Network Protection is allowed to be configured into block or audit mode on windows downlevel of RS3. If false, the value of EnableNetworkProtection will be ignored.

    - Network protection will be enabled downlevel
    - Network protection will be disabled downlevel

06. **Allow Datagram Processing On Win Server**: This settings controls whether Network Protection is allowed to enable datagram processing on Windows Server. If false, the value of DisableDatagramProcessing will be ignored and default to disabling Datagram inspection.
07. **Disable Dns Over Tcp Parsing**: This setting disables DNS over TCP Parsing for Network Protection.
08. **Disable Http Parsing**: This setting disables HTTP Parsing for Network Protection.
09. **Disable Ssh Parsing**: This setting disables HTTP Parsing for Network Protection.
10. **Disable Tls Parsing**: This setting disables SSH Parsing for Network Protection.
11. **[Deprecated] Enable Dns Sinkhole**: This setting is deprecated and no longer has impact on devices. This setting enables the DNS Sinkhole feature for Network Protection, respecting the value of EnableNetworkProtection for block vs audit, does nothing in inspect mode.
12. **Engine Updates Channel**: Enable this policy to specify when devices receive Microsoft Defender engine updates during the monthly gradual rollout.
13. **Metered Connection Updates**: Allow managed devices to update through metered connections. Default is 0 - not allowed, 1 - allowed
14. **Platform Updates Channel**: Enable this policy to specify when devices receive Microsoft Defender platform updates during the monthly gradual rollout.
15. **Security Intelligence Updates Channel**: Enable this policy to specify when devices receive Microsoft Defender security intelligence updates during the daily gradual rollout.
16. **Randomize Schedule Task Times**: In Microsoft Defender Antivirus, randomize the start time of the scan to any interval from 0 to 23 hours. This can be useful in virtual machines or VDI deployments.
17. **Scheduler Randomization Time**: This setting allows you to configure the scheduler randomization in hours. The randomization interval is [1 - 23] hours. For more information on the randomization effect please check the RandomizeScheduleTaskTimes setting.
18. **Disable Core Service ECS Integration**: Turn off ECS integration for Defender core service.
19. **Disable Core Service Telemetry**: Turn off OneDsCollector telemetry for Defender core service

## Attack Surface Reduction Rules

Attack surface reduction rules target behaviors that malware and malicious apps typically use to infect computers, including: Executable files and scripts used in Office apps or web mail that attempt to download or run files Obfuscated or otherwise suspicious scripts Behaviors that apps don't usually initiate during normal day-to-day work

01. **Block Adobe Reader from creating child processes**: This rule prevents attacks by blocking Adobe Reader from creating additional processes. `Block` / `Audit` / `Warn` / `Off`
02. **Block process creations originating from PSExec and WMI commands**: This rule blocks processes created through PsExec and WMI from running. Both PsExec and WMI can remotely execute code, so there is a risk of malware abusing this functionality for command and control purposes, or to spread an infection throughout an organization's network. `Block` / `Audit` / `Warn` / `Off`
03. **Block execution of potentially obfuscated scripts**: This rule detects suspicious properties within an obfuscated script.
04. **Block persistence through WMI event subscription**: This rule prevents malware from abusing WMI to attain persistence on a device. Fileless threats employ various tactics to stay hidden, to avoid being seen in the file system, and to gain periodic execution control. Some threats can abuse the WMI repository and event model to stay hidden.
05. **Block Win32 API calls from Office macros**: This rule prevents VBA macros from calling Win32 APIs.
06. **Block Office applications from creating executable content**: This rule prevents Office apps, including Word, Excel, and PowerPoint, from creating potentially malicious executable content, by blocking malicious code from being written to disk.
07. **Block credential stealing from the Windows local security authority subsystem**: This rule helps prevent credential stealing, by locking down Local Security Authority Subsystem Service (LSASS).
08. **Block use of copied or impersonated system tools**: This rule blocks executables that impersonate or are copies of system tools & binaries found on the machine.
09. **Block executable files from running unless they meet a prevalence, age, or trusted list criterion**: This rule blocks the following file types from launching unless they meet prevalence or age criteria, or they're in a trusted list or an exclusion list: Executable files (such as .exe, .dll, or .scr).
10. **Block JavaScript or VBScript from launching downloaded executable content**: This rule prevents scripts from launching potentially malicious downloaded content. Malware written in JavaScript or VBScript often acts as a downloader to fetch and launch other malware from the Internet.
11. **Block Office communication application from creating child processes**: This rule prevents Outlook from creating child processes, while still allowing legitimate Outlook functions.
12. **Block Office applications from injecting code into other processes**: This rule blocks code injection attempts from Office apps into other processes.
13. **Block all Office applications from creating child processes**: This rule blocks Office apps from creating child processes. This includes Word, Excel, PowerPoint, OneNote, and Access.
14. **Block rebooting machine in Safe Mode**: This rule blocks attempts of restarting a machine in SAFE mode.
15. **Block Webshell creation for Servers**: This rule block webshell creation for servers.
16. **Block untrusted and unsigned processes that run from USB**: With this rule, admins can prevent unsigned or untrusted scripts (such as VBScript, JavaScript) and executables (such as .exe, .dll, .scr files) from removable USB drives, including attached SD cards, from running.
17. **Use advanced protection against ransomware**: This rule provides an extra layer of protection against ransomware. It scans executable files entering the system to determine whether they're trustworthy. If the files closely resemble ransomware, this rule blocks them from running, unless they're in a trusted list or an exclusion list.
18. **Block executable content from email client and webmail**: This rule blocks the following file types from launching from email opened within the Microsoft Outlook application, or Outlook.com and other popular webmail providers: Executable files (such as .exe, .dll, or .scr), Script files (such as a PowerShell .ps, VisualBasic .vbs, or JavaScript .js file).
19. **Block abuse of exploited vulnerable signed drivers (Device)**: This rule prevents an application from writing a vulnerable signed driver to disk. In-the-wild, vulnerable signed drivers can be exploited by local applications - that have sufficient privileges - to gain access to the kernel. Vulnerable signed drivers enable attackers to disable or circumvent security solutions, eventually leading to system compromise. The Block abuse of exploited vulnerable signed drivers rule does not block a driver already existing on the system from being loaded.
20. **Enable Controlled Folder Access**: The previous name was EnableGuardMyFolders and changed to EnableControlledFolderAccess. This policy enables setting the state (On/Off/Audit) for the controlled folder access feature. The controlled folder access feature removes modify and delete permissions from untrusted applications to certain folders such as My Documents.  Value type is integer and the range is 0 - 2.

    - Controlled Folder Access Protected Folders
    - Controlled Folder Access Allowed Applications

## Microsoft Defender Firewall

Windows Firewall with Advanced Security is an important part of a layered security model. By providing host-based, two-way network traffic filtering for a device, Windows Firewall blocks unauthorized network traffic flowing into or out of the local device.

The Firewall configuration service provider configures the Windows Defender Firewall global settings, per profile settings, as well as the desired set of custom rules to be enforced on the device. Using the Firewall CSP the IT admin can now manage non-domain devices, and reduce the risk of network security threats across all systems connecting to the corporate network.

01. **Certificate revocation list verification**: This value specifies how certificate revocation list (CRL) verification is enforced. The value MUST be 0, 1, or 2. A value of 0 disables CRL checking. A value of 1 specifies that CRL checking is attempted and that certificate validation fails only if the certificate is revoked. Other failures that are encountered during CRL checking (such as the revocation URL being unreachable) do not cause certificate validation to fail. A value of 2 means that checking is required and that certificate validation fails if any error is encountered during CRL processing. The merge law for this option is to let the value of the GroupPolicyRSoPStore win if it is configured; otherwise, use the local store value. `Attempt` or `Require`
02. **Disable Stateful Ftp**: This value is an on/off switch. If off, the firewall performs stateful File Transfer Protocol (FTP) filtering to allow secondary connections. FALSE means off; TRUE means on, so the stateful FTP is disabled. The merge law for this option is to let "on" values win. `False` or `True`
03. **Enable Packet Queue**: This value specifies how scaling for the software on the receive side is enabled for both the encrypted receive and clear text forward path for the IPsec tunnel gateway scenario. Use of this option also ensures that the packet order is preserved. The data type for this option value is a integer and is a combination of flags. A value of 0x00 indicates that all queuing is to be disabled. A value of 0x01 specifies that inbound encrypted packets are to be queued. A value of 0x02 specifies that packets are to be queued after decryption is performed for forwarding. `Disabled` or `Queueu Inbound` or `Queueu Outbound`
04. **IPsec Exceptions**: This value configures IPsec exceptions and MUST be a combination of the valid flags that are defined in IPSEC_EXEMPT_VALUES; therefore, the maximum value MUST always be IPSEC_EXEMPT_MAX-1 for servers supporting a schema version of 0x0201 and IPSEC_EXEMPT_MAX_V2_0-1 for servers supporting a schema version of 0x0200. If the maximum value is exceeded when the method RRPC_FWSetGlobalConfig (Opnum 4) is called, the method returns `ERROR_INVALID_PARAMETER`. This error code is returned if no other preceding error is discovered. The merge law for this option is to let the value of the GroupPolicyRSoPStore win if it is configured; otherwise, use the local store value.

    - FWGLOBALCONFIGIPSECEXEMPTIONS: No IPsec Exemptions
    - Exempt neighbour discover Ipv6 ICMP-type codes from IPsec
    - Exempt ICMP from IPsec
    - Exempt router dicover IPv6 ICMP-types codes from IPsec
    - Exempt both IPv4 and IPv6 DHCP traffic from IPsec

05. **Opportunistically Match Auth Set Per KM**: This value is used as an on/off switch. When this option is false, keying modules MUST ignore the entire authentication set if they do not support all of the authentication suites specified in the set. When this option is true, keying modules MUST ignore only the authentication suites that they don’t support. For schema versions 0x0200, 0x0201, and 0x020A, this value is invalid and MUST NOT be used. `False` or `true`
06. **Preshared Key Encoding**: Specifies the preshared key encoding that is used. MUST be a valid value from the PRESHARED_KEY_ENCODING_VALUES enumeration. Default is 1 [UTF-8]. The merge law for this option is to let the value of the GroupPolicyRSoPStore win if it is configured; otherwise, use the local store value. `None` or `UTF8`
07. **Security association idle time**: This value configures the security association idle time, in seconds. Security associations are deleted after network traffic is not seen for this specified period of time. The value MUST be in the range of 300 to 3,600 inclusive. The merge law for this option is to let the value of the GroupPolicyRSoPStore win if it is configured; otherwise, use the local store value.
08. **Enable Domain Network Firewall**: This value is an on/off switch for the firewall and advanced security enforcement. If this value is false, the server MUST NOT block any network traffic, regardless of other policy settings. The merge law for this option is to let the value of the GroupPolicyRSoPStore win if it is configured; otherwise, the local store value is used.
09. **Enable Private Network Firewall**: This value is an on/off switch for the firewall and advanced security enforcement. If this value is false, the server MUST NOT block any network traffic, regardless of other policy settings. The merge law for this option is to let the value of the GroupPolicyRSoPStore win if it is configured; otherwise, the local store value is used.
10. **Enable Public Network Firewall**: This value is an on/off switch for the firewall and advanced security enforcement. If this value is false, the server MUST NOT block any network traffic, regardless of other policy settings. The merge law for this option is to let the value of the GroupPolicyRSoPStore win if it is configured; otherwise, the local store value is used.

### VM Creator Id

- **Target**: Settings for the Windows Firewall for Hyper-V containers. Each setting applies on a per-VM Creator basis. `None` or `Windows Sub-system for Linux`

### Auditing

01. **Object Access Audit Filtering Platform Connection**: This policy setting allows you to audit connections that are allowed or blocked by the Windows Filtering Platform (WFP). The following events are included: The Windows Firewall Service blocks an application from accepting incoming connections on the network. The WFP allows a connection. The WFP blocks a connection. The WFP permits a bind to a local port. The WFP blocks a bind to a local port. The WFP allows a connection. The WFP blocks a connection. The WFP permits an application or service to listen on a port for incoming connections. The WFP blocks an application or service to listen on a port for incoming connections. If you configure this policy setting, an audit event is generated when connections are allowed or blocked by the WFP. Success audits record events generated when connections are allowed and Failure audits record events generated when connections are blocked. If you do not configure this policy setting, no audit event is generated when connected are allowed or blocked by the WFP. `Off` or `Success` or `Failure` or `Success + Failure`

02. **Object Access Audit Filtering Platform Packet Drop**: This policy setting allows you to audit packets that are dropped by Windows Filtering Platform (WFP). `Off` or `Success` or `Failure` or `Success + Failure`

### Network List Manager

01. **Allowed Tls Authentication Endpoints**
02. **Configured Tls Authentication Network Name**

## Microsoft Defender Firewall Rules

Windows Firewall allows administrators to define granular Firewall rules. Define firewall rules with specific ports, protocols, applications and networks, to allow or block network traffic.

The Firewall configuration service provider configures the Windows Defender Firewall global settings, per profile settings, as well as the desired set of custom rules to be enforced on the device. Using the Firewall CSP the IT admin can now manage non-domain devices, and reduce the risk of network security threats across all systems connecting to the corporate network.

Need to work

## Defender Update Controls

Configure the gradual release rollout of Defender Updates to targeted device groups. Use a ringed approach to test, validate, and rollout updates to devices through release channels. Updates available are platform, engine, security intelligence updates. These policy types have pause, resume, manual rollback commands similar to Windows Update ring policies.

01. **Engine Updates Channel**: Enable this policy to specify when devices receive Microsoft Defender engine updates during the monthly gradual rollout.

    - Not configured: The device will stay upto date automatically during the gradual release cycle. Suitable for most devices.
    - Beta channel: First to receive new updates.
    - Current channel (Preview): Update provided earliest during monthly gradual updates.
    - Current channel (Staged): Updates provided after the monthly gradual updates.
    - Current channel (Broad): Updates provided only after the monthly gradual updates.
    - Critical - Time Delay: Updates provided 48 hours after monthly update. Suggested for critical environments only.

02. **Platform Updates Channel**: Enable this policy to specify when devices receive Microsoft Defender platform updates during the monthly gradual rollout.

    - Not configured: The device will stay upto date automatically during the gradual release cycle. Suitable for most devices.
    - Beta channel: First to receive new updates.
    - Current channel (Preview): Update provided earliest during monthly gradual updates.
    - Current channel (Staged): Updates provided after the monthly gradual updates.
    - Current channel (Broad): Updates provided only after the monthly gradual updates.
    - Critical - Time Delay: Updates provided 48 hours after monthly update. Suggested for critical environments only.

03. **Security Intelligence Updates Channel**: Enable this policy to specify when devices receive Microsoft Defender security intelligence updates during the daily gradual rollout.

    - Not configured: The device will stay upto date automatically during the gradual release cycle. Suitable for most devices.
    - Current channel (Staged): Updates provided after the monthly gradual updates.
    - Current channel (Broad): Updates provided only after the monthly gradual updates.

## Endpoint Detection and Response

1. **Microsoft Defender for Endpoint client configuration package type**: Microsoft Defender for Endpoint endpoint detection and response capabilities provide advanced attack detections that are near real-time and actionable. Security analysts can prioritize alerts effectively, gain visibility into the full scope of a breach, and take response actions to remediate threats.

    - `Onboarding`: Set Windows Defender Advanced Threat Protection Onboarding blob and initiate onboarding to Windows Defender Advanced Threat Protection
    - `Offboarding (Device)`: Set Windows Defender Advanced Threat Protection Offboarding blob and initiate offboarding

2. **Sample Sharing**: Return or set Windows Defender Advanced Threat Protection Sample Sharing configuration parameter: 0 - none, 1 - All
3. **[Deprecated] Telemetry Reporting Frequency**: Return or set Windows Defender Advanced Threat Protection telemetry reporting frequency. Allowed values are: 1 - Normal, 2 - Expedite. This setting is deprecated and no longer has impact on devices.

## Device Control

Microsoft recommends a layered approach to securing removable media, and Microsoft Defender for Endpoint provides multiple monitoring and control features to help prevent threats in unauthorized peripherals from compromising your devices.

Settings in the 'Defender' and 'Device Control' categories configure device control for Microsoft Defender for Endpoint (MDE). All other categories configure the native device control capabilities of the Windows operating system.

### Defender settings

01. **Device Control Enabled**: Control Device Control feature. `Enabled` or `Disabled`
02. **Allow Full Scan Removable Drive Scanning**: Allows or disallows a full scan of removable drives. During a quick scan, removable drives may still be scanned. `Not allowed` or `Allowed`
03. **Default Enforcement**: Control Device Control default enforcement. This is the enforcement applied if there are no policy rules present or at the end of the policy rules evaluation none were matched. `Allow` or `Deny`
04. **Secured Devices Configuration**: Defines which device's primary ids should be secured by Defender Device Control. The primary id values should be pipe (|) separated. Example: RemovableMediaDevices|CdRomDevices. If this configuration is not set the default value will be applied, meaning all supported devices will be secured. Currently supported primary ids are: RemovableMediaDevices, CdRomDevices, WpdDevices, PrinterDevices.

    - Removable media devices
    - CD ROM devices
    - WPD devices
    - Printer devices

### Device Control Sub-settings

Set up access controls for devices you defined in 'Reusable settings'. Ensure the 'Device Control Enabled' setting is activated for these rules to apply to devices. Note: For these rules to apply, devices defined here must be onboarded to Microsoft Defender for Endpoint (MDE).

### Device Installation Restrictions

01. **Apply layered order of evaluation for Allow and Prevent device installation policies across all device match criteria**: This policy setting will change the evaluation order in which Allow and Prevent policy settings are applied when more than one install policy setting is applicable for a given device. Enable this policy setting to ensure that overlapping device match criteria is applied based on an established hierarchy where more specific match criteria supersedes less specific match criteria. The hierarchical order of evaluation for policy settings that specify device match criteria is as follows: Device instance IDs > Device IDs > Device setup class > Removable devices Device instance IDs 1. Prevent installation of devices using drivers that match these device instance IDs 2. Allow installation of devices using drivers that match these device instance IDs Device IDs 3. Prevent installation of devices using drivers that match these device IDs 4. Allow installation of devices using drivers that match these device IDs Device setup class 5. Prevent installation of devices using drivers that match these device setup classes 6. Allow installation of devices using drivers that match these device setup classes Removable devices 7. Prevent installation of removable devices NOTE: This policy setting provides more granular control than the "Prevent installation of devices not described by other policy settings" policy setting. If these conflicting policy settings are enabled at the same time, the "Apply layered order of evaluation for Allow and Prevent device installation policies across all device match criteria" policy setting will be enabled and the other policy setting will be ignored. If you disable or do not configure this policy setting, the default evaluation is used. By default, all "Prevent installation..." policy settings have precedence over any other policy setting that allows Windows to install a device. `Enabled` or `Disabled`
02. **Allow installation of devices that match any of these device IDs**: This policy setting allows you to specify a list of Plug and Play hardware IDs and compatible IDs for devices that Windows is allowed to install. Use this policy setting only when the "Prevent installation of devices not described by other policy settings" policy setting is enabled. Other policy settings that prevent device installation take precedence over this one. If you enable this policy setting, Windows is allowed to install or update any device whose Plug and Play hardware ID or compatible ID appears in the list you create, unless another policy setting specifically prevents that installation (for example, the "Prevent installation of devices that match any of these device IDs" policy setting, the "Prevent installation of devices for these device classes" policy setting, or the "Prevent installation of removable devices" policy setting). If you enable this policy setting on a remote desktop server, the policy setting affects redirection of the specified devices from a remote desktop client to the remote desktop server. If you disable or do not configure this policy setting, and no other policy setting describes the device, the "Prevent installation of devices not described by other policy settings" policy setting determines whether the device can be installed. `Enabled` or `Disabled`
03. **Allow installation of devices that match any of these device instance IDs**: This policy setting allows you to specify a list of Plug and Play device instance IDs for devices that Windows is allowed to install. This policy setting is intended to be used only when the "Apply layered order of evaluation for Allow and Prevent device installation policies across all device match criteria" policy setting is enabled, however it may also be used with the "Prevent installation of devices not described by other policy settings" policy setting for legacy policy definitions. When this policy setting is enabled together with the "Apply layered order of evaluation for Allow and Prevent device installation policies across all device match criteria" policy setting, Windows is allowed to install or update any device whose Plug and Play device instance ID appears in the list you create, unless another policy setting at the same or higher layer in the hierarchy specifically prevents that installation, such as the following policy settings: - Prevent installation of devices that match any of these device instance IDs If the "Apply layered order of evaluation for Allow and Prevent device installation policies across all device match criteria" policy setting is not enabled with this policy setting, then any other policy settings specifically preventing installation will take precedence. NOTE: The "Prevent installation of devices not described by other policy settings" policy setting has been replaced by the "Apply layered order of evaluation for Allow and Prevent device installation policies across all device match criteria" policy setting for supported target Windows 10 versions. It is recommended that you use the "Apply layered order of evaluation for Allow and Prevent device installation policies across all device match criteria" policy setting when possible. Alternatively, if this policy setting is enabled together with the "Prevent installation of devices not described by other policy settings" policy setting, Windows is allowed to install or update any device whose Plug and Play device instance ID appears in the list you create, unless another policy setting specifically prevents that installation (for example, the "Prevent installation of devices that match any of these device IDs" policy setting, the "Prevent installation of devices for these device classes" policy setting, the "Prevent installation of devices that match any of these device instance IDs" policy setting, or the "Prevent installation of removable devices" policy setting). If you enable this policy setting on a remote desktop server, the policy setting affects redirection of the specified devices from a remote desktop client to the remote desktop server. If you disable or do not configure this policy setting, and no other policy setting describes the device, the "Prevent installation of devices not described by other policy settings" policy setting determines whether the device can be installed. `Enabled` or `Disabled`
04. **Allow installation of devices using drivers that match these device setup classes**: This policy setting allows you to specify a list of device setup class globally unique identifiers (GUIDs) for device drivers that Windows is allowed to install. Use this policy setting only when the "Prevent installation of devices not described by other policy settings" policy setting is enabled. Other policy settings that prevent device installation take precedence over this one. If you enable this policy setting, Windows is allowed to install or update device drivers whose device setup class GUIDs appear in the list you create, unless another policy setting specifically prevents installation (for example, the "Prevent installation of devices that match these device IDs" policy setting, the "Prevent installation of devices for these device classes" policy setting, or the "Prevent installation of removable devices" policy setting). If you enable this policy setting on a remote desktop server, the policy setting affects redirection of the specified devices from a remote desktop client to the remote desktop server. If you disable or do not configure this policy setting, and no other policy setting describes the device, the "Prevent installation of devices not described by other policy settings" policy setting determines whether the device can be installed. `Enabled` or `Disabled`
05. **Prevent installation of devices not described by other policy settings**: This policy setting allows you to prevent the installation of devices that are not specifically described by any other policy setting. If you enable this policy setting, Windows is prevented from installing or updating the device driver for any device that is not described by either the "Allow installation of devices that match any of these device IDs" or the "Allow installation of devices for these device classes" policy setting. If you disable or do not configure this policy setting, Windows is allowed to install or update the device driver for any device that is not described by the "Prevent installation of devices that match any of these device IDs," "Prevent installation of devices for these device classes," or "Prevent installation of removable devices" policy setting. `Enabled` or `Disabled`
06. **Prevent installation of devices that match any of these device IDs**: This policy setting allows you to specify a list of Plug and Play hardware IDs and compatible IDs for devices that Windows is prevented from installing. This policy setting takes precedence over any other policy setting that allows Windows to install a device. If you enable this policy setting, Windows is prevented from installing a device whose hardware ID or compatible ID appears in the list you create. If you enable this policy setting on a remote desktop server, the policy setting affects redirection of the specified devices from a remote desktop client to the remote desktop server. If you disable or do not configure this policy setting, devices can be installed and updated as allowed or prevented by other policy settings. `Enabled` or `Disabled`
07. **Prevent installation of devices that match any of these device instance IDs**: This policy setting allows you to specify a list of Plug and Play device instance IDs for devices that Windows is prevented from installing. This policy setting takes precedence over any other policy setting that allows Windows to install a device. If you enable this policy setting, Windows is prevented from installing a device whose device instance ID appears in the list you create. If you enable this policy setting on a remote desktop server, the policy setting affects redirection of the specified devices from a remote desktop client to the remote desktop server. If you disable or do not configure this policy setting, devices can be installed and updated as allowed or prevented by other policy settings. `Enabled` or `Disabled`
08. **Prevent installation of devices using drivers that match these device setup classes**: This policy setting allows you to specify a list of device setup class globally unique identifiers (GUIDs) for device drivers that Windows is prevented from installing. This policy setting takes precedence over any other policy setting that allows Windows to install a device. If you enable this policy setting, Windows is prevented from installing or updating device drivers whose device setup class GUIDs appear in the list you create. If you enable this policy setting on a remote desktop server, the policy setting affects redirection of the specified devices from a remote desktop client to the remote desktop server. If you disable or do not configure this policy setting, Windows can install and update devices as allowed or prevented by other policy settings. `Enabled` or `Disabled`
09. **Prevent installation of removable devices**: This policy setting allows you to prevent Windows from installing removable devices. A device is considered removable when the driver for the device to which it is connected indicates that the device is removable. For example, a Universal Serial Bus (USB) device is reported to be removable by the drivers for the USB hub to which the device is connected. This policy setting takes precedence over any other policy setting that allows Windows to install a device. If you enable this policy setting, Windows is prevented from installing removable devices and existing removable devices cannot have their drivers updated. If you enable this policy setting on a remote desktop server, the policy setting affects redirection of removable devices from a remote desktop client to the remote desktop server. If you disable or do not configure this policy setting, Windows can install and update device drivers for removable devices as allowed or prevented by other policy settings. `Enabled` or `Disabled`

### Removable Storage Access

01. **WPD Devices: Deny read access**: This policy setting denies read access to removable disks, which may include media players, cellular phones, auxiliary displays, and CE devices. If you enable this policy setting, read access is denied to this removable storage class. If you disable or do not configure this policy setting, read access is allowed to this removable storage class. `Enabled` or `Disabled`

02. **WPD Devices: Deny read access (User)**: This policy setting denies read access to removable disks, which may include media players, cellular phones, auxiliary displays, and CE devices. If you enable this policy setting, read access is denied to this removable storage class. If you disable or do not configure this policy setting, read access is allowed to this removable storage class. `Enabled` or `Disabled`

03. **WPD Devices: Deny write access**: This policy setting denies write access to removable disks, which may include media players, cellular phones, auxiliary displays, and CE devices. If you enable this policy setting, write access is denied to this removable storage class. If you disable or do not configure this policy setting, write access is allowed to this removable storage class. `Enabled` or `Disabled`

04. **WPD Devices: Deny write access (User)**: This policy setting denies write access to removable disks, which may include media players, cellular phones, auxiliary displays, and CE devices. If you enable this policy setting, write access is denied to this removable storage class. If you disable or do not configure this policy setting, write access is allowed to this removable storage class. `Enabled` or `Disabled`

### Data protection

- **Allow Direct Memory Access**: This policy setting allows you to block direct memory access (DMA) for all hot pluggable PCI downstream ports until a user logs into Windows. Once a user logs in, Windows will enumerate the PCI devices connected to the host plug PCI ports. Every time the user locks the machine, DMA will be blocked on hot plug PCI ports with no children devices until the user logs in again. Devices which were already enumerated when the machine was unlocked will continue to function until unplugged. This policy setting is only enforced when BitLocker Device Encryption is enabled. Most restricted value is 0. `Allow` or `Block`

### DMA Guard

1. **Device Enumeration Policy**: This policy is intended to provide additional security against external DMA capable devices. It allows for more control over the enumeration of external DMA capable devices incompatible with DMA Remapping/device memory isolation and sandboxing. Device memory sandboxing allows the OS to leverage the I/O Memory Management Unit (IOMMU) of a device to block unallowed I/O, or memory access, by the peripheral. In other words, the OS assigns a certain memory range to the peripheral. If the peripheral attempts to read/write to memory outside of the assigned range, the OS blocks it. This policy only takes effect when Kernel DMA Protection is supported and enabled by the system firmware. Kernel DMA Protection is a platform feature that cannot be controlled via policy or by end user. It has to be supported by the system at the time of manufacturing. To check if the system supports Kernel DMA Protection, please check the Kernel DMA Protection field in the Summary page of MSINFO32. exe. NoteThis policy does not apply to 1394/Firewire, PCMCIA, CardBus, or ExpressCard devices. Supported values:0 - Block all (Most restrictive): Devices with DMA remapping compatible drivers will be allowed to enumerate at any time. Devices with DMA remapping incompatible drivers will never be allowed to start and perform DMA at any time. 1 - Only after log in/screen unlock (Default): Devices with DMA remapping compatible drivers will be allowed to enumerate at any time. Devices with DMA remapping incompatible drivers will only be enumerated after the user unlocks the screen2 - Allow all (Least restrictive): All external DMA capable PCIe devices will be enumerated at any time.

    - `Allow all (Least restrictive)`
    - `Only after log in / screen unlock`
    - `Block all (Most restrictive)`

### Storage

01. **Removable Disk Deny Write Access**: If you enable this policy setting, write access is denied to this removable storage class. If you disable or do not configure this policy setting, write access is allowed to this removable storage class. Note: To require that users write data to BitLocker-protected storage, enable the policy setting "Deny write access to drives not protected by BitLocker," which is located in "Computer Configuration\Administrative Templates\Windows Components\BitLocker Drive Encryption\Removable Data Drives." `Enabled` or `Disabled`

### Connectivity

01. **Allow USB Connection**: Note Currently, this policy is supported only in HoloLens 2, Hololens (1st gen) Commercial Suite, and HoloLens (1st gen) Development Edition. Enables USB connection between the device and a computer to sync files with the device or to use developer tools to deploy or debug applications. Changing this policy does not affect USB charging. Both Media Transfer Protocol (MTP) and IP over USB are disabled when this policy is enforced. Most restricted value is 0. `Not allowed` or `Allowed`

02. **Allow Bluetooth**: Allows the user to enable Bluetooth or restrict access. Note  This value is not supported in Windows Phone 8. 1 MDM and EAS, Windows 10 for desktop, or Windows 10 Mobile. If this is not set or it is deleted, the default value of 2 (Allow) is used. Most restricted value is 0. `Disallow Bluetooth` or `Reserved` or `Allow Bluetooth`

### Bluetooth

01. **Allow Advertising**: Specifies whether the device can send out Bluetooth advertisements. If this is not set or it is deleted, the default value of 1 (Allow) is used. Most restricted value is 0. `Allow` or `Block`
02. **Allow Discoverable Mode**: Specifies whether other Bluetooth-enabled devices can discover the device. If this is not set or it is deleted, the default value of 1 (Allow) is used. Most restricted value is 0. `Allow` or `Block`
03. **Allow Prepairing**: Specifies whether to allow specific bundled Bluetooth peripherals to automatically pair with the host device. `Allow` or `Block`
04. **Allow Prompted Proximal Connections**: This policy allows the IT admin to block users on these managed devices from using Swift Pair and other proximity based scenarios. `Allow` or `Block`
05. **Services Allowed List**: Set a list of allowable services and profiles. String hex formatted array of Bluetooth service UUIDs in canonical format, delimited by semicolons. For example, {782AFCFC-7CAA-436C-8BF0-78CD0FFBD4AF}. The default value is an empty string. For more information, see ServicesAllowedList usage guide. `Allow` or `Block`

### System

01. **Allow Storage Card**: Controls whether the user is allowed to use the storage card for device storage. This setting prevents programmatic access to the storage card. Most restricted value is 0.

    - SD card use is not allowed and USB drives are disabled. This setting does not prevent programmatic access to storage card.
    - Allow a storage card.
