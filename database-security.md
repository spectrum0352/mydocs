**Database and its Types**

- There are different types of databases depending on usage:

  - Centralized DB: Data is at centralized location; users can access it
    from different locations

  - Distributed DB: Data is distributed at different locations

  - Personal DB

  - End User DB

  - Commercial DB

  - No SQL DB

**Database Security Components**

- **Injection**

- **What are injection flaws?**

<!-- -->

- Injection flaws allow attackers to relay malicious code through the
  vulnerable application to another system (OS, Database Server, LDAP
  Server etc.)

- They are extremely dangerous and may allow full takeover of vulnerable
  system.

- Injection flaws appear internally and externally as top issues 

<!-- -->

- **What is OS Command Injection flaws?**

<!-- -->

- Abuse of vulnerable application functionality that causes execution of
  attacker specified OS commands

- Applies to all operating systems - Linux, Windows MacOS

- Not vulnerability in OS but its happen due to vulnerable application

- Made possible by lack of sufficient input sanitization, by unsafe
  execution of OS commands.

<!-- -->

- SQL Injection

- NoSQL Injection

- Xpath Injection

- LDAP Injection

**SQL Injection Prevention:**

Following are the prevention techniques:

1.  Use prepared statements

2.  Sanitize user input

3.  Do not expose native database errors to user

4.  Limit database user permissions

5.  Use stored procedures

6.  Use QRM libraries

There are four types of SQL Injection

1.  Error-based

2.  Boolean-based

3.  Time-based

4.  Out-of-Band

5.  **Error-based SQL injection -** Error-based SQL injection
    vulnerability could allow attackers to retrieve information from
    database errors.

6.  **Boolean-based SQL injection -** If there are no error messages on
    the web application, then attackers look for other indications and
    leverage them to extract information from the vulnerable
    application. Such a method is known as Boolean-based SQL injection.

7.  **Time-based SQL injection -** In this case, attackers set sleep
    time and instruct it to wait on sleep mode for the stated amount of
    time. If the web app is vulnerable, it will take a longer time to
    load, if not it will load quickly. This way attackers will determine
    the vulnerable application and will extract information.

8.  **Out-of-Band SQL injection -** This could allow attackers to
    retrieve database information by leveraging out-of-band techniques
    such as sending the data directly from the database to the
    attacker-controlled system.

**Use prepared statements**

Most SQL injection happens because queries are pieced together as text

- Use prepared statements separates the query structure from query
  parameters.

- <u>Avoid this pattern:</u>

- *stmt.executeQuery("SELECT \* FROM users WHERE user=' "+user+" ' AND
  pass=' "+pass+" ' ")*

- <u>Use this:</u>

- *PreparedStatement ps = conn.preparedStatement("SELECT \* FROM users
  WHERE user = ? AND pass = ?"); ps.setString(1, user); ps.setString(2,
  pass);*

- SQL injection risk is not mitigated.

**Sanitize user input**

- Only restrictive whitelist should be used, not blacklist

- Where appropriate, do not allow user input to reach database and
  instead use mapping tables to translate it.

  1.  **Do not expose native database errors to user** Application
      errors should not expose internal information to user Details
      belong in an internal log file

<!-- -->

- Exposed details can be abused to create SQL injection commands

  1.  **Limit database user permissions**

- If user queries are executed under restricted user less damage is
  possible if SQL injection happens

- Consider using user with read only permissions when database updates
  are not required, or use different users for different operations.

  1.  **Use stored procedures**

- Use stored procedures mitigates the risk by moving SQL queries into
  the database engine.

  1.  **Use QRM libraries**

- Object relational mapping (ORM) libraries help mitigate SQL injection.
  ORM helps reduce or eliminate the need for direct SQL composition.
  However if ORM is used improperly SQL injection may still be possible

**NOSQL Injection**

- In MongoDB \$where query parameter is interpreted as Javascript
  Suppose we take an expression parameter as input:

- \$where: "\$expression" In simple cases it is harmless

- \$where: "this.userType==3"

- However attacker can perform DoS attacks:

- \$where: "d = new Date; do {c = new Date} while (c - d \< 100000;“

- **Best Practices**

- Do not use functionality with reduced scope

- Specify library functions instead of arbitrary OS command execution.
  Do execute with least privilege

- So use Safe functionality that prevents injection.

- Do not let user input reach critical resource unchanged Do sanitize
  user input with strict whitelists (not blacklist)

- **Best Practices**

- Do not use functionality with reduced scope

- Specify library functions instead of arbitrary OS command execution.
  Do execute with least privilege

- So use Safe functionality that prevents injection.

- Do not let user input reach critical resource unchanged Do sanitize
  user input with strict whitelists (not blacklist)

**Database Security**

- • SQL - RDBMS Concepts

- • SQL - Databases

- • SQL - Syntax

- • SQL - Data Types

- • SQL - Operators

- • SQL - Expressions

- • SQL - Create Database

- • SQL - Drop Database

- • SQL - Select Database

- • • SQL - Order By

- • SQL - Group By

- • SQL - Distinct Keyword

- • SQL - Sorting Results

- SQL - Create Table

- • SQL - Drop Table

- • SQL - Insert Query

- • SQL - Select Query

- • SQL - Where Clause

- • SQL - AND & OR Clauses

- • SQL - Update Query

- • SQL - Delete Query

- • SQL - Like Clause

- • SQL - Top Clause

- URL-https://www.tutorialspoint.com/sql/index.htm

# Database Security Cheat Sheet 

> This cheat sheet offers security guidance for configuring and using
> SQL and NoSQL databases, primarily for application developers who
> manage databases without a dedicated DBA.
>
> **Focus Areas:**

- **Secure Connections:**

  - Isolate the database server and restrict access using methods like:

    - Local socket files/named pipes

    - Binding to localhost only

    - Firewall rules for specific hosts

    - Separate DMZ for the database server

  - Enforce Transport Layer Protection (TLS) with strong encryption
    (TLSv1.2+, modern ciphers) for all connections.

  - Secure web-based management tools like phpMyAdmin.

  - For untrusted systems, connect only through an API with access
    control.

- **Authentication:**

  - Enforce mandatory authentication for all database connections,
    including local ones.

  - Use strong, unique passwords for each database account.

  - Grant each account the minimum permissions required (principle of
    least privilege).

  - Follow best practices for account management (reviews, removal,
    password changes).

  - Consider Windows/Integrated Authentication (Microsoft SQL Server) or
    similar solutions to avoid storing credentials in applications.

- **Credential Storage:**

  - Never store database credentials (especially unencrypted) in
    application source code.

  - Store them in a secure configuration file outside the webroot with
    restricted access.

  - Avoid storing them in source code repositories.

  - Encrypt credentials whenever possible using built-in
    functionalities.

- **Permissions:**

  - Apply the principle of least privilege to database user accounts.

  - Avoid using built-in root/administrative accounts.

  - Restrict connection permissions to allowed hosts (often localhost or
    application server).

  - Grant access only to specific databases needed by the application
    (separate databases for development, UAT, and production
    environments).

  - Grant only required permissions (e.g., SELECT, UPDATE, DELETE) on
    those databases.

  - Avoid granting ownership of databases to user accounts.

  - Minimize the use of database links and linked servers. If necessary,
    use accounts with minimal access.

- **Database Configuration and Hardening:**

  - Harden the database server's operating system following secure
    baselines like CIS Benchmarks or Microsoft Security Baselines.

  - Properly configure and harden the database application.

  - Install security updates and patches regularly.

  - Run the database service under a low-privileged user account.

  - Remove default accounts and databases.

  - Store transaction logs on a separate disk from the main database
    files.

  - Configure regular backups with proper access control and encryption
    (ideally).

- **Additional Recommendations by Database Software:**

  - The cheat sheet provides specific hardening recommendations for
    popular database software like Microsoft SQL Server, MySQL/MariaDB,
    PostgreSQL, MongoDB, and Redis.

> **Remember:** By following these security best practices, you can
> significantly reduce the risk of unauthorized access and data breaches
> for your databases.
>
>  
>
>  
>
> **Database Security Summary**
>
> This summarizes key points about database security, focusing on SQL
> Injection vulnerabilities and prevention methods.
>
> **Database Basics:**

- A database is a structured collection of related data, managed by a
  Database Management System (DBMS) for easy access, manipulation, and
  updates.

- DBMS objectives include:

  - Efficient data storage and retrieval.

  - Eliminating data duplication.

  - Supporting multiple users and data growth.

  - Ensuring data integrity, security, and protection.

  - Reporting and data analysis.

- Key differences between File Systems and DBMS:

  - DBMS offers a structured approach to data organization compared to
    file systems.

  - DBMS reduces data redundancy, simplifies sharing, and enforces data
    consistency.

  - DBMS facilitates data searching, isolation, integrity, security, and
    concurrent access control.

> **Injection Attacks:**

- Injection flaws allow attackers to inject malicious code into a
  vulnerable application to compromise another system (database server,
  OS, etc.).

- Common injection types include:

  - SQL Injection: Targets SQL databases by injecting malicious SQL code
    through user input.

  - NoSQL Injection: Exploits vulnerabilities in NoSQL databases using
    malicious queries.

  - OS Command Injection: Executes attacker-specified operating system
    commands due to insufficient input validation.

> **SQL Injection Prevention:**

- **Prepared Statements:** Separate the SQL query structure from user
  input, reducing the risk of malicious code insertion.

- **Input Sanitization:** Validate and sanitize user input to prevent
  code injection attempts. Use whitelists instead of blacklists for
  allowed characters.

- **Limited Database User Permissions:** Grant database users only the
  minimum permissions required for their tasks.

- **Stored Procedures:** Predefined routines within the database server
  that mitigate injection risks by centralizing SQL code.

- **Object Relational Mapping (ORM) Libraries:** Can help reduce the
  need for direct SQL statements, but proper use is crucial to avoid
  injection vulnerabilities.

> **Additional Points:**

- **Error Handling:** Avoid exposing database error messages to users,
  as attackers can exploit them to craft injection attacks.

- **Regular Updates:** Keep database software and libraries updated with
  the latest security patches.

> By following these security practices, you can significantly reduce
> the risk of database breaches and protect your valuable data.

# Basics

- **Data** is the collection of facts and figures that can be processed
  to produce information.

- **Database** is a collection of related data that is organized so that
  it can be easily accessed, managed, and updated.

- **Database management systems (DBMS)** is a software that allows
  computer to perform database functions of storing, retrieving, adding,
  deleting, and modifying data.

Apps

DBMS

Database

Users

- **DBMS Objectives**

  - Provide for mass storage of relevant data

  - Making easy access to data for the authorized user.

  - Providing prompt response to users request for data.

  - Eliminate duplicate data.

  - Allow multiple users to be active at one time.

  - Allow the growth of database system.

  - Provide data integrity.

  - Protect data from physical harm and unauthorized access.

  - Serving different types of users.

  - Provide security with user access privilege.

  - Combining interrelated data to generate report.

  - Provide multiple view for same data.

- **Difference between Filesystem and DBMS**

| Properties | File system management | DBMS |
|----|----|----|
| Definition | It is an abstraction to store, retrieve, manage, and update a set of files. It is used to keep track on the files and also manage them. | DBMS is a collection of interrelated data and a set of programs to access those data. Most well-known DBMS tools are Microsoft Access, Microsoft SQL server, Oracle, SAP, etc. |
| Data redundancy | In filesystem approach, each user defines and implements. |  |
| Sharing of data |  |  |
| Data consistency |  |  |
| Difficult to search/access data |  |  |
| Data isolation |  |  |
| Data integrity |  |  |
| Security problems |  |  |
| Atomicity |  |  |
| Concurrent Access Anomalies |  |  |

# Data security checklist

## Sensitive data confidentiality

- Do you classify your data, identifying sensitive data versus non
  sensitive?

- Are you exercising responsibilities to protect sensitive data under
  your control?

- Is the most valuable or sensitive data encrypted?

- Do you have a policy for identifying the retention of information
  (both hard and soft copies)?

- Do you have procedures in place to deal with credit card information?

- Do you have procedures covering the management of personal private
  information?

- Is there a process for creating retrievable backup and archival copies
  of critical information?

- Do you have procedures for disposing of waste material?

- Is waste paper binned or shredded?

- Is your shred bin always locked?

- Do your policies for disposing of old computer equipment protect
  against loss of data (e.g. by reading old disks and hard drives)?

- Do your disposal procedures identify appropriate technologies and
  methods for making hardware and electronic media unusable and
  inaccessible (such as shredding CDs and DVDs, electronically wiping
  drives, burning tapes) etc.)?

# Database Security Cheat Sheet

# Introduction

This cheat sheet provides guidance on securely configuring and using the
SQL and NoSQL databases. It is intended to be used by application
developers when they are responsible for managing the databases, in the
absence of a dedicated database administrator (DBA). For details about
protecting against SQL Injection attacks, see the SQL Injection
Prevention Cheat Sheet.

# Connecting to the Database

The backend database used by the application should be isolated as much
as possible, in order to prevent malicious or undesirable users from
being able to connect to it. Exactly how this is achieved will depend on
the system and network architecture. The following options could be used
to protect it:

- Disabling network (TCP) access and requiring all access is over a
  local socket file or named pipe.

- Configuring the database to only bind on localhost.

- Restricting access to the network port to specific hosts with firewall
  rules.

- Placing the database server in a separate DMZ isolated from the
  application server.

> Similar protection should be implemented to protect any web-based
> management tools used with the database, such as phpMyAdmin.
>
> When an application is running on an untrusted system (such as a
> thick-client), it should always connect to the backend through an API
> that can enforce appropriate access control and restrictions. Direct
> connections should **never** be made from a thick client to the
> backend database.

## Transport Layer Protection

Most databases will allow unencrypted network connections in their
default configurations. Although some will encrypt the initial
authentication (such as Microsoft SQL Server), the rest of the traffic
will be unencrypted, meaning that all kinds of sensitive information
will be sent across the network in clear text. The following steps
should be taken to prevent unencrypted traffic:

- Configure the database to only allow encrypted connections.

- Install a trusted digital certificate on the server.

- Configure the client application to connect using TLSv1.2+ with modern
  ciphers (e.g, AES-GCM or ChaCha20).

- Configure the client application to verify that the digital
  certificate is correct.

The Transport Layer Protection and TLS Cipher String Cheat Sheets
contain further guidance on securely configuring TLS.

# Authentication

The database should be configured to always require authentication,
including connections from the local server. Database accounts should
be:

- Protected with strong and unique passwords.

- Used by a single application or service.

- Configured with the minimum permissions required as discussed in the
  permissions section below.

As with any system that has its own user accounts, the usual account
management processes should be followed, including:

- Regular reviews of the accounts to ensure that they are still
  required.

- Regular reviews of permissions.

- Removing user accounts when an application is decommissioned.

- Changing the passwords when staff leave, or there is reason to believe
  that they may have been compromised.

For Microsoft SQL Server, consider the use of Windows or
IntegratedAuthentication, which uses existing Windows accounts rather
than SQL Server accounts. This also removes the requirement to store
credentials in the application, as it will connect using the credentials
of the Windows user it is running under. The Windows Native
Authentication Plugins provides similar functionality for MySQL.

## Storing Database Credentials

> Database credentials should never be stored in the application source
> code, especially if they are unencrypted. Instead, they should be
> stored in a configuration file that:

- Is outside of the webroot.

- Has appropriate permissions so that it can only be read by the
  required user(s).

- Is not checked into source code repositories.

> Where possible, these credentials should also be encrypted or
> otherwise protected using built-in functionality, such as the
> web.config encryption available in ASP.NET.

# Permissions

The permissions assigned to database user accounts should be based on
the principle of least privilege (i.e, the accounts should only have the
minimal permissions required for the application to function). This can
be applied at a number of increasingly granular levels depending on the
functionality available in the database. The following steps should be
applicable to all environments:

- Do not use the built-in root, sa or SYS accounts.

- Do not grant the account administrative rights over the database
  instance.

- Only allow the account to connect from allowed hosts.

  - This would often be localhost or the address of the application
    server.

- Only grant the account access to the specific databases it needs.

  - Development, UAT and Production environments should all use separate
    databases and accounts.

- Only grant the required permissions on the databases.

  - Most applications would only need SELECT, UPDATE and DELETE
    permissions.

  - The account should not be the owner of the database as this can lead
    to privilege escalation vulnerabilities.

- Avoid using database links or linked servers.

  - Where they are required, use an account that has been granted access
    to only the minimum databases, tables, and system privileges
    required.

> For more security-critical applications, it is possible to apply
> permissions at more granular levels, including:

- Table-level permissions.

- Column-level permissions.

- Row-level permissions

- Blocking access to the underlying tables, and requiring all access
  through restricted views.

# Database Configuration and Hardening

The underlying operating system for the database server should be
hardened in the same way as any other server, based on a secure baseline
such as the CIS Benchmarks or the Microsoft Security Baselines.

The database application should also be properly configured and
hardened. The following principles should apply to any database
application and platform:

- Install any required security updates and patches.

- Configure the database services to run under a low privileged user
  account.

- Remove any default accounts and databases.

- Store transaction logs on a separate disk to the main database files.

- Configure a regular backup of the database.

> **–** Ensure that the backups are protected with appropriate
> permissions, and ideally encrypted.

The following sections gives some further recommendations for specific
database software, in addition to the more general recommendations given
above.

## Microsoft SQL Server

- Disable xp_cmdshell, xp_dirtree and other stored procedures that are
  not required.

- Disable Common Language Runtime (CLR) execution.

- Disable the SQL Browser service.

- Disable Mixed Mode Authentication unless it is required.

- Ensure that the sample Northwind and AdventureWorks databases have
  been removed.

- See Microsoft’s articles on securing SQL Server.

## MySQL and MariaDB

- Run the mysql_secure_installation script to remove the default
  databases and accounts.

- Disable the FILE privilege for all users to prevent them reading or
  writing files.

- See the Oracle MySQL and MariaDB hardening guides.

## PostgreSQL

- See the PostgreSQL Server Setup and Operation documentation and the
  older Security documentation.

**MongoDB**

- See the MongoDB security checklist.

## Redis

> • See the Redis security guide.

# Database Vulnerabilities

**SQL Injection** is a critical web application vulnerability that
allows attackers to inject malicious code into user input fields. This
code can then be executed by the database server, potentially leading
to:

- **Data Theft:** Attackers can steal sensitive data like passwords,
  credit cards, and personal information.

- **Data Manipulation:** Attackers can modify or delete data within the
  database.

- **Database Takeover:** In severe cases, attackers can gain complete
  control of the database server.

**Types of SQL Injection:**

- **Error-based:** Attackers exploit errors displayed by the web
  application to retrieve information from the database.

- **Boolean-based:** Attackers use techniques to determine if certain
  information exists in the database without relying on error messages.

- **Time-based:** Attackers inject code that delays the web
  application's response time, indicating a vulnerability.

- **Out-of-band:** Attackers use the database to send information
  directly to an attacker-controlled system.

**Preventing SQL Injection:**

- **Limit Database User Access:** Grant only the necessary permissions
  to database accounts used by the web application.

- **Sanitize User Input:** Validate and remove malicious code from user
  input before it reaches the database.

- **Use Prepared Statements:** Separate the SQL query structure from the
  data to prevent unexpected code execution.

- **Keep Software Updated:** Patch vulnerabilities in your web
  application software regularly.

- **Minimize Error Messages:** Do not expose internal database error
  details to users.

- **Use Stored Procedures:** Store SQL queries in the database and treat
  all input as parameters.

- **Consider ORM Libraries:** Object-relational mapping (ORM) libraries
  can help reduce the need for direct SQL manipulation.

**Additional Tips:**

- Use strong whitelists instead of blacklists for sanitization.

- Store database credentials securely and separately from the
  application.

- Regularly monitor for suspicious activity.

**Injection flaws** allow attackers to relay malicious code through the
vulnerable application to another system (OS, Database Server, LDAP
Server etc.) They are extremely dangerous and may allow full takeover of
vulnerable system. Injection flaws appear internally and externally as
top issues.

## SQL Injection

- SQL injection is a code injection technique, used to attack
  data-driven applications, in which malicious SQL statements are
  inserted into an entry field for execution (e.g. to dump the database
  contents to the attacker).

- In this, when user input is either incorrectly filtered for string
  literal escape characters embedded in SQL statements or user input is
  not strongly typed and unexpectedly executed.

- SQL injection attacks allow attackers to:

  - Spoof identity,

  - Tamper with existing data,

  - Cause repudiation issues such as voiding transactions or changing
    balances

  - Allow the complete disclosure of all data on the system

  - Destroy the data or make it unavailable, and become administrators
    of the database server.

- SQL Injection (SQLi) is a type of code injection attack where it
  manages to execute malicious SQL statements to control a database
  server behind a web application. Attackers mostly use this to avoid
  application security measures and thereby access, modify, and delete
  unauthorized data.

- SQL injection, also known as SQLI, is a common attack vector that uses
  malicious SQL code for backend database manipulation to access
  information that was not intended to be displayed.

- A successful SQL injection attack can result in unauthorized access to
  sensitive data, such as passwords, credit card details, or personal
  user information. These are some of the most used parameters used by
  Bug Bounty Hunters and Pentesters whenever they are performing such
  attacks on web applications. You can also test your application for
  such weaknesses

SQL Injection Types

There are four types of SQL Injection

1.  **Error-based SQL injection -** Error-based SQL injection
    vulnerability could allow attackers to retrieve information from
    database errors.

2.  **Boolean-based SQL injection -** If there are no error messages on
    the web application, then attackers look for other indications and
    leverage them to extract information from the vulnerable
    application. Such a method is known as Boolean-based SQL injection.

3.  **Time-based SQL injection -** In this case, attackers set sleep
    time and instruct it to wait on sleep mode for the stated amount of
    time. If the web app is vulnerable, it will take a longer time to
    load, if not it will load quickly. This way attackers will determine
    the vulnerable application and will extract information.

4.  **Out-of-Band SQL injection -** This could allow attackers to
    retrieve database information by leveraging out-of-band techniques
    such as sending the data directly from the database to the
    attacker-controlled system.

SQL Injection Prevention

1.  **Use prepared statements:** Most SQL injection happens because
    queries are pieced together as text. Use prepared statements
    separates the query structure from query parameters.

2.  **Sanitize user input:** Only restrictive whitelist should be used,
    not blacklist. Where appropriate, do not allow user input to reach
    database and instead use mapping tables to translate it.

3.  **Do not expose native database errors to user:** Application errors
    should not expose internal information to user Details belong in an
    internal log file. Exposed details can be abused to create SQL
    injection commands

4.  **Limit database user permissions:** If user queries are executed
    under restricted user less damage is possible if SQL injection
    happens. Consider using user with read only permissions when
    database updates are not required, or use different users for
    different operations.

5.  **Use stored procedures:** Use stored procedures mitigates the risk
    by moving SQL queries into the database engine.

6.  **Use QRM libraries:** Object relational mapping (ORM) libraries
    help mitigate SQL injection. ORM helps reduce or eliminate the need
    for direct SQL composition. However, if ORM is used improperly SQL
    injection may still be possible.

7.  **Parameterized statements (Prepared):** Pattern check- Integer,
    float or Boolean, string parameters can be checked if their value is
    valid representation for the given type. Strings that must follow
    some strict pattern (date, UUID, alphanumeric only, etc.) can be
    checked if they match this pattern.

8.  **Database permissions**: Limiting the permissions on the database
    login used by the web application to only what is needed may help
    reduce the effectiveness of any SQL injection attacks that exploit
    any bugs in the web application.

9.  Store database credentials separate and encrypted

10. Disable shell and any other functionalities you don’t need

11. Do not let user input reach critical resource unchanged

12. Do sanitize user input with strict whitelists (not blacklist)

13. Sanitize user input: User input should be never trusted it must be
    sanitized before it is used

14. Stored procedures: These can encapsulate the SQL statements and
    treat all input as parameters

15. Regular expressions: Detecting and dumping harmful code before
    executing SQL statements

16. Database connection user access rights: Only necessary and limited
    access right should be given to accounts used to connect to the
    database

17. Error messages: Error message should not be specific telling where
    exactly the error occurred it should be more generalized.

## NOSQL Injection

# Database Security

Database Security

**Database and its Types**

- There are different types of databases depending on usage:

  - Centralized DB: Data is at centralized location; users can access it
    from different locations

  - Distributed DB: Data is distributed at different locations

  - Personal DB

  - End User DB

  - Commercial DB

  - No SQL DB

# Redis Cache

# Memcache

# MongoDB NoSQL Database

# Cassandra NoSQL Database

# MySQL Database

MySQL Penetration Testing

- Introduction and Lab setup

- Brute Force & Password Cracking

- MySQL Enumeration

- Extract MySQL-Schema Information

- Execute MySQL query Remotely

- Extracting Password Hashes

- Enumerate writeable directories

- Enumerating System Files

# MariaDB SQL 

# PostgreSQL Database 

PostgreSQL Exploitation

# MS-SQL Database

# Cloud DB Exploitation

# Azure SQL

## Cloud based Database Advantages

Cloud-based databases offer several advantages over traditional
on-premises databases:

Cost-Efficiency

- **Pay-per-use model:** Pay only for the resources consumed,
  eliminating upfront infrastructure costs.

- **Reduced operational expenses:** Cloud providers handle maintenance,
  updates, and security.

Scalability and Flexibility

- **Elastic scaling:** Easily adjust database capacity to meet changing
  demands.

- **Rapid provisioning:** Quickly deploy new databases or modify
  existing ones.

Performance and Reliability

- **High availability:** Built-in redundancy and failover mechanisms.

- **Performance optimization:** Leverage cloud provider's infrastructure
  for optimal performance.

- **Global reach:** Distribute data across multiple regions for low
  latency.

Security

- **Data encryption:** Robust security measures to protect data.

- **Regular updates:** Cloud providers apply security patches and
  updates.

- **Compliance:** Adherence to industry standards and regulations.

Focus on Core Business

- **Reduced IT overhead:** Offload database management tasks to the
  cloud provider.

- **Increased agility:** Focus on application development and
  innovation.

<!-- -->

- **Disaster recovery:** Built-in backup and recovery options.

- **Collaboration:** Enable real-time collaboration on data.

Other benefits

- **Access from anywhere:** Access data and applications from any device
  with internet connectivity.

By leveraging cloud-based databases, organizations can improve
efficiency, reduce costs, and enhance data management capabilities.

## Azure SQL Security Baseline

- Establish network segmentation boundaries with VNET, Subnet, and NSG.

- Secure cloud services with network controls such as Azure private
  link, Disable public network access

- Use centralized IAM: Microsoft Entra for Data plane access

- Restrict use of local authentication methods (Username, password) on
  SQL

- Use managed identities securely and automatically

- Configure Conditional access policy for users accessing the SQL

- Use Azure Keyvault: Service Credential and Secrets Support Integration
  and Storage in Azure Key Vault

- Disable local admin accounts such as dbowner

- Discover classify and label sensitive data

- Enable Microsoft Defender for SQL

- Encrypt data at rest

- Encrypt data in transit

- Enable Transparent data encryption on SQL

 

 

 

**Implement SQL database**

**Basics:**

- Project details: Select subscription and resource group

- Database details: DB name and DB server name

- Choose Storage and Compute plan:

  - Select max and min vCore

  - Maximum data storage capacity

- Backup storage redundancy:

  - Point in time restore (PITR)

  - Long term restore (LTR)

  - Locally redundant backup storage

  - Zone redundant backup storage

  - Geo redundant backup storage

>  

**Networking**

- Network connectivity method: Choose an option for configuring
  connectivity to your server via public endpoint or private endpoint.

  - No access

  - Public endpoint

  - Private endpoint

- Connection policy: Configure how clients communicate with your SQL
  database server.

  - Default - Uses Redirect policy for all client connections
    originating inside of Azure (except Private Endpoint connections)
    and Proxy for all client connections originating outside Azure

  - Proxy - All connections are proxied via the Azure SQL Database
    gateways

  - Redirect - Clients establish connections directly to the node
    hosting the database

- Encrypted connections:

  - Minimum TLS version: TLS1.2

 

**Security**

- Microsoft Defender for SQL: Provides threat protection monitoring and
  vulnerability assessments.: Free trail or Not now

- Ledger cryptographically verifies the integrity of your data and
  detects any tampering that might have occurred.

  - Ledger database means enabling ledger functionality at database
    level.

  - Digest storage

- Transparent data encryption (TDE) key management: TDE encrypts your
  databases, backups, and logs at rest without any changes to your
  application. Database level encryption settings will override the
  server level settings.

  - Server-level key: Service managed key / Customer managed key

  - Database level key:

    - Server level key

    - DB level Customer managed key

      - Database identity: select user assigned managed identity to
        access key in Key vault

      - Customer managed key

 

**Azure Database Services**

**Relational Databases:**

- **Azure SQL Database:** Managed SQL database service for running
  familiar T-SQL queries.

- **Azure SQL Managed Instance:** Fully managed instance of SQL Server
  in the cloud for enterprise workloads.

- **Azure Database for PostgreSQL:** Managed PostgreSQL database
  service.

- **Azure Database for MySQL:** Managed MySQL database service.

- **Azure Database for MariaDB:** Managed MariaDB database service.

- **SQL Server on Virtual Machines:** Deploy your own SQL Server
  instance on a virtual machine in Azure.

 

**NoSQL Database:**

- **Azure Cosmos DB:** Fast and globally distributed NoSQL database for
  any scale.

 

**Cache:**

- **Azure Cache for Redis:** Managed in-memory data store for caching
  frequently accessed data.

 

**Other:**

- **Azure Database Migration Service:** Streamlined service for
  migrating databases to Azure.

- **Azure Managed Instance for Apache Cassandra:** Managed Apache
  Cassandra service for highly available distributed applications.

- **Azure SQL Stretch Database:** Move infrequently accessed data from
  SQL Database to a lower-cost tier.

 

 

**Azure Database security**

This document outlines steps to secure sensitive data in Azure SQL
Database and Azure SQL Managed Instance:

 

- **Authentication and Authorization:** Use Azure AD (now Microsoft
  Entra ID) for secure access control.

- **Monitoring and Auditing:** Enable database auditing to track and
  monitor activity.

- **Data Governance:**

  - Use Microsoft Purview for data governance:

  - Identify use cases for Purview's functionalities.

  - Classify sensitive data using Purview for protection and compliance.

- **Data Masking and Encryption:**

  - Implement dynamic data masking to control sensitive data exposure in
    queries.

  - Use Transparent Data Encryption (TDE) to encrypt data at rest.

  - Recommend scenarios for Azure SQL Database Always Encrypted for
    client-side encryption.

 

**Authentication for Azure Databases**

The summary is accurate! It highlights the key points about
authentication and authorization in Azure SQL Database. Users can prove
their identity using either SQL authentication (username/password) or
Microsoft Entra ID:

- **SQL Logins and Users:** User accounts can be linked to logins stored
  in the master database (centralized) or exist within individual
  databases (contained users).

- **Authorization:** Database roles and permissions determine what
  actions a user can perform. The principle of least privilege is
  recommended, granting users only the necessary access. Applications
  should use dedicated contained database users for authentication to
  minimize risk.

 

**Enable Microsoft Entra ID authentication for Azure SQL Database**

Select Microsoft Entra as the main authentication provider.

 

**Existing logins and user accounts after creating a new database**

This summary outlines the creation and functionalities of logins and
user accounts when deploying a new Azure SQL database:

- **Server Admin Login:**

  - You specify a login name and password during deployment for a
    special administrative account called the "Server admin."

  - This login grants full administrative permissions on all databases
    within the server. It cannot be limited and has all available
    permissions.

  - In a **SQL Managed Instance**, this login is assigned to
    the **sysadmin** fixed server role (absent in Azure SQL Database).

- **Server Admin Login and dbo User:**

  - When the "Server admin" logs into a database, they are mapped to
    the dbo user account within that specific database.

  - The dbo user has full database permissions and is a member of
    the db_owner fixed database role.

- **Viewing and Managing Server Admin:**

  - You can find the "Server admin" name in the Azure portal under the
    "Properties" tab for your server or managed instance.

  - The login name cannot be changed after creation.

  - Password resets can be done through the Azure portal or using
    PowerShell/Azure CLI.

- **Key Points:**

  - Logins provide access to the SQL server instance itself (think
    entryway).

  - User accounts (like dbo) reside within each database and control
    permissions within that database (think access to individual houses
    within a gated community).

  - The "Server admin" login has overall server permissions and maps to
    the powerful dbo user within each database.

 

 

**What is the difference between logins and user accounts in SQL
databases?**

In SQL databases, logins and user accounts serve distinct purposes in
managing access control:

- **Logins:**

  - **Function:** Grant access to the SQL Server instance itself. Think
    of it as a gateway into the server.

  - **Creation:** Defined within the SQL Server instance, independent of
    the operating system.

  - **Credentials:** Store hashed usernames and passwords within SQL
    Server for authentication.

  - **Application:** Used for SQL Server authentication or controlling
    database access.

  - **Mapping:** Can be linked to one or more database users within
    specific databases.

- **User Accounts:**

  - **Function:** Represent a user identity established within the
    operating system (OS).

  - **Management:** Created and maintained by the operating system, not
    directly related to SQL Server.

  - **Credentials:** Stored and managed by the OS.

  - **Application:** Can be leveraged for Windows Authentication in SQL
    Server, eliminating the need for separate login credentials in SQL
    Server.

- **Key Difference:**

  - Logins are specific to SQL Server authentication, providing access
    to the server instance. They manage credentials within SQL Server.

  - User accounts are broader, established by the OS and used for
    various system functionalities. They can be used for Windows
    Authentication in SQL Server, offering a more integrated approach.

>  

Here's an analogy:

- Imagine a gated community (SQL Server) with individual houses
  (databases) inside. Logins act as entry passes to get through the main
  gate (SQL Server instance). User accounts are like resident IDs,
  allowing access to specific houses (databases) if the resident (user
  account) is authorized. Windows Authentication simplifies this by
  using the same ID (user account) for both the gate and the house.

>  

 

 

 

**Database Security Baseline**

 

 

 

**Azure SQL Database**

 

- **Backup and Recovery**

  - Long-term geo-redundant backup should be enabled for Azure SQL
    Databases

  - SQL Database should avoid using GRS backup redundancy

- **Data Security**

  - Deploy SQL DB transparent data encryption

  - Transparent Data Encryption on SQL databases should be enabled

- **Identity and Access Management**

  - Azure SQL Database should have Azure Active Directory Only
    Authentication enabled

- **Logging and Monitoring**

  - Deploy - Configure diagnostic settings for SQL Databases to Log
    Analytics workspace

  - Deploy Diagnostic Settings for Azure SQL Database to Event Hub

- **Network Security**

  - Azure SQL Database should have the minimal TLS version of 1.2

  - Private endpoint connections on Azure SQL Database should be enabled

  - Public network access on Azure SQL Database should be disabled

  - Sensitive data in your SQL databases should be classified/Masked
    (Data masking)

  - Virtual network firewall rule on Azure SQL Database should be
    enabled to allow traffic from the specified subnet

- **Vulnerability Management**

  - SQL databases should have vulnerability findings resolved

  - Vulnerabilities on your SQL databases should be remediated

 

 

**Azure SQL Managed Instance**

 

- **Backup and Recovery:**

  - SQL Managed Instances should avoid using GRS backup redundancy

- **Data security**

  - Advanced data security should be enabled on SQL Managed Instance

  - SQL managed instances should use customer-managed keys to encrypt
    data at rest

- **IAM**

  - Azure SQL Managed Instance should have Azure Active Directory Only
    Authentication enabled

- **Logging and Monitoring**

  - SQL Managed Instance TDE protector should be encrypted with your own
    key

- **Network Security**

  - SQL Managed Instance should have the minimal TLS version of 1.2

- **Threat Detection and Prevention**

  - Microsoft Defender for SQL should be enabled for unprotected SQL
    Managed Instances

  - Vulnerability Management        Vulnerability assessment should be
    enabled on SQL Managed Instance

 

 

## Azure SQL Server 

 

Data Security

- SQL server TDE protector should be encrypted with your own key

- SQL servers should be configured with auditing retention days greater
  than 90 days.

- SQL servers should use customer-managed keys to encrypt data at rest

 

 

Threat Detection and Prevention

- Configure SQL servers to have auditing enabled

- Microsoft Defender for SQL servers on machines should be enabled

- Microsoft Defender for SQL should be enabled for unprotected Azure SQL
  servers

- SQL servers on machines should have vulnerability findings resolved

- Vulnerability Assessment settings for SQL server should contain an
  email address to receive scan reports

- Vulnerability assessment should be enabled on your SQL servers

 

**IAM**

- An Azure Active Directory administrator should be provisioned for SQL
  servers

 

**Network Security**

- Advanced data security should be enabled on your SQL servers

- Configure Azure SQL Server to disable public network access

- Configure Azure SQL Server to enable private endpoint connections

- Deploy Advanced Data Security on SQL servers

- Deploy Auditing on SQL servers

- MySQL server should use a virtual network service endpoint

- PostgreSQL server should use a virtual network service endpoint

- Public network access should be disabled for MySQL flexible servers

- Public network access should be disabled for PostgreSQL flexible
  servers

- SQL Auditing settings should have Action-Groups configured to capture
  critical activities

- SQL Server should use a virtual network service endpoint

 

 

**Logging and Monitoring**

- Auditing on SQL server should be enabled

- SQL servers with auditing to storage account destination should be
  configured with 90 days retention or higher

- Configure Azure SQL database servers diagnostic settings to Log
  Analytics workspace

 

 

 

**Datalake security baseline**

**Azure Data Lake Storage**

- RBAC: Grant least privilege access with Azure RBAC for ADLS accounts,
  containers, and files.

- AAD: Use Azure Active Directory (AAD) for user authentication,
  avoiding storage access keys.

- Encryption: Enable storage service encryption (SSE) or
  customer-managed keys for data at rest and in transit.

- Audit Logging: Configure audit logging to track data access and
  modifications.

- Monitor Logs: Utilize Azure Monitor to analyse audit logs for
  suspicious activity.

- Data Classification: Classify sensitive data and implement stricter
  access controls.

- Review Permissions: Regularly review and update RBAC permissions to
  reflect current needs.

 

 

**Connect Azure SQL Server using Private Endpoint in Azure Portal.**

 

Importance of using Azure Private Endpoint to establish secure
connections to Azure SQL Server:

How to configure and create an Azure Private Endpoint for Azure SQL
Server

Network architecture and components involved in setting up an Azure
Private Endpoint.

How to validate and test the connection between the Azure Private
Endpoint and Azure SQL Server.

# Azure Database Security

Azure offers various security features to protect your databases:

**Azure SQL Database Security:**

- **Network Access Control:** Firewalls restrict access to your database
  server and specific databases.

- **User Access Control:** Manage user access with Azure Active
  Directory (Azure AD) for authentication and authorization.

- **Data Protection:** Encrypt data at rest and in transit.

- **Monitoring:** Audit database activity for potential security
  breaches.

**Configuration Options:**

- **Database Authentication (Azure AD):** Control access with Azure
  identities.

- **Database Auditing:** Track database activity for security analysis.

- **Dynamic Data Masking:** Hide sensitive data in query results.

- **Database Encryption:** Encrypt data at rest within Azure storage.

- **Network Isolation:** Isolate data solutions like Azure Synapse
  Analytics and Cosmos DB.

**Azure SQL Database Firewall:**

- Initially, all public access is blocked.

- Define firewall rules to allow access from specific IP addresses or
  virtual networks.

- Server-level rules control access to the entire server.

- Database-level rules control access to specific databases.

**Cosmos DB (NoSQL Database):**

- Stores schema-less data for flexibility.

- Offers global distribution and multi-model support for diverse
  applications.

- Scales throughput and storage independently across the globe.

- Provides fast data access and high availability with SLAs.

- Uses Automatic-Record-Sequence (ARS) format and supports Gremlin API.

**Additionally, Azure offers other database services:**

- **SQL Database:** Managed relational database with 99.99%
  availability.

- **SQL Managed Instance:** Managed instance of SQL Server for
  enterprise environments.

- **MySQL and PostgreSQL:** Popular open-source relational database
  options.

- **Data Lake Analytics:** Service for large-scale data analytics.

- **Cache for Redis:** Managed in-memory data cache service.

## Azure SQL Database Security

- Control network access to your Azure SQL Database using firewall rules

- Control user access to your Azure SQL Database using authentication
  and authorization

- Protect your data in transit and at rest

- Audit and monitor your Azure SQL Database for access violations

**Configure security for data**

- enable database authentication by using Azure AD

- enable database auditing

- configure dynamic masking on SQL workloads

- implement database encryption for Azure SQL Database

- implement network isolation for data solutions, including Azure
  Synapse Analytics and Azure Cosmos DB

**Control network access to your Azure SQL Database using firewall
rules**

- Initially all public access to Azure SQL DB is blocked SQL DB
  Firewall.

- To access a database server, you must specify one or more server-level
  IP firewall rules that enable access to your Azure SQL Database.

- Firewall rules are configured at server and database level.

**Server level firewall rules:**

- Allow access to Azure services

- IP address rules

- Virtual network rules

**Database level firewall rules:**

- IP address rules

## Cosmos DB

- No SQL means schema-less data

- Globally Distributed, multi-model DB service means can be used by
  global users.

- Elastically and independently scale throughput and storage across
  globe.

- Fast single digit Mili-second data access

- Provide comprehensive SLA for throughput, latency, availability and
  consistency

- Stores data in Automatic-Record-Sequence (ARS) format

- Gremlin API

## SQL Database

- SQL Relational Database, Provides 99.99% availability

## SQL Managed Instance

- Enterprise SQL Server

## MySQL

- SQL Relational Database, Used for LAMP stack

## PostgreSQL

- SQL Relational Database

## Data Lake Analytics

## Cache Redis

- Fully managed service caches

## Cosmos DB

# Big Data and Analytics Solutions

## Synapse Analytics 

Data warehouse. Run analytics at a massive scale by using a cloud-based
enterprise data warehouse that takes advantage of massively parallel
processing to run complex queries quickly across petabytes of data.

## HDInsight 

Process massive amounts of data with managed clusters of Hadoop clusters
in the cloud.

## Azure Databricks 

Integrate this collaborative Apache Spark-based analytics service with
other big data services in Azure.

# Big Data and Analytics Solutions

## Synapse Analytics 

Data warehouse. Run analytics at a massive scale by using a cloud-based
enterprise data warehouse that takes advantage of massively parallel
processing to run complex queries quickly across petabytes of data.

## HDInsight 

Process massive amounts of data with managed clusters of Hadoop clusters
in the cloud.

## Azure Databricks 

Integrate this collaborative Apache Spark-based analytics service with
other big data services in Azure.

# Cache for Redis 

# Cognitive Services

# SQL Database and servers

# Data Lake services

# Azure Disk

# MariaDB database

# PostgreSQL database

- <u>Network Security:</u>

  - Disable Public Network Access: Restrict access to the database by
    default and only allow connections from specific IP addresses,
    virtual networks, or trusted services. This significantly reduces
    the attack surface.

  - Azure Firewall: Configure Azure Firewall rules to define granular
    access control based on IP addresses, virtual networks, ports, and
    protocols.

  - Private Endpoints: Establish private connections between your Azure
    Virtual Networks and the database using private endpoints for
    enhanced security and isolation.

- <u>Identity and Access Control:</u>

  - Azure Active Directory (AAD) Authentication: Utilize AAD for secure
    authentication and authorization. This ensures only authorized users
    and applications can access the database.

  - Role-Based Access Control (RBAC): Implement RBAC to define granular
    permissions for users and groups within AAD, granting access based
    on the principle of least privilege.

  - Secure Connection Strings: Avoid storing connection strings in plain
    text. Instead, use Azure Key Vault or environment variables to
    securely store and manage them.

- <u>Data Encryption:</u>

  - **Always Encrypted (AE):** Implement Always Encrypted to encrypt
    data at rest and in transit within the database server, ensuring
    data remains confidential even if compromised.

  - **Client-side encryption:** Consider encrypting data before sending
    it to the database and decrypting it only when needed on the
    application side. This adds an extra layer of security.

- <u>Data Security:</u>

  - **Row-Level Security (RLS):** Implement RLS to control access to
    specific rows of data based on user roles or attributes, restricting
    unauthorized access to sensitive information.

  - **Dynamic Data Masking**: Leverage dynamic data masking to obfuscate
    sensitive data, such as credit card numbers or personal information,
    when queried, protecting it from unauthorized viewing.

  - Auditing: Enable auditing to track database activity, including user
    logins, data modifications, and other critical events, allowing you
    to identify potential security incidents.

- <u>Additional Considerations:</u>

  - Just-in-Time (JIT) Access: Implement JIT access controls to grant
    temporary access to the database only when needed, minimizing the
    exposure window for authorized users.

  - Vulnerability management: Regularly scan your database server for
    vulnerabilities and apply security patches promptly to address
    potential security risks.

  - Backups and Recovery: Maintain regular backups of your database and
    test the restore process to ensure you can recover your data quickly
    in case of an incident.
