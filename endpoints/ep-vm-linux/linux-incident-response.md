Linux RPM - RedHat Package Manager

ELSA - Enterprise Linux Security Advisory

# Introduction

## Linux vs Windows

| Feature | Linux | Windows |
|----|----|----|
| Cost | Generally free | Paid, requires licensing |
| Open Source | Yes | No |
| Security | Generally, more secure | Generally, less secure |
| Customization | High | Limited |
| Stability | High | Moderate |
| User-Friendliness | Steeper learning curve, command-line focus | User-friendly GUI |
| Software Availability | May have limited commercial software | Wide range of commercial and gaming software |
| Hardware Compatibility | May have compatibility issues with some hardware | Broad hardware compatibility |
| Command-Line Interface | Strong and very usable. | Also usable, but linux has a much stronger use of it. |
| Support | Community-based | Microsoft support |
| kernel type | Monolithic | Hybrid/Micro |

 

## First 3 steps to secure linux

- **System Updates:** Apply the latest patches and updates to the
  operating system and all installed applications. Use package managers
  like apt or yum for this.

- **Secure User Accounts:** Create a new privileged user account with
  sudo rights, and disable or severely limit direct root login. Utilize
  SSH keys for authentication instead of passwords.

- **Firewall Configuration:** Configure a firewall (like iptables or
  ufw) to block all unnecessary incoming traffic, allowing only
  essential ports (e.g., SSH, HTTP, HTTPS).

# System Administration

## System basics

**Subscription Management:**

- View subscription identity: subscription-manager identity

- Configure subscriptions: subscription-manager (replaces rhn_register)

**Version Information:**

- View RHEL version: /etc/redhat-release

**System Profile Information:**

- Generate system diagnostic report: sosreport

- View BIOS/DMI information: dmidecode

- Display hardware topology: lstopo

- Display CPU architecture information: lscpu

- Display detailed cpu information: cat /proc/cpuinfo

- Display detailed hardware information: lshw

**Time Settings:**

- DATE: View and modify system time.

**Terminal Navigation:**

- ls: List directory contents.

  - ls -a: List all files and directories, including hidden ones.

  - ls \<folderName\>: List contents of a specific directory.

  - ls -lh: List in long format with human-readable sizes.

  - ls -l \*.jpg: List JPEG files only.

  - ls -lh \<fileName\>: Detailed list of a specific file.

- cd \<folderName\>: Change directory. Use quotes for directory names
  with spaces (e.g., cd "My Folder").

  - cd /: Go to the root directory.

  - cd ..: Go up one directory level. Multiple levels can be traversed
    (e.g., cd ../../../).

- du: Disk usage.

  - du -h: Disk usage of directories in human-readable format.

  - du -ah: Disk usage of all files and directories in human-readable
    format.

  - du -sh: Summarized disk usage of directories.

- pwd: Print working directory.

- man \<command\>: Display the manual page for a command.

**Flow Redirection:**

**1. Standard Output Redirection:**

- \>: Redirect standard output to a file, overwriting existing content.

  - Example: ps -ejH \> process.txt

- \>\>: Append standard output to a file.

**2. Standard Error Redirection:**

- 2\>: Redirect standard error to a file.

  - Example: cut -d , -f 1 file.csv \> file 2\> errors.log

- 2\>&1: Redirect standard error to the same destination as standard
  output.

**3. Piping Commands:**

- \|: Pipe the output of one command as input to another.

  - Example: du \| sort -nr \| less

## Directory Structure

<img src="media/image1.png" style="width:7.41528in;height:4.12414in" />

## File System Design

Linux employs a hierarchical, tree-structured file system design. This
means that files are organized within directories, and directories can
contain other directories, creating a nested structure. This design
provides a logical and efficient way to manage and store files on a
system.

**Key Components of Linux File System Design:**

1.  **Inodes:**

    - Inodes are data structures that contain essential information
      about a file, such as:

      - Owner (user and group)

      - Permissions (read, write, execute)

      - Timestamps (creation, modification, access)

      - Size

      - Type (regular file, directory, symbolic link, etc.)

      - Location of data blocks

    - Each file has a unique inode number, which is used to identify and
      access the file.

2.  **Data Blocks:**

    - Data blocks store the actual contents of a file.

    - The inode contains pointers to the data blocks that make up the
      file.

    - Data blocks can be allocated in different ways, depending on the
      file system type (e.g., contiguous, fragmented, or linked list).

3.  **Superblock:**

    - The superblock is a data structure located at the beginning of the
      file system.

    - It contains information about the file system, such as:

      - Size

      - Type (e.g., ext2, ext3, ext4)

      - Number of inodes and data blocks

      - Free space

      - Mount point

    - The superblock is essential for the file system to function
      correctly.

4.  **Directories:**

    - Directories are special files that contain entries for other files
      and directories.

    - Each entry in a directory consists of a file name and the
      corresponding inode number.

    - Directories are typically implemented as linked lists or hash
      tables.

**Common File System Types in Linux:**

- **ext2:** Second extended file system. One of the oldest and most
  widely used file systems in Linux.

- **ext3:** Third extended file system. Extends ext2 with journaling
  capabilities for improved data integrity.

- **ext4:** Fourth extended file system. Offers enhancements over ext3,
  including larger file sizes, better performance, and improved metadata
  handling.

- **Btrfs:** B-tree file system. A modern file system with features like
  copy-on-write, snapshots, and RAID support.

- **XFS:** Extended file system. A high-performance file system designed
  for large systems and heavy workloads.

**File System Operations:**

- **Creating and Deleting Files and Directories:** The kernel creates or
  deletes inodes and updates directory entries.

- **Reading and Writing Files:** The kernel reads or writes data blocks
  based on the inode pointers.

- **Changing File Attributes:** The kernel modifies the inode's
  metadata.

- **Mounting and Unmounting File Systems:** The kernel attaches or
  detaches file systems to or from mount points.

**Note:** The specific implementation details of Linux file systems may
vary depending on the file system type and kernel version. However, the
underlying principles and components described above remain consistent.

**Would you like to delve deeper into a specific aspect of Linux file
system design, such as journaling, metadata handling, or performance
optimization?**

 

## File Searching

**File Searching**

- **locate**:

  - Quickly finds files based on filename patterns.

  - Relies on a pre-built database (/var/lib/mlocate/mlocate.db).

  - Requires updating the database regularly using updatedb.

  - Example: locate filename or locate \*.txt.

- **find**:

  - More versatile and powerful than locate.

  - Searches the file system in real-time.

  - Supports various search criteria (name, size, modification time,
    permissions, etc.).

  - Example:

    - find /path/to/search -name filename: Finds files by name.

    - find /path/to/search -type d: Finds directories.

    - find /path/to/search -size +1M: Finds files larger than 1
      megabyte.

    - find /path/to/search -mtime -7: Finds files modified within the
      last 7 days.

    - find /path/to/search -user username: Finds files owned by
      username.

    - find /path/to/search -perm 755: finds files with permission 755.

    - find /path/to/search -exec command {} \\: Executes a command on
      found files.

**Data Compression**

- **gzip**:

  - Compresses files using the GZIP algorithm.

  - Creates files with the .gz extension.

  - Example:

    - gzip filename: Compresses a file.

    - gzip -d filename.gz: Decompresses a file.

    - gunzip filename.gz: Decompresses a file.

    - gzip -r directory: recursively gzip all files in a directory.

- **bzip2**:

  - Compresses files using the BZIP2 algorithm, generally providing
    better compression than gzip.

  - Creates files with the .bz2 extension.

  - Example:

    - bzip2 filename: Compresses a file.

    - bzip2 -d filename.bz2: Decompresses a file.

    - bunzip2 filename.bz2: Decompresses a file.

    - bzip2 -k filename: Compresses a file and keep the original file.

- **xz**:

  - Compresses files using the LZMA2 algorithm, offering even better
    compression than bzip2.

  - Creates files with the .xz extension.

  - Example:

    - xz filename: Compresses a file.

    - xz -d filename.xz: Decompresses a file.

    - unxz filename.xz: Decompresses a file.

    - xz -k filename: Compresses a file and keep the original file.

- **tar**:

  - Archives multiple files and directories into a single file
    (tarball).

  - Can be combined with compression tools for archiving and
    compression.

  - Example:

    - tar -cvf archive.tar file1 file2 directory: Creates a tar archive.

    - tar -xvf archive.tar: Extracts a tar archive.

    - tar -tvf archive.tar: Lists the contents of a tar archive.

    - tar -czvf archive.tar.gz file1 file2 directory: Creates a gzipped
      tar archive.

    - tar -cjvf archive.tar.bz2 file1 file2 directory: Creates a bzip2
      compressed tar archive.

    - tar -cJf archive.tar.xz file1 file2 directory: Creates a xz
      compressed tar archive.

    - tar -xzvf archive.tar.gz: Extracts a gzipped tar archive.

    - tar -xjvf archive.tar.bz2: Extracts a bzip2 compressed tar
      archive.

    - tar -xJvf archive.tar.xz: Extracts a xz compressed tar archive.

- **zip**:

  - Creates zip archives.

  - Example:

    - zip archive.zip file1 file2: Creates a zip archive.

    - unzip archive.zip: Extracts a zip archive.

## File Management

**Viewing File Content:**

- cat: Concatenate and display file content.

- tail: Display the last part of a file.

**File Manipulation:**

- cp: Copy files and directories.

- mv: Move (rename) files and directories.

- rm: Remove files and directories.

- touch: Create empty files or update file timestamps.

**Directory Management:**

- mkdir: Create directories.

**Linking Files:**

- ln: Create hard or symbolic links.

**Text Processing:**

- grep: Search for patterns in files.

- sort: Sort lines of text files.

- wc: Count lines, words, and characters.

- cut: Remove sections from each line of files.

**Data Compression/Decompression**

- **Archiving:**

  - tar: Archive files and directories (create tarballs).

- **Compression:**

  - gzip: Compress files using gzip algorithm.

  - bzip2: Compress files using bzip2 algorithm.

- **Decompression:**

  - gunzip: Decompress files compressed with gzip.

  - bzip2 -d or bunzip2: Decompress files compressed with bzip2.

**File/Directory Ownership and Group Management:**

- chown: Change file owner.

- chgrp: Change file group.

**Essential System Binaries (/bin Directory):**

- The /bin directory contains essential system binaries, including
  executable files for fundamental commands (such as those listed
  above).

## File Transfer

- Connect to remote machine**: telnet example.com 80**

<!-- -->

- Data transfer copy file over ssh (secure copy), Copy a file from a
  local system to a remote system**: scp file.txt
  remote_username@10.10.0.2:/remote/directory**

<!-- -->

- Data transfer securely, use SSH FTP (SFTP)**: sftp
  hostname/ip_address**

- Data transfer to/from local and remote machines, mirroring, perform
  backups, copy files from one directory to another directory
  locally: **rsync -av /path/to/source /path/to/destination**,
  Synchronize two directories remotely: **rsync -avzhe ssh
  user@remote:/path/to/source /path/to/destination**

- Data transfer: **ftp**

- Download and data transfer to/from remote machine: **curl -o
  <https://example.com/file.zip>**

- Encrypted connection to remote machine, file transfers, Openssh
  client**: ssh -p admin@192.168.0.1**

- File transfer, port scanning, connect remote server: **netcat
  192.168.229.1 80**

- To send a POST request with data: **curl -X POST -d
  "param1=value1&param2=value2" <https://example.com/api>**

## Remote Access

- Connect to remote machine**: telnet example.com 80**

- Encrypted connection to remote machine, file transfers, Openssh
  client**: ssh -p admin@192.168.0.1**

>  

 

## Scheduled jobs

**RHEL Scheduled Jobs Summary**

- **Crontab (cron):**

  - Used for recurring scheduled tasks.

  - Edits are made using sudo crontab -e (for root) or crontab -e (for
    user).

  - Lists current cron jobs with crontab -l.

  - Backs up cron jobs to a file with crontab -l \> backup_date.txt.

  - Crontab syntax: minute hour day_of_month month day_of_week command.

    - \*: Represents all values.

    - ,: Represents multiple values (e.g., 1,3,5).

    - -: Represents a range of values (e.g., 1-5).

    - /: Represents step values (e.g., \*/4).

  - Example: 0 2 \* \* \* /etc/scripts/backup.sh (runs
    /etc/scripts/backup.sh at 2:00 AM daily).

  - Example: 0 \*/4 \* \* \* /etc/scripts/backup.sh (runs
    /etc/scripts/backup.sh every 4 hours).

- **at:**

  - Used for one-time scheduled tasks.

  - Used to schedule a command to run at a specific time.

- **atrm:**

  - Removes scheduled at jobs.

- **sleep:**

  - Pauses execution for a specified duration, often used within scripts
    or scheduled tasks.

**Command Segregation**

- **Crontab Commands:**

  - crontab -e: Edit crontab.

  - crontab -l: List crontab entries.

  - crontab -l \> filename: backup crontab entries.

- **at Commands:**

  - at: Schedule a one time task.

  - atrm: Remove a scheduled at task.

- **Other Commands:**

  - sleep: Pause execution.

<img src="media/image2.png" style="width:4.73008in;height:2.91949in" />

 

## Process Management

**Process Management**

- **ps:** Displays a snapshot of current processes.

- **top:** Provides a dynamic, real-time view of running processes.

- **kill:** Terminates processes by sending signals.

- **w:** Shows currently logged-in users and their processes.

- **tload:** Graphically displays the current system load.

**Background/Foreground Process Control**

- **bg:** Moves a suspended process to the background.

- **fg:** Brings a background or suspended process to the foreground.

 

## Software management

### I. Software Management (Yum/DNF)

- **Installing Software:**

  - yum install \<package_name\> / dnf install \<package_name\>: Install
    a specific package.

  - yum group install \<group_name\>: Install a group of packages.

- **Updating/Upgrading Software:**

  - yum update / dnf update: Update all installed packages.

  - yum update \<package_name\> / dnf update \<package_name\>: Update a
    specific package.

  - yum upgrade: Upgrade all installed packages to the latest available
    version.

- **Removing Software:**

  - yum remove \<package_name\> / dnf remove \<package_name\>: Remove a
    specific package.

- **Searching Software:**

  - yum search \<keyword\> / dnf search \<keyword\>: Search for packages
    based on keywords.

- **Viewing Software Information:**

  - yum info \<package_name\>: Display detailed information about a
    package.

  - yum group info \<group_name\>: Display information about a package
    group.

- **Finding Package Ownership:**

  - yum provides \<filename-glob\>: Find the package that provides a
    specific file or pattern.

- **Configuring Repositories:**

  - subscription-manager repos /etc/yum.repos.d/\*.repo: Configure
    software repositories.

### II. Package Management (RPM)

- **Installing Packages:**

  - rpm -i \<package_name.rpm\>: Install a package from a local file.

  - rpm -ivh \<package_name.rpm\>: Install a package with verbose output
    and hash progress.

  - rpm -ivh \<URL_to_package.rpm\>: Install a package directly from a
    URL.

- **Updating/Upgrading Packages:**

  - rpm -U \<package_name.rpm\>: Update/upgrade an existing package.

- **Removing Packages:**

  - rpm -e \<package_name\>: Remove a package.

- **Querying Packages:**

  - rpm -q \<package_name\>: Query if a package is installed.

  - rpm -qa: List all installed packages.

  - rpm -qf \<filename\>: Find the package that owns a specific file.

- **Verifying Packages:**

  - rpm -V \<package_name\>: Verify the integrity of an installed
    package.

## Linux Security Configuration files

Here is a list of common Linux security configuration files, along with
their primary functions:

**System-Wide Configuration Files**

- **/etc/passwd**: Contains user accounts and their corresponding
  password hashes.

- **/etc/shadow**: Stores encrypted passwords and password aging
  information.

- **/etc/group**: Defines groups and their members.

- **/etc/sudoers**: Controls which users can execute commands with
  superuser privileges.

- **/etc/ssh/sshd_config**: Configures the SSH daemon for secure remote
  login.

- **/etc/pam.d/**\*: Contains modules for Pluggable Authentication
  Modules (PAM), used for authentication, authorization, and accounting.

- **/etc/security/limits.conf**: Sets resource limits for users and
  processes.

- **/etc/sysctl.conf**: Configures system parameters, including network
  and security-related settings.

**Firewall Configuration Files**

- **/etc/iptables.rules**: Contains rules for the iptables firewall.

- **/etc/ufw/ufw.conf**: Configures Uncomplicated Firewall (UFW).

- **/etc/firewalld/firewalld.conf**: Configures FirewallD.

**SELinux Configuration Files**

- **/etc/selinux/config**: Enables or disables SELinux.

- **/etc/selinux/policy/modules/platform.te**: Contains policy rules for
  the platform.

- **/etc/selinux/policy/modules/custom.te**: Contains custom policy
  rules.

**Other Configuration Files**

- **/etc/login.defs**: Defines default values for user account creation.

- **/etc/rc.d/rc.local**: Contains scripts executed at system startup.

- **/etc/crontab**: Contains cron jobs scheduled to run at specific
  times.

- **/etc/rsyslog.conf**: Configures the system logging daemon.

**Note:** The exact locations and names of these files may vary slightly
depending on the Linux distribution and configuration. It's essential to
consult the documentation for your specific distribution to ensure
accurate configuration.

**Additional Tips:**

- **Regular Updates:** Keep your system and software up-to-date to
  address security vulnerabilities.

- **Security Best Practices:** Follow security best practices, such as
  using strong passwords, limiting user privileges, and regularly
  reviewing system logs.

- **Security Tools:** Consider using security tools like intrusion
  detection systems (IDS) and firewalls to enhance your system's
  protection.

By understanding and managing these configuration files, you can
significantly improve the security of your Linux system.

## Linux monitoring

- Monitor terminal, disk, I/O statistics for devices and partitions:
  **iostat --human**

- Monitor processes, memory, paging, block IO, traps, and CPU activity:
  **vmstat -S M**

- Monitor interface statistics, open sockets, routing tables, and
  connection information: **netstat -a**

- <span class="mark">Network packet analyser</span> - display all HTTP
  GET and POST requests on port 80: **ngrep -q -d eth0 'GET\|POST' 'port
  80'**

- <span class="mark">Packet sniffing and analyser</span> - Troubleshoot
  connectivity issues such as capture filter and analyse network
  traffic. Capture packets on interface eth0: **tcpdump -i eth0**

- <span class="mark">Network diagnostics**,** </span>track the pathway
  taken by a packet on an IP network from source to destination.
  Traceroute uses ICMP echo packets with variable time to live (TTL)
  values**: traceroute google.com**

- Monitor and control traffic based on IP and Quality of service,
  <span class="mark">Set bandwidth limit</span>**: tc qdisc add dev eth0
  root tbf rate 1024kbit latency 50ms burst 1540**

- Port scanning: **nmap**

  

# System Security

Absolutely! Here's a summarized and deduplicated breakdown of RHEL
security, organized for clarity:

**Core Security Practices:**

- **Strong Passwords:**

  - Implement complex, unique passwords for all user accounts,
    especially administrative ones.

  - Avoid easily guessable information.

- **Regular Updates:**

  - Maintain up-to-date operating system and software applications with
    the latest security patches to mitigate vulnerabilities.

- **Firewall Configuration:**

  - Implement a firewall to restrict network traffic to essential
    connections, preventing unauthorized access.

**SELinux Management:**

- **Configuration:**

  - /etc/selinux/config: Main configuration file for SELinux.

  - system-config-selinux: Graphical tool for SELinux configuration.

- **Context Management:**

  - chcon: Change SELinux security context of files.

  - restorecon: Restore default SELinux security contexts.

  - semanage: Manage SELinux policy settings.

- **Boolean Management:**

  - setsebool: Modify SELinux boolean values to enable or disable
    specific features.

- **Troubleshooting:**

  - sealert: Analyze and report on SELinux denials.

**Usage segregation of commands:**

**SELinux Configuration and Policy Management:**

- /etc/selinux/config: Edit to set SELinux modes(enforcing, permissive,
  disabled).

- semanage: Used for advanced SELinux policy management, like managing
  port labels, file context definitions, and booleans.

- system-config-selinux: Graphical utility for basic SELinux mode
  setting, and boolean toggling.

**SELinux Context Manipulation:**

- chcon: Change the security context of a file or directory. This is
  useful when files are mislabeled.

- restorecon: Reset the security context of files or directories to
  their default values, based on the current policy.

**SELinux Boolean Control:**

- setsebool: Toggle SELinux booleans to enable or disable specific
  policy rules.

**SELinux Troubleshooting and Reporting:**

- sealert: Analyze SELinux denial messages and provide recommendations
  for resolving them.

## Kernel Security

**RHEL Security: Core Principles**

- **Kernel Security:**

  - User/Kernel Space Separation: Isolates user processes from kernel
    operations.

  - Discretionary Access Control (DAC): Basic file/directory permission
    management.

  - Mandatory Access Control (MAC): Enhanced security policies (SELinux,
    AppArmor).

  - Address Space Layout Randomization (ASLR): Mitigates memory-based
    attacks.

  - Control Flow Integrity (CFI): Prevents control flow hijacking.

  - Seccomp (Secure Computing Mode): Limits system call access.

  - Kernel Packet Filtering: Firewall functionality (iptables/nftables).

  - Linux Security Modules (LSM): Framework for extending kernel
    security.

  - Kernel Self-Protection: protects kernel code and data.

  - Kernel SameSite Cookies: Protects against cross-site request forgery
    attacks.

- **System Hardening:**

  - Kernel Hardening: Utilizing features like Seccomp, Grsecurity, and
    Yama.

  - User/Group Management: Strong password policies, UID/GID management,
    privilege separation.

  - File System Security: SELinux/AppArmor, file permissions.

  - Network Security: Firewalls, network isolation.

  - Kernel Module Security: Module signing, blacklisting.

  - Security Updates: Kernel and package updates.

  - Monitoring/Auditing: System logs, Intrusion Detection Systems (IDS),
    auditd.

  - Security Best Practices: Regular audits, security awareness
    training, backups.

**RHEL Security: Command-Based Segregation**

**1. Network Security (Firewalling):**

- iptables: (Legacy) Configure packet filtering rules.

- nftables: (Modern) Configure packet filtering rules.

**2. Auditing and Monitoring:**

- auditd: Record system events for analysis.

- System logs (e.g., /var/log/messages, /var/log/secure): Review for
  suspicious activity.

**3. SELinux/AppArmor:**

- SELinux:

  - setenforce: Change SELinux modes (enforcing, permissive).

  - semanage: Manage SELinux policies.

  - restorecon: Restore file context.

  - ausearch: Search audit logs for SELinux events.

- AppArmor:

  - aa-status: Check AppArmor status.

  - aa-enforce: Enforce AppArmor profiles.

  - aa-disable: Disable AppArmor profiles.

**4. User/Group Management:**

- useradd: Add users.

- usermod: Modify user accounts.

- groupadd: Add groups.

- passwd: Change passwords.

- /etc/login.defs: Configure password policies.

**5. Kernel Module Management:**

- modprobe: Load/unload kernel modules.

- /etc/modprobe.d/: Configuration directory for module blacklisting.

**6. System Updates:**

- yum / dnf: Package management for updates.

- rpm: Package management.

**7. Seccomp:**

- Seccomp is typically configured programmatically within applications.
  There are not common command line tools for direct general system wide
  seccomp configuration.

## BIOS Security 

It is important to clarify that Linux typically uses UEFI (Unified
Extensible Firmware Interface) instead of BIOS (Basic Input/Output
System). While some older systems might still have BIOS, UEFI offers
more advanced security features. Here is some security controls found on
UEFI firmware relevant to Linux:

- **Supervisor Password:** Prevents unauthorized access to UEFI
  settings.

- **Secure Boot:** Limits booting to authorized operating systems and
  firmware signed by trusted keys. This is especially important for
  protecting against boot-time malware.

- **Fast Boot Restrictions:** Disables functionalities that might speed
  up boot process at the expense of security, like booting from external
  devices.

## Linux Antimalware’s

**Top 10 Antivirus Software for Linux**

While Linux is generally considered more secure than Windows, it's still
a good practice to have an antivirus program installed. Here are some of
the top options:

**Free Antivirus Software**

1.  **ClamAV:** A popular open-source antivirus solution known for its
    reliability and performance.

2.  **Comodo Antivirus:** Offers free basic protection, including
    real-time scanning and firewall.

3.  **Kaspersky Free Antivirus:** A free version of the renowned
    Kaspersky antivirus, providing essential protection.

**Paid Antivirus Software**

4.  **Bitdefender GravityZone:** A comprehensive solution for both home
    and business users, offering advanced protection and features.

5.  **ESET NOD32 Antivirus:** Known for its lightweight footprint and
    excellent detection rates.

6.  **Sophos Intercept X Endpoint:** A powerful endpoint protection
    solution with advanced features like deep learning and behavioral
    analysis.

7.  **Avast Business Security:** Designed for businesses, offering
    robust protection and management tools.

8.  **Kaspersky Endpoint Security:** Another excellent choice for
    businesses, providing comprehensive protection and centralized
    management.

9.  **Trend Micro Maximum Security:** A consumer-focused solution with a
    wide range of features, including parental controls and identity
    theft protection.

10. **Norton Security Premium:** A well-known brand offering advanced
    protection and features for individuals and families.

**Note:** The best antivirus software for you will depend on your
specific needs and budget. Consider factors such as the level of
protection required, ease of use, and compatibility with your Linux
distribution.

## Linux API Security

Securing Linux APIs is crucial to protecting your system from
vulnerabilities and attacks.

Here is a breakdown of key APIs and considerations:

**System Calls**

- **File System Operations:**

  - open(), read(), write(), close(): Implement input validation, file
    permissions checks, and access control lists (ACLs) to prevent
    unauthorized access and data leakage.

  - mkdir(), rmdir(), chmod(), chown(): Ensure proper permissions and
    ownership to control who can create, delete, and modify files and
    directories.

- **Process Management:**

  - fork(), execve(): Validate user input and restrict process creation
    and execution to authorized users and processes.

  - kill(), signal(): Implement signal handling mechanisms to prevent
    unauthorized process termination or manipulation.

- **Network Operations:**

  - socket(), bind(), listen(), accept(): Validate IP addresses, port
    numbers, and connection requests to prevent unauthorized network
    access.

  - send(), recv(): Implement input validation and encryption to protect
    data transmitted over the network.

- **Memory Management:**

  - malloc(), free(): Use memory allocation and deallocation functions
    carefully to prevent memory leaks and buffer overflows.

  - mmap(): Ensure proper memory mapping and permissions to prevent
    unauthorized access to sensitive data.

**Libraries**

- **C Standard Library:**

  - strcpy(), strncpy(), strcat(), strncat(): Use safer string handling
    functions like strcpy_s() and strncpy_s() to prevent buffer
    overflows.

  - scanf(), printf(): Validate user input and format strings to prevent
    format string vulnerabilities.

- **Glibc:**

  - getaddrinfo(), inet_ntop(), inet_pton(): Validate network addresses
    and prevent IP address spoofing.

  - getenv(), setenv(): Implement environment variable validation and
    sanitization to prevent environment variable injection attacks.

- **POSIX Libraries:**

  - pthread_create(), pthread_join(): Implement thread synchronization
    mechanisms to prevent race conditions and deadlocks.

  - sem_init(), sem_wait(), sem_post(): Use semaphores for thread
    synchronization and mutual exclusion.

Kernel Modules

- **Module Loading and Unloading:**

  - init_module(), cleanup_module(): Implement module verification and
    integrity checks to prevent malicious module loading.

- **Device Driver Operations:**

  - open(), read(), write(), ioctl(): Implement input validation, access
    control, and data sanitization to protect device drivers from
    vulnerabilities.

**Additional Considerations:**

- **Input Validation:** Always validate user input to prevent injection
  attacks and other vulnerabilities.

- **Memory Safety:** Use memory-safe programming practices to prevent
  buffer overflows and other memory-related issues.

- **Access Control:** Implement robust access control mechanisms to
  restrict access to sensitive resources.

- **Encryption:** Use encryption to protect sensitive data in transit
  and at rest.

- **Regular Updates:** Keep your system and software up-to-date to
  address known vulnerabilities.

- **Security Audits:** Conduct regular security audits to identify and
  address potential vulnerabilities.

# IAM

## Identity Management:

- **User Management:**

  - Adding users: sudo useradd, sudo adduser, GUI mode

  - Modifying users: sudo usermod

  - Deleting users: sudo userdel

- **Group Management:**

  - Adding groups: sudo groupadd

  - Deleting groups: sudo groupdel

- **Network User Information:**

  - getent (retrieves user and group information from various sources)

- **Active Directory Integration:**

  - Joining Linux to Active Directory using realmd, sssd, and adcli.

- **Local user databases**

## Authentication Management:

- **Authentication Mechanisms:**

  - LDAP (Lightweight Directory Access Protocol)

  - Kerberos

  - SSSD (System Security Services Daemon)

- **Authentication Configuration Tools:**

  - authconfig (command-line)

  - authconfig-tui (text-based user interface)

  - authconfig-gtk (graphical user interface)

  - authselect

- **Restricting User Logins:**

  - /etc/nologin file (restricts logins to root)

  - PermitRootLogin no in /etc/ssh/sshd_config (disables root SSH login)

Authentication Configuration Tools

- **authconfig:**

  - A command-line tool for configuring authentication mechanisms on
    Linux systems.

  - Allows users to select authentication sources (LDAP, Kerberos, local
    users) and configure related settings.

  - Can be used to automate authentication configuration tasks.

- **authconfig-tui:**

  - A text-based user interface for authconfig, providing a more
    interactive way to configure authentication.

- **authconfig-gtk:**

  - A graphical user interface for authconfig, offering a visually
    appealing and user-friendly experience.

- **authselect:**

  - A command-line tool that allows users to switch between different
    authentication sources at runtime.

  - Useful for testing or troubleshooting authentication configurations.

## Access Management:

- **File and Directory Permissions:**

  - Changing ownership: sudo chown

  - Changing permissions: sudo chmod

  - Changing group: sudo chgrp

- **Access Control Lists (ACLs):**

  - Linux ACLs for granular permissions.

- **sudo and sudoers:**

  - Granting specific users permissions to execute commands (e.g.,
    shutdown, reboot) using visudo.

- **Setuid:**

  - File permission that allows execution with the file owner's
    privileges.

### SELinux

- **Core Function:**

  - Security-Enhanced Linux (SELinux) is a Linux kernel security module
    providing mandatory access control (MAC) policies.

  - It enhances security by controlling access to system resources.

- **Key Principles:**

  - **Clean Separation:** Policy enforcement is distinct from policy
    definition.

  - **Well-Defined Interfaces:** Provides standard interfaces for policy
    interaction.

  - **Application Integration:** Supports applications querying and
    enforcing access control (e.g., cron jobs).

  - **Policy Independence:** Operates independently of specific policy
    languages and label formats.

  - **Granular Control:** Enables individual labels and controls for
    kernel objects and services.

  - **Policy Flexibility:** Supports policy changes and adaptation.

  - **Dual Security:** Offers separate measures for system integrity
    (domain-type) and data confidentiality (multilevel security).

  - **Resource Control:** Manages access to:

    - File systems, directories, and files.

    - Open file descriptors.

    - Process initialization, inheritance, and program execution.

    - Sockets, messages, and network interfaces.

    - Capabilities.

  - **Access Vector Cache (AVC):** Caches access decisions for
    performance.

**SELinux Commands and Usage:**

- **Configuration:**

  - /etc/selinux/config: Main SELinux configuration file.

  - chcon: Changes file security context.

  - restorecon: Restores file security context to default.

  - semanage: Manages SELinux policy modules, port definitions, and file
    context.

  - setsebool: Toggles SELinux boolean values.

  - system-config-selinux: (Graphical) Configures SELinux settings.

- **Security Reporting:**

  - sealert: Analyzes and reports on SELinux alerts.

## IAM Protocols:

- **LDAP (Lightweight Directory Access Protocol):**

  - A directory service protocol for accessing and modifying data.

- **Kerberos:**

  - A network authentication protocol using symmetric-key cryptography.

- **SSSD (System Security Services Daemon):**

  - A framework for integrating various authentication mechanisms.

 

## Linux Privilege Escalation

**Privilege Escalation** is a technique used by attackers to gain
higher-level permissions on a Linux system than their initial access
level. This is often achieved by exploiting vulnerabilities or
misconfigurations.

Common Methods for Privilege Escalation:

- **Writable Scripts:** If an attacker can modify a script that is
  executed by a privileged user, they can inject malicious code to
  escalate their privileges.

- **Crontab:** The crontab is a configuration file that schedules tasks
  to run automatically. If an attacker can modify the crontab, they can
  schedule a malicious script to run with elevated privileges.

- **Kernel Vulnerabilities:** Exploiting vulnerabilities in the Linux
  kernel can grant an attacker root privileges.

- **Path Variable:** The PATH environment variable specifies the
  directories that the shell searches for executables. By modifying the
  PATH variable, an attacker can replace legitimate executables with
  malicious ones.

- **Automated Scripts:** Attackers can use automated scripts to scan
  systems for vulnerabilities and exploit them to escalate privileges.

Why is Privilege Escalation Important?

- **CTFs and Challenges:** Privilege Escalation is a common technique
  used in Capture the Flag (CTF) challenges, especially boot-to-root
  challenges.

- **Risk Assessment:** Companies can use Privilege Escalation techniques
  to assess their security posture and identify potential
  vulnerabilities.

- **Threat Response:** By understanding Privilege Escalation techniques,
  companies can better prepare for and respond to cyberattacks.

- **APT Tactics:** Advanced Persistent Threats (APTs) often use
  Privilege Escalation to gain administrative or root privileges after
  gaining initial access to a system.

**In conclusion,** Privilege Escalation is a critical aspect of
understanding Linux security. By understanding the techniques used by
attackers, organizations can better protect their systems and prevent
unauthorized access.

## Permissions management

- Chown

- Chmod

>  

## User and Group management

- Adduser / Useradd

- Deluser

- Addgroup

- Delgroup

- Usermod

- Useradd

 

# Network 

- Change IP address to static:

Network bonding

Network bonding is a Linux kernel feature that combines multiple network
interfaces into a single virtual interface. This enhances fault
tolerance by automatically redirecting traffic to a working interface if
one fails. It also improves performance by aggregating bandwidth across
multiple interfaces.

Network bonding offers several advantages, including:

- **Redundancy:** Ensures network connectivity even if one interface
  fails.

- **Increased bandwidth:** Aggregates bandwidth from multiple interfaces
  for higher throughput.

- **Load balancing:** Distributes traffic across multiple interfaces to
  improve performance.

- **Fault tolerance:** Provides a backup interface in case of failures.

The bonding configuration is managed through the
/etc/modprobe.d/bonding.conf file, where you define the bonding mode,
slave interfaces, and other parameters. Understanding network bonding is
crucial for building reliable and high-performance network
infrastructures in Linux environments.

## Basic Network Information: 

- ip: Replaces ifconfig and route; displays and manages network
  interfaces, routes, and addresses.

- ifconfig: (Legacy) Displays network interface information.

- hostnamectl: displays and modifies system hostname.

- ping: Checks network connectivity to a host.

- ARP: Displays and manages the ARP (Address Resolution Protocol) cache.

- route: Displays and modifies the routing table.

- netstat: Displays network connections, routing tables, and network
  interface statistics.

- dig: Queries DNS servers for information.

- ipcalc: Calculates network information from IP addresses and subnet
  masks.

## Network Interface Configuration: 

- ethtool: Manages physical Ethernet connections and network cards.

- iw/iwconfig: Manages wireless network settings.

- ifup: Brings a network interface up.

- ifdown: Brings a network interface down.

- nmcli: NetworkManager command-line tool for managing network
  connections. (e.g., nmcli connection show, nmcli connection modify).

Network management

- Activate network interface: **ifup**

- Assign IP to network interface: **sudo ifconfig eth0 192.168.1.100
  netmask 255.255.255.0**

- Change IP address to static

- Display information about all network interfaces: **ifconfig**

- Display information about specific network interface: **ifconfig
  eth0**

- Display network <span class="mark">device status, create, edit,
  activate/deactivate, and delete network connections</span>, control
  network manager: **nmcli device show**

- DNS administration. To query a DNS server for information about a
  domain: **dig example.com**

- DNS servers testing and troubleshooting, verify and retrieve DNS
  records**: nslookup localdomain**

- IP routing table configuration, add, delete, change route entry:
  **route -p ADD 192.168.0.1 \<subnet-mask\>
  \<gateway-ip_address-hostname\> \<-if interface\>**

- Kernel configuration, manage version, security settings of kernel:
  **sysctl all**

- Manage systemd and services, such as <span class="mark">check
  services/automounts in memory</span>: **systemctl start
  \<service-name\>**

- Monitor and control traffic based on IP and Quality of service,
  <span class="mark">Set bandwidth limit</span>**: tc qdisc add dev eth0
  root tbf rate 1024kbit latency 50ms burst 1540**

- Monitor interface statistics, open sockets, routing tables, and
  connection information: **netstat -a**

- Monitor processes, memory, paging, block IO, traps, and CPU activity:
  **vmstat -S M**

- Monitor terminal, disk, I/O statistics for devices and partitions:
  **iostat --human**

- <span class="mark">Network diagnostics**,** </span>track the pathway
  taken by a packet on an IP network from source to destination.
  Traceroute uses ICMP echo packets with variable time to live (TTL)
  values**: traceroute google.com**

- Network interface configuration, make interface up, down, assign and
  remove addresses and routes, manage arp cache, show routing table:
  **ip route show**

- <span class="mark">Network packet analyser</span> - display all HTTP
  GET and POST requests on port 80: **ngrep -q -d eth0 'GET\|POST' 'port
  80'**

- Network users: getent

- <span class="mark">Packet sniffing and analyser</span> - Troubleshoot
  connectivity issues such as capture filter and analyse network
  traffic. Capture packets on interface eth0: **tcpdump -i eth0**

- Port scanning: **nmap**

- Query, change and administer Hostnames: **hostnamectl**

- Shutdown network interface**: sudo ifdown eth0**

- View IP address-MAC address table: **arp**

- Wireless network, scanning networks, configuring wireless network
  interfaces: **iw dev wlan0 scan, iwconfig**

## Network Traffic Analysis & Monitoring: 

- tcpdump: Captures and displays network packet headers.

- ngrep: Greps network traffic for specific patterns.

- tcpflow: Captures and assembles TCP streams.

- mitmproxy: Intercepts and inspects SSL connections.

- nc (netcat): Creates arbitrary TCP and UDP connections.

Investigate network bottlenecks

Ping

Wireshark

NMAP

Tcpdump

Netcat

Network Routing

route –n

netstat -nr

Test remote server alive status

The provided text describes various methods to test the remote server's
alive status. Here's a summary:

- **Ping:** This is the first method to try, but it may fail if ICMP
  replies are disabled or blocked by a firewall.

- **SSH:** This method can be used to check if connectivity works via
  SSH. If it fails, it indicates either the SSH service is down, the
  user is restricted, or the connection is blocked by a firewall.

- **Telnet:** This method can be used to test if the remote host is
  listening on a port. However, it may not respond if the port is
  blocked by a firewall.

- **Nmap:** This command can be used to scan the remote host and provide
  details about its live status and port filtering.

- **TCPing:** This package can be used to test remote host alive status
  using port ping.

- **Netcat:** This utility can be used to test if a port on a remote
  host is allowed or blocked by a firewall.

The example provided in the text demonstrates how to use netcat to test
if port 22 on host 192.168.1.100 is accessible.

## Network Performance & Benchmarking: 

- ab/nload/iperf: Benchmarking tools for network performance.

## Firewall & Traffic Control: 

- iptables: Configures the Linux kernel firewall.

- tc: Traffic control tool for shaping network traffic.

- sysctl: Configures Linux kernel network stack parameters.

iptables: linux built-in firewall

 

**Iptable:** What is “iptable”? OR What is the name of the default
firewall in a Linux machine? iptable is the default firewall in a Linux
machine. input and output chain policy so prepare good concepts on
iptables

**Iptable (Firewall in linux)**

- What is “iptable”? OR What is the name of the default firewall in a
  Linux machine?

<!-- -->

- iptable is the default firewall in a Linux machine.

- input and output chain policy so prepare good concepts on iptables

<!-- -->

- How u use the iptable firewall to restrict SSH, Telnet, FTP?

<!-- -->

- For SSH: \#iptables -A INPUT -s -p tcp --dport \<22\> -j
  REJECT/DROP/DENY

- For Telnet: \#iptables -A INPUT -s -p tcp --dport \<23\> -j
  REJECT/DROP/DENY

- For FTP: \#iptables -A INPUT -s -p tcp --dport \<21\> -j
  REJECT/DROP/DENY

 

Packet filtering is one defense against IP spoofing attacks

- **Set default policies/chains**

  - iptables -P INPUT DROP

  - iptables -P FORWARD DROP

  - iptables -P OUTPUT ACCEPT

- **Allow loopback traffic**

  - iptables -A INPUT -i lo -j ACCEPT

  - iptables -A OUTPUT -o lo -j ACCEPT

- **Allow incoming SSH traffic**

  - iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state
    NEW,ESTABLISHED -j ACCEPT

  - iptables -A OUTPUT -o eth0 -p tcp --sport 22 -m state --state
    ESTABLISHED -j ACCEPT

- **Allow incoming HTTP traffic**

  - iptables -A INPUT -i eth0 -p tcp --dport 80 -m state --state
    NEW,ESTABLISHED -j ACCEPT

  - iptables -A OUTPUT -o eth0 -p tcp --sport 80 -m state --state
    ESTABLISHED -j ACCEPT

IPTables – Linux Firewall

iptables command blocks or allows traffic on a Linux host, like a
network firewall. This iptables command may prevent certain applications
from receiving or transmitting requests.

iptable is the default firewall in a Linux machine.

Sometimes this question is also asked as “what is the name of the
default firewall in a Linux machine”. Questions are also asked on the
input and output chain policy so prepare good concepts on iptables

 

How to kill spoofed packets

Spoofing means to imitate or trick someone.

IP spoofing is creation of IP packets with a false source IP address,
for the purpose of impersonating another computing system.

\#for f in /proc/sys/net/ipv4/conf/\*/rp_filter; do echo 1 \> \$f done.

\#\$iptables -A LDROP --proto tcp -j LOG --log-level info \\
--log-prefix “TCP Drop”

How to restrict SSH, Telnet, FTP on iptable firewall?

Restrict FTP: iptables -A INPUT -s -p tcp --dport \<21\> -j
REJECT/DROP/DENY

 

How to drop packets using iptables?

\#Iptables -A INPUT -s xx.xx.xx.xx -d xx.xx.xx.xx -j DROP

 

Linux Network Firewall Configuration

**iptables: Linux built-in firewall**

- iptable is the default/built-in firewall in a Linux OS, it allow/block
  traffic on a Linux host.

- Input chain policy

- Output chain policy

**Set default policies/chains**

- iptables -P INPUT DROP

- iptables -P FORWARD DROP

- iptables -P OUTPUT ACCEPT

**Allow loopback traffic**

- iptables -A INPUT -i lo -j ACCEPT

- iptables -A OUTPUT -o lo -j ACCEPT

**Allow incoming SSH traffic**

- iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state
  NEW,ESTABLISHED -j ACCEPT

- iptables -A OUTPUT -o eth0 -p tcp --sport 22 -m state --state
  ESTABLISHED -j ACCEPT

**Allow incoming HTTP traffic**

- iptables -A INPUT -i eth0 -p tcp --dport 80 -m state --state
  NEW,ESTABLISHED -j ACCEPT

- iptables -A OUTPUT -o eth0 -p tcp --sport 80 -m state --state
  ESTABLISHED -j ACCEPT

## File Transfer & Remote Access:

- scp: Securely copies files over SSH.

- rsync: Efficiently copies files, transferring only changes (works over
  SSH).

- ftp/sftp: File transfer protocols (FTP and secure FTP).

- curl: Transfers data with URLs (HTTP, HTTPS, etc.).

## System & Process Management:

- Systemctl: Manages system services.

- Nsenter: Enters a container's namespace (network, etc.).

## System Monitoring & Performance:

- iostat: Reports I/O statistics for disks and partitions.

- vmstat: Reports virtual memory statistics.

 

## Tracert

Absolutely! Here's a breakdown of the traceroute/tracert information,
corrected and organized for clarity:

**Summary of Traceroute/Tracert**

- **Purpose:**

  - Traceroute/tracert is a network diagnostic tool that traces the path
    a packet takes to reach a destination.

  - It identifies the intermediate routers (hops) along the path and
    measures the round-trip time (RTT) to each hop.

  - This helps in troubleshooting network connectivity issues by
    pinpointing where a connection breaks down.

- **How it Works:**

  - The tool sends a series of packets with incrementally increasing
    Time-To-Live (TTL) values.

  - When a router receives a packet with a TTL of 1, it decrements the
    TTL to 0 and discards the packet, sending an ICMP "Time Exceeded"
    message back to the source.

  - This process is repeated with increasing TTL values, revealing each
    hop along the path.

  - The tool records the IP address of each responding router and the
    RTT.

- **Protocol Differences:**

  - **Windows (tracert):** Uses ICMP (Internet Control Message Protocol)
    by default.

  - **Linux/macOS (traceroute):** Uses UDP (User Datagram Protocol) by
    default, but can use ICMP.

- **Key Concept:**

  - Traceroute does not send packets to each hop individually. It sends
    packets to the final destination, manipulating the TTL to trigger
    responses from intermediate routers.

**Commands and Usage**

1.  **Basic Usage:**

    - **Linux/macOS:** traceroute \<destination\> (e.g., traceroute
      google.com)

    - **Windows:** tracert \<destination\> (e.g., tracert google.com)

2.  **Protocol Selection (Linux/macOS):**

    - traceroute -I \<destination\> (Use ICMP)

    - traceroute -U \<destination\> (Use UDP)

3.  **Troubleshooting with Traceroute/Tracert:**

    - Identify the point of failure: If traceroute stops at a particular
      hop, that indicates a network problem at or after that hop.

    - Determine network latency: High RTT values indicate network
      congestion or slow connections.

    - By viewing the returned ip addresses, you can determine if a
      packet is routing through unexpected locations.

4.  **iptables (Linux Firewall) Backup and Restore:**

    - **Backup:** iptables-save \> /tmp/iptables.out

    - **Restore:** iptables-restore \< /tmp/iptables.out

**Addressing the Interview Questions**

- **"How does Traceroute work and what protocol does it use?"**

  - Emphasize the TTL manipulation and the difference in default
    protocols between Windows and Linux/macOS.

- **OSI Model Exploration:**

  - A deep dive into the OSI model would involve explaining how
    traceroute interacts at each layer:

    - **Layer 1 (Physical):** Cables, network interface cards (NICs).

    - **Layer 2 (Data Link):** Ethernet frames, MAC addresses.

    - **Layer 3 (Network):** IP addresses, TTL, routing.

    - **Layer 4 (Transport):** UDP or ICMP.

    - **Layers 5-7 (Session, Presentation, Application):** Less directly
      involved, but DNS resolution (application layer) is crucial for
      translating domain names to IP addresses.

- **"How many packets must leave my NIC to complete a traceroute?"**

  - This requires considering:

    - DNS resolution: Packets for DNS queries.

    - Traceroute packets: Multiple packets with increasing TTL values.

    - Response packets: ICMP "Time Exceeded" or destination responses.

    - The number of hops to the destination.

    - The amount of queries that the traceroute application sends per
      hop. Usually 3.

  - Round-trip times for each packet must also be factored in.

- **"How would traceroute help you find out where a breakdown in
  communication is?"**

  - Explain how the tool identifies the last responding hop, indicating
    the location of the network issue.

- **"How exactly does traceroute/tracert work at the protocol level?"**

  - Reinforce the concept of TTL manipulation and the protocol
    differences.

This is a great start to a guide on essential networking commands in
RHEL! Here's a reorganized and refined version, focusing on clarity and
removing redundancies:

**RHEL Networking Commands**

**I. Core Network Connectivity**

- **ping:**

  - Tests if a host is reachable on the network.

  - Measures round-trip time for packets.

  - Helps diagnose network connectivity issues.

  - ping \<hostname or IP address\>

  - Useful options: -t (continuous ping), -a (resolve hostname), -c
    \<count\> (number of pings)

  - Example: ping -c 4 google.com (ping Google 4 times)

- **traceroute/tracert:**

  - Traces the route packets take to reach a destination.

  - Identifies network bottlenecks or points of failure.

  - traceroute \<hostname or IP address\> (RHEL/macOS)

  - tracert \<hostname or IP address\> (Windows)

  - Example: traceroute 8.8.8.8 (trace route to Google's DNS server)

**II. Network Interface Configuration**

- **ipconfig:** (Windows)

  - Displays network interface configuration details (IP address, subnet
    mask, default gateway).

  - ipconfig

  - Useful options: /all (show all details), /renew (get new IP
    address), /release (release IP address)

  - Example: ipconfig /all

- **ifconfig:** (RHEL/macOS)

  - Similar to ipconfig, displays and configures network interfaces.

  - ifconfig

  - Example: ifconfig eth0 (show details for Ethernet interface 'eth0')

**III. Name Resolution**

- **nslookup:**

  - Queries DNS servers to resolve hostnames to IP addresses or vice
    versa.

  - nslookup \<hostname or IP address\>

  - Useful options: -querytype=mx (find mail servers), -querytype=ns
    (find name servers)

  - Example: nslookup google.com

- **dig:** (RHEL/macOS) - More advanced DNS lookup tool

  - Provides detailed DNS information.

  - dig \<hostname or IP address\>

  - Example: dig google.com ANY (get all DNS records for google.com)

**IV. Network Connections and Statistics**

- **netstat:**

  - Displays active network connections, listening ports, and network
    statistics.

  - netstat

  - Useful options: -a (all connections), -n (numeric addresses and
    ports), -t (TCP connections), -u (UDP connections), -p (show process
    ID)

  - Example: netstat -anpt (show all TCP connections with process IDs)

  - Example: netstat -s (display network statistics)

- **ss:** (RHEL/macOS) - Modern replacement for netstat

  - Provides similar functionality to netstat with more options and
    better performance.

  - ss

  - Example: ss -tulpn (show listening TCP and UDP sockets)

**V. Domain Registration**

- **whois:**

  - Retrieves registration information for a domain name.

  - whois \<domain name\>

  - Example: whois google.com

**VI. VPN**

- **WireGuard:**

  - A modern, fast, and secure VPN protocol.

  - Requires installation and configuration.

  - Refer to WireGuard documentation for specific commands.

**Important Notes:**

- **RHEL/macOS vs. Windows:** Some commands (like ifconfig and ss) are
  specific to RHEL/macOS systems, while others (like ipconfig) are for
  Windows. Be mindful of the operating system you're using.

- **Command Options:** Most commands have various options to customize
  their output. Use the -help or man \<command\> option (e.g., netstat
  -help or man netstat) to explore available options.

- **Security:** Pay attention to open ports and unexpected connections
  reported by netstat or ss. These could indicate security issues.

- **Troubleshooting:** These commands are valuable tools for diagnosing
  network problems. Use them systematically to identify the source of
  issues.

**Lab Exercises:**

- **Lab 1.1 (Ping):** ping -t www.example.com, ping -a 127.0.0.1

- **Lab 1.2 (ipconfig/ifconfig):** ipconfig /all (Windows), ifconfig
  (RHEL/macOS)

- **Lab 1.3 (nslookup):** nslookup, nslookup www.example.com, nslookup
  -querytype=mx www.example.com

- **Lab 1.4 (traceroute/tracert):** tracert 8.8.8.8 (Windows),
  traceroute 8.8.8.8 (RHEL/macOS)

- **Lab 1.5 (netstat):** netstat -help, netstat -an -p TCP, netstat -sp
  TCP

This revised version provides a more concise and organized guide to RHEL
networking commands, making it easier to understand and use for both
beginners and experienced users.

## SSL/TLS

SSL encryption wrapper between remote clients and local or remote
servers. It listens on the port specified in its configuration file,
encrypts the communication with the client, and forwards the data to the
original daemon listening on its usual port. Add TLS functionality to
commonly used Inetd daemons like POP-2, POP-3, and IMAP servers, to
standalone daemons like NNTP, SMTP and HTTP, and in tunnelling PPP over
network sockets without changes to the source code: **stunnel**

Opensource implementation of SSL and TLS protocols, implement basic
cryptographic functions: **openssl**

 

## How to make Linux machine to Router?

- This is called “IP Masquerade”. It is networking function in Linux
  like 1:N NAT servers.

- Linux machine should have Internet connection and connected to LAN.

- Normally Linux machine has 2 network interfaces: 1) Ethernet for
  LAN 2) Dialup PPP connection to Internet

- All other machines on network use Linux machine as default gateway for
  TCP/IP networking

- Enable IP forwarding on it.

**Yes, a Linux computer can be made a router.** This process is known as
**IP Masquerading**. It allows multiple devices on a local network (LAN)
to share a single internet connection.

**How to set up IP Masquerading:**

1.  **Configure Network Interfaces:** The Linux machine needs two
    network interfaces: one for the LAN and one for the internet
    connection.

2.  **Set Default Gateway:** All devices on the LAN should use the Linux
    machine as their default gateway.

3.  **Use Shared DNS:** Ensure all devices use the same DNS servers
    provided by the internet service provider (ISP).

4.  **Enable IP Forwarding:** Turn on IP forwarding in the Linux kernel.
    This allows packets to be routed between networks.

5.  **Configure IPTables:** Use IPTables, a firewall program, to set up
    rules that allow the Linux machine to masquerade IP addresses for
    the LAN devices.

By following these steps, you can transform your Linux computer into a
router, enabling multiple devices to share a single internet connection.

## Linux iptable Firewall

\#Simple iptables policy that allows all traffic on the loopback
interface and blocks all incoming traffic on all other interfaces except
for SSH (port 22) and HTTP (port 80) traffic

\# Set default policies

iptables -P INPUT DROP

iptables -P FORWARD DROP

iptables -P OUTPUT ACCEPT

\# Allow loopback traffic

iptables -A INPUT -i lo -j ACCEPT

iptables -A OUTPUT -o lo -j ACCEPT

\# Allow incoming SSH traffic

iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state
NEW,ESTABLISHED -j ACCEPT

iptables -A OUTPUT -o eth0 -p tcp --sport 22 -m state --state
ESTABLISHED -j ACCEPT

\# Allow incoming HTTP traffic

iptables -A INPUT -i eth0 -p tcp --dport 80 -m state --state
NEW,ESTABLISHED -j ACCEPT

iptables -A OUTPUT -o eth0 -p tcp --sport 80 -m state --state
ESTABLISHED -j ACCEPT

# Blog

Are these computers even connected?

How do you know if a remote host is alive or not?

How to configure Active Directory DHCP server on Linux?

How to configure Active Directory FTP server on Linux?

How to configure Network firewall in Linux?

How to configure Network security controls in Linux?

How to configure open-source DHCP server on Linux?

How to configure open-source FTP server on Linux?

How to configure OpenSSL on Linux?

How to configure Proxy on Linux?

How to harden Network security in Linux?

List of network configuration files in Linux
