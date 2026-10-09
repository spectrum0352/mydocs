# Azure Deny Policies

## Compute

### High severity

- Deny creation of virtual machines with public IP addresses
- Deny creation of virtual machines without disk encryption enabled
- Deny creation of virtual machines using unmanaged disks
- Deny creation of virtual machines in regions not approved by policy
- Deny custom script extensions or unapproved extensions installation on virtual machines

### Medium severity

- Deny creation of virtual machines with deprecated or unapproved VM SKUs
- Deny VM scale sets without health probes or autoscale configuration
- Deny Azure Dedicated Host creation outside approved host groups

### Low severity

- Deny creation of virtual machines without required tags
- Deny use of unsupported operating systems or images

## Networking

### High severity

- Deny creation of public IP addresses
- Deny internet-facing load balancers or application gateways without WAF
- Deny network security groups with inbound rules allowing 0.0.0.0/0 for privileged ports
- Deny creation of virtual networks without service endpoint or private endpoint support
- Deny creation of express route or VPN gateways outside approved SKU or location

### Medium severity

- Deny subnet creation without network security group association
- Deny Azure Firewall or NVA absence where required by network segment policy
- Deny public subnet deployment for restricted workloads

### Low severity

- Deny creation of virtual networks without required tags
- Deny use of deprecated networking SKUs or configurations

## Storage

### High severity

- Deny creation of storage accounts with public blob, queue, table, or file access enabled
- Deny storage accounts that allow insecure HTTP traffic
- Deny storage accounts without secure transfer required
- Deny storage accounts without encryption using customer-managed keys when required
- Deny storage accounts with large file shares or transactions outside approved tiers

### Medium severity

- Deny creation of storage accounts without network rules or private endpoints
- Deny storage accounts without minimum TLS version configured
- Deny creation of general-purpose v1 storage accounts

### Low severity

- Deny creation of storage accounts without required tags
- Deny storage accounts in unapproved regions

## Databases and Data Services

### High severity

- Deny SQL servers with public network access enabled
- Deny Azure SQL databases without TDE enabled
- Deny Cosmos DB accounts with public network access or unsecured endpoints
- Deny database instances without audit logs enabled
- Deny managed database services without private endpoints when required

### Medium severity

- Deny creation of database resources without advanced data security or threat protection enabled
- Deny unapproved database compute tiers or SKUs
- Deny creation of data services in unapproved regions

### Low severity

- Deny creation of database resources without required tags
- Deny use of preview or unsupported data service offerings

## Identity and Access

### High severity

- Deny creation of role assignments that grant owner or contributor permissions broadly
- Deny assignment of built-in high-privilege roles without Just-In-Time or approval controls
- Deny creation of service principals or managed identities without required tags
- Deny access assignments to privileged resources from unapproved accounts or groups

### Medium severity

- Deny creation of users without required authentication methods enforced
- Deny application registrations without required redirect URIs or permissions review
- Deny creation of guest accounts in sensitive subscriptions or resource groups

### Low severity

- Deny identity resources without required tags
- Deny conditional access policy exclusions for noncompliant users or devices

## Security, Compliance, and Governance

### High severity

- Deny creation of resources in subscriptions outside approved management groups
- Deny resources without required security configuration baselines
- Deny deployment of resources that bypass policy or deny assignments
- Deny creation of any resource type that is explicitly prohibited by organizational policy

### Medium severity

- Deny resource creation without required security center or defender integration
- Deny creation of policy exemptions without approval
- Deny use of unmanaged or legacy management solutions

### Low severity

- Deny resources without required cost center or compliance tags
- Deny resource creation without required naming convention tags

## Monitoring and Logging

### High severity

- Deny creation of resources without diagnostic settings enabled where required
- Deny creation of resources without activity log retention policy compliance
- Deny log analytics workspace creation without required workspace configuration

### Medium severity

- Deny creation of monitoring resources without required tags
- Deny deployment of resources without required alert rules or action groups in sensitive workloads

### Low severity

- Deny creation of resources without required monitoring metadata labels

## Backup and Disaster Recovery

### High severity

- Deny creation of backup vaults or recovery services without soft delete enabled
- Deny creation of protected items without required retention configuration
- Deny creation of recovery plans without required region redundancy where mandated

### Medium severity

- Deny creation of backup resources without required encryption or access controls
- Deny deployment of disaster recovery resources in unapproved regions

### Low severity

- Deny backup resources without required tags

## App Platform and Container Services

### High severity

- Deny creation of app services with public network access when private endpoints are required
- Deny container registries without admin user disabled or network restrictions
- Deny AKS clusters without network policy or private cluster configuration when required
- Deny creation of container services without image scanning or security baseline compliance

### Medium severity

- Deny creation of application services without HTTPS-only enforced
- Deny app configuration or app service plans in unapproved SKUs or regions

### Low severity

- Deny creation of app platform resources without required tags

## Analytics, AI, and Integration

### High severity

- Deny creation of data factory or Synapse workspaces without private endpoints or VNet integration when required
- Deny creation of cognitive services with public endpoint exposure in restricted environments
- Deny event hubs or service bus namespaces without required network controls

### Medium severity

- Deny creation of analytics or AI resources without required monitoring or logging
- Deny creation of integration resources in unapproved regions

### Low severity

- Deny creation of data and integration services without required tags

## Management and Hybrid Connectivity

### High severity

- Deny deployment of management resources without required Azure Policy initiative assignments
- Deny on-premises gateway or hybrid connectivity resources without required security controls
- Deny automation runbooks or deployment scripts that create unapproved high-risk resources

### Medium severity

- Deny creation of Management Groups without required governance tags
- Deny creation of management resources without required RBAC restrictions

### Low severity

- Deny management resources without required tags
