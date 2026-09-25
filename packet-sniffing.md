## Packet Sniffing in Azure

**Types**:

- **Passive Sniffing**: Monitoring unencrypted traffic within a VNet.

- **Active Sniffing**: Involves traffic manipulation or use of
  promiscuous mode on Azure VMs *(restricted by Azure hypervisor).*

**Security Solutions in Azure**:

- **Encryption**: Enforce TLS for all services and APIs via **Azure
  Policy** and **App Service TLS settings**.

- **Segmentation**: Use **VNets**, **subnets**, and **NSGs** to isolate
  sensitive workloads.

- **Detection/Prevention**: Enable **Microsoft Defender for Cloud** for
  network layer monitoring and VM-based intrusion detection.

**Detection via Microsoft Sentinel**:

- Monitor for:

  - **Unusual east-west traffic** between VMs.

  - **Unauthorized network capture tools** like tcpdump or Wireshark
    launched in Azure VMs.

- Sentinel uses data from:

  - **Log Analytics agent**, **NSG Flow Logs**, **Azure Network Watcher**, and **Defender for Endpoint** on Windows/Linux VMs.

**Mitigation in Azure**:

- Apply **Just-In-Time (JIT) VM access** to reduce exposure.
- Use **Azure Bastion** for secure VM management without exposing RDP/SSH.
- Ensure **encryption in transit** using TLS and/or VPN for all services.
- Enforce **RBAC restrictions** to prevent unauthorized packet sniffing.

**Example in Azure**:

- **Wireshark**: An insider with VM access captures traffic between Azure services lacking encryption (e.g., outdated web app calling HTTP
  API).