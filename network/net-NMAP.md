# Contents

[Table of Contents [2](#table-of-contents)](#table-of-contents)

[1. Introduction [2](#introduction)](#introduction)

[1.1 Why Use Nmap in Azure Pentests [3](#why-use-nmap-in-azure-pentests)](#why-use-nmap-in-azure-pentests)

[1.2 Common Azure Network Architectures [3](#common-azure-network-architectures)](#common-azure-network-architectures)

[Introduction [3](#introduction-1)](#introduction-1)

[2. Azure-Aware Scanning Fundamentals [5](#azure-aware-scanning-fundamentals)](#azure-aware-scanning-fundamentals)

[2.1 Scanning Across Azure VNets and Subnets [5](#scanning-across-azure-vnets-and-subnets)](#scanning-across-azure-vnets-and-subnets)

[2.2 Considerations with Azure NSGs (Network Security Groups) [5](#considerations-with-azure-nsgs-network-security-groups)](#considerations-with-azure-nsgs-network-security-groups)

[2.3 Identifying Public vs Private IPs [5](#identifying-public-vs-private-ips)](#identifying-public-vs-private-ips)

[2.4 Scanning in Hub-and-Spoke Topologies [5](#scanning-in-hub-and-spoke-topologies)](#scanning-in-hub-and-spoke-topologies)

[2.5 Using Azure Bastion and Jump Hosts [5](#using-azure-bastion-and-jump-hosts)](#using-azure-bastion-and-jump-hosts)

[Scanning [5](#scanning)](#scanning)

[OS Detection [8](#os-detection)](#os-detection)

[3. Firewall Evasion and Stealth Techniques [9](#firewall-evasion-and-stealth-techniques)](#firewall-evasion-and-stealth-techniques)

[3.1 Evading Azure NSGs and Firewalls [10](#evading-azure-nsgs-and-firewalls)](#evading-azure-nsgs-and-firewalls)

[3.2 Fragment Packets [10](#fragment-packets)](#fragment-packets)

[3.3 Spoof MAC Address [10](#spoof-mac-address)](#spoof-mac-address)

[3.4 Use Decoys [10](#use-decoys)](#use-decoys)

[3.5 Idle Scan / Zombie Hosts in Cloud [10](#idle-scan-zombie-hosts-in-cloud)](#idle-scan-zombie-hosts-in-cloud)

[3.6 Source Port Manipulation (e.g., Port 53, 443) [10](#source-port-manipulation-e.g.-port-53-443)](#source-port-manipulation-e.g.-port-53-443)

[3.7 Bypassing Azure WAF with Host Header Tricks (Nmap HTTP scripts) [10](#bypassing-azure-waf-with-host-header-tricks-nmap-http-scripts)](#bypassing-azure-waf-with-host-header-tricks-nmap-http-scripts)

[Firewall Evasion Techniques (Azure-Specific Context) [12](#firewall-evasion-techniques-azure-specific-context)](#firewall-evasion-techniques-azure-specific-context)

[4. Timing and Throttling Adjustments [13](#timing-and-throttling-adjustments)](#timing-and-throttling-adjustments)

[4.1 Azure Rate Limiting Considerations [13](#azure-rate-limiting-considerations)](#azure-rate-limiting-considerations)

[4.2 Avoiding Detection by Defender for Cloud [13](#avoiding-detection-by-defender-for-cloud)](#avoiding-detection-by-defender-for-cloud)

[4.3 Defeating Reset Rate Limits [13](#defeating-reset-rate-limits)](#defeating-reset-rate-limits)

[4.4 Timing Template Overview (T0-T5) [13](#timing-template-overview-t0-t5)](#timing-template-overview-t0-t5)

[Nmap Timing & Performance Tuning [13](#nmap-timing-performance-tuning)](#nmap-timing-performance-tuning)

[5. Output and Reporting [14](#output-and-reporting)](#output-and-reporting)

[5.1 Grepable Output for Automated Pipelines [14](#grepable-output-for-automated-pipelines)](#grepable-output-for-automated-pipelines)

[5.2 Save Output to XML/JSON for Azure DevOps Pipelines [14](#save-output-to-xmljson-for-azure-devops-pipelines)](#save-output-to-xmljson-for-azure-devops-pipelines)

[5.3 Output All Supported Formats [14](#output-all-supported-formats)](#output-all-supported-formats)

[5.4 Display Real-Time Scan Stats [14](#display-real-time-scan-stats)](#display-real-time-scan-stats)

[5.5 1337/Custom Output Formats [14](#custom-output-formats)](#custom-output-formats)

[6. Troubleshooting and Debugging [14](#troubleshooting-and-debugging)](#troubleshooting-and-debugging)

[6.1 Verbose Mode in Cloud Networks [14](#verbose-mode-in-cloud-networks)](#verbose-mode-in-cloud-networks)

[6.2 Debugging in Complex Azure VNets [14](#debugging-in-complex-azure-vnets)](#debugging-in-complex-azure-vnets)

[6.3 Interface Selection in VM with Multiple NICs [14](#interface-selection-in-vm-with-multiple-nics)](#interface-selection-in-vm-with-multiple-nics)

[6.4 Trace Packet Paths (like traceroute through Azure) [14](#trace-packet-paths-like-traceroute-through-azure)](#trace-packet-paths-like-traceroute-through-azure)

[7. Scripted Recon with NSE [15](#scripted-recon-with-nse)](#scripted-recon-with-nse)

[7.1 Using NSE to Enumerate Azure Services [16](#using-nse-to-enumerate-azure-services)](#using-nse-to-enumerate-azure-services)

[7.2 Key NSE Scripts for Azure: [16](#key-nse-scripts-for-azure)](#key-nse-scripts-for-azure)

[7.3 Running Script Categories [16](#running-script-categories)](#running-script-categories)

[7.4 Troubleshooting Failing Scripts [16](#troubleshooting-failing-scripts)](#troubleshooting-failing-scripts)

[7.5 Updating NSE Libraries for Cloud [16](#updating-nse-libraries-for-cloud)](#updating-nse-libraries-for-cloud)

[Nmap Scripting Engine (NSE) in Azure PenTest [16](#nmap-scripting-engine-nse-in-azure-pentest)](#nmap-scripting-engine-nse-in-azure-pentest)

[7. Host Comparison with Ndiff [18](#host-comparison-with-ndiff)](#host-comparison-with-ndiff)

[8.1 Comparing Internal vs External View of Azure Hosts [19](#comparing-internal-vs-external-view-of-azure-hosts)](#comparing-internal-vs-external-view-of-azure-hosts)

[8.2 Detecting Configuration Drift [19](#detecting-configuration-drift)](#detecting-configuration-drift)

[8.3 XML & JSON Output for DevSecOps Integration [19](#xml-json-output-for-devsecops-integration)](#xml-json-output-for-devsecops-integration)

[9. Real-World Azure Scenarios [19](#real-world-azure-scenarios)](#real-world-azure-scenarios)

[9.1 Internal VM Scanning via Azure Run Command [19](#internal-vm-scanning-via-azure-run-command)](#internal-vm-scanning-via-azure-run-command)

[9.2 Scanning Through SSH Tunnels or Azure Bastion [19](#scanning-through-ssh-tunnels-or-azure-bastion)](#scanning-through-ssh-tunnels-or-azure-bastion)

[9.3 Detecting Open Management Ports (e.g., 3389, 22, 5986) [19](#detecting-open-management-ports-e.g.-3389-22-5986)](#detecting-open-management-ports-e.g.-3389-22-5986)

[9.4 Fingerprinting Web Apps Behind Azure Front Door [19](#fingerprinting-web-apps-behind-azure-front-door)](#fingerprinting-web-apps-behind-azure-front-door)

[10. External Tools and Online Resources [20](#external-tools-and-online-resources)](#external-tools-and-online-resources)

[10.1 Nmap with Wireshark in Azure [20](#nmap-with-wireshark-in-azure)](#nmap-with-wireshark-in-azure)

[10.2 Using Scanme.Insecure.org from Azure-hosted VMs [20](#using-scanme.insecure.org-from-azure-hosted-vms)](#using-scanme.insecure.org-from-azure-hosted-vms)

[10.3 Nmap Online Repositories and Cheat Sheets [20](#nmap-online-repositories-and-cheat-sheets)](#nmap-online-repositories-and-cheat-sheets)

[Appendices [20](#appendices)](#appendices)

[A. Nmap Azure Cheat Sheet [20](#a.-nmap-azure-cheat-sheet)](#a.-nmap-azure-cheat-sheet)

[B. Sample Azure VAPT Nmap Command Templates [20](#b.-sample-azure-vapt-nmap-command-templates)](#b.-sample-azure-vapt-nmap-command-templates)

[C. Azure-Specific NSE Scripts List [20](#c.-azure-specific-nse-scripts-list)](#c.-azure-specific-nse-scripts-list)

# Table of Contents

# Introduction

Here's a professionally rewritten and corrected version of your content, specifically contextualized for **Azure Penetration Testing** (Azure PenTest). It aligns Nmap’s capabilities with how it's practically used in an Azure cloud environment during a network vulnerability assessment and penetration test (VAPT).

------------------------------------------------------------------------

**Using Nmap in Azure Penetration Testing**

**Overview:**

Nmap (Network Mapper) is a powerful open-source network scanning tool used extensively during **Azure Penetration Testing** for network discovery, service enumeration, OS fingerprinting, and vulnerability scanning within both public and private cloud environments.

In Azure, it is especially useful for:

- Scanning exposed IPs of Azure Virtual Machines (VMs)

- Enumerating open ports/services of Azure Network Security Group (NSG)-protected assets

- Identifying misconfigured or publicly exposed PaaS services (e.g., Azure SQL, App Services)

- Validating firewall, NSG, and route table configurations

- Integrating with custom scripts for automated enumeration in hybrid or cloud-only scenarios

------------------------------------------------------------------------

**Network VAPT Phases in Azure:**

1.  **Planning**

    - Define the Azure scope (subscriptions, VNETs, services)

    - Get proper authorization

    - Identify cloud regions, NSGs, VPNs, peering, and hybrid connectors

2.  **Discovery**

    - Use Nmap to discover live hosts behind public IPs, load balancers, or VPNs

    - Example: nmap -sn azure-subnet-ip-range

3.  **Reconnaissance**

    - Perform detailed scans of exposed services on Azure VMs, App Services, or Containers

    - Example: nmap -sV -O -Pn azure-vm-ip

4.  **Vulnerability Analysis**

    - Leverage Nmap's scripting engine (NSE) to scan for common misconfigurations or CVEs

    - Example: nmap --script vuln target-azure-ip

5.  **Exploitation**

    - Use results from Nmap to attempt exploitation (e.g., outdated services, weak authentication)

    - Chain results with Metasploit or manual exploits

6.  **Reporting**

    - Document misconfigurations (e.g., NSG allowing 0.0.0.0/0), exposed services, and remediation

------------------------------------------------------------------------

**Common Nmap Use Cases in Azure Pentesting:**

| **Use Case** | **Description** | **Example** |
|----|----|----|
| **Host Discovery** | Identify live hosts in a public Azure subnet | nmap -sn 20.204.0.0/24 |
| **Port Scanning** | Check exposed ports on Azure VM NICs | nmap -sS -p- vm-ip |
| **Service Detection** | Identify services and versions | nmap -sV vm-ip |
| **OS Detection** | Determine OS of a cloud VM | nmap -O vm-ip |
| **Vulnerability Scanning** | Run NSE scripts to find CVEs | nmap --script vuln vm-ip |
| **Firewall Evasion Testing** | Test NSG/Firewall rules | nmap -Pn -f -p 80 --source-port 53 vm-ip |
| **Automation with NSE** | Write or use Lua-based scripts for Azure-specific scans | nmap --script azure-nsg-check.nse |

------------------------------------------------------------------------

**Nmap Scripting Engine (NSE) in Azure Context:**

**Why Use NSE Scripts in Azure Pentesting?**

NSE scripts automate and extend the scanning capabilities of Nmap for:

- **Detecting known vulnerabilities** in exposed services on Azure VMs

- **Auditing cloud service configurations** (e.g., SSL/TLS weaknesses)

- **Brute-forcing credentials** against services like SSH, FTP, or RDP (if authorized)

- **Fingerprinting cloud environments** based on headers and service banners

**NSE Script Categories Relevant to Azure:**

- **auth** – Check for weak authentication (e.g., SMB, RDP, HTTP auth)

- **brute** – Perform brute-force attacks on exposed cloud services

- **vuln** – Scan for known vulnerabilities

- **default** – Useful general-purpose enumeration

- **safe** – Read-only scripts that won't disrupt services (ideal for cloud testing)

**Types of NSE Scripts:**

- **Prerule**: Run before scan (e.g., target validation)

- **Hostrule**: Run after host discovery (e.g., OS detection)

- **Servicerule**: Run on detected services (e.g., version analysis)

- **Postrule**: Run after all scan phases (e.g., report summary)

**Examples in Azure Pentest:**

\# Basic scan with default scripts

nmap -sC -sV azure-vm-ip

\# Scan for vulnerabilities

nmap --script vuln -p 80,443 azure-webapp-ip

\# Custom NSE script to check for unrestricted RDP

nmap --script check-rdp-open.nse azure-vm-ip

------------------------------------------------------------------------

**Key Considerations for Azure:**

- Always **obtain explicit authorization** before scanning any Azure-hosted IPs or services.

- Use **Azure tags, resource groups, and subscription filters** to narrow scan scope responsibly.

- Monitor the effect of scans on NSGs, firewalls, and WAFs (some may drop or rate-limit probes).

- Combine Nmap results with tools like **AzScanner**, **BloodHound**, or **AzureHound** for hybrid insights.

------------------------------------------------------------------------

**Conclusion:**

Nmap remains a cornerstone tool in Azure Penetration Testing, aiding in **asset discovery, service enumeration, firewall validation**, and **vulnerability detection**. When combined with NSE and proper scoping, it provides actionable insight into cloud infrastructure exposure and misconfigurations—critical for securing modern Azure environments.

------------------------------------------------------------------------

Would you like a visual mind map or diagram summarizing how Nmap fits into the Azure VAPT lifecycle?

## 1.1 Why Use Nmap in Azure Pentests

## 1.2 Common Azure Network Architectures

# Introduction

Here’s a corrected, summarized, and Azure-specific rewrite of your original Nmap usage guide tailored for Azure penetration testing:

------------------------------------------------------------------------

**📘 Nmap Usage in Azure Penetration Testing**

Nmap is a key reconnaissance tool for identifying services, open ports, and network topology in Azure environments—especially during internal post-compromise assessments or when attacking from a VM inside a virtual network (VNET). Below is a reference for common Nmap usage and output techniques adapted for Azure.

------------------------------------------------------------------------

**🔍 Core Scanning Techniques**

These scans are typically run **from within Azure**, such as an attacker-controlled VM or pivoted system inside a VNET, since external access is often restricted by NSGs or Azure Firewall.

**🔹 Basic Host Discovery**

nmap -sn -PE \<target\>

Use ICMP echo requests (ping sweep) to find live hosts. May fail if ICMP is blocked by NSGs.

**🔹 List Open Ports**

nmap --open \<target\>

Scan for hosts with open ports (TCP only by default).

**🔹 Identify Running Services**

nmap -sV \<target\>

Performs banner grabbing to fingerprint services and versions (e.g., to detect vulnerable versions).

**🔹 Scan Specific Common Ports (HTTP/HTTPS)**

nmap -p 80,443 \<target\>

Useful for quick scans of web services exposed internally or externally.

**🔹 Scan UDP Ports (e.g., DNS)**

nmap -sU -p 53 \<target\>

UDP is often filtered in Azure. Use this only after verifying UDP-based services are exposed.

**🔹 Mixed Protocol, Verbose, No Ping (Full Detection)**

nmap -v -Pn -sU -sT -p U:53,111,137,T:25,80,139,8080 \<target\>

Best for internal scanning with mixed TCP/UDP port discovery, especially in environments with ICMP or ping disabled.

------------------------------------------------------------------------

**🧠 Important Azure-Related Ports**

These are common on Windows VMs and may be used for lateral movement or privilege escalation:

| **Port** | **Service**                      |
|----------|----------------------------------|
| 135/tcp  | MS RPC                           |
| 139/tcp  | NetBIOS Session                  |
| 445/tcp  | SMB (Microsoft-DS)               |
| 902/tcp  | VMware Remote Console            |
| 912/tcp  | Potential Mesh Services (custom) |

------------------------------------------------------------------------

**📤 Output Handling in Azure Pentests**

Nmap’s output options are vital for documenting scan results, automating reporting, or parsing for analysis (e.g., with grep, Python scripts, or BloodHound integrations).

| **Option**        | **Description**                       |
|-------------------|---------------------------------------|
| -oN               | Normal text output                    |
| -oX               | XML output (for automation or import) |
| -oG               | Grepable output for CLI parsing       |
| -oA               | Save all formats                      |
| --stats-every 10s | Periodic scan status updates          |
| -oS               | "1337" joke output (useless for ops)  |

**Save to Text**

nmap -oN scan.txt \<target\>

**Save to XML (for import into tools)**

nmap -oX scan.xml \<target\>

**Grepable Output (for parsing, scripting)**

nmap -oG scan.grep \<target\>

grep "open" scan.grep

**All Formats (recommended for full logging)**

nmap -oA azure_scan \<target\>

\# Generates: azure_scan.nmap, azure_scan.gnmap, azure_scan.xml

**Real-Time Scan Progress**

nmap --stats-every 10s \<target\>

------------------------------------------------------------------------

**🛡️ Azure Considerations**

- **NSGs, Azure Firewall, and Route Tables**: External scans are often blocked. Prefer scanning from **inside** an Azure VM or via **SSH tunneling**.

- **Resource Tags & VM Names**: Combine Nmap with Azure CLI to correlate hosts (e.g., az vm list -d).

- **SMB/RPC on Windows VMs**: If these ports are open internally, follow up with enum4linux, crackmapexec, or custom scripts.

------------------------------------------------------------------------

Would you like this bundled into a printable PDF or Markdown reference?

Here's a **clean, corrected, and Azure-relevant rewrite and summary** of your original Nmap troubleshooting and debugging guide, tailored specifically for **Azure penetration testing**:

------------------------------------------------------------------------

**🔍 Nmap Troubleshooting & Debugging for Azure Penetration Testing**

In Azure environments, Nmap remains a crucial tool for identifying exposed services, misconfigured NSGs, Azure Firewall bypasses, and reachable endpoints across VNets and subnets. However, Azure networking and security services can introduce unexpected behaviors. Debugging and troubleshooting with Nmap is essential when scans produce no results or are blocked.

This guide summarizes key Nmap options for debugging scans in Azure pentests.

------------------------------------------------------------------------

**✅ Core Troubleshooting Features in Azure Context**

| **Feature** | **Nmap Option** | **Azure Usage Context** |
|----|----|----|
| Help Menu | -h | Quick review of options |
| Show Version | -V | Ensure latest Nmap version before scanning updated Azure infra |
| Verbose Output | -v, -vv | See which services/NICs are detected through Azure NSGs |
| Debug Mode | -d, -d1 to -d9 | Troubleshoot why hosts/services are not discovered |
| Display Port State Reason | --reason | Know why Azure firewall marked ports as filtered |
| Show Only Open Ports | --open | Clean output for exposed Azure services |
| Packet Tracing | --packet-trace | Inspect interaction with Azure networking stack |
| Show Interfaces | --iflist | Check active NICs when scanning from a VM with multiple NICs |
| Specify Network Interface | -e | Force traffic over specific NIC in multi-NIC VM |
| Compare Scan Changes | ndiff, -v, --xml | Track open port changes in Azure over time |

------------------------------------------------------------------------

**🔧 Use Case Examples for Azure Pentesters**

**1. Checking Which NIC Azure VM is Using**

nmap --iflist

Use this to verify whether your scan is using the private IP of the Azure VM or the public IP (especially in dual-homed configurations).

**2. Force Scans Through a Specific Azure NIC**

nmap -e eth1 10.0.4.5

Ensure scanning uses the correct NIC associated with a peered VNet or a dedicated subnet.

**3. Debugging Blocked Ports from Azure NSGs or Firewalls**

nmap -d9 10.0.3.6

This provides maximum debug detail and helps determine if traffic is silently dropped or refused.

**4. Tracing All Packets (e.g., To Analyze Azure Firewall Behavior)**

nmap --packet-trace 10.0.0.4

Allows you to inspect whether SYNs are leaving and if Azure returns any response (SYN/ACK, RST, etc.).

**5. Port State Reasoning**

nmap --reason 10.0.3.6

Helps you identify whether a port is marked "filtered" due to an Azure NSG rule, an Azure Firewall policy, or no response.

**6. Track Azure Exposure Over Time (e.g., with Ndiff)**

ndiff scan-before.xml scan-after.xml

Useful when pentesting during infrastructure changes, or confirming that a remediation (like an NSG rule) took effect.

**7. Only Show Open Ports**

nmap --open 10.0.3.6

Clean output for reporting during internal Azure assessments.

------------------------------------------------------------------------

**📄 Ndiff in Azure Pentest Reporting**

- Compare baseline scans vs. changes across Azure deployments.

- Identify drift in exposed services between environments (dev vs prod).

- Automate port exposure monitoring by cron/Nmap/ndiff with XML outputs.

Example:

ndiff -v scan-internal-vnet.xml scan-prod-vnet.xml

ndiff --xml scan1.xml scan2.xml \> port_diff.xml

Use --xml to integrate results into custom dashboards or SIEM for Azure SOC teams.

------------------------------------------------------------------------

**💡 Tips for Azure-Specific Nmap Use**

- **Azure NSGs** can silently drop traffic – always combine --reason, --packet-trace, and -d to verify.

- **Multi-NIC Azure VMs** (used in tiered networks or firewall placements) require careful use of -e and --iflist.

- **Azure Bastion** does **not** support raw socket tools like Nmap; run scans from inside a VM, not through Bastion.

- Consider **using Nmap inside a Jump Box or Azure Red Team VM** deployed to the target subnet for best results.

------------------------------------------------------------------------

Would you like a CLI-ready cheat sheet or a script that automates these steps for Azure VM recon?

# 2. Azure-Aware Scanning Fundamentals

## 2.1 Scanning Across Azure VNets and Subnets

## 2.2 Considerations with Azure NSGs (Network Security Groups)

## 2.3 Identifying Public vs Private IPs

## 2.4 Scanning in Hub-and-Spoke Topologies

## 2.5 Using Azure Bastion and Jump Hosts

# Scanning

Here’s a **corrected, summarized, and Azure-contextualized rewrite** of your Nmap section. The focus is on how each Nmap technique applies in **Azure Penetration Testing**, especially in the presence of **Network Security Groups (NSGs), VNets, Bastion hosts, and internal pivoting** scenarios.

------------------------------------------------------------------------

**🛠️ Nmap in Azure Penetration Testing**

| **Technique** | **Command** | **Azure Context & Usage** |
|----|----|----|
| **Scan Single Target** | nmap 10.10.10.10 | Scans top 1000 TCP ports of a public IP or internal VM. Useful for quick recon of externally exposed services (via NSG). |
| **Scan Multiple Targets** | nmap 10.10.10.10 10.10.10.11 10.10.10.12 | Target multiple Azure VMs (e.g., public IPs in the same resource group or exposed apps). |
| **Scan IP Range** | nmap 10.10.10.10-12 | Scan sequential internal IPs within a subnet (common for flat test VNets). |
| **Scan Subnet (CIDR)** | nmap 10.10.10.0/24 | Full internal subnet scan from a compromised VM or via tunnel. Use this when pivoting inside the VNet. |
| **Wildcard Scan** | nmap 10.10.10.\* | Less precise than CIDR, but works similarly; quickly sweep small internal ranges. |
| **Scan from Target List** | nmap -iL list.txt | Useful in automation (e.g., when extracting targets from AzureHound, BloodHound, or storage enumeration). |
| **Random IP Scan** | nmap -iR 5 | Not recommended in Azure; can trigger detection and wastes scan time. Azure ranges are mostly firewalled. |
| **Exclude Specific IPs** | nmap 10.10.10.0/24 --exclude 10.10.10.140 | Avoid scanning known honeypots or alerting IPs (e.g., Defender sensor VMs). |
| **Exclude IPs from List** | nmap 10.10.10.0/24 --excludefile list.txt | Automate exclusions during lateral movement across VMs. |
| **Aggressive Scan** | nmap -A 10.10.10.10 | Combines OS detection, script scan, and traceroute. High noise—use internally or only with stealth exceptions. |
| **IPv6 Target Scan** | nmap -6 fe80::29aa:9db9:4164:d80e | Rare in Azure environments but useful if IPv6 is misconfigured on internal VMs. |

------------------------------------------------------------------------

**🔎 Azure Pentest Notes:**

- Always assume **ICMP is blocked** by default in Azure NSGs — use -Pn when scanning public-facing VMs.

- When **inside the VNet**, unrestricted internal scanning (nmap -sS, -sV) is usually possible unless NSGs or microsegmentation is enabled.

- Use with **SSH tunnels**, **Azure Bastion** (via SOCKS proxy), or **compromised VM** for internal scans.

- -iL and --excludefile are helpful in **post-compromise automation** where many targets are enumerated.

------------------------------------------------------------------------

Would you like to integrate these into a markdown playbook or generate ready-to-run scripts for common Azure environments (e.g., internal pivot scan, public NSG recon, etc.)?

**🔍 Nmap Discovery & Scanning in Azure Penetration Testing (with Syntax)**

**🔹 Host Discovery Techniques**

| **Technique** | **Syntax** | **Azure Pentest Use** |
|----|----|----|
| **No Ping** | nmap -Pn \<target\> | Skip ICMP check (NSGs often block it); still scans all ports. |
| **Ping Sweep (ARP)** | nmap -sn \<subnet\> | Fast local VNET sweep (via VPN or Bastion); shows MACs. |
| **TCP SYN Ping** | nmap -PS \<target\> | Sends SYN (default port 80); bypasses ICMP filters. |
| **TCP ACK Ping** | nmap -PA \<target\> | Probes firewall behavior; maps filtered/unfiltered states. |
| **UDP Ping** | nmap -PU \<target\> | Useful when TCP blocked; default port 40125. |
| **SCTP INIT Ping** | nmap -PY \<target\> | For SCTP services (rare in Azure). |
| **ICMP Echo** | nmap -PE \<target\> | Standard ping; often blocked by Azure NSGs. |
| **ICMP Timestamp** | nmap -PP \<target\> | Alternate ICMP for detection if Echo fails. |
| **ICMP Address Mask** | nmap -PM \<target\> | Another ICMP-based discovery method. |
| **IP Protocol Ping** | nmap -PO 1,2,4 \<target\> | Sends raw packets using specific IP protocols. |
| **ARP Ping** | nmap -PR \<target\> | Local subnet (VNET) only; bypasses IP-layer restrictions. |
| **Traceroute** | nmap --traceroute \<target\> | Maps network paths—helpful for diagnosing routing/firewall layers. |
| **Force Reverse DNS** | nmap -R \<target\> | Reverse DNS every target (slower). |
| **Disable DNS** | nmap -n \<target\> | Speeds up large scans; no DNS lookups. |
| **System DNS Resolver** | nmap --system-dns \<target\> | Use host’s resolver (helpful for custom DNS). |
| **Set DNS Server** | nmap --dns-servers 8.8.8.8 \<target\> | Use specific DNS server for resolution. |
| **List Hosts Only** | nmap -sL \<range\> | Generates list of targets without scanning them. |

------------------------------------------------------------------------

**🔸 Port Scanning Options**

| **Purpose** | **Syntax** | **Azure Use** |
|----|----|----|
| **Fast Scan (Top 100)** | nmap -F \<target\> | Quick recon of common ports. |
| **Specific Ports** | nmap -p 22,80,443 \<target\> | Probe only known service ports. |
| **Named Ports** | nmap -p http,ftp,ssh \<target\> | Easier service targeting by name. |
| **Wildcard Port Name** | nmap -p "http\*" \<target\> | Find all HTTP-like services. |
| **Protocol-specific** | nmap -p T:80,U:53 \<target\> | TCP + UDP combo for DNS, SNMP, etc. |
| **All Ports** | nmap -p- \<target\> | Full TCP port sweep (0–65535). |
| **Open Ports Only** | nmap --open \<target\> | Filter out closed/filtered results. |
| **Scan with Reason** | nmap --reason \<target\> | See why port state was inferred (SYN-ACK, RST, etc.). |
| **Top X Ports** | nmap --top-ports 50 \<target\> | Limit scan to most common 50 ports. |
| **Sequential Ports** | nmap -r \<target\> | Useful for firewall timing analysis. |
| **Custom TCP Flags** | nmap --scanflags SYN,FIN \<target\> | Create stealthy scans. |

------------------------------------------------------------------------

**🔸 Advanced & Stealth Scans**

| **Type** | **Syntax** | **Use in Azure** |
|----|----|----|
| **TCP SYN Scan (Stealth)** | nmap -sS \<target\> | Half-open scan; stealthier than full connect. |
| **TCP Connect Scan** | nmap -sT \<target\> | Full connect; works when -sS fails. |
| **UDP Scan** | nmap -sU \<target\> | Required for UDP services (DNS, SNMP). |
| **NULL Scan** | nmap -sN \<target\> | No TCP flags; bypasses basic firewall checks. |
| **FIN Scan** | nmap -sF \<target\> | Sends TCP FIN only; triggers unusual firewall behavior. |
| **Xmas Scan** | nmap -sX \<target\> | URG + PSH + FIN flags; stealthy trick against stateless filters. |
| **ACK Scan** | nmap -sA \<target\> | Tests firewall rules; doesn’t show port state directly. |
| **Custom TCP Flags** | nmap --scanflags FINACK \<target\> | Combine flags to trigger IDS/firewall anomalies. |
| **IP Protocol Scan** | nmap -sO \<target\> | Scans supported IP-level protocols. |
| **Send Raw Ethernet** | nmap --send-eth \<target\> | Low-level scan on Layer 2 (VPN/local only). |
| **Send IP Packets** | nmap --send-ip \<target\> | Use system's IP stack—fallback for special networking setups. |

------------------------------------------------------------------------

**💡 Azure Tips**

- Use -Pn aggressively when scanning public Azure IPs (ICMP often dropped).

- Combine -sS -Pn --open --top-ports 100 -T4 for quick stealthy scanning.

- Inside an Azure VM or VNET, ARP (-PR) and full TCP (-sT) scans are reliable.

- Use ACK/NULL/Xmas for **NSG rule testing** (in Hub/Spoke or DMZ models).

- DNS lookups (-R, --system-dns) help detect internal domain info when inside VNET.

------------------------------------------------------------------------

Would you like a **PowerShell or Bash wrapper script** with pre-defined Azure Nmap scan profiles (e.g., "Public NSG Exposure", "Internal VM Scan", "UDP Service Detection")?

Thanks for sharing your outline. Here’s a detailed enhancement of your **Nmap for Azure Penetration Testing** playbook, improving organization, clarity, completeness, and Azure-specific tactics:

------------------------------------------------------------------------

**🔍 Nmap for Azure Penetration Testing**

A focused guide to reconnaissance and evasion against Azure-hosted environments.

------------------------------------------------------------------------

**1. 🎯 Host Discovery in Azure**

Azure’s public IPs can behave like regular internet hosts, but scanning ranges too aggressively may trigger detection or throttling.

**🔹 General IP Identification**

host \<domain\>.cloudapp.azure.com

nslookup \<vm-name\>.centralus.cloudapp.azure.com

**🔹 Quick ICMP Ping Sweep**

nmap -sn 20.50.10.0/24 --max-retries 1 --max-rate 20

**🔹 Stealthy Discovery with TCP ACK/SYN**

nmap -Pn -n -sA --host-timeout 60s --max-retries 2 -T2 -p 80,443 \<target-subnet\>

**🔹 Azure-Specific DNS Enumeration**

nmap --script dns-brute \<target\>.cloudapp.azure.com

------------------------------------------------------------------------

**2. 🔍 Stealth Port Scanning in Azure**

Azure NSGs (Network Security Groups), load balancers, and threat detection may alert on aggressive scans.

**🔹 Timing Profiles**

| **Timing** | **Description**            |
|------------|----------------------------|
| -T0        | Paranoid (IDS evasion)     |
| -T1        | Sneaky (low detectability) |
| -T2        | Polite (slow but safe)     |
| -T3        | Normal (default)           |

Use -T2 or -T1 in Azure to avoid detection by Defender for Cloud.

**🔹 Decoy IP Scanning**

nmap -Pn -sS -D RND:5 \<target\>

**🔹 Fragmented Packets (Firewall Evasion)**

nmap -f -sS \<target\>

------------------------------------------------------------------------

**3. 📦 Service Detection in Azure**

Azure often uses custom ports and load-balanced services. Perform safe version scans.

**🔹 Light Service Fingerprinting**

nmap -sV --version-light \<target\>

**🔹 Full Version Detection**

nmap -sV --version-all -p- --max-rate 50 -T2 \<target\>

------------------------------------------------------------------------

**4. 🚪 Port-Specific Azure Scans**

Some ports are more likely open in cloud environments.

**🔹 Azure Common Ports**

- 22: SSH (Linux VMs)

- 3389: RDP (Windows VMs)

- 5985/5986: WinRM

- 1433: SQL Server (Azure SQL)

- 443: HTTPS (Web Apps, Functions)

- 80: HTTP

- 10250/10255: AKS kubelet

- 53: DNS (Internal + Azure Firewall)

nmap -sS -Pn -p 22,3389,5985,5986,1433,443,80,10250,10255 \<target\>

------------------------------------------------------------------------

**5. 🧠 NSE Scripts for Azure Targets**

**🔹 SMB / Windows Services**

nmap -p 445 --script smb-os-discovery,smb-enum-shares \<target\>

**🔹 WinRM Exploitation Scripts**

nmap -p5985 --script http-winrm-enum \<target\>

**🔹 Azure SQL / MS-SQL**

nmap -p1433 --script ms-sql-info \<target\>

**🔹 Kubernetes (AKS)**

nmap -p10250 --script http-kubernetes-healthz \<target\>

------------------------------------------------------------------------

**6. 🛡️ Bypassing Azure Firewalls and NSGs**

Azure firewalls may block or shape Nmap behavior.

**🔹 Use --data-length to Obfuscate Payload Size**

nmap -sS -p 443 --data-length 50 \<target\>

**🔹 Scan from Within Compromised Azure VM (Pivoting)**

nmap -sS -Pn -T3 -p- 10.0.0.0/24

This bypasses Azure public perimeter defenses by scanning from inside the VNET.

------------------------------------------------------------------------

**7. 🎭 Scan Obfuscation Techniques**

| **Technique**   | **Command Example** |
|-----------------|---------------------|
| Decoy IPs       | -D RND:10           |
| Randomize Ports | --randomize-hosts   |
| Slow Scan       | -T1                 |
| Fragmentation   | -f                  |

------------------------------------------------------------------------

**8. 💥 Sample Azure VM Recon Workflow**

\# Step 1: Confirm Public IP

host \<vm-name\>.centralus.cloudapp.azure.com

\# Step 2: Check common ports

nmap -Pn -T2 -sS -p22,80,443,3389 \<target-ip\>

\# Step 3: Detect services

nmap -sV -Pn -p22,80,443,3389 \<target-ip\>

\# Step 4: Run relevant NSE scripts

nmap -sC -sV -p3389 --script rdp-enum-encryption \<target-ip\>

------------------------------------------------------------------------

**9. 🧪 Port Forwarding and Nmap (Post-Exploitation)**

If inside an Azure VM:

\# Use Nmap to scan internal subnet

nmap -sS -p- 10.1.0.0/24

\# Scan internal AKS nodes or CosmosDB exposed internally

nmap -Pn -p443,10250,10255,10260 10.240.0.0/16

Use socat or autossh to forward Nmap traffic back to local.

------------------------------------------------------------------------

**10. 📘 References**

- Azure NSG Best Practices: <https://learn.microsoft.com/en-us/azure/networking/network-security-groups-overview>

- Azure Defender for Cloud: <https://learn.microsoft.com/en-us/azure/defender-for-cloud/>

- Nmap Docs: <https://nmap.org/book/man.html>

------------------------------------------------------------------------

Would you like this formatted into a Markdown PDF or cheat sheet version next?

# OS Detection

Here is a **clean, corrected, and Azure-contextualized summary** of Nmap **OS and service detection techniques**, tailored specifically for **Azure penetration testing** scenarios, including hybrid and multi-tier cloud setups:

------------------------------------------------------------------------

**🛡️ Nmap OS & Service Detection in Azure Penetration Testing**

When performing reconnaissance against Azure VMs, PaaS services, or hybrid setups, **Nmap’s OS and service detection** features provide key insights for privilege escalation, lateral movement, and vulnerability mapping.

------------------------------------------------------------------------

**🖥️ Operating System Detection**

| **Option** | **Command** | **Azure Use Case** |
|----|----|----|
| **Detect OS** | nmap -O \[target\] | Identify guest OS of Azure VM (Linux, Windows) for tailored exploits or RCE payloads |
| **Limit OS Scans** | nmap -O --osscan-limit \[target/subnet\] | Avoid wasting time on hosts lacking required open/closed port ratio (common in filtered NSG rulesets) |
| **Guess OS** | nmap -O --osscan-guess | Useful for cloud services or load balancers with unusual TCP/IP stacks |
| **Verbose OS Detection** | nmap -O -v | Reveal more fingerprinting data, useful for custom Azure images or hardened VMs |
| **Submit Unknown Fingerprints** | Submit at: [nmap.org/submit](https://nmap.org/submit) | Helps improve detection of obscure Azure-hardened or IoT-based OSes (e.g., Azure Sphere, custom ARM images) |

OS detection relies on **at least one open and one closed port**, so in Azure, **NSGs or firewalls may interfere**, requiring coordination with port scans or internal positioning (e.g., via Jump Box).

------------------------------------------------------------------------

**🔎 Service Version Detection**

| **Option** | **Command** | **Azure Context** |
|----|----|----|
| **Version Detection** | nmap -sV \[target\] | Identify versions of open services (e.g., SSH, RDP, SQL) on Azure VMs for vuln mapping |
| **Force All Ports** | nmap -sV --allports | Override Nmap’s exclusion of problematic ports (e.g., 9100–9107), useful on print servers or rare ports |
| **Debug Version Detection** | nmap -sV --version-trace | Investigate incomplete service banners or load balancer interference in Azure environments |

Service detection is vital in Azure to reveal **self-hosted apps**, **open admin interfaces**, or **legacy services** running behind NSGs, Load Balancers, or Application Gateways.

------------------------------------------------------------------------

**📡 Remote Procedure Call (RPC) Detection**

| **Option** | **Command** | **Azure Relevance** |
|----|----|----|
| **Scan RPC Services** | nmap -sR \[target\] | Discover Windows RPC endpoints (e.g., SMB, MS-RPC) on domain-joined Azure VMs or AD DS-integrated resources |

Useful for **Active Directory enumeration** or identifying **remote management endpoints** on Windows VMs provisioned in hybrid cloud.

------------------------------------------------------------------------

**✅ Summary for Azure Pentesters**

| **Objective** | **Recommended Nmap Options** |
|----|----|
| **OS Detection (Stealth)** | -O --osscan-limit (when scanning filtered NSG zones) |
| **Best Effort OS Guessing** | -O --osscan-guess -v |
| **Version Discovery (Broad)** | -sV --allports |
| **Debug Cloud Load Balancer Interference** | -sV --version-trace |
| **RPC Enumeration on Win VMs** | -sR (for MSRPC, named pipes, etc.) |

------------------------------------------------------------------------

💡 **Pro Tip**: Combine with Azure-specific targeting like:

- Internal IP scan after compromise (10.0.0.0/8, 168.63.129.16)

- Scanning peered VNets via SSH tunnel or VPN

- Running through Azure Bastion or Jump Hosts

Would you like this section integrated into your full **Azure Nmap Scanning Playbook**, or turned into an automated **scan module script** for internal targets?

# 3. Firewall Evasion and Stealth Techniques

Here's a **refined and rewritten version** of your Nmap evasion guide, tailored specifically for **Azure penetration testing**. It summarizes key points, corrects minor issues, and explains how each feature can be applied in Azure environments:

------------------------------------------------------------------------

**🔍 Nmap Evasion Techniques in Azure Penetration Testing**

When performing penetration tests in Azure environments, defenders typically rely on **NSGs (Network Security Groups)**, **Azure Firewalls**, **WAFs**, and **third-party IDS/IPS systems**. These defenses can block or detect standard Nmap scans. However, **Nmap offers several evasion techniques** that can bypass or reduce detection.

Below are key Nmap evasion features relevant to Azure PenTest scenarios:

------------------------------------------------------------------------

**1. Fragment Packets (-f)**

**Usage**: nmap -f \<target\>

Breaks probe packets into 8-byte fragments to evade deep packet inspection and basic IDS.

**Azure Use Case**: Might bypass NSG inspection or poorly configured NVA (Network Virtual Appliance) filters.

------------------------------------------------------------------------

**2. Custom MTU Fragmentation (--mtu \<value\>)**

**Usage**: nmap --mtu 16 \<target\>

Sends packets with a custom MTU (must be a multiple of 8). Useful for fine-tuning fragmentation.

**Azure Use Case**: Helps evade systems that detect standard fragmentation but fail on custom-sized packets.

------------------------------------------------------------------------

**3. Decoy Scanning (-D)**

**Usage**: nmap -D RND:5 \<target\>

Spoofs traffic to appear as if multiple systems are scanning the target.

**Azure Use Case**: Can confuse logging systems like Azure NSG Flow Logs or Microsoft Sentinel by obscuring the true origin.

------------------------------------------------------------------------

**4. Idle Zombie Scan (-sI)**

**Usage**: nmap -sI \<idle_host\> \<target\>

Uses an idle third-party host to scan the target without revealing your own IP.

**Azure Use Case**: Useful when compromising an idle VM inside the same virtual network and pivoting through it undetected.

------------------------------------------------------------------------

**5. Source Port Manipulation (--source-port or -g)**

**Usage**: nmap --source-port 53 \<target\>

Forces probes to use a specific source port (e.g., DNS, DHCP), tricking firewalls that whitelist trusted ports.

**Azure Use Case**: Some internal Azure services or legacy NVAs may trust traffic from known ports like 53 or 20.

------------------------------------------------------------------------

**6. Append Random Data (--data-length)**

**Usage**: nmap --data-length 25 \<target\>

Adds junk data to packets to change their size and signature.

**Azure Use Case**: Helps bypass Azure-based IDS that flag based on typical scan packet size patterns.

------------------------------------------------------------------------

**7. Randomize Scan Order (--randomize-hosts)**

**Usage**: nmap --randomize-hosts \<IP-range\>

Scans hosts in a random order to avoid predictable scanning patterns.

**Azure Use Case**: Useful during reconnaissance on large Azure VNets or subnet ranges to evade threshold-based detection.

------------------------------------------------------------------------

**8. MAC Address Spoofing (--spoof-mac)**

**Usage**: nmap --spoof-mac 0 \<target\>

Sends probes with a fake MAC address.

**Azure Use Case**: Limited applicability unless operating within Azure VMs using bridged networking or conducting tests from on-prem via VPN/ExpressRoute into Azure.

------------------------------------------------------------------------

**9. Bad Checksums (--badsum)**

**Usage**: nmap --badsum \<target\>

Sends deliberately corrupted packets. Only misconfigured hosts may reply.

**Azure Use Case**: Useful to detect legacy or poorly configured systems inside Azure environments (e.g., old lift-and-shift VMs).

------------------------------------------------------------------------

**🚩 Summary for Azure PenTest**

| **Technique** | **Azure Utility** |
|----|----|
| -f, --mtu | Fragment probes to avoid deep packet inspection in NSGs and NVAs. |
| -D | Obfuscate scanning origin from NSG Flow Logs or Sentinel. |
| -sI | Perform stealth scans via idle internal VMs. |
| --source-port | Exploit trust-based rules (e.g., allow from port 53). |
| --data-length | Bypass signature-based detection. |
| --randomize-hosts | Reduce scan correlation on large VNETs. |
| --spoof-mac | Used in hybrid (on-prem \<--\> Azure) contexts. |
| --badsum | Discover vulnerable legacy systems in Azure. |

------------------------------------------------------------------------

Would you like this summarized as a one-pager PDF or Markdown file for use in your playbook?

## 3.1 Evading Azure NSGs and Firewalls

## 3.2 Fragment Packets

## 3.3 Spoof MAC Address

## 3.4 Use Decoys

## 3.5 Idle Scan / Zombie Hosts in Cloud

## 3.6 Source Port Manipulation (e.g., Port 53, 443)

## 3.7 Bypassing Azure WAF with Host Header Tricks (Nmap HTTP scripts)

Here's a **refined, summarized, and Azure-specific rewrite** of your content on using **Nmap for firewall evasion during Azure penetration testing**:

**🔍 Nmap for Firewall Evasion in Azure Penetration Testing**

During Azure penetration tests, Nmap is a crucial reconnaissance tool. However, due to Azure’s layered security controls—**Network Security Groups (NSGs), Azure Firewall, Application Gateway WAF**, and host-based firewalls—standard scans may be blocked or logged. To evade detection and bypass filtering mechanisms, Nmap provides several **evasion techniques** useful for probing hardened environments.

**🎯 Key Use Cases in Azure**

- Bypassing NSG/Firewall rules

- Identifying misconfigured network segmentation

- Scanning Azure VMs that are restricted to known service ports (e.g., 443)

- Evading logging for stealthier lateral movement or red teaming

**🚫 Evasion Techniques and Azure Usage**

| **Technique** | **Nmap Option** | **Azure-Specific Context** |
|----|----|----|
| **Fragment Packets** | -f | Useful against legacy appliances or misconfigured firewalls; may evade NSGs that don't reassemble fragmented packets. |
| **Custom MTU** | --mtu \<value\> | Sends packets in user-defined sizes. Could help bypass Azure Firewall if inspection logic is size-specific. |
| **Decoy Scanning** | -D RND:10 | Hides real scanner among fake IPs. Can obfuscate source when NSG flow logs are being monitored. |
| **Idle Zombie Scan** | -sI \<zombie\> \<target\> | Leverages an idle Azure VM or public IP to proxy the scan, hiding the original attacker source. |
| **Source Port Manipulation** | --source-port \<port\> or -g | Mimics trusted services like DNS (53) or HTTPS (443). Can exploit NSGs that allow specific source ports. |
| **Random Data in Packets** | --data-length \<bytes\> | Avoids detection by signature-based IDS/IPS or Azure WAF if based on packet sizes. |
| **Random Target Order** | --randomize-hosts | Prevents pattern-based detection or alerting from Azure Defender or custom monitoring rules. |
| **MAC Address Spoofing** | --spoof-mac | Can spoof MACs in Layer 2 network simulations (e.g., nested Azure environments or containers). |
| **Bad Checksums** | --badsum | Sends intentionally corrupted packets. Rarely useful in Azure, but could help identify weak VM host firewalls. |

**📝 Output Handling for Azure Environments**

| **Output Format** | **Nmap Option** | **Use Case** |
|----|----|----|
| **Normal Text** | -oN scan.txt | Good for basic audit logs or note-taking. |
| **XML Output** | -oX scan.xml | Ideal for parsing scan results with tools like Nmap XML Parser, SIEM, or reporting dashboards. |
| **Grepable Output** | -oG scan.grep | Use with grep, awk, or automation scripts. |
| **All Formats** | -oA basefilename | Saves results in all formats simultaneously. |
| **Periodic Stats** | --stats-every 10s | Useful when scanning large IP ranges in Azure subnets. |

**✅ Recommendations for Azure Pentesting**

- Use **--source-port 443** when scanning public-facing Azure web apps to blend in with normal HTTPS traffic.

- Combine **-f or --mtu 16** with **--send-eth** if packet fragmentation is required across virtual networks or VPN gateways.

- Use **decoys or idle scans** from internal Azure VMs to pivot stealthily in **hub-spoke architectures**.

- Store results in **-oX format** and correlate them with NSG flow logs or Microsoft Defender logs to analyze visibility gaps.

Would you like a command cheat sheet or a playbook section for these techniques within an actual Azure scenario (e.g., scanning from a compromised VM inside a subnet)?

Firewall Evasion

Firewalls and intrusion prevention systems are designed to prevent tools like Nmap from getting an accurate picture of the systems they are protecting. Nmap includes several features designed to circumvent these defenses. This section discusses the various evasion techniques built into Nmap.

| **Technique** | **Command** | **Description** |
|----|----|----|
| **Manually Specify a Source Port** | nmap --source-port \[port\] \[target\] |  The --source-port option is used to manually specify the source port number of a probe. Every TCP segment contains a source port number in addition to a destination. By default, Nmap will randomly pick an available outgoing source port to probe a target. The --source-port option will force Nmap to use the specified port as the source for all packets. This technique can be used to exploit weaknesses in firewalls that are improperly configured to blindly accept incoming traffic based on a specific port number. Port 20 (FTP), port 53 (DNS), and 67 (DHCP) are common ports susceptible to this type of scan. |
| **Append Random Data** | nmap --data-length \[size\] \[target\] |  The --data-length option can be used to append random data to probe packets. |
| **Randomize Target Scan Order** | nmap --randomize-hosts \[target\] |  The --randomize-hosts option is used to randomize the scanning order of the specified targets. |
| **Spoof MAC Address** | nmap --spoof-mac \[MAC\|0\|vendor\] \[target\] |  The --spoof-mac is used to spoof the MAC (Media Access Control) address of an ethernet device. |
| **Send Bad Checksums** | nmap --badsum \[target\] |  The --badsum option is used to send packets with incorrect checksums to the specified host. |

| **Technique** | **Command** | **Description** |
|----|----|----|
| **Fragment Packets** | nmap -f \[target\] |  The -f option is used to fragment probes into 8-byte packets. The -f option instructs Nmap to send small 8-byte packets thus fragmenting the probe into many very small packets. This option isn’t particularly useful in everyday situations; however, it may be helpful when attempting to evade some older or improperly configured firewalls. |
| **Specify a Specific MTU** | nmap --mtu \[MTU\] \[target\] |  The --mtu option is used to specify a custom MTU (Maximum Transmission Unit). |
| **Use a Decoy** | nmap -D RND:\[number\] \[target\] |  The -D option is used to mask an Nmap scan by using one or more decoys. |
| **Idle Zombie Scan** | nmap -sI \[zombie\] \[target\] | The -sI option is used to perform an idle zombie scan. The idle zombie scan is a unique scanning technique that allows you to exploit an idle system and use it to scan a target system for you. In this example 10.10.1.41 is the zombie and 10.10.1.252 is the target system. The scan works by exploiting the predictable IP sequence ID generation employed by some systems. In order for an idle scan to be successful, the zombie system must truly be idle at the time of scanning. |

# Firewall Evasion Techniques (Azure-Specific Context)

When testing Azure environments, Nmap can help **bypass Network Security Groups (NSGs)**, Azure Firewall, or custom appliance-based filtering by mimicking stealth behavior. These techniques are particularly useful during **external recon** or **pivoting inside hybrid networks**.

| **Evasion Technique** | **Command** | **Azure PenTest Usage** |
|----|----|----|
| **Fragment Packets** | nmap -f \[target\] | Bypass basic packet filters or NSG rules by splitting headers |
| **Custom MTU Size** | nmap --mtu 24 \[target\] | Mimic non-standard traffic; useful in hybrid environments |
| **Use Decoys** | nmap -D RND:10 \[target\] | Hide real source IP from Azure logging tools (like Defender for Cloud) |
| **Idle Zombie Scan** | nmap -sI \[zombie\] \[target\] | Perform stealthy scans using another Azure host |
| **Source Port Spoofing** | nmap --source-port 53 \[target\] | Simulate trusted service traffic (DNS, HTTP, etc.) |
| **Append Random Data** | nmap --data-length 50 \[target\] | Obfuscate scan signatures to evade intrusion detection |
| **Random Target Order** | nmap --randomize-hosts \[target-list\] | Avoid detection via predictable scan patterns |
| **MAC Spoofing** | nmap --spoof-mac Cisco \[target\] | Bypass MAC-based filtering in tightly secured subnets |
| **Bad Checksums** | nmap --badsum \[target\] | Test if security devices perform deep packet validation |

⚠️ Use with **caution** in production-like environments. These techniques may violate Azure terms of use if performed without authorization.

**📄 Output Options for Azure Reports**

During Azure pentests, output management is key for report writing, tracking misconfigurations, and comparing scans across sessions.

| **Output Type** | **Command** | **Description** |
|----|----|----|
| **Normal Text Output** | nmap -oN scan.txt \[target\] | Easy-to-read format for basic reports |
| **XML Output** | nmap -oX scan.xml \[target\] | Integrates with parsing tools and dashboards |
| **Grepable Output** | nmap -oG scan.grep \[target\] | Filter specific ports/services |
| **All Formats** | nmap -oA /path/scan \[target\] | Saves in TXT, XML, and Grep formats |
| **Periodic Stats** | nmap --stats-every 10s \[target\] | Useful during long Azure subnet scans |
| **1337 Output** | nmap -oS scan.l33t \[target\] | Fun format (not practical for real use) |

**🧪 Debugging, Troubleshooting & Interface Control**

Helps fine-tune scan performance and interpret scan behavior in Azure, especially when network controls are blocking traffic or reducing scan fidelity.

| **Feature** | **Command** | **Usage** |
|----|----|----|
| **Get Help** | nmap -h | Displays help for all options |
| **Show Version** | nmap -V | Confirm version (check for latest NSE support) |
| **Verbose Mode** | nmap -v \[target\] | Get more details during scans |
| **Debug Mode** | nmap -d \[target\] | Deep debugging—helpful for NSG troubleshooting |
| **Reason Flags** | nmap --reason \[target\] | Explain why Nmap thinks a port is open/closed |
| **Open Ports Only** | nmap --open \[target\] | Cleaner output |
| **Packet Tracing** | nmap --packet-trace \[target\] | Observe how Azure responds at packet level |
| **Interface Listing** | nmap --iflist | Show interfaces for multi-subnet Azure setups |
| **Use Specific NIC** | nmap -e eth0 \[target\] | Specify which Azure NIC to scan from |

# 4. Timing and Throttling Adjustments

## 4.1 Azure Rate Limiting Considerations

## 4.2 Avoiding Detection by Defender for Cloud

## 4.3 Defeating Reset Rate Limits

## 4.4 Timing Template Overview (T0-T5)

# Nmap Timing & Performance Tuning 

In Azure environments, optimizing scan timing is essential to balance **stealth, accuracy, and speed**—especially when navigating **NSGs, Azure Firewalls, or rate-limited services**.

**🔁 Timing Templates (-T0 to -T5)**

| **Template** | **Command** | **Azure Use Case** |
|----|----|----|
| **T0 – Paranoid** | nmap -T0 \[target\] | Avoid triggering IDS/IPS (extremely slow) |
| **T1 – Sneaky** | nmap -T1 \[target\] | Useful for stealthy scans against monitored endpoints |
| **T2 – Polite** | nmap -T2 \[target\] | Scan across shared Azure VNets to reduce noise |
| **T3 – Normal** | nmap -T3 \[target\] | Default; balanced for internal or hybrid environments |
| **T4 – Aggressive** | nmap -T4 \[target\] | Fast scans within Azure VM subnets (trusted) |
| **T5 – Insane** | nmap -T5 \[target\] | High-speed scan (may overwhelm weak hosts or alert WAFs) |

⚠️ In **production or monitored Azure environments**, use T0–T2 for stealth. Use T4–T5 in **test labs or internal ranges**.

**📦 Packet & Parallelism Tweaks for Azure Cloud Networks**

| **Option** | **Command** | **Azure Context** |
|----|----|----|
| **Set TTL** | --ttl 128 | Bypass routing filters or confuse traceroute-based logging |
| **Min Parallelism** | --min-parallelism 25 | Speed up scans in fast internal VNet setups |
| **Max Parallelism** | --max-parallelism 200 | Risky but useful in low-latency Azure test environments |
| **Min Host Group** | --min-hostgroup 3 | Control host batching for efficient scans in a VM scale set |
| **Max Host Group** | --max-hostgroup 10 | Throttle the host batching to prevent bandwidth spikes |

**🕓 RTT & Retransmission Tuning (Latency Control)**

| **Option** | **Command** | **Azure Use Case** |
|----|----|----|
| **Initial RTT Timeout** | --initial-rtt-timeout 300ms | Useful for fast VNet scans |
| **Max RTT Timeout** | --max-rtt-timeout 400ms | Prevent long delays due to Azure Firewall/NSG lag |
| **Max Retries** | --max-retries 3 | Lower retry count to avoid noisy scans or slow hosts |
| **Host Timeout** | --host-timeout 2m | Skip slow/unresponsive hosts in large-scale subnet sweeps |

Use tighter **RTT values** in well-provisioned Azure VNets. Increase values for **hybrid/cloud-to-on-prem scans**.

**💤 Delays & Rate Limiting Controls**

| **Option** | **Command** | **Azure PenTest Use** |
|----|----|----|
| **Scan Delay** | --scan-delay 5s | Bypass host-based IDS or WAF that detects probe frequency |
| **Max Scan Delay** | --max-scan-delay 10s | Add ceiling delay for consistency in slow environments |
| **Min Packet Rate** | --min-rate 30 | Force minimum speed for impatient scans on DevTest environments |
| **Max Packet Rate** | --max-rate 50 | Avoid alerting Azure monitoring tools during recon |
| **Defeat RST Rate Limits** | --defeat-rst-ratelimit | Bypass systems limiting TCP RSTs (e.g., App Gateways, Web Apps) |

Rate limits are often enforced by **NSGs and Azure PaaS firewalls**. Use custom delays/rates to avoid triggering them.

**✅ Summary for Azure Pentesters**

| **Goal** | **Recommended Options** |
|----|----|
| **Stealth Scans** | -T0 or -T1, --scan-delay, --max-rate 0.5 |
| **Fast Internal VNet Scans** | -T4, --min-parallelism, --min-rate |
| **Scanning Across Azure Regions or Hybrid** | Increase --max-rtt-timeout, moderate --max-retries |
| **Avoiding Rate Limits (WAF/NSG)** | Use --scan-delay, --defeat-rst-ratelimit, lower --max-rate |
| **Efficient Reporting** | Combine with -oA or -oX for exportable results |

Would you like this added to your **Azure PenTest playbook PDF/Markdown** or integrated into a **step-by-step scanning automation script**?

# 5. Output and Reporting

## 5.1 Grepable Output for Automated Pipelines

## 5.2 Save Output to XML/JSON for Azure DevOps Pipelines

## 5.3 Output All Supported Formats

## 5.4 Display Real-Time Scan Stats

## 5.5 1337/Custom Output Formats

# 6. Troubleshooting and Debugging

## 6.1 Verbose Mode in Cloud Networks

## 6.2 Debugging in Complex Azure VNets

## 6.3 Interface Selection in VM with Multiple NICs

## 6.4 Trace Packet Paths (like traceroute through Azure)

Here’s a rewritten and summarized version of the Nmap troubleshooting and debugging section, **tailored specifically for Azure Penetration Testing**. This version emphasizes **how and why these options are useful in Azure environments**, especially during assessments of Azure VMs, internal networks, hybrid setups, and Bastion configurations.

**🔍 Nmap Troubleshooting & Debugging in Azure PenTesting**

When performing Azure penetration testing, Nmap may occasionally return no results or unexpected behavior due to **cloud-specific networking limitations**, **firewall rules (NSGs/ASGs)**, or **load balancer configurations**. These core debugging options help **identify visibility gaps, connectivity issues**, or **misconfigured scanning environments**.

**🆘 1. Getting Help**

nmap -h

**Use in Azure**: Quickly reference options when working inside restricted Azure jumpboxes or ephemeral VMs with no internet access.

**🔢 2. Check Nmap Version**

nmap -V

**Use in Azure**: Ensure you're using a recent version to support updated NSE scripts and modern TLS fingerprinting, crucial for scanning newer Azure services.

**📢 3. Verbose Output**

nmap -v -A \<target\>

**Use in Azure**: View progress and DNS resolution steps when probing Azure VMs behind load balancers or using hostnames like vmname.eastus.cloudapp.azure.com. Use -vv for deeper scan insights.

**🐞 4. Debug Mode**

nmap -d4 \<target\>

**Use in Azure**: See behind-the-scenes details when scans seem blocked by NSGs or ASGs, especially useful for diagnosing why a service isn't responding from within a subnet.

**🧠 5. Show Reason for Port State**

nmap --reason \<target\>

**Use in Azure**: Helps confirm whether ports are **filtered** (common in Azure due to NSG rules) or **closed** due to actual host behavior.

**🔓 6. Only Show Open Ports**

nmap --open \<target\>

**Use in Azure**: Clean output when scanning large Azure IP blocks or VMs with minimal surface. Speeds up triage by hiding filtered/closed ports.

**📡 7. Trace Packets**

nmap --packet-trace \<target\>

**Use in Azure**: Detect dropped packets due to NSG, Azure Firewall, or routing restrictions. Helpful when probing between Azure VNets or from Bastion to internal nodes.

**🌐 8. Show Local Network Interfaces**

nmap --iflist

**Use in Azure**: Confirm what IP and interface are being used inside an Azure VM or container (especially in multi-NIC or hybrid setups).

**🔌 9. Choose Interface Manually**

nmap -e eth0 \<target\>

**Use in Azure**: Force Nmap to use a specific NIC in **multi-interface** Azure VMs (e.g., dual-homed VPN gateway, FortiGate VM, or hybrid on-prem-connected servers).

**🛠 Summary for Azure Context**

| **Nmap Option** | **Azure Pentest Use Case** |
|----|----|
| -v, -vv | Diagnose scanning across NSGs/LBs or troubleshoot DNS in cloud |
| -d, -d4, -d9 | Debug low-level scan behavior from Bastion or ephemeral VMs |
| --packet-trace | Verify packet flow in segmented VNets or across firewalls |
| --reason | Confirm filtering vs closed vs unreachable hosts |
| --iflist / -e | Use the correct network interface on multi-NIC VMs or hybrid setups |
| --open | Simplify output when scanning many Azure IPs or ranges |
| -h, -V | Help and version check, especially on jumpboxes or limited installs |

Would you like this in a markdown, PDF, or scriptable CLI cheatsheet format for Azure pentest tooling?

# 7. Scripted Recon with NSE

Here’s a summarized, corrected, and rewritten version tailored specifically for **Azure Penetration Testing** using **Nmap and the Nmap Scripting Engine (NSE)**:

------------------------------------------------------------------------

**🔍 Using Nmap NSE in Azure Penetration Testing**

The **Nmap Scripting Engine (NSE)** is a powerful extension of Nmap, ideal for automating reconnaissance, vulnerability discovery, and misconfiguration detection—key components in Azure pentesting. NSE scripts are written in Lua and can target a wide range of services, including web apps, SSH, SMB, Azure-exposed DNS, and others deployed in cloud VMs or public IPs.

⚠️ **Important**: Only use NSE scripts on Azure resources you are authorized to test. Some scripts are **intrusive** and can cause **disruption or downtime**.

------------------------------------------------------------------------

**✅ Why NSE Matters in Azure Pentesting**

- Detect open and misconfigured services in Azure VMs and PaaS instances.

- Identify vulnerable services exposed via Azure Public IPs or Load Balancers.

- Script authentication tests and remote service enumeration.

- Correlate findings with Azure-specific components (e.g., NSGs, VNets).

------------------------------------------------------------------------

**🚀 Common NSE Usage Patterns in Azure Context**

| **Use Case** | **Example Command** |
|----|----|
| Run a Specific Script | nmap --script whois.nse \<azure-ip\> |
| Run Scripts by Pattern | nmap --script "http-\*" \<azure-ip\> |
| Run Script Categories | nmap --script vuln \<azure-ip\> |
| Run Multiple Categories | nmap --script malware,vuln \<azure-ip\> |
| Exclude Categories | nmap --script "not intrusive" \<azure-ip\> |
| Troubleshoot Script Execution | nmap --script default --script-trace \<azure-ip\> |
| Update Script Database | nmap --script-updatedb |

------------------------------------------------------------------------

**📁 NSE Script Categories (Useful for Azure)**

| **Category** | **Purpose in Azure Pentesting**                            |
|--------------|------------------------------------------------------------|
| default      | Basic host info (good initial scan for VMs, endpoints)     |
| auth         | Test for weak auth (Azure-exposed RDP, SSH, SMB)           |
| discovery    | Deep asset discovery (hostnames, open services)            |
| external     | Lookup info via public sources (e.g., whois, geolocation)  |
| safe         | Scripts that are non-intrusive and suitable for production |
| vuln         | Test for known CVEs (e.g., SMB, RDP, HTTP vulnerabilities) |
| malware      | Detect default backdoors (e.g., remote shells, RATs)       |
| intrusive    | Run with caution; can disrupt services (e.g., brute-force) |

💡 Use -sC as a shorthand for --script default

------------------------------------------------------------------------

**💻 Example Scenarios in Azure**

**1. Enumerate exposed services on a VM**

nmap -sS -sV --script default \<vm-ip\>

**2. Check for open SMTP relay**

nmap --script "smtp-open-relay,smtp-commands" \<azure-ip\>

**3. Detect vulnerable web services**

nmap -p 80,443 --script vuln \<azure-ip\>

**4. Discover shadow admin interfaces**

nmap --script "http-admin-\*" \<azure-ip\>

**5. Update NSE script index (if you added new custom scripts)**

nmap --script-updatedb

------------------------------------------------------------------------

**🔧 Troubleshooting NSE Scripts**

If a script fails or you want to debug its network behavior:

nmap --script http-title --script-trace \<azure-ip\>

Redirect output for deeper analysis:

nmap --script vuln --script-trace \<azure-ip\> \> trace_output.txt

------------------------------------------------------------------------

**📚 Best Practices**

- Always validate **Azure NSG** and **firewall rules** before scanning.

- Start with --script safe before using vuln or intrusive.

- Combine NSE scans with **Azure Monitor logs** to observe potential detections.

- Integrate NSE output with **BloodHound** or **custom Azure recon tools** for lateral movement analysis.

------------------------------------------------------------------------

Would you like a cheat sheet or script automation wrapper for NSE scans in Azure?

## 7.1 Using NSE to Enumerate Azure Services

## 7.2 Key NSE Scripts for Azure:

- http-title

- smb-enum-shares

- ssh-hostkey

- azure-ad-enum (if custom)

## 7.3 Running Script Categories

## 7.4 Troubleshooting Failing Scripts

## 7.5 Updating NSE Libraries for Cloud

# Nmap Scripting Engine (NSE) in Azure PenTest

Use the NSE to automate enumeration of services like **Azure App Services, exposed Redis/SQL, SMB on VMs**, and more.

| **Feature** | **Command** | **Use Case** |
|----|----|----|
| **Run Specific Script** | nmap --script http-enum \[target\] | Enumerate Azure Web Apps |
| **Multiple Scripts** | nmap --script "vuln,http-\*" | Target multiple vulnerabilities |
| **By Category** | nmap --script vuln \[target\] | Run category-wise (auth, safe, brute, etc.) |
| **Troubleshoot Script** | nmap --script-trace --script smb-os-discovery \[target\] | View NSE packet activity |
| **Update Script DB** | nmap --script-updatedb | Ensure new scripts are indexed |

**Relevant NSE Categories for Azure:** default, vuln, auth, discovery, safe, brute

**🔁 Comparing Results with Ndiff (Azure Scan Diffing)**

Use **Ndiff** to compare historical scan data (e.g., pre- and post-patching scans of an Azure subnet).

| **Feature** | **Command** | **Description** |
|----|----|----|
| **Compare XML Scans** | ndiff scan1.xml scan2.xml | See changes in port/service exposure |
| **Verbose Mode** | ndiff -v scan1.xml scan2.xml | Detailed view of changes |
| **XML Output Mode** | ndiff --xml scan1.xml scan2.xml | For integration with dashboards or ticketing tools |

**✅ Summary for Azure Pentesters:**

| **Tool** | **Usage in Azure** |
|----|----|
| **Nmap** | Host discovery, service detection, firewall testing |
| **NSE** | Automate detection of CVEs, weak configs, and exposed services |
| **Firewall Evasion** | Bypass NSGs/Azure Firewall using advanced flags |
| **Output Control** | Produce structured reports for compliance and auditing |
| **Ndiff** | Track changes across blue/green deployments or patch cycles |

Would you like me to generate a **cheat sheet PDF** or markdown version of this summary for your toolkit?

Here’s a **rewritten, corrected, and Azure-focused summary** of how to use the **Nmap Scripting Engine (NSE)** in an **Azure penetration testing** context:

**🔍 Nmap Scripting Engine (NSE) in Azure Penetration Testing**

The **Nmap Scripting Engine (NSE)** is a powerful extension of Nmap that enables automated reconnaissance, vulnerability scanning, and exploitation. It’s especially useful during **external and internal enumeration** phases of an Azure penetration test, such as when targeting exposed Azure VMs, containers, services behind public IPs, or internal services discovered after lateral movement.

**⚠️ Warning**: NSE scripts can be **intrusive or disruptive**, especially the vuln, intrusive, and exploit categories. Use them only in authorized environments with explicit permission (e.g., your own test tenant or Red Team engagement scope).

**📌 Use Cases in Azure Pentesting**

| **Phase** | **NSE Use Case** |
|----|----|
| External Recon | Identify open management ports (SSH, RDP, WinRM) on Azure VMs |
| Internal Enumeration | Probe service banners or SMB shares on compromised VMs or network pivots |
| Vulnerability Scanning | Use vuln category scripts to detect common misconfigurations and CVEs |
| Privilege Escalation | Check for weak authentication mechanisms via auth scripts |
| Post-Exploitation | Confirm persistence backdoors or malware indicators via malware category |

**🔧 Core NSE Features and Syntax**

| **Feature** | **Example Syntax** |
|----|----|
| Run a specific script | nmap --script whois.nse \<target\> |
| Run multiple scripts | nmap --script http-title,http-headers \<target\> |
| Run by category | nmap --script vuln \<target\> |
| Use wildcard or expression | nmap --script "http\*" \<target\> or nmap --script "default or safe" |
| Pass arguments to scripts | nmap --script http-enum --script-args http.useragent="Mozilla" \<target\> |
| Trace script actions (debug) | nmap --script vuln --script-trace \<target\> |
| Update NSE database | nmap --script-updatedb |

**📁 NSE Script Categories (Common in Azure Tests)**

| **Category** | **Purpose & Azure Use** |
|----|----|
| default | General info gathering (useful on unknown Azure VMs) |
| auth | Test for weak or default credentials (Azure IaaS VMs) |
| vuln | Detect known vulnerabilities (e.g., outdated SSH, SMB services) |
| discovery | Enumerate services, hostnames, banners (internal Azure networks) |
| malware | Check for potential malware backdoors (post-exploitation) |
| safe | Non-intrusive scans (suitable for initial recon) |
| intrusive | Aggressive probing (only for safe test labs or approved engagements) |

**🧪 Examples in Azure Context**

\# 1. Scan an exposed Azure VM for vulnerabilities

nmap -Pn -sV --script vuln 20.75.98.140

\# 2. Enumerate SMB info on an internal VM from a compromised Azure VM

nmap --script smb-os-discovery,smb-enum-shares 10.0.1.5

\# 3. Use safe scripts for reconnaissance on multiple VMs in a subnet

nmap -sC 10.0.2.0/24

\# 4. Run all SMTP-related scripts (e.g., for misconfigured mail relays)

nmap --script "smtp\*" 10.0.0.7

\# 5. Debug NSE script output and save to file for analysis

nmap --script vuln 10.0.0.5 --script-trace \> smtp_trace.txt

**⚙️ Script Storage and Updating**

- NSE scripts are stored by default in:

  - Linux: /usr/share/nmap/scripts/

  - Windows: C:\Program Files\Nmap\scripts\\

- After adding/removing custom scripts:

- nmap --script-updatedb

**✅ Best Practices for Azure Environments**

- **Start with -sC (default category)** for basic info-gathering.

- Use --script "safe" for **compliance-safe scans**.

- Use --script-args for **authentication or custom targeting** (e.g., smb\*, http\*).

- Run vulnerability checks only in **approved lab/test environments**.

- Pair with -sV -sT -Pn for **detailed service enumeration** on live hosts.

Would you like a pre-built NSE script bundle optimized for Azure VM, SMB, and HTTP enumeration scenarios?

Great question. In **Azure penetration testing**, the most commonly used **Nmap NSE scripts** target **common services exposed by Azure IaaS and PaaS components**, especially those found on **Azure VMs, Azure Load Balancers, Bastion Hosts, App Services, and Hybrid Environments**.

Here’s a categorized list of **high-value NSE scripts** most useful in Azure pentesting scenarios:

**🔥 Most Used Nmap NSE Scripts in Azure PenTesting**

**✅ General Recon and Host Discovery**

| **Script** | **Use Case** |
|----|----|
| http-title | Grab webpage title from Azure-hosted services (App Services, VMs) |
| http-headers | Inspect HTTP headers (for tech stack leaks or CSP flaws) |
| http-server-header | Identify web server type and version |
| http-enum | Discover directories/files on Azure web apps |
| http-methods | Check for risky HTTP verbs like PUT, DELETE |
| http-robots.txt | Find hidden/disallowed directories in App Services |
| ssl-cert | Inspect SSL/TLS certificates on HTTPS endpoints |
| dns-brute | Subdomain enumeration on \*.azurewebsites.net or \*.cloudapp.net |
| dns-zone-transfer | Rare, but useful in misconfigured internal DNS setups |

**💻 Windows & SMB (Azure Windows VMs, Hybrid Infra)**

| **Script** | **Use Case** |
|----|----|
| smb-os-discovery | Discover OS, domain, workgroup info on Windows VMs |
| smb-enum-shares | Enumerate accessible SMB shares |
| smb-enum-users | Enumerate user accounts via SMB |
| smbv2-enabled | Check for SMBv2 support (common in Azure AD-joined machines) |
| nbstat | Get NetBIOS names and MAC address info |

**🔐 Authentication & Credential Testing**

| **Script**       | **Use Case**                                            |
|------------------|---------------------------------------------------------|
| ssh-auth-methods | Check available SSH auth methods (password, public key) |
| ssh-brute        | Brute-force SSH (with permission only)                  |
| smb-brute        | Brute SMB accounts (internal, with permission)          |
| ftp-anon         | Detect anonymous FTP access on misconfigured services   |
| http-auth-finder | Identify HTTP pages protected by basic/digest auth      |

**⚠️ Vulnerability Assessment (Highly Used Internally)**

| **Script** | **Use Case** |
|----|----|
| vulners | Query Vulners DB to detect known CVEs for open services |
| smb-vuln-ms17-010 | Check for EternalBlue vulnerability (on legacy Azure VMs) |
| smb-vuln-ms08-067 | Older but still sometimes seen in test environments |
| http-vuln-cve2017-5638 | Apache Struts check (used in some internal apps) |
| ssl-heartbleed | Detect vulnerable OpenSSL services (rare in Azure now, but relevant) |

**🕵️ Cloud and Metadata-Specific (Azure-relevant)**

| **Script** | **Use Case** |
|----|----|
| http-azure-ms-version | Detect Azure-specific HTTP headers and versioning (custom NSE often needed) |
| http-userdir-enum | Detect user directories on web servers |
| http-config-backup | Check for backup config files in App Services (e.g., .bak, .old) |

🔧 *Note: Some cloud-specific NSE scripts (e.g., Azure metadata or API endpoint enumeration) are typically custom-developed and not included in the default NSE script set. For example, testing access to http://169.254.169.254/metadata/instance from a compromised Azure VM is done via curl or Python, not Nmap.*

**🧠 Usage Tip**

To run a **focused Azure recon scan**, combine:

nmap -Pn -sV -sC --script http-title,http-methods,http-enum,smb-os-discovery,smb-enum-shares,ssl-cert,vulners -oA azure_scan \<target\>

Or to scan all default scripts:

nmap -Pn -sC -sV \<target\>

Would you like a custom NSE script bundle or wrapper tailored for Azure environments (e.g., Bash or PowerShell wrapper with script presets)?

# Host Comparison with Ndiff

Here’s a **summarized, corrected, and Azure-focused rewrite** of the Nmap and Ndiff content you provided, placing everything in the **context of Azure penetration testing**:

------------------------------------------------------------------------

**🔍 Nmap & Ndiff in Azure Penetration Testing**

**🧭 Purpose**

In Azure environments, Nmap is primarily used for **network reconnaissance** and **service enumeration**. It's particularly valuable when testing Azure VMs, subnets in virtual networks (VNets), exposed public IPs, or hybrid setups involving VPN/ExpressRoute connections.

------------------------------------------------------------------------

**🔧 Common Nmap Techniques for Azure PenTest**

| **Technique** | **Command** | **Azure-Specific Use** |
|----|----|----|
| **Scan Single VM** | nmap 10.0.0.4 | Check open ports on a specific Azure VM. |
| **Scan Multiple VMs** | nmap 10.0.0.4 10.0.0.5 | Enumerate multiple known targets (VMs or on-prem hybrid hosts). |
| **Scan Subnet** | nmap 10.0.0.0/24 | Scan an entire subnet inside a VNet to identify exposed services. |
| **Scan IP Range** | nmap 10.0.0.4-10 | Useful for spotting gaps in NSGs or poorly segmented networks. |
| **Target List File** | nmap -iL targets.txt | Enumerate scoped assets, possibly exported from Azure resource lists or BloodHound/AzureHound. |
| **Exclude Targets** | nmap 10.0.0.0/24 --exclude 10.0.0.10 | Avoid scanning honeypots or known defensive systems. |
| **Aggressive Scan** | nmap -A 10.0.0.4 | Runs OS detection, script scanning, and traceroute — ideal for post-access info gathering. |
| **IPv6 Scan** | nmap -6 \<IPv6\> | Relevant in hybrid cloud if IPv6 is enabled or dual-stack is in use. |

------------------------------------------------------------------------

**🔄 Change Detection with Ndiff**

In Azure environments, **Ndiff** is useful for:

- Monitoring exposed ports over time.

- Detecting Azure VM configuration drift.

- Validating post-exploitation changes (e.g., ports opened by malware or agents).

**Ndiff Command Examples**

| **Use Case**      | **Command**                                 |
|-------------------|---------------------------------------------|
| Compare Two Scans | ndiff scan1.xml scan2.xml                   |
| Verbose Output    | ndiff -v scan1.xml scan2.xml                |
| Export to XML     | ndiff --xml scan1.xml scan2.xml \> diff.xml |

**Sample Use:**

nmap -oX baseline.xml 10.0.0.4

\# After simulating lateral movement or deploying agents

nmap -oX postexploit.xml 10.0.0.4

ndiff baseline.xml postexploit.xml

------------------------------------------------------------------------

**🧪 Advanced Nmap Tips in Azure Pentests**

| **Tip** | **Description** | **Use in Azure** |
|----|----|----|
| **Combine Options** | nmap -sV -T4 --open -O 10.0.0.4 | Discover running services, OS, and open ports on a public-facing VM. |
| **Interactive Mode** | nmap --interactive | Manually test during live engagements (less common in modern usage). |
| **Runtime Interaction** | Press v, d, p etc. during scan | Useful for monitoring large scans across Azure VNets. |
| **Remote Scanning (External)** | Use scanme.nmap.org | Simulate an external attacker’s perspective before firewall/NAT rules. |
| **Packet Analysis** | Combine with Wireshark | Observe NSG/firewall behavior during scans for evasion/detection testing. |

------------------------------------------------------------------------

**📘 Recommendations for Azure PenTest Context**

- **Use Nmap against Azure-exposed services only** unless you've breached an internal host or tunnel into a private VNet.

- Always **validate scope and permissions**—unauthorized scanning of third-party Azure tenants is prohibited.

- Use **Nmap XML output** for automation and integration with tools like BloodHound, custom dashboards, or diff detection with Ndiff.

- Combine Nmap/Ndiff with **Azure Defender alerts** to simulate detection tests and tuning validation.

------------------------------------------------------------------------

Would you like a Bash-based automation snippet that runs baseline scans and diffs results for multiple Azure IPs?

## 8.1 Comparing Internal vs External View of Azure Hosts

## 8.2 Detecting Configuration Drift

## 8.3 XML & JSON Output for DevSecOps Integration

# 9. Real-World Azure Scenarios

## 9.1 Internal VM Scanning via Azure Run Command

## 9.2 Scanning Through SSH Tunnels or Azure Bastion

## 9.3 Detecting Open Management Ports (e.g., 3389, 22, 5986)

## 9.4 Fingerprinting Web Apps Behind Azure Front Door

# 10. External Tools and Online Resources

## 10.1 Nmap with Wireshark in Azure

## 10.2 Using Scanme.Insecure.org from Azure-hosted VMs

## 10.3 Nmap Online Repositories and Cheat Sheets

# Appendices

## A. Nmap Azure Cheat Sheet

## B. Sample Azure VAPT Nmap Command Templates

## C. Azure-Specific NSE Scripts List

# Timing

Here is a **rewritten, corrected, and Azure Penetration Testing-focused summary** of the original document, tailored to how Nmap’s performance tuning flags are effectively used in **Azure environments** (cloud VMs, firewall-restricted subnets, NSGs, and detection-aware networks):

**Using Nmap Timing and Performance Flags in Azure Penetration Testing**

Nmap remains a fundamental tool for cloud penetration testing. However, scanning assets in **Azure** comes with unique challenges, such as:

- **NSG (Network Security Group) rate limits**

- **Cloud-based IDS/IPS**

- **Time-sensitive ephemeral VMs**

- **Load-balanced or filtered public services**

Proper tuning of **Nmap timing, retries, delays, and parallelism** is essential to balance stealth, speed, and scan accuracy. Here's how each flag works and how to apply it in Azure-specific pentests.

**🔹 Nmap Timing Templates (-T\[0-5\])**

Azure networks with logging and detection systems (e.g., **Microsoft Defender for Cloud**) often flag noisy scans. Timing templates (-T0 to -T5) help balance stealth and speed.

- -T0 / -T1: Use in **high-risk** environments (e.g., live cloud production) for **IDS evasion**.

- -T3: Balanced scan; often a safe default for Azure.

- -T4: Use on **pentest whitelisted subnets or labs** where speed is needed.

- -T5: Not recommended in Azure production—easily detected and blocked.

👉 Example:

nmap -T1 -p- \<azure-vm-ip\>

**🔹 --max-retries**

Limits how many times Nmap will retry a probe. Useful for **avoiding detection by Azure network monitors**.

- --max-retries 0: Only one attempt per port; faster, but might miss filtered or throttled responses.

- Increase retries if Azure NSGs introduce **rate-based blocking**.

👉 Example:

nmap -p22,80 --max-retries 3 \<vm-ip\>

**🔹 --host-timeout**

Sets how long Nmap should spend scanning one host. Helps **prevent timeouts in cloud scan scripts** or **move past unresponsive hosts**.

👉 Example:

nmap -Pn -p443 --host-timeout 60s \<vm-ip\>

**🔹 --min-hostgroup / --max-hostgroup**

Controls how many hosts Nmap scans in parallel. Adjust based on **subscription-wide scope**, such as scanning VMs in a /24 subnet within the same VNET.

👉 Example:

nmap -sP 10.0.0.0/24 --min-hostgroup 4 --max-hostgroup 8

**🔹 --scan-delay**

Delays between probes, useful to **evade time-based firewalls** like **Azure Firewall or WAFs** with behavioral throttling.

👉 Example:

nmap -p80,443 --scan-delay 5s \<web-app-ip\>

**🔹 --max-rate / --min-rate**

Controls the packet sending rate:

- Use --max-rate to **limit scan speed** and reduce detection risk.

- Use --min-rate to **ensure aggressive scanning**, helpful in isolated test environments.

👉 Examples:

nmap -p- --max-rate 10 \<vm-ip\> \# Stealth scan

nmap -p- --min-rate 100 \<vm-ip\> \# Speed in lab

**🔹 --min-parallelism / --max-parallelism**

Controls concurrency of probe sending. Useful for **rate-tuning around Azure’s burst detection systems**.

👉 Example:

nmap -p22,3389 --min-parallelism 1 --max-parallelism 2 \<vm-ip\>

**🔹 --min-rtt-timeout / --max-rtt-timeout / --initial-rtt-timeout**

Controls how long Nmap waits for replies.

- Short timeouts speed up scans but may miss slower Azure endpoints (e.g., under load balancers or with throttled responses).

- Tune these when probing **endpoints behind Azure App Gateway or Azure Front Door**.

👉 Example:

nmap -p443 --min-rtt-timeout 100ms --max-rtt-timeout 1s \<web-app-ip\>

**✅ Azure Pentest Use Case Summary**

| **Use Case** | **Recommended Nmap Options** |
|----|----|
| Stealth scan inside production VNET | -T0, --scan-delay 5s, --max-retries 1, --max-rate 5 |
| Recon large subnet (e.g., /24) | --min-hostgroup 5, --host-timeout 30s |
| Testing NSG rate-limiting | --max-retries, --scan-delay, --max-rate |
| IDS/Defender evasion | -T1, --scan-delay, --max-rate |
| Fast scan in test lab | -T4, --min-rate 100, --min-parallelism 10 |

Let me know if you want a **visual cheat sheet or ready-to-use Nmap Azure scan scripts**.

Here’s a **corrected, rewritten, and summarized version of the Nmap usage guide tailored specifically for Azure penetration testing (Azure PenTest)**. It’s adapted to reflect how you might use each feature in a cloud environment, particularly focusing on scanning Azure VMs, networks, services, and bypassing cloud-native defenses.

**🔎 Nmap Usage in Azure Penetration Testing**

**1. 🎯 Basic Target Scanning**

Used for discovering active hosts, open ports, and basic service visibility in Azure VNETs or exposed services.

| **Purpose** | **Command Example** | **Azure Context** |
|----|----|----|
| Scan a single VM | nmap 10.0.0.4 | Scan VM in a subnet |
| Scan multiple IPs | nmap 10.0.0.4 10.0.0.5 | Two VMs |
| Scan from a file | nmap -iL targets.txt | Useful for large target sets |
| Scan IP range | nmap 10.0.0.1-50 | Small subnet scan |
| Scan full subnet | nmap 10.0.0.0/24 | Typical VNET subnet |
| Random IPs | nmap -iR 10 | Less used in Azure, may trigger NSGs |
| Exclude IPs | nmap 10.0.0.0/24 --exclude 10.0.0.5 | Avoid known security systems |
| Exclude using file | nmap 10.0.0.0/24 --excludefile exclude.txt | From reconnaissance filtering |

**2. 🕵️‍♂️ Aggressive & Stealth Scans**

To enumerate services, versions, and OS fingerprinting aggressively or evasively.

| **Technique** | **Command** | **Azure Use** |
|----|----|----|
| Aggressive scan | nmap -A 10.0.0.4 | Full recon of a VM |
| IPv6 scan | nmap -6 \[IPv6 address\] | Use if Azure uses IPv6 addresses (rare) |
| OS detection | nmap -O 10.0.0.4 | OS fingerprinting |
| Service version | nmap -sV 10.0.0.4 | Discover running service versions |
| Troubleshoot version scan | nmap -sV --version-trace | Verbose output for debugging |

**3. 🧰 Output Options**

Store scan results for correlation and reporting.

| **Format**        | **Command**                     |
|-------------------|---------------------------------|
| Normal text       | nmap -oN scan.txt 10.0.0.4      |
| XML               | nmap -oX scan.xml 10.0.0.4      |
| Grepable          | nmap -oG scan.grep 10.0.0.4     |
| All formats       | nmap -oA scan 10.0.0.4          |
| Periodic stats    | nmap --stats-every 10s 10.0.0.4 |
| Leet style output | nmap -oS scan1337.txt 10.0.0.4  |

**4. ⚙️ Nmap Scripting Engine (NSE)**

NSE scripts automate detection and exploitation.

| **Action**           | **Command Example**                              |
|----------------------|--------------------------------------------------|
| Single script        | nmap --script http-title 10.0.0.4                |
| By expression        | nmap --script "http-\*" 10.0.0.4                 |
| By category          | nmap --script vuln 10.0.0.4                      |
| Multiple categories  | nmap --script "default,vuln" 10.0.0.4            |
| Troubleshoot scripts | nmap --script \<script\> --script-trace 10.0.0.4 |
| Update script DB     | nmap --script-updatedb                           |

🔍 *Use categories like auth, vuln, default, discovery, safe in Azure to identify weak services, open databases, or vulnerable web apps.*

**5. 🧱 Firewall Evasion & Bypassing NSGs**

Azure NSGs or Azure Firewall may restrict scans. These options help evade detection.

| **Technique** | **Command** | **Notes** |
|----|----|----|
| Packet fragmentation | nmap -f 10.0.0.4 | Bypass simple filters |
| Custom MTU size | nmap --mtu 24 10.0.0.4 | Evade pattern matching |
| Decoy IPs | nmap -D RND:10 10.0.0.4 | Mask source |
| Idle scan | nmap -sI zombie_ip 10.0.0.4 | Rare, stealthy |
| Source port spoofing | nmap --source-port 53 10.0.0.4 | Evade NSG rules |
| Append random data | nmap --data-length 50 10.0.0.4 | Randomize packet |
| Randomize scan order | nmap --randomize-hosts -iL list.txt | Avoid detection heuristics |
| Spoof MAC address | nmap --spoof-mac 0 10.0.0.4 | Hide client identity |
| Invalid checksums | nmap --badsum 10.0.0.4 | Test IDS/IPS alerting |

**6. 🛰️ Discovery and Ping Options**

Used to identify live hosts in VNETs or public IP ranges.

| **Scan Type**          | **Command**                         |
|------------------------|-------------------------------------|
| Ping scan only         | nmap -sn 10.0.0.0/24                |
| Disable ping           | nmap -Pn 10.0.0.4                   |
| TCP SYN ping           | nmap -PS80,443 10.0.0.4             |
| TCP ACK ping           | nmap -PA22 10.0.0.4                 |
| UDP ping               | nmap -PU53 10.0.0.4                 |
| ICMP echo              | nmap -PE 10.0.0.4                   |
| Traceroute             | nmap --traceroute 10.0.0.4          |
| ARP scan               | nmap -PR 10.0.0.0/24                |
| Reverse DNS lookup     | nmap -R 10.0.0.4                    |
| Disable DNS resolution | nmap -n 10.0.0.4                    |
| Custom DNS servers     | nmap --dns-servers 8.8.8.8 10.0.0.4 |

**7. 🔄 Ndiff – Compare Scans**

Track Azure infrastructure changes over time.

| **Action**            | **Command**                     |
|-----------------------|---------------------------------|
| Compare two XML scans | ndiff scan1.xml scan2.xml       |
| Verbose comparison    | ndiff -v scan1.xml scan2.xml    |
| XML diff output       | ndiff --xml scan1.xml scan2.xml |

**✅ Azure Pentest Use Cases**

- **Recon inside a compromised VM** to map the subnet.

- **Scanning peered VNETs** for lateral movement.

- **Detecting open management ports** (SSH, RDP) and weak services (SMB, Redis, Elasticsearch).

- **Firewall and NSG testing** using evasion flags.

- **Automated scanning with scripting (nmap --script)** to find vulnerable or misconfigured services in Azure PaaS/IaaS.

Would you like a formatted PDF or a Markdown export for this cheat sheet?
