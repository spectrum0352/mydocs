# Introduction

A firewall is a network security device that acts as a barrier between trusted and untrusted networks. It monitors and controls incoming and outgoing network traffic based on predefined security rules. By inspecting each data packet, firewalls determine whether to allow or block it based on factors like IP addresses, port numbers, and traffic type.

## What is a Firewall?

A firewall is essentially a security system that acts as a barrier between a trusted internal network and an untrusted external network, typically the internet. It monitors incoming and outgoing network traffic and allows or blocks data packets based on predefined security rules.  

**How Firewalls Work in TCP/IP Networks**

In the context of TCP/IP networks, a firewall operates at different layers of the OSI model, depending on its type:

- **Packet filtering firewalls:** These operate at the network layer (Layer 3) and examine packet headers (source/destination IP addresses, ports) to decide whether to allow or block traffic.
- **Stateful inspection firewalls:** An enhancement over packet filtering, these keep track of network connections (session state) to make more informed decisions.  

- **Application-level firewalls:** They operate at the application layer (Layer 7) and can inspect the content of data packets, providing deeper protection against sophisticated threats.  

**Role of Firewalls in Network Security**

Firewalls play a crucial role in safeguarding network security by:

- **Preventing unauthorized access:** They act as a first line of defense, blocking intruders from entering the network.  

- **Protecting against attacks:** Firewalls can help prevent a variety of attacks, including:

- Denial-of-service (DoS) attacks
- Malware infections
- Unauthorized access attempts
- Data breaches

- **Enforcing security policies:** They can be configured to implement specific security policies, such as restricting access to certain websites or services.  

- **Monitoring network traffic:** Firewalls can log network activity, which can be used for troubleshooting, security analysis, and compliance purposes.  

**Additional Considerations**

- **Types of Firewalls:** There are various types of firewalls, including hardware, software, and cloud-based solutions, each with its own strengths and weaknesses.  

- **Firewall configuration:** Proper configuration is essential for effective firewall protection. Misconfigured firewalls can leave vulnerabilities.  

- **Firewall limitations:** While firewalls are essential, they are not foolproof. They should be used in conjunction with other security measures for comprehensive protection.  

**In conclusion,** firewalls are a fundamental component of network security. By understanding their principles and proper implementation, organizations can significantly enhance their protection against cyber threats.  

**What is a Firewall?**

- A security device that inspects network traffic

- Protects networks from unauthorized access and malicious threats

**Azure Firewall Summary**

- **Centralized management:** Allows for easy policy enforcement and logging across multiple environments.

- **Cloud-based network security service:** Protects Azure Virtual Network resources.

- **Default traffic blocking:** Requires explicit rules to allow traffic.

- **East-west and north-south traffic inspection:** Monitors both internal and external network traffic.

- **Fully stateful firewall:** Provides granular control over network traffic.

- **High availability and scalability:** Offers reliable and flexible performance.

- **Integrated with Azure Monitor:** Provides comprehensive logging and analytics capabilities.

- **Managed service:** Azure handles the underlying infrastructure.

- **Route table configuration:** Necessary to route all traffic through Azure Firewall.

- **Standard and Premium SKUs:** Offers different performance and feature levels.

- **Static public IP address:** Enables external firewalls to identify traffic from your virtual network.

- **Virtual network requirement:** Requires a dedicated subnet named "AzureFirewallSubnet."

- To route all traffic via Azure Firewall, create routes in route table

Benefits

Firewalls are essential network security tools that provide a crucial first line of defense against cyberattacks. They offer a range of benefits, including:

- Enhanced Security:

  - Protection against unauthorized access and cyberattacks.

  - Prevention of data breaches and loss of sensitive information.

  - Blocking of malicious traffic (viruses, malware, ransomware).

- Improved Network Performance:

  - Filtering of unwanted traffic to reduce congestion.

  - Optimization of network speed and responsiveness.

- Compliance Adherence:

  - Assistance in meeting industry regulations and standards (e.g., HIPAA, PCI DSS).

  - Demonstration of commitment to data protection.

- Additional Benefits:

  - Increased privacy by protecting personal information.

  - Application control to restrict access to specific applications.

  - Intrusion detection to identify and block suspicious activity.

  - Network segmentation to create secure network zones.

Key Functions:

- Protection: Preventing unauthorized network access.

- Traffic Control: Monitoring and filtering network traffic based on rules.

- Network Segmentation: Dividing networks into secure zones.

Key Points:

- Firewalls operate at different network layers (Network, Transport, Application).

- Rule sets can be customized for specific security needs.

- Regular updates and maintenance are crucial for optimal performance.

- Firewalls improve security posture, enhance threat detection, and reduce administrative burden.

- While crucial, firewalls are not foolproof; comprehensive security requires additional measures.

Importance:

- Essential for network security.

- Provides a first line of defense.

- Requires proper configuration for optimal effectiveness.

## How Does a Firewall Work?

1.  **Packet Inspection:** Examines each data packet for information like:

    - Source and destination IP addresses

    - Port numbers

    - Protocol type

    - Content type

2.  **Rule-Based Decision:** Compares packet information to a set of pre-defined rules

3.  **Allow or Block:**

    - Allows benign traffic to pass through

    - Blocks malicious or unauthorized traffic

## Best Practices

<table>
<colgroup>
<col style="width: 8%" />
<col style="width: 31%" />
<col style="width: 60%" />
</colgroup>
<thead>
<tr>
<th>Category</th>
<th>Best Practice</th>
<th>Summary/Importance</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="3">I. Core Security Fundamentals</td>
</tr>
<tr>
<td></td>
<td>Default Deny</td>
<td>Block all traffic by default, allowing only explicitly permitted connections. Minimizes the attack surface.</td>
</tr>
<tr>
<td></td>
<td>Least Privilege</td>
<td>Grant only necessary permissions to users and applications. Limits potential damage from compromised accounts.</td>
</tr>
<tr>
<td></td>
<td>Specificity</td>
<td>Create precise firewall rules (source, destination, port, protocol). Reduces unintended access and improves control.</td>
</tr>
<tr>
<td></td>
<td>Regular Updates</td>
<td>Keep firewall software, firmware, and rules up-to-date. Patches vulnerabilities and protects against new threats.</td>
</tr>
<tr>
<td></td>
<td>Explicit Deny Rule</td>
<td>Implement an "any-any-any deny" rule at the end of rule sets. Acts as a final safety net, blocking any unallowed traffic.</td>
</tr>
<tr>
<td colspan="3">II. Network Architecture and Segmentation</td>
</tr>
<tr>
<td></td>
<td>Dedicated Firewall Server</td>
<td>Use a separate server for the firewall. Enhances security by isolating the firewall.</td>
</tr>
<tr>
<td></td>
<td>Network Segmentation</td>
<td>Divide the network into isolated segments (DMZ, internal, etc.). Limits the spread of attacks.</td>
</tr>
<tr>
<td></td>
<td>Traffic Restriction</td>
<td>Block spoofed IP addresses, loose/strict source routing. Prevents common attack vectors.</td>
</tr>
<tr>
<td></td>
<td>Internal Network Isolation (NAT/PAT)</td>
<td>Hide internal IP addresses using NAT/PAT (IP masquerading). Protects internal network details.</td>
</tr>
<tr>
<td></td>
<td>DMZ Protection</td>
<td>Use two firewalls for web servers in a DMZ. Adds an extra layer of security.</td>
</tr>
<tr>
<td></td>
<td>Isolate Sensitive Services</td>
<td>Place services like FTP servers in dedicated subnets. Limits exposure of sensitive services.</td>
</tr>
<tr>
<td colspan="3">III. Monitoring, Management, and Logging</td>
</tr>
<tr>
<td></td>
<td>Logging and Monitoring</td>
<td>Record firewall activity and monitor for anomalies. Enables incident response and analysis.</td>
</tr>
<tr>
<td></td>
<td>Rule Optimization</td>
<td>Regularly review and update firewall rules. Maintains effectiveness and removes unnecessary rules.</td>
</tr>
<tr>
<td></td>
<td>User Management (RBAC)</td>
<td>Control access to firewall configuration using Role-Based Access Control. Prevents unauthorized changes.</td>
</tr>
<tr>
<td></td>
<td>Backup and Recovery</td>
<td>Implement regular backups of firewall configurations. Enables quick recovery after failures.</td>
</tr>
<tr>
<td></td>
<td>Centralized Management</td>
<td>Use a single system to manage multiple firewalls. Improves efficiency and consistency.</td>
</tr>
<tr>
<td></td>
<td>Documentation</td>
<td>Maintain clear records of firewall settings. Facilitates understanding and troubleshooting.</td>
</tr>
<tr>
<td></td>
<td>Disaster Recovery</td>
<td>Have a plan to restore firewall configurations. Ensures business continuity.</td>
</tr>
<tr>
<td></td>
<td>Log Review</td>
<td>Regularly examine firewall logs for security breaches. Proactive identification of attacks.</td>
</tr>
<tr>
<td></td>
<td>Reporting Tools</td>
<td>Use tools to analyze logs and optimize rules. Provides insights and trends.</td>
</tr>
<tr>
<td></td>
<td>Anomaly Detection</td>
<td>Monitor for unusual traffic patterns and unauthorized changes. Early detection of suspicious activity.</td>
</tr>
<tr>
<td colspan="3">IV. Advanced Security Measures</td>
</tr>
<tr>
<td></td>
<td>Application Control</td>
<td>Restrict which applications can run on the network. Prevents malware and unauthorized software.</td>
</tr>
<tr>
<td></td>
<td>Intrusion Detection/Prevention Systems (IDPS)</td>
<td>Monitor for and block malicious traffic. Adds proactive threat protection.</td>
</tr>
<tr>
<td></td>
<td>Web Content Filtering</td>
<td>Block access to harmful websites. Protects against web-based threats.</td>
</tr>
<tr>
<td></td>
<td>Virtual Private Network (VPN)</td>
<td>Encrypt traffic between remote users and the network. Secures remote access.</td>
</tr>
<tr>
<td></td>
<td>Cloud Firewall</td>
<td>Protect cloud environments. Secures cloud-based resources.</td>
</tr>
<tr>
<td></td>
<td>VM/Hypervisor/IoT Firewalls</td>
<td>Protect virtual machines, hypervisors, and IoT devices. Addresses specific security needs.</td>
</tr>
<tr>
<td></td>
<td>Automated Alerts</td>
<td>Configure notifications for intrusions and failures. Enables rapid response.</td>
</tr>
<tr>
<td></td>
<td>URL Filtering</td>
<td>Block access to malicious URLs. Protects against web-based threats.</td>
</tr>
<tr>
<td></td>
<td>Stateful Inspection</td>
<td>Monitor connection states for suspicious activity. Enhances threat detection.</td>
</tr>
<tr>
<td></td>
<td>Stealth Firewall</td>
<td>Hide firewall presence. Makes it harder for attackers to target.</td>
</tr>
<tr>
<td></td>
<td>Third-Party Integration (Identity Management)</td>
<td>Use identity management systems for enhanced control. Centralized access management.</td>
</tr>
<tr>
<td></td>
<td>Application-Level Firewall Best Practices</td>
<td>Restrict SMTP and FTP commands, filter web content, and enforce strong authentication. Protects against application level attacks.</td>
</tr>
<tr>
<td colspan="3">V. Scalability and Reliability</td>
</tr>
<tr>
<td></td>
<td>Scalability (Load Balancing, Virtualization, Cloud)</td>
<td>Plan for future network growth and implement scalable solutions. Ensures performance and availability.</td>
</tr>
<tr>
<td></td>
<td>Reliability (Redundancy)</td>
<td>Implement redundant firewalls for high availability. Prevents single points of failure.</td>
</tr>
<tr>
<td></td>
<td>Consistent Policy Enforcement &amp; Secure Policy Distribution</td>
<td>Security policies must be the same across all firewalls. Use encryption and authentication when distributing firewall rules.</td>
</tr>
<tr>
<td colspan="3">VI. Endpoint and Network Security</td>
</tr>
<tr>
<td></td>
<td>Endpoint Security (Laptops)</td>
<td>Secure laptops with personal firewalls and user training. Protects mobile devices.</td>
</tr>
<tr>
<td></td>
<td>Mail Traffic Control</td>
<td>Implement strict rules for incoming and outgoing mail. Prevents mail-based attacks.</td>
</tr>
<tr>
<td></td>
<td>Modem Elimination</td>
<td>Remove unauthorized modems. Prevents backdoor access.</td>
</tr>
<tr>
<td></td>
<td>ICMP Management</td>
<td>Carefully control ICMP traffic. Prevents ICMP-based attacks.</td>
</tr>
<tr>
<td></td>
<td>DNS Zone Transfers (Restrict)</td>
<td>Restrict DNS zone transfers to authorized sources. Protects DNS information.</td>
</tr>
<tr>
<td colspan="3">VII. Firewall Configuration and Management</td>
</tr>
<tr>
<td></td>
<td>Restrict Ports</td>
<td>Only allow necessary ports. Reduces the attack surface.</td>
</tr>
<tr>
<td></td>
<td>Secure Remote Access (SSH)</td>
<td>Use SSH instead of Telnet. Encrypts remote access.</td>
</tr>
<tr>
<td></td>
<td>Eliminate Broad Permissions</td>
<td>Remove "accept all" rules. Improves control and security.</td>
</tr>
<tr>
<td></td>
<td>Rule Order (Prioritization)</td>
<td>Prioritize rules based on security and control. Ensures effective rule processing.</td>
</tr>
<tr>
<td></td>
<td>Tailored Rulesets</td>
<td>Create rulesets based on organizational needs. Customizes security.</td>
</tr>
<tr>
<td></td>
<td>Change Management (Structured Process)</td>
<td>Implement a structured process for firewall rule changes. Prevents errors and disruptions.</td>
</tr>
<tr>
<td></td>
<td>Automation (Rule Updates)</td>
<td>Use automation for rule updates. Improves efficiency and reduces errors.</td>
</tr>
<tr>
<td></td>
<td>Regular Maintenance (Rule Reviews)</td>
<td>Regularly review and update firewall rules. Keeps rules aligned with network needs.</td>
</tr>
<tr>
<td></td>
<td>Patches and Updates (Software/Firmware)</td>
<td>Maintain firewall software with the latest patches. Fixes vulnerabilities.</td>
</tr>
<tr>
<td></td>
<td>Closed Ports (Unused Ports)</td>
<td>Close unused ports. Reduces attack surface. Filtered ports still respond to scans.</td>
</tr>
<tr>
<td colspan="3">VIII. Vulnerability Assessment and Testing</td>
</tr>
<tr>
<td></td>
<td>Port Scanning (Nmap)</td>
<td>Regularly scan for open ports to identify and close unnecessary ones. Identifies potential vulnerabilities.</td>
</tr>
<tr>
<td></td>
<td>Ruleset Testing (After Changes)</td>
<td>Test firewall rulesets after changes to prevent service disruptions or security breaches. Ensures proper implementation.</td>
</tr>
</tbody>
</table>

# Design

## Firewall Design

- **Zoning:** Dividing the network into zones (internal, external, DMZ) based on trust levels. This is a fundamental design principle.

- **Architecture:**

  - Hub-and-spoke vs. distributed networks influence firewall placement.

  - Layered defense-in-depth: Using multiple firewalls for enhanced security.

- **Firewall Types:**

  - Perimeter firewalls

  - Internal firewalls

  - Application firewalls

  - Next-Generation Firewalls (NGFWs) - These have design implications due to their advanced features.

- **High Availability:** Design considerations for redundancy and failover (e.g., two firewalls in HA).

- **Capacity Planning:** Design must consider network size, traffic volume, and performance requirements.

## Firewall Types

| Category | Type | Description | Key Features | Use Cases |
|----|----|----|----|----|
| Deployment (Platform) | Hardware Firewall | Dedicated physical appliance. | High performance, robust security. | Medium to large enterprises, data centers. |
|  | Software Firewall | Software installed on operating systems. | Flexible, cost-effective. | Individual devices, small businesses, home networks. |
|  | Cloud Firewall (FWaaS) | Cloud-based security service. | Scalable, flexible, centralized management. | Distributed networks, remote workforces, cloud applications. |
| Functionality (Inspection) | Packet Filtering Firewall | Examines packet headers. | Basic security, rule-based. | Simple network security needs. |
|  | Stateful Inspection Firewall | Tracks connection states. | Improved security, context awareness. | Most modern network environments. |
|  | Circuit-Level Gateway | Monitors network sessions. | Session-level control. | Specific security protocols. |
|  | Application-Level Gateway (Proxy Firewall) | Inspects packet content. | Deep packet inspection, application control. | Advanced security, application-specific filtering. |
|  | Next-Generation Firewall (NGFW) | Combines multiple security functions. | Comprehensive threat protection, DPI, IPS, application control. | Modern networks requiring advanced security. |
| Network Function | NAT Firewall | Acts as intermediary between networks. | Hides internal IP addresses. | internal network protection. |
| Related Network Tools | Proxy Server | Intermediary for network services. | Caching, filtering, anonymity. | General network services. |
|  | SOCKS Proxy | Network protocol for secure connections. | secure connections through a proxy. | bypassing network restrictions. |

## Core Concepts and Requirements

- Purpose of Azure Firewall:

  - Centralized, cloud-native network security service.

  - Stateful packet inspection to protect Azure resources.

  - Acts as a network perimeter, controlling inbound and outbound traffic.

- Key Requirements Gathering:

  - Network Architecture Analysis:

    - Identify all Azure resources (VNets, subnets, VMs, databases, etc.).

    - Map traffic flow patterns (internal, external).

    - Pinpoint sensitive data locations.

  - Security Requirements:

    - Threat analysis (DDoS, malware, unauthorized access).

    - Compliance needs (PCI DSS, HIPAA).

    - Performance considerations (latency).

  - Firewall Selection Criteria:

    - Specific Security Needs: Alignment with organizational security goals.

    - Network Infrastructure: Compatibility with network topology and size.

    - Budgetary Constraints: Balancing cost and feature requirements.

    - Vendor Support: Reliable and responsive vendor support.

    - Core Functionality: L3-L4 filtering, stateful inspection, DPI, threat blocking.

    - Advanced Features: TLS inspection, DLP, advanced threat protection.

    - Operational Efficiency: Manageability, automation, scalability.

    - Security Posture: Policy alignment, visibility, emerging threat protection.

    - Administration: QoS, logging, identity integration, manageability, support.

    - Scalability: Ability to grow with the network's future needs.

    - Quality Support: Deep technical knowledge and 24/7/365 availability.

    - Regular Updates: Timely and frequent product updates.

## Azure Firewall Architecture Design

1.  Deployment Model:

    - Hub and Spoke: Recommended for most enterprise environments.

      - Azure Firewall deployed in a central hub VNet.

      - Spoke VNets connect to the hub via VNet peering.

      - Centralized security management.

    - Centralized: Suitable for simpler, single-VNet environments.

    - Regional: For redundancy and performance across multiple Azure regions.

2.  Azure Firewall Configuration:

    - Pricing Tier Selection: Standard or Premium, based on feature needs.

    - Network Interfaces: Attach the firewall to a dedicated subnet (AzureFirewallSubnet).

    - Public IP Addresses: Assign if required for outbound internet access.

3.  Network and Application Rules:

    - Network Rules (L3-L4):

      - Source and destination IP addresses/ranges.

      - Protocols and ports.

      - Allow or deny actions.

    - Application Rules (L7):

      - FQDNs (Fully Qualified Domain Names).

      - HTTP/HTTPS traffic control.

      - URL Filtering (Premium).

      - Web categories (Premium).

4.  Threat Intelligence and Advanced Features:

    - Threat Intelligence: Enable built-in threat feeds.

    - Azure Firewall Premium:

      - TLS inspection.

      - URL filtering.

      - Web categories.

      - IDPS.

5.  Azure Firewall Manager:

    - Centralized management of multiple Azure Firewalls.

    - Policy deployment across regions.

    - Route management.

6.  Monitoring and Logging:

    - Azure Monitor Integration: Logs and metrics for firewall activity.

    - Alerting: Configure alerts for security events.

    - Logging and Monitoring: Comprehensive logging for troubleshooting and security analysis.

7.  High Availability and Scalability:

    - Azure Firewall is inherently highly available.

    - Scales automatically with network traffic.

    - Multiple public IP addresses.

    - For High availability of your over all system, use the hub and spoke model, and utilize multiple firewalls in different regions.

8.  Number of Firewalls:

    - Depends on network size, complexity, and security policies.

    - High availability often requires two firewalls in an active-passive or active-active configuration.

    - Consider regional deployments for global presence.

## Implementation Steps

1.  Pre-Assessment:

    - Determine if Azure Firewall is suitable for your needs.

    - Evaluate if Azure Firewall Manager is required.

2.  Deployment:

    - Create the Azure Firewall and configure network settings.

    - Define network and application rules.

    - Enable threat intelligence.

3.  Testing and Optimization:

    - Simulate traffic to validate rules.

    - Monitor performance and adjust settings.

    - Regularly review and update firewall rules.

4.  Administration

    - QoS and Bandwidth Management.

    - Identity Management Integration.

    - Manageability: User-friendly interface, customizable features, and detailed reporting.

    - Price: Reasonable initial cost and total cost of ownership.

    - Support: Responsive, high-quality support with multiple channels.

    - Reliability: High availability, redundancy, and robust support.

    - Compliance: Adherence to industry regulations and standards.

## Small Environment Considerations

- For small businesses, a single Azure Firewall instance in a centralized VNet might suffice.

- Focus on core features: network rules, threat intelligence.

- Next-Generation Firewalls (NGFWs): Comprehensive security with advanced features.

- Packet Filtering Firewalls: Basic security through packet inspection.

- Ensure proper logging and monitoring for basic security visibility.

- Prioritize ease of management and cost-effectiveness.

By following this detailed architecture, you can design and implement a robust Azure Firewall solution tailored to your specific environment and security needs.

# Deployment

[Azure Firewall Deployment Tutorial](https://docs.microsoft.com/azure/firewall/tutorial-firewall-deploy-portal)

## Checklist

| Phase | Task | Sub-Task | Description | Considerations |
|----|----|----|----|----|
| Phase 1: Planning and Design | 1.1 Network Assessment | Identify Network Segments | Document network topology, subnets, and traffic flows. | Existing infrastructure, application dependencies. |
|  |  | Analyze Traffic Flows | Determine inbound/outbound traffic patterns and protocols. | Security policies, performance requirements. |
|  | 1.2 Security Requirements | Define Security Policies | Document security rules, compliance, and data sensitivity. | Regulatory requirements, data classification. |
|  |  | Threat Protection Level | Determine required level of threat intelligence and prevention. | Risk assessment, security posture. |
|  | 1.3 Azure Environment Planning | Region Selection | Choose appropriate Azure region(s). | Latency, compliance, and availability. |
|  |  | VNet Architecture | Design virtual network and subnets, including AzureFirewallSubnet. | IP addressing, network segmentation. |
|  |  | Availability Zones | Determine the need for high availability deployment. | Business continuity, fault tolerance. |
|  |  | Firewall SKU Selection | Choose Standard or Premium SKU based on features. | Feature requirements, budget. |
|  |  | Firewall Policies | Determine if policies will be used and if so, design the policy structure. | Centralized management, scalability. |
|  | 1.4 IP Addressing and Routing | IP Address Planning | Allocate IP ranges for subnets. | Avoid overlaps, future expansion. |
|  |  | Route Table Design | Configure route tables for traffic redirection to the firewall. | Default routes, UDRs. |
|  |  | DNS Resolution | Plan DNS resolution for internal and external resources. | Azure DNS, custom DNS servers. |
|  |  | Forced Tunnelling | Determine if forced tunnelling is required. | Security, compliance. |
| Phase 2: Deployment | 2.1 Resource Group Creation | Create Resource Group | Create a dedicated resource group for the firewall. | Resource management, access control. |
|  | 2.2 VNet and Subnet Configuration | VNet Creation | Create the virtual network according to the design. | IP address space, region. |
|  |  | AzureFirewallSubnet Configuration | Configure the required AzureFirewallSubnet. | Naming convention, size. |
|  | 2.3 Azure Firewall Deployment | Deploy Firewall Resource | Deploy the Azure Firewall instance. | SKU selection, public IP. |
|  |  | Associate with Subnet | Associate the firewall with the AzureFirewallSubnet. | Correct subnet association. |
|  |  | Public IP Allocation | Allocate a public IP address to the firewall. | Public access, DNAT. |
|  |  | Firewall Policy Assignment | Assign the created firewall policy to the firewall. | Centralized rule management. |
|  | 2.4 Route Table Configuration | Create Route Tables | Create route tables to direct traffic to the firewall. | Default routes, subnet association. |
|  |  | Associate with Subnets | Associate route tables with workload subnets. | Traffic redirection. |
|  | 2.5 DNS Configuration | Configure DNS Settings | Configure DNS settings for the virtual network. | Internal and external resolution. |
| Phase 3: Firewall Rule Configuration | 3.1 Network Rule Configuration | Define Network Rules | Configure rules based on IP addresses, ports, and protocols. | Least privilege, service tags. |
|  | 3.2 Application Rule Configuration | Define Application Rules | Configure rules based on FQDNs and protocols. | FQDN tags, application dependencies. |
|  | 3.3 NAT Rule Configuration | Configure DNAT Rules | Configure rules for inbound traffic redirection. | Port forwarding, security. |
|  |  | Configure SNAT Rules | Configure rules for outbound traffic translation. | Source IP translation. |
|  | 3.4 IP Group Configuration | Create IP Groups | Create and configure IP groups for easier rule management. | IP address management, rule simplification. |
|  | 3.5 Threat Intelligence Configuration | Enable Threat Intelligence | Enable and configure threat intelligence feeds. | Malicious traffic blocking. |
| Phase 4: Monitoring and Logging | 4.1 Logging Configuration | Enable Firewall Logs | Enable Azure Firewall logs for monitoring. | Log analytics workspace. |
|  |  | Configure Log Analytics | Configure log analytics workspace for log storage. | Retention policies, query capabilities. |
|  |  | Configure Diagnostic Settings | Configure diagnostic settings for log forwarding. | Log types, destinations. |
|  | 4.2 Monitoring Configuration | Configure Azure Monitor Alerts | Configure alerts for firewall events. | Thresholds, notification settings. |
|  |  | Create Dashboards | Create dashboards for firewall monitoring. | Performance metrics, security events. |
|  |  | Integrate with Azure Sentinel | Integrate with Azure Sentinel for security analysis. | SIEM integration, threat detection. |
|  | 4.3 Performance Monitoring | Monitor Performance | Monitor firewall throughput and latency. | Performance baselines, capacity planning. |
| Phase 5: Testing and Validation | 5.1 Connectivity Testing | Test Connectivity | Test connectivity to internal and external resources. | Network reachability, firewall rules. |
|  | 5.2 Rule Validation | Validate Firewall Rules | Verify that firewall rules are working as expected. | Allowed/denied traffic, rule precedence. |
|  | 5.3 Security Testing | Perform Vulnerability Scans | Conduct vulnerability scans and penetration testing. | Security posture, risk assessment. |
|  | 5.4 Log Analysis | Review Firewall Logs | Analyze logs for anomalies and security events. | Incident response, threat detection. |
| Phase 6: Ongoing Maintenance | 6.1 Rule Maintenance | Update Firewall Rules | Regularly review and update firewall rules. | Rule optimization, security updates. |
|  | 6.2 Software Updates | Keep Firewall Updated | Keep the Azure Firewall software updated. | Security patches, feature updates. |
|  | 6.3 Performance Monitoring | Continuously Monitor | Continuously monitor firewall performance. | Capacity planning, performance tuning. |
|  | 6.4 Security Audits | Conduct Security Audits | Conduct regular security audits of the firewall. | Compliance, security posture. |
|  | 6.5 Log Review | Regularly Review Logs | Regularly review firewall logs for security events. | Threat hunting, incident response. |

## Initial Configuration

1.  Planning and Assessment:

    - Asset Identification:

      - Identify critical systems, data, and applications.

      - Categorize assets based on sensitivity and importance.

    - Risk Assessment:

      - Determine potential threats (e.g., malware, unauthorized access, data breaches).

      - Analyze vulnerabilities that could be exploited.

      - Understand the potential impact of security breaches.

2.  Security Policy Definition:

    - Establish clear rules for allowed and blocked traffic.

    - Specify protocols and ports (e.g., HTTPS, SSH, RDP, SQL).

    - Define how different traffic types are handled (e.g., inspection, logging, blocking).

    - Align policies with organizational security standards and compliance requirements.

3.  Network Segmentation (Firewall Zones):

    - Create logical zones based on security requirements (e.g., internal, external, DMZ).

    - Isolate sensitive resources by placing them in separate zones.

    - Example Zones:

      - Internal Network: For trusted devices and servers.

      - External Network: For internet-facing resources.

      - DMZ (Demilitarized Zone): For public-facing servers that require limited access to internal networks.

4.  Firewall Rule Configuration:

    - Implement rules to control traffic flow between zones.

    - Use the principle of least privilege (allow only necessary traffic).

    - Be specific with rules (source/destination IP addresses, ports, protocols).

    - Examples:

      - Allow HTTPS traffic from the internet to a web server in the DMZ.

      - Block RDP access from the internet to internal servers.

      - Allow all traffic between internal subnets.

5.  Testing and Validation:

    - Conduct thorough testing before deploying the configuration in production.

    - Perform vulnerability scans and penetration testing.

    - Verify that legitimate traffic is allowed and malicious traffic is blocked.

    - Test failover and high availability scenarios.

6.  Basic Details Configuration:

    - Subscription Selection.

    - Resource Group Assignment.

    - Firewall Policy Naming and Regional Location.

    - Parent Policy Implementation.

7.  DNS Settings:

    - DNS Server Configuration:

      - Use Azure-provided DNS or configure custom DNS servers.

      - Ensure DNS resolution is reliable and secure.

    - DNS Proxy: Configure if needed for DNS traffic inspection.

    - Azure Firewall DNS settings: configure the firewall to act as a DNS proxy.

## Best Practices

- Default Deny Policy: Start with a policy that blocks all traffic and only allow necessary exceptions.

- Least Privilege: Grant only the minimum necessary permissions.

- Logging and Monitoring: Enable comprehensive logging to track traffic and identify security incidents.

- Regular Updates: Keep the firewall firmware and software up to date.

- Security Professional Consultation: Seek expert assistance if needed.

## Example Configuration (Hub-Spoke Model)

This example shows a common network architecture used in large enterprises.

- Scenario: A hub-spoke network with a central firewall in the hub virtual network.

- Components:

  - Hub Virtual Network (VNet-Hub):

    - Address space: 10.0.0.0/16

    - Subnet: AzureFirewallSubnet (10.0.0.0/24)

    - Resource Group: RG-Hub

    - Resource: Az-FW (Azure Firewall)

  - Spoke Virtual Network (VNet-Spoke):

    - Address space: 10.1.0.0/16

    - Subnet: devsubnet (10.1.0.0/24)

    - Resource Group: RG-Spoke

    - Resource: Az-VM (Virtual Machine)

- Firewall Rules (Example):

  - Allow outbound HTTPS (port 443) and HTTP (port 80) traffic from VNet-Spoke to the internet.

  - Allow inbound SSH (port 22) traffic from a specific administrator IP address to Az-VM.

  - Allow traffic between the hub and spoke networks.

  - Block all other inbound traffic from the internet.

  - DNS configuration: Use custom DNS servers located in the hub network, and enable DNS proxy.

  - Implement threat intelligence filtering on the firewall.

  - Configure Network address translation (NAT) rules as required.

- Implementation Notes:

  - Use User Defined Routes (UDRs) to route traffic from spoke VNets to the Azure Firewall in the hub VNet.

  - Implement Network Security Groups (NSGs) at the subnet level for granular traffic filtering.

  - Centralized logging of the firewall logs to a security information and event management (SIEM) system.

  - Implement Azure Firewall Manager for centralized management of multiple firewalls.

## Azure CLI

**Key Improvements and Explanations:**

1.  **Variables:** Using variables at the beginning of the script makes it easier to modify and maintain.

2.  **Resource Group and VNet Creation:** The script creates the resource groups and virtual networks with their respective subnets.

3.  **Public IP and Azure Firewall Creation:** It creates a public IP for the firewall and then deploys the Azure Firewall into the hub VNet's AzureFirewallSubnet.

4.  **Subnet and Public IP ID retrieval:** The script now retrieves the Subnet IDs and the Public IP ID using az network vnet subnet show and az network public-ip show and stores them in variables. This is crucial for linking resources.

5.  **Firewall Private IP Retrieval:** The script retrieves the private IP address of the firewall, which is needed for the route table.

6.  **VM Creation:** The script creates a virtual machine in the spoke VNet using the created network interface.

7.  **Route Table and Route Creation:** The script creates a route table and a route to direct traffic from the spoke VNet to the Azure Firewall's private IP.

8.  **Subnet Association:** The script associates the route table with the spoke VNet's subnet.

9.  **Password Handling:** **Important:** Replace "YourStrongPassword!" with a strong, secure password. For production environments, consider using Azure Key Vault to manage secrets.

10. **Username:** replace "azureuser" with your desired username.

**How to Run the Script:**

1.  **Azure CLI:** Ensure you have the Azure CLI installed and configured.

2.  **Login:** Log in to your Azure account using az login.

3.  **Save:** Save the script to a file (e.g., deploy_azfw.sh).

4.  **Permissions:** Make the script executable: chmod +x deploy_azfw.sh.

5.  **Run:** Execute the script: ./deploy_azfw.sh.

\#!/bin/bash

\# Define variables

LOCATION="centralindia"

RG_HUB="rghub"

RG_SPOKE="rgspoke"

VNET_HUB_NAME="VNET-Hub"

VNET_SPOKE_NAME="VNET-Spoke"

FW_SUBNET_NAME="AzureFirewallSubnet"

VM_SUBNET_NAME="Subnet-VM"

FW_PIP_NAME="azfw-pip"

FW_NAME="azfw"

VM_NIC_NAME="VM-NIC"

VM_NAME="VM-Win"

VM_SIZE="Standard_DS2_v2"

VM_IMAGE="MicrosoftWindowsServer:WindowsServer:2019-Datacenter:latest"

VM_USERNAME="azureuser" \# Replace with your desired username

VM_PASSWORD="YourStrongPassword!" \# Replace with a strong password

\# Create resource groups

az group create --name \$RG_HUB --location \$LOCATION

az group create --name \$RG_SPOKE --location \$LOCATION

\# Create hub virtual network and subnet

az network vnet create --resource-group \$RG_HUB --name \$VNET_HUB_NAME --address-prefixes 10.0.0.0/16 --subnet-name \$FW_SUBNET_NAME --subnet-prefixes 10.0.0.0/24

\# Create spoke virtual network and subnet

az network vnet create --resource-group \$RG_SPOKE --name \$VNET_SPOKE_NAME --address-prefixes 10.1.0.0/16 --subnet-name \$VM_SUBNET_NAME --subnet-prefixes 10.1.0.0/24

\# Create public IP for Azure Firewall

az network public-ip create --resource-group \$RG_HUB --name \$FW_PIP_NAME --location \$LOCATION --allocation-method Static --sku Standard

\# Get the subnet ID of the AzureFirewallSubnet

FW_SUBNET_ID=\$(az network vnet subnet show --resource-group \$RG_HUB --vnet-name \$VNET_HUB_NAME --name \$FW_SUBNET_NAME --query id --output tsv)

\# Get the public IP ID of the firewall public ip.

FW_PIP_ID=\$(az network public-ip show --resource-group \$RG_HUB --name \$FW_PIP_NAME --query id --output tsv)

\# Create Azure Firewall

az network firewall create --resource-group \$RG_HUB --name \$FW_NAME --location \$LOCATION --public-ip-address \$FW_PIP_ID --vnet-name \$VNET_HUB_NAME --subnet-name \$FW_SUBNET_NAME

\# Get the private IP of the Azure firewall.

FW_PRIVATE_IP=\$(az network firewall ip-config list --resource-group \$RG_HUB --firewall-name \$FW_NAME --query "\[0\].privateIpAddress" -o tsv)

\# Create network interface for VM

VM_SUBNET_ID=\$(az network vnet subnet show --resource-group \$RG_SPOKE --vnet-name \$VNET_SPOKE_NAME --name \$VM_SUBNET_NAME --query id --output tsv)

az network nic create --resource-group \$RG_SPOKE --name \$VM_NIC_NAME --location \$LOCATION --subnet \$VM_SUBNET_ID

\# Create virtual machine

az vm create --resource-group \$RG_SPOKE --name \$VM_NAME --location \$LOCATION --nics \$VM_NIC_NAME --image \$VM_IMAGE --size \$VM_SIZE --admin-username \$VM_USERNAME --admin-password "\$VM_PASSWORD"

\# Create route table for spoke subnet

az network route-table create --resource-group \$RG_SPOKE --name SpokeRouteTable --location \$LOCATION

\# Create route to Azure Firewall

az network route-table route create --resource-group \$RG_SPOKE --route-table-name SpokeRouteTable --name DefaultRoute --address-prefix 0.0.0.0/0 --next-hop-type VirtualAppliance --next-hop-ip-address \$FW_PRIVATE_IP

\# Associate route table with spoke subnet

az network vnet subnet update --resource-group \$RG_SPOKE --vnet-name \$VNET_SPOKE_NAME --name \$VM_SUBNET_NAME --route-table SpokeRouteTable

## Firewall Deployment

- **Placement:**

  - Perimeter: At the network edge to protect against external threats.

  - Internal: To segment the internal network.

- **Azure Deployment:** Specific steps for configuring rules in the Azure Portal.

- **Number of Firewalls:** Factors influencing the number of firewalls required:

  - Network size and complexity

  - Data sensitivity

  - Organizational security policies

  - Threat landscape

  - Cost-benefit analysis

- **Deployment Strategies:**

  - Phased deployment

  - Pilot testing

# Policies

## 1. Core Concepts: Network Firewall Policies

- Definition:

  - Network firewall policies are sets of rules that control network traffic flow.

  - They determine which traffic is allowed or blocked based on various criteria.

- Key Factors for Policy Decisions:

  - Source and destination IP addresses

  - Protocols (e.g., TCP, UDP, ICMP)

  - Port numbers

- Purpose:

  - To secure a network by filtering traffic.

  - To prevent unauthorized access.

## 2. Types of Firewall Policies

- Core Policies:

  - Fundamental rules defining allowed and blocked protocols.

  - The foundation of network security.

- System Policies:

  - Manage traffic to and from the firewall itself.

  - Essential for management, monitoring, VPN, and DNS.

- Application Policies:

  - Control traffic for specific applications.

  - Restrict access, prioritize traffic, and enhance security.

- Content Policies:

  - Control traffic based on packet content.

  - Block malicious traffic and filter unwanted content.

- Default Policies:

  - Pre-configured by vendors, often allowing all traffic.

  - Highly discouraged for production environments due to security risks.

- Stateful vs. Stateless Policies:

  - Stateful: Tracks connection states for enhanced security.

  - Stateless: Evaluates each packet independently, simpler but less secure.

- Hierarchical Policies:

  - Organize rules in a hierarchy for complex environments.

  - Improve manageability and scalability.

- Zone-Based Policies:

  - Divide the network into zones with specific security rules for each zone.

  - Example zones: internal, external, DMZ.

- Web Filtering Policies:

  - Block access to specific websites or categories of websites.

- VPN Policies:

  - Configure secure tunnels for remote access.

- IDS/IPS Policies:

  - IDS (Intrusion Detection System): Detects and alerts on suspicious activity.

  - IPS (Intrusion Prevention System): Actively blocks or mitigates threats.

- Network Rules:

  - Rules that filter based on network layer information (IP addresses, protocols, ports).

- Application Rules:

  - Rules that filter based on application layer information (specific applications).

- DNAT Rules:

  - Destination Network Address Translation rules, used to redirect traffic to different internal servers.

## 3. Firewall Zoning

- Definition:

  - Segmenting a network into zones based on trust levels.

- Zone Examples:

  - Internal Zone (High Trust): User workstations, servers.

  - External Zone (Low Trust): Internet-connected devices.

  - DMZ (Demilitarized Zone): Publicly accessible servers (web, email).

- Benefits:

  - Reduced attack surface.

  - Contained malware spread.

  - Improved compliance.

- DMZ Security Best Practices:

  - Use two firewalls: one internet-facing, one internal-facing.

  - Use different firewall types for added security.

  - Use dual NICs for DMZ servers.

  - Maintain separate rule sets.

## 4. Security Practices

- Egress Filtering:

  - Allow only authorized traffic to leave the network.

  - Log or drop unauthorized outbound traffic.

- Web Content Filtering:

  - Block access to malicious or inappropriate websites.

- Application Control:

  - Restrict software execution to prevent malware.

- Change Management:

  - Formal process for firewall modifications:

    - Request, review, and analyze changes.

    - Test changes in a controlled environment.

    - Deploy and verify changes.

    - Document all changes.

- Traffic Filtering:

  - Default "deny all" policy.

  - Explicitly allow necessary traffic.

  - Filter out unwanted traffic.

  - Monitor and log suspicious traffic.

- Explicit Drop Rule:

  - Implement a "drop all" rule at the end of each security zone.

  - Log blocked traffic for analysis.

- Remove "Accept All" Rules:

  - Avoid "accept all" rules, as they create security vulnerabilities.

- Defense in Depth:

  - Firewall is one component of a layered security approach.

  - Integrate with IDS/IPS, OS security, etc.

- Rulesets:

  - Tailor rulesets to specific organizational needs.

  - Mandatory rules (e.g., blocking private addresses).

- Port Policy:

  - Restrict unnecessary ports.

  - Verify service requirements before blocking.

  - Use secure alternatives (e.g., SSH instead of Telnet).

## 5. Network Policy vs. Firewall Policy

- Network Policy:

  - A broader set of rules governing overall network behavior.

  - May include routing, QoS, and other network-level configurations.

- Firewall Policy:

  - Specifically focuses on controlling traffic flow through the firewall.

  - A subset of the overall network policy.

- Service Access Policy:

  - Specifies which services are allowed to be accessed, and by whom.

- Firewall Design Policy:

  - Defines the overall architecture, placement, and configuration of firewalls within the network.

## Network Rules

To create a policy, you will. An **Azure Firewall Policy** is composed of rule collection groups.

- **Rule collection group**: It is a collection of related rules. First create at least one rule collection then create rules with conditions.

- **Rules**: It defines the action to be taken when certain conditions are met.

- **Types of Rule Collection Groups (RCG)**

- Allow all outbound traffic to the internet.

- Allow all traffic between internal networks.

## I. Basic Allow/Block Rules:

- General Inbound/Outbound:

  - Block all incoming and outgoing traffic.

  - Block all incoming traffic except for established connections.

  - Block all traffic except for a specific service (e.g., SSH).

- Internet/DMZ Traffic:

  - Block all inbound traffic from the internet, except for traffic to specific ports (e.g., HTTPS, SSH).

  - Block all traffic between the DMZ and the internet, except for traffic to specific ports (e.g., HTTPS, SSH).

  - Allow specific traffic between the DMZ and internal networks (e.g., HTTPS, SMTP, POP3).

- Basic Allow:

  - Open a custom port range (e.g., 5000-6000).

  - Open port 123 for NTP (Network Time Protocol).

## II. Protocol-Specific Rules:

- DNS:

  - Allow DNS (port 53) for both TCP and UDP.

  - Allow DNS traffic only for a specific domain.

- FTP:

  - Allow FTP (port 21) for a specific interface.

  - FTP Rule.

- SSH:

  - Allow SSH (port 22) from a specific IP address.

  - Allow SSH on a non-default port (e.g., 2222).

  - SSH Rule.

- Telnet:

  - Telnet Rule.

- SMTP:

  - Allow outgoing SMTP traffic (port 25) for a specific IP range.

- RDP:

  - Allow RDP (Remote Desktop Protocol - port 3389) from a specific IP address.

- SIP:

  - Allow SIP (Session Initiation Protocol - port 5060) for VoIP.

- SNMP:

  - Allow SNMP (Simple Network Management Protocol - port 161) for monitoring.

  - Allow traffic on a custom port range for a specific service (e.g., SNMP).

- NFS:

  - Allow NFS (Network File System - port 2049) for file sharing.

- NTP:

  - Allow NTP traffic (port 123) for both TCP and UDP.

- ICMP:

  - Allow ICMP echo requests (ping) from a specific subnet.

  - Block ICMP echo requests (ping) from a specific IP address.

  - Block incoming ICMP (ping) requests.

- Multicast:

  - Allow multicast traffic.

  - Allow multicast traffic for IPv6.

## III. Port-Specific Rules:

- Single Port:

  - Allow incoming and outgoing traffic on a specific port only for a specific time.

  - Allow incoming traffic on a specific port for both TCP and UDP, limiting it to a specific user.

  - Allow incoming traffic on a specific port for IPv6 (e.g., port 8080).

  - Allow only specific IP addresses on a certain port (e.g., 8080).

  - Allow traffic on a specific port for a range of IP addresses during specific days and times.

  - Allow traffic on a specific port for a specific service and network interface.

  - Allow traffic on a specific port for a specific service and source IP address.

  - Allow traffic on a specific port for a specific service, source IP address, and interface.

  - Allow traffic on a specific port for a specific service, source MAC address, and interface.

  - Allow traffic on a specific port for a specific service, source MAC address, and source IP address.

  - Block outgoing traffic on a specific port (e.g., 8080).

  - Block traffic from a specific IP address range on a specific port.

  - Block traffic on a specific port for a specific service and source IP address.

- Port Ranges:

  - Allow incoming connections on a specific port range (e.g., 8000-9000) for UDP.

  - Allow traffic on a custom port range for a specific application and user.

  - Allow traffic on a custom port range for both TCP and UDP (e.g., 7000-8000).

  - Allow traffic on a specific port range for a specific application.

  - Allow traffic on a specific port range for a specific application and destination IP address.

  - Allow traffic on a specific port range for a specific application, user, and interface.

  - Allow traffic on a specific port range for a specific application, user, and source IP address.

  - Allow traffic on a specific port range for a specific application, user, and destination IP address.

  - Allow traffic on a specific port range for a specific application, user, source IP address, and interface.

  - Allow traffic on a specific port range for both TCP and UDP, limiting it to a specific IP address.

  - Allow traffic on a specific port range for both TCP and UDP, limiting it to a specific MAC address.

  - Allow traffic on a specific port range for both TCP and UDP, limiting it to a specific user and interface.

  - Block incoming traffic on a specific port range for a specific application.

  - Block incoming traffic on a specific port range for a specific application and source IP address.

  - Block incoming traffic on a specific port range for a specific application and destination IP address.

  - Block incoming traffic on a specific port range for a specific application and interface.

  - Block incoming traffic on a specific port range for a specific application, user, and source IP address.

## IV. Application/Service-Specific Rules:

- Specific Applications:

  - Allow specific application traffic (e.g., Apache).

  - Allow traffic for a specific application (e.g., PostgreSQL).

  - Allow traffic for a specific UDP service (e.g., syslog - port 514).

- Specific Services:

  - Allow traffic for a specific service from a specific IP address range.

  - Allow traffic for a specific service on a custom interface (e.g., eth1).

  - Block specific service (e.g., Telnet).

  - Block traffic from a specific MAC address for a specific service.

  - Block traffic from a specific MAC address for a specific service and interface.

  - Block traffic to a specific domain for a specific service (e.g., SSH).

  - Block traffic from a specific country for a specific service (e.g., SSH).

  - Block traffic from a specific country on a specific port for a specific service.

## V. User/Identity-Based Rules:

- User Specific:

  - Allow traffic for a specific user.

  - Allow traffic for a specific user and specific service.

  - Allow traffic for a specific user on a custom port.

  - Block incoming and outgoing traffic on a specific port for a specific user.

  - Block traffic from a specific user on a custom port.

## VI. Network/Interface-Based Rules:

- Network Interface:

  - Allow incoming traffic on a specific network interface (e.g., eth1).

  - Allow traffic from and to a specific network interface (e.g., eth0).

  - Allow traffic on a specific port for a specific service and network interface.

- Network Range:

  - Allow traffic from a specific network range.

- IP Address:

  - Block traffic to a specific IP address.

  - Block outgoing traffic to a specific IP address.

- MAC Address:

  - Allow traffic from a specific MAC address.

  - Block specific MAC address.

  - Block traffic from a specific MAC address for a specific service.

  - Block traffic from a specific MAC address for a specific service and interface.

- Docker:

  - Allow Docker containers to communicate on a bridge network.

## VII. Location-Based Rules:

- Country:

  - Allow traffic from a specific country on a specific port (e.g., 8080).

  - Allow traffic on a specific port range from a specific country.

  - Block traffic from a specific country (e.g., Russia).

  - Block incoming traffic on a specific port range for a specific country.

  - Block traffic from a specific country for a specific service (e.g., SSH).

  - Block traffic from a specific country on a specific port for a specific service.

### SQL Server Port Configuration Table

| Protocol | Port(s) | Description | Purpose | Notes |
|----|----|----|----|----|
| TCP | 1433 | SQL Server Instance / Availability Group Listener | Default port for SQL Server connections and AG listener communication. | Can be changed. Most common port. |
| TCP/UDP | 1434 | SQL Server Browser | Discovery of named SQL Server instances. | Essential for named instances; can be disabled. |
| TCP | 5022 | Database Mirroring / Availability Group Endpoint | Communication for database mirroring and AG replication. | Default, but configurable. Crucial for High Availability. |
| TCP/UDP | 49152-65535 | Dynamic Port Range | Dynamic allocation for various SQL Server operations. | Configurable; adjust based on security policies. |
| UDP | 2382 | SQL Server Analysis Services Browser | Discovery of Analysis Services instances. | Used by Analysis Services. |
| TCP | 2383 | SQL Server Analysis Services Listener | Connections to Analysis Services. | Used by Analysis Services. |
| TCP | 80/443 | HTTP/HTTPS Endpoints | Web-based access to SQL Server instances. | Used for web connections. |
| TCP | 443 | Default Instance HTTPS Endpoint | Secure web connections to the default instance. | Used for secure web connections. |
| TCP | 4022 | SQL Server Service Broker | Communication for Service Broker. | Commonly used, but not a default port. |

### SQL Server Security and Configuration Rules

| Rule | Description | Notes |
|----|----|----|
| Firewall Configuration | Open only necessary ports based on services used. Implement IP whitelisting. | Regularly review and update rules. |
| Dynamic Port Management | Adjust the dynamic port range according to security policies. | Limit the range to reduce attack surface. |
| Named Instances | Ensure TCP/UDP 1434 is open if using named instances. Disable SQL Server Browser if not used. | Consult error logs for specific port numbers. |
| Availability Groups | Open TCP 1433 and 5022. | Avoid interrupting port 5022 to prevent quorum issues. |
| Analysis Services | Open UDP 2382 and TCP 2383 if used. | Ensure proper configuration. |
| Additional Security | Implement network segmentation, strong authentication, NSGs, and access controls. | Mitigate risks and enhance protection. |
| Port Configuration | Document all port configurations. | Some ports are configurable. |
| Regular Reviews | Regularly review and update firewall rules and security configurations. | Adapt to system changes. |

 

 

### Windows Server Ports

General Windows Server Ports (Non-Clustering Specific)

| Protocol | Port | Purpose                         |
|----------|------|---------------------------------|
| TCP      | 25   | SMTP (Email Sending)            |
| TCP      | 110  | POP3 (Email Receiving)          |
| TCP      | 143  | IMAP (Email Receiving)          |
| TCP      | 21   | FTP (File Transfer)             |
| TCP      | 3389 | RDP (Remote Desktop Protocol)   |
| TCP      | 5900 | VNC (Virtual Network Computing) |
| TCP      | 80   | HTTP (Web Browsing)             |
| TCP      | 443  | HTTPS (Secure Web Browsing)     |
| TCP/UDP  | 53   | DNS (Domain Name System)        |

Windows Server Clustering Specific Ports

| Protocol | Port | Purpose | Notes |
|----|----|----|----|
| TCP/UDP | 3343 | Cluster Network Communication | Essential for heartbeat and node communication. |
| TCP/UDP | 88 | Kerberos | User and computer authentication. |
| TCP/UDP | 389 | LDAP | Lightweight Directory Access Protocol. |
| TCP/UDP | 445 | SMB | Server Message Block (File sharing, cluster communication, File Share Witness) |
| UDP | 137 | NetBIOS Name Service | Authentication and cluster communication |
| UDP | 138 | NetBIOS Datagram Service | Authentication and cluster communication |
| TCP | 139 | NetBIOS Session Service | Authentication and cluster management |
| TCP | 464 | Kerberos Change/Set Password | Kerberos password changes. |
| TCP | 3268 | Global Catalog | Directory services. |
| TCP | 3269 | Global Catalog SSL | Secure directory services. |
| TCP | 636 | LDAP SSL | Secure LDAP communication. |
| TCP | 135 | RPC Endpoint Mapper | Remote Procedure Call. |
| UDP | 123 | NTP | Network Time Protocol (Time synchronization). |
| TCP | 5985 | WinRM | Windows Remote Management. |
| TCP | 5986 | WinRM HTTPS | Secure Windows Remote Management. |
| TCP/UDP | 49152+ | Dynamic RPC Ports | Range varies; check your environment. |
|  |  |  |  |

Monitoring Ports

| Protocol | Port | Purpose    |
|----------|------|------------|
| UDP      | 161  | SNMP       |
| UDP      | 162  | SNMP Traps |

## Application Rules

### Azure services

Allow the Azure portal URLs on your firewall or proxy server.

<https://learn.microsoft.com/en-us/azure/azure-portal/azure-portal-safelist-urls?tabs=public-cloud>

### Microsoft Entra

Ports required for Microsoft Entra Hybrid Identity:

Hybrid Identity Required Ports and Protocols

Microsoft Entra and AD

Firewall ports need to be opened between ADFS and AD servers?

Ports required to open between ADFS and AD servers

Microsoft Entra, Azure AD, and AD

<https://learn.microsoft.com/en-us/azure/active-directory/hybrid/reference-connect-ports>

<https://stackoverflow.com/questions/50327955/ports-required-to-open-for-azure-active-directory>

<https://stackoverflow.com/questions/51859053/which-firewall-ports-need-to-be-opened-up-between-adfs-and-ad-servers>

<https://techcommunity.microsoft.com/t5/azure/which-port-to-join-domain-azure-ad-domain-service/m-p/521459>

### Microsoft 365

Microsoft 365 and Office 365 URLs and IP address range 

<https://learn.microsoft.com/en-us/microsoftteams/office-365-urls-ip-address-ranges>

## DNAT Rules

**I. Summary**

The provided text offers a comprehensive overview of network firewalls, covering core principles, configuration processes, specific examples (like Azure and Git), policy considerations (web services, filtering, etc.), and deployment strategies. It emphasizes the "Principle of Least Privilege," the importance of accurate port/protocol/FQDN identification, and the need for a layered security approach.

## C. Firewall Policy

- **Core Principles:**

  - Principle of Least Privilege

  - Default Deny

  - Specificity of rules

  - No Implicit Allow

- **Rule Configuration:**

  - Whitelisting specific ports, protocols, services, and FQDNs.

  - Avoiding wildcard rules.

  - Regular review and updates.

- **Web Services Policy:**

  - Endpoint validation

  - Protocol restriction

  - Input validation

  - Rate limiting

  - IP whitelisting/blacklisting

  - Web Application Firewall (WAF)

  - Logging and monitoring

- **Filtering Policies:**

  - Web filtering policies

  - Application control policies

  - Data Loss Prevention (DLP) policies

  - Zero-Trust policies

- **Basic Firewall Configuration:**

  - Blocking spoofed IPs

  - Blocking routing protocols

  - Port restrictions

  - ICMP restrictions

  - IP Masquerading

  - Zone transfer protection

  - Egress filtering

- **Advanced Firewall Features (Policy Implications):**

  - Application-Level Firewall

  - User Authentication

- **Firewall Management:**

  - Regular updates

  - Log analysis

  - Integration with other security systems

## III. Corrections and Clarifications

Here are some corrections and clarifications to the information:

- **FQDNs:**

  - It's crucial to emphasize that FQDN resolution (DNS) must be working correctly for FQDN-based rules to function.

  - Using FQDNs can add complexity, as IP addresses associated with a FQDN can change. Consider the dynamic nature of cloud environments.

- **Protocols:**

  - Be precise about protocols. TCP and UDP are transport layer protocols. HTTP, HTTPS, SMTP, etc., are application layer protocols that use TCP or UDP.

  - For example, DNS primarily uses UDP port 53, but TCP port 53 is used for zone transfers.

- **Port Ranges:**

  - Document the *specific reason* for port ranges. Opening broad ranges increases risk. If possible, avoid ranges and use specific ports.

- **Azure PaaS:**

  - Service tags are indeed a best practice in Azure. They simplify management and automatically update when Microsoft changes the underlying IP addresses for Azure services.

- **Git Ports:**

  - Clarify that while port 9418 is used for the git:// protocol (which is insecure and rarely used), Git primarily operates over SSH (port 22) or HTTPS (port 443).

- **Web Services Policy:**

  - Emphasize the importance of API security best practices in web service firewall policies, such as input validation, output encoding, and authentication/authorization.

- **"Should be Restricted" Ports:**

  - The note that HTTP (port 80) "Should be Restricted" is a bit misleading. While HTTPS (port 443) is preferred for secure web traffic, HTTP is still used in many scenarios. The key is to have a policy that aligns with your security needs. If possible, redirect HTTP to HTTPS.

- **netstat and Task Manager:**

  - The instructions for using netstat and Task Manager are generally correct, but it's important to note that some processes might run under system accounts or other user accounts, which can make identification more challenging.

- **URL Filtering:**

  - URL filtering can be done at the firewall level or using separate proxy servers or security appliances.

- **ICMP:**

  - While allowing basic ICMP (like ping) is often useful for troubleshooting, be cautious about allowing all ICMP traffic, as some ICMP types can be used for attacks.

- **Opening Ports Securely:**

  - Emphasize the importance of regularly auditing firewall rules, removing unnecessary rules, and keeping the firewall software updated.

- **Firewall Rules:**

  - Firewall rules should be as specific as possible. Instead of opening a port for "any" source IP to "any" destination IP, specify the exact source and destination IP addresses or network ranges.

## IV. Key Improvements and Additional Points

- **Zero Trust:** Expand on Zero Trust. It's not just a policy; it's a security model that assumes no user or device, whether inside or outside the network perimeter, can be automatically trusted. Firewall policies play a crucial role in enforcing Zero Trust principles.

- **Micro-segmentation:** Discuss micro-segmentation, which involves creating very granular security zones within the data center or cloud environment. Firewalls, especially next-generation firewalls, are essential for micro-segmentation.

- **Threat Intelligence:** Mention the importance of integrating threat intelligence feeds into firewall policies. This allows the firewall to block traffic from known malicious sources.

- **Automation:** Highlight the role of automation in firewall management. Tools and scripts can be used to automate tasks like rule creation, updates, and auditing.

- **Context Awareness:** Emphasize the need for firewalls to be context-aware. This means that the firewall can make decisions based on factors like the user's identity, the device type, and the application being used.

- **Logging and Monitoring:**

  - Firewall logs are critical for security monitoring, incident response, and auditing.

  - Implement robust logging and monitoring solutions.

  - Use Security Information and Event Management (SIEM) systems to analyze firewall logs and detect security threats.

By incorporating these corrections, clarifications, and additional points, you can create a more accurate, comprehensive, and valuable resource on network firewalls.

## Sample Firewall Policy

The document you provided is a firewall policy. It outlines the security measures for a network firewall system. Here's a summary of the key points:

**General Firewall Guidelines**

**Physical and Logical Access**

- Physical access to the firewall should be restricted.

- The firewall should be in a controlled environment with appropriate power and cooling.

- Logical access should be restricted to authorized personnel only.

- Remote administration should be encrypted if used.

**System Backup**

- Regularly back up firewall configurations, software, logs, and operating system files.

**Upgrades and Patches**

- promptly apply vendor-recommended firewall patches.

- Evaluate the need for firewall upgrades and get approval before implementation.

- Verify proper operation after any upgrades.

**Logs and Audit Trails**

- Enable logging for firewall activity, audit trails, and system events.

- Review logs periodically or situationally depending on business needs.

- Archive logs for a set period and then securely dispose of them.

**Documentation**

- Document firewall operational procedures, backups, troubleshooting, log review, and housekeeping.

- Document firewall configurations confidentially, including network diagrams, IP addresses, routing tables, and firewall rules.

- Update documentation after any firewall changes.

**Encrypted Channels**

- Use encrypted channels (VPN, SSL, SSH) for communication between internal and external hosts.

- Securely distribute encryption keys before using encrypted channels.

**Enforcement**

- All staff must comply with the firewall policy.

- Report any security violations or misuse of IT systems.

- Ensure contractors and authorized parties comply with this policy.

- Assign local firewall administrators for branch offices.

# Administration

- Only authorized administrators can modify firewall rules.

- Firewall rules and connections should be reviewed periodically and removed if no longer needed.

- Users and application owners must be authorized for any firewall changes.

<!-- -->

- **Audit Logs:** Regularly review firewall logs to identify anomalies, unused rules, and false positives. Optimize firewall settings based on this data.

- **Firewall Updates:** Keep firewall software and firmware up-to-date to prevent vulnerabilities and maintain effectiveness.

- **Internal Modems:** Eliminate modems from the internal network as they pose a significant security risk and can bypass the firewall.

- **Application-Level Firewalls:** Ensure the operating system is secure before evaluating the application-level firewall due to their close relationship.

- **Use a centralized management system**. A centralized management system can help you to manage multiple firewalls for IoT devices more easily and efficiently.

Overall, the policy emphasizes the importance of regular monitoring, maintenance, and a thorough security assessment to ensure the firewall effectively protects the network.

**Encrypted Communications**

- All external communications (e.g., B2B) must use encryption methods like VPN, SSL, SSH to protect data.

- Secure key distribution is essential for encryption to work effectively.

**Enforcement and Compliance**

- All employees must follow security policies, including those related to firewalls. Violations can result in disciplinary action.

- Employees must report any security misuse or malpractice immediately.

- Contractors and third-party users must also comply with security policies.

- When outsourcing firewall management, the vendor must adhere to the organization's policies.

**Firewall Deployment and Management**

- Maintain consistent firewall policies across all devices in a distributed firewall setup.

- Secure policy transfers and host authentication using IPSec and cryptographic certificates.

- Implement a redundant firewall system for continuous operation.

**Firewall Administration Roles and Responsibilities**

- **Designated Firewall Administrators** and **Backup Administrators** are responsible for firewall management.

- All firewall modifications require approval from **IT Security**.

- Administrators must regularly review firewall rules and connections with application owners, removing obsolete entries.

- All requests for new firewall connections and rules require authorization from users, application owners, and the **Information Security Manager**.

**Firewall Access Control**

- **Logical access** to the firewall is restricted to Firewall Administrators, Backup Administrators, and the Information Security Manager. Other access is granted on a need-to-basis with IT Security approval.

- **Remote access** to the firewall is allowed only when necessary and must be secured with encryption if over an untrusted network.

- All access and privileges are approved by the Information Security Manager.

- Unused access and privileges must be removed promptly.

- Strong authentication (e.g., username and password) is required for firewall access.

**Automation**

- **Challenge:** Frequent firewall rule updates due to new technologies create a heavy workload for administrators.

- **Solution:** Automate firewall configuration changes to:

  - Streamline the change process.

  - Reduce human error leading to system failures.

  - Free up administrator time for higher-level security tasks.

**Rule Maintenance**

- **Challenge:** Network changes (new users, devices, services, applications) require constant firewall rule updates and reviews.

- **Solution:** Establish a regular maintenance schedule to:

  - Add new firewall rules.

  - Review and remove outdated rules.

Overall, effective firewall administration involves automating routine tasks, regularly maintaining firewall rules, and freeing up administrator time for strategic security initiatives.

**Identity and Access Management (IAM)**

- **User and Role Management:** Clearly defined roles with documented privileges, enforced through Role-Based Access Control (RBAC).

- **Authentication:** Strong authentication methods using encrypted cookies, avoiding persistent cookies and HTTP GET for credentials.

- **Authorization:** Granular authorization based on roles, preventing unauthorized access through parameter or cookie manipulation.

**Change Management**

- **Dedicated Roles:** Firewall managed by dedicated administrators and backups.

- **Approval Process:** All changes require IT Security approval. New firewall rules need additional approval from application owners and users.

- **Oversight:** Information Security Manager oversees the entire process.

**Physical and Logical Access**

- **Restricted Access:** Physical access to the firewall is limited, and it's housed in a controlled environment.

- **Authorized Personnel:** Logical access is restricted to authorized personnel only.

- **Secure Remote Access:** Remote access is approved and uses strong encryption.

**Additional Considerations**

- **Regular Reviews:** Periodically review and update firewall access controls.

- **Least Privilege Principle:** Grant user’s minimum necessary access.

- **Multi-Factor Authentication (MFA):** Consider implementing MFA for enhanced security.

Overall, the document emphasizes the importance of strong IAM practices, controlled access, and a robust change management process for effective firewall administration.

**Key points:**

- Clearly defined roles and responsibilities

- Strong authentication and authorization mechanisms

- Restricted physical and logical access

- Regular review and updates

- Adherence to least privilege principle

- Consideration of MFA for additional security

**SSL/TLS configuration**

**SSL/TLS** (Secure Sockets Layer/Transport Layer Security) is crucial for securing network communication. Firewalls play a vital role in managing and securing SSL/TLS traffic.

Key Considerations for SSL/TLS Configuration on Firewall:

**1. SSL/TLS Inspection:**

- **Decrypt and Inspect:** Firewalls can decrypt encrypted traffic, inspect it for threats, and then re-encrypt it before forwarding.

- **Performance Impact:** Decryption and re-encryption can impact performance, so it's essential to balance security needs with performance requirements.

- **Certificate Management:** The firewall needs appropriate certificates to decrypt and re-encrypt traffic.

- **Policy-Based Inspection:** Implement policies to define which traffic should be inspected and which should be bypassed.

**2. Cipher Suite Selection:**

- **Strong Cipher Suites:** Choose strong cipher suites that offer robust encryption and protection against vulnerabilities.

- **Avoid Weak Ciphers:** Disable or restrict weak cipher suites to enhance security.

- **Regular Updates:** Keep cipher suite lists updated to address emerging threats.

**3. Protocol Versions:**

- **TLS 1.3:** Prioritize TLS 1.3 as it offers improved performance and security compared to older versions.

- **Disable Older Versions:** Disable or restrict older, less secure protocols like SSLv3 and TLS 1.0/1.1.

**4. Certificate Management:**

- **Trusted Certificate Authorities (CAs):** Configure the firewall to trust only reputable CAs.

- **Certificate Revocation:** Implement certificate revocation checking to prevent communication with compromised certificates.

- **Certificate Expiration:** Monitor certificate expiration dates and renew them before they expire.

**5. SSL/TLS Termination:**

- **Load Balancing:** If terminating SSL/TLS at the firewall, ensure load balancing is configured to distribute traffic across multiple servers.

- **Performance Optimization:** Optimize firewall resources for SSL/TLS termination to avoid performance bottlenecks.

**6. Logging and Monitoring:**

- **Detailed Logs:** Enable comprehensive logging of SSL/TLS events to detect anomalies and security incidents.

- **Regular Monitoring:** Monitor SSL/TLS traffic for signs of attacks or vulnerabilities.

**Additional Considerations:**

- **Strict Transport Security (HSTS):** Implement HSTS to enforce secure connections and prevent downgrade attacks.

- **Perfect Forward Secrecy (PFS):** Utilize PFS to protect against key compromise.

- **OCSP Stapling:** Consider using OCSP stapling to improve certificate validation performance.

By following these guidelines and tailoring the configuration to specific security requirements, organizations can effectively protect their network traffic with SSL/TLS and mitigate potential risks.

General

- **Dedicated Server:** Isolate the firewall for optimal performance and security.

- **Least Privilege:** Grant minimal necessary access to users and applications.

Rule Management

- **Regular Reviews:** Periodically examine firewall rules to add, remove, or modify as needed.

- **Rule Order:** Prioritize rule evaluation for effective security:

  - Block spoofed addresses.

  - Allow specific user traffic.

  - Permit network management access.

  - Discard unnecessary traffic.

  - Alert on suspicious activity.

  - Log remaining traffic.

- **Customization:** Adapt general guidelines to specific organizational needs while maintaining essential protections.

Security

- **Updates:** Keep firewall software current with patches.

- **Network Segmentation:** Physically separate network segments using firewalls.

- **Routing Restrictions:** Disable loose and strict source routing.

- **Spoofing Prevention:** Block forged IP addresses, including private and illegal ones.

Additional Considerations

- **Refer to SANS Firewall Checklist:** For detailed guidance on blocking specific traffic types.

- **Beyond Firewalls:** Implement identity and access management (IAM) for enhanced security.

**Key Points:**

- Firewall placement, user access, and rule management are crucial for security.

- Rule order and customization are essential for efficient and effective protection.

- Regular updates, network segmentation, and spoofing prevention are vital security measures.

- Consider IAM for complementary security.

Network Zones

Network zones are a critical concept for secure firewall configuration. Here is a breakdown of best practices:

- **Grouping Devices:** Organize devices based on security needs. Create zones for servers, workstations, guests, etc.

- **Firewall Rules per Zone:** Apply specific firewall rules to each zone to control traffic flow between them.

- **Segmentation for Different Policies:** If user groups or network communities require different security levels, physically isolate them using network segmentation.

  - Place more permissive users/networks on separate subnets from the more secure ones.

  - All access from these subnets should comply with established firewall policies.

- **Internal Controls for Critical Systems:** Use internal firewalls or filtering routers for critical information, applications, and systems.

  - This provides access control, auditing, and logging capabilities.

  - Segment the internal network to enforce access policies defined by information owners.

- **Critical Server Protection:** Create a deny rule for traffic originating from external sources and destined for critical internal addresses.

  - Exceptions may exist based on organizational needs (e.g., web applications accessed via a DMZ).

Zone Transfers (Stateful Firewalls):

- Use packet filtering on UDP/TCP port 53 to limit replies from the internal network for external DNS requests.

- Block unauthorized zone transfers from external sources.

FTP Servers

- **Isolate FTP Servers:** Place FTP servers on a separate network segment to protect the internal network.

VPN Security

- **VPN is Not a Guarantee:** Even with a VPN, compromised laptops can pose a risk to the corporate network.

Stealth Firewalls

- **Strengthen Credentials:** Reset default firewall credentials.

- **Network Awareness:** Configure firewall to recognize network segments.

- **Traffic Control:** Review and refine access control lists.

- **Connection Prevention:** Enable ACK bit monitoring to thwart unauthorized connections.

Identity Management

- **Centralized Authentication:** Integrate firewall with identity management systems for user authentication.

DMZ Security

- **Dual Firewalls:** Employ two firewalls for enhanced DMZ protection.

- **Firewall Diversity:** Utilize different firewall types in the DMZ.

- **Network Isolation:** Implement dual NICs on the web server.

- **Rule Separation:** Maintain distinct rule sets for each firewall.

Compliance

- **Policy Adherence:** Ensure firewall rules align with organizational security policies.

Intrusion Detection/Prevention Systems (IDS/IPS)

- **Threat Monitoring and Blocking:** Implement IDS/IPS to detect and prevent malicious network activity.

Maintenance

- **Rule Management:** Regularly review and update firewall rules to accommodate changes.

- **Firmware Updates:** Keep firewall software up-to-date for optimal security.

Change Management

- **Formal Process:** Establish a structured approach for managing firewall configuration changes.

- **Change Control:** Include change request submission, review, testing, deployment, validation, and documentation.

Backups

- **Regular Backups:** Create and store backups of firewall configurations, software, logs, and operating system files.

- **Secure Storage:** Maintain backups in a secure location with appropriate labelling.

Additional points:

- Firewall administrators periodically review firewall rules with application owners to ensure they are still valid.

- Any unused or invalid access privileges should be promptly removed.

Upgrades and Patches:

- Apply vendor-recommended firewall patches promptly with management approval.

- Evaluate the need for firewall upgrades and get approval before implementing.

- Verify proper firewall operation after any upgrades.

**Logs and Audit Trails:**

- Enable logging for firewall activity, audit trails, and system events.

- The Information Security Manager determines how often to review logs (based on criticality).

- Logs can be reviewed periodically for accountability or as needed for troubleshooting/forensics.

- An internal party (Security Manager) or independent party should review logs for accountability.

- Archive logs for a set period and then securely erase or overwrite the data.

Documentation:

- Document all firewall operational procedures (administration, backups, troubleshooting, log review, etc.).

- Document firewall configurations confidentially, including network diagrams, IP addresses, routing tables, and firewall rules.

- Update all documentation whenever the firewall configuration changes.

**Encrypted Channels:**

- Use encrypted channels (VPN/SSL/SSH) for communication between internal and external hosts on public or trusted networks.

- Securely distribute encryption keys before using encrypted channels.

Enforcement:

- All staff must comply with the firewall policy.

- Report any security violations or misuse of IT systems.

- Ensure contractors and authorized parties also comply with this policy.

- Outsourced vendors providing firewall services must ensure compliance with this policy.

<!-- -->

- **Use a centralized management system.** This can help you to manage multiple firewalls more easily and efficiently.

- **Document your firewall configuration**. This will help you to understand your configuration and make changes more easily in the future.

- **Have a disaster recovery plan**. This should include a plan for restoring your firewall configuration in the event of a failure.

Firewall Maintenance

- **Upgrade and Patch Management:** Regularly update firewall software and patches with management approval, verifying functionality post-upgrade.

- **Stateful Inspection:** Monitor firewall rules for accuracy in IP addresses, ports, and timeouts.

- **MAC Filtering (if applicable):** Restrict MAC addresses to authorized devices.

Security and Compliance

- **Change Management:** Establish a formal process for firewall rule changes, including security review, testing, and documentation.

- **Vulnerability Assessment:** Regularly scan for open ports and test firewall rules.

- **Physical Security:** Place the firewall in a restricted access area with environmental controls (e.g., air conditioning, UPS).

Additional Considerations

- **Vendor Verification:** Ensure downloaded updates originate from trusted sources.

- **Security Policy Adherence:** Firewall configurations should align with the organization's security policies.

Logging and Monitoring Best Practices

**Key Points**

- **Enable comprehensive logging:** Capture firewall activity, audit trails, and system-level events.

- **Protect sensitive data:** Avoid logging personal information, passwords, or other sensitive data.

- **Monitor connection attempts:** Log both successful and failed connection attempts.

- **Regularly review logs:** Establish a process for analyzing logs to detect anomalies, suspicious activity, and inefficient rules.

- **Session management:** Validate sessions on both ends, especially when sharing sessions between components.

- **Secure external connections:** Use HTTPS when making external connections with HTTPClient.

Additional Considerations

- **Log retention:** Determine an appropriate retention period for firewall logs based on regulatory and operational requirements.

- **Log disposal:** Implement secure methods for disposing of old logs, such as overwriting or physical destruction.

- **Role-based access:** Grant access to firewall logs only to authorized personnel.

- **Log analysis tools:** Consider using specialized tools to automate log analysis and detection of threats.

- **False positives:** Regularly review and adjust firewall rules to minimize false positives.

By following these guidelines, organizations can enhance their ability to detect and respond to security threats, optimize firewall performance, and maintain compliance with relevant regulations.

**Note:** The provided information focuses on general firewall logging and monitoring best practices. Specific implementation details may vary depending on the firewall platform and organizational requirements.

<https://techcommunity.microsoft.com/t5/azure-network-security-blog/enabling-central-visibility-for-dns-using-azure-firewall-custom/ba-p/2156331>

System Backup

- **Regularly backup firewall configuration:** This includes firewall software settings (rules, policies, network objects), operating system configurations, and network definitions (routing tables, hostnames).

- **Backup firewall logs:** Preserve firewall and operating system logs for incident investigation and forensic analysis.

- **Secure backup storage:** Store backup media in a secure location and label them appropriately.

By following these guidelines, organizations can protect their firewall configuration and logs, enabling recovery from system failures and effective incident response.

Documentation

**Essential Documentation:**

- **Operational Procedures:** Detailed guidelines for administration, backup, troubleshooting, log review, and maintenance.

- **Configuration Details:** Securely stored information about network diagrams, IP addresses, routing tables, and firewall rules.

**Access Control:**

- Firewall configuration documents should be restricted to Firewall Administrators, Backup Administrators, and the Information Security Manager.

**Document Maintenance:**

- All documentation must be updated promptly after any firewall changes.

# Windows Firewall

# Linux Firewall

# Proxy Server

Proxy is a network service that allows clients to make indirect network connections to other network services.

The most used proxy servers in enterprises are:

- **HAproxy**: Open-source LB and reverse proxy server

- **Nginx proxy**: Open-source webserver and reverse proxy server

- **Squid**: Open-source caching and forwarding proxy server

Proxy Server Design

High-level design for an enterprise proxy server:

- **Ensure Proxy server have enough resources,** so it should be <span class="mark">deployed on a dedicated server or appliance.</span>

- **Proxy Server to filter all inbound and outbound traffic,** so it should <span class="mark">be located at the perimeter of the enterprise network</span>.

- Proxy Server should be configured for authentication, authorization, and content filtering.

- **Improve the performance of the network and reduce bandwidth usage** so Proxy Server should be configured to <span class="mark">cache frequently accessed content</span>.

- **Improve scalability and reliability of system**, Proxy Server should be configured <span class="mark">to provide load balancing for backend servers</span>.

**<u>Proxy Server Configuration</u>**

Socks Proxy PenTest

SOCKS proxies act as intermediaries between your device and the internet, providing a secure and versatile connection. Unlike HTTP proxies that are limited to HTTP traffic, SOCKS proxies can handle various protocols, including HTTP. This makes them more useful in diverse scenarios.

**How SOCKS Proxies Work:**

1.  **Installation:** SOCKS proxies are typically installed as browser extensions or configured within torrent clients.

2.  **Traffic Routing:** When you connect to a website or service, your traffic is routed through the SOCKS proxy server.

3.  **IP Masking:** The proxy server hides your actual IP address, making it appear as if you are connecting from the location of the proxy server.

**Use Cases:**

- **Geo-Restricted Content:** Accessing websites or services that are blocked in your region.

- **Privacy and Security:** Protecting your online privacy by masking your IP address.

- **Torrenting:** Bypassing ISP restrictions on torrenting.

In essence, SOCKS proxies offer a flexible and secure way to connect to the internet, making them a valuable tool for various online activities.

How to setup Socks proxy?

# How to bypass Firewall?

Provide example of how firewall can be bypassed by an outsider to access the corporate network.

Firewalls are a critical security measure and bypassing them can leave a network vulnerable to attacks.

However, I can summarize some common methods attackers use to try to bypass firewalls:

**Exploiting Weaknesses:**

- **Misconfigurations:** Attackers can exploit mistakes in firewall settings to send data packets that bypass security rules.

- **Open Ports:** If unnecessary ports are open on the firewall, attackers can use them to send malicious traffic.

**Tricking Users:**

- **Social Engineering:** Attackers may manipulate people (e.g., through phishing emails) to click malicious links or download malware that can bypass security measures.

**Alternative Routes:**

- **VPNs:** Attackers might misuse VPNs designed for legitimate remote access to bypass restrictions.

- **Proxy Servers:** Proxy servers can be used to mask a user's location and potentially bypass firewall rules.

It is important to remember that these are just some examples, and new techniques are constantly emerging. Here are some security practices to counter these methods:

- **Strong Firewall Rules:** Regularly review and update firewall rules to close any gaps in security.

- **User Education:** Train employees to identify and avoid social engineering tactics.

- **Multi-Layered Security:** Use a combination of security measures, including firewalls, intrusion detection, and data encryption, to create a strong defense.

- **Patching Systems:** Keep all software and systems updated with the latest security patches.

# Incident Response

How can a firewall be used to detect and prevent unauthorized access to a network? What types of logs and alerts should be monitored?

What is worse in firewall detection, a false negative or a false positive? And why? Consider a scenario where a firewall is protecting an online banking system. Which would be more detrimental: a false negative that allows a malicious attack to bypass the firewall or a false positive that blocks legitimate customer transactions? Explain your reasoning.

# The End

# Firewall

This passage highlights the importance of deploying firewalls for network security, particularly at the edge of your enterprise network. Here's a breakdown of the key points:

- **Firewall Placement:**

  - Deploy firewalls at the perimeter (edge) of your network to filter traffic entering and exiting your organization.

  - You can also use them internally to segment your network and restrict traffic flow between different segments.

- **Firewall Functionality:**

  - Firewalls can perform advanced filtering on network traffic, allowing or blocking connections based on predefined rules.

  - This includes:

    - Blocking known malicious IP addresses.

    - Restricting high-risk protocols like remote management tools (RDP, SSH) or internal network protocols (SMB, Kerberos) if not needed for specific purposes.

    - Filtering traffic at the application layer (e.g., URL filtering) to block access to unwanted websites.

- **Centralized Management:**

  - Cloud platforms like Azure Firewall offer central management capabilities, allowing you to manage firewall policies and configurations for multiple network segments from a single location.

- **Routing for Complex Networks:**

  - In complex network setups (e.g., hub-and-spoke), you might need to configure User-Defined Routes (UDRs) to ensure traffic flows through the desired firewall or security appliance.

- **Additional Resources:**

  - The passage provides links to resources for deploying Azure Firewall and configuring virtual network traffic routing.

By implementing these practices, you can strengthen your network security posture by controlling traffic flow and filtering out potential threats.

# Azure Firewall

# Introduction

A firewall is a network security device that acts as a barrier between trusted and untrusted networks. It monitors and controls incoming and outgoing network traffic based on predefined security rules. By inspecting each data packet, firewalls determine whether to allow or block it based on factors like IP addresses, port numbers, and traffic type.

**What is a Firewall?**

- A security device that inspects network traffic

- Protects networks from unauthorized access and malicious threats

**Azure Firewall Summary**

- **Centralized management:** Allows for easy policy enforcement and logging across multiple environments.

- **Cloud-based network security service:** Protects Azure Virtual Network resources.

- **Default traffic blocking:** Requires explicit rules to allow traffic.

- **East-west and north-south traffic inspection:** Monitors both internal and external network traffic.

- **Fully stateful firewall:** Provides granular control over network traffic.

- **High availability and scalability:** Offers reliable and flexible performance.

- **Integrated with Azure Monitor:** Provides comprehensive logging and analytics capabilities.

- **Managed service:** Azure handles the underlying infrastructure.

- **Route table configuration:** Necessary to route all traffic through Azure Firewall.

- **Standard and Premium SKUs:** Offers different performance and feature levels.

- **Static public IP address:** Enables external firewalls to identify traffic from your virtual network.

- **Virtual network requirement:** Requires a dedicated subnet named "AzureFirewallSubnet."

- To route all traffic via Azure Firewall, create routes in route table

Benefits

Firewalls are essential network security tools that provide a crucial first line of defense against cyberattacks. They offer a range of benefits, including:

- Enhanced Security:

  - Protection against unauthorized access and cyberattacks.

  - Prevention of data breaches and loss of sensitive information.

  - Blocking of malicious traffic (viruses, malware, ransomware).

- Improved Network Performance:

  - Filtering of unwanted traffic to reduce congestion.

  - Optimization of network speed and responsiveness.

- Compliance Adherence:

  - Assistance in meeting industry regulations and standards (e.g., HIPAA, PCI DSS).

  - Demonstration of commitment to data protection.

- Additional Benefits:

  - Increased privacy by protecting personal information.

  - Application control to restrict access to specific applications.

  - Intrusion detection to identify and block suspicious activity.

  - Network segmentation to create secure network zones.

Key Functions:

- Protection: Preventing unauthorized network access.

- Traffic Control: Monitoring and filtering network traffic based on rules.

- Network Segmentation: Dividing networks into secure zones.

Key Points:

- Firewalls operate at different network layers (Network, Transport, Application).

- Rule sets can be customized for specific security needs.

- Regular updates and maintenance are crucial for optimal performance.

- Firewalls improve security posture, enhance threat detection, and reduce administrative burden.

- While crucial, firewalls are not foolproof; comprehensive security requires additional measures.

Importance:

- Essential for network security.

- Provides a first line of defense.

- Requires proper configuration for optimal effectiveness.

## How Does a Firewall Work?

4.  **Packet Inspection:** Examines each data packet for information like:

    - Source and destination IP addresses

    - Port numbers

    - Protocol type

    - Content type

5.  **Rule-Based Decision:** Compares packet information to a set of pre-defined rules

6.  **Allow or Block:**

    - Allows benign traffic to pass through

    - Blocks malicious or unauthorized traffic

## Best Practices

<table>
<colgroup>
<col style="width: 8%" />
<col style="width: 31%" />
<col style="width: 60%" />
</colgroup>
<thead>
<tr>
<th>Category</th>
<th>Best Practice</th>
<th>Summary/Importance</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="3">I. Core Security Fundamentals</td>
</tr>
<tr>
<td></td>
<td>Default Deny</td>
<td>Block all traffic by default, allowing only explicitly permitted connections. Minimizes the attack surface.</td>
</tr>
<tr>
<td></td>
<td>Least Privilege</td>
<td>Grant only necessary permissions to users and applications. Limits potential damage from compromised accounts.</td>
</tr>
<tr>
<td></td>
<td>Specificity</td>
<td>Create precise firewall rules (source, destination, port, protocol). Reduces unintended access and improves control.</td>
</tr>
<tr>
<td></td>
<td>Regular Updates</td>
<td>Keep firewall software, firmware, and rules up-to-date. Patches vulnerabilities and protects against new threats.</td>
</tr>
<tr>
<td></td>
<td>Explicit Deny Rule</td>
<td>Implement an "any-any-any deny" rule at the end of rule sets. Acts as a final safety net, blocking any unallowed traffic.</td>
</tr>
<tr>
<td colspan="3">II. Network Architecture and Segmentation</td>
</tr>
<tr>
<td></td>
<td>Dedicated Firewall Server</td>
<td>Use a separate server for the firewall. Enhances security by isolating the firewall.</td>
</tr>
<tr>
<td></td>
<td>Network Segmentation</td>
<td>Divide the network into isolated segments (DMZ, internal, etc.). Limits the spread of attacks.</td>
</tr>
<tr>
<td></td>
<td>Traffic Restriction</td>
<td>Block spoofed IP addresses, loose/strict source routing. Prevents common attack vectors.</td>
</tr>
<tr>
<td></td>
<td>Internal Network Isolation (NAT/PAT)</td>
<td>Hide internal IP addresses using NAT/PAT (IP masquerading). Protects internal network details.</td>
</tr>
<tr>
<td></td>
<td>DMZ Protection</td>
<td>Use two firewalls for web servers in a DMZ. Adds an extra layer of security.</td>
</tr>
<tr>
<td></td>
<td>Isolate Sensitive Services</td>
<td>Place services like FTP servers in dedicated subnets. Limits exposure of sensitive services.</td>
</tr>
<tr>
<td colspan="3">III. Monitoring, Management, and Logging</td>
</tr>
<tr>
<td></td>
<td>Logging and Monitoring</td>
<td>Record firewall activity and monitor for anomalies. Enables incident response and analysis.</td>
</tr>
<tr>
<td></td>
<td>Rule Optimization</td>
<td>Regularly review and update firewall rules. Maintains effectiveness and removes unnecessary rules.</td>
</tr>
<tr>
<td></td>
<td>User Management (RBAC)</td>
<td>Control access to firewall configuration using Role-Based Access Control. Prevents unauthorized changes.</td>
</tr>
<tr>
<td></td>
<td>Backup and Recovery</td>
<td>Implement regular backups of firewall configurations. Enables quick recovery after failures.</td>
</tr>
<tr>
<td></td>
<td>Centralized Management</td>
<td>Use a single system to manage multiple firewalls. Improves efficiency and consistency.</td>
</tr>
<tr>
<td></td>
<td>Documentation</td>
<td>Maintain clear records of firewall settings. Facilitates understanding and troubleshooting.</td>
</tr>
<tr>
<td></td>
<td>Disaster Recovery</td>
<td>Have a plan to restore firewall configurations. Ensures business continuity.</td>
</tr>
<tr>
<td></td>
<td>Log Review</td>
<td>Regularly examine firewall logs for security breaches. Proactive identification of attacks.</td>
</tr>
<tr>
<td></td>
<td>Reporting Tools</td>
<td>Use tools to analyze logs and optimize rules. Provides insights and trends.</td>
</tr>
<tr>
<td></td>
<td>Anomaly Detection</td>
<td>Monitor for unusual traffic patterns and unauthorized changes. Early detection of suspicious activity.</td>
</tr>
<tr>
<td colspan="3">IV. Advanced Security Measures</td>
</tr>
<tr>
<td></td>
<td>Application Control</td>
<td>Restrict which applications can run on the network. Prevents malware and unauthorized software.</td>
</tr>
<tr>
<td></td>
<td>Intrusion Detection/Prevention Systems (IDPS)</td>
<td>Monitor for and block malicious traffic. Adds proactive threat protection.</td>
</tr>
<tr>
<td></td>
<td>Web Content Filtering</td>
<td>Block access to harmful websites. Protects against web-based threats.</td>
</tr>
<tr>
<td></td>
<td>Virtual Private Network (VPN)</td>
<td>Encrypt traffic between remote users and the network. Secures remote access.</td>
</tr>
<tr>
<td></td>
<td>Cloud Firewall</td>
<td>Protect cloud environments. Secures cloud-based resources.</td>
</tr>
<tr>
<td></td>
<td>VM/Hypervisor/IoT Firewalls</td>
<td>Protect virtual machines, hypervisors, and IoT devices. Addresses specific security needs.</td>
</tr>
<tr>
<td></td>
<td>Automated Alerts</td>
<td>Configure notifications for intrusions and failures. Enables rapid response.</td>
</tr>
<tr>
<td></td>
<td>URL Filtering</td>
<td>Block access to malicious URLs. Protects against web-based threats.</td>
</tr>
<tr>
<td></td>
<td>Stateful Inspection</td>
<td>Monitor connection states for suspicious activity. Enhances threat detection.</td>
</tr>
<tr>
<td></td>
<td>Stealth Firewall</td>
<td>Hide firewall presence. Makes it harder for attackers to target.</td>
</tr>
<tr>
<td></td>
<td>Third-Party Integration (Identity Management)</td>
<td>Use identity management systems for enhanced control. Centralized access management.</td>
</tr>
<tr>
<td></td>
<td>Application-Level Firewall Best Practices</td>
<td>Restrict SMTP and FTP commands, filter web content, and enforce strong authentication. Protects against application level attacks.</td>
</tr>
<tr>
<td colspan="3">V. Scalability and Reliability</td>
</tr>
<tr>
<td></td>
<td>Scalability (Load Balancing, Virtualization, Cloud)</td>
<td>Plan for future network growth and implement scalable solutions. Ensures performance and availability.</td>
</tr>
<tr>
<td></td>
<td>Reliability (Redundancy)</td>
<td>Implement redundant firewalls for high availability. Prevents single points of failure.</td>
</tr>
<tr>
<td></td>
<td>Consistent Policy Enforcement &amp; Secure Policy Distribution</td>
<td>Security policies must be the same across all firewalls. Use encryption and authentication when distributing firewall rules.</td>
</tr>
<tr>
<td colspan="3">VI. Endpoint and Network Security</td>
</tr>
<tr>
<td></td>
<td>Endpoint Security (Laptops)</td>
<td>Secure laptops with personal firewalls and user training. Protects mobile devices.</td>
</tr>
<tr>
<td></td>
<td>Mail Traffic Control</td>
<td>Implement strict rules for incoming and outgoing mail. Prevents mail-based attacks.</td>
</tr>
<tr>
<td></td>
<td>Modem Elimination</td>
<td>Remove unauthorized modems. Prevents backdoor access.</td>
</tr>
<tr>
<td></td>
<td>ICMP Management</td>
<td>Carefully control ICMP traffic. Prevents ICMP-based attacks.</td>
</tr>
<tr>
<td></td>
<td>DNS Zone Transfers (Restrict)</td>
<td>Restrict DNS zone transfers to authorized sources. Protects DNS information.</td>
</tr>
<tr>
<td colspan="3">VII. Firewall Configuration and Management</td>
</tr>
<tr>
<td></td>
<td>Restrict Ports</td>
<td>Only allow necessary ports. Reduces the attack surface.</td>
</tr>
<tr>
<td></td>
<td>Secure Remote Access (SSH)</td>
<td>Use SSH instead of Telnet. Encrypts remote access.</td>
</tr>
<tr>
<td></td>
<td>Eliminate Broad Permissions</td>
<td>Remove "accept all" rules. Improves control and security.</td>
</tr>
<tr>
<td></td>
<td>Rule Order (Prioritization)</td>
<td>Prioritize rules based on security and control. Ensures effective rule processing.</td>
</tr>
<tr>
<td></td>
<td>Tailored Rulesets</td>
<td>Create rulesets based on organizational needs. Customizes security.</td>
</tr>
<tr>
<td></td>
<td>Change Management (Structured Process)</td>
<td>Implement a structured process for firewall rule changes. Prevents errors and disruptions.</td>
</tr>
<tr>
<td></td>
<td>Automation (Rule Updates)</td>
<td>Use automation for rule updates. Improves efficiency and reduces errors.</td>
</tr>
<tr>
<td></td>
<td>Regular Maintenance (Rule Reviews)</td>
<td>Regularly review and update firewall rules. Keeps rules aligned with network needs.</td>
</tr>
<tr>
<td></td>
<td>Patches and Updates (Software/Firmware)</td>
<td>Maintain firewall software with the latest patches. Fixes vulnerabilities.</td>
</tr>
<tr>
<td></td>
<td>Closed Ports (Unused Ports)</td>
<td>Close unused ports. Reduces attack surface. Filtered ports still respond to scans.</td>
</tr>
<tr>
<td colspan="3">VIII. Vulnerability Assessment and Testing</td>
</tr>
<tr>
<td></td>
<td>Port Scanning (Nmap)</td>
<td>Regularly scan for open ports to identify and close unnecessary ones. Identifies potential vulnerabilities.</td>
</tr>
<tr>
<td></td>
<td>Ruleset Testing (After Changes)</td>
<td>Test firewall rulesets after changes to prevent service disruptions or security breaches. Ensures proper implementation.</td>
</tr>
</tbody>
</table>

# Design

## Firewall Design

- **Zoning:** Dividing the network into zones (internal, external, DMZ) based on trust levels. This is a fundamental design principle.

- **Architecture:**

  - Hub-and-spoke vs. distributed networks influence firewall placement.

  - Layered defense-in-depth: Using multiple firewalls for enhanced security.

- **Firewall Types:**

  - Perimeter firewalls

  - Internal firewalls

  - Application firewalls

  - Next-Generation Firewalls (NGFWs) - These have design implications due to their advanced features.

- **High Availability:** Design considerations for redundancy and failover (e.g., two firewalls in HA).

- **Capacity Planning:** Design must consider network size, traffic volume, and performance requirements.

## Firewall Types

| Category | Type | Description | Key Features | Use Cases |
|----|----|----|----|----|
| Deployment (Platform) | Hardware Firewall | Dedicated physical appliance. | High performance, robust security. | Medium to large enterprises, data centers. |
|  | Software Firewall | Software installed on operating systems. | Flexible, cost-effective. | Individual devices, small businesses, home networks. |
|  | Cloud Firewall (FWaaS) | Cloud-based security service. | Scalable, flexible, centralized management. | Distributed networks, remote workforces, cloud applications. |
| Functionality (Inspection) | Packet Filtering Firewall | Examines packet headers. | Basic security, rule-based. | Simple network security needs. |
|  | Stateful Inspection Firewall | Tracks connection states. | Improved security, context awareness. | Most modern network environments. |
|  | Circuit-Level Gateway | Monitors network sessions. | Session-level control. | Specific security protocols. |
|  | Application-Level Gateway (Proxy Firewall) | Inspects packet content. | Deep packet inspection, application control. | Advanced security, application-specific filtering. |
|  | Next-Generation Firewall (NGFW) | Combines multiple security functions. | Comprehensive threat protection, DPI, IPS, application control. | Modern networks requiring advanced security. |
| Network Function | NAT Firewall | Acts as intermediary between networks. | Hides internal IP addresses. | internal network protection. |
| Related Network Tools | Proxy Server | Intermediary for network services. | Caching, filtering, anonymity. | General network services. |
|  | SOCKS Proxy | Network protocol for secure connections. | secure connections through a proxy. | bypassing network restrictions. |

## Core Concepts and Requirements

- Purpose of Azure Firewall:

  - Centralized, cloud-native network security service.

  - Stateful packet inspection to protect Azure resources.

  - Acts as a network perimeter, controlling inbound and outbound traffic.

- Key Requirements Gathering:

  - Network Architecture Analysis:

    - Identify all Azure resources (VNets, subnets, VMs, databases, etc.).

    - Map traffic flow patterns (internal, external).

    - Pinpoint sensitive data locations.

  - Security Requirements:

    - Threat analysis (DDoS, malware, unauthorized access).

    - Compliance needs (PCI DSS, HIPAA).

    - Performance considerations (latency).

  - Firewall Selection Criteria:

    - Specific Security Needs: Alignment with organizational security goals.

    - Network Infrastructure: Compatibility with network topology and size.

    - Budgetary Constraints: Balancing cost and feature requirements.

    - Vendor Support: Reliable and responsive vendor support.

    - Core Functionality: L3-L4 filtering, stateful inspection, DPI, threat blocking.

    - Advanced Features: TLS inspection, DLP, advanced threat protection.

    - Operational Efficiency: Manageability, automation, scalability.

    - Security Posture: Policy alignment, visibility, emerging threat protection.

    - Administration: QoS, logging, identity integration, manageability, support.

    - Scalability: Ability to grow with the network's future needs.

    - Quality Support: Deep technical knowledge and 24/7/365 availability.

    - Regular Updates: Timely and frequent product updates.

## Azure Firewall Architecture Design

9.  Deployment Model:

    - Hub and Spoke: Recommended for most enterprise environments.

      - Azure Firewall deployed in a central hub VNet.

      - Spoke VNets connect to the hub via VNet peering.

      - Centralized security management.

    - Centralized: Suitable for simpler, single-VNet environments.

    - Regional: For redundancy and performance across multiple Azure regions.

10. Azure Firewall Configuration:

    - Pricing Tier Selection: Standard or Premium, based on feature needs.

    - Network Interfaces: Attach the firewall to a dedicated subnet (AzureFirewallSubnet).

    - Public IP Addresses: Assign if required for outbound internet access.

11. Network and Application Rules:

    - Network Rules (L3-L4):

      - Source and destination IP addresses/ranges.

      - Protocols and ports.

      - Allow or deny actions.

    - Application Rules (L7):

      - FQDNs (Fully Qualified Domain Names).

      - HTTP/HTTPS traffic control.

      - URL Filtering (Premium).

      - Web categories (Premium).

12. Threat Intelligence and Advanced Features:

    - Threat Intelligence: Enable built-in threat feeds.

    - Azure Firewall Premium:

      - TLS inspection.

      - URL filtering.

      - Web categories.

      - IDPS.

13. Azure Firewall Manager:

    - Centralized management of multiple Azure Firewalls.

    - Policy deployment across regions.

    - Route management.

14. Monitoring and Logging:

    - Azure Monitor Integration: Logs and metrics for firewall activity.

    - Alerting: Configure alerts for security events.

    - Logging and Monitoring: Comprehensive logging for troubleshooting and security analysis.

15. High Availability and Scalability:

    - Azure Firewall is inherently highly available.

    - Scales automatically with network traffic.

    - Multiple public IP addresses.

    - For High availability of your over all system, use the hub and spoke model, and utilize multiple firewalls in different regions.

16. Number of Firewalls:

    - Depends on network size, complexity, and security policies.

    - High availability often requires two firewalls in an active-passive or active-active configuration.

    - Consider regional deployments for global presence.

## Implementation Steps

5.  Pre-Assessment:

    - Determine if Azure Firewall is suitable for your needs.

    - Evaluate if Azure Firewall Manager is required.

6.  Deployment:

    - Create the Azure Firewall and configure network settings.

    - Define network and application rules.

    - Enable threat intelligence.

7.  Testing and Optimization:

    - Simulate traffic to validate rules.

    - Monitor performance and adjust settings.

    - Regularly review and update firewall rules.

8.  Administration

    - QoS and Bandwidth Management.

    - Identity Management Integration.

    - Manageability: User-friendly interface, customizable features, and detailed reporting.

    - Price: Reasonable initial cost and total cost of ownership.

    - Support: Responsive, high-quality support with multiple channels.

    - Reliability: High availability, redundancy, and robust support.

    - Compliance: Adherence to industry regulations and standards.

## Small Environment Considerations

- For small businesses, a single Azure Firewall instance in a centralized VNet might suffice.

- Focus on core features: network rules, threat intelligence.

- Next-Generation Firewalls (NGFWs): Comprehensive security with advanced features.

- Packet Filtering Firewalls: Basic security through packet inspection.

- Ensure proper logging and monitoring for basic security visibility.

- Prioritize ease of management and cost-effectiveness.

By following this detailed architecture, you can design and implement a robust Azure Firewall solution tailored to your specific environment and security needs.

# Deployment

[Azure Firewall Deployment Tutorial](https://docs.microsoft.com/azure/firewall/tutorial-firewall-deploy-portal)

## Checklist

| Phase | Task | Sub-Task | Description | Considerations |
|----|----|----|----|----|
| Phase 1: Planning and Design | 1.1 Network Assessment | Identify Network Segments | Document network topology, subnets, and traffic flows. | Existing infrastructure, application dependencies. |
|  |  | Analyze Traffic Flows | Determine inbound/outbound traffic patterns and protocols. | Security policies, performance requirements. |
|  | 1.2 Security Requirements | Define Security Policies | Document security rules, compliance, and data sensitivity. | Regulatory requirements, data classification. |
|  |  | Threat Protection Level | Determine required level of threat intelligence and prevention. | Risk assessment, security posture. |
|  | 1.3 Azure Environment Planning | Region Selection | Choose appropriate Azure region(s). | Latency, compliance, and availability. |
|  |  | VNet Architecture | Design virtual network and subnets, including AzureFirewallSubnet. | IP addressing, network segmentation. |
|  |  | Availability Zones | Determine the need for high availability deployment. | Business continuity, fault tolerance. |
|  |  | Firewall SKU Selection | Choose Standard or Premium SKU based on features. | Feature requirements, budget. |
|  |  | Firewall Policies | Determine if policies will be used and if so, design the policy structure. | Centralized management, scalability. |
|  | 1.4 IP Addressing and Routing | IP Address Planning | Allocate IP ranges for subnets. | Avoid overlaps, future expansion. |
|  |  | Route Table Design | Configure route tables for traffic redirection to the firewall. | Default routes, UDRs. |
|  |  | DNS Resolution | Plan DNS resolution for internal and external resources. | Azure DNS, custom DNS servers. |
|  |  | Forced Tunnelling | Determine if forced tunnelling is required. | Security, compliance. |
| Phase 2: Deployment | 2.1 Resource Group Creation | Create Resource Group | Create a dedicated resource group for the firewall. | Resource management, access control. |
|  | 2.2 VNet and Subnet Configuration | VNet Creation | Create the virtual network according to the design. | IP address space, region. |
|  |  | AzureFirewallSubnet Configuration | Configure the required AzureFirewallSubnet. | Naming convention, size. |
|  | 2.3 Azure Firewall Deployment | Deploy Firewall Resource | Deploy the Azure Firewall instance. | SKU selection, public IP. |
|  |  | Associate with Subnet | Associate the firewall with the AzureFirewallSubnet. | Correct subnet association. |
|  |  | Public IP Allocation | Allocate a public IP address to the firewall. | Public access, DNAT. |
|  |  | Firewall Policy Assignment | Assign the created firewall policy to the firewall. | Centralized rule management. |
|  | 2.4 Route Table Configuration | Create Route Tables | Create route tables to direct traffic to the firewall. | Default routes, subnet association. |
|  |  | Associate with Subnets | Associate route tables with workload subnets. | Traffic redirection. |
|  | 2.5 DNS Configuration | Configure DNS Settings | Configure DNS settings for the virtual network. | Internal and external resolution. |
| Phase 3: Firewall Rule Configuration | 3.1 Network Rule Configuration | Define Network Rules | Configure rules based on IP addresses, ports, and protocols. | Least privilege, service tags. |
|  | 3.2 Application Rule Configuration | Define Application Rules | Configure rules based on FQDNs and protocols. | FQDN tags, application dependencies. |
|  | 3.3 NAT Rule Configuration | Configure DNAT Rules | Configure rules for inbound traffic redirection. | Port forwarding, security. |
|  |  | Configure SNAT Rules | Configure rules for outbound traffic translation. | Source IP translation. |
|  | 3.4 IP Group Configuration | Create IP Groups | Create and configure IP groups for easier rule management. | IP address management, rule simplification. |
|  | 3.5 Threat Intelligence Configuration | Enable Threat Intelligence | Enable and configure threat intelligence feeds. | Malicious traffic blocking. |
| Phase 4: Monitoring and Logging | 4.1 Logging Configuration | Enable Firewall Logs | Enable Azure Firewall logs for monitoring. | Log analytics workspace. |
|  |  | Configure Log Analytics | Configure log analytics workspace for log storage. | Retention policies, query capabilities. |
|  |  | Configure Diagnostic Settings | Configure diagnostic settings for log forwarding. | Log types, destinations. |
|  | 4.2 Monitoring Configuration | Configure Azure Monitor Alerts | Configure alerts for firewall events. | Thresholds, notification settings. |
|  |  | Create Dashboards | Create dashboards for firewall monitoring. | Performance metrics, security events. |
|  |  | Integrate with Azure Sentinel | Integrate with Azure Sentinel for security analysis. | SIEM integration, threat detection. |
|  | 4.3 Performance Monitoring | Monitor Performance | Monitor firewall throughput and latency. | Performance baselines, capacity planning. |
| Phase 5: Testing and Validation | 5.1 Connectivity Testing | Test Connectivity | Test connectivity to internal and external resources. | Network reachability, firewall rules. |
|  | 5.2 Rule Validation | Validate Firewall Rules | Verify that firewall rules are working as expected. | Allowed/denied traffic, rule precedence. |
|  | 5.3 Security Testing | Perform Vulnerability Scans | Conduct vulnerability scans and penetration testing. | Security posture, risk assessment. |
|  | 5.4 Log Analysis | Review Firewall Logs | Analyze logs for anomalies and security events. | Incident response, threat detection. |
| Phase 6: Ongoing Maintenance | 6.1 Rule Maintenance | Update Firewall Rules | Regularly review and update firewall rules. | Rule optimization, security updates. |
|  | 6.2 Software Updates | Keep Firewall Updated | Keep the Azure Firewall software updated. | Security patches, feature updates. |
|  | 6.3 Performance Monitoring | Continuously Monitor | Continuously monitor firewall performance. | Capacity planning, performance tuning. |
|  | 6.4 Security Audits | Conduct Security Audits | Conduct regular security audits of the firewall. | Compliance, security posture. |
|  | 6.5 Log Review | Regularly Review Logs | Regularly review firewall logs for security events. | Threat hunting, incident response. |

## Initial Configuration

8.  Planning and Assessment:

    - Asset Identification:

      - Identify critical systems, data, and applications.

      - Categorize assets based on sensitivity and importance.

    - Risk Assessment:

      - Determine potential threats (e.g., malware, unauthorized access, data breaches).

      - Analyze vulnerabilities that could be exploited.

      - Understand the potential impact of security breaches.

9.  Security Policy Definition:

    - Establish clear rules for allowed and blocked traffic.

    - Specify protocols and ports (e.g., HTTPS, SSH, RDP, SQL).

    - Define how different traffic types are handled (e.g., inspection, logging, blocking).

    - Align policies with organizational security standards and compliance requirements.

10. Network Segmentation (Firewall Zones):

    - Create logical zones based on security requirements (e.g., internal, external, DMZ).

    - Isolate sensitive resources by placing them in separate zones.

    - Example Zones:

      - Internal Network: For trusted devices and servers.

      - External Network: For internet-facing resources.

      - DMZ (Demilitarized Zone): For public-facing servers that require limited access to internal networks.

11. Firewall Rule Configuration:

    - Implement rules to control traffic flow between zones.

    - Use the principle of least privilege (allow only necessary traffic).

    - Be specific with rules (source/destination IP addresses, ports, protocols).

    - Examples:

      - Allow HTTPS traffic from the internet to a web server in the DMZ.

      - Block RDP access from the internet to internal servers.

      - Allow all traffic between internal subnets.

12. Testing and Validation:

    - Conduct thorough testing before deploying the configuration in production.

    - Perform vulnerability scans and penetration testing.

    - Verify that legitimate traffic is allowed and malicious traffic is blocked.

    - Test failover and high availability scenarios.

13. Basic Details Configuration:

    - Subscription Selection.

    - Resource Group Assignment.

    - Firewall Policy Naming and Regional Location.

    - Parent Policy Implementation.

14. DNS Settings:

    - DNS Server Configuration:

      - Use Azure-provided DNS or configure custom DNS servers.

      - Ensure DNS resolution is reliable and secure.

    - DNS Proxy: Configure if needed for DNS traffic inspection.

    - Azure Firewall DNS settings: configure the firewall to act as a DNS proxy.

## Best Practices

- Default Deny Policy: Start with a policy that blocks all traffic and only allow necessary exceptions.

- Least Privilege: Grant only the minimum necessary permissions.

- Logging and Monitoring: Enable comprehensive logging to track traffic and identify security incidents.

- Regular Updates: Keep the firewall firmware and software up to date.

- Security Professional Consultation: Seek expert assistance if needed.

## Example Configuration (Hub-Spoke Model)

This example shows a common network architecture used in large enterprises.

- Scenario: A hub-spoke network with a central firewall in the hub virtual network.

- Components:

  - Hub Virtual Network (VNet-Hub):

    - Address space: 10.0.0.0/16

    - Subnet: AzureFirewallSubnet (10.0.0.0/24)

    - Resource Group: RG-Hub

    - Resource: Az-FW (Azure Firewall)

  - Spoke Virtual Network (VNet-Spoke):

    - Address space: 10.1.0.0/16

    - Subnet: devsubnet (10.1.0.0/24)

    - Resource Group: RG-Spoke

    - Resource: Az-VM (Virtual Machine)

- Firewall Rules (Example):

  - Allow outbound HTTPS (port 443) and HTTP (port 80) traffic from VNet-Spoke to the internet.

  - Allow inbound SSH (port 22) traffic from a specific administrator IP address to Az-VM.

  - Allow traffic between the hub and spoke networks.

  - Block all other inbound traffic from the internet.

  - DNS configuration: Use custom DNS servers located in the hub network, and enable DNS proxy.

  - Implement threat intelligence filtering on the firewall.

  - Configure Network address translation (NAT) rules as required.

- Implementation Notes:

  - Use User Defined Routes (UDRs) to route traffic from spoke VNets to the Azure Firewall in the hub VNet.

  - Implement Network Security Groups (NSGs) at the subnet level for granular traffic filtering.

  - Centralized logging of the firewall logs to a security information and event management (SIEM) system.

  - Implement Azure Firewall Manager for centralized management of multiple firewalls.

## Azure CLI

**Key Improvements and Explanations:**

11. **Variables:** Using variables at the beginning of the script makes it easier to modify and maintain.

12. **Resource Group and VNet Creation:** The script creates the resource groups and virtual networks with their respective subnets.

13. **Public IP and Azure Firewall Creation:** It creates a public IP for the firewall and then deploys the Azure Firewall into the hub VNet's AzureFirewallSubnet.

14. **Subnet and Public IP ID retrieval:** The script now retrieves the Subnet IDs and the Public IP ID using az network vnet subnet show and az network public-ip show and stores them in variables. This is crucial for linking resources.

15. **Firewall Private IP Retrieval:** The script retrieves the private IP address of the firewall, which is needed for the route table.

16. **VM Creation:** The script creates a virtual machine in the spoke VNet using the created network interface.

17. **Route Table and Route Creation:** The script creates a route table and a route to direct traffic from the spoke VNet to the Azure Firewall's private IP.

18. **Subnet Association:** The script associates the route table with the spoke VNet's subnet.

19. **Password Handling:** **Important:** Replace "YourStrongPassword!" with a strong, secure password. For production environments, consider using Azure Key Vault to manage secrets.

20. **Username:** replace "azureuser" with your desired username.

**How to Run the Script:**

6.  **Azure CLI:** Ensure you have the Azure CLI installed and configured.

7.  **Login:** Log in to your Azure account using az login.

8.  **Save:** Save the script to a file (e.g., deploy_azfw.sh).

9.  **Permissions:** Make the script executable: chmod +x deploy_azfw.sh.

10. **Run:** Execute the script: ./deploy_azfw.sh.

\#!/bin/bash

\# Define variables

LOCATION="centralindia"

RG_HUB="rghub"

RG_SPOKE="rgspoke"

VNET_HUB_NAME="VNET-Hub"

VNET_SPOKE_NAME="VNET-Spoke"

FW_SUBNET_NAME="AzureFirewallSubnet"

VM_SUBNET_NAME="Subnet-VM"

FW_PIP_NAME="azfw-pip"

FW_NAME="azfw"

VM_NIC_NAME="VM-NIC"

VM_NAME="VM-Win"

VM_SIZE="Standard_DS2_v2"

VM_IMAGE="MicrosoftWindowsServer:WindowsServer:2019-Datacenter:latest"

VM_USERNAME="azureuser" \# Replace with your desired username

VM_PASSWORD="YourStrongPassword!" \# Replace with a strong password

\# Create resource groups

az group create --name \$RG_HUB --location \$LOCATION

az group create --name \$RG_SPOKE --location \$LOCATION

\# Create hub virtual network and subnet

az network vnet create --resource-group \$RG_HUB --name \$VNET_HUB_NAME --address-prefixes 10.0.0.0/16 --subnet-name \$FW_SUBNET_NAME --subnet-prefixes 10.0.0.0/24

\# Create spoke virtual network and subnet

az network vnet create --resource-group \$RG_SPOKE --name \$VNET_SPOKE_NAME --address-prefixes 10.1.0.0/16 --subnet-name \$VM_SUBNET_NAME --subnet-prefixes 10.1.0.0/24

\# Create public IP for Azure Firewall

az network public-ip create --resource-group \$RG_HUB --name \$FW_PIP_NAME --location \$LOCATION --allocation-method Static --sku Standard

\# Get the subnet ID of the AzureFirewallSubnet

FW_SUBNET_ID=\$(az network vnet subnet show --resource-group \$RG_HUB --vnet-name \$VNET_HUB_NAME --name \$FW_SUBNET_NAME --query id --output tsv)

\# Get the public IP ID of the firewall public ip.

FW_PIP_ID=\$(az network public-ip show --resource-group \$RG_HUB --name \$FW_PIP_NAME --query id --output tsv)

\# Create Azure Firewall

az network firewall create --resource-group \$RG_HUB --name \$FW_NAME --location \$LOCATION --public-ip-address \$FW_PIP_ID --vnet-name \$VNET_HUB_NAME --subnet-name \$FW_SUBNET_NAME

\# Get the private IP of the Azure firewall.

FW_PRIVATE_IP=\$(az network firewall ip-config list --resource-group \$RG_HUB --firewall-name \$FW_NAME --query "\[0\].privateIpAddress" -o tsv)

\# Create network interface for VM

VM_SUBNET_ID=\$(az network vnet subnet show --resource-group \$RG_SPOKE --vnet-name \$VNET_SPOKE_NAME --name \$VM_SUBNET_NAME --query id --output tsv)

az network nic create --resource-group \$RG_SPOKE --name \$VM_NIC_NAME --location \$LOCATION --subnet \$VM_SUBNET_ID

\# Create virtual machine

az vm create --resource-group \$RG_SPOKE --name \$VM_NAME --location \$LOCATION --nics \$VM_NIC_NAME --image \$VM_IMAGE --size \$VM_SIZE --admin-username \$VM_USERNAME --admin-password "\$VM_PASSWORD"

\# Create route table for spoke subnet

az network route-table create --resource-group \$RG_SPOKE --name SpokeRouteTable --location \$LOCATION

\# Create route to Azure Firewall

az network route-table route create --resource-group \$RG_SPOKE --route-table-name SpokeRouteTable --name DefaultRoute --address-prefix 0.0.0.0/0 --next-hop-type VirtualAppliance --next-hop-ip-address \$FW_PRIVATE_IP

\# Associate route table with spoke subnet

az network vnet subnet update --resource-group \$RG_SPOKE --vnet-name \$VNET_SPOKE_NAME --name \$VM_SUBNET_NAME --route-table SpokeRouteTable

## Firewall Deployment

- **Placement:**

  - Perimeter: At the network edge to protect against external threats.

  - Internal: To segment the internal network.

- **Azure Deployment:** Specific steps for configuring rules in the Azure Portal.

- **Number of Firewalls:** Factors influencing the number of firewalls required:

  - Network size and complexity

  - Data sensitivity

  - Organizational security policies

  - Threat landscape

  - Cost-benefit analysis

- **Deployment Strategies:**

  - Phased deployment

  - Pilot testing

# Policies

## 1. Core Concepts: Network Firewall Policies

- Definition:

  - Network firewall policies are sets of rules that control network traffic flow.

  - They determine which traffic is allowed or blocked based on various criteria.

- Key Factors for Policy Decisions:

  - Source and destination IP addresses

  - Protocols (e.g., TCP, UDP, ICMP)

  - Port numbers

- Purpose:

  - To secure a network by filtering traffic.

  - To prevent unauthorized access.

## 2. Types of Firewall Policies

- Core Policies:

  - Fundamental rules defining allowed and blocked protocols.

  - The foundation of network security.

- System Policies:

  - Manage traffic to and from the firewall itself.

  - Essential for management, monitoring, VPN, and DNS.

- Application Policies:

  - Control traffic for specific applications.

  - Restrict access, prioritize traffic, and enhance security.

- Content Policies:

  - Control traffic based on packet content.

  - Block malicious traffic and filter unwanted content.

- Default Policies:

  - Pre-configured by vendors, often allowing all traffic.

  - Highly discouraged for production environments due to security risks.

- Stateful vs. Stateless Policies:

  - Stateful: Tracks connection states for enhanced security.

  - Stateless: Evaluates each packet independently, simpler but less secure.

- Hierarchical Policies:

  - Organize rules in a hierarchy for complex environments.

  - Improve manageability and scalability.

- Zone-Based Policies:

  - Divide the network into zones with specific security rules for each zone.

  - Example zones: internal, external, DMZ.

- Web Filtering Policies:

  - Block access to specific websites or categories of websites.

- VPN Policies:

  - Configure secure tunnels for remote access.

- IDS/IPS Policies:

  - IDS (Intrusion Detection System): Detects and alerts on suspicious activity.

  - IPS (Intrusion Prevention System): Actively blocks or mitigates threats.

- Network Rules:

  - Rules that filter based on network layer information (IP addresses, protocols, ports).

- Application Rules:

  - Rules that filter based on application layer information (specific applications).

- DNAT Rules:

  - Destination Network Address Translation rules, used to redirect traffic to different internal servers.

## 3. Firewall Zoning

- Definition:

  - Segmenting a network into zones based on trust levels.

- Zone Examples:

  - Internal Zone (High Trust): User workstations, servers.

  - External Zone (Low Trust): Internet-connected devices.

  - DMZ (Demilitarized Zone): Publicly accessible servers (web, email).

- Benefits:

  - Reduced attack surface.

  - Contained malware spread.

  - Improved compliance.

- DMZ Security Best Practices:

  - Use two firewalls: one internet-facing, one internal-facing.

  - Use different firewall types for added security.

  - Use dual NICs for DMZ servers.

  - Maintain separate rule sets.

## 4. Security Practices

- Egress Filtering:

  - Allow only authorized traffic to leave the network.

  - Log or drop unauthorized outbound traffic.

- Web Content Filtering:

  - Block access to malicious or inappropriate websites.

- Application Control:

  - Restrict software execution to prevent malware.

- Change Management:

  - Formal process for firewall modifications:

    - Request, review, and analyze changes.

    - Test changes in a controlled environment.

    - Deploy and verify changes.

    - Document all changes.

- Traffic Filtering:

  - Default "deny all" policy.

  - Explicitly allow necessary traffic.

  - Filter out unwanted traffic.

  - Monitor and log suspicious traffic.

- Explicit Drop Rule:

  - Implement a "drop all" rule at the end of each security zone.

  - Log blocked traffic for analysis.

- Remove "Accept All" Rules:

  - Avoid "accept all" rules, as they create security vulnerabilities.

- Defense in Depth:

  - Firewall is one component of a layered security approach.

  - Integrate with IDS/IPS, OS security, etc.

- Rulesets:

  - Tailor rulesets to specific organizational needs.

  - Mandatory rules (e.g., blocking private addresses).

- Port Policy:

  - Restrict unnecessary ports.

  - Verify service requirements before blocking.

  - Use secure alternatives (e.g., SSH instead of Telnet).

## Network Policy vs. Firewall Policy

- Network Policy:

  - A broader set of rules governing overall network behavior.

  - May include routing, QoS, and other network-level configurations.

- Firewall Policy:

  - Specifically focuses on controlling traffic flow through the firewall.

  - A subset of the overall network policy.

- Service Access Policy:

  - Specifies which services are allowed to be accessed, and by whom.

- Firewall Design Policy:

  - Defines the overall architecture, placement, and configuration of firewalls within the network.

# Network Rules vs Applications Rules for WindowsUpdate and Azure Monitor

To allow **outbound connectivity through Azure Firewall** for **Windows Updates** and **Azure Monitor**, you need to configure **both network and/or application rules**, depending on the **type of traffic and destination**.

Here’s a breakdown of what rules to configure and their prerequisites:

## 🔷 1. Application Rules (Preferred when FQDNs are available)

**Use Case:** When destination endpoints are accessible via **FQDNs (Fully Qualified Domain Names)** such as for Windows Updates and Azure Monitor endpoints.

**✅ Required for:**

- **Windows Update**

- **Azure Monitor**

- **Azure AD (if monitoring uses it)**

- **Microsoft Defender ATP (if used)**

**🛠️ Pre-requisites:**

- **DNS resolution** must be set up:

  - Azure Firewall must be able to resolve external FQDNs.

  - Ensure you have a **custom DNS or Azure DNS** in your Virtual Network settings.

### 🔧 Examples of Application Rules:

Name: Allow-Windows-Updates

Protocol: HTTPS:443

Target FQDNs:

\- \*.windowsupdate.com

\- \*.update.microsoft.com

\- \*.dl.delivery.mp.microsoft.com

\- \*.delivery.mp.microsoft.com

Name: Allow-Azure-Monitor

Protocol: HTTPS:443

Target FQDNs:

\- \*.monitor.azure.com

\- \*.ods.opinsights.azure.com

\- \*.oms.opinsights.azure.com

\- \*.azure-automation.net

## 🔶 2. Network Rules (Used when IPs or non-HTTP/S protocols are needed)

**Use Case:** When services use **fixed IPs, ports**, or **non-HTTP/S protocols** (like NTP, DNS, etc.)

**✅ Required for:**

- **NTP traffic** (UDP:123)

- **DNS resolution** (UDP/TCP:53)

- **Windows Activation** (optional)

**🛠️ Pre-requisites:**

- You need to know the **destination IP ranges or service tags**.

- Use **Service Tags** when possible (e.g., AzureMonitor, WindowsUpdate).

  - Azure Firewall supports **service tags in network rules only**, not application rules.

### 🔧 Examples of Network Rules:

**Name: Allow-DNS**

Protocol: UDP

Port: 53

Destination: \<Your DNS IP\> (e.g., Azure DNS 168.63.129.16)

**Name: Allow-NTP**

Protocol: UDP

Port: 123

Destination: time.windows.com (resolve IP or allow via tag)

**Name: Allow-AzureMonitor**

Protocol: HTTPS

Port: 443

Destination: Service Tag: AzureMonitor

**✅ Summary of What You Need:**

| **Service**        | **Rule Type**       | **Required**                       |
|--------------------|---------------------|------------------------------------|
| Windows Update     | Application Rule    | FQDNs (\*.windowsupdate.com, etc.) |
| Azure Monitor      | Application Rule    | FQDNs (\*.monitor.azure.com, etc.) |
| DNS                | Network Rule        | Allow UDP/53 to your DNS server    |
| NTP                | Network Rule        | Allow UDP/123 to time servers      |
| Windows Activation | Application/Network | Optional, via FQDN or IP           |

## If Service tags available then which rules network or application?

Great point — since **Service Tags are available for both WindowsUpdate and AzureMonitor**, you might wonder if **network rules** alone are enough. Here's a clear breakdown of what to use **and why**, depending on **Azure Firewall rule types and limitations**.

**Key Difference:**

| **Rule Type** | **Supports Service Tags** | **Supports FQDNs** | **Use Case** |
|----|----|----|----|
| **Network Rules** | ✅ Yes | ❌ No | When using IP ranges or **Service Tags** |
| **Application Rules** | ❌ No | ✅ Yes | When needing **FQDNs** and HTTP/S only |

🔥 **Azure Firewall Application Rules do NOT support Service Tags.**\
🔥 **Service Tags can only be used in Network Rules.**

## ✅ So what should you configure?

**🔶 Use Network Rules with Service Tags for:**

- **WindowsUpdate**

- **AzureMonitor**

These are officially supported service tags in Azure and should be configured in **Network Rules**, not application rules.

## ⚙️ Recommended Network Rules

**🔧 Example:**

Rule Collection: Allow-Microsoft-Services

Rule 1:

**Name: Allow-WindowsUpdate**

Rule Type: Network

Protocol: HTTPS

Port: 443

Destination: Service Tag: WindowsUpdate

Rule 2:

**Name: Allow-AzureMonitor**

Rule Type: Network

Protocol: HTTPS

Port: 443

Destination: Service Tag: AzureMonitor

**📌 Pre-requisites for Network Rules with Service Tags:**

1.  **Azure Firewall must be deployed in the same region** as the virtual network using it.

2.  You must **explicitly allow DNS** (UDP/TCP port 53) to ensure domain resolution if your VMs rely on public endpoints.

3.  You may still need **Application Rules** if:

    - Service is not available via a service tag (e.g., custom domains).

    - You want finer control based on FQDN filtering.

**✅ Conclusion**

| **Service** | **Recommended Rule Type** | **Why** |
|----|----|----|
| Windows Update | Network Rule (with Service Tag) | Easier and future-proof |
| Azure Monitor | Network Rule (with Service Tag) | Same |
| DNS | Network Rule | For DNS resolution |
| Custom FQDNs | Application Rule | When service tag is not available |

## FQDN Tags

Great follow-up! Yes, you **can** use **FQDN Tags** in **Azure Firewall Application Rules** — and they are specifically designed for that purpose.

**✅ FQDN Tags in Application Rules – Supported**

**FQDN Tags** are a feature of **Azure Firewall Application Rules** that let you simplify rule creation for well-known Microsoft services.

⚠️ **Don't confuse FQDN Tags with Service Tags**:

- **FQDN Tags** → for **Application Rules** (FQDN-based HTTP/S filtering).

- **Service Tags** → for **Network Rules** (IP/port-based filtering).

**🔧 Example of FQDN Tag in Application Rule:**

{

"ruleCollectionName": "AppRuleCollection1",

"priority": 100,

"action": "Allow",

"rules": \[

{

"name": "AllowAzureMonitor",

"ruleType": "ApplicationRule",

"protocols": \[

{

"protocolType": "Https",

"port": 443

}

\],

"fqdnTags": \[ "AzureMonitor" \]

}

\]

}

**📌 List of Common FQDN Tags Available:**

These are just a few examples:

- WindowsUpdate

- AzureMonitor

- AzureActiveDirectory

- AppServiceEnvironment

- MicrosoftContainerRegistry

📚 **Official Microsoft Docs:**

- 🔗 [FQDN tags in Azure Firewall (Microsoft Docs)](https://learn.microsoft.com/en-us/azure/firewall/fqdn-tags)

**🧠 TL;DR**

| **Feature**      | **Supports Application Rules** | **Supports Network Rules** |
|------------------|--------------------------------|----------------------------|
| **FQDN Tags**    | ✅ Yes                         | ❌ No                      |
| **Service Tags** | ❌ No                          | ✅ Yes                     |

So yes — **use FQDN Tags in Application Rules** when targeting known Microsoft services like Windows Update or Azure Monitor **over HTTP/HTTPS**.

Let me know if you want a sample deployment template for that!

## FQDN vs Service tags

Exactly — you’ve got it! ✅

Here's the clarified summary:

**✅ FQDN Tags → Application Rules**

- Used for **HTTP/S traffic only** (port 80/443).

- Filters based on **domains (FQDNs)**.

- Works **only in Application Rules**.

- Great for services like:

  - WindowsUpdate

  - AzureMonitor

  - AzureActiveDirectory

📘 **Docs:** [FQDN Tags in Azure Firewall](https://learn.microsoft.com/en-us/azure/firewall/fqdn-tags)

**✅ Service Tags → Network Rules**

- Used for **any protocol/port** (TCP, UDP, etc.).

- Filters based on **IP ranges abstracted as tags**.

- Works **only in Network Rules**.

- Great for:

  - Allowing all Azure service IPs via tags like:

    - WindowsUpdate

    - AzureMonitor

    - Storage

    - VirtualNetwork

📘 **Docs:** [Service Tags in Azure Firewall](https://learn.microsoft.com/en-us/azure/firewall/service-tags)

**📌 TL;DR:**

| **Feature Type** | **Application Rule** | **Network Rule** | **Use Case** |
|----|----|----|----|
| **FQDN Tags** | ✅ Supported | ❌ Not Supported | Domain-based access (HTTP/S) |
| **Service Tags** | ❌ Not Supported | ✅ Supported | IP-based access (any protocol) |

Let me know if you want help designing the rule collections or deploying them via Bicep/ARM/Terraform!

## Network Rules

To create a policy, you will. An **Azure Firewall Policy** is composed of rule collection groups.

- **Rule collection group**: It is a collection of related rules. First create at least one rule collection then create rules with conditions.

- **Rules**: It defines the action to be taken when certain conditions are met.

- **Types of Rule Collection Groups (RCG)**

- Allow all outbound traffic to the internet.

- Allow all traffic between internal networks.

## Basic Rules

- General Inbound/Outbound:

  - Block all incoming and outgoing traffic.

  - Block all incoming traffic except for established connections.

  - Block all traffic except for a specific service (e.g., SSH).

- Internet/DMZ Traffic:

  - Block all inbound traffic from the internet, except for traffic to specific ports (e.g., HTTPS, SSH).

  - Block all traffic between the DMZ and the internet, except for traffic to specific ports (e.g., HTTPS, SSH).

  - Allow specific traffic between the DMZ and internal networks (e.g., HTTPS, SMTP, POP3).

- Basic Allow:

  - Open a custom port range (e.g., 5000-6000).

  - Open port 123 for NTP (Network Time Protocol).

## Protocol-Specific Rules

- DNS:

  - Allow DNS (port 53) for both TCP and UDP.

  - Allow DNS traffic only for a specific domain.

- FTP:

  - Allow FTP (port 21) for a specific interface.

  - FTP Rule.

- SSH:

  - Allow SSH (port 22) from a specific IP address.

  - Allow SSH on a non-default port (e.g., 2222).

  - SSH Rule.

- Telnet:

  - Telnet Rule.

- SMTP:

  - Allow outgoing SMTP traffic (port 25) for a specific IP range.

- RDP:

  - Allow RDP (Remote Desktop Protocol - port 3389) from a specific IP address.

- SIP:

  - Allow SIP (Session Initiation Protocol - port 5060) for VoIP.

- SNMP:

  - Allow SNMP (Simple Network Management Protocol - port 161) for monitoring.

  - Allow traffic on a custom port range for a specific service (e.g., SNMP).

- NFS:

  - Allow NFS (Network File System - port 2049) for file sharing.

- NTP:

  - Allow NTP traffic (port 123) for both TCP and UDP.

- ICMP:

  - Allow ICMP echo requests (ping) from a specific subnet.

  - Block ICMP echo requests (ping) from a specific IP address.

  - Block incoming ICMP (ping) requests.

- Multicast:

  - Allow multicast traffic.

  - Allow multicast traffic for IPv6.

## Port-Specific Rules

- Single Port:

  - Allow incoming and outgoing traffic on a specific port only for a specific time.

  - Allow incoming traffic on a specific port for both TCP and UDP, limiting it to a specific user.

  - Allow incoming traffic on a specific port for IPv6 (e.g., port 8080).

  - Allow only specific IP addresses on a certain port (e.g., 8080).

  - Allow traffic on a specific port for a range of IP addresses during specific days and times.

  - Allow traffic on a specific port for a specific service and network interface.

  - Allow traffic on a specific port for a specific service and source IP address.

  - Allow traffic on a specific port for a specific service, source IP address, and interface.

  - Allow traffic on a specific port for a specific service, source MAC address, and interface.

  - Allow traffic on a specific port for a specific service, source MAC address, and source IP address.

  - Block outgoing traffic on a specific port (e.g., 8080).

  - Block traffic from a specific IP address range on a specific port.

  - Block traffic on a specific port for a specific service and source IP address.

- Port Ranges:

  - Allow incoming connections on a specific port range (e.g., 8000-9000) for UDP.

  - Allow traffic on a custom port range for a specific application and user.

  - Allow traffic on a custom port range for both TCP and UDP (e.g., 7000-8000).

  - Allow traffic on a specific port range for a specific application.

  - Allow traffic on a specific port range for a specific application and destination IP address.

  - Allow traffic on a specific port range for a specific application, user, and interface.

  - Allow traffic on a specific port range for a specific application, user, and source IP address.

  - Allow traffic on a specific port range for a specific application, user, and destination IP address.

  - Allow traffic on a specific port range for a specific application, user, source IP address, and interface.

  - Allow traffic on a specific port range for both TCP and UDP, limiting it to a specific IP address.

  - Allow traffic on a specific port range for both TCP and UDP, limiting it to a specific MAC address.

  - Allow traffic on a specific port range for both TCP and UDP, limiting it to a specific user and interface.

  - Block incoming traffic on a specific port range for a specific application.

  - Block incoming traffic on a specific port range for a specific application and source IP address.

  - Block incoming traffic on a specific port range for a specific application and destination IP address.

  - Block incoming traffic on a specific port range for a specific application and interface.

  - Block incoming traffic on a specific port range for a specific application, user, and source IP address.

## Application/Service-Specific Rules

- Specific Applications:

  - Allow specific application traffic (e.g., Apache).

  - Allow traffic for a specific application (e.g., PostgreSQL).

  - Allow traffic for a specific UDP service (e.g., syslog - port 514).

- Specific Services:

  - Allow traffic for a specific service from a specific IP address range.

  - Allow traffic for a specific service on a custom interface (e.g., eth1).

  - Block specific service (e.g., Telnet).

  - Block traffic from a specific MAC address for a specific service.

  - Block traffic from a specific MAC address for a specific service and interface.

  - Block traffic to a specific domain for a specific service (e.g., SSH).

  - Block traffic from a specific country for a specific service (e.g., SSH).

  - Block traffic from a specific country on a specific port for a specific service.

## User/Identity-Based Rules

- User Specific:

  - Allow traffic for a specific user.

  - Allow traffic for a specific user and specific service.

  - Allow traffic for a specific user on a custom port.

  - Block incoming and outgoing traffic on a specific port for a specific user.

  - Block traffic from a specific user on a custom port.

## Network/Interface-Based Rules

- Network Interface:

  - Allow incoming traffic on a specific network interface (e.g., eth1).

  - Allow traffic from and to a specific network interface (e.g., eth0).

  - Allow traffic on a specific port for a specific service and network interface.

- Network Range:

  - Allow traffic from a specific network range.

- IP Address:

  - Block traffic to a specific IP address.

  - Block outgoing traffic to a specific IP address.

- MAC Address:

  - Allow traffic from a specific MAC address.

  - Block specific MAC address.

  - Block traffic from a specific MAC address for a specific service.

  - Block traffic from a specific MAC address for a specific service and interface.

- Docker:

  - Allow Docker containers to communicate on a bridge network.

## Location-Based Rules

- Country:

  - Allow traffic from a specific country on a specific port (e.g., 8080).

  - Allow traffic on a specific port range from a specific country.

  - Block traffic from a specific country (e.g., Russia).

  - Block incoming traffic on a specific port range for a specific country.

  - Block traffic from a specific country for a specific service (e.g., SSH).

  - Block traffic from a specific country on a specific port for a specific service.

### SQL Server Port Configuration Table

| Protocol | Port(s) | Description | Purpose | Notes |
|----|----|----|----|----|
| TCP | 1433 | SQL Server Instance / Availability Group Listener | Default port for SQL Server connections and AG listener communication. | Can be changed. Most common port. |
| TCP/UDP | 1434 | SQL Server Browser | Discovery of named SQL Server instances. | Essential for named instances; can be disabled. |
| TCP | 5022 | Database Mirroring / Availability Group Endpoint | Communication for database mirroring and AG replication. | Default, but configurable. Crucial for High Availability. |
| TCP/UDP | 49152-65535 | Dynamic Port Range | Dynamic allocation for various SQL Server operations. | Configurable; adjust based on security policies. |
| UDP | 2382 | SQL Server Analysis Services Browser | Discovery of Analysis Services instances. | Used by Analysis Services. |
| TCP | 2383 | SQL Server Analysis Services Listener | Connections to Analysis Services. | Used by Analysis Services. |
| TCP | 80/443 | HTTP/HTTPS Endpoints | Web-based access to SQL Server instances. | Used for web connections. |
| TCP | 443 | Default Instance HTTPS Endpoint | Secure web connections to the default instance. | Used for secure web connections. |
| TCP | 4022 | SQL Server Service Broker | Communication for Service Broker. | Commonly used, but not a default port. |

### SQL Server Security and Configuration Rules

| Rule | Description | Notes |
|----|----|----|
| Firewall Configuration | Open only necessary ports based on services used. Implement IP whitelisting. | Regularly review and update rules. |
| Dynamic Port Management | Adjust the dynamic port range according to security policies. | Limit the range to reduce attack surface. |
| Named Instances | Ensure TCP/UDP 1434 is open if using named instances. Disable SQL Server Browser if not used. | Consult error logs for specific port numbers. |
| Availability Groups | Open TCP 1433 and 5022. | Avoid interrupting port 5022 to prevent quorum issues. |
| Analysis Services | Open UDP 2382 and TCP 2383 if used. | Ensure proper configuration. |
| Additional Security | Implement network segmentation, strong authentication, NSGs, and access controls. | Mitigate risks and enhance protection. |
| Port Configuration | Document all port configurations. | Some ports are configurable. |
| Regular Reviews | Regularly review and update firewall rules and security configurations. | Adapt to system changes. |

 

 

### Windows Server Ports

General Windows Server Ports (Non-Clustering Specific)

| Protocol | Port | Purpose                         |
|----------|------|---------------------------------|
| TCP      | 25   | SMTP (Email Sending)            |
| TCP      | 110  | POP3 (Email Receiving)          |
| TCP      | 143  | IMAP (Email Receiving)          |
| TCP      | 21   | FTP (File Transfer)             |
| TCP      | 3389 | RDP (Remote Desktop Protocol)   |
| TCP      | 5900 | VNC (Virtual Network Computing) |
| TCP      | 80   | HTTP (Web Browsing)             |
| TCP      | 443  | HTTPS (Secure Web Browsing)     |
| TCP/UDP  | 53   | DNS (Domain Name System)        |

Windows Server Clustering Specific Ports

| Protocol | Port | Purpose | Notes |
|----|----|----|----|
| TCP/UDP | 3343 | Cluster Network Communication | Essential for heartbeat and node communication. |
| TCP/UDP | 88 | Kerberos | User and computer authentication. |
| TCP/UDP | 389 | LDAP | Lightweight Directory Access Protocol. |
| TCP/UDP | 445 | SMB | Server Message Block (File sharing, cluster communication, File Share Witness) |
| UDP | 137 | NetBIOS Name Service | Authentication and cluster communication |
| UDP | 138 | NetBIOS Datagram Service | Authentication and cluster communication |
| TCP | 139 | NetBIOS Session Service | Authentication and cluster management |
| TCP | 464 | Kerberos Change/Set Password | Kerberos password changes. |
| TCP | 3268 | Global Catalog | Directory services. |
| TCP | 3269 | Global Catalog SSL | Secure directory services. |
| TCP | 636 | LDAP SSL | Secure LDAP communication. |
| TCP | 135 | RPC Endpoint Mapper | Remote Procedure Call. |
| UDP | 123 | NTP | Network Time Protocol (Time synchronization). |
| TCP | 5985 | WinRM | Windows Remote Management. |
| TCP | 5986 | WinRM HTTPS | Secure Windows Remote Management. |
| TCP/UDP | 49152+ | Dynamic RPC Ports | Range varies; check your environment. |
|  |  |  |  |

Monitoring Ports

| Protocol | Port | Purpose    |
|----------|------|------------|
| UDP      | 161  | SNMP       |
| UDP      | 162  | SNMP Traps |

## Application Rules

### Azure services

Allow the Azure portal URLs on your firewall or proxy server.

<https://learn.microsoft.com/en-us/azure/azure-portal/azure-portal-safelist-urls?tabs=public-cloud>

### Microsoft Entra

Ports required for Microsoft Entra Hybrid Identity:

Hybrid Identity Required Ports and Protocols

Microsoft Entra and AD

Firewall ports need to be opened between ADFS and AD servers?

Ports required to open between ADFS and AD servers

Microsoft Entra, Azure AD, and AD

<https://learn.microsoft.com/en-us/azure/active-directory/hybrid/reference-connect-ports>

<https://stackoverflow.com/questions/50327955/ports-required-to-open-for-azure-active-directory>

<https://stackoverflow.com/questions/51859053/which-firewall-ports-need-to-be-opened-up-between-adfs-and-ad-servers>

<https://techcommunity.microsoft.com/t5/azure/which-port-to-join-domain-azure-ad-domain-service/m-p/521459>

### Microsoft 365

Microsoft 365 and Office 365 URLs and IP address range 

<https://learn.microsoft.com/en-us/microsoftteams/office-365-urls-ip-address-ranges>

## DNAT Rules

**I. Summary**

The provided text offers a comprehensive overview of network firewalls, covering core principles, configuration processes, specific examples (like Azure and Git), policy considerations (web services, filtering, etc.), and deployment strategies. It emphasizes the "Principle of Least Privilege," the importance of accurate port/protocol/FQDN identification, and the need for a layered security approach.

## C. Firewall Policy

- **Core Principles:**

  - Principle of Least Privilege

  - Default Deny

  - Specificity of rules

  - No Implicit Allow

- **Rule Configuration:**

  - Whitelisting specific ports, protocols, services, and FQDNs.

  - Avoiding wildcard rules.

  - Regular review and updates.

- **Web Services Policy:**

  - Endpoint validation

  - Protocol restriction

  - Input validation

  - Rate limiting

  - IP whitelisting/blacklisting

  - Web Application Firewall (WAF)

  - Logging and monitoring

- **Filtering Policies:**

  - Web filtering policies

  - Application control policies

  - Data Loss Prevention (DLP) policies

  - Zero-Trust policies

- **Basic Firewall Configuration:**

  - Blocking spoofed IPs

  - Blocking routing protocols

  - Port restrictions

  - ICMP restrictions

  - IP Masquerading

  - Zone transfer protection

  - Egress filtering

- **Advanced Firewall Features (Policy Implications):**

  - Application-Level Firewall

  - User Authentication

- **Firewall Management:**

  - Regular updates

  - Log analysis

  - Integration with other security systems

## Corrections and Clarifications

Here are some corrections and clarifications to the information:

- **FQDNs:**

  - It's crucial to emphasize that FQDN resolution (DNS) must be working correctly for FQDN-based rules to function.

  - Using FQDNs can add complexity, as IP addresses associated with a FQDN can change. Consider the dynamic nature of cloud environments.

- **Protocols:**

  - Be precise about protocols. TCP and UDP are transport layer protocols. HTTP, HTTPS, SMTP, etc., are application layer protocols that use TCP or UDP.

  - For example, DNS primarily uses UDP port 53, but TCP port 53 is used for zone transfers.

- **Port Ranges:**

  - Document the *specific reason* for port ranges. Opening broad ranges increases risk. If possible, avoid ranges and use specific ports.

- **Azure PaaS:**

  - Service tags are indeed a best practice in Azure. They simplify management and automatically update when Microsoft changes the underlying IP addresses for Azure services.

- **Git Ports:**

  - Clarify that while port 9418 is used for the git:// protocol (which is insecure and rarely used), Git primarily operates over SSH (port 22) or HTTPS (port 443).

- **Web Services Policy:**

  - Emphasize the importance of API security best practices in web service firewall policies, such as input validation, output encoding, and authentication/authorization.

- **"Should be Restricted" Ports:**

  - The note that HTTP (port 80) "Should be Restricted" is a bit misleading. While HTTPS (port 443) is preferred for secure web traffic, HTTP is still used in many scenarios. The key is to have a policy that aligns with your security needs. If possible, redirect HTTP to HTTPS.

- **netstat and Task Manager:**

  - The instructions for using netstat and Task Manager are generally correct, but it's important to note that some processes might run under system accounts or other user accounts, which can make identification more challenging.

- **URL Filtering:**

  - URL filtering can be done at the firewall level or using separate proxy servers or security appliances.

- **ICMP:**

  - While allowing basic ICMP (like ping) is often useful for troubleshooting, be cautious about allowing all ICMP traffic, as some ICMP types can be used for attacks.

- **Opening Ports Securely:**

  - Emphasize the importance of regularly auditing firewall rules, removing unnecessary rules, and keeping the firewall software updated.

- **Firewall Rules:**

  - Firewall rules should be as specific as possible. Instead of opening a port for "any" source IP to "any" destination IP, specify the exact source and destination IP addresses or network ranges.

## Key Improvements and Additional Points

- **Zero Trust:** Expand on Zero Trust. It's not just a policy; it's a security model that assumes no user or device, whether inside or outside the network perimeter, can be automatically trusted. Firewall policies play a crucial role in enforcing Zero Trust principles.

- **Micro-segmentation:** Discuss micro-segmentation, which involves creating very granular security zones within the data center or cloud environment. Firewalls, especially next-generation firewalls, are essential for micro-segmentation.

- **Threat Intelligence:** Mention the importance of integrating threat intelligence feeds into firewall policies. This allows the firewall to block traffic from known malicious sources.

- **Automation:** Highlight the role of automation in firewall management. Tools and scripts can be used to automate tasks like rule creation, updates, and auditing.

- **Context Awareness:** Emphasize the need for firewalls to be context-aware. This means that the firewall can make decisions based on factors like the user's identity, the device type, and the application being used.

- **Logging and Monitoring:**

  - Firewall logs are critical for security monitoring, incident response, and auditing.

  - Implement robust logging and monitoring solutions.

  - Use Security Information and Event Management (SIEM) systems to analyze firewall logs and detect security threats.

By incorporating these corrections, clarifications, and additional points, you can create a more accurate, comprehensive, and valuable resource on network firewalls.

# Proxy feature in Azure Firewall

The **explicit proxy** feature on a firewall refers to a configuration where **client devices are explicitly told to forward their web traffic to a proxy server (in this case, the firewall itself)** for processing, rather than sending it directly to the internet.

**What is a proxy?**

A **proxy** sits between a client (like a web browser) and the internet. It receives client requests, processes them, and forwards them to the destination. It can inspect, filter, cache, and log the traffic.

**Explicit Proxy means:**

- The **client knows about the proxy** and is configured to send traffic to it.

- Commonly used in **web proxy (HTTP/HTTPS) scenarios**.

- You **manually configure** browser settings (or use a PAC file / GPO / WPAD) to route traffic to the firewall proxy.

**Benefits:**

- **Better visibility and control** over user internet activity.

- Can enforce **URL filtering, malware scanning**, SSL inspection, etc.

- Can apply **user- or group-based policies** if integrated with authentication.

- Useful in **BYOD or guest networks** where you want to control traffic without deploying agents.

**Contrast with Transparent Proxy:**

| **Feature** | **Explicit Proxy** | **Transparent Proxy** |
|----|----|----|
| Client Configuration | Required | Not required |
| Application Awareness | Client knows it's a proxy | Client thinks it talks to destination |
| Flexibility | More granular control | Easier to deploy |

The **Azure Firewall Explicit Proxy** feature allows you to configure **Azure Firewall** as an explicit web proxy for outbound internet traffic. This means that instead of relying on transparent (implicit) routing, client devices or applications are explicitly configured to send their web (HTTP/HTTPS) traffic to Azure Firewall for inspection and filtering.

**🔍 What is Explicit Proxy?**

An **explicit proxy** requires the client (e.g., browser or system) to be configured to use a specific proxy server (in this case, Azure Firewall). This is different from a **transparent proxy**, where the traffic is redirected to the proxy without the client knowing.

**💡 Key Features of Azure Firewall Explicit Proxy**

1.  **Proxy-aware routing**:

    - Clients (e.g., browsers, OS settings, PAC files) are configured to send their internet-bound HTTP/S traffic directly to the Azure Firewall IP.

2.  **Full URL inspection**:

    - Supports URL-based rules for both HTTP and HTTPS traffic.

    - Enables fine-grained access control policies (e.g., block social media, allow only specific sites).

3.  **Authentication support**:

    - Can integrate with **Azure Active Directory (AAD)** for user-based policies using Azure Firewall Premium and Identity-based rules.

4.  **TLS Termination and Inspection**:

    - With Azure Firewall Premium, HTTPS traffic can be decrypted, inspected, and re-encrypted.

5.  **Logging and monitoring**:

    - All traffic going through the proxy is logged via Azure Monitor and can be exported to Log Analytics, Event Hubs, or Storage accounts.

6.  **Simplified routing**:

    - No need for UDRs or redirect rules when clients are configured with proxy settings.

**📦 How to Configure It**

1.  **Enable Explicit Proxy Mode**:

    - In the Azure Firewall configuration, enable the **Explicit Proxy** setting.

2.  **Configure Clients**:

    - Use **Proxy Auto-Configuration (PAC) files**, Group Policy, or manual settings to point clients to the Azure Firewall private IP on port **3128** (default for explicit proxy).

3.  **Define Application Rules**:

    - Set up rules in the firewall to control access based on URLs, categories (Premium), and user identity (optional).

**✅ When to Use It**

- You want **fine-grained web filtering** without relying solely on network-level rules.

- You need **per-user internet access control** using Azure AD.

- You want centralized control and monitoring for internet-bound traffic from clients in Azure or hybrid environments.

**📝 Example Use Case**

Imagine a scenario where you have Windows 11 devices in Azure Virtual Desktop (AVD), and you want to:

- Allow only specific websites (e.g., company domains)

- Block social media

- Monitor user activity

- Apply different rules based on user identity

With Azure Firewall Explicit Proxy, you can do all of this efficiently.

Let me know if you'd like a visual diagram or specific configuration steps!

## Sample Firewall Policy

The document you provided is a firewall policy. It outlines the security measures for a network firewall system. Here's a summary of the key points:

**General Firewall Guidelines**

**Physical and Logical Access**

- Physical access to the firewall should be restricted.

- The firewall should be in a controlled environment with appropriate power and cooling.

- Logical access should be restricted to authorized personnel only.

- Remote administration should be encrypted if used.

**System Backup**

- Regularly back up firewall configurations, software, logs, and operating system files.

**Upgrades and Patches**

- promptly apply vendor-recommended firewall patches.

- Evaluate the need for firewall upgrades and get approval before implementation.

- Verify proper operation after any upgrades.

**Logs and Audit Trails**

- Enable logging for firewall activity, audit trails, and system events.

- Review logs periodically or situationally depending on business needs.

- Archive logs for a set period and then securely dispose of them.

**Documentation**

- Document firewall operational procedures, backups, troubleshooting, log review, and housekeeping.

- Document firewall configurations confidentially, including network diagrams, IP addresses, routing tables, and firewall rules.

- Update documentation after any firewall changes.

**Encrypted Channels**

- Use encrypted channels (VPN, SSL, SSH) for communication between internal and external hosts.

- Securely distribute encryption keys before using encrypted channels.

**Enforcement**

- All staff must comply with the firewall policy.

- Report any security violations or misuse of IT systems.

- Ensure contractors and authorized parties comply with this policy.

- Assign local firewall administrators for branch offices.

# Administration

- Only authorized administrators can modify firewall rules.

- Firewall rules and connections should be reviewed periodically and removed if no longer needed.

- Users and application owners must be authorized for any firewall changes.

<!-- -->

- **Audit Logs:** Regularly review firewall logs to identify anomalies, unused rules, and false positives. Optimize firewall settings based on this data.

- **Firewall Updates:** Keep firewall software and firmware up-to-date to prevent vulnerabilities and maintain effectiveness.

- **Internal Modems:** Eliminate modems from the internal network as they pose a significant security risk and can bypass the firewall.

- **Application-Level Firewalls:** Ensure the operating system is secure before evaluating the application-level firewall due to their close relationship.

- **Use a centralized management system**. A centralized management system can help you to manage multiple firewalls for IoT devices more easily and efficiently.

Overall, the policy emphasizes the importance of regular monitoring, maintenance, and a thorough security assessment to ensure the firewall effectively protects the network.

**Encrypted Communications**

- All external communications (e.g., B2B) must use encryption methods like VPN, SSL, SSH to protect data.

- Secure key distribution is essential for encryption to work effectively.

**Enforcement and Compliance**

- All employees must follow security policies, including those related to firewalls. Violations can result in disciplinary action.

- Employees must report any security misuse or malpractice immediately.

- Contractors and third-party users must also comply with security policies.

- When outsourcing firewall management, the vendor must adhere to the organization's policies.

**Firewall Deployment and Management**

- Maintain consistent firewall policies across all devices in a distributed firewall setup.

- Secure policy transfers and host authentication using IPSec and cryptographic certificates.

- Implement a redundant firewall system for continuous operation.

**Firewall Administration Roles and Responsibilities**

- **Designated Firewall Administrators** and **Backup Administrators** are responsible for firewall management.

- All firewall modifications require approval from **IT Security**.

- Administrators must regularly review firewall rules and connections with application owners, removing obsolete entries.

- All requests for new firewall connections and rules require authorization from users, application owners, and the **Information Security Manager**.

**Firewall Access Control**

- **Logical access** to the firewall is restricted to Firewall Administrators, Backup Administrators, and the Information Security Manager. Other access is granted on a need-to-basis with IT Security approval.

- **Remote access** to the firewall is allowed only when necessary and must be secured with encryption if over an untrusted network.

- All access and privileges are approved by the Information Security Manager.

- Unused access and privileges must be removed promptly.

- Strong authentication (e.g., username and password) is required for firewall access.

**Automation**

- **Challenge:** Frequent firewall rule updates due to new technologies create a heavy workload for administrators.

- **Solution:** Automate firewall configuration changes to:

  - Streamline the change process.

  - Reduce human error leading to system failures.

  - Free up administrator time for higher-level security tasks.

**Rule Maintenance**

- **Challenge:** Network changes (new users, devices, services, applications) require constant firewall rule updates and reviews.

- **Solution:** Establish a regular maintenance schedule to:

  - Add new firewall rules.

  - Review and remove outdated rules.

Overall, effective firewall administration involves automating routine tasks, regularly maintaining firewall rules, and freeing up administrator time for strategic security initiatives.

**Identity and Access Management (IAM)**

- **User and Role Management:** Clearly defined roles with documented privileges, enforced through Role-Based Access Control (RBAC).

- **Authentication:** Strong authentication methods using encrypted cookies, avoiding persistent cookies and HTTP GET for credentials.

- **Authorization:** Granular authorization based on roles, preventing unauthorized access through parameter or cookie manipulation.

**Change Management**

- **Dedicated Roles:** Firewall managed by dedicated administrators and backups.

- **Approval Process:** All changes require IT Security approval. New firewall rules need additional approval from application owners and users.

- **Oversight:** Information Security Manager oversees the entire process.

**Physical and Logical Access**

- **Restricted Access:** Physical access to the firewall is limited, and it's housed in a controlled environment.

- **Authorized Personnel:** Logical access is restricted to authorized personnel only.

- **Secure Remote Access:** Remote access is approved and uses strong encryption.

**Additional Considerations**

- **Regular Reviews:** Periodically review and update firewall access controls.

- **Least Privilege Principle:** Grant user’s minimum necessary access.

- **Multi-Factor Authentication (MFA):** Consider implementing MFA for enhanced security.

Overall, the document emphasizes the importance of strong IAM practices, controlled access, and a robust change management process for effective firewall administration.

**Key points:**

- Clearly defined roles and responsibilities

- Strong authentication and authorization mechanisms

- Restricted physical and logical access

- Regular review and updates

- Adherence to least privilege principle

- Consideration of MFA for additional security

**SSL/TLS configuration**

**SSL/TLS** (Secure Sockets Layer/Transport Layer Security) is crucial for securing network communication. Firewalls play a vital role in managing and securing SSL/TLS traffic.

Key Considerations for SSL/TLS Configuration on Firewall:

**1. SSL/TLS Inspection:**

- **Decrypt and Inspect:** Firewalls can decrypt encrypted traffic, inspect it for threats, and then re-encrypt it before forwarding.

- **Performance Impact:** Decryption and re-encryption can impact performance, so it's essential to balance security needs with performance requirements.

- **Certificate Management:** The firewall needs appropriate certificates to decrypt and re-encrypt traffic.

- **Policy-Based Inspection:** Implement policies to define which traffic should be inspected and which should be bypassed.

**2. Cipher Suite Selection:**

- **Strong Cipher Suites:** Choose strong cipher suites that offer robust encryption and protection against vulnerabilities.

- **Avoid Weak Ciphers:** Disable or restrict weak cipher suites to enhance security.

- **Regular Updates:** Keep cipher suite lists updated to address emerging threats.

**3. Protocol Versions:**

- **TLS 1.3:** Prioritize TLS 1.3 as it offers improved performance and security compared to older versions.

- **Disable Older Versions:** Disable or restrict older, less secure protocols like SSLv3 and TLS 1.0/1.1.

**4. Certificate Management:**

- **Trusted Certificate Authorities (CAs):** Configure the firewall to trust only reputable CAs.

- **Certificate Revocation:** Implement certificate revocation checking to prevent communication with compromised certificates.

- **Certificate Expiration:** Monitor certificate expiration dates and renew them before they expire.

**5. SSL/TLS Termination:**

- **Load Balancing:** If terminating SSL/TLS at the firewall, ensure load balancing is configured to distribute traffic across multiple servers.

- **Performance Optimization:** Optimize firewall resources for SSL/TLS termination to avoid performance bottlenecks.

**6. Logging and Monitoring:**

- **Detailed Logs:** Enable comprehensive logging of SSL/TLS events to detect anomalies and security incidents.

- **Regular Monitoring:** Monitor SSL/TLS traffic for signs of attacks or vulnerabilities.

**Additional Considerations:**

- **Strict Transport Security (HSTS):** Implement HSTS to enforce secure connections and prevent downgrade attacks.

- **Perfect Forward Secrecy (PFS):** Utilize PFS to protect against key compromise.

- **OCSP Stapling:** Consider using OCSP stapling to improve certificate validation performance.

By following these guidelines and tailoring the configuration to specific security requirements, organizations can effectively protect their network traffic with SSL/TLS and mitigate potential risks.

General

- **Dedicated Server:** Isolate the firewall for optimal performance and security.

- **Least Privilege:** Grant minimal necessary access to users and applications.

Rule Management

- **Regular Reviews:** Periodically examine firewall rules to add, remove, or modify as needed.

- **Rule Order:** Prioritize rule evaluation for effective security:

  - Block spoofed addresses.

  - Allow specific user traffic.

  - Permit network management access.

  - Discard unnecessary traffic.

  - Alert on suspicious activity.

  - Log remaining traffic.

- **Customization:** Adapt general guidelines to specific organizational needs while maintaining essential protections.

Security

- **Updates:** Keep firewall software current with patches.

- **Network Segmentation:** Physically separate network segments using firewalls.

- **Routing Restrictions:** Disable loose and strict source routing.

- **Spoofing Prevention:** Block forged IP addresses, including private and illegal ones.

Additional Considerations

- **Refer to SANS Firewall Checklist:** For detailed guidance on blocking specific traffic types.

- **Beyond Firewalls:** Implement identity and access management (IAM) for enhanced security.

**Key Points:**

- Firewall placement, user access, and rule management are crucial for security.

- Rule order and customization are essential for efficient and effective protection.

- Regular updates, network segmentation, and spoofing prevention are vital security measures.

- Consider IAM for complementary security.

Network Zones

Network zones are a critical concept for secure firewall configuration. Here is a breakdown of best practices:

- **Grouping Devices:** Organize devices based on security needs. Create zones for servers, workstations, guests, etc.

- **Firewall Rules per Zone:** Apply specific firewall rules to each zone to control traffic flow between them.

- **Segmentation for Different Policies:** If user groups or network communities require different security levels, physically isolate them using network segmentation.

  - Place more permissive users/networks on separate subnets from the more secure ones.

  - All access from these subnets should comply with established firewall policies.

- **Internal Controls for Critical Systems:** Use internal firewalls or filtering routers for critical information, applications, and systems.

  - This provides access control, auditing, and logging capabilities.

  - Segment the internal network to enforce access policies defined by information owners.

- **Critical Server Protection:** Create a deny rule for traffic originating from external sources and destined for critical internal addresses.

  - Exceptions may exist based on organizational needs (e.g., web applications accessed via a DMZ).

Zone Transfers (Stateful Firewalls):

- Use packet filtering on UDP/TCP port 53 to limit replies from the internal network for external DNS requests.

- Block unauthorized zone transfers from external sources.

FTP Servers

- **Isolate FTP Servers:** Place FTP servers on a separate network segment to protect the internal network.

VPN Security

- **VPN is Not a Guarantee:** Even with a VPN, compromised laptops can pose a risk to the corporate network.

Stealth Firewalls

- **Strengthen Credentials:** Reset default firewall credentials.

- **Network Awareness:** Configure firewall to recognize network segments.

- **Traffic Control:** Review and refine access control lists.

- **Connection Prevention:** Enable ACK bit monitoring to thwart unauthorized connections.

Identity Management

- **Centralized Authentication:** Integrate firewall with identity management systems for user authentication.

DMZ Security

- **Dual Firewalls:** Employ two firewalls for enhanced DMZ protection.

- **Firewall Diversity:** Utilize different firewall types in the DMZ.

- **Network Isolation:** Implement dual NICs on the web server.

- **Rule Separation:** Maintain distinct rule sets for each firewall.

Compliance

- **Policy Adherence:** Ensure firewall rules align with organizational security policies.

Intrusion Detection/Prevention Systems (IDS/IPS)

- **Threat Monitoring and Blocking:** Implement IDS/IPS to detect and prevent malicious network activity.

Maintenance

- **Rule Management:** Regularly review and update firewall rules to accommodate changes.

- **Firmware Updates:** Keep firewall software up-to-date for optimal security.

Change Management

- **Formal Process:** Establish a structured approach for managing firewall configuration changes.

- **Change Control:** Include change request submission, review, testing, deployment, validation, and documentation.

Backups

- **Regular Backups:** Create and store backups of firewall configurations, software, logs, and operating system files.

- **Secure Storage:** Maintain backups in a secure location with appropriate labelling.

Additional points:

- Firewall administrators periodically review firewall rules with application owners to ensure they are still valid.

- Any unused or invalid access privileges should be promptly removed.

Upgrades and Patches:

- Apply vendor-recommended firewall patches promptly with management approval.

- Evaluate the need for firewall upgrades and get approval before implementing.

- Verify proper firewall operation after any upgrades.

**Logs and Audit Trails:**

- Enable logging for firewall activity, audit trails, and system events.

- The Information Security Manager determines how often to review logs (based on criticality).

- Logs can be reviewed periodically for accountability or as needed for troubleshooting/forensics.

- An internal party (Security Manager) or independent party should review logs for accountability.

- Archive logs for a set period and then securely erase or overwrite the data.

Documentation:

- Document all firewall operational procedures (administration, backups, troubleshooting, log review, etc.).

- Document firewall configurations confidentially, including network diagrams, IP addresses, routing tables, and firewall rules.

- Update all documentation whenever the firewall configuration changes.

**Encrypted Channels:**

- Use encrypted channels (VPN/SSL/SSH) for communication between internal and external hosts on public or trusted networks.

- Securely distribute encryption keys before using encrypted channels.

Enforcement:

- All staff must comply with the firewall policy.

- Report any security violations or misuse of IT systems.

- Ensure contractors and authorized parties also comply with this policy.

- Outsourced vendors providing firewall services must ensure compliance with this policy.

<!-- -->

- **Use a centralized management system.** This can help you to manage multiple firewalls more easily and efficiently.

- **Document your firewall configuration**. This will help you to understand your configuration and make changes more easily in the future.

- **Have a disaster recovery plan**. This should include a plan for restoring your firewall configuration in the event of a failure.

Firewall Maintenance

- **Upgrade and Patch Management:** Regularly update firewall software and patches with management approval, verifying functionality post-upgrade.

- **Stateful Inspection:** Monitor firewall rules for accuracy in IP addresses, ports, and timeouts.

- **MAC Filtering (if applicable):** Restrict MAC addresses to authorized devices.

Security and Compliance

- **Change Management:** Establish a formal process for firewall rule changes, including security review, testing, and documentation.

- **Vulnerability Assessment:** Regularly scan for open ports and test firewall rules.

- **Physical Security:** Place the firewall in a restricted access area with environmental controls (e.g., air conditioning, UPS).

Additional Considerations

- **Vendor Verification:** Ensure downloaded updates originate from trusted sources.

- **Security Policy Adherence:** Firewall configurations should align with the organization's security policies.

Logging and Monitoring Best Practices

**Key Points**

- **Enable comprehensive logging:** Capture firewall activity, audit trails, and system-level events.

- **Protect sensitive data:** Avoid logging personal information, passwords, or other sensitive data.

- **Monitor connection attempts:** Log both successful and failed connection attempts.

- **Regularly review logs:** Establish a process for analyzing logs to detect anomalies, suspicious activity, and inefficient rules.

- **Session management:** Validate sessions on both ends, especially when sharing sessions between components.

- **Secure external connections:** Use HTTPS when making external connections with HTTPClient.

Additional Considerations

- **Log retention:** Determine an appropriate retention period for firewall logs based on regulatory and operational requirements.

- **Log disposal:** Implement secure methods for disposing of old logs, such as overwriting or physical destruction.

- **Role-based access:** Grant access to firewall logs only to authorized personnel.

- **Log analysis tools:** Consider using specialized tools to automate log analysis and detection of threats.

- **False positives:** Regularly review and adjust firewall rules to minimize false positives.

By following these guidelines, organizations can enhance their ability to detect and respond to security threats, optimize firewall performance, and maintain compliance with relevant regulations.

**Note:** The provided information focuses on general firewall logging and monitoring best practices. Specific implementation details may vary depending on the firewall platform and organizational requirements.

<https://techcommunity.microsoft.com/t5/azure-network-security-blog/enabling-central-visibility-for-dns-using-azure-firewall-custom/ba-p/2156331>

System Backup

- **Regularly backup firewall configuration:** This includes firewall software settings (rules, policies, network objects), operating system configurations, and network definitions (routing tables, hostnames).

- **Backup firewall logs:** Preserve firewall and operating system logs for incident investigation and forensic analysis.

- **Secure backup storage:** Store backup media in a secure location and label them appropriately.

By following these guidelines, organizations can protect their firewall configuration and logs, enabling recovery from system failures and effective incident response.

Documentation

**Essential Documentation:**

- **Operational Procedures:** Detailed guidelines for administration, backup, troubleshooting, log review, and maintenance.

- **Configuration Details:** Securely stored information about network diagrams, IP addresses, routing tables, and firewall rules.

**Access Control:**

- Firewall configuration documents should be restricted to Firewall Administrators, Backup Administrators, and the Information Security Manager.

**Document Maintenance:**

- All documentation must be updated promptly after any firewall changes.

# Windows Firewall

# Linux Firewall

# Proxy Server

Proxy is a network service that allows clients to make indirect network connections to other network services.

The most used proxy servers in enterprises are:

- **HAproxy**: Open-source LB and reverse proxy server

- **Nginx proxy**: Open-source webserver and reverse proxy server

- **Squid**: Open-source caching and forwarding proxy server

Proxy Server Design

High-level design for an enterprise proxy server:

- **Ensure Proxy server have enough resources,** so it should be <span class="mark">deployed on a dedicated server or appliance.</span>

- **Proxy Server to filter all inbound and outbound traffic,** so it should <span class="mark">be located at the perimeter of the enterprise network</span>.

- Proxy Server should be configured for authentication, authorization, and content filtering.

- **Improve the performance of the network and reduce bandwidth usage** so Proxy Server should be configured to <span class="mark">cache frequently accessed content</span>.

- **Improve scalability and reliability of system**, Proxy Server should be configured <span class="mark">to provide load balancing for backend servers</span>.

**<u>Proxy Server Configuration</u>**

Socks Proxy PenTest

SOCKS proxies act as intermediaries between your device and the internet, providing a secure and versatile connection. Unlike HTTP proxies that are limited to HTTP traffic, SOCKS proxies can handle various protocols, including HTTP. This makes them more useful in diverse scenarios.

**How SOCKS Proxies Work:**

4.  **Installation:** SOCKS proxies are typically installed as browser extensions or configured within torrent clients.

5.  **Traffic Routing:** When you connect to a website or service, your traffic is routed through the SOCKS proxy server.

6.  **IP Masking:** The proxy server hides your actual IP address, making it appear as if you are connecting from the location of the proxy server.

**Use Cases:**

- **Geo-Restricted Content:** Accessing websites or services that are blocked in your region.

- **Privacy and Security:** Protecting your online privacy by masking your IP address.

- **Torrenting:** Bypassing ISP restrictions on torrenting.

In essence, SOCKS proxies offer a flexible and secure way to connect to the internet, making them a valuable tool for various online activities.

How to setup Socks proxy?

# How to bypass Firewall?

Provide example of how firewall can be bypassed by an outsider to access the corporate network.

Firewalls are a critical security measure and bypassing them can leave a network vulnerable to attacks.

However, I can summarize some common methods attackers use to try to bypass firewalls:

**Exploiting Weaknesses:**

- **Misconfigurations:** Attackers can exploit mistakes in firewall settings to send data packets that bypass security rules.

- **Open Ports:** If unnecessary ports are open on the firewall, attackers can use them to send malicious traffic.

**Tricking Users:**

- **Social Engineering:** Attackers may manipulate people (e.g., through phishing emails) to click malicious links or download malware that can bypass security measures.

**Alternative Routes:**

- **VPNs:** Attackers might misuse VPNs designed for legitimate remote access to bypass restrictions.

- **Proxy Servers:** Proxy servers can be used to mask a user's location and potentially bypass firewall rules.

It is important to remember that these are just some examples, and new techniques are constantly emerging. Here are some security practices to counter these methods:

- **Strong Firewall Rules:** Regularly review and update firewall rules to close any gaps in security.

- **User Education:** Train employees to identify and avoid social engineering tactics.

- **Multi-Layered Security:** Use a combination of security measures, including firewalls, intrusion detection, and data encryption, to create a strong defense.

- **Patching Systems:** Keep all software and systems updated with the latest security patches.

# Incident Response

How can a firewall be used to detect and prevent unauthorized access to a network? What types of logs and alerts should be monitored?

What is worse in firewall detection, a false negative or a false positive? And why? Consider a scenario where a firewall is protecting an online banking system. Which would be more detrimental: a false negative that allows a malicious attack to bypass the firewall or a false positive that blocks legitimate customer transactions? Explain your reasoning.

# The End
