# DNS Tunneling

**Description:**
Attackers exfiltrate data or communicate covertly with malware by embedding data inside DNS queries, bypassing traditional network
controls in Azure virtual networks.

**Azure-Specific Solutions:**

* Enable **Azure DNS Analytics** and monitor for anomalous DNS patterns (high query volumes, suspicious domains).
* Use **Azure Firewall DNS Proxy** and **Azure Defender for DNS** to detect and block DNS tunneling.
* Integrate threat intelligence feeds and configure **DNS filtering policies** to block malicious domains.



