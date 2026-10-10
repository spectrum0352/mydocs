Content Security Policy (CSP) Bypass

Attackers circumvent CSP to inject malicious scripts.
Azure Context:  
Azure-hosted web apps need robust CSP headers to prevent cross-site
scripting (XSS).
Mitigation:
Enforce strict CSP directives in Azure Web Apps.
Use Subresource Integrity (SRI) for external resources.
Monitor and test CSP implementation regularly.