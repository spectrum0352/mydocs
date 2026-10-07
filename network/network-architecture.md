# Network Architecture

A network architecture defines how devices, services, and controls are arranged to support business operations while protecting data and systems. A secure network architecture uses layered controls, segmentation, monitoring, and policy enforcement to reduce risk and limit the impact of incidents.

## Core Principles

- **Defense in depth:** Multiple overlapping controls protect against different attack vectors.
- **Least privilege:** Grant only the access that users and devices need.
- **Zero trust:** Do not trust any network traffic by default; verify identity and policy before granting access.
- **Segmentation:** Separate resources into zones or subnets to limit lateral movement.
- **Monitoring and response:** Continuously inspect traffic, detect anomalies, and respond quickly.
- **Encryption:** Protect data in transit and at rest to preserve confidentiality.

## Key Components

- **Firewalls:** Control traffic between network segments and enforce security policies.
- **IDS/IPS:** Detect and block suspicious or malicious traffic patterns.
- **VPNs:** Provide secure remote or site-to-site connectivity over untrusted networks.
- **WAFs:** Protect web applications from injection, cross-site scripting, and other application-layer attacks.
- **Load balancers:** Distribute traffic, improve performance, and support availability.
- **Network segmentation:** Use VLANs, subnets, and security groups to isolate workloads.
- **Access control:** Use identity, device posture, and policy to determine who and what can connect.
- **SIEM/SOAR:** Aggregate logs, detect threats, and automate responses.
- **DDoS protection:** Mitigate volumetric and protocol-level denial-of-service attacks.
- **Private connectivity:** Use private endpoints, dedicated links, or service chaining to avoid public exposure.

## Network Services and Appliances

- **Routers and switches:** Forward traffic and connect network segments.
- **Load balancers:** Improve scalability and resilience for applications.
- **DHCP:** Automatically assigns IP addresses and network configuration.
- **DNS:** Resolves names to IP addresses and is critical to application connectivity.
- **NAT:** Translates private addresses to public addresses, limiting direct exposure.
- **Directory services:** Authenticate and authorize users and devices.

## Common Network Security Controls

- Block unused ports and protocols.
- Restrict access to management interfaces.
- Enforce secure remote access for administrators.
- Apply network segmentation for high-risk assets.
- Use application security groups or security groups to simplify policy management.
- Protect internet-facing resources with perimeter and application-layer controls.
- Implement logging and auditing for network activity.

## VPN Comparison

| Feature | Point-to-Site (P2S) | Site-to-Site (S2S) |
|---|---|---|
| Use case | Remote device access | Network-to-network connectivity |
| Client software | Required on the endpoint | Not required on each endpoint |
| Gateway required | Yes | Yes |
| Authentication | User/device to gateway | Gateway to gateway |
| Routing | Client route configuration | Network routing tables |

## Unicast vs Multicast

| Feature | Unicast | Multicast |
|---|---|---|
| Communication model | One-to-one | One-to-many |
| Destination | Single IP address | Multicast group address |
| Forwarding behavior | Only destination processes packet | Group members receive packet |
| Common uses | Web browsing, file transfer | Media streaming, conferencing |

## How Network Security Works

Network security works through a layered combination of prevention, detection, and response. Controls are applied at the edge, between segments, and at endpoints so that threats are blocked or contained.

### Security lifecycle

1. **Authentication:** Verify identities for users and devices.
2. **Authorization:** Grant access based on roles, policies, and device posture.
3. **Accounting:** Log activity for auditing and forensic analysis.
4. **Monitoring:** Inspect traffic and events for anomalies and threats.
5. **Incident response:** Investigate and contain attacks quickly.

## Packet Capture and Analysis

Packet capture records network traffic for inspection. Tools such as Wireshark capture packets and reveal details like source/destination addresses, protocols, payloads, and timing.

### Uses

- Troubleshoot connectivity and routing problems.
- Detect packet loss, retransmissions, and latency issues.
- Identify misconfigured firewalls or blocked traffic.
- Analyze suspicious activity during security investigations.
- Validate application behavior and protocol compliance.

## Routing in TCP/IP Networks

Routers use the destination IP address in each packet to determine the best next hop. They consult a routing table and forward packets toward the destination network.

### Router decision process

1. Packet arrives on an interface.
2. Router reads the destination IP address.
3. Routing table is consulted for the best path.
4. The packet is forwarded to the selected outgoing interface.

Routers may learn routes dynamically through protocols such as OSPF, BGP, and RIP, or they can use static routes configured by administrators.

## Azure Network Security Architecture

Azure network architecture often uses hub-spoke topologies, segmented VNets, and centralized security controls.

### VNet peering and topology

- VNet peering enables private connectivity between VNets in the same Azure AD tenant.
- Peered VNets must have non-overlapping IP ranges.
- Hub-spoke topology centralizes shared services such as firewalls, DNS, and connectivity while isolating workloads in spokes.

### Azure security controls

- **Network security groups (NSGs):** Filter traffic at the subnet or NIC level.
- **Application security groups (ASGs):** Simplify policies for groups of VMs and workloads.
- **Azure Firewall:** Provides stateful filtering, application rules, and centralized policy management.
- **Private Endpoints / Private Link:** Restrict access to PaaS services over private network paths.
- **Azure DDoS Protection:** Safeguards against volumetric and protocol attacks.
- **User-defined routes (UDRs):** Force traffic through security appliances or inspection points.

### Best practices

- Use NSGs with a deny-by-default posture and permit exceptions only when needed.
- Deploy private endpoints for supported services and disable public access when possible.
- Protect management and internet-facing resources with Azure Firewall or WAF.
- Apply adaptive network hardening recommendations and Azure Policy for consistent enforcement.
- Separate high-risk workloads into isolated subnets or VNets.

## Advanced Network Security Topics

- **Application gateway/WAF:** Protect web applications from layer 7 attacks.
- **Azure Front Door:** Provide global application delivery and web protection.
- **Service chaining:** Route traffic through inspection and security appliances.
- **Hybrid connectivity:** Secure connections between on-premises and cloud environments with VPN or ExpressRoute.
- **Container networking:** Secure AKS and other container services with dedicated networking, RBAC, and registry protection.

## Summary

A good network architecture blends connectivity, performance, and security. It uses a layered defense model, strong access controls, careful segmentation, and continuous monitoring to protect resources while supporting business needs.

# The End

Network Architecture

# Network Architecture

Assisted security architect to define policies and best practices for NSG.

Assisted security architect to define policies and best practices for Azure Firewall.

Assisted security architect to define policies and best practices for Application Gateway (WAF).

## VNET Peering

**Peering Types:**

- Standard peering

- Gateway transit peering

Can we do VNET peering of VNETs in different subscription of same Tenant?

- Yes, we can do Vnets peering in different subscriptions of the same tenant

- Network Contributor role required in both subscriptions for peering.

- Peered VNETs should have non-overlapping IP address space.

Can we do VNET peering of VNETs in different subscription of different Tenant?

- No, you cannot directly peer VNets in different Azure AD tenants.

- VNet peering is a feature designed to connect VNets within the same Azure AD tenant. It provides a direct, private connection between the VNets, offering benefits like improved performance and reduced costs.

- Why Can't You Peer Across Tenants?

- **Security and Isolation:** Different tenants represent distinct organizational boundaries. Peering across tenants could potentially compromise security and isolation.

- **Authentication and Authorization:** Managing access and permissions across different tenants would be complex and introduce additional security challenges.

- **Network Topology:** Azure's networking infrastructure is designed to operate within tenant boundaries.

- Alternatives for Cross-Tenant Connectivity:

- **Azure ExpressRoute:** This provides private connectivity between your on-premises infrastructure and Azure, allowing you to establish connections between different tenants by connecting them to a common on-premises network.

- **Azure VPN Gateway:** Create site-to-site VPN connections between your on-premises network and each tenant's Azure environment, enabling communication between the VNets.

- **Azure Virtual Network Gateway:** Like site-to-site VPN, but uses Azure's infrastructure for the VPN gateway.

- **Third-Party Network Virtualization Solutions:** Some third-party providers offer solutions that can help bridge connectivity across different tenants, but these options often come with additional costs and complexities.

Can we do VNET peering of VNETs in different regions or geography?

- Yes, you can peer VNETs across different regions

<https://azure.microsoft.com/en-us/blog/global-vnet-peering-now-generally-available/>

**Hub-spoke topology**

- In this hub and spoke are deployed in separate VNETs connected through peering.

- Segregated management: enables us to apply governance and principle of least privilege. It supports concept of Azure Landing Zone with separation of duties.

- Minimizes direct exposure of Azure resources to the public internet.

- Organizations often operate with regional hub-spoke topologies. Hub-spoke network topologies can be expanded in the future and provide workload isolation.

- It makes the architecture extensible. To accommodate new features or workloads, new spokes can be added instead of redesigning the network topology.

- Azure firewall and DNS can be shared across networks through hub-spoke topology

**How to design network architecture?**
Define policies and best practices for NSG.
Define policies and best practices for Azure Firewall.
Define policies and best practices for Application Gateway (WAF).

**What are the Network Security solutions in Azure?**



**Azure Network Segmentation**

- Azure VNET and subnet can be used for enterprise network segmentation.

- High risk/High value resources can be in isolated VNETs and subnets.

- NSGs can be used for network segmentation, it acts as access control list (ACL), by restricting and controlling the traffic by port, protocol, source, and destination ip address.

- NSG: On NSG follow default rules as "**Deny by default, permit by exception**".

- For complex application architecture use application security groups (ASGs) to simplify complex configuration. Instead of defining policy based on explicit IP addresses in network security groups, ASGs enable you to configure network security as a natural extension of an application's structure, allowing you to group virtual machines and define network security policies based on those groups.

<!-- -->

- Azure Policies:

- Adaptive network hardening recommendations should be applied on internet facing virtual machines

- All network ports should be restricted on network security groups associated to your virtual machine

- Non-internet-facing virtual machines should be protected with network security groups

- Subnets should be associated with a Network Security Group

- Internet-facing virtual machines should be protected with Network Security Groups

VNet concepts and best practices: https://docs.microsoft.com/azure/virtual-network/concepts-and-best-practices

Subnet: https://docs.microsoft.com/azure/virtual-network/virtual-network-manage-subnet

NSG: https://docs.microsoft.com/azure/virtual-network/tutorial-filter-network-traffic

ASG: https://docs.microsoft.com/azure/virtual-network/network-security-groups-overview#application-security-groups

**Secure cloud services with network controls (Private Endpoints)**

- Secure cloud services by establishing a private access point for the resources. You should also disable or restrict access from public network when possible.

- Deploy private endpoints for all Azure resources that support the Private Link feature, to establish a private access point for the resources. You should also disable or restrict public network access to services where feasible.

- For certain services, you also have the option to deploy VNet integration for the service where you can restrict the VNET to establish a private access point for the service."

-  

- Understand Azure Private Link: <https://docs.microsoft.com/azure/private-link/private-link-overview>

- Security architecture: <https://docs.microsoft.com/azure/cloud-adoption-framework/organize/cloud-security-architecture>

**Deploy firewall at the edge of enterprise network**

- "Deploy a firewall to perform advanced filtering on network traffic to and from external networks. You can also use firewalls between internal segments to support a segmentation strategy. <u>If required, use custom routes for your subnet to override the system route when you need to force the network traffic to go through a network appliance for security control purpose.</u>

- At a minimum, block known bad IP addresses and high-risk protocols, such as remote management (for example, RDP and SSH) and intranet protocols (for example, SMB and Kerberos).

- Use Azure Firewall to provide fully stateful application layer traffic restriction (such as URL filtering) and/or central management over many enterprise segments or spokes (in a hub/spoke topology).

- If you have a complex network topology, such as a hub/spoke setup, you may need to **create user-defined routes (UDR)** to ensure the traffic goes through the desired route. For example, you have option to use an UDR to redirect egress internet traffic through a specific Azure Firewall or a network virtual appliance."

- Finding the most efficient way to implement firewall policies across Contoso's multiple Azure regions.

- **Stateful vs Stateless Firewalls**: <https://www.geeksforgeeks.org/stateless-vs-stateful-packet-filtering-firewalls/>



## Network Security Architecture in Azure

- DDoS Protection
- Detect and disable insecure services and protocols
- Intrusion detection and prevention
- Network segmentation boundaries
- Only SSL connection should be enabled on Database servers
- PaaS Services public access should be disallowed
- PaaS Services should have firewall enabled
- PaaS Services should use secure connection (HTTPS)
- Perimeter protection with firewall
- Use private link for all PaaS Services
- VPN connections should use Azure Active Directory for authentication
- Web Application Firewall



## VM security

Configure update management
Create VM templates
Define privileged access device strategy
Deploy and configure Windows Defender
Deploy disk encryption
Deploy Privileged access workstations
Enable and secure remote access management
Enable Endpoint protection
Explore Microsoft Defender for Cloud recommendations
Secure Azure workload with Azure Security Benchmark

## Container security

Configure AKS networking
Configure Azure container instance security
Deploy AKS storage
Enable Azure container registry authentication
Explore Azure Container registry
Implement AKS architecture
Manage access to AKS through Azure RBAC
Review Azure Kubernetes services
Secure authentication to AKS with Active Directory

## Implement advanced network security

- secure the connectivity of hybrid networks
- create and configure Azure Firewall
- create and configure Azure Firewall Manager
- create and configure Azure Application Gateway
- create and configure Azure Front Door
- create and configure Web Application Firewall (WAF)
- configure a resource firewall, including storage account, Azure SQL, Azure Key Vault, or Azure App Service
- configure network isolation for Web Apps and Azure Functions
- implement Azure Service Endpoints
- implement Azure Private Endpoints, including integrating with other services
- implement Azure Private Links
- implement Azure DDoS Protection
