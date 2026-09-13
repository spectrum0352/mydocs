# Types: 

Passive Sniffing, Active Sniffing.

Examples: Wireshark: Example: An attacker uses Wireshark to capture and analyze packets on a network, gaining unauthorized access to sensitive information, such as login credentials.

# Security solution: - 

Security Solution: Encryption (SSL/TLS, VPNs), Network Segmentation, Intrusion

Detection/Prevention Systems (IDS/IPS).

# Detection: - - 

Detection in SIEM: Monitoring for unauthorized sniffing activities, and analyzing network traffic for

abnormal patterns.

SIEM Solution Features: Log analysis, real-time monitoring, and detection of unusual network

behaviour.

# Mitigation: 

- Encrypt sensitive data using protocols like SSL/TLS or VPNs. Implement network segmentation to limit access to sensitive information. Use intrusion detection/prevention systems to detect and block sniffing attempts.

# Purpose

Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

# Query

index=linux sourcetype=linux_secure \| search "chmod" OR "chown"

# Outcome

Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes
