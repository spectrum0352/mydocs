# Design

## Firewall Design

* **Zoning:** Dividing the network into zones (internal, external, DMZ) based on trust levels. This is a fundamental design principle.
* **Architecture:**

  * Hub-and-spoke vs. distributed networks influence firewall placement.
  * Layered defense-in-depth: Using multiple firewalls for enhanced security.
* **Firewall Types:**

  * Perimeter firewalls
  * Internal firewalls
  * Application firewalls
  * Next-Generation Firewalls (NGFWs) - These have design implications due to their advanced features.
* **High Availability:** Design considerations for redundancy and failover (e.g., two firewalls in HA).
* **Capacity Planning:** Design must consider network size, traffic volume, and performance requirements.



## Azure Firewall Architecture Design

1. Deployment Model:

   * Hub and Spoke: Recommended for most enterprise environments.

     * Azure Firewall deployed in a central hub VNet.
     * Spoke VNets connect to the hub via VNet peering.
     * Centralized security management.
   * Centralized: Suitable for simpler, single-VNet environments.
   * Regional: For redundancy and performance across multiple Azure regions.
2. Azure Firewall Configuration:

   * Pricing Tier Selection: Standard or Premium, based on feature needs.
   * Network Interfaces: Attach the firewall to a dedicated subnet (AzureFirewallSubnet).
   * Public IP Addresses: Assign if required for outbound internet access.
3. Network and Application Rules:

   * Network Rules (L3-L4):

     * Source and destination IP addresses/ranges.
     * Protocols and ports.
     * Allow or deny actions.
   * Application Rules (L7):

     * FQDNs (Fully Qualified Domain Names).
     * HTTP/HTTPS traffic control.
     * URL Filtering (Premium).
     * Web categories (Premium).
4. Threat Intelligence and Advanced Features:

   * Threat Intelligence: Enable built-in threat feeds.
   * Azure Firewall Premium:

     * TLS inspection.
     * URL filtering.
     * Web categories.
     * IDPS.
5. Azure Firewall Manager:

   * Centralized management of multiple Azure Firewalls.
   * Policy deployment across regions.
   * Route management.
6. Monitoring and Logging:

   * Azure Monitor Integration: Logs and metrics for firewall activity.
   * Alerting: Configure alerts for security events.
   * Logging and Monitoring: Comprehensive logging for troubleshooting and security analysis.
7. High Availability and Scalability:

   * Azure Firewall is inherently highly available.
   * Scales automatically with network traffic.
   * Multiple public IP addresses.
   * For High availability of your over all system, use the hub and spoke model, and utilize multiple firewalls in different regions.
8. Number of Firewalls:

   * Depends on network size, complexity, and security policies.
   * High availability often requires two firewalls in an active-passive or active-active configuration.
   * Consider regional deployments for global presence.



## 3\. Firewall Zoning

* Definition:

  * Segmenting a network into zones based on trust levels.
* Zone Examples:

  * Internal Zone (High Trust): User workstations, servers.
  * External Zone (Low Trust): Internet-connected devices.
  * DMZ (Demilitarized Zone): Publicly accessible servers (web, email).
* Benefits:

  * Reduced attack surface.
  * Contained malware spread.
  * Improved compliance.
* DMZ Security Best Practices:

  * Use two firewalls: one internet-facing, one internal-facing.
  * Use different firewall types for added security.
  * Use dual NICs for DMZ servers.
  * Maintain separate rule sets.



## 3\. Firewall Zoning

* Definition:

  * Segmenting a network into zones based on trust levels.
* Zone Examples:

  * Internal Zone (High Trust): User workstations, servers.
  * External Zone (Low Trust): Internet-connected devices.
  * DMZ (Demilitarized Zone): Publicly accessible servers (web, email).
* Benefits:

  * Reduced attack surface.
  * Contained malware spread.
  * Improved compliance.
* DMZ Security Best Practices:

  * Use two firewalls: one internet-facing, one internal-facing.
  * Use different firewall types for added security.
  * Use dual NICs for DMZ servers.
  * Maintain separate rule sets.



