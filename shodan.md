# Shodan for Penetration Testers

## 1. Overview

**Shodan** is a specialized search engine designed to discover and index internet-connected devices (servers, routers, switches, SCADA systems, IoT devices, and industrial controllers).

Unlike standard search engines (e.g., Google, Bing) that crawl and index web page content (HTML, text, links), Shodan interrogates public IP addresses, probes open ports, and indexes the resulting **service banners** (HTTP headers, FTP banners, SSH server IDs, RTSP responses, etc.).

### Traditional Search Engines vs. Shodan

| Feature | Traditional Search Engines | Shodan |
| --- | --- | --- |
| **Primary Target** | Web page content & metadata | Open ports and service banners |
| **Data Source** | Web crawlers / HTML parsers | Direct port interrogation & banner grabbing |
| **Use Case** | Finding documents, sites, and media | Discovering exposed systems, firmware, and misconfigurations |
| **Search Mechanism** | Keywords in page text/URLs | Banner strings, headers, device signatures, IP filters |

---

## 2. Core Operational Concepts

### Service Banners & HTTP Status Codes

Service banners contain operational metadata exposed by network software. A critical skill in using Shodan for penetration testing is interpreting HTTP response headers embedded in banners:

* **`200 OK`**: The request succeeded. In unauthenticated devices, receiving a `200 OK` banner without authentication headers often indicates that an administrative dashboard or configuration page is publicly exposed.
* **`401 Unauthorized`**: The resource requires authentication. Look for the `WWW-Authenticate` response header, which indicates the authentication realm and expected credentials format (e.g., Basic, Digest).
* **`403 Forbidden`**: Access is denied regardless of credentials or authorization status.

---

## 3. Query Syntax & Essential Filters

Shodan supports precise targeting using built-in search filters. Filters can be combined using implicit `AND` logic or explicitly included/excluded with `+` and `-`.

### Primary Search Filters

* `country:` – Filters by two-letter ISO country code (e.g., `country:CH`, `country:US`).
* `net:` – Filters by IP address or CIDR subnet block (e.g., `net:192.168.1.0/24`).
* `hostname:` – Filters by domain name or text in the hostname reverse lookup (e.g., `hostname:.gov`, `hostname:.edu`).
* `port:` – Filters by specific open network ports (e.g., `port:21`, `port:22`, `port:80`, `port:443`, `port:8080`).
* `os:` – Targets specific operating systems identified in service signatures (e.g., `os:"Cisco IOS"`).
* `org:` – Filters by Autonomous System Name (ASN) or organization (e.g., `org:"Amazon.com"`).

### Common Query Examples

```text
# Find Apache web servers in Switzerland
apache country:CH

# Target specific Apache release versions in a government domain
apache "2.2.3" hostname:.nist.gov

# Find exposed Microsoft IIS 5.0 instances within educational subnets
iis-5.0 hostname:.edu

# Locate Cisco IOS devices responding on HTTP ports
"cisco-ios" port:80

```

---

## 4. Practical Penetration Testing Use Cases

### Case Study 1: Unauthenticated Cisco Administrative Interfaces

During passive reconnaissance, banner parameters can indicate exposed administrative consoles without authentication barriers.

1. **Standard Authenticated Response (`401 Unauthorized`):**
```http
HTTP/1.1 401 Unauthorized
WWW-Authenticate: Basic realm="Cisco-Router"

```


2. **Unauthenticated Dashboard Response (`200 OK`):**
```http
HTTP/1.1 200 OK
Last-Modified: Wed, 15 Oct 2025 12:00:00 GMT

```



* **Analysis:** In many legacy Cisco web interfaces, banners returning `200 OK` alongside a `Last-Modified` header—and lacking the `WWW-Authenticate` header—indicate that HTTP access control is bypassed or unconfigured.
* **Impact:** Attackers or auditors accessing these endpoints often obtain immediate **Privilege Level 15 (Exec)** access, allowing full extraction of `show running-config`, CDP neighbor details, and interface state without entering credentials.

---

### Case Study 2: Default Passwords & Information Disclosures

Shodan regularly indexes administrative interfaces that broadcast default credential prompts, setup pages, or debug details directly in their server response headers or default paths.

* **Query Example:** `"default password"` or `"admin/admin"`
* **Significance:** Many IoT devices, network printers, and embedded management cards ship with default configuration banners or HTML titles (e.g., `Server: Print Server / Default Password: admin`). Identifying these servers highlights immediate targets for credential testing.

---

### Case Study 3: Infrastructure & Internal Topology Leakage

Publicly exposed core network infrastructure (switches, edge routers, industrial firewalls) can leak critical operational details through passive banner collection.

**Leaked Technical Details Often Found:**

* VLAN IDs mapping corporate, guest, convention center, and public backbones.
* SNMP server IP addresses and cleartext community strings (`public`, `private`).
* Internal routing protocols and neighbor topologies (via exposed CDP/LLDP HTTP endpoints).

---

### Case Study 4: Specific Management Web Paths

Querying Shodan for specific device endpoints or embedded page strings reveals exposed hardware management cards, webcams, and network appliances:

```text
# Common management interfaces and web components
"javascript:SnapshotWin()"
"client.html"
"setup/config.html"
"system.html"
"network.html"
"cameracontrol.html"

```

---

## 5. Security & Ethical Framework

Using passive intelligence tools like Shodan requires clear operational boundaries during engagement execution:

```
                  ┌─────────────────────────────────────────┐
                  │          Passive Reconnaissance         │
                  │   (Searching Shodan Index & Banners)    │
                  └────────────────────┬────────────────────┘
                                       │
                         Is direct interaction needed?
                                       │
                      ┌────────────────┴────────────────┐
                      ▼                                 ▼
              [ Passive Viewing ]             [ Active Interaction ]
           Analyzing existing indexed    Interacting with exposed endpoints
            headers, banners, or public    or attempting logins on systems
                search engine data           outside agreed scope
                      │                                 │
                      ▼                                 ▼
              ✅ Ethical & Legal               ⚠️ Requires Explicit Scope
            (Footprinting / OSINT)             & Authorization (ROE)

```

### Ethical Assessment Matrix

* **Passive Reconnaissance (Indexing Search):** Generally permissible as OSINT; reading publicly indexed data does not send new traffic to target networks.
* **Unauthenticated View Access:** Accessing open interfaces identified via OSINT without explicit client authorization can violate computer misuse laws regardless of missing controls.
* **Testing Default Credentials:** Attempting logins on systems outside an agreed Scope of Work / Rules of Engagement (ROE) constitutes unauthorized access.
* **Modifying Configurations:** Changing system parameters on any unauthorized device is illegal and un-ethical.

---

## 6. Defensive Countermeasures & Hardening

1. **Disable Public HTTP Management:** Restrict administrative interfaces to internal management VLANs or require encrypted VPN access.
2. **Remove Default Banners:** Obfuscate or strip specific version information, operating system details, and default manufacturer parameters from HTTP response headers.
3. **Enforce Authentication at the Perimeter:** Ensure `WWW-Authenticate` or robust multi-factor authentication triggers before any administrative resources or status pages load.
4. **Conduct Regular OSINT Audits:** Routinely query Shodan for your organization's public IP ranges (`net:x.x.x.x/yy`) to identify rogue devices, unintended exposed ports, and misconfigured infrastructure before external adversaries exploit them.