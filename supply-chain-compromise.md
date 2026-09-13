# Purpose

# Query

# Outcome

# Scenario

## Scenario-1

### Firewall Logs 

<span class="mark">Date: 2024-12-26T03:45:12Z</span>

> Source IP: 192.168.1.45
>
> Destination IP: 45.67.89.123
>
> Destination Port: 443
>
> Protocol: HTTPS
>
> Action: ALLOWED
>
> Bytes Sent: 234,657
>
> Bytes Received: 1,045,234

<span class="mark">Date: 2024-12-26T03:50:24Z</span>

> Source IP: 192.168.1.45
>
> Destination IP: 123.45.67.89
>
> Destination Port: 22
>
> Protocol: SSH
>
> Action: BLOCKED
>
> Bytes Sent: 987
>
> Bytes Received: 0

<span class="mark">Date: 2024-12-26T03:55:10Z</span>

> Source IP: 192.168.1.100
>
> Destination IP: 8.8.8.8
>
> Destination Port: 53
>
> Protocol: DNS
>
> Query: suspicious-malware-site\[.\]com
>
> Action: ALLOWED

### EDR Alerts 

<span class="mark">Alert ID: 109284</span>

> Time: 2024-12-26T03:40:10Z
>
> Host: DESKTOP-34HJ82
>
> Severity: High
>
> Detection: Malicious PowerShell Script
>
> Command Line: powershell.exe -EncodedCommand \<base64string\>
>
> File Path: C:\Users\User\AppData\Local\Temp\update.exe
>
> Action Taken: Quarantined

<span class="mark">Alert ID: 109285</span>

> Time: 2024-12-26T03:45:15Z
>
> Host: SERVER-01
>
> Severity: Critical
>
> Detection: Suspicious Network Activity
>
> Details: Outbound traffic to IP 45.67.89.123 over HTTPS (Potential C2 Communication)
>
> Action Taken: Blocked by EDR

### SIEM Correlation Logs 

<span class="mark">2024-12-26T03:38:50Z - Correlation Rule Triggered: "Suspicious PowerShell Activity"</span>

> Host: DESKTOP-34HJ82
>
> Rule: Base64 encoded PowerShell detected
>
> Details: powershell.exe -EncodedCommand

<span class="mark">2024-12-26T03:42:12Z - Correlation Rule Triggered: "Outbound C2 Communication"</span>

> Host: SERVER-01
>
> Destination IP: 45.67.89.123
>
> Protocol: HTTPS
>
> Details: Large data transfer detected

<span class="mark">2024-12-26T03:44:33Z - Correlation Rule Triggered: "DNS Query for Known Malicious Domain"</span>

> Host: DESKTOP-34HJ82
>
> Domain: suspicious-malware-site\[.\]com
>
> Action: Alerted

### DNS Traffic Logs 

<span class="mark">Timestamp: 2024-12-26T03:35:40Z</span>

> Source IP: 192.168.1.45
>
> Query: suspicious-malware-site\[.\]com
>
> Response: 45.67.89.123

<span class="mark">Timestamp: 2024-12-26T03:40:50Z</span>

> Source IP: 192.168.1.45
>
> Query: update\[.\]legit-software\[.\]com
>
> Response: 23.45.67.89

### Questions 

1.  What was the initial sign of compromise?

2.  What is the significance of the base64-encoded PowerShell command?

3.  What was the suspected Command and Control (C2) server?

4.  Why was the DNS query for suspicious-malware-site\[.\]com flagged?

5.  What mitigation action did the EDR take on DESKTOP-34HJ82?

6.  What is the significance of the blocked SSH attempt in the firewall logs?

7.  What protocol was used for potential data exfiltration?

8.  How did the SIEM correlate the DNS traffic with the malicious activity?

9.  What additional logs should be analysed to confirm lateral movement?

10. How can future attacks of this nature be mitigated?
