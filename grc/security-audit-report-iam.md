Current State IAM Assessment Report
1. Executive Summary
The Identity and Access Management (IAM) assessment was conducted to evaluate the organization’s current IAM posture, identify gaps, and recommend improvements aligned with industry best practices and regulatory requirements.

Key Observations:
•	IAM controls are partially implemented, with inconsistent enforcement across environments.
•	Privileged access management (PAM) lacks centralized governance.
•	Multi-Factor Authentication (MFA) adoption is incomplete.
•	Identity lifecycle processes are manual and prone to delays.
•	Access reviews and certifications are not performed regularly.
•	Limited Zero Trust architecture alignment.

Risk Rating: 🔴 High

Priority Areas:
1.	Privileged Access Management
2.	Identity Governance & Administration (IGA)
3.	MFA & Conditional Access
4.	Access Review & Certification
5.	Logging, Monitoring & Analytics

2. Scope of Assessment

In Scope:
•	Identity repositories (AD, Azure AD / Entra ID, LDAP)
•	Cloud IAM (Azure, AWS, GCP)
•	Application IAM (SSO, RBAC)
•	Privileged Access Management
•	Identity lifecycle processes
•	Authentication & authorization mechanisms
•	Logging & monitoring

Out of Scope:
•	Physical access systems
•	Non-integrated legacy systems (unless specified)

3. Methodology

Assessment Approach:
•	Stakeholder interviews
•	IAM architecture review
•	Policy and document review
•	Configuration analysis
•	Sampling of access controls
•	Tool-based validation (e.g., IAM scanners)

Frameworks Referenced:
•	NIST SP 800-53 / 800-63
•	ISO 27001:2022 Annex A
•	CIS Controls v8
•	Zero Trust Model (NIST 800-207)

4. IAM Architecture Overview

Current Architecture Components:
•	Directory Services: Active Directory, Azure AD
•	Authentication: Password-based + partial MFA
•	SSO: Limited (only for select SaaS apps)
•	Provisioning: Manual / semi-automated
•	Logging: Centralized (SIEM integrated)

Observations:
•	Hybrid identity model not fully optimized
•	Lack of unified identity platform
•	Redundant identity stores

5. Identity Lifecycle Management

Current State:
•	User provisioning: Manual (HR → IT ticket)
•	Role assignment: Manager-driven (no RBAC model)
•	De-provisioning: Delayed (1–5 days lag)
•	No automated joiner-mover-leaver (JML) process

Gaps:
•	No identity governance solution
•	Orphaned accounts exist
•	Excessive access accumulation

Risk:
🔴 Unauthorized access, insider threats

Recommendation:
•	Implement Identity Governance & Administration (IGA)
•	Automate JML workflows
•	Integrate HR system as authoritative source

6. Authentication Controls

Current State:
•	Password-based authentication dominant
•	MFA enabled for:
o	Admin users ✅
o	Regular users ❌ (partial)

Issues:
•	Weak password policies in some systems
•	MFA not enforced organization-wide
•	Legacy authentication protocols enabled

Risk:
🔴 Credential compromise

Recommendation:
•	Enforce MFA for all users
•	Disable legacy authentication
•	Implement passwordless authentication (FIDO2, biometrics)

7. Authorization & Access Control

Current State:
•	Role-Based Access Control (RBAC): ❌ Not formally defined
•	Access granted on request basis
•	No least privilege enforcement

Issues:
•	Overprivileged users
•	No segregation of duties (SoD)
•	Inconsistent access policies

Risk:
🔴 Privilege escalation, fraud

Recommendation:
•	Implement RBAC/ABAC models
•	Define least privilege policies
•	Enforce SoD controls

8. Privileged Access Management (PAM)

Current State:
•	Admin accounts exist in AD and cloud
•	No centralized PAM solution
•	Shared admin accounts observed

Issues:
•	No session monitoring
•	No Just-In-Time (JIT) access
•	Credentials not vaulted

Risk:
🔴 Critical risk – full environment compromises possible


Recommendation:
•	Deploy PAM solution (e.g., CyberArk, BeyondTrust, Azure PIM)
•	Implement JIT access
•	Eliminate shared accounts

9. Access Review & Certification

Current State:
•	No periodic access reviews
•	No formal certification process

Issues:
•	Managers unaware of user access
•	Access creep over time

Risk:
🔴 Unauthorized persistent access

Recommendation:
•	Quarterly access reviews
•	Automated certification workflows
•	Auditor-ready reporting

10. Identity Federation & SSO

Current State:
•	SSO implemented for limited applications
•	Federation not standardized

Issues:
•	Multiple login credentials
•	Poor user experience
•	Increased attack surface

Recommendation:
•	Expand SSO across all applications
•	Implement centralized Identity Provider (IdP)
•	Use SAML/OIDC standards

11. Logging, Monitoring & SIEM Integration

Current State:
•	Logs collected in SIEM
•	Limited IAM-specific alerts

Issues:
•	No behavioral analytics (UEBA)
•	No alerting on anomalous access
•	Logs not fully integrated across platforms

Risk:
🟠 Delayed threat detection

Recommendation:
•	Enable UEBA
•	Monitor:
o	Privileged account usage
o	Failed logins
o	Impossible travel
•	Integrate IAM logs with SIEM

12. Compliance & Policy Review

Current State:
•	IAM policies exist but outdated
•	No enforcement tracking

Issues:
•	Policies not aligned with standards
•	Lack of audit evidence

Recommendation:
•	Update IAM policies
•	Map controls to:
o	ISO 27001
o	NIST
o	SOC 2
•	Maintain audit evidence repository

13. Cloud IAM Assessment

Azure / Entra ID:
•	Conditional Access: Partial
•	MFA: Partial
•	Privileged Identity Management: Not fully utilized

AWS:
•	IAM roles exist but overly permissive
•	No SCP enforcement (if using Organizations)

Gaps:
•	Misconfigured policies
•	Lack of least privilege
•	No centralized governance

14. Third-Party Access Management

Current State:
•	Vendors provided direct access
•	No expiration controls

Issues:
•	Persistent third-party access
•	No monitoring

Risk:
🔴 Supply chain attacks

Recommendation:
•	Time-bound access
•	Vendor-specific identities
•	Continuous monitoring

15. Key Risks Summary
<img width="243" height="127" alt="image" src="https://github.com/user-attachments/assets/f701da89-52ba-481a-9946-49e30d24413d" />


16. Maturity Assessment

<img width="214" height="113" alt="image" src="https://github.com/user-attachments/assets/27823e08-88f7-480f-9654-4695788f99e2" />


17. Roadmap & Recommendations

Short-Term (0–3 months):
•	Enforce MFA for all users
•	Remove shared accounts
•	Conduct access review

Mid-Term (3–6 months):
•	Implement PAM solution
•	Define RBAC model
•	Enable Conditional Access

Long-Term (6–12 months):
•	Deploy IGA solution
•	Implement Zero Trust architecture
•	Achieve compliance alignment

18. Tools & Technologies (Suggested)
•	Identity Provider: Azure AD / Okta
•	PAM: CyberArk / Azure PIM
•	IGA: SailPoint / Saviynt
•	SIEM: Microsoft Sentinel / Splunk

19. Conclusion
The organization’s IAM posture shows foundational capabilities but lacks maturity in governance, automation, and security enforcement. Immediate focus on privileged access, MFA, and lifecycle automation is critical to reduce risk and align with modern security frameworks.

20. Appendices

A. Sample IAM Metrics:
•	% Users with MFA
•	Number of privileged accounts
•	Orphaned accounts count
•	Access review completion rate

B. Evidence Collected:
•	User access lists
•	IAM policies
•	Audit logs
•	Configuration screenshots






Overall IAM Maturity: ⭐ 2/5 (Developing)
