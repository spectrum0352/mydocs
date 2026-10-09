# IOC Blocking Using SOAR Playbooks (Microsoft Sentinel, Microsoft Defender XDR, Microsoft Entra ID, Azure Logic Apps)

## Overview

Indicators of Compromise (IOCs) are artifacts that identify potentially malicious activity within an environment. Common IOC types include:

* IP addresses
* Domains
* URLs
* File hashes (SHA1, SHA256, MD5)
* Email addresses
* File names
* Certificates
* Registry keys
* Process names

Security Orchestration, Automation, and Response (SOAR) enables organizations to automatically respond to detected threats by executing predefined workflows. Within the Microsoft security ecosystem, **Microsoft Sentinel** acts as the orchestration platform, while **Azure Logic Apps** execute automation workflows and products such as **Microsoft Defender XDR**, **Microsoft Entra ID**, **Azure Firewall**, and third-party security solutions enforce the actual blocking actions.

Automated IOC blocking reduces attacker dwell time, minimizes manual intervention, improves response consistency, and enables rapid containment of threats.

---

# Solution Architecture

```text
Threat Detection
        │
        ▼
Microsoft Sentinel Incident
        │
Automation Rule
        │
        ▼
Azure Logic App
        │
        ├── Validate IOC
        ├── Check Threat Intelligence
        ├── Approval (Optional)
        ├── Block IOC
        ├── Notify SOC
        └── Update Incident
```

---

# Planning

## Objectives

* Automatically contain high-confidence threats.
* Reduce Mean Time to Respond (MTTR).
* Standardize incident response procedures.
* Minimize repetitive manual tasks.
* Improve consistency across the Security Operations Center (SOC).
* Maintain complete audit trails for automated actions.

---

## Define the Scope

Identify the IOC sources that will trigger automated responses.

### Detection Sources

* Microsoft Sentinel incidents
* Microsoft Defender XDR alerts
* Microsoft Defender for Endpoint
* Microsoft Defender for Office 365
* Microsoft Defender for Identity
* Microsoft Defender for Cloud
* Microsoft Defender for Cloud Apps
* Microsoft Defender Threat Intelligence
* External Threat Intelligence Platforms (TIPs)
* SIEM-integrated third-party security products

---

## Identify Enforcement Points

Determine where IOCs should be blocked.

| IOC Type      | Enforcement Point                                                                       |
| ------------- | --------------------------------------------------------------------------------------- |
| IP Address    | Azure Firewall, NSG, Microsoft Defender for Endpoint, third-party firewalls             |
| Domain        | Microsoft Defender for Endpoint, Secure Web Gateway, DNS filtering                      |
| URL           | Microsoft Defender for Endpoint, Defender for Office 365 Safe Links, Secure Web Gateway |
| File Hash     | Microsoft Defender for Endpoint Custom Indicators                                       |
| Email Address | Defender for Office 365, Exchange Online Protection                                     |
| User Account  | Microsoft Entra ID                                                                      |
| Device        | Microsoft Defender for Endpoint Device Isolation                                        |

---

## Design Considerations

Before implementation, define:

* IOC confidence thresholds
* Approval workflow requirements
* Indicator expiration (TTL)
* Automatic rollback procedures
* Incident severity mapping
* Logging and auditing requirements
* Notification channels
* Exception handling
* Error recovery
* API throttling limits
* Integration with ticketing platforms

---

# Prerequisites

## Microsoft Licensing

Recommended licensing includes:

* Microsoft Sentinel
* Microsoft Defender XDR
* Microsoft Defender for Endpoint Plan 2
* Microsoft Defender for Office 365 Plan 2
* Microsoft Defender for Identity
* Microsoft Defender for Cloud Apps (optional)
* Microsoft Entra ID P1 or P2
* Azure Logic Apps

---

## Azure Components

* Log Analytics Workspace
* Microsoft Sentinel Workspace
* Azure Logic Apps
* Managed Identity
* Azure Key Vault (recommended)
* Azure Monitor

---

## Required Connectors

Configure the necessary connectors in Microsoft Sentinel.

* Microsoft Defender XDR
* Microsoft Defender for Endpoint
* Microsoft Defender for Office 365
* Microsoft Entra ID
* Microsoft Defender Threat Intelligence
* Azure Firewall
* Azure Activity
* Microsoft Teams
* ServiceNow (optional)
* Jira (optional)
* ITSM Connector (optional)

---

## Required Permissions

Typical RBAC roles include:

* Microsoft Sentinel Responder
* Microsoft Sentinel Contributor
* Logic App Contributor
* Security Administrator
* Global Reader
* Defender Security Operator
* Azure Firewall Contributor (if modifying firewall rules)

Follow the principle of least privilege whenever possible.

---

# Implementation

## Typical SOAR Workflow

```text
Alert Generated
        │
        ▼
Sentinel Incident Created
        │
        ▼
Automation Rule
        │
        ▼
Logic App Triggered
        │
        ▼
Extract IOC
        │
        ▼
IOC Validation
        │
        ▼
Threat Intelligence Lookup
        │
        ▼
Confidence Evaluation
        │
 ┌──────┴─────────┐
 │                │
High          Low/Unknown
 │                │
 ▼                ▼
Block        Analyst Review
 │
 ▼
Update Incident
 │
 ▼
Notify SOC
```

---

# IOC Validation

Before blocking an IOC, validate:

* IOC format
* IOC type
* Threat intelligence reputation
* Existing allowlists
* Existing blocklists
* IOC age
* Confidence score
* Incident severity
* Business impact

Avoid automatically blocking low-confidence indicators.

---

# IOC Blocking Actions

## Block Malicious IP Addresses

Possible actions include:

* Add IP to Azure Firewall deny rules
* Add IP to Network Security Group rules
* Block using Secure Web Gateway
* Update proxy blocklists
* Add to Defender for Endpoint indicators
* Add to Microsoft Sentinel watchlists
* Push to third-party firewalls

---

## Block Malicious Domains

Possible actions include:

* Create Defender for Endpoint custom indicators
* Update DNS filtering
* Update Secure Web Gateway policies
* Update Azure Firewall application rules
* Block via Defender for Cloud Apps
* Block via third-party proxy solutions

---

## Block Malicious URLs

Possible actions include:

* Create URL indicators in Defender for Endpoint
* Block using Defender for Office 365 Safe Links
* Update Secure Web Gateway
* Update web proxy policies

---

## Block Malicious File Hashes

Possible actions include:

* Create Defender for Endpoint custom indicators
* Automatically quarantine files
* Trigger antivirus scans
* Initiate endpoint investigation

---

## Identity-Based Containment

Possible actions include:

* Disable compromised user account
* Revoke refresh tokens
* Force password reset
* Require MFA registration
* Block sign-in
* Apply Conditional Access policies
* Increase user risk level

---

## Endpoint Containment

Using Microsoft Defender for Endpoint:

* Isolate endpoint
* Collect investigation package
* Run antivirus scan
* Stop malicious process
* Remove malicious file
* Initiate Live Response session

---

# Integration Points

## Microsoft Sentinel

* Incident orchestration
* Automation Rules
* Watchlists
* Incident updates
* Threat Intelligence integration

---

## Azure Logic Apps

Responsible for:

* Workflow orchestration
* API execution
* Conditional logic
* Error handling
* Notifications
* Integration with Microsoft and third-party products

---

## Microsoft Defender XDR

Provides:

* Custom Indicators
* Device Isolation
* Antivirus actions
* Endpoint investigations
* Automated remediation

---

## Microsoft Entra ID

Provides identity response actions:

* Disable accounts
* Reset passwords
* Revoke sessions
* Apply Conditional Access
* Block sign-in

---

## Azure Firewall

Provides:

* Network rule updates
* Application rule updates
* IP blocking
* FQDN blocking

---

# Operations

## Monitoring

Monitor:

* Playbook execution status
* Logic App failures
* API failures
* Automation Rule execution
* Blocked IOC statistics
* Incident response timelines

---

## Maintenance

Regularly:

* Review playbook logic
* Update API connections
* Rotate secrets
* Review expired indicators
* Remove obsolete rules
* Test integrations

---

## Governance

Establish governance for:

* Change management
* Approval workflows
* Exception handling
* Audit logging
* RBAC reviews
* Compliance reporting

---

# Metrics and KPIs

Recommended metrics include:

* Mean Time to Detect (MTTD)
* Mean Time to Respond (MTTR)
* Number of automated responses
* Percentage of automated incidents
* IOC validation success rate
* False positive rate
* Playbook execution success rate
* Logic App failure rate
* Analyst time saved
* Indicator expiration compliance

---

# Best Practices

* Deploy playbooks in a development environment before production.
* Validate IOC reputation before initiating blocking actions.
* Implement approval workflows for high-impact responses.
* Use Time-to-Live (TTL) for temporary indicators.
* Maintain centralized allowlists and blocklists.
* Store secrets in Azure Key Vault instead of within Logic Apps.
* Use Managed Identities instead of service principals whenever possible.
* Implement retry logic for transient API failures.
* Document all automated response actions.
* Continuously tune playbooks to reduce false positives.
* Monitor Microsoft API rate limits and connector health.
* Review automation effectiveness on a regular basis.

---

# Risks and Mitigations

| Risk                  | Potential Impact               | Mitigation                                               |
| --------------------- | ------------------------------ | -------------------------------------------------------- |
| False positives       | Legitimate services blocked    | Validate IOC confidence and implement approval workflows |
| Overblocking          | Business disruption            | Use allowlists, TTL, and scoped policies                 |
| API failures          | Incomplete automation          | Implement retries, error handling, and monitoring        |
| Excessive permissions | Privilege abuse                | Apply least privilege and Managed Identities             |
| Connector failures    | Automation interruption        | Continuously monitor connector health                    |
| Expired indicators    | Reduced security effectiveness | Periodically review and remove stale indicators          |

---

# Cost Considerations

Consider the operational costs associated with:

* Microsoft Sentinel data ingestion and retention
* Microsoft Sentinel automation execution
* Azure Logic Apps (per trigger and action)
* Azure Firewall policy updates
* Microsoft Defender XDR licensing
* Microsoft Entra ID licensing
* Azure Monitor and Log Analytics
* Third-party threat intelligence subscriptions

---

# Summary

Microsoft Sentinel provides the orchestration layer for automated incident response, while Azure Logic Apps execute response workflows and integrated Microsoft security products perform the enforcement actions. By combining Microsoft Sentinel, Microsoft Defender XDR, Microsoft Entra ID, Azure Firewall, and threat intelligence, organizations can build scalable SOAR playbooks that rapidly validate, contain, and remediate threats while maintaining governance, auditability, and operational efficiency.
