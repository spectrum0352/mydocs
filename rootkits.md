# Rootkits

**Rootkits: A Stealthy Threat**

**Rootkits** are malicious software that hide their presence and provide privileged access to a computer system. Detecting them is challenging due to their ability to conceal themselves.

Rootkits are malicious software designed to gain unauthorized access to a computer system and conceal its presence. They operate by replacing or modifying critical system components, such as the operating system kernel, device drivers, or boot loader. This allows attackers to maintain persistent control over the infected system, often undetected.

- Detection and removal can be difficult, requiring specialized tools and techniques.

- Rootkits are designed to be stealthy and persistent.

- Rootkits are malicious software designed for unauthorized, persistent system access.

- Rootkits enable data theft, backdoor access, and system compromise.

- Rootkits modify system files, processes, and sometimes bootloaders.

- Strong security practices, including regular updates and security software, can help mitigate the risk of rootkit infections.

- Their primary function is to hide themselves and their malicious actions.

- They conceal their presence and activities from security tools.

- They often replace legitimate system components with malicious versions.

- They often target critical system components, such as the boot loader and kernel.

**Key Characteristics**

- **Stealth:** Rootkits are designed to remain undetected by traditional security measures.

- **Persistence:** They often employ techniques to ensure their continued presence on the system, even after reboots or system reinstalls.

- **Control:** They aim to gain and maintain control over the compromised system, allowing attackers to perform various malicious activities.

**Rootkits are malicious software designed to:**

- **Conceal their presence on a system:** This makes them difficult to detect and remove.

- **Gain unauthorized access and control:** They often compromise system security by allowing attackers to maintain persistent access and carry out malicious activities undetected.

- **Achieve this by modifying system files and processes:** This allows them to replace legitimate system components with modified versions that enable their hidden operation.

Tips

- **Focus on unauthorized access:** The core purpose is to gain and maintain control, not merely to "gather data" in all cases.

- **Emphasis on concealment:** Hiding malicious activities is paramount for rootkits to remain undetected.

- **Broader scope:** Rootkits serve as a platform for various malicious activities beyond simple data gathering.

## Purpose

Rootkits are designed to:

- **Gain and maintain persistent unauthorized access to a system:** This often involves elevating privileges (like gaining root access) and establishing remote backdoors for ongoing control.

- **Conceal their presence and malicious activities:** This includes hiding malicious files, processes, and network traffic to evade detection by security tools.

- **Facilitate further compromise:** This can involve gathering sensitive data (like credentials, network traffic), storing and distributing other malware, and acting as a command-and-control server for a botnet.

## Components

Typical components of a rootkit include:

- **Backdoors:** Allow remote access to the system.

- **DDoS Tools:** Enable Distributed Denial of Service attacks.

- **Packet Sniffers:** Intercept and analyze network traffic.

- **Log Wiping Utilities:** Delete system logs to cover tracks.

- **IRC Bots:** Automate tasks and facilitate communication with other compromised systems.

These capabilities enable attackers to steal sensitive data, launch further attacks, and maintain persistent access to the system.

## Techniques

- **Backdoor Installation:** Creating hidden access points to the system.

- **File and Process Hiding:** Disguising or removing malicious files and processes from system directories and process lists.

<!-- -->

- **File system modification:** Hiding or modifying system files.

- **Hooking system calls:** Intercepting and modifying system calls.

- **Kernel module modification:** Altering kernel modules to hide malicious activity.

<!-- -->

- **Log Modification:** Altering system logs to remove evidence of intrusion.

- **Network Traffic Manipulation:** Intercepting and modifying network traffic to conceal malicious activity.

<!-- -->

- **Process injection:** Injecting malicious code into legitimate processes.

## Types

Rootkits are malicious software designed to hide their presence and activities on a compromised system. They employ various techniques to gain and maintain control, ranging from modifying system files and processes to manipulating hardware and firmware.

User-Mode:

- Target user-level applications and libraries.

- Modify system programs to hide malicious activities.

- Relatively easier to write and install, but also easier to detect.

Library-Level:

- Modify system libraries to intercept system calls and hide malicious activity.

Application-Level:

- Modify existing applications or replace them with malicious versions.

- Often used for stealing data or launching attacks.

Kernel-Level:

- Modify the operating system kernel to gain control over system processes.

- Most dangerous type due to their deep system access.

Driver-Level:

- Disguise themselves as legitimate device drivers.

- Gain kernel-level access to intercept system calls and manipulate device drivers.

Bootloader-Level:

- Replace the system's boot loader to gain control early in the boot process.

Bootkits:

- Infect the Master Boot Record (MBR) or Volume Boot Record (VBR) to gain control before the OS loads.

- Highly persistent and difficult to remove.

- **Bootkits:** Infect the core of the operating system (bootloader). Difficult to remove due to their location.

Firmware-Level:

- Infect the device's firmware (BIOS or UEFI).

- Extremely difficult to detect and remove.

Hardware-Level:

- Hidden in hardware components or firmware.

- Extremely challenging to detect and remove.

Hypervisor-Level:

- Modify the system's boot process to load the OS as a virtual machine.

- Replace the system's hypervisor with a malicious one.

- Extremely powerful and difficult to detect.

| Property | User-space rootkits | Kernel-space rootkits |
|----|----|----|
| Functionality | Replaces existing system programs to intercept system calls and hide malicious activity. | Modifies the system's kernel, the core component of the operating system. |
| Detection | Easier to detect as they modify files in user space. | More difficult to detect as they operate at a lower level. |
| Techniques | File hiding, process hiding, connection hiding, log hiding, and login hiding. | Modifying the system call table, interrupt descriptor table (IDT), or other kernel structures. |
|  |  |  |

## How to deploy a rootkit? 

Installing it on the public computers or corporate computers through social engineering.

Launching zero-day attack (privilege escalation, buffer overflow, Windows kernel exploitation, etc.)

Scanning for vulnerable computers and servers on the web.

Wrapping it in a special package like games.

## How Rootkits Work?

- **Infection:**

  - **Exploiting vulnerabilities:** Taking advantage of software weaknesses to gain initial access.

  - **Social engineering:** Deceiving users into installing malicious software.

  - **Physical access:** Directly compromising a system through physical means.

- **Persistence:**

  - **Kernel-level rootkits:** Modifying the core of the operating system to remain undetected.

  - **User-mode rootkits:** Manipulating user-level processes and libraries.

  - **Bootkits:** Infecting the boot process to gain control before the operating system loads.

## Countermeasures

By implementing these countermeasures and staying informed about the latest threats, you can significantly reduce the risk of rootkit infections and protect your systems.

### Prevention

Rootkit prevention relies on a multi-layered approach encompassing strong security practices, technical measures, and user education.

**Core Principles:**

- **Principle of Least Privilege:** Grant users only the minimum necessary access rights. This limits the damage a compromised account can inflict.

- **Defense in Depth:** Implement multiple layers of security (firewalls, intrusion detection, antivirus, etc.) so that if one fails, others remain.

**Technical Measures:**

- **Software Updates and Patching:** Keep operating systems, applications, and security software (antivirus, anti-malware) up-to-date with the latest patches. This is crucial for fixing known vulnerabilities.

- **Strong Passwords and Multi-Factor Authentication (MFA):** Use complex passwords and enable MFA whenever possible to protect accounts.

- **Firewalls:** Implement both network and host-based firewalls to control network traffic.

- **Antivirus and Anti-Malware Software:** Use reputable security software with rootkit detection capabilities. Keep these updated.

- **Intrusion Detection/Prevention Systems (IDS/IPS):** These systems monitor network and system activity for malicious behaviour.

- **System Hardening:** Disable unnecessary services and applications, configure secure settings, and restrict user privileges.

- **System Integrity Monitoring:** Use tools (e.g., Tripwire) to detect unauthorized changes to system files. Regularly verify file integrity.

- **Kernel Protection:** Implement kernel protection mechanisms to prevent rootkits from modifying critical system components.

- **Rootkit Detection and Removal Tools:** Utilize specialized tools (e.g., GMER, UnHackMe) to scan for and remove rootkits.

- **Kernel Memory Dump Analysis:** In advanced cases, analyze kernel memory dumps to identify rootkit activity.

- **Alternate Data Stream (ADS) Awareness:** Be aware of ADS and use tools like StreamArmor to detect and remove malicious ADS usage.

- **Regular System Backups:** Create regular backups of important data to facilitate recovery in case of infection. Store backups offline or in a secure location.

- **Trusted Restoration Media:** Ensure you have access to trusted installation media for your operating system and applications. This is critical for recovery.

**User Education and Awareness:**

- **Phishing Awareness:** Train users to recognize and avoid phishing emails, suspicious links, and attachments.

- **Safe Downloading Practices:** Educate users to download software and files only from trusted sources. Emphasize caution with unknown websites and files.

- **General Security Awareness:** Promote a security-conscious culture by educating users about best practices, including password security, avoiding suspicious activities, and reporting potential issues.

**Incident Response:**

- **Incident Response Plan:** Have a well-defined incident response plan in place to handle rootkit infections. This plan should include procedures for containment, eradication, recovery, and post-incident analysis.

Anti-Rootkits Tools

- **Stinger**: Stinger scans rootkits, running processes, loaded modules, registry and directory locations known to be used by malware on the machine.

- **UnHackMe**: UnHackMe detects and removes malicious programs (rootkits/malware/adware/spyware/Trojans)

- **GMER**: GMER is an application that detects and removes rootkits.

 

### Detection 

Rootkit detection is challenging due to their stealthy nature.

**Detection Methods**

- **Manual File Comparison:**

  - Compare file lists of the potentially infected system with a clean system using dir /s /b /ah and dir /s /b /a-h commands.

  - Use WinDiff to identify discrepancies, indicating potential hidden files.

- **Limitations:**

  - This method might produce false positives.

  - It cannot detect rootkits hiding in BIOS, disk sectors, or other advanced locations.

A multi-layered approach is required, combining various techniques:

**Detection Techniques:**

- **Anti-Rootkit Tools:** Specialized software like St. Michael, Stinger, UnHackMe, GMER, chkrootkit, and Rootkit Hunter can identify known rootkit signatures and behaviours.

- **Behavioural/Heuristic Analysis:** Monitors system activity for anomalies and suspicious patterns, including deviations from normal system calls and execution paths. Tools like PatchFinder can assist in analysing system call patterns.

- **Cross-View Detection:** Compares system information gathered through different methods (e.g., direct access vs. API calls) to reveal inconsistencies that might indicate a rootkit's presence.

- **File Integrity Checks/System Integrity Monitoring:** Compares critical system files and configurations to a known good baseline using tools like Tripwire and AIDE. This helps detect unauthorized modifications. Analysing file system snapshots (before and after potential infection) can also reveal hidden or modified files.

- **Kernel Debugging/Memory Analysis:** Inspects the kernel and kernel memory for malicious modifications, hidden processes, or altered system structures. Kernel memory dumps can be performed for in-depth analysis.

- **Manual Analysis:** Involves detailed examination of system logs, configuration files, and network traffic. Tools like WinDiff can be used to compare file system snapshots.

- **Network Traffic Analysis:** Monitors network activity for suspicious patterns, such as unusual outbound connections or data exfiltration.

- **Offline Analysis:** Performs forensic analysis on isolated systems to identify rootkits that might evade detection in a live environment.

- **Runtime Execution Path Profiling:** Compares runtime execution paths of processes and executables before and after suspected infection to detect deviations.

- **Signature-Based Detection:** Scans for known rootkit signatures and fingerprints.

**General Security Practices (Supporting Detection and Prevention):**

- **Regular System Scans:** Using antivirus and anti-malware software.

- **Regular System Updates:** Keeping operating systems and software patched.

- **Strong Security Practices:** Employing strong passwords, firewalls, and antivirus software.

- **User Education:** Training users about the risks of malicious software and security best practices.

**Key Improvements in this Summary:**

- **Consolidated Redundancies:** Removed repetitive entries and combined similar concepts.

- **Organized Structure:** Grouped techniques into logical categories for better readability.

- **Concise Language:** Used more concise phrasing while retaining key information.

- **Clarified Concepts:** Explained some of the more technical terms in simpler language.

- **Emphasis on Multi-Layered Approach:** Highlighted the importance of combining multiple techniques for effective rootkit detection.

- **Included Supporting Practices:** Added general security practices that complement detection efforts.

Rootkits Behaviour

- **Hiding Malicious Activity:** Conceals processes, files, and network connections.

- **Gaining Unauthorized Access:** Provides backdoors for remote access.

- **Cleaning Logs:** Removes evidence of intrusion.

Detection Challenges:

Detecting rootkits can be challenging due to their stealthy nature. Traditional antivirus software may not be sufficient. Advanced techniques like:

**Note:** While manual techniques like file system comparison can be helpful, advanced rootkits may evade detection. It's essential to rely on specialized security tools and expert analysis to effectively identify and remove rootkits.

Steps for Detecting Rootkits

1.  **Create a System File Baseline:**

    - **Boot into a known-clean environment:** Use a bootable media (like a live Linux distribution or a recovery disk) to access the infected system.

    - **Create a file and directory listing:** Execute commands like dir /s /b /ah and dir /s /b /a-h to obtain a complete list of all files and directories on the system. Save these results for comparison.

2.  **Compare to Baseline:**

    - **Re-boot into the potentially infected system.**

    - **Obtain a current file and directory listing:** Repeat the dir commands as in step 1.

    - **Compare the two sets of results:** Use a file comparison tool (like WinDiff) to identify any discrepancies, such as missing files, new files, or changes in file attributes.

3.  **Investigate Discrepancies:**

    - **Analyze suspicious files:** Carefully examine any files that appear or disappear between the two scans.

    - **Check file hashes:** Compare the hashes (e.g., MD5, SHA-1) of suspicious files to known good hashes to identify potential modifications.

    - **Use anti-malware tools:** Run updated anti-malware scans specifically designed to detect rootkits.

Limitations:

- **File-hiding techniques:** This method may not detect rootkits that employ advanced file-hiding techniques, such as those that reside in hidden sectors, use alternate data streams, or modify system calls.

- **BIOS/Firmware level rootkits:** This method cannot detect rootkits that reside in the BIOS, firmware, or hardware components.

- **False positives:** File system changes due to legitimate software updates or user activity can lead to false positives.

Important Notes:

- **Thorough investigation is crucial:** This method provides a basic starting point for rootkit detection. A thorough investigation, including network traffic analysis and system log examination, is necessary for accurate identification and removal.

- **Expert assistance may be required:** If you suspect a rootkit infection, it is often advisable to seek assistance from a qualified security professional.

 

### Incident Response

**Removal:**

Removing rootkits can be complex and may require specialized knowledge and tools.

In some cases, a complete system reinstallation may be necessary to ensure the removal of all rootkit components.

Consider reinstalling the OS as a last resort.

## Examples 

Avatar

A user-mode rootkit that uses driver infection techniques to bypass security measures.

Avatar is a rootkit that creates a backdoor on infected computers, allowing remote attackers to gain control. It employs a driver infection technique twice for persistence:

- **First:** In the dropper to evade detection by Host Intrusion Prevention Systems (HIPS).

- **Second:** In the rootkit driver itself to ensure survival after system reboots.

This driver infection method is limited by kernel-mode module code signing policies and is only compatible with x86 systems.

Azazel

A user-mode rootkit that relies on the LD_PRELOAD technique to intercept system calls.

Azazel is a user-mode rootkit written in C. It utilizes the LD_PRELOAD technique, originally employed by the Jynx rootkit, to intercept and manipulate system calls. This allows it to hide processes, files, and network activity from standard system utilities.

**Key Points:**

- **User-mode:** Operates within the user space of the operating system, making it less intrusive than kernel-mode rootkits.

- **LD_PRELOAD:** Exploits the LD_PRELOAD environment variable to load a custom library before the target libraries, enabling the rootkit to intercept and modify system calls.

- **Jynx Rootkit:** Based on the techniques pioneered by the Jynx rootkit, which also utilized the LD_PRELOAD method.

**Note:** While user-mode rootkits like Azazel can be effective in hiding certain aspects of their activity, they are generally less persistent and have fewer capabilities than kernel-mode rootkits. Kernel-mode rootkits operate at a lower level of the operating system, giving them more control and making them harder to detect and remove.

Necurs

A versatile rootkit that can be used for various malicious activities, including spam and malware distribution.

Necurs is a malicious backdoor Trojan that grants attackers remote access and control over infected computers. It actively monitors and manipulates network traffic, enabling activities like spamming and the distribution of rogue security software. Furthermore, Necurs facilitates the installation of additional malware, employs techniques to conceal its presence, and can interfere with the operation of security applications.

**Key Points:**

- **Backdoor Access:** This is the core functionality, allowing attackers to take control of the infected machine.

- **Network Manipulation:** Monitoring and filtering network traffic enables various malicious activities, including spam distribution and the spread of other malware.

- **Rogue Software Installation:** This can deceive users and potentially harm their systems.

- **Further Compromise:** The ability to download additional malware, hide itself, and disable security measures significantly increases the threat posed by Necurs.

**Overall:**

The provided summary and corrections are generally accurate and informative. The minor stylistic refinement suggested could enhance the overall clarity.

 

ZeroAccess

**ZeroAccess** is a sophisticated kernel-mode rootkit for Windows. It can operate on both 32-bit and 64-bit systems from a single installer.

A sophisticated kernel-mode rootkit capable of spreading malware and stealing data.

- **Key Features:**

  - **Stealthy Operation:** Employs advanced techniques to hide its presence on the infected system.

  - **Multi-Platform Compatibility:** Functions seamlessly on both 32-bit and 64-bit Windows versions.

  - **Malware Delivery Platform:** Acts as a conduit for delivering and executing other malicious payloads.

  - **Rootkit Functionality:**

    - Hides the infected driver on the disk to evade detection.

    - Enables read/write access to encrypted files.

    - Implements self-defence mechanisms to hinder removal.

  - **Peer-to-Peer Botnet:** Connects to a peer-to-peer botnet to download and execute further malicious instructions.

This summary provides a concise and informative overview of ZeroAccess key characteristics and functionalities.

NTFS Data Stream

ADS allows an attacker to inject malicious code in files on an accessible system and execute them without being detected by the user. ADS is the ability to fork data into existing files without changing or altering their functionality, size, or display to file browsing utilities. NTFS Alternate Data Stream (ADS) is a Windows hidden stream which contains metadata for the file such as attributes, word count, author name, and access and modification time of the files.

 

How to Defend against NTFS Streams

To delete NTFS streams, move the suspected files to the FAT partition.

Use third-party file integrity checkers such as Tripwire to maintain integrity of NTFS partition files.

Use programs such as LADS and ADSSpy to detect streams.

NTFS Stream Detector: StreamArmor - Stream Armor discovers hidden Alternate Data Streams (ADS) and cleans them completely from the system.
