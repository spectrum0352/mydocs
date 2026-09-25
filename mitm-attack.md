## Man-in-the-Middle (MitM) Attacks in Azure

**Common Types**:

- **ARP Spoofing** *(less common in Azure due to virtualized networking
  but possible via compromised VMs)*

- **DNS Spoofing** *(via Azure Private DNS or insecure DNS forwarding)*

- **SSL Stripping** *(targeting insecure applications hosted on Azure
  App Services or VMs)*

**Security Solutions in Azure**:

- **SSL/TLS Enforcement**: Use **Azure Application Gateway** or **Azure
  Front Door** with HTTPS-only policies.

- **Certificate Pinning**: Implement in client apps to verify server
  identity.

- **Network Monitoring**: Enable **Azure Network Watcher** for packet
  capture and connection monitoring.

- **Intrusion Detection/Prevention**: Use **Microsoft Defender for
  Cloud** with **Microsoft Defender for Servers** and **Azure Firewall
  Premium** for TLS inspection and threat intelligence-based filtering.

**Detection via Azure-native SIEM (Microsoft Sentinel)**:

- **Indicators**: Sudden changes in network traffic patterns, spoofed
  DNS/ARP behavior within VNet.

- **Sentinel Analytics**: Leverage built-in analytics rules for
  detecting ARP poisoning attempts or suspicious proxy behavior.

- **Data Sources**: Azure Firewall logs, NSG Flow Logs, VM insights, DNS
  Analytics.

**Mitigation in Azure**:

- Enforce **end-to-end encryption** using Application Gateway or Azure
  Front Door with HTTPS and TLS 1.2+.

- Disable public IPs and **use private endpoints** for sensitive Azure
  services.

- Implement **Network Security Groups (NSGs)** and **route tables** to
  restrict traffic paths.

- Regularly audit DNS zones and **Azure Private DNS configurations** for
  tampering.

**Examples in Azure**:

- **DNS Spoofing**: An attacker compromises an Azure VM and manipulates
  custom DNS settings to redirect traffic intended for internal
  services.

- **SSL Stripping**: A misconfigured Azure App Service accepts HTTP traffic, allowing interception before the redirect to HTTPS occurs.




