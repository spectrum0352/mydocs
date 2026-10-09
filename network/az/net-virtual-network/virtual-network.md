# Cloud Networking

 Why is it so hard to monitor cloud network traffic?

- Cloud traffic obscurity: Encrypted tunnels, virtual networks make traditional monitoring blind.

- Distributed cloud services: Traffic travels complex paths within the cloud provider's network.

- Encrypted communication: Network monitoring cannot see the content of traffic for security reasons.

- Cloud's dynamic nature: Traditional tools struggle to handle the scaling traffic volume.

- Limited cloud control: Reliant on provider's tools which may lack detail or customization.

# Introduction

An Azure Virtual Network (VNet) is essentially a private network within the Azure cloud, dedicated to your subscription. It provides a secure and isolated environment for your virtual machines (VMs) and other resources to communicate with each other.

**Key Features and Benefits:**

- **Isolation and Segmentation:**

  - VNet allows you to create isolated networks within your Azure environment.

  - Subnets can be used to further segment the network for specific workloads or security requirements.

  - Create logical networks within Azure to separate resources and enhance security.

  - Define subnets to further divide the network into smaller segments.

- **Internet Communication:**

  - VNet enables secure communication with the internet through public IP addresses assigned to your resources.

  - Assign public IP addresses to resources to allow them to communicate with the internet.

  - Utilize load balancers to distribute incoming traffic across multiple instances.

- **Azure Resource Communication:**

  - **VNETs:** Resources within the same VNET can communicate directly and securely.

  - **VNET Service Endpoints:** Connect to Azure services like Azure SQL Database and Storage Accounts without exposing them to the public internet.

  - **VNET Peering:** Establish connections between VNETs in the same or different regions to enable communication between resources in different VNETs.

  - VNet facilitates seamless communication between Azure resources, including VMs, virtual appliances, and other services.

- **On-Premises Connectivity:**

  - VNet supports various methods for connecting your on-premises network to Azure:

    - **Point-to-Site VPN:** Secure remote access for individual users.

    - **Site-to-Site VPN:** Connects entire networks between on-premises and Azure.

    - **Azure ExpressRoute:** Dedicated, private connection for high-bandwidth, low-latency connectivity.

    - **Point-to-Site VPN:** Allow individual devices to connect to the VNET securely.

    - **Site-to-Site VPN:** Connect entire networks on-premises to the VNET.

    - **Azure ExpressRoute:** Establish a private connection between your on-premises network and Azure.

- **Network Traffic Management:**

  - **Border Gateway Protocol (BGP):** Advanced routing protocol for complex network topologies.

  - **Border Gateway Protocol (BGP):** Implement advanced routing protocols for complex network topologies.

  - **Network Security Groups (NSGs):** Filter network traffic based on source, destination, port, and protocol.

  - **Network Security Groups (NSGs):** Filter network traffic to and from resources within your VNet.

  - **Network Virtual Appliances (NVAs):** Deploy third-party network security devices for advanced filtering and protection.

  - **Network Virtual Appliances (NVAs):** Deploy virtual network appliances for advanced security and network functions.

  - **Route Tables:** Define custom routing rules for network traffic within your VNet.

  - **Route Tables:** Define custom routing rules to control traffic flow within the VNET.

- **VNet Peering:**

  - Connect multiple VNets within the same region or across different regions to create a larger, more complex network topology.

**In Summary:** Azure VNet provides a flexible and secure foundation for deploying and managing your cloud infrastructure. By understanding its core concepts and capabilities, you can effectively leverage VNet to achieve your cloud networking goals.

# Subnet

**What is a Subnet?**

- A subnet is a range of IP addresses within a Virtual Network (VNet).

- VNets can be segmented into multiple subnets for better organization and security.

- Subnets can be of different sizes, but they must follow specific rules:

  - **IPv4:** Subnets must be between /29 and /2 in size.

  - **IPv6:** Subnets must be exactly /64 in size.

**Calculating Subnet Size:** To determine the number of bits required for a subnet, consider the number of hosts needed:

1.  **Add 2** to the number of hosts (for network and broadcast addresses).

2.  **Find the smallest power of 2** greater than or equal to the result from step 1.

3.  **Subtract 2** from the power of 2 to get the required number of bits.

**Key Considerations for Subnet Implementation:**

- **Unique Address Ranges:** Each subnet must have a unique IP address range in CIDR format.

- **Service Requirements:** Certain Azure services require specific subnets.

- **Traffic Management:** Subnets can be used to route traffic through network virtual appliances.

- **Access Control:** Virtual network service endpoints can limit access to Azure resources to specific subnets.

**Micro-segmentation with Network Security Groups (NSGs):**

- NSGs can be used to further segment subnets and control access to resources within them.

- You can associate zero or one NSG to each subnet in a VNet.

By effectively utilizing subnets and NSGs, you can create a highly secure and efficient network infrastructure on Azure.

# VNET Service endpoint

## Service endpoint vs Private endpoint vs Private link

> All three concepts - VNET service endpoint, private endpoint, and private link - are related to securing network traffic within Azure, but they achieve this in different ways:

- **VNET Service Endpoint:**

  - Simpler to set up.

  - Traffic still leaves the VNET and reaches the public endpoint of the Azure service (storage account, SQL database etc.) over a Microsoft optimized route.

  - Offers basic security improvement by limiting outbound traffic to Microsoft's backbone network.

- **Private Endpoint:**

  - Creates a private IP address within your VNET for an Azure service resource.

  - Traffic never leaves the VNET, enhancing security.

  - Requires additional configuration like DNS changes and might involve Azure Private DNS.

- **Private Link (Service):**

  - A broader concept encompassing private endpoints.

  - Allows connection to various Azure PaaS services (storage, databases etc.) and your own custom Private Link service.

  - Enables granular access control to specific resources within a service.

  - Provides access from on-premises networks via VPN/ExpressRoute and peered VNETs.

>  
>
> **Here's an analogy:**

- **Service Endpoint:** Like taking a shortcut on a public highway to reach a service station.

- **Private Endpoint:** Like having a dedicated tunnel built directly to the service station from your house.

- **Private Link:** Like having a private network with connections to various service stations and your personal gas pump.

>  
>
>  

# VNET Design Considerations

While implementing VNETs, consider the following points:

- Ensure non-overlapping address spaces. Make sure your VNet address space (CIDR block) does not overlap with your organization's other network ranges.

- Is any security isolation required?

- Do you need to mitigate any IP addressing limitations?

- Will there be connections between Azure VNETs and on-premises networks?

- Is there any isolation required for administrative purposes?

- Are you using any Azure services that create their own VNET?

## IP Addressing

Azure VNET IP Addressing

**Recommended IP Ranges for VNETs:**

- 10.0.0.0 - 10.255.255.255 (10/8 prefix)

- 172.16.0.0 - 172.31.255.255 (172.16/12 prefix)

- 192.168.0.0 - 192.168.255.255 (192.168/16 prefix)

**Reserved IP Addresses:**

- x.x.x.0: Network address

- x.x.x.1: Reserved for the default gateway

- x.x.x.2, x.x.x.3: Reserved for Azure DNS IP mapping

- x.x.x.255: Network broadcast address

**Unavailable IP Ranges:**

- 224.0.0.0/4 (Multicast)

- 255.255.255.255/32 (Broadcast)

- 127.0.0.0/8 (Loopback)

- 169.254.0.0/16 (Link-local)

- 168.63.129.16/32 (Internal DNS)

**VNET Considerations:**

- **Non-overlapping Address Spaces:** Avoid overlapping with other networks.

- **Security Isolation:** Consider using separate VNETs for different workloads.

- **IP Addressing Limitations:** Be aware of limitations and plan accordingly.

- **On-premises Connectivity:** Plan for appropriate connectivity methods.

- **Administrative Isolation:** Use separate VNETs for different administrative teams.

- **Azure Service VNETs:** Account for Azure services that create their own VNETs.

**Azure Public IP Addresses:**

- **Basic SKU:** Dynamic or static IP, optional network security groups, no availability zones.

- **Standard SKU:** Static IP, required network security groups, zone-redundant.

- **Dynamic Public IP:** Changes after restart or stop.

- **Static Public IP:** Remains unchanged.

## Between VNET and Az Resources

Azure Resource Communication within and Between VNETs

Azure provides three primary mechanisms for secure communication between resources:

1.  **Virtual Networks (VNETs):**

    - Isolate resources within a private network.

    - Enable direct communication between VMs, App Services, AKS clusters, and VMSS instances within the same VNET.

    - Provide a secure and controlled environment for resource interaction.

2.  **VNET Service Endpoints:**

    - Facilitate secure and private communication between VNET resources and Azure platform services (like Azure SQL Database and Storage Accounts).

    - Eliminate the need for public IP addresses, enhancing security.

3.  **VNET Peering:**

    - Connect multiple VNETs within the same Azure region or across different regions.

    - Enable communication between resources in different VNETs, expanding network connectivity and enabling complex topologies.

By effectively utilizing these mechanisms, you can establish secure and efficient communication patterns among your Azure resources, regardless of their location or type.

## Between VNET and On-prem

There are three primary methods to establish this connection:

1.  **Point-to-Site VPN:**

    - **How it works:** Individuals can connect their devices directly to the VNET using VPN clients.

    - **Best for:** Remote workers or occasional connections.

2.  **Site-to-Site VPN:**

    - **How it works:** Entire on-premises networks can be connected to the VNET through VPN devices.

    - **Best for:** Connecting entire branch offices or data centers.

3.  **Azure ExpressRoute:**

    - **How it works:** A private connection between your on-premises network and Azure, bypassing the public internet.

    - **Best for:** High-bandwidth, low-latency, and highly reliable connections.

**Key Considerations:**

- **Security:** All methods involve encryption to protect data transmission.

- **Performance:** ExpressRoute generally offers superior performance, especially for large data transfers.

- **Cost:** Point-to-Site VPN is typically the most cost-effective, while ExpressRoute can be more expensive.

- **Scalability:** Site-to-Site VPN and ExpressRoute can scale to accommodate growing network needs.

By understanding these options, you can choose the most suitable method to connect your on-premises infrastructure to Azure VNET, ensuring seamless communication and data transfer.

 

## Peering vs. Gateways vs Gateway Transit

By default, virtual networks in Azure are isolated and cannot directly communicate. Here is a breakdown of two methods to establish connectivity between them:

Virtual Network Peering:

Directly connects two virtual networks, making them appear as one for internal traffic flow.

- **Benefits:**

  - Low latency and high bandwidth due to direct communication through the Microsoft backbone.

  - Private communication; traffic never traverses the public internet.

  - Supports global peering (connecting networks across regions).

- **Use Cases:**

  - Cross-region data replication and disaster recovery.

  - Scalable communication for workloads distributed across multiple networks.

  - Maintaining data privacy by keeping traffic within the Azure backbone.

VPN Gateways:

Connects a virtual network to an on-premises location or another VNET over an encrypted tunnel using the public internet.

- **Benefits:**

  - Provides secure communication with encryption.

  - Useful for connecting to on-premises networks.

  - Supports connections between virtual networks, though with limitations (see below).

- **Limitations:**

  - Lower bandwidth and higher latency compared to peering.

  - Traffic traverses the public internet, potentially impacting security policies.

- **Use Cases:**

  - Connecting to on-premises infrastructure for hybrid deployments.

  - Securing communication between virtual networks when peering is not suitable.

>  

Gateway Transit

Allows a peered virtual network to leverage the VPN gateway or ExpressRoute connection of another peered virtual network for on-premises connectivity.

- **Benefits:**

  - Cost-effective by sharing a single gateway across multiple virtual networks.

  - Reduces complexity by managing connections in one central location (transit network).

Choosing the Right Method:

- **Latency and Bandwidth:** Peering offers superior performance for internal traffic flow.

- **Security:** Both peering and VPN gateways provide secure connections, but peering keeps traffic within the Azure backbone for enhanced privacy.

- **On-Premises Connectivity:** VPN gateways are essential for connecting to on-premises networks.

- **Scalability:** Gateway transit simplifies managing connections as your virtual network environment grows.

>  

 

In essence, virtual network peering provides a high-performance, private connection method for internal communication between Azure virtual networks. VPN gateways cater to scenarios requiring secure connections to on-premises networks or with bandwidth limitations, but with potential trade-offs in latency and data privacy.

## Between VNETs

Azure Virtual Network Communication Between VNETs

Azure Virtual Network (VNet) peering allows you to connect two or more VNets within the same or different regions. This enables seamless communication between resources in different VNets, such as virtual machines, without routing traffic over the public internet.

**Key Benefits of VNet Peering:**

- **Private Connectivity:** Traffic between peered VNets traverses Microsoft's private backbone network, ensuring high security and performance.

- **Simplified Network Architecture:** Reduces the need for complex network configurations and reduces latency.

- **Enhanced Scalability:** Easily scale your network by adding or removing VNets as needed.

- **Disaster Recovery:** Implement robust disaster recovery strategies by replicating workloads across different regions.

**Types of VNet Peering:**

- **VNet Peering:** Connects VNets within the same region.

- **Global VNet Peering:** Connects VNets across different regions.

**How VNet Peering Works:**

1.  **Create a Peering Connection:** Establish a peering connection between the two VNets.

2.  **Configure Peering Settings:** Specify the allowed traffic directions and any necessary security settings.

3.  **Route Traffic:** Microsoft's network automatically routes traffic between the peered VNets.

**Additional Considerations:**

- **Network Security Groups (NSGs):** Use NSGs to control traffic flow between peered VNets.

- **User-Defined Routes (UDRs):** For more complex routing scenarios, you can use UDRs to override default routing behavior.

- **Virtual Network Service Endpoints:** Securely connect your VNets to Azure services like Storage, SQL Database, and Cosmos DB.

By leveraging VNet peering, you can create highly scalable, secure, and reliable network architectures in Azure.

## With internet

**Azure Virtual Network (VNET) Communication with the Internet**

**Default Behaviour:**

- All resources within a VNET can, by default, communicate with the internet.

**Communicating to Resources from the Internet:** To enable internet-facing access to resources within a VNET, you can use:

1.  **Public IP Address:**

    - Assign a public IP address directly to a virtual machine or other network interface.

    - This allows direct internet access to the specific resource.

2.  **Public Load Balancer:**

    - Create a load balancer with a public IP address.

    - Configure load balancer rules to distribute incoming internet traffic to multiple virtual machines.

    - This provides a more scalable and reliable way to expose services to the internet.

 

# Public IP addresses

Public IP addresses in Azure serve as a bridge between your Azure resources and the internet. They enable:

- **Inbound Communication:** Internet resources can communicate with your Azure resources.

- **Outbound Communication:** Your Azure resources can communicate with the internet and other public Azure services.

**Key Points:**

- **SKUs:**

  - **Basic:**

    - Can be static or dynamic.

    - Optional network security group (NSG) for traffic control.

    - No availability zone support.

  - **Standard:**

    - Must be static.

    - Requires NSG for traffic control.

    - Zone-redundant by default for high availability.

- **Types:**

  - **Dynamic:** IP address changes after resource restarts or deallocations.

  - **Static:** IP address remains constant, ensuring consistent connectivity.

**Choosing the Right Public IP:**

- **Dynamic:** Suitable for scenarios where a consistent IP address is not critical, like temporary or internal-facing services.

- **Static:** Ideal for scenarios requiring a fixed IP address, such as public-facing websites, load balancers, or VPN gateways.

**In Summary:**

Public IP addresses are a fundamental component of Azure networking, providing the necessary connectivity between your Azure resources and the broader internet. By understanding the different SKUs and types, you can effectively choose the right IP address for your specific workload requirements.

## Public IP

- Public IP addresses enable Internet resources to communicate with Azure resources and enable Azure resources to communicate outbound with Internet and public-facing Azure services.

- There are 2 SKU’s when it comes to public IP address

**Basic SKU**

- Here you can assign either a static or dynamic IP address

- Network security groups can optionally be used to restricting traffic via the public IP address

- There is no support for availability zones

**Standard SKU**

- Here the IP address needs to be static IP address

- Network security groups need to be used to restrict traffic

- They are zone redundant by default

**Types of Public IP address**

- Dynamic Public IP

- Static Public IP

If you want to keep your public IP address unchanged even after restart or stopping your virtual machine, mark the IP address as static.

# Network Traffic

There are two main aspects of managing traffic in an Azure Virtual Network:

**Filtering:** This controls which traffic is allowed to flow between different parts of your network. You can achieve this with:

- **Network Security Groups (NSGs):** These are sets of rules that define what traffic (based on source, destination, port, and protocol) can enter or leave a subnet.

- **Network Virtual Appliances (NVAs):** These are virtualized security devices like firewalls, gateways, and NAT services that provide more advanced filtering capabilities.

**Routing:** This determines how traffic is directed to its destination within the network. By default, Azure handles routing between subnets, connected networks (both virtual and on-premises), and the internet. However, you can override these defaults with:

- **Route Tables:** These allow you to define custom routes for specific destinations.

- **Border Gateway Protocol (BGP):** This is a more complex routing protocol that enables advanced traffic management scenarios.

**In summary:**

- Use NSGs and NVAs for filtering traffic flow based on security needs.

- Let Azure handle basic routing by default, but use Route Tables or BGP for finer control over traffic paths.

## Azure User-Defined Routes (UDRs): A Summary

**What are UDRs?** User-Defined Routes (UDRs) are custom routes that you can configure within an Azure virtual network to override or supplement Azure's default routing behavior. This allows you to have granular control over how network traffic is routed within your virtual network.

**How do UDRs work?**

1.  **Create a Route Table:** You create a route table to store your UDRs.

2.  **Define UDRs:** Within the route table, you define UDRs, specifying:

    - **Address prefix:** The destination network address range.

    - **Next hop type:** The method used to reach the destination:

      - **Virtual Appliance:** Route traffic to a network appliance (e.g., firewall).

      - **Virtual Network Gateway:** Route traffic to an on-premises network via a VPN gateway.

      - **None:** Drop traffic destined for a specific address prefix.

      - **Virtual Network:** Route traffic within the virtual network itself.

      - **Internet:** Route traffic to the internet.

    - **Next hop IP address:** The IP address of the next hop (if applicable).

3.  **Associate Route Table with Subnets:** You associate the route table with specific subnets in your virtual network.

**Key Considerations:**

- **Priority:** UDRs have higher priority than default routes.

- **Next Hop Limitations:** You cannot use virtual network peering or service endpoints as next hop types.

- **Service Tags:** You can use service tags as address prefixes to simplify route management.

- **Limits:** There are limits on the number of UDRs per route table and subscription.

**Planning and Implementing UDRs:**

1.  **Define Traffic Flow:** Understand your network's traffic flow requirements.

2.  **Identify Resources:** Determine the resources (appliances, gateways) needed.

3.  **Choose Next Hop Types:** Select the appropriate next hop type for each UDR.

4.  **Consider Service Tags:** Use service tags to simplify management.

5.  **Create Route Table:** Create a route table in the Azure portal.

6.  **Define UDRs:** Add UDRs to the route table.

7.  **Associate with Subnets:** Associate the route table with your desired subnets.

By effectively using UDRs, you can achieve precise control over network traffic within your Azure virtual network, enhancing security and optimizing application performance.

# VNET design for Azure AD Domain Services

**Designing a Secure VNET:**

- **Isolation:** Use dedicated subnets for managed domains and enforce strict rules with Network Security Groups (NSGs) and potentially Azure Firewall.

- **Hub and Spoke:** Consider a hub-and-spoke architecture for centralized network management.

- **Security Best Practices:** Conduct regular security assessments and implement efficient firewall policies.

**VNET Configuration for Optimal Performance:**

- **Dedicated VNET:** Create a separate VNET for Azure AD Domain Services.

- **Subnet Design:** Allocate specific subnets for managed domain controllers and workloads.

- **NSGs:** Restrict inbound and outbound traffic to the managed domain subnet.

- **DNS Configuration:** Point DNS servers to the managed domain's IP addresses.

- **VNET Peering (optional):** Connect the managed domain VNET with other VNETs, ensuring proper NSG rules.

- **Virtual Network Service Endpoints:** Restrict access to specific Azure services.

**Detailed VNET configuration:**

- **Dedicated Subnet:** Create a separate, isolated subnet for domain controllers with sufficient address space and highly restrictive NSG rules.

- **DNS Configuration:** Configure the VNET to use the managed domain controllers as DNS servers for internal and external clients, implementing failover mechanisms for high availability.

- **Network Security Groups:** Allow necessary traffic (LDAP, Kerberos, DNS) from authorized sources and outbound traffic for domain controller operations. Implement a "deny all" default policy.

- **VNET Peering (if required):** Establish peering with other VNETs, configure NSGs for both VNETs, and ensure proper routing.

**Additional Considerations:**

- **Security:** Follow best practices (strong passwords, MFA, patching), use Azure Firewall, and implement monitoring and logging.

- **Performance:** Ensure sufficient network bandwidth and low latency.

- **Disaster Recovery:** Implement redundancy and failover mechanisms.

**Remember:**

- Avoid overlapping VNET address spaces with your on-premises network.

- Consider security isolation and IP addressing limitations.

- Plan for potential connections with on-premises networks.

- Isolate administrative access if needed.

- Be aware of Azure services that create their own VNETs.

# Azure VNET and Security

**Azure VNET** is a fundamental networking building block in Azure, providing isolated and secure networks for your resources.

**VNET Security** can be enhanced through:

- **Network Security Groups (NSGs):** These filter network traffic to or from Azure resources. Rules are evaluated based on five-tuples (source/destination IP, port, protocol, and direction).

- **Application Security Groups (ASGs):** These group VMs within a VNet for simplified security rule management. However, they have limitations, such as being restricted to a single VNet.

- **VPN Gateways and ExpressRoute:** These secure connectivity between on-premises networks and Azure.

Key Points on NSG Rule Evaluation and Statefulness:

- NSGs are stateful, meaning they track established connections.

- Rules are evaluated based on five-tuples and priority.

- Inbound and outbound rules are necessary only for initiating traffic; the stateful nature handles return traffic.

Best Practices for ASG Usage:

- Group VMs logically based on security needs.

- Use service tags or other ASGs as source/destination in NSG rules for flexibility.

- Be aware of VNet restrictions when using ASGs.

# Implement VNET with AZ CLI

# VNET Traffic Encryption

Azure Virtual Network encryption is a feature of Azure Virtual Networks. Virtual network encryption allows you to seamlessly encrypt and decrypt traffic between Azure Virtual Machines by creating a DTLS tunnel.

## Requirements

<https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-encryption-overview#requirements>

## Enable Azure Firewall

## Enable DDoS Network Protection
