# Microsoft Azure Security & Integration Activities

## Microsoft Defender and Security Assessments

* Conducted a Proof of Concept (POC) for Microsoft Defender capabilities.
* Onboarded on-premises and cloud servers to Microsoft Defender for Endpoint (MDE).
* Performed security posture assessments of Microsoft Entra ID (formerly Azure AD).
* Monitored compliance and security posture of Azure resources.
* Planned, designed, and implemented Microsoft Defender for Cloud.
* Implemented and managed Microsoft Entra Domain Services.

---

## Azure Traffic Routing

Implemented and managed Azure traffic routing solutions using:

* User Defined Routes (UDRs)
* Azure Virtual Network (VNet) Routing
* Azure Route Tables

Reference:
https://learn.microsoft.com/azure/virtual-network/virtual-networks-udr-overview

---

## Hybrid Connectivity

Designed and implemented hybrid connectivity solutions using:

### Azure Virtual WAN

* Provides a unified Wide Area Network (WAN) architecture.
* Connects branch offices, remote users, and on-premises environments to Azure.

### Azure ExpressRoute

* Establishes private, dedicated, high-bandwidth connectivity to Azure.
* Offers improved reliability, security, and predictable performance.

### Azure VPN Gateway

* Enables secure site-to-site and point-to-site connectivity between Azure and on-premises environments.

---

## Integration of Azure with Third-Party Security Solutions

### Cloud Security Posture Management (CSPM)

Integrated Azure environments with third-party CSPM platforms, including:

* Wiz
* Prisma Cloud
* Check Point CloudGuard
* Lacework

Capabilities included:

* Continuous security posture assessment
* Asset inventory and visibility
* Compliance monitoring
* Risk prioritization and remediation

---

### SIEM Integration

Integrated Azure with third-party SIEM platforms, including Splunk.

#### Methods for Ingesting Azure Data into Splunk

### 1. Splunk Add-ons for Microsoft Azure

#### Configuration Steps

* Configure Splunk Cloud or Splunk Enterprise indexers.
* Create an App Registration (Service Principal) in Microsoft Entra ID.
* Assign required Azure permissions.
* Install and configure the following Splunk add-ons:

##### Splunk Add-on for Microsoft Cloud Services

* Collects data from Azure services using:

  * Azure Event Hubs
  * Azure APIs
* Supports ingestion of:

  * Azure Activity Logs
  * Azure AD Logs
  * Azure Monitor Logs
  * Microsoft 365 Logs

##### Splunk Add-on for Microsoft Azure

* Focuses on Azure Monitor and Log Analytics Workspace data collection.

---

### 2. Splunk Data Manager

Provides a simplified and automated approach for Azure data onboarding.

#### Key Features

* Automated data pipeline configuration
* Simplified Azure connectivity setup
* Monitoring and health validation of ingestion pipelines
* Centralized management of Azure data sources

---

## Log Analytics Workspace (LAW) Data Export

Azure Log Analytics Workspace supports continuous export of log data to:

* Azure Storage Accounts
* Azure Event Hubs

### Configuration Steps

**Log Analytics Workspace → Settings → Data Export → Create Export Rule**

### Basic Settings

* Rule Name: export-to-splunk
* Enable rule upon creation

### Source

Select supported tables, such as:

* Alert
* AppCenterError
* ComputerGroup
* InsightMetrics
* Operation
* Usage

### Destination

#### Storage Account

* Select Subscription
* Select Storage Account

#### Event Hub

* Select Subscription
* Select Event Hub Namespace
* Select Event Hub Instance

**Note:** A maximum of 10 export rules can be configured per workspace.

Reference:
https://learn.microsoft.com/azure/azure-monitor/logs/logs-data-export

---

## Azure Event Hub Architecture

### Event Hub Namespace

An Event Hub Namespace acts as a management container for Event Hubs and provides:

* DNS-integrated endpoint
* Authentication and authorization boundary
* Shared networking and security configuration

### Event Hub

An Event Hub is a scalable event streaming platform used to send and receive telemetry data.

Key capabilities:

* Event retention
* Partitioning
* Consumer groups
* Auto-scaling
* Event Capture
* Diagnostic and audit logging

---

## Methods to Export Data from Azure

### 1. Azure Storage Accounts

Azure services can export logs and telemetry data to Storage Accounts using Diagnostic Settings.

Typical use cases:

* Long-term retention
* Archival
* Third-party integrations

### 2. Azure Event Hubs

Azure Monitor and Azure services can stream logs and events to Event Hubs.

Benefits:

* Near real-time log streaming
* Integration with SIEM, XDR, and analytics platforms
* High scalability

Typical retention periods range from 1 to 7 days, depending on configuration.

### 3. Azure REST APIs

Third-party tools can retrieve Azure data directly through Azure REST APIs.

Examples include:

* Azure Resource Management APIs
* Azure Compute APIs
* Azure Security APIs
* Microsoft Graph APIs

References:

https://learn.microsoft.com/rest/api/azure/

https://learn.microsoft.com/rest/api/compute/virtual-machines

---

## Sending Azure Logs to Third-Party CSPM Platforms

Common approaches include:

### Azure Monitor Diagnostic Settings

Configure Azure resources to forward logs and metrics to:

* Log Analytics Workspace
* Event Hub
* Storage Account

### Microsoft Sentinel Integration

* Collect and normalize Azure security data.
* Create custom connectors and integrations.
* Forward security events to external platforms.

### Logic Apps and Azure Functions

* Trigger workflows when new events are generated.
* Transform and enrich data.
* Forward logs and alerts to CSPM platforms through APIs or webhooks.

---

## Sending Azure Logs to Third-Party SIEM Platforms

Common integration methods include:

### Event Hub Integration

* Recommended and most commonly used approach.
* Supports near real-time ingestion.

### Storage Account Integration

* Suitable for batch processing and archival-based ingestion.

### API-Based Collection

* SIEM platforms query Azure APIs directly.
* Useful when streaming options are unavailable.

### Log Analytics Workspace Export

* Export selected log tables to Event Hub or Storage Account for SIEM consumption.

---

## Sending Azure Logs to Third-Party XDR Platforms

Common integration methods include:

* Azure Event Hubs
* Azure Storage Accounts
* REST APIs
* Logic Apps
* Azure Functions
* Native vendor connectors

Examples include integrations with:

* CrowdStrike Falcon
* Palo Alto Cortex XDR
* SentinelOne
* Trend Micro Vision One
* Microsoft Defender XDR

---

## Azure Monitor Integration with Third-Party Platforms

### Azure Diagnostic Settings

Azure Monitor provides Diagnostic Settings to collect and route:

* Logs
* Metrics
* Activity Logs

Supported destinations:

* Log Analytics Workspace
* Event Hub
* Storage Account
* Azure Partner Solutions

---

### Azure Activity Logs

Azure Activity Logs capture management-plane operations, including:

* Resource creation
* Resource deletion
* Configuration changes
* Role assignments
* Subscription-level operations

These logs can be forwarded using Diagnostic Settings.

Reference:
https://learn.microsoft.com/azure/azure-monitor/essentials/activity-log

---

## Common Third-Party Integration Architecture

Azure Resource → Diagnostic Settings → Event Hub / Storage Account → Third-Party SIEM, CSPM, or XDR Platform

This architecture provides scalable, secure, and near real-time integration with external security monitoring and governance solutions.
