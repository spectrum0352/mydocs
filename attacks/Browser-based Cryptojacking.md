Browser-based Cryptojacking
Attack:  
Malicious JavaScript mines cryptocurrency on visitor browsers without
consent, wasting CPU resources.  
Azure Context:  
Apps hosted in Azure or accessed via Azure Front Door may serve or proxy
compromised content.  
Solution:
Use Content Security Policy (CSP) in Azure Web Apps to restrict script
execution.
Employ Azure Front Door’s Web Application Firewall (WAF) to block
known malicious script patterns.
Educate developers on secure coding and monitor application telemetry
for unusual CPU spikes.