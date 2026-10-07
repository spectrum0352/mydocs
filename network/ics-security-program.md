# Industrial Control System (ICS) / Operational Technology (OT) Security Assessment Guide

## How to Evaluate Security Program Maturity

To establish a baseline and systematically evaluate the maturity of an Industrial Control System (ICS) / Operational Technology (OT) security program, follow these core steps:

1. **Secure Executive Leadership Buy-In:** Obtain official sponsorship and support from executive leadership to conduct an internal security program maturity review.
2. **Form a Cross-Functional Review Team:** Identify key personnel across Information Technology (IT), Information Security (InfoSec), and Operational Technology (OT) teams to perform the assessment.
3. **Review Core Domains:** Systematically analyze each section and its key technical and operational topics.
4. **Assign Objective Ratings:** Provide an honest, evidence-based grade for how effectively each topic is currently managed within the enterprise and control network.
5. **Prioritize Strategic Recommendations:** Use the assessment grading to build a risk-ranked roadmap of recommendations for leadership.
6. **Brief Executive Leadership:** Present findings, risk profile, and recommended investments to executive leadership to obtain strategic direction and resource allocation.
7. **Brief Operational & Technical Teams:** Align IT, InfoSec, and OT stakeholders on findings, remediations, and upcoming governance changes.

---

## 1. Policies (`ID.GV` — Governance)

### Challenge & Context

Traditional IT-focused standards, guidelines, and procedures built from corporate security policies are often incompatible with control network environments:

* **Password Management:** Enterprise-wide automated password rotation or aggressive lockout policies can disrupt human-machine interfaces (HMIs) or lock out operators during critical process events.
* **Incident Response (IR) Plans:** IT containment strategies—such as automatically isolating or shutting down infected hosts without warning—can trigger unsafe physical process conditions, cause equipment damage, or lead to catastrophic safety hazards.

### Approach & Remediation

* **Policy Adaptation:** Adapt corporate policies to address control-network-specific operational safety, availability, and process resiliency requirements.
* **Framework Alignment:** Establish guidance aligned with the core functions of the NIST Cybersecurity Framework (CSF): **Identify**, **Protect**, **Detect**, **Respond**, and **Recover**.
* **Detailed Standards Baseline:** Map policy mandates to specialized industrial standards, including:
* **IEC 62443:** Security for industrial automation and control systems.
* **NIST SP 800-82 Rev. 2 / Rev. 3:** Guide to Industrial Control Systems (ICS) Security.
* **ISO/IEC 27001:** Information security management systems.



---

## 2. Network Segmentation and Isolation (`PR.AC` — Access Control)

### Network Boundaries

Robust segmentation isolates the business network from industrial operations to prevent lateral threat movement.

* **Purdue Model Alignment:** Clearly demarcate boundaries between Level 3/3.5 (Industrial Zone / DMZ) and Level 4/5 (Enterprise Network / Cloud).

### Key Boundary Crossings & Restrictions

* **Remote Access:** Control and closely audit all remote pathways used by operators, engineers, integrators, original equipment manufacturers (OEMs), vendors, and Managed Service Providers (MSPs).
* **Internet Access:** Eliminate direct outbound Internet paths from critical control networks. Strictly define, monitor, and proxy any required internet pathways (e.g., software update repositories or threat intelligence feeds).
* **Cloud Access:** Audit vendor, integrator, and industrial IoT (IIoT) cloud pathways used for predictive maintenance, telemetry, or remote management to ensure zero direct connectivity to core control loops.

---

## 3. Access Control (`PR.AC` — Access Control)

Access control manages identity verification and authorization across all hardware, software, and network assets in the control environment.

### Core Safeguards

* **Control Network Credentials:** Identity systems must be strictly isolated. The OT domain (e.g., OT Active Directory) must **not** establish trust relationships, sync, or share administrative domains with enterprise corporate networks.
* **Multi-Factor Authentication (MFA):** Deploy dedicated MFA for OT systems. The authentication infrastructure (such as MFA servers or tokens) must be managed independently from enterprise corporate authentication systems.
* **Vendors and Integrators:** Third-party accounts must be enforceably restricted using Least Privilege principles tailored to specific roles, assets, and operational windows. **Strictly prohibit direct, unmediated inbound Internet access.**
* **Managed Service Providers (MSPs):** Where MSP services overlap between enterprise and OT, enforce separate credentials, mandatory MFA, and route connections through a jump server/bastion architecture in the Industrial DMZ (IDMZ).
* **Service Accounts:** Non-human service accounts for applications, databases, and middle-layer services must never reuse credentials across corporate and control environments.

> **CRITICAL NOTE:** Continuous monitoring and logging of credential usage and MFA interactions represent the single most important step in verifying that access control functions effectively as an active defense mechanism.

---

## 4. Logging and Monitoring (`DE.AE` — Anomalies and Events)

Establish structured visibility by prioritizing log collection from network pathways down to host systems, followed by central aggregation and security analysis.

```
       [ Central Correlation & SOC Monitoring ]
                         ▲
                         │
      ┌──────────────────┴──────────────────┐
      │                                     │
[ System Events ]                   [ Network Events ]
• Active Directory                  • IPFIX / NetFlow
• Syslog (*nix, PLCs, Field)        • Boundary Activity
• Windows Event Logs                • Span Ports & Taps
• DNS Query Logs                    • Network Security Monitoring (NSM)

```

### Implementation Categories

#### 1. Network Events

* **IP Flow Export:** Collect IPFIX, NetFlow, or sFlow metrics to baseline network communication patterns.
* **Boundary Activity:** Monitor ingress/egress traffic at firewalls, jump hosts, and IDMZ gateways.
* **Device Monitoring Configurations:** Implement passive physical network TAPs and SPAN/mirror ports on core industrial switches.
* **Network Security Monitoring (NSM):** Utilize specialized ICS/OT Deep Packet Inspection (DPI) tools to monitor industrial protocols (e.g., Modbus, DNP3, EtherNet/IP, PROFINET).

#### 2. System Events

* **Directory Services:** Track Windows Active Directory authentication and object modifications within the OT domain.
* **Domain Name System (DNS):** Log DNS queries and responses to identify anomalous outbound requests or command-and-control (C2) activity.
* **Host Logs:** Collect Windows Event Logs (Security, System, Application) from HMIs, Historians, and Engineering Workstations (EWS).
* **Industrial Syslog:** Capture Syslog data from Unix/Linux hosts, network hardware, Programmable Logic Controllers (PLCs), Remote Terminal Units (RTUs), and intelligent field devices where supported.

#### 3. Managed Logging and Monitoring

* **Central Windows Logging:** Standardize collection using Windows Event Forwarding (WEF) or central agents to an OT-side log collector.
* **Central Syslog Aggregation:** Direct Linux, UNIX, and embedded device logs to an isolated central Syslog server.
* **Security Operations Center (SOC) Integration:** Stream normalized event logs into a Security Information and Event Management (SIEM) or Security Orchestration, Automation, and Response (SOAR) platform for real-time threat detection, alerting, and incident response.

---

## 5. Asset Inventory Management (`ID.AM` — Asset Management)

Accurate asset inventory is the foundational requirement for vulnerability management, risk assessment, and incident response.

### Discovery Methodologies

1. **Physical Walkdowns:** Hands-on visual inspection of cabinets, racks, field junction boxes, and nameplates.
2. **Passive Network Monitoring:** Non-intrusive traffic analysis via SPAN/TAPs to identify communicating devices without impacting sensitive operational traffic.
3. **Active Monitoring / Querying:** Carefully controlled, low-frequency, protocol-aware queries targeting devices capable of safely handling active requests.
4. **Configuration Analysis:** Parsing project files, PLC program backups, network device configurations, and firewall rule bases.

### Asset Classifications

* **Control Hardware:** PLCs, RTUs, IEDs (Intelligent Electronic Devices), Safety Instrumented Systems (SIS), and Field Devices.
* **Network Infrastructure:** Managed switches, routers, industrial firewalls, security gateways, and media converters.
* **Servers and Workstations:** HMIs, Historians, Engineering Workstations (EWS), OPC Servers, and Domain Controllers.
* **Process Control Software:** Supervisory control applications, SCADA engines, and programming/configuration suites.
* **General Software:** Operating systems, firmware releases, databases, utilities, and security agents.
* **Transient Devices:** Vendor laptops, engineering notebooks, calibration tools, and diagnostic tablets introduced periodically into the plant floor.
* **Removable Media:** USB flash drives, external hard drives, SD cards, and portable media used for air-gapped updates or data extraction.
