

## Eavesdropping in Azure

**Definition:** Unauthorized interception of communication to gather information.

**Types:**

- Passive eavesdropping (listening only)
- Active eavesdropping (manipulating traffic)

**Azure Security Solutions:**

- Enforce **TLS/SSL** on all Azure service endpoints (App Service, Azure SQL, Storage).
- Use **Azure VPN Gateway** or **Azure ExpressRoute** for encrypted connectivity.
- Secure wireless access for Azure Stack HCI environments with **WPA3**.
- Monitor with **Azure Network Watcher** and **Microsoft Defender for Cloud**.

**Detection (Microsoft Sentinel):**

- Analyze network traffic logs for suspicious interception or packet duplication.
- Monitor for unexpected changes in encryption protocol usage.

**Mitigation:**

- Enforce encryption in transit via TLS and VPNs.
- Continuously monitor network traffic and audit logs.
- Restrict access with NSGs and Azure Firewall.

**Example:**

- An attacker uses network capture tools on a compromised Azure VM to sniff unencrypted traffic between services.