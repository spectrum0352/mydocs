**1. Microsoft Entra ID (Cloud IAM & IDP)**

Testing Entra ID (formerly Azure AD) requires focusing on hybrid identity risks, app registrations, and conditional access bypasses.

- **Tenant Reconnaissance:** Identify the primary domain, verified domains, and public-facing Azure services. Enumerate user accounts using unauthenticated methods like O365Recon.

- **Authentication & Conditional Access (CA) Testing:** Evaluate MFA strength. Attempt to bypass CA policies using legacy protocols (SMTP, IMAP) or by spoofing "trusted" device states and locations.

- **App Registration & Service Principal Audit:** Check for "Illicit Consent Grants." Look for overly permissive API permissions (e.g., Directory.ReadWrite.All) and exposed secrets in app registrations.

- **Privilege Escalation & Role Analysis:** Identify users with highly privileged roles (Global Admin, Privileged Role Admin). Test for escalation paths via Azure AD Connect or Managed Identities.

- **Global Secure Access & Proxy Testing:** Assess the security of Application Proxies and the "Private Access" tunnels for lateral movement opportunities.

 
