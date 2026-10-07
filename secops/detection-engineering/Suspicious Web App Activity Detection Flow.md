# Suspicious Web App Activity Detection Flow

 

Your detection flow is mostly correct, but let me refine it with how Microsoft Defender for Cloud actually works with Azure App Service and App Gateway logs:

How Detection Works

Data Collection
Azure App Service generates HTTP logs, diagnostics, and audit data.
Azure Application Gateway produces access logs, performance logs, and firewall logs.
These logs are sent to Azure Monitor (Log Analytics workspace).
Defender for Cloud Analysis
Defender for App Service (a plan within Defender for Cloud) continuously monitors runtime behaviors and incoming traffic.
It uses cloud-native detection (patterns in logs and runtime telemetry) and Microsoft Threat Intelligence (global attack data).
Signals are correlated with behavioral analytics (e.g., unusual request spikes, brute force attempts) and known attack signatures (SQL injection, command injection, etc.).
Alert Generation
When anomalies or threats are detected, Defender for Cloud raises a security alert.
Alerts can include details like suspicious IPs, request payloads, or abnormal traffic volumes.
These alerts are then forwarded to Microsoft Sentinel if integrated, where they can be grouped into incidents for investigation and automated response.
Key Clarifications

Defender doesn't just rely on logs in Azure Monitor; it also uses runtime signals directly from App Service. This means detection is not limited to log ingestion but includes real-time monitoring of the service itself.
The detection of attacks like SQL injection or brute force is powered by Defender for App Service's built-in analytics, not purely by log queries.
Sentinel is optional — if connected, it ingests alerts from Defender for Cloud and correlates them into incidents.
Refined Flow

Here's a slightly more accurate representation:

Internet Traffic

   ↓

Azure App Service / App Gateway

   ↓

Runtime telemetry + HTTP/diagnostic logs

   ↓

Logs → Azure Monitor (Log Analytics)

   ↓

Microsoft Defender for Cloud (App Service plan)

   ↓

Threat intelligence + behavior analytics correlation

   ↓

Detect anomalies (SQLi, command injection, brute force, spikes)

   ↓

Security Alert generated

   ↓

(Optional) Alert forwarded to Microsoft Sentinel

   ↓

Incident created for investigation/response

So yes, your flow is correct in principle, but the important nuance is that Defender for App Service uses both runtime monitoring and logs, not just Azure Monitor ingestion. Microsoft Learn docs.azure.cn

 