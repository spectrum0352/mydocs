## 3. Enumeration & Privilege Escalation Assessment

**Goal:** Determine whether the access obtained in Stage 2 can be expanded beyond intended scope.

- Enumerate full RBAC assignments across the subscription/tenant
- Identify Owner/Contributor grants and flag excessive privilege
- Analyze role inheritance (management group → subscription → resource group → resource)
- Evaluate service principal permissions and delegated admin rights
- Test for least-privilege violations (over-scoped roles, stale assignments)
- Document viable escalation paths (do not execute yet — this stage is analysis only)
