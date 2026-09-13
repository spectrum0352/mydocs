# Data Compromise Indicators

## Overview

Data compromise indicators are signs that sensitive data has been accessed, modified, encrypted, or exfiltrated by an unauthorized user. These indicators may appear across endpoints, databases, storage systems, email infrastructure, cloud services, and network traffic.

---

# File and Storage Indicators

- Large compressed archives (for example, multi-GB or TB ZIP, RAR, or 7z files) appearing in unusual locations.
- Bundles of sensitive files stored outside their normal directories.
- Unexpected files created in sensitive locations.
- Hidden files or directories containing unknown or sensitive data.
- Files with unusual names, random characters, or unfamiliar extensions.
- Tampered, modified, or corrupted files.
- Unexpected changes to file permissions or ownership.
- Modified system files.
- Deleted or missing log files intended to hide attacker activity.

---

# Database Indicators

- Unusually high database read activity.
- Unusually high database write activity.
- Large data exports from databases.
- Large numbers of requests for the same database records or files.
- Unexpected access to sensitive databases.
- Database alerts indicating suspicious queries or abnormal access patterns.
- Database audit logs showing unauthorized activity.

---

# Storage and Cloud Indicators

- Storage service alerts indicating unusual access or downloads.
- Large volumes of data downloaded from cloud storage.
- Unexpected sharing of storage containers or file shares.
- Anonymous or unauthorized access to storage resources.
- Sudden spikes in storage API requests.

---

# Email Indicators

- High volumes of outbound email from a user or service account.
- Large numbers of bounced emails with suspicious content.
- Users reporting strange emails sent from your domain.
- Phishing emails containing malicious links or attachments.
- Spam campaigns originating from internal accounts.
- Unusual email sending patterns outside normal business hours.

---

# Network Indicators

- Data exfiltration attempts to external destinations.
- Unusually high outbound network traffic.
- Large file uploads to unknown cloud services.
- Tunneling activity used to hide network communications.
- Connections to suspicious domains or IP addresses.
- Unusual DNS queries.
- Abnormal HTTP/HTTPS response sizes.
- Repeated requests for the same file or resource.
- High bandwidth usage by unknown processes.
- Internal port scanning or network reconnaissance.

---

# Authentication and Access Indicators

- Suspicious login attempts.
- Multiple failed login attempts or brute-force attacks.
- Successful logins from unusual geographic locations.
- User logins occurring outside normal working hours.
- Unauthorized access to sensitive files or systems.
- Increased privileged account activity.
- Lateral movement between systems.

---

# Endpoint Indicators

- Ransom notes demanding payment to recover encrypted files.
- Files encrypted with unfamiliar extensions.
- Security software disabled, modified, or uninstalled.
- Endpoint Detection and Response (EDR) sensors disabled or offline.
- Anti-malware signature updates failing unexpectedly.
- Suspicious registry modifications.
- Modified startup programs or autorun entries.
- Unauthorized scheduled tasks.
- Hidden services, backdoors, or persistence mechanisms.
- Rootkit detection alerts.
- Downloads from untrusted or malicious sources.
- Unexpected browser extensions installed.
- Browser history deleted or manipulated.
- Bookmarks added to malicious websites.
- Unexpected USB or removable media activity.
- Unexpected microphone or webcam activation.
- High CPU, memory, disk, or network utilization without a legitimate cause.

---

# Security Monitoring Indicators

- Alerts from antivirus, EDR, IDS, IPS, SIEM, or firewall solutions.
- Database monitoring alerts.
- Storage service monitoring alerts.
- Cloud security monitoring alerts.
- Audit logs showing unauthorized configuration changes.
- Missing, altered, or disabled security logs.

---

# User-Reported Indicators

- Users receiving phishing emails.
- Users reporting suspicious login notifications.
- Users reporting missing or modified files.
- Reports of unauthorized access to sensitive information.
- Reports of unusual account behavior.
- Reports of emails being sent from their account without their knowledge.

---

# Web Application Indicators

- Abnormally large HTML response sizes.
- Unexpected spikes in downloads from web applications.
- Large numbers of requests for the same resource.
- Unauthorized access to sensitive web application content.

---

# Common Indicators of Data Exfiltration

- Large compressed archives created shortly before network transfers.
- Sudden increases in outbound data transfers.
- Sensitive files copied to temporary or staging directories.
- Bulk downloads from databases or file shares.
- Uploads to unauthorized cloud storage providers.
- Encrypted outbound network tunnels.
- Data transferred outside normal business hours.
