# Detection

# Investigation

## Processes 

- ps aux

- ps -ef

- lsof -p \<process_id\>

- top (real-time process monitor)

- htop (interactive process viewer - if installed)

## Services: 

- systemctl status \<service-name\> (systemd)

- service --status-all (older init systems)

- chkconfig --list (older init systems)

## Files/Directories: 

- ls -l

- find

- cat /proc/meminfo (memory information)

- cat /proc/mounts (mounted filesystems)

- cat /etc/crontab (cron jobs)

- cat /etc/resolve.conf (DNS)

- cat /etc/hosts (hostnames)

## Network: 

- netstat -tulnp

- ss -tulnp (newer alternative to netstat)

- iptables -L -n (firewall rules)

Linux

- What information has been deleted or corrupted by unauthorised parties?

- What information has been disclosed to unauthorised parties?

- What is the alert/event? Data Queries and message

- What is the Data context? App data content, data classification

- What services and programs are not working?

Understanding system behaviour and identifying anomalies is crucial for incident response.

**Key areas to investigate:**

- **Scheduled tasks:** Examine scheduled tasks using at and task scheduler tools.

- **Running processes:** Check for suspicious processes using ps, top, and lsof.

- **System logs:** Analyze logs for unusual activity, errors, or security events.

- **File system integrity:** Verify file integrity and look for unexpected changes.

- **Network activity:** Monitor network traffic for suspicious connections.

- **System resources:** Check CPU, memory, and disk usage for abnormalities.

**Specific investigation points:**

- Identify unusual processes and services.

- Check for backdoors, rootkits, or malware.

- Analyze log files for suspicious patterns.

- Monitor system resource consumption.

- Verify file integrity and timestamps.

- Review network traffic for anomalies.

- Identify unauthorized access attempts.

By combining these techniques and using appropriate tools, you can effectively investigate suspicious activity on a Linux system.

Unix Initial System Examination

- Look at event log files in directories (locations vary): /var/log, /var/adm, /var/spool

- List recent security events: wtmp, who, last, lastlog

- Examine network configuration: arp –an, route print

- List network connections and related details: netstat –nap (Linux), netstat –na (Solaris), lsof –i

- List users: more /etc/passwd

- Look at scheduled jobs: more /etc/crontab, ls /etc/cron. \*, ls /var/at/jobs

- Check DNS settings and the hosts’ file: more /etc/resolv.conf, more /etc/hosts

- Verify integrity of installed packages (affects lots of files!): rpm -Va (Linux), pkgchk (Solaris)

- Look at auto-start services: chkconfig --list (Linux), ls /etc/rc\*. d (Solaris), smf (Solaris 10+)

- List processes: ps aux (Linux, BSD), ps -ef (Solaris), lsof +L1

- Find recently modified files (affects lots of files!): ls –let /, find / -mtime -2d -ls

### Files

Linux systems contain critical configuration files, making it a prime target for attackers.

Identifying and analysing suspicious files is crucial for security investigation.

<span class="mark">Linux</span>

- Check for Suspicious files in /proc and /tmp

Unusual Files

\# find / -name –print

\# find / -name. –print \# find / -name. –print

Here is a step-by-step approach:

**1. Identify Suspicious Files:**

- **Large File Sizes:** Use commands like ls -lh /etc to list files by size. Large files in /etc are often suspicious.

- **Unusual File Names:** Look for files with strange names or extensions.

- **Recent File Modifications:** Use find /etc -mtime -1 to find files modified within the last day.

- **File Permissions:** Check file permissions using ls -l /etc. Files with unusual permissions might indicate a problem.

**2. Analyze File Content:**

- **Use a Text Editor:** Open the file in a text editor to examine its contents. Look for malicious code, encryption, or unusual patterns.

- **Check File Signatures:** Use tools like file to determine the file type. This can help identify unexpected file formats.

- **Hash Verification:** Calculate the file's hash (MD5, SHA1, SHA256) and compare it to a known good version of the file.

**3. Investigate File Origins:**

- **Check File Ownership and Permissions:** Determine who owns the file and what permissions it has.  

- **Review System Logs:** Look for entries related to file creation or modification.

- **Examine Network Connections:** Check for unusual network activity associated with the file.

**4. Content Analysis:**

- **Search for Known Malicious Patterns:** Use tools like YARA to scan for known malware signatures.

- **Static Analysis:** Analyze the file's structure and code without executing it.

- **Dynamic Analysis:** Carefully execute the file in a controlled environment (like a sandbox) to observe its behaviour.

**5. Incident Response:**

- **Isolate the System:** If the file is deemed malicious, disconnect the system from the network.

- **Collect Evidence:** Gather information about the file, including its contents, metadata, and creation time.

- **Restore System:** Restore the system from a clean backup if possible.

- **Implement Security Measures:** Strengthen security controls to prevent future incidents.

**Additional Tools:**

- **File Integrity Monitoring (FIM) tools:** Continuously monitor file changes for anomalies.  

- **Intrusion Detection Systems (IDS):** Detect suspicious activity related to the file.

- **Digital Forensics Tools:** Collect and analyse evidence from the system.

By following these steps and using appropriate tools, you can effectively investigate suspicious files in the /etc directory and mitigate potential threats.

**File and Directory Analysis**

- **find:** Locate files based on various criteria (name, size, modification time, permissions): find / -name \*backdoor-type f -print

- **strings:** Extract printable strings from files: strings suspicious file

- **file:** Determine file type: file suspicious file

**File System and Disk Analysis**

- **df:** Report file system disk space usage: \>df -h

- **du:** Estimate file and directory space usage: du -sh \*

- **inode:** Display inode information: ls -i /path/to/file

**Security-Specific Tools**

- **chkrootkit:** Scan for rootkit-related files and processes: chkrootkit

- **rkhunter:** Another rootkit detection tool: rkhunter --checkall

### Services

**Understanding System Processes and Services**

To identify potential malicious activity on a Linux machine, it is crucial to analyse system processes and services.

Linux services can be categorized into system and network services.

- **System services** manage internal operations like scheduling tasks (cron) and system status.

- **Network services** handle external communication such as file transfers, DNS resolution, and firewalls.

**Process Analysis:**

- Examine running processes using <span class="mark">ps -aux.</span>

- Remember a rootkit might change results of ps -aux command for everything, especially here.

- Investigate suspicious processes with <span class="mark">lsof -p \[PID\].</span>

- Identify processes running under the root user <span class="mark">(UID 0).</span>

- Analyze process locations and parent-child relationships.

**Service Analysis:**

- Check enabled services using <span class="mark">chkconfig --list.</span>

- Identify suspicious running services with <span class="mark">service --status-all.</span>

- Look for unusual or unknown services.

**Scheduled Tasks:**

- Examine cron jobs using <span class="mark">cat /etc/crontab.</span>

- Check for suspicious or unauthorized tasks.

**Network Configuration:**

- Review DNS configuration in <span class="mark">\></span> <span class="mark">/etc/resolv.conf.</span>

- Inspect hostname-to-IP mappings or website SSL setup in <span class="mark">\>more</span> <span class="mark">/etc/hosts.</span>

- Analyze firewall rules using <span class="mark">iptables -L -n.</span>

**File System Analysis:**

- Search for suspicious files in /<span class="mark">proc</span> and /<span class="mark">tmp</span>.

- This /tmp directory is a place of choice for hackers to store data or malicious binaries.

- Check file permissions, ownership, and modification times.

**Identifying Anomalies**

- **Compare to Baseline:** Establish a known-good configuration as a baseline for comparison.

- **Look for Unusual Behaviour:** Identify processes or services that deviate from expected behaviour.

- **Check for Backdoors:** Search for hidden services or network connections.

- **Analyze Log Files:** Correlate system logs with suspicious activity.

By systematically examining these areas and comparing findings to a known-good system, you can effectively identify potential threats and take appropriate actions.

### Process

**Process Monitoring for Incident Response**

Incident responders should maintain a keen eye on system processes. By closely monitoring running programs, their resource consumption, and overall system behaviour, potential threats can be identified.

**Key tools for process monitoring:**

- **top:** Provides a dynamic view of system performance and running processes.

- **ps aux:** Offers a snapshot of current processes with detailed information.

- **lsof -p \[PID\]:** Displays open files and network connections for a specific process.

Through diligent observation and analysis of process information, incident responders can detect anomalies indicative of malicious activity.

### Log Entries

Incident responders must meticulously analyse various system logs to identify potential security breaches.

**Key Log Types:**

- **Authentication logs:** Track login attempts, successful/failed logins, and user activity.

- **System logs:** Record general system messages, including errors, warnings, and informational events.

- **Application logs:** Capture specific application activities and errors.

- **Security logs:** Contain security-related events, such as intrusion attempts or policy violations.

**Essential Log Analysis:**

- **Review system resource utilization:** Monitor CPU, memory, and disk usage to identify anomalies.

- **Examine authentication logs:** Look for failed login attempts, brute force attacks, or unauthorized access.

- **Inspect system and application logs:** Search for error messages, unusual activity, or security alerts.

- **Analyze kernel logs:** Identify system-level issues or kernel panics.

- **Correlate log data:** Combine information from multiple logs to identify attack patterns.

By thoroughly analysing these logs, incident responders can uncover evidence of malicious activity, determine the attack's impact, and take appropriate countermeasures.

**Log files in Red Hat Linux:**

**Core Log Location**

- **/var/log**: The primary directory for most log files.

**Essential Log Files:**

- **/var/log/messages**: General system messages and events.

- **/var/log/auth.log**: Authentication-related logs (SSH, telnet, sudo, etc.).

- **/var/log/secure**: Detailed authentication and security-related information.

- **/var/log/kern.log**: Kernel-level messages and errors.

- **/var/log/cron.log**: Cron job execution logs.

- **/var/log/maillog**: Mail system logs.

- **/var/log/httpd/access_log**: Apache web server access logs.

- **/var/log/httpd/error_log**: Apache web server error logs.

- **/var/log/boot.log**: System boot-up messages.

- **/var/log/mysqld.log**: MySQL database server logs.

- **/var/log/secure**: Detailed security-related information (duplicate of /var/log/secure).

- **/var/log/utmp**: Current user login information.

- **/var/log/wtmp**: Historical user login information.

**Other Important Logs:**

- **/var/log/dmesg**: Kernel ring buffer (boot messages, device probes).

- **/var/log/syslog**: Older systems might use this instead of /var/log/messages.

- **/var/log/faillog**: Failed login attempts (like auth.log).

- **/var/log/samba**: Samba file sharing service logs.

- **/var/log/rsyslog.log**: rsyslog daemon logs.

**Additional Considerations:**

- **Log rotation:** Log files often rotate to manage disk space.

- **Log compression:** Compressed log files (e.g., .gz) might exist.

- **Custom log locations:** Some applications or services might have their own log directories.

- **Log analysis tools:** Use tools like grep, awk, logwatch, or specialized log analysis software for efficient analysis.

By examining these log files, incident responders can gather crucial information about system events, security incidents, and performance issues.

### Automated Tasks

- Look for unusual jobs scheduled by users mentioned in

- /etc/cron.allow Pay a special attention to the cron jobs

- scheduled by UID 0 accounts (root): \# crontab –u root -l

- Look for unusual system-wide cron jobs: \# cat /etc/crontab and \# ls –la /etc/cron. \*

>  

### Unix Initial System Examination

Check DNS settings and the hosts’ file: more /etc/resolv.conf, more /etc/hosts

Examine network configuration: arp –an, route print

Find recently modified files (affects lots of files!): ls –let /, find / -mtime -2d -ls

List network connections and related details: netstat –nap (Linux), netstat –na (Solaris), lsof –i

List processes: ps aux (Linux, BSD), ps -ef (Solaris), lsof +L1

List recent security events: wtmp, who, last, lastlog

List users: more /etc/passwd

Look at auto-start services: chkconfi--list (Linux), ls /etc/rc\*. d (Solaris), smf (Solaris 10+)

Look at event logfiles in directories (locations vary): /var/log, /var/adm, /var/spool

Look at scheduled jobs: more /etc/crontab, ls /etc/cron. \*, ls /var/at/jobs

Verify integrity of installed packages (affects lots of files!): rpm -Va (Linux), pkgchk (Solaris)

 

### System Resources 

Understanding system resource utilization is crucial for incident response.

- **Check system uptime:** Use uptime to determine system uptime, current time, number of users, and load averages.

- **Monitor memory usage:** Employ free and /proc/meminfo to examine physical and swap memory usage.

- **Inspect disk usage and mounts:** Utilize df and /proc/mounts to check disk space and mounted file systems.

By analysing these metrics, you can identify potential performance issues, resource bottlenecks, and signs of malicious activity.

**Log Analysis for Cyber Event Investigation**

**Understanding and analysing system logs is crucial for identifying and responding to cyber incidents.**

**Key Log Files and Indicators:**

- **System logs:** /var/log/messages, /var/log/kern.log, /var/log/secure

- **Application logs:** /var/log/httpd/, /var/log/mysqld.log, etc.

- **Authentication logs:** /var/log/auth.log, /var/log/secure, /var/log/lastlog

- **Indicators of compromise:**

  - Unusual login attempts (SSH, telnet, FTP)

  - Error-filled logs (Apache, system, applications)

  - Abnormal system resource usage

  - Evidence of unauthorized access or file modifications

**Investigation Techniques:**

- **Review log content:** Search for patterns, anomalies, or suspicious activity.

- **Utilize log analysis tools:** Employ tools like grep, awk, logwatch for efficient analysis.

- **Correlate log data:** Combine information from multiple logs to identify attack vectors.

- **Check for file integrity:** Verify file hashes to detect modifications.

- **Identify system changes:** Look for unexpected software installations or configuration changes.

By carefully examining system logs and applying these techniques, incident responders can uncover valuable clues about cyberattacks and take appropriate countermeasures.

**Would you like to focus on a specific type of log analysis or investigate a particular attack scenario?**

<span class="mark">Investigating Log Files and System Information</span>

To effectively investigate a cyber incident, examine the following areas:

**Log Analysis:**

- **Review system logs:** Check /var/log, /var/adm, and /var/spool directories for relevant logs.

- **Examine authentication logs:** Analyze /var/log/auth.log, /var/log/secure, /var/log/lastlog for login attempts and failures.

**System Information:**

- **Check network configuration:** Use arp -an and route print to examine network settings.

- **List active connections:** Employ netstat, lsof to identify network activity.

- **Review system users:** Examine /etc/passwd for user accounts.

- **Inspect scheduled tasks:** Check /etc/crontab, /etc/cron. \*, and /var/at/jobs for scheduled jobs.

- **Verify DNS and host configurations:** Review /etc/resolv.conf and /etc/hosts for DNS settings and hostname mappings.

- **Inspect running processes:** Use ps aux, ps -ef, or lsof +L1 to list processes.

- **Identify recent file changes:** Employ ls -let and find to detect modified files.

**Additional Considerations:**

- **Package integrity:** Verify package integrity using tools like rpm -Va or pkgchk.

- **Auto-start services:** Check for auto-start services using chkconfig or equivalent commands.

- **Kernel modules:** List loaded kernel modules using lsmod.

By thoroughly examining these areas, you can gather valuable information about system activity, potential threats, and the impact of a cyber incident.

### Linux

- **Look at event log files in directories (locations vary):** /var/log, /var/adm, /var/spool

- **List recent security events**: wtmp, who, last, lastlog

- **Examine network configuration**: arp –an, route print

- **List network connections and related details**: netstat –nap (Linux), netstat –na (Solaris), lsof –i

- **List users**: more /etc/passwd

- **Look at scheduled jobs**: more /etc/crontab, ls /etc/cron. \*, ls /var/at/jobs

- **Check DNS settings and the hosts’ file**: more /etc/resolv.conf, more /etc/hosts

- **Verify integrity of installed packages (affects lots of files!)**: rpm -Va (Linux), pkgchk (Solaris)

- **Look at auto-start services**: chkconfig --list (Linux), ls /etc/rc\*. d (Solaris), smf (Solaris 10+)

- **List processes**: ps aux (Linux, BSD), ps -ef (Solaris), lsof +L1

- **Find recently modified files (affects lots of files!):** ls –let /, find / -mtime -2d -ls

- **/etc/passwd**: To view detailed information about all user accounts on the system.

- **passwd -S**: To check the setuid status of the passwd command, which can indicate potential security risks.

- **grep :0: /etc/passwd**: To identify root user accounts.

- **find / -nouser -print**: To locate files owned by a non-existent user, which may indicate malicious activity.

- Identifying Large Files such as larger than 512KB: \>find /home/ -type f -size +512k -exec ls -lh {} \\

- Finding Recently Modified Files: \>find / -mtime -2 -ls

- Checking Network Interfaces: \>ifconfig -a

- Listing Open Files and Listening Ports: \> lsof -I OR \>netstat -nap

- Display or Add ARP Cache: \>arp -a

- Checking the System Path: \>echo \$PATH

**Additional Considerations for Incident Responders:**

- **File Permissions:** Check file permissions to identify potential security risks.

- **Network Traffic Analysis:** Use tools like tcpdump or wireshark to capture and analyze network traffic.

- **System Logs:** Review system logs (e.g., /var/log/syslog, /var/log/secure) for suspicious activity.

- **Process Monitoring:** Use tools like top or htop to monitor system processes.

- **User Activity:** Analyze user logs to identify unusual behaviour.

By effectively utilizing these commands and considering the additional points, incident responders can efficiently investigate and mitigate security incidents on Linux systems.

- **Configuration Files:**

  - /etc/shadow: Encrypted passwords and password policies.

  - /etc/group: Group memberships and permissions.

  - /etc/sudoers: User privileges for elevated commands.

- **System Logs:**

  - /var/log/auth.log: Authentication logs.

  - /var/log/lastlog: Last login times for users.

- **System Resources:**

  - uptime: System uptime, load average, and user count.

  - free: Memory usage and swap space.

  - /proc/meminfo: Detailed memory information.

  - /proc/mounts: Mounted file systems.

- **Process Information:**

  - top: Dynamic view of processes and system resources.

  - ps aux: List of running processes.

  - lsof: Detailed information about open files.

- **Services:**

  - service --status-all: List of running services.

  - /etc/crontab: Scheduled tasks.

- **Network Configuration:**

  - /etc/resolv.conf: DNS resolver configuration.

  - /etc/hosts: Static hostname-to-IP address mappings.

  - iptables: Firewall rules.

Potential Questions for Further Investigation:

1.  **Password Policies:**

    - What is the minimum password length?

    - How often are password changes enforced?

    - Are strong password requirements enforced (e.g., special characters, uppercase letters)?

2.  **User Privileges:**

    - Which users have sudo privileges?

    - Are there any unnecessary privileges assigned to users?

    - Are password aging policies enforced for privileged users?

3.  **System Security:**

    - Is a firewall configured to protect the system?

    - Are intrusion detection systems (IDS) or intrusion prevention systems (IPS) in place?

    - Are regular security scans and vulnerability assessments performed?

4.  **Log Analysis:**

    - Are logs rotated regularly?

    - Are logs being monitored for suspicious activity (e.g., failed login attempts, unusual network traffic)?

    - Are logs being archived for future analysis?

5.  **System Performance:**

    - Is the system experiencing any performance bottlenecks?

    - Are disk I/O, CPU usage, and memory utilization within acceptable limits?

    - Are regular system performance benchmarks performed?

6.  **Network Configuration:**

    - Are DNS settings configured correctly?

    - Are firewall rules configured to allow necessary traffic and block unwanted traffic?

    - Are network services (e.g., SSH, FTP) configured securely?

7.  **Software Updates:**

    - Is the system up-to-date with the latest security patches?

    - Is an automated patching process in place?

By addressing these questions, system administrators can improve the security and performance of their Linux systems.

# Response

## Recovery from Linux attack

Change all the system’s accounts passwords, and make your users do so in a secure way: they should use passwords with upper/lower case, special characters, numbers, and at least be 7 characters long.

Check the integrity of the whole data stored on the system, usinMD5 hashes.

No matter how far the hacker has gone into the system and the knowledge you might have about the compromission, if the system has been penetrated, the best practice is to reinstall the system completely and apply all security fixes. In case this solution cannot be applied, you should:

Restore all binaries which could have been changed (Example: /bin/su)

# IR to Linux Compromise

 

# Preparation

- A physical access to the suspicious system should be offered to the forensic investigator.

- A physical copy of the hard-disk might be necessary for forensic and evidence purposes. If needed, a physical access could be necessary to disconnect the suspected machine from any network.

- A good knowledge of the usual network activity of the machine/server is needed. You should have a file on a secure place describing the usual port activity, to compare efficiently to the current state.

- A good knowledge of the usual services is needed. Don’t hesitate to ask a Unix/Linux Expert for his assistance, when applicable.

- You should have a regularly updated list of all critical files, (especially SUID and GUID files) stored in a secure place out of the network or even on paper. With this list, you can easily separate usual SUID files and detect unusual ones.

- Have a map of your usual port activity/traffic rules.

# Detection & Analysis

- ***Unusual Accounts***

  - *Look for any suspicious entry in /etc/passwd, especially with UID 0. Also check /etc/group and /etc/shadow.*

  - *Look for orphaned files, which could have been left by a deleted account used in the attack: \# find / \\ -nouser –o –nogroup \\ -print*

  - *As an Incident Responder, it is very important to investigate the user account’s activity. It helps you understand the logged-in users, the existing users, usual or unusual logins, failed login attempts, permissions, access by sudo etc. The various commands to check the user account activity:*

  - *To identify whether there is an account entry in your system that may seem suspicious. This command usually fetches all the information about the user account. To do so, type: \#cat /etc/passwd*

  - *The ‘Setuid’ option in Linux is unique file permission. So, on a Linux system when a user wants to make the change of password, they can run the ‘passwd’ command. As the root account is marked as setuid, you can get temporary permission. Type: \#passwd -S sandeep*

  - *Grep is used for searching plain- text for lines that match a regular expression. :0: is used to display ‘UID 0’: \#grep :0: /etc/passwd*

  - *To Identify and display whether an attacker created any temporary user to perform an attack, type: \#find / -nouser -print*

  - *The /etc/shadow contains the encrypted password, details about the passwords and is only accessible by the root users: \#cat /etc/shadow*

  - *The group file displays the information of the groups used by the user. To view the details, type: \#cat /etc/group*

  - *If you want to view information about user and group privileges to be displayed: \#cat /etc/sudoers*

>  

- ***Unusual Files***

  - *Look for all SUID and GUID files: \# find / -uid 0 \\ –perm -4000 –o –perm 2000 \\ –print*

  - *Look for weird file names, starting with “. “ or “.. “ or “ “ :*

    - *\# find / -name “ \*“ –print*

    - *\# find / -name “. \*“ –print*

    - *\# find / -name “.. \*“ –print*

  - *Look for large files (here: larger than 10MB): \# find / -size +10MB –print*

  - *Look for processes running from or to files which have been unlinked : \# lsof +L1*

  - *Verify all MD5 hashes of your binaries in /bin, /sbin, /usr/bin,*

  - */usr/sbin or any other related binary storing place. (use AIDE or such tool)*

  - ***<u>WARNING:</u>** this operation will probably change all file timestamps. This should only be done after all other investigations are done and you feel like you can alter these data.*

  - *On systems with RPM installed, use: \# rpm –Va \| sort*

  - *On some Linux, a script named check-packages can be used. On Solaris: \# pkg_chk –vn*

  - *On Debian: \#debsums –ac*

  - *On Openbsd (not really this but a way): \#pkg_delete -vnx*

> **Unusual Files**
>
> *As an incident responder, you should be aware of any abnormal-looking files in your system.*
>
> ***Identify Large Files:** Identify any overly large files in system and their destination: \#find /home/ -type f -size +512k -exec ls -lh {} \\*
>
> ***Recent Anomalous file:** As an incident responder, if you want to see an anomalous file that has been present in the system for 2 days: \#find / -mtime -2 -ls*

- ***Unusual Services***

  - *Look for unusual files in /proc and /tmp. This last directory is a place of choice for hackers to store data or malicious binaries.*

  - *(Linux only) Run chkconfig (if installed) to check for all enabled services: \# chkconfig --list*

  - *Look at the running processes (remember: a rootkit might change your results for everything in this paper, especially here!): \# ps -aux*

  - *Use lsof –p \[pid\] on unknown processes*

  - *You should know your usual running processes, and be able to figure out which processes could have been added by a hacker. Pay a special attention to the processes running under UID 0.*

  - *To find any abnormally running services: \#service --status-all*

  - *The incident responder should look for any suspicious scheduled tasks and jobs. To find the scheduled tasks: \#cat /etc/cronjob*

- ***Unusual Process:***

  - *To get a dynamic and a real-time visual of all the processes running in the Linux system, a summary of the information of the system and the list of processes and their ID numbers or threads managed by Linux Kernel: \# top*

  - *To see the process status of your Linux and the currently running processes system and the PID. To identify abnormal processes that could indicate any malicious activity in the Linux system: \#ps aux*

  - *To display more details on a particular process: \#lsof -p 8047*

- ***Unusual Network Activity***

  - *Try to detect sniffers on the network using several ways:*

  - *Look at your kernel log files for interfaces entering promiscuous mode such as :“kernel: device eth0 entered promiscuous mode”*

  - *Use \# ip link to detect the “PROMISC” flag. Prefer this method to ifconfig, since ifconfig does not work on all kernels.*

  - *Look for unusual port activity: \# netstat –nap and \# lsof –i*

  - *to get more information about processes listening to ports.*

  - *Look for unusual MAC entries in your LAN: \# arp -a*

  - *Look for any unexpected IP address on the network.*

  - To obtain the network activity information, you can use various commands. \#ifconfig

  - To see all the network interfaces, you can use: \#ifconfig -a

  - *To list all the processes that are listening to ports with their PID, you can use:* \#lsof -i

  - *To display all the listening ports in the network use:* \#netstat -nap

  - *To display the system ARP cache, you can type:* \#arp -a

  - *The \$PATH displays a list of directories that tells the shell which directories to search for executable files, to check for directories that are in your path you can use:* \#echo \$PATH

  - *To resolve DNS configuration issues and to avail a list of keywords with values that provide the various types of resolver information: \#cat /etc/resolv.conf*

  - *To check file that translates hostnames or domain names to IP addresses, which is useful for testing changes to the website or the SSL setup: \#cat /etc/hosts*

  - *Manage the IPv4 packet filtering and NAT in Linux systems: \#iptables -L -n*

>  

- ***Unusual Automated Tasks***

  - *Look for unusual jobs scheduled by users mentioned in*

  - */etc/cron.allow Pay a special attention to the cron jobs*

  - *scheduled by UID 0 accounts (root): \# crontab –u root -l*

  - *Look for unusual system-wide cron jobs: \# cat /etc/crontab and \# ls –la /etc/cron.\**

- ***Unusual Log Entries***

  - *Huge number of authentication/login failures from local or remote access tools (sshd,ftpd,etc.)*

  - *Remote Procedure Call (RPC) programs with a log entry that includes a large number of strange characters …)*

  - *A huge number of Apache logs mentioning “error”*

  - *Reboots (Hardware reboot)*

  - *Restart of applications (Software reboot)*

  - *Almost all log files are located under /var/log directory in most Linux distributions. Here are the main ones:*

    - ***/var/log/message:** General message and system related stuff*

    - ***/var/log/auth.log:** Authentication logs*

    - ***/var/log/kern.log**: Kernel logs*

    - ***/var/log/cron.log**: Cron job logs*

    - ***/var/log/maillog:** Mail server logs*

    - ***/var/log/httpd/:** Apache access and error logs directory*

    - ***/var/log/boot.log:** System boot log*

    - ***/var/log/mysqld.log:** MySQL database server log file*

    - ***/var/log/secure:** Authentication log*

    - ***/var/log/utmp** or **/var/log/wtmp:** Login records file*

  - *To look through the log files, tools like cat and grep may be useful:*

  - *cat /var/log/httpd/access.log \| grep "GET /signup.jsp"*

  - *To view the reports of the most recent login of a particular user or all the users in the Linux system, you can type: \#lastlog*

  - *To identify any curious SSH & telnet logins or authentication in the system, you can go to /var/log/ directory and then type: \#tail auth.log*

  - *To view the history of commands that the user has typed, you can type history with less or can even mention up to the number of commands you typed last. To view history, you can type: \#history \| less*

>  

- ***Unusual Kernel log Entries***

  - *Look through the kernel log files on the system for suspicious events. Use : \# dmesg*

  - *List all important kernel and system information : \# lsmod OR \# lspci*

  - *Look for known rootkit (use rkhunter and such tools)*

>  

- ***Unix Initial System Examination***

  - *Look at event log files in directories (locations vary): /var/log, /var/adm, /var/spool*

  - *List recent security events: wtmp, who, last, lastlog*

  - *Examine network configuration: arp –an, route print*

  - *List network connections and related details: netstat –nap (Linux), netstat –na (Solaris), lsof –i*

  - *List users: more /etc/passwd*

  - *Look at scheduled jobs: more /etc/crontab, ls /etc/cron.\*, ls /var/at/jobs*

  - *Check DNS settings and the hosts’ file: more /etc/resolv.conf, more /etc/hosts*

  - *Verify integrity of installed packages (affects lots of files!): rpm -Va (Linux), pkgchk (Solaris)*

  - *Look at auto-start services: chkconfig --list (Linux), ls /etc/rc\*.d (Solaris), smf (Solaris 10+)*

  - *List processes: ps aux (Linux, BSD), ps -ef (Solaris), lsof +L1*

  - *Find recently modified files (affects lots of files!): ls –lat /, find / -mtime -2d -ls*

- ***System Resources***

  - *System resources can tell you a lot about system logging information, uptime of the system, the memory space and utilisation of the system etc.*

  - *To know whether your Linux system has been running overtime or to see how long the server has been running for, the current time in the system, how many users have currently logged on, and the load averages of the system, then you can type: \#uptime*

  - *To view the memory utilisation by the system in Linux, the used physical and swap memory in the system, as well as the buffers used by the kernel, you can type: \#free*

  - *As an incident responder to check the detail information of the ram, memory space available, buffers and swap on the system: \#cat /proc/meminfo*

  - *As an incident responder, it’s your responsibility to check if there is an unknown mount on your system, to check the mount present on your system: \# cat /proc/mounts*

>  
>
>  

**<span class="mark">Containment</span>**

- *Backup all important data from the compromised machine, if possible, using a bit-by-bit physical copy of the whole hard disk on an external support. Also make a copy of the memory (RAM) of the system, which will be investigated if necessary.*

- *If the machine is not considered critical for the company and can be disconnected, shut the machine down the hard way, removing its power plug. If it is a laptop with a battery on, just push the “off” button for some seconds until the computer switches off.*

- *Offline investigations should be started right away if the identification step didn’t give any result, but the system is still suspected of being compromised.*

- *Try to find evidences of every action of the hacker: (using forensic tools like Sleuth Kit/Autopsy for example)*

- *Find all files used by the attacker, including deleted files and see what has been done with them or at least their functionality to evaluate the threat.*

- *Check all files accessed recently.*

- *Check log files*

- *More generally, try to find how the attacker got into the system. All leads should be considered. If no computer proof of the intrusion is found, never forget it could come from an insider.*

- *Apply fixes when applicable, to prevent the same kind of intrusion, in case the attacker used a known fixed vulnerability.*

**<span class="mark">Eradication</span>**

- ***Remediation:** Temporary remove all accesses to the accounts involved in the incident, and remove all fraudulent files.*

**<span class="mark">Recovery</span>**

- *No matter how far the hacker has gone into the system and the knowledge you might have about the compromission, as long as the system has been penetrated, the best practice is to reinstall the system completely and apply all security fixes. In case this solution can’t be applied, you should:*

- *Change all the system’s accounts passwords, and make your users do so in a secure way: they should use passwords with upper/lower case, special characters, numbers, and at least be 7 characters long.*

- *Check the integrity of the whole data stored on the system, using MD5 hashes.*

- *Restore all binaries which could have been changed (Example: /bin/su)*

**<span class="mark">Post incident activity</span>**

- ***Report:** A crisis report should be written and made available to all of the actors of the crisis management cell. The following themes should be described:*

  - *Initial detection, Actions and timelines, What went right, What went wrong, Incident cost*

- ***Capitalize:** Actions to improve the Unix/Linux intrusion detection management processes should be defined to capitalize on this experience.*

# Spring4Shell Incident Response Report

**📚 Table of Contents**

1.  SIEM Alert

2.  Detection & Verification

3.  Initial Access

4.  Execution

5.  Privilege Escalation

6.  Credential Access

7.  Containment

8.  Lessons Learned

9.  MITRE ATT&CK Mapping

------------------------------------------------------------------------

**1️⃣ SIEM Alert**

- **Alert Triggered:** Suspicious POST data with the string:

- java.io.InputStream%20in%20%3D%20%25%7Bc1%7Di

- **Additional Indicator:** Command "cat /etc/shadow" observed in logs.

- **L1 SOC Analyst Note:** Flagged as harmful but unable to proceed with further investigation.

------------------------------------------------------------------------

**2️⃣ Detection & Verification**

- Payload searched via Google revealed links to **Spring4Shell** (CVE-2022-22965) — a **Remote Code Execution (RCE)** vulnerability in Spring Core Framework.

- References:

  - [Rapid7 Advisory](https://www.rapid7.com/blog/post/2022/03/30/spring4shell-zero-day-vulnerability-in-spring-framework/)

  - [CyberKendra Analysis](https://www.cyberkendra.com/2022/03/spring4shell-details-and-exploit-code.html)

------------------------------------------------------------------------

**3️⃣ Initial Access**

- PCAP analysis revealed **port scanning** from IP 3\[.\]21\[.\]128\[.\]255 targeting:

- Ports: 80, 8080, 8081, 8082

- **Port 8082** responded, confirming availability via a TCP 3-way handshake.

- Exploit payload sent to this port, matching Spring4Shell exploit behavior.

- **Technique Used:**\
  T1190 - Exploit Public-Facing Application\
  (MITRE ATT&CK)

------------------------------------------------------------------------

**4️⃣ Execution**

- Post-exploitation commands detected:

- whoami, pwd, cat /etc/passwd, cat /etc/shadow

- Confirmed execution of system-level commands.

- Host IP of target: 172.31.34.218

- **Result:** Full command execution achieved, including access to sensitive system files.

------------------------------------------------------------------------

**5️⃣ Privilege Escalation**

- **Command Output:** whoami returned root

- **Conclusion:** Attacker obtained **root-level access** directly via exploit.

- **No further privilege escalation technique required.**

------------------------------------------------------------------------

**6️⃣ Credential Access**

- Attacker accessed:

  - /etc/passwd

  - /etc/shadow

- **Technique Used:**\
  T1003.008 - OS Credential Dumping: /etc/shadow

------------------------------------------------------------------------

**7️⃣ Containment**

- Upon confirmation of compromise:

  - The device (SpringServer) was **isolated via Endpoint Detection and Response (EDR)** to prevent:

    - Lateral movement

    - Further exfiltration or persistence

------------------------------------------------------------------------

**8️⃣ Lessons Learned**

- Even updated frameworks (e.g., Spring) can have **zero-day vulnerabilities**.

- Proactive mitigation may not always be possible.

- **Key recommendations:**

  - Invest in **visibility and detection tools** (e.g., EDR, NDR, SIEM).

  - Ensure **WAFs, patching pipelines, and vulnerability management** are in place.

  - Conduct **regular penetration testing** of web apps using public-facing frameworks.

------------------------------------------------------------------------

**9️⃣ MITRE ATT&CK Mapping**

| **Stage** | **Technique** | **ID** |
|----|----|----|
| Initial Access | Exploit Public-Facing Application | T1190 |
| Execution | Command and Scripting Interpreter | T1059 |
| Credential Access | OS Credential Dumping (/etc/shadow) | T1003.008 |
| Privilege Escalation | Valid Account with Root Access (No escalation needed) | T1078 |
| Discovery | System Information Discovery (whoami, pwd) | T1082 |
| Containment (IR Action) | Isolate Endpoint (Manual Response) | N/A |
