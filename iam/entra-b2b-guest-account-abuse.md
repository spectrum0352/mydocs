## Attack Flow 5: Guest/B2B Account Abuse

- Attacker already has guest user access in a target Azure AD tenant.

- Queries directory roles:

- az role assignment list

- Finds overly permissive role like Reader or Contributor.

- Exploits RBAC to access resources (e.g., Key Vault, VM metadata).

- May escalate by creating new service principals or automations.
