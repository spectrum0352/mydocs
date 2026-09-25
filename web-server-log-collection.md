A

# Purpose

Detect abnormal activity in web server logs (SOC2 CC6.7 System
Operations).

# Query

index=web sourcetype=access_combined \| stats count by status

# Outcome

Monitors HTTP status codes to detect anomalies such as 404 or 500
errors. Helps identify potential web server misconfigurations or attacks
