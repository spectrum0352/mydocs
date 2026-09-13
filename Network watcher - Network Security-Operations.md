# Network watcher - Network Security/Operations

Azure Network Watcher is a regional service that provides a suite of tools to monitor, diagnose, and gain insights into your Azure Virtual Network (VNet) health and performance. Instead of just looking at individual resources, it looks at the "network tissue" connecting them.

Here is a breakdown of how it handles diagnosis and security analysis:

 

 

1. Diagnostic Tools (Troubleshooting)

Network Watcher uses scenario-based analysis to find where connectivity is breaking down.

IP Flow Verify: Checks if a packet is allowed or denied to/from a specific virtual machine based on Security Group (NSG) rules. It tells you exactly which rule is blocking traffic.
Next Hop: Helps determine if traffic is being misrouted. It identifies the "next hop" type (e.g., Virtual Appliance, Internet, or Gateway) for traffic leaving a VM.
VPN Diagnostics: Troubleshoots gateways and connections to ensure site-to-site connectivity is functional.
Packet Capture: Allows you to create a remote packet capture session on a VM to track traffic at the packet level for deep root-cause analysis.
 

 

2. Security Analysis & Monitoring

It provides visibility into the security posture of your network infrastructure.

NSG Flow Logs: Records information about IP traffic flowing through a Network Security Group. This is vital for auditing, compliance, and identifying unusual traffic patterns.
Traffic Analytics: A cloud-based solution that analyzes NSG Flow Logs to provide visualizations of network activity. It shows "hotspots" of traffic, which regions are communicating, and identifies potential malicious traffic.
Security Group View: Returns all effective security rules applied to a VM, making it easier to audit complex, nested security policies.
 

 

3. Visualizing Network Topology

One of the most useful features for scenario analysis is the Topology tool. It generates a visual diagram of your entire virtual network, showing how resources like subnets, VMs, and gateways are interconnected.

 

 

Summary of Use Cases

Scenario

Network Watcher Tool

Why can't my VM talk to the database?

IP Flow Verify / Next Hop

Is my firewall rule actually working?

NSG Flow Logs

Who is sending the most traffic to my VNet?

Traffic Analytics

I need to see the raw packets for an app error.

Connection Monitor / Packet Capture

 

 

Setup NSG flow logs and Traffic analytics
Setting up NSG Flow Logs and Traffic Analytics is a critical step for gaining visibility into your Azure network security. By integrating these logs with a Log Analytics workspace, you can move beyond raw JSON data to interactive dashboards.

 

Step 1: Prerequisites
Before enabling the logs, ensure you have the following:

Network Watcher Enabled: Ensure Network Watcher is enabled for the region where your NSG resides.
Insights Provider: The Microsoft.Insights resource provider must be registered in your subscription.
Storage Account: A Standard general-purpose v2 storage account is required to store the raw flow logs.
Log Analytics Workspace: This is where Traffic Analytics will process and visualize the data.
 

Step 2: Enable NSG Flow Logs
In the Azure Portal, search for Network Watcher.
Under the Logs section in the left-hand menu, select Flow logs.
Click + Create and configure the following:
Target resource: Select the specific Network Security Group you want to monitor.
Storage account: Select your existing v2 storage account.
Retention: Set the number of days to keep the logs (0 for "forever").
Flow logs version: Choose Version 2 (this is highly recommended as it includes throughput and session statistics).
 

Step 3: Configure Traffic Analytics
While still in the Create flow log (or Edit flow log) screen, move to the Analytics tab:

Enable Traffic Analytics: Toggle the switch to On.
Traffic Analytics processing interval: Choose either Every 1 hour or Every 10 mins (the 10-minute option provides faster updates for active troubleshooting).
Log Analytics Workspace: Select the workspace where you want the analytics data to be sent.
Click Review + create and then Create.
 

Step 4: Visualizing the Data
Once configured, it may take 30–60 minutes for the first set of data to populate. To view the insights:

Go to Network Watcher > Traffic Analytics.
Select your workspace.
You will see dashboards showing:
Inter-region traffic: Flows between different Azure regions.
Malicious traffic: Known bad IP addresses communicating with your resources.
Hotspots: Which subnets or VMs are generating the most traffic.
 

Pro-Tip: KQL Queries

If you need specific data that the dashboard doesn't show, you can query the raw data directly in Log Analytics using Kusto Query Language (KQL). For example, to find all denied traffic:

 

AzureNetworkAnalytics_CL

| where SubType_s == "FlowLog" and AllowedOutFlows_d == 0

| project TimeGenerated, SrcIP_s, DestIP_s, DestPort_d

 

KQL Query
 

Since you're diving into the logging side of things, it’s worth noting that Kusto Query Language (KQL) is your best friend when those pre-built dashboards don't give you the exact "who, what, and where" you need.

 

Here are a few ways I can help you take this a step further:

 

1. Custom KQL Queries

If you are looking for something specific—like identifying which of your internal VMs are talking to external IP addresses over non-standard ports—I can write the KQL query for you to run in your Log Analytics workspace.

 

2. Incident Response Scenarios

Since you have an interest in incident response, we could walk through how to use Packet Capture alongside Traffic Analytics. For instance, if Traffic Analytics flags an "IP with a bad reputation" hitting your VNet, I can show you how to trigger an automated Packet Capture to see exactly what that traffic is trying to do.

 

3. Automation with Azure Monitor

We can discuss how to set up Alerts. You don't want to be staring at dashboards all day; you can configure Azure to send you a notification (or trigger an Azure Function to shut down a port) the moment a specific "Denied" flow threshold is crossed.

 

 

 

 

 

1. Tactical KQL Queries for Incident Response
When you suspect a security issue, you can run these queries in your Log Analytics Workspace to pinpoint the threat.

 

 

A. Detect "Malicious" Traffic
Azure Traffic Analytics automatically flags traffic from IPs known for malicious activity (based on Microsoft Threat Intelligence).

 

AzureNetworkAnalytics_CL

| where SubType_s == "FlowLog"

| where FlowType_s == "MaliciousFlow"

| project TimeGenerated, SrcIP_s, DestIP_s, DestPort_d, L7Protocol_s, FlowStatus_s

| order by TimeGenerated desc

 

 

B. Find "Top Denied" Sources (Brute Force Detection)
If you see a single external IP hitting your network with hundreds of "Denied" results, it is likely a brute-force attack or a port scan.

 

AzureNetworkAnalytics_CL

| where SubType_s == "FlowLog" and FlowStatus_s == "D"

| summarize DeniedCount = count() by SrcIP_s, DestPort_d

| where DeniedCount > 50

| order by DeniedCount desc

 

 

C. Identify Data Exfiltration Patterns
Look for unusual spikes in outbound data from your internal VMs to external public IPs.

 

AzureNetworkAnalytics_CL

| where SubType_s == "FlowLog" and FlowDirection_s == "O" and FlowType_s == "ExternalPublic"

| summarize TotalOutboundBytes = sum(OutboundBytes_d) by SrcVm_s, DestIP_s

| top 10 by TotalOutboundBytes

 

 

2. Automating Response with Logic Apps
Instead of manually checking logs, you can use Azure Logic Apps (called "Playbooks" in Microsoft Sentinel) to act the moment a threat is detected.

 

 

Scenario: The "Auto-Capture" Workflow
If a high-severity security alert is triggered (e.g., "Traffic to a known Command & Control IP"), you can automate a packet capture to gather evidence before the attacker moves.

 

 

Trigger: An Azure Monitor Alert or Microsoft Sentinel Incident occurs.
Condition: If Severity is "High" and Category is "Network".
Action (Azure Function/Logic App):
Call the Network Watcher API to start a Packet Capture on the compromised VM for 5 minutes.
Save the .pcap file to a secure Storage Account.
Action (Notification): Send a message to your Microsoft Teams or Slack security channel with the link to the capture file.
 

 

3. Scenario-Based Analysis with Packet Capture
Since you are interested in cybersecurity and incident response, the most powerful tool for "scenario-based analysis" is the remote packet capture.

Why use it? NSG Flow Logs only tell you who talked to whom. Packet Capture tells you what they said. It reveals the actual payload (e.g., the specific SQL injection string or the malware's handshake).
Best Practice: Use Filters in your capture to keep the file size small. For example, only capture traffic on port 443 from a specific suspicious source IP.
 

 

 

1. Advanced KQL: Detecting "Low and Slow" Data Exfiltration
 

To help you build a robust security monitoring setup, I’ve broken this down into two parts: a specialized query for your toolkit and the blueprint for automating your response.

 

While large spikes are easy to catch, attackers often exfiltrate data in small batches to avoid detection. This query identifies internal VMs sending data to uncommon external destinations.

Code snippet

AzureNetworkAnalytics_CL

| where SubType_s == "FlowLog"

| where FlowDirection_s == "O"

| where FlowType_s == "ExternalPublic"

// Filter out common trusted traffic if necessary

| summarize

    TotalBytesSent = sum(OutboundBytes_d),

    DistinctDestinations = dcount(DestIP_s),

    SampleDestIP = any(DestIP_s)

    by SrcVm_s, bin(TimeGenerated, 1h)

| where TotalBytesSent > 1000000 // Adjust threshold (e.g., 1MB per hour)

| order by TotalBytesSent desc

 

2. Automating Packet Capture via Azure Monitor
You can set up a "Self-Healing" or "Self-Documenting" network that captures evidence the moment an NSG rule is violated.

 

The Architecture

 

Step-by-Step Setup:

Create an Alert Rule:
Go to Monitor > Alerts > Create.
Signal Logic: Use a Custom Log Search (the KQL query above).
Threshold: Whenever the results are greater than 0.
Configure the Action Group:
Create an Action Group and select Logic App as the action type.
This Logic App will use the Azure Network Watcher Connector.
Design the Logic App Flow:
Trigger: When an Azure Monitor Alert is fired.
Action: "Create variable" to parse the TargetResourceId (the VM ID) from the alert.
Action: Network Watcher - Start Packet Capture.
Target VM: The ID parsed from the alert.
Storage Account: Your security-logs-storage.
Duration: 300 seconds (5 minutes).
Action: Office 365 Outlook / Teams – Send a notification to the SOC team saying: "Potential exfiltration detected on VM [Name]. Packet capture started automatically."
 

 

 

Why this is critical for Incident Response

In a traditional setup, by the time a human sees a "Denied" or "Malicious" log, the attacker has often closed the connection. By automating the capture, you grab the actual traffic packets while the event is happening.

This allows you to open the .pcap file in Wireshark later and see the exact commands the attacker was trying to run, which is far more valuable for a forensic post-mortem than a simple IP log.

 

 

 

 