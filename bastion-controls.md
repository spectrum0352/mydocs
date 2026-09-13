# Azure Bastion Security Controls

## Purpose

Azure Bastion provides secure, browser-based RDP and SSH connectivity to Azure virtual machines without exposing management ports to the Internet. The following security controls should be implemented to harden Azure Bastion deployments and align with enterprise security best practices.

---

## Identity & Access Controls

### Enforce Microsoft Entra ID Authentication

- Use Microsoft Entra ID (formerly Azure AD) authentication wherever supported.
- Eliminate local administrator authentication when possible.
- Integrate with Conditional Access policies.

**Benefit**

- Centralized identity management
- Strong authentication
- Reduced credential theft risk

---

### Require Multi-Factor Authentication (MFA)

Enforce MFA for every administrator connecting through Azure Bastion.

**Recommendations**

- Require MFA for privileged roles.
- Block legacy authentication.
- Require phishing-resistant MFA (FIDO2, Windows Hello for Business, Passkeys) whenever possible.

**Benefit**

Prevents unauthorized access using stolen credentials.

---

### Implement Least Privilege using Azure RBAC

Grant only the minimum permissions required.

Recommended roles include:

- Virtual Machine User Login
- Virtual Machine Administrator Login
- Reader
- Custom RBAC roles where appropriate

Avoid assigning:

- Owner
- Contributor
- User Access Administrator

unless operationally required.

**Benefit**

Limits administrative privileges and reduces attack surface.

---

### Use Privileged Identity Management (PIM)

Protect privileged Bastion administration using Microsoft Entra Privileged Identity Management.

Enable:

- Just-In-Time (JIT) role activation
- Approval workflows
- MFA during activation
- Time-limited role assignments
- Access justification

**Benefit**

Minimizes standing administrative privileges.

---

## Network Security Controls

## Remove Public IP Addresses from Virtual Machines

Do not assign Public IP addresses to production virtual machines.

Use:

- Private IP addresses only
- Azure Bastion
- Private networking

**Benefit**

Eliminates direct Internet exposure.

---

### Block Direct RDP and SSH Access

Ensure external access to the following ports is prohibited:

| Protocol | Port |
|----------|------|
| RDP | 3389 |
| SSH | 22 |

Only Azure Bastion should broker management access.

**Benefit**

Prevents:

- Internet scanning
- Password spraying
- Brute-force attacks
- Exploitation of remote access vulnerabilities

---

### Harden AzureBastionSubnet

Deploy Bastion only inside the dedicated:

```
AzureBastionSubnet
```

Recommendations:

- Use subnet size of at least **/26** for scalability.
- Do not deploy other resources into this subnet.
- Restrict NSG rules to only required Azure service traffic.
- Avoid overly permissive outbound rules.

**Benefit**

Reduces unnecessary network exposure.

---

### Restrict Network Security Group (NSG) Rules

Configure NSGs to allow only required communication.

Allow:

- Azure Bastion service communication
- GatewayManager
- AzureLoadBalancer
- Required Azure platform services

Deny:

- Unnecessary inbound traffic
- Broad outbound Internet access
- Any unauthorized management protocols

Follow Microsoft documented NSG requirements.

---

### Prefer Private-Only Bastion Deployment (Premium)

Where supported, deploy Azure Bastion without a public IP address.

Use:

- Private endpoints
- ExpressRoute
- VPN
- Private networking

**Benefit**

Completely removes Bastion from Internet exposure.

---

## Session Security

### Enable Session Recording (Premium)

Enable session recording for:

- SSH
- RDP

Recordings provide:

- Administrative accountability
- Compliance evidence
- Forensic investigation support

Store recordings securely with appropriate retention.

---

### Use Native Client Only When Required

Azure Bastion supports:

- Browser-based access
- Native RDP/SSH client connectivity

If native client support is enabled:

- Restrict to approved administrators.
- Monitor usage.
- Enforce MFA.
- Apply Conditional Access policies.

---

### Disable Clipboard and File Transfer Where Possible

Restrict:

- Clipboard copy/paste
- File transfer
- Drive redirection

unless operationally required.

**Benefit**

Reduces data exfiltration risk.

---

## Monitoring & Logging

### Enable Diagnostic Logs

Send Azure Bastion logs to:

- Azure Monitor
- Log Analytics Workspace
- Microsoft Sentinel
- Storage Account
- Event Hub

Collect:

- Session events
- Authentication events
- Administrative operations
- Resource changes

---

### Enable Activity Log Monitoring

Monitor Azure Activity Logs for:

- Bastion creation
- Bastion deletion
- Configuration changes
- NSG modifications
- RBAC changes
- Public IP assignments

Generate alerts for high-risk activities.

---

### Configure Microsoft Sentinel Alerts

Create analytics rules for:

- Unusual login locations
- Failed authentication attempts
- High-volume connection attempts
- After-hours administrator access
- Privileged role activations
- Bastion configuration changes

---

### Retain Audit Logs

Maintain audit logs according to organizational retention policies.

Typical retention periods:

- Operational logs: 90–180 days
- Security logs: 1 year
- Compliance environments: 3–7 years (or as required)

---

## Platform Security

### Use TLS Encryption

Azure Bastion uses HTTPS over TCP port **443**.

Recommendations:

- Allow only TLS 1.2 or later.
- Inspect TLS traffic only where organizational policy permits.
- Prevent SSL downgrade attacks.

---

### Use the Managed Platform Service

Azure Bastion is a Platform as a Service (PaaS).

Microsoft manages:

- OS patching
- Security updates
- Platform hardening
- Infrastructure maintenance
- Availability

Avoid deploying self-managed jump servers unless required.

---

### Keep Azure Bastion on Supported SKU

Prefer:

- Standard
- Premium

Avoid legacy Basic deployments for enterprise environments.

Premium provides additional capabilities including:

- Session recording
- Private-only deployment
- Advanced enterprise security features

---

## Governance & Compliance

### Apply Azure Policy

Use Azure Policy to enforce:

- No public IPs on production VMs
- Approved Bastion SKU
- Diagnostic logging enabled
- Approved regions
- Mandatory tags
- Resource locks
- Encryption requirements

---

### Protect Bastion with Resource Locks

Apply:

- CanNotDelete
- ReadOnly (where appropriate)

to prevent accidental deletion.

---

### Tag Resources

Use standardized tags such as:

- Environment
- Business Unit
- Data Classification
- Owner
- Criticality
- Cost Center

---

### Backup Configuration

Maintain Infrastructure-as-Code (IaC) templates using:

- Bicep
- ARM Templates
- Terraform

Store templates in version control.

---

## Operational Security

### Restrict Administrative Access

Only authorized administrators should have access.

Separate duties between:

- VM Administrators
- Security Administrators
- Network Administrators
- Platform Administrators

---

### Regularly Review Access

Perform periodic reviews of:

- RBAC assignments
- PIM eligible users
- Conditional Access policies
- Bastion usage
- Audit logs

Remove unused privileged accounts promptly.

---

### Perform Security Assessments

Regularly validate:

- NSG configuration
- Azure Policy compliance
- Defender for Cloud recommendations
- CIS Azure Benchmark alignment
- Microsoft Cloud Security Benchmark compliance

---

## Security Best Practices Checklist

| Control | Recommendation |
|----------|----------------|
| Public IPs on VMs | ❌ Remove |
| Direct RDP (3389) | ❌ Block |
| Direct SSH (22) | ❌ Block |
| Microsoft Entra ID Authentication | ✅ Enable |
| Multi-Factor Authentication | ✅ Required |
| Azure RBAC | ✅ Least Privilege |
| Privileged Identity Management | ✅ Enable |
| Conditional Access | ✅ Enforce |
| Dedicated AzureBastionSubnet | ✅ Required |
| Network Security Groups | ✅ Harden |
| Diagnostic Logs | ✅ Enable |
| Log Analytics Integration | ✅ Enable |
| Microsoft Sentinel Monitoring | ✅ Enable |
| Activity Log Alerts | ✅ Configure |
| Session Recording (Premium) | ✅ Enable |
| Private-Only Deployment (Premium) | ✅ Preferred |
| Azure Policy Enforcement | ✅ Required |
| Resource Locks | ✅ Apply |
| Infrastructure as Code | ✅ Use |
| Platform Managed Updates | ✅ Enabled by Microsoft |
| Periodic Access Reviews | ✅ Perform |
| Defender for Cloud Recommendations | ✅ Review Regularly |

---

## Enterprise Security Recommendations

For production and highly regulated environments:

- Use Azure Bastion Premium where available.
- Eliminate all public IP addresses from virtual machines.
- Enforce Microsoft Entra ID authentication with phishing-resistant MFA.
- Protect privileged access using Microsoft Entra Privileged Identity Management (PIM).
- Require Conditional Access for all administrative sessions.
- Enable session recording and centralized logging.
- Integrate Azure Bastion with Microsoft Sentinel for continuous monitoring.
- Enforce Azure Policy to prevent insecure configurations.
- Regularly review RBAC assignments, PIM activations, and Bastion audit logs.
- Deploy Azure Bastion as part of a Zero Trust architecture, ensuring all administrative access is identity-aware, least-privileged, continuously verified, and fully auditable.
