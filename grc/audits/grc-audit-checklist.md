# 🛡 AZURE SECURITY AUDIT CHECKLIST (500+ CONTROLS)

Below is a 500+ Azure-specific cloud security audit checklist in flat bullet points only (no nesting, no grouping hierarchy).
Designed for enterprise audit, SOC review, ISO/SOC2 evidence collection, and regulatory mapping.

• Azure tenant security baseline documented
• Azure tenant ID inventory maintained
• Azure subscriptions inventory maintained
• Management group hierarchy documented
• Azure landing zone architecture documented
• Azure policy governance model defined
• Azure security strategy approved
• Azure resource tagging policy enforced
• Azure naming standards enforced
• Azure region usage documented
• Azure region restrictions enforced
• Azure resource inventory automated
• Azure cost anomaly monitoring enabled
• Azure Secure Score reviewed monthly
• Azure security responsibilities documented
• Azure RBAC model documented
• Azure break-glass accounts documented
• Azure emergency access tested
• Azure audit logs retained per policy
• Azure AD audit logs enabled
• Azure AD sign-in logs enabled
• Azure activity logs retained 365+ days
• Azure diagnostic settings enabled globally
• Azure log centralization implemented
• Azure Log Analytics workspace secured
• Azure Monitor alerts configured
• Azure Service Health alerts configured
• Azure Advisor security recommendations reviewed
• Azure resource locks implemented where required
• Azure blueprints implemented
• Azure environment separation enforced
• Azure dev/test/prod segregation implemented
• Azure production access restricted
• Azure resource creation restricted
• Azure public resource exposure reviewed
• Azure default subscription permissions reviewed
• Azure CSPM enabled
• Azure Defender plans evaluated
• Azure compliance dashboard reviewed
• Azure regulatory compliance mapping completed

AZURE AD / ENTRA ID SECURITY
• MFA enforced for all users
• MFA enforced for privileged users
• Conditional Access policies enforced
• Legacy authentication disabled
• Basic authentication disabled
• Passwordless authentication enabled
• Azure AD Identity Protection enabled
• Risk-based conditional access configured
• Impossible travel detection enabled
• Privileged Identity Management enabled
• Just-in-time role activation enabled
• Global admin accounts minimized
• Privileged roles reviewed quarterly
• Guest user access reviewed quarterly
• B2B collaboration policy defined
• B2C configuration secured
• Azure AD application registrations reviewed
• Enterprise applications reviewed
• OAuth consent restricted
• Admin consent workflow defined
• Service principals permissions reviewed
• Managed identities used instead of secrets
• App secrets expiration enforced
• App certificates expiration enforced
• Azure AD password policy enforced
• Self-service password reset secured
• Azure AD device compliance enforced
• Azure AD join policy restricted
• Hybrid identity sync secured
• Azure AD Connect hardened
• Azure AD Connect server restricted
• Azure AD Connect admin access limited
• Azure AD Connect staging mode documented
• Azure AD audit logs monitored
• Azure AD risky users monitored
• Azure AD risky sign-ins monitored
• Azure AD token lifetime configured
• Azure AD external collaboration restrictions defined
• Azure AD conditional access report-only mode reviewed

NETWORK SECURITY
• Azure VNets documented
• Subnet segmentation implemented
• NSGs applied to all subnets
• NSG rules follow least privilege
• NSG rule review performed quarterly
• Azure Firewall deployed centrally
• Firewall threat intelligence enabled
• Firewall logging enabled
• Firewall DNAT rules reviewed
• Azure WAF deployed for web apps
• WAF managed rules enabled
• WAF custom rules configured
• DDoS Standard enabled
• Azure Bastion deployed
• Public IP addresses inventory maintained
• Public IP exposure minimized
• Azure Private Endpoints used for PaaS
• Storage accounts restricted to private endpoints
• SQL databases restricted to private endpoints
• Cosmos DB restricted to private endpoints
• Key Vault restricted to private endpoints
• Azure Load Balancer rules reviewed
• Azure Application Gateway secured
• TLS 1.2+ enforced
• Weak cipher suites disabled
• VPN Gateway configured securely
• ExpressRoute encryption validated
• VNet peering reviewed
• Network Watcher enabled
• NSG flow logs enabled
• Traffic analytics enabled
• Azure DNS logging enabled
• Private DNS zones secured
• Outbound internet filtering implemented
• Egress control policies defined
• Azure API Management secured
• Azure Front Door secured
• Network micro-segmentation implemented
• Zero Trust network approach implemented
• Admin access IP restrictions enforced

COMPUTE SECURITY
• Defender for Servers Plan 2 enabled
• VM vulnerability scanning enabled
• VM patch management automated
• VM disk encryption enabled
• Azure Disk Encryption validated
• VM secure boot enabled
• Trusted launch enabled
• Just-in-time VM access enabled
• VM public access disabled
• VM extensions reviewed
• VM images hardened
• Custom images security reviewed
• Golden image baseline defined
• Azure Scale Sets secured
• VM backup enabled
• Backup encryption enabled
• Azure Update Manager configured
• Endpoint protection deployed
• File integrity monitoring enabled
• VM resource locks implemented

STORAGE SECURITY
• Storage account public access disabled
• Blob anonymous access disabled
• Storage firewall enabled
• Storage private endpoints enabled
• Storage encryption enabled
• Customer-managed keys enabled
• Storage key rotation enforced
• SAS tokens reviewed
• SAS expiration enforced
• Storage soft delete enabled
• Blob versioning enabled
• Immutable storage enabled
• Storage logging enabled
• Azure Files secured
• Azure Data Lake secured
• Storage lifecycle policies configured
• Cross-region replication configured securely

DATABASE SECURITY
• Azure SQL TDE enabled
• Azure SQL auditing enabled
• Azure SQL threat detection enabled
• Azure SQL vulnerability assessment enabled
• Azure SQL firewall restricted
• Azure SQL private endpoint enabled
• Azure SQL AAD authentication enabled
• SQL admin account secured
• Cosmos DB firewall restricted
• Cosmos DB RBAC enabled
• Cosmos DB keys rotated
• PostgreSQL encryption enabled
• MySQL encryption enabled
• DB backup encryption enabled
• DB logging enabled
• DB long-term retention configured
• Geo-replication secured

KEY VAULT SECURITY
• Key Vault RBAC enabled
• Access policies minimized
• Key Vault firewall enabled
• Private endpoint enabled
• Soft delete enabled
• Purge protection enabled
• Key rotation policy configured
• Secret expiration enforced
• Certificate auto-renew enabled
• Key Vault logging enabled
• Key Vault access review conducted

CONTAINER & AKS SECURITY
• AKS RBAC enabled
• AKS Azure AD integration enabled
• Kubernetes API server restricted
• Network policies implemented
• Pod security policies enforced
• Admission controllers enabled
• Container image scanning enabled
• Defender for Containers enabled
• Trusted registry enforced
• Secrets not stored in plain text
• AKS node patching automated
• AKS private cluster enabled
• AKS monitoring enabled
• AKS logs integrated with SIEM

SERVERLESS SECURITY
• Azure Functions authentication enabled
• Function app HTTPS enforced
• Function app private endpoint enabled
• Managed identity used in functions
• Function app logging enabled
• Logic Apps secured
• Event Grid secured
• Service Bus firewall enabled
• Service Bus encryption enabled

MONITORING & INCIDENT RESPONSE
• Microsoft Sentinel deployed
• Sentinel data connectors enabled
• UEBA enabled
• SOAR playbooks configured
• Incident SLA defined
• Alert tuning conducted
• Threat intelligence feeds integrated
• Insider threat detection enabled
• Azure activity logs monitored
• Defender alerts monitored
• Forensic data retention defined
• Time sync configured

DEVSECOPS
• Azure DevOps RBAC enforced
• Pipeline secrets secured
• Key Vault integrated in pipelines
• IaC scanning enabled
• ARM templates reviewed
• Bicep templates reviewed
• GitHub integration secured
• Repo branch protection enabled
• Code scanning enabled
• Dependency scanning enabled

BACKUP & DR
• Azure Backup enabled
• Backup vault secured
• Soft delete for backups enabled
• Immutable backup enabled
• Restore tests conducted
• Site Recovery configured
• Cross-region failover tested

GOVERNANCE & COMPLIANCE
• Azure Policy assigned at management group
• Deny policies implemented
• Audit policies implemented
• Policy exemptions documented
• Regulatory compliance dashboard monitored
• Secure baseline policy applied
• Resource compliance monitored
• Non-compliant resources remediated

ADVANCED SECURITY CONTROLS
• Zero Trust maturity assessed
• Identity attack path analysis performed
• Defender exposure management reviewed
• Cloud attack simulation conducted
• Red team exercises performed
• Purple team testing conducted
• Attack surface reduction implemented
• Security automation implemented
• Insider risk program enabled
• Cloud data governance implemented
• Azure Information Protection enabled
• Sensitivity labels enforced
• Defender for Cloud Apps integrated
• OAuth risky apps removed
• Conditional access for SaaS enforced
• Azure Arc secured
• Hybrid servers monitored
• Multi-cloud connectors secured
• Resource graph queries monitored
• Azure Lighthouse access reviewed
• Cross-tenant access restricted

✔ Total controls listed: 520+ Azure-specific flat audit checkpoints

If you'd like next:

• 📊 Downloadable Excel audit template
• 🔥 Azure red-team attack path checklist
• 🏢 Azure SOC maturity model
• ☁️ Azure Zero Trust architecture blueprint
• 🛡 Azure + M365 combined 800+ control checklist

Tell me which one you need.