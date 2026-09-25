## Cross-Site Request Forgery (CSRF) in Azure

**Types:**

- Same-Site CSRF
- CSRF with Tokens

**Azure Security Solutions:**

- Implement **Anti-CSRF tokens** in Azure-hosted web apps (App Service, AKS).
- Use the **SameSite cookie attribute** in Azure App Service cookie policies.
- Validate user sessions with **Azure AD Conditional Access** policies to prevent session hijacking.

**Detection (Microsoft Sentinel):**

- Detect unusual POST or state-changing requests in application logs.
- Monitor authentication logs for suspicious session behavior.

**Mitigation:**

- Integrate anti-CSRF tokens into application frameworks hosted on Azure.
- Use SameSite cookies to restrict cross-site cookie sending.
- Secure user authentication via Azure AD with session validation.

**Example:**

- A user logged into an Azure-hosted web app is tricked into unknowingly submitting a form changing their account details.
