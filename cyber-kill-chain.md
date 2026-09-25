# Introduction

**Summary of the Cyber Kill Chain (Adversary Perspective):**

The Cyber Kill Chain is a framework used to understand the lifecycle of
a cyberattack. Here's a breakdown of the attacker's perspective:

1.  **Reconnaissance:**

    - Gather information about the target:

      - Email addresses

      - IP addresses

      - Network information

      - Vulnerabilities

      - Social media profiles

      - Press releases

      - Contracts

      - Internet-facing servers

2.  **Weaponization:**

    - Create a malicious payload:

      - Select a delivery method (e.g., email, USB)

      - Choose a backdoor implant

      - Configure command and control infrastructure

      - Embed a unique identifier

3.  **Delivery:**

    - Distribute the payload:

      - Direct attacks on web servers

      - Malicious emails

      - Infected USB drives

      - Social engineering

      - Compromised websites (watering hole attacks)

4.  **Exploitation:**

    - Trigger vulnerabilities:

      - Exploit software, hardware, or human vulnerabilities

      - Use zero-day exploits

      - Induce victims to click malicious links or open attachments

5.  **Installation:**

    - Establish persistence:

      - Install backdoors or implants

      - Create autorun keys

      - Modify system files to hide the malware

6.  **Command and Control (C&C):**

    - Establish communication:

      - Open two-way communication channels using protocols like HTTP,
        DNS, or email

      - Allow remote control of the infected system

7.  **Actions on Objectives:**

    - Execute the attack:

      - Steal credentials

      - Escalate privileges

      - Perform lateral movement

      - Exfiltrate data

      - Destroy or corrupt systems

<img src="media/image1.png" style="width:7.85901in;height:5.55048in" />

The Pre-ATT&CK matrix includes gathering information, planning,
identifying vulnerabilities and testing the planned plan. It is the
process of responding to the actions in the ATT&CK framework in the
organisation’s ATT&CK matrix after the compromise.

<img src="media/image2.png" style="width:7.13575in;height:1.49828in" />

# Cyber Kill Chain

- Cyber Attack is defined as an action by human with intent to violet
  security. It does not matter if attack succeeds. It is still
  considered an attack if it fails.

- An active attack attempts to alter system resources or affect their
  operation, so it compromises the Integrity or Availability. A passive
  attack attempts to learn or make use of information from the system,
  but does not affect system resources, so it compromises
  Confidentiality.

**Cyber Kill Chain Phases:**

| **No** | **Attack Phase** | **Description** |
|----|----|----|
| **1** | Reconnaissance | Researching, identifying and selecting targets using active or passive reconnaissance. |
| **2** | Weaponization | Preparatory activities aimed at setting up the infrastructure required for the attack. |
| **3** | Delivery | Techniques resulting in the transmission of a weaponized object to the targeted environment. |
| **4** | Social Engineering | Techniques aimed at the manipulation of people to perform unsafe actions. |
| **5** | Exploitation | Techniques to exploit vulnerabilities in systems that may, amongst others, result in code execution. |
| **6** | Persistence | Any access, action or change to a system that gives an attacker persistent presence on the system. |
| **7** | Defense Evasion | Techniques an attacker may specifically use for evading detection or avoiding other defenses |
| **8** | Command & Control | Techniques that allow attackers to communicate with controlled systems within a target network. |
| **9** | Pivoting | Tunnelling traffic through a controlled system to other systems that are not directly accessible. |
| **10** | Discovery | Techniques that allow an attacker to gain knowledge about a system and its network environment |
| **11** | Privilege Escalation | The result of techniques that provide an attacker with higher permissions on a system or network |
| **12** | Execution | Techniques that result in execution of attacker-controlled code on a local or remote system |
| **13** | Credential Access | Techniques resulting in the access of, or control over, system, service or domain credentials |
| **14** | Lateral Movement | Techniques that enable an adversary to horizontally access and control other remote systems |
| **15** | Collection | Techniques used to identify and gather data from a target network prior to exfiltration. |
| **16** | Exfiltration | Techniques that result or aid in an attacker removing data from a target network. |
| **17** | Impact | Techniques aimed at manipulating, interrupting or destroying the target system or data. |
| **18** | Objectives | Socio-technical objectives of an attack that are intended to achieve a strategic goal. |

Cyber Attack is defined as an action by human with intent to breach
security. It does not matter if attack succeeds. It is still considered
an attack if it fails.

An active attack attempts to alter system resources or affect their
operation, so it compromises the Integrity or Availability. A passive
attack attempts to learn or make use of information from the system, but
does not affect system resources, so it compromises Confidentiality.

**Cyber Kill Chain Phases:**

- **Reconnaissance** - Research identification, and selection of targets

- **Weaponization** - Pairing Remote access malware with exploit in to a
  deliverable payload

- **Delivery** - Transmission of weapon to target (via email
  attachments, websites or USB driver)

- **Exploitation** - Once Delivered weapons code is triggered,
  exploiting vulnerable applications or systems.

- **Installation** - The weapon installs a backdoor on target systems
  allowing persistent access.

- **Command and Control** - Outside Server communicates with weapons
  providing hands on keyboard access inside target network.

- **Actions on Objective** - Attacker works to achieve the objective of
  intrusion, which can include exfiltration or destruction of data or
  intrusion of another target

**Cyber Kill Chain**

- Cyber Attack is defined as an action by human with intent to violet
  security. It does not matter if attack succeeds. It is still
  considered an attack if it fails.

- An active attack attempts to alter system resources or affect their
  operation, so it compromises the Integrity or Availability. A passive
  attack attempts to learn or make use of information from the system,
  but does not affect system resources, so it compromises
  Confidentiality.

**Cyber Kill Chain Phases:**

- **Reconnaissance** - Research identification, and selection of targets

- **Weaponization** - Pairing Remote access malware with exploit in to a
  deliverable payload

- **Delivery** - Transmission of weapon to target (via email
  attachments, websites or USB driver)

- **Exploitation** - Once Delivered weapons code is triggered,
  exploiting vulnerable applications or systems.

- **Installation** - The weapon installs a backdoor on target systems
  allowing persistent access.

- **Command and Control** - Outside Server communicates with weapons
  providing hands on keyboard access inside target network.

- **Actions on Objective** - Attacker works to achieve the objective of
  intrusion, which can include exfiltration or destruction of data or
  intrusion of another target

- Reconnaissance: Researching, identifying and selecting targets using
  active or passive reconnaissance.

- Weaponization: Preparatory activities aimed at setting up the
  infrastructure required for the attack.

- Delivery: Techniques resulting in the transmission of a weaponized
  object to the targeted environment.

- Social Engineering: Techniques aimed at the manipulation of people to
  perform unsafe actions.

- Exploitation: Techniques to exploit vulnerabilities in systems that
  may, amongst others, result in code execution.

- Persistence: Any access, action or change to a system that gives an
  attacker persistent presence on the system.

- Defense Evasion: Techniques an attacker may specifically use for
  evading detection or avoiding other defenses

- Command & Control: Techniques that allow attackers to communicate with
  controlled systems within a target network.

- Pivoting: Tunnelling traffic through a controlled system to other
  systems that are not directly accessible.

- Discovery: Techniques that allow an attacker to gain knowledge about a
  system and its network environment

- Privilege Escalation: The result of techniques that provide an
  attacker with higher permissions on a system or network

- Execution: Techniques that result in execution of attacker-controlled
  code on a local or remote system

- Credential Access: Techniques resulting in the access of, or control
  over, system, service or domain credentials

- Lateral Movement: Techniques that enable an adversary to horizontally
  access and control other remote systems

- Collection : Techniques used to identify and gather data from a target
  network prior to exfiltration.

- Exfiltration: Techniques that result or aid in an attacker removing
  data from a target network.

- Impact: Techniques aimed at manipulating, interrupting or destroying
  the target system or data.

- Objectives: Socio-technical objectives of an attack that are intended
  to achieve a strategic goal.

**Cyber Kill Chain**

| **No** | **Attack Phase** | **Description** |
|----|----|----|
| **1** | Reconnaissance | Researching, identifying and selecting targets using active or passive reconnaissance. |
| **2** | Weaponization | Preparatory activities aimed at setting up the infrastructure required for the attack. |
| **3** | Delivery | Techniques resulting in the transmission of a weaponized object to the targeted environment. |
| **4** | Social Engineering | Techniques aimed at the manipulation of people to perform unsafe actions. |
| **5** | Exploitation | Techniques to exploit vulnerabilities in systems that may, amongst others, result in code execution. |
| **6** | Persistence | Any access, action or change to a system that gives an attacker persistent presence on the system. |
| **7** | Defense Evasion | Techniques an attacker may specifically use for evading detection or avoiding other defenses |
| **8** | Command & Control | Techniques that allow attackers to communicate with controlled systems within a target network. |
| **9** | Pivoting | Tunnelling traffic through a controlled system to other systems that are not directly accessible. |
| **10** | Discovery | Techniques that allow an attacker to gain knowledge about a system and its network environment |
| **11** | Privilege Escalation | The result of techniques that provide an attacker with higher permissions on a system or network |
| **12** | Execution | Techniques that result in execution of attacker-controlled code on a local or remote system |
| **13** | Credential Access | Techniques resulting in the access of, or control over, system, service or domain credentials |
| **14** | Lateral Movement | Techniques that enable an adversary to horizontally access and control other remote systems |
| **15** | Collection | Techniques used to identify and gather data from a target network prior to exfiltration. |
| **16** | Exfiltration | Techniques that result or aid in an attacker removing data from a target network. |
| **17** | Impact | Techniques aimed at manipulating, interrupting or destroying the target system or data. |
| **18** | Objectives | Socio-technical objectives of an attack that are intended to achieve a strategic goal. |

**Most common types of attack vectors**

Phishing emails

Social engineering

Spoofing

Malware

Unpatched vulnerabilities

Delivery of malicious code

Missing or poor encryption

Brute Force attack

DoS and DDoS

Compromised Credentials

Malicious Insiders

Man in the middle attacks

**OSI Layers and Attacks**

Application  Exploit

Presentation  Phishing

Session  Hijacking

Transport  Reconnaissance

Network  MITM

Data link  Spoofing

Physical  Sniffing

# Weaponization

- What is Weaponization?

- Command and Scripting Interpreters

- Inter-Process Communication

- Implementing Blacklists

- Bypassing Application Whitelisting

- User Execution

# Cyber Attack Techniques

**Most common types of attack vectors**

- Phishing emails

- Social engineering

- Spoofing

- Malware

- Unpatched vulnerabilities

- Delivery of malicious code

- Missing or poor encryption

- Brute Force attack

- DoS and DDoS

- Compromised Credentials

- Malicious Insiders

- Man in the middle attacks

# OSI Layers and Attacks

1.  Application 🡨 Exploit

2.  Presentation 🡨 Phishing

3.  Session 🡨 Hijacking

4.  Transport 🡨 Reconnaissance

5.  Network 🡨 MITM

6.  Data link 🡨 Spoofing

7.  Physical 🡨 Sniffing

# MITRE ATT&CK

While collecting and understanding hash values is a broad spectrum, the
ATTACK framework helps us interpret this TTP (TTP is short for Tactical,
technical, and procedural).

<img src="media/image3.png" style="width:5.80768in;height:3.98479in" />

# Reconnaissance 

Research identification, and selection of targets

# Weaponization 

Pairing Remote access malware with exploit in to a deliverable payload

# Delivery 

Transmission of weapon to target (via email attachments, websites or USB
driver)

# Exploitation 

Once Delivered weapons code is triggered, exploiting vulnerable
applications or systems.

# Installation 

The weapon installs a backdoor on target systems allowing persistent
access.

# Command and Control 

Outside Server communicates with weapons providing hands on keyboard
access inside target network.

# Actions on Objective 

Attacker works to achieve the objective of intrusion, which can include
exfiltration or destruction of data or intrusion of another target

# Defense Evasion

- What is Defense Evasion?

- Access Token Manipulation

- Evading by Hiding Artifacts

- Decode Files or Information

- Indicator Removal on Host

- Alternate Data Streams

- Tracks Analysis and Deletion

## Covering Tracks & Maintaining Access

- Persistence Service

- Persistence

- Registry Persistence

** **

## Stealth

Manually Clearing Event Logs

- **Windows**:

  1.  Navigate to Start \> Control Panel \> System and Security \>
      Administrative Tools \> double click Event Viewer.

> ○ Delete all the log entries logged while compromising the system.

- **Linux**:

  1.  Navigates to /var/log directory on the Linux system.

> ○ Open plain text file containing log messages with text editor
> /var/log/messages ○ Delete all the log entries logged while
> compromising the system.

Ways to Clear Online Tracks

- Remove Most Recently Used (MRU), delete cookies, clear cache, turn off
  AutoComplete, clear Toolbar data from the browsers.

- **Privacy Settings in Windows 8.1**:

  1.  Click on the Start button, choose Control Panel \> Appearance and
      Personalization \> Taskbar and Start Menu.

> ○ Click the Start Menu tab, and then, under Privacy, clear the Store
> and display recently opened items in the Start menu and the taskbar
> check box.

- **From the Registry in Windows 8.1**:

  1.  HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer and then
      remove the key for "Recent Docs"

> ○ Delete all the values except "(Default)"

Tools for Covering Tracks

- **CCleaner**:

  1.  CCleaner is system optimization and cleaning tool.

> ○ It cleans traces of temporary files, log files, registry files,
> memory dumps, and also your online activities such as your Internet
> history.

- **MRU-Blaster**:

  1.  MRU-Blaster is an application for Windows that allows you to clean
      the most recently used lists stored on your computer.

> ○ It allows you to clean out your temporary Internet files and
> cookies.

## IDS Evasion Techniques 

- Use fragmented IP packets.

- Spoof your IP address when launching attacks and sniff responses from
  server. ● Use source routing (if possible).

- Connect to proxy servers or compromised trojaned machines to launch
  attacks.

> Insertion Attack

1.  An IDS blindly believes and accepts a packet that an end system
    rejects.

2.  An attacker exploits this condition and inserts data into the IDS.

3.  This attack occurs when NIDS is less strict in processing packets.

4.  Attacker obscures extra traffic and IDS concludes traffic is
    harmless.

5.  Hence, the IDS gets more packets than the destination.

> Session Splicing

- A technique used to bypass IDS where an attacker splits the attack
  traffic into many packets such that no single packet triggers the IDS.

- It is effective against IDSs that do not reconstruct packets before
  checking them against intrusion signatures.

- If attackers are aware of delay in packet reassembly at the IDS, they
  can add delays between packet transmissions to bypass the reassembly.

- Many IDSs stop reassembly if they do not receive packets within a
  certain time.

- IDS will stop working if the target host keeps the session active for
  a time longer than the IDS reassembly time.

- Any attack attempt after a successful splicing attack will not be
  logged by the IDS.

> Attackers can use different tools such as **Nessus** and **Whisker**
> for session-splicing attacks.
>
> Other Types of Evasion

- **Encryption**: When the attacker has already established an encrypted
  session with the victim, it results in the most effective evasion
  attack.

> ○ If an attacker succeeds in establishing an encrypted session with
> his/her target host using a secure shell (SSH), secure socket layer
> (SSL), or a virtual private network (VPN) tunnel, the IDS will not
> analyze the packets going through these encrypted communications.
>
> ○ He/she can send the malicious traffic using this secure channel,
> thus evading IDS security.

- **Flooding**: The attacker sends loads of unnecessary traffic to
  produce noise, and if IDS does not analyze the noise traffic well,
  then the true attack traffic may go undetected.

## Firewall Evasion Techniques 

> Bypassing Firewall through SSH Tunneling Method

- **OpenSSH**: Attackers use OpenSSH to encrypt and tunnel all the
  traffic from a local machine to a remote machine to avoid detection by
  perimeter security controls.

> SSH Tunneling Tool: Bitvise

- Bitvise SSH Server provides secure remote login capabilities to
  Windows workstations and servers.

- SSH Client includes powerful tunneling features including dynamic port
  forwarding through an integrated proxy, and also remote administration
  for the SSH Server.

> Honeypots
>
> Focus on passive (listening) methods

## Covering Tracks during Penetration testing

## APT, Evasion techniques and Stealth Mode

## Honeypots

- Honeypots are a type of Internet security resource that is used to
  entice cybercriminals to deceive them when they try to intrude into
  the network for any illegal use. These honeypots are generally set up
  to understand the activities of the attacker in the network so that
  the organisation can come up with stronger prevention methods against
  these intrusions. The honeypots do not carry any valuable data as they
  are faked proxies that help in logging the network traffic.

- Honeypots capture following IoC about attacker:

  - Keystrokes entered and typed by the attacker.

  - The IP address of the attacker

  - The usernames and different privileges used by the attackers

  - The type of data that the attacker had accessed, deleted or that was
    altered.

- Types of Honeypot based on design:

  - Low-interaction honeypots

  - Medium-interaction honeypots

  - High-interaction honeypots

  - Pure honeypots

- Types of Honeypot based on deployment:

  - Research honeypots

  - Production honeypots

- Types of Honeypot based on deception technology:

  - Malware honeypots

  - Database honeypots

  - Spam honeypots

  - Email honeypots

  - Spider honeypots

  - Honeynet honeypots

- Honeypot software:

  - Windows: Honeybot

  - Linux: Pentbox

  - Android: Hostage

>  
>
> **Evading IDS**

- **Session Splicing**: It is the IDS evasion method, attacker delivers
  the payload that IDS would have otherwise seen by slicing it over
  multiple packets. Payload can be spread over long period of time.

> **Evading Firewalls**
>
> **IDS/Firewall Evading Tools**
>
> **Detecting Honeypots**
>
> **IDS/Firewall Evasion Countermeasures**
>
>  
>
> **Advanced persistent threats (APT):**

- When an individual or group gains unauthorized access to a network and
  remains undiscovered for an extended period of time, attackers may
  exfiltrate sensitive data, deliberately avoiding detection by the
  organization’s security staff. APTs require sophisticated attackers
  and involve major efforts, so they are typically launched against
  nation states, large corporations or other highly valuable targets

>  
>
>  
>
> **IDS Evasion Techniques**

- Use fragmented IP packets.

- Spoof your IP address when launching attacks and sniff responses from
  server.

- Use source routing (if possible).

- Connect to proxy servers or compromised trojan machines to launch
  attacks.

>  
>
> **Insertion Attack**

- An IDS blindly believes and accepts a packet that an end system
  rejects.

- An attacker exploits this condition and inserts data into the IDS.

- This attack occurs when NIDS is less strict in processing packets.

- Attacker obscures extra traffic and IDS concludes traffic is harmless.

- Hence, the IDS gets more packets than the destination.

>  
>
> **Session Splicing**

- A technique used to bypass IDS where an attacker splits the attack
  traffic into many packets such that no single packet triggers the IDS.

- It is effective against IDSs that do not reconstruct packets before
  checking them against intrusion signatures.

- If attackers are aware of delay in packet reassembly at the IDS, they
  can add delays between packet transmissions to bypass the reassembly.

- Many IDSs stop reassembly if they do not receive packets within a
  certain time.

- IDS will stop working if the target host keeps the session active for
  a time longer than the IDS reassembly time.

- Any attack attempt after a successful splicing attack will not be
  logged by the IDS.

- Attackers can use different tools such as Nessus and Whisker for
  session-splicing attacks.

>  
>
> **IDS evasion through Encryption:**

- When the attacker has already established an encrypted session with
  the victim, it results in the most effective evasion attack.

- If an attacker succeeds in establishing an encrypted session with
  his/her target host using a secure shell (SSH), secure socket layer
  (SSL), or a virtual private network (VPN) tunnel, the IDS will not
  analyse the packets going through these encrypted communications.

- He/she can send the malicious traffic using this secure channel, thus
  evading IDS security.

>  
>
> **IDS evasion through Flooding:**

- The attacker sends loads of unnecessary traffic to produce noise, and
  if IDS does not analyse the noise traffic well, then the true attack
  traffic may go undetected.

>  
>
>  

## Firewall Evasion Techniques 

>  
>
> **Bypassing Firewall through SSH Tunnelling Method**

- **OpenSSH**: Attackers use OpenSSH to encrypt and tunnel all the
  traffic from a local machine to a remote machine to avoid detection by
  perimeter security controls.

> SSH Tunnelling Tool: Bitvise

- Bitvise SSH Server provides secure remote login capabilities to
  Windows workstations and servers.

- SSH Client includes powerful tunnelling features including dynamic
  port forwarding through an integrated proxy, and also remote
  administration for the SSH Server.

>  
>
> Honeypots: Focus on passive (listening) methods
>
>  
>
>  
>
> **Covering Tracks**

Once intruders have successfully gained administrator access on a
system, they will try to cover the tracks to avoid their detection.

Attacker uses following techniques to cover tracks on the target system:

Disable auditing

Clearing logs

Manipulating logs

**Disabling Auditing: Auditpol**

Intruders will disable auditing immediately after gaining administrator
privileges.

At the end of their stay, the intruders will just turn on auditing again
using auditpol.exe.

**Clearing Logs**

Attacker uses clearlogs.exe utility to clear the security, system, and
application logs.

If the system is exploited with Metasploit, the attacker uses a
meterpreter shell to wipe out all the logs from a Windows system.

**Manually Clearing Event Logs**

**Windows**: Navigate to Start \> Control Panel \> System and Security
\> Administrative Tools \> double click Event Viewer. Delete all the log
entries logged while compromising the system.

**Linux**: Navigates to /var/log directory on the Linux system. Open
plain text file containing log messages with text editor
/var/log/messages ○ Delete all the log entries logged while compromising
the system.

**Ways to Clear Online Tracks:** Remove Most Recently Used (MRU), delete
cookies, clear cache, turn off AutoComplete, clear Toolbar data from the
browsers.

**Privacy Settings in Windows 8.1**: Click on the Start button, choose
Control Panel \> Appearance and Personalization \> Taskbar and Start
Menu. Click the Start Menu tab, and then, under Privacy, clear the Store
and display recently opened items in the Start menu and the taskbar
check box.

**From the Registry in Windows 8.1**:
HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer and then remove
the key for "Recent Docs" Delete all the values except "(Default)"

>  

## Tools for Covering Tracks 

**CCleaner**: CCleaner is system optimization and cleaning tool. It
cleans traces of temporary files, log files, registry files, memory
dumps, and also your online activities such as your Internet history.

**MRU-Blaster**: MRU-Blaster is an application for Windows that allows
you to clean the most recently used lists stored on your computer. It
allows you to clean out your temporary Internet files and cookies.

# Delivery

## Unrestricted File Upload 

1.  Introduction to Unrestricted File Upload

2.  Impact of Unrestricted File Upload

3.  File Upload Exploitation

4.  Basic File Upload

5.  Content-Type Restriction

6.  Double Extension File Upload

7.  Image Size Validation Bypass

8.  Blacklisted Extension File Upload

9.  Mitigation Step

## Remote File Inclusion

- Introduction to RFI

- Why Remote file Inclusion Occurs?

- Remote File Inclusion Exploitation

- Basic Remote File Inclusion

- Reverse Shell through Netcat

- RFI over Metasploit

- Bypass a Blacklist Implemented

- Null Byte Attack

- Exploitation through SMB Server

- Mitigation Steps

## Local File Inclusion

- Introduction to Local File Inclusion

- Basic LFI Technique

- Null byte Technique

- Base64 Technique

- Fuzzing Technique

- LFI Suite • LFI over File Upload

- LFI Log Poisoning

- Mitigation Steps

# Exfiltration

How to perform File Transfers during Penetration Testing?

1.  **File Transfers**

    1.  *FTP*

    2.  *Python HTTP Server*

    3.  *PHP http server*

    4.  *HFS Tool*

    5.  *Netcat*

    6.  *CURL*

    7.  *Wget*

    8.  *TFTP*

    9.  *Python SMB Server*

    10. *PowerShell File Transfer*

    11. *Bitsadmin*

## Data Exfiltration

- Introduction to Data Exfiltration

- Automated Exfiltration

- Data Exfiltration Over-Size Limits

- Exfiltration Over Alternative Protocol

- Exfiltration Over Non-C2 Platforms

- Exfiltration Over Web Service

- Data Exfiltration with Steganography Approach

- Encrypted Reverse Connection

## File Transfers

- FTP, TFTP

- Python HTTP Server

- PHP http server

- HFS Tool

- Netcat

- CURL

- Wget

- Python SMB Server

- Powershell File Transfer

- Bitsadmi

# Exploitation 

## Vulnerability Exploitation

- Adding Exploit in Metasploit Framework

- Manual Exploitation

- Using Python script

- Unicorn

- Buffer Overflow

## Buffer Overflow Attack

A buffer overflow is an exploit that takes advantage of a program that
accepts input from a client or other software process.

It occurs when a program or process attempts to write more data to a
fixed-length block of memory, or buffer, than the buffer is allocated to
hold.

Exploiting a buffer overflow enables an attacker to control, crash or
modify the program.

Open Web Application Security Project Top 10, which has identified
buffer overflows as a top 10 threat for many years.

There are different categories of buffer overflow attacks based on
location buffer in program or process memory:

<img src="media/image4.png" style="width:8.65972in;height:2.4711in" />

**How buffer overflow attacks work?**

- Stack-based buffer overflow is the most common of these types of
  attacks.

- Normally the stack is empty until the targeted program requires user
  input, like username / password.

- At that point, the program writes a return memory address to the
  stack, and then the user's input is placed on top of it.

- When the stack is processed, the user's input gets sent to the return
  address specified by the program.

- A stack has a finite size.

- The programmer who develops the code must reserve a specific amount of
  space for the stack. If the user's input is longer than the amount of
  space reserved for it within the stack and the program does not verify
  that the input will fit, then the stack will overflow.

- This in itself isn't a huge problem, but it becomes a huge security
  hole when it's combined with malicious input.

- For example, suppose a program is waiting for a user to enter her
  name.

- Rather than entering the name, the hacker would enter an executable
  command that exceeds the stack size.

- The command is usually something short. In a Linux environment, for
  instance, the command is typically EXEC("sh"), which tells the system
  to open a command prompt window, known as a root shell in Linux
  circles.

- Yet, overflowing the buffer with an executable command doesn't mean
  that the command will be executed.

- The attacker must then specify a return address that points to the
  malicious command.

- The program partially crashes because the stack overflowed.

- It then tries to recover by going to the return address, but the
  return address has been changed to point to the command specified by
  the hacker.

- The hacker must know the address where the malicious command will
  reside.

- To get around needing the actual address, the malicious command is
  often padded on both sides by NOP instructions, a type of pointer.

- Padding on both sides is a technique used when the exact memory range
  is unknown.

- Therefore, if the address the hacker specifies falls anywhere within
  the padding, the malicious command will be executed.

- The last part of the equation is getting around the executable
  program's permissions.

- Lot of OS have some sort of mechanism to control the access level of
  the user who's currently logged on, and executable programs typically
  require a higher level of permissions.

- These programs therefore run either in kernel mode or with permissions
  inherited from a service account.

- When a stack overflow attack runs the command found at the new return
  address, the program thinks it is still running.

- This means that the command prompt window that has been opened is
  running with the same set of permissions as the application that was
  compromised.

- Generally speaking, this often means that the attacker will gain full
  control of the OS.

**Defend against Buffer Overflows Attack**

- Possible solutions in:

- Modern Languages and Frameworks

- OS Built-in Protections

- Available Options:

<!-- -->

- Staying up to date with OS and Software updates

- Enabling runtime protections in OSes

- Using address space layout randomization

- Marking areas of memory as either executable or nonexecutable with
  Data Execution Prevention

- Manually testing for buffer overflows

- Using Programming Language that doesn't allow buffer overflow attacks

  - Like Java, Python or .NET

- Developers should also be sure to protect against overflows by
  checking input values before processing.

# Foot printing 

Footprinting is a crucial initial phase in a cyberattack, involving the
systematic collection of information about a target organization. This
gathered intelligence enables attackers to:

**Key Objectives of Footprinting:**

1.  **Assess Security Posture:** Understand the target's security
    measures and weaknesses.

2.  **Narrow Down the Target:** Focus on specific systems, networks, or
    services that are vulnerable.

3.  **Identify Exploitable Vulnerabilities:** Discover potential entry
    points and attack vectors.

4.  **Map the Network Infrastructure:** Visualize the target's network
    topology to plan effective attacks.

**Types of Information Gathered During Footprinting:**

- **Domain Information:**

  - Public domain names

  - Internal domain names

- **Network Information:**

  - Network blocks

  - IP addresses of reachable systems

  - Rogue or private websites

- **Service Information:**

  - Running TCP and UDP services

  - Access control mechanisms (ACLs)

  - Networking protocols

  - VPN points

  - Intrusion Detection Systems (IDS)

- **System Information:**

  - Operating systems

  - Software applications

  - User accounts

- **Contact Information:**

  - Phone numbers

  - Email addresses

  - Physical addresses

By meticulously gathering this information, attackers can craft targeted
and effective attacks, making it imperative for organizations to
implement robust security measures to mitigate the risks associated with
footprinting.

## Types of Footprinting 

- **Passive** footprinting: Gathering information about target
  <span class="mark">without direct interaction.</span> Finding
  information through search engines, social networking sites, Job
  sites, through deep and dark web, Online reputation of target.

- **Active** footprinting: Gathering information about target
  <span class="mark">with direct interaction</span>. Finding information
  through traceroute analysis, querying published nameservers of target,
  extracting metadata of published documents and files. Scanning the
  public web portals, performing social engineering. Extracting DNS
  information.

## Purpose

- **Collect System Information**:

  - User and group names

  - System banners

  - Routing tables

  - SNMP information

  - System architecture

  - Remote system type

  - System names

  - Passwords

- **Collect Organization's Information:**

  - Employee details

  - Organization's website

  - Company directory

  - Location details

  - Address and phone numbers

  - Comments in HTML source code

  - Security policies implemented

  - Web server links relevant to the organization

  - Background of the organization

  - News articles

  - Press releases

<!-- -->

- Know Security Posture: Footprinting allows attackers to know the
  external security posture of the target organization.

- Reduce Focus Area: It reduces the attacker's focus area to specific
  range of IP address, networks, domain names, remote access, etc.

- Identify Vulnerabilities: It allows attackers to identify
  vulnerabilities in the target systems in order to select appropriate
  exploits.

- Draw Network Map: It allows attackers to draw a map or outline the
  target organization's network infrastructure to know about the actual
  environment that they are going to break

## Techniques

Techniques to perform footprinting.

### Search Engines 

- Attackers use search engines to extract information about a target,
  such as employed technology platforms, employee details, login pages,
  intranet portals, which help the attacker to perform social
  engineering and other types of advanced system attacks.

- Attackers can use advanced search operators available with these
  search engines and create complex queries to find filter and sort
  specific information about the target.

- Search engines are also used to find other sources publically
  available information sources e.g. Top job portals.

- **Footprinting using advanced Google hacking techniques:**

<!-- -->

- *It refers to use of advanced google search operators creating complex
  search queries to extract sensitive or hidden information that helps
  attackers find vulnerable targets.*

- *Popular Google advanced search operators:*

  - ***Cache**: Displays webpages stored in Google Cache*

  - ***Link**: Lists web pages that have links to specified web page*

  - ***Related**: Lists web pages similar to specified web page*

  - ***Info**: Presents some information that Google has about
    particular web page.*

  - ***Site**: Restricts the result to those websites in the given
    domain*

  - ***Allintitle**: Restricts the result to those websites containing
    all search keyword in title.*

  - ***Intitle**: Restrict results to documents containing search
    keyword in title*

  - ***Allinurl**: Restrict results to those containing all search
    keywords in URL*

  - ***Inurl**: Restrict results to those containing search keywords in
    URL*

  - ***Location**: Find information for specific location*

### Social Networking Sites 

### Web Services 

### Social Engineering 

## Website

Website Foot printing refers to monitoring and analysing the target
organization's website for information.

- **Browsing the target website may provide**:

<!-- -->

- Software used and its version

- Operating system used

- Sub-directories and parameters

- Filename, path, database field name, or query

- Scripting platform

- Contact details and CMS details

<!-- -->

- **Use Burp Suite, Zaproxy, Paros Proxy, Website Informer, Firebug,
  etc. to view headers that provide:**

<!-- -->

- Connection status and content-type

- Accept Ranges

- Last-Modified information

- X-Powered-By information

- Web server in use and its version

<!-- -->

- **Examining HTML source provide:**

<!-- -->

- Comments in the source code

- Contact details of web developer or admin

- File system structure

- Script type

<!-- -->

- **Examining cookies may provide:**

<!-- -->

- Software in use and its behaviour

- Scripting platforms used

> **Website Foot printing using Web Spiders**

- Web spiders perform automated searches on the target websites and
  collect specific information such as employee names, email addresses,
  etc.

- Attackers use the collected information to perform further Foot
  printing and social engineering attacks.

- GSA Email Spider: http://email.spider.gsa-online.de

- Web Data Extractor: http://webextractor.com

> **Website Mirroring**

- Mirroring an entire website onto the local system enables an attacker
  to browse websites offline; it also assists in finding directory
  structure and other valuable information from the mirrored copy
  without multiple requests to the web server.

- Web mirroring tools allow you to download a website to a local
  directory, building recursively all directories, HTML, images, flash,
  videos, and other files from the server to your computer.

- wget -m

- HTTrack Web Site Copier: http://www.httrack.com

- SurfOffline: http://www.surfoffline.com

> **Website Mirroring Tools**
>
> Extract Website Information from <u>http://www.archive.org</u>
>
> Internet Archive's Wayback Machine allows you to visit archived
> versions of websites. google cache:
>
> Monitoring Web Updates Using Website-Watcher
>
> Website-Watcher automatically checks web pages for updates and
> changes.

Website Foot printing refers to monitoring and analysing the target
organization's website for information.

- **Browsing the target website may provide**:

<!-- -->

- Software used and its version

- Operating system used

- Sub-directories and parameters

- Filename, path, database field name, or query

- Scripting platform

- Contact details and CMS details

<!-- -->

- **Use Burp Suite, Zaproxy, Paros Proxy, Website Informer, Firebug,
  etc. to view headers that provide:**

<!-- -->

- Connection status and content-type

- Accept Ranges

- Last-Modified information

- X-Powered-By information

- Web server in use and its version

<!-- -->

- **Examining HTML source provide:**

<!-- -->

- Comments in the source code

- Contact details of web developer or admin

- File system structure

- Script type

<!-- -->

- **Examining cookies may provide:**

<!-- -->

- Software in use and its behaviour

- Scripting platforms used

> **Website Foot printing using Web Spiders**

- Web spiders perform automated searches on the target websites and
  collect specific information such as employee names, email addresses,
  etc.

- Attackers use the collected information to perform further Foot
  printing and social engineering attacks.

- GSA Email Spider: http://email.spider.gsa-online.de

- Web Data Extractor: http://webextractor.com

> **Website Mirroring**

- Mirroring an entire website onto the local system enables an attacker
  to browse websites offline; it also assists in finding directory
  structure and other valuable information from the mirrored copy
  without multiple requests to the web server.

- Web mirroring tools allow you to download a website to a local
  directory, building recursively all directories, HTML, images, flash,
  videos, and other files from the server to your computer.

- wget -m

- HTTrack Web Site Copier: http://www.httrack.com

- SurfOffline: http://www.surfoffline.com

> **Website Mirroring Tools**
>
> Extract Website Information from <u>http://www.archive.org</u>
>
> Internet Archive's Wayback Machine allows you to visit archived
> versions of websites. google cache:
>
> Monitoring Web Updates Using Website-Watcher
>
> Website-Watcher automatically checks web pages for updates and
> changes.

- Web Spider, Web Data Extractor, Website Mirroring tool-HTTRACK website
  copier

## DNS 

- DNS Foot printing is Collecting information about DNS zone data

- Attackers can gather DNS information to determine key hosts in the
  network and can perform social engineering attacks.

- DNS records provide important information about location and type of
  servers.

- DNS Interrogation Tools:

  - <http://www.dnsstuff.com>

  - http://network-tools.com

- Name -\> IP

- IP -\> Name

- Service -\> Name

<table style="width:50%;">
<colgroup>
<col style="width: 8%" />
<col style="width: 41%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><blockquote>
<p><strong>Record</strong></p>
</blockquote></th>
<th style="text-align: center;"><blockquote>
<p><strong>Description</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td><blockquote>
<p>A</p>
</blockquote></td>
<td><blockquote>
<p>Maps host name to an IP address</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>MX</p>
</blockquote></td>
<td><blockquote>
<p>Points to domain's mail server</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>NS</p>
</blockquote></td>
<td><blockquote>
<p>Points to host's name server</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>CNAME</p>
</blockquote></td>
<td><blockquote>
<p>Canonical naming allows aliases to a host</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>SDA</p>
</blockquote></td>
<td><blockquote>
<p>Indicate authority for domain</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>SRV</p>
</blockquote></td>
<td><blockquote>
<p>Service records</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>PTR</p>
<p>(pointer)</p>
</blockquote></td>
<td><blockquote>
<p>Maps IP address to a hostname</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>RP</p>
</blockquote></td>
<td><blockquote>
<p>Responsible person</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>HINFO</p>
</blockquote></td>
<td><blockquote>
<p>Host information record includes CPU type and OS</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>TXT</p>
</blockquote></td>
<td><blockquote>
<p>Unstructured text records</p>
</blockquote></td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
</tbody>
</table>

> WHOIS query returns:

- Domain name details

- Contact details of domain owner

- Domain name servers

- NetRange

- When a domain has been created

- Expiry records

- Records last updated

> Information obtained from WHOIS database assists an attacker to:
> Gather personal information to perform social engineering attacks.

- DNS Foot printing is Collecting information about DNS zone data

- Attackers can gather DNS information to determine key hosts in the
  network and can perform social engineering attacks.

- DNS records provide important information about location and type of
  servers.

- DNS Interrogation Tools:

  - <http://www.dnsstuff.com>

  - http://network-tools.com

- Name -\> IP

- IP -\> Name

- Service -\> Name

<table style="width:50%;">
<colgroup>
<col style="width: 8%" />
<col style="width: 41%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><blockquote>
<p><strong>Record</strong></p>
</blockquote></th>
<th style="text-align: center;"><blockquote>
<p><strong>Description</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td><blockquote>
<p>A</p>
</blockquote></td>
<td><blockquote>
<p>Maps host name to an IP address</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>MX</p>
</blockquote></td>
<td><blockquote>
<p>Points to domain's mail server</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>NS</p>
</blockquote></td>
<td><blockquote>
<p>Points to host's name server</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>CNAME</p>
</blockquote></td>
<td><blockquote>
<p>Canonical naming allows aliases to a host</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>SDA</p>
</blockquote></td>
<td><blockquote>
<p>Indicate authority for domain</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>SRV</p>
</blockquote></td>
<td><blockquote>
<p>Service records</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>PTR</p>
<p>(pointer)</p>
</blockquote></td>
<td><blockquote>
<p>Maps IP address to a hostname</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>RP</p>
</blockquote></td>
<td><blockquote>
<p>Responsible person</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>HINFO</p>
</blockquote></td>
<td><blockquote>
<p>Host information record includes CPU type and OS</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>TXT</p>
</blockquote></td>
<td><blockquote>
<p>Unstructured text records</p>
</blockquote></td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
</tbody>
</table>

> WHOIS query returns:

- Domain name details

- Contact details of domain owner

- Domain name servers

- NetRange

- When a domain has been created

- Expiry records

- Records last updated

> Information obtained from WHOIS database assists an attacker to:
> Gather personal information to perform social engineering attacks.

## Email 

- eMailTrackerPro

## Network 

- PathAnalyzerPro

## Countermeasures 

- Restrict the employees to access social networking sites from
  organization's network

- Configure web servers to avoid information leakage

- Educate employees to use pseudonyms on blogs, groups, and forums

- Do not reveal critical information in press releases, annual reports,
  product catalogues, etc.

- Limit the amount of information that you are publishing on the
  website/Internet

- Use Foot printing techniques to discover and remove any sensitive
  information publicly available

- Prevent search engines from caching a web page and use anonymous
  registration services

- Enforce security policies to regulate the information that employees
  can reveal to third parties

- Set apart internal and external DNS or use split DNS, and restrict
  zone transfer to authorized servers

- Disable directory listings in the web servers

- Educate employees about various social engineering tricks and risks

- Opt for privacy services on Whois Lookup database

- Avoid domain-level cross-linking for the critical assets

- Encrypt and password protect sensitive information

- Restrict the employees to access social networking sites from
  organization's network

- Configure web servers to avoid information leakage

- Educate employees to use pseudonyms on blogs, groups, and forums

- Do not reveal critical information in press releases, annual reports,
  product catalogues, etc.

- Limit the amount of information that you are publishing on the
  website/Internet

- Use Foot printing techniques to discover and remove any sensitive
  information publicly available

- Prevent search engines from caching a web page and use anonymous
  registration services

- Enforce security policies to regulate the information that employees
  can reveal to third parties

- Set apart internal and external DNS or use split DNS, and restrict
  zone transfer to authorized servers

- Disable directory listings in the web servers

- Educate employees about various social engineering tricks and risks

- Opt for privacy services on Whois Lookup database

- Avoid domain-level cross-linking for the critical assets

- Encrypt and password protect sensitive information

  - **Footprinting Countermeasures**

    - Restrict the employees to access social networking sites from
      organization's network

    - Configure web servers to avoid information leakage

    - Educate employees to use pseudonyms on blogs, groups, and forums

    - Do not reveal critical information in press releases, annual
      reports, product catalogues, etc.

    - Limit the amount of information that you are publishing on the
      website/Internet

    - Use footprinting techniques to discover and remove any sensitive
      information publicly available

    - Prevent search engines from caching a web page and use anonymous
      registration services

    - Enforce security policies to regulate the information that
      employees can reveal to third parties

    - Set apart internal and external DNS or use split DNS, and restrict
      zone transfer to authorized servers

    - Disable directory listings in the web servers

    - Educate employees about various social engineering tricks and
      risks

    - Opt for privacy services on Whois Lookup database

    - Avoid domain-level cross-linking for the critical assets

    - Encrypt and password protect sensitive information

## Whois Footprinting: 

- Whois lookup tools-Smart Whois tool

## Tools

- Foca, Maltego, Recon-ng, SearchDiggity

# Lateral Movement

- Lateral Movement & its methodologies

- Remote Service

- Exploitation of Remote Services

- Remote Service Session Hijacking

- Lateral Tool Transfers

- Use Alternate Authentication Materia

# Privilege Escalation 

> An attacker can gain access to the network using a non-admin user
> account, and the next step would be to gain administrative privileges.
>
> Attacker performs privilege escalation attack which takes advantage of
> design flaws, programming errors, bugs, and configuration oversights
> in the OS and software application to gain administrative access to
> the network and its associated applications.

- These privileges allow attackers to view critical/sensitive
  information, delete files, or install malicious programs such as
  viruses, Trojans, worms, etc.

- What is Escalate Privileges?

- Abuse Elevation Control Mechanism

- Bypass User Account Control

- Exploitation for Privilege Escalation

- Hijack Execution Flow

- Escalating Privileges over Missing Patches

- Escalating Privileges with Automated script

## Tools 

- **RemoteExec**:

  1.  RemoteExec remotely installs applications, executes
      programs/scripts, and updates files and folders on Windows systems
      throughout the network.

> ○ It allows attackers to modify the registry, change local admin
> passwords, disable local accounts, and copy/update/delete files and
> folders.

- **PDQ Deploy**:

  1.  PDQ Deploy is a software deployment tool that allows admins to
      silently install almost any application or patch.

- **DameWare Remote Support**:

  1.  DameWare Remote Support lets you manage servers, notebooks, and
      laptops remotely.

> ○ It allows attackers to remotely manage and administer Windows
> computers.

## Linux privilege escalation

- In most Privilege Escalation attacks the hacker first logs in with a
  normal end-user account then searches for flaws in the system that
  they can be exploited to elevate their privileges in order to gain
  access to sensitive data they can steal.

- There are two categories of Privilege Escalation techniques:

  - **Horizontal privilege escalation**: It occurs when the attacker,
    having gained access to a normal low access level account, seeks to
    gain access to other similar low-level access accounts.

  - **Vertical privilege escalation**: It occurs when the attacker
    attempts to access resources and functions that belong to a user
    with higher privileges, such as application or site administrators

**Linux privilege escalation techniques**

These are the most common techniques in Linux environment for Privilege
Escalation:

1.  Kernel exploits

2.  Programs running as root

3.  Installed software

4.  Weak/reused/plaintext passwords

5.  Inside service

6.  Suid misconfiguration

7.  Abusing sudo-rights

8.  World writable scripts invoked by root

9.  Bad path configuration

10. Cronjobs

11. Unmounted filesystems

**Kernel exploits**

- In kernel exploits we are going to Dirty Cow exploit

- Dirty Cow exploit leverages a race condition vulnerability to force
  the Linux kernel to write arbitrary data to restricted system files,
  it was initially obtained through an HTTP packet capture.

- Race condition vulnerability exist because of flaw in the way the
  Linux kernels memory subsystem handles Copy-On-Write (COW) function of
  private read only memory mappings. (CVE-2017-6074 )

- The following example will demonstrate how Dirty COW can be used by
  attackers to replace the

- ‘root’ user with a new user ‘rash’ by editing the /etc/passwd file.

- A use-after-free flaw was found in the way the Linux kernel's Datagram
  Congestion Control Protocol (DCCP) implementation freed SKB (socket
  buffer) resources for a DCCP_PKT_REQUEST packet when the
  IPV6_RECVPKTINFO option is set on the socket. A local, unprivileged
  user could use this flaw to alter the kernel memory, allowing them to
  escalate their privileges on the system.

**Installed software**

- In this technique need to find if the user has installed some
  third-party software that might be vulnerable?

- Check with these commands below and if you find anything just google
  it for exploits

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

- Check the netstat and compare it with the nmap-scan you did from the
  outside. Do you find more services available from the inside?

  - netstat -anlp

  - netstat -ano

## Types

### Vertical Privilege Escalation:

- Gaining higher privileges than currently possessed (e.g., user to
  admin).

- Methods:

  - Password guessing/cracking

  - Exploiting vulnerabilities

  - Weak permissions

  - DLL hijacking

### Horizontal Privilege Escalation:

- Acquiring privileges of another user at the same level.

- Methods:

  - Pass-the-Hash (PtH) attacks

  - Installing services

  - Access token manipulation

  - Process hijacking

## Techniques

- **DLL Hijacking:** Exploiting the way Windows applications load DLLs
  to execute malicious code.

- **Password Resetting:** Using command-line tools or third-party
  software to reset passwords.

- **Remote Execution Tools:** Tools like RemoteExec, PDQ Deploy, and
  DameWare Remote Support to remotely execute commands and install
  software.

**Impact of Privilege Escalation**

- **Data Compromise:** Accessing sensitive information.

- **System Control:** Taking control of the system.

- **Malicious Software Installation:** Deploying malware.

- **Network Disruption:** Causing network outages.

## Countermeasures

Implement a privilege separation methodology to limit the scope of
programming errors and bugs.

Implement multi-factor authentication and authorization.

Patch the systems regularly.

Perform debugging using bounds checkers and stress tests.

Reduce the amount of code that runs with privilege.

Restrict the interactive logon privileges.

Run services as unprivileged accounts.

Run users and applications on the least privileges.

Test operating system and application coding errors and bugs thoroughly.

Use encryption techniques to protect sensitive data.

- **Strong Password Policies:** Enforce complex passwords and regular
  changes.

- **Regular Software Updates:** Keep systems and applications
  up-to-date.

- **Secure Configurations:** Implement security best practices and
  configurations.

- **User Access Controls:** Limit user privileges to necessary roles.

- **Network Segmentation:** Isolate sensitive systems and networks.

- **Intrusion Detection Systems:** Monitor network traffic for
  suspicious activity.

- **Regular Security Audits:** Conduct regular security assessments.

- **Employee Training:** Educate employees about security best
  practices.

# Persistence 

**Establishing Persistence**

- What is Persistence?

- Persistence by Account Manipulation

- Persistence with BITS Jobs

- Boot or Logon Autostart Execution

- Persistence Over Port Monitors

- Persistence Over Accessibility Features

- Persistence with Scripting Utilities

# Command & Control (C2)

Introduction to Command & Control

- C&C over Application Layer protocol

- C&C over Data Encoding

- C&C over Non Application layer Protocol

- C&C over Data Obfuscation

- C&C with Java Script

- C&C with PowerShell

- C&C over Could Services

## C2 UI

Multi-User

Graphical UI

API

## C2 Channels

TCP

HTTP

HTTP2

HTTP3

DNS

DoH

ICMP

FTP

IMAP

SMB

## Credential Access

**Adversary In the Middle (AITM)**

- ARP Cache Poisoning

- DHCP Spoofing

**Brute Forcing**

**Credentials Dumping**

Credential dumping refers to the act of obtaining user credentials
(username and password) from an operating system or a software. These
are normally obtained in the form of a hash or a clear text, which is
then used to perform lateral movement, access restricted information, or
to install malware. Once this is done, the attacker can login to the
system at will and access the information available in it.

**Credentials from Password Stores (Digital Vaults)**

**Forced Authentication**

**Network Sniffing**

**Windows Autologin Password command line application**

Windows Autologin Password is a useful command-line application that
enables you to manage your computer's automatic logon feature. Using a
simple command in the terminal, you can quickly dump the current
password and disable the automatic login by requesting user credentials
before jumping into the desktop screen.

<https://docs.microsoft.com/en-us/sysinternals/downloads/autologon>

**OS Credential Dumping**

Adversaries may attempt to dump credentials to obtain account login and
credential material, normally in the form of a hash or a clear text
password, from the operating system and software. Credentials can then
be used to perform Lateral Movement and access restricted information.

- **Mimikatz:** Mimikatz is a credential dumper capable of obtaining
  plaintext Windows account logins and passwords, along with many other
  features that make it useful for testing the security of networks.

- GetPassword_x64

- Carbanak

- Axiom

- Homefry

- Onionduke

- Empire
