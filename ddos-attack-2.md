# DDoS Attack

When discussing Denial of Service (DoS) in the context of penetration testing, it is vital to distinguish between malicious disruption and resilience testing. In a professional security audit, "pentesting" a DoS vulnerability isn't about crashing a system for fun; it's about identifying the threshold at which a service fails and ensuring that mitigation controls (like rate limiting or WAFs) are functioning correctly.

Here is a corrected and professionally structured outline for a penetration testing module on DoS and DDoS.

1. DoS and DDoS Resilience Testing

a. Introduction to DoS (Denial of Service)

A DoS attack aims to make a system or network resource unavailable to its intended users by overwhelming it with requests or exploiting a vulnerability that causes a crash. In testing, we focus on availability, one of the three pillars of the CIA Triad (Confidentiality, Integrity, Availability).

b. Botnets

A botnet is a collection of compromised "zombie" computers controlled by a Command and Control (C2) server. In a pentesting context, we often simulate botnet traffic using distributed load-testing tools to see how a network handles high-volume, multi-source traffic.

c. DDoS (Distributed Denial of Service)

Unlike a standard DoS, a DDoS uses multiple sources (often a botnet) to attack a single target. This makes it much harder to block because the traffic doesn't come from a single IP address.

d. SYN Flood Attack (Layer 4)

This exploits the TCP three-way handshake. The attacker sends a succession of SYN requests but never responds with the final ACK. This leaves the target's ports in a "half-open" state, consuming resources until no new connections can be made.

e. UDP Flood (Layer 4)

UDP is a connectionless protocol. An attacker sends a large number of UDP packets to random ports on a remote host. The host checks for applications listening at those ports and, finding none, issues an ICMP "Destination Unreachable" packet. This process exhausts the target's resources.

f. Smurf Attack (Amplification)

A legacy but classic amplification attack where an attacker sends ICMP (ping) packets with a spoofed source IP (the victim's IP) to a network's broadcast address. Every device on that network responds to the victim, magnifying the traffic significantly.

g. Packet Crafting

This is the "art" of manually creating or modifying network packets to test how a system handles malformed or unexpected data.

Tools: Scapy, Hping3, and Nmap are commonly used to craft specific flags or payloads to see if they bypass firewall rules.
h. Other DoS Attack Vectors and Tools

Modern testing also includes:

HTTP Flood (Layer 7): Simulating massive web traffic to overwhelm the application server.
Slowloris: Holding HTTP connections open as long as possible with partial requests.
Testing Tools: LOIC/HOIC (for education/stress tests), Hping3, GoldenEye, and professional load-testing suites like JMeter or Locust.
Important Safety Note

Warning: Never perform DoS testing on production environments or networks you do not own/have explicit written permission to test. These attacks can cause unintended downtime and hardware damage.

 

Configure Azure-specific DDoS Protection
 

Since you have an interest in Microsoft Azure architecture and cybersecurity, looking at this through the lens of a cloud environment is the most practical approach. Testing DoS resilience in Azure requires a slightly different strategy than traditional on-prem testing.

 

1. Mitigation & Resilience in Cloud Architecture

a. Azure DDoS Protection (Basic vs. Network Protection)

Azure provides Infrastructure (Basic) protection by default, which defends against massive "volumetric" attacks at Layers 3 and 4. However, for specific testing and advanced defense, Azure DDoS Network Protection provides:

Adaptive Tuning: It learns your application's normal traffic patterns and creates a custom threshold.
Rapid Response: Access to the DDoS Rapid Response (DRR) team during an active attack.
b. Application Gateway & WAF (Layer 7 Defense)

To stop attacks like Slowloris or HTTP Floods, you would use an Azure Application Gateway with a Web Application Firewall (WAF).

Rate Limiting: You can define rules to block an IP if it exceeds $X$ requests within $Y$ seconds.
Geoblocking: If you notice a flood of traffic from a region where you have no customers, you can drop those packets at the edge.
 

2. Setting Up a "Safe" Pen Test

If you are designing a secure environment and want to test these vulnerabilities, here is how to structure the lab:

Step 1: Resource Isolation

Never test against your live site. Create a Staging/Sandbox Resource Group.

Deploy a Virtual Machine (target) and a separate VM (attacker) within a private Virtual Network (VNet).
Ensure no "Public IP" is exposed during the test to avoid accidental leakage of the attack to the broader internet.
Step 2: Tooling for Validation

Instead of just "crashing" the server, use tools to monitor the Resource Metrics in Azure Monitor:

Hping3: Use this to simulate a SYN Flood.
Command example: hping3 -S --flood -V -p 80 [Target_IP]
Scapy (Packet Crafting): Use this Python library to create custom, malformed packets to see if your Azure Network Security Group (NSG) correctly drops them.
3. Correcting the "Smurf" & "UDP" Concepts for Modern Labs

Smurf Attacks: These are largely obsolete on modern public clouds like Azure because cloud fabric routers do not allow directed broadcasts. Testing this is more of a historical exercise.
UDP Floods: In a cloud environment, these are often mitigated by the SDN (Software Defined Networking) layer before they even reach your VM. Your pentest should focus on whether your Load Balancer can distribute the stress or if the Auto-scaling triggers correctly to handle the load.
 

 

 

Set up Rate Limiting to mitigate these specific attacks
 

To mitigate DoS attacks in your Azure architecture, you should implement rate limiting at the Web Application Firewall (WAF) level. This allows you to block "noisy" attackers before they ever reach your web servers.

In Azure, rate limiting is configured using Custom Rules within a WAF policy associated with either an Application Gateway or Azure Front Door.

 

 

1. Step-by-Step Configuration (Azure Portal)
Follow these steps to create a rule that blocks any IP address sending more than 100 requests per minute:

Open WAF Policy: Navigate to the WAF Policy resource associated with your Application Gateway or Front Door.
Custom Rules: In the left-hand menu, select Custom rules.
Add Custom Rule:
Rule Name: PreventFloodAttacks
Rule Type: Select Rate limit.
Priority: Set to a low number (e.g., 10) so it evaluates early.
Rate Limit Duration: 1 Minute (standard) or 5 Minutes.
Rate Limit Threshold: 100 (requests).
Conditions:
If you want this to apply to your entire site, leave the condition as a "Match all" (e.g., Match Type: String, Match Variable: RequestUri, Operator: Contains, Match Value: /).
If you only want to protect a specific path like /login, set the Match Value to /login.
Action: Select Block.
Save: Click Add and then Save the policy.
 

 

2. Advanced Mitigation: "The Penalty Box"
Azure Application Gateway now features a managed HTTP DDoS Ruleset (currently in preview) that goes beyond static thresholds.

How it works: It uses machine learning to establish a baseline of your "normal" traffic.
The Penalty Box: When an IP breaches the threshold, it isn't just rate-limited; it is placed in a "Penalty Box" and blocked for a fixed duration (usually 15 minutes). This is far more effective against persistent DoS tools than a simple 1-minute reset.
 

 

3. Azure CLI Configuration (Automation)
If you prefer scripting your security deployments, you can use the following command to create a rate-limit rule:

Bash

az network application-gateway waf-policy custom-rule create \

    --resource-group MyResourceGroup \

    --policy-name MyWafPolicy \

    --name IPBasedRateLimit \

    --priority 5 \

    --rule-type RateLimitRule \

    --rate-limit-duration OneMin \

    --rate-limit-threshold 500 \

    --action Block \

    --group-by-user-session "[{group-by-variables:[{variable-name:ClientAddr}]}]"

 

 

Pro-Tips for Tuning
Start in Detection Mode: Always set your WAF to Detection mode for the first 24–48 hours. Review the logs to ensure you aren't accidentally blocking legitimate power users.
Layered Defense: Use Azure DDoS Network Protection for Layer 3/4 (infrastructure) and the WAF for Layer 7 (application) to ensure comprehensive coverage.
Azure Front Door WAF Tutorial: Block DDoS Attacks with Rate-Limiting Rules

This video provides a practical, hands-on walkthrough for configuring these specific rate-limiting rules within the Azure portal.

 

KQL query to detect attacker IP address
To monitor your rate-limiting rules and identify potential attackers, you’ll use Kusto Query Language (KQL) within Azure Log Analytics. This is essential for distinguishing between a legitimate traffic spike and a coordinated DoS attack.

 

1. KQL Query: Identifying Blocked IPs
This query searches your WAF logs for any requests that were blocked specifically by your Rate Limit rule. It summarizes the results by IP address and the specific rule that was triggered.

 

AzureDiagnostics

| where ResourceProvider == "MICROSOFT.NETWORK" and Category == "ApplicationGatewayFirewallLog"

| where action_s == "Blocked"

| where details_message_s contains "Rate limit"

| summarize RequestCount = count() by clientIp_s, details_message_s, Message

| order by RequestCount desc

 

2. KQL Query: Visualizing the Attack Trend
If you want to see when the attack started to hit your thresholds, use this query to create a time-chart:

 

AzureDiagnostics

| where ResourceProvider == "MICROSOFT.NETWORK" and Category == "ApplicationGatewayFirewallLog"

| where action_s == "Blocked"

| summarize count() by bin(TimeGenerated, 5m), clientIp_s

| render timechart

 

 

 

How to use this data for your Pentest
When you are performing your resilience testing (as we discussed with tools like Hping3 or Scapy), these logs are your "Report Card."

 

Run your tool: Start your DoS simulation.
Check the logs: Run the first query above.
Validate: If the clientIp_s of your "attacker" VM shows up with a high RequestCount and an action_s of "Blocked," your rate-limiting configuration is successful.
Refine: If the server crashes before the logs show a block, your threshold is too high and needs to be lowered.
 

Setting up an Alert

You don't want to manually run queries all day. In Azure Monitor, you can "New Alert Rule" based on the first query. Set it to email or text you if RequestCount > 500 over a 5-minute period.

 

 