**2. Okta (Identity as a Service - IDaaS)**

The focus here is on the authentication pipeline and the security of the identity bridge.

- **Pre-Assessment & Metadata Gathering:** Identify the Okta sub-domain, integrated OIDC/SAML applications, and the presence of Okta Verify or third-party MFA.

- **Session Management & Token Security:** Analyze the security of session cookies (sid). Test for JWT (JSON Web Token) vulnerabilities, such as weak signing keys or "none" algorithm attacks in OIDC flows.

- **Authorization & Policy Testing:** Attempt to access applications not assigned to the test user. Test for **Insecure Direct Object References (IDOR)** in the Okta user profile and admin dashboards.

- **API & Integration Security:** Test the Okta Management API for over-privileged API tokens. Evaluate the security of the Okta RADIUS agent or On-Prem Provisioning (OPP) agents.

- **Configuration & Lifecycle Management:** Audit "Self-Service" features like password resets and self-registration for account takeover (ATO) risks.

 