

## Cross-site Scripting (XSS) in Azure

**Types:**

- Stored XSS
- Reflected XSS
- DOM-based XSS

**Azure Security Solutions:**

- Deploy **Azure WAF** rules to block common XSS payloads.
- Implement **Content Security Policy (CSP)** headers in Azure App Services or Azure Static Web Apps.
- Enforce **Input Validation** and **Output Encoding** in Azure-hosted web apps.

**Detection (Microsoft Sentinel):**

- Analyze application logs and WAF logs for script injection attempts
  and unusual client-side script execution.

- Integrate Sentinel with Azure WAF logs for real-time XSS attack
  detection.

**Mitigation:**

- Use CSP to restrict script execution sources.

- Validate and encode all user-generated content.

- Patch and update web applications deployed in Azure App Services or
  Azure Kubernetes Service (AKS).

**Example:**

- Malicious script injected into comments stored in Azure Cosmos DB
  through a web app, executed when viewed by other users.