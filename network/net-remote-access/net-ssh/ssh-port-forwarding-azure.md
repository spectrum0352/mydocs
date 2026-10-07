## SSH Local Port Forwarding and Socat in Hub-Spoke Networks

Here's a **corrected, rewritten, and Azure-specific summary** of **SSH
Local Port Forwarding** and **Socat Port Redirection** in the context of
**Azure Penetration Testing**, especially focusing on scenarios
involving **Azure Firewall**, **Hub VNET**, and **DMZ subnets**. Each
step includes a clear explanation of how this technique applies to
post-exploitation pivoting inside an Azure cloud network.

**🎯 Attacking Azure: SSH Local Port Forwarding and Socat in Hub-Spoke
Networks**

In real-world Azure environments, **critical services** like databases,
admin panels, or APIs are often:

- Deployed in **Spoke VNETs** with **NSGs** restricting access

- Protected by **Azure Firewall** or **Bastion**

- Exposed selectively through **DMZs** using **Application Gateways** or
  **Load Balancers**

To **bypass these restrictions**, attackers use **SSH tunneling** and
tools like **Socat** to forward traffic from **internal-only resources**
to the attacker’s machine.

**🔐 1. SSH Local Port Forwarding (Manual Pivoting)**

**💡 Concept**

**SSH Local Port Forwarding** allows the attacker to forward a **local
port** (on Kali) to a **remote port** behind Azure Firewall by tunneling
through a **compromised SSH server or jump box** inside the Azure VNET.

✅ This is useful when you have SSH access to a DMZ VM or Bastion-hosted
VM in the Hub, and want to reach an internal resource that is otherwise
not accessible.

**🧪 Azure PenTest Scenario**

- **Compromised VM**: vm-dmz (10.0.1.4) in DMZ subnet (Spoke VNET)

- **Target Admin Panel**: Web service running on localhost:8080 on
  vm-dmz (not exposed publicly)

- **Attacker Machine**: Kali outside Azure

**🔁 Step-by-Step: SSH Local Port Forwarding**

ssh -L 8081:localhost:8080 -N -f azureuser@10.0.1.4

- -L 8081:localhost:8080: Forward local port 8081 (Kali) → port 8080 on
  the DMZ VM

- -N: No remote command, just port forwarding

- -f: Run in the background

- azureuser@10.0.1.4: SSH into the compromised VM inside Azure

**🌐 Result**

On Kali:

curl http://127.0.0.1:8081

✅ You now access the **internal-only admin web panel** from outside
Azure by tunneling through a trusted Azure VM.

**🧰 2. Port Forwarding with Socat (Advanced Tunneling)**

**💡 Concept**

**Socat** allows for **more flexible port redirection** and data relays,
including UDP, reverse shells, chained pivots, and bridging interfaces.
It is often used when SSH tunneling isn't viable or you want to relay
multiple ports simultaneously.

**🧪 Azure PenTest Scenario**

- You have **command execution** on vm-dmz via reverse shell or
  RunCommand

- Internal service runs on 127.0.0.1:8080 (DMZ VM)

- You want to **redirect it** to a reachable port like 1234

**🔁 Step-by-Step: Socat Local Redirect**

On vm-dmz (inside Azure):

socat TCP-LISTEN:1234,fork,reuseaddr TCP:127.0.0.1:8080 &

- This will make vm-dmz:1234 forward to its **localhost:8080**

- You can now access the internal service using:

curl http://10.0.1.4:1234

From Kali (if 10.0.1.4:1234 is reachable), or you can **combine with SSH
forward**:

ssh -L 8888:localhost:1234 azureuser@10.0.1.4

Then from Kali:

curl http://127.0.0.1:8888

🎯 You're chaining socat and SSH for multi-hop internal access.

**🔐 Real-World Azure Use Cases**

| **Scenario** | **Goal** | **Technique** |
|----|----|----|
| Internal web admin only accessible from localhost | Forward internal-only port to attacker | ssh -L or socat |
| Azure Firewall blocks direct port access | Use an internal host as a pivot | Port forwarding |
| Only RunCommand is available (no SSH) | Use socat to build TCP bridge | Deploy via az vm run-command |
| Access spoke-only SQL server from Kali | Tunnel SQL port via DMZ VM | ssh -L 1433:10.1.1.4:1433 |

**🛡️ Detection and Mitigation (Blue Team Guidance)**

| **Control** | **Purpose** |
|----|----|
| NSG Flow Logs | Monitor lateral movement and unusual port forwarding |
| Azure Firewall Logs | Alert on unexpected internal outbound flows |
| Disable Password SSH Auth | Prevent brute-force access to SSH |
| Use Azure Bastion | Prevent direct SSH to VMs |
| Just-In-Time (JIT) VM Access | Limit SSH port exposure duration |
| Microsoft Defender for Endpoint | Detect tunneling and post-exploitation behavior |

**✅ Summary**

| **Step** | **Description** |
|----|----|
| 1️⃣ | Identify a VM with SSH or shell access in DMZ or Hub VNET |
| 2️⃣ | Identify internal services on localhost or VNET-only addresses |
| 3️⃣ | Use ssh -L or socat to create a tunnel from attacker to internal service |
| 4️⃣ | Access protected services (e.g., web admin panels, internal APIs, databases) |
| 5️⃣ | Chain with more tunnels or reverse shells to move deeper into Azure |

Would you like a ready-to-use script that:

- Automates ssh -L tunnel setup from Kali,

- Enumerates internal ports on the remote VM,

- And builds a local-accessible map of the DMZ?

I can provide one tailored to your Azure lab setup.
