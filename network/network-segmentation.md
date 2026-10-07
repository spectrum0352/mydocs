## Segmentation

Network segmentation involves dividing a network into smaller, isolated segments to enhance security and performance.

It allows for granular control over traffic flow between segments.

Network segmentation is essential strategies for enhancing network security and resilience.

Benefits of Micro-segmentation

- **Reduced Attack Surface:** Isolating individual hosts or applications minimizes the potential damage from a successful attack.

- **Improved Security Posture:** By enforcing strict access controls between segments, organizations can strengthen their overall security posture.

- **Enhanced Visibility:** Micro-segmentation provides greater visibility into network traffic and behaviour.

- **Faster Incident Response:** Containing a breach to a specific segment accelerates response time.

<!-- -->

- **Local Traffic Optimization:** It is generally more efficient to keep network traffic within a local segment to reduce latency and improve performance. This can be achieved through network segmentation and proper device placement.

- **Traffic Engineering:** This involves analysing network traffic patterns and optimizing routes to maximize throughput and minimize congestion.

- **Load Balancing:** Distributing network traffic across multiple servers or links to improve performance and reliability.

Common Segmentation Methods

- **VLANs (Virtual Local Area Networks):** Create logical networks within a physical network, allowing for traffic isolation based on user, application, or other criteria.

- **Firewalls:** Control traffic flow between network segments, blocking unauthorized access.

- **SDN (Software-Defined Networking):** Provides programmatic control over network resources, enabling flexible and dynamic segmentation.

**By implementing network segmentation, organizations can:**

- Reduce the impact of security breaches

- Improve network performance

- Enhance network visibility and control

- Comply with regulatory requirements

**Subnet**

**How many bits do you need for a subnet size?**

The number of bits required for a subnet size depends on the number of hosts you need to accommodate in the subnet. The formula to calculate the number of bits is 2^b - 2 \>= n, where b is the number of bits and n is the number of hosts.

To find the minimum number of bits required for a subnet size, you can use the following steps:

- Determine the number of hosts you need to accommodate.

- Add 2 to that number (for network and broadcast addresses).

- Find the smallest power of 2 that is greater than or equal to the result from step 2.

- Subtract 2 from that power of 2 to get the number of bits required.

For example, if you need to accommodate 100 hosts, you would follow these steps:

- n = 100

- n + 2 = 102

- The smallest power of 2 greater than or equal to 102 is 128 (2^7).

- 128 - 2 = 126

Therefore, you would need 7 bits for a subnet size that can accommodate at least 100 hosts.

Please note that this calculation assumes you are using Classless Inter-Domain Routing (CIDR) notation, which allows for variable-length subnet masks (VLSM) and more efficient use of IP address space.

Network segmentation is a crucial security strategy in Azure cloud environments. It involves dividing your Azure virtual network into smaller, isolated sections to limit the blast radius of a security breach. Here's a breakdown of Azure cloud network segmentation strategies:

**Building a Segmentation Strategy:**

- **Identity First:** Always prioritize identity and access management (IAM) as the primary security perimeter. Utilize Azure role-based access control (RBAC) and managed identities to control access between network components.

- **Traffic Flow Classification:** Classify network traffic flows to identify potential firewall locations within your network. This helps design a defense-in-depth strategy across all network segments.

- **Segmentation with Least Privilege:** Segment your network based on security needs, starting with the principle of least privilege. Only allow communication between resources that genuinely require it.

**Segmentation Tools and Techniques:**

- **Azure Virtual Networks (VNets) and Subnets:** VNets create isolated networks within your Azure subscription. You can further segment VNets into subnets to group related resources.

- **Network Security Groups (NSGs):** NSGs act as firewalls at the subnet level, controlling inbound and outbound traffic to and from resources within the subnet.

- **Azure Firewall:** Azure Firewall is a cloud-native managed firewall service that enforces granular traffic policies across VNets, subscriptions, and the internet. It offers layer 3 to layer 7 filtering capabilities.

**Segmentation Patterns:**

- **Segmentation within a Workload:** This pattern uses a single VNet with subnets to segregate workloads. For instance, one subnet for web servers and another for databases. NSGs are configured to restrict communication between subnets and control internet access.

By implementing these strategies and tools, you can create a secure and well-segmented network environment in Azure that minimizes security risks and improves overall cloud security posture.

Network Segmentation

Network segmentation is an architectural approach that divides a network into multiple segments or subnets, each acting as its own small network. This allows network administrators to control the flow of traffic between subnets based on granular policies. Organizations use segmentation to improve monitoring, boost performance, localize technical issues and – most importantly – enhance security.

 

With network segmentation, network security personnel have a powerful tool with which to prevent unauthorized users, whether curious insiders or malicious attackers, from gaining access to valuable assets, such as customers’ personal information, corporate financial records and highly confidential intellectual property, the so-called “crown jewels” of the enterprise. Today, these assets are frequently found spread across hybrid and multi-cloud environments – public clouds, private clouds and software-defined networks (SDNs) – all of which need to be secured against attacks. To understand the security usage of network segmentation, it’s first necessary to consider the concept of trust in network security.

>  

Network Micro Segmentation Strategy

>  

Network segmentation is a concept of taking a large group of hosts and creating smaller groups of hosts that can communicate with each other without traversing a security control. The smaller groups of hosts each have defined security controls, and groups are independent of each other. Network micro-segmentation takes the smaller group of hosts by configuring controls around individual hosts. The goal of network micro segmentation is to provide more granular security and reduce an attackers capability to easily compromise an entire network. If an attacker is successful in compromising a host, he or she is limited to only the network segment on which the host resides. If the host resides in a micro-segment, then the attacker is restricted to only that host. This paper will discuss what network and network micro-segmentation is, where it applies, any additional layer of security including levels of complexity.

**Benefits of Micro segmentation**

Reduced attack surface: Micro segmentation provides visibility into the complete network environment without slowing development or innovation. Application developers can integrate security policy definition early in the development cycle and ensure that neither application deployments nor updates create new attack vectors. This is particularly important in the fast-moving world of DevOps.

Improve security with Network segmentation

- Isolating sensitive data, such as customer records or financial data, from the rest of the network.

- Separating guest and employee networks.

- Segmenting different types of devices, such as servers, workstations, and IoT devices.

- Creating a quarantine network for infected devices.

- Network segmentation can be implemented using a variety of technologies, such as firewalls, VLANs, and VPNs. The best approach for a particular organization will depend on its specific needs and requirements.

- The smaller groups of hosts each have defined security controls, and groups are independent of each other.

- Network micro-segmentation takes the smaller group of hosts by configuring controls around individual hosts.

- The goal of network micro segmentation is to provide more granular security and reduce an attacker’s capability to easily compromise an entire network.

- If an attacker is successful in compromising a host, he or she is limited to only the network segment on which the host resides.

- If the host resides in a micro-segment, then the attacker is restricted to only that host.

- Reduced attack surface: Micro segmentation provides visibility into the complete network environment without slowing development or innovation.

Network Segmentation

Network segmentation involves dividing a network into smaller, isolated segments to enhance security and performance. It allows for granular control over traffic flow between segments.

**Network Micro-segmentation:** A more granular approach, micro-segmentation divides a network into even smaller segments, often down to individual hosts or applications. This provides a higher level of security by limiting the potential impact of a breach.

**Benefits of Micro-segmentation**

- **Reduced Attack Surface:** Isolating individual hosts or applications minimizes the potential damage from a successful attack.

- **Improved Security Posture:** By enforcing strict access controls between segments, organizations can strengthen their overall security posture.

- **Enhanced Visibility:** Micro-segmentation provides greater visibility into network traffic and behaviour.

- **Faster Incident Response:** Containing a breach to a specific segment accelerates response time.

In essence, network segmentation and micro-segmentation are essential strategies for enhancing network security and resilience in today's threat landscape.

Network Segmentation

Network segmentation is the process of dividing a computer network into smaller subnetworks. This can be done for a variety of reasons, including performance, security, and compliance.

Here are some of the benefits of network segmentation:

- **Improved security:** Segmenting a network can help to improve security by <span class="mark">limiting the damage</span> that can be <span class="mark">caused</span> <span class="mark">by a successful cyberattack</span>. *If an attacker is able to breach one segment of the network, they will be unable to access other segments unless they are able to compromise the security controls between the segments*. This can help to <span class="mark">contain</span> the <span class="mark">attack</span> and <span class="mark">minimize the impact on the overall network</span>.

- **Reduced attack surface**: Segmenting a network also *reduces the attack surface*, *which is the total number of potential entry points for attackers*. This makes it more difficult for attackers to find and exploit vulnerabilities.

- **Improved compliance**: Network segmentation can <span class="mark">help organizations to comply with various regulations</span>, such as PCI DSS and HIPAA. These regulations often require organizations to *isolate sensitive data from other parts of the network*.

- **Improved performance**: Network segmentation can also <span class="mark">improve network performance by reducing traffic congestion</span>. When a <u>network is segmented, traffic is directed only to the segments that need</u> it. This can help to free up resources on the network and improve overall performance.

- **Improve network visibility and manageability:** By segmenting a network, organizations can more <span class="mark">easily monitor traffic and identify potential problems</span>. They can also more easily deploy and manage security controls on a per-segment.

- **Control flow of network traffic**

**How network segmentation can be used to improve security?**

- Isolating sensitive data, such as customer records or financial data, from the rest of the network.

- Separating guest and employee networks.

- Segmenting different types of devices, such as servers, workstations, and IoT devices.

- Creating a quarantine network for infected devices.

- Network segmentation can be implemented using a variety of technologies, such as firewalls, VLANs, and VPNs. The best approach for a particular organization will depend on its specific needs and requirements.

<!-- -->

- The smaller groups of hosts each have defined security controls, and groups are independent of each other.

- Network micro-segmentation takes the smaller group of hosts by configuring controls around individual hosts.

- The goal of network micro segmentation is to provide more granular security and reduce an attackers capability to easily compromise an entire network.

- If an attacker is successful in compromising a host, he or she is limited to only the network segment on which the host resides.

- If the host resides in a micro-segment, then the attacker is restricted to only that host.

- Reduced attack surface: Micro segmentation provides visibility into the complete network environment without slowing development or innovation.

<!-- -->

- Network segmentation is the process of dividing a computer network into smaller subnetworks.

- Network segmentation can be done for a variety of reasons, including performance, security, and compliance.

- Network segmentation <span class="mark">improves security by limiting the damage</span> that can be caused by a successful cyberattack. If an attacker can breach one segment of the network, they will be unable to access other segments unless they are able to compromise the security controls between the segments. This can help to contain the attack and minimize the impact on the overall network.

<!-- -->

- Network segmentation <span class="mark">reduces attack surface, which is the total number of potential entry points for attackers.</span> This makes it more difficult for attackers to find and exploit vulnerabilities.

- Network segmentation <span class="mark">improves compliance with regulations</span> such as ISO 27001, PCI DSS and HIPAA. These regulations often require organizations to isolate sensitive data from other parts of the network.

- Network segmentation <span class="mark">improves network performance by reducing traffic congestion</span>. When a network is segmented, traffic is directed only to the segments that need it. This can help to free up resources on the network and improve overall performance.

- Network segmentation improves network visibility and management, we can <span class="mark">easily monitor traffic and identify potential problems</span>. They can also more easily deploy and manage security controls on a per-segment.

## Network Segmentation

**Azure Network Segmentation** involves dividing a virtual network into smaller isolated segments, known as subnets, to enhance security and control traffic flow.

Key Components

- **Virtual Networks (VNETs):** Logical isolation of network resources.
- **Subnets:** Divisions within a VNET for further segmentation.
- **Network Security Groups (NSGs):** Act as firewalls, controlling inbound and outbound traffic.
- **Application Security Groups (ASGs):** Group virtual machines based on application logic for simplified security policy management.

Core Concepts

- **Isolation:** Segmenting high-value resources into isolated VNETs and subnets.
- **Access control:** Using NSGs to define granular network security policies.
- **Security groups:** Simplifying security management with ASGs.
- **Default denies:** Implementing a "deny by default" principle for enhanced security.

In essence, Azure Network Segmentation provides a robust framework for protecting resources and controlling network traffic by creating isolated segments and implementing granular security policies.

## Azure Policies for network segmentation

- All Internet traffic should be routed via your deployed Azure Firewall
- Adaptive network hardening recommendations should be applied on internet facing virtual machines
- All network ports should be restricted on network security groups associated to your virtual machine
- Internet-facing virtual machines should be protected with Network Security Groups
- IP Forwarding on your virtual machine should be disabled
- Management ports of virtual machines should be protected with just-in-time network access control
- Management ports should be closed on your virtual machines
- Non-internet-facing virtual machines should be protected with network security groups
- Subnets should be associated with a Network Security Group

VNet concepts and best practices: <https://docs.microsoft.com/azure/virtual-network/concepts-and-best-practices>
Subnet: <https://docs.microsoft.com/azure/virtual-network/virtual-network-manage-subnet>
NSG: <https://docs.microsoft.com/azure/virtual-network/tutorial-filter-network-traffic>
ASG: <https://docs.microsoft.com/azure/virtual-network/network-security-groups-overview#application-security-groups>

Security architecture: <https://docs.microsoft.com/azure/cloud-adoption-framework/organize/cloud-security-architecture>