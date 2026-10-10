## Cross-site Scripting (XSS) in Azure

**Types:**

* Stored XSS
* Reflected XSS
* DOM-based XSS

**Azure Security Solutions:**

* Deploy **Azure WAF** rules to block common XSS payloads.
* Implement **Content Security Policy (CSP)** headers in Azure App Services or Azure Static Web Apps.
* Enforce **Input Validation** and **Output Encoding** in Azure-hosted web apps.

**Detection (Microsoft Sentinel):**

* Analyze application logs and WAF logs for script injection attempts
and unusual client-side script execution.
* Integrate Sentinel with Azure WAF logs for real-time XSS attack
detection.

**Mitigation:**

* Use CSP to restrict script execution sources.
* Validate and encode all user-generated content.
* Patch and update web applications deployed in Azure App Services or
Azure Kubernetes Service (AKS).

**Example:**

* Malicious script injected into comments stored in Azure Cosmos DB
through a web app, executed when viewed by other users.



Explain what cross-site scripting (XSS) is all about. 🡪 This is a type of cyber-attack where malicious pieces of code, or even scripts, can be covertly injected into trusted websites. These kinds of attacks typically occur when the attacker uses a vulnerable Web-based application to insert the malicious lines of code. This can occur on the client side or the browser side of the application. As a result, when an unsuspecting victim runs this application, their computer is infected and can be used to access sensitive information and data. A perfect example of this is the contact form, which is used on many websites. The output that is created when the end user submits their information is often not encoded, nor is it encrypted.



