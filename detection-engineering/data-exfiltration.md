Data Exfiltration Monitoring: Detects potential data exfiltration attempts and sends notifications or blocks activity.
Purpose
Detect large data transfers indicating possible data exfiltration (SOC2 CC6.7 - System Operations)
Query
index=network sourcetype=paloalto | stats sum(bytes) as total_bytes by dest_ip | where total_bytes > 10000000


Outcome
Identifies external IPs receiving unusually large amounts of data. Helps detect potential data exfiltration activities
