### Phishing Attacks

Fraudulent emails or messages that attempt to steal Azure credentials or other sensitive info.

**Azure-Specific Solutions:**

* Deploy **Microsoft Defender for Office 365** with Safe Links and Safe attachments to filter phishing emails.
* Enforce **Azure AD Multi-Factor Authentication (MFA)** and **Conditional Access** to mitigate risk from stolen credentials.
* Conduct regular **security awareness training** for users on phishing recognition and reporting.

**1. Phishing**

Attackers impersonate trusted entities (e.g., Azure AD login pages or
Microsoft 365 admins) to steal credentials or MFA tokens. Common vector
for initial access into Azure tenants.

**Azure Impact:** Compromised accounts may lead to unauthorized access
to Entra ID (Azure AD), subscriptions, and services.



