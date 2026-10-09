# Privilege Escalation

An attacker can gain access to the network using a non-admin user account, and the next step would be to gain administrative privileges. Attacker performs privilege escalation attack which takes advantage of design flaws, programming errors, bugs, and configuration oversights in the OS and software application to gain administrative access to the network and its associated applications. These privileges allow attackers to view critical/sensitive information, delete files, or install malicious programs such as viruses, Trojans, worms, etc.

- An attacker can gain access to the network using a non-admin user account, and the next step would be to gain administrative privileges.

- Attacker performs privilege escalation attack which takes advantage of design flaws, programming errors, bugs, and configuration oversights in the OS and software application to gain administrative access to the network and its associated applications.

- These privileges allow attackers to view critical/sensitive information, delete files, or install malicious programs such as viruses, Trojans, worms, etc.

Privilege escalation is the act of gaining higher-level access to a system than one currently possesses. It's a serious security vulnerability.

Here is a summarized and corrected list of common privilege escalation techniques mentioned:

- **Abusing Resource-Based Constrained Delegation:** This exploits misconfigurations in Active Directory's msDSAllowedToActOnBehalfOfOtherIdentity attribute, allowing an attacker to impersonate other users and gain elevated privileges. This is often associated with techniques like NoPAC.

- **Bypassing User Account Control (UAC):** UAC is a security feature in Windows designed to limit the impact of malicious software. Bypassing it allows programs to run with administrative privileges without user consent.

- **Enumerating and Abusing Special Privileges:** This involves identifying users or services with elevated permissions (e.g., membership in privileged groups) and then exploiting those privileges to gain further access.

- **Exploiting Missing Patches:** Unpatched vulnerabilities in software can be exploited to gain unauthorized access, including privilege escalation.

- **Escalating Privileges with Automated Scripts:** Attackers often use scripts to automate the process of exploiting vulnerabilities and escalating privileges.

- **Hijacking Execution Flow:** This involves manipulating the way a program executes, often by injecting malicious code, to gain control and escalate privileges.

- **Zero-Day Attack Exploitation:** This refers to exploiting vulnerabilities that are unknown to the software vendor and for which no patch exists. Examples include NoPAC, SAM-Account Spoofing, and PetitPotam NTLM Relay attacks against Active Directory Certificate Services (AD CS).

- **General Learning/Understanding:** The prompt also mentions the importance of learning about local privilege escalation on domain-connected computers and understanding the concept of privilege escalation in general.

 Linux privilege escalation involves an attacker gaining higher-level access than their initial account allows. It often starts with a low-privilege account and exploits system vulnerabilities. There are two main types:

- **Horizontal:** Gaining access to other accounts with similar low-level privileges.

- **Vertical:** Gaining access to a higher-privileged account (e.g., root/administrator).

Common Linux privilege escalation techniques include:

1.  **Kernel Exploits:** Exploiting vulnerabilities in the Linux kernel.

2.  **Programs Running as Root:** Abusing programs that run with root privileges.

3.  **Installed Software:** Exploiting vulnerabilities in installed applications.

4.  **Weak/Reused/Plaintext Passwords:** Cracking or finding weak passwords.

5.  **Service Exploits:** Exploiting vulnerabilities in system services.

6.  **SUID Misconfiguration:** Abusing incorrectly configured SUID (Set User ID) permissions.

7.  **Sudo Abuse:** Exploiting misconfigurations or weaknesses in sudo rules.

8.  **World-Writable Scripts Invoked by Root:** Modifying scripts that root executes.

9.  **Incorrect Path Configuration:** Manipulating the PATH environment variable to run malicious commands as root.

10. **Cron Jobs:** Exploiting vulnerabilities in cron jobs (scheduled tasks).

11. **Unmounted Filesystems:** Manipulating unmounted filesystems.

The shorter list provided ("Writable Script, Crontab, Kernel, Path Variable, Automated Script") is a subset of these common techniques, and "Automated Script" is too broad. It's better to be specific (e.g., "World-Writable Scripts Invoked by Root" instead of just "Writable Script"). "Crontab" refers to exploiting cron jobs, "Kernel" refers to kernel exploits, and "Path Variable" refers to incorrect path configuration. So, the shorter list is related but less comprehensive.

## Introduction & Lab Setup

- Types of Privilege Escalation

- ACL Permissions

- Mitre ID T1547

## Exploiting Scheduled Tasks

- Task Scheduler

- Misconfigured Scheduled Task/Job

- Abusing Scheduled Task/Job

- Detection & Mitigation

## Weak Services/Permissions

- Insecure Service Properties

- Unquoted Service Path

- Weak Registry Permissions

- Insecure Service Executables

- Insecure GUI Apps

## Kernel Exploits

- What is kernel

- Compiling exploit code

- Enumerating missing patches

- Kernel exploit hunting

## Logon Autostart Execution

- Run Registry key

- Always Install Elevated

- Startup Folder

## Passwords Hunting

- Registry

- Brute force

- Credential Manager (run as)

- Configuration File

Bypass ACL/UAC

- SeBackupPrivilege

- SeRestorePrivilege

- Token Impersonation (Hot/Rotten/Juicy Potato/Printspoofer)

- Hive Nightmare

## Privilege Escalation 

What is Escalate Privileges?

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

# Privilege Escalation

An attacker can gain access to the network using a non-admin user account, and the next step would be to gain administrative privileges. Attacker performs privilege escalation attack which takes advantage of design flaws, programming errors, bugs, and configuration oversights in the OS and software application to gain administrative access to the network and its associated applications. These privileges allow attackers to view critical/sensitive information, delete files, or install malicious programs such as viruses, Trojans, worms, etc.

- An attacker can gain access to the network using a non-admin user account, and the next step would be to gain administrative privileges.

- Attacker performs privilege escalation attack which takes advantage of design flaws, programming errors, bugs, and configuration oversights in the OS and software application to gain administrative access to the network and its associated applications.

- These privileges allow attackers to view critical/sensitive information, delete files, or install malicious programs such as viruses, Trojans, worms, etc.

Privilege escalation is the act of gaining higher-level access to a system than one currently possesses. It's a serious security vulnerability.

Here is a summarized and corrected list of common privilege escalation techniques mentioned:

- **Abusing Resource-Based Constrained Delegation:** This exploits misconfigurations in Active Directory's msDSAllowedToActOnBehalfOfOtherIdentity attribute, allowing an attacker to impersonate other users and gain elevated privileges. This is often associated with techniques like NoPAC.

- **Bypassing User Account Control (UAC):** UAC is a security feature in Windows designed to limit the impact of malicious software. Bypassing it allows programs to run with administrative privileges without user consent.

- **Enumerating and Abusing Special Privileges:** This involves identifying users or services with elevated permissions (e.g., membership in privileged groups) and then exploiting those privileges to gain further access.

- **Exploiting Missing Patches:** Unpatched vulnerabilities in software can be exploited to gain unauthorized access, including privilege escalation.

- **Escalating Privileges with Automated Scripts:** Attackers often use scripts to automate the process of exploiting vulnerabilities and escalating privileges.

- **Hijacking Execution Flow:** This involves manipulating the way a program executes, often by injecting malicious code, to gain control and escalate privileges.

- **Zero-Day Attack Exploitation:** This refers to exploiting vulnerabilities that are unknown to the software vendor and for which no patch exists. Examples include NoPAC, SAM-Account Spoofing, and PetitPotam NTLM Relay attacks against Active Directory Certificate Services (AD CS).

- **General Learning/Understanding:** The prompt also mentions the importance of learning about local privilege escalation on domain-connected computers and understanding the concept of privilege escalation in general.

 Linux privilege escalation involves an attacker gaining higher-level access than their initial account allows. It often starts with a low-privilege account and exploits system vulnerabilities. There are two main types:

- **Horizontal:** Gaining access to other accounts with similar low-level privileges.

- **Vertical:** Gaining access to a higher-privileged account (e.g., root/administrator).

Common Linux privilege escalation techniques include:

12. **Kernel Exploits:** Exploiting vulnerabilities in the Linux kernel.

13. **Programs Running as Root:** Abusing programs that run with root privileges.

14. **Installed Software:** Exploiting vulnerabilities in installed applications.

15. **Weak/Reused/Plaintext Passwords:** Cracking or finding weak passwords.

16. **Service Exploits:** Exploiting vulnerabilities in system services.

17. **SUID Misconfiguration:** Abusing incorrectly configured SUID (Set User ID) permissions.

18. **Sudo Abuse:** Exploiting misconfigurations or weaknesses in sudo rules.

19. **World-Writable Scripts Invoked by Root:** Modifying scripts that root executes.

20. **Incorrect Path Configuration:** Manipulating the PATH environment variable to run malicious commands as root.

21. **Cron Jobs:** Exploiting vulnerabilities in cron jobs (scheduled tasks).

22. **Unmounted Filesystems:** Manipulating unmounted filesystems.

The shorter list provided ("Writable Script, Crontab, Kernel, Path Variable, Automated Script") is a subset of these common techniques, and "Automated Script" is too broad. It's better to be specific (e.g., "World-Writable Scripts Invoked by Root" instead of just "Writable Script"). "Crontab" refers to exploiting cron jobs, "Kernel" refers to kernel exploits, and "Path Variable" refers to incorrect path configuration. So, the shorter list is related but less comprehensive.

## Introduction & Lab Setup

- Types of Privilege Escalation

- ACL Permissions

- Mitre ID T1547

## Exploiting Scheduled Tasks

- Task Scheduler

- Misconfigured Scheduled Task/Job

- Abusing Scheduled Task/Job

- Detection & Mitigation

## Weak Services/Permissions

- Insecure Service Properties

- Unquoted Service Path

- Weak Registry Permissions

- Insecure Service Executables

- Insecure GUI Apps

## Kernel Exploits

- What is kernel

- Compiling exploit code

- Enumerating missing patches

- Kernel exploit hunting

## Logon Autostart Execution

- Run Registry key

- Always Install Elevated

- Startup Folder

## Passwords Hunting

- Registry

- Brute force

- Credential Manager (run as)

- Configuration File

## Bypass ACL/UAC

- SeBackupPrivilege

- SeRestorePrivilege

- Token Impersonation (Hot/Rotten/Juicy Potato/Printspoofer)

- Hive Nightmare
