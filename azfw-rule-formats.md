# Azure Firewall Rule Samples and Templates

This document provides standardized sample formats for configuring **Azure Firewall** rules. It includes examples for:

* Network Rule Collections
* Application Rule Collections
* DNAT Rule Collections
* Best practices
* Supported source and destination object types
* Rule design recommendations

> **Note**
>
> These are sample templates intended for documentation, design, and implementation planning. Modify values according to your organization's security requirements.

---

# Azure Firewall Rule Processing

Azure Firewall supports three primary rule types:

| Rule Type             | Purpose                           | Supports                                           |
| --------------------- | --------------------------------- | -------------------------------------------------- |
| **Network Rules**     | Layer 3/Layer 4 traffic filtering | TCP, UDP, ICMP, Any                                |
| **Application Rules** | Layer 7 outbound filtering        | HTTP, HTTPS, MSSQL, FTP, Web Categories, FQDN Tags |
| **DNAT Rules**        | Inbound destination NAT           | Public IP → Private IP translation                 |

---

# 1. Network Rule Collection

Network rules filter traffic based on:

* Source
* Destination
* Protocol
* Port

Supported for:

* TCP
* UDP
* ICMP
* Any

---

## Network Rule Template

| Field             | Description                              |
| ----------------- | ---------------------------------------- |
| Name              | Rule name                                |
| Source Type       | IP Address or IP Group                   |
| Source            | Source IP/CIDR/IP Group                  |
| Protocol          | TCP, UDP, ICMP, Any                      |
| Destination Ports | Single port or port range                |
| Destination Type  | IP Address, Service Tag, IP Group, FQDN* |
| Destination       | Destination object                       |

> **Note**
>
> Azure Firewall Network Rules support **FQDNs only for specific protocols** (such as TCP). FQDN filtering in Network Rules has limitations because DNS resolution is required. For web traffic, Application Rules are generally recommended.

---

## Sample Network Rules

| Name   | Source Type           | Source                             | Protocol            | Destination Ports | Destination Type                  | Destination                        |
| ------ | --------------------- | ---------------------------------- | ------------------- | ----------------- | --------------------------------- | ---------------------------------- |
| Rule-1 | IP Address / IP Group | `*`, `10.0.0.0/8`, `172.16.0.0/16` | TCP, UDP, ICMP, Any | `80`, `150-155`   | IP Address, Service Tag, IP Group | `*`, `10.0.0.0/8`, `172.16.0.0/24` |
| Test-1 | IP Address            | `10.0.0.0/24`                      | TCP                 | 80                | IP Address                        | `172.16.1.10`                      |
| Test-2 | IP Group              | `ipgroup-oracleappserver`          | TCP                 | 443               | Service Tag                       | `Storage`                          |
| Test-3 | IP Address            | `10.0.0.0/24`                      | UDP                 | 150               | IP Group                          | `ipgroup-backend`                  |
| Test-4 | IP Group              | `ipgroup-oracleappserver`          | UDP                 | 135               | FQDN                              | `license.contoso.com`              |

---

# Supported Network Rule Objects

## Source Types

* IP Address
* CIDR
* IP Group

## Destination Types

* IP Address
* CIDR
* IP Group
* Service Tag
* FQDN (limited scenarios)

---

# 2. Application Rule Collection

Application Rules inspect Layer 7 traffic and filter requests based on:

* FQDN
* URL
* FQDN Tag
* Web Category

Supported protocols include:

* HTTP
* HTTPS
* MSSQL
* FTP
* Web Categories
* FQDN Tags

Application Rules provide richer filtering than Network Rules for outbound web traffic.

---

## Application Rule Template

| Field            | Description                       |
| ---------------- | --------------------------------- |
| Name             | Rule name                         |
| Source Type      | IP Address or IP Group            |
| Source           | Source IP/CIDR/IP Group           |
| Protocol         | HTTP, HTTPS, MSSQL                |
| TLS Inspection   | Enabled or Disabled               |
| Destination Type | FQDN, FQDN Tag, URL, Web Category |
| Destination      | Destination object                |

---

## Sample Application Rules

| Name   | Source Type           | Source                             | Protocol           | TLS Inspection | Destination Type | Destination                 |
| ------ | --------------------- | ---------------------------------- | ------------------ | -------------- | ---------------- | --------------------------- |
| Rule-1 | IP Address / IP Group | `*`, `10.0.0.0/8`, `172.16.0.0/16` | HTTP, HTTPS, MSSQL | Disabled       | FQDN             | `*.microsoft.com`           |
| Test-1 | IP Address            | `10.0.0.0/24`                      | HTTPS              | Enabled        | FQDN             | `*.microsoft.com`           |
| Test-2 | IP Group              | `ipgroup-oracleappserver`          | HTTPS              | Enabled        | FQDN Tag         | `WindowsUpdate`             |
| Test-3 | IP Address            | `10.0.0.0/24`                      | HTTPS              | Disabled       | URL              | `https://www.microsoft.com` |
| Test-4 | IP Group              | `ipgroup-oracleappserver`          | HTTPS              | Enabled        | Web Category     | `Business and Economy`      |

---

# Supported Application Rule Objects

## Source Types

* IP Address
* CIDR
* IP Group

## Destination Types

* FQDN
* FQDN Tag
* URL (Premium SKU)
* Web Category (Premium SKU)

---

# TLS Inspection

Azure Firewall Premium supports TLS inspection.

| Option   | Description                                       |
| -------- | ------------------------------------------------- |
| Enabled  | Decrypts, inspects, and re-encrypts HTTPS traffic |
| Disabled | HTTPS traffic is not decrypted                    |

Typical use cases:

* Malware inspection
* Data loss prevention
* URL filtering
* Threat detection
* Compliance monitoring

---

# 3. DNAT Rule Collection

Destination NAT (DNAT) translates inbound traffic from a public IP and port to a private IP and port.

Common scenarios include:

* Publishing web servers
* Bastion hosts
* Remote administration
* Application gateways
* Legacy applications

---

## DNAT Rule Template

| Field              | Description            |
| ------------------ | ---------------------- |
| Name               | Rule name              |
| Source Type        | IP Address or IP Group |
| Source             | Allowed source         |
| Protocol           | TCP or UDP             |
| Destination Port   | Public listening port  |
| Destination Type   | Public IP or FQDN      |
| Destination        | Firewall Public IP     |
| Translated Type    | Private IP or FQDN     |
| Translated IP/FQDN | Internal destination   |
| Translated Port    | Internal service port  |

---

## Sample DNAT Rules

| Name   | Source Type           | Source                             | Protocol | Destination Port | Destination Type | Destination   | Translated Type | Translated IP/FQDN | Translated Port |
| ------ | --------------------- | ---------------------------------- | -------- | ---------------- | ---------------- | ------------- | --------------- | ------------------ | --------------- |
| Rule-1 | IP Address / IP Group | `*`, `10.0.0.0/8`, `172.16.0.0/16` | TCP      | 443              | Public IP        | `20.10.10.10` | IP Address      | `172.16.1.10`      | 443             |
| Test-1 | IP Address            | `10.0.0.0/24`                      | TCP      | 80               | Public IP        | `20.10.10.10` | IP Address      | `172.16.0.10`      | 80              |
| Test-2 | IP Group              | `ipgroup-oracleappserver`          | TCP      | 443              | Public IP        | `20.10.10.10` | IP Address      | `172.16.0.20`      | 443             |
| Test-3 | IP Address            | `10.0.0.0/24`                      | TCP      | 8443             | Public IP        | `20.10.10.10` | FQDN            | `app.contoso.com`  | 443             |
| Test-4 | IP Group              | `ipgroup-oracleappserver`          | TCP      | 3389             | Public IP        | `20.10.10.10` | IP Address      | `172.16.0.30`      | 3389            |

---

# Azure Firewall Object Types

| Object       | Supported In                         |
| ------------ | ------------------------------------ |
| IP Address   | Network, Application, DNAT           |
| CIDR         | Network, Application, DNAT           |
| IP Group     | Network, Application, DNAT           |
| Service Tag  | Network                              |
| FQDN         | Network (limited), Application, DNAT |
| FQDN Tag     | Application                          |
| URL          | Application (Premium)                |
| Web Category | Application (Premium)                |

---

# Best Practices

* Organize rules into **Rule Collection Groups** based on application, environment, or business function.
* Follow the **principle of least privilege** by allowing only required traffic.
* Prefer **Application Rules** over Network Rules for HTTP/HTTPS traffic to enable Layer 7 filtering.
* Use **IP Groups** instead of individual IP addresses to simplify management.
* Avoid using wildcard (`*`) sources or destinations unless operationally required.
* Place **more specific rules before broader rules** within the same collection where applicable.
* Use **Service Tags** for Microsoft services instead of maintaining IP address lists.
* Enable **TLS Inspection** (Azure Firewall Premium) only where organizational policy and certificate deployment permit.
* Log all firewall activity to **Azure Monitor**, **Log Analytics Workspace**, or **Microsoft Sentinel** for monitoring, auditing, and threat hunting.
* Regularly review firewall rules to remove unused, duplicate, or overly permissive entries.
* Use Infrastructure-as-Code (IaC) such as **Bicep**, **ARM templates**, or **Terraform** for consistent and version-controlled deployments.

---

# Naming Convention Example

| Rule Type             | Example                  |
| --------------------- | ------------------------ |
| Network Rule          | `NET-Allow-App1-HTTPS`   |
| Application Rule      | `APP-Allow-Microsoft365` |
| DNAT Rule             | `DNAT-WebServer-443`     |
| Rule Collection       | `RC-Production-Web`      |
| Rule Collection Group | `RCG-Production`         |

---

# Security Recommendations

* Deny all traffic by default and explicitly allow only approved communication.
* Minimize inbound exposure by using DNAT only when necessary.
* Restrict administrative access using Azure Bastion or VPN instead of exposing management ports.
* Use Threat Intelligence mode to alert or deny connections to known malicious IP addresses.
* Enable diagnostic logs and metrics for continuous monitoring and incident response.
* Periodically validate firewall rules against organizational security policies and compliance requirements.
