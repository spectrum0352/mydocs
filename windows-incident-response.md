# Detection

# Investigation

## Windows Compromise

**Categorization:**

1.  **Baseline Establishment (Understanding Normal Behavior):**

    - This focuses on creating a "normal" profile of the system.

2.  **Regular Monitoring (Proactive Detection):**

    - These are the recurring checks to identify deviations from the
      baseline.

3.  **Initial Investigation (Reactive Analysis):**

    - Steps taken when a potential compromise is suspected.

4.  **Incident Response (Forensic Actions):**

    - Actions taken after a compromise has been confirmed.

5.  **General Security Practices:**

    - General security advice.

**Summarized and Corrected Information:**

**1. Baseline Establishment (Understanding Normal Behavior):**

- **Purpose:** Establish a baseline of normal system activity to
  identify anomalies.

- **Key actions:**

  - Map running processes and services.

  - Document typical network activity (port usage, file shares, network
    sessions, NetBIOS activity, listening ports).

  - Record usual services and applications.

**2. Regular Monitoring (Proactive Detection):**

- **Purpose:** Regularly check for deviations from the baseline.

- **Command-Line Tools:**

  - services.msc / net start: Check for unexpected services.

  - net view \\127.0.0.1: Verify file shares.

  - net session: Check open sessions.

  - net use: Check network connections.

  - nbtstat -S: Analyze NetBIOS activity.

  - netstat -a or netstat -na: View listening ports.

  - netstat -a 5 (or netstat -nao 5 on older Windows): Continuous port
    monitoring (use cautiously).

  - netstat -ab or netstat -naob: Show process/DLLs for connections (use
    cautiously).

  - netsh firewall show config: Verify firewall settings.

- **General Practices:**

  - Compare current activity to the baseline.

  - Understand normal port usage.

**3. Initial Investigation (Reactive Analysis):**

- **Purpose:** Investigate potential compromises.

- **Key actions:**

  - Check for missing patches (OS and third-party applications).

  - Verify file integrity (cryptographic hashes, FIM alerts).

  - Analyze system and application logs.

  - Review running processes, services, and scheduled tasks.

  - Examine the hosts file for unusual entries.

  - Monitor network traffic.

  - Scan for malware (multiple antivirus scans).

  - Examine endpoint logs.

  - Check for unusual programs set to run at startup.

  - Check what services and applications are not working.

  - Data breach assessment.

**4. Incident Response (Forensic Actions):**

- **Purpose:** Actions taken after a compromise.

- **Key actions:**

  - Isolate the system (disconnect from the network).

  - Obtain physical access for forensic investigation.

  - Create a physical copy of the hard drive.

  - Consult with system administrators or specialists.

**5. General Security Practices:**

- **Purpose:** Improve overall security posture.

- **Key actions:**

  - Use strong, unique passwords.

  - Enable two-factor authentication.

  - Conduct regular security audits.

  - Monitor user behavior.

  - Document network behavior.

  - Maintain an updated list of critical files, software and servers.

  - Know your systems inside out.

**Removed Duplicates and Corrections:**

- Removed duplicate entries for "look at contents of the hosts file" and
  "look for running processes or scheduled jobs".

- Clarified the use of netstat with different options and operating
  system variations.

- Corrected minor grammatical errors.

- Consolidated similar items.

**Key Improvements:**

- Clear categorization for better understanding.

- Concise summaries of each category.

- Elimination of redundant information.

- Emphasis on the importance of baselining.

- Added purpose to each category.

### IAM

**1. Categorization:**

The logs are categorized into two main sections:

- **Windows:** Detecting suspicious accounts on Windows systems.

- **Linux:** Detecting suspicious accounts on Linux systems.

**2. Corrections and Deduplication:**

**Windows:**

- **Detection Methods:**

  - lusrmgr.msc (Local Users and Groups Manager): GUI tool for managing
    local users and groups.

  - net user: Command-line tool to list user accounts.

  - net localgroup administrators: Command-line tool to list members of
    the Administrators group.

  - Get-LocalUser: Powershell command to list local users.

- **Indicators of Compromise:**

  - New or unexpected accounts, especially in the Administrators group.

  - Any unfamiliar accounts.

- **Accessing tools:**

  - Windows + R then type lusrmgr.msc

  - Open command prompt and type the net commands.

**Linux:**

- **Detection Methods:**

  - Examination of key system files:

    - /etc/passwd: User account information.

    - /etc/group: Group information.

    - /etc/shadow: Encrypted password information (root access
      required).

    - /etc/sudoers: sudo privileges.

  - Command-line tools:

    - cat: Displays file contents.

    - grep: Searches for patterns in files.

    - find: Searches for files and directories.

    - passwd -S: Checks password status.

- **Indicators of Compromise:**

  - Suspicious entries in /etc/passwd, particularly accounts with UID 0
    (root).

  - Orphaned files (files without associated users or groups).

  - Unusual entries or changes in /etc/shadow, /etc/group, or
    /etc/sudoers.

  - Searching for :0: within the /etc/passwd file.

  - Finding files that have no user associated with them.

- **Corrected command examples:**

  - \# cat /etc/passwd

  - \# grep :0: /etc/passwd

  - \# find / \\-nouser -o -nogroup\\

  - \# cat /etc/shadow

  - \# cat /etc/group

  - \# cat /etc/sudoers

  - \# passwd -S \[username\]

  - \# find / -nouser -print

**3. Summary:**

- The logs provide procedures for detecting suspicious user accounts in
  both Windows and Linux environments.

- Windows checks focus on the Administrators group and new account
  creation.

- Linux checks focus on system files, root accounts, and orphaned files.

- The logs were corrected to have the correct command line prompts for
  each OS.

### Files

**Windows Compromise Investigation: File System, Registry, and System
Integrity Analysis**

**I. Initial Assessment & Monitoring:**

- **Disk Space:**

  - Monitor for sudden drops in free disk space using the GUI (Windows
    Explorer) or dir C:\\

- **File Shares:**

  - Review current file shares for unusual or excessive sharing using
    Get-SmbShare or net view 127.0.0.1.

- **System Logs (Crucial):**

  - Review Windows Event Logs (Security, System, Application) for
    errors, warnings, and suspicious activity.

- **Network Activity:**

  - Monitor network traffic for unusual connections, large data
    transfers, or communication with suspicious IP addresses.

**II. File System Analysis:**

- **Recently Modified Files:**

  - Identify files modified within a specific timeframe using
    PowerShell:

    - Get-ChildItem -Path C:\\ -Recurse \| Where-Object
      {\$\_.LastWriteTime -gt (Get-Date).AddDays(-2)}

  - Focus on system directories (C:\Windows\System32, etc.).

- **Large Files:**

  - Search for unusually large files, especially in system directories,
    using PowerShell:

    - Get-ChildItem -Path C:\\ -Recurse \| Where-Object {\$\_.Length -gt
      10MB}

- **Hidden Files:**

  - Reveal hidden files using dir /S /A:H or PowerShell:

    - Get-ChildItem -Path C:\\ -Recurse -Attributes Hidden

  - Use WinDirStat to visualize disk usage and highlight hidden files.

- **File Permissions (ACLs):**

  - Focus on file permissions and access control lists (ACLs) rather
    than SUID/GUID. Use PowerShell to check for unusual permissions.

- **Processes and Associated Files:**

  - Identify running processes and their associated files using Process
    Explorer or PowerShell.

  - Check for processes using unusual files or files in unusual
    locations.

- **Unusual File Names:**

  - Look for files with unusual characters, leading spaces, or double
    dots. Use PowerShell.

**III. Registry Analysis:**

- **Startup Programs:**

  - Examine registry keys associated with system startup:

    - HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run

    - HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run

  - Use regedit.exe or PowerShell to inspect the registry.

- **Services:**

  - Review installed services for anything unusual using services.msc or
    PowerShell:

    - Get-Service

- **Scheduled Tasks:**

  - Check for suspicious scheduled tasks using Task Scheduler or
    PowerShell:

    - Get-ScheduledTask

**IV. System Integrity Checks:**

- **Windows File Protection:**

  - Investigate any Windows File Protection errors or messages.

- **System File Integrity:**

  - Verify the integrity of system files using sfc /scannow.

**V. Tools:**

- **Sysinternals Suite:**

  - Process Explorer, Autoruns, Process Monitor.

- **PowerShell:**

  - For file system analysis, registry inspection, and automation.

- **Event Viewer:**

  - For reviewing system logs.

- **WinDirStat:**

  - For visualizing disk usage and identifying large or hidden files.

**VI. Important Considerations:**

- **Timeline:**

  - Establish a timeline of events to correlate file system changes with
    other activity.

- **Volatility:**

  - Memory forensics can be crucial for advanced investigations.

- **Network Forensics:**

  - Analyze network traffic to identify command and control servers or
    data exfiltration.

- **Containment:**

  - Isolate the affected system to prevent further spread of malware.

- **Documentation:**

  - Thoroughly document all findings and actions taken.

### Registry settings and keys

**Categorized Summary: Windows Compromise - Registry Analysis**

This document provides a guide for investigating malicious registry
activity on Windows Server 2019/2022, primarily focusing on persistence
mechanisms (malware startup).

**I. Core Registry Locations (Persistence)**

- **HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run:** Programs that
  execute at every system startup (all users).

- **HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce:** Programs
  that execute once at the next system startup (all users).

- **HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx:** Enhanced
  RunOnce with more control.

- **HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run:**
  32-bit applications that run at every startup (64-bit systems).

- **HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce:** Programs
  that execute once at the next system startup (current user).

**II. Investigation Procedures**

- **A. Manual Registry Inspection (regedit):**

  - Navigate to the key locations listed above.

  - Identify:

    - Unfamiliar program names.

    - Unusual file paths.

    - Obfuscated commands.

- **B. Command-Line Registry Queries (reg query):**

  - Retrieve registry values for scripting and automation.

  - Examples:

    - REG QUERY "HKLM\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN"

    - REG QUERY "HKCU\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUNONCE"

    - REG QUERY
      "HKLM\SOFTWARE\WOW6432NODE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN"

- **C. Third-Party Tools:**

  - **Autoruns (Sysinternals):** Comprehensive startup program view.

  - *Removed HiJackThis due to being outdated.*

- **D. File System Analysis (Complementary):**

  - **Startup Folder:** %AppData%\Microsoft\Windows\Start
    Menu\Programs\Startup (and all users).

  - **System32:** C:\Windows\System32 (check for recent modifications,
    unusual files).

    - dir /s /b /a-d /tw C:\Windows\System32 (list recently modified
      files).

  - **Hidden Files:** dir /a:h /s.

  - **File Sizes:** Investigate, don't assume malice based on size
    alone.

**III. Important Considerations**

- **Windows File Protection (WFP):** Indicates attempts to modify
  protected system files.

- **False Positives:** Research unfamiliar entries before taking action.

- **Root Cause Analysis:** Determine the initial compromise vector.

- **Live Response:** Use tools for remote data gathering and actions.

**IV. Investigation Workflow**

1.  Use Autoruns for a comprehensive startup program list.

2.  Focus on Run, RunOnce, and RunOnceEx keys.

3.  Research unfamiliar programs or file paths.

4.  Manually inspect relevant registry keys (regedit).

5.  Check the file system for associated files.

6.  Analyze suspicious files with malware analysis tools (if needed).

**Corrections and De-duplication:**

- Added HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce for
  current user analysis.

- Clarified the purpose of dir command switches.

- Removed the outdated HiJackThis tool.

- Improved the workflow section.

- Consolidated redundant information.

- Added the importance of root cause analysis.

### Scheduled Tasks

This document outlines how to investigate potentially malicious
scheduled task activity on Windows Server 2019 and 2022 systems.
Compromised servers often have malicious tasks created to maintain
persistence or execute further attacks. The focus is on identifying
unusual or suspicious tasks.

**Key Areas of Investigation:**

1.  **Scheduled Tasks:** These automate processes and can be abused by
    attackers.

2.  **Startup Programs:** These run automatically when a user logs in
    and can also be used for malicious purposes.

**Investigation Steps:**

**A. Scheduled Tasks (Windows):**

- **GUI Methods:**

  - **Task Scheduler:** Start \> Windows Administrative Tools \> Task
    Scheduler (This is the preferred and most comprehensive method).

  - **System Configuration (msconfig):** Run \> msconfig (Less detailed,
    primarily for startup programs, but can show some scheduled tasks).

- **Command-Line Methods:**

  - schtasks: Lists and manages scheduled tasks. Use schtasks /query /fo
    list for a detailed list.

  - wmic startup list full: Lists startup programs (overlaps with
    msconfig).

- **PowerShell:**

  - Get-ScheduledTask: Provides a comprehensive way to manage scheduled
    tasks. Example: Get-ScheduledTask \| Where-Object {\$\_.Author -ne
    "Microsoft"} \| Format-List (Finds tasks not created by Microsoft).

**B. Startup Programs (Windows):**

- **GUI Methods:**

  - **Task Manager:** Ctrl+Shift+Esc \> Startup (Modern way to manage
    startup programs).

  - **System Configuration (msconfig):** Run \> msconfig \> Startup
    (Older method, still functional).

- **Command-Line Methods:**

  - wmic startup list full: Lists startup programs.

- **File System:**

  - Check the Startup folders:

    - C:\Users\\username\>\AppData\Roaming\Microsoft\Windows\Start
      Menu\Programs\Startup

    - C:\ProgramData\Microsoft\Windows\Start
      Menu\Programs\Startup<sup>1</sup> (for all users)

    - Older paths (less relevant on Server 2019/2022 but good to check
      for legacy applications):

      - C:\Documents and Settings\\username\>\Start
        Menu\Programs\Startup

      - C:\WinNT\Profiles\\username\>\Start Menu\Programs\Startup (very
        old, unlikely on modern servers)

**C. Identifying Suspicious Entries:**

- **Unusual Task/Program Names:** Look for names that are cryptic,
  misspelled, or unrelated to legitimate software.

- **Unusual Triggers:** Tasks scheduled to run very frequently, at odd
  times, or triggered by unusual events.

- **Unusual Actions:** Tasks that execute scripts, download files, or
  connect to remote servers, especially if they use unusual command-line
  arguments or scripts.

- **Run As User:** Tasks running as SYSTEM, Administrator, or a user
  with excessive privileges, especially if the task itself seems
  suspicious. Blank usernames are also a red flag.

- **Location of Executables:** Check if the executable being run is
  located in a suspicious directory (e.g., Temp, AppData).

- **Digital Signatures:** Verify the digital signatures of executables
  if available. Lack of a signature or an invalid signature can be a
  sign of malware.

### Malware Checks

**Summary of Windows Server Compromise Investigation: Malware and
Rootkit Checks**

This document outlines procedures for investigating potential malware
and rootkit infections on Windows Server 2019 and 2022 systems. The core
strategy involves using a combination of specialized tools and manual
checks to identify suspicious activity. It emphasizes the importance of
using multiple tools and keeping them up-to-date.

**Key Actions:**

1.  **Rootkit Detection:** Employ multiple rootkit detection tools such
    as Rootkit Revealer, Rootkit Hooker, Ice Sword, RK Detector,
    SysInspector, and Rootkit Buster. Running several tools provides
    more comprehensive coverage.

2.  **Malware Scanning:** Perform full system scans with multiple
    up-to-date antivirus products. This increases the chances of
    detecting a wider range of malware.

3.  **Manual Checks (Windows & Linux):**

    - **SUID/GUID Files (Linux):** find / -uid 0 \\ -perm -4000 -o -perm
      2000 \\ -print (Finds files with setuid or setgid permissions,
      which can be a security risk).

    - **Suspicious Filenames (Linux):** find / -name -print, find /
      -name.-print (Looks for files with unusual names, including those
      starting with a dot, which might be hidden).

    - **Large Files (Linux):** find / -size +10M -print (Identifies
      large files, which could be used for storing illicit data).

    - **Unlinked Processes (Linux):** lsof +L1 (Finds processes that are
      running but no longer have a corresponding file on the filesystem,
      which can be a sign of rootkit activity).

    - **Unusual Disk Usage (Linux):** Check for unexpected large
      increases in disk space usage (e.g., \> 5MB increases), which
      could indicate illicit data storage.

    - **Recently Added Files (Windows):** Look for recently modified or
      added files in critical system directories like
      C:\WINDOWS\system32.

    - **Hidden Files (Windows):** dir /S /A:H (Lists hidden files).
      Consider using WinDirStat for visualization.

    - **OS File Integrity (Windows):** sigverif (Verifies the digital
      signatures of system files).

    - **File Analysis (Windows):** Use forfiles to search for specific
      file types or modifications.

    - **Disk Space Analysis (Windows):** Look for significant decreases
      in free disk space (e.g., using File Explorer's search with
      size:\>5M).

    - **Package Integrity (Linux):** rpm -Va, pkgchk (Verifies the
      integrity of installed packages).

    - **Installed Packages (Linux):** yum list installed, rpm -qa (Lists
      installed packages).

    - **Package Ownership (Linux):** rpm -qf filename, yum provides
      filename-glob (Finds the package that owns a specific file).

    - **Package Information (Linux):** yum info package_name, yum group
      info group_name (Displays information about a package or package
      group).

4.  **Regular Monitoring:** Perform these checks regularly (daily,
    weekly, or at each logon) to detect potential intrusions early.

### Processes and Services

This document outlines the process of investigating compromised Windows
(2019, 2022) and Linux servers, focusing on identifying malicious
processes and services. The core principle is establishing a baseline of
"normal" activity and then detecting deviations. Several redundant
points were removed and the information was reorganized for clarity.

**Key Investigation Areas:**

- **Unusual Processes:** Focus on processes running as SYSTEM,
  ADMINISTRATOR (Windows), or UID 0 (Linux). Look for unfamiliar names,
  high resource consumption, unusual parent processes, and suspicious
  command-line arguments.

- **Unusual Services:** Examine installed and running services for
  anomalies. Check for services that shouldn't be present, those with
  unusual configurations, or those that are running but shouldn't be.

- **Unusual Files and Registry Keys (Windows):** Look for newly created
  files, especially in system directories or temporary folders. Check
  the registry for suspicious entries, particularly those related to
  startup programs. Monitor disk space usage for sudden changes.

- **Unusual Files and Directories (Linux):** Examine /tmp, /proc, and
  other system directories for suspicious files or changes.

- **Network Activity:** Investigate unusual network connections or
  listening ports.

- **Scheduled Tasks/Cron Jobs:** Review scheduled tasks (Windows) and
  cron jobs (Linux) for suspicious entries.

**Windows Investigation Techniques:**

- **Processes:**

  - Task Manager (GUI)

  - tasklist (command-line)

  - wmic process list full (command-line)

  - wmic process get name, parentprocessid, processid (command-line)

  - wmic process where processid=\[pid\] get commandline (command-line)

  - Get-Process (PowerShell)

  - tasklist /m (DLLs)

  - tasklist /svc (Services)

  - Process Explorer (GUI)

- **Services:**

  - Services Management Console (services.msc)

  - net start (command-line)

  - sc query (command-line)

  - sc qc \<service-name\> (command-line)

- **Files/Registry:**

  - File Explorer

  - Registry Editor (regedit)

- **Network:**

  - netstat

  - tcpview

**Best Practices:**

- **Establish a Baseline:** Understand the normal processes and services
  running on the system *before* an incident.

- **Focus on Privileged Processes:** Pay close attention to processes
  running as SYSTEM/root.

- **Analyze Command Lines:** Examine the full command line of processes
  to understand what they are doing.

- **Check Parent Processes:** Investigate the parent process of a
  suspicious process.

- **Correlate Information:** Combine information from different sources
  (processes, services, files, network) to get a complete picture.

- **Use Tools Effectively:** Become familiar with the command-line tools
  and GUIs available for investigation.

- **Document Everything:** Keep detailed records of your findings.

### Autostart folders

**Key Areas to Investigate for Cyberattacks in Windows and Linux
Autostart/Startup:**

**Windows:**

- **Startup Folders:**

  - User-specific: C:\Documents and Settings\user\Start
    Menu\Programs\Startup and C:\WinNT\Profiles\user\Start
    Menu\Programs\Startup

  - System-wide: Check for suspicious programs in the system-wide
    startup folder.

- **Scheduled Tasks:**

  - Windows 2003/XP: Use the at command.

  - Windows XP/Vista/7/8/10: Use the schtasks command.

  - Look for unusual or suspicious tasks.

**Linux:**

- **/etc/rc.local:** Check for any suspicious scripts.

- **/etc/init. d:** Look for any malicious scripts or services.

- **User's home directory:** Check the. basher and. profile files for
  any malicious code.

- **System-wide configuration files:** Check /etc/rc. d/rc\*. d for any
  suspicious scripts.

**General Investigation Steps:**

- **Identify compromised system:** Determine the affected system(s).

- **Analyze system logs:** Check for unusual activity, failed login
  attempts, or security alerts.

- **Scan for malware:** Use antivirus and anti-malware tools to detect
  and remove threats.

- **Review network traffic:** Look for suspicious outbound connections
  or unusual network activity.

- **Isolate the system:** Disconnect the compromised system from the
  network to prevent further damage.

- **Restore system:** If possible, restore the system to a clean state
  using a backup.

- **Implement security measures:** Strengthen security measures to
  prevent future attacks.

By following these steps and checking the specified locations, security
analysts can effectively investigate and mitigate cyberattacks targeting
autostart or startup processes.

### Log Entries

To investigate a potential Windows compromise, analysts should examine
system logs for suspicious activity. This involves using tools like
Event Viewer to search for specific events and anomalies.

- **Analyze Logs:** Review system and application logs for any
  anomalies.

- **Analyze System Logs:** Search for unusual events like service stops,
  file protection failures, or unexpected service starts.

Suspicious log entries

- Antivirus status

- **Apache Errors:** High volume of error messages in Apache logs

- **Application Restarts:** Frequent unexpected application restarts

- **Authentication Failures:** Excessive failed login attempts from
  local or remote access tools (SSH, FTP, etc.)

- Event log service disruptions

- Event Log service stopped

- Event log service was stopped.

- Failed login attempts

- File protection modifications

- Firewall changes

- **Hardware Issues:** Errors related to hardware devices (e.g., disk,
  network)

- **Kernel Errors:** Unusual error messages in the kernel log (dmesg)

- Locked accounts

- Monitor firewall logs for suspicious activity.

- MS Telnet Service started successfully

- New services

- Protected system file not restored

- **Rootkit Activity:** Signs of potential rootkit infection (use tools
  like rkhunter)

- **RPC Anomalies:** Strange character sequences in RPC program logs

- **System Reboots:** Frequent unexpected system reboots

- Telnet service activation

- The MS Telnet Service has started successfully.

- The protected System file \[file name\] was not restored to its
  original, valid version because the Windows File Protection...

- Windows File Protection is disabled

- Windows File Protection is not active

- Windows File Protection issues

- **System Resources** such as uptime, memory usage, detailed memory
  information, mounted file systems.

<!-- -->

- **Uptime:** Check system uptime, current time, logged-in users, and
  load averages: uptime

- **Memory Usage:** View memory utilization, used physical and swap
  memory, and kernel buffers: free

- **Detailed Memory Information:** Check detailed RAM, memory space,
  buffers, and swap: cat /proc/meminfo

- **Mounted File Systems:** Check for unknown mounts: cat /proc/mounts

Investigate suspicious log entries:

- Search for many failed logons attempts or locked-out accounts.

- Search for Event log service was stopped

- Search for events/logs affecting antivirus

- Search for events/logs affecting firewall

- Search for events/logs affecting firewall, antivirus, file protection,
  and suspicious new services.

- Search for events/logs related to file protection

- Search for events/logs related to suspicious new services.

- Search for huge amount of failed login attempts or locked out
  accounts.

- Search for many failed logons attempts or locked-out accounts.

- Search for systems/services stopped sending logs.

- Search for systems/services that have stopped sending logs.

- Search for the Event Log service being stopped.

- Search for the Telnet service starting successfully.

Tools:

- CMD: cmd -\> eventquery.vbs \| more

- CMD: Focus on a particular event log: cmd -\> eventquery.vbs /L
  security

- CMD: Open event viewer: cmd -\> eventvwr.msc

- GUI: Open event viewer: Windows+R -\> eventvwr.msc

- Event Viewer (GUI): eventvwr.msc

- Command Line: eventquery.vbs \| more

- Focus on a specific log: eventquery.vbs /L security

- Look at event log files in directories: /var/log, /var/adm,
  /var/spool.

- List recent security events: wtmp, who, last, lastlog.

- **Linux:** Unusual entries in /var/log, /var/adm, /var/spool

- **cat and grep:** For basic text searching and filtering

- **lastlog:** To view recent login information

- **tail auth.log:** To monitor recent authentication activity

- **history \| less:** To view command history

Common Log File Locations in Linux:

- /var/log/message: General system messages

- /var/log/auth.log or /var/log/secure: Authentication logs

- /var/log/kern.log: Kernel logs

- /var/log/cron.log: Cron job logs

- /var/log/maillog: Mail server logs

- /var/log/httpd/: Apache access and error logs

- /var/log/boot.log: System boot log

- /var/log/mysqld.log: MySQL database server log

- /var/log/utmp or /var/log/wtmp: Login records

**Tips:**

- Use command-line tools like eventquery.vbs for more granular searches.

- Pay attention to events indicating system modifications, service
  disruptions, or unauthorized access attempts.

- Consider using security tools for advanced analysis and threat
  detection.

- **Monitor System Resources:** Keep an eye on CPU usage, memory usage,
  and disk I/O.

- **Use Security Tools:** Employ security tools like firewalls,
  intrusion detection systems, and antivirus software.

- **Regularly Review Logs:** Set up automated log monitoring or review
  logs manually on a regular basis.

- **Stay Updated:** Keep your system and software up-to-date with the
  latest security patches.

- **Be Proactive:** Implement security best practices and respond
  promptly to security incidents.

### Network 

This document outlines commands and procedures for investigating a
potential server compromise on RHEL (Linux) and Windows systems,
focusing on malicious network activity. It's disorganized and
repetitive, so here's a summarized and corrected version:

**I. Core Principles:**

- **Understand Normal Behaviour:** Crucially, establish a baseline of
  normal network activity (port usage, connections, etc.) for the
  systems you manage. Deviations from this baseline are red flags.

- **Periodic Checks:** Regularly perform these checks (daily, weekly, or
  at each login) to catch anomalies early.

- **Focus on Network:** The document emphasizes network investigation,
  which is key to detecting many compromises.

**II. Windows Investigations:**

- **Services:** services.msc (GUI) or net start (command-line) to check
  for unusual services.

- **File Shares:** net view \\127.0.0.1 (local shares) or net view
  \\\<remote_server\> (remote shares). Use tcpview (Sysinternals) for
  more detailed information. Verify legitimate business purposes for all
  shares.

- **Sessions:** net session (who has sessions *with* this machine), net
  use (sessions *this* machine has with others).

- **NetBIOS:** nbtstat -S (suspicious NetBIOS connections).

- **Ports:** netstat -na 5 (live port status, refresh every 5 seconds),
  netstat -nao 5 (includes owning process ID), netstat -naob 5 (includes
  executable and DLLs, high CPU usage). fport (third-party tool) can
  also be useful.

- **Firewall:** netsh advfirewall show currentprofile or netsh firewall
  show config to review firewall rules.

- **TCP Connections:** Get-NetTCPConnection (PowerShell).

- **Network Traffic:** netstat -vb (verbose netstat), or use dedicated
  network monitoring tools (see section IV).

- **Traceroute:** tracert \<destination\> to trace network path.

**III. Linux Investigations:**

- **Network Interfaces:** ifconfig, ifconfig -a (all interfaces), ip
  link (detect promiscuous mode).

- **Open Ports and Processes:** netstat -nap, lsof -i (processes
  listening on ports).

- **Routing Table:** route -n, netstat -nr.

- **ARP Table:** arp -a, arp -an.

- **DNS and Host Resolution:** cat /etc/resolv.conf (DNS settings), cat
  /etc/hosts (hostname-IP mapping).

- **Firewall (iptables):** iptables -L -n (list rules).

- **Network Monitoring:** iostat (I/O statistics), vmstat (system
  activity), ngrep (network pattern matching), tcpdump (packet capture),
  traceroute, tc (traffic control).

- **Network Configuration Files:** /etc/init.d/network,
  /etc/nsswitch.conf, /etc/sysconfig/network-scripts,
  /etc/sysconfig/network.

- **Path:** echo \$PATH (check for suspicious directories in the
  executable path).

**IV. Network Monitoring Tools (General):**

- **Ping:** Basic connectivity test.

- **Traceroute:** Path tracing.

- **Tcpdump:** Packet capture and analysis.

- **Wireshark:** Powerful packet analyzer (GUI).

- **Nmap:** Network scanner (port scanning, host discovery).

- **ntop:** Network traffic monitoring and analysis.

- **netcat (nc):** Versatile tool for network connections, port
  scanning, etc.

**V. Detecting Sniffers:**

- **Promiscuous Mode:** Check kernel logs for interfaces entering
  promiscuous mode, or use ip link.

- **Unusual Port Activity:** netstat -nap, lsof -i.

- **ARP Table:** Look for unusual MAC addresses.

**VI. Host Discovery and Status:**

- **Ping:** ICMP echo requests.

- **SSH:** Check SSH connectivity.

- **Telnet:** (Less secure) Check if a port is open.

- **Nmap:** Host discovery and port scanning (nmap -sn \<target\>).

- **tcping:** TCP-based ping.

- **Netcat:** Port checking (nc -z \<target\> \<port\>).

### System Resources 

System resources can tell you a lot about system logging information,
uptime of the system, the memory space and utilisation of the system
etc.

- To know whether your Linux system has been running overtime or to see
  how long the server has been running for, the current time in the
  system, how many users have currently logged on, and the load averages
  of the system: <span class="mark">\>uptime</span>

- To view the memory utilisation by the system in Linux, the used
  physical and swap memory in the system, as well as the buffers used by
  the kernel<span class="mark">: \>free</span>

- As an incident responder to check the detail information of the ram,
  memory space available, buffers and swap on the system:
  <span class="mark">\>cat /proc/meminfo</span>

- As an incident responder, it is your responsibility to check if there
  is an unknown mount on your system, to check the mount present on your
  system: <span class="mark">\>cat /proc/mounts</span>

System Resources

- System resources can tell you a lot about system logging information,
  uptime of the system, the memory space and utilisation of the system
  etc.

- To know whether your Linux system has been running overtime or to see
  how long the server has been running for, the current time in the
  system, how many users have currently logged on, and the load averages
  of the system, then you can type: \#uptime

- To view the memory utilisation by the system in Linux, the used
  physical and swap memory in the system, as well as the buffers used by
  the kernel, you can type: \#free

- As an incident responder to check the detail information of the ram,
  memory space available, buffers and swap on the system: \#cat
  /proc/meminfo

- As an incident responder, it is your responsibility to check if there
  is an unknown mount on your system, to check the mount present on your
  system: \# cat /proc/mounts

>  

- **Look at event log files in directories (locations vary):** /var/log,
  /var/adm, /var/spool

- **List recent security events**: wtmp, who, last, lastlog

- **Examine network configuration**: arp –an, route print

- **List network connections and related details**: netstat –nap
  (Linux), netstat –na (Solaris), lsof –i

- **List users**: more /etc/passwd

- **Look at scheduled jobs**: more /etc/crontab, ls /etc/cron. \*, ls
  /var/at/jobs

- **Check DNS settings and the hosts’ file**: more /etc/resolv.conf,
  more /etc/hosts

- **Verify integrity of installed packages (affects lots of files!)**:
  rpm -Va (Linux), pkgchk (Solaris)

- **Look at auto-start services**: chkconfig --list (Linux), ls
  /etc/rc\*. d (Solaris), smf (Solaris 10+)

- **List processes**: ps aux (Linux, BSD), ps -ef (Solaris), lsof +L1

- **Find recently modified files (affects lots of files!):** ls –let /,
  find / -mtime -2d -ls

### Endpoint analysis

- Has your data been posted on the internet?

- Look at a listing of running processes or scheduled jobs for those
  that do not belong there.

- Look at contents of the hosts file for entries that do not belong
  there.

- Look at endpoint logs for unusual events.

- Look for running processes or scheduled jobs for those that do not
  belong there.

- Look for unusual files and verify integrity of OS and application
  files.

- Look for unusual programs configured to run automatically at system’s
  start time.

- What information has been deleted or corrupted by unauthorised
  parties?

- What information has been disclosed to unauthorised parties?

- What is the alert/event? Data Queries and message

- What is the Data context? App data content, data classification

- What services and programs are not working?

### Recovery and Remediation:

- **Clean the System:** Remove any malicious software and restore
  compromised files.

- **Strengthen Security:** Implement additional security measures to
  prevent future attacks.

- **Incident Response Plan:** Develop and test an incident response plan
  to handle future security incidents.

**Analysis of incident**

**Try find answers of below questions to investigate the incident**

1.  What problem has been reported and by who?

2.  What services, programs or hardware are not working?

3.  Are there any signs that data has been lost?

    1.  Have you received ransom requests?

    2.  Has your data been posted on the internet?

4.  What information has been disclosed to unauthorised parties,
    deleted, or corrupted?

5.  Have your customers noticed any problems? Can they use your
    services?

6.  Who designed the affected system and who maintains it?

7.  When did the problem occur or first come to your attention?

8.  What is the scope of the problem, what areas of the organisation are
    affected?

9.  Have there been any signs as to whether the problem has occurred
    internally within your organisation or externally through your
    supply chain?

10. What is the potential business impact of the incident?

11. To retain attacker’s footprints, avoid taking actions that access
    many files or installing tools. Look at system, security, and
    application logs for unusual events.

12. Look at network configuration details and connections, note
    anomalous settings, sessions, or ports.

13. Look at the list of users for accounts that do not belong or should
    have been disabled.

14. Look at a listing of running processes or scheduled jobs for those
    that do not belong there.

15. Look for unusual programs configured to run automatically at
    system’s start time.

16. Check ARP and DNS settings

17. look at contents of the hosts file for entries that do not belong
    there.

18. Look for unusual files and verify integrity of OS and application
    files.

19. Use a network sniffer, if present on the system or available
    externally, to observe for unusual activity.

20. A rootkit might conceal the compromise from tools; trust your
    instincts if the system just does not feel right.

21. Examine recently reported problems, intrusion detection and related
    alerts for the system.

# Response

 

## Recovery from Windows attack

  

**Change all the system’s accounts passwords**, and make your users do
so in a secure way: they should use passwords with upper/lower case,
special characters, numbers, and at least be 8 characters long.

Check the integrity of the whole data stored on the system, using MD5
hashes.

Cleaning infected machines

In case this solution cannot be applied, you should:

Install updates and patches.

No matter how far the hacker has gone into the system and the knowledge
you might have about the compromission, if the system has been
penetrated, the best practice is **<u>to reinstall the system fully from
original media and apply all fixes to the newly installed system.</u>**

Restore all binaries which could have been changed (Example: /bin/su)

**Restore all files** that could have been changed (Example:
svchost.exe) by the attacker.

How to respond to Windows Security Incident?

**<span class="mark">IR for Windows</span>**

**<span class="mark">Preparation</span>**

- *A physical access to the suspicious system should be given to the
  forensic investigator. Physical access is preferred to remote access,
  since the hacker could detect the investigations done on the system
  (by using a network sniffer for example).*

- *A physical copy of the hard-disk might be necessary for forensic and
  evidence purposes. Finally, if needed, a physical access could be
  needed to disconnect the suspected machine from any network.*

- *A good knowledge of the usual network activity of the machine/server
  is needed. You should have a file on a secure place describing the
  usual port activity, to compare efficiently to the current state.*

- *A good knowledge of the usual services running on the machine can be
  very helpful. Don’t hesitate to ask a Windows Expert for his
  assistance, when applicable. A good idea is also to have a map of all
  services/running process of the machine.*

- *It can be a real advantage to work in a huge corporate environment,
  where all user machines are the same, installed from a master CD. Have
  a map of all processes/services/applications. On such environment
  where users are not allowed to install software, consider any
  additional process/service/application as suspicious.*

- *The more you know the machine in its clean state, the more chances
  you have to detect any fraudulent activity running from it.*

**<span class="mark">Detection & Analysis</span>**

- *On a periodic basis (daily, weekly, or each time you logon to a
  system you manage,) run through these quick steps to look for
  anomalous behaviour that might be caused by a computer intrusion. Each
  of these commands runs locally on a system.*

- *Note: SysInternals tools can be used to perform most of these tasks.*

- ***Identification***

  - *Look at the opened sessions on the machine: C:\\ net session*

  - *Have a look at the sessions the machine has opened with other
    systems: C:\\ net use*

  - *Check for any suspicious Netbios connexion: C:\\ nbtstat –S*

  - *Look for any suspicious activity on the system’s ports : C:\\
    netstat –na 5. (5 makes it being refreshed each 5 seconds)*

  - *Use –o flag for Windows XP/2003 to see the owner of each process:
    C:\\ netstat –nao 5*

  - *Use “fport” if possible.*

<!-- -->

- ***Unusual Accounts***

  - *Look for unusual accounts created, especially in the Administrators
    group: C:\\ lusrmgr.msc OR C:\\ net localgroup administrators*

  - *Look for new, unexpected accounts in the Administrators group:
    \#lusrmgr.msc*

  - *Click on Groups, Double Click on Administrators, then check members
    of this group.*

  - *This can also be done at the command prompt: \#net user, \#net
    localgroup administrators*

<!-- -->

- ***Unusual Files and Reg Keys***

  - *Look for unusually big files on storage support, bigger than 5MB.
    (It can be an indication of system compromised for illegal content
    storage)*

  - *Look for unusual files added recently in system folders, especially
    C:\WINDOWS\system32.*

  - *Look for files using the “hidden” attribute: C:\\ dir /S /A:H, Use
    “windirstat” if possible.*

  - *Check file space usage to look for sudden major decreases in free
    space, using the GUI (right-click on partition), or type: dir c:\\*

  - *Look for unusually big files: Start 🡪 Search 🡪 For Files of
    Folders… Search Options 🡪 Size 🡪 At Least 10000KB*

  - *Look for strange programs referred to in registry keys associated
    with system start up:*

  - *HKLM\Software\Microsoft\Windows\\ CurrentVersion\Run*

  - *HKLM\Software\Microsoft\Windows\\ CurrentVersion\Runonce*

  - *HKLM\Software\Microsoft\Windows\\ CurrentVersion\RunonceEx*

  - *To check the registry, run: \# regedit.exe* 

  - *Look for unusual programs launched at boot time in the Windows
    registry, especially:
    HKLM\Software\Microsoft\Windows\CurrentVersion\Run
    HKLM\Software\Microsoft\Windows\CurrentVersion\Runonce
    HKLM\Software\Microsoft\Windows\CurrentVersion\RunonceEx*

  - *Use “HiJackThis” if possible. (Also have a look in your Startup
    folder)*

- ***Unusual Processes and Services***

  - *Check all running processes for unusual/unknown entries, especially
    processes with username “SYSTEM” and “ADMINISTRATOR”: C:\\
    taskmgr.exe (or tlisk, tasklist depending on Windows release) Use
    “psexplorer” if possible.*

- ***Check user’s autostart folders***

  - *C:\Documents and Settings\user\Start Menu\Programs\Startup*

  - *C:\WinNT\Profiles\user\Start Menu\Programs\Startup*

- ***Unusual Network Activity or Usage***

  - *Look for unusual/unexpected network services installed and started:
    C:\\ services.msc OR C:\\ net start*

  - *Check for file shares and verify each one is linked to a normal
    activity: C:\\ net view [<u>\\127.0.0.1</u>](file:///\\127.0.0.1),
    Use “tcpview” if possible.*

  - *On a periodic basis (daily, weekly, or each time you logon to a
    system you manage,) run through these quick steps to look for
    anomalous behavior that might be caused by a computer intrusion.
    Each of these commands runs locally on a system.*

  - *Look at file shares, and make sure each has a defined business
    purpose: \#net view [<u>\\127.0.0.1</u>](file:///\\127.0.0.1)*

  - *Look at who has an open session with the machine: \#net session*

  - *Look at which sessions this machine has opened with other systems:
    \#net use*

  - *Look at NetBIOS over TCP/IP activity: \#nbtstat –S*

  - *Look for unusual listening TCP and UDP ports: \#netstat –na*

  - *For continuously updated and scrolling output of this command every
    5 seconds: \#netstat –na 5*

  - *Windows XP and 2003 include the –o flag for showing owning process
    id: \#netstat –nao 5*

  - *Again, you need to understand normal port usage for the system and
    look for deviations.*

  - *The –b flag shows the executable name and the DLLs loaded for the
    network connection. C:\\ netstat –naob 5*

  - *Note that the –b flag uses excessive CPU resources.*

  - *Again, you need to understand normal port usage for the system and
    look for deviations.*

  - *Also check Windows Firewall configuration: C:\\ netsh firewall show
    config*

- ***Unusual Processes and Services***

  - *Note: You need to be familiar with the normal processes on the
    machine and search for deviations from the norm.*

  - *Look for unusual/unexpected processes by running Task Manager:
    (Start 🡪 Run and type taskmgr.exe)*

  - *Look for unusual network services installed: \#net start*

  - *Look for unusual started network services (GUI): \#services.msc*

  - *Using the command prompt: \#tasklist, \#wmic process list full*

- ***Unusual Scheduled or Automated Tasks***

  - *Look at the list of scheduled tasks for any unusual entry: C:\\ at*

  - *On Windows 2003/XP: C:\\ schtasks*

  - *Look at scheduled tasks on the local host by running: \#at*

  - *Also, check the scheduled tasks using the Task Manager, invoked by
    going to: Start - Programs - Accessories - System Tools - Scheduled
    Tasks*

  - *Look for unusual scheduled tasks, especially those that run as a
    user in the Administrator’s group, as SYSTEM, or with a blank user
    name.*

  - *Using the GUI, run msconfig and look at the Startup tab: Start à
    Run, msconfig.exe*

  - *Using the command prompt: C:\\ wmic startup list full*

  - *Look for unexpected entries in user autostart directories:*

    - *C:\Documents and Settings\\user_name\]\Start
      Menu\Programs\StartUp*

    - *C:\Winnt\Profiles\\user_name\]\Start Menu\Programs\StartUp*

<!-- -->

- ***Unusual Log Entries***

  - *Watch your log files for unusual entries: C:\\ eventvwr.msc*

  - *If possible, use “Event Log Viewer” or such tool*

  - *Search for events affecting the firewall, the antivirus, the file
    protection, or any suspicious new service.*

  - *Look for a huge amount of failed login attempts or locked out
    accounts.*

  - *Watch your firewall (if any) log files for suspect activity.*

  - *Check your logs for suspicious events, such as:*

    - *“Event log service was stopped.”*

    - *“Windows File Protection is not active on this system.”*

    - *"The protected System file \[file name\] was not restored to its
      original, valid version because the Windows File Protection..."*

    - *“The MS Telnet Service has started successfully.”*

  - *Look for large number of failed logon attempts or locked out
    accounts.*

  - *To do this using the GUI, run the Windows event viewer: C:\\
    eventvwr.msc*

  - *Using the command prompt: C:\\ eventquery.vbs \| more Or, to focus
    on a particular event log: C:\\ eventquery.vbs /L security*

- ***Rootkit check***

  - *Run “Rootkit Revealer”, “Rootkit Hooker”, “Ice Sword”, “Rk*

  - *Detector”, “SysInspector”, “Rootkit Buster”.*

  - *It’s always better to run several of these tools than only one.*

- ***Malware check***

  - *Run at least one anti-virus product on the whole disk. If possible*

  - *use several anti-virus. The anti-virus must absolutely be up-to-
    date.*

**<span class="mark">Containment</span>**

- *If the machine is considered critical for your company’s business
  activity and can’t be disconnected, backup all important data in case
  the hacker notices you’re investigating and starts deleting files.
  Also make a copy of the system’s memory for further analysis. (use
  tools such as Memorize, win32dd etc.)*

- *If the machine is not considered critical for your company and can be
  disconnected, shut the machine down the hard way, removing its power
  plug. If it is a laptop with a battery on, just push the “off” button
  for some seconds until the computer switches off.*

- *Offline investigations should be started right away if the live
  analysis didn’t give any result, but the system should still be
  considered compromised.*

- ***Make a physical copy** (bit by bit) of the whole hard disk on an
  external storage support, using EnCase, X-Ways, or similar forensic
  tool (dd, ddrescue etc.).*

- ***Try to find evidences of every action of the hacker:***

- ***Find all files used by the attacker**, including deleted files (use
  your forensic tools) and see what has been done with it or at least
  their functionality, in order to evaluate the threat.*

- ***Check all files accessed recently**.*

- *Inspect network shares to see if the malware has spread through it.*

- *More generally, try to **find how the attacker got into the system**.
  All leads should be considered. If no computer proof of the intrusion
  is found, never forget it could come from a physical access or a
  complicity/stealing of information from an employee.*

- *Apply fixes when applicable (operating system and applications), in
  case the attacker used a known vulnerability.*

**<span class="mark">Eradication</span>**

- *In case the system has been compromised:*

- *Temporary remove all accesses to the accounts involved in the
  incident.*

- *Remove all malicious files installed by the attacker.*

**<span class="mark">Recovery</span>**

- *No matter how far the hacker has gone into the system and the
  knowledge you might have about the compromission, as long as the
  system has been penetrated, the best practice is to reinstall the
  system fully from original media and apply all fixes to the newly
  installed system.*

- *In case this solution can’t be applied, you should:*

- *Change all the system’s accounts passwords, and make your users do so
  in a secure way: they should use passwords with upper/lower case,
  special characters, numbers, and at least be 8 characters long.*

- *Restore all files that could have been changed (Example:*

- *svchost.exe) by the attacker.*

**<span class="mark">Post incident activity</span>**

- ***Report:** A crisis report should be written and made available to
  all of the actors of the crisis management cell. The following themes
  should be described:*

  - *Initial detection, Actions and timelines of every important event,
    What went right, What went wrong, Incident cost*

- ***Capitalize:** Actions to improve the Windows intrusion detection
  management processes should be defined to capitalize on this
  experience.*
