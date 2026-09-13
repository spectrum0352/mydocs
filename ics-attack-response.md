# Industrial Control System (ICS) / Operational Technology (OT) Incident Response Plan

## Overview: Incident Response (NIST CSF: RS.RP)

Investigating suspicious activity and responding to a compromise within an Industrial Control System (ICS) or Operational Technology (OT) environment requires direct coordination between IT, InfoSec, OT, and physical security teams. Unlike traditional IT environments where containment often means immediate system isolation, OT incident response must prioritize **human safety**, **environmental protection**, and **operational continuity**.

---

> ### ⚠️ Critical Safety & Operational Directive
> 
> 
> **Containment vs. Eradication in OT Environments:**
> Due to life safety, environmental compliance, and continuous manufacturing requirements, compromised control networks may need to remain operational in a contained state for extended periods (weeks or months). Full eradication and rebooting of primary controllers (PLCs, RTUs, DCS) often cannot occur until the next scheduled maintenance outage. All IR procedures must account for long-term containment strategies without disrupting critical safety instrumented systems (SIS).

---

## 1. Preparation & Response Readiness

Assessing organizational IR maturity requires verifying that fundamental preparation measures, specialized tools, and key relationships are established prior to an event.

### Organizational Architecture & Contacts

| Component | Key Requirements | Verification / Status |
| --- | --- | --- |
| **Roles & Responsibilities** | Defined operational chain of command across IT, InfoSec, OT/Automation Engineers, Plant Operations, Safety, and Legal. | [ ] Assigned |
| **Key Contact Roster** | Maintained call tree with primary/secondary points of contact, alternate communication methods (out-of-band/satellite), and emergency escalations. | [ ] Maintained |
| **Out-of-Band War Room** | Dedicated physical location and secure, out-of-band digital communication channels (isolated conference lines, encrypted messaging) independent of corporate IT infrastructure. | [ ] Configured |
| **Vendor & MSP Retainers** | Active Service Level Agreements (SLAs) with System Integrators, Managed Service Providers (MSPs), and Original Equipment Manufacturers (OEMs) for emergency support. | [ ] Contracted |
| **Third-Party IR Retainers** | Pre-negotiated agreements with specialized OT forensic and cyber incident response service providers for rapid staff augmentation. | [ ] Contracted |

### Field Readiness & Triage Execution

* **OT Incident Response Jump Bag:** Maintain pre-configured, air-gapped hardware and software suites tailored to control network architectures.
* *Hardware:* Write-blocked forensic storage devices, industrial network taps/SPAN cables, multi-interface serial-to-USB adapters, isolated analysis laptops, and direct-connect PLC interface cables.
* *Software:* Network packet analyzers (e.g., Wireshark with ICS dissectors), memory dump utilities, PLC project file comparison software, and offline threat intelligence databases.


* **ICS Triage & Forensic Team:** A cross-functional team trained in industrial protocols, physical safety protocols, forensic artifacts on embedded devices, and control network topology.
* **Regulatory & Legal Notification Framework:** Documented mandates for reporting events to sector-specific authorities (e.g., CISA, NERC CIP, TSA Pipeline Security Guidelines, or local regulatory bodies) within required timeframes.

---

## 2. Tabletop Exercise (TTX) Scenarios

To validate cross-departmental readiness, conduct regular tabletop exercises involving IT, InfoSec, OT Engineering, Operations, and Physical Security.

### Scenario 1: Ransomware on Control Asset Management Server

* **Trigger:** An operator logs into an Asset Management Server (AMS) inside the Purdue Model Level 2/3 network and discovers a ransomware note on the desktop, with encrypted engineering project files.
* **Focus Areas:** Isolating Level 3 management networks from Level 2/1 control networks without tripping processes; verifying offsite/air-gapped engineering backups; maintaining manual override capabilities.

### Scenario 2: Suspected Lateral Movement / Credential Misuse

* **Trigger:** Network monitoring logs reveal an domain administrator account authenticating across multiple Windows-based Human-Machine Interfaces (HMIs) and Engineering Workstations (EWS) in rapid succession across the OT zone.
* **Focus Areas:** Determining whether activity represents authorized vendor maintenance or active lateral movement; implementing non-disruptive session revocation; capturing volatile memory without taking HMIs offline.

### Scenario 3: Unauthorized Interactive HMI Manipulation

* **Trigger:** Plant floor operators report observing local HMI cursor movement and parameter changes that do not originate from physical operator input or scheduled automation logic.
* **Focus Areas:** Immediate severance of remote access pathways (VPNs, jump boxes); switching control loops to manual mode at local control panels; capturing live network traffic to identify command injection sources.

### Scenario 4: "Living off the ICS Land" / Protocol Anomaly

* **Trigger:** Network anomaly detection sensors report an abnormal spike in industrial protocol traffic (e.g., OPC, IEC 60870-5-104, Modbus/TCP, Ethernet/IP) containing uncommon function codes (e.g., PLC stop commands, firmware updates).
* **Focus Areas:** Inspecting deep packet inspection (DPI) logs; correlating protocol commands with active physical process anomalies; isolating rogue controllers or rogue engineering stations.

### Scenario 5: Blended Physical & Cyber Intrusion

* **Trigger:** Physical security detects a breach in the perimeter fence near an unstaffed remote terminal unit (RTU) enclosure or field substation. Subsequent investigation reveals a rogue hardware device connected directly to an internal switch port.
* **Focus Areas:** Joint physical security and OT response; isolating the compromised local network segment via managed switches; validating the integrity of logic running on nearby field devices.

---

## 3. Incident Response Workflow Execution Phase

```
  +-------------------------------------------------------------+
  |                      1. IDENTIFICATION                      |
  |  - Monitor ICS alerts, safety systems, and process loops    |
  |  - Triage anomaly vs. mechanical/operational failure        |
  +------------------------------+------------------------------+
                                 |
                                 v
  +-------------------------------------------------------------+
  |                       2. CONTAINMENT                        |
  |  - Isolate IT/OT boundaries (Sever firewall access)         |
  |  - Shift to manual operational control if safe to do so     |
  |  - Maintain process uptime in a controlled, monitored state |
  +------------------------------+------------------------------+
                                 |
                                 v
  +-------------------------------------------------------------+
  |                  3. ERADICATION & RECOVERY                  |
  |  - Schedule device reflashing during planned maintenance    |
  |  - Verify PLC/RTU logic against clean golden images         |
  |  - Safely restore automated control in coordinated phases   |
  +-------------------------------------------------------------+

```
