# Azure Cloud Security – Key Concepts and Interview Notes

Azure Cloud Security – Key Concepts and Interview Notes
1. Most Important Azure Cloud Security Controls
Critical security controls that must be enforced in every Azure environment:

Identity & Access Management
Remove deprecated, inactive, or orphaned accounts from subscriptions.

Remove or strictly limit external (guest) accounts with privileged roles.

Enforce Multi-Factor Authentication (MFA) for:

Owner

Contributor

Privileged administrators

Apply Least Privilege Access using Azure RBAC.

Use Privileged Identity Management (PIM) for just-in-time privileged access.

Maintain minimum two Owners, recommended maximum three Owners per subscription.

Regularly review role assignments using access reviews.

Authentication & Credential Security
Use Service Principals or Managed Identities instead of management certificates or stored credentials.

Rotate secrets and certificates regularly.

Store secrets only in Azure Key Vault.

Monitoring & Governance
Enable:

Microsoft Defender for Cloud

Activity Logs

Diagnostic Logs

Azure Monitor alerts

Enforce policies using Azure Policy.

Track security posture using Secure Score.

Network Security
Use network segmentation via VNets and subnets.

Apply NSGs and Azure Firewall.

Restrict public exposure wherever possible.

Use Private Endpoints for PaaS services.

2. Tools Used to Create Azure Virtual Networks (VNETs)
Azure networking resources can be deployed using:

Azure Portal — graphical interface

Azure PowerShell — automation via scripts

Azure CLI — cross-platform command-line tool

ARM Templates — native Infrastructure as Code (JSON)

Bicep — simplified ARM template language

Terraform — multi-cloud Infrastructure as Code automation

3. Critical Azure Services / Applications
Common business-critical Azure components include:

Azure App Service (Web Applications)

Storage Accounts

Virtual Machines

Azure Key Vault

Virtual Networks (VNETs)

Databases (Azure SQL, Cosmos DB, PostgreSQL, MySQL)

Azure Firewall and Network Security Groups

Azure Functions

Load Balancers and Application Gateways

4. Methods to Implement MFA in Azure
MFA can be implemented using three primary approaches:

1. Security Defaults
Microsoft-managed baseline protection.

Automatically enables MFA for administrators and users.

Suitable for small or new environments.

2. Conditional Access Policies (Recommended)
Enforces MFA dynamically based on:

User risk level

Device compliance

Location

Application sensitivity

Sign-in behavior

3. Per-User MFA
Manual MFA enablement per account.

Mainly used for legacy or temporary scenarios.

5. Example: Cloud Security Engineer Problem Solved
Problem:
Excessive privileged access and unmanaged identities across multiple Azure subscriptions created high security risk.

Solution / Turning Point:
Implemented RBAC cleanup, enforced Conditional Access with MFA, enabled Privileged Identity Management (PIM), and automated access reviews, significantly reducing standing privileges and improving audit compliance.

6. Difference Between Owner and Global Administrator
Aspect	Owner Role	Global Administrator
Scope	Azure Subscription	Microsoft Entra ID Tenant
Focus	Resource Management	Identity & Directory Management
Permissions	Full access to Azure resources	Full control over tenant identities
Can Assign Roles	Yes (RBAC roles)	Yes (directory roles)
Typical Tasks	Deploy/manage resources	Manage users, domains, licenses
Summary:

Owner → Controls Azure resources

Global Administrator → Controls identities and tenant configuration

7. Automated User Provisioning for SaaS Applications
Automated provisioning in Microsoft Entra ID manages identity lifecycle across SaaS platforms by automatically:

Creating user accounts

Updating attributes

Assigning roles/groups

Disabling or removing accounts during offboarding

Benefits:

Reduces manual administration

Improves compliance

Prevents orphaned accounts

8. What is Risk Detection?
Risk Detection is part of Microsoft Entra ID Identity Protection.

It analyzes authentication signals to identify suspicious activities such as:

Impossible travel logins

Anonymous or TOR IP usage

Credential leaks

Malware-associated sign-ins

Unusual login behavior

Risk levels trigger automated responses like:

MFA enforcement

Session blocking

Password reset requirements

9. Special Security Considerations in Cloud Computing
Organizations adopting cloud platforms must focus on:

Shared Responsibility Model
Clearly understand provider vs customer security responsibilities.

Zero Trust Principles
Verify explicitly

Use least privilege

Assume breach

Network Segmentation
Isolate workloads to prevent lateral movement during attacks.

Centralized Management
Use unified monitoring, logging, and governance across environments.

High Availability & Resilience
Design architectures that tolerate failures and cyber incidents.

Continuous Monitoring
Implement SIEM/SOAR integration for detection and response.

Secure Configuration
Apply standardized baselines and compliance frameworks (Azure Security Benchmark, CIS).

If you want next, I can also provide a Senior Cloud Security Engineer Interview Version (short answers) or a One-Page Azure Security Revision Sheet for quick preparation.