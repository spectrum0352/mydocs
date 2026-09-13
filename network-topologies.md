
# Topologies

- **Bus topology** all devices are connected to a single cable, it is easy to implement and maintain, but it is not very scalable or reliable.

- **Star topology**: This topology is more scalable and reliable than a bus topology, as all devices are connected to a central hub or switch. This makes it easier to isolate and troubleshoot problems.

- **Ring topology:** In a ring topology, devices are connected in a loop, with each device connected to the next. This topology is more reliable than a bus topology, as there is no single point of failure. However, it can be more difficult to troubleshoot problems.

- **Mesh topology:** In a mesh topology, all devices are connected to each other. This topology is very reliable and scalable, but it is also the most complex and expensive to implement and maintain.

- **Hybrid topology:** This topology is a combination of two or more other topologies. For example, a network might use a star topology for the core network and a bus topology for the edge of the network.

- **Bus topology** all devices are connected to a single cable, it is easy to implement and maintain, but it is not very scalable or reliable.

- Bus topology: Devices are connected to a single shared cable.

- Hybrid topology: A combination of different topologies.

- **Hybrid topology:** This topology is a combination of two or more other topologies. For example, a network might use a star topology for the core network and a bus topology for the edge of the network.

- Mesh topology: Devices are interconnected with multiple redundant paths, providing fault tolerance.

- **Mesh topology:** In a mesh topology, all devices are connected to each other. This topology is very reliable and scalable, but it is also the most complex and expensive to implement and maintain.

- Ring topology: Devices are connected in a circular loop.

- **Ring topology:** In a ring topology, devices are connected in a loop, with each device connected to the next. This topology is more reliable than a bus topology, as there is no single point of failure. However, it can be more difficult to troubleshoot problems.

- Star topology: Devices are connected to a central hub or switch.

- **Star topology**: This topology is more scalable and reliable than a bus topology, as all devices are connected to a central hub or switch. This makes it easier to isolate and troubleshoot problems.

For large enterprises, the most suitable topology is a hybrid approach.

While the **star topology** offers advantages in terms of management and scalability, it is often combined with other topologies to address specific needs.

Why Hybrid Topology?

- **Scalability:** A hybrid topology can accommodate growth by incorporating multiple topologies (star, ring, bus) in different network segments.  

- **Reliability:** Combining different topologies can provide redundancy and fault tolerance.  

- **Flexibility:** Adapts to changing network requirements and technologies.

Common Hybrid Configurations

- **Star-Bus:** A central hub connects multiple bus networks.

- **Star-Ring:** A central hub connects multiple ring networks.

In practice, modern enterprise networks often leverage a combination of these topologies along with advanced technologies like:

- **Software-Defined Networking (SDN):** Provides centralized control and programmability.  

- **Virtualization:** Creates logical networks (VLANs) within a physical network.

By carefully considering factors like network size, traffic patterns, security requirements, and budget, organizations can design a hybrid topology that best suits their needs.

Practical Network Topologies used in Enterprises

In practice, enterprise networks typically use a combination of these topologies to create a **hybrid network.**

Example:

- Network might use a star topology for the core network, with each switch connected to a central router.

- The edge of the network might use a bus or ring topology to connect devices to the switches.

**Three-tier network:**

- This topology is commonly used in large enterprises.

- It consists of three layers: core, distribution, and access.

- The <span class="mark">core layer provides high-speed connectivity between the distribution layer switches</span>.

- The <span class="mark">distribution layer switches provide connectivity to the access layer switches</span>, which <span class="mark">connect to the end devices</span>.

**Spine-and-leaf network:**

- This topology is like a three-tier network, but it uses a leaf-and-spine architecture for the core layer.

- This provides more flexibility and scalability.

**Cloud-based networking:**

- This topology is becoming increasingly popular in enterprise networks.

- It uses cloud-based services to provide network connectivity and services.

- This can reduce the complexity and cost of managing the network.

**Hub-spoke topology:**

- In this topology, all spoke networks are connected to a central hub network.

- The hub network provides connectivity to the Internet, other networks, and shared services.

- The spoke networks contain individual workloads or applications.

Network Structure: This refers to the physical or logical arrangement of devices and connections in a network, such as:

In practice, enterprise networks typically use a combination of these topologies to create a hybrid network. For example, a network might use a star topology for the core network, with each switch connected to a central router. The edge of the network might use a bus or ring topology to connect devices to the switches.

- **Three-tier network:** This topology is commonly used in large enterprises. It consists of three layers: core, distribution, and access. The <span class="mark">core layer provides high-speed connectivity between the distribution layer switches</span>. The <span class="mark">distribution layer switches provide connectivity to the access layer switches</span>, which <span class="mark">connect to the end devices</span>.

- **Spine-and-leaf network:** This topology is similar to a three-tier network, but it uses a leaf-and-spine architecture for the core layer. This provides more flexibility and scalability.

- **Cloud-based networking:** This topology is becoming increasingly popular in enterprise networks. It uses cloud-based services to provide network connectivity and services. This can reduce the complexity and cost of managing the network.

- **Hub-spoke topology:** In this topology, all spoke networks are connected to a central hub network. The hub network provides connectivity to the Internet, other networks, and shared services. The spoke networks contain individual workloads or applications.

>  

 

>  

# Hub-Spoke

A hub-spoke network topology is a way to organize your Azure virtual networks (VNETs) for efficient management and security.

**Benefits:**

- **Security:**

  - Separates critical resources from the public internet.

  - Enables implementing the principle of least privilege.

  - Centralized location for security policies.

- **Scalability:**

  - Easily add new workloads by creating new spokes.

  - Accommodate large workloads by using multiple subscriptions.

- **Cost-effective:**

  - Share resources like DNS servers across networks.

  - Avoid redundant resources.

**Components:**

- **Hub:** Central network zone that controls traffic flow and houses shared services like DNS and firewalls.

- **Spokes:** Isolated VNETs that contain individual workloads.

**Hub-spoke designs:**

- **VNET Hub:** Suitable for most scenarios, supports communication, shared resources, and security policies.

- **Virtual WAN:** Designed for large-scale branch-to-branch and branch-to-Azure communication.

**Hub-spoke topology**

**Hub-spoke topology** is a network architecture where multiple spoke networks connect to a central hub network.

This design offers several advantages:

- **Centralized Management:** The hub acts as a central point for managing security policies, routing, and network services.

- **Improved Security:** By isolating workloads in separate spoke networks, potential security breaches are contained within those segments.

- **Scalability:** New spokes can be added as needed without affecting the overall network architecture.

- **Cost Efficiency:** Shared services like firewalls and DNS can be in the hub, reducing redundancy.

**Key benefits include:**

- Enhanced security through segregation

- Improved manageability due to centralized control

- Scalability to accommodate growth

- Cost savings through shared services

This topology is commonly used in cloud environments to provide a secure and efficient network infrastructure.


## Network Topologies (how devices are arranged)

- **Bus:** All devices are connected to a single central cable. Simple but can be slow and prone to failure if a cable breaks.

- **Star:** Devices connect to a central hub or switch. More common, offering better performance and easier troubleshooting.

- **Mesh:** Devices connect to each other dynamically, creating a web-like structure. Offers redundancy and flexibility, but can be more complex to manage.

## Network Devices:

- **Routers:** Direct data packets across different networks, like directing traffic on a highway.

- **Switches:** Connect devices within a network segment, learning the MAC addresses of devices to send data efficiently.

- **Hubs:** (Less common now) Basic devices that simply broadcast all data received to all connected devices.

Additional points:

- **Network Security:** Protecting the network from unauthorized access, data breaches, and malicious attacks is crucial. Firewalls, encryption, and user authentication are essential security measures.

- **Network Performance:** Factors like bandwidth (data transfer rate), latency (delay), and network congestion can impact user experience. Network optimization techniques are used to improve performance.

This is a foundation of computer networking. As you delve deeper, you will encounter more advanced concepts like network addressing, subnetting, network administration, and different network protocols for specific purposes.

**Hub-spoke topology**

- In this hub and spoke are deployed in separate VNETs connected through peering.

- Segregated management: enables us to apply governance and principle of least privilege. It supports concept of Azure Landing Zone with separation of duties.

- Minimizes direct exposure of Azure resources to the public internet.

- Organizations often operate with regional hub-spoke topologies. Hub-spoke network topologies can be expanded in the future and provide workload isolation.

- It makes the architecture extensible. To accommodate new features or workloads, new spokes can be added instead of redesigning the network topology.

- Azure firewall and DNS can be shared across networks through hub-spoke topology

