Purpose
Track file changes for sensitive files (SOC2 CC6.7 - System Operations).

Query
index=linux sourcetype=linux_secure | search "chmod" OR "chown"

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes
