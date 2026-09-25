# Azure Service URLs Commonly Targeted During Cyber Attacks and Data Breaches

> **Purpose:**
> This reference provides common Azure service URL patterns that are frequently observed during cloud reconnaissance, credential theft, privilege escalation, persistence, lateral movement, and data exfiltration activities. The URLs themselves are legitimate Microsoft Azure services; security risks arise when attackers abuse compromised credentials, exposed secrets, vulnerable applications, or misconfigurations.

---

## Table of Contents

* [Identity & Access Management](#1-identity--access-management)
* [Compute Services](#2-compute-services)
* [Storage Services](#3-storage-services)
* [Database Services](#4-database-services)
* [Secrets Management](#5-secrets-management)
* [Messaging & Integration](#6-messaging--integration)
* [API & Developer Services](#7-api--developer-services)
* [Analytics & AI Services](#8-analytics--ai-services)
* [Data Platform Services](#9-data-platform-services)
* [Container & Kubernetes Services](#10-container--kubernetes-services)
* [Automation & Orchestration](#11-automation--orchestration)
* [Media & Content Delivery](#12-media--content-delivery)
* [Azure Instance Metadata Service (IMDS)](#13-azure-instance-metadata-service-imds)
* [Threat Hunting Recommendations](#14-threat-hunting-recommendations)

---

## 1. Identity & Access Management

### Common URLs

| Service                           | URL Pattern                                      |
| --------------------------------- | ------------------------------------------------ |
| Microsoft Entra ID Authentication | `https://login.microsoftonline.com/<tenant-id>/` |
| Microsoft Graph API               | `https://graph.microsoft.com/`                   |
| Microsoft Graph Beta              | `https://graph.microsoft.com/beta/`              |
| Azure Resource Manager (ARM)      | `https://management.azure.com/`                  |
| Azure Portal                      | `https://portal.azure.com/`                      |

### Common Attack Activities

* Password spraying
* Credential stuffing
* MFA fatigue attacks
* OAuth consent grant abuse
* Token theft and replay
* User and group enumeration
* Service principal enumeration
* Privilege escalation through compromised administrators
* Resource discovery using ARM APIs

---

## 2. Compute Services

### Common URLs

| Service                         | URL Pattern                                      |
| ------------------------------- | ------------------------------------------------ |
| Azure App Service               | `https://<app>.azurewebsites.net`                |
| Azure Function App              | `https://<app>.azurewebsites.net/api/<function>` |
| Azure Container Instances (ACI) | `https://<container>.<region>.azurecontainer.io` |
| Azure Virtual Machine DNS       | `<vm>.<region>.cloudapp.azure.com`               |
| Azure Cloud Shell               | `https://shell.azure.com/`                       |

### Common Attack Activities

* Web shell deployment
* Remote code execution (RCE)
* Credential theft
* Abuse of managed identities
* Malware hosting
* Cryptocurrency mining
* Lateral movement

---

## 3. Storage Services

### Common URLs

| Service                | URL Pattern                                 |
| ---------------------- | ------------------------------------------- |
| Blob Storage           | `https://<account>.blob.core.windows.net`   |
| Azure Files            | `https://<account>.file.core.windows.net`   |
| Queue Storage          | `https://<account>.queue.core.windows.net`  |
| Table Storage          | `https://<account>.table.core.windows.net`  |
| Data Lake Storage Gen2 | `https://<account>.dfs.core.windows.net`    |
| Static Website Hosting | `https://<account>.z*.web.core.windows.net` |
| Azure CDN              | `https://<endpoint>.azureedge.net`          |

### Common Attack Activities

* Discovery of public containers
* Data exfiltration
* Malware hosting
* Abuse of Storage Account Keys
* Abuse of Shared Access Signatures (SAS)
* Sensitive file theft

### High-Risk Indicators

* Anonymous Blob access enabled
* Long-lived SAS tokens
* Excessive downloads
* Access from unusual geographies
* Storage key usage outside approved locations

---

## 4. Database Services

### Common Endpoints

| Service                       | Endpoint                        |
| ----------------------------- | ------------------------------- |
| Azure SQL Database            | `*.database.windows.net`        |
| Azure Cosmos DB               | `*.documents.azure.com`         |
| Azure Database for PostgreSQL | `*.postgres.database.azure.com` |
| Azure Database for MySQL      | `*.mysql.database.azure.com`    |
| Azure Cache for Redis         | `*.redis.cache.windows.net`     |

### Common Attack Activities

* Credential stuffing
* Password brute forcing
* Database dumping
* Unauthorized administrative access
* Data theft
* Abuse of weak firewall rules

### High-Risk Indicators

* Internet-exposed databases
* Excessive failed logins
* Large outbound data transfers
* Unexpected administrative changes

---

## 5. Secrets Management

### Common URL

| Service         | URL Pattern                       |
| --------------- | --------------------------------- |
| Azure Key Vault | `https://<vault>.vault.azure.net` |

### Common Attack Activities

* Secret dumping
* Certificate theft
* API key theft
* Credential harvesting
* Lateral movement using retrieved secrets

### High-Risk Indicators

* Secret enumeration activity
* Bulk secret retrieval
* Access from unfamiliar IP addresses
* Sudden increase in `SecretGet` operations

---

## 6. Messaging & Integration

### Common URLs

| Service         | URL Pattern                |
| --------------- | -------------------------- |
| Service Bus     | `*.servicebus.windows.net` |
| Event Hubs      | `*.servicebus.windows.net` |
| IoT Hub         | `*.azure-devices.net`      |
| SignalR Service | `*.service.signalr.net`    |

### Common Attack Activities

* Queue abuse
* Data interception
* Device impersonation
* Command injection
* Covert data exfiltration
* Persistence through messaging infrastructure

---

## 7. API & Developer Services

### Common URLs

| Service              | URL Pattern                            |
| -------------------- | -------------------------------------- |
| Azure API Management | `*.azure-api.net`                      |
| Azure DevOps         | `https://dev.azure.com/<organization>` |

### Common Attack Activities

* API enumeration
* API key theft
* Source code theft
* Pipeline compromise
* Personal Access Token (PAT) abuse
* Supply chain attacks

---

## 8. Analytics & AI Services

### Common URLs

| Service                  | URL Pattern                                |
| ------------------------ | ------------------------------------------ |
| Azure AI Search          | `*.search.windows.net`                     |
| Application Insights API | `https://api.applicationinsights.io`       |
| Azure Monitor            | `https://management.azure.com/`            |
| Azure AI Foundry         | `https://<resource>.services.ai.azure.com` |

### Common Attack Activities

* Log reconnaissance
* Search index enumeration
* Data extraction
* Abuse of AI endpoints
* Monitoring configuration tampering

---

## 9. Data Platform Services

### Common URLs

| Service                      | URL Pattern                     |
| ---------------------------- | ------------------------------- |
| Azure Data Lake Storage Gen2 | `*.dfs.core.windows.net`        |
| Azure Synapse Analytics      | `*.dev.azuresynapse.net`        |
| Azure Data Factory           | `https://management.azure.com/` |

### Common Attack Activities

* Data warehouse compromise
* Data exfiltration
* Pipeline abuse
* Discovery of sensitive datasets

---

## 10. Container & Kubernetes Services

### Common URLs

| Service                        | URL Pattern                    |
| ------------------------------ | ------------------------------ |
| Azure Kubernetes Service (AKS) | Public Ingress / Load Balancer |
| Azure Container Registry (ACR) | `*.azurecr.io`                 |

### Common Attack Activities

* Kubernetes cluster takeover
* Container image poisoning
* Supply chain compromise
* Credential theft from containers
* Secret extraction

---

## 11. Automation & Orchestration

### Common URLs

| Service          | URL Pattern                          |
| ---------------- | ------------------------------------ |
| Azure Automation | `*.azure-automation.net`             |
| Logic Apps       | `https://<logicapp>.logic.azure.com` |
| Azure Functions  | `*.azurewebsites.net`                |

### Common Attack Activities

* Malicious runbook creation
* Persistence mechanisms
* Automated data exfiltration
* Scheduled execution of attacker-controlled code
* Privilege escalation through automation accounts

---

## 12. Media & Content Delivery

### Common URL of media

| Service              | URL Pattern         |
| -------------------- | ------------------- |
| Azure Media Services | `*.media.azure.net` |
| Azure CDN            | `*.azureedge.net`   |

### Common Attack Activities

* Malware delivery
* Unauthorized media access
* Hosting attacker-controlled content
* Payload staging

---

## 13. Azure Instance Metadata Service (IMDS)

> One of the most commonly abused Azure services during cloud attacks.

### Endpoint

```text
http://169.254.169.254/metadata/
```

### Common Attack Activities

* Server-Side Request Forgery (SSRF)
* Managed Identity token theft
* Privilege escalation
* Subscription enumeration
* Resource discovery

### Example Metadata Request

```http
GET http://169.254.169.254/metadata/instance?api-version=2021-02-01
Metadata: true
```

---

## High-Value Azure Services Frequently Involved in Data Breaches

### Identity

* Microsoft Entra ID
* Microsoft Graph
* Azure Resource Manager

### Secrets

* Azure Key Vault

### Storage

* Azure Blob Storage
* Azure Files
* Data Lake Storage Gen2

### Databases

* Azure SQL Database
* Cosmos DB
* PostgreSQL
* MySQL
* Redis

### Compute

* App Service
* Function Apps
* Virtual Machines
* Azure Kubernetes Service

### Integration

* Service Bus
* Event Hubs
* Logic Apps

### Developer Platforms

* Azure DevOps
* API Management

### Containers

* Azure Container Registry
* Azure Kubernetes Service

### Analytics

* Azure Monitor
* Application Insights
* Azure AI Search
* Azure Synapse Analytics

---

## 14. Threat Hunting Recommendations

Monitor authentication, API calls, and network traffic involving:

```text
login.microsoftonline.com
graph.microsoft.com
management.azure.com
*.vault.azure.net
*.blob.core.windows.net
*.dfs.core.windows.net
*.database.windows.net
*.documents.azure.com
*.azurewebsites.net
*.servicebus.windows.net
*.azure-api.net
*.azurecr.io
*.search.windows.net
```

### Investigate

* Password spraying activity
* OAuth consent grants
* Service principal creation
* Privilege assignment changes
* Managed Identity token requests
* Excessive Key Vault access
* Large Storage Account downloads
* Cosmos DB exports
* Creation of new Azure resources
* Unusual automation runbooks
* Logic App workflow creation
* AKS administrative changes

### Data Exfiltration Indicators

* Large outbound transfers
* Excessive Blob downloads
* Abnormal Data Lake access
* Bulk Key Vault secret retrieval
* High-volume Cosmos DB reads
* Storage access from unfamiliar countries

---

> **Important:** These endpoints are legitimate Microsoft Azure services. Detection should focus on abnormal authentication patterns, unauthorized access attempts, unusual API activity, excessive data access, privilege changes, and suspicious resource creation rather than the URL alone.
