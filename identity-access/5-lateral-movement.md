## 5. Lateral Movement & Data Access Assessment

**Goal:** Determine how far the tested identity can move and what sensitive data it can reach.

- Evaluate SQL Server access controls and firewall configuration
- Test network access restrictions between tiers/subnets
- Validate directory administrator permissions on SQL/Entra ID resources
- Assess overall database/storage exposure from the current foothold
- Simulate authorized, non-destructive data access to confirm exposure (read-only, test data only)
- Evaluate whether exfiltration paths (public endpoints, SAS tokens, connection strings) are actually usable
- Document data-protection gaps
