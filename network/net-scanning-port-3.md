port-scanning

## Port Scanning in Azure

**Types**:

- **SYN Scan**, **ACK Scan**, **XMAS Scan** — commonly executed from compromised Azure VMs or external sources targeting public IPs.

**Security Solutions in Azure**:

- **Azure Firewall**: Detects and blocks port scanning with intelligent rules and threat intel.
- **Network Security Groups (NSGs)**: Limit inbound access to only required ports.
- **Microsoft Defender for Cloud**: Detects scanning behavior via integrated threat detection.

**Detection via Microsoft Sentinel**:

- **Alerts** for repeated connection attempts to sequential ports.
- **Indicators**: High volume of denied connections from a single IP.
- Uses: **NSG Flow Logs**, **Firewall Logs**, **Defender for Endpoint alerts**, and **custom analytics rules**.

**Mitigation in Azure**:

- Restrict VM exposure by eliminating unnecessary **public IPs**.
- Use **Azure DDoS Protection** to reduce exposure to port scan floods.
- Regularly audit and **close unused ports** using Defender for Cloud recommendations.

**Example in Azure**:

- **Nmap SYN Scan**: An attacker gains access to a compromised VM and scans internal subnet hosts to identify exploitable services such as
  open SMB or RDP ports.