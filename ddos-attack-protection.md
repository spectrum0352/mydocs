# Azure DDoS Protection

- **DDoS Attack**

  1.  Attack that has the goal of preventing access to services or systems (Availability).

  2.  If attack launched from one location, then it is called Denial of Service attack.

  3.  If attack launched from multiple locations the it is called Distributed DoS attack.

  4.  Botnets are collection of interconnected systems and used without owner knowledge.

  5.  Botnet owners use them for Spamming, DDoS, Data storage and various other actions.

- **Azure DDoS Protection**

  1.  Service Tiers: Basic, Standard

>  
>
> **<u>DDoS protection best practices</u>**

- **Secure application development**

  1.  <u>Scalability</u> - Ability of a system to handle increased load

  2.  <u>Availability</u> - Proportion of time that a system is functional and working

  3.  <u>Resiliency</u> - Ability of a system to recover from failures and continue to function

  4.  <u>Management</u> - Operations processes that keep a system running in production

  5.  <u>Security</u> - Protecting applications and data from threats

- **Design application to scale horizontally**

  1.  If your application depends on a single instance of a service, it creates a single point of failure.

  2.  Provisioning multiple instances makes your system more resilient and more scalable.

- **Design layers of security defenses in application**

  1.  Reduce the surface area by using IP allowlists to close down the exposed IP address space and listening ports that aren’t needed on the load balancers.

  2.  ‎You can also use NSGs (Service tag, ASG) to reduce the attack surface.

- <span class="mark">Azure DDoS protection service tiers:</span>

| **Basic** | **Standard** |
|----|----|
| Automatically enabled as part of the Azure platform | DDoS Protection Standard is simple to enable, and requires no application changes. |
| Always-on traffic monitoring, and real-time mitigation of common network-level attacks, provide the same defenses utilized by Microsoft's online services. | Protection policies are tuned through dedicated traffic monitoring and machine learning algorithms. |
| The entire scale of Azure's global network can be used to distribute and mitigate attack traffic across regions. | Policies are applied to public IP addresses associated to resources deployed in virtual networks, such as Azure Load Balancer, Azure Application Gateway, and Azure Service Fabric instances, but this protection does not apply to App Service Environments. |
| Protection is provided for IPv4 and IPv6 Azure public IP addresses. | Real-time telemetry is available through Azure Monitor views during an attack, and for history |
|   | Rich attack mitigation analytics are available via diagnostic settings |

>  

- **<span class="mark">How Azure denial-of-service protection works?</span>**

- DDoS Protection Standard monitors actual traffic utilization and constantly compares it against the thresholds defined in the DDoS policy.

- When the traffic threshold is exceeded, DDoS mitigation is automatically initiated.

- When traffic returns to a level below the threshold, the mitigation is removed.

- During mitigation, DDoS Protection redirects traffic sent to the protected resource and performs several checks, including:

  1.  Helping ensure that packets conform to internet specifications and aren’t malformed.

  2.  Interacting with the client to determine if the traffic might be a spoofed packet (for example, using SYN Auth or SYN Cookie or dropping a packet for the source to retransmit it).

  3.  Using rate-limit packets if it can’t perform any other enforcement method.

- Within a few minutes of attack detection, you’ll be notified with Azure Monitor metrics.

- Azure Monitor retains metric data for DDoS Protection Standard for 30 days.

- **<span class="mark">Types of DDoS attacks that Azure DDoS protection mitigates</span>**

- **Volumetric attacks** : UDP floods, amplification floods, and other spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations, SQL injection, cross-site scripting and other layer 7 attacks

>  
>
>  
>
> **What is Azure DDoS Protection**

- It is Azure service used to filter large scale attacks before they can cause denial of service.

**DDoS Protection**

- 1\. Attack that has the goal of preventing access to services or systems (Availability).

- 2\. If attack launched from one location, then it is called Denial of Service attack.

- 3\. If attack launched from multiple locations the it is called Distributed DoS attack.

- 4\. Botnets are collection of interconnected systems and used without owner knowledge.

- 5\. Botnet owners use them for Spamming, DDoS, Data storage and various other actions.

- Used to filter large scale attacks before they can cause denial of service.

- Protects Azure-hosted applications from distributed denial of service (DDOS) attacks.

- DDoS Protection Standard monitors actual traffic utilization and constantly compares it against the thresholds defined in the DDoS policy.

- When the traffic threshold is exceeded, DDoS mitigation is automatically initiated.

- When traffic returns to a level below the threshold, the mitigation is removed.

- During mitigation, DDoS Protection redirects traffic sent to the protected resource and performs several checks, including:

  - Helping ensure that packets conform to internet specifications and aren’t malformed.

  - Interacting with the client to determine if the traffic might be a spoofed packet (for example, using SYN Auth or SYN Cookie or dropping a packet for the source to retransmit it).

  - Using rate-limit packets if it can’t perform any other enforcement method.

- Within a few minutes of attack detection, you’ll be notified with Azure Monitor metrics.

- Azure Monitor retains metric data for DDoS Protection Standard for 30 days.

- Types of DDoS attacks that Azure DDoS protection mitigates

  - Volumetric attacks : UDP floods, amplification floods, and other spoofed-packet floods (Multiple GB attacks)

  - Protocol attacks: SYN flood attacks, reflection attacks, and other protocol attacks

  - Resource (Application) layer attacks: HTTP protocol violations, SQL injection, cross-site scripting and other layer 7 attacks

- **Azure DDoS Protection Tiers**: Service Tiers: Basic, Standard

**DDoS protection best practices**

**Secure application development**

1.  <u>Scalability</u> - Ability of a system to handle increased load

2.  <u>Availability</u> - Proportion of time that a system is functional and working

3.  <u>Resiliency</u> - Ability of a system to recover from failures and continue to function

4.  <u>Management</u> - Operations processes that keep a system running in production

5.  <u>Security</u> - Protecting applications and data from threats

**Design application to scale horizontally**

1.  If your application depends on a single instance of a service, it creates a single point of failure.

2.  Provisioning multiple instances makes your system more resilient and more scalable.

- **Design layers of security defenses in application**

1.  Reduce the surface area by using IP allowlists to close down the exposed IP address space and listening ports that aren’t needed on the load balancers.

2.  ‎You can also use NSGs (Service tag, ASG) to reduce the attack surface.

- **Azure DDoS protection service tiers:**

<img src="media/image1.png" style="width:6.75067in;height:3.42014in" />

- **How Azure denial-of-service protection works?**

  - DDoS Protection Standard monitors actual traffic utilization and constantly compares it against the thresholds defined in the DDoS policy.

  - When the traffic threshold is exceeded, DDoS mitigation is automatically initiated.

  - When traffic returns to a level below the threshold, the mitigation is removed.

  - During mitigation, DDoS Protection redirects traffic sent to the protected resource and performs several checks, including:

    1.  Helping ensure that packets conform to internet specifications and aren’t malformed.

    2.  Interacting with the client to determine if the traffic might be a spoofed packet (for example, using SYN Auth or SYN Cookie or dropping a packet for the source to retransmit it).

    3.  Using rate-limit packets if it can’t perform any other enforcement method.

  - Within a few minutes of attack detection, you’ll be notified with Azure Monitor metrics.

  - Azure Monitor retains metric data for DDoS Protection Standard for 30 days.

- **<span class="mark"> </span>**

- **Types of DDoS attacks that Azure DDoS protection mitigates**

<!-- -->

- **Volumetric attacks:** UDP floods, amplification floods, and other spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations, SQL injection, cross-site scripting and other layer 7 attacks

  - **Azure DDoS Protection**

> Protects Azure-hosted applications from distributed denial of service (DDOS) attacks.
>
>  
>
> **Azure DDoS Protection**

- **DDoS Attack**

  1.  Attack that has the goal of preventing access to services or systems (Availability).

  2.  If attack launched from one location, then it is called Denial of Service attack.

  3.  If attack launched from multiple locations the it is called Distributed DoS attack.

  4.  Botnets are collection of interconnected systems and used without owner knowledge.

  5.  Botnet owners use them for Spamming, DDoS, Data storage and various other actions.

- **Azure DDoS Protection**

  1.  Service Tiers: Basic, Standard

>  
>
> **<u>DDoS protection best practices</u>**

- **Secure application development**

  1.  <u>Scalability</u> - Ability of a system to handle increased load

  2.  <u>Availability</u> - Proportion of time that a system is functional and working

  3.  <u>Resiliency</u> - Ability of a system to recover from failures and continue to function

  4.  <u>Management</u> - Operations processes that keep a system running in production

  5.  <u>Security</u> - Protecting applications and data from threats

- **Design application to scale horizontally**

  1.  If your application depends on a single instance of a service, it creates a single point of failure.

  2.  Provisioning multiple instances makes your system more resilient and more scalable.

- **Design layers of security defenses in application**

  1.  Reduce the surface area by using IP allowlists to close down the exposed IP address space and listening ports that aren’t needed on the load balancers.

  2.  ‎You can also use NSGs (Service tag, ASG) to reduce the attack surface.

- <span class="mark">Azure DDoS protection service tiers:</span>

| **Basic** | **Standard** |
|----|----|
| Automatically enabled as part of the Azure platform | DDoS Protection Standard is simple to enable, and requires no application changes. |
| Always-on traffic monitoring, and real-time mitigation of common network-level attacks, provide the same defenses utilized by Microsoft's online services. | Protection policies are tuned through dedicated traffic monitoring and machine learning algorithms. |
| The entire scale of Azure's global network can be used to distribute and mitigate attack traffic across regions. | Policies are applied to public IP addresses associated to resources deployed in virtual networks, such as Azure Load Balancer, Azure Application Gateway, and Azure Service Fabric instances, but this protection does not apply to App Service Environments. |
| Protection is provided for IPv4 and IPv6 Azure public IP addresses. | Real-time telemetry is available through Azure Monitor views during an attack, and for history |
|   | Rich attack mitigation analytics are available via diagnostic settings |

>  
>
>  
>
> **Perimeter security**

- **<span class="mark">How Azure denial-of-service protection works?</span>**

- DDoS Protection Standard monitors actual traffic utilization and constantly compares it against the thresholds defined in the DDoS policy.

- When the traffic threshold is exceeded, DDoS mitigation is automatically initiated.

- When traffic returns to a level below the threshold, the mitigation is removed.

- During mitigation, DDoS Protection redirects traffic sent to the protected resource and performs several checks, including:

  1.  Helping ensure that packets conform to internet specifications and aren’t malformed.

  2.  Interacting with the client to determine if the traffic might be a spoofed packet (for example, using SYN Auth or SYN Cookie or dropping a packet for the source to retransmit it).

  3.  Using rate-limit packets if it can’t perform any other enforcement method.

- Within a few minutes of attack detection, you’ll be notified with Azure Monitor metrics.

- Azure Monitor retains metric data for DDoS Protection Standard for 30 days.

- **<span class="mark">Types of DDoS attacks that Azure DDoS protection mitigates</span>**

- **Volumetric attacks** : UDP floods, amplification floods, and other spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations, SQL injection, cross-site scripting and other layer 7 attacks

>  

**What is Azure DDoS Protection**

It is Azure service used to filter large scale attacks before they can cause denial of service.

## DDoS Protection

- **Azure DDoS Protection**

  1.  Service Tiers: Basic, Standard

>  
>
> **<u>DDoS protection best practices</u>**

- **Secure application development**

  1.  <u>Scalability</u> - Ability of a system to handle increased load

  2.  <u>Availability</u> - Proportion of time that a system is functional and working

  3.  <u>Resiliency</u> - Ability of a system to recover from failures and continue to function

  4.  <u>Management</u> - Operations processes that keep a system running in production

  5.  <u>Security</u> - Protecting applications and data from threats

- **Design application to scale horizontally**

  1.  If your application depends on a single instance of a service, it creates a single point of failure.

  2.  Provisioning multiple instances makes your system more resilient and more scalable.

- **Design layers of security defenses in application**

  1.  Reduce the surface area by using IP allowlists to close down the exposed IP address space and listening ports that aren’t needed on the load balancers.

  2.  ‎You can also use NSGs (Service tag, ASG) to reduce the attack surface.

- <span class="mark">Azure DDoS protection service tiers:</span>

| **Basic** | **Standard** |
|----|----|
| Automatically enabled as part of the Azure platform | DDoS Protection Standard is simple to enable, and requires no application changes. |
| Always-on traffic monitoring, and real-time mitigation of common network-level attacks, provide the same defenses utilized by Microsoft's online services. | Protection policies are tuned through dedicated traffic monitoring and machine learning algorithms. |
| The entire scale of Azure's global network can be used to distribute and mitigate attack traffic across regions. | Policies are applied to public IP addresses associated to resources deployed in virtual networks, such as Azure Load Balancer, Azure Application Gateway, and Azure Service Fabric instances, but this protection does not apply to App Service Environments. |
| Protection is provided for IPv4 and IPv6 Azure public IP addresses. | Real-time telemetry is available through Azure Monitor views during an attack, and for history |
|   | Rich attack mitigation analytics are available via diagnostic settings |

>  
>
>  
>
> **Perimeter security**

- **<span class="mark">How Azure denial-of-service protection works?</span>**

- DDoS Protection Standard monitors actual traffic utilization and constantly compares it against the thresholds defined in the DDoS policy.

- When the traffic threshold is exceeded, DDoS mitigation is automatically initiated.

- When traffic returns to a level below the threshold, the mitigation is removed.

- During mitigation, DDoS Protection redirects traffic sent to the protected resource and performs several checks, including:

  1.  Helping ensure that packets conform to internet specifications and aren’t malformed.

  2.  Interacting with the client to determine if the traffic might be a spoofed packet (for example, using SYN Auth or SYN Cookie or dropping a packet for the source to retransmit it).

  3.  Using rate-limit packets if it can’t perform any other enforcement method.

- Within a few minutes of attack detection, you’ll be notified with Azure Monitor metrics.

- Azure Monitor retains metric data for DDoS Protection Standard for 30 days.

**Types of DDoS attacks that Azure DDoS protection mitigates**

- **Volumetric attacks:** UDP floods, amplification floods, and other spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations, SQL injection, cross-site scripting and other layer 7 attacks

<!-- -->

- **How Azure denial-of-service protection works?**

  - DDoS Protection Standard monitors actual traffic utilization and constantly compares it against the thresholds defined in the DDoS policy.

  - When the traffic threshold is exceeded, DDoS mitigation is automatically initiated.

  - When traffic returns to a level below the threshold, the mitigation is removed.

  - During mitigation, DDoS Protection redirects traffic sent to the protected resource and performs several checks, including:

    1.  Helping ensure that packets conform to internet specifications and aren’t malformed.

    2.  Interacting with the client to determine if the traffic might be a spoofed packet (for example, using SYN Auth or SYN Cookie or dropping a packet for the source to retransmit it).

    3.  Using rate-limit packets if it can’t perform any other enforcement method.

  - Within a few minutes of attack detection, you’ll be notified with Azure Monitor metrics.

  - Azure Monitor retains metric data for DDoS Protection Standard for 30 days.

- **<span class="mark"> </span>**

- **Types of DDoS attacks that Azure DDoS protection mitigates**

<!-- -->

- **Volumetric attacks:** UDP floods, amplification floods, and other spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations, SQL injection, cross-site scripting and other layer 7 attacks

 

## Azure DDoS Protection

Protects Azure-hosted applications from distributed denial of service (DDOS) attacks.

**DDoS Attack**

1.  Attack that has the goal of preventing access to services or systems (Availability).

    If attack launched from one location, then it is called Denial of Service attack.

    If attack launched from multiple locations the it is called Distributed DoS attack.

    Botnets are collection of interconnected systems and used without owner knowledge.

    Botnet owners use them for Spamming, DDoS, Data storage and various other actions.

**Azure DDoS Protection Service Tiers**

- Basic

- Standard

**<span class="mark">DDoS protection best practices</span>**

**Secure application development**

6.  <u>Scalability</u> - Ability of a system to handle increased load

    <u>Availability</u> - Proportion of time that a system is functional and working

    <u>Resiliency</u> - Ability of a system to recover from failures and continue to function

    <u>Management</u> - Operations processes that keep a system running in production

    <u>Security</u> - Protecting applications and data from threats

**Design application to scale horizontally**

11. If your application depends on a single instance of a service, it creates a single point of failure.

    Provisioning multiple instances makes your system more resilient and more scalable.

**Design layers of security defenses in application**

13. Reduce the surface area by using IP allowlists to close the exposed IP address space and listening ports that are not needed on the load balancers.

    ‎You can also use NSGs (Service tag, ASG) to reduce the attack surface.

**Azure DDoS protection service tiers:**

| **Basic** | **Standard** |
|----|----|
| Automatically enabled as part of the Azure platform | DDoS Protection Standard is simple to enable, and requires no application changes. |
| Always-on traffic monitoring, and real-time mitigation of common network-level attacks, provide the same defenses utilized by Microsoft's online services. | Protection policies are tuned through dedicated traffic monitoring and machine learning algorithms. |
| The entire scale of Azure's global network can be used to distribute and mitigate attack traffic across regions. | Policies are applied to public IP addresses associated to resources deployed in virtual networks, such as Azure Load Balancer, Azure Application Gateway, and Azure Service Fabric instances, but this protection does not apply to App Service Environments. |
| Protection is provided for IPv4 and IPv6 Azure public IP addresses. | Real-time telemetry is available through Azure Monitor views during an attack, and for history |
|   | Rich attack mitigation analytics are available via diagnostic settings |

>  
>
>  

**How Azure denial-of-service protection works?**

- DDoS Protection Standard monitors actual traffic utilization and constantly compares it against the thresholds defined in the DDoS policy.

- When the traffic threshold is exceeded, DDoS mitigation is automatically initiated.

- When traffic returns to a level below the threshold, the mitigation is removed.

- During mitigation, DDoS Protection redirects traffic sent to the protected resource and performs several checks, including:

  - Helping ensure that packets conform to internet specifications and are not malformed.

  - Interacting with the client to determine if the traffic might be a spoofed packet (for example, using SYN Auth or SYN Cookie or dropping a packet for the source to retransmit it).

  - Using rate-limit packets if it cannot perform any other enforcement method.

- Within a few minutes of attack detection, you will be notified with Azure Monitor metrics.

- Azure Monitor retains metric data for DDoS Protection Standard for 30 days.

**Types of DDoS attacks that Azure DDoS protection mitigates**

- **Volumetric attacks:** UDP floods, amplification floods, and other spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations, SQL injection, cross-site scripting, and other layer 7 attacks

## Azure DDoS Protection

- **DDoS Attack**

  1.  Attack that has the goal of preventing access to services or systems (Availability).

  2.  If attack launched from one location, then it is called Denial of Service attack.

  3.  If attack launched from multiple locations the it is called Distributed DoS attack.

  4.  Botnets are collection of interconnected systems and used without owner knowledge.

  5.  Botnet owners use them for Spamming, DDoS, Data storage and various other actions.

- **Azure DDoS Protection**

  1.  Service Tiers: Basic, Standard

>  
>
> **<u>DDoS protection best practices</u>**

- **Secure application development**

  1.  <u>Scalability</u> - Ability of a system to handle increased load

  2.  <u>Availability</u> - Proportion of time that a system is functional and working

  3.  <u>Resiliency</u> - Ability of a system to recover from failures and continue to function

  4.  <u>Management</u> - Operations processes that keep a system running in production

  5.  <u>Security</u> - Protecting applications and data from threats

- **Design application to scale horizontally**

  1.  If your application depends on a single instance of a service, it creates a single point of failure.

  2.  Provisioning multiple instances makes your system more resilient and more scalable.

- **Design layers of security defenses in application**

  1.  Reduce the surface area by using IP allowlists to close down the exposed IP address space and listening ports that aren’t needed on the load balancers.

  2.  ‎You can also use NSGs (Service tag, ASG) to reduce the attack surface.

- <span class="mark">Azure DDoS protection service tiers:</span>

| **Basic** | **Standard** |
|----|----|
| Automatically enabled as part of the Azure platform | DDoS Protection Standard is simple to enable, and requires no application changes. |
| Always-on traffic monitoring, and real-time mitigation of common network-level attacks, provide the same defenses utilized by Microsoft's online services. | Protection policies are tuned through dedicated traffic monitoring and machine learning algorithms. |
| The entire scale of Azure's global network can be used to distribute and mitigate attack traffic across regions. | Policies are applied to public IP addresses associated to resources deployed in virtual networks, such as Azure Load Balancer, Azure Application Gateway, and Azure Service Fabric instances, but this protection does not apply to App Service Environments. |
| Protection is provided for IPv4 and IPv6 Azure public IP addresses. | Real-time telemetry is available through Azure Monitor views during an attack, and for history |
|   | Rich attack mitigation analytics are available via diagnostic settings |

>  
>
>  
>
> **Perimeter security**

- **<span class="mark">How Azure denial-of-service protection works?</span>**

- DDoS Protection Standard monitors actual traffic utilization and constantly compares it against the thresholds defined in the DDoS policy.

- When the traffic threshold is exceeded, DDoS mitigation is automatically initiated.

- When traffic returns to a level below the threshold, the mitigation is removed.

- During mitigation, DDoS Protection redirects traffic sent to the protected resource and performs several checks, including:

  1.  Helping ensure that packets conform to internet specifications and aren’t malformed.

  2.  Interacting with the client to determine if the traffic might be a spoofed packet (for example, using SYN Auth or SYN Cookie or dropping a packet for the source to retransmit it).

  3.  Using rate-limit packets if it can’t perform any other enforcement method.

- Within a few minutes of attack detection, you’ll be notified with Azure Monitor metrics.

- Azure Monitor retains metric data for DDoS Protection Standard for 30 days.

- **<span class="mark">Types of DDoS attacks that Azure DDoS protection mitigates</span>**

- **Volumetric attacks** : UDP floods, amplification floods, and other spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations, SQL injection, cross-site scripting and other layer 7 attacks

>  

## Azure DDoS Protection

Protects Azure-hosted applications from distributed denial of service (DDOS) attacks.

**DDoS Attack**

15. Attack that has the goal of preventing access to services or systems (Availability).

    If attack launched from one location, then it is called Denial of Service attack.

    If attack launched from multiple locations the it is called Distributed DoS attack.

    Botnets are collection of interconnected systems and used without owner knowledge.

    Botnet owners use them for Spamming, DDoS, Data storage and various other actions.

**Azure DDoS Protection Service Tiers**

- Basic

- Standard

>  

**<span class="mark">DDoS protection best practices</span>**

**Secure application development**

20. <u>Scalability</u> - Ability of a system to handle increased load

    <u>Availability</u> - Proportion of time that a system is functional and working

    <u>Resiliency</u> - Ability of a system to recover from failures and continue to function

    <u>Management</u> - Operations processes that keep a system running in production

    <u>Security</u> - Protecting applications and data from threats

**Design application to scale horizontally**

25. If your application depends on a single instance of a service, it creates a single point of failure.

    Provisioning multiple instances makes your system more resilient and more scalable.

**Design layers of security defenses in application**

27. Reduce the surface area by using IP allowlists to close the exposed IP address space and listening ports that are not needed on the load balancers.

    ‎You can also use NSGs (Service tag, ASG) to reduce the attack surface.

**Azure DDoS protection service tiers:**

| **Basic** | **Standard** |
|----|----|
| Automatically enabled as part of the Azure platform | DDoS Protection Standard is simple to enable, and requires no application changes. |
| Always-on traffic monitoring, and real-time mitigation of common network-level attacks, provide the same defenses utilized by Microsoft's online services. | Protection policies are tuned through dedicated traffic monitoring and machine learning algorithms. |
| The entire scale of Azure's global network can be used to distribute and mitigate attack traffic across regions. | Policies are applied to public IP addresses associated to resources deployed in virtual networks, such as Azure Load Balancer, Azure Application Gateway, and Azure Service Fabric instances, but this protection does not apply to App Service Environments. |
| Protection is provided for IPv4 and IPv6 Azure public IP addresses. | Real-time telemetry is available through Azure Monitor views during an attack, and for history |
|   | Rich attack mitigation analytics are available via diagnostic settings |

>  
>
>  

**How Azure denial-of-service protection works?**

- DDoS Protection Standard monitors actual traffic utilization and constantly compares it against the thresholds defined in the DDoS policy.

- When the traffic threshold is exceeded, DDoS mitigation is automatically initiated.

- When traffic returns to a level below the threshold, the mitigation is removed.

- During mitigation, DDoS Protection redirects traffic sent to the protected resource and performs several checks, including:

  - Helping ensure that packets conform to internet specifications and are not malformed.

  - Interacting with the client to determine if the traffic might be a spoofed packet (for example, using SYN Auth or SYN Cookie or dropping a packet for the source to retransmit it).

  - Using rate-limit packets if it cannot perform any other enforcement method.

- Within a few minutes of attack detection, you will be notified with Azure Monitor metrics.

- Azure Monitor retains metric data for DDoS Protection Standard for 30 days.

**Types of DDoS attacks that Azure DDoS protection mitigates**

- **Volumetric attacks:** UDP floods, amplification floods, and other spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations, SQL injection, cross-site scripting, and other layer 7 attacks

## Azure DDoS Protection

- **DDoS Attack**

  1.  Attack that has the goal of preventing access to services or systems (Availability).

  2.  If attack launched from one location, then it is called Denial of Service attack.

  3.  If attack launched from multiple locations the it is called Distributed DoS attack.

  4.  Botnets are collection of interconnected systems and used without owner knowledge.

  5.  Botnet owners use them for Spamming, DDoS, Data storage and various other actions.

- **Azure DDoS Protection**

  1.  Service Tiers: Basic, Standard

>  
>
> **<u>DDoS protection best practices</u>**

- **Secure application development**

  1.  <u>Scalability</u> - Ability of a system to handle increased load

  2.  <u>Availability</u> - Proportion of time that a system is functional and working

  3.  <u>Resiliency</u> - Ability of a system to recover from failures and continue to function

  4.  <u>Management</u> - Operations processes that keep a system running in production

  5.  <u>Security</u> - Protecting applications and data from threats

- **Design application to scale horizontally**

  1.  If your application depends on a single instance of a service, it creates a single point of failure.

  2.  Provisioning multiple instances makes your system more resilient and more scalable.

- **Design layers of security defenses in application**

  1.  Reduce the surface area by using IP allowlists to close down the exposed IP address space and listening ports that aren’t needed on the load balancers.

  2.  ‎You can also use NSGs (Service tag, ASG) to reduce the attack surface.

- <span class="mark">Azure DDoS protection service tiers:</span>

| **Basic** | **Standard** |
|----|----|
| Automatically enabled as part of the Azure platform | DDoS Protection Standard is simple to enable, and requires no application changes. |
| Always-on traffic monitoring, and real-time mitigation of common network-level attacks, provide the same defenses utilized by Microsoft's online services. | Protection policies are tuned through dedicated traffic monitoring and machine learning algorithms. |
| The entire scale of Azure's global network can be used to distribute and mitigate attack traffic across regions. | Policies are applied to public IP addresses associated to resources deployed in virtual networks, such as Azure Load Balancer, Azure Application Gateway, and Azure Service Fabric instances, but this protection does not apply to App Service Environments. |
| Protection is provided for IPv4 and IPv6 Azure public IP addresses. | Real-time telemetry is available through Azure Monitor views during an attack, and for history |
|   | Rich attack mitigation analytics are available via diagnostic settings |

>  
>
>  

# DDoS Attack

Denial-of-Service (DoS) and Distributed Denial-of-Service (DDoS) attacks are malicious attempts to disrupt the normal traffic of a network by overwhelming it with fake requests. This makes the network or service unavailable to legitimate users.

DoS attack originates from a single source, while DDoS attack comes from multiple sources, typically botnets which are collections of compromised devices.

The goal of both attacks is to overload the target system's resources and prevent it from functioning properly. DDoS attacks are more difficult to defend against because they are spread out across many devices.

DoS and DDoS attacks can be used to distract security personnel while other attacks are carried out.

DDoS (Distributed Denial-of-Service) attacks overwhelm a network with fake traffic from multiple sources, making it unavailable to legitimate users.

Here is how to prevent them:

- **Plan:** Create a response plan outlining steps to take during a DDoS attack.

- **Security:** Implement basic network security measures like firewalls.

- **Architecture:** Design a strong network architecture that can handle traffic spikes.

- **Warning Signs:** Be aware of signs that might indicate a DDoS attack.

- **DDoS Protection Services:** Consider using services that can mitigate DDoS attacks.

# DDoS Countermeasures

**Secure application development**

- <u>Scalability</u> - Ability of a system to handle increased load

- <u>Availability</u> - Proportion of time that a system is functional and working

- <u>Resiliency</u> - Ability of a system to recover from failures and continue to function

- <u>Management</u> - Operations processes that keep a system running in production

- <u>Security</u> - Protecting applications and data from threats

**Design application to scale horizontally**

- If your application depends on a single instance of a service, it creates a single point of failure.

- Provisioning multiple instances makes your system more resilient and more scalable.

**Design layers of security defenses in application**

3.  Reduce the surface area by using IP allowlists to close down the exposed IP address space and listening ports that aren’t needed on the load balancers.

4.  ‎You can also use NSGs (Service tag, ASG) to reduce the attack surface.

## Detection and Mitigation Techniques

This summarizes various techniques to detect and mitigate DDoS attacks:

**Activity Profiling:**

- Monitors network traffic patterns and identifies deviations from the norm.

- Analyzes average packet rates for network flows (groups of packets with similar characteristics) based on header information.

- An increase in activity levels or the number of distinct clusters can indicate a DDoS attack.

**Detection Techniques:**

- These techniques aim to differentiate legitimate traffic from malicious attack traffic.

- They identify abnormal increases in traffic volume or "flash events" (sudden spikes) compared to established baselines.

- Common techniques include:

  - **Activity Profiling (described above)**

  - **Wavelet-based Signal Analysis:** Analyzes traffic data in terms of frequency components to detect anomalies.

  - **Changepoint Detection:**

    - Isolates traffic changes caused by attacks using statistical algorithms.

    - Filters traffic data and identifies attack points using techniques like Cumulative Sum (CUSUM) to detect deviations from expected traffic patterns.

    - Can also identify scanning activities of worms.

**Protecting Secondary Victims:**

These measures aim to minimize the impact of DDoS attacks on secondary victims (internet users and connected devices):

- **Software Updates:** Install and update anti-malware software on all devices.

- **Security Awareness:** Educate users about security issues and prevention techniques.

- **Application Management:** Disable unnecessary services, uninstall unused applications, and scan external files before opening them.

- **System Hardening:** Configure and update security settings on devices (firewalls, operating systems, applications).

- **Additional Measures:** Implement strong encryption, conduct vulnerability scans, use robust input validation, and secure remote access protocols.

**Remember:**

A combination of these techniques can significantly enhance your DDoS defense strategy. By proactively monitoring traffic patterns and implementing security measures, you can minimize the risk and impact of DDoS attacks on your network and protect secondary victims.

# Method of DDoS attacks

DDoS attacks use botnets, which are groups of hacked devices controlled by attackers, to overwhelm a target system with traffic from multiple sources. There are different techniques to launch DDoS attacks:

- **Botnet Flood:** A large number of compromised devices bombard the target with traffic, overloading its resources.

- **Smurf Attack:** Spoofed IP addresses are used to send messages to a victim's IP address, causing the network to get flooded with responses.

- **TCP SYN Flood Attack:** Attackers send a massive amount of connection requests to the target system, leaving it stuck waiting for responses and unable to handle legitimate traffic.

- **Teardrop Attack:** Malformed packets are sent to the target, causing it to crash or malfunction.

- **Ping of Death Attack:** Oversized packets are sent to the target, crashing or freezing it.

These last two methods are less common as system vulnerabilities they exploit have been patched.

## DDoS Attack Summary

A DDoS (Distributed Denial-of-Service) attack aims to disrupt a system or network by overwhelming it with traffic from multiple sources. This makes the system unavailable to legitimate users.

**DDoS Attack Methods:**

- **Botnets:** Large networks of compromised devices controlled by attackers to launch attacks.

- **Ping of Death Attack:** Sending malformed packets to crash the target system.

- **Smurf Attack:** Spoofing IP addresses to flood the victim with responses.

- **TCP SYN Flood Attack:** Overwhelming the target with connection requests.

- **Teardrop Attack:** Sending packets that cause the target to malfunction.

- **Application-Level Attacks:** Targeting specific applications to consume resources.

- **Bandwidth Attacks:** Flooding the network with traffic to exhaust bandwidth.

- **Distributed Reflection DoS (DrDoS):** Using intermediary servers to amplify the attack.

- **ICMP Flood Attack:** Overwhelming the target with ICMP echo requests.

- **Peer-to-Peer Attacks:** Exploiting peer-to-peer networks to launch attacks.

- **Permanent DoS Attacks:** Causing irreversible damage to the target system.

- **Service Request Floods:** Exhausting server resources with requests.

**DDoS Attack Effects:**

- Loss of service for legitimate users

- Website downtime

- Network congestion

- Financial losses

**DDoS Attack Prevention:**

- DDoS response plan

- Network security measures

- Strong network architecture

- Monitoring for warning signs

- DDoS mitigation services

**DoS vs DDoS:**

- DoS attack originates from a single source.

- DDoS attack originates from multiple sources (distributed).

**Additional Points:**

- DoS/DDoS attacks can be used to distract security personnel while other attacks are carried out.

- Web servers are common targets for DoS/DDoS attacks.

## DDoS Attacks: A Summary

This comprehensive summary details various aspects of DDoS attacks, including methods, tools, prevention strategies, and their impact.

**Botnets:**

- Networks of compromised devices controlled by attackers to launch DDoS attacks.

- Large botnets can include millions of devices and overwhelm target systems.

- Attackers use scanning methods to find vulnerable machines to build botnets.

- Malicious code is propagated to these machines using various techniques.

**DDoS Attack Methods:**

- **Network Layer Attacks:**

  - TCP SYN Floods: Exhaust target's connection queue with connection requests.

  - UDP Floods: Overwhelm target with User Datagram Protocol (UDP) packets.

  - ICMP Floods: Flood target with ICMP echo requests (ping).

  - DNS Amplification: Leverage vulnerable DNS servers to amplify attack traffic.

- **Application Layer Attacks:**

  - HTTP Floods: Overload target web servers with HTTP requests.

  - Slowloris/RUDY Attacks: Keep connections open without sending complete requests, exhausting resources.

  - Zero-Day Attacks: Exploit unknown vulnerabilities in applications or protocols.

- **Other Techniques:**

  - Smurf Attacks: Spoof victim's IP address to overwhelm them with responses.

  - Teardrop Attacks: Send malformed packets causing target systems to crash.

  - Ping of Death Attacks: Send oversized packets crashing target systems.

  - Permanent DoS Attacks: Cause irreversible damage to target hardware.

**DDoS Attack Effects:**

- Denial-of-Service: Legitimate users cannot access targeted system or service.

- Network Congestion: Overall network performance degrades.

- Financial Losses: Businesses lose revenue due to service downtime.

**DDoS Prevention Strategies:**

- Implement strong network security measures.

- Monitor for suspicious activity and warning signs.

- Utilize DDoS mitigation services.

- Have a DDoS response plan in place.

**Additional Points:**

- DoS attacks involve a single attacker source, while DDoS attacks are distributed.

- Botnet trojans like Blackshades and PlugBot are used to manage botnets.

- DDoS attacks can be used as distractions for other cyber attacks.

 

## 3-Way Handshake and Denial-of-Service Attacks

The three-way handshake is a fundamental process in establishing reliable connections using the TCP protocol. Here's a breakdown:

1.  **SYN (Synchronize):** The client sends a packet with a synchronization flag to initiate a connection with the server.

2.  **SYN/ACK (Synchronize Acknowledge):** The server responds with a packet containing both SYN and ACK flags, acknowledging the client's request and indicating its readiness to connect.

3.  **ACK (Acknowledge):** Finally, the client sends an ACK packet confirming its receipt of the server's response, and the connection is established.

**Exploiting the Handshake for DoS Attacks:**

Attackers can exploit the three-way handshake to launch a Denial-of-Service (DoS) attack known as a SYN flood attack. Here's how it works:

1.  **Fake SYN Packets:** The attacker sends a large number of SYN packets to the target server, often with spoofed IP addresses.

2.  **Server Response:** The server, unaware of the attack, responds to each SYN packet with a SYN/ACK packet, allocating resources for a potential connection.

3.  **Missing ACK:** The attacker never sends the final ACK packet, leaving the server waiting for completion of the handshake for each connection.

4.  **Resource Exhaustion:** With a continuous stream of fake SYN packets, the server becomes overwhelmed, depleting resources (memory, processing power) to handle incomplete connections. This prevents the server from responding to legitimate connection requests, effectively denying service to real users.

**Key Points:**

- The DoS attack leverages the server's expectation of a complete handshake and its resource allocation for pending connections.

- By overwhelming the server with incomplete connections, the attacker cripples its ability to serve legitimate users.

**Mitigating SYN Flood Attacks:**

- **SYN Cookies:** Techniques like SYN cookies allow servers to acknowledge SYN requests without consuming as many resources.

- **Rate Limiting:** Limiting the number of incoming connections per IP address can help prevent attackers from overwhelming the server.

- **Resource Monitoring:** Continuously monitoring server resources and implementing automated actions can help detect and respond to DoS attacks.

# DDoS Tools 

This summary outlines various tools used to launch DDoS attacks.

**DDoS Attack Tools:**

- **Pandora DDoS Bot Toolkit:** Offers five attack modes including HTTP floods and connection floods.

- **Dereil:** Professional tool for TCP, UDP, and HTTP DDoS attacks.

- **HOIC:** Launches DDoS attacks on a specified IP address, port, and protocol.

- **DoS HTTP:** Windows tool for launching HTTP flood DDoS attacks.

- **AnDOSid for Mobile:** Mobile app for simulating DoS and DDoS attacks (limited functionality).

**Important Note:**

These tools are primarily used by malicious actors. DDoS attacks are illegal and can cause significant disruption and financial losses.

# Azure DDoS Protection

**What is a DDoS Attack?**

A DDoS attack aims to overwhelm a system with traffic, making it unavailable to legitimate users. It can be launched from a single location (DoS) or from multiple locations (Distributed DoS) using botnets (collections of compromised devices).

**Azure DDoS Protection Service:**

- Offers two tiers: Basic (free, always-on) and Standard (advanced features).

- Protects against various DDoS attacks, including volumetric attacks, protocol attacks, and resource layer attacks.

**Best Practices for DDoS Mitigation:**

- Secure application development.

- Design for scalability and resiliency (ability to handle increased load and recover from failures).

- Implement layers of security defenses, including:

  - **Scaling horizontally:** Use multiple instances of a service to avoid single points of failure.

  - **Reducing attack surface:** Limit exposed IP addresses and ports with IP allowlists and Network Security Groups (NSGs).

**Azure DDoS Protection Standard Features:**

- Always-on traffic monitoring and real-time mitigation.

- Machine learning-based protection policies tuned for optimal defense.

- Utilizes the global Azure network to distribute and mitigate attack traffic.

- Protects public IP addresses associated with resources like Azure Load Balancer and virtual networks.

- Provides real-time telemetry and attack analytics during and after an attack.

**How Azure DDoS Protection Works:**

- Monitors traffic and compares it to thresholds defined in your DDoS policy.

- Automatically initiates mitigation when traffic exceeds thresholds.

- Performs various checks on incoming traffic during mitigation, including:

  - Packet conformance to internet specifications.

  - Spoofing detection (SYN Auth, SYN Cookie, or packet drops).

  - Rate limiting if other enforcement methods fail.

- Notifies you within minutes of attack detection with Azure Monitor metrics (data retained for 30 days).

**Remember:** Azure DDoS Protection is a valuable tool for mitigating DDoS attacks. By combining it with secure application development and best practices, you can significantly enhance your cloud environment's resilience.

# DDoS IR

## Preparation

**DDoS IR Preparation is Key:**

- **Objective:** Establish contacts, define procedures, and gather information to expedite response during an attack.

**Key Actions:**

- **ISP Support:**

  - Understand your ISP's DDoS mitigation options (free/paid) and reporting procedures.

  - Consider redundant internet connections.

  - Establish contact with ISP and law enforcement (out-of-band communication channels like phone calls).

- **Inventory:**

  - Create a whitelist of critical IP addresses and protocols (customers, partners) for traffic prioritization.

  - Document IT infrastructure details (owners, IP addresses, circuits, routing, network topology).

- **Network Infrastructure:**

  - Design a resilient network with no single points of failure (bottlenecks).

  - Distribute critical services (DNS, SMTP) across different Autonomous Systems (AS).

  - Harden network, OS, and application configurations against DDoS attacks.

  - Baseline network performance for faster attack detection.

  - Consider specialized DDoS mitigation services for internet-dependent businesses.

  - Lower DNS Time-To-Live (TTL) for faster redirection during attacks (600 seconds is a good value).

  - Implement backups to switch to in case of service disruption.

- **Internal Contacts:**

  - Establish contact points for IDS, firewall, systems, and network teams.

  - Collaborate with business units to understand potential financial losses from DDoS attacks.

  - Involve Business Continuity Plan/Disaster Recovery (BCP/DR) teams in DDoS incident response.

## Detection and Analysis

**Objective:** Detect the attack, determine its scope, and involve relevant teams.

**Analysis Steps:**

1.  **Understand the Attack:**

    - Analyze attack flow and identify affected infrastructure components.

    - Determine if you are the target or a collateral victim.

2.  **Review Logs and Files:**

    - Check load and log files of servers, routers, firewalls, applications, etc.

    - Identify suspicious traffic patterns compared to normal traffic (source IPs, ports, protocols).

3.  **Network Traffic Analysis:**

    - Use tools like Tcpdump, Snort, and Ntop to analyse network traffic.

    - Create Network Intrusion Detection System (NIDS) signatures to filter malicious traffic.

**Collaboration:**

- **Internal Teams:**

  - Inform internal teams about their visibility into the attack.

- **ISP:**

  - Contact your ISP for assistance in controlling the attack traffic.

  - Specify network blocks, source IPs, and protocols involved.

- **Company Management:**

  - Notify company executives and legal teams about the attack.

**Background Check:**

- Investigate if an extortion demand preceded the attack.

- Identify potential attackers: competitors, hacktivists, disgruntled employees.

**DDoS Detection Techniques:**

- **Activity Profiling:** Monitor network traffic patterns and identify deviations from normal behavior. \* Analyze average packet rates for network flows.

- **Wavelet-based Signal Analysis:** Analyze traffic using wavelets to detect anomalies in specific frequencies.

- **Isolate Traffic:** Use algorithms to isolate traffic changes caused by attacks.

- **Filter Traffic:** Filter target traffic based on address, port, or protocol for analysis.

- **Identify Attack:** Use sequential change-point detection (CUSUM) to identify attack signatures in traffic time series.

- **Identify Scan Activity:** Detect network scanning activities potentially associated with DDoS attacks.

**Traffic Filtering Techniques:**

- **Egress Filtering:** Inspect outgoing traffic headers to prevent unauthorized traffic from leaving the network.

- **Ingress Filtering:** Protects against flooding attacks originating from valid IP prefixes, allowing tracing of attackers.

**Additional Point:**

- All detection techniques rely on identifying abnormal traffic patterns compared to established baselines.

## Containment

**Objective:** Mitigate the attack's impact on your systems and users.

**Containment Actions:**

- **Throttle or Block Attack Traffic:**

  - Block malicious traffic as close to its source as possible (router, firewall, etc.).

  - Utilize specialized DDoS mitigation devices or services.

- **Terminate Unwanted Connections:**

  - Close unnecessary connections or processes on servers and routers.

  - Adjust TCP/IP settings to optimize resource usage.

- **Traffic Diversion:**

  - Switch to backup sites or networks using DNS or other methods.

  - Blackhole DDoS traffic targeting original IP addresses.

- **Communication Channels:**

  - Establish alternate communication channels (web, email, voice) for users.

- **Traffic Scrubbing:**

  - Route traffic through a traffic-scrubbing service to filter malicious traffic.

- **Egress Filtering:**

  - Block outgoing traffic generated in response to the attack (e.g., backscatter traffic).

- **Extortion Attempts:**

  - If facing extortion, try to buy time to coordinate a response.

- **ISP Collaboration:**

  - Work closely with your ISP if the bottleneck is on their side.

**Important Note:**

- Containment strategies should be tested and practiced beforehand for a more effective response.

 

## Eradication

**Objective:** Stop the DDoS attack and prevent future occurrences.

**Actions:**

- **Contact ISP:**

  - Collaborate with your ISP to implement mitigation measures.

  - These measures may include:

    - Filtering malicious traffic at Tier 1 or 2 levels (if possible)

    - Traffic scrubbing to remove DDoS traffic from legitimate traffic

    - Sink holing to reroute DDoS traffic to a null location

    - Blackhole routing to block DDoS traffic entirely

**Law Enforcement:**

- If the attackers are identified, consider involving law enforcement with the approval of your company's legal and executive teams.

**Important Note:**

- Technical remediation is often handled by your ISP.

## DDoS IR: Recovery

**Objective:** Restore normal functionality after the attack.

**Recovery Steps:**

- **Verify Attack End:**

  - Ensure the DDoS attack has stopped.

- **Service Availability:**

  - Confirm impacted services are accessible again.

- **Performance Baseline:**

  - Verify infrastructure performance has returned to normal.

- **Mitigation Rollback:**

  - Gradually remove DDoS mitigation measures implemented during containment.

- **Traffic Routing:**

  - Switch traffic back to your original network.

- **Service Restart:**

  - Restart any stopped services affected by the attack.

**Coordination:**

- Collaborate with network teams to ensure recovery actions are well-coordinated.

- Bringing services online too quickly can cause unintended consequences.

**Additional Points:**

- Recovery is the final stage of the DDoS IR process.

- A thorough post-incident review should be conducted to identify areas for improvement in future DDoS response strategies.

## DDoS incident response Post Incident Activity

**Objective:** Document the incident’s details, discuss lessons learned, and adjust plans and defenses.

- Consider what preparation steps you could have taken to respond to the incident faster or more effectively.

- If necessary, adjust assumptions that affected the decisions made during DDoS incident preparation.

- Assess the effectiveness of your DDoS response process, involving people and communications.

- Consider what relationships inside and outside your organizations could help you with future incidents.

- Collaborate with legal teams if a legal action is in process

**DDoS Prevention**

- Build DDoS response plan

- Employ basic network security

- Maintain strong network architecture

- Understand the Warning Signs

- Consider DDoS as a service

**<span class="mark">DDoS Countermeasure Strategies</span>**

- Absorbing the Attack: Use additional capacity to absorb attack; it requires preplanning. It requires additional resources.

- Degrading Services: Identify critical services and stop non critical services.

- Shutting Down the Services: Shut down all the services until the attack has subsided.

## Protecting Secondary Victims from DDoS Attacks

DDoS attacks can have a ripple effect, impacting not just the targeted system but also secondary victims like internet users and connected devices. Here is a breakdown of how to safeguard secondary victims:

**Defensive Measures:**

- **Software Updates:** Implement strong anti-virus and anti-trojan software on all connected devices. Regularly update these programs to ensure they can identify and block the latest threats.

- **Security Awareness:** Raise awareness among users about DDoS attacks and prevention techniques. Educate them on recognizing suspicious activity and avoiding potential attack vectors (e.g., downloading attachments from unknown sources).

- **Application Management:** Disable unnecessary services and uninstall unused applications to reduce attack surface area. Scan all external files before opening them to prevent malware infection.

- **System Hardening:** Configure and update security settings on all devices. This includes firewalls, operating systems, and application configurations. Ensure these systems are patched with the latest security updates.

**Additional Considerations:**

- **Encryption:** Utilize strong encryption protocols like WPA2 and AES 256 to protect data transmissions from eavesdropping and manipulation.

- **Vulnerability Scans:** Regularly scan systems for vulnerabilities and patch them promptly to minimize the risk of exploitation by DDoS attackers.

- **Input Validation:** Implement robust input validation techniques to prevent malicious code injection attempts and improve system security.

- **Secure Remote Access:** Secure remote administration and connectivity testing protocols to prevent unauthorized access that could be used in DDoS attacks.

**Remember:**

By employing these defensive measures and promoting security awareness among users, secondary victims can significantly reduce their risk of being impacted by DDoS attacks.

Following a DDoS attack, forensic analysis is crucial to improve your defenses and prevent future incidents. Here's what you should do:

**Analyze Attack Data:**

- **Traffic Patterns:** Identify unique characteristics of the attack traffic to develop filtering techniques that can block similar attacks in the future.

- **Log Analysis:** Analyze logs from routers, firewalls, and intrusion detection systems (IDS) to pinpoint the source of the attack and identify compromised systems within your network. Trace back attacker IPs with the help of ISPs and law enforcement if necessary.

**Improve Countermeasures:**

- **Filtering Techniques:** Use the insights from traffic pattern analysis to refine your filtering techniques for load balancing and throttling mechanisms. This helps differentiate legitimate traffic from malicious traffic.

**Additional Considerations:**

- **Collaboration:** Work with your ISP to understand their DDoS mitigation capabilities and explore additional protection options.

- **Documentation:** Document the entire incident, including the attack timeline, scope, impact, and lessons learned. This information is valuable for future preparedness and training purposes.

# DDoS attack

## Concepts

DoS stands for Denial of Service

DDoS stands for Distributed Denial of Service

DDoS is a malicious attempt of disrupting regular traffic of network by flooding with a large number of fake requests and making server unavailable to the appropriate requests. These fake requests come from several unauthorized sources and hence called distributed denial of service attack.

Objective of a DoS attack is to overwhelm the resources of a target system and cause it to stop functioning, denying access to its users. DDoS is a variant of DoS in which attackers compromise a large number of computers or other devices, and use them in a coordinated attack against the target system.

DDoS attack is generally done by this sometimes happens due to a client misconfiguration.

DDoS attacks are often used in combination with other cyber threats.

These attacks may launch DoS attack to capture the attention of security staff and create confusion, while they carry out more subtle attacks aimed at stealing data or causing other damage.

DoS is an attack on a computer or network that reduces, restricts or prevents accessibility of system resources to its legitimate users. In a DoS attack, attackers flood a victim system with non-legitimate service requests or traffic to overload its resources. DoS attack leads to unavailability of a particular website and show network performance.

DDoS attack involves a multitude of compromised systems attacking a single target, thereby causing denial of service for users of the targeted system. To launch a DDoS attack, an attacker uses botnets and attacks a single system.

## DDoS Attack Methods

### Botnets 

Systems under hacker control that have been infected with malware. Attackers use these bots to carry out DDoS attacks. Large botnets can include millions of devices and can launch attacks at devastating scale.

During a DDoS attack, the botnet sends an overwhelming number of requests to a targeted server or application, causing it to crash.

Bots are software applications that run automated tasks over the Internet and perform simple repetitive tasks, such as web spidering and search engine indexing. A botnet is a huge network of the compromised systems and can be used by an attacker to launch denial-of-service attacks.

 

**Scanning Methods for Finding Vulnerable Machines**

- **Random Scanning**: The infected machine probes IP addresses randomly from target network IP range and checks for the vulnerability.

- **Hit-list Scanning**: Attacker first collects a list of possible potentially vulnerable machines and then performs scanning to find vulnerable machines.

- **Topological Scanning**: It uses the information obtained on infected machines to find new vulnerable machines.

- **Local Subnet Scanning**: The infected machine looks for the new vulnerable machine in its own local network.

- **Permutation Scanning**: It uses a pseudorandom permutation list of IP addresses to find new vulnerable machines. Divide and conquer

 

**How Malicious Code Propagates?**

Attackers use three techniques to propagate malicious code to newly discovered vulnerable system:

- **Central Source Propagation**: Attacker places attack toolkit on the central source and copy of the attack toolkit is transferred to newly discovered vulnerable system.

- **Back-chaining Propagation**: Attacker places attack toolkit on his/her system itself and copy of the attack toolkit is transferred to newly discovered vulnerable system.

- **Autonomous Propagation**: Attack toolkit is transferred at the time when the new vulnerable system is discovered.

**<span class="mark">Botnet Trojan-Blackshades NET</span>**

Blackshades NET has the ability to create implant binaries which employ custom obfuscation algorithms or Crypters, which can be bought through the Bot/Crypter marketplace embedded in the Blackshades controller. Another botnet: Cythosia Botnet, Andromeda Bot, Mirai botnet

**<span class="mark">Botnet Trojan-PlugBot</span>**

PlugBot is a hardware botnet project. It is a covert PenTest Device (Bot) designed for covert use during physical PenTest.

### Smurf attack 

Sends Internet Control Message Protocol (ICMP) echo requests to the victim’s IP address. The ICMP requests are generated from ‘spoofed’ IP addresses. Attackers automate this process and perform it at scale to overwhelm a target system.

### TCP State-Exhaustion Attacks

Consumes the connection state tables present in the network infrastructure components such as load-balancers, firewalls, and application servers.

### TCP SYN Flood attack

Attacks flood the target system with connection requests. When the target system attempts to complete the connection, the attacker’s device does not respond, forcing the target system to time out. This quickly fills the connection queue, preventing legitimate users from connecting.

- The attacker sends many SYN requests to the target server (victim) with fake source IP addresses.

- The target machine sends back a SYN/ACK in response to the request and waits for the ACK to complete the session setup. The target machine does not get the response because the source address is fake.

<!-- -->

- SYN Flooding takes advantage of a flaw in how most hosts implement the TCP three-way handshake.

- When Host B receives the SYN request from A, it must keep track of the partially opened connection in a "listen queue" for at least 75 seconds.

- A malicious host can exploit the small size of the listen queue by sending multiple SYN requests to a host, but never replying to the SYN/ACK.

- The victim's listening queue is quickly filled up.

- The ability of holding up each incomplete connection for 75 seconds can be cumulatively used as a Denial-of-Service attack.

**Three-way handshake**

- TCP SYN request

- SYN/ACK

- ACK response

### Teardrop attack 

Teardrop attack causes the length and fragmentation offset fields in IP packets to overlap. The targeted system tries to reconstruct packets but fails, which can cause it to crash.

### Ping of death attack 

Pings a target system using malformed or oversized IP packets, causing the target system to crash or freeze.

### Network Layer DDoS Attacks

SYN Floods

UDP Floods

DNS Amplification

Techniques designed to eat up the target’s bandwidth.

### Application-Layer Flood Attacks 

- Application-level flood attacks result in the loss of services of a particular network, such as emails, network resources, the temporary ceasing of applications and services, and more.

- Using this attack, attackers exploit weaknesses in programming source code to prevent the application from processing legitimate requests.

- Using application-level flood attacks, attackers attempt to:

  - Flood web applications to legitimate user traffic.

  - Disrupt service to specific System/Person, for example blocking a user's access by repeating invalid login attempts.

  - Jam the application-database connection by crafting malicious SQL queries.

Consumes the application resources or service thereby making it unavailable to other legitimate users.

HTTP Floods

Slowloris or RUDY Attacks

Zero-day Attacks

Attacks that target vulnerabilities in OS, Apps, Protocols to crash a particular application.

### Volumetric Attacks 

Consumes the bandwidth of target network or service.

### Fragmentation Attacks

Overwhelms target's ability of re-assembling the fragmented packets.

### Bandwidth Attacks 

- A single machine cannot make enough requests to overwhelm network equipment; hence DDoS attacks were created where an attacker uses several computers to flood a victim.

- When a DDoS attack is launched, flooding a network, it can cause network equipment such as switches and routers to be overwhelmed due to the significant statistical change in the network traffic.

- Attackers use botnets and carry out DDoS attacks by flooding the network with ICMP ECHO packets.

- Basically, all bandwidth is used and no bandwidth remains for legitimate use.

 

### Service Request Floods 

- An attacker or group of zombies attempts to exhaust server resources by setting up and tearing down TCP connections.

- Service request flood attacks flood servers with a high rate of connections from a valid source.

- It initiates a request on every connection.

 

### ICMP Flood Attack 

- ICMP flood attack is a type DoS attack in which perpetrators send a large number of ICMP packets directly or through reflection networks to victims causing it to be overwhelmed and subsequently stop responding to legitimate TCP/IP requests.

- To protect against ICMP flood attack, set a threshold limit that when exceeded invokes the ICMP flood attack protection feature.

 

### Peer-to-Peer Attacks 

- Using peer-to-peer attacks, attackers instruct clients of peer-to-peer file sharing hubs to disconnect from their peer-to-peer network and to connect to the victim's fake website.

- Attackers exploit flaws found in the network using DC++ (Direct Connect) protocol, that is used for sharing all types of files between instant messaging clients.

- Using this method, attackers launch massive denial-of-service attacks and compromise websites.

- DC++ (Direct Connect) protocol -the attacker acts as a "puppet master," instructing clients of large peer-to-peer file sharing hubs to disconnect from their peer-to-peer network and to connect to the victim's website instead.

 

### Permanent Denial-of-Service (PDoS) Attack 

- **Phlashing**: Permanent DoS, also known as Phlashing, refers to attacks that cause irreversible damage to system hardware.

- **Sabotage**: Unlike other DoS attacks, it sabotages the system hardware, requiring the victim to replace or reinstall the hardware.

- **Bricking a system**: This attack is carried out using a method known as "bricking a system" in this attacker send fraudulent hardware updates to the victims.

 

 

### Distributed Reflection Denial of Service (DrDOS) 

- A distributed reflected denial of service attack (DRDoS), also known as spoofed attack, involves the use of multiple intermediate and secondary machines that contribute to the actual DDoS attack against the target machine or application.

- Attacker launches this attack by sending requests to the intermediary hosts, these requests are then redirected to the secondary machines which in turn reflects the attack traffic to the target.

- In this attack the primary target seems to be directly attacked by the secondary victim, not the actual attacker.

- IN this attack as multiple intermediary victim servers are used which results in an increase in attack bandwidth.

 

## DDoS Tools 

### Pandora DDoS Bot Toolkit 

The Pandora DDoS Bot Toolkit is an updated variant of the Dirt Jumper DDoS toolkit. It offers five distributed denial of service (DDoS) attack modes. It generates five attack types:

- HTTP min

- HTTP download

- HTTP Combo

- Socket Connect

- Max Flood

### Dereil and HOIC 

Dereil: Dereil is professional (DDoS) Tools with modern patterns for attack via TCP, UDP, and HTTP protocols.

HOIC: HOIC makes DDoS attacks to any IP address, with a user selected port and a user selected protocol.

### DoS HTTP and BanglaDos 

DoS HTTP: DoSHTTP is HTTP Flood Denial of Service (DoS) Testing Tool for Windows. It includes URL verification, HTTP redirection, port designation, performance monitoring and enhanced reporting. It uses multiple asynchronous sockets to perform an effective HTTP Flood.

BanglaDos:

### AnDOSid for Mobile

AnDOSid allows attackers to simulate a DOS attack (A http post flood attack to be exact) and DDoS attack on a web server from mobile phones.

## DDoS IR: Preparation

The “preparation” phase is to be considered as the most important element of a successful DDoS incident response.

### Objective of Preparation

Establish contacts, define procedures, and gather information to save time during an attack.

### ISP Support

- Contact your ISP to understand the DDoS mitigation services it offers (free and paid) and what process you should follow.

- If possible, subscribe to a redundant Internet connection.

- Establish contacts with your ISP and law enforcement entities. Make sure that you have the possibility to use an out-of-band communication channel (e.g.: phone).

### Inventory

- Create a whitelist of the IP addresses and protocols you must allow if prioritizing traffic during an attack. Don’t forget to include your critical customers, key partners, etc.

- Document your IT infrastructure details, including business owners, IP addresses and circuit IDs, routing settings (AS, etc); prepare a network topology diagram and an asset inventory.

### Network infrastructure

- Design a good network infrastructure without Single Point of Failure or bottleneck.

- Distribute your DNS servers and other critical services (SMTP, etc) through different AS.

- Harden the configuration of network, OS, and application components that may be targeted by DDoS.

- Baseline your current infrastructure’s performance, so you can identify the attack faster and more accurately.

- If your business is Internet dependent, consider purchasing specialized DDoS mitigation products or services.

- Confirm DNS time-to-live (TTL) settings for the systems that might be attacked. Lower the TTLs, if necessary, to facilitate DNS redirection if the original IP addresses get attacked. 600 is a good TTL value.

- Depending of the criticality of your services, consider setting- up a backup that you can switch on in case of issue.

### Internal contacts

- Establish contacts for your IDS, firewall, systems, and network teams.

- Collaborate with the business lines to understand business implications (e.g., money loss) of likely DDoS attack scenarios.

- Involve your BCP/DR planning team on DDoS incidents.

>  
>
>  

## DDoS IR: Detection and Analysis

### Objective of detection and analysis

Detect the incident, determine its scope, and involve the appropriate parties.

### Analyze the attack: 

- Understand the logical flow of the DDoS attack and identify the infrastructure components affected by it.

- Understand if you are the target of the attack or a collateral victim

- Review the load and log files of servers, routers, firewalls, applications, and other affected infrastructure.

- Identify what aspects of the DDoS traffic differentiate it from benign traffic

  - Source IP addresses, AS, etc

  - Destination ports

  - URLs

  - Protocols flags

- Network analysis tools can be used to review the traffic: Tcpdump, Snort, Ntop

- If possible, create a NIDS signature to focus to differentiate between benign and malicious traffic.

### Involve internal and external actors

- Contact your internal teams to learn about their visibility into the attack.

- Contact your ISP to ask for help. Be specific about the traffic you would like to control:

  - Network blocks involved

  - Source IP addresses

  - Protocols

- Notify your company’s executive and legal teams.

### Check the background

- Find out whether the company received an extortion demand as a precursor to the attack.

- Search if anyone would have any interest into threatening your company

  - Competitors

  - Ideologically-motivated groups (hacktivists)

  - Former employees

 

### DDoS Detection

Detection techniques are based on identifying and discriminating the illegitimate traffic increase and flash events from legitimate packet traffic. All detection techniques define an attack as an abnormal and noticeable deviation from a threshold of normal network traffic statistics.

### Activity Profiling 

An attack is indicated by: An increase in activity levels among the network flow clusters. An increase in the overall number of distinct clusters (DDoS attack). Activity profile is done based on the average packet rate for a network flow, which consists of consecutive packets with similar packet fields. Activity profile is obtained by monitoring the network packet's header information. Activity Profiling monitors a network packet's header information, calculates the average packet rate for a network flow.

### Wavelet-based Signal Analysis 

Wavelet analysis describes an input signal in terms of spectral components. Wavelets provide for concurrent time and frequency description. Analysing each spectral window's energy determines the presence of anomalies. Signal analysis determines the time at which certain frequency components are present.

### Isolate Traffic

Change-point detection algorithms isolate changes in network traffic statistics caused by attacks.

### Filter Traffic 

The algorithms filter the target traffic data by address, port, or protocol and store the resultant flow as a time series.

### Identify Attack 

Sequential change-point detection technique uses Cumulative Sum (Cusum) algorithm to identify and locate the DoS attacks; the algorithm calculates deviations in the actual versus expected local average in the traffic time series.

### Identify Scan Activity 

This technique can also be used to identify the typical scanning activities of the network worms.

### Egress Filtering 

Scanning packet headers of IP packets leaving a network. Egress filtering ensures that unauthorized or malicious traffic never leaves internal network.

### Ingress Filtering 

Protects from flooding attacks which originate from the valid prefixes (IP address). It enables the originator to be traced to its true source.

### TCP Intercept 

Configuring TCP Intercept prevents DoS attacks by intercepting and validating the TCP connection requests.

## DDoS IR: Containment

### Objective of Containment 

Mitigate the attack’s effects on the targeted environment.

- If the bottleneck is a particular feature of an application, temporarily disable that feature.

- Attempt to throttle or block DDoS traffic as close to the network’s “cloud” as possible via a router, firewall, load balancer, specialized device, etc.

- Terminate unwanted connections or processes on servers and routers and tune their TCP/IP settings.

- If possible, switch to alternate sites or networks using DNS or another mechanism. Blackhole DDoS traffic targeting the original IP addresses.

- Set up an alternate communication channel between you and your users/customers (e.g.: web/mail/voice server, etc.)

- If possible, route traffic through a traffic-scrubbing service or product via DNS or routing changes (e.g.: sinkhole routing)

- Configure egress filters to block the traffic your systems may send in response to DDoS traffic (e.g.: back squatter traffic), to avoid adding unnecessary packets to the network.

- In case of an extortion attempt, try to buy time with the fraudster. For example, explain that you need more time in order to get management approval.

- If the bottleneck is at the ISP’s side, only the ISP can take efficient actions. In that case, work closely with your ISP and make sure you share information efficiently.

>  

## DDoS IR: Remediation

### Objective of Remediation

Take actions to stop the Denial-of-Service condition.

Contact your ISP and make sure that it enforces remediation measures. For information, here are some of the possible measures:

- Filtering (if possible, at level Tier1 or 2)

- Traffic-scrubbing/Sinkhole/Clean-pipe

- Blackhole Routing

If the DDoS sponsors have been identified, consider involving law enforcement. This should be performed upon the direction of your company’s executive and legal teams. Technical remediation actions can mostly be enforced by your ISP.

>  

## DDoS IR: Recovery

### Objective of Recovery

Come back to the previous functional state.

Assess the end of the DDoS condition

- Ensure that the impacted services are reachable again.

- Ensure that your infrastructure performance is back to your baseline performance.

- Rollback the mitigation measures

- Switch back traffic to your original network.

- Restart stopped services.

Ensure that the recovery-related actions are decided in accordance with the network teams. Bringing up services could have unexpected side effects.

## DDoS IR: Post Incident Activity

### Objective of Post Incident Activity

Document the incident’s details, discuss lessons learned, and adjust plans and defenses.

- Consider what preparation steps you could have taken to respond to the incident faster or more effectively.

- If necessary, adjust assumptions that affected the decisions made during DDoS incident preparation.

- Assess the effectiveness of your DDoS response process, involving people and communications.

- Consider what relationships inside and outside your organizations could help you with future incidents.

- Collaborate with legal teams if a legal action is in process

### DDoS Prevention

Build DDoS response plan

Employ basic network security

Maintain strong network architecture

Understand the Warning Signs

Consider DDoS as a service

**<span class="mark">DDoS Countermeasure Strategies</span>**

### Absorbing the Attack

Use additional capacity to absorb attack; it requires preplanning. It requires additional resources.

### Degrading Services

Identify critical services and stop non critical services.

### Shutting Down the Services

Shut down all the services until the attack has subsided.

### Protect Secondary Victims 

- Install anti-virus and anti-Trojan software and keep these up-to-date.

- Increase awareness of security issues and prevention techniques in all Internet users.

- Disable unnecessary services, uninstall unused applications, and scan all the files received from external sources.

- Properly configure and regularly update the built-in defensive mechanisms in the core hardware and software of the system.

### Detect and Neutralize Handlers 

- Network Traffic Analysis: Analyse communication protocols and traffic patterns between handlers and clients or handlers and agents in order to identify the network nodes that might be infected by the handlers.

- Neutralize Botnet Handlers: There are usually few DDoS handlers deployed as compared to the number of agents. Neutralizing a few handlers can possibly render multiple agents useless, thus thwarting DDoS attacks.

- Spoofed Source Address: There is a decent probability that the spoofed source address of DDoS attack packets will not represent a valid source address of the definite sub-network.

### Deflect Attacks 

- **Use Honeypots**: Systems that are set up with limited security. Act as an enticement for an attacker. Honeypots serve as a means for gaining information about attackers, attack techniques and tools by storing a record of the system activities.

- **Use Defense-in-depth** with IDSes at different network points to divert suspicious DoS traffic to several honeypots.

- **Low-interaction honeypots** all services offered by a Low Interaction Honeypots are emulated.

- **High-interaction honeypots** make use of the actual vulnerable service or software.

- **KFSensor**: KFSensor is a Windows-based honeypot IDS.

### Mitigate Attacks 

- **Load Balancing**: Increase bandwidth on critical connections to absorb additional traffic generated by an attack. Replicate servers to provide additional failsafe protection. Balance load on each server in a multiple-server architecture to mitigate DDoS attack.

- **Throttling**: Set routers to access a server with a logic to throttle incoming traffic levels that are safe for the server. Throttling helps in preventing damage to servers by controlling the DoS traffic. Can be extended to throttle DDoS attack traffic and allow legitimate user traffic for better results.

- **Drop Request**: Drop packets when a load increases.

### Post-Attack Forensics 

- **DDoS attack traffic** patterns can help network administrators to develop new filtering techniques for preventing attack traffic from entering or leaving the networks.

- Analyse router, firewall, and IDS logs to identify source of DoS traffic. Try to trace back attacker IPs with the help of intermediary ISPs and law enforcement agencies.

- **Traffic pattern analysis**: Data can be analysed - post-attack - to look for specific characteristics within the attacking traffic.

- Using these characteristics, the result of traffic pattern analysis can be used for updating load-balancing and throttling countermeasures.

<!-- -->

- **Techniques to Defend against Botnets**

<!-- -->

- **RFC 3704 Filtering**: Any traffic coming from unused or reserved IP addresses is bogus and should be filtered at the ISP before it enters the Internet link.

- **Cisco IPS Source IP Reputation Filtering**: Reputation services help in determining if an IP or service is a source of threat or not, Cisco IPS regularly updates its database with known threats such as botnets, botnet harvesters, malwares, etc. and helps in filtering DoS traffic.

- **Black Hole Filtering**: Black hole refers to network nodes where incoming traffic is discarded or dropped without informing the source that the data did not reach its intended recipient. Black hole filtering refers to discarding packets at the routing level.

- **DDoS Prevention Offerings from ISP or DDoS Service**: Enable IP Source Guard (in CISCO) or similar features in other routers to filter traffic based on the DHCP snooping binding database or IP source bindings which prevents a bot from sending spoofed packets.

### Protect Secondary Victims 

- Install anti-virus and anti-Trojan software and keep these up-to-date.

- Increase awareness of security issues and prevention techniques in all Internet users.

- Disable unnecessary services, uninstall unused applications, and scan all the files received from external sources.

- Properly configure and regularly update the built-in defensive mechanisms in the core hardware and software of the system.

- Use strong encryption mechanisms such as WPA2, AES 256, etc. for broadband networks to withstand eavesdropping.

- Ensure that the software and protocols are up-to-date and scan the machines thoroughly to detect any anomalous behaviour.

- Disable unused and insecure services.

- Block all inbound packets originating from the service ports to block the traffic from reflection servers.

- Update kernel to the latest release.

- Prevent the transmission of the fraudulently addressed packets at ISP level.

- Implement cognitive radios in the physical layer to handle the jamming and scrambling attacks.

- Configure the firewall to deny external ICMP traffic access.

- Perform the thorough input validation.

- Prevent use of unnecessary functions such as gets, strcpy etc.

- Secure the remote administration and connectivity testing.

- Data processed by the attacker should be stopped from being executed.

- Prevent the return addresses from being overwritten.

### Detect and Neutralize Handlers 

- Network Traffic Analysis: Analyse communication protocols and traffic patterns between handlers and clients or handlers and agents in order to identify the network nodes that might be infected by the handlers.

- Neutralize Botnet Handlers: There are usually few DDoS handlers deployed as compared to the number of agents. Neutralizing a few handlers can possibly render multiple agents useless, thus thwarting DDoS attacks.

- Spoofed Source Address: There is a decent probability that the spoofed source address of DDoS attack packets will not represent a valid source address of the definite sub-network.

### Deflect Attacks 

- Systems that are set up with limited security, also known as Honeypots, act as an enticement for an attacker.

- Honeypots serve as a means for gaining information about attackers, attack techniques and tools by storing a record of the system activities.

- Use Defense-in-depth approach with IDSes at different network points to divert suspicious DoS traffic to several honeypots.

- Low-interaction honeypots: All services offered by a Low Interaction Honeypots are emulated.

- High-interaction honeypots: (honeynet) High Interaction Honeypots make use of the actual vulnerable service or software.

- KFSensor: KFSensor is a Windows-based honeypot IDS.

### Mitigate Attacks 

- Load Balancing: Increase bandwidth on critical connections to absorb additional traffic generated by an attack. Replicate servers to provide additional failsafe protection. Balance load on each server in a multiple-server architecture to mitigate DDoS attack.

- Throttling: Set routers to access a server with a logic to throttle incoming traffic levels that are safe for the server. Throttling helps in preventing damage to servers by controlling the DoS traffic. Can be extended to throttle DDoS attack traffic and allow legitimate user traffic for better results.

- Drop Request: Drop packets when a load increases.

### Post-Attack Forensics 

- DDoS attack traffic patterns can help network administrators to develop new filtering techniques for preventing attack traffic from entering or leaving the networks.

- Analyse router, firewall, and IDS logs to identify source of DoS traffic. Try to trace back attacker IP's with the help of intermediary ISPs and law enforcement agencies.

- Traffic pattern analysis: Data can be analysed - post-attack - to look for specific characteristics within the attacking traffic.

- Using these characteristics, the result of traffic pattern analysis can be used for updating load-balancing and throttling countermeasures.

 

### Botnet Countermeasures

- **RFC 3704 Filtering**: Any traffic coming from unused or reserved IP addresses is bogus and should be filtered at the ISP before it enters the Internet link.

- **Cisco IPS Source IP Reputation Filtering**: Reputation services help in determining if an IP or service is a source of threat or not, Cisco IPS regularly updates its database with known threats such as botnets, botnet harvesters, malwares, etc. and helps in filtering DoS traffic.

- **Black Hole Filtering**: Black hole refers to network nodes where incoming traffic is discarded or dropped without informing the source that the data did not reach its intended recipient. Black hole filtering refers to discarding packets at the routing level.

- **DDoS Prevention Offerings from ISP or DDoS Service**: Enable IP Source Guard (in CISCO) or similar features in other routers to filter traffic based on the DHCP snooping binding database or IP source bindings which prevents a bot from sending spoofed packets.

 

### DDoS Protection at ISP Level 

- Most ISPs simply block all the requests during a DDoS attack, denying even the legitimate traffic from accessing the service.

- ISPs offer in-the-cloud DDoS protection for Internet links so that they do not become saturated by the attack.

- Attack traffic is redirected to the ISP during the attack to be filtered and sent back.

- Administrators can request ISPs to block the original affected IP and move their site to another IP after performing DNS propagation.

 

### TCP Intercept on Cisco IOS Software 

To enable TCP intercept, use these commands in global configuration mode:

- Define an IP extended access list: access-list {deny \| permit} tcp anydestination destination-wildcard

- Enable TCP Intercept: ip tcp Intercept list access-list-number

TCP intercept can operate in either active intercept mode or passive watch mode. The default is intercept mode.

The command to set the TCP intercept mode in global configuration mode: Set the TCP intercept mode: ip tcp intercept mode {intercept \| watch}

## QnA DDoS

**What is the three-way handshake? How can it be used to create a DOS attack?**

3-way handshake is a cornerstone of the TCP suite: SYN, SYN/ACK, ACK.

- **SYN** is the outgoing connection request from client to server.

- **SYN/ACK** is the acknowledgement of the server back to the client, saying that yes, I hear you, let us open a connection.

- **ACK** is the final connection, and allows the two to speak.

The problem is that this can be used as a very basic type of denial-of-service attack.

- Client opens the SYN connection, the server responds with the SYN/ACK, but then the client sends another SYN.

- Server treats this as a new connection request and keeps the previous connection open.

- As this is repeated over and over many times very quickly, the server quickly becomes saturated with a huge number of connection requests, eventually overloading its ability to connect to legitimate users.

# The End

# DOS Attack Penetration Testing

- Introduction to DOS Attack

- Botnet

- D-DOS Attack

- SYN Flood Attack

- UDP Flood

- Smurf Attack

- Packet Crafting

- Others DOS Attack Tools

- Covering Tracks & Maintaining Access

- Persistence Service

- Persistence

- Registry Persistence

## How to perform DoS Attack?

1.  **DOS Attack Penetration Testing**

    1.  *Introduction to DOS Attack*

    2.  *Botnet*

    3.  *D-DOS Attack*

    4.  *SYN Flood Attack*

    5.  *UDP Flood*

    6.  *Smurf Attack*

    7.  *Packet Crafting*

    8.  *Others DOS Attack Tools*

**Denial-of-Service**

**DoS/DDoS Concepts**

**DOS/DDoS Attack Techniques**

**Botnets**

**DDOS Case Study**

**DoS/DDoS Attack Tools**

**Countermeasures**

**DoS/DDoS Protection Tools**

 

 

**What is a DDOS attack and how to stop and prevent them?**

- A DDOS (distributed denial-of-service ) is a malicious attempt of disrupting regular traffic of a network by flooding with a large number of requests and making the 598\[’22.458932server unavailable to the appropriate requests. The requests come from several unauthorized \*+++

- 

- 666606985\]sources and hence called distributed denial of service attack.

- Prevent DDoS Attacks:

  - Build a denial of service response plan

  - Employ basic network security

  - Maintain strong network architecture

  - Understand the Warning Signs

  - Consider DDoS as a service

- Generally done by this sometimes happens due to a client misconfiguration.

- The objective of a denial of service (DoS) attack is to overwhelm the resources of a target system and cause it to stop functioning, denying access to its users. Distributed denial of service (DDoS) is a variant of DoS in which attackers compromise a large number of computers or other devices, and use them in a coordinated attack against the target system.

- DDoS attacks are often used in combination with other cyber threats.

- These attacks may launch a denial of service to capture the attention of security staff and create confusion, while they carry out more subtle attacks aimed at stealing data or causing other damage.

- **Methods of DDoS attacks include:**

  - **Botnets**: Systems under hacker control that have been infected with malware. Attackers use these bots to carry out DDoS attacks. Large botnets can include millions of devices and can launch attacks at devastating scale.

  - **Smurf attack**: Sends Internet Control Message Protocol (ICMP) echo requests to the victim’s IP address. The ICMP requests are generated from ‘spoofed’ IP addresses. Attackers automate this process and perform it at scale to overwhelm a target syst-6em.

  - **TCP SYN flood attack**: Attacks flood the target system with connection requests. When the target system attempts to complete the connection, the attacker’s device does not respond, forcing the target system to time out. This quickly fills the connection queue, preventing legitimate users from connecting.

- The following two attacks are less common today, as they rely on vulnerabilities in the internet protocol (IP) which have been addressed on most servers and networks.

  - **Teardrop attack** causes the length and fragmentation offset fields in IP packets to overlap. The targeted system tries to reconstruct packets but fails, which can cause it to crash.

  - **Ping of death attack**: pings a target system using malformed or oversized IP packets, causing the target system to crash or freeze.

- During a DDoS attack, the botnet sends an overwhelming number of requests to a targeted server or application, causing it to crash. Network layer DDoS attacks use SYN floods, UDP floods, DNS amplification, and other techniques designed to eat up the target’s bandwidth and prevent legitimate requests from being served. Application-layer DDoS attacks use HTTP floods, Slowloris or RUDY attacks, zero-day attacks and other attacks that target vulnerabilities in an operating system, application, or protocol in order to crash a particular application.

 

**What is a Denial-of-Service Attack?**

- Denial of Service (DoS) is an attack on a computer or network that reduces, restricts or prevents accessibility of system resources to its legitimate users.

- In a DoS attack, attackers flood a victim system with non-legitimate service requests or traffic to overload its resources.

- DoS attack leads to unavailability of a particular website and show network performance.

 

**What are Distributed Denial of Service Attacks?**

- A distributed denial-of-service (DDoS) attack involves a multitude of compromised systems attacking a single target, thereby causing denial of service for users of the targeted system. To launch a DDoS attack, an attacker uses botnets and attacks a single system.

 

## DoS/DDoS Attacks 

1.  **Volumetric Attacks**: Consumes the bandwidth of target network or service.

2.  **Fragmentation Attacks**: Overwhelms target's ability of re-assembling the fragmented packets.

3.  **TCP State-Exhaustion Attacks**: Consumes the connection state tables present in the network infrastructure components such as load-balancers, firewalls, and application servers.

4.  **Application Layer Attacks**: Consumes the application resources or service thereby making it unavailable to other legitimate users.

 

### DoS/DDoS Attack Techniques 

- Bandwidth Attacks

- Service Request Floods

- SYN Flooding Attack

- ICMP Flood Attack

- Peer-to-Peer Attacks

- Application-Level Flood Attacks

- Permanent Denial-of-Service Attack

- Distributed Reflection Denial of Service (DrDoS)

 

### Bandwidth Attacks 

- A single machine cannot make enough requests to overwhelm network equipment; hence DDoS attacks were created where an attacker uses several computers to flood a victim.

- When a DDoS attack is launched,

- flooding a network, it can cause network equipment such as switches and routers to be overwhelmed due to the significant statistical change in the network traffic.

- Attackers use botnets and carry out DDoS attacks by flooding the network with ICMP ECHO packets.

- Basically, all bandwidth is used and no bandwidth remains for legitimate use.

 

### Service Request Floods 

- An attacker or group of zombies attempts to exhaust server resources by setting up and tearing down TCP connections.

- Service request flood attacks flood servers with a high rate of connections from a valid source.

- It initiates a request on every connection.

 

### SYN Flooding Attack 

- The attacker sends a large number of SYN requests to the target server (victim) with fake source IP addresses.

- The target machine sends back a SYN/ACK in response to the request and waits for the ACK to complete the session setup.

- The target machine does not get the response because the source address is fake.

- **Three-way handshake**

  - TCP SYN request

  - SYN/ACK

  - ACK response

 

### SYN Flooding 

- SYN Flooding takes advantage of a flaw in how most hosts implement the TCP three-way handshake.

- When Host B receives the SYN request from A, it must keep track of the partially opened connection in a "listen queue" for at least 75 seconds.

- A malicious host can exploit the small size of the listen queue by sending multiple SYN requests to a host, but never replying to the SYN/ACK.

- The victim's listening queue is quickly filled up.

- The ability of holding up each incomplete connection for 75 seconds can be cumulatively used as a Denial-of-Service attack.

### ICMP Flood Attack 

- ICMP flood attack is a type DoS attack in which perpetrators send a large number of ICMP packets directly or through reflection networks to victims causing it to be overwhelmed and subsequently stop responding to legitimate TCP/IP requests.

- To protect against ICMP flood attack, set a threshold limit that when exceeded invokes the ICMP flood attack protection feature.

 

### Peer-to-Peer Attacks 

- Using peer-to-peer attacks, attackers instruct clients of peer-to-peer file sharing hubs to disconnect from their peer-to-peer network and to connect to the victim's fake website.

- Attackers exploit flaws found in the network using DC++ (Direct Connect) protocol, that is used for sharing all types of files between instant messaging clients.

- Using this method, attackers launch massive denial-of-service attacks and compromise websites.

- DC++ (Direct Connect) protocol -the attacker acts as a "puppet master," instructing clients of large peer-to-peer file sharing hubs to disconnect from their peer-to-peer network and to connect to the victim's website instead.

 

### Permanent Denial-of-Service (PDoS) Attack 

- **Phlashing**: Permanent DoS, also known as phlashing, refers to attacks that cause irreversible damage to system hardware.

- **Sabotage**: Unlike other DoS attacks, it sabotages the system hardware, requiring the victim to replace or reinstall the hardware.

- **Bricking a system**: This attack is carried out using a method known as "bricking a system" in this attackers send fraudulent hardware updates to the victims.

 

### Application-Level Flood Attacks 

- Application-level flood attacks result in the loss of services of a particular network, such as emails, network resources, the temporary ceasing of applications and services, and more.

- Using this attack, attackers exploit weaknesses in programming source code to prevent the application from processing legitimate requests.

- Using application-level flood attacks, attackers attempts to:

  - Flood web applications to legitimate user traffic.

  - Disrupt service to a specific system or person, for example, blocking a user's access by repeating invalid login attempts.

  - Jam the application-database connection by crafting malicious SQL queries.

 

### Distributed Reflection Denial of Service (DrDOS) 

- A distributed reflected denial of service attack (DRDoS), also known as spoofed attack, involves the use of multiple intermediate and secondary machines that contribute to the actual DDoS attack against the target machine or application.

- Attacker launches this attack by sending requests to the intermediary hosts, these requests are then redirected to the secondary machines which in turn reflects the attack traffic to the target.

- In this attack the primary target seems to be directly attacked by the secondary victim, not the actual attacker.

- IN this attack as multiple intermediary victim servers are used which results in an increase in attack bandwidth.

>  

## Botnet 

- Bots are software applications that run automated tasks over the Internet and perform simple repetitive tasks, such as web spidering and search engine indexing.

- A botnet is a huge network of the compromised systems and can be used by an attacker to launch denial-of-service attacks.

 

### Scanning Methods for Finding Vulnerable Machines 

- **Random Scanning**: The infected machine probes IP addresses randomly from target network IP range and checks for the vulnerability.

- **Hit-list Scanning**: Attacker first collects a list of possible potentially vulnerable machines and then performs scanning to find vulnerable machines.

- **Topological Scanning**: It uses the information obtained on infected machines to find new vulnerable machines.

- **Local Subnet Scanning**: The infected machine looks for the new vulnerable machine in its own local network.

- **Permutation Scanning**: It uses a pseudorandom permutation list of IP addresses to find new vulnerable machines. Divide and conquer

 

**How Malicious Code Propagates?**

Attackers use three techniques to propagate malicious code to newly discovered vulnerable system:

- **Central Source Propagation**: Attacker places attack toolkit on the central source and copy of the attack toolkit is transferred to newly discovered vulnerable system.

- **Back-chaining Propagation**: Attacker places attack toolkit on his/her system itself and copy of the attack toolkit is transferred to newly discovered vulnerable system.

<!-- -->

- **Autonomous Propagation**: Attack toolkit is transferred at the time when the new vulnerable system is discovered.

**Blackshades NET - a botnet trojan**

- Blackshades NET has the ability to create implant binaries which employ custom obfuscation algorithms or Crypters, which can be bought through the Bot/Crypter marketplace embedded in the Blackshades controller.

- Other botnet: Cythosia Botnet, Andromeda Bot, Mirai botnet

**PlugBot - a botnet trojan**

- PlugBot is a hardware botnet project.

- It is a covert penetration testing device (bot) designed for covert use during physical penetration tests.

## DoS/DDoS Tools 

1.  **Pandora DDoS Bot Toolkit**

    - **The Pandora DDoS Bot Toolkit is an updated variant of the Dirt Jumper DDoS toolkit.**

    - **It offers five distributed denial of service (DDoS) attack modes.**

    - **It generates five attack types:**

      - **HTTP min**

      - **HTTP download**

      - **HTTP Combo**

      - **Socket Connect**

      - **Max Flood**

2.  **Dereil and HOIC**

    - **Dereil: Dereil is professional (DDoS) Tools with modern patterns for attack via TCP, UDP, and HTTP protocols.**

    - **HOIC: HOIC makes DDoS attacks to any IP address, with a user selected port and a user selected protocol.**

3.  **DoS HTTP and BanglaDos**

    - **DoS HTTP: DoSHTTP is HTTP Flood Denial of Service (DoS) Testing Tool for Windows. It includes URL verification, HTTP redirection, port designation, performance monitoring and enhanced reporting. It uses multiple asynchronous sockets to perform an effective HTTP Flood.**

    - **BanglaDos:**

4.  **AnDOSid for Mobile**

    - **AnDOSid allows attackers to simulate a DOS attack (A http post flood attack to be exact) and DDoS attack on a web server from mobile phones.**

> DoS and DDoS Attack Tool for Mobile: Low Orbit Ion Cannon (LOIC)

- Android version of Low Orbit Ion Cannon (LOIC) software is used for flooding packets which allows attackers to perform DDoS attacks on target organization.

## DDoS Countermeasures 

1.  **Detection Techniques**

    - **Detection techniques are based on identifying and discriminating the illegitimate traffic increase and flash events from legitimate packet traffic.**

    - **All detection techniques define an attack as an abnormal and noticeable deviation from a threshold of normal network traffic statistics.**

      - **Activity Profiling**

      - **Wavelet-based Signal Analysis**

      - **Changepoint Detection**

2.  **Activity Profiling**

    - **An attack is indicated by: An increase in activity levels among the network flow clusters. An increase in the overall number of distinct clusters (DDoS attack)**

    - **Activity profile is done based on the average packet rate for a network flow, which consists of consecutive packets with similar packet fields.**

    - **Activity profile is obtained by monitoring the network packet's header information.**

    - **Activity Profiling monitors a network packet's header information, calculates the average packet rate for a network flow.**

3.  **Wavelet-based Signal Analysis**

    - **Wavelet analysis describes an input signal in terms of spectral components.**

    - **Wavelets provide for concurrent time and frequency description.**

    - **Analysing each spectral window's energy determines the presence of anomalies.**

    - **Signal analysis determines the time at which certain frequency components are present.**

4.  **Sequential Change-Point Detection**

    - **Isolate Traffic: Change-point detection algorithms isolate changes in network traffic statistics caused by attacks.**

    - **Filter Traffic: The algorithms filter the target traffic data by address, port, or protocol and store the resultant flow as a time series.**

    - **Identify Attack: Sequential change-point detection technique uses Cumulative Sum (Cusum) algorithm to identify and locate the DoS attacks; the algorithm calculates deviations in the actual versus expected local average in the traffic time series.**

    - **Identify Scan Activity: This technique can also be used to identify the typical scanning activities of the network worms.**

5.  **DoS/DDoS Countermeasure Strategies**

    - **Absorbing the Attack: Use additional capacity to absorb attack; it requires preplanning. It requires additional resources.**

    - **Degrading Services: Identify critical services and stop non critical services.**

    - **Shutting Down the Services: Shut down all the services until the attack has subsided.**

## DDoS Attack Countermeasures 

1.  **Protect Secondary Victims**

    - **Install anti-virus and anti-Trojan software and keep these up-to-date.**

    - **Increase awareness of security issues and prevention techniques in all Internet users.**

    - **Disable unnecessary services, uninstall unused applications, and scan all the files received from external sources.**

    - **Properly configure and regularly update the built-in defensive mechanisms in the core hardware and software of the system.**

2.  **Detect and Neutralize Handlers**

    - **Network Traffic Analysis: Analyse communication protocols and traffic patterns between handlers and clients or handlers and agents in order to identify the network nodes that might be infected by the handlers.**

    - **Neutralize Botnet Handlers: There are usually few DDoS handlers deployed as compared to the number of agents. Neutralizing a few handlers can possibly render multiple agents useless, thus thwarting DDoS attacks.**

    - **Spoofed Source Address: There is a decent probability that the spoofed source address of DDoS attack packets will not represent a valid source address of the definite sub-network.**

3.  **Detect Potential Attacks**

    - **Egress Filtering: Scanning packet headers of IP packets leaving a network. Egress filtering ensures that unauthorized or malicious traffic never leaves internal network.**

    - **Ingress Filtering: Protects from flooding attacks which originate from the valid prefixes (IP address)**

    - **It enables the originator to be traced to its true source.**

    - **TCP Intercept: Configuring TCP Intercept prevents DoS attacks by intercepting and validating the TCP connection requests.**

4.  **Deflect Attacks**

    - **Systems that are set up with limited security, also known as Honeypots, act as an enticement for an attacker.**

    - **Honeypots serve as a means for gaining information about attackers, attack techniques and tools by storing a record of the system activities.**

    - **Use Defense-in-depth approach with IDSes at different network points to divert suspicious DoS traffic to several honeypots.**

    - **Low-interaction honeypots: All services offered by a Low Interaction Honeypots are emulated.**

    - **High-interaction honeypots: (honeynet) High Interaction Honeypots make use of the actual vulnerable service or software.**

    - **KFSensor: KFSensor is a Windows-based honeypot IDS.**

5.  **Mitigate Attacks**

    - **Load Balancing: Increase bandwidth on critical connections to absorb additional traffic generated by an attack. Replicate servers to provide additional failsafe protection. Balance load on each server in a multiple-server architecture to mitigate DDoS attack.**

    - **Throttling: Set routers to access a server with a logic to throttle incoming traffic levels that are safe for the server. Throttling helps in preventing damage to servers by controlling the DoS traffic. Can be extended to throttle DDoS attack traffic and allow legitimate user traffic for better results.**

    - **Drop Request: Drop packets when a load increases.**

6.  **Post-Attack Forensics**

    - **DDoS attack traffic patterns can help network administrators to develop new filtering techniques for preventing attack traffic from entering or leaving the networks.**

    - **Analyse router, firewall, and IDS logs to identify source of DoS traffic. Try to trace back attacker IP's with the help of intermediary ISPs and law enforcement agencies.**

    - **Traffic pattern analysis: Data can be analysed - post-attack - to look for specific characteristics within the attacking traffic.**

    - **Using these characteristics, the result of traffic pattern analysis can be used for updating load-balancing and throttling countermeasures.**

 

## Techniques to Defend against Botnets 

- **RFC 3704 Filtering**: Any traffic coming from unused or reserved IP addresses is bogus and should be filtered at the ISP before it enters the Internet link.

- **Cisco IPS Source IP Reputation Filtering**: Reputation services help in determining if an IP or service is a source of threat or not, Cisco IPS regularly updates its database with known threats such as botnets, botnet harvesters, malwares, etc. and helps in filtering DoS traffic.

- **Black Hole Filtering**: Black hole refers to network nodes where incoming traffic is discarded or dropped without informing the source that the data did not reach its intended recipient. Black hole filtering refers to discarding packets at the routing level.

<!-- -->

- **DDoS Prevention Offerings from ISP or DDoS Service**: Enable IP Source Guard (in CISCO) or similar features in other routers to filter traffic based on the DHCP snooping binding database or IP source bindings which prevents a bot from sending spoofed packets.

 

## DoS/DDoS Countermeasures 

- Use strong encryption mechanisms such as WPA2, AES 256, etc. for broadband networks to withstand eavesdropping.

- Ensure that the software and protocols are up-to-date and scan the machines thoroughly to detect any anomalous behaviour.

- Disable unused and insecure services.

- Block all inbound packets originating from the service ports to block the traffic from reflection servers.

- Update kernel to the latest release.

- Prevent the transmission of the fraudulently addressed packets at ISP level.

- Implement cognitive radios in the physical layer to handle the jamming and scrambling attacks.

- Configure the firewall to deny external ICMP traffic access.

- Perform the thorough input validation.

- Prevent use of unnecessary functions such as gets, strcpy etc.

- Secure the remote administration and connectivity testing.

- Data processed by the attacker should be stopped from being executed.

- Prevent the return addresses from being overwritten.

 

### DoS/DDoS Protection at ISP Level 

- Most ISPs simply block all the requests during a DDoS attack, denying even the legitimate traffic from accessing the service.

- ISPs offer in-the-cloud DDoS protection for Internet links so that they do not become saturated by the attack.

- Attack traffic is redirected to the ISP during the attack to be filtered and sent back.

- Administrators can request ISPs to block the original affected IP and move their site to another IP after performing DNS propagation.

 

### Enabling TCP Intercept on Cisco IOS Software 

- To enable TCP intercept, use these commands in global configuration mode:

  - Define an IP extended access list: access-list {deny \| permit} tcp anydestination destination-wildcard

  - Enable TCP Intercept: ip tcp Intercept list access-list-number

- TCP intercept can operate in either active intercept mode or passive watch mode. The default is intercept mode.

- The command to set the TCP intercept mode in global configuration mode: Set the TCP intercept mode: ip tcp intercept mode {intercept \| watch}

# DDoS

> What is a Denial-of-Service Attack?

- Denial of Service (DoS) is an attack on a computer or network that reduces, restricts or prevents accessibility of system resources to its legitimate users.

- In a DoS attack, attackers flood a victim system with non-legitimate service requests or traffic to overload its resources.

- DoS attack leads to unavailability of a particular website and show network performance.

> What are Distributed Denial of Service Attacks?
>
> A distributed denial-of-service (DDoS) attack involves a multitude of compromised systems attacking a single target, thereby causing denial of service for users of the targeted system.

- To launch a DDoS attack, an attacker uses botnets and attacks a single system.

DoS/DDoS Attacks

> Basic Categories of DoS/DDoS Attack Vectors

- **Volumetric Attacks**: Consumes the bandwidth of target network or service.

- **Fragmentation Attacks**: Overwhelms target's ability of re-assembling the fragmented packets.

- **TCP State-Exhaustion Attacks**: Consumes the connection state tables present in the network infrastructure components such as load-balancers, firewalls, and application servers.

- **Application Layer Attacks**: Consumes the application resources or service thereby making it unavailable to other legitimate users.

> DoS/DDoS Attack Techniques

- Bandwidth Attacks and Service Request Floods

- SYN Flooding Attack

- ICMP Flood Attack

- Peer-to-Peer Attacks

- Application-Level Flood Attacks

- Permanent Denial-of-Service Attack

- Distributed Reflection Denial of Service (DrDoS)

> Bandwidth Attacks

- A single machine cannot make enough requests to overwhelm network equipment; hence DDoS attacks were created where an attacker uses several computers to flood a victim.

- When a DDoS attack is launched, flooding a network, it can cause network equipment such as switches and routers to be overwhelmed due to the significant statistical change in the network traffic.

- Attackers use botnets and carry out DDoS attacks by flooding the network with ICMP ECHO packets.

- Basically, all bandwidth is used and no bandwidth remains for legitimate use.

> Service Request Floods

- An attacker or group of zombies attempts to exhaust server resources by setting up and tearing down TCP connections.

- Service request flood attacks flood servers with a high rate of connections from a valid source.

- It initiates a request on every connection.

> SYN Attack

- The attacker sends a large number of SYN requests to the target server (victim) with fake source IP addresses.

- The target machine sends back a SYN/ACK in response to the request and waits for the ACK to complete the session setup.

- The target machine does not get the response because the source address is fake.

> three-way handshake

1.  TCP SYN request

2.  SYN/ACK

3.  ACK response

> SYN Flooding

1.  SYN Flooding takes advantage of a flaw in how most hosts implement the TCP threeway handshake.

2.  When Host B receives the SYN request from A, it must keep track of the partiallyopened connection in a "listen queue" for at least 75 seconds.

3.  A malicious host can exploit the small size of the listen queue by sending multiple SYN requests to a host, but never replying to the SYN/ACK.

4.  The victim's listening queue is quickly filled up.

5.  The ability of holding up each incomplete connection for 75 seconds can be cumulatively used as a Denial-of-Service attack.

> ICMP Flood Attack

- ICMP flood attack is a type DoS attack in which perpetrators send a large number of ICMP packets directly or through reflection networks to victims causing it to be overwhelmed and subsequently stop responding to legitimate TCP/IP requests.

- To protect against ICMP flood attack, set a threshold limit that when exceeded invokes the ICMP flood attack protection feature.

> Peer-to-Peer Attacks

- Using peer-to-peer attacks, attackers instruct clients of peer-to-peer file sharing hubs to disconnect from their peer-to-peer network and to connect to the victim's fake website.

- Attackers exploit flaws found in the network using DC++ (Direct Connect) protocol, that is used for sharing all types of files between instant messaging clients.

- Using this method, attackers launch massive denial-of-service attacks and compromise websites.

- DC++ (Direct Connect) protocol -the attacker acts as a "puppet master," instructing clients of large peer-to-peer file sharing hubs to disconnect from their peer-to-peer network and to connect to the victim's website instead.

> Permanent Denial-of-Service (PDoS) Attack

- **Phlashing**:

  1.  Permanent DoS, also known as phlashing, refers to attacks that cause irreversible damage to system hardware.

- **Sabotage**:

  1.  Unlike other DoS attacks, it sabotages the system hardware, requiring the victim to replace or reinstall the hardware.

- **Bricking a system**:

  1.  This attack is carried out using a method known as "bricking a system"

> ○ Using this method, attackers send fraudulent hardware updates to the victims.
>
> Application-Level Flood Attacks

- Application-level flood attacks result in the loss of services of a particular network, such as emails, network resources, the temporary ceasing of applications and services, and more.

- Using this attack, attackers exploit weaknesses in programming source code to prevent the application from processing legitimate requests.

- **Using application-level flood attacks, attackers attempts to:**

  1.  Flood web applications to legitimate user traffic.

> ○ Disrupt service to a specific system or person, for example, blocking a user's access by repeating invalid login attempts.
>
> ○ Jam the application-database connection by crafting malicious SQL queries.
>
> Distributed Reflection Denial of Service (DRDoS)

- A distributed reflected denial of service attack (DRDoS), also known as spoofed attack, involves the use of multiple intermediate and secondary machines that contribute to the actual DDoS attack against the target machine or application.

- Attacker launches this attack by sending requests to the intermediary hosts, these requests are then redirected to the secondary machines which in turn reflects the attack traffic to the target.

- Advantage:

  1.  The primary target seems to be directly attacked by the secondary victim, not the actual attacker.

> ○ As multiple intermediary victim servers are used which results in an increase in attack bandwidth.

Botnet

- Bots are software applications that run automated tasks over the Internet and perform simple repetitive tasks, such as web spidering and search engine indexing.

- A botnet is a huge network of the compromised systems and can be used by an attacker to launch denial-of-service attacks.

> Scanning Methods for Finding Vulnerable Machines

- **Random Scanning**: The infected machine probes IP addresses randomly from target network IP range and checks for the vulnerability.

- **Hit-list Scanning**: Attacker first collects a list of possible potentially vulnerable machines and then performs scanning to find vulnerable machines.

- **Topological Scanning**: It uses the information obtained on infected machines to find new vulnerable machines.

- **Local Subnet Scanning**: The infected machine looks for the new vulnerable machine in its own local network.

- **Permutation Scanning**: It uses a pseudorandom permutation list of IP addresses to find new vulnerable machines. Divide and conquer

> How Malicious Code Propagates?

- Attackers use three techniques to propagate malicious code to newly discovered vulnerable system:

> ○ **Central Source Propagation**: Attacker places attack toolkit on the central source and copy of the attack toolkit is transferred to the newly discovered vulnerable system.
>
> ○ **Back-chaining Propagation**: Attacker places attack toolkit on his/her system itself and copy of the attack toolkit is transferred to the newly discovered vulnerable system.
>
> ○ **Autonomous Propagation**: Attack toolkit is transferred at the time when the new vulnerable system is discovered.
>
> Botnet Trojan: Blackshades NET

- Blackshades NET has the ability to create implant binaries which employ custom obfuscation algorithms or Crypters, which can be bought through the Bot/Crypter marketplace embedded in the BlackShades controller.

> Other botnes: Cythosia Botnet, Andromeda Bot, Mirai botnet
>
> Botnet Trojan: PlugBot

- PlugBot is a hardware botnet project.

- It is a covert penetration testing device (bot) designed for covert use during physical penetration tests.

DoS/DDoS Tools

> DoS and DDoS Attack Tool: Pandora DDoS Bot Toolkit

- The Pandora DDoS Bot Toolkit is an updated variant of the Dirt Jumper DDoS toolkit.

- It offers five distributed denial of service (DDoS) attack modes.

- **It generates five attack types**:

  1.  HTTP min

> ○ HTTP download
>
> ○ HTTP Combo
>
> ○ Socket Connect
>
> ○ Max Flood
>
> DoS and DDoS Attack Tools: Dereil and HOIC

- **Dereil**: Dereil is professional (DDoS) Tools with modern patterns for attack via TCP, UDP, and HTTP protocols.

- **HOIC**: HOIC makes DDoS attacks to any IP address, with a user selected port and a user selected protocol.

> DoS and DDoS Attack Tools: DoS HTTP and BanglaDos

- **DoS HTTP**:

  1.  DoSHTTP is HTTP Flood Denial of Service (DoS) Testing Tool for Windows

> ○ It includes URL verification, HTTP redirection, port designation, performance monitoring and enhanced reporting.
>
> ○ It uses multiple asynchronous sockets to perform an effective HTTP Flood. ● **BanglaDos**
>
> DoS and DDoS Attack Tools
>
> DoS and DDoS Attack Tool for Mobile: AnDOSid

- AnDOSid allows attackers to simulate a DOS attack (A http post flood attack to be exact) and DDoS attack on a web server from mobile phones.

> DoS and DDoS Attack Tool for Mobile: Low Orbit Ion Cannon (LOIC)

- Android version of Low Orbit Ion Cannon (LOIC) software is used for flooding packets which allows attackers to perform DDoS attacks on target organization.

DDoS Countermeasures

> Detection Techniques

- Detection techniques are based on identifying and discriminating the illegitimate traffic increase and flash events from legitimate packet traffic.

- All detection techniques define an attack as an abnormal and noticeable deviation from a threshold of normal network traffic statistics.

1.  Activity Profiling

2.  Wavelet-based Signal Analysis

3.  Changepoint Detection

> Activity Profiling

- An attack is indicated by:

  1.  An increase in activity levels among the network flow clusters.

> ○ An increase in the overall number of distinct clusters (DDoS attack)

- Activity profile is done based on the average packet rate for a network flow, which consists of consecutive packets with similar packet fields.

- Activity profile is obtained by monitoring the network packet's header information.

> Activity Profiling monitors a network packet's header information, calculates the average packet rate for a network flow.
>
> Wavelet-based Signal Analysis

- Wavelet analysis describes an input signal in terms of spectral components.

- Wavelets provide for concurrent time and frequency description.

- Analyzing each spectral window's energy determines the presence of anomalies.

- Signal analysis determines the time at which certain frequency components are present.

> Sequential Change-Point Detection

- **Isolate Traffic**: Change-point detection algorithms isolate changes in network traffic statistics caused by attacks.

- **Filter Traffic**: The algorithms filter the target traffic data by address, port, or protocol and store the resultant flow as a time series.

> **Identify Attack**: Sequential change-point detection technique uses Cumulative Sum (Cusum) algorithm to identify and locate the DoS attacks; the algorithm calculates deviations in the actual versus expected local average in the traffic time series.

- **Identify Scan Activity**: This technique can also be used to identify the typical scanning activities of the network worms.

> DoS/DDoS Countermeasure Strategies

- **Absorbing the Attack**:

  1.  Use additional capacity to absorb attack; it requires preplanning. ○ It requires additional resources.

- **Degrading Services**:

  1.  Identify critical services and stop non critical services.

- **Shutting Down the Services**:

  1.  Shut down all the services until the attack has subsided.

> DDoS Attack Countermeasures

- Protect Secondary Victims

- Neutralize Handlers

- Prevent Potential Attacks

- Deflect Attacks

- Mitigate Attacks

- Post-attack Forensics

> DoS/DDoS Attack Countermeasures: Protect Secondary Victims

- Install anti-virus and anti-Trojan software and keep these up-to-date.

- Increase awareness of security issues and prevention techniques in all Internet users.

- Disable unnecessary services, uninstall unused applications, and scan all the files received from external sources.

> Properly configure and regularly update the built-in defensive mechanisms in the core hardware and software of the system.
>
> DoS/DDoS Attack Countermeasures: Detect and Neutralize Handlers

- **Network Traffic Analysis**: Analyze communication protocols and traffic patterns between handlers and clients or handlers and agents in order to identify the network nodes that might be infected by the handlers.

- **Neutralize Botnet Handlers**: There are usually few DDoS handlers deployed as compared to the number of agents. Neutralizing a few handlers can possibly render multiple agents useless, thus thwarting DDoS attacks.

- **Spoofed Source Address**: There is a decent probability that the spoofed source address of DDoS attack packets will not represent a valid source address of the definite sub-network.

> DoS/DDoS Countermeasures: Detect Potential Attacks

- **Egress Filtering**:

  1.  Scanning the packet headers of IP packets leaving a network.

> ○ Egress filtering ensures that unauthorized or malicious traffic never leaves the internal network.

- **Ingress Filtering**:

  1.  Protects from flooding attacks which originate from the valid prefixes (IP address) ○ It enables the originator to be traced to its true source.

- **TCP Intercept**:

  1.  Configuring TCP Intercept prevents DoS attacks by intercepting and validating the TCP connection requests.

> DoS/DDoS Countermeasures: Deflect Attacks

- Systems that are set up with limited security, also known as Honeypots, act as an enticement for an attacker.

- Honeypots serve as a means for gaining information about attackers, attack techniques and tools by storing a record of the system activities.

- Use defense-in-depth approach with IPSes at different network points to divert suspicious DoS traffic to several honeypots.

> Low-interaction honeypots: All services offered by a Low Interaction Honeypots are emulated.

- High-interaction honeypots: (honeynet) High Interaction Honeypots make use of the actual vulnerable service or software.

- KFSensor: KFSensor is a Windows-based honeypot IDS.

> DoS/DDoS Countermeasures: Mitigate Attacks

- **Load Balancing**:

  1.  Increase bandwidth on critical connections to absorb additional traffic generated by an attack.

> ○ Replicate servers to provide additional failsafe protection.
>
> ○ Balance load on each server in a multiple-server architecture to mitigate DDoS attack.

- **Throttling**:

  1.  Set routers to access a server with a logic to throttle incoming traffic levels that are safe for the server.

> ○ Throttling helps in preventing damage to servers by controlling the DoS traffic.
>
> ○ Can be extended to throttle DDoS attack traffic and allow legitimate user traffic for better results.

- **Drop Request**:

  1.  Drop packets when a load increases.

> Post-Attack Forensics

- DDoS attack traffic patterns can help the network administrators to develop new filtering techniques for preventing the attack traffic from entering or leaving the networks.

- Analyze router, firewall, and IDS logs to identify the source of the DoS traffic. Try to trace back attacker IP's with the help of intermediary ISPs and law enforcement agencies.

- Traffic pattern analysis: Data can be analyzed - post-attack - to look for specific characteristics within the attacking traffic.

- Using these characteristics, the result of traffic pattern analysis can be used for updating load-balancing and throttling countermeasures.

> Techniques to Defend against Botnets

- **RFC 3704 Filtering**: Any traffic coming from unused or reserved IP addresses is bogus and should be filtered at the ISP before it enters the Internet link.

- **Cisco IPS Source IP Reputation Filtering**: Reputation services help in determining if an IP or service is a source of threat or not, Cisco IPS regularly updates its database with known threats such as botnets, botnet harvesters, malwares, etc. and helps in filtering DoS traffic.

- **Black Hole Filtering**:

  1.  Black hole refers to network nodes where incoming traffic is discarded or dropped without informing the source that the data did not reach its intended recipient.

> ○ Black hole filtering refers to discarding packets at the routing level.

- **DDoS Prevention Offerings from ISP or DDoS Service**: Enable IP Source Guard (in CISCO) or similar features in other routers to filter traffic based on the DHCP snooping binding database or IP source bindings which prevents a bot from sending spoofed packets.

> DoS/DDoS Countermeasures

- Use strong encryption mechanisms such as WPA2, AES 256, etc. for broadband networks to withstand eavesdropping.

- Ensure that the software and protocols are up-to-date and scan the machines thoroughly to detect any anomalous behavior.

- Disable unused and insecure services.

- Block all inbound packets originating from the service ports to block the traffic from reflection servers.

- Update kernel to the latest release.

- Prevent the transmission of the fraudulently addressed packets at ISP level.

- Implement cognitive radios in the physical layer to handle the jamming and scrambling attacks.

- Configure the firewall to deny external ICMP traffic access.

- Perform the thorough input validation.

- Prevent use of unnecessary functions such as gets, strcpy etc.

- Secure the remote administration and connectivity testing.

- Data processed by the attacker should be stopped from being executed.

- Prevent the return addresses from being overwritten.

> DoS/DDoS Protection at ISP Level

- Most ISPs simply block all the requests during a DDoS attack, denying even the legitimate traffic from accessing the service.

- ISPs offer in-the-cloud DDoS protection for Internet links so that they do not become saturated by the attack.

- Attack traffic is redirected to the ISP during the attack to be filtered and sent back.

- Administrators can request ISPs to block the original affected IP and move their site to another IP after performing DNS propagation.

> Enabling TCP Intercept on Cisco IOS Software

- To enable TCP intercept, use these commands in global configuration mode:

  1.  Define an IP extended access list: access-list access-list {deny \| permit} tcp any destination destination-wildcard

> ○ Enable TCP Intercept: ip tcp Intercept list access-list-number

- TCP intercept can operate in either active intercept mode or passive watch mode. The default is intercept mode.

- The command to set the TCP intercept mode in global configuration mode:

  1.  Set the TCP intercept mode: ip tcp intercept mode {intercept \| watch}

# Distributed Denial of Service (DDoS)

- Generally done by flooding the service or network with more requests than can be serviced, which results in the service becoming unreachable. This sometimes happens due to a client misconfiguration.

- The objective of a denial of service (DoS) attack is to overwhelm the resources of a target system and cause it to stop functioning, denying access to its users. Distributed denial of service (DDoS) is a variant of DoS in which attackers compromise a large number of computers or other devices, and use them in a coordinated attack against the target system.

- DDoS attacks are often used in combination with other cyber threats. These attacks may launch a denial of service to capture the attention of security staff and crea confusion, while they carry out more subtle attacks aimed at stealing data or causing other damage

**Method of DDoS**

- **Methods of DDoS attacks include:**

- **Botnets**: Systems under hacker control that have been infected with malware. Attackers use these bots to carry out DDoS attacks. Large botnets can include millions of devices and can launch attacks at devastating scale.

- **Smurf attack**: Sends Internet Control Message Protocol (ICMP) echo requests to the victim’s IP address. The ICMP requests are generated from ‘spoofed’ IP addresses. Attackers automate this process and perform it at scale to overwhelm a target system.

- **TCP SYN flood attack**: Attacks flood the target system with connection requests. When the target system attempts to complete the connection, the attacker’s device does not respond, forcing the target system to time out. This quickly fills the connection queue, preventing legitimate users from connecting.

- The following two attacks are less common today, as they rely on vulnerabilities in the internet protocol (IP) which have been addressed on most servers and netwo

- **Teardrop attack** causes the length and fragmentation offset fields in IP packets to overlap. The targeted system tries to reconstruct packets but fails, which ca cause it to crash.

- **Ping of death attack**: pings a target system using malformed or oversized IP packets, causing the target system to crash or freeze.

<!-- -->

- **DOS Attack Penetration Testing**

<!-- -->

- Introduction to DOS Attack

- Botnet

- D-DOS Attack

- SYN Flood Attack

- UDP Flood

- Smurf Attack

- Packet Crafting

- Others DOS Attack Tools

<!-- -->

- **What is a DDoS attack and how to stop and prevent them?**

- A DDOs (distributed denial-of-service ) is a malicious attempt of disrupting regular traffic of a network by flooding with a large number of requests and making the server unavailable to the appropriate requests. The requests come from several unauthorized sources and hence called distributed denial of service attack.

- Methods to prevent DDoS Attacks

<!-- -->

- Build a denial of service response plan

- Employ basic network security

- Maintain strong network architecture

- Understand the Warning signs

- Consider DDoS as a service

-  

- What is a DDOS attack and how to stop and prevent them?

- A DDOS (distributed denial-of-service) is a malicious attempt of disrupting regular traffic of a network by flooding with a large number of requests and making the server unavailable to the appropriate requests. The requests come from several unauthorized sources and hence called distributed denial of service attack.

-  

- Methods to prevent DDoS Attacks

  - Build a denial-of-service response plan

  - Employ basic network security

  - Maintain strong network architecture

  - Understand the Warning Signs

  - Consider DDoS as a service

# DDOS Attack

This again is an important Cybersecurity Interview Question. A **DDOS(Distributed Denial of Service)** attack is a cyberattack that causes the servers to refuse to provide services to genuine clients. DDOS attack can be classified into two types:

**Flooding attacks**: In this type, the hacker sends a huge amount of traffic to the server which the server cannot handle. And hence, the server stops functioning. This type of attack is usually executed by using automated programs that continuously send packets to the server.

**Crash attacks:** In this type, the hackers exploit a bug on the server resulting in the system to crash and hence the server is not able to provide service to the clients.

You can prevent DDOS attacks by using the following practices:

- Use Anti-DDOS services

- Configure Firewalls and Routers

- Use Front-End Hardware

- Use Load Balancing

- Handle Spikes in Traffic

<!-- -->

- What is a DDoS attack?

<!-- -->

- What is a DDoS attack?

- How can you prevent DOS/DDOS attack?

- **What is a DDOS attack and how to stop and prevent them?** A DDOS (distributed denial-of-service ) is a malicious attempt of disrupting regular traffic of a network by flooding with many requests and making the server unavailable to the appropriate requests. The requests come from several unauthorized sources and hence called distributed denial of service attack. The following methods will help you to stop and prevent DDOS attacks: Build a denial-of-service response plan, Protect your network infrastructure, Employ basic network security, Maintain strong network architecture, Understand the Warning Signs, Consider DDoS as a service

- What is a DDoS attack?

- **DDoS and its mitigation?** DDoS stands for distributed denial of service. When a network/server/application is flooded with large number of requests which it is not designed to handle making the server unavailable to the legitimate requests. The requests can come from different not related sources hence it is a distributed denial of service attack. It can be mitigated by analysing and filtering the traffic in the scrubbing centres. The scrubbing centres are centralized data cleansing station wherein the traffic to a website is analysed and the malicious traffic is removed.

- **What is a denial of service (DOS) attack and what are the common forms?** DOS attacks involve flooding servers, systems, or networks with traffic to cause overconsumption of victim resources. This makes it difficult or impossible for legitimate users to access or use targeted sites. Common DOS attacks include: Buffer overflow attacks, ICMP flood, SYN flood, Teardrop attack, Smurf attack.

- What is a designated confirmer signature?

- **What is a distributed denial-of-service attack (DDoS)?** It is an attack in which multiple computers attack website, server, or any network resource.
