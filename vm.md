# Indicators of compromise/attacks - Azure VMs

This is the checklist of Endpoint Indicators of Compromise (IoCs) / Indicators of Attack (IoAs) for an Azure cloud–connected enterprise endpoint environment (Windows, Linux, macOS, mobile, hybrid-joined, Entra ID joined, VDI).

Think of this as a SOC brain-dump — every small/big signal + what decision it drives.

No formal structure, just what to watch + what it means.

(Assume visibility via tools like Microsoft Azure, Defender, EDR, MDE, MDM, Sentinel, NDR, proxy, firewall, identity logs.)

Endpoint Malware & Execution Indicators

Malware signature hit (any severity)
Heuristic / ML malware detection
Ransomware behavior detected (mass encryption, file rename)
Living-off-the-land binaries (LOLBins) abuse (powershell, wmic, rundll32, mshta, certutil)
Unsigned binary execution from user-writable paths
Executables launched from temp/AppData/Downloads
Office macro execution spawning PowerShell/cmd
Script interpreters spawning browsers or credential tools
Malware family classification change (variant evolution)
Repeated malware detections on same endpoint (persistence)
Malware detected but not remediated
AV disabled / tampered
EDR sensor stopped / unhealthy
Tamper protection disabled
Suspicious child-parent process chains
Process hollowing / injection detected
Memory-only malware indicators
AMSI bypass indicators
Unusual DLL load paths
Reflective DLL loading
Abnormal WMI execution
Suspicious scheduled task creation
Persistence via startup folders
Persistence via registry run keys
Persistence via services creation
Credential dumping tools detected (lsass access)
Browser credential store access
Token theft / cookie theft behavior
Local security authority (LSA) tampering
Shadow copy deletion
Backup catalog deletion
Safe mode boot abuse
Boot configuration changes
Rootkit indicators
Kernel driver loaded from untrusted source
Decision: isolate endpoint, kill process, block hash, hunt lateral spread, assume credential compromise if persistence present.

File & Disk Indicators

Hash mismatch of system binaries
System file replaced outside patch window
Unexpected executable dropped
File created with hidden/system attributes
Rapid file rename operations
Mass file permission changes
Encryption extensions appearing
Ransom note creation
Executable masquerading as document
Double-extension files
Unexpected file compression activity
Archive creation before exfiltration
Large data bundles in temp or user profile
Files written by SYSTEM into user folders
Alternate Data Streams (ADS) usage
Unexpected changes to hosts file
Unexpected changes to DNS resolver config
Unauthorized driver files present
Unexpected firmware/UEFI file changes
Database files accessed by endpoint users
Backup files deleted or corrupted
Users unable to access documents (crypto-lock or permission abuse)
Decision: snapshot disk, preserve evidence, check for data theft, trigger IR if encryption or staging detected.

Registry & Configuration Indicators

New autorun registry keys
Registry values modified for persistence
Proxy registry keys altered
Certificate trust store modified
Root CA added silently
Credential provider registry changes
Security policy registry changes
Firewall registry rules added
Defender exclusions added
Audit policy disabled or reduced
Logging tampered
Screen lock / password policy weakened
Remote access enabled unexpectedly
RDP shadowing enabled
SMB signing disabled
LSA protection disabled
PowerShell logging disabled
UAC disabled
Windows Update behavior altered
Time service tampering (time skew attacks)
Decision: treat as stealth persistence or pre-ransom stage; validate blast radius.

Network & C2 Indicators

Outbound traffic to known bad IP/domain
DNS queries for DGA-like domains
Beaconing with fixed intervals
Low-and-slow periodic HTTPS traffic
Rare destination country traffic
Endpoint talking directly to IP (no DNS)
Encrypted traffic to unknown endpoints
TOR / VPN process detected
Reverse shell behavior
SMB connections between workstations
Lateral movement via SMB/RPC/WMI
RDP connections from non-admin devices
Endpoint acting as server
Unexpected listening ports
Internal port scanning
ARP poisoning indicators
Proxy bypass attempts
Split tunneling abuse
IPv6 abuse in IPv4 environment
DNS cache poisoning signs
Web requests to exploit paths
Excessive HTTP 401/403 responses
Endpoint downloading payload from pastebin/raw GitHub
Command download via cloud storage (Dropbox, OneDrive misuse)
Decision: block egress, isolate endpoint, check lateral spread, inspect identity logs.

Identity-Linked Endpoint Indicators

Endpoint sign-in from impossible travel location
Token replay from same endpoint
Multiple users authenticating from same endpoint
Privileged role activation from non-PAW device
MFA fatigue attempts originating from endpoint
Conditional Access bypass via compliant device flag
Device marked compliant suddenly
Device re-registered without user action
Azure AD join state changed
Hybrid join broken unexpectedly
Primary refresh token abuse
Cached credential usage spike
NTLM authentication spike
Kerberos ticket anomalies
Pass-the-hash behavior
Device used after user termination
Decision: assume identity compromise; revoke tokens; reset credentials; check tenant-wide impact.

Performance & Stability Indicators

Sudden CPU spikes with no user activity
Sustained high memory usage
Disk IO saturation
Network saturation at odd hours
System freezes/BSOD
Defender scan failures
Repeated service crashes
Unexpected reboot cycles
Boot time anomalies
Endpoint becomes unresponsive when online only
Decision: correlate with execution/network; don't dismiss as "performance issue".

User Behavior & Policy Violations

Unauthorized software installation
Portable executable usage
Pirated/cracked software
Browser extensions installed silently
Developer tools enabled on user devices
Users disabling security controls
Excessive admin password prompts
Users reporting pop-ups or fake updates
User reports files renamed/unreadable
Unapproved remote access tools
Shadow IT sync tools installed
Credential reuse warnings
Repeated phishing clicks from same endpoint
Decision: treat user-reported issues as high-signal; often earliest ransomware indicator.

Mobile / MDM-Specific Indicators

Device compliance state changes unexpectedly
Security profile removed
Passcode disabled
Rooted/jailbroken detection
Unknown configuration profiles installed
VPN profiles added
Certificate profiles modified
MDM unenrolled silently
Device re-enrolled to bypass controls
App sideloading detected
Screen capture enabled for secure apps
Decision: block device access, revoke tokens, force re-enrollment.

Data Access & Exfiltration Indicators

Sudden spike in file reads
Same file downloaded repeatedly
Large uploads to cloud storage
Compression before upload
Database queries from endpoint
Access to sensitive shares outside role
Endpoint accessing multiple departments' data
API tokens used from endpoint
Clipboard scraping behavior
Screenshot capture tools detected
DLP alerts tied to endpoint
Decision: assume breach if combined with malware or identity signals.

High-Risk Compound Signals (Immediate IR)

Malware + outbound C2
Persistence + credential access
Defender disabled + new admin role
File encryption + shadow copy deletion
Data staging + external upload
Endpoint compromise + Global Admin sign-in
Multiple endpoints showing same behavior
Endpoint used as pivot to Azure resources
Decision: incident response, containment, tenant-wide hunting.