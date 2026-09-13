# OT Hacking 

## OT Concepts 

> **OT (Operational technology)** - This is a term that is used to describe the hardware and software that monitors and controls physical processes, devices, and infrastructure. Operational technology systems are found across a large range of asset-intensive sectors, performing a wide variety of tasks ranging from monitoring critical infrastructure (CI) to controlling robots on a manufacturing floor. OT is used in a variety of industries including manufacturing, oil and gas, electrical generation and distribution, aviation, maritime, rail, and utilities.
>
> **ICS (Industrial Control System)** - This is a general term that encompasses several types of control systems, including SCADA and DCS. The ICS consists of combinations of control components, like electrical, hydraulic, and mechanical, that act together to achieve an industrial objective (i.e.- manufacturing).
>
> **DCS (Distributed Control System)** - This refers to the control achieved by intelligence that is distributed about the process to be controlled, rather than controlled by a centrally located single unit. These are often large-scale systems that are used to automate thousands of I/O points in large facilities, like chemical plants and oil and gas refineries.
>
> **SCADA (Supervisory Control and Data Acquisition)** - This is a generic name for a system that is capable of gathering and processing data, and applying operational controls over long distances. The term SCADA mainly refers to a grouping of many ICS types in a wide geographic area. Examples of SCADA environments include water utilities, gas pipelines, and power transmission and distribution systems.
>
> **PLC (Programmable Logic Controllers)** - This is considered the “workhorse” of the industrial automation space. The microcontroller is the brain of the PLC where the firmware and set points exist. Set points are variables that are configured for use by the running program. These are manually or dynamically changed by the state of the process.
>
> **HMI (Human-Machine Interface)** - The HMI provides a graphical depiction of all of the automatic control points for a process, which is beneficial to attackers. An attacker interacting with the HMI via RDP is considered a “noisy” type of network attack, but the attacker could hide since the interaction with the HMI might look the same as an authorized operator.

## OT Attacks 

- Physical Attacks

- Wireless Attacks - wireless networks, ZigBee, etc

- Social Engineering

- USB

- Supply Chain - Infecting a vendor application or firmware.

- Malware

- Zero-Day

- Insider Threat

- MitM (Man-in-the-Middle)

> **OT Hacking Methodology** - You want to avoid actively pentesting production ICS networks as even running nmap scans can take down the network. Ideally, you will perform testing in a development network that closely mimics the production ICS network.

Start with Recon

- Discover Scripts tool

- Google Hacking Database

- Maltego

- Shodan

> **External Testing** - Identify and exploit the IT network and use that to gain access to the ICS network. The standard pentesting methodology applies for external testing.

- Foot printing

- Host Discovery/Port Scanning/Service Enumeration

- Vulnerability Mapping - This is where you match the discovered services with known vulnerabilities.

- Exploitation - Exploiting the known vulnerabilities.

- Zero-Day - Discover and exploit Zero-Day vulnerabilities. Note: This depends on the scope and time of the engagement.

Pentesting Tools for ICS Environments

- SamuraiSTFU - This is a pentesting Linux distro like Kali, but it’s specifically designed for ICS pentesting.

- Kali Linux

- Metasploit

> CORE Impact

- Immunity CANVAS

- Exploit Pack

- Peach - fuzzing tool

- Shodan

- Discover Scripts

- Maltego

- Google Hacking Database

- Netcat

- Nping

- Scapy

- Nmap

- Hping3

- Nessus

- Nexpose

## Countermeasures 

#### OT Security Best Practices 

> 1\) Increase network visibility- Identify Assets, Classify, and Prioritize Value of your assets 2) Segment networks- Ensure each zone is accessible only by authorized devices, applications, and users. (Segmentation is a fundamental best practice for securing OT, as described in ISA/IEC-62443)

3)  Analyze traffic for threats - use a NGFW and SIEM

4)  Enforce identity and access management - RBAC, MFA, SSO

5)  Secure both wired and wireless access - use a NGFW for centralized security management
