# Operations

## Vulnerability management

**How to download vulnerability scan report from Microsoft Defender XDR?**
To download a vulnerability scan report from Microsoft Defender XDR, you can follow these steps:

1. Go to the Microsoft Defender XDR portal.
2. Click Endpoints \> Vulnerabilities.
3. In the Vulnerabilities table, click the Export button.
4. In the Export Vulnerabilities dialog box, select the CSV or JSON format for the report.
5. Click the Export button to download the report.

The report will contain information about the vulnerabilities that were found, including the vulnerability identifier, the severity of the vulnerability, and the affected devices.

Tips:

- You can filter the Vulnerabilities table before exporting the report to include only the vulnerabilities that you are interested in.
- You can also export the report to a specific date range. 
- You can schedule the report to be exported on a regular basis.

Once you have downloaded the report, you can use it to identify and prioritize vulnerabilities to be remediated.

# How to add attack indicators in Defender?

- We can add up to 15000 indicators (Files Hashes, IP addresses, URLs/Domains, Certificates)
- Navigate to Settings - Endpoints - Rules - Indicators

**How to add File Hash?**

- **Indicator**: Add File Hash, Title, and Description of Hash, Expiry date for File Hash.
- **Actions:**
  - Response action whenever this file hash is found.
    - Allow
    - Audit
    - Warn
    - Block execution
    - Block and Remediate
  - Alert details: Select Generate alerts
    - Severity: Informational, Low, Medium, High
    - Category: Select Alert category as per MITRE ATT&CK Framework
    - Technique: Select MITRE ATT&CK technique
- **Organizational scope:** All devices in organization