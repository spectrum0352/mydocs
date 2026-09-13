# Endpoint Security Policies for Linux

## Microsoft Defender Antivirus

Customers using Microsoft Defender for Endpoint on Linux can configure and deploy Antivirus settings to Linux devices.

### Cloud delivered protection preferences

Configure the Cloud-delivered protection preference settings to manage the cloud-driven protection features of Microsoft Defender for Endpoint.

01. **Enable cloud delivered protection**: Provides increased, faster protection with access to the latest protection data in the cloud. Works best with automatic sample submission turned on. `Enabled` or `Disabled`
02. **Enable automatic sample submissions**: Sends sample files to Microsoft to help protect device users and your organization from potential threats. `None` or `Safe` or `All`
03. **Diagnostic data collection level**: We encourage you to share your diagnostic and usage data with us to help improve Microsoft products and services.
04. **Automatic security intelligence updates**: Determines whether security intelligence updates are installed automatically. `Enabled` or `Disabled`
05. **Configure cloud block level**: Determines how aggressive Defender for Endpoint is in blocking and scanning suspicious files. `Not configured`, `Normal`, `Moderate`, `High`, `High_plus`, `Zero tolerance`
06. **Security intelligence Update time interval (seconds)**: Allows setting the time interval at which offline security intelligence updates are triggered on endpoints.

### Antivirus Engine

Configure the Antivirus engine settings to manage the preferences of the antivirus component of Microsoft Defender for Endpoint.

01. **Enable real-time protection (deprecated)**: Locates and stops malware from installing or running on your device. You can turn off this setting for a short time before it turns back on automatically. `Enabled` or `Disabled`
02. **Enable passive mode (deprecated)**: Whether the antivirus engine runs in passive mode or not. `Enabled` or `Disabled`
03. **Scan history size**: Specify the maximum number of entries to keep in the scan history. Entries include all on-demand scans performed in the past and all antivirus detections.
04. **Scan results retention**: Specify the number of days that results are retained in the scan history on the device. Old scan results are removed from the history. Old quarantined files that are also removed from the disk.
05. **Exclusions merge**: Specify the merge policy for exclusions. This can be a combination of administrator-defined and user-defined exclusions (merge) or only administrator-defined exclusions (admin_only). This setting can be used to restrict local users from defining their own exclusions. `merge` or `admin_only`
06. **Scan exclusions**: Entities that have been excluded from the scan. Exclusions can be specified by full paths, extensions, or file names.
07. **Threat type settings**: The threatTypeSettings preference in the antivirus engine is used to control how certain threat types are handled by the product.
08. **Threat type settings merge**: Specify the merge policy for threat type settings. This can be a combination of administrator-defined and user-defined settings (merge) or only administrator-defined settings (admin_only). This setting can be used to restrict local users from defining their own settings for different threat types.

    - Allowed threats: List of threats (identified by their name) that are not blocked by the product and are instead allowed to run.
    - Disallowed threat actions: Restricts the actions that the local user of a device can take when threats are detected. The actions included in this list are not displayed in the user interface.

09. **Enable scanning of archives**: Specifies whether to scan archives during on-demand antivirus scans.
10. **Enable scanning after definition update**: Specifies whether to start a process scan after new security intelligence updates are downloaded on the device.
11. **Enable file hash computation**: Whether the antivirus engine computes hashes for the files it scans or not.
12. **Enable behavior monitoring**: Whether the antivirus engine runs behavior monitoring and blocking or not.
13. **maximum on demand scan threads**: Specify the maximum number of number of threads used to perform the on demand scan.
