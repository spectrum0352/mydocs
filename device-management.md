# Device Management in Microsoft Defender for Endpoint (MDE)

## Overview

Device Management in **Microsoft Defender for Endpoint (MDE)** enables organizations to onboard, monitor, secure, organize, and offboard endpoints throughout their lifecycle. It provides centralized visibility into managed and unmanaged devices, supports vulnerability assessment, and enables security teams to investigate and respond to threats.

Device management capabilities are available through the **Microsoft Defender XDR portal**.

---

# Device Management Capabilities

Microsoft Defender for Endpoint provides the following capabilities:

* Device onboarding
* Device inventory
* Device discovery
* Device groups
* Device tagging
* Device isolation
* Device offboarding
* Vulnerability management
* Endpoint detection and response (EDR)
* Security policy management
* Attack Surface Reduction (ASR)
* Automated investigation and remediation

---

# Supported Operating Systems

Microsoft Defender for Endpoint supports:

* Windows 11
* Windows 10
* Windows Server 2012 R2*
* Windows Server 2016
* Windows Server 2019
* Windows Server 2022
* Windows Server 2025
* macOS
* Linux
* Android
* iOS/iPadOS

> *Some older operating systems have limited feature support. Always verify support against the latest Microsoft documentation.

---

# Device Onboarding

Device onboarding installs the Microsoft Defender for Endpoint sensor on supported devices so they can communicate with the Defender cloud service.

Navigate to:

**Microsoft Defender XDR → Settings → Endpoints → Device Management → Onboarding**

---

## Supported Deployment Methods

### Windows

* Microsoft Intune (**Recommended**)
* Microsoft Configuration Manager (ConfigMgr)
* Group Policy
* Local Script (up to 10 devices; suitable for testing)
* Virtual Desktop Infrastructure (VDI) onboarding

### Linux

* Local installation script
* Ansible
* Puppet
* Chef
* SaltStack

### macOS

* Microsoft Intune
* JAMF Pro
* Manual deployment

### Mobile Devices

* Microsoft Intune
* Microsoft Defender for Endpoint mobile application

---

## General Onboarding Process

1. Verify operating system prerequisites.
2. Select the operating system.
3. Choose the deployment method.
4. Download the onboarding package.
5. Deploy the package to target devices.
6. Verify successful onboarding.
7. Run the Microsoft detection test.
8. Confirm that devices appear in the Defender portal.

---

# Device Discovery

Device Discovery identifies unmanaged devices connected to the corporate network.

Navigate to:

**Microsoft Defender XDR → Settings → Endpoints → Device Discovery**

Device Discovery improves visibility into:

* Unmanaged workstations
* Servers
* Network appliances
* Printers
* IoT devices
* Network infrastructure

---

## Discovery Modes

### Basic Discovery

* Passive discovery only
* Uses telemetry collected from onboarded endpoints
* Minimal network traffic

### Standard Discovery

* Passive discovery
* Smart active probing
* Rich device identification
* Improved device inventory

Discovery can be configured for:

* All onboarded devices
* Selected device tags

---

## Device Discovery Exclusions

Exclude sensitive systems from active probing by specifying:

* Individual IP addresses
* IP ranges
* Subnets

Examples include:

* Industrial Control Systems (ICS)
* Medical devices
* Honeypots
* Legacy systems

---

# Authenticated Scanning

Authenticated scans enable Microsoft Defender Vulnerability Management to assess unmanaged devices.

Supported authentication methods include:

* SNMP Community String
* SNMPv3 NoAuthNoPriv
* SNMPv3 AuthNoPriv
* SNMPv3 AuthPriv

Scan frequency options include:

* Hourly
* Every 4 hours
* Every 8 hours
* Every 12 hours
* Daily

---

# Device Inventory

After onboarding, devices appear under:

**Assets → Devices**

The inventory includes:

* Device name
* Operating system
* Exposure level
* Risk level
* Security recommendations
* Active alerts
* Vulnerabilities
* Software inventory
* Device tags
* Assigned device group

---

# Device Groups

Device Groups allow administrators to organize endpoints and apply Role-Based Access Control (RBAC).

Navigate to:

**Settings → Endpoints → Permissions → Device Groups**

Common grouping criteria include:

* Operating System
* Domain
* Device Name
* Device Tag
* Microsoft Entra Group
* Cloud Provider
* Device Risk

Device Groups are commonly used to:

* Restrict analyst access
* Apply remediation levels
* Delegate administration
* Organize devices by business unit

---

# Device Tags

Device Tags help categorize endpoints.

Examples include:

* Production
* Development
* Finance
* HR
* Domain Controllers
* Servers
* Workstations
* High Value Assets

Tags can be:

* Manual
* Dynamic
* Assigned through Intune
* Assigned through Configuration Manager

---

# Device Isolation

Device Isolation disconnects compromised endpoints from the corporate network while maintaining communication with Microsoft Defender.

Isolation options include:

* Full Isolation
* Selective Isolation

Typical use cases:

* Active ransomware
* Malware outbreaks
* Credential theft
* Lateral movement
* Incident containment

---

# Device Offboarding

Device offboarding removes endpoints from Microsoft Defender for Endpoint management.

Navigate to:

**Settings → Endpoints → Device Management → Offboarding**

Supported deployment methods generally mirror onboarding methods:

* Microsoft Intune
* Microsoft Configuration Manager
* Group Policy
* Local Script

### Important Notes

* Offboarding packages expire **3 days** after download.
* Expired packages cannot be used.
* Devices remain visible in the portal until the data retention period expires.

---

# Device Health Monitoring

Administrators should regularly monitor:

* Sensor health
* Antivirus status
* EDR status
* Security intelligence version
* Platform version
* Engine version
* Device connectivity
* Last check-in time
* Tamper Protection status

---

# Device Sensors

On Windows, Microsoft Defender for Endpoint primarily uses:

* **MsSense.exe** — Microsoft Defender for Endpoint sensor
* **MsMpEng.exe** — Microsoft Defender Antivirus engine
* **SenseIR.exe** — Investigation and Response component (where applicable)

On Linux:

* **mdatp**

These components collect telemetry, detect threats, and communicate securely with Microsoft Defender XDR.

---

# Device Onboarding Validation

After onboarding:

1. Verify the device appears in the Microsoft Defender portal.
2. Confirm the sensor is healthy.
3. Verify security policies are applied.
4. Run the Microsoft Defender detection test.
5. Confirm an alert is generated.
6. Verify EDR is operating correctly.

---

# Can Network Devices Be Onboarded?

Routers, switches, firewalls, and other network appliances **cannot be directly onboarded** to Microsoft Defender for Endpoint.

However, Defender can:

* Discover network devices
* Assess vulnerabilities
* Monitor device inventory

Network telemetry can also be integrated through:

* Microsoft Sentinel
* Syslog
* Common Event Format (CEF)
* Third-party SIEM integrations

---

# Best Practices

* Deploy using Microsoft Intune whenever possible.
* Begin with a pilot deployment before organization-wide rollout.
* Use Device Groups for RBAC.
* Use Device Tags to simplify management.
* Enable Tamper Protection.
* Enable Device Discovery.
* Monitor onboarding health regularly.
* Validate onboarding using Microsoft's detection test.
* Remove stale or inactive devices periodically.
* Keep Defender platform, engine, and security intelligence versions up to date.
* Integrate Microsoft Defender Vulnerability Management for continuous risk assessment.
* Review device exposure and security recommendations regularly.

---

# Summary

Microsoft Defender for Endpoint Device Management provides centralized lifecycle management for enterprise endpoints. Through onboarding, discovery, inventory management, device grouping, vulnerability assessment, endpoint protection, and offboarding, organizations gain comprehensive visibility and control over their endpoint security posture. Integrating MDE with Microsoft Intune, Microsoft Defender XDR, and Microsoft Entra ID enables a scalable, Zero Trust approach to endpoint management and threat protection.
