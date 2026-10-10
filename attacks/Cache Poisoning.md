Cache Poisoning

Injecting false data into caches to manipulate responses or redirect
users.
Azure Context:  
Azure CDN, Azure Front Door, or internal caches can be poisoned to serve
malicious content.
Mitigation:
Implement strict input validation and sanitization in applications.
Use Azure Front Door's Web Application Firewall (WAF) to filter
malicious payloads.
Monitor cache integrity with logging and anomaly detection.