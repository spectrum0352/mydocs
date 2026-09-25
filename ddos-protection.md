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
