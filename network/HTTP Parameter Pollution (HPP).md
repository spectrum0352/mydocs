HTTP Parameter Pollution (HPP)

Attackers send multiple HTTP parameters with the same name to bypass
validation or inject code.
Azure Context:  
Web apps on Azure App Service, Azure Functions, or APIs are
vulnerable.
Mitigation:
Enforce server-side input validation and sanitize all parameters.
Use secure frameworks that handle parameter parsing properly.
Employ Azure Web Application Firewall (WAF) to detect and block
suspicious HTTP requests.