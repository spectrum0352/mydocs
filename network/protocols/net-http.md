# Azure Web Application & HTTP Server Penetration Testing – Reconnaissance and Enumeration Guide

## Phase 1: Reconnaissance

Reconnaissance is divided into:

* **Passive Reconnaissance** – Collecting information without directly interacting with the target.
* **Active Reconnaissance** – Interacting with the target to identify services, technologies, and potential attack surfaces.

---

## Step 1: Passive Infrastructure Discovery

Before sending traffic to the target, gather publicly available information.

### WHOIS Lookup

Identify domain ownership, registration details, and name servers.

```bash
whois target.com
```

### DNS Enumeration

Identify mail servers, SPF records, and TXT records that may reveal infrastructure details.

```bash
dig +short mx target.com
dig +short txt target.com
```

### Certificate Transparency (CT) Logs

Discover subdomains that have been issued SSL/TLS certificates.

Examples:

* dev.target.com
* staging.target.com
* vpn.target.com
* api.target.com

Search:

```text
%.target.com
```

using Certificate Transparency databases such as crt.sh.

### Search Engine Reconnaissance

Use search operators to locate publicly exposed resources.

Examples:

```text
site:target.com filetype:log
site:target.com filetype:env
site:target.com "index of /"
site:target.com inurl:admin
site:target.com filetype:php
```

---

## Step 2: Manual Web Application Inspection

Review the application manually before running automated tools.

### Source Code Review

Inspect page source for:

* JavaScript variables
* Hidden form fields
* Hardcoded credentials
* API keys
* Internal endpoints
* Developer comments
* TODO/FIXME notes

### Browser Inspection

Look for:

* Debug messages
* Session tokens
* Authentication mechanisms
* Client-side role validation
* Exposed API endpoints

### SSL/TLS Certificate Inspection

```bash
openssl s_client -connect example.azurewebsites.net:443
```

Review:

* Certificate Subject Alternative Names (SANs)
* Expiration dates
* Internal hostnames
* Additional domains

---

## Step 3: Technology Profiling

Identify technologies before attempting exploitation.

### HTTP Header Analysis

```bash
curl -I https://target.com
```

Review:

* Server
* X-Powered-By
* ASP.NET Version
* Framework identifiers

### Technology Detection

#### WhatWeb

```bash
whatweb https://target.com
```

#### Wappalyzer

Browser extension used to identify:

* CMS platforms
* Web frameworks
* JavaScript libraries
* Web servers

Examples:

* ASP.NET
* PHP
* Django
* Laravel
* React
* Angular

---

## Step 4: Active Service Profiling

Identify exposed services and versions.

### Port Scanning

```bash
nmap -sV -sC -T4 target.com
```

Options:

* `-sV` Version Detection
* `-sC` Default NSE Scripts
* `-T4` Faster Timing

### Banner Grabbing

```bash
curl -I http://target.com
nc -zv target.com 80
```

### Web Application Firewall Detection

```bash
wafw00f https://target.com
```

Detect:

* Azure Front Door WAF
* Cloudflare
* Imperva
* F5
* Akamai

---

## Step 5: Sensitive File Discovery

Check for exposed files and directories.

### robots.txt

```bash
curl https://target.com/robots.txt
```

### Common Sensitive Locations

```text
/admin/
/backup/
/config/
/uploads/
/logs/
/.git/
/.env
/.DS_Store
/web.config
/settings.py
/phpinfo.php
/.htaccess
```

### Backup Files

Look for:

```text
web.config.bak
web.config.old
.env.bak
backup.zip
site.zip
database.sql
```

---

## Step 6: Directory and Asset Fuzzing

Discover hidden content not linked from the application.

### FFUF

```bash
ffuf -u https://target.com/FUZZ \
-w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt \
-recursion \
-recursion-depth 2 \
-e .php,.asp,.aspx,.jsp,.html
```

### Basic FFUF Scan

```bash
ffuf -u https://target.com/FUZZ \
-w /path/to/wordlist.txt \
-mc 200,301,403
```

### Gobuster

```bash
gobuster dir \
-u https://target.com \
-w /usr/share/wordlists/dirb/common.txt
```

---

## Step 7: Subdomain Enumeration

Expand the attack surface.

### Tools

#### Subfinder

```bash
subfinder -d target.com
```

#### Assetfinder

```bash
assetfinder target.com
```

#### Amass

```bash
amass enum -d target.com
```

Potential discoveries:

```text
api.target.com
dev.target.com
staging.target.com
test.target.com
vpn.target.com
internal.target.com
```

---

## Step 8: Virtual Host Discovery

A single IP address may host multiple applications.

### FFUF Host Header Fuzzing

```bash
ffuf -u http://TARGET_IP \
-H "Host: FUZZ.target.com" \
-w subdomains.txt
```

### Gobuster VHost Mode

```bash
gobuster vhost \
-u http://TARGET_IP \
-w subdomains.txt
```

---

## Step 9: Parameter Discovery

Identify hidden URL and POST parameters.

### Arjun

```bash
arjun -u https://target.com/login.php
```

Potential findings:

```text
redirect=
id=
user=
debug=
role=
admin=
```

---

## Step 10: Client-Side Analysis

Modern applications expose significant functionality through JavaScript.

### JavaScript Analysis

Review JavaScript files for:

* API keys
* Internal APIs
* Hardcoded credentials
* JWT secrets
* Hidden endpoints

### Tools

#### LinkFinder

Extract endpoints from JavaScript.

#### SecretFinder

Search JavaScript for secrets and credentials.

### Hidden Fields

Inspect:

```html
<input type="hidden">
```

for:

* User IDs
* Role identifiers
* Workflow states

### CORS Validation

Review:

```http
Access-Control-Allow-Origin: *
```

Misconfigured CORS policies may expose APIs to cross-origin attacks.

---

## Step 11: API Discovery

Modern applications often expose APIs.

### Common API Documentation Locations

```text
/swagger
/swagger.json
/swagger-ui
/openapi.json
/v1/api-docs
/schema.xml
```

### API Security Checks

#### Broken Object Level Authorization (BOLA)

Example:

```http
GET /api/users/105
GET /api/users/106
```

Verify whether unauthorized data access is possible.

#### Mass Assignment

Attempt additional parameters:

```json
{
  "username": "user",
  "is_admin": true
}
```

---

# Azure-Specific Reconnaissance

Azure-hosted applications require additional cloud-focused enumeration.

---

## Azure Infrastructure Discovery

Determine hosting architecture.

### DNS Resolution

```bash
nslookup target.com
dig target.com
```

Identify:

* Azure App Service (*.azurewebsites.net)
* Azure VM (*.cloudapp.azure.com)
* Azure Front Door
* Azure Application Gateway
* Azure Load Balancer

### Azure Session Identification

Check for:

```text
ARRAffinity
```

cookie values indicating Azure App Service instance affinity.

---

## Azure-Specific Wordlists

### Assetnote

Recommended:

```text
2m-subdomains.txt
httparchive_apiroutes.txt
httparchive_aspx_asp_cfm_svc_ashx_asmx_2026.txt
```

### SecLists

Recommended:

```text
raft-large-directories.txt
web-all-extensions.txt
common.txt
```

### Azure Storage Enumeration

Common container names:

```text
backups
images
public
files
documents
vhds
secrets
```

Tools:

* GoBlob
* CloudBrute
* CloudEnum
* QuickAz

---

## Azure App Service Discovery Example

```bash
ffuf \
-u https://example.azurewebsites.net/FUZZ \
-w aspx_lowercase.txt \
-mc 200,301,403 \
-t 50
```

Thread count should remain conservative to avoid triggering rate-limiting or defensive controls.

---

# Reconnaissance Checklist

## Infrastructure

* WHOIS lookup
* DNS enumeration
* Certificate Transparency logs
* Search engine reconnaissance

## Discovery

* Subdomain enumeration
* Virtual host discovery
* Port scanning
* WAF identification

## Web Enumeration

* Source code review
* Sensitive file discovery
* Directory fuzzing
* Parameter discovery

## Application Analysis

* JavaScript analysis
* API discovery
* CORS validation
* Technology fingerprinting

## Azure-Specific

* Azure service identification
* App Service enumeration
* Storage account discovery
* Load balancer and Front Door detection

---

# Recommended Tools

## Discovery

* subfinder
* amass
* assetfinder

## Fingerprinting

* whatweb
* Wappalyzer
* curl

## Enumeration

* ffuf
* gobuster
* dirsearch

## Parameter Discovery

* arjun

## JavaScript Analysis

* LinkFinder
* SecretFinder
* katana
* gau

## Cloud Enumeration

* CloudEnum
* CloudBrute
* QuickAz
* GoBlob

## Vulnerability Assessment

* Nikto
* Nmap NSE Scripts
* Burp Suite

---

# Azure Security Considerations

* Azure Front Door and Application Gateway may mask backend infrastructure.
* Azure App Service frequently uses ARRAffinity cookies for session persistence.
* Azure Load Balancers can obscure backend node identification.
* Managed Identities should be considered during security reviews, but cloud identity access testing must only be performed within authorized assessment scope.
* Rate-limiting, WAF controls, and Defender for Cloud protections may impact automated scanning activity.

All reconnaissance and testing activities must be conducted within the scope of explicit authorization and applicable rules of engagement.

## HTTP

## Design Flaws

- **Lack of state management:** HTTP is stateless, requiring mechanisms like cookies or server-side sessions to maintain state.
- **Potential for man-in-the-middle attacks:** Unencrypted HTTP traffic can be intercepted and tampered with.
- **Limited authentication and authorization:** Basic mechanisms like HTTP Basic Auth are often insufficient for robust security.
- **Lack of Built-in Authentication:** HTTP does not inherently provide authentication mechanisms, making it vulnerable to unauthorized access.
- **Plaintext Transmission:** Data is transmitted in plaintext, making it susceptible to eavesdropping.
- **Session Hijacking:** Sessions can be hijacked by attackers, allowing them to impersonate legitimate users.