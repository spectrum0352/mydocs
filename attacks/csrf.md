# Cross-Site Request Forgery (CSRF)

**Description:**
Malicious sites trick authenticated Azure web app users into executing unauthorized actions on Azure-hosted applications or APIs.

**Azure-Specific Solutions:**

* Develop Azure-hosted web applications with **anti-CSRF tokens** to verify requests’ authenticity.
* Implement strict **CORS (Cross-Origin Resource Sharing)** policies and **Same-Origin Policy (SOP)** enforcement in Azure App Service or Azure
API Management.
* Use **Azure Front Door** or **Azure Application Gateway** with Web Application Firewall (WAF) rules to help block CSRF attempts.

**Cross-Site Request Forgery (CSRF)**

Tricks users into submitting unintended actions in Azure-hosted apps
(e.g., Azure-hosted admin panels).

**Mitigation:** Anti-CSRF tokens, secure cookies, Azure Front Door WAF
rules.

