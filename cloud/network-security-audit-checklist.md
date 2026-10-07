# Network security


## NETWORK SECURITY

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

Network Layer:
Next-Generation Intrusion Detection/Prevention Systems (IDS/IPS): Detects and blocks network-based attacks.
Next-Generation Firewalls: Advanced firewalls with capabilities like deep packet inspection and application control.
Domain Name System Security Extensions (DNSSec): Ensures the integrity of DNS records to prevent DNS poisoning attacks.
Distributed Denial of Service (DDoS) Protection: Mitigates DDoS attacks that aim to overwhelm network resources.
OAuth Configuration: Securely authorizes access to APIs and resources.
Deep Packet Inspection (DPI): Analyses network traffic for suspicious patterns and anomalies.
Root of Trust (RoT): Uses a trusted computing module to verify the integrity of the operating system and installed programs.
Network Security: Secure network infrastructure and traffic.


NETWORK SECURITY

• All VMs deployed without public IP by default

• Network segmentation implemented

• Subnet design documented

• NSGs applied to all subnets

• Firewall deployed centrally

• WAF deployed for internet-facing apps

• DDoS protection enabled

• Private endpoints used for PaaS

• Storage accounts restricted to private access

• SQL databases restricted to private access

• Cosmos DB restricted to private access

• Bastion host used for admin access

• No direct RDP from internet

• No direct SSH from internet

• Inbound ports restricted

• Outbound traffic filtering implemented

• Egress monitoring implemented

• TLS 1.2+ enforced

• Weak ciphers disabled

• VPN security configured

• ExpressRoute security reviewed

• Peering rules reviewed

• VNet flow logs enabled

• Network logging retained

• IDS/IPS enabled

• DNS logging enabled

• DNS filtering implemented

• Public endpoints inventory maintained

• Load balancer security reviewed

• Reverse proxy configured

• Network microsegmentation implemented

• East-west traffic visibility enabled

• Zero Trust network model implemented

• API gateway deployed

• Rate limiting configured

• Geo-blocking configured

• Secure ingress controller configured

• Firewall rule review conducted quarterly





\## NETWORK SECURITY

These checks are inspired by AWS best practices but rewritten in the context of Azure environments. They help identify overly permissive networking configurations and logging gaps commonly targeted in lateral movement or external exposure.



\- All VMs deployed without public IP by default

\- Network segmentation implemented

\- Subnet design documented

\- NSGs applied to all subnets

\- Firewall deployed centrally

\- WAF deployed for internet-facing apps

\- DDoS protection enabled

\- Private endpoints used for PaaS

\- Storage accounts restricted to private access

\- SQL databases restricted to private access

\- Cosmos DB restricted to private access

\- Bastion host used for admin access

\- No direct RDP from internet

\- No direct SSH from internet

\- Inbound ports restricted

\- Outbound traffic filtering implemented

\- Egress monitoring implemented

\- TLS 1.2+ enforced

\- Weak ciphers disabled

\- VPN security configured

\- ExpressRoute security reviewed

\- Peering rules reviewed

\- VNet flow logs enabled

\- Network logging retained

\- IDS/IPS enabled

\- DNS logging enabled

\- DNS filtering implemented

\- Public endpoints inventory maintained

\- Load balancer security reviewed

\- Reverse proxy configured

\- Network microsegmentation implemented

\- East-west traffic visibility enabled

\- Zero Trust network model implemented

\- API gateway deployed

\- Rate limiting configured

\- Geo-blocking configured

\- Secure ingress controller configured

\- Firewall rule review conducted quarterly

\- Deny inbound traffic on ports 22/3389 from 0.0.0.0/0 in all NSGs

\- Enable NSG Flow Logs across all Network Security Groups

\- Restrict default NSGs and Subnets to least privilege

\- Review Public IP usage — avoid assigning directly to critical VMs

\- Confirm no overly permissive route tables or peering links

\- Check	Tool	Command	Expected Result

\- Ensure no Network Security Group (NSG) allows inbound access from 0.0.0.0/0 on port 22 (SSH)	Azure CLI	az network nsg rule list --resource-group <rg> --nsg-name <nsg> No rules should allow \* source with destination port 22

\- Ensure no NSG allows inbound access from 0.0.0.0/0 on port 3389 (RDP)	Azure CLI	az network nsg rule list --resource-group <rg> --nsg-name <nsg>	No rules should allow \* source with destination port 3389

\- Ensure Network Watcher Flow Logs are enabled for all NSGs	Azure CLI	az network watcher flow-log show --nsg <nsg-name> --resource-group <rg>	Flow logs should be enabled and pointing to a storage account

\- Ensure default NSGs (or unassociated ones) deny all inbound traffic by default	Azure CLI	az network nsg rule list --resource-group <rg> --nsg-name <nsg>	Default NSGs should not have allow-all inbound rules

\- Ensure Subnet NSG association is correct and restricts public traffic	Azure CLI	az network vnet subnet show --vnet-name <vnet> --name <subnet>	NSG should be associated and configured for least privilege

\- Ensure Public IP addresses are not assigned directly to critical VMs unless required	Azure CLI	az vm list-ip-addresses --output table	Critical VMs should not expose public IPs unnecessarily









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


## Network Security



These checks are inspired by AWS best practices but rewritten in the context of Azure environments. They help identify overly permissive networking configurations and logging gaps commonly targeted in lateral movement or external exposure.



| **Check** | **Tool** | **Command** | **Expected Result** |

|----|----|----|----|

| **Ensure no Network Security Group (NSG) allows inbound access from 0.0.0.0/0 on port 22 (SSH)** | Azure CLI | az network nsg rule list --resource-group <rg> --nsg-name <nsg> | No rules should allow * source with destination port 22 |

| **Ensure no NSG allows inbound access from 0.0.0.0/0 on port 3389 (RDP)** | Azure CLI | az network nsg rule list --resource-group <rg> --nsg-name <nsg> | No rules should allow * source with destination port 3389 |

| **Ensure Network Watcher Flow Logs are enabled for all NSGs** | Azure CLI | az network watcher flow-log show --nsg <nsg-name> --resource-group <rg> | Flow logs should be enabled and pointing to a storage account |

| **Ensure default NSGs (or unassociated ones) deny all inbound traffic by default** | Azure CLI | az network nsg rule list --resource-group <rg> --nsg-name <nsg> | Default NSGs should not have allow-all inbound rules |

| **Ensure Subnet NSG association is correct and restricts public traffic** | Azure CLI | az network vnet subnet show --vnet-name <vnet> --name <subnet> | NSG should be associated and configured for least privilege |

| **Ensure Public IP addresses are not assigned directly to critical VMs unless required** | Azure CLI | az vm list-ip-addresses --output table | Critical VMs should not expose public IPs unnecessarily |


## Networking



- Deny inbound traffic on ports 22/3389 from 0.0.0.0/0 in all NSGs

- Enable NSG Flow Logs across all Network Security Groups

- Restrict default NSGs and Subnets to least privilege

- Review Public IP usage — avoid assigning directly to critical VMs

- Confirm no overly permissive route tables or peering links



## 2. Networking



These checks are inspired by AWS best practices but rewritten in the context of Azure environments. They help identify overly permissive networking configurations and logging gaps commonly targeted in lateral movement or external exposure.



- Deny inbound traffic on ports 22/3389 from 0.0.0.0/0 in all NSGs

- Enable NSG Flow Logs across all Network Security Groups

- Restrict default NSGs and Subnets to least privilege

- Review Public IP usage — avoid assigning directly to critical VMs

- Confirm no overly permissive route tables or peering links



| **Check** | **Tool** | **Command** | **Expected Result** |

|----|----|----|----|

| **Ensure no Network Security Group (NSG) allows inbound access from 0.0.0.0/0 on port 22 (SSH)** | Azure CLI | az network nsg rule list --resource-group <rg> --nsg-name <nsg> | No rules should allow * source with destination port 22 |
| **Ensure no NSG allows inbound access from 0.0.0.0/0 on port 3389 (RDP)** | Azure CLI | az network nsg rule list --resource-group <rg> --nsg-name <nsg> | No rules should allow * source with destination port 3389 |
| **Ensure Network Watcher Flow Logs are enabled for all NSGs** | Azure CLI | az network watcher flow-log show --nsg <nsg-name> --resource-group <rg> | Flow logs should be enabled and pointing to a storage account |
| **Ensure default NSGs (or unassociated ones) deny all inbound traffic by default** | Azure CLI | az network nsg rule list --resource-group <rg> --nsg-name <nsg> | Default NSGs should not have allow-all inbound rules |
| **Ensure Subnet NSG association is correct and restricts public traffic** | Azure CLI | az network vnet subnet show --vnet-name <vnet> --name <subnet> | NSG should be associated and configured for least privilege |
| **Ensure Public IP addresses are not assigned directly to critical VMs unless required** | Azure CLI | az vm list-ip-addresses --output table | Critical VMs should not expose public IPs unnecessarily |

Network Security
These checks are inspired by AWS best practices but rewritten in the context of Azure environments. They help identify overly permissive networking configurations and logging gaps commonly targeted in lateral movement or external exposure.
Check	Tool	Command	Expected Result
Ensure no Network Security Group (NSG) allows inbound access from 0.0.0.0/0 on port 22 (SSH)	Azure CLI	az network nsg rule list --resource-group <rg> --nsg-name <nsg>	No rules should allow * source with destination port 22
Ensure no NSG allows inbound access from 0.0.0.0/0 on port 3389 (RDP)	Azure CLI	az network nsg rule list --resource-group <rg> --nsg-name <nsg>	No rules should allow * source with destination port 3389
Ensure Network Watcher Flow Logs are enabled for all NSGs	Azure CLI	az network watcher flow-log show --nsg <nsg-name> --resource-group <rg>	Flow logs should be enabled and pointing to a storage account
Ensure default NSGs (or unassociated ones) deny all inbound traffic by default	Azure CLI	az network nsg rule list --resource-group <rg> --nsg-name <nsg>	Default NSGs should not have allow-all inbound rules
Ensure Subnet NSG association is correct and restricts public traffic	Azure CLI	az network vnet subnet show --vnet-name <vnet> --name <subnet>	NSG should be associated and configured for least privilege
Ensure Public IP addresses are not assigned directly to critical VMs unless required	Azure CLI	az vm list-ip-addresses --output table	Critical VMs should not expose public IPs unnecessarily


Network Security
Virtual Network Security: Implement network security groups (NSGs) and Azure Firewall to control inbound and outbound traffic.
Segmentation: Use subnets and network security policies to segment the network and limit access.
Encryption: Ensure end-to-end encryption for data in transit using protocols like TLS/SSL.
Network Segmentation: Isolate sensitive data from other parts of the network.

Protecting the Perimeter and Internal Traffic
Focus: Secure network traffic and segment resources to limit the impact of breaches.
Zero Trust Principles: Micro-segmentation, encryption of all traffic, and continuous network monitoring.
Defense in Depth: Firewalls, network segmentation, intrusion detection, and DDoS protection.
Azure Resources: Azure Virtual Network, Azure Firewall, Network Security Groups (NSGs), Azure Application Gateway, Azure DDoS Protection.
Security Controls:
Network Segmentation: Virtual Networks (VNets), subnets, and Network Security Groups (NSGs) to isolate resources.
Firewall Protection: Azure Firewall for perimeter security, Web Application Firewall (WAF) for web applications.
Intrusion Detection/Prevention: Azure Network Watcher, third-party network security appliances.
DDoS Protection: Azure DDoS Protection Standard to mitigate large-scale attacks.
Traffic Encryption: VPN gateways, ExpressRoute, and TLS encryption for all traffic.
Micro-segmentation: Further isolation within VNets using NSGs and Application Security Groups.
Network Monitoring: Azure Network Watcher, Azure Traffic Analytics for traffic visibility and threat detection.







