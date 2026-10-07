## 6. Persistence Testing (Authorized Simulation Only)

**Goal:** Confirm whether an attacker could maintain access after the initial foothold is remediated — using only artifacts you create and own.

1. Evaluate plausible identity-persistence mechanisms (rogue service principals, added AD admins, modified firewall rules)
2. Create a **test** service principal, if approved, to simulate a backdoor
3. Assign it a scoped role (avoid Owner unless specifically testing that path)
4. Validate that access persists across the test session
5. Test the impact of revoking the original compromised credential (does persistence survive?)
6. Assess whether monitoring/Sentinel/Defender detected the creation event
7. Document the persistence risk and detection gap
8. **Remove the test service principal and any role assignments immediately after validation**

---