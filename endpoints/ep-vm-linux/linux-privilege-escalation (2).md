Privilege escalation in linux

## Linux privilege escalation techniques

These are the most common techniques in Linux environment for Privilege Escalation:

- Kernel exploits

- Programs running as root

- Installed software

- Weak/reused/plaintext passwords

- Inside service

- Suid misconfiguration

- Abusing sudo-rights

- World writable scripts invoked by root

- Bad path configuration

- Cronjobs

- Unmounted filesystems

**Kernel exploits**

- In kernel exploits we are going to Dirty Cow exploit

- Dirty Cow exploit leverages a race condition vulnerability to force the Linux kernel to write arbitrary data to restricted system files, it was initially obtained through an HTTP packet capture.

- Race condition vulnerability exist because of flaw in the way the Linux kernels memory subsystem handles Copy-On-Write (COW) function of private read only memory mappings. (CVE-2017-6074 )

- The following example will demonstrate how Dirty COW can be used by attackers to replace the

- ‘root’ user with a new user ‘rash’ by editing the /etc/passwd file.

- A use-after-free flaw was found in the way the Linux kernel's Datagram Congestion Control Protocol (DCCP) implementation freed SKB (socket buffer) resources for a DCCP_PKT_REQUEST packet when the IPV6_RECVPKTINFO option is set on the socket. A local, unprivileged user could use this flaw to alter the kernel memory, allowing them to escalate their privileges on the system.

**Installed software**

- In this technique need to find if the user has installed some third-party software that might be vulnerable?

- Check with these commands below and if you find anything just google it for exploits

- \# Common locations for user installed software

  - /usr/local/

  - /usr/local/src

  - /usr/local/bin

  - /opt/

  - /home

  - /var/

  - /usr/src/

- \# Debian: dpkg -l

- \# CentOS, OpenSuse, Fedora, RHEL: rpm -qa (CentOS / openSUSE )

- \# OpenBSD, FreeBSD: pkg_info

**Weak/reused/plaintext passwords**

-  

<!-- -->

- Check file where webserver connect to database (config.php or similar)

- Check databases for admin passwords that might be reused

- Check weak passwords:

  - username:username

  - username:username1

  - username:root

  - username:admin

  - username:qwerty

  - username:password

<!-- -->

- Check plaintext password

  - \# Anything interesting the mail?

  - /var/spool/mail

  - ./LinEnum.sh -t -k password

- Check the netstat and compare it with the nmap-scan you did from the outside. Do you find more services available from the inside?

  - netstat -anlp

  - netstat -ano

## Linux privilege escalation techniques

These are the most common techniques in Linux environment for Privilege Escalation:

- Kernel exploits

- Programs running as root

- Installed software

- Weak/reused/plaintext passwords

- Inside service

- Suid misconfiguration

- Abusing sudo-rights

- World writable scripts invoked by root

- Bad path configuration

- Cronjobs

- Unmounted filesystems

**Kernel exploits**

- In kernel exploits we are going to Dirty Cow exploit

- Dirty Cow exploit leverages a race condition vulnerability to force the Linux kernel to write arbitrary data to restricted system files, it was initially obtained through an HTTP packet capture.

- Race condition vulnerability exist because of flaw in the way the Linux kernels memory subsystem handles Copy-On-Write (COW) function of private read only memory mappings. (CVE-2017-6074 )

- The following example will demonstrate how Dirty COW can be used by attackers to replace the

- ‘root’ user with a new user ‘rash’ by editing the /etc/passwd file.

- A use-after-free flaw was found in the way the Linux kernel's Datagram Congestion Control Protocol (DCCP) implementation freed SKB (socket buffer) resources for a DCCP_PKT_REQUEST packet when the IPV6_RECVPKTINFO option is set on the socket. A local, unprivileged user could use this flaw to alter the kernel memory, allowing them to escalate their privileges on the system.

**Installed software**

- In this technique need to find if the user has installed some third-party software that might be vulnerable?

- Check with these commands below and if you find anything just google it for exploits

- \# Common locations for user installed software

  - /usr/local/

  - /usr/local/src

  - /usr/local/bin

  - /opt/

  - /home

  - /var/

  - /usr/src/

- \# Debian: dpkg -l

- \# CentOS, OpenSuse, Fedora, RHEL: rpm -qa (CentOS / openSUSE )

- \# OpenBSD, FreeBSD: pkg_info

**Weak/reused/plaintext passwords**

-  

<!-- -->

- Check file where webserver connect to database (config.php or similar)

- Check databases for admin passwords that might be reused

- Check weak passwords:

  - username:username

  - username:username1

  - username:root

  - username:admin

  - username:qwerty

  - username:password

<!-- -->

- Check plaintext password

  - \# Anything interesting the mail?

  - /var/spool/mail

  - ./LinEnum.sh -t -k password

- Check the netstat and compare it with the nmap-scan you did from the outside. Do you find more services available from the inside?

  - netstat -anlp

  - netstat -ano

## Privilege Escalation – Lateral Movement

- What is Escalate Privileges?

- Abuse Elevation Control Mechanism

- Bypass User Account Control

- Exploitation for Privilege Escalation

- Hijack Execution Flow

- Escalating Privileges over Missing Patches

- Escalating Privileges with Automated script

<!-- -->

- An attacker can gain access to the network using a non-admin user account, and the next step would be to gain administrative privileges. Attacker performs privilege escalation attack which takes advantage of design flaws, programming errors, bugs, and configuration oversights in the OS and software application to gain administrative access to the network and its associated applications. These privileges allow attackers to view critical/sensitive information, delete files, or install malicious programs such as viruses, Trojans, worms, etc.

- In most Privilege Escalation attacks the hacker first logs in with a normal end-user account then searches for flaws in the system that they can be exploited to elevate their privileges in order to gain access to sensitive data they can steal.

**Privilege Escalation Countermeasures**

- Restrict the interactive logon privileges.

- Use encryption techniques to protect sensitive data.

- Run users and applications on the least privileges.

- Reduce the amount of code that runs with privilege.

- Implement multi-factor authentication and authorization.

- Perform debugging using bounds checkers and stress tests.

- Run services as unprivileged accounts.

- Test operating system and application coding errors and bugs thoroughly.

- Implement a privilege separation methodology to limit the scope of programming errors and bugs.

- Patch the systems regularly.

**Types of Privilege Escalation**

**Vertical Privilege Escalation**

- Refers to gaining higher privileges than the existing. Privilege escalation from user --\> admin:

<!-- -->

- passwd

- vulnerability

- Weak permission: Service, File

- DLL Hijacking

  - **Horizontal privilege escalation**: It occurs when the attacker, having gained access to a normal low access level account, seeks to gain access to other similar low-level access accounts.

  - **Vertical privilege escalation**: It occurs when the attacker attempts to access resources and functions that belong to a user with higher privileges, such as application or site administrators

**Horizontal Privilege Escalation**

- Refers to acquiring the same level of privileges that already has been granted but assuming the identity of another user with the similar privileges. Privilege escalation from Admin -\> Others/System:

<!-- -->

- PtH

- Install Service (sc)

- (Access) Token Kidnapping

- Process Hijacking (RunFromProcess)

**Privilege Escalation Techniques**

**DLL Hijacking**

- Most Windows applications do not use the fully qualified path when loading an external DLL library instead they search for the directory from which they have been loaded first. If attackers can place a malicious DLL in the application directory, it will be executed in place of the real DLL.

**Resetting Passwords Using Windows CMD**

- If an attacker succeeds in gaining administrative privileges, he/she can reset the passwords of any other non-administrative accounts using command prompt. Open the command prompt, type "net user" command and press Enter to list out all the user accounts on the target system. Now type "net user useraccountname \*" and press Enter, "useraccountname" is account name from list. Type the new password to reset the password for a specific account.

**Privilege Escalation Tool**

**Active@ Password Changer**

- Active@ Password Changer resets local administrator and user passwords.
