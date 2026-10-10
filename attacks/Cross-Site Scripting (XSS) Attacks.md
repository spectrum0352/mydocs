Cross-Site Scripting (XSS) Attacks

Injecting malicious scripts into web apps, affecting users interacting
with Azure-hosted web applications.  
Azure Context: Web Apps hosted on Azure App Service or Azure Static
Web Apps vulnerable to XSS.  
Mitigation:
Sanitize inputs and implement output encoding in app code.
Use Content Security Policy (CSP) headers to restrict resource
loading.
Regularly scan and pen test apps; use Azure Application Gateway
WAF for runtime protection.



**Cross-Site Scripting (XSS)**

Malicious scripts injected into web apps hosted on Azure App Service or
Azure Static Web Apps.

**Impact:** Can steal session cookies, impersonate users.

