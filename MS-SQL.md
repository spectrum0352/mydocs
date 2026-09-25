# Microsoft SQL Server (MSSQL) Security Assessment Guide

TRUSTWORTHY Abuse, Privilege Escalation, Azure SQL Considerations, Detection, and Mitigation

This guide provides a comprehensive overview of Microsoft SQL Server (MSSQL) security assessment techniques, focusing on database trust relationships, privilege escalation paths, credential exposure risks, persistence mechanisms, Azure-specific attack surfaces, detection strategies, and defensive controls.

The objective is to help security professionals identify misconfigurations, assess privilege boundaries, evaluate cloud-specific risks, and improve overall SQL Server security posture across both on-premises and Azure environments.

---

# Core Concept: TRUSTWORTHY Database Property

The TRUSTWORTHY database property determines whether SQL Server trusts the database and its contents.

## Security Risk

If all of the following conditions are met:

* The database is configured with `TRUSTWORTHY ON`
* The database owner is a server-level administrator (`sysadmin`)
* An attacker has `db_owner` permissions on that database

The attacker may be able to escalate privileges from database-level access to server-level administrative access.

## Default Configuration

```sql
ALTER DATABASE [DatabaseName] SET TRUSTWORTHY OFF;
```

By default, TRUSTWORTHY is disabled and should remain disabled unless there is a documented business requirement.

---

# Assessment Objectives

A SQL Server security assessment should evaluate:

* SQL Server inventory and exposure
* Authentication mechanisms
* Excessive permissions
* Database trust relationships
* Impersonation privileges
* Linked server configurations
* SQL Agent security
* CLR assemblies
* Startup procedures
* Credential storage practices
* Azure identity integrations
* Monitoring and audit controls

---

# Environment Types

## SQL Server on Azure VM (IaaS)

Characteristics:

* Full Windows or Linux operating system
* Traditional SQL Server functionality
* OS-level compromise possible
* Supports features such as:

  * TRUSTWORTHY
  * SQL Agent
  * CLR
  * xp_cmdshell
  * Linked Servers

Primary attacker goal:

* SYSTEM or root access
* Domain compromise
* Lateral movement within the network

## Azure SQL Database (PaaS)

Characteristics:

* Managed database platform
* No operating system access
* No direct server administration
* Limited attack surface

Primary attacker goal:

* Data theft
* Identity abuse
* Azure resource access

## Azure SQL Managed Instance

Characteristics:

* Hybrid model
* Greater SQL Server compatibility
* Supports additional enterprise features
* Limited administrative access compared to full SQL Server

Primary attacker goal:

* Database engine compromise
* Cross-database movement
* Cloud identity abuse

---

# Discovery and Enumeration

## Identify Trusted Databases

```sql
SELECT
    name,
    database_id,
    is_trustworthy_on
FROM sys.databases
WHERE is_trustworthy_on = 1;
```

## Identify Database Owners

```sql
SELECT
    name,
    SUSER_SNAME(owner_sid) AS DatabaseOwner
FROM sys.databases;
```

## Verify Database Role Membership

```sql
SELECT IS_ROLEMEMBER('db_owner') AS IsDbOwner;
```

## Enumerate Impersonation Rights

```sql
SELECT
    principal_id,
    permission_name,
    state_desc
FROM sys.server_permissions
WHERE permission_name = 'IMPERSONATE';
```

---

# Privilege Escalation Assessment

## Context Switching

```sql
EXECUTE AS USER = 'dbo';

SELECT
    USER_NAME() AS CurrentUser,
    SUSER_NAME() AS LoginName;
```

## Server-Level Escalation (SQL Server / Azure VM)

```sql
ALTER SERVER ROLE sysadmin
ADD MEMBER [UserName];
```

## Database-Level Escalation (Azure SQL Database)

```sql
ALTER ROLE db_owner
ADD MEMBER [UserName];
```

### Important Differences

| Feature     | Azure VM  | Azure SQL Database |
| ----------- | --------- | ------------------ |
| TRUSTWORTHY | Supported | Not supported      |
| sysadmin    | Supported | Not available      |
| xp_cmdshell | Supported | Not available      |
| OS Access   | Possible  | Not possible       |

---

# Credential Harvesting Assessment

## SQL Login Hash Enumeration

Requires elevated permissions.

```sql
SELECT
    name,
    CAST(password_hash AS VARBINARY(MAX)) AS PasswordHash
FROM sys.sql_logins
WHERE type = 'S';
```

## Remote Hash Collection

Nmap:

```bash
nmap -p 1433 \
--script ms-sql-dump-hashes \
--script-args mssql.username=user,mssql.password=password \
target
```

PowerUpSQL:

```powershell
Get-SQLLoginHash -Instance TARGET
```

## Offline Password Cracking

John the Ripper:

```bash
john --format=mssql12 hashes.txt
```

Hashcat:

```bash
hashcat -m 1731 hashes.txt wordlist.txt
```

---

# Persistence Techniques

## Startup Stored Procedures

SQL Server can automatically execute designated stored procedures during service startup.

### Preconditions

* sysadmin privileges
* Ability to create procedures
* Ability to restart SQL Server or wait for restart

### Security Risk

Startup procedures may be abused to:

* Execute unauthorized code
* Re-establish access
* Create backdoor accounts
* Trigger unauthorized jobs

### Audit Startup Procedures

```sql
SELECT *
FROM sys.procedures
WHERE OBJECTPROPERTY(object_id,'ExecIsStartup') = 1;
```

---

# Azure-Specific Assessment Areas

## Managed Identity Exposure

Managed Identities may provide access to:

* Azure Key Vault
* Azure Storage
* Azure Resource Manager
* Other Azure services

Review:

* Assigned permissions
* Role assignments
* Storage access
* Key Vault access

## Firewall Configuration Review

Assess:

* Public network access
* Private Link usage
* VNet integration
* Allow Azure Services setting

## Entra ID Authentication

Review:

* Administrative accounts
* Privileged role assignments
* Conditional Access
* MFA enforcement

---

# Attack Surface Comparison

| Capability       | SQL Server VM | Azure SQL Database | Managed Instance |
| ---------------- | ------------- | ------------------ | ---------------- |
| TRUSTWORTHY      | Yes           | No                 | Yes              |
| xp_cmdshell      | Yes           | No                 | No               |
| SQL Agent        | Yes           | Limited            | Yes              |
| CLR Assemblies   | Yes           | Restricted         | Yes              |
| OS Access        | Yes           | No                 | No               |
| Managed Identity | Optional      | Yes                | Yes              |

---

# Common Attack Scenarios

## Privilege Escalation

* TRUSTWORTHY abuse
* EXECUTE AS abuse
* Misconfigured permissions
* Excessive db_owner assignments

## Lateral Movement

* Linked Servers
* Cross-database access
* Managed Identity abuse
* Azure role assignment abuse

## Persistence

* Startup procedures
* SQL Agent jobs
* Malicious CLR assemblies
* Hidden database users

## Credential Access

* SQL login hash extraction
* Weak password attacks
* Token theft
* Secret exposure

---

# Assessment Tools

## Discovery and Enumeration

* PowerUpSQL
* Nmap
* SQLRecon
* MicroBurst
* Az-Subnet-Scan

## Authentication Testing

* Impacket (mssqlclient.py)
* CrackMapExec
* Hydra
* Medusa

## Assessment and Auditing

* PowerUpSQL
* SQLRecon
* SQL Server Management Studio (SSMS)

## Password Analysis

* Hashcat
* John the Ripper

## Azure Security Assessment

* Azure CLI
* PowerShell Az Modules
* MicroBurst

---

# Risk and Impact Analysis

## Critical Risks

### TRUSTWORTHY Abuse

Impact:

* Server-level privilege escalation
* Access to all databases
* Unauthorized administrative control

### Managed Identity Abuse

Impact:

* Access to Azure resources
* Key Vault compromise
* Subscription-level compromise

### SQL Injection

Impact:

* Data theft
* Data modification
* Service disruption

### Administrative Account Compromise

Impact:

* Full database control
* Potential cloud-wide impact

---

# Detection and Monitoring

## SQL Auditing

Monitor:

* EXECUTE AS usage
* Role changes
* Privilege assignments
* Startup procedure creation
* CLR assembly deployment

## Example KQL Detection

### TRUSTWORTHY or Privilege Escalation Changes

```kusto
SQLSecurityAuditEvents
| where statement_s contains "TRUSTWORTHY"
   or statement_s contains "ALTER SERVER ROLE"
| project TimeGenerated,
          principal_name_s,
          statement_s
```

### Password Hash Access

```kusto
SQLSecurityAuditEvents
| where statement_s contains "sys.sql_logins"
| where statement_s contains "password_hash"
```

### Failed Authentication Activity

```kusto
SigninLogs
| where AppDisplayName contains "Azure SQL"
| where ResultType != 0
| summarize count()
    by IPAddress,
       UserPrincipalName,
       bin(TimeGenerated,15m)
```

---

# Mitigation Recommendations

## Authentication

* Prefer Microsoft Entra ID authentication
* Enforce MFA
* Reduce SQL Authentication usage
* Disable unused accounts

## Access Control

* Follow least privilege principles
* Minimize db_owner assignments
* Restrict IMPERSONATE permissions
* Review administrative roles regularly

## Database Security

* Keep TRUSTWORTHY disabled
* Review CLR usage
* Audit linked servers
* Remove unnecessary startup procedures

## Network Security

* Use Private Link
* Disable public access where possible
* Restrict firewall rules
* Implement network segmentation

## Monitoring

* Enable SQL Auditing
* Enable Microsoft Defender for SQL
* Forward logs to Log Analytics
* Monitor privilege changes and identity activity

---

# References

## Security Tools

* PowerUpSQL
* SQLRecon
* Impacket
* MicroBurst
* Hashcat
* John the Ripper
* Nmap

## Microsoft Documentation

* Azure SQL Security Best Practices
* Azure SQL Managed Instance Security Documentation
* Microsoft Entra ID Authentication for SQL
* Microsoft Defender for SQL

## Security Frameworks

* CIS Microsoft SQL Server Benchmark
* MITRE ATT&CK for Databases

---

# Conclusion

MSSQL compromise is typically the result of chained misconfigurations rather than a single vulnerability. Common escalation paths include excessive permissions, TRUSTWORTHY database abuse, impersonation rights, weak credential management, and cloud identity misconfigurations.

For SQL Server running on Azure VMs, attackers may attempt to progress from database compromise to operating system compromise. For Azure SQL Database and Managed Instance, the focus shifts toward data theft, identity abuse, and access to connected Azure resources.

A mature security program should combine:

* Least privilege access controls
* Strong identity governance
* Secure database configuration
* Continuous monitoring
* Azure-native security controls
* Regular security assessments

Organizations that proactively audit trust relationships, impersonation rights, identity permissions, and database configurations significantly reduce the likelihood of privilege escalation, persistence, and cloud resource compromise.
