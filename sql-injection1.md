
## SQL Injection in Azure

**Types:**

- Classic SQL Injection
- Blind SQL Injection

**Azure Security Solutions:**

- **Azure Web Application Firewall (WAF)** integrated with **Azure Front Door** or **Azure Application Gateway** to filter malicious SQL
  payloads.
- Use **Parameterized Queries** and **Stored Procedures** in Azure SQL Database and Azure SQL Managed Instance.
- Implement **Input Validation** and **Output Encoding** in Azure-hosted applications.
- Follow **Secure Coding Practices** recommended by Microsoft and OWASP.

**Detection (Azure SIEM - Microsoft Sentinel):**

- Monitor Azure SQL Database audit logs and SQL Server Extended Events for anomalous query patterns.
- Correlate unexpected or suspicious database activity with other logs (App Service logs, firewall logs).
- Use Sentinel built-in analytics and machine learning rules for **SQL Injection detection**.

**Mitigation:**

- Enforce **parameterized queries** and ORM protections in application code.
- Sanitize all user inputs on Azure-hosted applications.
- Regularly patch Azure SQL services via Azure Update Management and monitor security advisories.
- Enable **Azure Defender for SQL** to detect and block SQL injection attempts.

**Example:**

- An attacker submits malicious SQL code via a web form hosted on Azure App Service, manipulating Azure SQL Database queries to extract
  sensitive data.