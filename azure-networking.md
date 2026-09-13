# Azure Networking Basics

Azure networking provides the foundation for securely connecting, isolating, routing, and protecting cloud resources. Understanding Azure networking concepts is essential for designing secure, scalable, highly available, and enterprise-grade cloud environments.

---

# Azure Networking Architecture Overview

```text
                    Internet
                        |
                 Azure DDoS Protection
                        |
                 Azure Front Door (Optional)
                        |
                  Azure Firewall / WAF
                        |
                Public Load Balancer
                        |
        -----------------------------------
        |                                 |
   Web Subnet                      Application Subnet
        |                                 |
     Web VMs                       Internal Load Balancer
                                          |
                                   Database Subnet
                                          |
                                 Azure SQL / SQL VM
                                          |
                                  Private Endpoint
                                          |
                                  Azure PaaS Services

              On-Premises Network
                     |
        VPN Gateway / ExpressRoute
                     |
                Azure Virtual Network
```

---

# 1. Azure Virtual Network (VNet)

## Overview

An **Azure Virtual Network (VNet)** is the fundamental building block of Azure networking. It is a logically isolated private network where Azure resources securely communicate with one another.

A VNet is comparable to a traditional on-premises network but is fully managed within Azure.

---

## Purpose

- Isolate Azure resources
- Enable secure communication
- Provide private IP addressing
- Connect Azure resources with on-premises networks
- Support hybrid and multi-cloud connectivity

---

## Key Features

### Private IP Addressing

Resources inside a VNet receive private IP addresses.

Example:

```
10.0.0.0/16
```

Typical resources include:

- Virtual Machines
- Azure Kubernetes Service (AKS)
- Azure SQL Managed Instance
- Azure Firewall
- Application Gateway
- Bastion

---

### Address Spaces

Every VNet requires an IP address space using CIDR notation.

Example:

```
10.0.0.0/16
172.16.0.0/16
192.168.0.0/16
```

The address space cannot overlap with connected VNets or on-premises networks.

---

### DNS Support

VNets support:

- Azure-provided DNS
- Custom DNS servers
- Azure Private DNS Zones

---

### Connectivity Options

A VNet can connect to:

- Other VNets
- Azure services
- On-premises datacenters
- Remote users
- Azure PaaS resources
- ExpressRoute circuits

---

## Common Use Cases

- Enterprise applications
- Multi-tier applications
- Hybrid cloud deployments
- Secure landing zones
- Private cloud environments

---

# 2. Subnets

## Overview

A subnet divides a VNet into smaller logical network segments.

Subnets improve:

- Security
- Network organization
- Traffic isolation
- Policy enforcement

---

## Benefits

- Better segmentation
- Easier administration
- Smaller security boundaries
- Improved scalability

---

## Typical Enterprise Design

| Subnet | Purpose |
|----------|----------|
| Web | Internet-facing workloads |
| Application | Business logic |
| Database | Backend databases |
| Management | Jump servers, Bastion |
| Firewall | Azure Firewall |
| GatewaySubnet | VPN Gateway / ExpressRoute |
| AzureBastionSubnet | Azure Bastion |

---

## Example

```
VNet: 10.0.0.0/16

Web Subnet
10.0.1.0/24

Application Subnet
10.0.2.0/24

Database Subnet
10.0.3.0/24

AzureFirewallSubnet
10.0.4.0/24

GatewaySubnet
10.0.5.0/27
```

---

## Best Practices

- Separate workloads by function.
- Apply NSGs per subnet.
- Reserve dedicated subnets for Azure services (Firewall, Bastion, Gateway).
- Avoid overly large subnets unless necessary.
- Use consistent IP addressing standards.

---

# 3. Network Security Groups (NSGs)

## Overview

A **Network Security Group (NSG)** is a Layer 3/Layer 4 packet-filtering firewall that controls inbound and outbound traffic.

NSGs use:

- Source IP
- Destination IP
- Port
- Protocol
- Direction
- Priority
- Allow/Deny action

---

## Rule Types

### Inbound Rules

Control traffic entering resources.

Examples:

- Allow HTTPS (443)
- Allow SSH (22)
- Allow RDP (3389)

---

### Outbound Rules

Control traffic leaving resources.

Examples:

- Allow Azure Storage
- Block Internet
- Allow Active Directory

---

## NSG Processing

Rules are processed:

1. Lowest priority number first
2. First matching rule wins

Example:

| Priority | Action |
|----------|---------|
|100|Allow HTTPS|
|200|Allow SSH|
|300|Deny Internet|
|65000|Default Allow VNet|
|65500|Default Deny|

---

## NSG Association

NSGs can be associated with:

- Subnets
- Individual Network Interfaces (NICs)

---

## Best Practices

- Prefer subnet-level NSGs.
- Use least privilege.
- Remove unused rules.
- Document rule purpose.
- Review regularly.

---

# 4. Virtual Network Peering

## Overview

VNet Peering connects two Azure Virtual Networks using the Microsoft backbone network.

Traffic does **not** traverse the public Internet.

---

## Types

### Regional VNet Peering

Connects VNets within the same Azure region.

Example:

```
East US
├── VNet-A
└── VNet-B
```

---

### Global VNet Peering

Connects VNets across Azure regions.

Example:

```
East US
     |
Microsoft Backbone
     |
West Europe
```

---

## Benefits

- Low latency
- High bandwidth
- Private communication
- Simplified network architecture
- Reduced operational overhead

---

## Common Scenarios

- Hub-and-spoke networking
- Shared services
- Disaster recovery
- Multi-region applications

---

## Limitations

- Overlapping IP ranges are not supported.
- Peering is non-transitive by default.
- Certain gateway scenarios require gateway transit configuration.

---

# 5. Azure Load Balancer

## Overview

Azure Load Balancer distributes Layer 4 (TCP/UDP) traffic across multiple backend resources.

---

## Types

### Public Load Balancer

Receives Internet traffic.

Example:

```
Internet
     |
Public IP
     |
Azure Load Balancer
     |
Multiple Web Servers
```

---

### Internal Load Balancer

Distributes traffic within a private network.

Example:

```
Application Servers
        |
Internal Load Balancer
        |
Database Servers
```

---

## Features

- High availability
- Health probes
- Automatic failover
- Zone redundancy
- Session persistence (optional)

---

## Common Use Cases

- Web servers
- Backend APIs
- SQL Always On
- Network appliances

---

# 6. Azure Firewall

## Overview

Azure Firewall is Microsoft's fully managed, stateful network firewall service.

It centrally controls traffic across Azure environments.

---

## Key Features

- Stateful packet inspection
- Network rules
- Application rules
- DNAT rules
- Threat Intelligence filtering
- TLS inspection (Premium)
- Intrusion Detection and Prevention System (IDPS) (Premium)
- URL filtering
- FQDN filtering
- Centralized logging
- High availability

---

## Azure Firewall SKUs

| SKU | Features |
|------|----------|
| Basic | Small workloads |
| Standard | Enterprise firewall capabilities |
| Premium | IDPS, TLS inspection, URL filtering |

---

## Common Use Cases

- Internet egress filtering
- Centralized firewall in hub-and-spoke architectures
- Hybrid connectivity
- Application allow-listing
- Network segmentation

---

# 7. Azure DDoS Protection

## Overview

Azure DDoS Protection safeguards public-facing applications against Distributed Denial-of-Service (DDoS) attacks.

---

## Protection Levels

### DDoS Network Protection (Standard)

Provides:

- Adaptive tuning
- Attack detection
- Attack analytics
- Cost protection
- Rapid mitigation
- Telemetry
- Metrics
- Logging

### Basic Protection

Automatically included for Azure public IP resources, providing baseline protection against common network-layer attacks.

---

## Best Practices

- Protect Internet-facing applications.
- Combine with Azure Firewall and Web Application Firewall (WAF).
- Enable monitoring and alerts.

---

# 8. Azure Private Link and Private Endpoint

## Overview

Azure Private Link enables private access to Azure PaaS services over the Microsoft backbone network.

Traffic never traverses the public Internet.

---

## Private Endpoint

A Private Endpoint creates a private IP address inside a VNet that maps to an Azure service.

Supported services include:

- Azure Storage
- Azure SQL Database
- Azure Key Vault
- Azure Cosmos DB
- Azure App Service
- Azure Machine Learning
- Azure Backup
- Azure Container Registry

---

## Benefits

- Private connectivity
- Reduced attack surface
- Regulatory compliance
- Data exfiltration protection
- Elimination of public endpoints

---

## Best Practices

- Disable public network access when using Private Endpoints.
- Use Private DNS Zones for name resolution.
- Monitor endpoint usage.

---

# 9. VPN Gateway and ExpressRoute

Azure supports secure connectivity between on-premises environments and Azure.

---

## Azure VPN Gateway

### Overview

VPN Gateway establishes encrypted tunnels over the public Internet.

---

### VPN Types

- Site-to-Site (S2S)
- Point-to-Site (P2S)
- VNet-to-VNet

---

### Advantages

- Cost-effective
- Easy deployment
- Secure IPSec tunnels
- Suitable for small to medium workloads

---

### Typical Use Cases

- Branch office connectivity
- Remote users
- Development environments
- Disaster recovery

---

## Azure ExpressRoute

### Overview

ExpressRoute provides dedicated private connectivity between on-premises infrastructure and Microsoft cloud services.

Traffic does not traverse the public Internet.

---

### Advantages

- High bandwidth
- Low latency
- Predictable performance
- Improved reliability
- Enhanced security
- SLA-backed connectivity

---

### Common Bandwidth Options

- 50 Mbps
- 100 Mbps
- 200 Mbps
- 500 Mbps
- 1 Gbps
- 2 Gbps
- 5 Gbps
- 10 Gbps
- Higher bandwidth options via ExpressRoute Direct

---

### Common Use Cases

- Enterprise datacenters
- Financial services
- Healthcare
- Government workloads
- Large-scale Azure deployments

---

# VPN Gateway vs ExpressRoute

| Feature | VPN Gateway | ExpressRoute |
|----------|------------|--------------|
| Network | Public Internet | Private Microsoft Network |
| Encryption | IPSec VPN | Optional (MACsec available on ExpressRoute Direct) |
| Performance | Moderate | High |
| Latency | Internet-dependent | Predictable and low |
| Cost | Lower | Higher |
| Reliability | Good | Enterprise-grade |
| Best For | SMBs and branch connectivity | Large enterprises and mission-critical workloads |

---

# Azure Networking Security Best Practices

- Design non-overlapping IP address spaces.
- Implement hub-and-spoke network architecture for large environments.
- Apply the principle of least privilege with NSGs and Azure Firewall.
- Use Azure Firewall for centralized traffic inspection.
- Enable Azure DDoS Network Protection for Internet-facing workloads.
- Prefer Private Link and Private Endpoints over public endpoints.
- Protect management access using Azure Bastion instead of exposing RDP/SSH.
- Encrypt hybrid connectivity using VPN Gateway or deploy ExpressRoute for enterprise connectivity.
- Use Azure DNS Private Resolver or Private DNS Zones for private name resolution.
- Monitor networking resources with Azure Monitor, Network Watcher, NSG Flow Logs, and Traffic Analytics.
- Enable diagnostic logs for Azure Firewall, VPN Gateway, Load Balancer, and Application Gateway.
- Implement Azure Policy to enforce networking standards.
- Regularly review firewall, routing, and NSG rules to eliminate unnecessary access.

---

# Key Takeaways

- **Virtual Networks (VNets)** provide isolated private networks for Azure resources.
- **Subnets** segment workloads for better organization and security.
- **Network Security Groups (NSGs)** enforce Layer 3/Layer 4 traffic filtering.
- **VNet Peering** enables private, high-speed communication between VNets.
- **Azure Load Balancer** distributes TCP/UDP traffic across healthy backend resources.
- **Azure Firewall** provides centralized, stateful network security with advanced threat protection.
- **Azure DDoS Protection** safeguards public-facing applications from volumetric attacks.
- **Private Link and Private Endpoints** provide secure private access to Azure PaaS services.
- **VPN Gateway** enables encrypted connectivity over the Internet, while **ExpressRoute** delivers dedicated, private, enterprise-grade connectivity.