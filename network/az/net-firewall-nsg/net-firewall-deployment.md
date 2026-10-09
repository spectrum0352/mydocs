## Firewall Deployment

## 

## Plan



#### **Deployment Checklist**



|Phase|Task|Sub-Task|Description|Considerations|
|-|-|-|-|-|
|Phase 1: Planning and Design|1.1 Network Assessment|Identify Network Segments|Document network topology, subnets, and traffic flows.|Existing infrastructure, application dependencies.|
|||Analyze Traffic Flows|Determine inbound/outbound traffic patterns and protocols.|Security policies, performance requirements.|
||1.2 Security Requirements|Define Security Policies|Document security rules, compliance, and data sensitivity.|Regulatory requirements, data classification.|
|||Threat Protection Level|Determine required level of threat intelligence and prevention.|Risk assessment, security posture.|
||1.3 Azure Environment Planning|Region Selection|Choose appropriate Azure region(s).|Latency, compliance, and availability.|
|||VNet Architecture|Design virtual network and subnets, including AzureFirewallSubnet.|IP addressing, network segmentation.|
|||Availability Zones|Determine the need for high availability deployment.|Business continuity, fault tolerance.|
|||Firewall SKU Selection|Choose Standard or Premium SKU based on features.|Feature requirements, budget.|
|||Firewall Policies|Determine if policies will be used and if so, design the policy structure.|Centralized management, scalability.|
||1.4 IP Addressing and Routing|IP Address Planning|Allocate IP ranges for subnets.|Avoid overlaps, future expansion.|
|||Route Table Design|Configure route tables for traffic redirection to the firewall.|Default routes, UDRs.|
|||DNS Resolution|Plan DNS resolution for internal and external resources.|Azure DNS, custom DNS servers.|
|||Forced Tunnelling|Determine if forced tunnelling is required.|Security, compliance.|
|Phase 2: Deployment|2.1 Resource Group Creation|Create Resource Group|Create a dedicated resource group for the firewall.|Resource management, access control.|
||2.2 VNet and Subnet Configuration|VNet Creation|Create the virtual network according to the design.|IP address space, region.|
|||AzureFirewallSubnet Configuration|Configure the required AzureFirewallSubnet.|Naming convention, size.|
||2.3 Azure Firewall Deployment|Deploy Firewall Resource|Deploy the Azure Firewall instance.|SKU selection, public IP.|
|||Associate with Subnet|Associate the firewall with the AzureFirewallSubnet.|Correct subnet association.|
|||Public IP Allocation|Allocate a public IP address to the firewall.|Public access, DNAT.|
|||Firewall Policy Assignment|Assign the created firewall policy to the firewall.|Centralized rule management.|
||2.4 Route Table Configuration|Create Route Tables|Create route tables to direct traffic to the firewall.|Default routes, subnet association.|
|||Associate with Subnets|Associate route tables with workload subnets.|Traffic redirection.|
||2.5 DNS Configuration|Configure DNS Settings|Configure DNS settings for the virtual network.|Internal and external resolution.|
|Phase 3: Firewall Rule Configuration|3.1 Network Rule Configuration|Define Network Rules|Configure rules based on IP addresses, ports, and protocols.|Least privilege, service tags.|
||3.2 Application Rule Configuration|Define Application Rules|Configure rules based on FQDNs and protocols.|FQDN tags, application dependencies.|
||3.3 NAT Rule Configuration|Configure DNAT Rules|Configure rules for inbound traffic redirection.|Port forwarding, security.|
|||Configure SNAT Rules|Configure rules for outbound traffic translation.|Source IP translation.|
||3.4 IP Group Configuration|Create IP Groups|Create and configure IP groups for easier rule management.|IP address management, rule simplification.|
||3.5 Threat Intelligence Configuration|Enable Threat Intelligence|Enable and configure threat intelligence feeds.|Malicious traffic blocking.|
|Phase 4: Monitoring and Logging|4.1 Logging Configuration|Enable Firewall Logs|Enable Azure Firewall logs for monitoring.|Log analytics workspace.|
|||Configure Log Analytics|Configure log analytics workspace for log storage.|Retention policies, query capabilities.|
|||Configure Diagnostic Settings|Configure diagnostic settings for log forwarding.|Log types, destinations.|
||4.2 Monitoring Configuration|Configure Azure Monitor Alerts|Configure alerts for firewall events.|Thresholds, notification settings.|
|||Create Dashboards|Create dashboards for firewall monitoring.|Performance metrics, security events.|
|||Integrate with Azure Sentinel|Integrate with Azure Sentinel for security analysis.|SIEM integration, threat detection.|
||4.3 Performance Monitoring|Monitor Performance|Monitor firewall throughput and latency.|Performance baselines, capacity planning.|
|Phase 5: Testing and Validation|5.1 Connectivity Testing|Test Connectivity|Test connectivity to internal and external resources.|Network reachability, firewall rules.|
||5.2 Rule Validation|Validate Firewall Rules|Verify that firewall rules are working as expected.|Allowed/denied traffic, rule precedence.|
||5.3 Security Testing|Perform Vulnerability Scans|Conduct vulnerability scans and penetration testing.|Security posture, risk assessment.|
||5.4 Log Analysis|Review Firewall Logs|Analyze logs for anomalies and security events.|Incident response, threat detection.|
|Phase 6: Ongoing Maintenance|6.1 Rule Maintenance|Update Firewall Rules|Regularly review and update firewall rules.|Rule optimization, security updates.|
||6.2 Software Updates|Keep Firewall Updated|Keep the Azure Firewall software updated.|Security patches, feature updates.|
||6.3 Performance Monitoring|Continuously Monitor|Continuously monitor firewall performance.|Capacity planning, performance tuning.|
||6.4 Security Audits|Conduct Security Audits|Conduct regular security audits of the firewall.|Compliance, security posture.|
||6.5 Log Review|Regularly Review Logs|Regularly review firewall logs for security events.|Threat hunting, incident response.|







## Azure CLI

**Key Improvements and Explanations:**

1. **Variables:** Using variables at the beginning of the script makes it easier to modify and maintain.
2. **Resource Group and VNet Creation:** The script creates the resource groups and virtual networks with their respective subnets.
3. **Public IP and Azure Firewall Creation:** It creates a public IP for the firewall and then deploys the Azure Firewall into the hub VNet's AzureFirewallSubnet.
4. **Subnet and Public IP ID retrieval:** The script now retrieves the Subnet IDs and the Public IP ID using az network vnet subnet show and az network public-ip show and stores them in variables. This is crucial for linking resources.
5. **Firewall Private IP Retrieval:** The script retrieves the private IP address of the firewall, which is needed for the route table.
6. **VM Creation:** The script creates a virtual machine in the spoke VNet using the created network interface.
7. **Route Table and Route Creation:** The script creates a route table and a route to direct traffic from the spoke VNet to the Azure Firewall's private IP.
8. **Subnet Association:** The script associates the route table with the spoke VNet's subnet.
9. **Password Handling:** **Important:** Replace "YourStrongPassword!" with a strong, secure password. For production environments, consider using Azure Key Vault to manage secrets.
10. **Username:** replace "azureuser" with your desired username.

**How to Run the Script:**

6. **Azure CLI:** Ensure you have the Azure CLI installed and configured.
7. **Login:** Log in to your Azure account using az login.
8. **Save:** Save the script to a file (e.g., deploy\_azfw.sh).
9. **Permissions:** Make the script executable: chmod +x deploy\_azfw.sh.
10. **Run:** Execute the script: ./deploy\_azfw.sh.

\#!/bin/bash

\# Define variables

LOCATION="centralindia"

RG\_HUB="rghub"

RG\_SPOKE="rgspoke"

VNET\_HUB\_NAME="VNET-Hub"

VNET\_SPOKE\_NAME="VNET-Spoke"

FW\_SUBNET\_NAME="AzureFirewallSubnet"

VM\_SUBNET\_NAME="Subnet-VM"

FW\_PIP\_NAME="azfw-pip"

FW\_NAME="azfw"

VM\_NIC\_NAME="VM-NIC"

VM\_NAME="VM-Win"

VM\_SIZE="Standard\_DS2\_v2"

VM\_IMAGE="MicrosoftWindowsServer:WindowsServer:2019-Datacenter:latest"

VM\_USERNAME="azureuser" # Replace with your desired username

VM\_PASSWORD="YourStrongPassword!" # Replace with a strong password

\# Create resource groups

az group create --name $RG\_HUB --location $LOCATION

az group create --name $RG\_SPOKE --location $LOCATION

\# Create hub virtual network and subnet

az network vnet create --resource-group $RG\_HUB --name $VNET\_HUB\_NAME --address-prefixes 10.0.0.0/16 --subnet-name $FW\_SUBNET\_NAME --subnet-prefixes 10.0.0.0/24

\# Create spoke virtual network and subnet

az network vnet create --resource-group $RG\_SPOKE --name $VNET\_SPOKE\_NAME --address-prefixes 10.1.0.0/16 --subnet-name $VM\_SUBNET\_NAME --subnet-prefixes 10.1.0.0/24

\# Create public IP for Azure Firewall

az network public-ip create --resource-group $RG\_HUB --name $FW\_PIP\_NAME --location $LOCATION --allocation-method Static --sku Standard

\# Get the subnet ID of the AzureFirewallSubnet

FW\_SUBNET\_ID=$(az network vnet subnet show --resource-group $RG\_HUB --vnet-name $VNET\_HUB\_NAME --name $FW\_SUBNET\_NAME --query id --output tsv)

\# Get the public IP ID of the firewall public ip.

FW\_PIP\_ID=$(az network public-ip show --resource-group $RG\_HUB --name $FW\_PIP\_NAME --query id --output tsv)

\# Create Azure Firewall

az network firewall create --resource-group $RG\_HUB --name $FW\_NAME --location $LOCATION --public-ip-address $FW\_PIP\_ID --vnet-name $VNET\_HUB\_NAME --subnet-name $FW\_SUBNET\_NAME

\# Get the private IP of the Azure firewall.

FW\_PRIVATE\_IP=$(az network firewall ip-config list --resource-group $RG\_HUB --firewall-name $FW\_NAME --query "\[0].privateIpAddress" -o tsv)

\# Create network interface for VM

VM\_SUBNET\_ID=$(az network vnet subnet show --resource-group $RG\_SPOKE --vnet-name $VNET\_SPOKE\_NAME --name $VM\_SUBNET\_NAME --query id --output tsv)

az network nic create --resource-group $RG\_SPOKE --name $VM\_NIC\_NAME --location $LOCATION --subnet $VM\_SUBNET\_ID

\# Create virtual machine

az vm create --resource-group $RG\_SPOKE --name $VM\_NAME --location $LOCATION --nics $VM\_NIC\_NAME --image $VM\_IMAGE --size $VM\_SIZE --admin-username $VM\_USERNAME --admin-password "$VM\_PASSWORD"

\# Create route table for spoke subnet

az network route-table create --resource-group $RG\_SPOKE --name SpokeRouteTable --location $LOCATION

\# Create route to Azure Firewall

az network route-table route create --resource-group $RG\_SPOKE --route-table-name SpokeRouteTable --name DefaultRoute --address-prefix 0.0.0.0/0 --next-hop-type VirtualAppliance --next-hop-ip-address $FW\_PRIVATE\_IP

\# Associate route table with spoke subnet

az network vnet subnet update --resource-group $RG\_SPOKE --vnet-name $VNET\_SPOKE\_NAME --name $VM\_SUBNET\_NAME --route-table SpokeRouteTable

## Firewall Deployment

* **Placement:**

  * Perimeter: At the network edge to protect against external threats.
  * Internal: To segment the internal network.
* **Azure Deployment:** Specific steps for configuring rules in the Azure Portal.
* **Number of Firewalls:** Factors influencing the number of firewalls required:

  * Network size and complexity
  * Data sensitivity
  * Organizational security policies
  * Threat landscape
  * Cost-benefit analysis
* **Deployment Strategies:**

  * Phased deployment
  * Pilot testing





## Example Configuration (Hub-Spoke Model)

This example shows a common network architecture used in large enterprises.

* Scenario: A hub-spoke network with a central firewall in the hub virtual network.
* Components:

  * Hub Virtual Network (VNet-Hub):

    * Address space: 10.0.0.0/16
    * Subnet: AzureFirewallSubnet (10.0.0.0/24)
    * Resource Group: RG-Hub
    * Resource: Az-FW (Azure Firewall)
  * Spoke Virtual Network (VNet-Spoke):

    * Address space: 10.1.0.0/16
    * Subnet: devsubnet (10.1.0.0/24)
    * Resource Group: RG-Spoke
    * Resource: Az-VM (Virtual Machine)
* Firewall Rules (Example):

  * Allow outbound HTTPS (port 443) and HTTP (port 80) traffic from VNet-Spoke to the internet.
  * Allow inbound SSH (port 22) traffic from a specific administrator IP address to Az-VM.
  * Allow traffic between the hub and spoke networks.
  * Block all other inbound traffic from the internet.
  * DNS configuration: Use custom DNS servers located in the hub network, and enable DNS proxy.
  * Implement threat intelligence filtering on the firewall.
  * Configure Network address translation (NAT) rules as required.
* Implementation Notes:

  * Use User Defined Routes (UDRs) to route traffic from spoke VNets to the Azure Firewall in the hub VNet.
  * Implement Network Security Groups (NSGs) at the subnet level for granular traffic filtering.
  * Centralized logging of the firewall logs to a security information and event management (SIEM) system.
  * Implement Azure Firewall Manager for centralized management of multiple firewalls.





## Initial Configuration

1. Planning and Assessment:

   * Asset Identification:

     * Identify critical systems, data, and applications.
     * Categorize assets based on sensitivity and importance.
   * Risk Assessment:

     * Determine potential threats (e.g., malware, unauthorized access, data breaches).
     * Analyze vulnerabilities that could be exploited.
     * Understand the potential impact of security breaches.
9. Security Policy Definition:

   * Establish clear rules for allowed and blocked traffic.
   * Specify protocols and ports (e.g., HTTPS, SSH, RDP, SQL).
   * Define how different traffic types are handled (e.g., inspection, logging, blocking).
   * Align policies with organizational security standards and compliance requirements.
10. Network Segmentation (Firewall Zones):

    * Create logical zones based on security requirements (e.g., internal, external, DMZ).
    * Isolate sensitive resources by placing them in separate zones.
    * Example Zones:

      * Internal Network: For trusted devices and servers.
      * External Network: For internet-facing resources.
      * DMZ (Demilitarized Zone): For public-facing servers that require limited access to internal networks.
11. Firewall Rule Configuration:

    * Implement rules to control traffic flow between zones.
    * Use the principle of least privilege (allow only necessary traffic).
    * Be specific with rules (source/destination IP addresses, ports, protocols).
    * Examples:

      * Allow HTTPS traffic from the internet to a web server in the DMZ.
      * Block RDP access from the internet to internal servers.
      * Allow all traffic between internal subnets.
12. Testing and Validation:

    * Conduct thorough testing before deploying the configuration in production.
    * Perform vulnerability scans and penetration testing.
    * Verify that legitimate traffic is allowed and malicious traffic is blocked.
    * Test failover and high availability scenarios.
13. Basic Details Configuration:

    * Subscription Selection.
    * Resource Group Assignment.
    * Firewall Policy Naming and Regional Location.
    * Parent Policy Implementation.
14. DNS Settings:

    * DNS Server Configuration:

      * Use Azure-provided DNS or configure custom DNS servers.
      * Ensure DNS resolution is reliable and secure.
    * DNS Proxy: Configure if needed for DNS traffic inspection.
    * Azure Firewall DNS settings: configure the firewall to act as a DNS proxy.

## Best Practices

* Default Deny Policy: Start with a policy that blocks all traffic and only allow necessary exceptions.
* Least Privilege: Grant only the minimum necessary permissions.
* Logging and Monitoring: Enable comprehensive logging to track traffic and identify security incidents.
* Regular Updates: Keep the firewall firmware and software up to date.
* Security Professional Consultation: Seek expert assistance if needed.

# 



