

## DNS Spoofing / Cache Poisoning in Azure

**Types:**

- DNS Spoofing
- DNS Cache Poisoning

**Azure Security Solutions:**

- Enable **DNS Security Extensions (DNSSEC)** on Azure DNS zones.
- Use **Azure Firewall DNS proxy** with filtering to block malicious domains.
- Regularly monitor Azure DNS logs via **Azure Monitor**.

**Detection (Microsoft Sentinel):**

- Monitor DNS query and response logs for anomalies.
- Detect unexpected DNS record changes via Azure Activity Logs.

**Mitigation:**

- Implement DNSSEC to authenticate DNS responses.
- Audit DNS configurations regularly.
- Use Azure Firewall and private DNS zones to restrict DNS resolution paths.