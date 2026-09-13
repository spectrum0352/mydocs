## Distributed Denial of Service (DDoS) Attacks in Azure Environments

**Types of DDoS Attacks:**

- **Botnets**: Large-scale attacks using thousands of compromised
  devices (e.g., IoT) to overwhelm Azure resources.

- **Amplification Attacks**: Abuse of protocols like DNS, NTP, or SSDP
  to magnify traffic towards Azure endpoints.

- **Reflective Attacks**: Spoofed requests sent to third-party servers
  that reply to the Azure resource’s IP, flooding it with responses.

**Azure-Specific Security Solutions:**

- **Azure DDoS Protection Standard**:

  - Provides automatic attack detection and mitigation for public-facing
    Azure resources.

  - Integrates with Azure Monitor and Microsoft Sentinel for visibility
    and analytics.

  - Offers cost protection during documented DDoS events.

- **Azure Content Delivery Network (CDN)**:

  - Offloads and caches web content globally, helping absorb
    application-layer DDoS traffic.

- **Traffic Scrubbing via Azure DDoS Protection**:

  - Automatically filters out malicious traffic before it reaches Azure
    resources.

  - Works with Azure Application Gateway, Azure Front Door, or external
    partners like Cloudflare or Akamai for extended coverage.

**Detection in Azure SIEM (Microsoft Sentinel):**

- **Key Indicators**:

  - Sudden surge in traffic from distributed sources (IPs, geographies).

  - Repeated patterns of known attack behaviors (e.g., bursts of
    SYN/ACK, malformed DNS traffic).

  - CPU, memory, or network bandwidth spike on target services.

- **Sentinel Detection Features**:

  - **Anomaly Detection**: ML-based models flag irregular traffic
    volumes and flows.

  - **Threat Intelligence Integration**: Matches traffic against known
    botnet or DDoS attacker IPs/domains.

  - **Log Correlation**: Aggregates data from NSGs, firewalls, Azure
    Monitor, and DDoS Protection logs.

**Mitigation Strategies in Azure:**

- **Enable Azure DDoS Protection Standard** on all critical public IP
  addresses.

- **Use Azure Front Door and WAF** to mitigate HTTP-based volumetric
  attacks and rate limit malicious clients.

- **Implement NSG and Azure Firewall Rules** to block known malicious
  IPs or restrict traffic by region or protocol.

- **Auto-scale application infrastructure** (e.g., Azure VMSS, App
  Service Plans) to temporarily absorb increased traffic.

- **Deploy Third-Party Virtual Appliances** (e.g., F5, Palo Alto) for
  advanced traffic control and inspection.

**Examples in Azure Context:**

- **Mirai Botnet Attack on Azure Web App**\
  *Example:* Azure-hosted website is targeted by the Mirai botnet using
  compromised IoT devices, overwhelming the App Service with HTTP
  requests.\
  *Mitigation:* Azure DDoS Protection Standard and Azure Front Door
  detect and block malicious requests; WAF rules filter common botnet
  patterns.

- **DNS Amplification Attack Targeting Azure DNS Zone**\
  *Example:* Spoofed DNS queries sent to public resolvers result in
  large DNS responses being sent to Azure DNS, saturating its
  bandwidth.\
  *Mitigation:* Azure DDoS Protection discards the spoofed response
  traffic and alerts via Sentinel.

- **Reflective UDP Flood on Azure VM**\
  *Example:* Attacker spoofs Azure VM's IP in requests to open NTP
  servers, resulting in a reflection attack.\
  *Mitigation:* Azure DDoS Standard identifies the reflection signature
  and drops the malicious packets before they reach the VM.

## Denial of Service (DoS) Attacks in Azure Environments

**Types of DoS Attacks:**

- **Ping Flood (ICMP Flood)**: Overwhelms target VM/network with ICMP
  echo requests.

- **SYN Flood**: Exploits the TCP handshake to exhaust resources by
  sending excessive SYN packets.

- **UDP Flood**: Sends large volumes of UDP packets to random ports on
  the target VM or service.

- **Application Layer DoS (e.g., HTTP GET Flood)**: Targets specific web
  applications hosted in Azure (App Services, VMs, AKS).

**Azure-Specific Security Solutions:**

- **Azure DDoS Protection**:

  - *Basic*: Included with all Azure services.

  - *Standard*: Provides adaptive tuning, attack analytics, and
    mitigation against volumetric, protocol, and resource layer attacks.

- **Azure Web Application Firewall (WAF)**:

  - Integrated with Azure Front Door, Application Gateway, and Azure CDN
    for HTTP/S-level DoS protection.

- **Azure Firewall and Network Security Groups (NSGs)**:

  - Can restrict traffic based on IP, protocol, or port to reduce
    exposure.

- **Azure Sentinel (SIEM)**:

  - Detects and correlates traffic anomalies and integrates with other
    Microsoft Defender solutions.

- **Intrusion Prevention Systems (IPS)**:

  - Can be deployed via Azure partner network virtual appliances (NVAs).

**Detection in Azure SIEM (Microsoft Sentinel):**

- **Indicators of DoS:**

  - Sudden spike in inbound/outbound traffic on a specific resource.

  - Excessive failed connection attempts (e.g., high SYN packets not
    completing).

  - High CPU/memory utilization on exposed VMs or App Services.

- **Sentinel Analytics Rules & Features:**

  - **Threshold Alerts**: Alert when traffic exceeds defined baselines.

  - **Anomaly Detection Models**: Machine learning models detect
    outliers in network flow or resource usage.

  - **Threat Intelligence Correlation**: Identifies known DoS tools or
    attacker IPs in logs.

**Mitigation Strategies in Azure:**

- **Enable Azure DDoS Protection Standard** for public IPs of Azure
  resources.

- **Implement Rate Limiting** at Application Gateway, Azure API
  Management, or within application code (e.g., ASP.NET throttling).

- **Use Azure Front Door or Azure CDN** to offload traffic and absorb
  large bursts.

- **Deploy Load Balancers (e.g., Azure Load Balancer, Application
  Gateway)** to distribute traffic efficiently.

- **Auto-Scaling App Services or VMs** to handle legitimate traffic
  surges during DoS attempts.

**Azure Context Examples:**

- **Ping Flood (ICMP Flood) on Azure VM**\
  *Example:* An attacker floods a public-facing Azure VM’s NIC with ICMP
  requests using tools like hping3, consuming bandwidth and processing
  capacity. Mitigated by NSG rules denying ICMP from untrusted IPs.

- **SYN Flood on Azure Load Balancer**\
  *Example:* A SYN flood targets a backend pool in Azure Load Balancer.
  Azure DDoS Standard automatically detects and mitigates the TCP
  handshake abuse.

- **HTTP GET Flood on Azure Web App**\
  *Example:* Bots issue thousands of HTTP GET requests to an Azure App
  Service. Azure WAF (with OWASP rules) blocks requests based on rate
  and behavior patterns.

- **DNS Amplification Attack Targeting Azure DNS Zone**\
  *Example:* An attacker leverages open resolvers to amplify DNS queries
  towards an Azure DNS endpoint. Azure’s DDoS mitigation filters the
  malformed traffic before it reaches the endpoint.

