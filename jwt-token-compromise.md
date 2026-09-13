# JWT Token compromise in Azure

**JWT (JSON Web Token) in Azure Penetration Testing**

**🔐 What is a JWT?**

A **JSON Web Token (JWT)** is a compact, URL-safe token used to securely
transmit claims between two parties. It is widely used in **Azure-based
applications**, especially within:

- **Azure Active Directory (Azure AD)** tokens

- **Azure App Services**

- **Microsoft Graph API**

- **Azure AD B2C**

- **OAuth 2.0/OpenID Connect flows**

------------------------------------------------------------------------

**🧱 JWT Structure**

A typical JWT is composed of **three base64url-encoded segments**,
separated by dots (.):

1.  **Header**

    - Specifies the **signing algorithm** and token type.

    - Example: {"alg":"HS256","typ":"JWT"}

2.  **Payload**

    - Contains **claims** (e.g., user ID, tenant ID, role).

    - May include sensitive Azure-specific fields like oid (object ID),
      tid (tenant ID), scp (scopes), etc.

3.  **Signature**

    - Ensures **integrity** and **authenticity**.

    - Created using a secret (HMAC) or private key (RSA/ECDSA).

------------------------------------------------------------------------

**🛡️ Common JWT Attacks in Azure Penetration Testing**

**✅ Real-world Use Cases:**

In Azure, JWTs are often used for API access (e.g., Microsoft Graph),
web authentication (Azure AD), and internal Azure service
communications.

**⚠️ Common Attack Techniques:**

1.  **Token Forgery**

    - Forge a token using a known or guessed secret key.

    - Especially dangerous if alg is none or weak (e.g., HS256 with weak
      secret).

    - Azure services using misconfigured custom JWT validation logic are
      vulnerable.

2.  **Algorithm Substitution**

    - Modify the alg field to none or downgrade from RS256 to HS256.

    - Trick services into accepting unsigned or symmetrically signed
      tokens.

3.  **Token Manipulation**

    - Change user roles or claims in the payload.

    - Re-sign the token if key is known or weak.

4.  **Key Leakage / Extraction**

    - Exploit server misconfigurations or errors to extract keys.

    - Azure Key Vault misconfigurations may leak signing secrets.

5.  **Expired Token Reuse**

    - Replay expired tokens in services lacking expiration checks.

    - Abuse clock-skew or improper validation logic in Azure apps.

------------------------------------------------------------------------

**🎯 Impact in Azure Environments**

- **Privilege escalation** via role claim tampering.

- **Unauthorized access** to APIs like Microsoft Graph or Azure Resource
  Manager.

- **Cross-tenant access** if tokens are accepted without verifying tid
  (tenant ID).

- **User impersonation** by crafting tokens with spoofed upn (user
  principal name).

------------------------------------------------------------------------

**✅ Mitigations (Defensive Perspective)**

To protect Azure-based apps and APIs from JWT abuse:

- **Use strong signing algorithms** (e.g., RS256, ES256).

- **Validate all claims**, especially aud, exp, iss, sub, and tid.

- **Enforce token expiry** with short-lived access tokens and refresh
  tokens.

- **Use HTTPS** for all token transmission.

- **Validate signatures server-side only** using proper libraries (not
  client-side).

- **Restrict token scope and permissions** to minimum necessary.

- **Log and audit token use**, especially across tenant boundaries.

------------------------------------------------------------------------

**🔍 Practical Azure Pentesting Examples**

- Dump and decode access tokens from browser or proxy (e.g., Burp,
  Fiddler).

- Modify JWT payload (e.g., escalate role from Reader to Owner) and
  observe server behavior.

- Test Azure Function apps or APIs for improper token validation.

- Brute-force or guess symmetric keys used in poorly protected apps.

- Check for alg = none acceptance in custom services.

- Abuse tokens with valid signatures across different tenants if
  multi-tenant app lacks checks.

------------------------------------------------------------------------

**📚 References**

- [PortSwigger JWT Security](https://portswigger.net/web-security/jwt)

- [JWT.io Introduction](https://jwt.io/introduction)

- [Hacking JWTs –
  Medium](https://medium.com/swlh/hacking-json-web-tokens-jwts-9122efe91e4a)

------------------------------------------------------------------------

Would you like a script to automatically test for weak JWT
implementations in Azure web apps?

In Azure penetration testing, particularly when targeting **Microsoft
Entra ID (formerly Azure Active Directory)**, **JWTs are a central
attack surface**. They are used extensively for identity and access
control, especially in the context of **OAuth 2.0** and **OpenID
Connect**. Here's how JWTs are used—and abused—during Azure Entra ID
pentests:

------------------------------------------------------------------------

**🔍 How JWTs Are Used in Entra ID**

**🧾 Common JWT Types**

1.  **ID Token** (OpenID Connect)

    - Contains user identity claims (e.g., name, email, oid, tid).

    - Issued during interactive logins via browser or app.

2.  **Access Token** (OAuth 2.0)

    - Used to access Microsoft APIs (e.g., Microsoft Graph, Azure
      Management).

    - Contains scp (scopes) or roles, aud (audience), appid, etc.

3.  **Refresh Token**

    - Not a JWT, but used to obtain new ID/access tokens.

These tokens are signed by **Microsoft Entra ID**, often using RS256
(RSA SHA-256) and can be verified using Microsoft’s public keys from the
**OpenID metadata endpoint**.

------------------------------------------------------------------------

**🛠️ JWT Abuse in Entra ID Pentesting**

**🎯 Common Attack Scenarios**

| **Attack Vector** | **Description** | **Example in Entra ID** |
|----|----|----|
| **Token Replay** | Reuse a valid JWT (access or ID token) stolen from browser, logs, or memory. | Exfiltrate a token from a logged-in user and reuse it to call Microsoft Graph. |
| **Privilege Escalation** | Modify JWT claims like roles, scp, or groups. | Modify token to escalate from User to Global Admin (requires weak validation). |
| **Misconfigured Multi-Tenant Apps** | Abuse apps that don’t validate tid (tenant ID). | Access a vulnerable multi-tenant app using a token from attacker’s tenant. |
| **Token Substitution** | Swap access tokens between endpoints or services. | Use token meant for Graph API against Azure Management API if aud check is missing. |
| **None Algorithm Attack** | Forge token if app accepts alg: none. | Rare in Entra ID but relevant in custom token validators. |
| **Token Signing Key Leakage** | Steal private key if hosted in poorly secured Key Vault or exposed via app settings. | Extract key from leaked ARM template or GitHub repo. |

------------------------------------------------------------------------

**🔧 JWT Recon in Entra ID Pentests**

**Step-by-step Examples**

1.  **Intercept and Decode Tokens**

    - Use browser dev tools or proxy tools (e.g., Burp Suite).

    - Decode JWT using jwt.io or jwt_tool.py.

2.  **Extract Key Claims**

    - oid – User Object ID

    - tid – Tenant ID

    - aud – Targeted Application

    - scp – OAuth Scopes (e.g., User.Read)

    - roles – App Role Assignments

    - appid – Client App ID

    - upn – User Principal Name

3.  **Verify Signature and Expiration**

    - Use [Microsoft OpenID
      Discovery](https://login.microsoftonline.com/common/.well-known/openid-configuration)
      to get public signing keys.

4.  **Test for Token Misuse**

    - Swap or forge tokens if app has weak validation.

    - Replay tokens across tenants or apps.

------------------------------------------------------------------------

**🧯 Mitigations (Defensive Checks During Audit)**

- Ensure **aud, iss, tid, exp, and scp** are strictly validated.

- Never trust tokens on the **client-side**; validate on server.

- Avoid using custom JWT libraries with weak validation.

- Use **Microsoft Identity Platform v2.0 libraries** which enforce
  proper checks.

- Limit token lifetime and revoke when needed (via Conditional Access
  policies).

- Monitor for unusual token use via **Microsoft Defender for Cloud
  Apps** or **Azure Monitor logs**.

------------------------------------------------------------------------

**📌 Tools for JWT Testing in Entra ID**

- [jwt_tool.py](https://github.com/ticarpi/jwt_tool)

- [AADInternals](https://github.com/Gerenios/AADInternals) (PowerShell)

- [TokenTactics](https://github.com/fireeye/TokenTactics)

- AzureHound (via access token collection)

------------------------------------------------------------------------

Would you like a cheat sheet of real-world Entra ID JWT attack chains,
like token replay → Graph API access → role escalation?

Azure-pentest-jwt-tokens

# JWT Tokens in azure pentest

**JWT (JSON Web Token) in Azure Penetration Testing**

**🔐 What is a JWT?**

A **JSON Web Token (JWT)** is a compact, URL-safe token used to securely
transmit claims between two parties. It is widely used in **Azure-based
applications**, especially within:

- **Azure Active Directory (Azure AD)** tokens

- **Azure App Services**

- **Microsoft Graph API**

- **Azure AD B2C**

- **OAuth 2.0/OpenID Connect flows**

------------------------------------------------------------------------

**🧱 JWT Structure**

A typical JWT is composed of **three base64url-encoded segments**,
separated by dots (.):

1.  **Header**

    - Specifies the **signing algorithm** and token type.

    - Example: {"alg":"HS256","typ":"JWT"}

2.  **Payload**

    - Contains **claims** (e.g., user ID, tenant ID, role).

    - May include sensitive Azure-specific fields like oid (object ID),
      tid (tenant ID), scp (scopes), etc.

3.  **Signature**

    - Ensures **integrity** and **authenticity**.

    - Created using a secret (HMAC) or private key (RSA/ECDSA).

------------------------------------------------------------------------

**🛡️ Common JWT Attacks in Azure Penetration Testing**

**✅ Real-world Use Cases:**

In Azure, JWTs are often used for API access (e.g., Microsoft Graph),
web authentication (Azure AD), and internal Azure service
communications.

**⚠️ Common Attack Techniques:**

1.  **Token Forgery**

    - Forge a token using a known or guessed secret key.

    - Especially dangerous if alg is none or weak (e.g., HS256 with weak
      secret).

    - Azure services using misconfigured custom JWT validation logic are
      vulnerable.

2.  **Algorithm Substitution**

    - Modify the alg field to none or downgrade from RS256 to HS256.

    - Trick services into accepting unsigned or symmetrically signed
      tokens.

3.  **Token Manipulation**

    - Change user roles or claims in the payload.

    - Re-sign the token if key is known or weak.

4.  **Key Leakage / Extraction**

    - Exploit server misconfigurations or errors to extract keys.

    - Azure Key Vault misconfigurations may leak signing secrets.

5.  **Expired Token Reuse**

    - Replay expired tokens in services lacking expiration checks.

    - Abuse clock-skew or improper validation logic in Azure apps.

------------------------------------------------------------------------

**🎯 Impact in Azure Environments**

- **Privilege escalation** via role claim tampering.

- **Unauthorized access** to APIs like Microsoft Graph or Azure Resource
  Manager.

- **Cross-tenant access** if tokens are accepted without verifying tid
  (tenant ID).

- **User impersonation** by crafting tokens with spoofed upn (user
  principal name).

------------------------------------------------------------------------

**✅ Mitigations (Defensive Perspective)**

To protect Azure-based apps and APIs from JWT abuse:

- **Use strong signing algorithms** (e.g., RS256, ES256).

- **Validate all claims**, especially aud, exp, iss, sub, and tid.

- **Enforce token expiry** with short-lived access tokens and refresh
  tokens.

- **Use HTTPS** for all token transmission.

- **Validate signatures server-side only** using proper libraries (not
  client-side).

- **Restrict token scope and permissions** to minimum necessary.

- **Log and audit token use**, especially across tenant boundaries.

------------------------------------------------------------------------

**🔍 Practical Azure Pentesting Examples**

- Dump and decode access tokens from browser or proxy (e.g., Burp,
  Fiddler).

- Modify JWT payload (e.g., escalate role from Reader to Owner) and
  observe server behavior.

- Test Azure Function apps or APIs for improper token validation.

- Brute-force or guess symmetric keys used in poorly protected apps.

- Check for alg = none acceptance in custom services.

- Abuse tokens with valid signatures across different tenants if
  multi-tenant app lacks checks.

------------------------------------------------------------------------

**📚 References**

- [PortSwigger JWT Security](https://portswigger.net/web-security/jwt)

- [JWT.io Introduction](https://jwt.io/introduction)

- [Hacking JWTs –
  Medium](https://medium.com/swlh/hacking-json-web-tokens-jwts-9122efe91e4a)

------------------------------------------------------------------------

Would you like a script to automatically test for weak JWT
implementations in Azure web apps?

In Azure penetration testing, particularly when targeting **Microsoft
Entra ID (formerly Azure Active Directory)**, **JWTs are a central
attack surface**. They are used extensively for identity and access
control, especially in the context of **OAuth 2.0** and **OpenID
Connect**. Here's how JWTs are used—and abused—during Azure Entra ID
pentests:

------------------------------------------------------------------------

**🔍 How JWTs Are Used in Entra ID**

**🧾 Common JWT Types**

1.  **ID Token** (OpenID Connect)

    - Contains user identity claims (e.g., name, email, oid, tid).

    - Issued during interactive logins via browser or app.

2.  **Access Token** (OAuth 2.0)

    - Used to access Microsoft APIs (e.g., Microsoft Graph, Azure
      Management).

    - Contains scp (scopes) or roles, aud (audience), appid, etc.

3.  **Refresh Token**

    - Not a JWT, but used to obtain new ID/access tokens.

These tokens are signed by **Microsoft Entra ID**, often using RS256
(RSA SHA-256) and can be verified using Microsoft’s public keys from the
**OpenID metadata endpoint**.

------------------------------------------------------------------------

**🛠️ JWT Abuse in Entra ID Pentesting**

**🎯 Common Attack Scenarios**

| **Attack Vector** | **Description** | **Example in Entra ID** |
|----|----|----|
| **Token Replay** | Reuse a valid JWT (access or ID token) stolen from browser, logs, or memory. | Exfiltrate a token from a logged-in user and reuse it to call Microsoft Graph. |
| **Privilege Escalation** | Modify JWT claims like roles, scp, or groups. | Modify token to escalate from User to Global Admin (requires weak validation). |
| **Misconfigured Multi-Tenant Apps** | Abuse apps that don’t validate tid (tenant ID). | Access a vulnerable multi-tenant app using a token from attacker’s tenant. |
| **Token Substitution** | Swap access tokens between endpoints or services. | Use token meant for Graph API against Azure Management API if aud check is missing. |
| **None Algorithm Attack** | Forge token if app accepts alg: none. | Rare in Entra ID but relevant in custom token validators. |
| **Token Signing Key Leakage** | Steal private key if hosted in poorly secured Key Vault or exposed via app settings. | Extract key from leaked ARM template or GitHub repo. |

------------------------------------------------------------------------

**🔧 JWT Recon in Entra ID Pentests**

**Step-by-step Examples**

1.  **Intercept and Decode Tokens**

    - Use browser dev tools or proxy tools (e.g., Burp Suite).

    - Decode JWT using jwt.io or jwt_tool.py.

2.  **Extract Key Claims**

    - oid – User Object ID

    - tid – Tenant ID

    - aud – Targeted Application

    - scp – OAuth Scopes (e.g., User.Read)

    - roles – App Role Assignments

    - appid – Client App ID

    - upn – User Principal Name

3.  **Verify Signature and Expiration**

    - Use [Microsoft OpenID
      Discovery](https://login.microsoftonline.com/common/.well-known/openid-configuration)
      to get public signing keys.

4.  **Test for Token Misuse**

    - Swap or forge tokens if app has weak validation.

    - Replay tokens across tenants or apps.

------------------------------------------------------------------------

**🧯 Mitigations (Defensive Checks During Audit)**

- Ensure **aud, iss, tid, exp, and scp** are strictly validated.

- Never trust tokens on the **client-side**; validate on server.

- Avoid using custom JWT libraries with weak validation.

- Use **Microsoft Identity Platform v2.0 libraries** which enforce
  proper checks.

- Limit token lifetime and revoke when needed (via Conditional Access
  policies).

- Monitor for unusual token use via **Microsoft Defender for Cloud
  Apps** or **Azure Monitor logs**.

------------------------------------------------------------------------

**📌 Tools for JWT Testing in Entra ID**

- [jwt_tool.py](https://github.com/ticarpi/jwt_tool)

- [AADInternals](https://github.com/Gerenios/AADInternals) (PowerShell)

- [TokenTactics](https://github.com/fireeye/TokenTactics)

- AzureHound (via access token collection)

------------------------------------------------------------------------

Would you like a cheat sheet of real-world Entra ID JWT attack chains,
like token replay → Graph API access → role escalation?
