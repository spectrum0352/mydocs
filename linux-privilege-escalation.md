# Linux Privilege Escalation Techniques

> **Disclaimer:** This guide is intended for **authorized security assessments, penetration testing, CTFs, and defensive security training**. Perform these techniques only on systems you own or have explicit permission to test.

---

# Linux Privilege Escalation

Privilege escalation is the process of obtaining higher privileges after gaining initial access to a Linux system. This can occur due to kernel vulnerabilities, insecure configurations, weak permissions, vulnerable software, credential exposure, or misconfigured services.

The techniques described below apply across most Linux distributions, including:

* Ubuntu
* Debian
* Red Hat Enterprise Linux (RHEL)
* CentOS
* Rocky Linux
* AlmaLinux
* Fedora
* SUSE / openSUSE
* Kali Linux
* Arch Linux

---

# Common Linux Privilege Escalation Techniques

## Kernel Exploits

Exploit vulnerabilities within the Linux kernel to obtain root privileges.

Examples:

* Dirty COW (CVE-2016-5195)
* Dirty Pipe (CVE-2022-0847)
* OverlayFS vulnerabilities
* DCCP privilege escalation vulnerabilities
* Use-after-free vulnerabilities
* Race condition vulnerabilities

### Enumeration

```bash
uname -a
uname -r
cat /etc/os-release
hostnamectl
```

Determine:

* Kernel version
* Distribution
* Architecture
* Patch level

Compare the kernel version against known CVEs.

---

### Dirty COW (CVE-2016-5195)

Dirty COW (Copy-On-Write) is one of the most well-known Linux privilege escalation vulnerabilities.

It exploits a race condition in the Linux kernel's implementation of the Copy-On-Write (COW) mechanism, allowing an unprivileged user to overwrite read-only files and potentially gain root privileges.

Affected kernels:

* Linux kernel before **4.8.3**
* Various older Ubuntu, Debian, CentOS, and RHEL releases

Typical impact:

* Overwrite protected files
* Modify `/etc/passwd`
* Replace binaries
* Escalate to root

---

### DCCP Privilege Escalation

A use-after-free vulnerability existed in the Linux kernel's Datagram Congestion Control Protocol (DCCP) implementation.

Improper handling of socket buffers (SKBs) could allow a local unprivileged user to manipulate kernel memory and gain elevated privileges.

---

# Programs Running as Root

Applications running with root privileges may contain vulnerabilities or insecure configurations.

Examples include:

* Backup software
* Monitoring agents
* Antivirus software
* Custom daemons
* Third-party services

Check running processes:

```bash
ps aux
ps -ef
```

Check services:

```bash
systemctl list-units --type=service
service --status-all
```

---

# Installed Software

Third-party software may contain publicly known privilege escalation vulnerabilities.

## Common Installation Locations

```text
/usr/local/
/usr/local/bin/
/usr/local/src/
/opt/
/usr/src/
/var/
/home/
```

## List Installed Packages

### Debian / Ubuntu

```bash
dpkg -l
```

### RHEL / CentOS / Fedora / Rocky / AlmaLinux

```bash
rpm -qa
```

### SUSE

```bash
rpm -qa
```

### FreeBSD

```bash
pkg_info
```

After identifying software versions, compare them against known vulnerabilities and security advisories.

---

# Weak, Reused, or Plaintext Passwords

Credential reuse remains one of the most common privilege escalation methods.

Look for:

* Hardcoded passwords
* Configuration files
* Database credentials
* Backup files
* Scripts
* Environment variables

Examples:

```text
config.php
database.yml
.env
settings.py
wp-config.php
```

Search for passwords:

```bash
grep -Ri password /
grep -Ri passwd /
grep -Ri secret /
```

---

## Check Mailboxes

Administrators sometimes send credentials via email.

```bash
ls /var/spool/mail
cat /var/spool/mail/*
```

---

## Check Configuration Files

Common locations:

```text
/etc/
/opt/
/var/www/
/home/*/
```

---

## Check Running Services

Compare internal services with externally accessible services.

```bash
ss -tulpn
```

or

```bash
netstat -tulpn
```

Internal-only services may expose databases, management interfaces, or administrative applications.

---

# SUID Misconfiguration

Files with the SUID bit execute with the permissions of their owner (typically root).

Locate SUID binaries:

```bash
find / -perm -4000 -type f 2>/dev/null
```

Review:

* Unusual binaries
* Custom applications
* Misconfigured utilities

---

# Abusing Sudo Rights

Improper sudo configurations frequently allow privilege escalation.

Check permissions:

```bash
sudo -l
```

Look for:

* Commands executable without passwords
* Wildcards
* Editors
* Backup tools
* Interpreters
* Package managers
* Custom scripts

---

# World-Writable Files Executed by Root

If root executes scripts writable by normal users, arbitrary commands may run as root.

Locate writable files:

```bash
find / -type f -writable 2>/dev/null
```

Locate writable directories:

```bash
find / -type d -writable 2>/dev/null
```

---

# PATH Environment Variable Misconfiguration

Improper PATH configuration can allow execution of attacker-controlled binaries.

Check:

```bash
echo $PATH
```

Review:

* Writable directories
* Relative paths
* Missing absolute paths in scripts

---

# Cron Jobs

Scheduled tasks executed by root can introduce privilege escalation opportunities.

List cron jobs:

```bash
crontab -l

cat /etc/crontab

ls -la /etc/cron*

systemctl list-timers
```

Check for:

* Writable scripts
* Writable directories
* Relative paths
* Weak file permissions

---

# Mounted and Unmounted Filesystems

Sensitive data or backup files may exist on mounted or unmounted filesystems.

Check:

```bash
mount

cat /etc/fstab

lsblk

df -h
```

Look for:

* Backup partitions
* Old operating system installations
* Writable mount points
* Sensitive configuration files

---

# Writable Directories

Locate writable directories:

```bash
find / -type d -perm -0002 2>/dev/null
```

Review:

* `/tmp`
* `/var/tmp`
* Shared application directories

---

# Writable Root-Owned Files

Locate writable files owned by root:

```bash
find / -user root -writable 2>/dev/null
```

---

# Environment Variables

Sensitive information may be stored in environment variables.

```bash
env

printenv
```

Look for:

* Passwords
* Tokens
* API keys
* Cloud credentials

---

# SSH Keys

Search for SSH keys:

```bash
find / -name "id_rsa*" 2>/dev/null

find / -name "authorized_keys" 2>/dev/null
```

---

# Sensitive Files

Review common files:

```text
/etc/passwd
/etc/shadow
/etc/group
/etc/sudoers
/etc/ssh/
/root/
/home/
```

---

# Container Escape Opportunities

Determine whether the host is running inside a container.

```bash
cat /proc/1/cgroup

hostnamectl

mount
```

Check for:

* Docker socket
* Kubernetes mounts
* Privileged containers

---

# NFS Misconfiguration

Review mounted NFS shares:

```bash
showmount -e

mount
```

Look for:

* `no_root_squash`
* Writable exports
* Sensitive shares

---

# Capabilities

Linux capabilities can provide elevated privileges without SUID.

List capabilities:

```bash
getcap -r / 2>/dev/null
```

---

# Enumeration Tools

Popular Linux privilege escalation enumeration tools:

* LinPEAS
* LinEnum
* Linux Exploit Suggester
* Linux Smart Enumeration (LSE)
* unix-privesc-check
* pspy
* GTFOBins (reference for legitimate binaries that can be abused under certain permissions)

---

# Quick Enumeration Commands

```bash
whoami
id
hostname
uname -a
uname -r
cat /etc/os-release

sudo -l

ps aux

systemctl list-units --type=service

find / -perm -4000 -type f 2>/dev/null

find / -user root -writable 2>/dev/null

find / -type d -perm -0002 2>/dev/null

getcap -r / 2>/dev/null

mount
cat /etc/fstab

lsblk

env

ss -tulpn

crontab -l

cat /etc/crontab

ls -la /etc/cron*

find / -name id_rsa* 2>/dev/null
```

---

# Mitigation

* Keep the operating system and kernel fully patched.
* Remove unnecessary SUID binaries.
* Follow the principle of least privilege.
* Restrict `sudo` permissions to only required commands.
* Audit cron jobs and startup scripts regularly.
* Remove plaintext credentials from configuration files.
* Use strong, unique passwords and multi-factor authentication (MFA).
* Apply secure file permissions and ownership.
* Monitor privilege escalation attempts with endpoint detection and response (EDR) solutions.
* Regularly perform vulnerability scanning and security assessments.
* Implement configuration management and continuous compliance monitoring.

---

# References

* Linux Security Documentation
* MITRE ATT&CK – Privilege Escalation (TA0004)
* GTFOBins
* Linux Exploit Suggester
* LinPEAS Project
* Linux Smart Enumeration (LSE)
* National Vulnerability Database (NVD)
