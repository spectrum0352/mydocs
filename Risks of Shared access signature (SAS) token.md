# Risks of Shared access signature (SAS) token

Here are the security risks of using SAS tokens for Azure Blob Storage access (from Azure AI Speech or any service), listed clearly in bullet points for easy review and security documentation:

Bearer token exposure
Anyone with the SAS URL can access the data
No additional authentication required
No identity binding
SAS is not tied to an Entra ID identity
Storage cannot identify which service or user accessed data
Token leakage risk
SAS can leak via logs, traces, CI/CD variables, browser history, or screenshots
Weak auditability
Storage logs show operations but not a calling identity
Poor traceability during incident investigations
Difficult revocation
Active SAS tokens cannot be instantly revoked
Account SAS revocation requires rotating storage account keys
Over-permissions
SAS often grants excessive permissions (read/write/delete/list)
Increases blast radius if compromised
Long-lived access window
Long expiry increases attack window
Short expiry increases operational failures
Token sprawl
Multiple unmanaged SAS tokens may exist with no central visibility
Hard to inventory or govern
No Conditional Access support
Cannot enforce MFA, device trust, or risk-based policies
Not Zero Trust compliant
Relies on possession of token rather than verified identity
Higher risk of data exfiltration
Public endpoint access combined with SAS increases exposure
Incompatible with least-privilege by default
Fine-grained permission control is harder than RBAC
Poor SOC/forensics readiness
Cannot reliably correlate blob access to a specific Azure resource or service
One-line security conclusion

SAS tokens introduce bearer-token risk, weak auditability, and limited revocation; Managed Identity should be used instead for Azure AI Speech accessing Blob Storage.



If you want this formatted for a security review, risk register, or architecture document, I can tailor it exactly.

 

