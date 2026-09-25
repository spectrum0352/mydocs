# DDoS Protection

How Azure DDoS protection works?

DDoS Protection Standard monitors actual traffic utilization and
constantly compares it against the thresholds defined in the DDoS
policy. When the traffic threshold is exceeded, DDoS mitigation is
automatically initiated. When traffic returns to a level below the
threshold, the mitigation is removed. During mitigation, DDoS Protection
redirects traffic sent to the protected resource and performs several
checks, including:

- Helping ensure that packets conform to internet specifications and are
  not malformed.

- Interacting with the client to determine if the traffic might be a
  spoofed packet (for example, using SYN Auth or SYN Cookie or dropping
  a packet for the source to retransmit it).

- Using rate-limit packets if it cannot perform any other enforcement
  method.

Within a few minutes of attack detection, you will be notified with
Azure Monitor metrics. Azure Monitor retains metric data for DDoS
Protection Standard for 30 days.

Types of DDoS attacks that Azure DDoS protection mitigates

- **Volumetric attacks:** UDP floods, amplification floods, and other
  spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other
  protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations,
  SQL injection, cross-site scripting and other layer 7 attacks

## DDoS Attack

- Attack that has the goal of preventing access to services or systems
  (Availability).

- If attack launched from one location, then it is called Denial of
  Service attack.

- If attack launched from multiple locations the it is called
  Distributed DoS attack.

- Botnets are collection of interconnected systems and used without
  owner knowledge.

- Botnet owners use them for Spamming, DDoS, Data storage and various
  other actions.

 

## Best practices

Secure application development

- **Scalability** - Ability of a system to handle increased load

- **Availability** - Proportion of time that a system is functional and
  working

- **Resiliency** - Ability of a system to recover from failures and
  continue to function

- **Management** - Operations processes that keep a system running in
  production

- **Security** - Protecting applications and data from threats

Design application to scale horizontally

- If your application depends on a single instance of a service, it
  creates a single point of failure.

- Provisioning multiple instances makes your system more resilient and
  more scalable.

Design layers of security defenses in application

- Reduce the surface area by using IP allowlists to close the exposed IP
  address space and listening ports that are not needed on the load
  balancers.

- ‎You can also use NSGs (Service tag, ASG) to reduce the attack surface.

Azure DDoS protection service tiers:

| Basic | Standard |
|----|----|
| Automatically enabled as part of the Azure platform | DDoS Protection Standard is simple to enable, and requires no application changes. |
| Always-on traffic monitoring, and real-time mitigation of common network-level attacks, provide the same defenses utilized by Microsoft's online services. | Protection policies are tuned through dedicated traffic monitoring and machine learning algorithms. |
| The entire scale of Azure's global network can be used to distribute and mitigate attack traffic across regions. | Policies are applied to public IP addresses associated to resources deployed in virtual networks, such as Azure Load Balancer, Azure Application Gateway, and Azure Service Fabric instances, but this protection does not apply to App Service Environments. |
| Protection is provided for IPv4 and IPv6 Azure public IP addresses. | Real-time telemetry is available through Azure Monitor views during an attack, and for history |
|   | Rich attack mitigation analytics are available via diagnostic settings |

 

 

## Perimeter security

How Azure denial-of-service protection works?

- DDoS Protection Standard monitors actual traffic utilization and
  constantly compares it against the thresholds defined in the DDoS
  policy.

- When the traffic threshold is exceeded, DDoS mitigation is
  automatically initiated.

- When traffic returns to a level below the threshold, the mitigation is
  removed.

- During mitigation, DDoS Protection redirects traffic sent to the
  protected resource and performs several checks, including:

  - Helping ensure that packets conform to internet specifications and
    are not malformed.

  - Interacting with the client to determine if the traffic might be a
    spoofed packet (for example, using SYN Auth or SYN Cookie or
    dropping a packet for the source to retransmit it).

  - Using rate-limit packets if it cannot perform any other enforcement
    method.

- Within a few minutes of attack detection, you will be notified with
  Azure Monitor metrics.

- Azure Monitor retains metric data for DDoS Protection Standard for 30
  days.

Types of DDoS attacks that Azure DDoS protection mitigates

- **Volumetric attacks:** UDP floods, amplification floods, and other
  spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other
  protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations,
  SQL injection, cross-site scripting, and other layer 7 attacks

>  
>
>  

# Azure DDoS Protection

- **DDoS Attack**

  1.  Attack that has the goal of preventing access to services or
      systems (Availability).

  2.  If attack launched from one location, then it is called Denial of
      Service attack.

  3.  If attack launched from multiple locations the it is called
      Distributed DoS attack.

  4.  Botnets are collection of interconnected systems and used without
      owner knowledge.

  5.  Botnet owners use them for Spamming, DDoS, Data storage and
      various other actions.

- **Azure DDoS Protection**

  1.  Service Tiers: Basic, Standard

>  
>
> **<u>DDoS protection best practices</u>**

- **Secure application development**

  1.  <u>Scalability</u> - Ability of a system to handle increased load

  2.  <u>Availability</u> - Proportion of time that a system is
      functional and working

  3.  <u>Resiliency</u> - Ability of a system to recover from failures
      and continue to function

  4.  <u>Management</u> - Operations processes that keep a system
      running in production

  5.  <u>Security</u> - Protecting applications and data from threats

- **Design application to scale horizontally**

  1.  If your application depends on a single instance of a service, it
      creates a single point of failure.

  2.  Provisioning multiple instances makes your system more resilient
      and more scalable.

- **Design layers of security defenses in application**

  1.  Reduce the surface area by using IP allowlists to close down the
      exposed IP address space and listening ports that aren’t needed on
      the load balancers.

  2.  ‎You can also use NSGs (Service tag, ASG) to reduce the attack
      surface.

- <span class="mark">Azure DDoS protection service tiers:</span>

| **Basic** | **Standard** |
|----|----|
| Automatically enabled as part of the Azure platform | DDoS Protection Standard is simple to enable, and requires no application changes. |
| Always-on traffic monitoring, and real-time mitigation of common network-level attacks, provide the same defenses utilized by Microsoft's online services. | Protection policies are tuned through dedicated traffic monitoring and machine learning algorithms. |
| The entire scale of Azure's global network can be used to distribute and mitigate attack traffic across regions. | Policies are applied to public IP addresses associated to resources deployed in virtual networks, such as Azure Load Balancer, Azure Application Gateway, and Azure Service Fabric instances, but this protection does not apply to App Service Environments. |
| Protection is provided for IPv4 and IPv6 Azure public IP addresses. | Real-time telemetry is available through Azure Monitor views during an attack, and for history |
|   | Rich attack mitigation analytics are available via diagnostic settings |

>  

- **<span class="mark">How Azure denial-of-service protection
  works?</span>**

- DDoS Protection Standard monitors actual traffic utilization and
  constantly compares it against the thresholds defined in the DDoS
  policy.

- When the traffic threshold is exceeded, DDoS mitigation is
  automatically initiated.

- When traffic returns to a level below the threshold, the mitigation is
  removed.

- During mitigation, DDoS Protection redirects traffic sent to the
  protected resource and performs several checks, including:

  1.  Helping ensure that packets conform to internet specifications and
      aren’t malformed.

  2.  Interacting with the client to determine if the traffic might be a
      spoofed packet (for example, using SYN Auth or SYN Cookie or
      dropping a packet for the source to retransmit it).

  3.  Using rate-limit packets if it can’t perform any other enforcement
      method.

- Within a few minutes of attack detection, you’ll be notified with
  Azure Monitor metrics.

- Azure Monitor retains metric data for DDoS Protection Standard for 30
  days.

- **<span class="mark">Types of DDoS attacks that Azure DDoS protection
  mitigates</span>**

- **Volumetric attacks** : UDP floods, amplification floods, and other
  spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other
  protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations,
  SQL injection, cross-site scripting and other layer 7 attacks

>  
>
>  
>
> **What is Azure DDoS Protection**

- It is Azure service used to filter large scale attacks before they can
  cause denial of service.

**DDoS Protection**

- 1\. Attack that has the goal of preventing access to services or
  systems (Availability).

- 2\. If attack launched from one location, then it is called Denial of
  Service attack.

- 3\. If attack launched from multiple locations the it is called
  Distributed DoS attack.

- 4\. Botnets are collection of interconnected systems and used without
  owner knowledge.

- 5\. Botnet owners use them for Spamming, DDoS, Data storage and
  various other actions.

- Used to filter large scale attacks before they can cause denial of
  service.

- Protects Azure-hosted applications from distributed denial of service
  (DDOS) attacks.

- DDoS Protection Standard monitors actual traffic utilization and
  constantly compares it against the thresholds defined in the DDoS
  policy.

- When the traffic threshold is exceeded, DDoS mitigation is
  automatically initiated.

- When traffic returns to a level below the threshold, the mitigation is
  removed.

- During mitigation, DDoS Protection redirects traffic sent to the
  protected resource and performs several checks, including:

  - Helping ensure that packets conform to internet specifications and
    aren’t malformed.

  - Interacting with the client to determine if the traffic might be a
    spoofed packet (for example, using SYN Auth or SYN Cookie or
    dropping a packet for the source to retransmit it).

  - Using rate-limit packets if it can’t perform any other enforcement
    method.

- Within a few minutes of attack detection, you’ll be notified with
  Azure Monitor metrics.

- Azure Monitor retains metric data for DDoS Protection Standard for 30
  days.

- Types of DDoS attacks that Azure DDoS protection mitigates

  - Volumetric attacks : UDP floods, amplification floods, and other
    spoofed-packet floods (Multiple GB attacks)

  - Protocol attacks: SYN flood attacks, reflection attacks, and other
    protocol attacks

  - Resource (Application) layer attacks: HTTP protocol violations, SQL
    injection, cross-site scripting and other layer 7 attacks

- **Azure DDoS Protection Tiers**: Service Tiers: Basic, Standard

**DDoS protection best practices**

**Secure application development**

1.  <u>Scalability</u> - Ability of a system to handle increased load

2.  <u>Availability</u> - Proportion of time that a system is functional
    and working

3.  <u>Resiliency</u> - Ability of a system to recover from failures and
    continue to function

4.  <u>Management</u> - Operations processes that keep a system running
    in production

5.  <u>Security</u> - Protecting applications and data from threats

**Design application to scale horizontally**

1.  If your application depends on a single instance of a service, it
    creates a single point of failure.

2.  Provisioning multiple instances makes your system more resilient and
    more scalable.

- **Design layers of security defenses in application**

1.  Reduce the surface area by using IP allowlists to close down the
    exposed IP address space and listening ports that aren’t needed on
    the load balancers.

2.  ‎You can also use NSGs (Service tag, ASG) to reduce the attack
    surface.

- **Azure DDoS protection service tiers:**

<img src="media/image1.png" style="width:6.75067in;height:3.42014in" />

- **How Azure denial-of-service protection works?**

  - DDoS Protection Standard monitors actual traffic utilization and
    constantly compares it against the thresholds defined in the DDoS
    policy.

  - When the traffic threshold is exceeded, DDoS mitigation is
    automatically initiated.

  - When traffic returns to a level below the threshold, the mitigation
    is removed.

  - During mitigation, DDoS Protection redirects traffic sent to the
    protected resource and performs several checks, including:

    1.  Helping ensure that packets conform to internet specifications
        and aren’t malformed.

    2.  Interacting with the client to determine if the traffic might be
        a spoofed packet (for example, using SYN Auth or SYN Cookie or
        dropping a packet for the source to retransmit it).

    3.  Using rate-limit packets if it can’t perform any other
        enforcement method.

  - Within a few minutes of attack detection, you’ll be notified with
    Azure Monitor metrics.

  - Azure Monitor retains metric data for DDoS Protection Standard for
    30 days.

- **<span class="mark"> </span>**

- **Types of DDoS attacks that Azure DDoS protection mitigates**

<!-- -->

- **Volumetric attacks:** UDP floods, amplification floods, and other
  spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other
  protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations,
  SQL injection, cross-site scripting and other layer 7 attacks

  - **Azure DDoS Protection**

> Protects Azure-hosted applications from distributed denial of service
> (DDOS) attacks.
>
>  
>
> **Azure DDoS Protection**

- **DDoS Attack**

  1.  Attack that has the goal of preventing access to services or
      systems (Availability).

  2.  If attack launched from one location, then it is called Denial of
      Service attack.

  3.  If attack launched from multiple locations the it is called
      Distributed DoS attack.

  4.  Botnets are collection of interconnected systems and used without
      owner knowledge.

  5.  Botnet owners use them for Spamming, DDoS, Data storage and
      various other actions.

- **Azure DDoS Protection**

  1.  Service Tiers: Basic, Standard

>  
>
> **<u>DDoS protection best practices</u>**

- **Secure application development**

  1.  <u>Scalability</u> - Ability of a system to handle increased load

  2.  <u>Availability</u> - Proportion of time that a system is
      functional and working

  3.  <u>Resiliency</u> - Ability of a system to recover from failures
      and continue to function

  4.  <u>Management</u> - Operations processes that keep a system
      running in production

  5.  <u>Security</u> - Protecting applications and data from threats

- **Design application to scale horizontally**

  1.  If your application depends on a single instance of a service, it
      creates a single point of failure.

  2.  Provisioning multiple instances makes your system more resilient
      and more scalable.

- **Design layers of security defenses in application**

  1.  Reduce the surface area by using IP allowlists to close down the
      exposed IP address space and listening ports that aren’t needed on
      the load balancers.

  2.  ‎You can also use NSGs (Service tag, ASG) to reduce the attack
      surface.

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

- **<span class="mark">How Azure denial-of-service protection
  works?</span>**

- DDoS Protection Standard monitors actual traffic utilization and
  constantly compares it against the thresholds defined in the DDoS
  policy.

- When the traffic threshold is exceeded, DDoS mitigation is
  automatically initiated.

- When traffic returns to a level below the threshold, the mitigation is
  removed.

- During mitigation, DDoS Protection redirects traffic sent to the
  protected resource and performs several checks, including:

  1.  Helping ensure that packets conform to internet specifications and
      aren’t malformed.

  2.  Interacting with the client to determine if the traffic might be a
      spoofed packet (for example, using SYN Auth or SYN Cookie or
      dropping a packet for the source to retransmit it).

  3.  Using rate-limit packets if it can’t perform any other enforcement
      method.

- Within a few minutes of attack detection, you’ll be notified with
  Azure Monitor metrics.

- Azure Monitor retains metric data for DDoS Protection Standard for 30
  days.

- **<span class="mark">Types of DDoS attacks that Azure DDoS protection
  mitigates</span>**

- **Volumetric attacks** : UDP floods, amplification floods, and other
  spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other
  protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations,
  SQL injection, cross-site scripting and other layer 7 attacks

>  

**What is Azure DDoS Protection**

It is Azure service used to filter large scale attacks before they can
cause denial of service.

## DDoS Protection

- **Azure DDoS Protection**

  1.  Service Tiers: Basic, Standard

>  
>
> **<u>DDoS protection best practices</u>**

- **Secure application development**

  1.  <u>Scalability</u> - Ability of a system to handle increased load

  2.  <u>Availability</u> - Proportion of time that a system is
      functional and working

  3.  <u>Resiliency</u> - Ability of a system to recover from failures
      and continue to function

  4.  <u>Management</u> - Operations processes that keep a system
      running in production

  5.  <u>Security</u> - Protecting applications and data from threats

- **Design application to scale horizontally**

  1.  If your application depends on a single instance of a service, it
      creates a single point of failure.

  2.  Provisioning multiple instances makes your system more resilient
      and more scalable.

- **Design layers of security defenses in application**

  1.  Reduce the surface area by using IP allowlists to close down the
      exposed IP address space and listening ports that aren’t needed on
      the load balancers.

  2.  ‎You can also use NSGs (Service tag, ASG) to reduce the attack
      surface.

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

- **<span class="mark">How Azure denial-of-service protection
  works?</span>**

- DDoS Protection Standard monitors actual traffic utilization and
  constantly compares it against the thresholds defined in the DDoS
  policy.

- When the traffic threshold is exceeded, DDoS mitigation is
  automatically initiated.

- When traffic returns to a level below the threshold, the mitigation is
  removed.

- During mitigation, DDoS Protection redirects traffic sent to the
  protected resource and performs several checks, including:

  1.  Helping ensure that packets conform to internet specifications and
      aren’t malformed.

  2.  Interacting with the client to determine if the traffic might be a
      spoofed packet (for example, using SYN Auth or SYN Cookie or
      dropping a packet for the source to retransmit it).

  3.  Using rate-limit packets if it can’t perform any other enforcement
      method.

- Within a few minutes of attack detection, you’ll be notified with
  Azure Monitor metrics.

- Azure Monitor retains metric data for DDoS Protection Standard for 30
  days.

**Types of DDoS attacks that Azure DDoS protection mitigates**

- **Volumetric attacks:** UDP floods, amplification floods, and other
  spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other
  protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations,
  SQL injection, cross-site scripting and other layer 7 attacks

<!-- -->

- **How Azure denial-of-service protection works?**

  - DDoS Protection Standard monitors actual traffic utilization and
    constantly compares it against the thresholds defined in the DDoS
    policy.

  - When the traffic threshold is exceeded, DDoS mitigation is
    automatically initiated.

  - When traffic returns to a level below the threshold, the mitigation
    is removed.

  - During mitigation, DDoS Protection redirects traffic sent to the
    protected resource and performs several checks, including:

    1.  Helping ensure that packets conform to internet specifications
        and aren’t malformed.

    2.  Interacting with the client to determine if the traffic might be
        a spoofed packet (for example, using SYN Auth or SYN Cookie or
        dropping a packet for the source to retransmit it).

    3.  Using rate-limit packets if it can’t perform any other
        enforcement method.

  - Within a few minutes of attack detection, you’ll be notified with
    Azure Monitor metrics.

  - Azure Monitor retains metric data for DDoS Protection Standard for
    30 days.

- **<span class="mark"> </span>**

- **Types of DDoS attacks that Azure DDoS protection mitigates**

<!-- -->

- **Volumetric attacks:** UDP floods, amplification floods, and other
  spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other
  protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations,
  SQL injection, cross-site scripting and other layer 7 attacks

 

## Azure DDoS Protection

Protects Azure-hosted applications from distributed denial of service
(DDOS) attacks.

**DDoS Attack**

1.  Attack that has the goal of preventing access to services or systems
    (Availability).

    If attack launched from one location, then it is called Denial of
    Service attack.

    If attack launched from multiple locations the it is called
    Distributed DoS attack.

    Botnets are collection of interconnected systems and used without
    owner knowledge.

    Botnet owners use them for Spamming, DDoS, Data storage and various
    other actions.

**Azure DDoS Protection Service Tiers**

- Basic

- Standard

**<span class="mark">DDoS protection best practices</span>**

**Secure application development**

6.  <u>Scalability</u> - Ability of a system to handle increased load

    <u>Availability</u> - Proportion of time that a system is functional
    and working

    <u>Resiliency</u> - Ability of a system to recover from failures and
    continue to function

    <u>Management</u> - Operations processes that keep a system running
    in production

    <u>Security</u> - Protecting applications and data from threats

**Design application to scale horizontally**

11. If your application depends on a single instance of a service, it
    creates a single point of failure.

    Provisioning multiple instances makes your system more resilient and
    more scalable.

**Design layers of security defenses in application**

13. Reduce the surface area by using IP allowlists to close the exposed
    IP address space and listening ports that are not needed on the load
    balancers.

    ‎You can also use NSGs (Service tag, ASG) to reduce the attack
    surface.

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

- DDoS Protection Standard monitors actual traffic utilization and
  constantly compares it against the thresholds defined in the DDoS
  policy.

- When the traffic threshold is exceeded, DDoS mitigation is
  automatically initiated.

- When traffic returns to a level below the threshold, the mitigation is
  removed.

- During mitigation, DDoS Protection redirects traffic sent to the
  protected resource and performs several checks, including:

  - Helping ensure that packets conform to internet specifications and
    are not malformed.

  - Interacting with the client to determine if the traffic might be a
    spoofed packet (for example, using SYN Auth or SYN Cookie or
    dropping a packet for the source to retransmit it).

  - Using rate-limit packets if it cannot perform any other enforcement
    method.

- Within a few minutes of attack detection, you will be notified with
  Azure Monitor metrics.

- Azure Monitor retains metric data for DDoS Protection Standard for 30
  days.

**Types of DDoS attacks that Azure DDoS protection mitigates**

- **Volumetric attacks:** UDP floods, amplification floods, and other
  spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other
  protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations,
  SQL injection, cross-site scripting, and other layer 7 attacks

## Azure DDoS Protection

- **DDoS Attack**

  1.  Attack that has the goal of preventing access to services or
      systems (Availability).

  2.  If attack launched from one location, then it is called Denial of
      Service attack.

  3.  If attack launched from multiple locations the it is called
      Distributed DoS attack.

  4.  Botnets are collection of interconnected systems and used without
      owner knowledge.

  5.  Botnet owners use them for Spamming, DDoS, Data storage and
      various other actions.

- **Azure DDoS Protection**

  1.  Service Tiers: Basic, Standard

>  
>
> **<u>DDoS protection best practices</u>**

- **Secure application development**

  1.  <u>Scalability</u> - Ability of a system to handle increased load

  2.  <u>Availability</u> - Proportion of time that a system is
      functional and working

  3.  <u>Resiliency</u> - Ability of a system to recover from failures
      and continue to function

  4.  <u>Management</u> - Operations processes that keep a system
      running in production

  5.  <u>Security</u> - Protecting applications and data from threats

- **Design application to scale horizontally**

  1.  If your application depends on a single instance of a service, it
      creates a single point of failure.

  2.  Provisioning multiple instances makes your system more resilient
      and more scalable.

- **Design layers of security defenses in application**

  1.  Reduce the surface area by using IP allowlists to close down the
      exposed IP address space and listening ports that aren’t needed on
      the load balancers.

  2.  ‎You can also use NSGs (Service tag, ASG) to reduce the attack
      surface.

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

- **<span class="mark">How Azure denial-of-service protection
  works?</span>**

- DDoS Protection Standard monitors actual traffic utilization and
  constantly compares it against the thresholds defined in the DDoS
  policy.

- When the traffic threshold is exceeded, DDoS mitigation is
  automatically initiated.

- When traffic returns to a level below the threshold, the mitigation is
  removed.

- During mitigation, DDoS Protection redirects traffic sent to the
  protected resource and performs several checks, including:

  1.  Helping ensure that packets conform to internet specifications and
      aren’t malformed.

  2.  Interacting with the client to determine if the traffic might be a
      spoofed packet (for example, using SYN Auth or SYN Cookie or
      dropping a packet for the source to retransmit it).

  3.  Using rate-limit packets if it can’t perform any other enforcement
      method.

- Within a few minutes of attack detection, you’ll be notified with
  Azure Monitor metrics.

- Azure Monitor retains metric data for DDoS Protection Standard for 30
  days.

- **<span class="mark">Types of DDoS attacks that Azure DDoS protection
  mitigates</span>**

- **Volumetric attacks** : UDP floods, amplification floods, and other
  spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other
  protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations,
  SQL injection, cross-site scripting and other layer 7 attacks

>  

## Azure DDoS Protection

Protects Azure-hosted applications from distributed denial of service
(DDOS) attacks.

**DDoS Attack**

15. Attack that has the goal of preventing access to services or systems
    (Availability).

    If attack launched from one location, then it is called Denial of
    Service attack.

    If attack launched from multiple locations the it is called
    Distributed DoS attack.

    Botnets are collection of interconnected systems and used without
    owner knowledge.

    Botnet owners use them for Spamming, DDoS, Data storage and various
    other actions.

**Azure DDoS Protection Service Tiers**

- Basic

- Standard

>  

**<span class="mark">DDoS protection best practices</span>**

**Secure application development**

20. <u>Scalability</u> - Ability of a system to handle increased load

    <u>Availability</u> - Proportion of time that a system is functional
    and working

    <u>Resiliency</u> - Ability of a system to recover from failures and
    continue to function

    <u>Management</u> - Operations processes that keep a system running
    in production

    <u>Security</u> - Protecting applications and data from threats

**Design application to scale horizontally**

25. If your application depends on a single instance of a service, it
    creates a single point of failure.

    Provisioning multiple instances makes your system more resilient and
    more scalable.

**Design layers of security defenses in application**

27. Reduce the surface area by using IP allowlists to close the exposed
    IP address space and listening ports that are not needed on the load
    balancers.

    ‎You can also use NSGs (Service tag, ASG) to reduce the attack
    surface.

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

- DDoS Protection Standard monitors actual traffic utilization and
  constantly compares it against the thresholds defined in the DDoS
  policy.

- When the traffic threshold is exceeded, DDoS mitigation is
  automatically initiated.

- When traffic returns to a level below the threshold, the mitigation is
  removed.

- During mitigation, DDoS Protection redirects traffic sent to the
  protected resource and performs several checks, including:

  - Helping ensure that packets conform to internet specifications and
    are not malformed.

  - Interacting with the client to determine if the traffic might be a
    spoofed packet (for example, using SYN Auth or SYN Cookie or
    dropping a packet for the source to retransmit it).

  - Using rate-limit packets if it cannot perform any other enforcement
    method.

- Within a few minutes of attack detection, you will be notified with
  Azure Monitor metrics.

- Azure Monitor retains metric data for DDoS Protection Standard for 30
  days.

**Types of DDoS attacks that Azure DDoS protection mitigates**

- **Volumetric attacks:** UDP floods, amplification floods, and other
  spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other
  protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations,
  SQL injection, cross-site scripting, and other layer 7 attacks

## Azure DDoS Protection

- **DDoS Attack**

  1.  Attack that has the goal of preventing access to services or
      systems (Availability).

  2.  If attack launched from one location, then it is called Denial of
      Service attack.

  3.  If attack launched from multiple locations the it is called
      Distributed DoS attack.

  4.  Botnets are collection of interconnected systems and used without
      owner knowledge.

  5.  Botnet owners use them for Spamming, DDoS, Data storage and
      various other actions.

- **Azure DDoS Protection**

  1.  Service Tiers: Basic, Standard

>  
>
> **<u>DDoS protection best practices</u>**

- **Secure application development**

  1.  <u>Scalability</u> - Ability of a system to handle increased load

  2.  <u>Availability</u> - Proportion of time that a system is
      functional and working

  3.  <u>Resiliency</u> - Ability of a system to recover from failures
      and continue to function

  4.  <u>Management</u> - Operations processes that keep a system
      running in production

  5.  <u>Security</u> - Protecting applications and data from threats

- **Design application to scale horizontally**

  1.  If your application depends on a single instance of a service, it
      creates a single point of failure.

  2.  Provisioning multiple instances makes your system more resilient
      and more scalable.

- **Design layers of security defenses in application**

  1.  Reduce the surface area by using IP allowlists to close down the
      exposed IP address space and listening ports that aren’t needed on
      the load balancers.

  2.  ‎You can also use NSGs (Service tag, ASG) to reduce the attack
      surface.

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

Denial-of-Service (DoS) and Distributed Denial-of-Service (DDoS) attacks
are malicious attempts to disrupt the normal traffic of a network by
overwhelming it with fake requests. This makes the network or service
unavailable to legitimate users.

DoS attack originates from a single source, while DDoS attack comes from
multiple sources, typically botnets which are collections of compromised
devices.

The goal of both attacks is to overload the target system's resources
and prevent it from functioning properly. DDoS attacks are more
difficult to defend against because they are spread out across many
devices.

DoS and DDoS attacks can be used to distract security personnel while
other attacks are carried out.

DDoS (Distributed Denial-of-Service) attacks overwhelm a network with
fake traffic from multiple sources, making it unavailable to legitimate
users.

Here is how to prevent them:

- **Plan:** Create a response plan outlining steps to take during a DDoS
  attack.

- **Security:** Implement basic network security measures like
  firewalls.

- **Architecture:** Design a strong network architecture that can handle
  traffic spikes.

- **Warning Signs:** Be aware of signs that might indicate a DDoS
  attack.

- **DDoS Protection Services:** Consider using services that can
  mitigate DDoS attacks.

# DDoS Countermeasures

**Secure application development**

- <u>Scalability</u> - Ability of a system to handle increased load

- <u>Availability</u> - Proportion of time that a system is functional
  and working

- <u>Resiliency</u> - Ability of a system to recover from failures and
  continue to function

- <u>Management</u> - Operations processes that keep a system running in
  production

- <u>Security</u> - Protecting applications and data from threats

**Design application to scale horizontally**

- If your application depends on a single instance of a service, it
  creates a single point of failure.

- Provisioning multiple instances makes your system more resilient and
  more scalable.

**Design layers of security defenses in application**

3.  Reduce the surface area by using IP allowlists to close down the
    exposed IP address space and listening ports that aren’t needed on
    the load balancers.

4.  ‎You can also use NSGs (Service tag, ASG) to reduce the attack
    surface.

## Detection and Mitigation Techniques

This summarizes various techniques to detect and mitigate DDoS attacks:

**Activity Profiling:**

- Monitors network traffic patterns and identifies deviations from the
  norm.

- Analyzes average packet rates for network flows (groups of packets
  with similar characteristics) based on header information.

- An increase in activity levels or the number of distinct clusters can
  indicate a DDoS attack.

**Detection Techniques:**

- These techniques aim to differentiate legitimate traffic from
  malicious attack traffic.

- They identify abnormal increases in traffic volume or "flash events"
  (sudden spikes) compared to established baselines.

- Common techniques include:

  - **Activity Profiling (described above)**

  - **Wavelet-based Signal Analysis:** Analyzes traffic data in terms of
    frequency components to detect anomalies.

  - **Changepoint Detection:**

    - Isolates traffic changes caused by attacks using statistical
      algorithms.

    - Filters traffic data and identifies attack points using techniques
      like Cumulative Sum (CUSUM) to detect deviations from expected
      traffic patterns.

    - Can also identify scanning activities of worms.

**Protecting Secondary Victims:**

These measures aim to minimize the impact of DDoS attacks on secondary
victims (internet users and connected devices):

- **Software Updates:** Install and update anti-malware software on all
  devices.

- **Security Awareness:** Educate users about security issues and
  prevention techniques.

- **Application Management:** Disable unnecessary services, uninstall
  unused applications, and scan external files before opening them.

- **System Hardening:** Configure and update security settings on
  devices (firewalls, operating systems, applications).

- **Additional Measures:** Implement strong encryption, conduct
  vulnerability scans, use robust input validation, and secure remote
  access protocols.

**Remember:**

A combination of these techniques can significantly enhance your DDoS
defense strategy. By proactively monitoring traffic patterns and
implementing security measures, you can minimize the risk and impact of
DDoS attacks on your network and protect secondary victims.

# Method of DDoS attacks

DDoS attacks use botnets, which are groups of hacked devices controlled
by attackers, to overwhelm a target system with traffic from multiple
sources. There are different techniques to launch DDoS attacks:

- **Botnet Flood:** A large number of compromised devices bombard the
  target with traffic, overloading its resources.

- **Smurf Attack:** Spoofed IP addresses are used to send messages to a
  victim's IP address, causing the network to get flooded with
  responses.

- **TCP SYN Flood Attack:** Attackers send a massive amount of
  connection requests to the target system, leaving it stuck waiting for
  responses and unable to handle legitimate traffic.

- **Teardrop Attack:** Malformed packets are sent to the target, causing
  it to crash or malfunction.

- **Ping of Death Attack:** Oversized packets are sent to the target,
  crashing or freezing it.

These last two methods are less common as system vulnerabilities they
exploit have been patched.

## DDoS Attack Summary

A DDoS (Distributed Denial-of-Service) attack aims to disrupt a system
or network by overwhelming it with traffic from multiple sources. This
makes the system unavailable to legitimate users.

**DDoS Attack Methods:**

- **Botnets:** Large networks of compromised devices controlled by
  attackers to launch attacks.

- **Ping of Death Attack:** Sending malformed packets to crash the
  target system.

- **Smurf Attack:** Spoofing IP addresses to flood the victim with
  responses.

- **TCP SYN Flood Attack:** Overwhelming the target with connection
  requests.

- **Teardrop Attack:** Sending packets that cause the target to
  malfunction.

- **Application-Level Attacks:** Targeting specific applications to
  consume resources.

- **Bandwidth Attacks:** Flooding the network with traffic to exhaust
  bandwidth.

- **Distributed Reflection DoS (DrDoS):** Using intermediary servers to
  amplify the attack.

- **ICMP Flood Attack:** Overwhelming the target with ICMP echo
  requests.

- **Peer-to-Peer Attacks:** Exploiting peer-to-peer networks to launch
  attacks.

- **Permanent DoS Attacks:** Causing irreversible damage to the target
  system.

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

- DoS/DDoS attacks can be used to distract security personnel while
  other attacks are carried out.

- Web servers are common targets for DoS/DDoS attacks.

## DDoS Attacks: A Summary

This comprehensive summary details various aspects of DDoS attacks,
including methods, tools, prevention strategies, and their impact.

**Botnets:**

- Networks of compromised devices controlled by attackers to launch DDoS
  attacks.

- Large botnets can include millions of devices and overwhelm target
  systems.

- Attackers use scanning methods to find vulnerable machines to build
  botnets.

- Malicious code is propagated to these machines using various
  techniques.

**DDoS Attack Methods:**

- **Network Layer Attacks:**

  - TCP SYN Floods: Exhaust target's connection queue with connection
    requests.

  - UDP Floods: Overwhelm target with User Datagram Protocol (UDP)
    packets.

  - ICMP Floods: Flood target with ICMP echo requests (ping).

  - DNS Amplification: Leverage vulnerable DNS servers to amplify attack
    traffic.

- **Application Layer Attacks:**

  - HTTP Floods: Overload target web servers with HTTP requests.

  - Slowloris/RUDY Attacks: Keep connections open without sending
    complete requests, exhausting resources.

  - Zero-Day Attacks: Exploit unknown vulnerabilities in applications or
    protocols.

- **Other Techniques:**

  - Smurf Attacks: Spoof victim's IP address to overwhelm them with
    responses.

  - Teardrop Attacks: Send malformed packets causing target systems to
    crash.

  - Ping of Death Attacks: Send oversized packets crashing target
    systems.

  - Permanent DoS Attacks: Cause irreversible damage to target hardware.

**DDoS Attack Effects:**

- Denial-of-Service: Legitimate users cannot access targeted system or
  service.

- Network Congestion: Overall network performance degrades.

- Financial Losses: Businesses lose revenue due to service downtime.

**DDoS Prevention Strategies:**

- Implement strong network security measures.

- Monitor for suspicious activity and warning signs.

- Utilize DDoS mitigation services.

- Have a DDoS response plan in place.

**Additional Points:**

- DoS attacks involve a single attacker source, while DDoS attacks are
  distributed.

- Botnet trojans like Blackshades and PlugBot are used to manage
  botnets.

- DDoS attacks can be used as distractions for other cyber attacks.

 

## 3-Way Handshake and Denial-of-Service Attacks

The three-way handshake is a fundamental process in establishing
reliable connections using the TCP protocol. Here's a breakdown:

1.  **SYN (Synchronize):** The client sends a packet with a
    synchronization flag to initiate a connection with the server.

2.  **SYN/ACK (Synchronize Acknowledge):** The server responds with a
    packet containing both SYN and ACK flags, acknowledging the client's
    request and indicating its readiness to connect.

3.  **ACK (Acknowledge):** Finally, the client sends an ACK packet
    confirming its receipt of the server's response, and the connection
    is established.

**Exploiting the Handshake for DoS Attacks:**

Attackers can exploit the three-way handshake to launch a
Denial-of-Service (DoS) attack known as a SYN flood attack. Here's how
it works:

1.  **Fake SYN Packets:** The attacker sends a large number of SYN
    packets to the target server, often with spoofed IP addresses.

2.  **Server Response:** The server, unaware of the attack, responds to
    each SYN packet with a SYN/ACK packet, allocating resources for a
    potential connection.

3.  **Missing ACK:** The attacker never sends the final ACK packet,
    leaving the server waiting for completion of the handshake for each
    connection.

4.  **Resource Exhaustion:** With a continuous stream of fake SYN
    packets, the server becomes overwhelmed, depleting resources
    (memory, processing power) to handle incomplete connections. This
    prevents the server from responding to legitimate connection
    requests, effectively denying service to real users.

**Key Points:**

- The DoS attack leverages the server's expectation of a complete
  handshake and its resource allocation for pending connections.

- By overwhelming the server with incomplete connections, the attacker
  cripples its ability to serve legitimate users.

**Mitigating SYN Flood Attacks:**

- **SYN Cookies:** Techniques like SYN cookies allow servers to
  acknowledge SYN requests without consuming as many resources.

- **Rate Limiting:** Limiting the number of incoming connections per IP
  address can help prevent attackers from overwhelming the server.

- **Resource Monitoring:** Continuously monitoring server resources and
  implementing automated actions can help detect and respond to DoS
  attacks.

# DDoS Tools 

This summary outlines various tools used to launch DDoS attacks.

**DDoS Attack Tools:**

- **Pandora DDoS Bot Toolkit:** Offers five attack modes including HTTP
  floods and connection floods.

- **Dereil:** Professional tool for TCP, UDP, and HTTP DDoS attacks.

- **HOIC:** Launches DDoS attacks on a specified IP address, port, and
  protocol.

- **DoS HTTP:** Windows tool for launching HTTP flood DDoS attacks.

- **AnDOSid for Mobile:** Mobile app for simulating DoS and DDoS attacks
  (limited functionality).

**Important Note:**

These tools are primarily used by malicious actors. DDoS attacks are
illegal and can cause significant disruption and financial losses.

# Azure DDoS Protection

**What is a DDoS Attack?**

A DDoS attack aims to overwhelm a system with traffic, making it
unavailable to legitimate users. It can be launched from a single
location (DoS) or from multiple locations (Distributed DoS) using
botnets (collections of compromised devices).

**Azure DDoS Protection Service:**

- Offers two tiers: Basic (free, always-on) and Standard (advanced
  features).

- Protects against various DDoS attacks, including volumetric attacks,
  protocol attacks, and resource layer attacks.

**Best Practices for DDoS Mitigation:**

- Secure application development.

- Design for scalability and resiliency (ability to handle increased
  load and recover from failures).

- Implement layers of security defenses, including:

  - **Scaling horizontally:** Use multiple instances of a service to
    avoid single points of failure.

  - **Reducing attack surface:** Limit exposed IP addresses and ports
    with IP allowlists and Network Security Groups (NSGs).

**Azure DDoS Protection Standard Features:**

- Always-on traffic monitoring and real-time mitigation.

- Machine learning-based protection policies tuned for optimal defense.

- Utilizes the global Azure network to distribute and mitigate attack
  traffic.

- Protects public IP addresses associated with resources like Azure Load
  Balancer and virtual networks.

- Provides real-time telemetry and attack analytics during and after an
  attack.

**How Azure DDoS Protection Works:**

- Monitors traffic and compares it to thresholds defined in your DDoS
  policy.

- Automatically initiates mitigation when traffic exceeds thresholds.

- Performs various checks on incoming traffic during mitigation,
  including:

  - Packet conformance to internet specifications.

  - Spoofing detection (SYN Auth, SYN Cookie, or packet drops).

  - Rate limiting if other enforcement methods fail.

- Notifies you within minutes of attack detection with Azure Monitor
  metrics (data retained for 30 days).

**Remember:** Azure DDoS Protection is a valuable tool for mitigating
DDoS attacks. By combining it with secure application development and
best practices, you can significantly enhance your cloud environment's
resilience.

# DDoS IR

## Preparation

**DDoS IR Preparation is Key:**

- **Objective:** Establish contacts, define procedures, and gather
  information to expedite response during an attack.

**Key Actions:**

- **ISP Support:**

  - Understand your ISP's DDoS mitigation options (free/paid) and
    reporting procedures.

  - Consider redundant internet connections.

  - Establish contact with ISP and law enforcement (out-of-band
    communication channels like phone calls).

- **Inventory:**

  - Create a whitelist of critical IP addresses and protocols
    (customers, partners) for traffic prioritization.

  - Document IT infrastructure details (owners, IP addresses, circuits,
    routing, network topology).

- **Network Infrastructure:**

  - Design a resilient network with no single points of failure
    (bottlenecks).

  - Distribute critical services (DNS, SMTP) across different Autonomous
    Systems (AS).

  - Harden network, OS, and application configurations against DDoS
    attacks.

  - Baseline network performance for faster attack detection.

  - Consider specialized DDoS mitigation services for internet-dependent
    businesses.

  - Lower DNS Time-To-Live (TTL) for faster redirection during attacks
    (600 seconds is a good value).

  - Implement backups to switch to in case of service disruption.

- **Internal Contacts:**

  - Establish contact points for IDS, firewall, systems, and network
    teams.

  - Collaborate with business units to understand potential financial
    losses from DDoS attacks.

  - Involve Business Continuity Plan/Disaster Recovery (BCP/DR) teams in
    DDoS incident response.

## Detection and Analysis

**Objective:** Detect the attack, determine its scope, and involve
relevant teams.

**Analysis Steps:**

1.  **Understand the Attack:**

    - Analyze attack flow and identify affected infrastructure
      components.

    - Determine if you are the target or a collateral victim.

2.  **Review Logs and Files:**

    - Check load and log files of servers, routers, firewalls,
      applications, etc.

    - Identify suspicious traffic patterns compared to normal traffic
      (source IPs, ports, protocols).

3.  **Network Traffic Analysis:**

    - Use tools like Tcpdump, Snort, and Ntop to analyse network
      traffic.

    - Create Network Intrusion Detection System (NIDS) signatures to
      filter malicious traffic.

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

- Identify potential attackers: competitors, hacktivists, disgruntled
  employees.

**DDoS Detection Techniques:**

- **Activity Profiling:** Monitor network traffic patterns and identify
  deviations from normal behavior. \* Analyze average packet rates for
  network flows.

- **Wavelet-based Signal Analysis:** Analyze traffic using wavelets to
  detect anomalies in specific frequencies.

- **Isolate Traffic:** Use algorithms to isolate traffic changes caused
  by attacks.

- **Filter Traffic:** Filter target traffic based on address, port, or
  protocol for analysis.

- **Identify Attack:** Use sequential change-point detection (CUSUM) to
  identify attack signatures in traffic time series.

- **Identify Scan Activity:** Detect network scanning activities
  potentially associated with DDoS attacks.

**Traffic Filtering Techniques:**

- **Egress Filtering:** Inspect outgoing traffic headers to prevent
  unauthorized traffic from leaving the network.

- **Ingress Filtering:** Protects against flooding attacks originating
  from valid IP prefixes, allowing tracing of attackers.

**Additional Point:**

- All detection techniques rely on identifying abnormal traffic patterns
  compared to established baselines.

## Containment

**Objective:** Mitigate the attack's impact on your systems and users.

**Containment Actions:**

- **Throttle or Block Attack Traffic:**

  - Block malicious traffic as close to its source as possible (router,
    firewall, etc.).

  - Utilize specialized DDoS mitigation devices or services.

- **Terminate Unwanted Connections:**

  - Close unnecessary connections or processes on servers and routers.

  - Adjust TCP/IP settings to optimize resource usage.

- **Traffic Diversion:**

  - Switch to backup sites or networks using DNS or other methods.

  - Blackhole DDoS traffic targeting original IP addresses.

- **Communication Channels:**

  - Establish alternate communication channels (web, email, voice) for
    users.

- **Traffic Scrubbing:**

  - Route traffic through a traffic-scrubbing service to filter
    malicious traffic.

- **Egress Filtering:**

  - Block outgoing traffic generated in response to the attack (e.g.,
    backscatter traffic).

- **Extortion Attempts:**

  - If facing extortion, try to buy time to coordinate a response.

- **ISP Collaboration:**

  - Work closely with your ISP if the bottleneck is on their side.

**Important Note:**

- Containment strategies should be tested and practiced beforehand for a
  more effective response.

 

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

- If the attackers are identified, consider involving law enforcement
  with the approval of your company's legal and executive teams.

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

  - Gradually remove DDoS mitigation measures implemented during
    containment.

- **Traffic Routing:**

  - Switch traffic back to your original network.

- **Service Restart:**

  - Restart any stopped services affected by the attack.

**Coordination:**

- Collaborate with network teams to ensure recovery actions are
  well-coordinated.

- Bringing services online too quickly can cause unintended
  consequences.

**Additional Points:**

- Recovery is the final stage of the DDoS IR process.

- A thorough post-incident review should be conducted to identify areas
  for improvement in future DDoS response strategies.

## DDoS incident response Post Incident Activity

**Objective:** Document the incident’s details, discuss lessons learned,
and adjust plans and defenses.

- Consider what preparation steps you could have taken to respond to the
  incident faster or more effectively.

- If necessary, adjust assumptions that affected the decisions made
  during DDoS incident preparation.

- Assess the effectiveness of your DDoS response process, involving
  people and communications.

- Consider what relationships inside and outside your organizations
  could help you with future incidents.

- Collaborate with legal teams if a legal action is in process

**DDoS Prevention**

- Build DDoS response plan

- Employ basic network security

- Maintain strong network architecture

- Understand the Warning Signs

- Consider DDoS as a service

**<span class="mark">DDoS Countermeasure Strategies</span>**

- Absorbing the Attack: Use additional capacity to absorb attack; it
  requires preplanning. It requires additional resources.

- Degrading Services: Identify critical services and stop non critical
  services.

- Shutting Down the Services: Shut down all the services until the
  attack has subsided.

## Protecting Secondary Victims from DDoS Attacks

DDoS attacks can have a ripple effect, impacting not just the targeted
system but also secondary victims like internet users and connected
devices. Here is a breakdown of how to safeguard secondary victims:

**Defensive Measures:**

- **Software Updates:** Implement strong anti-virus and anti-trojan
  software on all connected devices. Regularly update these programs to
  ensure they can identify and block the latest threats.

- **Security Awareness:** Raise awareness among users about DDoS attacks
  and prevention techniques. Educate them on recognizing suspicious
  activity and avoiding potential attack vectors (e.g., downloading
  attachments from unknown sources).

- **Application Management:** Disable unnecessary services and uninstall
  unused applications to reduce attack surface area. Scan all external
  files before opening them to prevent malware infection.

- **System Hardening:** Configure and update security settings on all
  devices. This includes firewalls, operating systems, and application
  configurations. Ensure these systems are patched with the latest
  security updates.

**Additional Considerations:**

- **Encryption:** Utilize strong encryption protocols like WPA2 and AES
  256 to protect data transmissions from eavesdropping and manipulation.

- **Vulnerability Scans:** Regularly scan systems for vulnerabilities
  and patch them promptly to minimize the risk of exploitation by DDoS
  attackers.

- **Input Validation:** Implement robust input validation techniques to
  prevent malicious code injection attempts and improve system security.

- **Secure Remote Access:** Secure remote administration and
  connectivity testing protocols to prevent unauthorized access that
  could be used in DDoS attacks.

**Remember:**

By employing these defensive measures and promoting security awareness
among users, secondary victims can significantly reduce their risk of
being impacted by DDoS attacks.

Following a DDoS attack, forensic analysis is crucial to improve your
defenses and prevent future incidents. Here's what you should do:

**Analyze Attack Data:**

- **Traffic Patterns:** Identify unique characteristics of the attack
  traffic to develop filtering techniques that can block similar attacks
  in the future.

- **Log Analysis:** Analyze logs from routers, firewalls, and intrusion
  detection systems (IDS) to pinpoint the source of the attack and
  identify compromised systems within your network. Trace back attacker
  IPs with the help of ISPs and law enforcement if necessary.

**Improve Countermeasures:**

- **Filtering Techniques:** Use the insights from traffic pattern
  analysis to refine your filtering techniques for load balancing and
  throttling mechanisms. This helps differentiate legitimate traffic
  from malicious traffic.

**Additional Considerations:**

- **Collaboration:** Work with your ISP to understand their DDoS
  mitigation capabilities and explore additional protection options.

- **Documentation:** Document the entire incident, including the attack
  timeline, scope, impact, and lessons learned. This information is
  valuable for future preparedness and training purposes.

# DDoS attack

## Concepts

DoS stands for Denial of Service

DDoS stands for Distributed Denial of Service

DDoS is a malicious attempt of disrupting regular traffic of network by
flooding with a large number of fake requests and making server
unavailable to the appropriate requests. These fake requests come from
several unauthorized sources and hence called distributed denial of
service attack.

Objective of a DoS attack is to overwhelm the resources of a target
system and cause it to stop functioning, denying access to its users.
DDoS is a variant of DoS in which attackers compromise a large number of
computers or other devices, and use them in a coordinated attack against
the target system.

DDoS attack is generally done by this sometimes happens due to a client
misconfiguration.

DDoS attacks are often used in combination with other cyber threats.

These attacks may launch DoS attack to capture the attention of security
staff and create confusion, while they carry out more subtle attacks
aimed at stealing data or causing other damage.

DoS is an attack on a computer or network that reduces, restricts or
prevents accessibility of system resources to its legitimate users. In a
DoS attack, attackers flood a victim system with non-legitimate service
requests or traffic to overload its resources. DoS attack leads to
unavailability of a particular website and show network performance.

DDoS attack involves a multitude of compromised systems attacking a
single target, thereby causing denial of service for users of the
targeted system. To launch a DDoS attack, an attacker uses botnets and
attacks a single system.

## DDoS Attack Methods

### Botnets 

Systems under hacker control that have been infected with malware.
Attackers use these bots to carry out DDoS attacks. Large botnets can
include millions of devices and can launch attacks at devastating scale.

During a DDoS attack, the botnet sends an overwhelming number of
requests to a targeted server or application, causing it to crash.

Bots are software applications that run automated tasks over the
Internet and perform simple repetitive tasks, such as web spidering and
search engine indexing. A botnet is a huge network of the compromised
systems and can be used by an attacker to launch denial-of-service
attacks.

 

**Scanning Methods for Finding Vulnerable Machines**

- **Random Scanning**: The infected machine probes IP addresses randomly
  from target network IP range and checks for the vulnerability.

- **Hit-list Scanning**: Attacker first collects a list of possible
  potentially vulnerable machines and then performs scanning to find
  vulnerable machines.

- **Topological Scanning**: It uses the information obtained on infected
  machines to find new vulnerable machines.

- **Local Subnet Scanning**: The infected machine looks for the new
  vulnerable machine in its own local network.

- **Permutation Scanning**: It uses a pseudorandom permutation list of
  IP addresses to find new vulnerable machines. Divide and conquer

 

**How Malicious Code Propagates?**

Attackers use three techniques to propagate malicious code to newly
discovered vulnerable system:

- **Central Source Propagation**: Attacker places attack toolkit on the
  central source and copy of the attack toolkit is transferred to newly
  discovered vulnerable system.

- **Back-chaining Propagation**: Attacker places attack toolkit on
  his/her system itself and copy of the attack toolkit is transferred to
  newly discovered vulnerable system.

- **Autonomous Propagation**: Attack toolkit is transferred at the time
  when the new vulnerable system is discovered.

**<span class="mark">Botnet Trojan-Blackshades NET</span>**

Blackshades NET has the ability to create implant binaries which employ
custom obfuscation algorithms or Crypters, which can be bought through
the Bot/Crypter marketplace embedded in the Blackshades controller.
Another botnet: Cythosia Botnet, Andromeda Bot, Mirai botnet

**<span class="mark">Botnet Trojan-PlugBot</span>**

PlugBot is a hardware botnet project. It is a covert PenTest Device
(Bot) designed for covert use during physical PenTest.

### Smurf attack 

Sends Internet Control Message Protocol (ICMP) echo requests to the
victim’s IP address. The ICMP requests are generated from ‘spoofed’ IP
addresses. Attackers automate this process and perform it at scale to
overwhelm a target system.

### TCP State-Exhaustion Attacks

Consumes the connection state tables present in the network
infrastructure components such as load-balancers, firewalls, and
application servers.

### TCP SYN Flood attack

Attacks flood the target system with connection requests. When the
target system attempts to complete the connection, the attacker’s device
does not respond, forcing the target system to time out. This quickly
fills the connection queue, preventing legitimate users from connecting.

- The attacker sends many SYN requests to the target server (victim)
  with fake source IP addresses.

- The target machine sends back a SYN/ACK in response to the request and
  waits for the ACK to complete the session setup. The target machine
  does not get the response because the source address is fake.

<!-- -->

- SYN Flooding takes advantage of a flaw in how most hosts implement the
  TCP three-way handshake.

- When Host B receives the SYN request from A, it must keep track of the
  partially opened connection in a "listen queue" for at least 75
  seconds.

- A malicious host can exploit the small size of the listen queue by
  sending multiple SYN requests to a host, but never replying to the
  SYN/ACK.

- The victim's listening queue is quickly filled up.

- The ability of holding up each incomplete connection for 75 seconds
  can be cumulatively used as a Denial-of-Service attack.

**Three-way handshake**

- TCP SYN request

- SYN/ACK

- ACK response

### Teardrop attack 

Teardrop attack causes the length and fragmentation offset fields in IP
packets to overlap. The targeted system tries to reconstruct packets but
fails, which can cause it to crash.

### Ping of death attack 

Pings a target system using malformed or oversized IP packets, causing
the target system to crash or freeze.

### Network Layer DDoS Attacks

SYN Floods

UDP Floods

DNS Amplification

Techniques designed to eat up the target’s bandwidth.

### Application-Layer Flood Attacks 

- Application-level flood attacks result in the loss of services of a
  particular network, such as emails, network resources, the temporary
  ceasing of applications and services, and more.

- Using this attack, attackers exploit weaknesses in programming source
  code to prevent the application from processing legitimate requests.

- Using application-level flood attacks, attackers attempt to:

  - Flood web applications to legitimate user traffic.

  - Disrupt service to specific System/Person, for example blocking a
    user's access by repeating invalid login attempts.

  - Jam the application-database connection by crafting malicious SQL
    queries.

Consumes the application resources or service thereby making it
unavailable to other legitimate users.

HTTP Floods

Slowloris or RUDY Attacks

Zero-day Attacks

Attacks that target vulnerabilities in OS, Apps, Protocols to crash a
particular application.

### Volumetric Attacks 

Consumes the bandwidth of target network or service.

### Fragmentation Attacks

Overwhelms target's ability of re-assembling the fragmented packets.

### Bandwidth Attacks 

- A single machine cannot make enough requests to overwhelm network
  equipment; hence DDoS attacks were created where an attacker uses
  several computers to flood a victim.

- When a DDoS attack is launched, flooding a network, it can cause
  network equipment such as switches and routers to be overwhelmed due
  to the significant statistical change in the network traffic.

- Attackers use botnets and carry out DDoS attacks by flooding the
  network with ICMP ECHO packets.

- Basically, all bandwidth is used and no bandwidth remains for
  legitimate use.

 

### Service Request Floods 

- An attacker or group of zombies attempts to exhaust server resources
  by setting up and tearing down TCP connections.

- Service request flood attacks flood servers with a high rate of
  connections from a valid source.

- It initiates a request on every connection.

 

### ICMP Flood Attack 

- ICMP flood attack is a type DoS attack in which perpetrators send a
  large number of ICMP packets directly or through reflection networks
  to victims causing it to be overwhelmed and subsequently stop
  responding to legitimate TCP/IP requests.

- To protect against ICMP flood attack, set a threshold limit that when
  exceeded invokes the ICMP flood attack protection feature.

 

### Peer-to-Peer Attacks 

- Using peer-to-peer attacks, attackers instruct clients of peer-to-peer
  file sharing hubs to disconnect from their peer-to-peer network and to
  connect to the victim's fake website.

- Attackers exploit flaws found in the network using DC++ (Direct
  Connect) protocol, that is used for sharing all types of files between
  instant messaging clients.

- Using this method, attackers launch massive denial-of-service attacks
  and compromise websites.

- DC++ (Direct Connect) protocol -the attacker acts as a "puppet
  master," instructing clients of large peer-to-peer file sharing hubs
  to disconnect from their peer-to-peer network and to connect to the
  victim's website instead.

 

### Permanent Denial-of-Service (PDoS) Attack 

- **Phlashing**: Permanent DoS, also known as Phlashing, refers to
  attacks that cause irreversible damage to system hardware.

- **Sabotage**: Unlike other DoS attacks, it sabotages the system
  hardware, requiring the victim to replace or reinstall the hardware.

- **Bricking a system**: This attack is carried out using a method known
  as "bricking a system" in this attacker send fraudulent hardware
  updates to the victims.

 

 

### Distributed Reflection Denial of Service (DrDOS) 

- A distributed reflected denial of service attack (DRDoS), also known
  as spoofed attack, involves the use of multiple intermediate and
  secondary machines that contribute to the actual DDoS attack against
  the target machine or application.

- Attacker launches this attack by sending requests to the intermediary
  hosts, these requests are then redirected to the secondary machines
  which in turn reflects the attack traffic to the target.

- In this attack the primary target seems to be directly attacked by the
  secondary victim, not the actual attacker.

- IN this attack as multiple intermediary victim servers are used which
  results in an increase in attack bandwidth.

 

## DDoS Tools 

### Pandora DDoS Bot Toolkit 

The Pandora DDoS Bot Toolkit is an updated variant of the Dirt Jumper
DDoS toolkit. It offers five distributed denial of service (DDoS) attack
modes. It generates five attack types:

- HTTP min

- HTTP download

- HTTP Combo

- Socket Connect

- Max Flood

### Dereil and HOIC 

Dereil: Dereil is professional (DDoS) Tools with modern patterns for
attack via TCP, UDP, and HTTP protocols.

HOIC: HOIC makes DDoS attacks to any IP address, with a user selected
port and a user selected protocol.

### DoS HTTP and BanglaDos 

DoS HTTP: DoSHTTP is HTTP Flood Denial of Service (DoS) Testing Tool for
Windows. It includes URL verification, HTTP redirection, port
designation, performance monitoring and enhanced reporting. It uses
multiple asynchronous sockets to perform an effective HTTP Flood.

BanglaDos:

### AnDOSid for Mobile

AnDOSid allows attackers to simulate a DOS attack (A http post flood
attack to be exact) and DDoS attack on a web server from mobile phones.

## DDoS IR: Preparation

The “preparation” phase is to be considered as the most important
element of a successful DDoS incident response.

### Objective of Preparation

Establish contacts, define procedures, and gather information to save
time during an attack.

### ISP Support

- Contact your ISP to understand the DDoS mitigation services it offers
  (free and paid) and what process you should follow.

- If possible, subscribe to a redundant Internet connection.

- Establish contacts with your ISP and law enforcement entities. Make
  sure that you have the possibility to use an out-of-band communication
  channel (e.g.: phone).

### Inventory

- Create a whitelist of the IP addresses and protocols you must allow if
  prioritizing traffic during an attack. Don’t forget to include your
  critical customers, key partners, etc.

- Document your IT infrastructure details, including business owners, IP
  addresses and circuit IDs, routing settings (AS, etc); prepare a
  network topology diagram and an asset inventory.

### Network infrastructure

- Design a good network infrastructure without Single Point of Failure
  or bottleneck.

- Distribute your DNS servers and other critical services (SMTP, etc)
  through different AS.

- Harden the configuration of network, OS, and application components
  that may be targeted by DDoS.

- Baseline your current infrastructure’s performance, so you can
  identify the attack faster and more accurately.

- If your business is Internet dependent, consider purchasing
  specialized DDoS mitigation products or services.

- Confirm DNS time-to-live (TTL) settings for the systems that might be
  attacked. Lower the TTLs, if necessary, to facilitate DNS redirection
  if the original IP addresses get attacked. 600 is a good TTL value.

- Depending of the criticality of your services, consider setting- up a
  backup that you can switch on in case of issue.

### Internal contacts

- Establish contacts for your IDS, firewall, systems, and network teams.

- Collaborate with the business lines to understand business
  implications (e.g., money loss) of likely DDoS attack scenarios.

- Involve your BCP/DR planning team on DDoS incidents.

>  
>
>  

## DDoS IR: Detection and Analysis

### Objective of detection and analysis

Detect the incident, determine its scope, and involve the appropriate
parties.

### Analyze the attack: 

- Understand the logical flow of the DDoS attack and identify the
  infrastructure components affected by it.

- Understand if you are the target of the attack or a collateral victim

- Review the load and log files of servers, routers, firewalls,
  applications, and other affected infrastructure.

- Identify what aspects of the DDoS traffic differentiate it from benign
  traffic

  - Source IP addresses, AS, etc

  - Destination ports

  - URLs

  - Protocols flags

- Network analysis tools can be used to review the traffic: Tcpdump,
  Snort, Ntop

- If possible, create a NIDS signature to focus to differentiate between
  benign and malicious traffic.

### Involve internal and external actors

- Contact your internal teams to learn about their visibility into the
  attack.

- Contact your ISP to ask for help. Be specific about the traffic you
  would like to control:

  - Network blocks involved

  - Source IP addresses

  - Protocols

- Notify your company’s executive and legal teams.

### Check the background

- Find out whether the company received an extortion demand as a
  precursor to the attack.

- Search if anyone would have any interest into threatening your company

  - Competitors

  - Ideologically-motivated groups (hacktivists)

  - Former employees

 

### DDoS Detection

Detection techniques are based on identifying and discriminating the
illegitimate traffic increase and flash events from legitimate packet
traffic. All detection techniques define an attack as an abnormal and
noticeable deviation from a threshold of normal network traffic
statistics.

### Activity Profiling 

An attack is indicated by: An increase in activity levels among the
network flow clusters. An increase in the overall number of distinct
clusters (DDoS attack). Activity profile is done based on the average
packet rate for a network flow, which consists of consecutive packets
with similar packet fields. Activity profile is obtained by monitoring
the network packet's header information. Activity Profiling monitors a
network packet's header information, calculates the average packet rate
for a network flow.

### Wavelet-based Signal Analysis 

Wavelet analysis describes an input signal in terms of spectral
components. Wavelets provide for concurrent time and frequency
description. Analysing each spectral window's energy determines the
presence of anomalies. Signal analysis determines the time at which
certain frequency components are present.

### Isolate Traffic

Change-point detection algorithms isolate changes in network traffic
statistics caused by attacks.

### Filter Traffic 

The algorithms filter the target traffic data by address, port, or
protocol and store the resultant flow as a time series.

### Identify Attack 

Sequential change-point detection technique uses Cumulative Sum (Cusum)
algorithm to identify and locate the DoS attacks; the algorithm
calculates deviations in the actual versus expected local average in the
traffic time series.

### Identify Scan Activity 

This technique can also be used to identify the typical scanning
activities of the network worms.

### Egress Filtering 

Scanning packet headers of IP packets leaving a network. Egress
filtering ensures that unauthorized or malicious traffic never leaves
internal network.

### Ingress Filtering 

Protects from flooding attacks which originate from the valid prefixes
(IP address). It enables the originator to be traced to its true source.

### TCP Intercept 

Configuring TCP Intercept prevents DoS attacks by intercepting and
validating the TCP connection requests.

## DDoS IR: Containment

### Objective of Containment 

Mitigate the attack’s effects on the targeted environment.

- If the bottleneck is a particular feature of an application,
  temporarily disable that feature.

- Attempt to throttle or block DDoS traffic as close to the network’s
  “cloud” as possible via a router, firewall, load balancer, specialized
  device, etc.

- Terminate unwanted connections or processes on servers and routers and
  tune their TCP/IP settings.

- If possible, switch to alternate sites or networks using DNS or
  another mechanism. Blackhole DDoS traffic targeting the original IP
  addresses.

- Set up an alternate communication channel between you and your
  users/customers (e.g.: web/mail/voice server, etc.)

- If possible, route traffic through a traffic-scrubbing service or
  product via DNS or routing changes (e.g.: sinkhole routing)

- Configure egress filters to block the traffic your systems may send in
  response to DDoS traffic (e.g.: back squatter traffic), to avoid
  adding unnecessary packets to the network.

- In case of an extortion attempt, try to buy time with the fraudster.
  For example, explain that you need more time in order to get
  management approval.

- If the bottleneck is at the ISP’s side, only the ISP can take
  efficient actions. In that case, work closely with your ISP and make
  sure you share information efficiently.

>  

## DDoS IR: Remediation

### Objective of Remediation

Take actions to stop the Denial-of-Service condition.

Contact your ISP and make sure that it enforces remediation measures.
For information, here are some of the possible measures:

- Filtering (if possible, at level Tier1 or 2)

- Traffic-scrubbing/Sinkhole/Clean-pipe

- Blackhole Routing

If the DDoS sponsors have been identified, consider involving law
enforcement. This should be performed upon the direction of your
company’s executive and legal teams. Technical remediation actions can
mostly be enforced by your ISP.

>  

## DDoS IR: Recovery

### Objective of Recovery

Come back to the previous functional state.

Assess the end of the DDoS condition

- Ensure that the impacted services are reachable again.

- Ensure that your infrastructure performance is back to your baseline
  performance.

- Rollback the mitigation measures

- Switch back traffic to your original network.

- Restart stopped services.

Ensure that the recovery-related actions are decided in accordance with
the network teams. Bringing up services could have unexpected side
effects.

## DDoS IR: Post Incident Activity

### Objective of Post Incident Activity

Document the incident’s details, discuss lessons learned, and adjust
plans and defenses.

- Consider what preparation steps you could have taken to respond to the
  incident faster or more effectively.

- If necessary, adjust assumptions that affected the decisions made
  during DDoS incident preparation.

- Assess the effectiveness of your DDoS response process, involving
  people and communications.

- Consider what relationships inside and outside your organizations
  could help you with future incidents.

- Collaborate with legal teams if a legal action is in process

### DDoS Prevention

Build DDoS response plan

Employ basic network security

Maintain strong network architecture

Understand the Warning Signs

Consider DDoS as a service

**<span class="mark">DDoS Countermeasure Strategies</span>**

### Absorbing the Attack

Use additional capacity to absorb attack; it requires preplanning. It
requires additional resources.

### Degrading Services

Identify critical services and stop non critical services.

### Shutting Down the Services

Shut down all the services until the attack has subsided.

### Protect Secondary Victims 

- Install anti-virus and anti-Trojan software and keep these up-to-date.

- Increase awareness of security issues and prevention techniques in all
  Internet users.

- Disable unnecessary services, uninstall unused applications, and scan
  all the files received from external sources.

- Properly configure and regularly update the built-in defensive
  mechanisms in the core hardware and software of the system.

### Detect and Neutralize Handlers 

- Network Traffic Analysis: Analyse communication protocols and traffic
  patterns between handlers and clients or handlers and agents in order
  to identify the network nodes that might be infected by the handlers.

- Neutralize Botnet Handlers: There are usually few DDoS handlers
  deployed as compared to the number of agents. Neutralizing a few
  handlers can possibly render multiple agents useless, thus thwarting
  DDoS attacks.

- Spoofed Source Address: There is a decent probability that the spoofed
  source address of DDoS attack packets will not represent a valid
  source address of the definite sub-network.

### Deflect Attacks 

- **Use Honeypots**: Systems that are set up with limited security. Act
  as an enticement for an attacker. Honeypots serve as a means for
  gaining information about attackers, attack techniques and tools by
  storing a record of the system activities.

- **Use Defense-in-depth** with IDSes at different network points to
  divert suspicious DoS traffic to several honeypots.

- **Low-interaction honeypots** all services offered by a Low
  Interaction Honeypots are emulated.

- **High-interaction honeypots** make use of the actual vulnerable
  service or software.

- **KFSensor**: KFSensor is a Windows-based honeypot IDS.

### Mitigate Attacks 

- **Load Balancing**: Increase bandwidth on critical connections to
  absorb additional traffic generated by an attack. Replicate servers to
  provide additional failsafe protection. Balance load on each server in
  a multiple-server architecture to mitigate DDoS attack.

- **Throttling**: Set routers to access a server with a logic to
  throttle incoming traffic levels that are safe for the server.
  Throttling helps in preventing damage to servers by controlling the
  DoS traffic. Can be extended to throttle DDoS attack traffic and allow
  legitimate user traffic for better results.

- **Drop Request**: Drop packets when a load increases.

### Post-Attack Forensics 

- **DDoS attack traffic** patterns can help network administrators to
  develop new filtering techniques for preventing attack traffic from
  entering or leaving the networks.

- Analyse router, firewall, and IDS logs to identify source of DoS
  traffic. Try to trace back attacker IPs with the help of intermediary
  ISPs and law enforcement agencies.

- **Traffic pattern analysis**: Data can be analysed - post-attack - to
  look for specific characteristics within the attacking traffic.

- Using these characteristics, the result of traffic pattern analysis
  can be used for updating load-balancing and throttling
  countermeasures.

<!-- -->

- **Techniques to Defend against Botnets**

<!-- -->

- **RFC 3704 Filtering**: Any traffic coming from unused or reserved IP
  addresses is bogus and should be filtered at the ISP before it enters
  the Internet link.

- **Cisco IPS Source IP Reputation Filtering**: Reputation services help
  in determining if an IP or service is a source of threat or not, Cisco
  IPS regularly updates its database with known threats such as botnets,
  botnet harvesters, malwares, etc. and helps in filtering DoS traffic.

- **Black Hole Filtering**: Black hole refers to network nodes where
  incoming traffic is discarded or dropped without informing the source
  that the data did not reach its intended recipient. Black hole
  filtering refers to discarding packets at the routing level.

- **DDoS Prevention Offerings from ISP or DDoS Service**: Enable IP
  Source Guard (in CISCO) or similar features in other routers to filter
  traffic based on the DHCP snooping binding database or IP source
  bindings which prevents a bot from sending spoofed packets.

### Protect Secondary Victims 

- Install anti-virus and anti-Trojan software and keep these up-to-date.

- Increase awareness of security issues and prevention techniques in all
  Internet users.

- Disable unnecessary services, uninstall unused applications, and scan
  all the files received from external sources.

- Properly configure and regularly update the built-in defensive
  mechanisms in the core hardware and software of the system.

- Use strong encryption mechanisms such as WPA2, AES 256, etc. for
  broadband networks to withstand eavesdropping.

- Ensure that the software and protocols are up-to-date and scan the
  machines thoroughly to detect any anomalous behaviour.

- Disable unused and insecure services.

- Block all inbound packets originating from the service ports to block
  the traffic from reflection servers.

- Update kernel to the latest release.

- Prevent the transmission of the fraudulently addressed packets at ISP
  level.

- Implement cognitive radios in the physical layer to handle the jamming
  and scrambling attacks.

- Configure the firewall to deny external ICMP traffic access.

- Perform the thorough input validation.

- Prevent use of unnecessary functions such as gets, strcpy etc.

- Secure the remote administration and connectivity testing.

- Data processed by the attacker should be stopped from being executed.

- Prevent the return addresses from being overwritten.

### Detect and Neutralize Handlers 

- Network Traffic Analysis: Analyse communication protocols and traffic
  patterns between handlers and clients or handlers and agents in order
  to identify the network nodes that might be infected by the handlers.

- Neutralize Botnet Handlers: There are usually few DDoS handlers
  deployed as compared to the number of agents. Neutralizing a few
  handlers can possibly render multiple agents useless, thus thwarting
  DDoS attacks.

- Spoofed Source Address: There is a decent probability that the spoofed
  source address of DDoS attack packets will not represent a valid
  source address of the definite sub-network.

### Deflect Attacks 

- Systems that are set up with limited security, also known as
  Honeypots, act as an enticement for an attacker.

- Honeypots serve as a means for gaining information about attackers,
  attack techniques and tools by storing a record of the system
  activities.

- Use Defense-in-depth approach with IDSes at different network points
  to divert suspicious DoS traffic to several honeypots.

- Low-interaction honeypots: All services offered by a Low Interaction
  Honeypots are emulated.

- High-interaction honeypots: (honeynet) High Interaction Honeypots make
  use of the actual vulnerable service or software.

- KFSensor: KFSensor is a Windows-based honeypot IDS.

### Mitigate Attacks 

- Load Balancing: Increase bandwidth on critical connections to absorb
  additional traffic generated by an attack. Replicate servers to
  provide additional failsafe protection. Balance load on each server in
  a multiple-server architecture to mitigate DDoS attack.

- Throttling: Set routers to access a server with a logic to throttle
  incoming traffic levels that are safe for the server. Throttling helps
  in preventing damage to servers by controlling the DoS traffic. Can be
  extended to throttle DDoS attack traffic and allow legitimate user
  traffic for better results.

- Drop Request: Drop packets when a load increases.

### Post-Attack Forensics 

- DDoS attack traffic patterns can help network administrators to
  develop new filtering techniques for preventing attack traffic from
  entering or leaving the networks.

- Analyse router, firewall, and IDS logs to identify source of DoS
  traffic. Try to trace back attacker IP's with the help of intermediary
  ISPs and law enforcement agencies.

- Traffic pattern analysis: Data can be analysed - post-attack - to look
  for specific characteristics within the attacking traffic.

- Using these characteristics, the result of traffic pattern analysis
  can be used for updating load-balancing and throttling
  countermeasures.

 

### Botnet Countermeasures

- **RFC 3704 Filtering**: Any traffic coming from unused or reserved IP
  addresses is bogus and should be filtered at the ISP before it enters
  the Internet link.

- **Cisco IPS Source IP Reputation Filtering**: Reputation services help
  in determining if an IP or service is a source of threat or not, Cisco
  IPS regularly updates its database with known threats such as botnets,
  botnet harvesters, malwares, etc. and helps in filtering DoS traffic.

- **Black Hole Filtering**: Black hole refers to network nodes where
  incoming traffic is discarded or dropped without informing the source
  that the data did not reach its intended recipient. Black hole
  filtering refers to discarding packets at the routing level.

- **DDoS Prevention Offerings from ISP or DDoS Service**: Enable IP
  Source Guard (in CISCO) or similar features in other routers to filter
  traffic based on the DHCP snooping binding database or IP source
  bindings which prevents a bot from sending spoofed packets.

 

### DDoS Protection at ISP Level 

- Most ISPs simply block all the requests during a DDoS attack, denying
  even the legitimate traffic from accessing the service.

- ISPs offer in-the-cloud DDoS protection for Internet links so that
  they do not become saturated by the attack.

- Attack traffic is redirected to the ISP during the attack to be
  filtered and sent back.

- Administrators can request ISPs to block the original affected IP and
  move their site to another IP after performing DNS propagation.

 

### TCP Intercept on Cisco IOS Software 

To enable TCP intercept, use these commands in global configuration
mode:

- Define an IP extended access list: access-list {deny \| permit} tcp
  anydestination destination-wildcard

- Enable TCP Intercept: ip tcp Intercept list access-list-number

TCP intercept can operate in either active intercept mode or passive
watch mode. The default is intercept mode.

The command to set the TCP intercept mode in global configuration mode:
Set the TCP intercept mode: ip tcp intercept mode {intercept \| watch}

## QnA DDoS

**What is the three-way handshake? How can it be used to create a DOS
attack?**

3-way handshake is a cornerstone of the TCP suite: SYN, SYN/ACK, ACK.

- **SYN** is the outgoing connection request from client to server.

- **SYN/ACK** is the acknowledgement of the server back to the client,
  saying that yes, I hear you, let us open a connection.

- **ACK** is the final connection, and allows the two to speak.

The problem is that this can be used as a very basic type of
denial-of-service attack.

- Client opens the SYN connection, the server responds with the SYN/ACK,
  but then the client sends another SYN.

- Server treats this as a new connection request and keeps the previous
  connection open.

- As this is repeated over and over many times very quickly, the server
  quickly becomes saturated with a huge number of connection requests,
  eventually overloading its ability to connect to legitimate users.

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

- A DDOS (distributed denial-of-service ) is a malicious attempt of
  disrupting regular traffic of a network by flooding with a large
  number of requests and making the 598\[’22.458932server unavailable to
  the appropriate requests. The requests come from several unauthorized
  \*+++

- 

- 666606985\]sources and hence called distributed denial of service
  attack.

- Prevent DDoS Attacks:

  - Build a denial of service response plan

  - Employ basic network security

  - Maintain strong network architecture

  - Understand the Warning Signs

  - Consider DDoS as a service

- Generally done by this sometimes happens due to a client
  misconfiguration.

- The objective of a denial of service (DoS) attack is to overwhelm the
  resources of a target system and cause it to stop functioning, denying
  access to its users. Distributed denial of service (DDoS) is a variant
  of DoS in which attackers compromise a large number of computers or
  other devices, and use them in a coordinated attack against the target
  system.

- DDoS attacks are often used in combination with other cyber threats.

- These attacks may launch a denial of service to capture the attention
  of security staff and create confusion, while they carry out more
  subtle attacks aimed at stealing data or causing other damage.

- **Methods of DDoS attacks include:**

  - **Botnets**: Systems under hacker control that have been infected
    with malware. Attackers use these bots to carry out DDoS attacks.
    Large botnets can include millions of devices and can launch attacks
    at devastating scale.

  - **Smurf attack**: Sends Internet Control Message Protocol (ICMP)
    echo requests to the victim’s IP address. The ICMP requests are
    generated from ‘spoofed’ IP addresses. Attackers automate this
    process and perform it at scale to overwhelm a target syst-6em.

  - **TCP SYN flood attack**: Attacks flood the target system with
    connection requests. When the target system attempts to complete the
    connection, the attacker’s device does not respond, forcing the
    target system to time out. This quickly fills the connection queue,
    preventing legitimate users from connecting.

- The following two attacks are less common today, as they rely on
  vulnerabilities in the internet protocol (IP) which have been
  addressed on most servers and networks.

  - **Teardrop attack** causes the length and fragmentation offset
    fields in IP packets to overlap. The targeted system tries to
    reconstruct packets but fails, which can cause it to crash.

  - **Ping of death attack**: pings a target system using malformed or
    oversized IP packets, causing the target system to crash or freeze.

- During a DDoS attack, the botnet sends an overwhelming number of
  requests to a targeted server or application, causing it to crash.
  Network layer DDoS attacks use SYN floods, UDP floods, DNS
  amplification, and other techniques designed to eat up the target’s
  bandwidth and prevent legitimate requests from being served.
  Application-layer DDoS attacks use HTTP floods, Slowloris or RUDY
  attacks, zero-day attacks and other attacks that target
  vulnerabilities in an operating system, application, or protocol in
  order to crash a particular application.

 

**What is a Denial-of-Service Attack?**

- Denial of Service (DoS) is an attack on a computer or network that
  reduces, restricts or prevents accessibility of system resources to
  its legitimate users.

- In a DoS attack, attackers flood a victim system with non-legitimate
  service requests or traffic to overload its resources.

- DoS attack leads to unavailability of a particular website and show
  network performance.

 

**What are Distributed Denial of Service Attacks?**

- A distributed denial-of-service (DDoS) attack involves a multitude of
  compromised systems attacking a single target, thereby causing denial
  of service for users of the targeted system. To launch a DDoS attack,
  an attacker uses botnets and attacks a single system.

 

## DoS/DDoS Attacks 

1.  **Volumetric Attacks**: Consumes the bandwidth of target network or
    service.

2.  **Fragmentation Attacks**: Overwhelms target's ability of
    re-assembling the fragmented packets.

3.  **TCP State-Exhaustion Attacks**: Consumes the connection state
    tables present in the network infrastructure components such as
    load-balancers, firewalls, and application servers.

4.  **Application Layer Attacks**: Consumes the application resources or
    service thereby making it unavailable to other legitimate users.

 

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

- A single machine cannot make enough requests to overwhelm network
  equipment; hence DDoS attacks were created where an attacker uses
  several computers to flood a victim.

- When a DDoS attack is launched,

- flooding a network, it can cause network equipment such as switches
  and routers to be overwhelmed due to the significant statistical
  change in the network traffic.

- Attackers use botnets and carry out DDoS attacks by flooding the
  network with ICMP ECHO packets.

- Basically, all bandwidth is used and no bandwidth remains for
  legitimate use.

 

### Service Request Floods 

- An attacker or group of zombies attempts to exhaust server resources
  by setting up and tearing down TCP connections.

- Service request flood attacks flood servers with a high rate of
  connections from a valid source.

- It initiates a request on every connection.

 

### SYN Flooding Attack 

- The attacker sends a large number of SYN requests to the target server
  (victim) with fake source IP addresses.

- The target machine sends back a SYN/ACK in response to the request and
  waits for the ACK to complete the session setup.

- The target machine does not get the response because the source
  address is fake.

- **Three-way handshake**

  - TCP SYN request

  - SYN/ACK

  - ACK response

 

### SYN Flooding 

- SYN Flooding takes advantage of a flaw in how most hosts implement the
  TCP three-way handshake.

- When Host B receives the SYN request from A, it must keep track of the
  partially opened connection in a "listen queue" for at least 75
  seconds.

- A malicious host can exploit the small size of the listen queue by
  sending multiple SYN requests to a host, but never replying to the
  SYN/ACK.

- The victim's listening queue is quickly filled up.

- The ability of holding up each incomplete connection for 75 seconds
  can be cumulatively used as a Denial-of-Service attack.

### ICMP Flood Attack 

- ICMP flood attack is a type DoS attack in which perpetrators send a
  large number of ICMP packets directly or through reflection networks
  to victims causing it to be overwhelmed and subsequently stop
  responding to legitimate TCP/IP requests.

- To protect against ICMP flood attack, set a threshold limit that when
  exceeded invokes the ICMP flood attack protection feature.

 

### Peer-to-Peer Attacks 

- Using peer-to-peer attacks, attackers instruct clients of peer-to-peer
  file sharing hubs to disconnect from their peer-to-peer network and to
  connect to the victim's fake website.

- Attackers exploit flaws found in the network using DC++ (Direct
  Connect) protocol, that is used for sharing all types of files between
  instant messaging clients.

- Using this method, attackers launch massive denial-of-service attacks
  and compromise websites.

- DC++ (Direct Connect) protocol -the attacker acts as a "puppet
  master," instructing clients of large peer-to-peer file sharing hubs
  to disconnect from their peer-to-peer network and to connect to the
  victim's website instead.

 

### Permanent Denial-of-Service (PDoS) Attack 

- **Phlashing**: Permanent DoS, also known as phlashing, refers to
  attacks that cause irreversible damage to system hardware.

- **Sabotage**: Unlike other DoS attacks, it sabotages the system
  hardware, requiring the victim to replace or reinstall the hardware.

- **Bricking a system**: This attack is carried out using a method known
  as "bricking a system" in this attackers send fraudulent hardware
  updates to the victims.

 

### Application-Level Flood Attacks 

- Application-level flood attacks result in the loss of services of a
  particular network, such as emails, network resources, the temporary
  ceasing of applications and services, and more.

- Using this attack, attackers exploit weaknesses in programming source
  code to prevent the application from processing legitimate requests.

- Using application-level flood attacks, attackers attempts to:

  - Flood web applications to legitimate user traffic.

  - Disrupt service to a specific system or person, for example,
    blocking a user's access by repeating invalid login attempts.

  - Jam the application-database connection by crafting malicious SQL
    queries.

 

### Distributed Reflection Denial of Service (DrDOS) 

- A distributed reflected denial of service attack (DRDoS), also known
  as spoofed attack, involves the use of multiple intermediate and
  secondary machines that contribute to the actual DDoS attack against
  the target machine or application.

- Attacker launches this attack by sending requests to the intermediary
  hosts, these requests are then redirected to the secondary machines
  which in turn reflects the attack traffic to the target.

- In this attack the primary target seems to be directly attacked by the
  secondary victim, not the actual attacker.

- IN this attack as multiple intermediary victim servers are used which
  results in an increase in attack bandwidth.

>  

## Botnet 

- Bots are software applications that run automated tasks over the
  Internet and perform simple repetitive tasks, such as web spidering
  and search engine indexing.

- A botnet is a huge network of the compromised systems and can be used
  by an attacker to launch denial-of-service attacks.

 

### Scanning Methods for Finding Vulnerable Machines 

- **Random Scanning**: The infected machine probes IP addresses randomly
  from target network IP range and checks for the vulnerability.

- **Hit-list Scanning**: Attacker first collects a list of possible
  potentially vulnerable machines and then performs scanning to find
  vulnerable machines.

- **Topological Scanning**: It uses the information obtained on infected
  machines to find new vulnerable machines.

- **Local Subnet Scanning**: The infected machine looks for the new
  vulnerable machine in its own local network.

- **Permutation Scanning**: It uses a pseudorandom permutation list of
  IP addresses to find new vulnerable machines. Divide and conquer

 

**How Malicious Code Propagates?**

Attackers use three techniques to propagate malicious code to newly
discovered vulnerable system:

- **Central Source Propagation**: Attacker places attack toolkit on the
  central source and copy of the attack toolkit is transferred to newly
  discovered vulnerable system.

- **Back-chaining Propagation**: Attacker places attack toolkit on
  his/her system itself and copy of the attack toolkit is transferred to
  newly discovered vulnerable system.

<!-- -->

- **Autonomous Propagation**: Attack toolkit is transferred at the time
  when the new vulnerable system is discovered.

**Blackshades NET - a botnet trojan**

- Blackshades NET has the ability to create implant binaries which
  employ custom obfuscation algorithms or Crypters, which can be bought
  through the Bot/Crypter marketplace embedded in the Blackshades
  controller.

- Other botnet: Cythosia Botnet, Andromeda Bot, Mirai botnet

**PlugBot - a botnet trojan**

- PlugBot is a hardware botnet project.

- It is a covert penetration testing device (bot) designed for covert
  use during physical penetration tests.

## DoS/DDoS Tools 

1.  **Pandora DDoS Bot Toolkit**

    - **The Pandora DDoS Bot Toolkit is an updated variant of the Dirt
      Jumper DDoS toolkit.**

    - **It offers five distributed denial of service (DDoS) attack
      modes.**

    - **It generates five attack types:**

      - **HTTP min**

      - **HTTP download**

      - **HTTP Combo**

      - **Socket Connect**

      - **Max Flood**

2.  **Dereil and HOIC**

    - **Dereil: Dereil is professional (DDoS) Tools with modern patterns
      for attack via TCP, UDP, and HTTP protocols.**

    - **HOIC: HOIC makes DDoS attacks to any IP address, with a user
      selected port and a user selected protocol.**

3.  **DoS HTTP and BanglaDos**

    - **DoS HTTP: DoSHTTP is HTTP Flood Denial of Service (DoS) Testing
      Tool for Windows. It includes URL verification, HTTP redirection,
      port designation, performance monitoring and enhanced reporting.
      It uses multiple asynchronous sockets to perform an effective HTTP
      Flood.**

    - **BanglaDos:**

4.  **AnDOSid for Mobile**

    - **AnDOSid allows attackers to simulate a DOS attack (A http post
      flood attack to be exact) and DDoS attack on a web server from
      mobile phones.**

> DoS and DDoS Attack Tool for Mobile: Low Orbit Ion Cannon (LOIC)

- Android version of Low Orbit Ion Cannon (LOIC) software is used for
  flooding packets which allows attackers to perform DDoS attacks on
  target organization.

## DDoS Countermeasures 

1.  **Detection Techniques**

    - **Detection techniques are based on identifying and discriminating
      the illegitimate traffic increase and flash events from legitimate
      packet traffic.**

    - **All detection techniques define an attack as an abnormal and
      noticeable deviation from a threshold of normal network traffic
      statistics.**

      - **Activity Profiling**

      - **Wavelet-based Signal Analysis**

      - **Changepoint Detection**

2.  **Activity Profiling**

    - **An attack is indicated by: An increase in activity levels among
      the network flow clusters. An increase in the overall number of
      distinct clusters (DDoS attack)**

    - **Activity profile is done based on the average packet rate for a
      network flow, which consists of consecutive packets with similar
      packet fields.**

    - **Activity profile is obtained by monitoring the network packet's
      header information.**

    - **Activity Profiling monitors a network packet's header
      information, calculates the average packet rate for a network
      flow.**

3.  **Wavelet-based Signal Analysis**

    - **Wavelet analysis describes an input signal in terms of spectral
      components.**

    - **Wavelets provide for concurrent time and frequency
      description.**

    - **Analysing each spectral window's energy determines the presence
      of anomalies.**

    - **Signal analysis determines the time at which certain frequency
      components are present.**

4.  **Sequential Change-Point Detection**

    - **Isolate Traffic: Change-point detection algorithms isolate
      changes in network traffic statistics caused by attacks.**

    - **Filter Traffic: The algorithms filter the target traffic data by
      address, port, or protocol and store the resultant flow as a time
      series.**

    - **Identify Attack: Sequential change-point detection technique
      uses Cumulative Sum (Cusum) algorithm to identify and locate the
      DoS attacks; the algorithm calculates deviations in the actual
      versus expected local average in the traffic time series.**

    - **Identify Scan Activity: This technique can also be used to
      identify the typical scanning activities of the network worms.**

5.  **DoS/DDoS Countermeasure Strategies**

    - **Absorbing the Attack: Use additional capacity to absorb attack;
      it requires preplanning. It requires additional resources.**

    - **Degrading Services: Identify critical services and stop non
      critical services.**

    - **Shutting Down the Services: Shut down all the services until the
      attack has subsided.**

## DDoS Attack Countermeasures 

1.  **Protect Secondary Victims**

    - **Install anti-virus and anti-Trojan software and keep these
      up-to-date.**

    - **Increase awareness of security issues and prevention techniques
      in all Internet users.**

    - **Disable unnecessary services, uninstall unused applications, and
      scan all the files received from external sources.**

    - **Properly configure and regularly update the built-in defensive
      mechanisms in the core hardware and software of the system.**

2.  **Detect and Neutralize Handlers**

    - **Network Traffic Analysis: Analyse communication protocols and
      traffic patterns between handlers and clients or handlers and
      agents in order to identify the network nodes that might be
      infected by the handlers.**

    - **Neutralize Botnet Handlers: There are usually few DDoS handlers
      deployed as compared to the number of agents. Neutralizing a few
      handlers can possibly render multiple agents useless, thus
      thwarting DDoS attacks.**

    - **Spoofed Source Address: There is a decent probability that the
      spoofed source address of DDoS attack packets will not represent a
      valid source address of the definite sub-network.**

3.  **Detect Potential Attacks**

    - **Egress Filtering: Scanning packet headers of IP packets leaving
      a network. Egress filtering ensures that unauthorized or malicious
      traffic never leaves internal network.**

    - **Ingress Filtering: Protects from flooding attacks which
      originate from the valid prefixes (IP address)**

    - **It enables the originator to be traced to its true source.**

    - **TCP Intercept: Configuring TCP Intercept prevents DoS attacks by
      intercepting and validating the TCP connection requests.**

4.  **Deflect Attacks**

    - **Systems that are set up with limited security, also known as
      Honeypots, act as an enticement for an attacker.**

    - **Honeypots serve as a means for gaining information about
      attackers, attack techniques and tools by storing a record of the
      system activities.**

    - **Use Defense-in-depth approach with IDSes at different network
      points to divert suspicious DoS traffic to several honeypots.**

    - **Low-interaction honeypots: All services offered by a Low
      Interaction Honeypots are emulated.**

    - **High-interaction honeypots: (honeynet) High Interaction
      Honeypots make use of the actual vulnerable service or software.**

    - **KFSensor: KFSensor is a Windows-based honeypot IDS.**

5.  **Mitigate Attacks**

    - **Load Balancing: Increase bandwidth on critical connections to
      absorb additional traffic generated by an attack. Replicate
      servers to provide additional failsafe protection. Balance load on
      each server in a multiple-server architecture to mitigate DDoS
      attack.**

    - **Throttling: Set routers to access a server with a logic to
      throttle incoming traffic levels that are safe for the server.
      Throttling helps in preventing damage to servers by controlling
      the DoS traffic. Can be extended to throttle DDoS attack traffic
      and allow legitimate user traffic for better results.**

    - **Drop Request: Drop packets when a load increases.**

6.  **Post-Attack Forensics**

    - **DDoS attack traffic patterns can help network administrators to
      develop new filtering techniques for preventing attack traffic
      from entering or leaving the networks.**

    - **Analyse router, firewall, and IDS logs to identify source of DoS
      traffic. Try to trace back attacker IP's with the help of
      intermediary ISPs and law enforcement agencies.**

    - **Traffic pattern analysis: Data can be analysed - post-attack -
      to look for specific characteristics within the attacking
      traffic.**

    - **Using these characteristics, the result of traffic pattern
      analysis can be used for updating load-balancing and throttling
      countermeasures.**

 

## Techniques to Defend against Botnets 

- **RFC 3704 Filtering**: Any traffic coming from unused or reserved IP
  addresses is bogus and should be filtered at the ISP before it enters
  the Internet link.

- **Cisco IPS Source IP Reputation Filtering**: Reputation services help
  in determining if an IP or service is a source of threat or not, Cisco
  IPS regularly updates its database with known threats such as botnets,
  botnet harvesters, malwares, etc. and helps in filtering DoS traffic.

- **Black Hole Filtering**: Black hole refers to network nodes where
  incoming traffic is discarded or dropped without informing the source
  that the data did not reach its intended recipient. Black hole
  filtering refers to discarding packets at the routing level.

<!-- -->

- **DDoS Prevention Offerings from ISP or DDoS Service**: Enable IP
  Source Guard (in CISCO) or similar features in other routers to filter
  traffic based on the DHCP snooping binding database or IP source
  bindings which prevents a bot from sending spoofed packets.

 

## DoS/DDoS Countermeasures 

- Use strong encryption mechanisms such as WPA2, AES 256, etc. for
  broadband networks to withstand eavesdropping.

- Ensure that the software and protocols are up-to-date and scan the
  machines thoroughly to detect any anomalous behaviour.

- Disable unused and insecure services.

- Block all inbound packets originating from the service ports to block
  the traffic from reflection servers.

- Update kernel to the latest release.

- Prevent the transmission of the fraudulently addressed packets at ISP
  level.

- Implement cognitive radios in the physical layer to handle the jamming
  and scrambling attacks.

- Configure the firewall to deny external ICMP traffic access.

- Perform the thorough input validation.

- Prevent use of unnecessary functions such as gets, strcpy etc.

- Secure the remote administration and connectivity testing.

- Data processed by the attacker should be stopped from being executed.

- Prevent the return addresses from being overwritten.

 

### DoS/DDoS Protection at ISP Level 

- Most ISPs simply block all the requests during a DDoS attack, denying
  even the legitimate traffic from accessing the service.

- ISPs offer in-the-cloud DDoS protection for Internet links so that
  they do not become saturated by the attack.

- Attack traffic is redirected to the ISP during the attack to be
  filtered and sent back.

- Administrators can request ISPs to block the original affected IP and
  move their site to another IP after performing DNS propagation.

 

### Enabling TCP Intercept on Cisco IOS Software 

- To enable TCP intercept, use these commands in global configuration
  mode:

  - Define an IP extended access list: access-list {deny \| permit} tcp
    anydestination destination-wildcard

  - Enable TCP Intercept: ip tcp Intercept list access-list-number

- TCP intercept can operate in either active intercept mode or passive
  watch mode. The default is intercept mode.

- The command to set the TCP intercept mode in global configuration
  mode: Set the TCP intercept mode: ip tcp intercept mode {intercept \|
  watch}

# DDoS

> What is a Denial-of-Service Attack?

- Denial of Service (DoS) is an attack on a computer or network that
  reduces, restricts or prevents accessibility of system resources to
  its legitimate users.

- In a DoS attack, attackers flood a victim system with non-legitimate
  service requests or traffic to overload its resources.

- DoS attack leads to unavailability of a particular website and show
  network performance.

> What are Distributed Denial of Service Attacks?
>
> A distributed denial-of-service (DDoS) attack involves a multitude of
> compromised systems attacking a single target, thereby causing denial
> of service for users of the targeted system.

- To launch a DDoS attack, an attacker uses botnets and attacks a single
  system.

DoS/DDoS Attacks

> Basic Categories of DoS/DDoS Attack Vectors

- **Volumetric Attacks**: Consumes the bandwidth of target network or
  service.

- **Fragmentation Attacks**: Overwhelms target's ability of
  re-assembling the fragmented packets.

- **TCP State-Exhaustion Attacks**: Consumes the connection state tables
  present in the network infrastructure components such as
  load-balancers, firewalls, and application servers.

- **Application Layer Attacks**: Consumes the application resources or
  service thereby making it unavailable to other legitimate users.

> DoS/DDoS Attack Techniques

- Bandwidth Attacks and Service Request Floods

- SYN Flooding Attack

- ICMP Flood Attack

- Peer-to-Peer Attacks

- Application-Level Flood Attacks

- Permanent Denial-of-Service Attack

- Distributed Reflection Denial of Service (DrDoS)

> Bandwidth Attacks

- A single machine cannot make enough requests to overwhelm network
  equipment; hence DDoS attacks were created where an attacker uses
  several computers to flood a victim.

- When a DDoS attack is launched, flooding a network, it can cause
  network equipment such as switches and routers to be overwhelmed due
  to the significant statistical change in the network traffic.

- Attackers use botnets and carry out DDoS attacks by flooding the
  network with ICMP ECHO packets.

- Basically, all bandwidth is used and no bandwidth remains for
  legitimate use.

> Service Request Floods

- An attacker or group of zombies attempts to exhaust server resources
  by setting up and tearing down TCP connections.

- Service request flood attacks flood servers with a high rate of
  connections from a valid source.

- It initiates a request on every connection.

> SYN Attack

- The attacker sends a large number of SYN requests to the target server
  (victim) with fake source IP addresses.

- The target machine sends back a SYN/ACK in response to the request and
  waits for the ACK to complete the session setup.

- The target machine does not get the response because the source
  address is fake.

> three-way handshake

1.  TCP SYN request

2.  SYN/ACK

3.  ACK response

> SYN Flooding

1.  SYN Flooding takes advantage of a flaw in how most hosts implement
    the TCP threeway handshake.

2.  When Host B receives the SYN request from A, it must keep track of
    the partiallyopened connection in a "listen queue" for at least 75
    seconds.

3.  A malicious host can exploit the small size of the listen queue by
    sending multiple SYN requests to a host, but never replying to the
    SYN/ACK.

4.  The victim's listening queue is quickly filled up.

5.  The ability of holding up each incomplete connection for 75 seconds
    can be cumulatively used as a Denial-of-Service attack.

> ICMP Flood Attack

- ICMP flood attack is a type DoS attack in which perpetrators send a
  large number of ICMP packets directly or through reflection networks
  to victims causing it to be overwhelmed and subsequently stop
  responding to legitimate TCP/IP requests.

- To protect against ICMP flood attack, set a threshold limit that when
  exceeded invokes the ICMP flood attack protection feature.

> Peer-to-Peer Attacks

- Using peer-to-peer attacks, attackers instruct clients of peer-to-peer
  file sharing hubs to disconnect from their peer-to-peer network and to
  connect to the victim's fake website.

- Attackers exploit flaws found in the network using DC++ (Direct
  Connect) protocol, that is used for sharing all types of files between
  instant messaging clients.

- Using this method, attackers launch massive denial-of-service attacks
  and compromise websites.

- DC++ (Direct Connect) protocol -the attacker acts as a "puppet
  master," instructing clients of large peer-to-peer file sharing hubs
  to disconnect from their peer-to-peer network and to connect to the
  victim's website instead.

> Permanent Denial-of-Service (PDoS) Attack

- **Phlashing**:

  1.  Permanent DoS, also known as phlashing, refers to attacks that
      cause irreversible damage to system hardware.

- **Sabotage**:

  1.  Unlike other DoS attacks, it sabotages the system hardware,
      requiring the victim to replace or reinstall the hardware.

- **Bricking a system**:

  1.  This attack is carried out using a method known as "bricking a
      system"

> ○ Using this method, attackers send fraudulent hardware updates to the
> victims.
>
> Application-Level Flood Attacks

- Application-level flood attacks result in the loss of services of a
  particular network, such as emails, network resources, the temporary
  ceasing of applications and services, and more.

- Using this attack, attackers exploit weaknesses in programming source
  code to prevent the application from processing legitimate requests.

- **Using application-level flood attacks, attackers attempts to:**

  1.  Flood web applications to legitimate user traffic.

> ○ Disrupt service to a specific system or person, for example,
> blocking a user's access by repeating invalid login attempts.
>
> ○ Jam the application-database connection by crafting malicious SQL
> queries.
>
> Distributed Reflection Denial of Service (DRDoS)

- A distributed reflected denial of service attack (DRDoS), also known
  as spoofed attack, involves the use of multiple intermediate and
  secondary machines that contribute to the actual DDoS attack against
  the target machine or application.

- Attacker launches this attack by sending requests to the intermediary
  hosts, these requests are then redirected to the secondary machines
  which in turn reflects the attack traffic to the target.

- Advantage:

  1.  The primary target seems to be directly attacked by the secondary
      victim, not the actual attacker.

> ○ As multiple intermediary victim servers are used which results in an
> increase in attack bandwidth.

Botnet

- Bots are software applications that run automated tasks over the
  Internet and perform simple repetitive tasks, such as web spidering
  and search engine indexing.

- A botnet is a huge network of the compromised systems and can be used
  by an attacker to launch denial-of-service attacks.

> Scanning Methods for Finding Vulnerable Machines

- **Random Scanning**: The infected machine probes IP addresses randomly
  from target network IP range and checks for the vulnerability.

- **Hit-list Scanning**: Attacker first collects a list of possible
  potentially vulnerable machines and then performs scanning to find
  vulnerable machines.

- **Topological Scanning**: It uses the information obtained on infected
  machines to find new vulnerable machines.

- **Local Subnet Scanning**: The infected machine looks for the new
  vulnerable machine in its own local network.

- **Permutation Scanning**: It uses a pseudorandom permutation list of
  IP addresses to find new vulnerable machines. Divide and conquer

> How Malicious Code Propagates?

- Attackers use three techniques to propagate malicious code to newly
  discovered vulnerable system:

> ○ **Central Source Propagation**: Attacker places attack toolkit on
> the central source and copy of the attack toolkit is transferred to
> the newly discovered vulnerable system.
>
> ○ **Back-chaining Propagation**: Attacker places attack toolkit on
> his/her system itself and copy of the attack toolkit is transferred to
> the newly discovered vulnerable system.
>
> ○ **Autonomous Propagation**: Attack toolkit is transferred at the
> time when the new vulnerable system is discovered.
>
> Botnet Trojan: Blackshades NET

- Blackshades NET has the ability to create implant binaries which
  employ custom obfuscation algorithms or Crypters, which can be bought
  through the Bot/Crypter marketplace embedded in the BlackShades
  controller.

> Other botnes: Cythosia Botnet, Andromeda Bot, Mirai botnet
>
> Botnet Trojan: PlugBot

- PlugBot is a hardware botnet project.

- It is a covert penetration testing device (bot) designed for covert
  use during physical penetration tests.

DoS/DDoS Tools

> DoS and DDoS Attack Tool: Pandora DDoS Bot Toolkit

- The Pandora DDoS Bot Toolkit is an updated variant of the Dirt Jumper
  DDoS toolkit.

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

- **Dereil**: Dereil is professional (DDoS) Tools with modern patterns
  for attack via TCP, UDP, and HTTP protocols.

- **HOIC**: HOIC makes DDoS attacks to any IP address, with a user
  selected port and a user selected protocol.

> DoS and DDoS Attack Tools: DoS HTTP and BanglaDos

- **DoS HTTP**:

  1.  DoSHTTP is HTTP Flood Denial of Service (DoS) Testing Tool for
      Windows

> ○ It includes URL verification, HTTP redirection, port designation,
> performance monitoring and enhanced reporting.
>
> ○ It uses multiple asynchronous sockets to perform an effective HTTP
> Flood. ● **BanglaDos**
>
> DoS and DDoS Attack Tools
>
> DoS and DDoS Attack Tool for Mobile: AnDOSid

- AnDOSid allows attackers to simulate a DOS attack (A http post flood
  attack to be exact) and DDoS attack on a web server from mobile
  phones.

> DoS and DDoS Attack Tool for Mobile: Low Orbit Ion Cannon (LOIC)

- Android version of Low Orbit Ion Cannon (LOIC) software is used for
  flooding packets which allows attackers to perform DDoS attacks on
  target organization.

DDoS Countermeasures

> Detection Techniques

- Detection techniques are based on identifying and discriminating the
  illegitimate traffic increase and flash events from legitimate packet
  traffic.

- All detection techniques define an attack as an abnormal and
  noticeable deviation from a threshold of normal network traffic
  statistics.

1.  Activity Profiling

2.  Wavelet-based Signal Analysis

3.  Changepoint Detection

> Activity Profiling

- An attack is indicated by:

  1.  An increase in activity levels among the network flow clusters.

> ○ An increase in the overall number of distinct clusters (DDoS attack)

- Activity profile is done based on the average packet rate for a
  network flow, which consists of consecutive packets with similar
  packet fields.

- Activity profile is obtained by monitoring the network packet's header
  information.

> Activity Profiling monitors a network packet's header information,
> calculates the average packet rate for a network flow.
>
> Wavelet-based Signal Analysis

- Wavelet analysis describes an input signal in terms of spectral
  components.

- Wavelets provide for concurrent time and frequency description.

- Analyzing each spectral window's energy determines the presence of
  anomalies.

- Signal analysis determines the time at which certain frequency
  components are present.

> Sequential Change-Point Detection

- **Isolate Traffic**: Change-point detection algorithms isolate changes
  in network traffic statistics caused by attacks.

- **Filter Traffic**: The algorithms filter the target traffic data by
  address, port, or protocol and store the resultant flow as a time
  series.

> **Identify Attack**: Sequential change-point detection technique uses
> Cumulative Sum (Cusum) algorithm to identify and locate the DoS
> attacks; the algorithm calculates deviations in the actual versus
> expected local average in the traffic time series.

- **Identify Scan Activity**: This technique can also be used to
  identify the typical scanning activities of the network worms.

> DoS/DDoS Countermeasure Strategies

- **Absorbing the Attack**:

  1.  Use additional capacity to absorb attack; it requires preplanning.
      ○ It requires additional resources.

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

- Increase awareness of security issues and prevention techniques in all
  Internet users.

- Disable unnecessary services, uninstall unused applications, and scan
  all the files received from external sources.

> Properly configure and regularly update the built-in defensive
> mechanisms in the core hardware and software of the system.
>
> DoS/DDoS Attack Countermeasures: Detect and Neutralize Handlers

- **Network Traffic Analysis**: Analyze communication protocols and
  traffic patterns between handlers and clients or handlers and agents
  in order to identify the network nodes that might be infected by the
  handlers.

- **Neutralize Botnet Handlers**: There are usually few DDoS handlers
  deployed as compared to the number of agents. Neutralizing a few
  handlers can possibly render multiple agents useless, thus thwarting
  DDoS attacks.

- **Spoofed Source Address**: There is a decent probability that the
  spoofed source address of DDoS attack packets will not represent a
  valid source address of the definite sub-network.

> DoS/DDoS Countermeasures: Detect Potential Attacks

- **Egress Filtering**:

  1.  Scanning the packet headers of IP packets leaving a network.

> ○ Egress filtering ensures that unauthorized or malicious traffic
> never leaves the internal network.

- **Ingress Filtering**:

  1.  Protects from flooding attacks which originate from the valid
      prefixes (IP address) ○ It enables the originator to be traced to
      its true source.

- **TCP Intercept**:

  1.  Configuring TCP Intercept prevents DoS attacks by intercepting and
      validating the TCP connection requests.

> DoS/DDoS Countermeasures: Deflect Attacks

- Systems that are set up with limited security, also known as
  Honeypots, act as an enticement for an attacker.

- Honeypots serve as a means for gaining information about attackers,
  attack techniques and tools by storing a record of the system
  activities.

- Use defense-in-depth approach with IPSes at different network points
  to divert suspicious DoS traffic to several honeypots.

> Low-interaction honeypots: All services offered by a Low Interaction
> Honeypots are emulated.

- High-interaction honeypots: (honeynet) High Interaction Honeypots make
  use of the actual vulnerable service or software.

- KFSensor: KFSensor is a Windows-based honeypot IDS.

> DoS/DDoS Countermeasures: Mitigate Attacks

- **Load Balancing**:

  1.  Increase bandwidth on critical connections to absorb additional
      traffic generated by an attack.

> ○ Replicate servers to provide additional failsafe protection.
>
> ○ Balance load on each server in a multiple-server architecture to
> mitigate DDoS attack.

- **Throttling**:

  1.  Set routers to access a server with a logic to throttle incoming
      traffic levels that are safe for the server.

> ○ Throttling helps in preventing damage to servers by controlling the
> DoS traffic.
>
> ○ Can be extended to throttle DDoS attack traffic and allow legitimate
> user traffic for better results.

- **Drop Request**:

  1.  Drop packets when a load increases.

> Post-Attack Forensics

- DDoS attack traffic patterns can help the network administrators to
  develop new filtering techniques for preventing the attack traffic
  from entering or leaving the networks.

- Analyze router, firewall, and IDS logs to identify the source of the
  DoS traffic. Try to trace back attacker IP's with the help of
  intermediary ISPs and law enforcement agencies.

- Traffic pattern analysis: Data can be analyzed - post-attack - to look
  for specific characteristics within the attacking traffic.

- Using these characteristics, the result of traffic pattern analysis
  can be used for updating load-balancing and throttling
  countermeasures.

> Techniques to Defend against Botnets

- **RFC 3704 Filtering**: Any traffic coming from unused or reserved IP
  addresses is bogus and should be filtered at the ISP before it enters
  the Internet link.

- **Cisco IPS Source IP Reputation Filtering**: Reputation services help
  in determining if an IP or service is a source of threat or not, Cisco
  IPS regularly updates its database with known threats such as botnets,
  botnet harvesters, malwares, etc. and helps in filtering DoS traffic.

- **Black Hole Filtering**:

  1.  Black hole refers to network nodes where incoming traffic is
      discarded or dropped without informing the source that the data
      did not reach its intended recipient.

> ○ Black hole filtering refers to discarding packets at the routing
> level.

- **DDoS Prevention Offerings from ISP or DDoS Service**: Enable IP
  Source Guard (in CISCO) or similar features in other routers to filter
  traffic based on the DHCP snooping binding database or IP source
  bindings which prevents a bot from sending spoofed packets.

> DoS/DDoS Countermeasures

- Use strong encryption mechanisms such as WPA2, AES 256, etc. for
  broadband networks to withstand eavesdropping.

- Ensure that the software and protocols are up-to-date and scan the
  machines thoroughly to detect any anomalous behavior.

- Disable unused and insecure services.

- Block all inbound packets originating from the service ports to block
  the traffic from reflection servers.

- Update kernel to the latest release.

- Prevent the transmission of the fraudulently addressed packets at ISP
  level.

- Implement cognitive radios in the physical layer to handle the jamming
  and scrambling attacks.

- Configure the firewall to deny external ICMP traffic access.

- Perform the thorough input validation.

- Prevent use of unnecessary functions such as gets, strcpy etc.

- Secure the remote administration and connectivity testing.

- Data processed by the attacker should be stopped from being executed.

- Prevent the return addresses from being overwritten.

> DoS/DDoS Protection at ISP Level

- Most ISPs simply block all the requests during a DDoS attack, denying
  even the legitimate traffic from accessing the service.

- ISPs offer in-the-cloud DDoS protection for Internet links so that
  they do not become saturated by the attack.

- Attack traffic is redirected to the ISP during the attack to be
  filtered and sent back.

- Administrators can request ISPs to block the original affected IP and
  move their site to another IP after performing DNS propagation.

> Enabling TCP Intercept on Cisco IOS Software

- To enable TCP intercept, use these commands in global configuration
  mode:

  1.  Define an IP extended access list: access-list access-list {deny
      \| permit} tcp any destination destination-wildcard

> ○ Enable TCP Intercept: ip tcp Intercept list access-list-number

- TCP intercept can operate in either active intercept mode or passive
  watch mode. The default is intercept mode.

- The command to set the TCP intercept mode in global configuration
  mode:

  1.  Set the TCP intercept mode: ip tcp intercept mode {intercept \|
      watch}

# Distributed Denial of Service (DDoS)

- Generally done by flooding the service or network with more requests
  than can be serviced, which results in the service becoming
  unreachable. This sometimes happens due to a client misconfiguration.

- The objective of a denial of service (DoS) attack is to overwhelm the
  resources of a target system and cause it to stop functioning, denying
  access to its users. Distributed denial of service (DDoS) is a variant
  of DoS in which attackers compromise a large number of computers or
  other devices, and use them in a coordinated attack against the target
  system.

- DDoS attacks are often used in combination with other cyber threats.
  These attacks may launch a denial of service to capture the attention
  of security staff and crea confusion, while they carry out more subtle
  attacks aimed at stealing data or causing other damage

**Method of DDoS**

- **Methods of DDoS attacks include:**

- **Botnets**: Systems under hacker control that have been infected with
  malware. Attackers use these bots to carry out DDoS attacks. Large
  botnets can include millions of devices and can launch attacks at
  devastating scale.

- **Smurf attack**: Sends Internet Control Message Protocol (ICMP) echo
  requests to the victim’s IP address. The ICMP requests are generated
  from ‘spoofed’ IP addresses. Attackers automate this process and
  perform it at scale to overwhelm a target system.

- **TCP SYN flood attack**: Attacks flood the target system with
  connection requests. When the target system attempts to complete the
  connection, the attacker’s device does not respond, forcing the target
  system to time out. This quickly fills the connection queue,
  preventing legitimate users from connecting.

- The following two attacks are less common today, as they rely on
  vulnerabilities in the internet protocol (IP) which have been
  addressed on most servers and netwo

- **Teardrop attack** causes the length and fragmentation offset fields
  in IP packets to overlap. The targeted system tries to reconstruct
  packets but fails, which ca cause it to crash.

- **Ping of death attack**: pings a target system using malformed or
  oversized IP packets, causing the target system to crash or freeze.

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

- A DDOs (distributed denial-of-service ) is a malicious attempt of
  disrupting regular traffic of a network by flooding with a large
  number of requests and making the server unavailable to the
  appropriate requests. The requests come from several unauthorized
  sources and hence called distributed denial of service attack.

- Methods to prevent DDoS Attacks

<!-- -->

- Build a denial of service response plan

- Employ basic network security

- Maintain strong network architecture

- Understand the Warning signs

- Consider DDoS as a service

-  

- What is a DDOS attack and how to stop and prevent them?

- A DDOS (distributed denial-of-service) is a malicious attempt of
  disrupting regular traffic of a network by flooding with a large
  number of requests and making the server unavailable to the
  appropriate requests. The requests come from several unauthorized
  sources and hence called distributed denial of service attack.

-  

- Methods to prevent DDoS Attacks

  - Build a denial-of-service response plan

  - Employ basic network security

  - Maintain strong network architecture

  - Understand the Warning Signs

  - Consider DDoS as a service

# DDOS Attack

This again is an important Cybersecurity Interview Question. A
**DDOS(Distributed Denial of Service)** attack is a cyberattack that
causes the servers to refuse to provide services to genuine clients.
DDOS attack can be classified into two types:

**Flooding attacks**: In this type, the hacker sends a huge amount of
traffic to the server which the server cannot handle. And hence, the
server stops functioning. This type of attack is usually executed by
using automated programs that continuously send packets to the server.

**Crash attacks:** In this type, the hackers exploit a bug on the server
resulting in the system to crash and hence the server is not able to
provide service to the clients.

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

- **What is a DDOS attack and how to stop and prevent them?** A DDOS
  (distributed denial-of-service ) is a malicious attempt of disrupting
  regular traffic of a network by flooding with many requests and making
  the server unavailable to the appropriate requests. The requests come
  from several unauthorized sources and hence called distributed denial
  of service attack. The following methods will help you to stop and
  prevent DDOS attacks: Build a denial-of-service response plan, Protect
  your network infrastructure, Employ basic network security, Maintain
  strong network architecture, Understand the Warning Signs, Consider
  DDoS as a service

- What is a DDoS attack?

- **DDoS and its mitigation?** DDoS stands for distributed denial of
  service. When a network/server/application is flooded with large
  number of requests which it is not designed to handle making the
  server unavailable to the legitimate requests. The requests can come
  from different not related sources hence it is a distributed denial of
  service attack. It can be mitigated by analysing and filtering the
  traffic in the scrubbing centres. The scrubbing centres are
  centralized data cleansing station wherein the traffic to a website is
  analysed and the malicious traffic is removed.

- **What is a denial of service (DOS) attack and what are the common
  forms?** DOS attacks involve flooding servers, systems, or networks
  with traffic to cause overconsumption of victim resources. This makes
  it difficult or impossible for legitimate users to access or use
  targeted sites. Common DOS attacks include: Buffer overflow attacks,
  ICMP flood, SYN flood, Teardrop attack, Smurf attack.

- What is a designated confirmer signature?

- **What is a distributed denial-of-service attack (DDoS)?** It is an
  attack in which multiple computers attack website, server, or any
  network resource.

# Introduction

**🚫 What Is a DoS Attack?**

A **Denial of Service (DoS) Attack** is a malicious attempt to disrupt
the normal functioning of a computer, network, or service—making it
unavailable to legitimate users.

**🛠️ How Does It Work?**

The attacker overwhelms the target in one or both of these ways:

- **Resource Flooding**: The attacker sends a huge number of requests to
  the system, using up all its memory, CPU, or bandwidth—so real users
  can’t get through.

- **Malformed Requests**: The attacker sends data that the system
  doesn’t know how to handle—causing it to crash, restart, or freeze.

**🧑‍💻 Why Do Hackers Do It?**

In underground hacker culture, successfully executing a DoS attack can
be seen as a badge of skill. Some attackers use it to:

- Gain notoriety and respect in hacking communities

- Prove their technical prowess

- Intimidate or blackmail individuals or companies

**💥 The Real-World Impact**

These attacks can:

- Take down websites temporarily (imagine a retail site going offline
  during a big sale)

- Disrupt online services like banking, gaming, or communication
  platforms

- Cost organizations thousands or even millions in downtime and lost
  revenue

<img src="media/image1.png" style="width:9.19246in;height:4.55873in" />

**🛡️ What Is a DoS Attack?**

A **Denial-of-Service (DoS) attack** is a type of cyberattack that makes
a device or network resource temporarily unusable for legitimate users
by overwhelming it with excessive traffic or exploiting system
vulnerabilities.

**🚨 How Do DoS Attacks Work?**

- **Flooding with Traffic**: The attacker sends a massive amount of
  traffic to a server, making it slow or completely unresponsive.

- **Resource Exhaustion**: The attack can target a system’s CPU or RAM,
  causing it to overload and fail.

- **Software Exploits**: Vulnerabilities in software may be exploited to
  crash systems or freeze services.

**🕒 Duration and Damage**

- DoS attacks can range from a few hours to **months** depending on the
  persistence of the attacker.

- They lead to **downtime**, **financial loss**, and possibly **damage
  to a company’s reputation**.

**🧑‍💻 Attack Methodology**

- Most classic DoS attacks involve a **single device and a single
  internet connection**.

- The attacker repeatedly sends requests to exhaust network resources.

- Because only one IP is involved, it’s often easier to **identify and
  block** the attacker using firewalls.

**🔥 Mitigation Techniques**

- **Firewalls**: Use allow/deny rules to block malicious IP addresses.

- **Rate Limiting**: Control the flow of traffic into the server.

- **Monitoring Tools**: Detect abnormal spikes in usage early.

**🌐 What About DDoS?**

You hinted at a more dangerous variant: **DDoS (Distributed
Denial-of-Service)** attacks. These involve **multiple devices**
(sometimes thousands) across the internet targeting a system
simultaneously—making it much harder to trace and stop.

**DDoS (Distributed Denial of Service)** is a type of cyberattack aimed
at disrupting the normal operations of a server, service, or network by
overwhelming it with a massive flood of internet traffic from **multiple
sources**. This flood causes the target system to slow down
significantly or become completely unavailable to legitimate users.

These attacks typically involve computers and devices that have been
**infected with malware** and are remotely controlled by the attacker.
These compromised devices form a group called a **botnet**—a network of
infected machines acting together without the users’ knowledge.

DDoS attacks often work by:

- **Flooding web servers** with more page requests than they can handle.

- **Overloading databases** with high volumes of queries.

- **Draining resources** like bandwidth, RAM, or CPU—leading to crashes
  or severely degraded performance.

The consequences can range from **minor service disruptions** to
**complete outages** of websites, applications, or even entire
businesses.

**🧠 Key Concepts Simplified**

| **Term** | **Explanation** |
|----|----|
| **DDoS** | An attack using **multiple sources** to flood and disable a system or service |
| **Botnet** | A group of **infected devices** controlled by the attacker |
| **Malware** | Malicious software used to secretly take control of devices |
| **Impact** | Can range from **temporary slowness** to complete shutdown of services |

**⚠️ Notes & Corrections**

- “**Unusable by overloading...**” was a bit awkward. Clarified the
  phrase for better flow.

- “**Distributing the malwares**” → changed to “distributing
  **malware**” since “malware” is uncountable.

- 

<img src="media/image2.png" style="width:6.93393in;height:4.6004in" />

**💥 DDoS Attack – Refined Overview**

A **Distributed Denial-of-Service (DDoS) attack** is a cyberattack that
aims to make a system, server, or network **unavailable** to its
intended users by flooding it with a massive amount of traffic. Unlike a
basic DoS attack (which uses a single source), a DDoS attack uses
**multiple compromised computers**—called a **botnet**—to generate
traffic from various locations simultaneously.

**🎯 Primary Motivations Behind DDoS Attacks**

1.  **Gain Competitive Advantage**: Sabotaging a rival company’s website
    or services to disrupt their operations.

2.  **Extortion**: Demanding ransom in exchange for stopping the attack
    or releasing data.

3.  **Hacktivism**: Making a political or social statement through
    digital disruption.

**🤖 How Attackers Involve Other Computers**

- Attackers **create malware** and spread it via **infected websites**
  or **email attachments**.

- **Vulnerable devices** (computers, smart devices, etc.) that download
  or interact with this content become infected.

- Once infected, these devices **unknowingly join a botnet**—a network
  of compromised systems.

- The **attacker (ringleader)** sends commands to this botnet to
  coordinate a full-scale DDoS attack on a chosen target.

- The target can be taken offline within minutes due to the overwhelming
  traffic.

\> 💡 *Think of it like a zombie army controlled remotely—except instead
of eating brains, they're clogging up servers.*

**🧠 Symptoms of a DDoS Attack**

You might notice the following signs if a DDoS attack is underway:

- 🐢 **Slow access** to files or applications (locally or remotely)

- 🌐 **Inability to reach websites**, especially specific ones

- ❌ **Random internet disconnections**

- 🌪️ **Widespread difficulty** accessing any websites

- 📬 **Spike in spam emails** (though this is more typical of other
  malware campaigns, not always DDoS)

**What is a DDoS Attack?**

A **Distributed Denial of Service (DDoS)** attack is a coordinated
cyberattack where multiple systems (often compromised) flood a targeted
server or network with overwhelming traffic, causing service disruption
or complete outage. The attack typically unfolds in two phases:

**🧠 Two-Phase Process:**

1.  **Botnet Creation**

    - A hacker infects multiple devices (PCs, IoT gadgets, etc.) using
      malware or ransomware.

    - These devices form a botnet—a network of compromised machines
      (called **bots** or **zombies**) controlled remotely.

2.  **Targeted Attack Launch**

    - At a chosen time, the attacker instructs all bots to flood the
      selected server with requests.

    - The goal: Exhaust bandwidth or system resources so legitimate
      users can’t access the service.

**💥 Types of DDoS Attacks**

| **Attack Type** | **Description** | **Key Metrics** | **Examples** |
|----|----|----|----|
| **1. Volumetric (Network-Level)** | Overloads bandwidth with massive fake traffic | Bits per second (bps) | UDP Flood, ICMP Echo Request |
| **2. Protocol-Level** | Exploits weaknesses in network protocols and system infrastructure | Packets per second (pps) | SYN Flood, Ping of Death |
| **3. Application-Level** | Targets specific applications with legitimate-looking but malicious requests | Requests per second (rps) | HTTP Flood, DNS Query Flood |

**🔧 Corrections & Clarifications**

- ❌ *“SYN flooding and UDP flooding are complex attacks”* → ✅ These
  are common attack methods, not necessarily complex, but can be
  damaging depending on the scale.

- ❌ *“BGP hijacking”* as an example of **Application-Level DDoS** → 🚫
  **BGP hijacking** is **not** typically considered a DDoS technique,
  but rather a routing attack at the **network control layer**.

- ❌ *“firewall... meant to protect the system against DDOS”* → 🔍
  Firewalls **can** help but are not always sufficient for DDoS
  mitigation alone. Dedicated **DDoS protection services** (like
  Cloudflare or AWS Shield) are more effective.

**🛡️ Extra Insight: How DDoS Impacts Work**

- **Real-Time Disruption**: Websites crash, APIs fail, online games lag
  out, and services go down for hours—or longer.

- **Reputation Damage**: DDoS attacks can shake customer trust.

- **Financial Cost**

<img src="media/image3.png" style="width:7.50065in;height:4.33371in" />

**🛡️ DDoS Attack Mitigations: Summary & Explanation**

**DDoS mitigation** techniques aim to reduce or eliminate the effects of
denial-of-service attacks on targeted servers, applications, or
networks. Here’s a breakdown of your listed strategies, revised for
accuracy and clarity:

| **Mitigation Method** | **Explanation** |
|----|----|
| **1. Load Balancers & Firewalls** | \- **Load balancers** distribute incoming traffic across multiple servers, preventing a single server from being overwhelmed. \<br\> - **Firewalls** filter traffic based on rules, blocking unauthorized or harmful requests. |
| **2. Cloud-Based Infrastructure (e.g., AWS, Azure)** | Cloud service providers offer **elastic scalability** and **built-in DDoS protection** tools (like AWS Shield, Azure DDoS Protection), which absorb and deflect large-scale attacks. |
| **3. Increased Bandwidth Capacity** | Extra bandwidth allows systems to absorb higher traffic volumes, though this is **not a standalone solution**—it buys time during a DDoS event. |
| **4. Connection Rate Limiting** | Restricts how many connections one IP/user can open in a given timeframe. Helps minimize the impact of botnet-driven flooding. |
| **5. Lowering Connection Timeouts** | Reduces how long a server holds idle or incomplete connections (like those used in SYN Flood attacks), freeing up resources faster. |
| **6. Anti-DDoS Technologies & Services** | Specialized tools (like Cloudflare, Akamai, or Imperva) that detect, absorb, or block attack traffic using AI, global edge networks, and threat databases. |

**✅ Corrections & Enhancements**

- 🔄 *“Switch to cloud services”* → More than just switching—**proper
  configuration** of security features offered by cloud providers is
  key.

- ⏳ *“Reduce the connection waiting time”* → More accurate phrasing is:
  **reduce connection timeout durations** or **tune TCP stack
  settings**.

- 🔒 It’s worth mentioning **Web Application Firewalls (WAFs)** as a
  useful tool for **Application-Level DDoS** attacks.

**🧠 Bonus Tip: Layered Defense Strategy**

Combining **network-level defenses** with **application-level
protections** creates a multilayered shield. Think of it like armor: the
more layers you have, the harder it is to break through.

**Explain DDOS attack and how to prevent it?**

This again is an important Cybersecurity Interview Question. A **DDOS
(Distributed Denial of Service)** attack is a cyberattack that causes
the servers to refuse to provide services to genuine clients. DDOS
attack can be classified into two types:

- **Flooding attacks**: In this type, the hacker sends a huge amount of
  traffic to the server which the server cannot handle. And hence, the
  server stops functioning. This type of attack is usually executed by
  using automated programs that continuously send packets to the server.

- **Crash attacks:** In this type, the hackers exploit a bug on the
  server resulting in the system to crash and hence the server is not
  able to provide service to the clients. You can prevent DDOS attacks
  by using the following practices:

  1.  Use Anti-DDOS services

  2.  Configure Firewalls and Routers

  3.  Use Front-End Hardware

  4.  Use Load Balancing

  5.  Handle Spikes in Traffic

**What is a honeypot?** Honeypot is a fake computer system that behaves
like a real system and attracts hackers to attack it. Honeypot is used
to find out loopholes in **the** system and to provide a solution for
these kinds of attacks.

**What is the chain of custody?**

When keeping track of data or equipment for use in legal proceedings, it
needs to remain in a pristine state. Therefore, documenting exactly who
has had access to what for how long is vital when dealing with this
situation. Any compromise in the data can lead to legal issues for the
parties involved and can lead to a mistrial or contempt depending on the
scenario.

**🛡️ DoS Attack Penetration Testing**

**Definition:** Penetration testing for Denial-of-Service (DoS) attacks
involves simulating such attacks to evaluate how well a system can
withstand them.

- **Purpose:** Identify vulnerabilities that could be exploited to
  disrupt services.

- **Risks:** May cause real downtime or performance degradation during
  testing.

- **Tools Used:** hping3, GoldenEye, HULK, LOIC, and Raven-Storm are
  common tools for simulating DoS/DDoS attacks.

- **Best Practice:** Always conduct tests in controlled environments
  with proper authorization.

**💥 Introduction to DoS Attack**

**DoS (Denial-of-Service)** attacks aim to make a system or service
unavailable by overwhelming it with traffic or exploiting
vulnerabilities.

- **Types:** Volume-based, protocol-based, and application-layer
  attacks.

- **Impact:** Service disruption, financial loss, and reputational
  damage.

- **Example:** Sending excessive login requests to lock out users.

**🤖 Botnet**

A **botnet** is a network of compromised devices (bots) controlled by an
attacker (bot herder).

- **Use in Attacks:** Often used in **DDoS** attacks to generate massive
  traffic.

- **Control Methods:** Via centralized servers or peer-to-peer networks.

- **Malicious Activities:** Spam, data theft, crypto mining, and traffic
  flooding.

**🌐 DDoS Attack**

**Distributed Denial-of-Service (DDoS)** attacks are large-scale DoS
attacks using multiple systems.

- **Amplification:** Uses botnets to flood a target with traffic.

- **Recent Trends:** Attacks exceeding 7 Tbps have been recorded.

- **Common Vectors:** UDP floods, SYN floods, DNS amplification.

**🔁 SYN Flood Attack**

A **SYN flood** exploits the TCP handshake process.

- **Mechanism:** Sends many SYN requests without completing the
  handshake.

- **Effect:** Server resources are tied up in half-open connections.

- **Mitigation:** SYN cookies, firewalls, and rate limiting.

**📡 UDP Flood**

A **UDP flood** sends a large number of UDP packets to random ports.

- **Goal:** Overwhelm the server’s ability to respond with ICMP
  “destination unreachable” messages.

- **Spoofing:** Often uses fake IP addresses to hide the attacker.

- **Defense:** Rate limiting, filtering, and deep packet inspection.

**🧨 Smurf Attack**

A **Smurf attack** is a type of DDoS that uses ICMP echo requests to
flood a target.

- **How It Works:** Sends spoofed ping requests to a broadcast address,
  causing all devices to reply to the victim.

- **Amplification:** The more devices on the network, the greater the
  flood.

- **Prevention:** Disable IP-directed broadcasts on routers.

**🧪 Packet Crafting**

**Packet crafting** involves manually creating or modifying network
packets to test systems.

- **Purpose:** Test firewall rules, IDS/IPS behavior, and protocol
  handling.

- **Tools:** Scapy, Hping, Ostinato, Netdude.

- **Use in Attacks:** Can be used to exploit protocol vulnerabilities or
  evade detection.

**🛠️ Other DoS Attack Tools**

Here are some notable tools used for DoS/DDoS testing or attacks:

| **Tool**         | **Description**                                   |
|------------------|---------------------------------------------------|
| **LOIC**         | Simple tool for HTTP, TCP, UDP floods.            |
| **XOIC**         | GUI-based DoS tool with multiple attack modes.    |
| **HULK**         | Generates unique requests to bypass caching.      |
| **R-U-Dead-Yet** | Targets web servers with long-form POST requests. |
| **Tor’s Hammer** | Slow POST DoS tool using Tor.                     |
| **PyLoris**      | Layer 7 DoS tool using sockets.                   |
| **Raven-Storm**  | Python-based toolkit for multi-protocol DDoS.     |

# DNS Attacks

**How it works:**

Attackers flood DNS servers with a massive number of requests,
overwhelming their capacity and preventing them from responding to
legitimate queries.

**Impact:** Can disrupt internet access for users, causing significant
inconvenience and financial losses.

# DDoS Attack and Protection

# Introduction

Denial-of-Service (DoS) and Distributed Denial-of-Service (DDoS) attacks
are malicious attempts to disrupt the normal traffic of a network by
overwhelming it with fake requests. This makes the network or service
unavailable to legitimate users.

DoS attack originates from a single source, while DDoS attack comes from
multiple sources, typically botnets which are collections of compromised
devices.

The goal of both attacks is to overload the target system's resources
and prevent it from functioning properly. DDoS attacks are more
difficult to defend against because they are spread out across many
devices.

DoS and DDoS attacks can be used to distract security personnel while
other attacks are carried out.

DDoS (Distributed Denial-of-Service) attacks overwhelm a network with
fake traffic from multiple sources, making it unavailable to legitimate
users.

## Concepts

DoS stands for Denial of Service

DDoS stands for Distributed Denial of Service

DDoS is a malicious attempt of disrupting regular traffic of network by
flooding with a large number of fake requests and making server
unavailable to the appropriate requests. These fake requests come from
several unauthorized sources and hence called distributed denial of
service attack.

Objective of a DoS attack is to overwhelm the resources of a target
system and cause it to stop functioning, denying access to its users.
DDoS is a variant of DoS in which attackers compromise a large number of
computers or other devices, and use them in a coordinated attack against
the target system.

DDoS attack is generally done by this sometimes happens due to a client
misconfiguration.

DDoS attacks are often used in combination with other cyber threats.

These attacks may launch DoS attack to capture the attention of security
staff and create confusion, while they carry out more subtle attacks
aimed at stealing data or causing other damage.

DoS is an attack on a computer or network that reduces, restricts or
prevents accessibility of system resources to its legitimate users. In a
DoS attack, attackers flood a victim system with non-legitimate service
requests or traffic to overload its resources. DoS attack leads to
unavailability of a particular website and show network performance.

DDoS attack involves a multitude of compromised systems attacking a
single target, thereby causing denial of service for users of the
targeted system. To launch a DDoS attack, an attacker uses botnets and
attacks a single system.

Here is how to prevent them:

- **Plan:** Create a response plan outlining steps to take during a DDoS
  attack.

- **Security:** Implement basic network security measures like
  firewalls.

- **Architecture:** Design a strong network architecture that can handle
  traffic spikes.

- **Warning Signs:** Be aware of signs that might indicate a DDoS
  attack.

- **DDoS Protection Services:** Consider using services that can
  mitigate DDoS attacks.

Certainly! Here's a reviewed, summarized, corrected, and clearly
explained version of your **DDoS** content:

**DDoS (Distributed Denial-of-Service) Attack Overview, Techniques, and
Tools**

**What is a Denial-of-Service (DoS) Attack?**

- A **DoS attack** aims to make a computer or network resource
  unavailable to legitimate users by overwhelming it with illegitimate
  traffic or requests.

- The attack floods the victim system with excessive fake traffic or
  service requests, causing slowdowns or total unavailability.

- Result: Websites or services become unreachable, and network
  performance degrades significantly.

**What is a Distributed Denial-of-Service (DDoS) Attack?**

- A **DDoS attack** involves multiple compromised machines (often called
  a botnet) attacking a single target simultaneously.

- The distributed nature increases attack scale and makes mitigation
  more difficult.

- Botnets are networks of infected machines controlled remotely by an
  attacker to launch these attacks.

**Basic Categories of DoS/DDoS Attack Vectors**

1.  **Volumetric Attacks:**\
    Overwhelm the target’s network bandwidth by flooding with massive
    volumes of traffic.

2.  **Fragmentation Attacks:**\
    Exploit the target’s need to reassemble fragmented packets,
    exhausting resources.

3.  **TCP State-Exhaustion Attacks:**\
    Target network devices’ connection tables (firewalls, load
    balancers) to exhaust resources.

4.  **Application Layer Attacks:**\
    Exploit vulnerabilities in applications by overwhelming services or
    causing resource exhaustion at the application level.

**Common DoS/DDoS Attack Techniques**

- **Bandwidth Attacks & Service Request Floods:** Flood network links or
  servers with excessive traffic or connection requests.

- **SYN Flooding Attack:** Exploits TCP’s three-way handshake by sending
  many SYN packets with spoofed IPs, causing half-open connections.

- **ICMP Flood Attack:** Floods the victim with ICMP Echo (ping)
  requests.

- **Peer-to-Peer (P2P) Attacks:** Leverages P2P network protocols to
  redirect large numbers of clients to attack a victim.

- **Application-Level Flood Attacks:** Overwhelm specific application
  functions or services, e.g., login attempts or database queries.

- **Permanent Denial-of-Service (PDoS):** Also called “phlashing,”
  physically damages hardware making the system unusable.

- **Distributed Reflection DoS (DRDoS):** Uses third-party servers
  (reflectors) to amplify and redirect attack traffic to the victim.

**Detailed Attack Descriptions**

**Bandwidth Attacks:**

- Require multiple computers to generate enough traffic to overwhelm
  network equipment.

- Often use botnets flooding victim networks with ICMP Echo (ping)
  packets or other traffic.

- Goal: Consume all bandwidth leaving none for legitimate users.

**Service Request Floods:**

- Attackers send a large number of TCP connection requests and tear them
  down quickly to exhaust server resources.

- These requests appear to come from valid sources, making filtering
  difficult.

**SYN Flood Attack:**

- Exploits TCP’s handshake process: attacker sends SYN, victim replies
  with SYN/ACK, but attacker never completes handshake (no ACK).

- Victim keeps half-open connections in a limited queue, which fills up
  quickly, preventing legitimate connections.

- Typical hold time for half-open connections is about 75 seconds.

**ICMP Flood Attack:**

- Large volumes of ICMP packets flood the victim, overwhelming it.

- Mitigation includes setting threshold limits to trigger flood
  protection.

**Peer-to-Peer Attacks:**

- Attackers use flaws in P2P protocols like DC++ (Direct Connect) to
  redirect many P2P clients to attack a victim website, overwhelming it.

- The attacker acts as a “puppet master” controlling many clients.

**Permanent DoS (PDoS) / Phlashing:**

- Attacks that cause irreversible damage to hardware or firmware (e.g.,
  “bricking” devices).

- Often involve sending malicious firmware updates requiring hardware
  replacement.

**Application-Level Flood Attacks:**

- Overwhelm specific applications (web servers, email, databases) by
  exploiting weaknesses or sending excessive requests.

- Examples: Repeated invalid logins to block a user, flooding web apps,
  or injecting malicious SQL queries.

**Distributed Reflection DoS (DRDoS):**

- Attackers send spoofed requests to intermediary servers, which reply
  to the victim, amplifying traffic.

- Benefits attacker by hiding true origin and increasing attack volume.

**Botnets**

- Bots are automated programs that perform tasks like web crawling but
  can be hijacked for attacks.

- A **botnet** is a network of compromised machines controlled by
  attackers to launch coordinated attacks.

**Scanning Methods to Find Vulnerable Machines**

- **Random Scanning:** Random IPs are probed for vulnerabilities.

- **Hit-list Scanning:** Precompiled list of targets is scanned.

- **Topological Scanning:** Uses knowledge of infected machines to find
  others in the network.

- **Local Subnet Scanning:** Focuses on vulnerable machines within the
  same subnet.

- **Permutation Scanning:** Uses pseudo-random IP sequences to
  efficiently scan networks.

**Propagation Techniques for Malicious Code**

- **Central Source Propagation:** Attack toolkit copied from a central
  server to new targets.

- **Back-chaining Propagation:** Toolkit copied from the attacker’s own
  system to new targets.

- **Autonomous Propagation:** Toolkit transferred automatically during
  vulnerability scanning.

**Examples of Botnet Trojans**

- **Blackshades NET:** Can create customized, obfuscated implant
  binaries; includes marketplace for crypters.

- **PlugBot:** Hardware-based botnet used for covert penetration tests.

Other well-known botnets include **Cythosia**, **Andromeda**, and
**Mirai**.

**Popular DoS/DDoS Tools**

- **Pandora DDoS Bot Toolkit:** Successor to Dirt Jumper toolkit;
  supports multiple attack modes such as HTTP floods and socket
  connects.

- **Dereil:** Professional DDoS tool supporting TCP, UDP, HTTP attacks.

- **HOIC (High Orbit Ion Cannon):** Tool to launch attacks on specified
  IP, port, and protocol.

- **DoS HTTP:** Windows tool that performs HTTP flood attacks with
  performance monitoring.

- **BanglaDos:** Another HTTP flood tool.

- **AnDOSid:** Android app to launch HTTP POST flood DDoS attacks from
  mobile devices.

- **LOIC (Low Orbit Ion Cannon):** Popular tool also available as an
  Android app for flooding targets.

**Summary**

Denial-of-Service (DoS) attacks aim to make systems unavailable by
overwhelming resources, while Distributed Denial-of-Service (DDoS)
attacks leverage many compromised machines (botnets) to amplify scale
and impact. Attacks vary from flooding bandwidth and exhausting
connection tables to exploiting application vulnerabilities and even
permanently damaging hardware (PDoS). Modern DDoS attacks employ
sophisticated techniques like reflection/amplification and exploit
weaknesses in peer-to-peer networks.

Botnets are central to launching large-scale DDoS attacks, with malware
spreading via various scanning and propagation methods. Numerous
open-source and commercial tools facilitate these attacks, ranging from
network floods to application-layer exploits.

Understanding these attack methods is critical for developing effective
detection, mitigation, and defense strategies.

If you'd like, I can also provide a concise table of attack types,
impact, and mitigation recommendations or help you with specific
sections in more detail!

Certainly! Here's a reviewed, summarized, corrected, and explained
version of your **DDoS Countermeasures** content:

**DDoS Countermeasures: Review, Summary, and Explanation**

**1. Detection Techniques**

DDoS detection techniques focus on identifying abnormal traffic patterns
that differ significantly from normal network behavior. The key idea is
to detect deviations in traffic volume, packet rates, or other
statistical characteristics that indicate an attack.

**Main techniques:**

- **Activity Profiling:**\
  Monitors network flows by examining packet headers and calculates the
  average packet rate. An increase in the number of distinct network
  flow clusters or the activity level within those clusters signals a
  possible attack.

- **Wavelet-based Signal Analysis:**\
  Uses wavelets to analyze traffic signals in both time and frequency
  domains simultaneously. By examining the energy of specific frequency
  components over time, it can detect anomalies indicating attacks.

- **Sequential Change-Point Detection:**\
  Applies algorithms like the Cumulative Sum (CUSUM) to identify points
  in time where network traffic statistics change abruptly, signaling a
  potential attack or scanning activity.

**2. DoS/DDoS Countermeasure Strategies**

**Basic approaches to mitigate attacks:**

- **Absorbing the Attack:**\
  Pre-plan by provisioning extra bandwidth and resources to absorb
  traffic spikes caused by attacks.

- **Degrading Services:**\
  Identify critical services and temporarily disable non-critical ones
  to reduce load.

- **Shutting Down Services:**\
  In extreme cases, shut down all services to prevent damage until the
  attack ends.

**3. DDoS Countermeasures: Detailed Breakdown**

- **Protect Secondary Victims:**

  - Keep antivirus and anti-Trojan software updated.

  - Disable unused services and uninstall unnecessary apps.

  - Use built-in defensive tools and configure them properly.

- **Detect and Neutralize Handlers (Command and Control nodes):**

  - Analyze traffic patterns between handlers and bots to identify
    malicious nodes.

  - Target and neutralize handlers to disrupt botnet operations.

  - Consider that many attack packets use spoofed source IPs, often
    outside valid subnets.

- **Detect Potential Attacks:**

  - **Egress Filtering:** Filter outbound packets leaving a network to
    prevent spoofed or malicious traffic.

  - **Ingress Filtering:** Filter inbound packets to block flooding
    attacks and enable source tracing.

  - **TCP Intercept:** Validate TCP connection requests to prevent SYN
    flood attacks.

- **Deflect Attacks:**

  - Use **honeypots** to lure attackers and collect intelligence about
    attack methods.

  - Employ a defense-in-depth strategy with Intrusion Prevention Systems
    (IPS) to redirect suspicious traffic to honeypots.

  - Different types of honeypots:

    - *Low-interaction:* Emulated services (safer, easier to deploy)

    - *High-interaction:* Real vulnerable services (more detailed data
      but riskier)

  - Example: KFSensor (Windows honeypot IDS).

- **Mitigate Attacks:**

  - **Load Balancing:** Spread traffic across multiple servers and
    increase bandwidth to absorb attack traffic.

  - **Throttling:** Rate-limit incoming traffic to prevent overload
    while allowing legitimate users.

  - **Drop Requests:** Drop excessive packets when load exceeds
    thresholds.

- **Post-Attack Forensics:**

  - Analyze logs from routers, firewalls, and IDS to trace attack
    sources.

  - Use traffic pattern analysis to improve future filtering and
    mitigation.

  - Collaborate with ISPs and law enforcement for tracing attackers.

**4. Techniques to Defend Against Botnets**

- **RFC 3704 Filtering:** Drop packets from reserved or unused IP
  address ranges at the ISP level.

- **IP Reputation Filtering:** Use services like Cisco IPS to block IPs
  known for malicious activity.

- **Black Hole Filtering:** Drop traffic at routing level, discarding it
  without notification to source, to mitigate attacks quickly.

- **ISP-level Prevention:** Enable IP Source Guard and similar features
  to prevent spoofed packets from bots.

**5. Additional Best Practices**

- Use strong encryption (WPA2, AES-256) to protect broadband networks.

- Keep software and protocols updated; scan for anomalies regularly.

- Disable unused/insecure services and block inbound packets from
  reflection attack ports.

- Update operating system kernels.

- Configure firewalls to block external ICMP requests (to prevent ping
  floods).

- Avoid unsafe programming functions (e.g., gets, strcpy).

- Secure remote admin tools and connectivity tests.

- Prevent attacker-controlled data from being executed.

- Prevent return address overwrites (mitigate buffer overflow
  exploitation).

- Consider advanced physical layer defenses (like cognitive radios)
  against jamming.

**6. DoS/DDoS Protection at ISP Level**

- ISPs may block all traffic during an attack, which can also deny
  legitimate access.

- Many ISPs offer cloud-based DDoS mitigation services that filter
  attack traffic upstream.

- Traffic is diverted to ISP filters and cleaned before reaching the
  target network.

- Administrators can request IP blocking or change IPs to mitigate
  ongoing attacks.

**7. Enabling TCP Intercept on Cisco IOS**

- Create an extended access list specifying permitted/denied TCP
  traffic.

- Enable TCP intercept using the access list.

- TCP intercept can operate in:

  - *Intercept mode:* actively intercept and validate TCP connection
    requests (default).

  - *Watch mode:* passively monitor connections.

- Commands:

- access-list \<list-number\> deny\|permit tcp any \<destination\>
  \<wildcard-mask\>

- ip tcp intercept list \<list-number\>

- ip tcp intercept mode intercept\|watch

**Summary**

DDoS countermeasures rely on **early detection** of abnormal traffic
patterns, **preventive filtering** (ingress/egress), **botnet handler
neutralization**, and **mitigation through load balancing, throttling,
and honeypots**. Post-attack forensic analysis improves future defenses.
ISPs play a crucial role in filtering and absorbing large-scale attacks.
Network administrators should employ a layered defense strategy
combining network-level, host-level, and service-level protections,
including up-to-date software, firewall rules, and intrusion prevention
techniques.

If you want, I can also help by making this content into a concise
checklist or a more formal report format. Would you like that?

Here is a **reviewed, corrected, clearly explained, and summarized
version** of your content on **DDoS attacks**, with duplicates removed,
technical clarity improved, and the structure made suitable for
interviews, documentation, or study purposes.

**✅ Reviewed Summary: DDoS (Distributed Denial of Service) Attacks**

**🔹 What is a DDoS Attack?**

A **Distributed Denial of Service (DDoS)** attack is a **malicious
attempt to make a service, system, or network resource unavailable** by
**flooding it with traffic** from **multiple compromised devices**. This
attack **overwhelms the system’s capacity**, making it unable to respond
to legitimate requests.

In contrast, a **DoS (Denial of Service)** attack usually originates
from a single system, while **DDoS** attacks involve **many distributed
sources** (often bots in a botnet).

**🔹 Purpose of DDoS Attacks**

- **Exhaust system resources** (CPU, memory, bandwidth).

- **Disrupt service availability** to legitimate users.

- Often used as a **distraction technique** during more covert attacks
  (e.g., data exfiltration or ransomware deployment).

**🔹 Common DDoS Attack Methods**

| **Method** | **Description** |
|----|----|
| **Botnets** | Networks of malware-infected devices controlled remotely to generate massive traffic loads. |
| **SYN Flood** | Sends repeated TCP connection requests (SYN packets) but never completes the handshake, filling the connection queue. |
| **UDP Flood** | Overwhelms the target with large volumes of UDP packets, consuming bandwidth and processing power. |
| **Smurf Attack** | Sends ICMP echo requests to broadcast addresses using spoofed victim IPs, causing devices to reply to the target. |
| **Ping of Death** | Sends malformed or oversized ICMP packets to crash or freeze the target system. |
| **Teardrop Attack** | Sends fragmented IP packets with overlapping offsets; reassembly causes crashes on vulnerable systems. |
| **Packet Crafting** | Custom packets crafted to exploit protocol weaknesses and disrupt systems. |

🔸 Note: Attacks like **Teardrop** and **Ping of Death** are largely
**obsolete** today due to patches in modern systems.

**🔹 How DDoS Attacks Are Executed**

1.  **Reconnaissance**: Attackers scan and identify vulnerable services.

2.  **Botnet Formation**: Devices are infected with malware and
    recruited.

3.  **Traffic Generation**: Bots send malicious traffic simultaneously
    to the target.

4.  **Denial of Service**: Target becomes overwhelmed, unresponsive, or
    crashes.

5.  **(Optional)**: Attackers execute other operations (data theft,
    ransomware) under the guise of the DDoS chaos.

**🔹 DDoS Penetration Testing Focus Areas**

- Botnet simulation

- SYN flood and UDP flood testing

- Protocol misuse (e.g., ICMP/Smurf)

- Packet crafting and malformed packet delivery

- Service resilience under stress/load

**🔹 How to Prevent and Mitigate DDoS Attacks**

| **Mitigation Strategy** | **Description** |
|----|----|
| **DDoS Protection Services** | Use services like **Cloudflare**, **AWS Shield**, **Azure DDoS Protection**. |
| **Firewalls, IPS, and Rate Limiting** | Filter suspicious traffic, throttle requests, block malformed packets. |
| **Traffic Scrubbing Centers** | Redirect traffic to centers that clean malicious data before it reaches you. |
| **Load Balancing** | Distribute traffic across multiple servers to avoid overload. |
| **Strong Network Architecture** | Use **segmentation, redundancy**, and **failover systems**. |
| **DDoS Response Plan** | Predefine detection, escalation, and communication procedures. |
| **Monitor Warning Signs** | Watch for increased latency, traffic spikes, or service slowdowns. |

**🔹 Interview-Ready Summary Answers**

**Q1: What is a DDoS attack?**\
A DDoS (Distributed Denial of Service) attack floods a system or network
with traffic from multiple sources, making it inaccessible to legitimate
users.

**Q2: How are DDoS attacks carried out?**\
Attackers use botnets or spoofed traffic to overwhelm targets with fake
requests, often exploiting vulnerabilities in protocols like TCP or
ICMP.

**Q3: How can you prevent or stop a DDoS attack?**\
Implement DDoS protection services, maintain secure and scalable network
architecture, and monitor for early warning signs. Use firewalls,
scrubbing centers, and response plans to mitigate impact.

Let me know if you'd like a visual diagram, case study example (e.g.,
GitHub, Dyn, or AWS attack), or formatted PDF/PowerPoint version for
training or interviews.

Here is a **corrected, summarized, and professionally explained
version** of the listed topics related to **Denial-of-Service (DoS)
attacks**, including concepts of persistence and post-exploitation:

------------------------------------------------------------------------

**✅ Reviewed and Corrected Summary**

------------------------------------------------------------------------

**🔹 1. Introduction to DoS Attack**

A **Denial-of-Service (DoS)** attack is a cyberattack that aims to make
a system or network **unavailable** to its intended users by
overwhelming it with illegitimate traffic or resource-consuming
requests.

- **Objective**: Disrupt availability (one of the core pillars of the
  CIA triad: Confidentiality, Integrity, Availability).

- **Types**:

  - DoS (from a single source)

  - DDoS (Distributed, from multiple compromised systems)

------------------------------------------------------------------------

**🔹 2. Botnet**

A **Botnet** is a network of compromised devices (bots or zombies)
controlled remotely by an attacker (botmaster).

- **Used for**: Launching **DDoS attacks**, spamming, credential
  stuffing, or mining cryptocurrency.

- **Example malware**: Mirai, Zeus, Emotet.

- **Control channel**: Often managed via C2 (Command and Control)
  servers.

------------------------------------------------------------------------

**🔹 3. DDoS Attack**

**Distributed Denial-of-Service (DDoS)** attack uses multiple systems
(often via botnets) to flood a target system with traffic.

- **Amplification**: Reflective attacks (e.g., DNS, NTP) amplify attack
  bandwidth.

- **Obfuscation**: Makes it harder to trace the source due to
  distribution.

------------------------------------------------------------------------

**🔹 4. SYN Flood Attack**

An attack exploiting the **TCP three-way handshake**:

- **Attacker** sends many SYN packets with **spoofed IPs**.

- **Victim** allocates resources for half-open connections.

- **Impact**: Exhausts the server’s connection queue, preventing real
  users from connecting.

------------------------------------------------------------------------

**🔹 5. UDP Flood**

A **connectionless flooding attack** that overwhelms random UDP ports on
the target system.

- **Result**: System constantly responds with ICMP "Destination
  Unreachable" messages, leading to resource exhaustion.

- **Tools**: hping3, LOIC, UDP Unicorn.

------------------------------------------------------------------------

**🔹 6. Smurf Attack**

A **reflected ICMP-based DDoS** attack.

- **Mechanism**:

  1.  Attacker sends ICMP Echo Request to the **broadcast address** of a
      network, spoofing the victim's IP.

  2.  All hosts reply to the victim, **amplifying traffic**.

- **Mitigation**: Disable IP-directed broadcast on routers.

------------------------------------------------------------------------

**🔹 7. Packet Crafting**

Creating **custom packets** to exploit protocol vulnerabilities.

- **Tools**: Scapy, hping, nmap, Nemesis.

- **Uses**:

  - Evade firewalls/IDS.

  - Send malformed packets to crash or exploit systems.

  - Fuzzing protocols for weaknesses.

------------------------------------------------------------------------

**🔹 8. Other DoS Attack Tools**

Popular tools used in offensive operations or red team simulations:

| **Tool** | **Description** |
|----|----|
| **LOIC** | Launches basic DoS using HTTP, TCP, or UDP floods. |
| **HOIC** | More powerful than LOIC, supports scripting (booster files). |
| **Hping3** | Packet crafting and flooding tool for TCP/UDP/ICMP. |
| **Slowloris** | Targets web servers by holding open many HTTP connections. |
| **Xerxes** | High-performance HTTP DoS tool. |
| **R.U.D.Y.** | ("R U Dead Yet?") Slow POST DoS tool targeting web forms. |

------------------------------------------------------------------------

**🔹 9. Covering Tracks & Maintaining Access**

After gaining access or launching an attack, an intruder may:

- **Clear logs**: Remove event logs (eventvwr, wevtutil, clearlog.exe).

- **Disable logging**: Temporarily disable logging services or
  monitoring agents.

- **Create backdoors**: Leave behind tools for reentry (e.g., reverse
  shells, admin users).

- **Modify timestamps**: Use timestomp to alter file
  creation/modification dates.

------------------------------------------------------------------------

**🔹 10. Persistence Service**

Persistence ensures access **even after reboot or patching**.

- **Method**: Register malicious executables as services.

- **Example (Windows)**:

- sc create backdoor binPath= "C:\malware.exe" start= auto

- **Impact**: Malware restarts automatically when the system reboots.

------------------------------------------------------------------------

**🔹 11. Persistence Techniques**

Attackers can use several techniques to regain or maintain access:

| **Technique** | **Description** |
|----|----|
| **Startup Folder** | Place malicious scripts in %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup. |
| **Scheduled Tasks** | Automatically execute payloads at boot or intervals (schtasks). |
| **Service Installation** | Install backdoor as a system service. |
| **DLL Hijacking** | Replace legitimate DLLs with malicious ones in application paths. |

------------------------------------------------------------------------

**🔹 12. Registry Persistence**

A stealthy and common method in Windows environments.

- **Registry Keys**:

  - HKCU\Software\Microsoft\Windows\CurrentVersion\Run

  - HKLM\SYSTEM\CurrentControlSet\Services

- **Example**:

- reg add HKCU\\..\Run /v updater /t REG_SZ /d "C:\backdoor.exe"

- **Purpose**: Ensure malware runs every time the user logs in.

------------------------------------------------------------------------

**🧠 Final Notes**

This set of topics blends **network-level attacks** (like DoS) with
**post-exploitation persistence** techniques (common in red teaming).
Understanding both sides is crucial for defenders and attackers.

Let me know if you want this structured as a **training module**,
**PowerPoint presentation**, or **technical write-up with diagrams**.

 Here's a **reviewed, corrected, and summarized explanation** of **DDoS
attacks**, including how they work, methods used, and how to prevent
them. I've removed typos, clarified confusing parts, and organized it
into a clean, professional format:

------------------------------------------------------------------------

**✅ What is a DDoS Attack?**

A **Distributed Denial-of-Service (DDoS)** attack is a **malicious
attempt to disrupt** the normal traffic of a server, service, or network
by **overwhelming it with a flood of internet traffic**. It uses
**multiple compromised devices**—often part of a **botnet**—to send a
massive volume of fake requests, causing the target system to slow down
or crash, denying service to legitimate users.

🔹 **Denial-of-Service (DoS)**: An attack using a single source to
overload the target.

🔹 **Distributed Denial-of-Service (DDoS)**: A DoS attack amplified
using **multiple sources**, typically from a botnet, making it harder to
block.

------------------------------------------------------------------------

**🚨 Common DDoS Attack Techniques**

**1. Botnets**

- A botnet is a network of infected devices (bots) controlled remotely
  by an attacker.

- Used to launch large-scale DDoS attacks.

**2. TCP SYN Flood**

- Exploits the TCP handshake by sending SYN requests without completing
  the connection.

- Fills up server resources with half-open connections.

**3. UDP Flood**

- Sends large amounts of User Datagram Protocol (UDP) packets to random
  ports on a target.

- Forces the target to constantly check for applications listening,
  consuming resources.

**4. Smurf Attack**

- Sends ICMP requests with spoofed source IPs to broadcast addresses.

- The network amplifies the traffic, overwhelming the victim.

**5. Teardrop Attack *(Rare today)***

- Sends malformed IP fragments that systems can't reassemble, causing
  crashes.

**6. Ping of Death *(Outdated)***

- Sends oversized or malformed ping packets, crashing the target system.

**7. Application Layer Attacks**

- **Slowloris, RUDY, HTTP floods** target specific applications or
  services.

- These use fewer resources but can crash services by exploiting
  application-level vulnerabilities.

------------------------------------------------------------------------

**⚠️ Why DDoS Attacks Are Dangerous**

- **Availability Impact**: Services become inaccessible to legitimate
  users.

- **Distraction Technique**: Often used to mask other attacks like data
  theft.

- **Financial & Reputational Damage**: Downtime can cause significant
  business losses.

------------------------------------------------------------------------

**🛡️ How to Prevent or Mitigate DDoS Attacks**

**1. Create a DDoS Response Plan**

- Prepare escalation paths, roles, and responsibilities.

- Use playbooks to respond quickly.

**2. Employ Basic Network Security**

- Firewalls, intrusion detection/prevention systems (IDS/IPS), rate
  limiting.

- Disable unused services and ports.

**3. Use Redundant and Scalable Architecture**

- Distribute resources across multiple data centers.

- Use load balancers and auto-scaling groups.

**4. Monitor for Warning Signs**

- Look for unusual traffic spikes, degraded service, or application
  crashes.

- Enable logging and alerting on suspicious activity.

**5. Use DDoS Protection Services**

- Employ services like **Azure DDoS Protection**, **AWS Shield**,
  **Cloudflare**, or **Akamai** to filter and absorb traffic.

------------------------------------------------------------------------

**💡 Final Notes**

- Not all service outages are caused by DDoS attacks—**misconfigurations
  or spikes in legitimate traffic** can have similar effects.

- Many DDoS tools and techniques are now available as
  **"DDoS-as-a-Service"** on the dark web, making them accessible to
  less-skilled attackers.

------------------------------------------------------------------------

Would you like this converted into a **one-page visual summary** or
**professional slide** for training or reporting?

 Here is a **reviewed, corrected, and summarized explanation** of the
content you provided, with improved structure, grammar, and clarity.
I've also grouped related topics and added explanations where needed:

**🤖 What is a Botnet?**

- **Bots** are software applications that perform automated, repetitive
  tasks over the internet—like web crawling or indexing for search
  engines.

- A **botnet** is a large network of **compromised computers** (bots),
  controlled by an attacker (botmaster), often without the users’
  knowledge.

- Botnets are commonly used for **DDoS attacks**, **spamming**,
  **credential stuffing**, **data theft**, and **malware propagation**.

**🔍 Scanning Methods for Finding Vulnerable Machines**

Attackers use the following scanning techniques to identify and
compromise new systems for expanding the botnet:

**1. Random Scanning**

- Infected machines randomly scan IP ranges looking for vulnerable
  systems.

**2. Hit-List Scanning**

- Attackers prepare a pre-collected list of high-probability vulnerable
  targets and scan that list specifically.

**3. Topological Scanning**

- The attacker uses information (e.g., open shares, contact lists, or
  hardcoded IPs) from an infected machine to discover new targets.

**4. Local Subnet Scanning**

- Infected machines scan their local subnet to identify and compromise
  nearby systems (e.g., in the same office or home network).

**5. Permutation Scanning**

- Each bot is assigned a unique pseudorandom permutation of the IP space
  to avoid overlapping scans and to efficiently divide the scanning
  task.

**🦠 Malicious Code Propagation Techniques**

Attackers use the following methods to propagate malware (e.g., the
botnet client) to newly discovered vulnerable systems:

**1. Central Source Propagation**

- The malware toolkit is hosted on a central server; infected systems
  download the toolkit from this source.

**2. Back-Chaining Propagation**

- The attack toolkit resides on the attacker’s system and is distributed
  directly to newly infected machines.

**3. Autonomous Propagation**

- The bot propagates itself automatically as soon as it finds a new
  vulnerable host, without relying on an external toolkit source.

**🧪 Examples of Botnet Malware**

**🔹 Blackshades NET**

- A remote access Trojan (RAT) used to create implants with customized
  obfuscation (Crypters).

- Includes access to an integrated underground marketplace for
  purchasing Crypters and extensions.

- Features include keylogging, webcam access, remote file manipulation,
  and DDoS launching.

**🔹 Other Botnets**

- **Cythosia Botnet**: Known for credential theft and browser
  manipulation.

- **Andromeda Bot**: Modular botnet focused on spreading other malware
  payloads.

- **Mirai Botnet**: Famous for infecting IoT devices and launching
  massive DDoS attacks by exploiting default credentials.

**🔹 PlugBot**

- A **hardware-based botnet tool** used in physical penetration testing.

- Often built on embedded hardware like a Raspberry Pi or other
  microcontroller, designed for **covert data exfiltration** and
  **network reconnaissance** after physical access is gained.

**💡 Summary**

| **Category** | **Description** |
|----|----|
| **Botnet** | Network of malware-infected machines under a single command-and-control (C2) infrastructure. |
| **Scanning Methods** | Techniques to identify and compromise new vulnerable systems. |
| **Propagation Techniques** | Methods to spread malware to new systems automatically or manually. |
| **Common Botnet Malware** | Blackshades, Mirai, Andromeda, PlugBot, etc. Each has unique characteristics and use cases (DDoS, RAT, data theft). |

Would you like this summarized into a **slide**, **one-pager**, or
**training handout**?

Here is a **reviewed, corrected, and clearly structured summary** of
your content on **DDoS Attacks**, with accurate definitions, examples,
and mitigation strategies. This version is also interview-friendly and
suitable for cybersecurity documentation or study guides.

------------------------------------------------------------------------

**✅ Reviewed & Summarized Explanation of DDoS Attacks**

------------------------------------------------------------------------

**🔹 What is a DDoS Attack?**

A **DDoS (Distributed Denial of Service)** attack is a **malicious
attempt to disrupt the normal traffic** of a targeted server, service,
or network by **overwhelming it with a flood of internet traffic**.
Unlike a DoS (Denial of Service) attack, which typically originates from
a single system, a **DDoS attack uses multiple compromised systems**
(often part of a botnet) to carry out the attack from many sources,
making mitigation more difficult.

------------------------------------------------------------------------

**🔹 Types of DDoS Attacks**

1.  **Flooding Attacks**

    - Attackers send **an excessive volume of traffic** to the target
      server.

    - The server becomes overwhelmed and **cannot respond to legitimate
      user requests**.

    - Common flooding techniques include:

      - **UDP Flood**

      - **SYN Flood**

      - **ICMP (Ping) Flood**

      - **HTTP Flood**

2.  **Crash Attacks**

    - Attackers exploit **software vulnerabilities or bugs** in the
      server or service.

    - This causes the target system to **crash or become unresponsive**.

    - Examples include:

      - **Teardrop Attack**

      - **Ping of Death**

      - **Malformed Packet Injection**

------------------------------------------------------------------------

**🔹 Common Forms of DoS/DDoS Attacks**

- **Buffer Overflow Attack**: Overflows memory buffers to crash systems.

- **ICMP (Ping) Flood**: Sends ICMP echo requests to consume bandwidth.

- **SYN Flood**: Exploits TCP handshake to exhaust resources.

- **Teardrop Attack**: Sends fragmented packets that the system fails to
  reassemble.

- **Smurf Attack**: Spoofs IP and sends ICMP packets to cause
  amplification.

------------------------------------------------------------------------

**🔹 How to Prevent or Mitigate DDoS Attacks**

1.  **Use Anti-DDoS Services**

    - Services like **Cloudflare**, **AWS Shield**, or **Azure DDoS
      Protection** analyze and mitigate attacks in real-time.

2.  **Firewalls and Routers**

    - Proper configuration can **block suspicious traffic** and
      **rate-limit requests**.

3.  **Load Balancing**

    - Distributes incoming traffic across multiple servers to **reduce
      strain** on any single resource.

4.  **Front-End Hardware**

    - Deploy intrusion prevention systems (IPS) or specialized **DDoS
      mitigation appliances** at the network perimeter.

5.  **Traffic Scrubbing Centers**

    - These **centralized filtering hubs** analyze traffic and **remove
      malicious packets** before they reach your servers.

6.  **Network Design and Architecture**

    - **Segregate network zones**, **limit broadcast traffic**, and
      ensure **redundancy** to enhance resilience.

7.  **Build a DDoS Response Plan**

    - Establish predefined steps and contacts to act **quickly when
      signs of attack appear**.

8.  **Understand Warning Signs**

    - Monitor for **latency spikes**, **intermittent website outages**,
      or **unusual traffic patterns**.

9.  **Consider DDoS-as-a-Service**

    - If your organization lacks in-house capability, consider
      **outsourcing** protection to specialized vendors.

------------------------------------------------------------------------

**🔹 Interview Questions and Answers Summary**

- **Q: What is a DDoS attack?**\
  A DDoS (Distributed Denial of Service) attack floods a target server
  with a massive amount of traffic from multiple sources, making it
  unavailable to legitimate users.

- **Q: How can you prevent DDoS attacks?**\
  Use anti-DDoS services, configure firewalls, implement load balancers,
  use scrubbing centers, and follow good network security practices.

- **Q: What’s the difference between DoS and DDoS?**\
  A **DoS** attack comes from a single source, while a **DDoS** attack
  is launched from multiple compromised systems (distributed).

------------------------------------------------------------------------

**🔹 Optional Add-On: What is a Designated Confirmer Signature?**

(Unrelated to DDoS – likely an out-of-place cryptography question.)

A **Designated Confirmer Signature** is a digital signature scheme where
**only a designated party (the confirmer)** can verify the validity of a
signature, and they can convince others of its validity **without
revealing the private key**.

------------------------------------------------------------------------

Let me know if you'd like this formatted as a professional document,
presentation slide summary, or DDoS playbook.

# Methods

**✅ DDoS (Distributed Denial of Service) Attack Methods — Summary &
Explanation**

**🔹 1. Botnets and Infection Techniques**

**Botnets**

- A botnet is a network of compromised systems ("bots") controlled by an
  attacker, often through malware.

- Botnets can range from thousands to millions of devices and are used
  to flood targets with traffic.

- **Example botnets**: Mirai, Andromeda, Blackshades, Cythosia, PlugBot
  (hardware-based).

**Bot Characteristics**

- Bots are automated programs used to perform repetitive tasks like
  crawling or spamming.

- In DDoS, bots execute coordinated floods or protocol abuses against
  victims.

**Scanning Methods for Propagation**

| **Method** | **Description** |
|----|----|
| **Random Scanning** | Random IP addresses probed for vulnerabilities. |
| **Hit-list Scanning** | Uses a precompiled list of likely vulnerable systems. |
| **Topological Scanning** | Uses knowledge of the local network topology from infected machines. |
| **Local Subnet Scanning** | Scans within the infected machine's subnet. |
| **Permutation Scanning** | Each bot uses a different pseudorandom list of IPs, avoiding overlap. |

**Malware Propagation Techniques**

| **Method** | **Description** |
|----|----|
| **Central Source Propagation** | Malware downloaded from a central server. |
| **Back-chaining** | Malware pushed directly from the attacker’s system. |
| **Autonomous Propagation** | Infected systems propagate the malware independently upon infection discovery. |

**🔹 2. Network Layer DDoS Attacks**

**SYN Flood (TCP State Exhaustion)**

- Exploits the **TCP three-way handshake** by sending SYN packets with
  **spoofed IPs**, filling up the server’s connection queue.

- **Impact**: Target system waits for completion of connection that
  never arrives, exhausting resources.

**Teardrop Attack**

- Sends fragmented IP packets with overlapping offsets, crashing the
  target OS due to improper reassembly handling (mostly affects older
  systems).

**Ping of Death**

- Sends oversized or malformed ICMP packets, causing buffer overflows
  and crashes.

**ICMP Flood**

- Sends excessive ICMP Echo Requests ("ping"), consuming bandwidth and
  resources.

- **Mitigation**: Rate-limiting, ICMP flood protection thresholds.

**UDP Flood**

- Sends large volumes of UDP packets to random ports, causing the server
  to respond with ICMP "Destination Unreachable" replies.

**DNS Amplification**

- Sends small DNS queries with spoofed source IPs (target's IP) to open
  DNS resolvers.

- The resolver sends large responses to the target, amplifying traffic
  volume significantly.

**🔹 3. Application Layer Attacks**

**Application Floods**

- Target the **application logic** (e.g., HTTP, login pages, search
  forms) rather than infrastructure.

- **Tools/Examples**:

  - **HTTP Flood**

  - **Slowloris**: Holds connections open to exhaust server resources.

  - **RUDY (R-U-Dead-Yet)**: Sends slow, incomplete POST requests.

**Tactics Include:**

- Excessive login attempts

- Malicious SQL queries

- Web scraping or file download abuse

**Zero-Day Attacks**

- Exploit previously unknown software vulnerabilities in applications,
  OS, or protocols.

**🔹 4. Volumetric Attacks**

**Bandwidth Consumption**

- Large-scale flooding of traffic to saturate network links (e.g.,
  gigabit traffic via botnets).

- **ICMP ECHO floods**, **UDP floods**, or **amplified reflection
  attacks** are typical techniques.

**Fragmentation Attacks**

- Sends fragmented packets that overwhelm the target’s reassembly
  buffer.

**Service Request Floods**

- Abuses protocols like TCP by initiating and dropping thousands of
  connections per second.

**🔹 5. Specialized DDoS Methods**

**Peer-to-Peer (P2P) Attacks**

- Exploits P2P clients (e.g., using DC++ protocol) by instructing them
  to flood a victim server with connection requests.

**Permanent DoS (PDoS / Phlashing)**

- Bricks or permanently damages devices by corrupting firmware using
  fake updates.

- **Impact**: Requires physical hardware replacement; cannot be fixed by
  rebooting.

**PlugBot Trojan**

- A covert penetration testing device used for physical botnet testing.
  Plugs into target environments for internal data exfiltration or DDoS.

**🔹 6. Reflected and Amplified DDoS**

**Distributed Reflection Denial of Service (DRDoS)**

- Attacker sends spoofed requests to legitimate servers, which in turn
  reflect amplified responses to the victim.

- **Examples**: DNS, NTP, Memcached amplification.

- **Benefits to attacker**:

  - Anonymity (uses intermediate servers)

  - Amplification (small input = large output)

**🔹 7. Summary of Common DDoS Techniques**

| **Attack Type** | **Target Layer** | **Effect** |
|----|----|----|
| SYN Flood | Network / Transport | Exhausts connection table on victim |
| UDP Flood | Network | Consumes bandwidth |
| HTTP Flood | Application | Drains web server resources |
| Slowloris / RUDY | Application | Starves HTTP sockets |
| ICMP Flood | Network | Overwhelms bandwidth & CPU cycles |
| DNS Amplification | Network | Uses reflection to amplify traffic |
| Teardrop, Ping of Death | Network | Crashes vulnerable OS |
| Service Request Flood | Network/Application | Exhausts server with rapid requests |
| Zero-Day DDoS | Any | Exploits unknown protocol/app flaws |
| P2P Attack (DC++ abuse) | Network | Redirects P2P clients to target |
| Permanent DoS (Phlashing) | Hardware/Firmware | Bricks devices via fake updates |
| DRDoS | Network | Reflected traffic hides attacker identity |

**🔹 Recommendations for Defense**

- **Use cloud-based DDoS protection services** (e.g., Azure DDoS
  Protection, AWS Shield, Cloudflare).

- **Rate-limit requests**, implement **WAFs** (Web Application
  Firewalls), and **Geo/IP-based filtering**.

- **Patch known vulnerabilities** to reduce Zero-Day and fragmentation
  attack vectors.

- Use **anomaly detection** to identify abnormal traffic patterns early.

DDoS attacks use botnets, which are groups of hacked devices controlled
by attackers, to overwhelm a target system with traffic from multiple
sources. There are different techniques to launch DDoS attacks:

- **Botnet Flood:** A large number of compromised devices bombard the
  target with traffic, overloading its resources.

- **Smurf Attack:** Spoofed IP addresses are used to send messages to a
  victim's IP address, causing the network to get flooded with
  responses.

- **TCP SYN Flood Attack:** Attackers send a massive amount of
  connection requests to the target system, leaving it stuck waiting for
  responses and unable to handle legitimate traffic.

- **Teardrop Attack:** Malformed packets are sent to the target, causing
  it to crash or malfunction.

- **Ping of Death Attack:** Oversized packets are sent to the target,
  crashing or freezing it.

These last two methods are less common as system vulnerabilities they
exploit have been patched.

A DDoS (Distributed Denial-of-Service) attack aims to disrupt a system
or network by overwhelming it with traffic from multiple sources. This
makes the system unavailable to legitimate users.

**DDoS Attack Methods:**

- **Botnets:** Large networks of compromised devices controlled by
  attackers to launch attacks.

- **Ping of Death Attack:** Sending malformed packets to crash the
  target system.

- **Smurf Attack:** Spoofing IP addresses to flood the victim with
  responses.

- **TCP SYN Flood Attack:** Overwhelming the target with connection
  requests.

- **Teardrop Attack:** Sending packets that cause the target to
  malfunction.

- **Application-Level Attacks:** Targeting specific applications to
  consume resources.

- **Bandwidth Attacks:** Flooding the network with traffic to exhaust
  bandwidth.

- **Distributed Reflection DoS (DrDoS):** Using intermediary servers to
  amplify the attack.

- **ICMP Flood Attack:** Overwhelming the target with ICMP echo
  requests.

- **Peer-to-Peer Attacks:** Exploiting peer-to-peer networks to launch
  attacks.

- **Permanent DoS Attacks:** Causing irreversible damage to the target
  system.

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

- DoS/DDoS attacks can be used to distract security personnel while
  other attacks are carried out.

- Web servers are common targets for DoS/DDoS attacks.

This comprehensive summary details various aspects of DDoS attacks,
including methods, tools, prevention strategies, and their impact.

**Botnets:**

- Networks of compromised devices controlled by attackers to launch DDoS
  attacks.

- Large botnets can include millions of devices and overwhelm target
  systems.

- Attackers use scanning methods to find vulnerable machines to build
  botnets.

- Malicious code is propagated to these machines using various
  techniques.

**DDoS Attack Methods:**

- **Network Layer Attacks:**

  - TCP SYN Floods: Exhaust target's connection queue with connection
    requests.

  - UDP Floods: Overwhelm target with User Datagram Protocol (UDP)
    packets.

  - ICMP Floods: Flood target with ICMP echo requests (ping).

  - DNS Amplification: Leverage vulnerable DNS servers to amplify attack
    traffic.

- **Application Layer Attacks:**

  - HTTP Floods: Overload target web servers with HTTP requests.

  - Slowloris/RUDY Attacks: Keep connections open without sending
    complete requests, exhausting resources.

  - Zero-Day Attacks: Exploit unknown vulnerabilities in applications or
    protocols.

- **Other Techniques:**

  - Smurf Attacks: Spoof victim's IP address to overwhelm them with
    responses.

  - Teardrop Attacks: Send malformed packets causing target systems to
    crash.

  - Ping of Death Attacks: Send oversized packets crashing target
    systems.

  - Permanent DoS Attacks: Cause irreversible damage to target hardware.

**DDoS Attack Effects:**

- Denial-of-Service: Legitimate users cannot access targeted system or
  service.

- Network Congestion: Overall network performance degrades.

- Financial Losses: Businesses lose revenue due to service downtime.

**DDoS Prevention Strategies:**

- Implement strong network security measures.

- Monitor for suspicious activity and warning signs.

- Utilize DDoS mitigation services.

- Have a DDoS response plan in place.

**Additional Points:**

- DoS attacks involve a single attacker source, while DDoS attacks are
  distributed.

- Botnet trojans like Blackshades and PlugBot are used to manage
  botnets.

- DDoS attacks can be used as distractions for other cyber attacks.

 

**3-Way Handshake and Denial-of-Service Attacks**

The three-way handshake is a fundamental process in establishing
reliable connections using the TCP protocol. Here's a breakdown:

1.  **SYN (Synchronize):** The client sends a packet with a
    synchronization flag to initiate a connection with the server.

2.  **SYN/ACK (Synchronize Acknowledge):** The server responds with a
    packet containing both SYN and ACK flags, acknowledging the client's
    request and indicating its readiness to connect.

3.  **ACK (Acknowledge):** Finally, the client sends an ACK packet
    confirming its receipt of the server's response, and the connection
    is established.

**Exploiting the Handshake for DoS Attacks:**

Attackers can exploit the three-way handshake to launch a
Denial-of-Service (DoS) attack known as a SYN flood attack. Here's how
it works:

1.  **Fake SYN Packets:** The attacker sends a large number of SYN
    packets to the target server, often with spoofed IP addresses.

2.  **Server Response:** The server, unaware of the attack, responds to
    each SYN packet with a SYN/ACK packet, allocating resources for a
    potential connection.

3.  **Missing ACK:** The attacker never sends the final ACK packet,
    leaving the server waiting for completion of the handshake for each
    connection.

4.  **Resource Exhaustion:** With a continuous stream of fake SYN
    packets, the server becomes overwhelmed, depleting resources
    (memory, processing power) to handle incomplete connections. This
    prevents the server from responding to legitimate connection
    requests, effectively denying service to real users.

**Key Points:**

- The DoS attack leverages the server's expectation of a complete
  handshake and its resource allocation for pending connections.

- By overwhelming the server with incomplete connections, the attacker
  cripples its ability to serve legitimate users.

**Mitigating SYN Flood Attacks:**

- **SYN Cookies:** Techniques like SYN cookies allow servers to
  acknowledge SYN requests without consuming as many resources.

- **Rate Limiting:** Limiting the number of incoming connections per IP
  address can help prevent attackers from overwhelming the server.

- **Resource Monitoring:** Continuously monitoring server resources and
  implementing automated actions can help detect and respond to DoS
  attacks.

Here is a **reviewed, corrected, and summarized** explanation of your
**DDoS Attack Methods** document, with improved grammar, organization,
and clarity for educational or professional use:

**✅ Summary: DDoS Attack Methods**

A **Denial-of-Service (DoS)** or **Distributed Denial-of-Service
(DDoS)** attack aims to **disrupt** the availability of a system,
network, or application by **overwhelming it with malicious traffic or
resource requests**. DDoS attacks often involve **botnets** and
**multiple attack vectors**.

**🔹 1. Categories of DDoS Attacks**

**a. Volumetric Attacks**

- **Goal**: Exhaust **bandwidth** of the target network.

- **Technique**: Flood the target with high volumes of data (e.g., ICMP,
  UDP floods).

- **Impact**: Network congestion; legitimate traffic is blocked.

**b. Fragmentation Attacks**

- **Goal**: Exploit packet fragmentation reassembly at the target.

- **Technique**: Send malformed or fragmented packets.

- **Impact**: Resource exhaustion and potential crashes.

**c. TCP State-Exhaustion Attacks**

- **Goal**: Exhaust state tables in infrastructure devices (e.g.,
  firewalls, load balancers).

- **Technique**: Abuse TCP session-handling processes.

- **Impact**: Devices cannot maintain new legitimate connections.

**d. Application Layer Attacks**

- **Goal**: Deplete application server resources (e.g., memory, CPU).

- **Technique**: Mimic legitimate HTTP requests, slow POST attacks, etc.

- **Impact**: Specific application becomes unavailable.

**🔹 2. DDoS Attack Techniques**

| **Technique** | **Description** |
|----|----|
| **Bandwidth Attacks** | Overwhelm total network bandwidth using botnets and ICMP floods. |
| **Service Request Floods** | Create excessive legitimate-looking service requests (TCP). |
| **SYN Flooding** | Exploit TCP handshake by sending SYN requests with spoofed IPs. |
| **ICMP Flood Attack** | Use ICMP Echo requests (pings) to consume bandwidth and processing power. |
| **Peer-to-Peer Attacks** | Redirect P2P clients to flood a target using file-sharing protocols. |
| **Application-Level Floods** | Target specific applications with high request volume or crafted inputs. |
| **Permanent DoS (PDoS)** | Physically damage or brick hardware via malicious firmware updates. |
| **Distributed Reflection DoS (DrDoS)** | Use third-party servers to reflect traffic to the victim (e.g., DNS amplification). |

**🔸 Detailed Attack Methods**

**✅ Bandwidth Attacks**

- **Botnets** flood a network with ICMP ECHO (ping) or UDP packets.

- Overwhelms routers/switches and consumes all available bandwidth.

**✅ Service Request Floods**

- Flood servers with valid-looking TCP connection setups/teardowns.

- Often involves **TCP handshake abuse** to exhaust server limits.

**✅ SYN Flooding**

- Exploits **TCP three-way handshake**:

  - Attacker sends SYNs with spoofed IPs.

  - Target sends SYN-ACK, waits for ACK that never arrives.

  - Victim’s **connection queue fills up**, blocking legitimate traffic.

- The TCP stack may hold these connections for **up to 75 seconds**.

**✅ ICMP Flood**

- Large volume of ICMP Echo Requests overwhelm the network stack.

- **Mitigation**: Rate-limit ICMP or use firewalls/threshold-based
  detection.

**✅ Peer-to-Peer (P2P) Attacks**

- Misuse P2P clients (e.g., DC++ protocol) to flood a target.

- Attackers act as a **"puppet master"** instructing clients to connect
  to the target.

**✅ Permanent Denial-of-Service (PDoS) / Phlashing**

- Uses **malicious firmware updates** or fake patches to **irreversibly
  damage hardware**.

- Also called **“bricking”** a device.

**✅ Application-Level Floods**

- Exhaust **application-layer resources**:

  - Excessive login attempts.

  - Malicious SQL queries to jam DB connections.

  - HTTP GET/POST floods.

- Often **mimics real user behavior**, making detection harder.

**✅ Distributed Reflection DoS (DrDoS)**

- **Uses spoofed requests** sent to legitimate third-party servers
  (e.g., DNS, NTP).

- These servers respond to the **spoofed (victim's) IP**, flooding the
  target.

- Amplification increases bandwidth efficiency of the attacker.

**✅ Corrections & Enhancements**

- Corrected grammar, technical inaccuracies, and formatting.

- Removed redundancy in SYN Flood explanation.

- Improved clarity in Peer-to-Peer and DrDoS descriptions.

- Explained impact and real-world examples where applicable.

**🛡️ Defense Considerations**

- **Rate-limiting**, **firewalls**, **Web Application Firewalls
  (WAFs)**, and **anomaly detection** are essential.

- Use **Azure DDoS Protection**, **AWS Shield**, or similar managed DDoS
  services in cloud environments.

- For on-premise, consider **scrubbing centers** and **anti-DDoS
  appliances**.

If you’d like this formatted into a **professional table or slide**, I
can generate that too.

# Tools 

Here’s your fully **reviewed**, **corrected**, **clarified**, and
**professionally summarized** version of the **DoS/DDoS Attack Tools**
overview, suitable for cybersecurity reports, awareness training, or
study guides.

------------------------------------------------------------------------

**✅ Reviewed & Corrected Version: DoS/DDoS Attack Tools**

These tools are used to perform **Denial-of-Service (DoS)** or
**Distributed Denial-of-Service (DDoS)** attacks. They generate
excessive network traffic or resource-intensive requests to **disrupt
target services**. While some are developed for testing and research,
many are abused in real-world cyberattacks.

------------------------------------------------------------------------

**🔹 1. Pandora DDoS Bot Toolkit**

- **Description**: Modernized version of the infamous Dirt Jumper botnet
  toolkit.

- **Key Attack Types**:

  - HTTP Min: Sends minimal HTTP requests to exhaust server threads.

  - HTTP Download: Triggers responses with large payloads to consume
    bandwidth.

  - HTTP Combo: A combination of different HTTP-based flood techniques.

  - Socket Connect: Opens numerous TCP connections to exhaust socket
    resources.

  - Max Flood: Sends the highest number of requests in the shortest
    time.

**Use case**: Seen in botnet-based DDoS campaigns due to its modular
nature.

------------------------------------------------------------------------

**🔹 2. Dereil & HOIC**

**Dereil**

- A multi-vector DDoS attack tool with TCP, UDP, and HTTP support.

- Supports customized attack patterns.

- Designed for more sophisticated, targeted testing or attacks.

**HOIC (High Orbit Ion Cannon)**

- GUI-based tool for launching web-based DDoS attacks.

- Target configuration includes:

  - IP address

  - Protocol (HTTP, TCP)

  - Port

- Supports “**boosters**” (scripts) to amplify attack strength.

**Note**: HOIC was popularized by hacktivist groups (e.g., Anonymous).

------------------------------------------------------------------------

**🔹 3. DoSHTTP & BanglaDos**

**DoSHTTP**

- **Platform**: Windows

- **Function**: Asynchronous HTTP flooder for DoS testing.

- **Features**:

  - URL validation

  - HTTP redirection

  - Custom port selection

  - Performance monitoring and reports

**BanglaDos**

- Region-specific tool allegedly created for HTTP-based DoS.

- **Documentation** is limited; it may be outdated or poorly maintained.

**Use with caution**: Verify source authenticity and legality before use
in labs.

------------------------------------------------------------------------

**🔹 4. AnDOSid (Mobile App)**

- **Platform**: Android

- Simulates **HTTP POST flood attacks** from mobile devices.

- Simple mobile-based attack tool designed for stress testing web
  servers.

**Limitation**: Limited functionality compared to desktop tools; more a
proof-of-concept.

------------------------------------------------------------------------

**🔹 5. LOIC (Low Orbit Ion Cannon – Android Version)**

- Mobile port of the well-known LOIC tool.

- Supports **basic TCP/UDP/HTTP flooding**.

- Very easy to use; often misused by amateurs.

- Historically used in digital protest campaigns.

**Security Note**: LOIC lacks anonymity and is easily traced.

------------------------------------------------------------------------

**✅ Summary Table: DDoS Tool Comparison**

| **Tool Name** | **Platform** | **Protocols** | **Attack Types** | **Notes** |
|----|----|----|----|----|
| **Pandora** | Windows/Linux | HTTP, TCP | HTTP flood, Socket flood | Successor to Dirt Jumper |
| **Dereil** | Cross-platform | TCP, UDP, HTTP | Multi-vector DDoS | Modern attack pattern support |
| **HOIC** | Windows | HTTP, TCP | HTTP Flood | Scriptable via "boosters" |
| **DoSHTTP** | Windows | HTTP | HTTP Flood | GUI + reporting features |
| **BanglaDos** | Unknown | Presumed HTTP | HTTP Flood | Poorly documented, region-specific |
| **AnDOSid** | Android | HTTP | HTTP POST Flood | Mobile-based DDoS simulation |
| **LOIC (Android)** | Android | TCP, UDP, HTTP | Basic Flood | Used in hacktivist ops, low sophistication |

------------------------------------------------------------------------

**⚠️ Clarification Notes**

- All tools mentioned are **illegal to use without explicit
  authorization**. They should be restricted to **lab environments** and
  **security research**.

- Many tools are still leveraged in **low-skill** or **script-kiddie**
  attacks but are detected by modern DDoS protection mechanisms.

- Professional testers and defenders should prefer **controlled testing
  suites** like LOIC/HOIC in **isolated labs only**.

------------------------------------------------------------------------

**✅ Summary for Cybersecurity Use**

These tools are useful to understand:

- The evolution of DDoS toolkits

- The difference between **amateur-level** and **sophisticated** attacks

- Attack vectors defenders need to prepare against (HTTP flood, socket
  exhaustion, multi-protocol abuse)

------------------------------------------------------------------------

Let me know if you’d like this content reformatted into:

- A **slide deck**

- A **penetration testing guide**

- A **DDoS mitigation workshop module**

- Or with **KQL/Sentinel** detections for Azure monitoring environments.

# DDoS Protection

How Azure DDoS protection works?

DDoS Protection Standard monitors actual traffic utilization and
constantly compares it against the thresholds defined in the DDoS
policy. When the traffic threshold is exceeded, DDoS mitigation is
automatically initiated. When traffic returns to a level below the
threshold, the mitigation is removed. During mitigation, DDoS Protection
redirects traffic sent to the protected resource and performs several
checks, including:

- Helping ensure that packets conform to internet specifications and are
  not malformed.

- Interacting with the client to determine if the traffic might be a
  spoofed packet (for example, using SYN Auth or SYN Cookie or dropping
  a packet for the source to retransmit it).

- Using rate-limit packets if it cannot perform any other enforcement
  method.

Within a few minutes of attack detection, you will be notified with
Azure Monitor metrics. Azure Monitor retains metric data for DDoS
Protection Standard for 30 days.

Types of DDoS attacks that Azure DDoS protection mitigates

- **Volumetric attacks:** UDP floods, amplification floods, and other
  spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other
  protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations,
  SQL injection, cross-site scripting and other layer 7 attacks

## DDoS Attack

Attack that has the goal of preventing access to services or systems
(Availability).

Botnet owners use them for Spamming, DDoS, Data storage and various
other actions.

Botnets are collection of interconnected systems and used without owner
knowledge.

If attack launched from multiple locations the it is called Distributed
DoS attack.

If attack launched from one location, then it is called Denial of
Service attack.

## Best practices

Secure application development

- **Scalability** - Ability of a system to handle increased load

- **Availability** - Proportion of time that a system is functional and
  working

- **Resiliency** - Ability of a system to recover from failures and
  continue to function

- **Management** - Operations processes that keep a system running in
  production

- **Security** - Protecting applications and data from threats

Design application to scale horizontally

- If your application depends on a single instance of a service, it
  creates a single point of failure.

- Provisioning multiple instances makes your system more resilient and
  more scalable.

Design layers of security defenses in application

- Reduce the surface area by using IP allowlists to close the exposed IP
  address space and listening ports that are not needed on the load
  balancers.

- ‎You can also use NSGs (Service tag, ASG) to reduce the attack surface.

Azure DDoS protection service tiers:

| Basic | Standard |
|----|----|
| Automatically enabled as part of the Azure platform | DDoS Protection Standard is simple to enable, and requires no application changes. |
| Always-on traffic monitoring, and real-time mitigation of common network-level attacks, provide the same defenses utilized by Microsoft's online services. | Protection policies are tuned through dedicated traffic monitoring and machine learning algorithms. |
| The entire scale of Azure's global network can be used to distribute and mitigate attack traffic across regions. | Policies are applied to public IP addresses associated to resources deployed in virtual networks, such as Azure Load Balancer, Azure Application Gateway, and Azure Service Fabric instances, but this protection does not apply to App Service Environments. |
| Protection is provided for IPv4 and IPv6 Azure public IP addresses. | Real-time telemetry is available through Azure Monitor views during an attack, and for history |
|   | Rich attack mitigation analytics are available via diagnostic settings |

 

 

## Perimeter security

How Azure denial-of-service protection works?

- DDoS Protection Standard monitors actual traffic utilization and
  constantly compares it against the thresholds defined in the DDoS
  policy.

- When the traffic threshold is exceeded, DDoS mitigation is
  automatically initiated.

- When traffic returns to a level below the threshold, the mitigation is
  removed.

- During mitigation, DDoS Protection redirects traffic sent to the
  protected resource and performs several checks, including:

  - Helping ensure that packets conform to internet specifications and
    are not malformed.

  - Interacting with the client to determine if the traffic might be a
    spoofed packet (for example, using SYN Auth or SYN Cookie or
    dropping a packet for the source to retransmit it).

  - Using rate-limit packets if it cannot perform any other enforcement
    method.

- Within a few minutes of attack detection, you will be notified with
  Azure Monitor metrics.

- Azure Monitor retains metric data for DDoS Protection Standard for 30
  days.

Types of DDoS attacks that Azure DDoS protection mitigates

- **Volumetric attacks:** UDP floods, amplification floods, and other
  spoofed-packet floods (Multiple GB attacks)

- **Protocol attacks**: SYN flood attacks, reflection attacks, and other
  protocol attacks

- **Resource (Application) layer attacks**: HTTP protocol violations,
  SQL injection, cross-site scripting, and other layer 7 attacks

>  
>
>  

# Azure DDoS Protection

>  
>
> **What is Azure DDoS Protection**

- It is Azure service used to filter large scale attacks before they can
  cause denial of service.

## SKU

**🔐 Azure DDoS Protection Service Tiers**

| **Feature** | **Basic Tier** | **Standard Tier** |
|----|----|----|
| **Availability** | Automatically enabled for all Azure users | Requires manual enablement per virtual network |
| **Traffic Monitoring & Mitigation** | Always-on monitoring; real-time mitigation of common network-level attacks using Microsoft's platform-wide defenses | Tailored protection policies using machine learning and customer-specific traffic profiles |
| **Scope of Protection** | Leverages Azure's global scale to absorb attacks across regions | Protects public IPs of services within virtual networks (e.g., Load Balancer, Application Gateway, Service Fabric). *Excludes App Service Environments* |
| **IP Versions Covered** | IPv4 & IPv6 public Azure IPs | IPv4 & IPv6 public Azure IPs |
| **Telemetry & Analytics** | Not available | Real-time telemetry in Azure Monitor during attacks; historical data; detailed analytics through diagnostic settings |
| **Custom Configurations** | Not configurable | Policy tuning and alerting based on learned traffic patterns |

**🧠 Summary**

- **Basic** protection is included with every Azure subscription,
  requiring no setup. It protects against common DDoS attacks at the
  platform level.

- **Standard** protection offers advanced capabilities like adaptive
  tuning via machine learning, real-time visibility, and analytics. It’s
  ideal for production workloads requiring higher resilience and
  insight.

## Features

**✅ Summary: Azure DDoS Protection Features**

**Azure DDoS Protection** helps safeguard applications hosted on Azure
from Distributed Denial of Service (DDoS) attacks by automatically
detecting and mitigating various attack types.

**🎯 Key Types of DDoS Attacks Mitigated**

| **Category** | **Description** | **Example Attacks** |
|----|----|----|
| **Volumetric Attacks** | Overwhelm the network’s bandwidth by flooding it with traffic. | \- UDP floods\<br\>- Amplification attacks\<br\>- Spoofed-packet floods |
| **Protocol Attacks** | Exploit weaknesses in layer 3 and 4 protocols to disrupt connection state tables. | \- SYN floods\<br\>- Reflection attacks |
| **Application (Layer 7) Attacks** | Target the application layer by exhausting resources or exploiting vulnerabilities. | \- HTTP protocol violations\<br\>- SQL Injection\<br\>- Cross-Site Scripting (XSS) |

**🔍 Notes**

- The content included multiple repetitions, all listing the same attack
  types. These are now consolidated.

- Formatting is standardized for clarity and readability.

- The sentence “Protects Azure-hosted applications…” is incorporated
  into the introduction to reduce redundancy.

## Best practices

**✅ Azure DDoS Protection – Best Practices**

**1. Secure Application Development Principles**

To ensure applications are robust against DDoS attacks, incorporate the
following foundational characteristics:

| **Characteristic** | **Description** |
|----|----|
| **Scalability** | Design your system to handle increased traffic without degradation. |
| **Availability** | Maximize uptime; ensure systems remain functional even under stress. |
| **Resiliency** | Architect for graceful recovery from service disruptions or failures. |
| **Management** | Implement consistent operations processes and monitoring in production. |
| **Security** | Secure both infrastructure and application layers to protect against threats, including DDoS. |

**2. Horizontal Scalability and Redundancy**

DDoS attacks often aim to exhaust system resources. Combat this by:

- **Avoiding single points of failure**: Services or workloads relying
  on a single VM or instance are vulnerable.

- **Provisioning multiple instances**: Use auto-scaling and load
  balancing to distribute load across multiple resources.

- **Deploying across zones/regions**: Use Azure Availability Zones or
  multiple regions for geographic redundancy.

**3. Defense in Depth with Network Layer Security**

Reduce your attack surface by layering protections at different network
levels:

- **IP Allowlisting**:

  - Restrict access to trusted IP ranges only.

  - Close unused IP address space and non-essential listening ports,
    especially on load balancers.

- **Use Network Security Groups (NSGs)**:

  - Implement **Service Tags** (e.g., Internet, AzureLoadBalancer) to
    define traffic scopes.

  - Use **Application Security Groups (ASGs)** to group VMs by function
    and apply fine-grained access controls.

- **Segment networks using Azure Virtual Network (VNet) peering and
  subnets**, so traffic flows can be tightly controlled.

**4. Enable and Configure Azure DDoS Protection Properly**

Azure provides two tiers:

- **Basic (default)**: Automatically enabled for all Azure public IPs.

- **Standard (recommended)**: Offers adaptive tuning, telemetry, and
  integration with **Azure Monitor** and **Microsoft Sentinel**.

**Best practices for DDoS Standard:**

- Enable on **Virtual Networks** with internet-facing endpoints.

- Integrate alerts with monitoring tools (e.g., Log Analytics).

- Use **DDoS Protection Plans** across multiple VNets (within the same
  tenant and region).

- Review and test **runbooks for incident response** (e.g., scaling
  plans, traffic rerouting).

**🔒 Summary of Core Best Practices**

| **Category** | **Best Practices** |
|----|----|
| **Development** | Build for scale, availability, resiliency, secure coding, and operational readiness. |
| **Architecture** | Use horizontal scaling, multiple instances, and eliminate single points of failure. |
| **Network Security** | Minimize exposure using IP allowlists, NSGs, ASGs, and port restrictions. |
| **DDoS Configuration** | Use DDoS Protection Standard, monitor traffic, and plan incident response. |

**🚨 Additional Recommendations**

- Use **Web Application Firewall (WAF)** with Azure Front Door or
  Application Gateway to block Layer 7 (HTTP/S) attacks.

- Regularly **test and simulate** DDoS scenarios to validate
  preparedness.

- Monitor **cost impacts**—autoscaling and bandwidth usage during DDoS
  can generate extra costs. Azure offers **cost protection** with DDoS
  Standard.

## How it works?

**🛡️ How Azure DDoS Protection Works**

Azure DDoS Protection (specifically the **Standard** tier) is designed
to automatically detect and mitigate distributed denial-of-service
(DDoS) attacks targeting your Azure resources.

**🔍 1. Always-On Monitoring**

- Continuously monitors **real-time traffic** to your Azure resources.

- Compares traffic patterns against **adaptive thresholds** defined in
  your DDoS policy.

**🚨 2. Automatic Mitigation**

- If traffic exceeds the threshold, **mitigation is triggered
  automatically**.

- Once traffic normalizes, mitigation is **automatically stopped**.

**🔄 3. Traffic Scrubbing During Mitigation**

When mitigation is active, Azure:

- **Validates packets** to ensure they conform to internet standards
  (e.g., not malformed).

- **Detects spoofed traffic** using techniques like:

  - **SYN Authentication**

  - **SYN Cookies**

  - **Packet retransmission challenges**

- **Rate-limits** traffic if other methods aren’t effective.

**📊 4. Attack Detection & Reporting**

- Azure Monitor provides **metrics and alerts** within minutes of attack
  detection.

- These metrics are **retained for 30 days** for analysis and auditing.

**✅ Summary**

| **Feature** | **Description** |
|----|----|
| **Traffic Monitoring** | 24/7 adaptive monitoring of traffic patterns |
| **Mitigation Trigger** | Automatic when thresholds are breached |
| **Mitigation Techniques** | Packet validation, spoof detection, rate limiting |
| **Notification** | Alerts via Azure Monitor within minutes |
| **Data Retention** | Metrics stored for 30 days |

**💡 Best Practice Tip**

Combine Azure DDoS Protection with **secure app design** and **Web
Application Firewall (WAF)** for full-stack protection—from network
(Layer 3/4) to application layer (Layer 7).

>  

## Azure DDoS Protection

**What is a DDoS Attack?**

A DDoS attack aims to overwhelm a system with traffic, making it
unavailable to legitimate users. It can be launched from a single
location (DoS) or from multiple locations (Distributed DoS) using
botnets (collections of compromised devices).

**Azure DDoS Protection Service:**

- Offers two tiers: Basic (free, always-on) and Standard (advanced
  features).

- Protects against various DDoS attacks, including volumetric attacks,
  protocol attacks, and resource layer attacks.

**Best Practices for DDoS Mitigation:**

- Secure application development.

- Design for scalability and resiliency (ability to handle increased
  load and recover from failures).

- Implement layers of security defenses, including:

  - **Scaling horizontally:** Use multiple instances of a service to
    avoid single points of failure.

  - **Reducing attack surface:** Limit exposed IP addresses and ports
    with IP allowlists and Network Security Groups (NSGs).

**Azure DDoS Protection Standard Features:**

- Always-on traffic monitoring and real-time mitigation.

- Machine learning-based protection policies tuned for optimal defense.

- Utilizes the global Azure network to distribute and mitigate attack
  traffic.

- Protects public IP addresses associated with resources like Azure Load
  Balancer and virtual networks.

- Provides real-time telemetry and attack analytics during and after an
  attack.

# Prevention

**Primary Objective**

Proactively **prevent**, **mitigate**, and **respond** to DDoS attacks
on Azure infrastructure while protecting both primary and secondary
victims of attack impact.

**🔐 Prevention Strategies**

1.  **Develop a DDoS Response Plan**

    - Define roles, escalation paths, and mitigation workflows.

    - Test via simulations and tabletop exercises.

    - Integrate with Azure DDoS Protection Standard and Azure Monitor.

2.  **Employ Basic Network Security**

    - Harden edge systems using NSGs, Azure Firewall, and WAF.

    - Enforce least-privilege access, use secure protocols, and segment
      networks.

3.  **Maintain Strong Network Architecture**

    - Use redundancy and geo-distribution (e.g., Azure Front Door,
      Traffic Manager).

    - Implement rate limiting and IP filtering at the perimeter.

4.  **Understand Warning Signs**

    - Monitor for early indicators like latency spikes, application
      timeouts, and bandwidth saturation.

    - Use Azure Sentinel, Log Analytics, and network traffic analytics.

5.  **Consider DDoS Protection-as-a-Service**

    - Use **Azure DDoS Protection Standard** with auto-tuning thresholds
      and real-time telemetry.

    - Consider third-party scrubbing services for hybrid or multicloud
      deployments.

**🛠️ DDoS Countermeasure Strategies**

**1. Absorbing the Attack**

- Increase bandwidth and resource allocation to absorb attack traffic.

- Requires advance planning, additional cost, and scalable architecture
  (e.g., autoscaling in Azure).

**2. Degrading Non-Critical Services**

- Prioritize mission-critical services and disable others to preserve
  core operations.

**3. Shutting Down Services**

- As a last resort, take all systems offline to preserve infrastructure
  integrity and data.

- Coordinate with incident response and communication teams.

**🌐 Protecting Secondary Victims**

DDoS attacks can indirectly impact users, partners, and connected
devices. Mitigation steps include:

- **Security Hygiene**

  - Deploy up-to-date anti-virus and anti-malware software.

  - Regularly patch all systems and enforce endpoint hardening.

- **User Awareness**

  - Educate stakeholders on DDoS risks and social engineering vectors.

  - Train users to avoid malicious attachments, suspicious links, and
    unsafe apps.

- **System Hardening**

  - Disable unnecessary services.

  - Remove unused applications.

  - Secure configurations for OS, applications, firewalls, and access
    controls.

- **Additional Considerations**

  - **Encryption:** Use AES-256, TLS 1.2+, and WPA2+ for secure data
    communication.

  - **Vulnerability Scanning:** Regularly scan internal and external
    systems.

  - **Input Validation:** Sanitize user input to prevent injection
    attacks.

  - **Secure Remote Access:** Use VPNs, strong authentication, and
    just-in-time (JIT) access.

**🕵️ Post-Attack Forensics & Continuous Improvement**

**1. Analyze Attack Data**

- **Traffic Patterns:** Identify volumetric, protocol, or
  application-layer anomalies.

- **Log Review:** Analyze Azure Firewall, NSG logs, IDS/IPS, and Azure
  Monitor.

**2. Enhance Future Countermeasures**

- Use identified patterns to fine-tune filters, throttling rules, and
  firewall settings.

- Implement adaptive traffic filtering policies and application-layer
  firewalls.

**3. Collaboration & Documentation**

- Work closely with ISPs, Azure support, and legal teams.

- Document:

  - Timeline and scope of the attack

  - Response actions taken

  - Infrastructure and service impact

  - Lessons learned and future defense recommendations

**🔎 Advanced Defensive Tactics**

**🧨 Detect & Neutralize Botnet Handlers**

- **Traffic Analysis:** Detect control traffic from handlers to infected
  agents.

- **Handler Neutralization:** Disrupt control nodes to cripple large
  numbers of botnet clients.

- **Spoofed IP Filtering:** Identify and block spoofed IPs based on
  subnet validation.

**🪤 Deflection Techniques**

- **Honeypots:**

  - **Low-Interaction:** Emulate services with limited interaction
    (safer).

  - **High-Interaction:** Deploy real systems with vulnerabilities to
    study attacker behavior.

  - Example Tool: **KFSensor** – a Windows honeypot/IDS platform.

- **Defense in Depth:**

  - Deploy **multiple layers of IDSes and honeypots** to observe and
    redirect malicious traffic.

**🚦 Attack Mitigation Techniques**

**1. Load Balancing**

- Distribute traffic across multiple servers and regions (Azure Load
  Balancer, Front Door).

- Auto-scale services to handle demand spikes.

**2. Traffic Throttling**

- Use routers and gateways to control max inbound request rates per
  source/IP.

- Helps reduce impact while maintaining some service availability.

**3. Request Dropping**

- Drop excess or malformed packets during heavy load to preserve server
  capacity.

- Apply rate-limiting at WAFs, API gateways, and load balancers.

**📘 Summary Table: Azure DDoS IR Prevention and Countermeasures**

| **Category** | **Examples / Tools** |
|----|----|
| **Planning** | Azure DDoS Protection Plan, IR Playbooks, Azure Policy |
| **Detection** | Azure Monitor, Sentinel, Log Analytics, NSG Flow Logs |
| **Mitigation** | Azure Front Door, Traffic Manager, Auto-scaling, WAF, NSGs |
| **Post-Attack Forensics** | Firewall logs, DDoS telemetry, packet capture, attack timeline documentation |
| **Advanced Defense** | Honeypots (KFSensor), handler neutralization, spoofed IP blocking |
| **ISP/External Support** | DDoS scrubbing centers, clean-pipe services, law enforcement coordination |

Let me know if you'd like this content formatted as a **PDF report**,
**PowerPoint presentation**, or as a **policy/procedure document** for
internal use.

Here is a **comprehensive, reviewed, summarized, corrected, and
professionally explained version** of your **DDoS Prevention and
Post-Attack Forensics** guidance, tailored for an **Azure environment**
and incorporating best practices across multiple layers:

**🛡️ DDoS Prevention & Post-Attack Forensics – Azure Incident Response**

**🔐 Section 1: DDoS Prevention Techniques**

**✅ 1. Strategic Defense Preparation**

- **Build a DDoS Response Plan:** Include Azure-specific escalation,
  runbooks, and service-level auto-remediation.

- **Integrate Azure DDoS Protection Standard:** Provides real-time
  detection, automatic mitigation, and attack analytics.

- **Enable Logging and Monitoring:** Use **Azure Monitor**, **Network
  Watcher**, and **Log Analytics** for flow logging and alerts.

- **Test Incident Response Plans:** Conduct tabletop exercises and
  simulate DDoS events using red team/blue team scenarios.

**🚨 Section 2: Botnet & Traffic-Based Countermeasures**

**🦠 Botnet Defense Techniques**

| **Technique** | **Description** |
|----|----|
| **RFC 3704 Filtering** | Filters spoofed traffic from unused/reserved IPs at the ISP edge. |
| **Cisco IPS Source IP Reputation** | Blocks traffic from known malicious IPs using updated threat intelligence. |
| **IP Source Guard (Cisco/Router-based)** | Validates IP source integrity via DHCP snooping to block spoofed traffic. |
| **Black Hole Filtering** | Redirects or drops attack traffic at the routing level without notifying the attacker. |

**🌐 DDoS Protection at ISP Level**

- **Clean-Pipe Services:** ISPs scrub attack traffic before it hits your
  network.

- **Traffic Redirection:** Redirect traffic to cloud-based mitigation
  centers during attacks.

- **IP Swapping & DNS Propagation:** Change public-facing IPs and update
  DNS records after mitigation if necessary.

**🧪 Section 3: Post-Attack Forensics**

**🔍 Traffic Pattern Analysis**

- Analyze packet attributes (TTL, protocol type, payload size, etc.).

- Identify signature patterns (e.g., SYN flood, UDP amplification).

- Use this to refine:

  - **Load balancing policies**

  - **Throttling thresholds**

  - **WAF or NSG rules**

**📊 Log and Telemetry Review**

- **Router/Firewall/IDS Logs:** Identify origin, attack type, and peak
  traffic.

- **Azure Resources:** Use **Azure NSG Flow Logs**, **DDoS Diagnostic
  Logs**, and **Traffic Analytics**.

- **Correlate with ISP** for traceback and legal escalation.

**👥 Section 4: Protecting Secondary Victims**

DDoS attacks can spill over to end users, other services, or partners.
Countermeasures include:

**🔒 System Hardening**

- Disable unused services.

- Remove obsolete applications.

- Patch systems and update OS, firmware, and software (e.g., kernel
  updates).

**🛠️ Security Controls**

- Install and regularly update anti-virus/anti-malware software.

- Enable personal firewalls and system-level protections.

- Deny unnecessary ICMP and service port-based traffic (reflective DDoS
  protection).

**🌍 Network & Access Protection**

- Enforce **strong encryption** (WPA2, AES-256) on wireless and
  broadband links.

- Secure remote admin protocols (SSH, RDP) using MFA, VPNs, or JIT
  access.

**👥 User Awareness & Input Validation**

- Educate users on safe email/web practices.

- Implement strict input validation in applications to prevent malformed
  payload exploitation (e.g., gets() or strcpy() vulnerabilities).

**🧨 Section 5: Detect and Neutralize Botnet Handlers**

**🔍 Detection**

- Use **network traffic analysis** to find communication between botnet
  controllers (handlers) and infected clients (agents).

- Focus on unusual C2 behavior, odd ports, regular beacons.

**🛑 Neutralization**

- Identify and block/disable handlers; even a few handler disruptions
  can cripple an entire botnet’s effectiveness.

- Analyze spoofed source IPs and block based on subnet anomalies.

**🎯 Section 6: Deflection and Mitigation Techniques**

**🪤 Honeypots**

- **Low-Interaction Honeypots:** Emulate services to trick and log
  attacker behavior.

- **High-Interaction Honeypots (e.g., honeynets):** Run real services to
  study in-depth attacks.

- **Example:** **KFSensor** for Windows honeypot deployments.

**🧱 Defense-in-Depth Architecture**

- Deploy **intrusion detection systems (IDSes)** across network layers.

- Route suspicious traffic to honeypots for analysis instead of
  production services.

**🚦 Section 7: Active Mitigation Measures**

| **Strategy** | **Description** |
|----|----|
| **Load Balancing** | Use Azure Load Balancer or Azure Front Door to distribute traffic and absorb load spikes. |
| **Throttling** | Limit requests per IP/session to reduce server overload. Helps prioritize legitimate users. |
| **Request Dropping** | Drop packets selectively during peak traffic loads based on predefined logic (e.g., SYN packet limits). |

**🧰 Section 8: Cisco-Specific Mitigation: TCP Intercept**

Use **Cisco IOS TCP Intercept** to protect TCP-based services from SYN
floods:

**Configuration Steps:**

access-list 101 permit tcp any any eq 80

ip tcp intercept list 101

ip tcp intercept mode intercept ! or use 'watch'

- **Intercept Mode:** Actively intercepts and validates handshake before
  allowing connection.

- **Watch Mode:** Passively monitors for SYN flood symptoms.

**📘 Summary Table: Azure DDoS Prevention & Response Enhancements**

| **Component** | **Tool/Technique** |
|----|----|
| **Detection** | Azure Monitor, Network Watcher, Sentinel |
| **Mitigation** | Azure DDoS Protection, Load Balancer, Throttling |
| **Forensics** | NSG Flow Logs, Firewall Logs, IDS, ISP Traceback |
| **Botnet Defense** | RFC 3704, Cisco IPS, IP Source Guard |
| **User Protection** | AV Software, System Hardening, Secure Remote Access |
| **Deception Tactics** | KFSensor, Honeypots, Traffic Redirection |
| **Hardware-level Mitigation** | TCP Intercept, IP ACLs, DHCP-based filtering |

Here is a **reviewed, summarized, and corrected** version of your **DDoS
Attack Incident Response in Azure Environments**. The structure below
improves clarity, categorization, and correctness, while preserving all
key points and aligning with Azure-specific best practices.

**DDoS Attack Incident Response in Azure Environments**

**1. DDoS Prevention**

**Secure Application Design Principles**

- **Scalability:** Build systems that handle increased load gracefully.

- **Availability:** Ensure services remain operational over time.

- **Resiliency:** Design for fault tolerance and self-recovery.

- **Manageability:** Maintain efficient operational support and
  monitoring.

- **Security:** Minimize vulnerabilities in apps and infrastructure.

**Best Practices**

- **Horizontal Scaling:** Avoid single points of failure by provisioning
  multiple service instances.

- **Defense-in-Depth:** Use multiple security layers.

  - Use **IP allowlists** to limit exposed IP space.

  - Apply **NSGs** (with service tags and ASGs) to restrict traffic
    flow.

  - Leverage **Azure Firewall**, **WAF**, and **Application Gateway** to
    further reduce the attack surface.

**2. Detection & Mitigation Techniques**

**Traffic Anomaly Detection**

- **Activity Profiling:** Analyze baseline packet rates for known
  network flows.

- **Wavelet Signal Analysis:** Detect deviations in traffic
  frequency/time components.

- **Changepoint Detection:**

  - Use statistical methods (e.g., **CUSUM**) to detect traffic shifts.

  - Effective for identifying worm scanning or sudden DoS behavior.

**Azure-native Detection Tools**

- **Azure DDoS Protection Standard:**

  - Automatic detection and mitigation.

  - Real-time telemetry integration with **Microsoft Sentinel**.

- **Network Watcher** and **Traffic Analytics:** Help monitor and detect
  abnormal traffic patterns.

**3. Response & Countermeasures**

**DDoS Response Strategies**

- **Absorb the Attack:** Use **auto-scaling**, **traffic distribution**,
  and **load balancers** to absorb excess load.

- **Degrade Gracefully:** Prioritize and disable non-critical services
  during an attack.

- **Isolate or Shut Down Services** only when absolutely necessary.

**Traffic Management**

- **Throttling:** Rate-limit connections at routers/gateways.

- **Drop Requests:** Drop malicious packets using NSG or firewall rules.

- **TCP Intercept (Cisco/Network Devices):**

  - Actively intercept or passively monitor TCP SYN floods.

**Deflect Attacks**

- **Honeypots:**

  - **Low-Interaction Honeypots:** Simulated services for detection.

  - **High-Interaction Honeypots:** Real vulnerable services for
    research.

- **KFSensor:** Windows-based honeypot IDS tool.

**4. Protecting Secondary Victims**

**Device & User-Level Defenses**

- Update antivirus/antimalware.

- Harden systems (OS, firewall, software).

- Disable unused services and ports.

- Use strong encryption (e.g., **AES-256**, **WPA2**).

- Secure remote access (MFA, IP restrictions).

**5. Botnet Mitigation Techniques**

**ISP-Level Filtering**

- **RFC 3704 Filtering:** Drop spoofed/bogus source IP traffic.

- **Blackhole Filtering:** Drop attack traffic at upstream routers
  without notifying sender.

- **Source IP Reputation:** Use updated threat intel (e.g., Cisco IPS
  reputation feeds).

**Azure Tools**

- Enable **Azure DDoS Protection** with telemetry sent to **Log
  Analytics** and **Sentinel**.

- Use **Just-In-Time (JIT) VM Access** to reduce attack surface.

**6. Attack Detection and Containment**

**Handler & Bot Detection**

- **Network Analysis:** Detect C&C traffic patterns to isolate
  compromised nodes.

- **Neutralize Handlers:** Remove few key botnet controllers to disable
  many agents.

**Filtering & Inspection**

- **Ingress Filtering:** Drop spoofed packets from external sources.

- **Egress Filtering:** Prevent internal spoofed or botnet traffic from
  exiting.

- **Validate Packets:** Use deep packet inspection (DPI) where needed.

**7. Mitigation Techniques**

**Load Management**

- **Load Balancing:** Distribute traffic among multiple
  servers/services.

- **Throttling:** Rate-limit excessive request flows.

- **Auto-Scaling:** Auto-provision extra resources during traffic
  spikes.

**8. Post-Attack Forensics**

- Analyze **Azure NSG flow logs**, **Azure Firewall logs**, and **WAF
  logs**.

- Identify attack vectors, IPs, and packet behavior.

- Collaborate with **ISPs and law enforcement** to trace source IPs.

- Update:

  - Filtering rules.

  - Load-balancing thresholds.

  - NSG/firewall DDoS protections.

  - Sentinel alerts based on observed patterns.

**9. Additional Technical Countermeasures**

- Block **ICMP** externally unless required.

- Patch all systems (especially OS kernel).

- Disable insecure functions (e.g., gets(), strcpy() in code).

- Validate all user inputs.

- Use **Azure Policy** to enforce secure configurations.

**10. ISP & Infrastructure-Level Protection**

- Many ISPs provide **in-the-cloud DDoS protection**.

- Redirect traffic to ISP scrubbing centers.

- After mitigation, restore services to a clean IP and update DNS.

**11. Example Configuration (Cisco TCP Intercept)**

access-list 100 permit tcp any any eq 80

ip tcp intercept list 100

ip tcp intercept mode intercept

- **Intercept mode:** Actively handles all TCP connection attempts.

- **Watch mode:** Monitors connection rates for anomalies.

**Summary**

| **Phase** | **Objective** | **Actions** |
|----|----|----|
| Preparation | Harden and scale systems | NSG, load balancing, auto-scaling, DDoS protection |
| Detection | Spot abnormal traffic | Profiling, wavelet/CUSUM, Azure Monitor |
| Containment | Limit attack impact | Throttling, honeypots, ingress/egress filtering |
| Mitigation | Maintain service availability | Load balancing, service degradation, blackhole filtering |
| Post-Attack | Forensics and recovery | Log review, IP tracebacks, update countermeasures |

Let me know if you'd like this structured into a presentation or
formatted into a Word/PDF incident response guide.

# Incident Response

## Preparation

Here’s a **reviewed, corrected, and professionally summarized** version
of your **DDoS Attack Incident Response: Preparation Phase in an Azure
Environment**.

------------------------------------------------------------------------

**DDoS Incident Response on Azure – Preparation Phase**

**Purpose of the Preparation Phase**

To **minimize response time and impact** during a DDoS attack by
proactively establishing:

- Key contacts

- Clear procedures

- Complete infrastructure visibility

- Resilient architecture and backup strategies

------------------------------------------------------------------------

**1. ISP Coordination and Support**

**Objective:** Ensure external communication and mitigation are swift
and effective.

**Key Actions:**

- **Understand ISP capabilities:** Document available DDoS protection
  options (free/paid), escalation paths, and expected SLAs.

- **Redundancy planning:** Subscribe to multiple ISPs or redundant
  internet connections to maintain availability.

- **Out-of-band communication:** Set up alternate communication channels
  (e.g., phone, satellite, secondary email).

- **Law enforcement coordination:** Pre-establish relationships with
  local or national cybercrime units for legal escalation.

------------------------------------------------------------------------

**2. Asset Inventory and Whitelisting**

**Objective:** Enable accurate traffic filtering and quick
decision-making during an attack.

**Key Actions:**

- **Whitelist essential IPs/protocols:** Include those of critical
  customers, APIs, partners, and business units.

- **Asset inventory:** Maintain detailed documentation of:

  - IP ranges, circuit IDs

  - Routing configurations (BGP, ASNs)

  - Service ownership (who to contact)

- **Network topology map:** Keep an up-to-date logical and physical
  diagram of infrastructure.

------------------------------------------------------------------------

**3. Network and System Infrastructure Readiness**

**Objective:** Build a resilient and attack-tolerant system.

**Key Actions:**

- **Avoid single points of failure:** Architect with redundancy in all
  tiers (load balancers, DNS, gateways).

- **Geographic distribution:** Deploy critical services like DNS and
  SMTP across multiple Azure regions and Autonomous Systems.

- **Configuration hardening:** Secure OS, network devices, and
  application layers against volumetric and protocol-based attacks.

- **Baseline normal traffic:** Use tools like Azure Network Watcher and
  Azure Monitor to define what “normal” looks like for detection.

- **Lower DNS TTLs:** Reduce to ~600 seconds to enable fast failover or
  redirection if an endpoint is targeted.

- **Backup & failover:** Create contingency environments that can be
  activated during outages (e.g., Azure Traffic Manager or Front Door
  with failover rules).

- **DDoS protection services:** Enable **Azure DDoS Protection
  Standard** on public-facing resources. Use custom policies where
  needed.

------------------------------------------------------------------------

**4. Internal Communication and Response Teams**

**Objective:** Define clear responsibilities and ensure coordination
during an incident.

**Key Actions:**

- **Identify key contacts:**

  - IDS/IPS and firewall teams

  - Azure administrators

  - Network, system, and application owners

- **Cross-team collaboration:** Work with business units to identify
  potential financial/operational impacts from service downtime.

- **BCP/DR integration:** Ensure that Business Continuity and Disaster
  Recovery (BCP/DR) plans include DDoS scenarios.

- **Incident response runbooks:** Create and maintain Azure-specific
  DDoS playbooks, including escalation paths and tooling (Azure
  Sentinel, Azure DDoS Protection analytics, etc.).

------------------------------------------------------------------------

**Summary Checklist**

| **Area** | **Preparation Action** |
|----|----|
| ISP & External Support | Understand ISP mitigation, contacts, backup links, and escalation procedures. |
| Asset Inventory | Whitelist critical IPs, maintain full infrastructure mapping. |
| Network Design | Eliminate single points of failure, distribute services, baseline performance. |
| DNS & Redirection | Lower TTLs, use Azure Traffic Manager for dynamic DNS routing. |
| DDoS Mitigation Tools | Enable and configure **Azure DDoS Protection Standard**. |
| Internal Communication | Define roles, build runbooks, and align BCP/DR with DDoS scenarios. |

------------------------------------------------------------------------

Would you like me to follow this with the **Detection**, **Mitigation**,
and **Post-Incident** phases next?

## Detection and Analysis

Here is a **reviewed, summarized, and corrected explanation** of the
**Detection and Analysis phase** of a **DDoS Attack Incident Response
(IR)** in an **Azure environment**. This includes both technical
detection techniques and coordination with internal/external
stakeholders:

**🔍 DDoS Attack Detection and Analysis (Azure Environment)**

**🎯 Objective**

To detect a potential DDoS attack, determine its scope, assess its
impact on Azure resources, and engage relevant teams for response and
mitigation.

**🧠 1. Understand the Attack**

**✅ Actions:**

- Analyze **attack flow** and identify affected Azure components (e.g.,
  Load Balancers, Application Gateways, VNets, VMs).

- Determine whether your environment is the **primary target** or
  **collateral damage**.

- Distinguish DDoS traffic from legitimate traffic using:

  - **Source IP addresses**, **Autonomous Systems (ASNs)**

  - **Destination ports**, **URLs**, **Protocol flags**

  - **Traffic volume and frequency**

**📊 2. Log Review & Network Analysis**

**✅ What to Review:**

- **Azure Monitor**, **NSG flow logs**, **Application Gateway logs**

- **WAF logs**, **Firewall logs**, **Traffic Analytics**

- Server-side logs (e.g., IIS, Nginx, syslog)

**✅ Use Tools:**

- **Tcpdump**, **Snort**, **Ntop**

- **Azure Network Watcher**, **Azure DDoS Protection telemetry**

- Consider creating **custom NIDS signatures** to identify malicious
  traffic patterns.

**🤝 3. Collaboration & Communication**

**🔒 Internal Teams:**

- Notify SOC, incident response, and infrastructure teams for visibility
  and triage.

**🌐 ISP Coordination:**

- Contact your ISP or Azure DDoS Protection team.

- Provide detailed indicators:

  - **Offending IP ranges**, **protocols**, **ports**

  - **Attack start time**, **duration**, **impact zone**

**🧑‍💼 Executives & Legal:**

- Notify executives for situational awareness and decision-making.

- Involve legal if extortion (e.g., ransom DDoS) or regulatory
  implications are suspected.

**🔍 4. Background Intelligence Gathering**

- Check if there was a **ransom or extortion** threat prior to the
  attack.

- Consider potential **threat actors**:

  - **Competitors**

  - **Hacktivist groups**

  - **Disgruntled insiders**

  - **Script kiddies or opportunistic attackers**

**🚦 5. DDoS Detection Techniques**

Detection is based on identifying statistically significant deviations
from normal traffic baselines. Common methods include:

**📈 Activity Profiling**

- Monitor network flow clusters.

- Identify:

  - Spike in activity levels

  - Increase in unique source IPs (botnet behavior)

- Calculate **average packet rate** for network flows.

**🌊 Wavelet-based Signal Analysis**

- Break traffic into **spectral components** to detect anomalies at
  specific frequencies.

- Useful for catching **volumetric or burst-style attacks**.

**🔍 Change-Point Detection (CUSUM)**

- Use **Cumulative Sum (CUSUM)** to identify sudden changes in packet
  rate or traffic volume.

- Ideal for early detection of **slow-building or persistent attacks**.

**🧪 Traffic Isolation & Filtering**

- Filter traffic by:

  - **IP address**

  - **Port**

  - **Protocol**

- Convert filtered data into time series for analysis and correlation.

**🔎 Scan Activity Detection**

- Detect **port scans** or **reconnaissance activity** using
  change-point detection.

- May indicate **pre-attack staging** by threat actors.

**🛡️ 6. Filtering & Mitigation Techniques**

**🔁 Egress Filtering**

- Prevent malicious traffic from leaving your network (e.g., in case of
  compromise).

- Monitor packet headers leaving Azure VMs or containers.

**⬅️ Ingress Filtering**

- Validate and drop spoofed traffic from unassigned or unauthorized IP
  prefixes.

- Helps in tracing the **real origin of the attack**.

**🔐 TCP Intercept (if applicable)**

- Intercept TCP SYN packets and validate connections before forwarding
  to target systems.

- Azure-native equivalents: **Azure Firewall TCP idle timeout tuning**,
  **WAF SYN flood protection**.

**✅ Summary**

| **Component** | **Key Action** |
|----|----|
| Detection Objective | Detect abnormal traffic, identify source, and notify stakeholders |
| Log & Network Analysis | Use Azure Monitor, NSG Flow Logs, NIDS tools to pinpoint anomalies |
| Collaboration | Coordinate with ISP, Azure Support, internal IR and executive teams |
| Threat Attribution | Investigate motive and actors (extortion, competitors, insiders, etc.) |
| Traffic Analysis Techniques | Use wavelets, CUSUM, activity profiles, isolation and filtering |
| Filtering Tactics | Employ ingress, egress, and TCP-level traffic filtering |

If you want, I can also create a **visual flowchart or decision tree**
for the DDoS IR Detection & Analysis phase in Azure. Let me know!

## Containment

Here's a **reviewed, corrected, and summarized explanation** of the
**Containment Phase** in a **DDoS Attack Incident Response Plan for an
Azure Environment**, presented in a structured, professional format:

------------------------------------------------------------------------

**🛡️ DDoS Attack Incident Response – Containment Phase (Azure
Environment)**

**🎯 Objective**

To **mitigate the impact** of the DDoS attack on Azure infrastructure,
applications, and users while maintaining business continuity and
preventing further degradation of services.

------------------------------------------------------------------------

**🔧 Containment Actions**

**1. Throttle or Block Malicious Traffic**

- **Act as close to the source as possible**:

  - Configure **firewalls**, **NSGs**, **Azure DDoS Protection**, **WAF
    rules**, or upstream **ISP-level filters**.

  - Use **rate limiting**, **IP reputation lists**, and **protocol-based
    filtering**.

- Use **specialized DDoS mitigation services** (e.g., **Azure DDoS
  Protection Standard**, Cloudflare, Akamai) to absorb volumetric
  attacks.

**2. Terminate Unwanted Connections**

- On affected servers, VMs, or network devices:

  - **Shut down** high-connection services or ports.

  - Tune **TCP/IP stack** settings (e.g., synack_retries, connection
    timeout) to reduce exhaustion risk.

**3. Traffic Diversion & DNS-Based Routing**

- Use **DNS failover** to redirect traffic to:

  - A **secondary region**, **geo-distributed backup**, or **content
    delivery network (CDN)**.

- Implement **sinkholing or blackholing**:

  - Drop all traffic destined for an overloaded IP.

  - Use **Null routing** in Azure or via BGP on external firewalls.

**4. Traffic Scrubbing (Mitigation Services)**

- Route inbound traffic through a **traffic scrubbing center** or **DDoS
  mitigation provider**.

  - Azure DDoS Protection Standard automatically engages scrubbing when
    thresholds are breached.

  - Integration with **partner solutions** like **Azure Front Door**,
    **Azure Firewall**, or third-party cloud providers is recommended.

**5. Alternate Communication Channels**

- Maintain user trust and internal coordination:

  - Set up alternative **email**, **web portals**, or **phone-based
    communication** if primary channels are under attack.

  - Notify stakeholders via unaffected platforms (e.g., status page on a
    different domain or provider).

**6. Egress Filtering**

- Configure outbound filtering to:

  - **Prevent backscatter traffic** from overwhelmed systems.

  - Reduce your network’s participation in potential
    reflection/amplification loops.

  - Use **NSG outbound rules** or **Azure Firewall** to block
    unnecessary egress during attack.

**7. Respond to Extortion Attempts (if applicable)**

- If faced with **ransom-based DDoS (RDDoS)** threats:

  - **Do not engage or pay** unless advised by legal/law enforcement.

  - **Delay or stall** attackers (e.g., request time for "approval").

  - **Engage law enforcement or a threat intelligence team**.

**8. ISP Collaboration**

- If the attack **exceeds Azure edge** or affects upstream transit:

  - Work closely with your **ISP/Internet transit provider**.

  - Share attack indicators:

    - **Source IPs**

    - **Ports and protocols**

    - **Attack start times and behavior**

  - Request **upstream rate-limiting or blocking** if possible.

------------------------------------------------------------------------

**🔁 Important Practice Note**

- **Test and rehearse** containment measures regularly:

  - Simulate failover (DNS cutover, blackhole routing, region switch).

  - Validate that mitigation tools (Azure DDoS Protection, WAFs) trigger
    correctly.

  - Ensure **incident response playbooks are documented and
    accessible**.

------------------------------------------------------------------------

**✅ Summary Table**

| **Containment Technique** | **Purpose** |
|----|----|
| Block/Throttle Traffic | Reduce load by filtering at firewall, NSG, or ISP level |
| Kill Connections | Free up resources by closing TCP/UDP sessions |
| Reroute/Sinkhole Traffic | Shift load to alternate resources or null route target IPs |
| Scrubbing Services | Filter out malicious traffic using third-party or Azure DDoS services |
| Alternate Communication | Ensure ongoing business communication outside the affected systems |
| Egress Filtering | Suppress malicious or noisy outbound traffic from local systems |
| Handle Extortion | Avoid hasty decisions, involve legal/security, buy time if needed |
| Collaborate with ISP | Request help for upstream filtering if attack volume exceeds capacity |

------------------------------------------------------------------------

Let me know if you want this written in a formal incident response
document format or visualized as a decision tree or infographic.

 

## Eradication

Here’s a **reviewed, corrected, summarized, and clearly explained**
version of the **"Eradication"** phase in a DDoS Attack Incident
Response for an Azure environment:

**🔧 Eradication Phase – DDoS Attack IR (Azure)**

**🎯 Objective**

To fully stop the ongoing DDoS attack and implement measures to prevent
recurrence.

**✅ Key Actions**

**1. Engage Your ISP (Internet Service Provider)**

Collaborate directly with your ISP to apply upstream mitigation
strategies. Most technical remediation will be executed at the ISP
level.

**Common ISP-based DDoS mitigation techniques include:**

- **Tier-1/Tier-2 Filtering:** Block or filter malicious traffic before
  it reaches your network.

- **Traffic Scrubbing Services:** Redirect all traffic through a
  scrubbing center to separate malicious traffic from legitimate
  traffic.

- **Sinkholing:** Divert DDoS traffic to a non-existent or controlled IP
  address (null route) to reduce impact.

- **Blackhole Routing (null routing):** Drop all traffic to the targeted
  IP address (extreme measure, only for critical situations).

🔹 *Note: Many ISPs offer clean-pipe or DDoS mitigation as a service
(MaaS).*

**2. Involve Law Enforcement (If Applicable)**

If attackers are **identified** or traced:

- Engage law enforcement agencies.

- Do so **only after approval** from executive leadership and legal
  counsel.

- Provide detailed logs, attack patterns, and any known IOCs (Indicators
  of Compromise).

**📌 Important Considerations**

- Technical remediation (e.g., traffic filtering or routing changes) is
  **primarily the responsibility of your ISP** or **third-party DDoS
  mitigation providers**.

- **Azure DDoS Protection Standard** can provide automated attack
  mitigation; ensure it is enabled and configured.

**🧾 Summary Table**

| **Action Area** | **Description** |
|----|----|
| ISP Engagement | Coordinate with your provider to filter, scrub, or blackhole attack traffic |
| Law Enforcement | Escalate with legal approval if attackers are identified |
| Azure Integration | Ensure Azure DDoS Protection Standard is active for proactive defense |
| Documentation | Record all actions taken for the post-incident review and compliance |

Let me know if you also need the **Recovery** and **Lessons Learned**
phases to complete the IR cycle.

## Recovery

Here is a **reviewed, corrected, summarized, and clearly explained**
version of the **Recovery** phase for DDoS Attack Incident Response (IR)
in an **Azure environment**:

------------------------------------------------------------------------

**🔁 Recovery Phase – DDoS Attack IR (Azure)**

**🎯 Objective**

Restore affected systems and services to their **normal operational
state** after a DDoS attack, while ensuring **stability and
performance**.

------------------------------------------------------------------------

**✅ Recovery Actions**

**1. Confirm Attack Cessation**

- Monitor network traffic and security logs to ensure **malicious
  traffic has stopped**.

- Validate that **Azure DDoS Protection** is no longer actively
  mitigating threats.

**2. Verify Service Availability**

- Confirm that **all affected applications and services are accessible**
  to end users.

- Use **Azure Monitor**, **Application Insights**, or **Log Analytics**
  to verify uptime and response times.

**3. Check Infrastructure Performance**

- Compare current performance against **baseline metrics** to ensure
  system resources (CPU, memory, bandwidth) are stable.

- Use **Azure Metrics** dashboards or third-party monitoring tools.

**4. Gradual Rollback of Mitigation Measures**

- Slowly and methodically remove temporary measures such as:

  - Blackhole routes

  - Scrubbing service redirections

  - Throttling/firewall rules

- Monitor traffic closely during rollback to avoid reintroducing risk.

**5. Restore Original Traffic Flow**

- If traffic was redirected (e.g., to a scrubbing center), return it to
  the **primary Azure network path**.

- Ensure **DNS, load balancers (e.g., Azure Front Door or Application
  Gateway)** are updated as needed.

**6. Restart Services**

- Bring back any services or applications that were paused/stopped
  during the attack.

- Validate their health and log errors or anomalies.

------------------------------------------------------------------------

**🤝 Team Coordination**

- Work closely with **network, security, and application teams** during
  the recovery.

- Avoid rushing the process. Prematurely restoring services can cause
  overload or instability.

------------------------------------------------------------------------

**📌 Important Notes**

- Recovery is the **final operational phase** of DDoS incident response.

- After recovery, conduct a **post-incident review** (part of Lessons
  Learned) to:

  - Identify strengths and weaknesses in response.

  - Refine playbooks and procedures.

  - Improve Azure DDoS configurations and alerting.

------------------------------------------------------------------------

**🧾 Recovery Summary Table**

| **Step** | **Description** |
|----|----|
| Verify End of Attack | Confirm DDoS traffic has ceased |
| Restore Services | Restart and validate affected services and applications |
| Performance Monitoring | Ensure infrastructure has returned to pre-attack performance levels |
| Rollback Mitigations | Remove emergency rules or routes incrementally |
| Resume Normal Routing | Return traffic paths to default Azure routing setup |
| Coordinate Recovery | Engage relevant teams to avoid cascading issues |

------------------------------------------------------------------------

Let me know if you’d like a **post-incident review template**, or help
drafting the **Lessons Learned** section to complete the IR cycle.

## Post Incident Activity

Here is a **reviewed, summarized, corrected, and clearly explained**
version of the **Post-Incident Activity** phase for DDoS Attack Incident
Response in an **Azure environment**:

------------------------------------------------------------------------

**📘 Post-Incident Activity – DDoS IR (Azure)**

**🎯 Objective**

To **analyze**, **document**, and **improve** your organization's
readiness and response strategy by reviewing the DDoS incident and
updating defenses accordingly.

------------------------------------------------------------------------

**✅ Key Post-Incident Activities**

**1. Conduct a Post-Incident Review (PIR)**

- **Document the entire incident timeline**:

  - When the attack began, how it evolved, how it was detected, how long
    it lasted, and how it was mitigated.

- Capture details such as:

  - Type of DDoS (e.g., volumetric, application-layer, protocol-based)

  - Impacted resources (e.g., Azure VMs, load balancers, public
    endpoints)

  - Response steps taken

  - Azure services involved (e.g., DDoS Protection, Azure Monitor,
    Firewall, Front Door)

**2. Evaluate the Response Effectiveness**

- Was the **incident detected quickly**?

- Were **communications clear and timely**?

- Were **teams aligned** on roles and responsibilities?

- Were **automated mitigations** (e.g., Azure DDoS Protection Standard)
  triggered effectively?

**3. Identify Gaps in Preparedness**

- What **was missing** from the preparation phase that slowed down the
  response?

- Were **runbooks or playbooks** followed properly?

- Did assumptions (e.g., about threat vectors or team responsibilities)
  prove false or incomplete?

**4. Improve Internal and External Collaboration**

- Review how **internal teams** (IT, SecOps, DevOps, Networking) and
  **external partners** (ISP, Microsoft support, law enforcement) worked
  together.

- Strengthen relationships and define **clear escalation paths** for
  future incidents.

**5. Update Policies, Playbooks, and Configurations**

- Modify your **incident response plan** based on findings.

- Update:

  - Azure DDoS protection thresholds and alerts

  - Firewall and NSG (Network Security Group) rules

  - Monitoring configurations (e.g., Azure Monitor, Log Analytics)

- Rehearse changes with **tabletop exercises or simulations**.

**6. Engage Legal and Compliance Teams (if applicable)**

- If there are **regulatory implications** or **legal proceedings**,
  involve legal teams early.

- Ensure **evidence** (logs, packet captures, mitigation records) is
  preserved and shared appropriately.

------------------------------------------------------------------------

**🧾 Post-Incident Review Summary Table**

| **Action** | **Description** |
|----|----|
| Document Incident | Record timeline, impact, and mitigation steps |
| Assess Response | Review speed, coordination, and communication |
| Identify Weaknesses | Note preparation gaps or flawed assumptions |
| Improve Collaboration | Strengthen relationships with key internal/external stakeholders |
| Update Defenses | Adjust IR plans, playbooks, Azure protections, and monitoring |
| Legal Coordination | Involve legal/compliance if regulatory or criminal matters are involved |

------------------------------------------------------------------------

**📌 Final Notes:**

- Post-incident analysis is essential for **continuous improvement** and
  helps **reduce the risk** and **impact** of future DDoS attacks.

- In Azure, ensure that **Azure DDoS Protection Standard**, **Azure
  Firewall**, and **Sentinel** (for SIEM) are tightly integrated with
  your response strategy.

------------------------------------------------------------------------

Let me know if you’d like a **template for a post-incident report** or a
**DDoS tabletop exercise guide** tailored for Azure teams.

# QnA

**What is the three-way handshake? How can it be used to create a DOS
attack?**

3-way handshake is a cornerstone of the TCP suite: SYN, SYN/ACK, ACK.

- **SYN** is the outgoing connection request from client to server.

- **SYN/ACK** is the acknowledgement of the server back to the client,
  saying that yes, I hear you, let us open a connection.

- **ACK** is the final connection, and allows the two to speak.

The problem is that this can be used as a very basic type of
denial-of-service attack.

- Client opens the SYN connection, the server responds with the SYN/ACK,
  but then the client sends another SYN.

- Server treats this as a new connection request and keeps the previous
  connection open.

- As this is repeated over and over many times very quickly, the server
  quickly becomes saturated with a huge number of connection requests,
  eventually overloading its ability to connect to legitimate users.
